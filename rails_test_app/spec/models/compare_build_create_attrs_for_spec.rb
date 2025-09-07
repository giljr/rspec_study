# spec/models/compare_build_create_attrs_for_spec.rb
require 'rails_helper'

RSpec.describe "FactoryBot methods" do
  context "build vs create vs attributes_for" do
    it "uses build to instantiate without saving" do
      customer = build(:customer)

      expect(customer).to be_a(Customer)
      expect(customer).to be_new_record   # not persisted
    end

    it "uses create to instantiate and save" do
      customer = create(:customer)

      expect(customer).to be_a(Customer)
      expect(customer).to be_persisted    # saved to DB
    end

    it "uses attributes_for to return a hash" do
      attrs = attributes_for(:customer)

      expect(attrs).to be_a(Hash)
      expect(attrs).to include(:name, :email)
    end
  end
end

# | Method                      | What it returns                                                  | Saved to DB? | Typical Usage                                      |
# | --------------------------- | ---------------------------------------------------------------- | ------------ | -------------------------------------------------- |
# | `build(:customer)`          | `Customer` object                                                | No           | Unit tests where persistence isn’t needed          |
# | `create(:customer)`         | `Customer` object                                                | Yes          | Tests that need DB records (associations, queries) |
# | `attributes_for(:customer)` | Hash of attributes (e.g. `{name: "John", email: "john@ex.com"}`) | No           | Controller/request specs, `params` simulation      |
# | --------------------------- | ---------------------------------------------------------------- | ------------ | ----------------------------------------------- ---|
