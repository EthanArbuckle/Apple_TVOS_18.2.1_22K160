@interface NSArray
- (id)flatten;
- (id)shuffle;
@end

@implementation NSArray

- (id)flatten
{
  v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, a2);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v4 = -[NSArray copy](self, "copy");
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v8);
        v10 = (void *)objc_opt_class(v9);
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSArray);
        if (objc_msgSend(v10, "isSubclassOfClass:", v11, (void)v17))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue([v9 flatten]);
          [v3 addObjectsFromArray:v12];
LABEL_13:

          goto LABEL_14;
        }

        if ((objc_opt_respondsToSelector(v9, "allObjects") & 1) != 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue([v9 allObjects]);
LABEL_12:
          v12 = v13;
          v14 = (void *)objc_claimAutoreleasedReturnValue([v13 flatten]);
          [v3 addObjectsFromArray:v14];

          goto LABEL_13;
        }

        if ((objc_opt_respondsToSelector(v9, "allValues") & 1) != 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue([v9 allValues]);
          goto LABEL_12;
        }

        [v3 addObject:v9];
LABEL_14:
        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v15 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      id v6 = v15;
    }

    while (v15);
  }

  return v3;
}

- (id)shuffle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", self));
  v3 = (char *)[v2 count];
  if ((unint64_t)v3 >= 2)
  {
    do
    {
      unint64_t v4 = (unint64_t)(v3 - 1);
      [v2 exchangeObjectAtIndex:v3 - 1 withObjectAtIndex:arc4random_uniform((uint32_t)v3)];
      v3 = (char *)v4;
    }

    while (v4 > 1);
  }

  return v2;
}

@end