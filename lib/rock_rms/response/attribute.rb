module RockRMS
  module Response
    class Attribute < Base
      MAP = {
        id: 'Id',
        name: 'Name',
        key: 'Key',
        description: 'Description'
      }.freeze

      def format_single(data)
        to_h(MAP, data)
      end
    end
  end
end
