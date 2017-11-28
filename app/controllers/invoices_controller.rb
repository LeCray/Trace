class InvoicesController < ApplicationController

	def index
      @invoices = Invoice.all.order('created_at DESC').paginate(page: params[:page], per_page:6)
      @driver = Driver.find(params[:driver_id])
	end
   
	def new
	  @invoice = Invoice.new
	  @driver = Driver.find(params[:driver_id])
	end

	def create
	  @invoice = Invoice.new(invoice_params)
	  @driver = Driver.find(params[:driver_id])
	  @invoice.first_name = @driver.first_name
	  @invoice.last_name = @driver.last_name
	  @invoice.driver_id = @driver.id

	  if @invoice.save!
	     redirect_to driver_path(@driver.id), notice: "#{@invoice.first_name}'s new invoice has been uploaded."
	  else
	     redirect_to driver_path(@driver.id)
	  end
	  
	end

	def destroy
	  @invoice = Invoice.find(params[:id])
	  @invoice.destroy
	  redirect_to invoices_path, notice:  "The invoice #{@invoice.first_name} has been deleted."
	end

	private

	def invoice_params
	  params.require(:invoice).permit(:attachment)
	end
end
