require 'json'
require "net/http"

class FretalaAPI
  FRETALA_SANDBOX_URL = 'sandbox.freta.la'
  FRETALA_PRODUCTION_URL = 'api.freta.la'

  def initialize(token, environment)
    throw 'token can\'t be blank' if token.empty?
    throw 'environment must be sandbox or production' if not ['production', 'sandbox'].include? environment
    @token = token
    @environment = environment
    if @environment == 'production'
      @url = FRETALA_PRODUCTION_URL
    else
      @url = FRETALA_SANDBOX_URL
    end
  end

  def getCards()
    performRequest('GET', '/cards')
  end

  def insertCard(card)
    performRequest('POST', '/cards', card.to_json)
  end

  def deleteCard(cardToken)
    performRequest('DELETE', 'cards/'+cardToken)
  end

  def insertFrete(frete)
    performRequest('POST', '/fretes', frete.to_json)
  end

  def cost(route)
    performRequest('POST', '/fretes/cost', route.to_json)
  end

  def buildHeaders()
    headers = {
      'Authorization' => 'Bearer ' + @token,
      'Content-Type' =>  'application/json'
    }
    return headers;
  end

  def performRequest(type, path, data='')
    http = Net::HTTP.new(@url, 443)
    http.use_ssl = true
    headers = buildHeaders()
    if type == 'POST'
      request = Net::HTTP::Post.new(path, headers)
      request.body = data
    elsif type == 'GET'
      request = Net::HTTP::Get.new(path, headers)
    elsif type == 'PUT' 
      request = Net::HTTP::Put.new(path, headers)
      request.body = data
    elsif type == 'DELETE'
      request = Net::HTTP::Delete.new(path, headers)
    else
      throw 'Request type ' + type + ' is not valid'
    end

    response = http.request(request)
    json = JSON.parse(response.body)
    if response.code == '200' 
      return json
    else
      throw json['message']
    end
  end

  private :buildHeaders, :performRequest

end

