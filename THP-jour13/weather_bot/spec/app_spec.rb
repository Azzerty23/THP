require_relative '../lib/app'

describe "get_weather" do
  it "should display current weather from Montpellier by default" do
    expect(get_weather()).to eq(/./)
    expect(get_weather("Paris")).to eq(/./)
  end
end

describe "min_max_temperature" do
  it "should display min and max current temperature in France" do
    expect(min_max_temperature).to eq(/./)
    expect(min_max_temperature).to eq(/./)
  end
end

describe "it_will_rain" do
  it "should trigger alert when it will rain in Montpellier" do
    expect(min_max_temperature).to eq(/./)
    expect(min_max_temperature).to eq(/./)
  end
end
