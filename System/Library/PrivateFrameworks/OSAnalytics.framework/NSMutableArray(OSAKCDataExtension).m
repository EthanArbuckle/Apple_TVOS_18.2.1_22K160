@interface NSMutableArray(OSAKCDataExtension)
- (id)parent;
- (id)pop;
@end

@implementation NSMutableArray(OSAKCDataExtension)

- (id)pop
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 removeLastObject];
  return v2;
}

- (id)parent
{
  unint64_t v2 = [a1 count];
  if (v2 < 2)
  {
    v3 = 0LL;
  }

  else
  {
    [a1 objectAtIndex:v2 - 2];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

@end