void sub_51D0(uint64_t a1)
{
  uint64_t v2;
  os_log_s *v3;
  uint64_t v4;
  void *v5;
  uint8_t v6[16];
  v2 = VSDefaultLogObject(a1);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Will invoke app menu handler.", v6, 2u);
  }

  v4 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) menuHandler]);
  v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
}

void sub_52B4(uint64_t a1)
{
  uint64_t v2 = VSDefaultLogObject(a1);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Will invoke app setup step completion handler.", v6, 2u);
  }

  uint64_t v4 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completionHandler]);
  v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, void, void))(v4 + 16))( v4,  *(unsigned __int8 *)(a1 + 40),  *(unsigned __int8 *)(a1 + 41));
  }
}

void sub_5798( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

id sub_57CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

void sub_57D4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isInSetTopBoxMode])
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([v4 setTopBoxBundleIdentifier]);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 length] != 0;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }
}

void sub_5848(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = VSErrorLogObject();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_15BA8();
  }
}

void sub_5B7C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) result]);
  id v3 = (id)objc_claimAutoreleasedReturnValue([v2 forceUnwrapObject]);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_5C28;
  v5[3] = &unk_24610;
  uint64_t v6 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_5C78;
  v4[3] = &unk_24638;
  v4[4] = v6;
  [v3 unwrapObject:v5 error:v4];
}

void sub_5C28(uint64_t a1, uint64_t a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
  [v3 enqueueEvent:@"Loading Finished"];
}

void sub_5C78(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_15C08();
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
  [v6 enqueueEvent:@"Loading Failed"];
}

void sub_5D90(uint64_t a1, void *a2)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_5E4C;
  v7[3] = &unk_24688;
  uint64_t v4 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_5EF4;
  v5[3] = &unk_24638;
  id v6 = *(id *)(a1 + 40);
  [a2 unwrapObject:v7 error:v5];
}

void sub_5E4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:0]);
    [*(id *)(a1 + 32) setAccount:v4];
    [*(id *)(a1 + 40) enqueueEvent:@"Loading Finished"];
  }

  else
  {
    uint64_t v5 = VSErrorLogObject();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_15C68();
    }

    [*(id *)(a1 + 40) enqueueEvent:@"Loading Failed"];
  }
}

void sub_5EF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_15C94();
  }

  [*(id *)(a1 + 32) enqueueEvent:@"Loading Failed"];
}

void sub_60D4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) result]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 forceUnwrapObject]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_61B0;
  v7[3] = &unk_246D8;
  uint64_t v4 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v4;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_61E4;
  v5[3] = &unk_24638;
  id v6 = *(id *)(a1 + 48);
  [v3 unwrapObject:v7 error:v5];
}

id sub_61B0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) enqueueEvent:@"Loading Finished"];
}

void sub_61E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_15CF4();
  }

  [*(id *)(a1 + 32) enqueueEvent:@"Loading Failed"];
}

void sub_63B0(id *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1[4] nonChannelAppDescriptions]);

  if (!v2) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The [provider nonChannelAppDescriptions] parameter must not be nil.");
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1[4] nonChannelAppDescriptions]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1[5] accountStore]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstAccount]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 preferredAppID]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[VSDevice currentDevice](&OBJC_CLASS___VSDevice, "currentDevice"));
  id v8 = objc_alloc_init(&OBJC_CLASS___VSNonChannelAppDecider);
  [v8 setAppDescriptions:v3];
  [v8 setPreferredAppBundleOrAdamID:v6];
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 stringForAMSDeviceFamilies]);
  [v8 setPreferredDeviceFamily:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 decidedNonChannelApps]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 adamID]);
  v13 = v12;
  if (v12
    && (uint64_t v14 = objc_claimAutoreleasedReturnValue( +[LSApplicationRecord vs_applicationRecordWithStoreItemIdentifier:]( LSApplicationRecord,  "vs_applicationRecordWithStoreItemIdentifier:",  [v12 unsignedLongLongValue]))) != 0)
  {
    v15 = (void *)v14;
    uint64_t v16 = VSErrorLogObject();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_15DAC();
    }

    [a1[6] enqueueEvent:@"Loading Failed"];
  }

  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v11 contentRank]);
    v15 = v18;
    v27 = v3;
    if (v18) {
      uint64_t v19 = (uint64_t)[v18 integerValue];
    }
    else {
      uint64_t v19 = -1LL;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue([a1[5] restrictionsCenter]);
    id v21 = [v20 canInstallAppWithRating:v19];
    if ((_DWORD)v21)
    {
      uint64_t v22 = VSDefaultLogObject(v21);
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v11;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "Using app description: %@", buf, 0xCu);
      }

      [a1[5] setAppDescription:v11];
      v24 = @"Loading Finished";
    }

    else
    {
      uint64_t v25 = VSErrorLogObject();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_15D80();
      }

      v24 = @"Loading Failed";
    }

    [a1[6] enqueueEvent:v24];

    id v3 = v27;
  }
}

void sub_6920(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = VSErrorLogObject();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_15F0C();
    }

    [*(id *)(a1 + 32) enqueueEvent:@"Loading Failed"];
  }

  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_69FC;
    v9[3] = &unk_24700;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    id v10 = v6;
    uint64_t v11 = v7;
    id v12 = *(id *)(a1 + 32);
    VSPerformBlockOnMainThread(v9, v8);
  }
}

id sub_69FC(id *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1[4] icon]);

  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([a1[5] appDescription]);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1[4] icon]);
    [v3 setIcon:v4];
  }

  else
  {
    uint64_t v5 = VSErrorLogObject();
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR)) {
      sub_15F6C();
    }
  }

  return [a1[6] enqueueEvent:@"Loading Finished"];
}

void sub_6AF4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) buddyView]);

  if (!v3)
  {
    uint64_t v4 = objc_alloc(&OBJC_CLASS___VSSetupView);
    [v2 bounds];
    uint64_t v5 = -[VSSetupView initWithFrame:](v4, "initWithFrame:");
    [*(id *)(a1 + 32) setBuddyView:v5];
    -[VSSetupView setAutoresizingMask:](v5, "setAutoresizingMask:", 18LL);
    -[VSSetupView setDelegate:](v5, "setDelegate:", *(void *)(a1 + 32));
    [v2 addSubview:v5];
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identityProvider]);

    if (!v6) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The [self identityProvider] parameter must not be nil.");
    }
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identityProvider]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appDescription]);
    v44 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 displayName]);
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 forceUnwrapObject]);

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appName]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 shortenedDisplayName]);

    if (v12)
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v8 shortenedDisplayName]);

      uint64_t v11 = (void *)v13;
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appDescription]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 icon]);

    if (!v15)
    {
      uint64_t v16 = VSErrorLogObject();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_15F98();
      }
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appDescription]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 icon]);
    -[VSSetupView setImage:](v5, "setImage:", v19);

    v42 = v11;
    -[VSSetupView setAppName:](v5, "setAppName:", v11);
    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v8 rating]);
    if (v21)
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
      v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 localizedStringForKey:@"RATINGS_FOOTNOTE_FORMAT" value:0 table:0]);

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v23, v21));
      -[NSMutableArray addObject:](v20, "addObject:", v24);
    }

    v43 = v8;
    if ([v8 offersInAppPurchases])
    {
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
      v26 = (void *)objc_claimAutoreleasedReturnValue( [v25 localizedStringForKey:@"OFFERS_IN_APP_PURCHASES" value:0 table:0]);
      -[NSMutableArray addObject:](v20, "addObject:", v26);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v20, "componentsJoinedByString:", @"\n"));
    -[VSSetupView setFootnote:](v5, "setFootnote:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    v41 = (void *)objc_claimAutoreleasedReturnValue([v28 localizedStringForKey:@"INSTALL_APP_TITLE_FORMAT" value:0 table:0]);

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v41, v10));
    -[VSSetupView setTitle:](v5, "setTitle:", v40);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    v30 = (void *)objc_claimAutoreleasedReturnValue( [v29 localizedStringForKey:@"INSTALL_APP_MESSAGE_FORMAT" value:0 table:0]);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v30, v10));
    -[VSSetupView setMessage:](v5, "setMessage:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    v39 = (void *)v10;
    v33 = (void *)objc_claimAutoreleasedReturnValue( [v32 localizedStringForKey:@"INSTALL_APP_BUTTON_FORMAT" value:0 table:0]);

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v33, v11));
    -[VSSetupView setBeginButtonTitle:](v5, "setBeginButtonTitle:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 localizedStringForKey:@"NOT_NOW_BUTTON_TITLE" value:0 table:0]);
    -[VSSetupView setSkipButtonTitle:](v5, "setSkipButtonTitle:", v36);

    -[VSSetupView setShouldOverrideSkipButtonStyle:](v5, "setShouldOverrideSkipButtonStyle:", 0LL);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v37 localizedStringForKey:@"INSTALL_APP_DISCLAIMER" value:0 table:0]);

    -[VSSetupView setFooter:](v5, "setFooter:", v38);
    -[VSSetupView setNeedsFocusUpdate](v5, "setNeedsFocusUpdate");
    [v2 setAlpha:0.0];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_705C;
    v45[3] = &unk_24558;
    id v46 = v2;
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v45, 0.3);
  }
}

id sub_705C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

LABEL_8:
}

id sub_713C()
{
  if (qword_2BF80 != -1) {
    dispatch_once(&qword_2BF80, &stru_24768);
  }
  return (id)qword_2BF78;
}

void sub_79A0(id a1)
{
  v1 = sub_79C4();
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)qword_2BF78;
  qword_2BF78 = v2;
}

NSMutableSet *sub_79C4()
{
  v0 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[NSMutableSet addObject:](v0, "addObject:", @"Waiting to Reverse without Loading Account");
  -[NSMutableSet addObject:](v0, "addObject:", @"Waiting to Reverse without Loading Provider Info");
  -[NSMutableSet addObject:](v0, "addObject:", @"Waiting to Reverse without Loading App Info");
  -[NSMutableSet addObject:](v0, "addObject:", @"Waiting to Reverse without Loading App Icon");
  -[NSMutableSet addObject:](v0, "addObject:", @"Waiting to Reverse without Offering Installation");
  -[NSMutableSet addObject:](v0, "addObject:", @"Waiting to Reverse after Offering Installation");
  return v0;
}

void sub_7A4C(id a1)
{
  v1 = sub_7A70();
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)qword_2BF88;
  qword_2BF88 = v2;
}

NSMutableSet *sub_7A70()
{
  v0 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[NSMutableSet addObject:](v0, "addObject:", @"Waiting to Advance without Offering Installation");
  -[NSMutableSet addObject:](v0, "addObject:", @"Waiting to Advance after Accepting Installation");
  -[NSMutableSet addObject:](v0, "addObject:", @"Waiting to Advance after Rejecting Installation");
  return v0;
}

void sub_7AC8(id a1)
{
  v1 = sub_7AEC();
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)qword_2BF98;
  qword_2BF98 = v2;
}

NSMutableSet *sub_7AEC()
{
  v0 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[NSMutableSet addObject:](v0, "addObject:", @"Advanced after Accepting Installation");
  -[NSMutableSet addObject:](v0, "addObject:", @"Advanced after Rejecting Installation");
  return v0;
}

void sub_7B34( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_7B44(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_7B50( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

void sub_8358(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___VSSetupFlowController);
  uint64_t v2 = (void *)qword_2BFA8;
  qword_2BFA8 = (uint64_t)v1;
}

id sub_8E10(uint64_t a1, int a2, int a3)
{
  if (*(_BYTE *)(a1 + 48)) {
    BOOL v5 = a3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) storage]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 voucherLockbox]);

    [v7 issueVouchers:*(void *)(a1 + 40)];
  }

  if (a2)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
    [v8 setupFlowControllerNeedsDismissalOfSetupView];
  }

  v9 = *(void **)(a1 + 32);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_8EE8;
  v11[3] = &unk_247F0;
  char v12 = a2;
  v11[4] = v9;
  int v13 = *(_DWORD *)(a1 + 49);
  return [v9 _dismissViewController:0 completion:v11];
}

void sub_8EE8(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40))
  {
    [*(id *)(a1 + 32) _finishAfterOfferingOptions:1 endingUndoGrouping:*(unsigned __int8 *)(a1 + 41)];
  }

  else
  {
    uint64_t v2 = VSDefaultLogObject(a1);
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Setup flow dismissed access request.", buf, 2u);
    }

    if (*(_BYTE *)(a1 + 42))
    {
      uint64_t v5 = VSDefaultLogObject(v4);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v22 = 0;
        _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "Setup flow arrived via not now button. Doing nothing.",  v22,  2u);
      }
    }

    else
    {
      int v7 = *(unsigned __int8 *)(a1 + 43);
      uint64_t v8 = VSDefaultLogObject(v4);
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v10)
        {
          *(_WORD *)id v21 = 0;
          _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "Setup flow arrived after signing in. Undoing account addition and reloading.",  v21,  2u);
        }

        uint64_t v11 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) undoManager]);
        char v12 = (void *)v11;
        if (*(_BYTE *)(a1 + 41))
        {
          uint64_t v13 = VSDefaultLogObject(v11);
          uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v20 = 0;
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "End undo grouping.", v20, 2u);
          }

          [v12 endUndoGrouping];
        }

        [v12 undo];
        [*(id *)(a1 + 32) _startLoadingAfterOfferingOptions:0 endingUndoGrouping:0 arrivedViaNotNowButton:0 arrivedAfterSigningIn:0 goingBack:*(unsigned __int8 *)(a1 + 44)];
      }

      else
      {
        if (v10)
        {
          *(_WORD *)uint64_t v19 = 0;
          _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "Setup flow arrived automatically. Going backward automatically.",  v19,  2u);
        }

        uint64_t v15 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) undoManager]);
        char v12 = (void *)v15;
        if (*(_BYTE *)(a1 + 41))
        {
          uint64_t v16 = VSDefaultLogObject(v15);
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v18 = 0;
            _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "End undo grouping.", v18, 2u);
          }

          [v12 endUndoGrouping];
        }

        [v12 undo];
        [*(id *)(a1 + 32) _goBack];
      }
    }
  }
}

void sub_94D4(_Unwind_Exception *a1)
{
}

void sub_94F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startLoadingAfterOfferingOptions:0 endingUndoGrouping:0 arrivedViaNotNowButton:0 arrivedAfterSigningIn:0 goingBack:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t sub_9544(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_9550(uint64_t a1, char a2, void *a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_95F4;
  block[3] = &unk_24890;
  char v8 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v6;
  dispatch_async(&_dispatch_main_q, block);
}

uint64_t sub_95F4(uint64_t a1)
{
  uint64_t v2 = VSDefaultLogObject(a1);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    v7[0] = 67109378;
    v7[1] = v4;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "Account import complete. Will complete start loading. didImport=%{BOOL}d, error=%@",  (uint8_t *)v7,  0x12u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_9840(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) result]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 forceUnwrapObject]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_9928;
  v10[3] = &unk_24908;
  uint64_t v11 = *(void *)(a1 + 32);
  char v12 = *(_BYTE *)(a1 + 48);
  v4.i32[0] = *(_DWORD *)(a1 + 49);
  uint16x8_t v5 = vmovl_u8(v4);
  __int32 v13 = v4.i32[0];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_9F64;
  v6[3] = &unk_24930;
  v6[4] = v11;
  char v7 = v12;
  __int8 v8 = v5.i8[0];
  __int8 v9 = v5.i8[2];
  [v3 unwrapObject:v10 error:v6];
}

void sub_9928(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSDefaultLogObject(v3);
  uint16x8_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[VSSetupFlowController _startLoadingAfterOfferingOptions:endingUndoGrouping:arrivedViaNotNowButton:arrivedAft"
          "erSigningIn:goingBack:]_block_invoke_2";
    __int16 v24 = 2112;
    id v25 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  id v6 = [v3 shouldSkipSetupEntirely];
  if ((_DWORD)v6)
  {
    uint64_t v7 = VSDefaultLogObject(v6);
    __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Skipping setup entirely.", buf, 2u);
    }

    [*(id *)(a1 + 32) finishOrIsGoingBack:*(unsigned __int8 *)(a1 + 40) didOfferOptions:*(unsigned __int8 *)(a1 + 41) endingUndoGrouping:*(unsigned __int8 *)(a1 + 42)];
  }

  else
  {
    __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v3 supportedApps]);
    [*(id *)(a1 + 32) setSupportedApps:v9];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v3 identityProvider]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_9B24;
    v14[3] = &unk_248E0;
    unsigned __int8 v18 = [v3 shouldOfferSTBAuthenticationFlow];
    id v11 = v3;
    uint64_t v12 = *(void *)(a1 + 32);
    id v15 = v11;
    uint64_t v16 = v12;
    id v17 = v10;
    char v19 = *(_BYTE *)(a1 + 42);
    __int16 v20 = *(_WORD *)(a1 + 43);
    __int16 v21 = *(_WORD *)(a1 + 40);
    id v13 = v10;
    +[VSMultiAppInstallUtility determineMultiAppEnabledForProvider:completion:]( &OBJC_CLASS___VSMultiAppInstallUtility,  "determineMultiAppEnabledForProvider:completion:",  v13,  v14);
  }
}

void sub_9B24(uint64_t a1, int a2)
{
  int v3 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v4 = *(void **)(a1 + 32);
  if (v3) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = a2 == 0;
  }
  if (!v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 msoAppDescription]);
    __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) providerAccountUsername]);
    id v9 = [*(id *)(a1 + 40) setAppDescription:v7];
    if (v8) {
      id v9 = [*(id *)(a1 + 40) setProviderAccountUsername:v8];
    }
    if (a2
      && (id v9 = [*(id *)(a1 + 40) isInSTBMode], (v9 & 1) == 0)
      && *(void *)(a1 + 48))
    {
      uint64_t v10 = VSDefaultLogObject(v9);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Showing MultiAppInstall Directly", buf, 2u);
      }

      uint64_t v12 = *(void *)(a1 + 48);
      if (!v12)
      {
        +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The identityProviderOrNil parameter must not be nil.");
        uint64_t v12 = *(void *)(a1 + 48);
      }

      [*(id *)(a1 + 40) showMultiAppInstallVC:v12];
    }

    else
    {
      uint64_t v18 = VSDefaultLogObject(v9);
      char v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v45 = 0;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Offering STB authentication flow", v45, 2u);
      }

      [*(id *)(a1 + 40) _offerAuthenticationForSTBProvider:*(void *)(a1 + 48) msoAppDescription:v7 providerAccountUsername:v8];
    }

LABEL_23:
    return;
  }

  id v13 = [v4 shouldOfferSoleAuthenticationFlow];
  if ((_DWORD)v13)
  {
    uint64_t v14 = VSDefaultLogObject(v13);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Offering sole authentication flow.", v44, 2u);
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) msoAppDescription]);
    objc_msgSend( *(id *)(a1 + 40),  "_offerAuthenticationForProvider:withSupportedAppsButton:msoAppDescription:",  *(void *)(a1 + 48),  objc_msgSend(*(id *)(a1 + 32), "canShowSupportedAppsButton"),  v7);
    uint64_t v16 = *(void **)(a1 + 40);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundlesIDsToConsent]);
    [v16 setFreeOnBoardingBundleIDs:v17];

    goto LABEL_23;
  }

  id v20 = [*(id *)(a1 + 32) shouldOfferAuthenticationFlow];
  if ((_DWORD)v20)
  {
    uint64_t v21 = VSDefaultLogObject(v20);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Offering authentication flow.", v43, 2u);
    }

    objc_msgSend( *(id *)(a1 + 40),  "_offerAuthenticationWithSupportedAppsButton:",  objc_msgSend(*(id *)(a1 + 32), "canShowSupportedAppsButton"));
    v23 = *(void **)(a1 + 40);
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundlesIDsToConsent]);
    [v23 setFreeOnBoardingBundleIDs:v24];
  }

  else
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundlesIDsToConsent]);
    id v26 = [v25 count];

    uint64_t v28 = VSDefaultLogObject(v27);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v30)
      {
        *(_WORD *)v42 = 0;
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "Has bundle IDs to consent.", v42, 2u);
      }

      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[VSACAccount sharedInstance](&OBJC_CLASS___VSACAccount, "sharedInstance"));
      id v31 = [v7 hasAccount];
      if ((_DWORD)v31)
      {
        v32 = *(void **)(a1 + 40);
        v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundlesIDsToConsent]);
        v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) vouchersByBundleID]);
        v35 = (void *)objc_claimAutoreleasedReturnValue([v34 allValues]);
        v36 = (void *)objc_claimAutoreleasedReturnValue([v7 username]);
        LOWORD(v39) = *(_WORD *)(a1 + 59);
        objc_msgSend( v32,  "_obtainConsentForBundleIDs:vouchers:withAppleAccountName:identityProvider:endingUndoGrouping:arrivedViaNotNowB utton:arrivedAfterSigningIn:goingBack:",  v33,  v35,  v36,  *(void *)(a1 + 48),  *(unsigned __int8 *)(a1 + 57),  *(unsigned __int8 *)(a1 + 58),  v39);
      }

      else
      {
        uint64_t v37 = VSDefaultLogObject(v31);
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v41 = 0;
          _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, "No apple account; finishing;", v41, 2u);
        }

        [*(id *)(a1 + 40) finishOrIsGoingBack:*(unsigned __int8 *)(a1 + 60) didOfferOptions:*(unsigned __int8 *)(a1 + 61) endingUndoGrouping:*(unsigned __int8 *)(a1 + 57)];
      }

      goto LABEL_23;
    }

    if (v30)
    {
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "Nothing to do; finishing.", v40, 2u);
    }

    [*(id *)(a1 + 40) finishOrIsGoingBack:*(unsigned __int8 *)(a1 + 60) didOfferOptions:*(unsigned __int8 *)(a1 + 61) endingUndoGrouping:*(unsigned __int8 *)(a1 + 57)];
  }

void sub_9F64(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject();
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_16024(v3, v5);
  }

  [*(id *)(a1 + 32) finishOrIsGoingBack:*(unsigned __int8 *)(a1 + 40) didOfferOptions:*(unsigned __int8 *)(a1 + 41) endingUndoGrouping:*(unsigned __int8 *)(a1 + 42)];
}

void sub_A204(id *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1[5] result]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 forceUnwrapObject]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  _DWORD v7[2] = sub_A2F0;
  v7[3] = &unk_249F8;
  id v4 = a1[6];
  id v5 = a1[4];
  id v8 = v4;
  id v9 = v5;
  id v10 = a1[7];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_A85C;
  v6[3] = &unk_24638;
  v6[4] = a1[4];
  [v3 unwrapObject:v7 error:v6];
}

void sub_A2F0(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(&OBJC_CLASS___VSIdentityProviderFilter);
  [v4 setAllIdentityProviders:v3];

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 filteredIdentityProviders]);
  uint64_t v53 = 0LL;
  v54 = &v53;
  uint64_t v55 = 0x3032000000LL;
  v56 = sub_A804;
  v57 = sub_A814;
  id v58 = 0LL;
  uint64_t v47 = 0LL;
  v48 = &v47;
  uint64_t v49 = 0x3032000000LL;
  v50 = sub_A804;
  v51 = sub_A814;
  id v52 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1[4] result]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 forceUnwrapObject]);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_A81C;
  v46[3] = &unk_24980;
  v46[4] = &v53;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_A82C;
  v45[3] = &unk_249A8;
  void v45[4] = &v47;
  [v7 unwrapObject:v46 error:v45];

  if (v48[5])
  {
    uint64_t v9 = VSDefaultLogObject(v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "End undo grouping.", buf, 2u);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue([a1[5] undoManager]);
    [v11 endUndoGrouping];

    id v12 = a1[5];
    id v13 = (void *)v48[5];
    if (!v13)
    {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The currentStorefrontErrorOrNil parameter must not be nil.");
      id v13 = (void *)v48[5];
    }

    id v14 = v13;
    [v12 _presentError:v14];
  }

  else
  {
    *(void *)buf = 0LL;
    v40 = buf;
    uint64_t v41 = 0x3032000000LL;
    v42 = sub_A804;
    v43 = sub_A814;
    id v44 = 0LL;
    uint64_t v33 = 0LL;
    v34 = &v33;
    uint64_t v35 = 0x3032000000LL;
    v36 = sub_A804;
    uint64_t v37 = sub_A814;
    id v38 = 0LL;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([a1[6] result]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 forceUnwrapObject]);
    v32[1] = 3221225472LL;
    v32[2] = sub_A83C;
    v32[3] = &unk_249D0;
    v32[4] = buf;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_A84C;
    v31[3] = &unk_249A8;
    v31[4] = &v33;
    v32[0] = _NSConcreteStackBlock;
    [v16 unwrapObject:v32 error:v31];

    if (v34[5])
    {
      uint64_t v18 = VSDefaultLogObject(v17);
      char v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v30 = 0;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "End undo grouping.", v30, 2u);
      }

      id v20 = (void *)objc_claimAutoreleasedReturnValue([a1[5] undoManager]);
      [v20 endUndoGrouping];

      id v21 = a1[5];
      uint64_t v22 = (void *)v34[5];
      if (!v22)
      {
        +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The allStorefrontsErrorOrNil parameter must not be nil.");
        uint64_t v22 = (void *)v34[5];
      }

      id v23 = v22;
      [v21 _presentError:v23];
    }

    else if ([v5 count])
    {
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(+[VSViewControllerFactory sharedFactory](&OBJC_CLASS___VSViewControllerFactory, "sharedFactory"));
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 identityProviderPickerViewControllerWithIdentityProviders:v5]);
      id v23 = (id)objc_claimAutoreleasedReturnValue([v25 forceUnwrapObject]);

      [v23 setDelegate:a1[5]];
      [v23 setCancellationAllowed:1];
      [v23 setAllStorefronts:*((void *)v40 + 5)];
      [v23 setRequestedStorefrontCountryCode:v54[5]];
      [a1[5] _pickProviderWithViewController:v23];
    }

    else
    {
      uint64_t v26 = VSDefaultLogObject(0LL);
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v30 = 0;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "End undo grouping.", v30, 2u);
      }

      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([a1[5] undoManager]);
      [v28 endUndoGrouping];

      uint64_t v29 = VSPrivateErrorWithRecoverySuggestion(-25LL, 0LL, 0LL);
      id v23 = (id)objc_claimAutoreleasedReturnValue(v29);
      [a1[5] _presentError:v23];
    }

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(buf, 8);
  }

  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
}

void sub_A7AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

uint64_t sub_A804(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_A814(uint64_t a1)
{
}

void sub_A81C(uint64_t a1, void *a2)
{
}

void sub_A82C(uint64_t a1, void *a2)
{
}

void sub_A83C(uint64_t a1, void *a2)
{
}

void sub_A84C(uint64_t a1, void *a2)
{
}

void sub_A85C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSDefaultLogObject(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "End undo grouping.", v7, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) undoManager]);
  [v6 endUndoGrouping];

  [*(id *)(a1 + 32) _presentError:v3];
}

void sub_AD14(uint64_t a1, int a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    [v3 showMultiAppInstallVC:*(void *)(a1 + 40)];
  }

  else
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue([v3 delegate]);
    [v4 setupFlowControllerDidFinish:*(void *)(a1 + 32)];
  }

void sub_B000(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (a3)
  {
    if (([*(id *)(a1 + 32) isInSTBMode] & 1) == 0)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) storage]);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accountStore]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstAccountIfLoaded]);

      if (v8) {
        [*(id *)(a1 + 32) forceSignOutWithAccount:v8];
      }
    }

    [*(id *)(a1 + 32) _goBack];
  }

  else
  {
    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_B230;
    v17[3] = &unk_24A70;
    id v18 = *(id *)(a1 + 40);
    id v19 = *(id *)(a1 + 48);
    id v10 = v9;
    id v20 = v10;
    [v5 enumerateObjectsUsingBlock:v17];
    else {
      objc_msgSend(*(id *)(a1 + 32), "setDidSelectNoAppsforInstall:", -[NSMutableArray count](v10, "count") == 0);
    }
    if ([*(id *)(a1 + 32) isInSTBMode]
      || (-[NSMutableArray containsObject:](v10, "containsObject:", *(void *)(a1 + 56)) & 1) != 0)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) appPlacementPosition]);
      +[VSRequestAppInstallUtility markSTBProviderAppsForInstallation:rootAppPlacementPosition:]( &OBJC_CLASS___VSRequestAppInstallUtility,  "markSTBProviderAppsForInstallation:rootAppPlacementPosition:",  v10,  v11);
    }

    else
    {
      +[VSRequestAppInstallUtility markSTBProviderAppsForInstallation:rootAppPlacementPosition:]( &OBJC_CLASS___VSRequestAppInstallUtility,  "markSTBProviderAppsForInstallation:rootAppPlacementPosition:",  v10,  0LL);
    }

    id v12 = *(void **)(a1 + 32);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_B284;
    v14[3] = &unk_24700;
    void v14[4] = v12;
    id v15 = *(id *)(a1 + 64);
    uint64_t v16 = v10;
    id v13 = v10;
    [v12 _dismissViewController:0 completion:v14];
  }
}

void sub_B230(id *a1, uint64_t a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectAtIndex:", objc_msgSend(a1[4], "indexOfObject:", a2)));
  [a1[6] addObject:v3];
}

void sub_B284(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) isInSTBMode];
  if ((_DWORD)v2)
  {
    uint64_t v3 = VSDefaultLogObject(v2);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "We Are in STB Mode, Do Not Show Bulk Consent", buf, 2u);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
    [v5 setupFlowControllerDidFinish:*(void *)(a1 + 32)];
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) providerID]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 forceUnwrapObject]);

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[VSPrivacyVoucherLockbox getVouchersFromSelectedAppDescriptions:forProviderID:]( &OBJC_CLASS___VSPrivacyVoucherLockbox,  "getVouchersFromSelectedAppDescriptions:forProviderID:",  *(void *)(a1 + 48),  v5));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_B3D8;
    v11[3] = &unk_24A98;
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v7;
    id v13 = v8;
    id v10 = v7;
    +[VSMultiAppInstallUtility getPendingConsentBundleIDsFromSelectedAppDescriptions:completionHandler:]( &OBJC_CLASS___VSMultiAppInstallUtility,  "getPendingConsentBundleIDsFromSelectedAppDescriptions:completionHandler:",  v9,  v11);
  }
}

void sub_B3D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  _DWORD v7[2] = sub_B480;
  v7[3] = &unk_24A20;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(&_dispatch_main_q, v7);
}

void sub_B480(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[VSACAccount sharedInstance](&OBJC_CLASS___VSACAccount, "sharedInstance"));
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    id v8 = v2;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 username]);
    LOWORD(v7) = 0;
    objc_msgSend( v3,  "_obtainConsentForBundleIDs:vouchers:withAppleAccountName:identityProvider:endingUndoGrouping:arrivedViaNotNowButto n:arrivedAfterSigningIn:goingBack:",  v4,  v5,  v6,  *(void *)(a1 + 56),  1,  0,  v7);
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) delegate]);
    [v8 setupFlowControllerDidFinish:*(void *)(a1 + 40)];
  }
}

void sub_BBF8(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  uint64_t v4 = a3;
  uint64_t v5 = VSDefaultLogObject(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "Force sign out request completed.  Success: %d, Error:%@",  (uint8_t *)v7,  0x12u);
  }
}

LABEL_13:
  return v4;
}

void sub_C154(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v2 setupFlowControllerDidFinishSilentSigningIn:*(void *)(a1 + 32)];
}

void sub_C194(uint64_t a1, void *a2)
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a2 providerID]);

  if (!v3)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      uint64_t v5 = *(void *)(a1 + 40);
    }

    else
    {
      uint64_t v5 = *(void *)(a1 + 48);
      if (!v5) {
        return;
      }
    }

    (*(void (**)(void))(v5 + 16))();
    return;
  }

  if (*(_BYTE *)(a1 + 56))
  {
    id v4 = objc_retainBlock(*(id *)(a1 + 40));
  }

  else
  {
    id v4 = objc_retainBlock(*(id *)(a1 + 48));
    [*(id *)(a1 + 32) setGoingBackActivationCompletionBlock:v4];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) privateQueue]);
  id v7 = objc_alloc_init(&OBJC_CLASS___VSIdentityProviderFetchAllOperation);
  [v6 addOperation:v7];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_C2E8;
  v13[3] = &unk_24B78;
  uint64_t v8 = *(void *)(a1 + 32);
  id v14 = v7;
  uint64_t v15 = v8;
  id v16 = v4;
  id v9 = v4;
  id v10 = v7;
  uint64_t v11 = VSMainThreadOperationWithBlock(v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v12 addDependency:v10];
  VSEnqueueCompletionOperation(v12);
}

void sub_C2E8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) result]);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 forceUnwrapObject]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  _DWORD v7[2] = sub_C3C4;
  v7[3] = &unk_24B28;
  id v4 = *(void **)(a1 + 48);
  void v7[4] = *(void *)(a1 + 40);
  id v8 = v4;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_C5B0;
  v5[3] = &unk_24B50;
  id v6 = *(id *)(a1 + 48);
  [v3 unwrapObject:v7 error:v5];
}

void sub_C3C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSDefaultLogObject(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134217984;
    id v16 = [v3 count];
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "startSilentSigningInForSTB: %ld providers", (uint8_t *)&v15, 0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _getProviderWithUserTokenFromAllProviders:v3]);
  id v7 = [v6 isFullySupportedForRequestsExpectingAuthenticationSchemes:0];
  if ((_DWORD)v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) preferences]);
    [v8 setIsInSTBMode:1];

    if (([v6 isDeveloper] & 1) == 0)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) preferences]);
      [v9 setSetTopBoxActivationTime];
    }

    id v10 = -[VSIdentityProviderRequestManager initWithIdentityProvider:]( objc_alloc(&OBJC_CLASS___VSIdentityProviderRequestManager),  "initWithIdentityProvider:",  v6);
    -[VSIdentityProviderRequestManager setDelegate:](v10, "setDelegate:", *(void *)(a1 + 32));
    [*(id *)(a1 + 32) setRequestManager:v10];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) storage]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[VSIdentityProviderRequest silentMakeAccountRequestWithStorage:]( &OBJC_CLASS___VSIdentityProviderRequest,  "silentMakeAccountRequestWithStorage:",  v11));

    -[VSIdentityProviderRequestManager enqueueRequest:](v10, "enqueueRequest:", v12);
  }

  else
  {
    uint64_t v13 = VSDefaultLogObject(v7);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEFAULT,  "startSilentSigningInForSTB: Provider is not fully supported.",  (uint8_t *)&v15,  2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void sub_C5B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_16248();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_C7FC(id a1, VSIdentityProviderResponse *a2)
{
  id v2 = a2;
  uint64_t v3 = VSDefaultLogObject(v2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "Not now sign out request completed with response: %@",  (uint8_t *)&v5,  0xCu);
  }
}

void sub_C8A4(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = VSErrorLogObject();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_162A8();
  }
}

void sub_C9B0(uint64_t a1)
{
  uint64_t v2 = VSDefaultLogObject(a1);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "End undo grouping.", v5, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) undoManager]);
  [v4 endUndoGrouping];
}

void sub_CCD4(uint64_t a1, void *a2)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  _DWORD v7[2] = sub_CD90;
  v7[3] = &unk_246B0;
  uint64_t v4 = *(void **)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_D014;
  v5[3] = &unk_24558;
  id v6 = *(id *)(a1 + 40);
  [a2 conditionallyUnwrapObject:v7 otherwise:v5];
}

void sub_CD90(uint64_t a1, void *a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_CE24;
  v6[3] = &unk_24C28;
  uint64_t v3 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_CEE8;
  v4[3] = &unk_24638;
  id v5 = v3;
  [a2 unwrapObject:v6 error:v4];
}

id sub_CE24(uint64_t a1)
{
  uint64_t v2 = VSDefaultLogObject(a1);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Successfully saved unsupported account", buf, 2u);
  }

  uint64_t v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_CECC;
  v6[3] = &unk_24558;
  v6[4] = v4;
  return [v4 _dismissViewController:0 completion:v6];
}

id sub_CECC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _offerFreeOnBoardingIfNeededAfterOfferingOptions:1 endingUndoGrouping:1 arrivedViaNotNowButton:0 arrivedAfterSigningIn:1 goingBack:0];
}

void sub_CEE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSDefaultLogObject(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Failed to save account: %@", buf, 0xCu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_D008;
  v8[3] = &unk_24C50;
  id v9 = *(id *)(a1 + 32);
  uint64_t v6 = VSAlertForError(v3, v8);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [*(id *)(a1 + 32) presentViewController:v7 animated:1 completion:0];
}

id sub_D008(uint64_t a1)
{
  return [*(id *)(a1 + 32) deselectSelectedProviderAnimated:1];
}

id sub_D014(uint64_t a1)
{
  return [*(id *)(a1 + 32) deselectSelectedProviderAnimated:1];
}

void sub_D2A4(uint64_t a1, void *a2)
{
  id v3 = [a2 didCreateAccount];
  if ((v3 & 1) != 0)
  {
    id v4 = [*(id *)(a1 + 32) isInSTBMode];
    if ((v4 & 1) != 0)
    {
      id v5 = *(void **)(a1 + 32);
      id v11 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identityProvider]);
      [v5 finishSTBSuccessFlowForProvider:v11 shouldShowBulkConsent:0];

      return;
    }

    uint64_t v10 = VSDefaultLogObject(v4);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v8 = "Not in STB mode";
      id v9 = buf;
      goto LABEL_8;
    }
  }

  else
  {
    uint64_t v6 = VSDefaultLogObject(v3);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      id v8 = "Failed to create account";
      id v9 = (uint8_t *)&v13;
LABEL_8:
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }
}

void sub_D38C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_16368();
  }

  uint64_t v7 = VSDefaultLogObject(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "End undo grouping.", buf, 2u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) undoManager]);
  [v9 endUndoGrouping];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) navigationController]);
  uint64_t IsPublicError = VSErrorIsPublicError(v3, 2LL);
  if ((_DWORD)IsPublicError)
  {
    uint64_t v12 = VSDefaultLogObject(IsPublicError);
    __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "user gave up on waiting for authentication to finish", buf, 2u);
    }

    id v14 = [v10 popToRootViewControllerAnimated:1];
  }

  else
  {
    uint64_t v15 = VSErrorLogObject();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_16308();
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_D564;
    v19[3] = &unk_24C50;
    id v20 = *(id *)(a1 + 40);
    uint64_t v17 = VSAlertForError(v3, v19);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    [*(id *)(a1 + 40) presentViewController:v18 animated:1 completion:0];
  }
}

id sub_D564(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

id sub_D678(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startLoadingAfterOfferingOptions:1 endingUndoGrouping:1 arrivedViaNotNowButton:0 arrivedAfterSigningIn:1 goingBack:0];
}

void sub_DD80(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    [*(id *)(a1 + 32) _checkForExistingAccounts];
  }

  else
  {
    if (!v5) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The errorOrNil parameter must not be nil.");
    }
    id v7 = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
    unsigned int v9 = [v8 isEqual:VSErrorDomain];

    if (v9 && [v7 code] == (char *)&dword_0 + 1)
    {
      uint64_t v10 = VSDefaultLogObject(1LL);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v13 = 0;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Unsupported provider.  Will skip entire flow.", v13, 2u);
      }

      uint64_t v12 = objc_alloc_init(&OBJC_CLASS___VSSetupFlowConfiguration);
      -[VSSetupFlowConfiguration setShouldSkipSetupEntirely:](v12, "setShouldSkipSetupEntirely:", 1LL);
      [*(id *)(a1 + 32) _finishWithFlow:v12];
    }

    else
    {
      [*(id *)(a1 + 32) _finishWithError:v7];
    }
  }
}

id sub_DF98(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_E014;
  v4[3] = &unk_24C28;
  uint64_t v5 = *(void *)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_E144;
  v3[3] = &unk_24638;
  v3[4] = v5;
  return [a2 unwrapObject:v4 error:v3];
}

void sub_E014(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 count];
  if (!v4) {
    goto LABEL_6;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  uint64_t v6 = VSDefaultLogObject(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Existing account %@", (uint8_t *)&v10, 0xCu);
  }

  if (v5)
  {
    [*(id *)(a1 + 32) _fetchProviderForAccount:v5];
  }

  else
  {
LABEL_6:
    uint64_t v8 = VSDefaultLogObject(v4);
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "No existing accounts.", (uint8_t *)&v10, 2u);
    }

    [*(id *)(a1 + 32) _fetchAllProvidersIfNeeded];
  }
}

void sub_E144(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_16428();
  }

  [*(id *)(a1 + 32) _finishWithError:v3];
}

void sub_E264(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 providerID]);

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 providerID]);

    if (!v5) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The [profile providerID] parameter must not be nil.");
    }
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 providerID]);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v7 = *(id *)(a1 + 32);
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v8)
    {
      uint64_t v17 = a1;
      uint64_t v9 = *(void *)v19;
      while (2)
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
          __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 forceUnwrapObject]);
          unsigned int v14 = [v13 isEqualToString:v6];

          if (v14)
          {
            id v8 = v11;
            uint64_t v15 = VSDefaultLogObject(v8);
            id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v23 = v8;
              _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Found matching provider %@", buf, 0xCu);
            }

            goto LABEL_16;
          }
        }

        id v8 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
        if (v8) {
          continue;
        }
        break;
      }

LABEL_16:
      a1 = v17;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_E4EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 providerID]);

  if (v7)
  {
    [*(id *)(a1 + 32) _fetchAllProviders];
  }

  else
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___VSAMSBagLoadOperation);
    [v8 setBagKey:VSAMSBagKeySoleProviderFeatureEnabled];
    objc_initWeak(&location, v8);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_E630;
    v10[3] = &unk_24D68;
    objc_copyWeak(&v11, &location);
    void v10[4] = *(void *)(a1 + 32);
    [v8 setCompletionBlock:v10];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) privateQueue]);
    [v9 addOperation:v8];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void sub_E610( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_E630(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained value]);
  uint64_t v4 = objc_opt_respondsToSelector(v3, "BOOLValue");
  if ((v4 & 1) == 0) {
    goto LABEL_6;
  }
  id v5 = [v3 BOOLValue];
  int v6 = (int)v5;
  uint64_t v7 = VSDefaultLogObject(v5);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 67109120;
    LODWORD(v12) = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "isSoleProviderFeatureEnabled %d", (uint8_t *)&v11, 8u);
  }

  if (v6)
  {
    [*(id *)(a1 + 32) _fetchAllProviders];
  }

  else
  {
LABEL_6:
    uint64_t v9 = VSDefaultLogObject(v4);
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[VSSetupFlowPreparationOperation _fetchAllProvidersIfNeeded]_block_invoke";
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%s: not stb/sole", (uint8_t *)&v11, 0xCu);
    }

    [*(id *)(a1 + 32) _checkForSupportedAppsButton];
  }
}

void sub_EA84(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) _isInSTBMode];
  if ((v4 & 1) != 0 || (a2 & 1) != 0)
  {
    [*(id *)(a1 + 32) _checkForSupportedAppsButtonWithFlow:*(void *)(a1 + 40)];
  }

  else
  {
    uint64_t v5 = VSDefaultLogObject(v4);
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "Checking for Supported Apps to show Bulk Consent before the GetTheApp screen",  buf,  2u);
    }

    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identityProvider", 0));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allPersonalizedAppDescriptions]);

    id v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        __int16 v13 = 0LL;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v15 + 1) + 8 * (void)v13) bundleID]);
          if (v14) {
            -[NSMutableArray addObject:](v7, "addObject:", v14);
          }

          __int16 v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }

      while (v11);
    }

    [*(id *)(a1 + 32) _resolveBundleIDs:v7 forFlow:*(void *)(a1 + 40)];
  }

void sub_ED5C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) result]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 forceUnwrapObject]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_EE0C;
  v5[3] = &unk_24C28;
  uint64_t v6 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_F36C;
  v4[3] = &unk_24638;
  void v4[4] = v6;
  [v3 unwrapObject:v5 error:v4];
}

void sub_EE0C(uint64_t a1, void *a2)
{
  id v3 = [a2 copy];
  uint64_t v4 = VSDefaultLogObject(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "All providers: %@", buf, 0xCu);
  }

  uint64_t v6 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_EF18;
  v8[3] = &unk_246D8;
  void v8[4] = v6;
  id v9 = v3;
  id v7 = v3;
  [v6 _getSTBProviderFromAllProviders:v7 completionHandler:v8];
}

void sub_EF18(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___VSSetupFlowConfiguration);
    -[VSSetupFlowConfiguration setShouldOfferSTBAuthenticationFlow:](v4, "setShouldOfferSTBAuthenticationFlow:", 1LL);
    -[VSSetupFlowConfiguration setIdentityProvider:](v4, "setIdentityProvider:", v3);
    [*(id *)(a1 + 32) _loadProviderAppDescriptionWithFlow:v4];
  }

  else
  {
    uint64_t v4 = (VSSetupFlowConfiguration *)objc_alloc_init(&OBJC_CLASS___VSAMSBagLoadOperation);
    -[VSSetupFlowConfiguration setBagKey:](v4, "setBagKey:", VSAMSBagKeyCountryCode);
    objc_initWeak(&location, v4);
    objc_initWeak(&from, *(id *)(a1 + 32));
    id v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472LL;
    id v10 = sub_F0AC;
    id v11 = &unk_24DB8;
    objc_copyWeak(&v14, &from);
    objc_copyWeak(&v15, &location);
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 32);
    id v12 = v5;
    uint64_t v13 = v6;
    -[VSSetupFlowConfiguration setCompletionBlock:](v4, "setCompletionBlock:", &v8);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "privateQueue", v8, v9, v10, v11));
    [v7 addOperation:v4];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void sub_F07C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_F0AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 value]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
    {
      id v7 = (objc_class *)objc_opt_class(v4);
      id v8 = NSStringFromClass(v7);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Unexpectedly, value was %@, instead of NSString.",  v9);
    }

    id v10 = v4;
    id v11 = objc_alloc_init(&OBJC_CLASS___VSIdentityProviderStorefrontParser);
    [v11 setAllIdentityProviders:*(void *)(a1 + 32)];
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 providersForStorefront:v10]);
    uint64_t v13 = (char *)[v12 count];
    if (v13 == (_BYTE *)&dword_0 + 1)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);

      if (!v14) {
        +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The [providersForStorefront firstObject] parameter must not be nil.");
      }
      id v15 = (id)objc_claimAutoreleasedReturnValue([v12 firstObject]);
      uint64_t v13 = (char *)[v15 isFullySupportedForRequestsExpectingAuthenticationSchemes:0];
      if ((_DWORD)v13)
      {
        if (!v15) {
          +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The soleProviderOrNil parameter must not be nil.");
        }
        id v15 = v15;
        __int128 v16 = objc_alloc_init(&OBJC_CLASS___VSSetupFlowConfiguration);
        -[VSSetupFlowConfiguration setShouldOfferSoleAuthenticationFlow:]( v16,  "setShouldOfferSoleAuthenticationFlow:",  1LL);
        -[VSSetupFlowConfiguration setIdentityProvider:](v16, "setIdentityProvider:", v15);

        [*(id *)(a1 + 40) _loadProviderAppDescriptionWithFlow:v16];
LABEL_18:

        goto LABEL_19;
      }
    }

    else
    {
      id v15 = 0LL;
    }

    uint64_t v26 = VSDefaultLogObject(v13);
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v29 = "-[VSSetupFlowPreparationOperation _fetchAllProviders]_block_invoke_2";
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "%s: not stb/solo, proceed to display all providers", buf, 0xCu);
    }

    [*(id *)(a1 + 40) _checkForSupportedAppsButton];
    goto LABEL_18;
  }

  uint64_t v17 = VSErrorLogObject();
  __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_16568(v18, v19, v20, v21, v22, v23, v24, v25);
  }

  [WeakRetained _checkForSupportedAppsButton];
LABEL_19:
}

void sub_F36C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1659C();
  }

  [*(id *)(a1 + 32) _checkForSupportedAppsButton];
}

void sub_F53C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) result]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 forceUnwrapObject]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_F60C;
  v6[3] = &unk_246D8;
  uint64_t v4 = *(void **)(a1 + 48);
  v6[4] = *(void *)(a1 + 40);
  id v7 = v4;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_F800;
  v5[3] = &unk_24638;
  void v5[4] = *(void *)(a1 + 40);
  [v3 unwrapObject:v6 error:v5];
}

void sub_F60C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 isFullySupportedForRequestsExpectingAuthenticationSchemes:0];
  if ((_DWORD)v4)
  {
    uint64_t v5 = VSDefaultLogObject(v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = [*(id *)(a1 + 32) _isInSTBMode];
      *(_DWORD *)buf = 67109120;
      unsigned int v24 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "_fetchProviderForAccount: isInSTBMode %d", buf, 8u);
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_F78C;
    v19[3] = &unk_24700;
    id v8 = *(void **)(a1 + 40);
    id v20 = *(id *)(a1 + 32);
    id v21 = v8;
    id v22 = v3;
    [v20 _checkForSupportedAppsFromProvider:v22 withCompletion:v19];
  }

  else
  {
    uint64_t v9 = VSErrorLogObject();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_165FC(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    __int128 v18 = objc_alloc_init(&OBJC_CLASS___VSSetupFlowConfiguration);
    [*(id *)(a1 + 32) _resolveBundleIDs:&__NSArray0__struct forFlow:v18];
  }
}

id sub_F78C(uint64_t a1)
{
  uint64_t v2 = VSDefaultLogObject(a1);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Finished setting supported apps for provider", v5, 2u);
  }

  return [*(id *)(a1 + 32) prepareSTBSetupForAccount:*(void *)(a1 + 40) forProvider:*(void *)(a1 + 48)];
}

id sub_F800(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _finishWithError:a2];
}

void sub_FBD8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) result]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 forceUnwrapObject]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_FC80;
  v5[3] = &unk_24E08;
  id v4 = *(void **)(a1 + 48);
  void v5[4] = *(void *)(a1 + 40);
  id v6 = v4;
  [v3 unwrapObject:v5 error:&stru_24E28];
}

void sub_FC80(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(&OBJC_CLASS___VSSemaphore);
  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  uint64_t v14 = sub_FD44;
  uint64_t v15 = &unk_24DE0;
  id v16 = v5;
  id v17 = v4;
  id v7 = v4;
  [v6 _getPersonalAppDescriptions:v3 identityProvider:v16 completion:&v12];

  VSAssertNotMainThread(v8, v9, v10, v11);
  objc_msgSend(v7, "wait", v12, v13, v14, v15);
}

void sub_FD44(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSDefaultLogObject(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    id v7 = [v3 count];
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Setting All Supported App Descriptions: %lu", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) setAllPersonalizedAppDescriptions:v3];
  [*(id *)(a1 + 40) signal];
}

void sub_FE14(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = VSErrorLogObject();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_16630();
  }
}

void sub_FE64(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_FF14;
  v3[3] = &unk_24E70;
  id v4 = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  +[VSMultiAppInstallUtility determineMultiAppEnabledForProvider:completion:]( &OBJC_CLASS___VSMultiAppInstallUtility,  "determineMultiAppEnabledForProvider:completion:",  v4,  v3);
}

void sub_FF14(uint64_t a1, int a2)
{
  if (a2)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allPersonalizedAppDescriptions]);
    if (v3) {
      -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v3);
    }
    id v4 = [[VSLoadAllAppIconsOperation alloc] initWithApps:v5 shouldPrecomposeIcon:0];
    [v4 setResultCompletionBlock:&stru_24E48];
    [*(id *)(a1 + 40) addOperation:v4];
    [v4 setCompletionBlock:*(void *)(a1 + 48)];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

void sub_FFDC(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = VSDefaultLogObject(v2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      int v9 = 138412290;
      uint64_t v10 = v2;
      id v6 = "Failed to set all app icon images: %@";
      id v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }

  else if (v5)
  {
    LOWORD(v9) = 0;
    id v6 = "Successfully set all app icon images.";
    id v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }
}

void sub_1027C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 channelIDs]);
    id v7 = [v6 count];
    BOOL v8 = v7 != 0LL;
    if (v7)
    {
      if (!v6) {
        +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The channelIDsOrNil parameter must not be nil.");
      }
      int v9 = v6;
      uint64_t v10 = VSDefaultLogObject([*(id *)(a1 + 32) setPersonalChannelIDs:v9]);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v28 = v9;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Found channels: %@", buf, 0xCu);
      }
    }

    else
    {
      uint64_t v14 = VSDefaultLogObject(0LL);
      int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(os_log_s **)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v28 = v15;
        __int16 v29 = 2112;
        id v30 = v5;
        _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "No Channel IDs found for provider %@\n with Channels \n%@",  buf,  0x16u);
      }
    }
  }

  else
  {
    uint64_t v12 = VSDefaultLogObject(0LL);
    id v5 = (id)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(os_log_s **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = v13;
      _os_log_impl(&dword_0, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "No Account Channels found for provider %@", buf, 0xCu);
    }

    BOOL v8 = 0;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) personalAppDescriptions]);
  if (![v16 count])
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) personalChannelIDs]);
    id v18 = [v17 count];

    if (v18)
    {
      uint64_t v19 = VSErrorLogObject();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_16690(a1, (id *)(a1 + 32), v20);
      }
    }
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10530;
  v23[3] = &unk_24E98;
  id v21 = *(id *)(a1 + 48);
  id v24 = v16;
  id v25 = v21;
  BOOL v26 = v8;
  id v22 = v16;
  VSPerformCompletionHandler(v23);
}

uint64_t sub_10530(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 48));
}

void sub_10674(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = VSDefaultLogObject(v6);
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Received final bundle IDs: %@", (uint8_t *)&v13, 0xCu);
    }

    id v10 = [a1[4] mutableCopy];
    [v10 removeObjectsInArray:v5];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1[5] vouchersByBundleID]);
    id v12 = [v11 mutableCopy];

    [v12 removeObjectsForKeys:v10];
    [a1[5] setVouchersByBundleID:v12];
    [a1[5] setBundlesIDsToConsent:v5];
    [a1[6] _finishWithFlow:a1[5]];
  }

  else if (([a1[5] shouldOfferSTBAuthenticationFlow] & 1) == 0)
  {
    if (!v7) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The errorOrNil parameter must not be nil.");
    }
    [a1[6] _finishWithError:v7];
  }
}

void sub_1095C(_Unwind_Exception *a1)
{
}

void sub_1097C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained result]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 forceUnwrapObject]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10A54;
  v8[3] = &unk_24688;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  _DWORD v7[2] = sub_10BB0;
  v7[3] = &unk_24638;
  void v7[4] = v5;
  [v3 unwrapObject:v8 error:v7];
}

void sub_10A54(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  @"shortenedDisplayName",  1LL,  "localizedStandardCompare:"));
    uint64_t v10 = v4;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 sortedArrayUsingDescriptors:v5]);

    [*(id *)(a1 + 32) setCanShowSupportedAppsButton:1];
    [*(id *)(a1 + 32) setSupportedApps:v6];
    [*(id *)(a1 + 40) _resolveBundleIDs:&__NSArray0__struct forFlow:*(void *)(a1 + 32)];
  }

  else
  {
    uint64_t v7 = VSDefaultLogObject(0LL);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "No channel apps", v9, 2u);
    }

    [*(id *)(a1 + 40) _resolveBundleIDs:&__NSArray0__struct forFlow:*(void *)(a1 + 32)];
  }
}

void sub_10BB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_16740();
  }

  [*(id *)(a1 + 32) _finishWithError:v3];
}

void sub_110EC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) isWaitingForDisappearance];
  int v3 = (int)v2;
  uint64_t v4 = VSDefaultLogObject(v2);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (!v6) {
      goto LABEL_14;
    }
    __int16 v15 = 0;
    id v12 = "No longer waiting for disappearance after going back.";
    int v13 = (uint8_t *)&v15;
LABEL_13:
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
    goto LABEL_14;
  }

  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Still waiting for disappearance after going back", buf, 2u);
  }

  id v7 = [*(id *)(a1 + 32) isViewLoaded];
  if (!(_DWORD)v7
    || (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]),
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 window]),
        v9,
        v8,
        !v9))
  {
    uint64_t v14 = VSDefaultLogObject(v7);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)id v16 = 0;
    id v12 = "Our view does not have a window.";
    int v13 = v16;
    goto LABEL_13;
  }

  uint64_t v10 = VSDefaultLogObject(v7);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v17 = 0;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Our view has a window.", v17, 2u);
  }

  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) flowController]);
  -[os_log_s startLoadingWhenGoingBack:serializedAccountDataToImport:]( v5,  "startLoadingWhenGoingBack:serializedAccountDataToImport:",  0LL,  0LL);
LABEL_14:
}

void sub_1303C(_Unwind_Exception *a1)
{
}

uint64_t sub_130F8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_13108(uint64_t a1)
{
}

void sub_13110(uint64_t a1, uint64_t a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appRecordForDeveloperSettings:a2]);
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 localizedName]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }

  else
  {
    uint64_t v8 = VSDefaultLogObject(0LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Developer set-top box app not installed, no app name.", v10, 2u);
    }
  }
}

void sub_131B8(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = VSErrorLogObject();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_16880((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
  }
}

void sub_13208(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_13288;
  v3[3] = &unk_24660;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  VSPerformBlockOnMainThread(v3, v2);
}

void sub_13288(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) icon]);
  [v1 setImage:v2];
}

id sub_132C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

void sub_132D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isInSetTopBoxMode])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 setTopBoxBundleIdentifier]);
    id v5 = [v4 length];

    if (v5)
    {
      uint64_t v7 = VSDefaultLogObject(v6);
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "In developer set-top box mode, will attempt to fetch installed app icon.",  buf,  2u);
      }

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appRecordForDeveloperSettings:v3]);
      if (v9)
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_13424;
        v14[3] = &unk_24FA0;
        uint64_t v10 = (os_log_s *)*(id *)(a1 + 40);
        uint64_t v11 = *(void *)(a1 + 48);
        __int16 v15 = v10;
        uint64_t v16 = v11;
        objc_msgSend(v9, "vs_primaryIconWithCompletion:", v14);
        id v12 = v15;
      }

      else
      {
        uint64_t v13 = VSDefaultLogObject(0LL);
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "Developer set-top box app not installed, no provider artwork.",  buf,  2u);
        }
      }
    }
  }
}

void sub_13424(uint64_t a1, void *a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_134A0;
  v6[3] = &unk_24F58;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [a2 unwrapObject:v6 error:&stru_24F78];
}

id sub_134A0(uint64_t a1, uint64_t a2)
{
  id result = [*(id *)(a1 + 32) setImage:a2];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  return result;
}

void sub_134D8(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = VSErrorLogObject();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_168E4((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
  }
}

void sub_13528(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = VSErrorLogObject();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_16948((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
  }
}

id sub_13578(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

id sub_13720(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

void sub_13B44( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_13B70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained navController]);
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 rootContentViewController]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 presentedViewController]);

    if (v4)
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v2 rootContentViewController]);
      id v6 = [v2 popToViewController:v5 animated:1];
    }

    else
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v8 menuHandler]);
      uint64_t v5 = (void *)v7;
      if (v7) {
        (*(void (**)(uint64_t))(v7 + 16))(v7);
      }
    }

    id WeakRetained = v8;
  }
}

void sub_13C30(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if (+[VSIdentityProviderAppSetupViewController shouldBeShownToUser]( &OBJC_CLASS___VSIdentityProviderAppSetupViewController,  "shouldBeShownToUser"))
    {
      id v2 = (void *)objc_claimAutoreleasedReturnValue([v4 _appViewController]);
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v4 navController]);
      [v3 pushViewController:v2 animated:1];
    }

    else
    {
      [v4 _callCompletionHandlerWithAppInstallResult:0];
    }

    id WeakRetained = v4;
  }
}

void sub_13EEC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_13F10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = VSDefaultLogObject(WeakRetained);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Set-top-box Silent sign-in completed.", v5, 2u);
    }

    [v2 setSetTopBoxSilentSignInInProgress:0];
    if ([v2 isSetTopBoxSilentSignInPending])
    {
      [v2 startSetTopBoxSilentSignIn];
    }

    else if ([v2 shouldAutoAdvance])
    {
      [v2 _callCompletionHandlerWithAppInstallResult:0];
    }

    else if ([v2 isViewLoaded])
    {
      [v2 _transitionFromSilentSignInViewControllerToSetupViewController];
    }
  }
}

void sub_1451C(_Unwind_Exception *a1)
{
}

void sub_14538(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v2 = objc_claimAutoreleasedReturnValue([WeakRetained menuHandler]);
    uint64_t v3 = (void *)v2;
    if (v2) {
      (*(void (**)(uint64_t))(v2 + 16))(v2);
    }

    id WeakRetained = v4;
  }
}

void sub_14750(_Unwind_Exception *a1)
{
}

void sub_1477C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _resetSetupViewControllerIfNeededAndPopBackToRootViewController];
    id WeakRetained = v2;
  }
}

void sub_147AC(uint64_t a1, int a2, int a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v6 = 1LL;
    if (!a3) {
      uint64_t v6 = 2LL;
    }
    if (a2) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0LL;
    }
    id v8 = WeakRetained;
    [WeakRetained _callCompletionHandlerWithAppInstallResult:v7];
    id WeakRetained = v8;
  }
}

void sub_1509C(_Unwind_Exception *a1)
{
}

void sub_150CC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stepDelegate]);
    [v2 didCancelStep:v3];

    [v3 setSetupContainerViewController:0];
    id WeakRetained = v3;
  }
}

void sub_15124(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary vs_setObjectUnlessNil:forKey:]( v6,  "vs_setObjectUnlessNil:forKey:",  v11,  TVSKMetricsPayloadKeyStepSuffixIdentityProviderIdentifier);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3 != 0));
    -[NSMutableDictionary setObject:forKey:]( v6,  "setObject:forKey:",  v7,  TVSKMetricsPayloadKeyStepSuffixDidOfferAppInstall);

    if (a3)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3 == 1));
      -[NSMutableDictionary setObject:forKey:]( v6,  "setObject:forKey:",  v8,  TVSKMetricsPayloadKeyStepSuffixDidAcceptAppInstall);
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
    [v9 setMetricsPayload:v6];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stepDelegate]);
    [v10 step:WeakRetained didCompleteWithResult:v9];
  }
}

id sub_15450()
{
  if (qword_2BFC0 != -1) {
    dispatch_once(&qword_2BFC0, &stru_25080);
  }
  return (id)qword_2BFB8;
}

void sub_157B8(id a1)
{
  id v1 = sub_157DC();
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)qword_2BFB8;
  qword_2BFB8 = v2;
}

id sub_157DC()
{
  id v0 = objc_alloc_init(&OBJC_CLASS___VSValueType);
  [v0 setImplementationClass:objc_opt_class(VSSetupFlowConfiguration)];
  id v1 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:]( &OBJC_CLASS___VSValueTypeProperty,  "valueTypePropertyWithName:kind:allowedClasses:initialValue:",  @"shouldSkipSetupEntirely",  0LL,  0LL,  0LL));
  -[NSMutableArray addObject:](v1, "addObject:", v2);

  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:]( &OBJC_CLASS___VSValueTypeProperty,  "valueTypePropertyWithName:kind:allowedClasses:initialValue:",  @"shouldOfferAuthenticationFlow",  0LL,  0LL,  0LL));
  -[NSMutableArray addObject:](v1, "addObject:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:]( &OBJC_CLASS___VSValueTypeProperty,  "valueTypePropertyWithName:kind:allowedClasses:initialValue:",  @"shouldOfferSoleAuthenticationFlow",  0LL,  0LL,  0LL));
  -[NSMutableArray addObject:](v1, "addObject:", v4);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:]( &OBJC_CLASS___VSValueTypeProperty,  "valueTypePropertyWithName:kind:allowedClasses:initialValue:",  @"shouldOfferSTBAuthenticationFlow",  0LL,  0LL,  0LL));
  -[NSMutableArray addObject:](v1, "addObject:", v5);

  uint64_t v6 = +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", objc_opt_class(&OBJC_CLASS___NSString));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:]( &OBJC_CLASS___VSValueTypeProperty,  "valueTypePropertyWithName:kind:allowedClasses:initialValue:",  @"providerAccountUsername",  2LL,  v7,  &stru_257C0));
  -[NSMutableArray addObject:](v1, "addObject:", v8);

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v10 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v9,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:]( &OBJC_CLASS___VSValueTypeProperty,  "valueTypePropertyWithName:kind:allowedClasses:initialValue:",  @"bundlesIDsToConsent",  2LL,  v11,  &__NSArray0__struct));
  -[NSMutableArray addObject:](v1, "addObject:", v12);

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
  __int16 v15 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v13,  v14,  objc_opt_class(&OBJC_CLASS___VSPrivacyConsentVoucher),  0LL);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:]( &OBJC_CLASS___VSValueTypeProperty,  "valueTypePropertyWithName:kind:allowedClasses:initialValue:",  @"vouchersByBundleID",  2LL,  v16,  &__NSDictionary0__struct));
  -[NSMutableArray addObject:](v1, "addObject:", v17);

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:]( &OBJC_CLASS___VSValueTypeProperty,  "valueTypePropertyWithName:kind:allowedClasses:initialValue:",  @"canShowSupportedAppsButton",  0LL,  0LL,  0LL));
  -[NSMutableArray addObject:](v1, "addObject:", v18);

  uint64_t v19 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  objc_opt_class(&OBJC_CLASS___VSAppDescription),  0LL);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:]( &OBJC_CLASS___VSValueTypeProperty,  "valueTypePropertyWithName:kind:allowedClasses:initialValue:",  @"msoAppDescription",  2LL,  v20,  0LL));
  -[NSMutableArray addObject:](v1, "addObject:", v21);

  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v23 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v22,  objc_opt_class(&OBJC_CLASS___VSAppDescription),  0LL);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[VSValueTypeProperty valueTypePropertyWithName:kind:allowedClasses:initialValue:]( &OBJC_CLASS___VSValueTypeProperty,  "valueTypePropertyWithName:kind:allowedClasses:initialValue:",  @"supportedApps",  2LL,  v24,  &__NSArray0__struct));
  -[NSMutableArray addObject:](v1, "addObject:", v25);

  [v0 setProperties:v1];
  return v0;
}

void sub_15BA8()
{
}

void sub_15C08()
{
}

void sub_15C68()
{
}

void sub_15C94()
{
}

void sub_15CF4()
{
}

void sub_15D54()
{
}

void sub_15D80()
{
}

void sub_15DAC()
{
}

void sub_15E0C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 identityProvider]);
  sub_7B60();
  sub_7B44( &dword_0,  a2,  v4,  "No app description and not in developer mode, failing app icon image load operation for provider %@.",  v5);

  sub_7B88();
}

void sub_15E8C(uint64_t a1, os_log_s *a2)
{
  id v4 = v3;
  sub_7B44(&dword_0, a2, v5, "%@ should not be available in developer mode.", v6);

  sub_7B88();
}

void sub_15F0C()
{
}

void sub_15F6C()
{
}

void sub_15F98()
{
}

void sub_15FC4()
{
}

void sub_16024(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_7B60();
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "Error Unwrapping VSSetupFlowPreparationOperation result: %@",  v4,  0xCu);
}

void sub_160B4()
{
}

void sub_160E0()
{
}

void sub_1610C()
{
}

void sub_16138()
{
}

void sub_16164()
{
}

void sub_16190()
{
}

void sub_161BC()
{
}

void sub_161E8()
{
}

void sub_16248()
{
}

void sub_162A8()
{
}

void sub_16308()
{
}

void sub_16368()
{
}

void sub_163C8()
{
}

void sub_16428()
{
}

void sub_16488( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_164F8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_16568( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_7B50( &dword_0,  a1,  a3,  "No storefront returned from bag load operation, falling back on non-STB or sole provider flow.",  a5,  a6,  a7,  a8,  0);
}

void sub_1659C()
{
}

void sub_165FC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_16630()
{
}

void sub_16690(uint64_t a1, id *a2, os_log_s *a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*a2 personalChannelIDs]);
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl( &dword_0,  a3,  OS_LOG_TYPE_ERROR,  "No Personal App Descriptions found for provider %@\n with personalChannelIDs \n%@",  (uint8_t *)&v6,  0x16u);
}

void sub_16740()
{
}

void sub_167A0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_16810( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_16880( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_168E4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_16948( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_169AC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Unable to fetch app record. Bundle identifier is nil.", v1, 2u);
}

id objc_msgSend__obtainConsentForBundleIDs_vouchers_withAppleAccountName_identityProvider_endingUndoGrouping_arrivedViaNotNowButton_arrivedAfterSigningIn_goingBack_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_obtainConsentForBundleIDs:vouchers:withAppleAccountName:identityProvider:endingUndoGrouping:arrivedViaNotNow Button:arrivedAfterSigningIn:goingBack:");
}

id objc_msgSend__offerAuthenticationForProvider_withSupportedAppsButton_msoAppDescription_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_offerAuthenticationForProvider:withSupportedAppsButton:msoAppDescription:");
}

id objc_msgSend__offerAuthenticationForSTBProvider_msoAppDescription_providerAccountUsername_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_offerAuthenticationForSTBProvider:msoAppDescription:providerAccountUsername:");
}

id objc_msgSend__offerFreeOnBoardingIfNeededAfterOfferingOptions_endingUndoGrouping_arrivedViaNotNowButton_arrivedAfterSigningIn_goingBack_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_offerFreeOnBoardingIfNeededAfterOfferingOptions:endingUndoGrouping:arrivedViaNotNowButton:arrivedAfterSigningIn:goingBack:");
}

id objc_msgSend__startLoadingAfterOfferingOptions_endingUndoGrouping_arrivedViaNotNowButton_arrivedAfterSigningIn_goingBack_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_startLoadingAfterOfferingOptions:endingUndoGrouping:arrivedViaNotNowButton:arrivedAfterSigningIn:goingBack:");
}

id objc_msgSend_multiAppViewControllerWithApps_providerName_shouldShowPrivacyText_selectedAppsCompletion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "multiAppViewControllerWithApps:providerName:shouldShowPrivacyText:selectedAppsCompletion:");
}

id objc_msgSend_setupFlowController_offerAuthenticationForProvider_withSupportedAppsButton_msoAppDescription_isSTB_providerAccountUsername_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setupFlowController:offerAuthenticationForProvider:withSupportedAppsButton:msoAppDescription:isSTB:providerAccountUsername:");
}

id objc_msgSend_viewControllerForPlaybackActivityReportingFromAppsWithBundleIDs_grantingVouchers_appleAccountName_identityProvider_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "viewControllerForPlaybackActivityReportingFromAppsWithBundleIDs:grantingVouchers:appleAccountName:identityPro vider:completionHandler:");
}

id objc_msgSend_viewControllerForUnsupportedProvider_withRequestingAppDisplayName_storage_acknowledgementHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "viewControllerForUnsupportedProvider:withRequestingAppDisplayName:storage:acknowledgementHandler:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}