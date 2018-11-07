class Admin::StatsController < ApplicationController
  def index
    @post_count = Post.count
    @authors_count = Author.count
    @last_post = Post.last
  end
end

# Note:
# The views folder for a controller module (in this case /admin)
# expects a subfolder structure that matches the names of the
# controllers (in this case /admin/stats).
