module Historian
  class CategoriesController < ApplicationController
    
    unloadable

    Historian.before_filters.each do |filter|
      before_filter filter.to_sym
    end
    
    layout Historian.layout if Historian.layout
    
    def index
      @categories = HistorianCategory.all
    end
    
    def show
      @category = HistorianCategory.find(params[:id])
      @records = @category.records.paginate :page => params[:page],
                                            :per_page => Historian.records_per_page,
                                            :order => 'created_at DESC'
      
    end
    
    def new
      @category = HistorianCategory.new
    end
    
    def create
      if params[:historian_category][:metric_config]
        params[:historian_category][:metric_config] = params[:historian_category][:metric_config].split("\n")
      end
      @category = HistorianCategory.new(params[:historian_category])
      if @category.save
        flash[:notice] = "Category created"
        redirect_to :action => 'index'
      else
        render 'new'
      end
    end
    
    def edit
      @category = HistorianCategory.find(params[:id])
    end
    
    def update
      if params[:historian_category][:metric_config]
        params[:historian_category][:metric_config] = params[:historian_category][:metric_config].split("\n")
      end
      @category = HistorianCategory.find(params[:id])
      if @category.update_attributes(params[:historian_category])
        flash[:notice] = "Category updated"
        redirect_to @category
      else
        redirect_to :action => 'edit'
      end
    end
    
    def destroy
      @category = HistorianCategory.find(params[:id])
      if @category.destroy
        flash[:notice] = "Category deleted"
      end
      redirect_to :action => 'index'
    end
  end
end