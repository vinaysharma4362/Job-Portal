# frozen_string_literal: true

# company dashboard controller
class CompaniesDashboardsController < ApplicationController
  before_action :authenticate_company!

  def index; end
end
