module Historian
  class RecordsController < ApplicationController
    
    unloadable

    def destroy
      @record = HistorianRecord.find(params[:id])
      @record.destroy
      redirect_to historian_category_path(params[:historian_category_id])
    end
  end
end