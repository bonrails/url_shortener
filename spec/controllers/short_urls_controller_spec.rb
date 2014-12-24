require 'rails_helper'

RSpec.describe ShortUrlsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # ShortUrl. As you add validations to ShortUrl, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {:url =>  'http://www.google.com'}
  }

  let(:invalid_attributes) {
    {:assas =>  'unkown'}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ShortUrlsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET show" do
    it "assigns the requested short_url as @short_url" do
      short_url = ShortUrl.create! valid_attributes
      get :show, {:id => short_url.to_param}, valid_session
      expect(assigns(:short_url)).to eq(short_url)
    end
  end

  describe "GET new" do
    it "assigns a new short_url as @short_url" do
      get :new, {}, valid_session
      expect(assigns(:short_url)).to be_a_new(ShortUrl)
    end
  end

  describe "GET by_uid" do
    it "assigns a new short_url as @short_url" do
      assigns[:short_url] = double(ShortUrl)
      get :by_uid, {uid: '121232332312'}, valid_session
      expect(response).to redirect_to root_path
    end

    it "redirectsto original url" do
      s_url =  double(ShortUrl,url: 'google.com')
      allow(ShortUrl).to receive(:find_by_uid).and_return s_url
      get :by_uid, {uid: '121232332312'}, valid_session
      expect(response).to  redirect_to s_url.url
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ShortUrl" do
        expect {
          post :create, {:short_url => valid_attributes}, valid_session
        }.to change(ShortUrl, :count).by(1)
      end

      it "assigns a newly created short_url as @short_url" do
        post :create, {:short_url => valid_attributes}, valid_session
        expect(assigns(:short_url)).to be_a(ShortUrl)
        expect(assigns(:short_url)).to be_persisted
      end

      it "redirects to the created short_url" do
        post :create, {:short_url => valid_attributes}, valid_session
        expect(response).to redirect_to(ShortUrl.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved short_url as @short_url" do
        post :create, {:short_url => invalid_attributes}, valid_session
        expect(assigns(:short_url)).to be_a_new(ShortUrl)
      end

      it "re-renders the 'new' template" do
        post :create, {:short_url => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end
end
