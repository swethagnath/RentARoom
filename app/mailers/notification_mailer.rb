class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.order_confirmation.subject
  #
  def order_confirmation(room)
    @room = room
    mail to: "#{@room.user.email}"
  end

  # Subject can be set in  your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.welcome_email.subject
  #
  def welcome_email
    @greeting = "Hi"

    mail to: "to@example.org"
  end
  def bookinged_by_user(book)
    @book = book
     mail to: "#{@book.user.email}"
  end
  def confirmation_of_user_booking_by_host(book)
     @book = book
     mail to: "#{@book.room.user.email}"
  end
  def confirmed_by_host(book)
     @book = book
     mail to: "#{@book.user.email}"
  end
end
