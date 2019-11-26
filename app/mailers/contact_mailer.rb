class ContactMailer < ApplicationMailer
    def contact_mail(feed)
      @feed = feed
  
      mail to: "example@mail.com", subject: "お問い合わせの確認メール"
    end
  end