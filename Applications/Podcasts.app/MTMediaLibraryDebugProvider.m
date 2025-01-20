@interface MTMediaLibraryDebugProvider
- (id)debugData;
- (id)debugDataFileName;
@end

@implementation MTMediaLibraryDebugProvider

- (id)debugData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery mt_allItemsForPodcastsApp](&OBJC_CLASS___MPMediaQuery, "mt_allItemsForPodcastsApp"));
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = v2;
  id v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)v7);
        v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTMLMediaItem propertiesForMediaItem](&OBJC_CLASS___MTMLMediaItem, "propertiesForMediaItem"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v10));
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_1000F9D28;
        v17[3] = &unk_100241268;
        v18 = v9;
        v12 = v9;
        [v8 enumerateValuesForProperties:v11 usingBlock:v17];

        -[NSMutableArray addObject:](v3, "addObject:", v12);
        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v5);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMJSONUtil toJSONString:](&OBJC_CLASS___IMJSONUtil, "toJSONString:", v3));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dataUsingEncoding:4]);

  return v14;
}

- (id)debugDataFileName
{
  return @"MediaLibrary.json";
}

@end