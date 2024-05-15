class EstimateMailer < ActionMailer::Base
  include Rails.application.routes.url_helpers
  default from: "payrent@factoru.jp"
  def received_email(estimate)
    @estimate = estimate
    mail to: "payrent@factoru.jp"
    mail(subject: 'Payrentに問い合わせがありました') do |format|
      format.text
    end
  end

  def send_email(estimate)
    @estimate = estimate
    mail to: estimate.email
    mail(subject: 'Payrentにお問い合わせ頂きありがとうございます。') do |format|
      format.text
    end
  end
end
