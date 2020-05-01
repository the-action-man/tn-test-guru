module FlashHelper
  def flash_class(flash_type)
    alert_class = if flash_type == "alert"
                    "alert-danger"
                  else
                    "alert-info"
                  end
    "alert #{alert_class}"
  end
end
