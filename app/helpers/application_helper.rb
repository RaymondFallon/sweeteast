module ApplicationHelper
  def fa_icon(name, klass = '', fa_type = 'fa-solid')
    tag.i('', class: "#{fa_type} fa-fw fa-#{name} #{klass}", 'aria-hidden': 'true')
  end
end
