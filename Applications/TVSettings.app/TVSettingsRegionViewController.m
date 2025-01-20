@interface TVSettingsRegionViewController
- (NSArray)filteredSectionIndexTitles;
- (NSString)selectedRegion;
- (PLSInternationalizationSettings)intlSettings;
- (TVSettingsRegionViewController)init;
- (id)_localeFormatter;
- (id)loadSettingGroups;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (void)dealloc;
- (void)handleAlertAction:(BOOL)a3;
- (void)setFilteredSectionIndexTitles:(id)a3;
- (void)setIntlSettings:(id)a3;
- (void)setRegion:(id)a3;
- (void)setSelectedRegion:(id)a3;
@end

@implementation TVSettingsRegionViewController

- (TVSettingsRegionViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsRegionViewController;
  v2 = -[TVSettingsRegionViewController init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___PLSInternationalizationSettings);
    intlSettings = v2->_intlSettings;
    v2->_intlSettings = v3;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsRegionViewController;
  -[TVSettingsRegionViewController dealloc](&v3, "dealloc");
}

- (id)loadSettingGroups
{
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRegionViewController _localeFormatter](self, "_localeFormatter"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsDeviceFacade sharedInstance](&OBJC_CLASS___TVSettingsDeviceFacade, "sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v42 availableLocales]);
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id obj = v2;
  id v4 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v40 = *(void *)v52;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v52 != v40) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue([v43 stringForObjectValue:v7]);
        v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v8,  0LL,  v7,  0LL,  self,  "setRegion:"));
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472LL;
        v49[2] = sub_10004DA78;
        v49[3] = &unk_10018E608;
        id v10 = v42;
        id v50 = v10;
        [v9 setUpdateBlock:v49];
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currentLocale]);
        LODWORD(v7) = [v7 isEqual:v11];

        if ((_DWORD)v7) {
          -[TVSettingsRegionViewController _setInitialFocusedSettingItem:](self, "_setInitialFocusedSettingItem:", v9);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[UILocalizedIndexedCollation currentCollation]( &OBJC_CLASS___UILocalizedIndexedCollation,  "currentCollation"));
        id v13 = [v12 sectionForObject:v9 collationStringSelector:"localizedTitle"];

        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v13));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v3, "objectForKey:", v14));

        if (v15)
        {
          uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 arrayByAddingObject:v9]);
        }

        else
        {
          v56 = v9;
          uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v56, 1LL));
        }

        v17 = (void *)v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v13));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v17, v18);
      }

      id v5 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }

    while (v5);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v3, "allKeys"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 sortedArrayUsingSelector:"compare:"]);

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[UILocalizedIndexedCollation currentCollation]( &OBJC_CLASS___UILocalizedIndexedCollation,  "currentCollation"));
  v41 = (void *)objc_claimAutoreleasedReturnValue([v21 sectionIndexTitles]);

  v39 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v20 count]);
  v22 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v20 count]);
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v37 = v20;
  id v23 = [v37 countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v46;
    do
    {
      for (j = 0LL; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v46 != v25) {
          objc_enumerationMutation(v37);
        }
        v27 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)j);
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v27));
        v29 = (void *)objc_claimAutoreleasedReturnValue( +[UILocalizedIndexedCollation currentCollation]( &OBJC_CLASS___UILocalizedIndexedCollation,  "currentCollation"));
        v30 = (void *)objc_claimAutoreleasedReturnValue([v29 sortedArrayFromArray:v28 collationStringSelector:"localizedTitle"]);

        v31 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v30));
        -[NSMutableArray addObject:](v22, "addObject:", v31);

        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectAtIndexedSubscript:", objc_msgSend(v27, "unsignedIntegerValue")));
        -[NSMutableArray addObject:](v39, "addObject:", v32);
      }

      id v24 = [v37 countByEnumeratingWithState:&v45 objects:v55 count:16];
    }

    while (v24);
  }

  v33 = (NSArray *)-[NSMutableArray copy](v39, "copy");
  filteredSectionIndexTitles = self->_filteredSectionIndexTitles;
  self->_filteredSectionIndexTitles = v33;

  id v35 = -[NSMutableArray copy](v22, "copy");
  return v35;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  return self->_filteredSectionIndexTitles;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  return a5;
}

- (void)setRegion:(id)a3
{
  id v50 = a3;
  __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsDeviceFacade sharedInstance](&OBJC_CLASS___TVSettingsDeviceFacade, "sharedInstance"));
  v49 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSPreferredLanguagesManager sharedInstance]( &OBJC_CLASS___TVCSPreferredLanguagesManager,  "sharedInstance"));
  __int128 v52 = (void *)objc_claimAutoreleasedReturnValue([v51 currentLocale]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v50 representedObject]);
  -[TVSettingsRegionViewController setSelectedRegion:](self, "setSelectedRegion:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v49 preferredLanguages]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale componentsFromLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "componentsFromLocaleIdentifier:",  v6));
  __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:NSLocaleCountryCode]);

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale languageFromLanguage:byReplacingRegion:]( &OBJC_CLASS___NSLocale,  "languageFromLanguage:byReplacingRegion:",  v6,  v4));
  uint64_t v9 = ((uint64_t (*)(void))TVCSLanguageLog)();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Request to change region", buf, 2u);
  }

  unsigned __int8 v11 = [v52 isEqual:v4];
  uint64_t v12 = ((uint64_t (*)(void))TVCSLanguageLog)();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if ((v11 & 1) != 0)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Old and new regions are the same – nothing to do",  buf,  2u);
    }
  }

  else
  {
    if (v14)
    {
      *(_DWORD *)buf = 138543618;
      v65 = v52;
      __int16 v66 = 2114;
      v67 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Old region: %{public}@; New region: %{public}@",
        buf,
        0x16u);
    }

    id inited = objc_initWeak(&location, self);
    uint64_t v16 = TVCSLanguageLog(inited);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v65 = v6;
      __int16 v66 = 2114;
      v67 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Old language: %{public}@; New language: %{public}@",
        buf,
        0x16u);
    }

    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSLocale renderableUILanguages](&OBJC_CLASS___NSLocale, "renderableUILanguages"));
    v19 = (void *)v18;
    __int128 v47 = (void *)v18;
    if (v48
      && (uint64_t v18 = (uint64_t)[(id)v18 containsObject:v6], (_DWORD)v18)
      && (uint64_t v18 = (uint64_t)[v19 containsObject:v8], (_DWORD)v18)
      && (uint64_t v18 = (uint64_t)[v8 isEqual:v6], (v18 & 1) == 0))
    {
      uint64_t v37 = TVCSLanguageLog(v18);
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v65 = v8;
        __int16 v66 = 2114;
        v67 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "New language %{public}@ is a notable variant of %{public}@ – ask user",  buf,  0x16u);
      }

      uint64_t v39 = TSKLocString(@"LanguageSystemLanguageChangeFormat");
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale string:withCapitalizedDisplayNamesForFirstLanguageIdentifier:]( &OBJC_CLASS___NSLocale,  "string:withCapitalizedDisplayNamesForFirstLanguageIdentifier:",  v40,  v8,  0LL));

      uint64_t v41 = TSKLocString(@"LanguageAddNewLanguageActionChange");
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale string:withCapitalizedDisplayNamesForFirstLanguageIdentifier:]( &OBJC_CLASS___NSLocale,  "string:withCapitalizedDisplayNamesForFirstLanguageIdentifier:",  v42,  v8,  0LL));

      uint64_t v43 = TSKLocString(@"LanguageAddNewLanguageActionKeep");
      v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale string:withCapitalizedDisplayNamesForFirstLanguageIdentifier:]( &OBJC_CLASS___NSLocale,  "string:withCapitalizedDisplayNamesForFirstLanguageIdentifier:",  v44,  v6,  0LL));

      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v24,  0LL,  1LL));
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472LL;
      v61[2] = sub_10004E388;
      v61[3] = &unk_10018F4E8;
      v30 = &v62;
      objc_copyWeak(&v62, &location);
      __int128 v45 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v27,  0LL,  v61));
      -[os_log_s addAction:](v13, "addAction:", v45);

      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472LL;
      v59[2] = sub_10004E3B8;
      v59[3] = &unk_10018F4E8;
      objc_copyWeak(&v60, &location);
      __int128 v46 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v29,  0LL,  v59));
      -[os_log_s addAction:](v13, "addAction:", v46);

      objc_destroyWeak(&v60);
    }

    else
    {
      uint64_t v20 = TVCSLanguageLog(v18);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v65 = v8;
        __int16 v66 = 2114;
        v67 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "New language %{public}@ is not a notable variant of %{public}@",  buf,  0x16u);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale _deviceLanguage](&OBJC_CLASS___NSLocale, "_deviceLanguage"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  v22));
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 localizedStringForRegion:v4 context:5 short:0]);

      uint64_t v25 = TSKLocString(@"RegionChangeWarningFormat");
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v26, v24));

      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v27,  0LL,  1LL));
      uint64_t v28 = TSKLocString(@"RegionChangeAction");
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472LL;
      v55[2] = sub_10004E3E8;
      v55[3] = &unk_100190890;
      v30 = &v58;
      objc_copyWeak(&v58, &location);
      id v56 = v8;
      id v57 = v6;
      v31 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v29,  0LL,  v55));
      -[os_log_s addAction:](v13, "addAction:", v31);
    }

    objc_destroyWeak(v30);

    uint64_t v32 = TSKLocString(@"SettingsCancel");
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472LL;
    v53[2] = sub_10004E430;
    v53[3] = &unk_10018F4E8;
    objc_copyWeak(&v54, &location);
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v33,  1LL,  v53));

    -[os_log_s addAction:](v13, "addAction:", v34);
    id v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRegionViewController navigationController](self, "navigationController"));
    [v35 dismissViewControllerAnimated:1 completion:0];

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRegionViewController navigationController](self, "navigationController"));
    [v36 presentViewController:v13 animated:1 completion:0];

    objc_destroyWeak(&v54);
    objc_destroyWeak(&location);
  }
}

- (id)_localeFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_1001908B0];
}

- (void)handleAlertAction:(BOOL)a3
{
  BOOL v3 = a3;
  if (_os_feature_enabled_impl("PineBoard", "UserProfileLanguages"))
  {
    objc_initWeak(&location, self);
    intlSettings = self->_intlSettings;
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRegionViewController selectedRegion](self, "selectedRegion"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10004E6B4;
    v13[3] = &unk_10018F430;
    objc_copyWeak(&v14, &location);
    -[PLSInternationalizationSettings setDeviceRegion:changePrimaryLanguage:completion:]( intlSettings,  "setDeviceRegion:changePrimaryLanguage:completion:",  v6,  v3,  v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  else
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue( +[TVCSPreferredLanguagesManager sharedInstance]( &OBJC_CLASS___TVCSPreferredLanguagesManager,  "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v12 preferredLanguages]);
    id v8 = [v7 copy];

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRegionViewController selectedRegion](self, "selectedRegion"));
    [v12 setRegion:v9 updateFirstLanguage:v3];
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v12 preferredLanguages]);
    unsigned __int8 v11 = [v10 isEqual:v8];
    +[NSLocale setLocaleAfterRegionChange:](&OBJC_CLASS___NSLocale, "setLocaleAfterRegionChange:", v9);
    if ((v11 & 1) != 0)
    {
      -[TVSettingsRegionViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
    }

    else
    {
      [v12 applyInputModesChanges];
      [v12 applyPreferredLanguagesChanges];
    }
  }

- (NSArray)filteredSectionIndexTitles
{
  return self->_filteredSectionIndexTitles;
}

- (void)setFilteredSectionIndexTitles:(id)a3
{
}

- (NSString)selectedRegion
{
  return self->_selectedRegion;
}

- (void)setSelectedRegion:(id)a3
{
}

- (PLSInternationalizationSettings)intlSettings
{
  return self->_intlSettings;
}

- (void)setIntlSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end