class QuotationsController < ApplicationController

  def index
      @quotationss = quotations.all.order('created_at DESC').paginate(page: params[:page], per_page:10)
      @driver = Driver.find(params[:driver_id])
  end
   
  def new
    @quotations = Quotations.new
    @driver = Driver.find(params[:driver_id])
  end

  def create
    @driver = Driver.find(params[:driver_id])
    @quotations = @driver.quotations.build(quotations_params)

      if @quotations 

        if @quotations.save!
        redirect_to driver_path(@driver.id), notice: "#{@driver.first_name}'s new quotation has been uploaded."

        fcm = FCM.new("AIzaSyDYgJqxuPWXdMXaafO2TR7qTwYWNLGlick")
      
        registration_ids= ["#{@driver.fcm_token}"] # an array of one or more client registration tokens

        options = {
          priority: "high",
          collapse_key: "updated_score", 
          notification: {
            title: "M.A.D New Quotation", 
            body: "Please Approve/Disapprove quotation",
            icon: "ic_notif",
            sound: "default",
          }
        }

      response = fcm.send(registration_ids, options)
        else
        redirect_to driver_path(@driver.id)
        end
      else 
        redirect_to driver_path(@driver.id)
      end
    
  end

  def destroy
    @driver = Driver.find(params[:id])  
    @quotations = @driver.quotations.find(params[:driver_id])

      @quotations.remove_attachment
      redirect_to driver_path(@driver.id), notice:  "#{@quotations.attachment.file.filename} has been deleted."  
      @quotations.destroy
  end

  private

  def quotations_params
    params.require(:quotation).permit(:attachment)
  end
end
