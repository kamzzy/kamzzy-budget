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
    @user = User.find(params[:user_id])
    @group = Group.find(params[:group_id])
    @expenditure = @group.expenditures.new
  end

  def create
    @user = User.find(params[:user_id])
    @group = Group.find(params[:group_id])
    @expenditure = @group.expenditures.new(expenditure_params)
    @expenditure.user_id = @user.id


    respond_to do |format|
      if @expenditure.save
        format.html { redirect_to user_group_expenditures_path(@user, @group), notice: "Expenditure was successfully created." }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expenditure.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /expenditures/1 or /expenditures/1.json
  def destroy
    @expenditure.destroy

    respond_to do |format|
      format.html { redirect_to expenditures_url, notice: "Expenditure was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
      # Only allow a list of trusted parameters through.
    def expenditure_params
      params.require(:expenditure).permit!
    end
end
