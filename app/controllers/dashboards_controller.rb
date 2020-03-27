# frozen_string_literal: true

# dashboard controller
class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index; end
end
