module HomePageSection
  require 'site_prism'

  class Instruments < SitePrism::Section
    element :instrument_name,    ".instrument-name.ng-binding"
    elements :beats,             ".btn"
  end
end
