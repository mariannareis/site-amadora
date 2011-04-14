class TextsController < ApplicationController

  before_filter :authenticated_users_only, :only => [:new, :edit, :update, :create, :destroy]

  def authenticated_users_only
    unless refinery_user?
      @texts = Text.all
      render :action => "texts/index"
    end
  end

  def index
    @texts = Text.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @texts }
    end
  end

  def show
    @text = Text.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @text }
    end
  end

  def new
    @text = Text.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @text }
    end
  end

  def edit
    @text = Text.find(params[:id])
  end

  def create
    @text = Text.new(params[:text])

    respond_to do |format|
      if @text.save
        format.html { redirect_to(@text, :notice => 'Text was successfully created.') }
        format.xml  { render :xml => @text, :status => :created, :location => @text }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @text.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @text = Text.find(params[:id])

    respond_to do |format|
      if @text.update_attributes(params[:text])
        format.html { redirect_to(@text, :notice => 'Text was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @text.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @text = Text.find(params[:id])
    @text.destroy

    respond_to do |format|
      format.html { redirect_to(texts_url) }
      format.xml  { head :ok }
    end
  end
end

