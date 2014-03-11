require 'spec_helper'

describe Timecoder do
  describe ".timecode_in_seconds" do
    context "the input is a valid timecode" do
      it "converts a timecode string into the equivalent time in seconds" do
        expect(Timecoder.timecode_in_seconds("00:00:28")).to eq 28
        expect(Timecoder.timecode_in_seconds("01:00:28")).to eq 3600 + 28
        expect(Timecoder.timecode_in_seconds("00:10:00")).to eq 600
        expect(Timecoder.timecode_in_seconds("02:10:01")).to eq 7200 + 600 + 1
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
end