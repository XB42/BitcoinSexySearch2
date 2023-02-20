require 'open-uri';
require 'json'
class APICaller

  def self.callAPI(block_number)
    url = "https://api-r.bitcoinchain.com/v1/block/" + block_number #+ "/withTx"
    doc = URI.open(url).read
    hash = JSON.parse(doc)
    p hash
    return hash
  end

  def self.get_max_height
    url = "https://api-r.bitcoinchain.com/v1/status"
    doc = URI.open(url).read
    hash = JSON.parse(doc)
    p hash["height"]
    return hash["height"]
  end
end
