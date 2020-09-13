require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
  end

  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@item).to be_valid
  end

  it 'nameが空だと登録できない' do
    @item.name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end

  it 'textが空だと登録できない' do
    @item.text = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Text can't be blank")
  end

  it 'categoryが空だと登録できない' do
    @item.category_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end

  it 'category_idが1だと登録できない' do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Category must be other than 1")
  end

  it 'statusが空だと登録できない' do
    @item.status_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Status can't be blank")
  end

  it 'status_idが1だと登録できない' do
    @item.status_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Status must be other than 1")
  end

  it 'prefectureが空だと登録できない' do
    @item.prefecture_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank")
  end

  it 'prefecture_idが1だと登録できない' do
    @item.prefecture_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
  end

  it 'shippingが空だと登録できない' do
    @item.shipping_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping can't be blank")
  end

  it 'shipping_idが1だと登録できない' do
    @item.shipping_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping must be other than 1")
  end

  it 'dayが空だと登録できない' do
    @item.day_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Day can't be blank")
  end

  it 'day_idが1だと登録できない' do
    @item.day_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Day must be other than 1")
  end
  
  it 'priceが空だと登録できない' do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end

  it 'priceが¥300以下だと登録できない' do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
  end

  it 'priceが¥9999999以上だと登録できない' do
    @item.price = 10000000
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
  end
end
