require "timecoder/version"

SECONDS_IN_MINUTE = 60
SECONDS_IN_HOUR = 60*60

module Timecoder
  def self.timecode_to_seconds(timecode)
    timecode_split = timecode.split(":")
    raise if timecode_split.length != 3

    hours = timecode.split(":")[0].to_i
    minutes = timecode.split(":")[1].to_i
    seconds = timecode.split(":")[2].to_i

    seconds + minutes_to_seconds(minutes) + hours_to_seconds(hours)
  end

  def self.seconds_to_timecode(total_seconds)
    raise if !total_seconds.class.eql?(Fixnum)

    hours = seconds_to_hours(total_seconds)
    total_seconds -= hours_to_seconds(hours)
    minutes = seconds_to_minutes(total_seconds)
    total_seconds -= minutes_to_seconds(minutes)
    seconds = total_seconds
    
    timecode_str(hours, minutes, seconds)
  end

  private
    def self.timecode_str(hours, minutes, seconds)
      "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
    end

    def self.minutes_to_seconds(minutes)
      minutes * SECONDS_IN_MINUTE
    end

    def self.hours_to_seconds(hours)
      hours * SECONDS_IN_HOUR
    end

    def self.seconds_to_minutes(seconds)
      seconds / SECONDS_IN_MINUTE
    end

    def self.seconds_to_hours(seconds)
      seconds / SECONDS_IN_HOUR
    end
end
