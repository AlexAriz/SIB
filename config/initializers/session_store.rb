# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, {
    key: '_SIB_session',
    expire_after: 600 # the session will be expired in 600 seconds(10 minutes)
    #  unless active
}
