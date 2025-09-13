require "httparty"

RSpec.describe "HTTParty" do
  it "makes a GET request to a public API" do
    # Example of how you could stub with WebMock (optional, since VCR already records):
    # stub_request(:get, "https://jsonplaceholder.typicode.com/posts/1").
    #   with(
    #     headers: {
    #       "Accept" => "*/*",
    #       "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
    #       "User-Agent" => "Ruby"
    #     }
    #   ).to_return(
    #     status: 200,
    #     body: "",
    #     headers: { "Content-Type" => "application/json" }
    #   )

    VCR.use_cassette("jsonplaceholder/posts") do
      response = HTTParty.get("https://jsonplaceholder.typicode.com/posts/1")
      content_type = response.headers["content-type"]

      expect(content_type).to include("application/json")
    end
  end

  # To enable automatic cassette naming with metadata, add this line to spec_helper.rb:
  #     config.configure_rspec_metadata!
  #
  # VCR determines which cassette to record based on the `describe` block and `it` title.
  it "stores posts using VCR metadata", :vcr do
    response = HTTParty.get("https://jsonplaceholder.typicode.com/posts/1")
    content_type = response.headers["content-type"]

    expect(content_type).to include("application/json")
  end

  it "uses a custom VCR cassette_name tag",
     vcr: { cassette_name: "jsonplaceholder/posts" } do
    response = HTTParty.get("https://jsonplaceholder.typicode.com/posts/1")
    content_type = response.headers["content-type"]

    expect(content_type).to include("application/json")
  end
end
