@interface NSArray
- (id)originalElementforElement:(id)a3;
@end

@implementation NSArray

- (id)originalElementforElement:(id)a3
{
  NSUInteger v4 = -[NSArray indexOfObject:](self, "indexOfObject:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    v5 = 0LL;
  }
  else {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self, "objectAtIndex:", v4));
  }
  return v5;
}

@end