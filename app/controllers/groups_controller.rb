class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:show, :edit, :update]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = "グループを作成しました"
      redirect_to groups_path
    else
      flash[:alert] = "グループ作成に失敗しました"
      render new_group_path
    end
  end

  def show
  end

  def edit
  end
  
  def update
    if @group.update(group_params)
      flash[:notice] = "『#{@group.name}』を編集しました"
      redirect_to group_path(@group.id)
    else
      flash[:alert] = "映画の追加に失敗しました"
      render :edit
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    flash[:notice] = "『#{group.name}』を削除しました"
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, past_movie_ids: []).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:id])
  end

end
