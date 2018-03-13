# frozen_string_literal: true

class Router
  class << self
    # @param [Array<Array>] map input map data
    # @param [Integer] x1 スタート位置x座標
    # @param [Integer] y1 スタート位置y座標
    # @param [Integer] x2 ゴールx座標
    # @param [Integer] y2 ゴールy座標
    # @return [Array<Array>] 求められた最短経路のX,Y座標
    def route!(map, x1, y1, x2, y2)
      [[x1,x1], [x2,y2]]
    end
  end
end
