class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @activities = current_user.activities
      #@category= (@activity.category_id
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
