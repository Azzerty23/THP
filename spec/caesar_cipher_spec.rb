require_relative '../lib/caesar_cipher'

describe "caesar_cipher" do
  it "should return strings" do
    except caesar_cipher("string", 3).to eq()
  end

end