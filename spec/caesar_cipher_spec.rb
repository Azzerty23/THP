require_relative '../lib/caesar_cipher'

describe "caesar_cipher" do
  it "should accept only string as message" do
    expect(caesar_cipher(5, 0)).to eq("The message must be a String and the key an Integer")
    expect(caesar_cipher(["a"], 0)).to eq("The message must be a String and the key an Integer")
  end

  it "should accept only Integer as key" do
    expect(caesar_cipher("a", "1")).to eq("The message must be a String and the key an Integer")
    expect(caesar_cipher("a", "e")).to eq("The message must be a String and the key an Integer")
  end

  it "should return encoded message with uppercase" do
    expect(caesar_cipher("A", 0)).to eq("A")
    expect(caesar_cipher("a", 0)).to eq("a")
    expect(caesar_cipher("A", 1)).to eq("B")
  end

  it "should go back after Z" do
    expect(caesar_cipher("Z", 1)).to eq("A")
    expect(caesar_cipher("a", 26)).to eq("a")
  end

end