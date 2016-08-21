class TodoList
  def initialize(list)
      @instance_list = list
  end

  def get_items
    @instance_list
  end

  def add_item(new_item)
  	@instance_list << new_item
  end
end

