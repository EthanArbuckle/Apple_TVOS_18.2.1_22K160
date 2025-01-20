@interface TVSettingsLanguageViewController
- (BOOL)markSystemLanguage;
- (NSArray)languageFilter;
- (TSKPreviewViewController)languagePreviewViewController;
- (TVSettingsLanguageViewController)initWithStyle:(int64_t)a3;
- (id)_languageFormatter;
- (id)_localizedLanguageFormatter;
- (id)languageSelectionHandler;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)setLanguage:(id)a3;
- (void)setLanguageFilter:(id)a3;
- (void)setLanguageSelectionHandler:(id)a3;
- (void)setMarkSystemLanguage:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsLanguageViewController

- (TVSettingsLanguageViewController)initWithStyle:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsLanguageViewController;
  result = -[TVSettingsLanguageViewController initWithStyle:](&v4, "initWithStyle:", a3);
  if (result) {
    result->_markSystemLanguage = 1;
  }
  return result;
}

- (void)setLanguageFilter:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4 && [v4 count])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSInternationalization availableSystemLanguages]( &OBJC_CLASS___TVSInternationalization,  "availableSystemLanguages"));
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue( +[NSLocale matchedLanguagesFromAvailableLanguages:forPreferredLanguages:]( &OBJC_CLASS___NSLocale,  "matchedLanguagesFromAvailableLanguages:forPreferredLanguages:",  v5,  v8));
  }

  else
  {
    v6 = 0LL;
  }

  languageFilter = self->_languageFilter;
  self->_languageFilter = v6;
}

- (id)loadSettingGroups
{
  v19 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLanguageViewController _languageFormatter](self, "_languageFormatter"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLanguageViewController _localizedLanguageFormatter](self, "_localizedLanguageFormatter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSInternationalization availableSystemLanguages]( &OBJC_CLASS___TVSInternationalization,  "availableSystemLanguages"));
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
        if (!-[NSArray containsObject:](self->_languageFilter, "containsObject:", v8))
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue([v18 stringForObjectValue:v8]);
          v10 = (void *)objc_claimAutoreleasedReturnValue([v17 stringForObjectValue:v8]);
          v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v9,  0LL,  v8,  0LL,  self,  "setLanguage:"));
          unsigned __int8 v12 = -[TVSettingsLanguageViewController markSystemLanguage](self, "markSystemLanguage");
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472LL;
          v20[2] = sub_100090770;
          v20[3] = &unk_1001912B8;
          unsigned __int8 v22 = v12;
          id v21 = v10;
          id v13 = v10;
          [v11 setUpdateBlock:v20];
          -[NSMutableArray addObject:](v19, "addObject:", v11);
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v5);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v19));
  v27 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));

  return v15;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsLanguageViewController;
  -[TVSettingsLanguageViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLanguageViewController tableView](self, "tableView"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TSKTableViewSubtitleTextCell);
  id v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___TSKTableViewSubtitleTextCell);
  uint64_t v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 registerClass:v4 forCellReuseIdentifier:v7];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = (objc_class *)objc_opt_class(&OBJC_CLASS___TSKTableViewSubtitleTextCell);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithIdentifier:v10 forIndexPath:v6]);

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsLanguageViewController settingGroupAtIndex:]( self,  "settingGroupAtIndex:",  [v6 section]));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLanguageViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v6));
  if (v13)
  {
    [v11 settingItem:v13 didUpdateMetadataWithGroup:v12];
    [v13 setDirty:0];
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    v16 = "-[TVSettingsLanguageViewController tableView:cellForRowAtIndexPath:]";
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: Setting item could not be found at index path. Will return empty cell. Index Path: %{public}@.",  (uint8_t *)&v15,  0x16u);
  }

  return v11;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLanguageViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", a3));
  languagePreviewViewController = self->_languagePreviewViewController;
  if (!languagePreviewViewController)
  {
    id v6 = objc_alloc(&OBJC_CLASS___TSKVibrantImageView);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsUtilities languageImage](&OBJC_CLASS___TVSettingsUtilities, "languageImage"));
    id v8 = [v6 initWithImage:v7 identifier:@"languageFlag"];

    v9 = objc_alloc_init(&OBJC_CLASS___TSKPreviewViewController);
    v10 = self->_languagePreviewViewController;
    self->_languagePreviewViewController = v9;

    -[TSKPreviewViewController setContentView:](self->_languagePreviewViewController, "setContentView:", v8);
    languagePreviewViewController = self->_languagePreviewViewController;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
  -[TSKPreviewViewController setDescriptionText:](languagePreviewViewController, "setDescriptionText:", v11);

  unsigned __int8 v12 = self->_languagePreviewViewController;
  return v12;
}

- (void)setLanguage:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLanguageViewController languageSelectionHandler](self, "languageSelectionHandler"));

  if (v4)
  {
    id v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[TVSettingsLanguageViewController languageSelectionHandler]( self,  "languageSelectionHandler"));
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (id)_languageFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_1001926E0];
}

- (id)_localizedLanguageFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_100192700];
}

- (BOOL)markSystemLanguage
{
  return self->_markSystemLanguage;
}

- (void)setMarkSystemLanguage:(BOOL)a3
{
  self->_markSystemLanguage = a3;
}

- (id)languageSelectionHandler
{
  return self->_languageSelectionHandler;
}

- (void)setLanguageSelectionHandler:(id)a3
{
}

- (NSArray)languageFilter
{
  return self->_languageFilter;
}

- (TSKPreviewViewController)languagePreviewViewController
{
  return self->_languagePreviewViewController;
}

- (void).cxx_destruct
{
}

@end