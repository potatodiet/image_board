require 'rails_helper'

describe(CommentsController) do
  before(:each) do
    @comment = Comment.new(:body => 'Body', :image_owner_id => 1)
  end

  describe('POST #create') do
    it('takes two parameters and returns a Comment object') do
      expect(@comment).to(be_an_instance_of(Comment))
    end
  end
end
