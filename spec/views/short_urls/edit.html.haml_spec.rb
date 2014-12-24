require 'rails_helper'

RSpec.describe "short_urls/edit", :type => :view do
  before(:each) do
    @short_url = assign(:short_url, ShortUrl.create!(
      :url => "MyString",
      :uid => "MyString"
    ))
  end

  it "renders the edit short_url form" do
    render

    assert_select "form[action=?][method=?]", short_url_path(@short_url), "post" do

      assert_select "input#short_url_url[name=?]", "short_url[url]"

      assert_select "input#short_url_uid[name=?]", "short_url[uid]"
    end
  end
end
