@interface TVSettingsLocalStorageViewController
- (BOOL)displayQuotaExceededIfNeeded;
- (NSString)quotaMessage;
- (TSKPreviewViewController)appIconPreviewViewController;
- (TSKSettingItem)lastFocusedItem;
- (TVSettingsLocalStorageViewController)initWithStyle:(int64_t)a3;
- (TVSettingsUsageFacade)usageFacade;
- (id)_byteCountFormatter;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (id)title;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_showDeleteConfirmationForItem:(id)a3;
- (void)_updateQuotaMessage;
- (void)dealloc;
- (void)displayTriggeredByURL:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAppIconPreviewViewController:(id)a3;
- (void)setDisplayQuotaExceededIfNeeded:(BOOL)a3;
- (void)setLastFocusedItem:(id)a3;
- (void)setQuotaMessage:(id)a3;
- (void)setUsageFacade:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation TVSettingsLocalStorageViewController

- (TVSettingsLocalStorageViewController)initWithStyle:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVSettingsLocalStorageViewController;
  v3 = -[TVSettingsLocalStorageViewController initWithStyle:](&v13, "initWithStyle:", a3);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___TVSettingsUsageFacade);
    usageFacade = v3->_usageFacade;
    v3->_usageFacade = v4;

    -[TVSettingsUsageFacade addObserver:forKeyPath:options:context:]( v3->_usageFacade,  "addObserver:forKeyPath:options:context:",  v3,  @"usedAppStorage",  0LL,  off_1001DFCB0);
    objc_initWeak(&location, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedCacheDeletePreferences]( &OBJC_CLASS___TVSPreferences,  "sharedCacheDeletePreferences"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100062554;
    v10[3] = &unk_10018E810;
    objc_copyWeak(&v11, &location);
    id v8 =  +[TVSPreferences addObserverForDomain:withDistributedSynchronizationHandler:]( &OBJC_CLASS___TVSPreferences,  "addObserverForDomain:withDistributedSynchronizationHandler:",  v7,  v10);

    v3->_displayQuotaExceededIfNeeded = 0;
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (void)displayTriggeredByURL:(id)a3
{
  if (!self->_displayQuotaExceededIfNeeded)
  {
    self->_displayQuotaExceededIfNeeded = 1;
    -[TVSettingsLocalStorageViewController _updateQuotaMessage](self, "_updateQuotaMessage", a3);
  }

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsLocalStorageViewController;
  -[TVSettingsLocalStorageViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLocalStorageViewController tableView](self, "tableView"));
  [v3 setEditing:1];

  if (!self->_displayQuotaExceededIfNeeded)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedCacheDeletePreferences]( &OBJC_CLASS___TVSPreferences,  "sharedCacheDeletePreferences"));
    self->_displayQuotaExceededIfNeeded = [v4 shouldDisplayApplicationsQuotaExceededMessage];

    -[TVSettingsLocalStorageViewController _updateQuotaMessage](self, "_updateQuotaMessage");
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsLocalStorageViewController;
  -[TVSettingsLocalStorageViewController dealloc](&v3, "dealloc");
}

- (id)loadSettingGroups
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLocalStorageViewController _byteCountFormatter](self, "_byteCountFormatter"));
  uint64_t v4 = TSKLocString(@"LocalStorageAppsTitle");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  usageFacade = self->_usageFacade;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000628AC;
  v13[3] = &unk_100190FD0;
  id v7 = v3;
  id v14 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v5,  usageFacade,  @"installedUserApps",  v13));

  [v8 setAutoHide:0];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100062928;
  v11[3] = &unk_10018E9B0;
  objc_copyWeak(&v12, &location);
  [v8 setUpdateBlock:v11];
  v16 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
  return v9;
}

- (id)title
{
  return (id)TSKLocString(@"LocalStorageTitle");
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_super v5 = (TSKSettingItem *)objc_claimAutoreleasedReturnValue( -[TVSettingsLocalStorageViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TSKSettingItem representedObject](v5, "representedObject"));
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___TVSettingsUsageAppRecord);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItemUtilities localizedDescriptionForItemInViewController:atIndexPath:]( &OBJC_CLASS___TSKSettingItemUtilities,  "localizedDescriptionForItemInViewController:atIndexPath:",  self,  v4));

    if (self->_lastFocusedItem == v5)
    {
      -[TSKPreviewViewController setDescriptionText:](self->_appIconPreviewViewController, "setDescriptionText:", v8);
      objc_super v13 = self->_appIconPreviewViewController;
    }

    else
    {
      id v9 = v6;
      v10 = objc_alloc(&OBJC_CLASS___TSKAppIconPreviewViewController);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);

      id v12 = -[TSKAppIconPreviewViewController initWithApplicationBundleIdentifier:]( v10,  "initWithApplicationBundleIdentifier:",  v11);
      -[TSKAppIconPreviewViewController setDescriptionText:](v12, "setDescriptionText:", v8);
      objc_super v13 = v12;
      objc_storeStrong((id *)&self->_lastFocusedItem, v5);
      appIconPreviewViewController = self->_appIconPreviewViewController;
      self->_appIconPreviewViewController = v13;
    }
  }

  else
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___TVSettingsLocalStorageViewController;
    id v15 = -[TVSettingsLocalStorageViewController previewForItemAtIndexPath:](&v18, "previewForItemAtIndexPath:", v4);
    objc_super v13 = (TSKPreviewViewController *)objc_claimAutoreleasedReturnValue(v15);
  }

  v16 = v13;

  return v16;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 1LL;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a5;
  if (a4 == 1)
  {
    id v16 = v7;
    if (+[UIApplication tvsui_isRunningInStoreDemoMode]( &OBJC_CLASS___UIApplication,  "tvsui_isRunningInStoreDemoMode"))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"StoreDemoModeRestrictedTitle" value:&stru_100195DD8 table:0]);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"StoreDemoModeDeleteRestricted" value:&stru_100195DD8 table:0]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v9,  v11,  1LL));

      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedStringForKey:@"OK" value:&stru_100195DD8 table:0]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v14,  1LL,  0LL));

      [v12 addAction:v15];
      -[TVSettingsLocalStorageViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v12,  1LL,  0LL);
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsLocalStorageViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  v16));
      -[TVSettingsLocalStorageViewController _showDeleteConfirmationForItem:]( self,  "_showDeleteConfirmationForItem:",  v12);
    }

    id v7 = v16;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001DFCB0 == a6)
  {
    -[TVSettingsLocalStorageViewController _updateQuotaMessage](self, "_updateQuotaMessage", a3, a4, a5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___TVSettingsLocalStorageViewController;
    -[TVSettingsLocalStorageViewController observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)_showDeleteConfirmationForItem:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  -[TVSettingsUsageFacade uninstallApp:](self->_usageFacade, "uninstallApp:", v4);
}

- (void)_updateQuotaMessage
{
  if (self->_displayQuotaExceededIfNeeded)
  {
    objc_initWeak(&location, self);
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSCacheDelete sharedInstance](&OBJC_CLASS___TVSCacheDelete, "sharedInstance"));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100062EA8;
    v4[3] = &unk_100190FF8;
    objc_copyWeak(&v5, &location);
    [v3 fetchApplicationsStateWithCompletion:v4];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }

  else
  {
    -[TVSettingsLocalStorageViewController setQuotaMessage:](self, "setQuotaMessage:", 0LL);
    -[TVSettingsLocalStorageViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  }

- (id)_byteCountFormatter
{
  return objc_alloc_init(&OBJC_CLASS___NSByteCountFormatter);
}

- (TSKSettingItem)lastFocusedItem
{
  return self->_lastFocusedItem;
}

- (void)setLastFocusedItem:(id)a3
{
}

- (TSKPreviewViewController)appIconPreviewViewController
{
  return self->_appIconPreviewViewController;
}

- (void)setAppIconPreviewViewController:(id)a3
{
}

- (TVSettingsUsageFacade)usageFacade
{
  return self->_usageFacade;
}

- (void)setUsageFacade:(id)a3
{
}

- (NSString)quotaMessage
{
  return self->_quotaMessage;
}

- (void)setQuotaMessage:(id)a3
{
}

- (BOOL)displayQuotaExceededIfNeeded
{
  return self->_displayQuotaExceededIfNeeded;
}

- (void)setDisplayQuotaExceededIfNeeded:(BOOL)a3
{
  self->_displayQuotaExceededIfNeeded = a3;
}

- (void).cxx_destruct
{
}

@end