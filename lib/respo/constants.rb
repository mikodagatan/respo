# frozen_string_literal: true

module Respo
  module Constants
    METHODS = %i[
      not_found
      show_success
      create_success
      create_error
      update_success
      update_error
      destroy_success
      destroy_error
    ].freeze

    STATUSES = {
      index: {
        success: :ok,
        error: :bad_request
      },
      new: {
        success: :ok,
        error: :bad_request
      },
      create: {
        success: :ok,
        error: :unprocessable_entity
      },
      edit: {
        success: :ok,
        error: :bad_request
      },
      update: {
        success: :ok,
        error: :not_acceptable
      },
      destroy: {
        success: :ok,
        error: :not_acceptable
      }
    }.freeze
  end
end
