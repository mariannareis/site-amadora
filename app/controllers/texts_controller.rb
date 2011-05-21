class TextsController < ApplicationController

  before_filter :authenticated_users_only, :only => [:new, :edit, :update, :create, :destroy]

    def rss
      @pages = Page.find(:all, :order => "id DESC", :limit => 10)
      render :layout => false
      response.headers["Content-Type"] = "application/xml; charset=utf-8"
    end

    respond_to do |format|
      format.html
      format.rss { render :layout => false } #index.rss.builder
    end



  def authenticated_users_only
    if not user_signed_in?
      puts user_signed_in?.to_s
      @texts = Text.all
      redirect_to :action => 'index'
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

