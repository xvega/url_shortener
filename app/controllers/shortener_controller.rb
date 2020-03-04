class ShortenerController < ApplicationController
  before_action :find_url, only: [:show, :shortened]

  def index; end

  def show
    redirect_to @url.sanitized_url
  end

  def create
    @url = Shortener.new
    @url.original_url = params[:original_url]
    @url.sanitize
    @url.save
    redirect_to shortened_path(@url.shorten_url)
  end

  def shortened
    @url = find_url
    host = request.host_with_port
    @original_url = @url.sanitize
    @short_url = "#{host}/#{@url.shorten_url}"
  end

  private

  def find_url
    @url = Shortener.find_by(shorten_url: params[:short_url])
  end

  def url_params
    params.require(:url).permit(:original_url)
  end
end
