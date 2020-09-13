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

  it 'statusが空だと登録できない' do
    @item.status_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Status can't be blank")
  end

  it 'prefectureが空だと登録できない' do
    @item.prefecture_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank")
  end

  it 'shippingが空だと登録できない' do
    @item.shipping_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping can't be blank")
  end

  it 'dayが空だと登録できない' do
    @item.day_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Day can't be blank")
  end
end
