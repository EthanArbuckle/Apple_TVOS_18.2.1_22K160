@interface NSArray
- (id)_geo_compactMap:(id)a3;
- (id)_geo_filtered:(id)a3;
- (id)_geo_map:(id)a3;
@end

@implementation NSArray

- (id)_geo_filtered:(id)a3
{
  id v4 = a3;
  if (-[NSArray count](self, "count"))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100039060;
    v8[3] = &unk_100059C78;
    id v9 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v8));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray filteredArrayUsingPredicate:](self, "filteredArrayUsingPredicate:", v5));
  }

  else
  {
    v6 = &__NSArray0__struct;
  }

  return v6;
}

- (id)_geo_map:(id)a3
{
  id v4 = (uint64_t (**)(id, void))a3;
  if (-[NSArray count](self, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[NSArray count](self, "count")));
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    v6 = self;
    id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        v10 = 0LL;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = v4[2](v4, *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10));
          v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          objc_msgSend(v5, "addObject:", v12, (void)v14);

          v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      }

      while (v8);
    }
  }

  else
  {
    v5 = &__NSArray0__struct;
  }

  return v5;
}

- (id)_geo_compactMap:(id)a3
{
  id v4 = (uint64_t (**)(id, void))a3;
  if (-[NSArray count](self, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[NSArray count](self, "count")));
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    v6 = self;
    id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        v10 = 0LL;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = v4[2](v4, *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10));
          v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          if (v12) {
            objc_msgSend(v5, "addObject:", v12, (void)v14);
          }

          v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      }

      while (v8);
    }
  }

  else
  {
    v5 = &__NSArray0__struct;
  }

  return v5;
}

@end