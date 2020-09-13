require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.build(:user)
  end
  it 'nicknameが空だと登録できない' do
    @user.nickname = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end

  it 'emailが空だと登録できない' do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it 'passwordが空だと登録できない' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it 'passwordが5文字以下だと登録できない' do
    @user.password = 'oooo0'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end

  it 'password_confirmationが空だと登録できない' do
    @user.password = 'ooo000'
    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it 'birthdayが空だと登録できない' do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end

  it 'first_nameが空だと登録できない' do
    @user.first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end

  it 'first_nameがカタカナ、漢字、平仮名以外だと登録できない' do
    @user.first_name = 'ｱｱa'
    @user.valid?
    expect(@user.errors.full_messages).to include('First name is invalid')
  end

  it 'second_nameが空だと登録できない' do
    @user.second_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Second name can't be blank")
  end

  it 'first_name_kanaが空だと登録できない' do
    @user.first_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank")
  end

  it 'first_name_kanaがカタカナ以外だと登録できない' do
    @user.first_name_kana = 'あべ'
    @user.valid?
    expect(@user.errors.full_messages).to include('First name kana is invalid')
  end

  it 'second_name_kanaが空だと登録できない' do
    @user.second_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Second name kana can't be blank")
  end

  it 'first_name_kanaがカタカナ以外だと登録できない' do
    @user.second_name_kana = 'あべ'
    @user.valid?
    expect(@user.errors.full_messages).to include('Second name kana is invalid')
  end
end
