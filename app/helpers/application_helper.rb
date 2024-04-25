module ApplicationHelper
  def default_meta_tags
    {
      site: "",
      title:"<%= yield(:title) | 家賃のクレジットカード払いなら『Payrent』' %>",
      description: "家賃支払いでポイントが貯まる！賃料のクレジットカード払いなら『Payrent』",
      charset: "UTF-8",
      reverse: true,
      separator: '|',
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('favicon.ico'),  rel: 'apple-touch-icon' },
      ]
    }
  end

end
