class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_master_user,{only: [:new, :create, :edit, :update, :destroy, :like_show]}
  before_action :like_operation,{only: [:show]}
  before_action :like_operation_show,{only: [:like_show]}
  before_action :like_operation_user_show,{only: [:like_user_show]}

  def show
    @post=Post.find_by(id: params[:id])
    @likes_count=Like.where(post_id: @post.id).count
  end

  def new
    @post=Post.new
  end

  def create
    @post=Post.new(
      content: params[:content],
      content_eng: params[:content_eng],
      author: params[:author],
      biography: params[:biography]
    )
    last=Department.last(1)[0][:id]
    for num in 1..last do
      if params[:status]==num.to_s
        @post.category=num
      end
    end
    if @post.category==nil
      @post.category=1
    end
    if @post.save
      flash[:notice]="名言を作成しました"
      redirect_to("/")
    else
      render("posts/new")
    end
  end

  def edit
    @post=Post.find_by(id: params[:id])
  end

  def update
    @post=Post.find_by(id: params[:id])
    @post.content=params[:content]
    @post.content_eng=params[:content_eng]
    @post.author=params[:author]
    @post.biography=params[:biography]
    last=Department.last(1)[0][:id]
    for num in 1..last do
      if params[:status]==num.to_s
        @post.category=num
      end
    end
    if @post.save
      flash[:notice]="名言を編集しました"
      redirect_to("/")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post=Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice]="名言を削除しました"
    redirect_to("/")
  end

  def like_show
  end

  def like_user_show
  end
end
