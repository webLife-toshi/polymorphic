class CommentsController < ApplicationController
 # before_filter :find_commentable

  def index
    @commentable = find_commentable
    @comments = @commentable.comments
   # @comments = find_commentable.comments
  end

  def create
    @commentable = find_commentable
    @comments = @commentable.comments.build(params[:comment])
    #@comments = find_commentable.comments.build(params[:comment])
    if @comments.save
      flash[:notice] = "Successfully saved comment."
      redirect_back_or :id => nil
    else
      render :action => 'new'
    end
  end

#private
  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
         return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
