# frozen_string_literal: true

# dashboard controller
class DashboardsController < ApplicationController

  def index
    @job_post = JobPost.all
  end
end
