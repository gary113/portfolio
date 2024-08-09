module Sortable
  extend ActiveSupport::Concern

  included do
    def reorder_items(current_class)
      order_params.each do |item|
        record = current_class.find(item[:id])
        position_column = current_class.column_names.find { |column_name| column_name.include?('position') }

        record.update("#{position_column}": item[:position])
      end
    end

    private

    def order_params
      params.require(:order).map do |item|
        item.permit(:id, :position)
      end
    end
  end
end
