class OrderAttachmentsController < ApplicationController
  before_action :set_order_attachment, only: [:show, :edit, :update, :destroy]

  # GET /order_attachments
  # GET /order_attachments.json
  def index
    @order_attachments = OrderAttachment.all
  end

  # GET /order_attachments/1
  # GET /order_attachments/1.json
  def show
  end

  # GET /order_attachments/new
  def new
    @order_attachment = OrderAttachment.new
  end

  # GET /order_attachments/1/edit
  def edit
  end

  # POST /order_attachments
  # POST /order_attachments.json
  def create
    @order_attachment = OrderAttachment.new(order_attachment_params)

    respond_to do |format|
      if @order_attachment.save
        format.html { redirect_to @order_attachment, notice: 'Order attachment was successfully created.' }
        format.json { render :show, status: :created, location: @order_attachment }
      else
        format.html { render :new }
        format.json { render json: @order_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_attachments/1
  # PATCH/PUT /order_attachments/1.json
  def update
    respond_to do |format|
      if @order_attachment.update(order_attachment_params)
        format.html { redirect_to @order_attachment, notice: 'Order attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_attachment }
      else
        format.html { render :edit }
        format.json { render json: @order_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_attachments/1
  # DELETE /order_attachments/1.json
  def destroy
    @order_attachment.destroy
    respond_to do |format|
      format.html { redirect_to order_attachments_url, notice: 'Order attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_attachment
      @order_attachment = OrderAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_attachment_params
      params.require(:order_attachment).permit(:order_id, :avatar)
    end
end
