class EstimateMailer < ActionMailer::Base
  default from: "zihanki@factoru.jp"
  def received_email(estimate)
    @estimate = estimate
    mail to: "zihanki@factoru.jp"
    mail(subject: '自販機ねっとにお見積もり依頼がありました') do |format|
      format.text
    end
  end

  def send_email(estimate)
    @estimate = estimate
    mail to: estimate.email
    mail(subject: '自販機ねっとにお問い合わせ頂きありがとうございます') do |format|
      format.text
    end
  end

  def client_email(estimate,customer_id)
    @estimate = estimate
    mail bcc: Company.all.map{|company| company.mail}
    mail(subject: '自販機お見積もり依頼') do |format|
      format.text
    end
  end

  def client_email_select(estimate,select_companies)
    @estimate = estimate
    mail bcc: select_companies.map{|company| company.mail}
    mail(subject: '自販機お見積もり依頼') do |format|
      format.text
    end
  end
end
