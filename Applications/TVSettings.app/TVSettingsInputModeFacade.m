@interface TVSettingsInputModeFacade
- (BOOL)isInputModeEnabled:(id)a3;
- (NSArray)allInputModeIdentifiers;
- (NSArray)enabledInputModeIdentifiers;
- (NSString)languageIdentifier;
- (PLSInternationalizationSettings)intlSettings;
- (TVCSPreferredLanguagesManager)preferredLanguagesManager;
- (TVSettingsInputModeFacade)initWithLangauge:(id)a3;
- (void)_resetStateFromPreferences;
- (void)commitChanges;
- (void)dealloc;
- (void)setEnabledInputModeIdentifiers:(id)a3;
- (void)setIntlSettings:(id)a3;
- (void)toggleInputModeEnabled:(id)a3;
@end

@implementation TVSettingsInputModeFacade

- (TVSettingsInputModeFacade)initWithLangauge:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVSettingsInputModeFacade;
  v6 = -[TVSettingsInputModeFacade init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_languageIdentifier, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___PLSInternationalizationSettings);
    intlSettings = v7->_intlSettings;
    v7->_intlSettings = v8;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v7,  (CFNotificationCallback)sub_1000C8B24,  @"AppleKeyboardsPreferencesChangedNotification",  0LL,  CFNotificationSuspensionBehaviorDrop);
    -[TVSettingsInputModeFacade _resetStateFromPreferences](v7, "_resetStateFromPreferences");
  }

  return v7;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver( DarwinNotifyCenter,  self,  @"AppleKeyboardsPreferencesChangedNotification",  0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsInputModeFacade;
  -[TVSettingsInputModeFacade dealloc](&v4, "dealloc");
}

- (TVCSPreferredLanguagesManager)preferredLanguagesManager
{
  return +[TVCSPreferredLanguagesManager sharedInstance](&OBJC_CLASS___TVCSPreferredLanguagesManager, "sharedInstance");
}

- (BOOL)isInputModeEnabled:(id)a3
{
  return -[NSArray containsObject:](self->_enabledInputModeIdentifiers, "containsObject:", a3);
}

- (void)toggleInputModeEnabled:(id)a3
{
  id v8 = a3;
  if (self->_enabledInputModeIdentifiers) {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:"));
  }
  else {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  }
  id v5 = v4;
  else {
    [v5 addObject:v8];
  }
  v6 = (NSArray *)[v5 copy];
  enabledInputModeIdentifiers = self->_enabledInputModeIdentifiers;
  self->_enabledInputModeIdentifiers = v6;
}

- (void)commitChanges
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsInputModeFacade preferredLanguagesManager](self, "preferredLanguagesManager"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsInputModeFacade languageIdentifier](self, "languageIdentifier"));
  [v3 updatePreferredLanguage:v4 withVariants:self->_enabledInputModeIdentifiers];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsInputModeFacade preferredLanguagesManager](self, "preferredLanguagesManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 preferredLanguages]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsInputModeFacade preferredLanguagesManager](self, "preferredLanguagesManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 preferredInputModeList]);

  if (_os_feature_enabled_impl("PineBoard", "UserProfileLanguages"))
  {
    objc_initWeak(&location, self);
    intlSettings = self->_intlSettings;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000C8DA4;
    v11[3] = &unk_10018F430;
    objc_copyWeak(&v12, &location);
    -[PLSInternationalizationSettings setPreferredLanguages:withVariants:completion:]( intlSettings,  "setPreferredLanguages:withVariants:completion:",  v6,  v8,  v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsInputModeFacade preferredLanguagesManager](self, "preferredLanguagesManager"));
    [v10 applyInputModesChanges];
  }
}

- (void)_resetStateFromPreferences
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsInputModeFacade preferredLanguagesManager](self, "preferredLanguagesManager"));
  [v3 revertPreferredLanguages];

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsInputModeFacade preferredLanguagesManager](self, "preferredLanguagesManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsInputModeFacade languageIdentifier](self, "languageIdentifier"));
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue([v4 defaultInputModeVariantsForLanguageIdentifier:v5]);
  allInputModeIdentifiers = self->_allInputModeIdentifiers;
  self->_allInputModeIdentifiers = v6;

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsInputModeFacade preferredLanguagesManager](self, "preferredLanguagesManager"));
  id v8 = (NSArray *)objc_claimAutoreleasedReturnValue([v10 preferredInputModeList]);
  enabledInputModeIdentifiers = self->_enabledInputModeIdentifiers;
  self->_enabledInputModeIdentifiers = v8;
}

- (NSString)languageIdentifier
{
  return self->_languageIdentifier;
}

- (NSArray)allInputModeIdentifiers
{
  return self->_allInputModeIdentifiers;
}

- (NSArray)enabledInputModeIdentifiers
{
  return self->_enabledInputModeIdentifiers;
}

- (void)setEnabledInputModeIdentifiers:(id)a3
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