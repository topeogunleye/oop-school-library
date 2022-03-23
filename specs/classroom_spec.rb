relative_require '../classroom'

describe 'Test of the classroom' do
  before(:each) do
    @classroom = Classroom.new
  end

  describe '#initialize' do
    it 'should set the students' do
      expect(@classroom.students).to eq([])
    end

    it 'should set the books' do
      expect(@classroom.books).to eq([])
    end
  end

  describe '#add_student' do
    it 'should add a student to the classroom' do
      @classroom.add_student(Person.new(20, 'John Doe'))
      expect(@classroom.students).to eq([Person.new(20, 'John Doe')])
    end
  end
end
