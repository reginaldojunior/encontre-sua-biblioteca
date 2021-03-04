require_relative '../rails_helper'

RSpec.describe 'Home Request', :type => :request do
  it '[GET] Obter o home "healthcheck"' do
    get '/'
    body = JSON.parse(response.body).deep_symbolize_keys
    expect(body).to eq ({ message: "Welcome" })
  end
end