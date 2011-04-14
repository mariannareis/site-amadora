require 'spec_helper'

describe TextsController do

  def mock_text(stubs={})
    (@mock_text ||= mock_model(Text).as_null_object).tap do |text|
      text.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all texts as @texts" do
      Text.stub(:all) { [mock_text] }
      get :index
      assigns(:texts).should eq([mock_text])
    end
  end

  describe "GET show" do
    it "assigns the requested text as @text" do
      Text.stub(:find).with("37") { mock_text }
      get :show, :id => "37"
      assigns(:text).should be(mock_text)
    end
  end

  describe "GET new" do
    it "assigns a new text as @text" do
      Text.stub(:new) { mock_text }
      get :new
      assigns(:text).should be(mock_text)
    end

    it "should do notthing, when user is not logged" do
      Text.stub(:new) { mock_text }
      get :new
      assigns(:text).should be(mock_text)
    end


  end

  describe "GET edit" do
    it "assigns the requested text as @text" do
      Text.stub(:find).with("37") { mock_text }
      get :edit, :id => "37"
      assigns(:text).should be(mock_text)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created text as @text" do
        Text.stub(:new).with({'these' => 'params'}) { mock_text(:save => true) }
        post :create, :text => {'these' => 'params'}
        assigns(:text).should be(mock_text)
      end

      it "redirects to the created text" do
        Text.stub(:new) { mock_text(:save => true) }
        post :create, :text => {}
        response.should redirect_to(text_url(mock_text))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved text as @text" do
        Text.stub(:new).with({'these' => 'params'}) { mock_text(:save => false) }
        post :create, :text => {'these' => 'params'}
        assigns(:text).should be(mock_text)
      end

      it "re-renders the 'new' template" do
        Text.stub(:new) { mock_text(:save => false) }
        post :create, :text => {}
        response.should render_template("new")
      end

    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested text" do
        Text.should_receive(:find).with("37") { mock_text }
        mock_text.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :text => {'these' => 'params'}
      end

      it "assigns the requested text as @text" do
        Text.stub(:find) { mock_text(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:text).should be(mock_text)
      end

      it "redirects to the text" do
        Text.stub(:find) { mock_text(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(text_url(mock_text))
      end
    end

    describe "with invalid params" do
      it "assigns the text as @text" do
        Text.stub(:find) { mock_text(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:text).should be(mock_text)
      end

      it "re-renders the 'edit' template" do
        Text.stub(:find) { mock_text(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested text" do
      Text.should_receive(:find).with("37") { mock_text }
      mock_text.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the texts list" do
      Text.stub(:find) { mock_text }
      delete :destroy, :id => "1"
      response.should redirect_to(texts_url)
    end
  end

end

