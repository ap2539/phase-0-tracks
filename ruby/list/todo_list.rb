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

  def delete_item(item_to_remove)
  	@instance_list.delete(item_to_remove)
  	@instance_list
  end

  def get_item(item_index)
  	@instance_list[item_index]
  end
end

