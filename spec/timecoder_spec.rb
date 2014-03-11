require 'spec_helper'

describe Timecoder do
  describe ".timecode_in_seconds" do
    context "the input is a valid timecode" do
      it "converts a timecode string into the equivalent time in seconds" do
        expect(Timecoder.timecode_in_seconds("00:00:28")).to eq 28
        expect(Timecoder.timecode_in_seconds("01:00:28")).to eq 3600 + 28
        expect(Timecoder.timecode_in_seconds("00:10:00")).to eq 600
        expect(Timecoder.timecode_in_seconds("02:10:01")).to eq 7200 + 600 + 1
        expect(Timecoder.timecode_in_seconds("00:00:00")).to eq 0
        expect(Timecoder.timecode_in_seconds("00:01:00")).to eq 60
      end

      it "returns an integer" do
        input = "00:00:28"

        expect(Timecoder.timecode_in_seconds(input)).to be_a(Fixnum)
      end
    end

    context "the input is not a valid timecode" do
      it "raises an exception" do
        input = "34567"

        expect {
          Timecoder.timecode_in_seconds(input)
        }.to raise_error
      end
    end
  end

  describe ".seconds_to_timecode" do
    context "the input is valid" do
      it "converts time in seconds to a formatted timecode" do
        expect(Timecoder.seconds_to_timecode(28)).to eq "00:00:28"
        expect(Timecoder.seconds_to_timecode(3600 + 28)).to eq "01:00:28"
        expect(Timecoder.seconds_to_timecode(600)).to eq "00:10:00"
        expect(Timecoder.seconds_to_timecode(7200 + 600 + 1)).to eq "02:10:01"
        expect(Timecoder.seconds_to_timecode(0)).to eq "00:00:00"
        expect(Timecoder.seconds_to_timecode(60)).to eq "00:01:00"
        expect(Timecoder.seconds_to_timecode(87654)).to eq "24:20:54"
      end

      it "returns a string" do
        input = 28

        expect(Timecoder.seconds_to_timecode(input)).to be_a(String)
      end
    end

    context "the input is invalid" do
      it "raises an exception" do
        input = "28"

        expect {
          Timecoder.seconds_to_timecode(input)
        }.to raise_error
      end
    end
  end
end