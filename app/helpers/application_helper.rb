module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_message_2
    case flash.keys[0]
    when 'notice'
      flash_type = 'notice'
    when 'success'
      flash_type = 'success'
    when 'alert'
      flash_type = 'alert'
    else
      return
    end
    content_tag :p, flash[flash_type], class: "flash #{flash_type}"
  end

  def flash_message
    flash_type = flash.keys[0] || return

    content_tag :p, flash[flash_type], class: "flash #{flash_type}"
  end
end
