module ApplicationHelper
  def column_do options = {columns: 8, offset: 2}, &block
    render(
      partial: 'shared/column',
      locals: { options: options, block: block }
    )
  end
end
