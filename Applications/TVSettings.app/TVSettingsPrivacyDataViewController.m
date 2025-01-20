@interface TVSettingsPrivacyDataViewController
- (TVSettingsDiagnosticLogsFacade)logsFacade;
- (TVSettingsPrivacyDataViewController)initWithStyle:(int64_t)a3;
- (id)loadSettingGroups;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareForDeepLinkWithURL:(id)a3;
- (void)setLogsFacade:(id)a3;
@end

@implementation TVSettingsPrivacyDataViewController

- (TVSettingsPrivacyDataViewController)initWithStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSettingsPrivacyDataViewController;
  v3 = -[TVSettingsPrivacyDataViewController initWithStyle:](&v7, "initWithStyle:", a3);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___TVSettingsDiagnosticLogsFacade);
    logsFacade = v3->_logsFacade;
    v3->_logsFacade = v4;

    -[TVSettingsDiagnosticLogsFacade addObserver:forKeyPath:options:context:]( v3->_logsFacade,  "addObserver:forKeyPath:options:context:",  v3,  @"logFilePaths",  1LL,  off_1001DF1B0);
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsPrivacyDataViewController;
  -[TVSettingsPrivacyDataViewController dealloc](&v3, "dealloc");
}

- (void)prepareForDeepLinkWithURL:(id)a3
{
}

- (id)loadSettingGroups
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsDiagnosticLogsFacade logFilePaths](self->_logsFacade, "logFilePaths"));
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  v10 = sub_10000B6B0;
  v11 = &unk_10018E6C0;
  objc_copyWeak(&v12, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_arrayByMappingObjectsUsingBlock:", &v8));

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v4,  v8,  v9,  v10,  v11));
  v14 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001DF1B0 == a6)
  {
    -[TVSettingsPrivacyDataViewController reloadSettings](self, "reloadSettings", a3, a4, a5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___TVSettingsPrivacyDataViewController;
    -[TVSettingsPrivacyDataViewController observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (TVSettingsDiagnosticLogsFacade)logsFacade
{
  return self->_logsFacade;
}

- (void)setLogsFacade:(id)a3
{
}

- (void).cxx_destruct
{
}

@end