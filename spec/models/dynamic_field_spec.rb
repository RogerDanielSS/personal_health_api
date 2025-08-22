require 'rails_helper'

describe DynamicField, type: :model do
  subject(:dynamic_field) {DynamicField.create}

  it 'Create sucessfully' do
    dynamic_field = DynamicField.create(name: 'height', category_id: 1, data_type: 'float')
    
    expect(dynamic_field).to be_valid
  end

  it 'requires a name' do
    dynamic_field = DynamicField.create(category_id: 1, data_type: 'float')

    expect(dynamic_field).to be_invalid
    expect(dynamic_field.errors[:name]).to include("can't be blank")
  end

  it 'reject an empty string in name' do
    dynamic_field = DynamicField.create(name: '', category_id: 1, data_type: 'float')

    expect(dynamic_field).to be_invalid
    expect(dynamic_field.errors[:name]).to include("can't be blank")
  end

  it 'reject a string filled with spaces in name' do
    dynamic_field = DynamicField.create(name: ' ', category_id: 1, data_type: 'float')

    expect(dynamic_field).to be_invalid
    expect(dynamic_field.errors[:name]).to include("can't be blank")
  end

  it 'requires a category' do
    dynamic_field = DynamicField.create(name: 'height', data_type: 'float')

    expect(dynamic_field).to be_invalid
    expect(dynamic_field.errors[:category]).to include('must exist')
  end

  it 'rejects 0 as category_id' do
    dynamic_field = DynamicField.create(name: 'height', category_id: 0, data_type: 'float')

    expect(dynamic_field).to be_invalid
    expect(dynamic_field.errors[:category]).to include('must exist')
  end

  it 'rejects negative number as category_id' do
    dynamic_field = DynamicField.create(name: 'height', category_id: -1, data_type: 'float')

    expect(dynamic_field).to be_invalid
    expect(dynamic_field.errors[:category]).to include('must exist')
  end

  it 'requires a data type' do
    dynamic_field = DynamicField.create(name: 'height', category_id: 1)

    expect(dynamic_field).to be_invalid
    expect(dynamic_field.errors[:data_type]).to include("can't be blank")
  end

  it 'accepts valid data types' do
    valid_data_types = ['string', 'date', 'float'] 
  
    valid_data_types.each do |data_type|
      dynamic_field = DynamicField.create(name: 'test', category_id: 1, data_type: data_type)
      expect(dynamic_field).to be_valid
    end
  end

  it 'reject invalid data type' do
    dynamic_field = DynamicField.create(name: 'height', category_id: 1, data_type: 'invalid data type')
    
    expect(dynamic_field).to be_invalid
    expect(dynamic_field.errors[:data_type]).to include('must be accepted')
  end

  # it 'has_finished?' do
  #   # setup
  #   dynamic_field.data_type = 'Date'
    
  #   # verify
  #   expect(student).to receive(:has_finished?)
    
  #   # exercise
  #   student.has_finished?(course)
  # end

  # it 'repetição' do
  #   # setup
  #   student = Student.create
    
  #   # verify
  #   expect(student).to receive(:foo).with(123).twice
  #   expect(student).to receive(:foo).with(123).at_least(:once)
    
  #   # exercise
  #   student.foo(123)
  #   student.foo(123)

  #   student.foo(123)
  # end
    
  # it 'retorno' do
  #   # setup
  #   student = Student.create
    
  #   # verify
  #   expect(student).to receive(:foo).with(123).and_return(true)
    
  #   # exercise
  #   student.foo(123)
  # end
end