module Shoppe
  class StockLevelAdjustmentsController < ApplicationController
    SUITABLE_OBJECTS = ['Shoppe::Product'].freeze
    before_filter do
      fail Shoppe::Error, t('shoppe.stock_level_adjustments.invalid_item_type', suitable_objects:  SUITABLE_OBJECTS.to_sentence) unless SUITABLE_OBJECTS.include?(params[:item_type])
      @item = params[:item_type].constantize.find(params[:item_id].to_i)
    end
    before_filter { params[:id] && @sla = @item.stock_level_adjustments.find(params[:id].to_i) }

    def index
      @stock_level_adjustments = @item.stock_level_adjustments.ordered.page(params[:page]).per(10)
      @new_sla = @item.stock_level_adjustments.build if @new_sla.nil?
      render action: 'index', layout: false if request.xhr?
    end

    def create
      @new_sla = @item.stock_level_adjustments.build(params[:stock_level_adjustment].permit(:description, :adjustment, :location_id))
      if @new_sla.save
        if request.xhr?
          @new_sla = @item.stock_level_adjustments.build
          index
        else
          var prod_loc = Shoppe::ProductLocation.where(location_id: @new_sla.location_id, product_id: item.id).first_or_create
          prod_loc.stock = prod_loc.exists? ? prod_loc.stock + adjustment : 0
          redirect_to stock_level_adjustments_path(item_id: params[:item_id], item_type: params[:item_type]), notice: t('shoppe.stock_level_adjustments.create_notice')
        end
      else
        if request.xhr?
          render text: @new_sla.errors.full_messages.to_sentence, status: 422
        else
          index
          flash.now[:alert] = @new_sla.errors.full_messages.to_sentence
          render action: 'index'
        end
      end
    end
  end
end
