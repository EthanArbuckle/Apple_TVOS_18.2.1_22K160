@interface AXTVMultiLanguageChooserViewController
+ (id)localizedNameForLanguageIdentifier:(id)a3;
- (AXTVMultiLanguageChooserViewController)initWithCoder:(id)a3;
- (AXTVMultiLanguageChooserViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AXTVMultiLanguageChooserViewController)initWithSelectedLanguages:(id)a3;
- (AXTVMultiLanguageChooserViewController)initWithStyle:(int64_t)a3;
- (NSMutableArray)selectedLanguages;
- (id)loadSettingGroups;
- (id)willFinsishWithSelectedLanguagesHandler;
- (void)_allLanguagesItemSelected:(id)a3;
- (void)_languageItemSelected:(id)a3;
- (void)setSelectedLanguages:(id)a3;
- (void)setWillFinsishWithSelectedLanguagesHandler:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AXTVMultiLanguageChooserViewController

- (AXTVMultiLanguageChooserViewController)initWithSelectedLanguages:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AXTVMultiLanguageChooserViewController;
  v5 = -[AXTVMultiLanguageChooserViewController initWithStyle:](&v9, "initWithStyle:", 1LL);
  if (v5)
  {
    if (v4) {
      id v6 = [v4 mutableCopy];
    }
    else {
      id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    }
    v7 = v6;
    -[AXTVMultiLanguageChooserViewController setSelectedLanguages:](v5, "setSelectedLanguages:", v6);
  }

  return v5;
}

- (AXTVMultiLanguageChooserViewController)initWithStyle:(int64_t)a3
{
  return -[AXTVMultiLanguageChooserViewController initWithSelectedLanguages:](self, "initWithSelectedLanguages:", 0LL);
}

- (AXTVMultiLanguageChooserViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[AXTVMultiLanguageChooserViewController initWithSelectedLanguages:]( self,  "initWithSelectedLanguages:",  0LL,  a4);
}

- (AXTVMultiLanguageChooserViewController)initWithCoder:(id)a3
{
  return -[AXTVMultiLanguageChooserViewController initWithSelectedLanguages:](self, "initWithSelectedLanguages:", 0LL);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AXTVMultiLanguageChooserViewController;
  -[AXTVMultiLanguageChooserViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  if (-[AXTVMultiLanguageChooserViewController isMovingFromParentViewController]( self,  "isMovingFromParentViewController"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVMultiLanguageChooserViewController willFinsishWithSelectedLanguagesHandler]( self,  "willFinsishWithSelectedLanguagesHandler"));

    if (v4)
    {
      v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[AXTVMultiLanguageChooserViewController willFinsishWithSelectedLanguagesHandler]( self,  "willFinsishWithSelectedLanguagesHandler"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVMultiLanguageChooserViewController selectedLanguages](self, "selectedLanguages"));
      ((void (**)(void, void *))v5)[2](v5, v6);
    }
  }

- (id)loadSettingGroups
{
  id v26 = [[TSKSettingGroup alloc] initWithTitle:0];
  v2 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v10 = AXTVLocString(@"AXSpeechPronunciationLanguageAllOption", v3, v4, v5, v6, v7, v8, v9, v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v11,  0LL,  0LL,  0LL,  self,  "_allLanguagesItemSelected:"));

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_23CF4;
  v35[3] = &unk_65798;
  objc_copyWeak(&v36, &location);
  [v24 setUpdateBlock:v35];
  -[NSMutableArray addObject:](v2, "addObject:", v24);
  [v26 setSettingItems:v2];
  id v25 = [[TSKSettingGroup alloc] initWithTitle:0];
  v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);

  uint64_t v13 = AXLanguagesAvailableForPronuncationEditor();
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(v13);
  id v14 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:0]);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:1]);
        v20 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v19,  0LL,  v18,  0LL,  self,  "_languageItemSelected:"));
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472LL;
        v29[2] = sub_23D5C;
        v29[3] = &unk_65798;
        objc_copyWeak(&v30, &location);
        [v20 setUpdateBlock:v29];
        -[NSMutableArray addObject:](v12, "addObject:", v20);
        objc_destroyWeak(&v30);
      }

      id v14 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }

    while (v14);
  }

  [v25 setSettingItems:v12];
  v38[0] = v26;
  v38[1] = v25;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 2LL));

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
  return v21;
}

- (void)_allLanguagesItemSelected:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVMultiLanguageChooserViewController selectedLanguages](self, "selectedLanguages", a3));
  [v4 removeAllObjects];

  -[AXTVMultiLanguageChooserViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

- (void)_languageItemSelected:(id)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVMultiLanguageChooserViewController selectedLanguages](self, "selectedLanguages"));
  unsigned int v5 = [v4 containsObject:v8];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVMultiLanguageChooserViewController selectedLanguages](self, "selectedLanguages"));
  uint64_t v7 = v6;
  if (v5) {
    [v6 removeObject:v8];
  }
  else {
    [v6 addObject:v8];
  }

  -[AXTVMultiLanguageChooserViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

+ (id)localizedNameForLanguageIdentifier:(id)a3
{
  id v3 = a3;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 langMaps]);

  id obj = v5;
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dialects]);
        id v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v22;
LABEL_8:
          uint64_t v15 = 0LL;
          while (1)
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue([v16 specificLanguageID]);

            if (v13 == (id)++v15)
            {
              id v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
              if (v13) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }

          v18 = (void *)objc_claimAutoreleasedReturnValue([v16 languageNameAndLocaleInCurrentLocale]);

          if (v18) {
            goto LABEL_19;
          }
        }

        else
        {
LABEL_14:
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }

    while (v7);
  }

  v18 = 0LL;
LABEL_19:

  return v18;
}

- (id)willFinsishWithSelectedLanguagesHandler
{
  return self->_willFinsishWithSelectedLanguagesHandler;
}

- (void)setWillFinsishWithSelectedLanguagesHandler:(id)a3
{
}

- (NSMutableArray)selectedLanguages
{
  return self->_selectedLanguages;
}

- (void)setSelectedLanguages:(id)a3
{
}

- (void).cxx_destruct
{
}

@end