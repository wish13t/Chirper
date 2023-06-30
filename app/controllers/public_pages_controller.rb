class PublicPagesController < ApplicationController
  def home
    if current_user.present?
      @blog = current_user.blogs.build if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
