@interface NSArray
- (id)objectAtIndexOrNull:(unint64_t)a3;
@end

@implementation NSArray

- (id)objectAtIndexOrNull:(unint64_t)a3
{
  if (-[NSArray count](self, "count") <= a3)
  {
    id v8 = 0LL;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self, "objectAtIndex:", a3));
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectEnumerator]);
      id v8 = (id)objc_claimAutoreleasedReturnValue([v7 nextObject]);
    }

    else
    {
      id v8 = v5;
    }
  }

  return v8;
}

@end