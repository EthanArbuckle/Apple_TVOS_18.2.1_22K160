@interface __NSOrderedSetSetProxy
- (__NSOrderedSetSetProxy)initWithOrderedSet:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation __NSOrderedSetSetProxy

- (__NSOrderedSetSetProxy)initWithOrderedSet:(id)a3
{
  self->_orderedSet = a3;
  return self;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS_____NSOrderedSetSetProxy;
  -[__NSOrderedSetSetProxy dealloc](&v3, sel_dealloc);
}

- (unint64_t)count
{
  return [self->_orderedSet count];
}

- (id)member:(id)a3
{
  uint64_t v4 = [self->_orderedSet indexOfObject:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0LL;
  }
  else {
    return (id)[self->_orderedSet objectAtIndex:v4];
  }
}

- (id)objectEnumerator
{
  return (id)[self->_orderedSet objectEnumerator];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NSSet initWithSet:copyItems:]( +[NSSet allocWithZone:](&OBJC_CLASS___NSSet, "allocWithZone:", a3),  "initWithSet:copyItems:",  self,  0LL);
}

@end