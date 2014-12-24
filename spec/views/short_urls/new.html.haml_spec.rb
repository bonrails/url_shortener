require 'rails_helper'

RSpec.describe "short_urls/new", :type => :view do
  before(:each) do
    assign(:short_url, ShortUrl.new(
      :url => "MyString",
      :uid => "MyString"
    ))
  end

  it "renders new short_url form" do
    render

    assert_select "form[action=?][method=?]", short_urls_path, "post" do

      assert_select "input#short_url_url[name=?]", "short_url[url]"

      assert_select "input#short_url_uid[name=?]", "short_url[uid]"
    end
  end
end
