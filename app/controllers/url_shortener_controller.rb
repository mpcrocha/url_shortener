class UrlShortenerController < ApplicationController

  def create
    valid_params?(params)
    original_url = params[:original_url]
    shortened_url = SecureRandom.base64(8)
    short_url = ShortUrl.new(original_url: original_url, shortened_url: shortened_url)

    return render json: short_url.errors, status: :unprocessable_entity unless short_url.save
    render json: shortened_url, status: :created

  rescue ActionController::ParameterMissing, ArgumentError
    return render json: 'original_url parameter is mandatory and must be completed for example htpp://www.google.com', status: :bad_request
  end

  def valid_params?(params)
    params.require(:original_url)
    raise ArgumentError unless params[:original_url].include?('http')
  end

  def show
    shortened_url = params[:id]
    short_url = ShortUrl.find_by(shortened_url: shortened_url)

    return render json: 'Url not found', status: :not_found unless short_url unless short_url

    redirect_to short_url.original_url
  end
end
