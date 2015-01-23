class NumberFactsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def search
    # number against which we need to fetch results
    @number  = params[:number].to_i
    begin
      facts = NumberAPI.get_number_facts(@number)
      current_page = (params[:page] || 1).to_i
      @facts = facts.paginate(:page => current_page, :per_page => 5)
    rescue
      @facts = [].paginate(:page => 1, :per_page => 5)
    end
    respond_to do |format|
      format.js
    end
  end

end
