class CommentsController < ApplicationController

  def new
    @post = Post.find params[:post_id]
    @comment = Comment.new
  end

  def create
    post = Post.find params[:post_id]
    @comment = post.comments.build params[:comment]
    if @comment.save
      redirect_to post_path
    else
      render :new
    end
  end

  def edit
    @posts = Post.all.map {|post| [post.name, post.id]}
    @comment = Comment.find[:id]
  end

  def update
    @commennt = Comment.find params[:id]
    if @comment.update_attributes params[:comment]
      redirect_to post_path
    else
      render :new
    end
  end

  def destroy
    comment = Comment.find params[:id]
    comment.destroy
    redirect_to post_path
  end

end
