# frozen_string_literal: true

require_relative 'router'

describe Router do
  describe '.route!' do
    subject { described_class.route!(map, x1, y1, x2, y2) }

    let(:x1) { 4 }
    let(:y1) { 0 }
    let(:x2) { 5 }
    let(:y2) { 9 }

    context 'map1' do
      let(:map) {
        [
          [5,5,4,2,1,1,1,2,2,3],
          [5,4,3,2,1,1,2,2,3,4],
          [5,4,2,1,1,2,2,4,5,5],
          [4,4,2,1,2,2,3,3,4,5],
          [4,3,1,1,4,3,3,3,4,5],
          [3,1,1,5,4,3,2,3,4,5],
          [2,1,3,4,3,3,2,2,3,4],
          [1,1,3,4,3,2,1,1,2,3],
          [2,1,1,3,4,2,2,3,4,4],
          [3,2,1,1,3,3,3,3,4,5],
        ]
      }
      let(:ans) {
        [
          [4, 0],
          [4, 1],
          [4, 2],
          [3, 2],
          [3, 3],
          [3, 4],
          [2, 4],
          [2, 5],
          [1, 5],
          [1, 6],
          [1, 7],
          [1, 8],
          [2, 8],
          [2, 9],
          [3, 9],
          [4, 9],
          [5, 9],
        ]
      }

      it { is_expected.to eq ans }
    end
  end
end
