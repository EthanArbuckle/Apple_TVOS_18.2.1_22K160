@interface NSArray
- (id)arrayInterspersingSpaceStringsBetweenObjects;
@end

@implementation NSArray

- (id)arrayInterspersingSpaceStringsBetweenObjects
{
  if (-[NSArray count](self, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  2 * -[NSArray count](self, "count") - 1));
    if (-[NSArray count](self, "count"))
    {
      v4 = 0LL;
      do
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", v4));
        [v3 addObject:v5];

        ++v4;
      }

      while (v4 < (char *)-[NSArray count](self, "count"));
    }

    v6 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v3));
  }

  else
  {
    v6 = self;
  }

  return v6;
}

@end