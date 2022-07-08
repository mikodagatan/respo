module Respo
  def self.not_found(record, custom_name: nil)
    { json: { error: I18n.t('errors.messages.not_found', model: custom_name || model(record)) },
      status: status }
  end

  def self.show_success(record, view: nil, root: nil)
    { json: serializer.render(record, view: view, root: root), status: status }
  end

  def self.create_success(record, view: nil, root: nil)
    { json: serializer.render(record, view: view, root: root), status: status }
  end

  def self.create_error(record)
    { json: { errors: record.errors.full_messages }, status: status }
  end

  def self.update_success(record, view: nil, root: nil)
    { json: serializer.render(record, view: view, root: root), status: status }
  end

  def self.update_error(record)
    { json: { errors: record.errors.full_messages },
      status: status }
  end

  def self.destroy_success(record)
    { json: { key(record) => serializer.render(record),
              message: I18n.t('errors.messages.deleted', model: key.gsub('_', ' ').titleize) },
      status: status }
  end

  def self.destroy_error(record)
    { json: {
        error: I18n.t('errors.messages.cant_delete', model: custom_name || model(record))
      },
      status: status }
  end

  private

  def klass_name(record)
    record.send(record.is_a?(ActiveRecord::Relation) ? 'klass' : 'class').name
  end

  def model(record)
    klass_name(record).split('::').last
  end

  def key(record)
    model(record).underscore
  end

  def serializer
    "#{klass_name(record)}Serializer".constantize
  end

  def status
    @statuses ||= Constants::STATUSES
    calling_method = caller_locations(1, 1)[0].label
    action, result = calling_method.split('_')
    @statuses.dig(action.to_sym, result.to_sym)
  end
end
