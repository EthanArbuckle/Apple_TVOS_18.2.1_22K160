@interface VSTVAppDeveloperSettingsListViewController_tvOS
- (NSArray)listItems;
- (id)loadSettingGroups;
- (void)setListItems:(id)a3;
@end

@implementation VSTVAppDeveloperSettingsListViewController_tvOS

- (id)loadSettingGroups
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSTVAppDeveloperSettingsListViewController_tvOS listItems](self, "listItems"));

  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VSTVAppDeveloperSettingsListViewController_tvOS listItems](self, "listItems", 0LL));
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        v10 = 0LL;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v10),  0LL,  0LL,  0LL));
          -[NSMutableArray addObject:](v5, "addObject:", v11);

          v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v8);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v5));
    -[NSMutableArray addObject:](v3, "addObject:", v12);
  }

  id v13 = -[NSMutableArray copy](v3, "copy");

  return v13;
}

- (void)setListItems:(id)a3
{
}

- (NSArray)listItems
{
  return self->_listItems;
}

- (void).cxx_destruct
{
}

@end