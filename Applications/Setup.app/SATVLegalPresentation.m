@interface SATVLegalPresentation
+ (id)sharedInstance;
- (BOOL)needsWarrantyChallenge;
- (SATVLegalPresentationWarrantyDelegate)warrantyDelegate;
- (void)_warrantyAccepted;
- (void)displayLegalNoticeWithTitle:(id)a3 terms:(id)a4 navigationController:(id)a5;
- (void)displayWarrantyChallengeWithTerms:(id)a3 navigationController:(id)a4;
- (void)setWarrantyDelegate:(id)a3;
@end

@implementation SATVLegalPresentation

+ (id)sharedInstance
{
  if (qword_100109750 != -1) {
    dispatch_once(&qword_100109750, &stru_1000C95D0);
  }
  return (id)qword_100109748;
}

- (void)displayLegalNoticeWithTitle:(id)a3 terms:(id)a4 navigationController:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"navigationController cannot be nil",  0LL));
    [v10 raise];
  }

  if ([v8 length])
  {
    id v11 = [[TVSUITextAlertController alloc] initWithTitle:v7 text:v8];
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:",  0LL,  2LL,  0LL));
    [v11 addButton:v12];

    [v9 presentViewController:v11 animated:1 completion:0];
  }

  else
  {
    id v13 = sub_10002AF94();
    id v11 = (id)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_INFO, "ERROR: no terms to display", v14, 2u);
    }
  }
}

- (BOOL)needsWarrantyChallenge
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v3 = [v2 fileExistsAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/ShowWarranty"];

  return v3;
}

- (void)displayWarrantyChallengeWithTerms:(id)a3 navigationController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"navigationController cannot be nil",  0LL));
    [v8 raise];
  }

  objc_initWeak(&location, self);
  id v9 = objc_alloc(&OBJC_CLASS___TVSUITextAlertController);
  id v10 = sub_10000D7CC(@"TERMS_DETAILS_WARRANTY_TITLE", @"Localizable");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = [v9 initWithTitle:v11 text:v6];

  id v13 = sub_10000D7CC(@"TERMS_CONDITIONS_AGREE", @"Localizable");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10000B928;
  v22[3] = &unk_1000C93A0;
  objc_copyWeak(&v23, &location);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:",  v14,  0LL,  v22));
  [v12 addButton:v15];

  id v16 = sub_10000D7CC(@"TERMS_CONDITIONS_DISAGREE", @"Localizable");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10000B958;
  v20[3] = &unk_1000C93A0;
  objc_copyWeak(&v21, &location);
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:",  v17,  0LL,  v20));
  [v12 addButton:v18];

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:",  0LL,  2LL,  0LL));
  [v12 addButton:v19];

  [v7 presentViewController:v12 animated:1 completion:0];
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
}

- (void)_warrantyAccepted
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v2 removeItemAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/ShowWarranty" error:0];
}

- (SATVLegalPresentationWarrantyDelegate)warrantyDelegate
{
  return (SATVLegalPresentationWarrantyDelegate *)objc_loadWeakRetained((id *)&self->_warrantyDelegate);
}

- (void)setWarrantyDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end