
# spec/tag_filters_spec.rb
require 'rspec'

RSpec.describe "RSpec Tag Filters" do
  it "fast: runs when key:true is matched", fast: true do
    expect(2 + 2).to eq(4)
  end

  it "browser: runs when key:value is matched", browser: :chrome do
    expect("ruby".upcase).to eq("RUBY")
  end

  it "db: runs when :symbol is matched", :db do
    expect([1,2,3]).to include(2)
  end

  it "slow: will be excluded when ~negation is used", slow: true do
    sleep 0.1
    expect(5 * 5).to eq(25)
  end
end

# | Tag style        | Example in spec                           | Run only this test                            | Exclude this test              |
# |------------------|-------------------------------------------|-----------------------------------------------|--------------------------------|
# | `key: true`      | `it "fast test", fast: true do ... end`   | rspec --tag fast --format doc or -f d         | `rspec --tag ~fast`            |
# | `key: value`     | `it "chrome test", browser: :chrome do`   | rspec --tag browser:chrome or -t browser -f d | `rspec --tag ~browser:chrome`  |
# | `:symbol`        | `it "db test", :db do ... end`            | rspec --tag db                                | `rspec --tag ~db`              |
# | Negation (`~`)   | `it "slow test", slow: true do ... end`   | (all tests except slow) `rspec --tag ~slow    | —                              |
# |------------------|-------------------------------------------|-----------------------------------------------|--------------------------------|
