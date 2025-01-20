@interface NSMutableArray
- (void)shuffle;
@end

@implementation NSMutableArray

- (void)shuffle
{
  v3 = (char *)-[NSMutableArray count](self, "count");
  if ((unint64_t)v3 >= 2)
  {
    v4 = v3;
    uint64_t v5 = 0LL;
    do
    {
      -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]( self,  "exchangeObjectAtIndex:withObjectAtIndex:",  v5,  v5 + arc4random_uniform((uint32_t)v4));
      ++v5;
      --v4;
    }

    while (v4 != (_BYTE *)&dword_0 + 1);
  }

@end