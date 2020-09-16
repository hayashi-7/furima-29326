require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item_order = FactoryBot.build(:item_order)
  end

  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@item_order).to be_valid
  end

  it 'カード情報が空だと登録できない' do
    @item_order.token = ''
    @item_order.valid?
    expect(@item_order.errors.full_messages).to include("Token can't be blank")
  end

  it 'postal_codeが空だと保存できないこと' do
    @item_order.postal_code = ''
    @item_order.valid?
    expect(@item_order.errors.full_messages).to include("Postal code can't be blank")
  end

  it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    @item_order.postal_code = '1234567'
    @item_order.valid?
    expect(@item_order.errors.full_messages).to include("Postal code is invalid")
  end

  it 'prefecture_idを選択していないと保存できないこと' do
    @item_order.prefecture_id = 1
    @item_order.valid?
    expect(@item_order.errors.full_messages).to include("Prefecture must be other than 1")
  end

  it 'cityは空だと保存できない' do
    @item_order.city = ''
    @item_order.valid?
    expect(@item_order.errors.full_messages).to include("City can't be blank")
  end

  it 'phone_numberは空だと保存できない' do
    @item_order.phone_number = ''
    @item_order.valid?
    expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
  end
  
  it 'phone_numberがハイフンを含むと保存できない' do
    @item_order.phone_number = '222-2222222'
    @item_order.valid?
    expect(@item_order.errors.full_messages).to include("Phone number is invalid")
  end
  
  it 'house_numberは空だと保存できない' do
    @item_order.house_number = ''
    @item_order.valid?
    expect(@item_order.errors.full_messages).to include("House number can't be blank")
  end

  it 'building_nameは空でも保存できること' do
    @item_order.building_name = ''
    expect(@item_order).to be_valid
  end

end
