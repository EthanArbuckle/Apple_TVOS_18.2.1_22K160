@interface QRSelfAllocationArray
- (QRSelfAllocationArray)init;
- (id)getAllocation;
- (void)addAllocation:(id)a3;
@end

@implementation QRSelfAllocationArray

- (QRSelfAllocationArray)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___QRSelfAllocationArray;
  v2 = -[QRSelfAllocationArray init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    allocations = v2->_allocations;
    v2->_allocations = v3;

    v2->_nextIndex = 0;
  }

  return v2;
}

- (id)getAllocation
{
  unsigned int nextIndex = self->_nextIndex;
  if (nextIndex >= -[NSMutableArray count](self->_allocations, "count"))
  {
    v5 = 0LL;
  }

  else
  {
    allocations = self->_allocations;
    ++self->_nextIndex;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](allocations, "objectAtIndex:"));
  }

  return v5;
}

- (void)addAllocation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end