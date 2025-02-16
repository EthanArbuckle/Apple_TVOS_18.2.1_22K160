@interface MPMediaQuery
- (id)collectionAtIndex:(unint64_t)a3;
- (id)collectionWithUid:(unint64_t)a3 property:(id)a4;
- (id)itemAtIndex:(unint64_t)a3;
- (id)itemWithUid:(unint64_t)a3;
@end

@implementation MPMediaQuery

- (id)collectionAtIndex:(unint64_t)a3
{
  v5 = -[MPMediaQuery collections];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    v8 = 0LL;
  }

  else
  {
    v7 = -[MPMediaQuery collections];
    v8 = [v7 objectAtIndexedSubscript:a3];
  }

  return v8;
}

- (id)itemAtIndex:(unint64_t)a3
{
  v5 = -[MPMediaQuery items];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    v8 = 0LL;
  }

  else
  {
    v7 = -[MPMediaQuery items];
    v8 = [v7 objectAtIndexedSubscript:a3];
  }

  return v8;
}

- (id)itemWithUid:(unint64_t)a3
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v5 = [+[MPMediaItem propertiesForUid] autorelease];
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * v9);
      id v11 = -[MPMediaQuery copy](self, "copy");
      [v11 setShouldIncludeNonLibraryEntities:1];
      v12 = [NSNumber numberWithUnsignedLongLong:a3];
      v13 = [MPMediaPropertyPredicate predicateWithValue:v12 forProperty:v10];
      [v11 addFilterPredicate:v13];

      v14 = (void *)[v11 items];
      v15 = [v14 firstObject];

      if (v15) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:
    v15 = 0LL;
  }

  return v15;
}

- (id)collectionWithUid:(unint64_t)a3 property:(id)a4
{
  id v6 = a4;
  id v7 = -[MPMediaQuery copy](self, "copy");
  uint64_t v8 = (void *)[NSNumber numberWithUnsignedLongLong:a3];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[MPMediaPropertyPredicate predicateWithValue:forProperty:]( &OBJC_CLASS___MPMediaPropertyPredicate,  "predicateWithValue:forProperty:",  v8,  v6));

  [v7 addFilterPredicate:v9];
  uint64_t v10 = (void *)[v7 collections];
  id v11 = [v10 firstObject];

  return v11;
}

@end