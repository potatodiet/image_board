require 'rails_helper'

describe(ImagesController) do
  before(:each) do
    @params = {
      :tag_list => ['Test', 'Testing'],
      :asset => Rack::Test::UploadedFile.new('spec/assets/image.gif', 'image/gif')
    }
  end

  describe('GET #index') do
    it('is successful') do
      get(:index)
      expect(response).to(render_template(:index))
    end
  end

  describe('POST #create') do
    it('redirects to the image upon save') do
      image = Image.new(@params)
      post(:create, :image => image)
      expect(response).to(redirect_to(image_path(image)))
    end
  end
end
