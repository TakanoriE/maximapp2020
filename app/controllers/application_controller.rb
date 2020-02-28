class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    end

    def ensure_master_user
        if current_user.id!=1
          flash[:notice]="権限がありません"
          redirect_to("/")
        end
    end

    def like_operation
        if current_user.id!=1
            @post=Post.find_by(id: params[:id])
            @department=Department.find_by(id: @post.category)
            @like=Like.find_by(
                user_id: current_user.id,
                post_id: params[:id]
            )
            if @like==nil
                @like=Like.new(
                    user_id: current_user.id,
                    post_id: params[:id]
                )
                @like.save
                redirect_to("/departments/#{@department.id}")
            else
                @like.destroy
                redirect_to("/departments/#{@department.id}")
            end
        end
    end

    def like_operation_show
        if current_user.id==1
            @post=Post.find_by(id: params[:id])
            @department=Department.find_by(id: @post.category)
            @like=Like.find_by(
                user_id: current_user.id,
                post_id: params[:id]
            )
            if @like==nil
                @like=Like.new(
                    user_id: current_user.id,
                    post_id: params[:id]
                )
                @like.save
                redirect_to("/posts/#{@post.id}")
            else
                @like.destroy
                redirect_to("/posts/#{@post.id}")
            end
        end
    end

    def like_operation_user_show
        if current_user.id!=1
            @post=Post.find_by(id: params[:id])
            @department=Department.find_by(id: @post.category)
            @like=Like.find_by(
                user_id: current_user.id,
                post_id: params[:id]
            )
            if @like==nil
                @like=Like.new(
                    user_id: current_user.id,
                    post_id: params[:id]
                )
                @like.save
                redirect_to("/users/show")
            else
                @like.destroy
                redirect_to("/users/show")
            end
        else
            redirect_to("/")
        end
    end
end
