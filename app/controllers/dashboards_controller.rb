# frozen_string_literal: true

# dashboard controller
class DashboardsController < ApplicationController
<<<<<<< Updated upstream
=======
  def index
    @count = JobPost.all.count
    @job_posts = JobPost.order('created_at desc').limit(10)
  end
>>>>>>> Stashed changes

  def index
    @job_post = JobPost.all
  end
end
