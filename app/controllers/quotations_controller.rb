class quotationssController < ApplicationController

  def index
      @quotationss = quotations.all.order('created_at DESC').paginate(page: params[:page], per_page:10)
      @driver = Driver.find(params[:driver_id])
  end
   
  def new
    @quotations = quotations.new
    @driver = Driver.find(params[:driver_id])
  end

  def create
    @driver = Driver.find(params[:driver_id])
    @quotations = @driver.quotationss.build(quotations_params)

      if @quotations 

        if @quotations.save!
        redirect_to driver_path(@driver.id), notice: "#{@driver.first_name}'s new quotations has been uploaded."
        else
        redirect_to driver_path(@driver.id)
        end
      else 
        redirect_to driver_path(@driver.id)
      end
    
  end

  def destroy
    @driver = Driver.find(params[:id])  
    @quotations = quotations.find(params[:driver_id])

      @quotations.remove_attachment
      redirect_to driver_path(@driver.id), notice:  "#{@quotations.attachment.file.filename} has been deleted."  
      @quotations.destroy
  end

  private

  def quotations_params
    params.require(:quotations).permit(:attachment)
  end
end
