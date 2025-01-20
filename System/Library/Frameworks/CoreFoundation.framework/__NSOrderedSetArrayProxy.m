@interface __NSOrderedSetArrayProxy
- (__NSOrderedSetArrayProxy)initWithOrderedSet:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation __NSOrderedSetArrayProxy

- (__NSOrderedSetArrayProxy)initWithOrderedSet:(id)a3
{
  self->_orderedSet = a3;
  return self;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS_____NSOrderedSetArrayProxy;
  -[__NSOrderedSetArrayProxy dealloc](&v3, sel_dealloc);
}

- (unint64_t)count
{
  return [self->_orderedSet count];
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)[self->_orderedSet objectAtIndex:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NSArray initWithArray:range:copyItems:]( +[NSArray allocWithZone:](&OBJC_CLASS___NSArray, "allocWithZone:", a3),  "initWithArray:range:copyItems:",  self,  0LL,  -[__NSOrderedSetArrayProxy count](self, "count"),  0LL);
}

@end