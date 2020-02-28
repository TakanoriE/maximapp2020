class DepartmentsController < ApplicationController
  before_action :authenticate_user!,{only: [:index, :new, :create, :edit, :update, :destroy]}
  before_action :ensure_master_user,{only: [:index, :new, :create, :edit, :update, :destroy]}

  def index
    @departments=Department.all
  end

  def show
    @department=Department.find_by(id: params[:id])
    @departments=Department.all
    @posts=Post.where(category: params[:id]).order(created_at: :desc)
  end

  def new
    @department=Department.new
  end

  def create
    @department=Department.new(category: params[:category])
    if @department.save
      flash[:notice]="カテゴリーを作成しました"
      redirect_to("/")
    else
      render("departments/new")
    end
  end

  def edit
    @department=Department.find_by(id: params[:id])
  end

  def update
    @department=Department.find_by(id: params[:id])
    @department.category=params[:category]
    if @department.save
      flash[:notice]="カテゴリーを編集しました"
      redirect_to("/")
    else
      render("departments/edit")
    end
  end

  def destroy
    @department=Department.find_by(id: params[:id])
    @department.destroy
    flash[:notice]="カテゴリーを削除しました"
    redirect_to("/")
  end

end
