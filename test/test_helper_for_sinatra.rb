# frozen_string_literal: true
require 'kaminari/sinatra'
require 'rack/test'
require 'sinatra/test_helpers'
require 'capybara'
require 'nokogiri'

require 'fake_app/sinatra_app'

Capybara.app = SinatraApp

module HelperMethodForHelperSpec
  module FakeEnv
    def env
      {'PATH_INFO' => '/'}
    end
  end

  def helper
    # OMG terrible object...
    Kaminari::Helpers::SinatraHelpers::ActionViewTemplateProxy.new(current_params: {}, current_path: '/', param_name: Kaminari.config.param_name).extend(Padrino::Helpers, Kaminari::ActionViewExtension, Kaminari::Helpers::SinatraHelpers::HelperMethods, FakeEnv)
  end
end