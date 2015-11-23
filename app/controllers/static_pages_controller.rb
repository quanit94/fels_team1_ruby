class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @activities = current_user.activities
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
