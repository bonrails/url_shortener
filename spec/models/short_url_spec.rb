require 'rails_helper'

RSpec.describe ShortUrl, :type => :model do
  let(:url)  {'http://www.google.com'}

  it { should validate_presence_of :url }

  describe "#generate_unique_uid" do

   before(:each) do
     @short_url = ShortUrl.new(url: url)
   end
    it 'should generate unique id' do
      expect(@short_url.generate_unique_uid).to be_present
    end

   it 'should generate unique id with length 10' do
     expect(@short_url.generate_unique_uid.length).to eq 10
   end
  end

  describe '#create' do
    before(:each) do
      @short_url = ShortUrl.new(url: url)
    end

    it 'should create a record in db' do
      @short_url.save
      expect(@short_url.uid).to be_present
    end

    context 'check for uniqueness of uid ' do
      it 'should assign unique id' do
        @short_url.save
        @short_url2 = ShortUrl.new(url: url)
        @short_url2.save
        expect(@short_url.uid).not_to eq(@short_url2.uid)
      end
    end
  end

  describe "#assign_unique_uid" do

    before(:each) do
      @short_url = ShortUrl.new(url: url)
    end

    context 'happy path' do
      it 'should assign unique id' do
        @short_url.assign_unique_id
        expect(@short_url.uid).to be_present
      end
    end

    context 'check for uniqueness of uid ' do
      it 'should assign unique id' do
        id = @short_url.assign_unique_id
        @short_url2 = ShortUrl.new(url: url)
        id2 =  @short_url2.assign_unique_id
        expect(@short_url.uid).to eq(id)
        expect(@short_url2.uid).to eq(id2)
      end
    end
  end
end
