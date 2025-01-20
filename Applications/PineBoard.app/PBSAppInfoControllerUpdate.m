@interface PBSAppInfoControllerUpdate
- (NSSet)pb_addedAppInfoSet;
- (NSSet)pb_removedBundleIDs;
- (NSSet)pb_updatedAppInfoSet;
@end

@implementation PBSAppInfoControllerUpdate

- (NSSet)pb_addedAppInfoSet
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSAppInfoControllerUpdate addedAppInfos](self, "addedAppInfos"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSAppInfoControllerUpdate oldToNewUpdatedAppInfos](self, "oldToNewUpdatedAppInfos"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  (char *)[v3 count] + (void)objc_msgSend(v4, "count")));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 applicationInfo]);

        if (v12) {
          [v5 addObject:v11];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v8);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10009A190;
  v15[3] = &unk_1003D47D8;
  id v13 = v5;
  id v16 = v13;
  objc_msgSend(v4, "bs_each:", v15);

  return (NSSet *)v13;
}

- (NSSet)pb_removedBundleIDs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSAppInfoControllerUpdate removedAppInfos](self, "removedAppInfos"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSAppInfoControllerUpdate oldToNewUpdatedAppInfos](self, "oldToNewUpdatedAppInfos"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  (char *)[v3 count] + (void)objc_msgSend(v4, "count")));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v16 + 1) + 8 * (void)v10) bundleIdentifier]);
        [v5 addObject:v11];

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10009A3AC;
  v14[3] = &unk_1003D47D8;
  id v12 = v5;
  id v15 = v12;
  objc_msgSend(v4, "bs_each:", v14);

  return (NSSet *)v12;
}

- (NSSet)pb_updatedAppInfoSet
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBSAppInfoControllerUpdate oldToNewUpdatedAppInfos](self, "oldToNewUpdatedAppInfos"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10009A4E4;
  v5[3] = &unk_1003D47D8;
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v2 count]));
  id v6 = v3;
  objc_msgSend(v2, "bs_each:", v5);

  return (NSSet *)v3;
}

@end