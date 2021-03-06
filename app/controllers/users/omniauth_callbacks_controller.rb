module Users
  # Omniauth Callback for some provider
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # callback for google
    def google_oauth2
      callback_for(:google)
    end

    # common callback method
    # rubocop:disable Metrics/AbcSize
    def callback_for(provider)
      @user = User.from_omniauth(request.env["omniauth.auth"])
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
        set_flash_message(:notice, :success, kind: provider.to_s.capitalize) if is_navigational_format?
      else
        session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
        redirect_to new_user_registration_url
      end
    end
    # rubocop:enable Metrics/AbcSize

    def failure
      redirect_to root_path
    end
  end
end
