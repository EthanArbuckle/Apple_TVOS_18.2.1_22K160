@interface TVSettingsRestrictionsRegionViewController
- (NSArray)filteredSectionIndexTitles;
- (id)_contentFilterRegionFormatter;
- (id)loadSettingGroups;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (void)dealloc;
- (void)setCountryCode:(id)a3;
- (void)setFilteredSectionIndexTitles:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsRestrictionsRegionViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsRestrictionsRegionViewController;
  -[TVSettingsRestrictionsRegionViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSRestrictionsDataProvider sharedInstance]( &OBJC_CLASS___TVCSRestrictionsDataProvider,  "sharedInstance"));
  [v3 addObserver:self];
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSRestrictionsDataProvider sharedInstance]( &OBJC_CLASS___TVCSRestrictionsDataProvider,  "sharedInstance"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsRestrictionsRegionViewController;
  -[TVSettingsRestrictionsRegionViewController dealloc](&v4, "dealloc");
}

- (id)loadSettingGroups
{
  v52 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsRestrictionsRegionViewController _contentFilterRegionFormatter]( self,  "_contentFilterRegionFormatter"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[PBSRestrictionsSettings sharedInstance](&OBJC_CLASS___PBSRestrictionsSettings, "sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSRestrictionsDataProvider sharedInstance]( &OBJC_CLASS___TVCSRestrictionsDataProvider,  "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  0LL,  0LL,  v2,  @"isLoadingContentRestrictions"));
  [v3 setAccessoryTypes:4];
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472LL;
  v64[2] = sub_10002F7D0;
  v64[3] = &unk_10018E608;
  id v4 = v2;
  id v65 = v4;
  [v3 setUpdateBlock:v64];
  v44 = v3;
  v69 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v69, 1LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v5));

  v43 = v6;
  [v6 setAutoHide:1];
  v50 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 availableContentRestrictionCountryCodes]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);

  v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v48 = *(void *)v61;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v61 != v48) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v52 stringForObjectValue:v13]);
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v14,  0LL,  v13,  0LL,  self,  "setCountryCode:"));
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472LL;
        v58[2] = sub_10002F814;
        v58[3] = &unk_10018E608;
        id v16 = v51;
        id v59 = v16;
        [v15 setUpdateBlock:v58];
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 contentRestrictionsCountryCode]);
        LODWORD(v13) = [v13 isEqual:v17];

        if ((_DWORD)v13) {
          -[TVSettingsRestrictionsRegionViewController _setInitialFocusedSettingItem:]( self,  "_setInitialFocusedSettingItem:",  v15);
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[UILocalizedIndexedCollation currentCollation]( &OBJC_CLASS___UILocalizedIndexedCollation,  "currentCollation"));
        id v19 = [v18 sectionForObject:v15 collationStringSelector:"localizedTitle"];

        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v19));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v9, "objectForKey:", v20));

        if (v21)
        {
          uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 arrayByAddingObject:v15]);
        }

        else
        {
          v67 = v15;
          uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v67, 1LL));
        }

        v23 = (void *)v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v19));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v23, v24);
      }

      id v11 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
    }

    while (v11);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v9, "allKeys"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 sortedArrayUsingSelector:"compare:"]);

  v27 = (void *)objc_claimAutoreleasedReturnValue( +[UILocalizedIndexedCollation currentCollation]( &OBJC_CLASS___UILocalizedIndexedCollation,  "currentCollation"));
  v49 = (void *)objc_claimAutoreleasedReturnValue([v27 sectionIndexTitles]);

  v47 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v26 count]);
  v28 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v26 count]);
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id v45 = v26;
  id v29 = [v45 countByEnumeratingWithState:&v54 objects:v66 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v55;
    do
    {
      for (j = 0LL; j != v30; j = (char *)j + 1)
      {
        if (*(void *)v55 != v31) {
          objc_enumerationMutation(v45);
        }
        v33 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)j);
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v33));
        v35 = (void *)objc_claimAutoreleasedReturnValue( +[UILocalizedIndexedCollation currentCollation]( &OBJC_CLASS___UILocalizedIndexedCollation,  "currentCollation"));
        v36 = (void *)objc_claimAutoreleasedReturnValue([v35 sortedArrayFromArray:v34 collationStringSelector:"localizedTitle"]);

        v37 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v36));
        objc_msgSend(v37, "setHidden:", objc_msgSend(v50, "isLoadingContentRestrictions"));
        -[NSMutableArray addObject:](v28, "addObject:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectAtIndexedSubscript:", objc_msgSend(v33, "unsignedIntegerValue")));
        -[NSMutableArray addObject:](v47, "addObject:", v38);
      }

      id v30 = [v45 countByEnumeratingWithState:&v54 objects:v66 count:16];
    }

    while (v30);
  }

  v39 = (NSArray *)-[NSMutableArray copy](v47, "copy");
  filteredSectionIndexTitles = self->_filteredSectionIndexTitles;
  self->_filteredSectionIndexTitles = v39;

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray arrayByAddingObject:](v28, "arrayByAddingObject:", v43));
  return v41;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  return self->_filteredSectionIndexTitles;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  return a5;
}

- (void)setCountryCode:(id)a3
{
  id v3 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[TVCSRestrictionsDataProvider sharedInstance]( &OBJC_CLASS___TVCSRestrictionsDataProvider,  "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 contentRestrictionsCountryCode]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 representedObject]);
}

- (id)_contentFilterRegionFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_10018FC58];
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