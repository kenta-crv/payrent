class CreateEstimates < ActiveRecord::Migration[5.2]
  def change
    create_table :estimates do |t|
      t.string :company #会社名
      t.string :name  #名前
      t.string :tel #電話番号
      t.string :postnumber #郵便番号
      t.string :address #住所
      t.string :email 
      t.string :payment #振込金額
      t.string :remarks #要望
      t.timestamps
    end
  end
end
