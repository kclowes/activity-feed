require 'rspec'
require_relative '../lib/activity_feed'

describe 'ActivityFeed' do
  it 'will return what to look for' do
    input = [
      {
        "sentence" => "{creator} added {address} to {patient}",
        "objects" => {
          "creator" => {
            "type" => "User",
            "id" => 2365,
            "text" => "Geoffrey Lesch"
          },
          "address" => {
            "type" => "Address",
            "id" => 17174,
            "text" => "a business address"
          },
          "patient" => {
            "type" => "Patient",
            "id" => 23246,
            "text" => "Emilie Lind"
          }
        }
      }
    ]
    expected = "creator", "address", "patient"
    actual = ActivityFeed.new.which_item(input)
    expect(actual).to eq(expected)
  end

  it 'will return the items that will be subbed' do
    input = [
      {
        "sentence" => "{creator} added {address} to {patient}",
        "objects" => {
          "creator" => {
            "type" => "User",
            "id" => 2365,
            "text" => "Geoffrey Lesch"
          },
          "address" => {
            "type" => "Address",
            "id" => 17174,
            "text" => "a business address"
          },
          "patient" => {
            "type" => "Patient",
            "id" => 23246,
            "text" => "Emilie Lind"
          }
        }
      }
    ]
    expected = "Geoffrey Lesch", "a business address", "Emilie Lind"
    actual = ActivityFeed.new.wanted_items(input)
    expect(actual).to eq(expected)
  end

  it 'puts everything together' do
    input = [
      {
        "sentence" => "{creator} added {address} to {patient}",
        "objects" => {
          "creator" => {
            "type" => "User",
            "id" => 2365,
            "text" => "Geoffrey Lesch"
          },
          "address" => {
            "type" => "Address",
            "id" => 17174,
            "text" => "a business address"
          },
          "patient" => {
            "type" => "Patient",
            "id" => 23246,
            "text" => "Emilie Lind"
          }
        }
      }
    ]
    expected = "Geoffrey Lesch added a business address to Emilie Lind"
    actual = ActivityFeed.new.put_together(input)
    expect(actual).to eq(expected)
  end



end