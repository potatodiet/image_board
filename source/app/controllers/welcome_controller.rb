class WelcomeController < ApplicationController
  def index
    @images = Image.order('created_at desc')
        .paginate(:page => params[:page])
  end
end
