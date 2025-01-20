@interface TVSettingsLocationViewController
- (NSArray)filteredSectionIndexTitles;
- (id)loadSettingGroups;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (void)setFilteredSectionIndexTitles:(id)a3;
- (void)setLocation:(id)a3;
@end

@implementation TVSettingsLocationViewController

- (id)loadSettingGroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsITMSFacade sharedInstance](&OBJC_CLASS___TVSettingsITMSFacade, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 availableLocales]);
  v35 = v2;
  v42 = (void *)objc_claimAutoreleasedReturnValue([v2 locale]);
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v39 = *(void *)v50;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v50 != v39) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 displayName]);
        v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v9,  0LL,  v8,  0LL,  self,  "setLocation:"));

        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472LL;
        v47[2] = sub_10006FB94;
        v47[3] = &unk_10018E608;
        id v48 = v42;
        [v10 setUpdateBlock:v47];
        v11 = (void *)objc_claimAutoreleasedReturnValue( +[UILocalizedIndexedCollation currentCollation]( &OBJC_CLASS___UILocalizedIndexedCollation,  "currentCollation"));
        id v12 = [v11 sectionForObject:v8 collationStringSelector:"displayName"];

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", v13));

        if (v14)
        {
          uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 arrayByAddingObject:v10]);
        }

        else
        {
          v54 = v10;
          uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v54, 1LL));
        }

        v16 = (void *)v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v16, v17);
      }

      id v6 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    }

    while (v6);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v4, "allKeys"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sortedArrayUsingSelector:"compare:"]);

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[UILocalizedIndexedCollation currentCollation]( &OBJC_CLASS___UILocalizedIndexedCollation,  "currentCollation"));
  v40 = (void *)objc_claimAutoreleasedReturnValue([v20 sectionIndexTitles]);

  v21 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v19 count]);
  v38 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v19 count]);
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v36 = v19;
  id v22 = [v36 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v44;
    do
    {
      for (j = 0LL; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v44 != v24) {
          objc_enumerationMutation(v36);
        }
        v26 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)j);
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v26));
        v28 = (void *)objc_claimAutoreleasedReturnValue( +[UILocalizedIndexedCollation currentCollation]( &OBJC_CLASS___UILocalizedIndexedCollation,  "currentCollation"));
        v29 = (void *)objc_claimAutoreleasedReturnValue([v28 sortedArrayFromArray:v27 collationStringSelector:"localizedTitle"]);

        v30 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v29));
        -[NSMutableArray addObject:](v38, "addObject:", v30);

        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectAtIndexedSubscript:", objc_msgSend(v26, "unsignedIntegerValue")));
        -[NSMutableArray addObject:](v21, "addObject:", v31);
      }

      id v23 = [v36 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }

    while (v23);
  }

  v32 = (NSArray *)-[NSMutableArray copy](v21, "copy");
  filteredSectionIndexTitles = self->_filteredSectionIndexTitles;
  self->_filteredSectionIndexTitles = v32;

  return v38;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  return self->_filteredSectionIndexTitles;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  return a5;
}

- (void)setLocation:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsITMSFacade sharedInstance](&OBJC_CLASS___TVSettingsITMSFacade, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 locale]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 representedObject]);

  if (([v6 isEqual:v7] & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v7 displayName]);
    uint64_t v8 = TSKLocString(@"LocationChangeWarningFormat");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v9, v20));

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v10,  0LL,  1LL));
    uint64_t v12 = TSKLocString(@"LocationChangeAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10006FE80;
    v21[3] = &unk_100191580;
    id v22 = v5;
    id v23 = v7;
    uint64_t v24 = self;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  0LL,  v21));
    [v11 addAction:v14];
    uint64_t v15 = TSKLocString(@"SettingsCancel");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v16,  1LL,  0LL));

    [v11 addAction:v17];
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLocationViewController navigationController](self, "navigationController"));
    [v18 dismissViewControllerAnimated:1 completion:0];

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLocationViewController navigationController](self, "navigationController"));
    [v19 presentViewController:v11 animated:1 completion:0];
  }
}

- (NSArray)filteredSectionIndexTitles
{
  return self->_filteredSectionIndexTitles;
}

- (void)setFilteredSectionIndexTitles:(id)a3
{
}

- (void).cxx_destruct
{
}

@end