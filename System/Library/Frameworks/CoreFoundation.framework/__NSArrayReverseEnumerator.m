@interface __NSArrayReverseEnumerator
- (__NSArrayReverseEnumerator)initWithObject:(id)a3;
- (id)nextObject;
- (void)dealloc;
@end

@implementation __NSArrayReverseEnumerator

- (__NSArrayReverseEnumerator)initWithObject:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS_____NSArrayReverseEnumerator;
  v4 = -[__NSArrayReverseEnumerator init](&v6, sel_init);
  if (v4)
  {
    v4->_obj = a3;
    v4->_idx = [a3 count];
  }

  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS_____NSArrayReverseEnumerator;
  -[__NSArrayReverseEnumerator dealloc](&v3, sel_dealloc);
}

- (id)nextObject
{
  id obj = self->_obj;
  if (obj)
  {
    unint64_t idx = self->_idx;
    if (idx)
    {
      self->_unint64_t idx = idx - 1;
      return (id)objc_msgSend(self->_obj, "objectAtIndex:");
    }

    self->_id obj = 0LL;
  }

  return 0LL;
}

@end