class InvoicesController < ApplicationController
  def index
      @invoices = invoice.all
   end
   
   def new
      @invoice = Invoice.new
   end
   
   def create
      @invoice = Invoice.new(invoice_params)
      
      if @invoice.save
         redirect_to invoices_path, notice: "The invoice for #{@invoice.first_name} has been uploaded."
      else
         render "new"
      end
      
   end
   
   def destroy
      @invoice = Invoice.find(params[:id])
      @invoice.destroy
      redirect_to invoices_path, notice:  "The invoice #{@invoice.first_name} has been deleted."
   end
   
   private
      def invoice_params
      params.require(:invoice).permit(:name, :attachment)
   end
end
