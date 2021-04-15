require './lib/knight'

describe Knight do
  describe '#knights_move' do
    it 'moves a knight piece and return how many moves it took' do
      knight = Knight.new
      expect(knight.knights_move([0, 0], [2, 1])).to eql('it took 1 moves.')
    end
  end
end
