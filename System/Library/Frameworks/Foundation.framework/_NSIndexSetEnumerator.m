@interface _NSIndexSetEnumerator
- (_NSIndexSetEnumerator)initWithIndexSet:(id)a3;
- (id)nextObject;
- (void)dealloc;
@end

@implementation _NSIndexSetEnumerator

- (_NSIndexSetEnumerator)initWithIndexSet:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____NSIndexSetEnumerator;
  v4 = -[_NSIndexSetEnumerator init](&v6, sel_init);
  if (v4)
  {
    v4->_indexSet = (NSIndexSet *)a3;
    v4->_index = [a3 firstIndex];
  }

  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSIndexSetEnumerator;
  -[_NSIndexSetEnumerator dealloc](&v3, sel_dealloc);
}

- (id)nextObject
{
  unint64_t index = self->_index;
  if (index == 0x7FFFFFFFFFFFFFFFLL) {
    return 0LL;
  }
  self->_unint64_t index = -[NSIndexSet indexGreaterThanIndex:](self->_indexSet, "indexGreaterThanIndex:", index);
  return +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", index);
}

@end