@interface NSArray
- (id)describeQHashes;
- (id)filterObjectsUsingBlock:(id)a3;
@end

@implementation NSArray

- (id)filterObjectsUsingBlock:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __49__NSArray_ua_extension__filterObjectsUsingBlock___block_invoke;
  v8[3] = &unk_10013CA98;
  id v9 = a3;
  id v4 = v9;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray indexesOfObjectsPassingTest:](self, "indexesOfObjectsPassingTest:", v8));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectsAtIndexes:](self, "objectsAtIndexes:", v5));

  return v6;
}

- (id)describeQHashes
{
  if (-[NSArray count](self, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v4 = self;
    id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = 0LL;
      uint64_t v8 = *(void *)v13;
      do
      {
        id v9 = 0LL;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend( v3,  "appendFormat:",  @"%x",  objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v9), "unsignedIntValue"));
          id v9 = (char *)v9 + 1;
        }

        while (v6 != v9);
        v7 += (uint64_t)v6;
        id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v6);
    }

    id v10 = v3;
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

uint64_t __49__NSArray_ua_extension__filterObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

@end