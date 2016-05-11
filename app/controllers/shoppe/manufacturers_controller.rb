module Shoppe
  class ManufacturersController < Shoppe::ApplicationController
    before_filter { @active_nav = :manufacturers }
    before_filter { params[:id] && @manufacturer = Shoppe::Manufacturer.find(params[:id]) }

    def index
      @query = Shoppe::Manufacturer.ordered.page(params[:page]).search(params[:q])
      @manufacturers = @query.result
    end

    def new
      @manufacturer = Shoppe::Manufacturer.new
    end

    def show
      @products = @manufacturer.products.ordered.load
    end

    def create
      @manufacturer = Shoppe::Manufacturer.new(safe_params)
      if @manufacturer.save
        redirect_to @manufacturer, flash: { notice: t('shoppe.manufacturers.created_successfully') }
      else
        render action: 'new'
      end
    end

    def update
      if @manufacturer.update(safe_params)
        redirect_to @manufacturer, flash: { notice: t('shoppe.manufacturers.updated_successfully') }
      else
        render action: 'edit'
      end
    end

    def destroy
      @manufacturer.destroy
      redirect_to manufacturers_path, flash: { notice: t('shoppe.manufacturers.deleted_successfully') }
    end

    def search
      index
      render action: 'index'
    end

    private

    def safe_params
      params[:manufacturer].permit(:name)
    end
  end
end
