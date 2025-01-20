@interface SATVTermsViewController
- (NSMutableDictionary)termsDictionary;
- (SATVConsentViewController)consentViewController;
- (SATVTermsDetailsViewController)termsDetailsViewController;
- (SATVTermsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIFocusGuide)choiceFocusGuide;
- (UIView)choiceView;
- (id)_termsRequest;
- (id)clientMenuHandler;
- (id)completionHandler;
- (id)consentButtonTextForConsentViewController:(id)a3;
- (id)dissentButtonTextForConsentViewController:(id)a3;
- (id)footerButtonTextForConsentViewController:(id)a3;
- (id)footnoteTextForConsentViewController:(id)a3;
- (id)subtitleTextForConsentViewController:(id)a3;
- (id)titleTextForConsentViewController:(id)a3;
- (void)_callClientMenuHandlerWithConsent;
- (void)_callCompletionHandlerWithConsent:(BOOL)a3;
- (void)_decodeTermsData:(id)a3;
- (void)_downloadTerms;
- (void)_freezeTerms:(id)a3 withName:(id)a4;
- (void)_getFallbackTermsAndFreeze;
- (void)_handleMenu;
- (void)consentViewControllerDidSelectConsent:(id)a3;
- (void)consentViewControllerDidSelectDissent:(id)a3;
- (void)consentViewControllerDidSelectFooter:(id)a3;
- (void)downloadCompleted;
- (void)setChoiceFocusGuide:(id)a3;
- (void)setChoiceView:(id)a3;
- (void)setClientMenuHandler:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setConsentViewController:(id)a3;
- (void)setMenuHandler:(id)a3;
- (void)setTermsDetailsViewController:(id)a3;
- (void)setTermsDictionary:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SATVTermsViewController

- (SATVTermsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SATVTermsViewController;
  v8 = -[SATVTermsViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", v6, v7);
  if (v8)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    termsDictionary = v8->_termsDictionary;
    v8->_termsDictionary = v9;

    objc_initWeak(&location, v8);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100044BA8;
    v13[3] = &unk_1000C93A0;
    objc_copyWeak(&v14, &location);
    v12.receiver = v8;
    v12.super_class = (Class)&OBJC_CLASS___SATVTermsViewController;
    -[SATVTermsViewController setMenuHandler:](&v12, "setMenuHandler:", v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)setMenuHandler:(id)a3
{
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___SATVTermsViewController;
  -[SATVTermsViewController viewDidLoad](&v29, "viewDidLoad");
  -[SATVTermsViewController _downloadTerms](self, "_downloadTerms");
  v3 = objc_alloc_init(&OBJC_CLASS___SATVConsentViewController);
  -[SATVTermsViewController setConsentViewController:](self, "setConsentViewController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController consentViewController](self, "consentViewController"));
  [v4 setDelegate:self];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController consentViewController](self, "consentViewController"));
  [v5 setDataSource:self];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController consentViewController](self, "consentViewController"));
  -[SATVTermsViewController addChildViewController:](self, "addChildViewController:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController consentViewController](self, "consentViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 view]);
  [v7 addSubview:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController consentViewController](self, "consentViewController"));
  [v10 didMoveToParentViewController:self];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController consentViewController](self, "consentViewController"));
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 choiceView]);
  -[SATVTermsViewController setChoiceView:](self, "setChoiceView:", v12);

  v13 = objc_alloc_init(&OBJC_CLASS___SATVTermsDetailsViewController);
  -[SATVTermsViewController setTermsDetailsViewController:](self, "setTermsDetailsViewController:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDetailsViewController](self, "termsDetailsViewController"));
  [v14 setNumberOfRows:2];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDetailsViewController](self, "termsDetailsViewController"));
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v15 view]);
  [v16 setHidden:1];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDetailsViewController](self, "termsDetailsViewController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 view]);
  [v17 addSubview:v19];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDetailsViewController](self, "termsDetailsViewController"));
  -[SATVTermsViewController addChildViewController:](self, "addChildViewController:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDetailsViewController](self, "termsDetailsViewController"));
  [v21 didMoveToParentViewController:self];

  v22 = objc_alloc_init(&OBJC_CLASS___UIFocusGuide);
  -[SATVTermsViewController setChoiceFocusGuide:](self, "setChoiceFocusGuide:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController choiceFocusGuide](self, "choiceFocusGuide"));
  [v23 addLayoutGuide:v24];

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController choiceView](self, "choiceView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController choiceFocusGuide](self, "choiceFocusGuide"));
  v27 = v26;
  if (v25)
  {
    v30 = v25;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
    [v27 setPreferredFocusEnvironments:v28];
  }

  else
  {
    [v26 setPreferredFocusEnvironments:&__NSArray0__struct];
  }
}

- (void)viewDidLayoutSubviews
{
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___SATVTermsViewController;
  -[SATVTermsViewController viewDidLayoutSubviews](&v53, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController choiceView](self, "choiceView"));
  [v12 frame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  if (!-[SATVTermsViewController tvsk_layoutStyle](self, "tvsk_layoutStyle"))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDetailsViewController](self, "termsDetailsViewController"));
    [v25 sizeThatFits];
    double v27 = v26;
    double v29 = v28;

    double v30 = UIRectCenteredRect(0.0, 0.0, v27, v29, v5, v7, v9, v11);
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDetailsViewController](self, "termsDetailsViewController"));
    v37 = (void *)objc_claimAutoreleasedReturnValue([v22 view]);
    v24 = v37;
    double v38 = v30;
    double v39 = v32;
    double v40 = v34;
    double v41 = v36;
LABEL_9:
    objc_msgSend(v37, "setFrame:", v38, v39, v40, v41);
    goto LABEL_10;
  }

  v58.origin.x = CGRectZero.origin.x;
  v58.origin.y = CGRectZero.origin.y;
  v58.size.width = CGRectZero.size.width;
  v58.size.height = CGRectZero.size.height;
  v54.origin.x = v14;
  v54.origin.y = v16;
  v54.size.width = v18;
  v54.size.height = v20;
  BOOL v21 = CGRectEqualToRect(v54, v58);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDetailsViewController](self, "termsDetailsViewController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 view]);
  v24 = v23;
  if (!v21)
  {
    [v23 setHidden:0];

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController choiceFocusGuide](self, "choiceFocusGuide"));
    objc_msgSend(v42, "_setManualLayoutFrame:", v14, v16, v18, v20);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController view](self, "view"));
    unsigned __int8 v44 = [v43 _shouldReverseLayoutDirection];

    v55.origin.x = v14;
    v55.origin.y = v16;
    v55.size.width = v18;
    v55.size.height = v20;
    double v45 = CGRectGetMinY(v55) + -16.0;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDetailsViewController](self, "termsDetailsViewController"));
    [v46 sizeThatFits];
    CGFloat v48 = v47;
    CGFloat v50 = v49;

    if ((v44 & 1) != 0)
    {
      double v51 = 115.0;
    }

    else
    {
      v56.origin.x = v5;
      v56.origin.y = v7;
      v56.size.width = v9;
      v56.size.height = v11;
      double Width = CGRectGetWidth(v56);
      v57.origin.x = 0.0;
      v57.origin.y = v45;
      v57.size.width = v48;
      v57.size.height = v50;
      double v51 = Width - CGRectGetWidth(v57) + -115.0;
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDetailsViewController](self, "termsDetailsViewController"));
    v37 = (void *)objc_claimAutoreleasedReturnValue([v22 view]);
    v24 = v37;
    double v38 = v51;
    double v39 = v45;
    double v40 = v48;
    double v41 = v50;
    goto LABEL_9;
  }

  [v23 setHidden:1];
LABEL_10:
}

- (void)downloadCompleted
{
  id v35 = (id)objc_claimAutoreleasedReturnValue(+[SATVLegalPresentation sharedInstance](&OBJC_CLASS___SATVLegalPresentation, "sharedInstance"));
  if ([v35 needsWarrantyChallenge])
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDictionary](self, "termsDictionary"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"iOSWarranty"]);
    double v5 = (void *)v4;
    if (v4) {
      double v6 = (const __CFString *)v4;
    }
    else {
      double v6 = &stru_1000CB560;
    }
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController navigationController](self, "navigationController"));
    [v35 displayWarrantyChallengeWithTerms:v6 navigationController:v7];
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDictionary](self, "termsDictionary"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"tvOS"]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDetailsViewController](self, "termsDetailsViewController"));
  [v10 setTvOSTerms:v9];

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDictionary](self, "termsDictionary"));
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"iOSWarranty"]);
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDetailsViewController](self, "termsDetailsViewController"));
  [v13 setWarrantyTerms:v12];

  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDictionary](self, "termsDictionary"));
  double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"iCloud"]);

  double v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDictionary](self, "termsDictionary"));
  double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"GameCenter"]);

  if (v15) {
    BOOL v18 = v17 == 0LL;
  }
  else {
    BOOL v18 = 1;
  }
  int v19 = !v18;
  if (v18)
  {
    uint64_t v22 = 0LL;
  }

  else
  {
    double v20 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDetailsViewController](self, "termsDetailsViewController"));
    [v20 setICloudTerms:v15];

    BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDetailsViewController](self, "termsDetailsViewController"));
    [v21 setGameCenterTerms:v17];

    uint64_t v22 = 2LL;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDictionary](self, "termsDictionary"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"ParentalConsent"]);

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDetailsViewController](self, "termsDetailsViewController"));
    [v25 setParentalConsentTerms:v24];

    v22 |= 1uLL;
  }

  else if (!v19)
  {
    goto LABEL_21;
  }

  double v26 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDetailsViewController](self, "termsDetailsViewController"));
  double v27 = (char *)[v26 numberOfRows];

  double v28 = &v27[v22];
  double v29 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDetailsViewController](self, "termsDetailsViewController"));
  [v29 setNumberOfRows:&v27[v22]];

  double v30 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (v22)
  {
    do
    {
      double v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  v27,  0LL));
      -[NSMutableArray addObject:](v30, "addObject:", v31);

      ++v27;
    }

    while ((uint64_t)v27 < (uint64_t)v28);
  }

  double v32 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDetailsViewController](self, "termsDetailsViewController"));
  double v33 = (void *)objc_claimAutoreleasedReturnValue([v32 tableView]);
  [v33 insertRowsAtIndexPaths:v30 withRowAnimation:100];

LABEL_21:
  double v34 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController view](self, "view"));
  [v34 setNeedsLayout];
}

- (void)_downloadTerms
{
  id v3 = sub_10004567C();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Downloading iCloud Terms", buf, 2u);
  }

  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
  [v5 setRequestCachePolicy:1];
  id v6 = objc_alloc_init(&OBJC_CLASS___AKAppleIDSession);
  objc_msgSend(v5, "set_appleIDContext:", v6);

  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](&OBJC_CLASS___NSURLSession, "sessionWithConfiguration:", v5));
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController _termsRequest](self, "_termsRequest"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000456BC;
  v10[3] = &unk_1000CA518;
  objc_copyWeak(&v11, &location);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 dataTaskWithRequest:v8 completionHandler:v10]);

  [v9 resume];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (id)_termsRequest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"https://setup.icloud.com/setup/atv/tos"));
  id v3 = -[NSMutableURLRequest initWithURL:cachePolicy:timeoutInterval:]( objc_alloc(&OBJC_CLASS___NSMutableURLRequest),  "initWithURL:cachePolicy:timeoutInterval:",  v2,  1LL,  30.0);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSDevice currentDevice](&OBJC_CLASS___SSDevice, "currentDevice"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userAgent]);
  -[NSMutableURLRequest setValue:forHTTPHeaderField:](v3, "setValue:forHTTPHeaderField:", v5, @"User-Agent");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AADeviceInfo clientInfoHeader](&OBJC_CLASS___AADeviceInfo, "clientInfoHeader"));
  -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v3,  "setValue:forHTTPHeaderField:",  v6,  @"X-MMe-Client-Info");

  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:NSLocaleCountryCode]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uppercaseString]);
  -[NSMutableURLRequest setValue:forHTTPHeaderField:](v3, "setValue:forHTTPHeaderField:", v9, @"X-MMe-Country");

  double v10 = (__CFString *)_CFNetworkCopyPreferredLanguageCode();
  if (v10)
  {
    id v11 = v10;
    if (-[__CFString hasPrefix:](v10, "hasPrefix:", @"es-"))
    {
      objc_super v12 = (void *)CFPreferencesCopyAppValue(@"AppleLocale", kCFPreferencesAnyApplication);
      if ([@"es_MX" isEqual:v12])
      {

        id v11 = @"es-mx";
      }
    }
  }

  else
  {
    id v11 = @"en-us";
  }

  -[NSMutableURLRequest setValue:forHTTPHeaderField:](v3, "setValue:forHTTPHeaderField:", v11, @"Accept-Language");
  -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v3,  "setValue:forHTTPHeaderField:",  @"true",  @"X-MMe-Show-Warranty");
  double v13 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  double v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "aa_primaryAppleAccount"));
  if (v14) {
    -[NSMutableURLRequest aa_addAuthTokenOrBasicAuthHeaderWithAccount:preferUsingPassword:]( v3,  "aa_addAuthTokenOrBasicAuthHeaderWithAccount:preferUsingPassword:",  v14,  1LL);
  }

  return v3;
}

- (void)_decodeTermsData:(id)a3
{
  if (a3)
  {
    double v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  0LL,  0LL));
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"terms"]);
    id v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(obj);
          }
          double v8 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"termsType"]);
          double v10 = objc_alloc(&OBJC_CLASS___NSData);
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"terms"]);
          objc_super v12 = -[NSData initWithBase64EncodedString:options:](v10, "initWithBase64EncodedString:options:", v11, 0LL);

          double v13 = -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithData:encoding:",  v12,  4LL);
          double v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDictionary](self, "termsDictionary"));
          [v14 setObject:v13 forKeyedSubscript:v9];
        }

        id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v5);
    }
  }

  -[SATVTermsViewController _getFallbackTermsAndFreeze](self, "_getFallbackTermsAndFreeze");
}

- (void)_getFallbackTermsAndFreeze
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDictionary](self, "termsDictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"tvOS"]);

  if (v4)
  {
    id v5 = 0LL;
  }

  else
  {
    uint64_t v6 = SFLicenseFilePath();
    double v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v24 = 0LL;
    double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  v7,  4LL,  &v24));
    id v5 = v24;
    if (v8)
    {
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDictionary](self, "termsDictionary"));
      [v9 setObject:v8 forKeyedSubscript:@"tvOS"];
    }

    else
    {
      id v10 = sub_10004567C();
      double v9 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
        sub_100077668();
      }
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDictionary](self, "termsDictionary"));
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"tvOS"]);
  -[SATVTermsViewController _freezeTerms:withName:](self, "_freezeTerms:withName:", v12, @"tvOSTerms");

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDictionary](self, "termsDictionary"));
  double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"iOSWarranty"]);

  if (v14)
  {
    id v15 = v5;
  }

  else
  {
    uint64_t v16 = SFWarrantyFilePath();
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v23 = v5;
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  v17,  4LL,  &v23));
    id v15 = v23;

    if (v18)
    {
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDictionary](self, "termsDictionary"));
      [v19 setObject:v18 forKeyedSubscript:@"iOSWarranty"];
    }

    else
    {
      id v20 = sub_10004567C();
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
        sub_100077608();
      }
    }
  }

  BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController termsDictionary](self, "termsDictionary"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"iOSWarranty"]);
  -[SATVTermsViewController _freezeTerms:withName:](self, "_freezeTerms:withName:", v22, @"Warranty");
}

- (void)_freezeTerms:(id)a3 withName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    double v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100045F1C;
    v11[3] = &unk_1000C9BA0;
    objc_super v12 = (os_log_s *)v6;
    id v13 = v5;
    dispatch_async(v8, v11);

    double v9 = v12;
  }

  else
  {
    id v10 = sub_10004567C();
    double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000776C8((uint64_t)v6, v9);
    }
  }
}

- (id)titleTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"TERMS_CONDITIONS_TITLE", @"Localizable");
}

- (id)subtitleTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"TERMS_CONDITIONS_SUBTITLE", @"Localizable");
}

- (id)consentButtonTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"TERMS_CONDITIONS_AGREE", @"Localizable");
}

- (id)dissentButtonTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"TERMS_CONDITIONS_DISAGREE", @"Localizable");
}

- (id)footnoteTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"TERMS_CONDITIONS_FOOTNOTE", @"Localizable");
}

- (id)footerButtonTextForConsentViewController:(id)a3
{
  if (-[SATVTermsViewController tvsk_layoutStyle](self, "tvsk_layoutStyle", a3)) {
    return 0LL;
  }
  id v4 = sub_10000D7CC(@"TERMS_CONDITIONS_VIEW_TITLE", @"Localizable");
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (void)consentViewControllerDidSelectConsent:(id)a3
{
  id v4 = sub_10004567C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "User accepted the terms and conditions", v6, 2u);
  }

  -[SATVTermsViewController _callCompletionHandlerWithConsent:](self, "_callCompletionHandlerWithConsent:", 1LL);
}

- (void)consentViewControllerDidSelectDissent:(id)a3
{
  id v4 = sub_10004567C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "User rejected the terms and conditions", v6, 2u);
  }

  -[SATVTermsViewController _callCompletionHandlerWithConsent:](self, "_callCompletionHandlerWithConsent:", 0LL);
}

- (void)consentViewControllerDidSelectFooter:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10004635C;
  v3[3] = &unk_1000C9468;
  v3[4] = self;
  +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v3, 0.25);
}

- (void)_callCompletionHandlerWithConsent:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController completionHandler](self, "completionHandler"));

  if (v5)
  {
    id v6 = (void (**)(id, BOOL))objc_claimAutoreleasedReturnValue(-[SATVTermsViewController completionHandler](self, "completionHandler"));
    v6[2](v6, v3);
  }

- (void)_callClientMenuHandlerWithConsent
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController clientMenuHandler](self, "clientMenuHandler"));

  if (v3)
  {
    id v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SATVTermsViewController clientMenuHandler](self, "clientMenuHandler"));
    v4[2]();
  }

- (void)_handleMenu
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsViewController consentViewController](self, "consentViewController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
  unsigned int v5 = [v4 isHidden];

  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100046570;
    v6[3] = &unk_1000C9468;
    v6[4] = self;
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v6, 0.25);
  }

  else
  {
    -[SATVTermsViewController _callClientMenuHandlerWithConsent](self, "_callClientMenuHandlerWithConsent");
  }

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSMutableDictionary)termsDictionary
{
  return self->_termsDictionary;
}

- (void)setTermsDictionary:(id)a3
{
}

- (SATVTermsDetailsViewController)termsDetailsViewController
{
  return self->_termsDetailsViewController;
}

- (void)setTermsDetailsViewController:(id)a3
{
}

- (SATVConsentViewController)consentViewController
{
  return self->_consentViewController;
}

- (void)setConsentViewController:(id)a3
{
}

- (UIFocusGuide)choiceFocusGuide
{
  return self->_choiceFocusGuide;
}

- (void)setChoiceFocusGuide:(id)a3
{
}

- (UIView)choiceView
{
  return self->_choiceView;
}

- (void)setChoiceView:(id)a3
{
}

- (id)clientMenuHandler
{
  return self->_clientMenuHandler;
}

- (void)setClientMenuHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end