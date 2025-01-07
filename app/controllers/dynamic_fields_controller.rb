class DynamicFieldsController < ApplicationController
  before_action :set_dynamic_field, only: [:show, :update, :destroy]

  # GET /dynamic_fields
  def index
    @dynamic_fields = DynamicField.all

    render json: @dynamic_fields
  end

  # GET /dynamic_fields/1
  def show
    render json: @dynamic_field
  end

  # POST /dynamic_fields
  def create
    @dynamic_field = DynamicField.new(dynamic_field_params)

    if @dynamic_field.save
      render json: @dynamic_field, status: :created, location: @dynamic_field
    else
      render json: @dynamic_field.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dynamic_fields/1
  def update
    if @dynamic_field.update(dynamic_field_params)
      render json: @dynamic_field
    else
      render json: @dynamic_field.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dynamic_fields/1
  def destroy
    @dynamic_field.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dynamic_field
      @dynamic_field = DynamicField.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dynamic_field_params
      params.fetch(:dynamic_field, {})
    end
end
