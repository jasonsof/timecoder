require "timecoder/version"

module Timecoder
  def self.timecode_in_seconds(timecode)
    timecode_split = timecode.split(":")
    raise if timecode_split.length != 3

    hours = timecode.split(":")[0].to_i
    minutes = timecode.split(":")[1].to_i
    seconds = timecode.split(":")[2].to_i

    seconds + (minutes*60) + (hours*60*60)
  end
end
