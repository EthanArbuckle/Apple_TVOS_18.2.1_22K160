@interface TVSettingsLanguageInputModeViewController
- (NSString)languageIdentifier;
- (TSKPreviewViewController)languagePreviewViewController;
- (TVSettingsInputModeFacade)inputModeFacade;
- (TVSettingsLanguageInputModeViewController)initWithLanguageIdentifier:(id)a3;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)handleMenuButton:(id)a3;
- (void)toggleInputMode:(id)a3;
- (void)warnAboutMissingInputModes;
@end

@implementation TVSettingsLanguageInputModeViewController

- (TVSettingsLanguageInputModeViewController)initWithLanguageIdentifier:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVSettingsLanguageInputModeViewController;
  v6 = -[TVSettingsLanguageInputModeViewController initWithStyle:](&v13, "initWithStyle:", 1LL);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_languageIdentifier, a3);
    v8 = -[TVSettingsInputModeFacade initWithLangauge:]( objc_alloc(&OBJC_CLASS___TVSettingsInputModeFacade),  "initWithLangauge:",  v5);
    inputModeFacade = v7->_inputModeFacade;
    v7->_inputModeFacade = v8;

    v10 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v7,  "handleMenuButton:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v10, "setAllowedPressTypes:", &off_1001AF280);
    -[UITapGestureRecognizer setAllowedTouchTypes:](v10, "setAllowedTouchTypes:", &__NSArray0__struct);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLanguageInputModeViewController view](v7, "view"));
    [v11 addGestureRecognizer:v10];
  }

  return v7;
}

- (id)loadSettingGroups
{
  uint64_t v3 = TSKLocString(@"LanguageInputMethodsListTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLanguageInputModeViewController inputModeFacade](self, "inputModeFacade"));
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  v11 = sub_1000C91B4;
  v12 = &unk_100194068;
  objc_copyWeak(&v13, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v4,  v5,  @"allInputModeIdentifiers",  &v9));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v6, v9, v10, v11, v12));
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v7;
}

- (void)toggleInputMode:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLanguageInputModeViewController inputModeFacade](self, "inputModeFacade"));
  [v4 toggleInputModeEnabled:v5];
}

- (void)handleMenuButton:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLanguageInputModeViewController inputModeFacade](self, "inputModeFacade", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allInputModeIdentifiers]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLanguageInputModeViewController inputModeFacade](self, "inputModeFacade"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 enabledInputModeIdentifiers]);

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend( v7,  "containsObject:",  *(void *)(*((void *)&v16 + 1) + 8 * (void)v12),  (void)v16))
        {

          id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLanguageInputModeViewController inputModeFacade](self, "inputModeFacade"));
          [v13 commitChanges];

          v14 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsLanguageInputModeViewController navigationController]( self,  "navigationController"));
          id v15 = [v14 popViewControllerAnimated:1];

          goto LABEL_11;
        }

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  -[TVSettingsLanguageInputModeViewController warnAboutMissingInputModes](self, "warnAboutMissingInputModes");
LABEL_11:
}

- (void)warnAboutMissingInputModes
{
  id v23 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsLanguageInputModeViewController languageIdentifier](self, "languageIdentifier"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLanguageInputModeViewController languageIdentifier](self, "languageIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale componentsFromLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "componentsFromLocaleIdentifier:",  v3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:NSLocaleCountryCode]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 countryCode]);
  unsigned int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLanguageInputModeViewController languageIdentifier](self, "languageIdentifier"));
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSLocale baseLanguageFromLanguage:](&OBJC_CLASS___NSLocale, "baseLanguageFromLanguage:", v9));

    id v11 = (id)v10;
  }

  else
  {
    id v11 = v23;
  }

  id v24 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVSInternationalization displayNameForLanguage:displayLanguage:]( &OBJC_CLASS___TVSInternationalization,  "displayNameForLanguage:displayLanguage:",  v11,  0LL));
  uint64_t v13 = TSKLocString(@"LanguageInputMethodRequiredTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = TSKLocString(@"LanguageInputMethodRequiredMessage");
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v16, v12));

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v14,  v17,  1LL));
  uint64_t v19 = TSKLocString(@"SettingsOK");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v20,  0LL,  0LL));
  [v18 addAction:v21];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLanguageInputModeViewController navigationController](self, "navigationController"));
  [v22 presentViewController:v18 animated:1 completion:0];
}

- (id)previewForItemAtIndexPath:(id)a3
{
  languagePreviewViewController = self->_languagePreviewViewController;
  if (!languagePreviewViewController)
  {
    id v5 = objc_alloc(&OBJC_CLASS___TSKVibrantImageView);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsUtilities languageImage](&OBJC_CLASS___TVSettingsUtilities, "languageImage"));
    id v7 = [v5 initWithImage:v6 identifier:@"languageFlag"];

    unsigned int v8 = objc_alloc_init(&OBJC_CLASS___TSKPreviewViewController);
    id v9 = self->_languagePreviewViewController;
    self->_languagePreviewViewController = v8;

    -[TSKPreviewViewController setContentView:](self->_languagePreviewViewController, "setContentView:", v7);
    languagePreviewViewController = self->_languagePreviewViewController;
  }

  return languagePreviewViewController;
}

- (NSString)languageIdentifier
{
  return self->_languageIdentifier;
}

- (TSKPreviewViewController)languagePreviewViewController
{
  return self->_languagePreviewViewController;
}

- (TVSettingsInputModeFacade)inputModeFacade
{
  return self->_inputModeFacade;
}

- (void).cxx_destruct
{
}

@end