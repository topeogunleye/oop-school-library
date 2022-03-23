require_relative '../teacher'

describe Teacher do
  context 'Testing the Teacher class' do
    teacher = Teacher.new(43, 'Bob', 'Math', parent_permission: true)

    it 'has the class of Teacher' do
      expect(teacher.instance_of?(Teacher)) == true
    end

    it 'should have the right name - Bob, age = 43 and permission - true' do
      expect(teacher.age).to eq 43
      expect(teacher.name).to eq 'Bob'
      expect(teacher.specialization).to eq 'Math'
      expect(teacher.parent_permission).to eq true
    end

    it 'should be able to use services' do
      expect(teacher.can_use_services?).to eq true
    end
  end
end
