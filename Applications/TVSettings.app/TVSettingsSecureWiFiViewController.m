@interface TVSettingsSecureWiFiViewController
- (BOOL)_isSecureWiFiProfileLoaded;
- (TSKSettingItem)secureWiFiItem;
- (id)loadSettingGroups;
- (void)_loadSecureWiFiProfile:(id)a3;
- (void)_secureWiFiProfileLoaded:(id)a3 error:(id)a4;
- (void)setSecureWiFiItem:(id)a3;
@end

@implementation TVSettingsSecureWiFiViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppleConnectSettings sharedInstance](&OBJC_CLASS___PBSAppleConnectSettings, "sharedInstance"));
  v4 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v6 = TSKLocString(@"AccountsAppleConnectSettingsTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v7,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsAppleConnectSettingsViewController));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  [v9 setUpdateBlock:&stru_1001915A0];
  -[NSMutableArray addObject:](v5, "addObject:", v9);
  uint64_t v10 = TSKWiFiLocString(@"NetworkSecureWiFiLoadItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v11,  0LL,  0LL,  0LL,  self,  "_loadSecureWiFiProfile:"));

  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100070264;
  v16[3] = &unk_10018FFA8;
  objc_copyWeak(&v18, &location);
  id v13 = v3;
  id v17 = v13;
  [v12 setUpdateBlock:v16];
  -[NSMutableArray addObject:](v5, "addObject:", v12);
  objc_storeStrong((id *)&self->_secureWiFiItem, v12);
  -[TSKSettingGroup setSettingItems:](v4, "setSettingItems:", v5);
  v20 = v4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v14;
}

- (BOOL)_isSecureWiFiProfileLoaded
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 installedProfilesWithFilterFlags:1]);

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)i), "identifier", (void)v13));
        unsigned __int8 v10 = [v9 containsString:@"com.apple.ist.scifi"];

        if ((v10 & 1) != 0)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (void)_loadSecureWiFiProfile:(id)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppleConnectSettings sharedInstance](&OBJC_CLASS___PBSAppleConnectSettings, "sharedInstance", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accountID]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPreferences preferencesWithDomain:](&OBJC_CLASS___TVSPreferences, "preferencesWithDomain:", v8));

  else {
    unsigned __int8 v10 = @"https://wdg2.apple.com/ivpn/scifi_appletv";
  }
  if (-[__CFString length](v10, "length")) {
    BOOL v11 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v10);
  }
  else {
    BOOL v11 = 0LL;
  }
  if (_TVSLogInternalLogLevel >= 5)
  {
    uint64_t v12 = TVSSystemLog;
    if (pthread_main_np()) {
      __int128 v13 = @"Main:";
    }
    else {
      __int128 v13 = &stru_100195DD8;
    }
    uint64_t v20 = v12;
    v21 = v10;
    id v18 = v13;
    pthread_t v19 = pthread_self();
    _TVSLogBase(v3, &_os_log_default, 1LL, 0LL, 5LL, v12);
  }

  id v23 = 0LL;
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tokenWithError:", &v23, v18, v19, v20, v21));
  id v15 = v23;
  if (![v14 length] || v15)
  {
    -[TVSettingsSecureWiFiViewController _secureWiFiProfileLoaded:error:]( self,  "_secureWiFiProfileLoaded:error:",  0LL,  v15);
  }

  else
  {
    id v16 = [[SSMutableURLRequestProperties alloc] initWithURL:v11];
    [v16 setValue:v6 forRequestParameter:@"a"];
    [v16 setValue:v14 forRequestParameter:@"t"];
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[TVSDocumentLoader documentLoaderWithRequestProperties:]( &OBJC_CLASS___TVSDocumentLoader,  "documentLoaderWithRequestProperties:",  v16));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000706D8;
    v22[3] = &unk_1001915C8;
    v22[4] = self;
    [v17 loadWithCompletionHandler:v22];
  }
}

- (void)_secureWiFiProfileLoaded:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = (uint64_t)v8;
LABEL_19:
    uint64_t v22 = TSKWiFiLocString(@"NetworkSecureWiFiProfileLoadFail");
    id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v23, v10));

    goto LABEL_20;
  }

  if (v7 && [v7 length])
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    id v38 = 0LL;
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 installProfileData:v7 outError:&v38]);
    uint64_t v10 = (uint64_t)v38;

    if (!(v12 | v10))
    {
      if (_TVSLogInternalLogLevel >= 3)
      {
        uint64_t v13 = TVSSystemLog;
        if (pthread_main_np()) {
          __int128 v14 = @"Main:";
        }
        else {
          __int128 v14 = &stru_100195DD8;
        }
        pthread_t v35 = pthread_self();
        uint64_t v36 = v13;
        v34 = v14;
        _TVSLogBase(v4, &_os_log_default, 65LL, 0LL, 3LL, v13);
      }

      NSErrorUserInfoKey v39 = NSLocalizedFailureReasonErrorKey;
      uint64_t v15 = TSKLocString(@"ProfileInstallFailedError");
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v40 = v16;
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));

      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"TVSettingsErrors",  2LL,  v17));
    }
  }

  else
  {
    if (_TVSLogInternalLogLevel >= 3)
    {
      uint64_t v18 = TVSSystemLog;
      if (pthread_main_np()) {
        pthread_t v19 = @"Main:";
      }
      else {
        pthread_t v19 = &stru_100195DD8;
      }
      pthread_t v35 = pthread_self();
      uint64_t v36 = v18;
      v34 = v19;
      _TVSLogBase(v4, &_os_log_default, 65LL, 0LL, 3LL, v18);
    }

    NSErrorUserInfoKey v41 = NSLocalizedFailureReasonErrorKey;
    uint64_t v20 = TSKLocString(@"ProfileResultedInNoDataError");
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v42 = v21;
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));

    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"TVSettingsErrors",  1LL,  v12));
  }

  if (v10) {
    goto LABEL_19;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[TVSEthernetInterface RJ45EthernetInterface]( &OBJC_CLASS___TVSEthernetInterface,  "RJ45EthernetInterface"));

  if (v30)
  {
    uint64_t v31 = TSKWiFiLocString(@"NetworkSecureWiFiProfileLoadOK");
    v24 = (void *)objc_claimAutoreleasedReturnValue(v31);
  }

  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v33 = TSKLocStringFromBundleCachingKey( @"NetworkSecureWiFiProfileLoadOKWiFiOnlyDevice",  v32,  1LL,  0LL,  @"Localizable-J255");
    v24 = (void *)objc_claimAutoreleasedReturnValue(v33);
  }

  uint64_t v10 = 0LL;
LABEL_20:
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  v24,  1LL,  v34,  v35,  v36));
  uint64_t v26 = TSKLocString(@"SettingsOK");
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v27,  1LL,  &stru_1001915E8));

  [v25 addAction:v28];
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSecureWiFiViewController navigationController](self, "navigationController"));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100070B2C;
  v37[3] = &unk_10018E440;
  v37[4] = self;
  [v29 presentViewController:v25 animated:1 completion:v37];
}

- (TSKSettingItem)secureWiFiItem
{
  return self->_secureWiFiItem;
}

- (void)setSecureWiFiItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end