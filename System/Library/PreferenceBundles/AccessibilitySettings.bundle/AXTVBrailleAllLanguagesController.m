@interface AXTVBrailleAllLanguagesController
- (AXTVBrailleAllLanguagesController)initWithTableEnumerator:(id)a3;
- (BOOL)isAddingNewLanguage;
- (BRLTTableEnumerator)tableEnumerator;
- (id)loadSettingGroups;
- (void)setAddingNewLanguage:(BOOL)a3;
- (void)setTableEnumerator:(id)a3;
@end

@implementation AXTVBrailleAllLanguagesController

- (AXTVBrailleAllLanguagesController)initWithTableEnumerator:(id)a3
{
  v4 = (BRLTTableEnumerator *)a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AXTVBrailleAllLanguagesController;
  v5 = -[AXTVBrailleAllLanguagesController init](&v8, "init");
  tableEnumerator = v5->_tableEnumerator;
  v5->_tableEnumerator = v4;

  return v5;
}

- (id)loadSettingGroups
{
  id v35 = [[TSKSettingGroup alloc] initWithTitle:0];
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleAllLanguagesController tableEnumerator](self, "tableEnumerator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 supportedLanguageLocales]);

  v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v45;
    do
    {
      objc_super v8 = 0LL;
      do
      {
        if (*(void *)v45 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 userLocale]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v9 localeIdentifier]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedStringForLanguage:v12 context:3]);

        if (![v13 length])
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleAllLanguagesController tableEnumerator](self, "tableEnumerator"));
          v15 = (void *)objc_opt_class(v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v9 localeIdentifier]);
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v15 localizedNameForLanguageAgnosticTableIdentifier:v16]);

          v13 = (void *)v17;
        }

        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472LL;
        v43[2] = sub_34674;
        v43[3] = &unk_651B0;
        v43[4] = self;
        v43[5] = v9;
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v13,  0LL,  0LL,  0LL,  v43));
        [v37 addObject:v18];

        objc_super v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    }

    while (v6);
  }

  [v37 sortUsingComparator:&stru_66A98];
  [v35 setSettingItems:v37];
  id v34 = [[TSKSettingGroup alloc] initWithTitle:0];
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleAllLanguagesController tableEnumerator](self, "tableEnumerator"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 languageAgnosticTableIdentifiers]);

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v20 count]));
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v22 = v20;
  id v23 = [v22 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v40;
    do
    {
      v26 = 0LL;
      do
      {
        if (*(void *)v40 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v39 + 1) + 8LL * (void)v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleAllLanguagesController tableEnumerator](self, "tableEnumerator"));
        id v29 = [(id)objc_opt_class(v28) localizedNameForLanguageAgnosticTableIdentifier:v27];
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472LL;
        v38[2] = sub_34788;
        v38[3] = &unk_651B0;
        v38[4] = self;
        v38[5] = v27;
        v31 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v30,  0LL,  0LL,  0LL,  v38));
        [v21 addObject:v31];

        v26 = (char *)v26 + 1;
      }

      while (v24 != v26);
      id v24 = [v22 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }

    while (v24);
  }

  [v34 setSettingItems:v21];
  v48[0] = v35;
  v48[1] = v34;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 2LL));

  return v32;
}

- (BRLTTableEnumerator)tableEnumerator
{
  return self->_tableEnumerator;
}

- (void)setTableEnumerator:(id)a3
{
}

- (BOOL)isAddingNewLanguage
{
  return self->_addingNewLanguage;
}

- (void)setAddingNewLanguage:(BOOL)a3
{
  self->_addingNewLanguage = a3;
}

- (void).cxx_destruct
{
}

@end