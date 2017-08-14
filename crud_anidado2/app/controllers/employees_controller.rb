class EmployeesController < ApplicationController

  def create
    @employee = Employee.new(employee_params)
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee.company, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to @employee.company, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :email, :area_id, :company_id)
    end
end
