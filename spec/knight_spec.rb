require './lib/knight'

describe Knight do
  describe '#knights_move' do
    it 'moves a knight piece and return how many moves it took' do
      knight = Knight.new
      expect(knight.knights_move([0, 0], [2, 6])).to eql('[[0, 0], [-2, 1], [0, 2], [1, 4]] => [2, 6]')
    end
  end
end
