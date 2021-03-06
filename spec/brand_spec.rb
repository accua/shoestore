require('spec_helper')

describe Brand do
  it { should have_and_belong_to_many(:stores)}
  it "ensures the user has put in an entry" do
    brand = Brand.new({name: ""})
    expect(brand.save).to eq false
  end
  it "capitalizes the user input" do
    brand = Brand.create({name: "nike"})
    expect(brand.name).to eq "Nike"
  end
end
