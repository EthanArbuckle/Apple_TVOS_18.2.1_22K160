@interface MCMDoublyLinkedList
- (MCMDoublyLinkedListNode)head;
- (MCMDoublyLinkedListNode)tail;
- (id)removeFromHead;
- (unint64_t)count;
- (void)addToTail:(id)a3;
- (void)removeAllObjects;
- (void)removeNodeAndAddToTail:(id)a3;
- (void)setCount:(unint64_t)a3;
- (void)setHead:(id)a3;
- (void)setTail:(id)a3;
@end

@implementation MCMDoublyLinkedList

- (id)removeFromHead
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    [v3 next];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMDoublyLinkedList setHead:](self, "setHead:", v5);

    [v4 next];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setPrev:0];
    v7 = -[MCMDoublyLinkedList tail](self, "tail");
    if (v4 == v7) {
      -[MCMDoublyLinkedList setTail:](self, "setTail:", 0LL);
    }
    -[MCMDoublyLinkedList setCount:](self, "setCount:", -[MCMDoublyLinkedList count](self, "count") - 1);
  }

  [v4 setNext:0];
  [v4 setPrev:0];
  return v4;
}

- (void)addToTail:(id)a3
{
  id v4 = a3;
  v5 = -[MCMDoublyLinkedList tail](self, "tail");
  if (v5)
  {
    v6 = -[MCMDoublyLinkedList tail](self, "tail");
    [v6 setNext:v4];
    v7 = -[MCMDoublyLinkedList tail](self, "tail");
    [v4 setPrev:v7];

    [v4 setNext:0];
  }

  else
  {
    [v4 setPrev:0];
    [v4 setNext:0];
    -[MCMDoublyLinkedList setHead:](self, "setHead:", v4);
  }

  -[MCMDoublyLinkedList setTail:](self, "setTail:", v4);

  -[MCMDoublyLinkedList setCount:](self, "setCount:", -[MCMDoublyLinkedList count](self, "count") + 1);
}

- (void)removeNodeAndAddToTail:(id)a3
{
  id v12 = a3;
  [v12 prev];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 next];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setPrev:v4];

  [v12 next];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 prev];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setNext:v6];

  -[MCMDoublyLinkedList head](self, "head");
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v12)
  {
    [v12 next];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMDoublyLinkedList setHead:](self, "setHead:", v9);
  }

  -[MCMDoublyLinkedList tail](self, "tail");
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v12)
  {
    [v12 prev];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMDoublyLinkedList setTail:](self, "setTail:", v11);
  }

  [v12 setPrev:0];
  [v12 setNext:0];
  -[MCMDoublyLinkedList setCount:](self, "setCount:", -[MCMDoublyLinkedList count](self, "count") - 1);
  -[MCMDoublyLinkedList addToTail:](self, "addToTail:", v12);
}

- (void)removeAllObjects
{
  do
  {
    v3 = -[MCMDoublyLinkedList removeFromHead](self, "removeFromHead");
  }

  while (v3);
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (MCMDoublyLinkedListNode)head
{
  return self->_head;
}

- (void)setHead:(id)a3
{
}

- (MCMDoublyLinkedListNode)tail
{
  return self->_tail;
}

- (void)setTail:(id)a3
{
}

- (void).cxx_destruct
{
}

@end