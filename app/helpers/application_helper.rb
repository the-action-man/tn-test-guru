module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_message
    if flash[:notice]
      key = :notice
      class_name = 'notice'
    elsif flash[:success]
      key = :success
      class_name = 'success'
    elsif flash[:alert]
      key = :alert
      class_name = 'alert'
    else
      return
    end
    content_tag :p, flash[key], class: "flash #{class_name}"
  end
end
