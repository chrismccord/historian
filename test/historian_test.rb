$:.unshift File.dirname(__FILE__) # allows command line to execute tests
require 'helper'

class HistorianTest < Test::Unit::TestCase
  context "when adding new record" do
    
    context "when category does not exist" do
      should "create new category, inferring metric titles from hash keys" do
        assert Historian.categories.find_by_name(:new).empty?
        assert_nil Historian.history_for(:new)
        
        assert Historian.record(:new, {:field1 => "value1",
                                       :field2 => "value2",
                                       :field_three => "value3"})
                                       
        assert Historian.categories.find_by_name(:new)
        assert Historian.history_for(:new)
        
        assert_equal 3, Historian.history_for(:new).first.metrics.count
        assert Historian.categories.find_by_name(:new).metric_titles.include?("Field1")
        assert Historian.categories.find_by_name(:new).metric_titles.include?("Field2")
        assert Historian.categories.find_by_name(:new).metric_titles.include?("Field three")

        assert_equal "value1", Historian.history_for(:new).first.metrics.find_by_name(:field1).value
        assert_equal "value2", Historian.history_for(:new).first.metrics.find_by_name(:field1).value
        assert_equal "value3", Historian.history_for(:new).first.metrics.find_by_name(:field1).value                
      end
    end
    
    context "when category exists" do
      setup do
        assert Historian.record(:some_category, {:field1 => "value1",
                                                 :field2 => "value2",
                                                 :field_three => "value3"})
      end
      should "add new record to category with hash values" do
        assert_equal 1, Historian.history_for(:some_category).count
        assert Historian.record(:some_category, {:field1 => "value1",
                                                 :field2 => "value2",
                                                 :field_three => "value3"})
       assert_equal 2, Historian.history_for(:some_category).count
       assert_equal "value1", Historian.history_for(:some_category).last.metrics.find_by_name(:field1).value
       assert_equal "value2", Historian.history_for(:some_category).last.metrics.find_by_name(:field1).value
       assert_equal "value3", Historian.history_for(:some_category).last.metrics.find_by_name(:field1).value                                                 
      end
    end
    
  end
end