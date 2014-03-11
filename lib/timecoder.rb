require "timecoder/version"

module Timecoder
  def self.timecode_to_seconds(timecode)
    timecode_split = timecode.split(":")
    raise if timecode_split.length != 3

    hours = timecode.split(":")[0].to_i
    minutes = timecode.split(":")[1].to_i
    seconds = timecode.split(":")[2].to_i

    seconds + (minutes*60) + (hours*60*60)
  end

  def self.seconds_to_timecode(total_seconds)
    raise if !total_seconds.class.eql?(Fixnum)

    if total_seconds < 60
      "00:00:#{total_seconds.to_s.rjust(2, '0')}"
    elsif total_seconds < 60*60
      minutes = total_seconds / 60
      seconds = total_seconds - (minutes*60)
      "00:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
    else
      hours = (total_seconds / 60) / 60
      if (total_seconds - (hours*60*60)) > 60
        minutes = (total_seconds - (hours*60*60)) / 60
      else
        minutes = 0
      end
      seconds = total_seconds - (minutes*60) - (hours*60*60)
      "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
    end
  end
end
