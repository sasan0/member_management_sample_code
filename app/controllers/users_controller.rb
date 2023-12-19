class UsersController < ApplicationController
  def register
    user = User.new(user_params)
    if user.save # ←ここで保存
      render json: { user: user },status: 201
    else
      render status: 400
    end
  end

  def index
    users = User.all # ←ここでユーザーテーブルからの全取得
    if users.empty?
      render status: 400
    else
      render json: { users: users },status: 200
    end
  end

  def update
    user = User.find_by(id: params[:id]) # ← ここでプライマリキー（id）を引数のidで検索
    if user.nil?
      # DBにレコードがない場合
      user = User.new(user_params)
      if user.save
        render json: { user: user },status: 201
      else 
        render status: 400
      end
    else
      # DBにレコードがある場合
      if user.update(user_params) # ←ここで更新
        render json: { user: user },status: 200
      else 
        render status: 400
      end
    end
  end

  def delete
    user = User.find_by(id: params[:id])
    if user.nil?
      render status: 400
    else
      # DBにレコードがある場合
      if user.destroy # ←ここで削除
        render status: 204
      else
        render status: 400
      end
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :grade, :student_num, :is_multiple)
  end
end
