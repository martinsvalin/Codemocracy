require 'spec_helper'

describe UsersController do

  describe "POST 'create'" do
    it "should be successful" do
      post 'create'
      response.should be_success
    end
  end

end
