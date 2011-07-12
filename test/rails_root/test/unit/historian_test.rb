require 'test_helper'
class HistorianTest < ActiveSupport::TestCase
  context "when adding new record" do
    
    context "when category does not exist" do
      context "when auto_create is true" do
        setup do
          Historian.auto_create = true
        end
        should "create new category, inferring metric titles from hash keys" do
          assert_nil HistorianCategory.find_by_name(:new)
          assert_nil Historian.history_for(:new)
        
          assert Historian.record(:new, :data => {:field1 => "value1",
                                                  :field2 => "value2",
                                                  :field_three => "value3"})
                                       
          assert HistorianCategory.find_by_name(:new)
          assert Historian.history_for(:new)
        
          assert_equal 3, Historian.history_for(:new).first.metrics.count
          assert HistorianCategory.find_by_name(:new).metric_titles.include?("Field1")
          assert HistorianCategory.find_by_name(:new).metric_titles.include?("Field2")
          assert HistorianCategory.find_by_name(:new).metric_titles.include?("Field three")

          assert_equal "value1", YAML.load(Historian.history_for(:new).first.metrics.find_by_name(:field1).value)
          assert_equal "value2", YAML.load(Historian.history_for(:new).first.metrics.find_by_name(:field2).value)
          assert_equal "value3", YAML.load(Historian.history_for(:new).first.metrics.find_by_name(:field_three).value)
        end
      end
      
      context "when auto_create is false" do
        setup do
          Historian.auto_create = false
        end
        should "raise CategoryNotFound error when adding record to undefined category" do
          assert_raise(Historian::CategoryNotFound){ Historian.record(:non_existant_category, :data => {:keys => "values"}) }
        end
      end
    end
    
    context "when category exists" do
      setup do
        assert Historian.record(:some_category, :data => {:field1 => "value1",
                                                          :field2 => "value2",
                                                          :field3 => "value3"})
      end
      should "add new record to category with hash values" do
        assert_equal 1, Historian.history_for(:some_category).count
        assert Historian.record(:some_category, :data => {:field1 => "value1",
                                                          :field2 => "value2",
                                                          :field3 => "value3"})
       assert_equal 2, Historian.history_for(:some_category).count
       assert_equal "value1", YAML.load(Historian.history_for(:some_category).last.metrics.find_by_name(:field1).value)
       assert_equal "value2", YAML.load(Historian.history_for(:some_category).last.metrics.find_by_name(:field2).value)
       assert_equal "value3", YAML.load(Historian.history_for(:some_category).last.metrics.find_by_name(:field3).value)
      end
    end
    
  end
end