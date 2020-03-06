class CommentsController < ApplicationController

def index 
	@comments = Comment.all
end

def create
  @commentable = Article.find(params[:article_id])
  @comment = @commentable.comments.new(comment_params)
  if @comment.save
    $pubnub.publish(
      channel: "comments-" + "#{@commentable.id}",
      message: { comment: comment_params["content"] }
    )
    respond_to do |format|
     format.js { render :nothing => true }
     format.html
   end
  else
    render :new
  end
end