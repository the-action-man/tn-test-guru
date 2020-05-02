module FlashHelper
  def flash_class(flash_type)
    alert_class = { alert: "alert-danger", notice: "alert-info" }[flash_type.to_sym]
    "alert #{alert_class}"
  end
end
