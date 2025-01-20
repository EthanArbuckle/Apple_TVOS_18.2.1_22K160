@interface MLMultiArray
- (id)convert1dMLMultiArrayToNSArray;
@end

@implementation MLMultiArray

- (id)convert1dMLMultiArrayToNSArray
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MLMultiArray shape](self, "shape"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastObject]);
  v6 = (char *)[v5 unsignedIntegerValue];

  if (v6)
  {
    for (i = 0LL; i != v6; ++i)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MLMultiArray objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", i));
      [v3 addObject:v8];
    }
  }

  return v3;
}

@end