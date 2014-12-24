require 'rails_helper'

RSpec.describe "short_urls/index", :type => :view do
  before(:each) do
    assign(:short_urls, [
      ShortUrl.create!(
        :url => "Url",
        :uid => "Uid"
      ),
      ShortUrl.create!(
        :url => "Url",
        :uid => "Uid"
      )
    ])
  end

  it "renders a list of short_urls" do
    render
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
  end
end
