@interface MCMDoublyLinkedListNode
- (MCMDoublyLinkedListNode)initWithKey:(id)a3 data:(id)a4;
- (MCMDoublyLinkedListNode)next;
- (MCMDoublyLinkedListNode)prev;
- (id)data;
- (id)key;
- (void)setData:(id)a3;
- (void)setKey:(id)a3;
- (void)setNext:(id)a3;
- (void)setPrev:(id)a3;
@end

@implementation MCMDoublyLinkedListNode

- (MCMDoublyLinkedListNode)initWithKey:(id)a3 data:(id)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCMDoublyLinkedListNode;
  v8 = -[MCMDoublyLinkedListNode init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[MCMDoublyLinkedListNode setKey:](v8, "setKey:", v6);
    -[MCMDoublyLinkedListNode setData:](v9, "setData:", v7);
  }

  return v9;
}

- (id)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (id)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (MCMDoublyLinkedListNode)prev
{
  return (MCMDoublyLinkedListNode *)objc_loadWeakRetained((id *)&self->_prev);
}

- (void)setPrev:(id)a3
{
}

- (MCMDoublyLinkedListNode)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end