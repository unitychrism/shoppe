module Shoppe
  class VendorsController < Shoppe::ApplicationController
    before_filter { @active_nav = :vendors }
    before_filter { params[:id] && @vendor = Shoppe::Vendor.find(params[:id]) }

    def index
      @query = Shoppe::Vendor.ordered.page(params[:page]).search(params[:q])
      @vendors = @query.result
    end

    def new
      @vendor = Shoppe::Vendor.new
    end

    def show
      @products = @vendor.products.ordered.load
    end

    def create
      @vendor = Shoppe::Vendor.new(safe_params)
      if @vendor.save
        redirect_to @vendor, flash: { notice: t('shoppe.vendors.created_successfully') }
      else
        render action: 'new'
      end
    end

    def update
      if @vendor.update(safe_params)
        redirect_to @vendor, flash: { notice: t('shoppe.vendors.updated_successfully') }
      else
        render action: 'edit'
      end
    end

    def destroy
      @vendor.destroy
      redirect_to vendors_path, flash: { notice: t('shoppe.vendors.deleted_successfully') }
    end

    def search
      index
      render action: 'index'
    end

    private

    def safe_params
      params[:vendor].permit(:first_name, :last_name, :company, :email, :phone, :mobile)
    end
  end
end
