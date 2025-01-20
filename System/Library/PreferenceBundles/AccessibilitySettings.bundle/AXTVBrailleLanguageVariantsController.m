@interface AXTVBrailleLanguageVariantsController
- (AXTVBrailleLanguageVariantsController)initWithTableEnumerator:(id)a3;
- (BOOL)_isSystemBundle:(id)a3;
- (BOOL)_shouldDisableItemForTable:(id)a3;
- (BOOL)isAddingNewLanguage;
- (BOOL)isLanguageAgnostic;
- (BOOL)isModifyingDefaultLanguage;
- (BRLTTable)selectedTable;
- (BRLTTableEnumerator)tableEnumerator;
- (NSLocale)locale;
- (NSString)tableIdentifier;
- (id)_translatorBundlesWithSystemAtFirst;
- (id)loadSettingGroups;
- (int64_t)_indexOfDefaultRotorItem;
- (void)_ensureDefaultRotorItemExists;
- (void)_handleTableItemActivation:(id)a3;
- (void)_popToTopOfBrailleSettings;
- (void)setAddingNewLanguage:(BOOL)a3;
- (void)setLanguageAgnostic:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setModifyingDefaultLanguage:(BOOL)a3;
- (void)setSelectedTable:(id)a3;
- (void)setTableEnumerator:(id)a3;
- (void)setTableIdentifier:(id)a3;
@end

@implementation AXTVBrailleLanguageVariantsController

- (AXTVBrailleLanguageVariantsController)initWithTableEnumerator:(id)a3
{
  v4 = (BRLTTableEnumerator *)a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AXTVBrailleLanguageVariantsController;
  v5 = -[AXTVBrailleLanguageVariantsController init](&v8, "init");
  tableEnumerator = v5->_tableEnumerator;
  v5->_tableEnumerator = v4;

  return v5;
}

- (id)loadSettingGroups
{
  id v33 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue( -[AXTVBrailleLanguageVariantsController _translatorBundlesWithSystemAtFirst]( self,  "_translatorBundlesWithSystemAtFirst"));
  id v35 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v45;
    *(void *)&__int128 v3 = 138412802LL;
    __int128 v31 = v3;
    do
    {
      for (i = 0LL; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v45 != v34) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
        unsigned __int8 v6 = -[AXTVBrailleLanguageVariantsController isLanguageAgnostic](self, "isLanguageAgnostic", v31);
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageVariantsController tableEnumerator](self, "tableEnumerator"));
        if ((v6 & 1) != 0)
        {
          objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageVariantsController tableIdentifier](self, "tableIdentifier"));
          v9 = (void *)objc_claimAutoreleasedReturnValue([v7 languageAgnosticTablesForIdentifier:v8 inBundle:v5]);
        }

        else
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageVariantsController locale](self, "locale"));
          v9 = (void *)objc_claimAutoreleasedReturnValue([v7 tablesForLocale:v10 inBundle:v5]);

          uint64_t v11 = BRLLogTranslation();
          v7 = (void *)objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageVariantsController locale](self, "locale"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageVariantsController locale](self, "locale"));
            v14 = (void *)objc_claimAutoreleasedReturnValue([v13 languageCode]);
            v15 = (void *)objc_claimAutoreleasedReturnValue([v9 debugDescription]);
            *(_DWORD *)buf = v31;
            v50 = v12;
            __int16 v51 = 2112;
            v52 = v14;
            __int16 v53 = 2112;
            v54 = v15;
            _os_log_impl(&dword_0, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "Finding tables for locale %@ %@ %@", buf, 0x20u);
          }
        }

        if ([v9 count])
        {
          v39 = i;
          v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v9 count]));
          v17 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
          uint64_t v18 = objc_claimAutoreleasedReturnValue( +[BRLTTableEnumerator localizedNameForServiceWithIdentifier:]( &OBJC_CLASS___BRLTTableEnumerator,  "localizedNameForServiceWithIdentifier:",  v17));

          v37 = (void *)v18;
          id v19 = [[TSKSettingGroup alloc] initWithTitle:v18];
          [v19 setSortsByTitle:1];
          v36 = v19;
          [v33 addObject:v19];
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          __int128 v40 = 0u;
          __int128 v41 = 0u;
          v38 = v9;
          id v20 = v9;
          id v21 = [v20 countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v41;
            do
            {
              for (j = 0LL; j != v22; j = (char *)j + 1)
              {
                if (*(void *)v41 != v23) {
                  objc_enumerationMutation(v20);
                }
                v25 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)j);
                if (VOSCustomBrailleEnabled())
                {
                  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 replacements]);
                  id v27 = [v26 count];

                  if (v27) {
                    continue;
                  }
                }

                v28 = (void *)objc_claimAutoreleasedReturnValue([v25 localizedName]);
                v29 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v28,  0LL,  v25,  0LL,  self,  "_handleTableItemActivation:"));
                objc_msgSend( v29,  "setEnabled:",  -[AXTVBrailleLanguageVariantsController _shouldDisableItemForTable:]( self,  "_shouldDisableItemForTable:",  v25) ^ 1);
                if (-[AXTVBrailleLanguageVariantsController isModifyingDefaultLanguage]( self,  "isModifyingDefaultLanguage")
                  && ([v29 isEnabled] & 1) == 0)
                {
                  [v29 setAccessoryTypes:2];
                }

                [v16 addObject:v29];
              }

              id v22 = [v20 countByEnumeratingWithState:&v40 objects:v48 count:16];
            }

            while (v22);
          }

          [v36 setSettingItems:v16];
          v9 = v38;
          i = v39;
        }
      }

      id v35 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
    }

    while (v35);
  }

  return v33;
}

- (void)_handleTableItemActivation:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  -[AXTVBrailleLanguageVariantsController _ensureDefaultRotorItemExists](self, "_ensureDefaultRotorItemExists");
  v5 = &AFPreferencesAssistantEnabled_ptr;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 voiceOverBrailleLanguageRotorItems]);
  id v8 = [v7 mutableCopy];

  if (!v8) {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  }
  if (-[AXTVBrailleLanguageVariantsController isModifyingDefaultLanguage](self, "isModifyingDefaultLanguage"))
  {
    int64_t v9 = -[AXTVBrailleLanguageVariantsController _indexOfDefaultRotorItem](self, "_indexOfDefaultRotorItem");
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v10 = v9;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:v9]);
      id v12 = [v11 mutableCopy];

      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"LanguageDefaults"]);
      id v14 = [v13 mutableCopy];

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 userLocale]);

      v17 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 localeIdentifier]);
      [v14 setObject:v17 forKeyedSubscript:v18];

      [v12 setObject:v14 forKeyedSubscript:@"LanguageDefaults"];
      [v8 setObject:v12 atIndexedSubscript:v10];

      v5 = &AFPreferencesAssistantEnabled_ptr;
    }
  }

  else
  {
    v23[0] = @"RotorItem";
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    v23[1] = @"Enabled";
    v24[0] = v19;
    v24[1] = &__kCFBooleanTrue;
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL));

    [v8 addObject:v20];
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v5[247] sharedInstance]);
  [v21 setVoiceOverBrailleLanguageRotorItems:v8];

  uint64_t v22 = BRLLogTranslation();
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEBUG)) {
    sub_3CC84((os_log_s *)v20);
  }
LABEL_10:

  -[AXTVBrailleLanguageVariantsController _popToTopOfBrailleSettings](self, "_popToTopOfBrailleSettings");
}

- (BOOL)_shouldDisableItemForTable:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v5 userLocale]);

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 voiceOverBrailleLanguageRotorItems]);

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v29;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        if (-[AXTVBrailleLanguageVariantsController isModifyingDefaultLanguage](self, "isModifyingDefaultLanguage")
          && (v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"Default"]),
              unsigned int v14 = [v13 BOOLValue],
              v13,
              v14)
          || (v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"Default"]),
              unsigned int v16 = [v15 BOOLValue],
              v15,
              v16))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"LanguageDefaults"]);
          uint64_t v18 = objc_claimAutoreleasedReturnValue([v27 localeIdentifier]);
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v18]);

          id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
          LOBYTE(v18) = [v20 isEqualToString:v19];

          if ((v18 & 1) != 0) {
            goto LABEL_15;
          }
        }

        else
        {
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"RotorItem"]);
          int v23 = [v21 isEqualToString:v22];

          if ((v23 & 1) != 0)
          {
LABEL_15:
            BOOL v24 = 1;
            goto LABEL_16;
          }
        }
      }

      id v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  BOOL v24 = 0;
LABEL_16:

  return v24;
}

- (int64_t)_indexOfDefaultRotorItem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  __int128 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 voiceOverBrailleLanguageRotorItems]);

  if (v3) {
    int64_t v4 = (int64_t)[v3 indexOfObjectPassingTest:&stru_655F0];
  }
  else {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (void)_ensureDefaultRotorItemExists
{
  if (-[AXTVBrailleLanguageVariantsController _indexOfDefaultRotorItem](self, "_indexOfDefaultRotorItem") == 0x7FFFFFFFFFFFFFFFLL)
  {
    __int128 v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    int64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 voiceOverBrailleLanguageRotorItems]);
    id v5 = [v4 mutableCopy];

    if (!v5) {
      id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    }
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userLocale]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageVariantsController tableEnumerator](self, "tableEnumerator"));
    id v9 = [(id)objc_opt_class(v8) defaultTableForLocale:v7];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 localeIdentifier]);
    uint64_t v18 = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    id v19 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));

    v16[0] = @"Enabled";
    v16[1] = @"Default";
    v17[0] = &__kCFBooleanTrue;
    v17[1] = &__kCFBooleanTrue;
    v16[2] = @"LanguageDefaults";
    v17[2] = v13;
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  3LL));
    [v5 insertObject:v14 atIndex:0];
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v15 setVoiceOverBrailleLanguageRotorItems:v5];
  }

- (void)_popToTopOfBrailleSettings
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageVariantsController navigationController](self, "navigationController", 0LL));
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 viewControllers]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 reverseObjectEnumerator]);

  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___AXTVBrailleLanguageController);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }

    id v12 = v10;

    if (!v12) {
      return;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageVariantsController navigationController](self, "navigationController"));
    id v14 = [v13 popToViewController:v12 animated:1];

    id v5 = v12;
  }

- (id)_translatorBundlesWithSystemAtFirst
{
  __int128 v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageVariantsController tableEnumerator](self, "tableEnumerator"));
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 translatorBundles]);

  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (-[AXTVBrailleLanguageVariantsController _isSystemBundle:](self, "_isSystemBundle:", v12, (void)v15)) {
          v13 = v5;
        }
        else {
          v13 = v6;
        }
        -[NSMutableArray addObject:](v13, "addObject:", v12);
      }

      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }

  -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v6);
  return v5;
}

- (BOOL)_isSystemBundle:(id)a3
{
  id v3 = a3;
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  unsigned __int8 v5 = [v4 isEqualToString:@"com.apple.scrod.braille.table.duxbury"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  LOBYTE(v3) = [v6 isEqualToString:@"com.apple.scrod.braille.table.apple"];

  return v5 | v3;
}

- (BRLTTableEnumerator)tableEnumerator
{
  return self->_tableEnumerator;
}

- (void)setTableEnumerator:(id)a3
{
}

- (BRLTTable)selectedTable
{
  return self->_selectedTable;
}

- (void)setSelectedTable:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSString)tableIdentifier
{
  return self->_tableIdentifier;
}

- (void)setTableIdentifier:(id)a3
{
}

- (BOOL)isModifyingDefaultLanguage
{
  return self->_modifyingDefaultLanguage;
}

- (void)setModifyingDefaultLanguage:(BOOL)a3
{
  self->_modifyingDefaultLanguage = a3;
}

- (BOOL)isAddingNewLanguage
{
  return self->_addingNewLanguage;
}

- (void)setAddingNewLanguage:(BOOL)a3
{
  self->_addingNewLanguage = a3;
}

- (BOOL)isLanguageAgnostic
{
  return self->_languageAgnostic;
}

- (void)setLanguageAgnostic:(BOOL)a3
{
  self->_languageAgnostic = a3;
}

- (void).cxx_destruct
{
}

@end