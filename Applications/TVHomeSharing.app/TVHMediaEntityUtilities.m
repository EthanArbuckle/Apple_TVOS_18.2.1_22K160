@interface TVHMediaEntityUtilities
+ (id)bestMatchingMediaEntityCollectionForIdentifier:(id)a3 fromMediaEntityCollections:(id)a4;
+ (id)bestMatchingMediaEntityForIdentifier:(id)a3 fromMediaEntities:(id)a4;
+ (id)bestMatchingMediaItemForIdentifier:(id)a3 fromMediaItems:(id)a4;
+ (id)mediaEntitiesByGroupTitleFromGrouping:(id)a3;
+ (id)mediaEntityByIdentifierFromMediaEntities:(id)a3;
+ (id)mediaEntityCollectionByIdentifierFromMediaEntityCollections:(id)a3;
+ (id)mediaEntityCollectionForIdentifier:(id)a3 fromMediaEntityCollections:(id)a4;
+ (id)mediaEntityCollectionsByGroupTitleFromGrouping:(id)a3;
+ (id)mediaEntityForIdentifier:(id)a3 fromMediaEntities:(id)a4;
+ (id)mediaItemByIdentifierFromMediaItems:(id)a3;
+ (id)mediaItemForIdentifier:(id)a3 fromMediaItems:(id)a4;
+ (id)mediaItemsByContributorFromMediaItems:(id)a3;
+ (id)mediaItemsByGroupTitleFromGrouping:(id)a3;
+ (id)mediaItemsByMediaItemTypeFromMediaItems:(id)a3;
+ (id)playerMediaItemsForMediaItems:(id)a3 mediaLibrary:(id)a4;
+ (void)_addMediaItem:(id)a3 withContributors:(id)a4 toDictionary:(id)a5;
@end

@implementation TVHMediaEntityUtilities

+ (id)playerMediaItemsForMediaItems:(id)a3 mediaLibrary:(id)a4
{
  return (id)TVHKPlayerMediaItemsForMediaItems(a3, a4);
}

+ (id)mediaEntityForIdentifier:(id)a3 fromMediaEntities:(id)a4
{
  id v5 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier", (void)v14));
        unsigned int v12 = [v11 isEqual:v5];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

+ (id)mediaItemForIdentifier:(id)a3 fromMediaItems:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 mediaEntityForIdentifier:a3 fromMediaEntities:a4]);
  objc_opt_class(&OBJC_CLASS___TVHKMediaItem);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    id v6 = v4;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

+ (id)mediaEntityCollectionForIdentifier:(id)a3 fromMediaEntityCollections:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 mediaEntityForIdentifier:a3 fromMediaEntities:a4]);
  objc_opt_class(&OBJC_CLASS___TVHKMediaEntityCollection);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    id v6 = v4;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

+ (id)bestMatchingMediaEntityForIdentifier:(id)a3 fromMediaEntities:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 mediaEntityForIdentifier:a3 fromMediaEntities:v6]);
  if (!v7)
  {
    uint64_t v8 = (char *)[v6 count];
    if (v8) {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:v8 - 1]);
    }
    else {
      id v7 = 0LL;
    }
  }

  return v7;
}

+ (id)bestMatchingMediaItemForIdentifier:(id)a3 fromMediaItems:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 bestMatchingMediaEntityForIdentifier:a3 fromMediaEntities:a4]);
  objc_opt_class(&OBJC_CLASS___TVHKMediaItem);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    id v6 = v4;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

+ (id)bestMatchingMediaEntityCollectionForIdentifier:(id)a3 fromMediaEntityCollections:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 bestMatchingMediaEntityForIdentifier:a3 fromMediaEntities:a4]);
  objc_opt_class(&OBJC_CLASS___TVHKMediaEntityCollection);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    id v6 = v4;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

+ (id)mediaEntityByIdentifierFromMediaEntities:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier", (void)v14));
        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v10, v11);
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  id v12 = -[NSMutableDictionary copy](v4, "copy");
  return v12;
}

+ (id)mediaItemByIdentifierFromMediaItems:(id)a3
{
  return [a1 mediaEntityByIdentifierFromMediaEntities:a3];
}

+ (id)mediaEntityCollectionByIdentifierFromMediaEntityCollections:(id)a3
{
  return [a1 mediaEntityByIdentifierFromMediaEntities:a3];
}

+ (id)mediaEntitiesByGroupTitleFromGrouping:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "groups", 0));
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 title]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 mediaEntities]);
        if ([v12 count]) {
          -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v12, v11);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  return v4;
}

+ (id)mediaItemsByGroupTitleFromGrouping:(id)a3
{
  return [a1 mediaEntitiesByGroupTitleFromGrouping:a3];
}

+ (id)mediaEntityCollectionsByGroupTitleFromGrouping:(id)a3
{
  return [a1 mediaEntitiesByGroupTitleFromGrouping:a3];
}

+ (id)mediaItemsByContributorFromMediaItems:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = v4;
  id v22 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 credits]);
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 actors]);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 array]);

        [a1 _addMediaItem:v7 withContributors:v10 toDictionary:v5];
        v11 = (void *)objc_claimAutoreleasedReturnValue([v8 directors]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 array]);

        [a1 _addMediaItem:v7 withContributors:v12 toDictionary:v5];
        v13 = (void *)objc_claimAutoreleasedReturnValue([v8 producers]);
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 array]);

        [a1 _addMediaItem:v7 withContributors:v14 toDictionary:v5];
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v8 screenwriters]);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 array]);

        [a1 _addMediaItem:v7 withContributors:v16 toDictionary:v5];
      }

      id v22 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v22);
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100081BE8;
  v23[3] = &unk_1000FF748;
  v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v17 = v24;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v5, "enumerateKeysAndObjectsUsingBlock:", v23);
  id v18 = -[NSMutableDictionary copy](v17, "copy");

  return v18;
}

+ (id)mediaItemsByMediaItemTypeFromMediaItems:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "type", (void)v18));
        id v12 = [v11 mediaItemType];

        v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v12));
        __int128 v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", v13));

        if (!v14)
        {
          __int128 v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v12));
          -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v14, v15);
        }

        -[NSMutableArray addObject:](v14, "addObject:", v10);
      }

      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v7);
  }

  id v16 = -[NSMutableDictionary copy](v4, "copy");
  return v16;
}

+ (void)_addMediaItem:(id)a3 withContributors:(id)a4 toDictionary:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v8);
        }
        __int128 v14 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if ([v14 length])
        {
          __int128 v15 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v14]);
          if (!v15)
          {
            __int128 v15 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
            [v9 setObject:v15 forKey:v14];
          }

          -[NSMutableOrderedSet addObject:](v15, "addObject:", v7);
        }
      }

      id v11 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v11);
  }
}

@end