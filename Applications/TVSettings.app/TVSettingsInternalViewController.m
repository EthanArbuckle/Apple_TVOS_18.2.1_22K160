@interface TVSettingsInternalViewController
- (NSMutableSet)loadedBundleNames;
- (id)_loadSettingGroupWithBundlesInDirectory:(id)a3;
- (id)loadSettingGroups;
- (void)setLoadedBundleNames:(id)a3;
@end

@implementation TVSettingsInternalViewController

- (id)loadSettingGroups
{
  v3 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  loadedBundleNames = self->_loadedBundleNames;
  self->_loadedBundleNames = v3;

  id v5 = [(id)GSSystemRootDirectory() stringByAppendingPathComponent:@"AppleInternal/Library/PreferenceBundles/"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsInternalViewController _loadSettingGroupWithBundlesInDirectory:]( self,  "_loadSettingGroupWithBundlesInDirectory:",  v6));
  v10 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));

  return v8;
}

- (id)_loadSettingGroupWithBundlesInDirectory:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v28 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 contentsOfDirectoryAtPath:v4 error:0]);

  v26 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v32;
    uint64_t v27 = *(void *)v32;
    do
    {
      v10 = 0LL;
      id v29 = v8;
      do
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)v10);
        if ((-[NSMutableSet containsObject:](self->_loadedBundleNames, "containsObject:", v11) & 1) == 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue([v28 stringByAppendingPathComponent:v11]);
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v12));
          v14 = (void *)objc_claimAutoreleasedReturnValue([v13 executablePath]);

          if (v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue([v13 infoDictionary]);
            v16 = self;
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tvs_arrayForKey:", @"UIDeviceFamily"));
            unsigned int v18 = [v17 containsObject:&off_1001ACD80];

            self = v16;
            if (v18)
            {
              if ([v13 principalClass]
                && objc_msgSend( objc_msgSend(v13, "principalClass"),  "isSubclassOfClass:",  objc_opt_class(TSKViewController)))
              {
                -[NSMutableSet addObject:](v16->_loadedBundleNames, "addObject:", v11);
                v19 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithBundle:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithBundle:",  v13));
                v20 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
                v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"INTERNAL-%@",  v20));
                [v19 setDeepLinkKey:v21];

                self = v16;
                -[NSMutableArray addObject:](v26, "addObject:", v19);
              }
            }
          }

          id v8 = v29;
          uint64_t v9 = v27;
        }

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v8);
  }

  -[NSMutableArray sortUsingComparator:](v26, "sortUsingComparator:", &stru_10018F758);
  id v22 = -[NSMutableArray count](v26, "count");
  v23 = objc_alloc_init(&OBJC_CLASS___TSKSettingGroup);
  v24 = v23;
  if (v22) {
    -[TSKSettingGroup setSettingItems:](v23, "setSettingItems:", v26);
  }

  return v24;
}

- (NSMutableSet)loadedBundleNames
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setLoadedBundleNames:(id)a3
{
}

- (void).cxx_destruct
{
}

@end