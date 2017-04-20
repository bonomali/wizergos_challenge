module HomePage
  require 'site_prism'
  require_relative '../sections/controls'
  require_relative '../sections/instruments'

  class Home < SitePrism::Page
    set_url "#"

    section :controls,    ::HomePageSection::Controls, "#controls"
    sections :instruments, ::HomePageSection::Instruments, ".dm-row.ng-scope"
  end
end
