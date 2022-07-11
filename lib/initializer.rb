# frozen_string_literal: true

require 'i18n'
I18n.load_path += Dir.glob("#{File.dirname(__FILE__)}/lib/locales/*.{rb,yml}")
