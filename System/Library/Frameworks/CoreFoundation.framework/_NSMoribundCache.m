@interface _NSMoribundCache
- (BOOL)evictsObjectsWithDiscardedContent;
- (id)delegate;
- (id)name;
- (id)objectForKey:(id)a3;
- (unint64_t)countLimit;
- (unint64_t)retainCount;
- (unint64_t)totalCostLimit;
- (void)dealloc;
@end

@implementation _NSMoribundCache

- (unint64_t)retainCount
{
  return -1LL;
}

- (void)dealloc
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____NSMoribundCache;
  -[NSCache dealloc](&v8, sel_dealloc);
  CFLog(3LL, (uint64_t)@"Deallocating immortal cache!", v2, v3, v4, v5, v6, v7, (uint64_t)v8.receiver);
  __break(1u);
}

- (id)name
{
  return &stru_1899EF170;
}

- (id)delegate
{
  return 0LL;
}

- (id)objectForKey:(id)a3
{
  return 0LL;
}

- (unint64_t)totalCostLimit
{
  return 0LL;
}

- (unint64_t)countLimit
{
  return 0LL;
}

- (BOOL)evictsObjectsWithDiscardedContent
{
  return 0;
}

@end