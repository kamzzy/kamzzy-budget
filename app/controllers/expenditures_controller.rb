class ExpendituresController < ApplicationController
  before_action :authenticate_user!

 
  # GET /expenditures or /expenditures.json
  def index
    @user = current_user
    @group = Group.find(params[:group_id])
    @expenditures = Expenditure.where(user_id: @user.id, group_id: @group.id)
    @total = @expenditures.sum(:amount)
  end

  def new
    @user = current_user
    @expenditure = Expenditure.new
    @group = Group.all.where(user_id: @user.id).map { |g| [g.name, g.id] }
  end

  def create
    # @user = current_user
    # @group = Group.find(params[user_id: @user.id])
    @expenditure = Expenditure.new(expenditure_params)
    @expenditure.user_id = current_user.id

    respond_to do |format|
      if @expenditure.save
        format.html do
          redirect_to user_group_url(current_user.id, @expenditure.group_id),
                      notice: 'Expenditure was successfully created.'
        end
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenditures/1 or /expenditures/1.json
  def destroy
    @expenditure = Expenditure.find(params[:id])
    @expenditure.destroy

    respond_to do |format|
      format.html { redirect_to user_groups_path, notice: 'Expenditure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def edit
    @user = User.find(params[:user_id])
    @expenditure = Expenditure.find(params[:id])
    @group = Group.all.where(user_id: @user.id).map { |g| [g.name, g.id] }
  end

  def update
    @user = User.find(params[:user_id])
    @expenditure = Expenditure.find(params[:id])
    respond_to do |format|
      if @expenditure.update(expenditure_params)
        format.html { redirect_to user_groups_path(@user), notice: 'expenditure was successfully updated.' }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def expenditure_params
    params.require(:expenditure).permit!
  end
end
