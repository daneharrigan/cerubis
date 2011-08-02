module TestNodeDefaults
  def test_content_returns_unparsed_content
    node = class_name.new(content, options)
    assert_equal content, node.content
  end

  def test_parent_returns_parent_node_or_template
    parent = StubObject.new
    node   = class_name.new(content, parent: parent)
    assert_equal parent, node.parent
  end

  def test_context_traverses_to_parent
    parent = StubObject.new(context: { foo: :bar })
    node   = class_name.new(content, parent: parent)
    assert_equal parent.context, node.context
  end

  private
    def options
      context = Cerubis::Context.new(title: 'Foo Title')
      parent  = StubObject.new(context: context)
      { parent: parent }
    end

    def content
      '<h1>{{title}}</h1>'
    end

end
