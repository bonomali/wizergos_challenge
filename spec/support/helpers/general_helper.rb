require 'capybara'

module GeneralHelper

  def wait_until_visible(params)
    retries ||= 1
    begin
      sleep(Capybara.default_max_wait_time)
      expect(params).to be_visible
    rescue => e
      binding.pry
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

  def load_rhythm_library(rhythm)
    rhythm_library = YAML.load_file("spec/config/rhythm_library.yml")
    return rhythm_library["rhythm_library"][rhythm]
  end
end