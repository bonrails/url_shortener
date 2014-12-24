class ShortUrlsController < ApplicationController
  before_action :set_short_url, only: [:show]

  # GET /short_urls/1
  # GET /short_urls/1.json
  def show
  end

  # GET /short_urls/new
  def new
    @short_url = ShortUrl.new
  end

  # POST /short_urls
  # POST /short_urls.json
  def create
    @short_url = ShortUrl.new(short_url_params)

    respond_to do |format|
      if @short_url.save
        format.html { redirect_to @short_url, notice: 'Short url was successfully created.' }
        format.json { render :show, status: :created, location: @short_url }
      else
        format.html { render :new }
        format.json { render json: @short_url.errors, status: :unprocessable_entity }
      end
    end
  end

  def by_uid
    @short_url = ShortUrl.find_by_uid(params[:uid])
    if  @short_url.present?
      redirect_to @short_url.url
    else
      flash[:notice] = 'This URL does not exists'
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_url
      @short_url = ShortUrl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def short_url_params
      params.require(:short_url).permit(:url)
    end
end
