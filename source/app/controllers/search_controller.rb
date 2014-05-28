class SearchController < ApplicationController
  load_and_authorize_resource
  
  def show
    @images = Image.tagged_with(params[:q].split(','))
        .order('created_at desc').paginate(:page => params[:page])
  end
end
