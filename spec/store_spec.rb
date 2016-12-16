require('spec_helper')

describe Store do
  it { should have_and_belong_to_many(:brands)}
  it "ensures the user has not submitted a blank form" do
    store = Store.new(name: "")
    expect(store.save).to eq false
  end
  it "capitalizes the name the user inputs" do
    store = Store.create({name: "foot locker"})
    expect(store.name).to eq "Foot Locker"
  end
end
