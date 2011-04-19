class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.xml
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    if params[:id] == 'approve_comment'
      approve_comment(params[:comment])
    elsif params[:id] == 'unapprove_comment'
      unapprove_comment(params[:comment])
      @comment = Comment.find(params[:comment])
    else
        @comment = Comment.find(params[:id])
        respond_to do |format|
          format.html # show.html.erb
          format.xml  { render :xml => @comment }
        end
    end

  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new
    @text = Text.find(params[:text])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

#  # GET /comments/1/edit
#  def edit
#    @comment = Comment.find(params[:id])
#  end

  # POST /comments
  # POST /comments.xml
  def create
    @text = Text.find(params[:comment][:text])
    @comment = Comment.new    # (params[:comment])
    @comment.name = (params[:comment][:name])
    @comment.email = (params[:comment][:email])
    @comment.site = (params[:comment][:site])
    @comment.comment = (params[:comment][:comment])
    @comment.text_id = (params[:comment][:text]).to_i

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(@comment, :notice => "Comentario aguardando aprovacao! Em breve ele sera exibido na pagina do texto que voce acabou de comentar! Valeu =)") }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end


  def approve_comment(comment)
    @comment = Comment.find(comment)
    @comment.update_attributes(:approved  => true)
    redirect_to :controller => 'texts', :action => "show", :id => @comment.text.id
  end

  def unapprove_comment(comment)
    @comment = Comment.find comment
    @comment.approved = false
    @comment.save
    redirect_to :controller => 'texts', :action => "show", :id => @comment.text.id
  end

  # PUT /comments/1
  # PUT /comments/1.xml
#  def update
#    @comment = Comment.find(params[:id])

#    respond_to do |format|
#      if @comment.update_attributes(params[:comment])
#        format.html { redirect_to(@comment, :notice => 'Comment was successfully updated.') }
#        format.xml  { head :ok }
#      else
#        format.html { render :action => "edit" }
#        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
#      end
#    end
#  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
end

