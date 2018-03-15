# frozen_string_literal: true

# アルゴリズムの流れ
# 1. 合計コスト配列を無限大で初期化
# 2. 合計コスト配列を計算
#   - 2.1 ゴール地点の移動コストを0で記録
#   - 2.2 上下左右の隣接マスの移動コスト = 0+対象マスのコストで記録
#   - 2.3 さらに隣接マスについても同様に計算
#     (?) ゴール地点に戻ってループするのでは?
#       算出移動コスト >= 合計コスト配列の値 の場合は、記録しない
#   - 2.4 を繰り返す
# 3. 最短経路を計算
#   - 3.1 スタート地点を起点とする
#   - 3.2 隣接マスのうち最も移動コストが小さいマスに進む
#   - 3.3 3.2 を繰り返すとゴールにたどり着ける
class Router
  attr_accessor :map, :x1, :y1, :x2, :y2, :cost_map

  # @param [Array<Array>] map input map data
  # @param [Integer] x1 スタート位置x座標
  # @param [Integer] y1 スタート位置y座標
  # @param [Integer] x2 ゴールx座標
  # @param [Integer] y2 ゴールy座標
  def initialize(map, x1, y1, x2, y2)
    @map = map
    @x1 = x1
    @y1 = y1
    @x2 = x2
    @y2 = y2

    # 合計コスト配列
    @cost_map = Array.new
  end

  # @return [Array<Array>] 求められた最短経路のX,Y座標
  def route!
    init_cost_map
    gen_cost_map

    # debug
    require 'pp'
    puts '移動コスト:'
    pp @cost_map

    resolve_route
  end

  private

  # 合計コスト配列の初期化
  def init_cost_map
    @map.each do |row|
      tmp = Array.new
      row.each do |_v|
        tmp.push(Float::INFINITY)
      end
      @cost_map.push(tmp)
    end
  end

  # 移動コストを計算
  def gen_cost_map
    _gen_cost_map(@x2, @y2, - @map[@y2][@x2])
  end

  # @param [Integer] x 現在の位置x
  # @param [Integer] y 現在の位置y
  # @param [Integer] cst 現在の合計コスト
  def _gen_cost_map(x, y, cst)
    cst = cst + @map[y][x]
    if cst >= @cost_map[y][x]
      return
    end
    @cost_map[y][x] = cst

    if x > 0
      _gen_cost_map(x - 1, y, cst)
    end
    if y > 0
      _gen_cost_map(x, y - 1, cst)
    end
    if x < @map.first.length - 1
      _gen_cost_map(x + 1, y, cst)
    end
    if y < @map.length - 1
      _gen_cost_map(x, y + 1, cst)
    end
  end

  # スタートからゴールへ移動
  def resolve_route
    ans = Array.new
    ans.push([@x1, @y1])
    move(ans, @x1, @y1)
    ans.push([@x2, @y2])
  end

  # x,yの隣接マスの内最もコストが小さいマスに移動
  def move(ans, x, y)
    cst = Float::INFINITY
    tmp = nil
    # 移動先座標
    x2 = nil
    y2 = nil

    if x > 0 && (tmp = @cost_map[y][x-1]) < cst
      cst = tmp
      x2 = x -1
      y2 = y
    end
    if y > 0 && (tmp = @cost_map[y-1][x]) < cst
      cst = tmp
      x2 = x
      y2 = y - 1
    end
    if x < @map.first.length - 1 && (tmp = @cost_map[y][x+1]) < cst
      cst = tmp
      x2 = x + 1
      y2 = y
    end
    if y < @map.length - 1 && (tmp = @cost_map[y+1][x]) < cst
      cst = tmp
      x2 = x
      y2 = y + 1
    end
    if cst == 0
      return
    end
    ans.push([x2, y2])
    move(ans, x2, y2)
  end

  class << self
    # @param [Array<Array>] map input map data
    # @param [Integer] x1 スタート位置x座標
    # @param [Integer] y1 スタート位置y座標
    # @param [Integer] x2 ゴールx座標
    # @param [Integer] y2 ゴールy座標
    # @return [Array<Array>] 求められた最短経路のX,Y座標
    def route!(map, x1, y1, x2, y2)
      self.new(map, x1, y1, x2, y2).route!
    end
  end
end
