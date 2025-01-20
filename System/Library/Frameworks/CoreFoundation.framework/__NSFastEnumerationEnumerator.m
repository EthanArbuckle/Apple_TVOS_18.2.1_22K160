@interface __NSFastEnumerationEnumerator
+ (id)allocWithZone:(_NSZone *)a3;
- (__NSFastEnumerationEnumerator)initWithObject:(id)a3;
- (id)nextObject;
- (void)dealloc;
@end

@implementation __NSFastEnumerationEnumerator

+ (id)allocWithZone:(_NSZone *)a3
{
  v3 = (objc_class *)objc_opt_class();
  return (id)__CFAllocateObject(v3, 0x40uLL);
}

- (__NSFastEnumerationEnumerator)initWithObject:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS_____NSFastEnumerationEnumerator;
  v4 = -[__NSFastEnumerationEnumerator init](&v6, sel_init);
  if (v4)
  {
    v4->_obj = (NSFastEnumeration *)a3;
    v4->_origObj = a3;
  }

  return v4;
}

- (id)nextObject
{
  if (self->_index == self->_count)
  {
    p_unint64_t state = &self->_state;
    unint64_t state = self->_state.state;
    self->_unint64_t index = 0LL;
    unint64_t v5 = -[NSFastEnumeration countByEnumeratingWithState:objects:count:]( self->_obj,  "countByEnumeratingWithState:objects:count:",  &self->_state,  self->_objects,  16LL);
    self->_count = v5;
    if (!v5)
    {
LABEL_6:

      self->_obj = 0LL;
      id result = 0LL;
      self->_origObj = 0LL;
      return result;
    }

    if (state)
    {
      if (self->_mut != *p_state->var0)
      {
        __NSFastEnumerationMutationHandler((uint64_t)self->_obj);
        goto LABEL_6;
      }
    }

    else
    {
      self->_mut = *p_state->var0;
    }
  }

  unint64_t index = self->_index;
  itemsPtr = self->_state.itemsPtr;
  self->_unint64_t index = index + 1;
  return itemsPtr[index];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS_____NSFastEnumerationEnumerator;
  -[__NSFastEnumerationEnumerator dealloc](&v3, sel_dealloc);
}

@end