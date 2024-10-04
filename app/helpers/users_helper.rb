module UsersHelper
  def gravatar_for user, options = {size: Settings.ui.default_avatar_size}
    size = options[:size]
    gravatar_id = Digest::MD5.hexdigest user.email.downcase
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag gravatar_url, alt: user.user_name, class: options[:class]
  end

  def user_avatar user, options = {class: ""}
    if user.avatar.attached?
      image_tag(user.avatar.variant(:display), class: options[:class])
    else
      gravatar_for(user, options)
    end
  end
end
