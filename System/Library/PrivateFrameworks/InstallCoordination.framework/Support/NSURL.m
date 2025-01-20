@interface NSURL
- (id)urlByAppendingPathComponents:(id)a3 lastIsDirectory:(BOOL)a4;
@end

@implementation NSURL

- (id)urlByAppendingPathComponents:(id)a3 lastIsDirectory:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = objc_autoreleasePoolPush();
  v8 = self;
  v9 = (char *)[v6 count];
  if (v9)
  {
    v10 = v9 - 1;
    if (v9 == (char *)1)
    {
      v13 = v8;
    }

    else
    {
      v11 = 0LL;
      do
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v11]);
        v13 = (NSURL *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:isDirectory:]( v8,  "URLByAppendingPathComponent:isDirectory:",  v12,  1LL));

        ++v11;
        v8 = v13;
      }

      while (v10 != v11);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v10]);
    v8 = (NSURL *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:isDirectory:]( v13,  "URLByAppendingPathComponent:isDirectory:",  v14,  v4));
  }

  v15 = v8;

  objc_autoreleasePoolPop(v7);
  return v15;
}

@end