@interface TVSettingsInternalVPNViewController
- (BOOL)loadingProfile;
- (id)_URLQueryParameterAllowedCharacters;
- (id)loadSettingGroups;
- (unint64_t)configurationCheckState;
- (void)_VPNProfileLoaded:(id)a3 error:(id)a4;
- (void)_checkVPNConfiguration;
- (void)_finishLoadingVPNProfileAtURL:(id)a3;
- (void)_loadVPNProfile;
- (void)_updateCheckVPNItem:(id)a3;
- (void)_updateLoadVPNItem:(id)a3;
- (void)_warnAboutBadVPNURL;
- (void)_warnAboutMissingAppleConnectCredentials;
- (void)setConfigurationCheckState:(unint64_t)a3;
- (void)setLoadingProfile:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsInternalVPNViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsInternalVPNViewController;
  -[TVSettingsInternalVPNViewController viewDidLoad](&v3, "viewDidLoad");
}

- (id)loadSettingGroups
{
  objc_super v3 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  v5 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v4);
  objc_initWeak(&location, self);
  uint64_t v6 = TSKLocString(@"SettingsVPNLoadProfileMenuItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v7,  0LL,  0LL,  0LL,  self,  "_loadVPNProfile"));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100020DCC;
  v20[3] = &unk_10018E9B0;
  objc_copyWeak(&v21, &location);
  [v8 setUpdateBlock:v20];
  [v5 addObject:v8];
  uint64_t v9 = TSKLocString(@"SettingsVPNCheckVPNTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v10,  0LL,  0LL,  0LL,  self,  "_checkVPNConfiguration"));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100020E14;
  v18[3] = &unk_10018E9B0;
  objc_copyWeak(&v19, &location);
  [v11 setUpdateBlock:v18];
  [v5 addObject:v11];
  uint64_t v12 = TSKLocString(@"RestartTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v13,  0LL,  0LL,  0LL,  v14,  "reboot"));

  [v5 addObject:v15];
  -[TSKSettingGroup setSettingItems:](v3, "setSettingItems:", v5);
  v23 = v3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v16;
}

- (void)_updateLoadVPNItem:(id)a3
{
  id v18 = a3;
  if (-[TVSettingsInternalVPNViewController loadingProfile](self, "loadingProfile")) {
    uint64_t v4 = 4LL;
  }
  else {
    uint64_t v4 = 0LL;
  }
  [v18 setAccessoryTypes:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSVPNSettings sharedInstance](&OBJC_CLASS___PBSVPNSettings, "sharedInstance"));
  unsigned __int8 v6 = [v5 isProfileLoaded];

  if ((v6 & 1) != 0)
  {
    uint64_t v7 = TSKLocString(@"SettingsVPNLoadedValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v18 setLocalizedValue:v8];

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBSVPNSettings sharedInstance](&OBJC_CLASS___PBSVPNSettings, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 profileExpiryDate]);

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:]( &OBJC_CLASS___NSDateFormatter,  "localizedStringFromDate:dateStyle:timeStyle:",  v10,  1LL,  0LL));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v10 earlierDate:v12]);

    if (v13 == v10) {
      uint64_t v14 = TSKLocString(@"SettingsVPNExpiredText");
    }
    else {
      uint64_t v14 = TSKLocString(@"SettingsVPNOKConnectedText");
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v15, v11));

    [v18 setLocalizedDescription:v17];
  }

  else
  {
    [v18 setLocalizedValue:&stru_100195DD8];
    uint64_t v16 = TSKLocString(@"SettingsVPNLoadVPNText");
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    [v18 setLocalizedDescription:v17];
  }
}

- (void)_updateCheckVPNItem:(id)a3
{
  id v14 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSVPNSettings sharedInstance](&OBJC_CLASS___PBSVPNSettings, "sharedInstance"));
  unsigned __int8 v5 = [v4 isProfileLoaded];

  if ((v5 & 1) == 0)
  {
    uint64_t v8 = TSKLocString(@"SettingsVPNNotLoadedValue");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    [v14 setLocalizedValue:v9];

    uint64_t v10 = TSKLocString(@"SettingsVPNNotLoadedText");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(v10);
    [v14 setLocalizedDescription:v11];
LABEL_10:

    goto LABEL_11;
  }

  [v14 setLocalizedValue:&stru_100195DD8];
  uint64_t v6 = TSKLocString(@"SettingsVPNCheckVPNText");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v14 setLocalizedDescription:v7];

  if ((id)-[TVSettingsInternalVPNViewController configurationCheckState](self, "configurationCheckState") != (id)1)
  {
    unint64_t v12 = -[TVSettingsInternalVPNViewController configurationCheckState](self, "configurationCheckState") - 1;
    if (v12 <= 4 && ((0x17u >> v12) & 1) != 0)
    {
      uint64_t v13 = TSKLocString(off_10018F3D8[v12]);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(v13);
    }

    else
    {
      v11 = &stru_100195DD8;
    }

    [v14 setLocalizedValue:v11];
    [v14 setAccessoryTypes:0];
    goto LABEL_10;
  }

  [v14 setLocalizedValue:&stru_100195DD8];
  [v14 setAccessoryTypes:4];
LABEL_11:
}

- (void)_loadVPNProfile
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 vpnProfileServerURLString]);

  if ([v4 length])
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](&OBJC_CLASS___NSURLComponents, "componentsWithString:", v4));
    id v6 = sub_100021374();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "VPN profile URL: %{public}@", buf, 0xCu);
      }

      -[TVSettingsInternalVPNViewController setLoadingProfile:](self, "setLoadingProfile:", 1LL);
      -[TVSettingsInternalVPNViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
      objc_initWeak((id *)buf, self);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000213B4;
      block[3] = &unk_10018F2F0;
      objc_copyWeak(&v13, (id *)buf);
      block[4] = self;
      id v12 = v5;
      dispatch_async(&_dispatch_main_q, block);

      objc_destroyWeak(&v13);
      objc_destroyWeak((id *)buf);
    }

    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1000F6A20();
      }

      -[TVSettingsInternalVPNViewController _warnAboutBadVPNURL](self, "_warnAboutBadVPNURL");
    }
  }

  else
  {
    id v9 = sub_100021374();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000F69C0();
    }

    -[TVSettingsInternalVPNViewController _warnAboutBadVPNURL](self, "_warnAboutBadVPNURL");
  }
}

- (void)_finishLoadingVPNProfileAtURL:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppleConnectSettings sharedInstance](&OBJC_CLASS___PBSAppleConnectSettings, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accountID]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 password]);
  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppleConnectSettings sharedInstance](&OBJC_CLASS___PBSAppleConnectSettings, "sharedInstance"));
    id v40 = 0LL;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 tokenWithError:&v40]);
    id v10 = v40;

    if ([v9 length])
    {
      id v35 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBSVPNSettings sharedInstance](&OBJC_CLASS___PBSVPNSettings, "sharedInstance"));
      unsigned int v12 = [v11 isProfileLoaded];

      if (v12)
      {
        id v13 = sub_100021374();
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "VPN profile loaded but attempting to load again.",  (uint8_t *)&buf,  2u);
        }
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsInternalVPNViewController _URLQueryParameterAllowedCharacters]( self,  "_URLQueryParameterAllowedCharacters"));
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v6 stringByAddingPercentEncodingWithAllowedCharacters:v15]);

      v17 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsInternalVPNViewController _URLQueryParameterAllowedCharacters]( self,  "_URLQueryParameterAllowedCharacters"));
      v36 = v9;
      uint64_t v18 = objc_claimAutoreleasedReturnValue([v9 stringByAddingPercentEncodingWithAllowedCharacters:v17]);

      v34 = (void *)v16;
      uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"a",  v16));
      v33 = (void *)v18;
      uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"t",  v18));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v4 percentEncodedQueryItems]);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v21));

      v32 = (void *)v19;
      [v22 addObject:v19];
      v31 = (void *)v20;
      [v22 addObject:v20];
      [v4 setPercentEncodedQueryItems:v22];
      v23 = (void *)objc_claimAutoreleasedReturnValue([v4 URL]);
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration"));
      [v24 setTimeoutIntervalForRequest:300.0];
      [v24 setWaitsForConnectivity:1];
      [v24 setRequestCachePolicy:1];
      [v24 setURLCache:0];
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:",  v24));
      objc_initWeak(&buf, self);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_10002180C;
      v37[3] = &unk_10018F318;
      objc_copyWeak(&v38, &buf);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v25 dataTaskWithURL:v23 completionHandler:v37]);
      [v26 resume];

      objc_destroyWeak(&v38);
      objc_destroyWeak(&buf);

      id v10 = v35;
      id v9 = v36;
    }

    else
    {
      -[TVSettingsInternalVPNViewController setLoadingProfile:](self, "setLoadingProfile:", 0LL);
      id v29 = sub_100021374();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_1000F6AAC();
      }

      -[TVSettingsInternalVPNViewController _VPNProfileLoaded:error:](self, "_VPNProfileLoaded:error:", 0LL, v10);
    }
  }

  else
  {
    -[TVSettingsInternalVPNViewController setLoadingProfile:](self, "setLoadingProfile:", 0LL);
    -[TVSettingsInternalVPNViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
    id v27 = sub_100021374();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_1000F6A80();
    }

    -[TVSettingsInternalVPNViewController _warnAboutMissingAppleConnectCredentials]( self,  "_warnAboutMissingAppleConnectCredentials");
  }
}

- (void)_VPNProfileLoaded:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
    id v10 = sub_100021374();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000F6B90();
    }
  }

  else
  {
    if (v6 && [v6 length])
    {
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
      id v34 = 0LL;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 installProfileData:v6 outError:&v34]);
      id v9 = v34;

      if (v13)
      {
        id v14 = sub_100021374();
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "VPN profile successfully installed.",  buf,  2u);
        }
      }

      else
      {
        id v20 = sub_100021374();
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        BOOL v21 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
        if (v9)
        {
          if (v21) {
            sub_1000F6B30();
          }
        }

        else
        {
          if (v21) {
            sub_1000F6B04();
          }

          NSErrorUserInfoKey v35 = NSLocalizedFailureReasonErrorKey;
          uint64_t v22 = TSKLocString(@"ProfileInstallFailedError");
          v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          v36 = v23;
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));

          id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"TVSettingsErrors",  2LL,  v15));
        }
      }
    }

    else
    {
      id v16 = sub_100021374();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000F6AD8();
      }

      NSErrorUserInfoKey v37 = NSLocalizedFailureReasonErrorKey;
      uint64_t v18 = TSKLocString(@"ProfileResultedInNoDataError");
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      id v38 = v19;
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));

      id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"TVSettingsErrors",  1LL,  v13));
    }

    if (!v9)
    {
      uint64_t v32 = TSKLocString(@"OSUpdateVPNProfileInstallOK");
      v26 = (void *)objc_claimAutoreleasedReturnValue(v32);
      goto LABEL_22;
    }
  }

  uint64_t v24 = TSKLocString(@"OSUpdateVPNProfileInstallFail");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v25, v9));

LABEL_22:
  id v27 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  v26,  1LL));
  uint64_t v28 = TSKLocString(@"SettingsOK");
  id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v29,  1LL,  &stru_10018F338));

  [v27 addAction:v30];
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsInternalVPNViewController navigationController](self, "navigationController"));
  [v31 presentViewController:v27 animated:1 completion:0];

  -[TVSettingsInternalVPNViewController setLoadingProfile:](self, "setLoadingProfile:", 0LL);
  -[TVSettingsInternalVPNViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

- (void)_checkVPNConfiguration
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppleConnectSettings sharedInstance](&OBJC_CLASS___PBSAppleConnectSettings, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accountID]);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 password]);
  if ([v4 length] && objc_msgSend(v5, "length"))
  {
    id v28 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 tokenWithError:&v28]);
    id v7 = v28;
    if (v7)
    {
      id v8 = sub_100021374();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000F6C1C();
      }

      -[TVSettingsInternalVPNViewController _warnAboutMissingAppleConnectCredentials]( self,  "_warnAboutMissingAppleConnectCredentials");
      -[TVSettingsInternalVPNViewController setConfigurationCheckState:](self, "setConfigurationCheckState:", 3LL);
    }

    else
    {
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLQueryAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLQueryAllowedCharacterSet"));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAddingPercentEncodingWithAllowedCharacters:v12]);

      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsOSUpdateConfigurationManager currentConfiguration]( &OBJC_CLASS___TVSettingsOSUpdateConfigurationManager,  "currentConfiguration"));
      id v13 = (__CFString *)objc_claimAutoreleasedReturnValue([v24 requiredProfileURL]);
      id v14 = -[__CFString length](v13, "length");
      v15 = @"https://basejumper.apple.com/com_apple_MobileAsset_SoftwareUpdate/com_apple_MobileAsset_SoftwareUpdate.xml";
      if (v14) {
        v15 = v13;
      }
      v25 = v15;

      id v16 = sub_100021374();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 138412290;
        v30 = v25;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Testing VPN with URL %@", buf, 0xCu);
      }

      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v25));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
      [v18 setRequestCachePolicy:1];
      [v18 setWaitsForConnectivity:1];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:",  v18));
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", v22));
      [v20 setValue:v23 forHTTPHeaderField:@"ACMobileToken"];
      [v20 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
      objc_initWeak((id *)buf, self);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_100022120;
      v26[3] = &unk_10018F318;
      objc_copyWeak(&v27, (id *)buf);
      BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v19 dataTaskWithRequest:v20 completionHandler:v26]);
      [v21 resume];

      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
    }
  }

  else
  {
    id v10 = sub_100021374();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000F6BF0();
    }

    -[TVSettingsInternalVPNViewController _warnAboutMissingAppleConnectCredentials]( self,  "_warnAboutMissingAppleConnectCredentials");
    -[TVSettingsInternalVPNViewController setConfigurationCheckState:](self, "setConfigurationCheckState:", 3LL);
    -[TVSettingsInternalVPNViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  }
}

- (void)_warnAboutMissingAppleConnectCredentials
{
  uint64_t v3 = TSKLocString(@"SettingsVPNMissingAppleConnectCredentialsMessage");
  id v9 = (id)objc_claimAutoreleasedReturnValue(v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  v9,  1LL));
  uint64_t v5 = TSKLocString(@"SettingsOK");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v6,  1LL,  &stru_10018F358));

  [v4 addAction:v7];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsInternalVPNViewController navigationController](self, "navigationController"));
  [v8 presentViewController:v4 animated:1 completion:0];
}

- (void)_warnAboutBadVPNURL
{
  uint64_t v3 = TSKLocString(@"SettingsVPNBadURLMessage");
  id v9 = (id)objc_claimAutoreleasedReturnValue(v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  v9,  1LL));
  uint64_t v5 = TSKLocString(@"SettingsOK");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v6,  1LL,  &stru_10018F378));

  [v4 addAction:v7];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsInternalVPNViewController navigationController](self, "navigationController"));
  [v8 presentViewController:v4 animated:1 completion:0];
}

- (id)_URLQueryParameterAllowedCharacters
{
  if (qword_1001E15B8 != -1) {
    dispatch_once(&qword_1001E15B8, &stru_10018F398);
  }
  return (id)qword_1001E15B0;
}

- (unint64_t)configurationCheckState
{
  return self->_configurationCheckState;
}

- (void)setConfigurationCheckState:(unint64_t)a3
{
  self->_configurationCheckState = a3;
}

- (BOOL)loadingProfile
{
  return self->_loadingProfile;
}

- (void)setLoadingProfile:(BOOL)a3
{
  self->_loadingProfile = a3;
}

@end