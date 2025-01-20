@interface __NSOrderedSetReverseEnumerator
- (__NSOrderedSetReverseEnumerator)initWithObject:(id)a3;
- (id)nextObject;
- (void)dealloc;
@end

@implementation __NSOrderedSetReverseEnumerator

- (__NSOrderedSetReverseEnumerator)initWithObject:(id)a3
{
  self->_obj = a3;
  self->_idx = [a3 count];
  return self;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS_____NSOrderedSetReverseEnumerator;
  -[__NSOrderedSetReverseEnumerator dealloc](&v3, sel_dealloc);
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