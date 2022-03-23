require_relative '../student'

describe Student do
  context 'Testing the Student class' do
    student = Student.new(22, 'Anuar', parent_permission: true)

    it 'has the class of Student' do
      expect(student.instance_of?(Student)) == true
    end

    it 'should have the right name - Anuar, age - 22 and permission - true' do
      expect(student.age).to eq 22
      expect(student.name).to eq 'Anuar'
      expect(student.parent_permission).to eq true
    end
  end
end
