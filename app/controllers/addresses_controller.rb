class AddressesController < ApplicationController

  def index
    @addresses = []
    @addresses = AddressSearchService.new.search(params[:word]) if params[:word].present?
  end
end
