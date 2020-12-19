module FlashHelper
  def flash_class(flash_type)
    alert_class = { alert: "alert-danger", notice: "alert-info" }[flash_type.to_sym]
    "text-center w-75 p-3 alert #{alert_class} alert-dismissible fade show"
  end
end
