module HomePageSection
  require 'site_prism'

  class Controls < SitePrism::Section
    element :play_button,    "#play"
    element :stop_button,    "#pause"
    element :clear_button,   "#reset"
    element :bpm_toggle_bar, ".ng-pristine"
  end
end
