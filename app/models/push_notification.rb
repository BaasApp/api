class PushNotification
  def initialize

  end

  def push(push_register_id, tender_id)
    apn = Houston::Client.development
    apn.certificate = File.read("#{Rails.root}/config/push_notifications.pem")

    notification = Houston::Notification.new(device: push_register_id)

    notification.alert = "The Beer Is Near"

    # Notifications can also change the badge count, have a custom sound, have a category identifier, indicate available Newsstand content, or pass along arbitrary data.
    notification.badge = 1
    notification.sound = ""
    notification.category = "INVITE_CATEGORY"
    notification.content_available = true
    notification.custom_data = {tender_id: tender_id}

    # And... sent! That's all it takes.
    apn.push(notification)
  end
end
