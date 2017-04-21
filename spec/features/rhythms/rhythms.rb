require 'spec_helper'


feature 'Wizergos : Drums Dojosto - Rhythm Automation' do

  include GeneralHelper

  scenario 'Rhythms Automation' do
    #rhythm 1
    home_page = HomePage::Home.new
    #handling chrome load issue
    visit home_page.current_url if ENV["JS_DRIVER"] = "selenium-chrome"
    wait_until_visible(home_page.controls)
    print "Tap Tap : May the rhythm be with you"
    test_rhythm(home_page,"rhythm_1")
    #rhythm 2
    test_rhythm(home_page,"rhythm_2")
    #rhythm 3
    test_rhythm(home_page,"rhythm_3")
    #rhythm 4
    test_rhythm(home_page,"rhythm_4")
  end

  def test_rhythm (page,rhythm)
    rhythm_details = load_rhythm_library(rhythm)
    loop_time= rhythm_details["play_duration(sec)"]
    rhythm_sequence= rhythm_details["sequence"]
    playbutton_click_count= rhythm_details["playbutton_click_count"]
    bpm= rhythm_details["bpm"]
    # clear default rhythm
    page.controls.clear_button.click
    #change bpm
    change_bpm(page,bpm)
    #set kick sequence
    set_beat_sequence(rhythm_sequence["kick"], page.instruments[0].beats)
    #set snare sequence
    set_beat_sequence(rhythm_sequence["snare"], page.instruments[1].beats)
    #set Hi-Hat(Closed) sequence
    set_beat_sequence(rhythm_sequence["hc"], page.instruments[2].beats)
    #set Hi-Hat(Open) sequence
    set_beat_sequence(rhythm_sequence["ho"], page.instruments[3].beats)
    # click play button 3 times
    start_time = Time.now
    playbutton_click_count.times do
      page.controls.play_button.click
    end
    puts "\nNow Playing: #{rhythm.capitalize.gsub("_","-")}"
    puts "Play Button Clicked: #{playbutton_click_count} times"
    #loop_time
    loop until timer(start_time, loop_time) <= 0
    print("\n###################################")
  end
end

