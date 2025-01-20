@interface NSArray
- (id)subarraysOfSize:(unint64_t)a3;
@end

@implementation NSArray

- (id)subarraysOfSize:(unint64_t)a3
{
  NSUInteger v5 = -[NSArray count](self, "count");
  v6 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v5 / a3 + 1);
  if (v5)
  {
    for (NSUInteger i = 0LL; i < v5; i += v8)
    {
      if (v5 - i >= a3) {
        unint64_t v8 = a3;
      }
      else {
        unint64_t v8 = v5 - i;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray subarrayWithRange:](self, "subarrayWithRange:", i, v8));
      -[NSMutableArray addObject:](v6, "addObject:", v9);
    }
  }

  return v6;
}

@end