class Estimate < ApplicationRecord
  #belongs_to :client
  has_one :comment, dependent: :destroy
  has_one :transfer, dependent: :destroy
  has_many :progresses, dependent: :destroy
  has_many :payments, dependent: :destroy
  validates :co, presence: { message: '会社名が入力されていません。' }, on: :create
  validates :name, presence: { message: '名前が入力されていません。' }, on: :create
  validates :tel, presence: { message: '電話番号が入力されていません。' }, on: :create
  validates :email, presence: { message: 'メールアドレスが入力されていません。' }, on: :create
  validates :address, presence: { message: '住所が入力されていません。' }, on: :create

  def self.import(file)
    save_cont = 0
    CSV.foreach(file.path, headers:true) do |row|
     estimate = find_by(id: row["id"]) || new
     estimate.attributes = row.to_hash.slice(*csv_attributes)
     estimate.save!
     save_cont += 1
    end
    save_cont
  end

  def self.generate_csv
    CSV.generate(headers:true) do |csv|
      csv << csv_attributes
      all.each do |task|
        csv << csv_attributes.map{|attr| task.send(attr)}
      end
    end
  end

  def self.csv_attributes
    [
      "id", 
      "co", #会社名
      "name",  #名前
      "tel", #電話番号
      "postnumber", #郵便番号
      "address", #住所
      "email",
      "vender",
      "other",
      "installation", #設置箇所
      "people", #屋内の場合、使用が想定される人数
      "chenge", #自販機交換か
      "change_before", #交換前自販機
      "period", #設置希望時期
      "remarks", #要望
      "word", #社内情報
      "percentage_i", #パーセンテージ
      "percentage_other", #パーセンテージ
      "assumed_number", #想定本数
      "sales_price", #販売価格
      "assumed_total",
      "aim", #目的
      "attracting", #集客
      "chagnge_remarks", #交換詳細
      "industry", #業種
      "created_at",
      "updated_at"
  ]
  end

  def assumed_total
    percentage_i.to_i * assumed_number.to_i
  end

  scope :with_specific_comments, -> {
    joins(:comment).where(
      "comments.asahi IN (:statuses) OR " \
      "comments.cocacola IN (:statuses) OR " \
      "comments.itoen IN (:statuses) OR " \
      "comments.neos IN (:statuses) OR " \
      "comments.dydo IN (:statuses) OR " \
      "(comments.cocacola_suggestion IS NOT NULL AND comments.cocacola_suggestion != '') OR " \
      "(comments.asahi_suggestion IS NOT NULL AND comments.asahi_suggestion != '') OR " \
      "(comments.itoen_suggestion IS NOT NULL AND comments.itoen_suggestion != '') OR " \
      "(comments.neos_suggestion IS NOT NULL AND comments.neos_suggestion != '') OR " \
      "(comments.dydo_suggestion IS NOT NULL AND comments.dydo_suggestion != '')",
      statuses: ["見積提示中"]
    )
  }
end
