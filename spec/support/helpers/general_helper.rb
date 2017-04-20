require 'capybara'

module GeneralHelper

  def wait_until_visible(params)
    retries ||= 1
    begin
      sleep(Capybara.default_max_wait_time)
      expect(params).to be_visible
    rescue => e
      puts "Dom not ready yet for script to run further"
      sleep(Capybara.default_max_wait_time)
      puts "Retrying #{retries}..."
      page.load if (retries == 3)
      retry if (retries += 1) < 10
      puts e.message
    end
  end

  def set_beat_sequence(sequence_array,elements_array)
    sequence_array.each do |index|
      elements_array[index-1].click
    end
  end

  def change_bpm(page,bpm)
    bpm_min_val = page.controls.bpm_toggle_bar[:min]
    bpm_max_val = page.controls.bpm_toggle_bar[:max]
    css = ".#{page.controls.bpm_toggle_bar[:class].split(" ").first.to_s}"
    case bpm.to_f
      when bpm_min_val.to_f..bpm_max_val.to_f
        page.execute_script("document.querySelector(\"#{css}\").value='#{bpm.to_s}';")
      else
        if bpm.to_f < bpm_min_val.to_f
          puts "\nGiven BPM value is less than min value of BPM(#{bpm_min_val}) toggle. Overriding min value for testing purposes"
          page.execute_script("document.querySelector(\"#{css}\").setAttribute('min','#{bpm.to_s}');")
          page.execute_script("document.querySelector(\"#{css}\").value='#{bpm.to_s}';")
          print "BPM Value has been overridden and set to #{bpm.to_s} bpm"
        else
          puts "\nGiven BPM value is greater than max value of BPM(#{bpm_max_val}) toggle. Overriding max value for testing purposes"
          page.execute_script("document.querySelector(\"#{css}\").setAttribute('max','#{bpm.to_s}');")
          page.execute_script("document.querySelector(\"#{css}\").value='#{bpm.to_s}';")
          print "BPM Value has been overridden and set to #{bpm.to_s} bpm"
        end
    end
  end

  def load_rhythm_library(rhythm)
    rhythm_library = YAML.load_file("spec/config/rhythm_library.yml")
    return rhythm_library["rhythm_library"][rhythm]
  end

  def timer(start_time, play_duration)
    sleep(1)
    current_time = Time.now
    time_diff = (current_time - start_time).round
    countdown = play_duration-time_diff
    print "\rRhythm Loop Countdown: #{"%03d" % countdown} seconds"
    return countdown
  end
end