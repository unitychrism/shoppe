module Shoppe
  class LocationsController < Shoppe::ApplicationController
    before_filter { @active_nav = :locations }
    before_filter { params[:id] && @location = Shoppe::Location.find(params[:id]) }

    def index
      @locations = Shoppe::Location.ordered.all
    end

    def new
      @location = Shoppe::Location.new
      render action: 'form'
    end

    def create
      @location = Shoppe::Location.new(safe_params)
      if @location.save
        redirect_to :locations, flash: { notice: t('shoppe.locations.creating_location') }
      else
        render action: 'form'
      end
    end

    def edit
      render action: 'form'
    end

    def update
      if @location.update(safe_params)
        redirect_to [:edit, @location], flash: { notice: t('shoppe.locations.updating_location') }
      else
        render action: 'form'
      end
    end

    def destroy
      @location.destroy
      redirect_to :locations, flash: { notice: t('shoppe.locations.destroy_') }
    end

    private

    def safe_params
      params[:location].permit(:name, :address1, :address2, :address3, :address4, :postcode, :country)
    end
  end
end
