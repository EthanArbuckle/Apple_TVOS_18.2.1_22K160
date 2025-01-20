@interface CDRequesterViewService
+ (id)appSignInViewServiceWithRequest:(id)a3 applicationBundleIdentifier:(id)a4 authKitAccount:(id)a5;
+ (id)learnMoreViewServiceWithRequest:(id)a3;
+ (id)restrictedAccessViewServiceWithRequest:(id)a3;
+ (id)sharingViewServiceWithRequest:(id)a3;
+ (id)storeAuthenticationViewServiceWithRequest:(id)a3;
+ (id)systemAuthenticationViewServiceWithSystemAuthenticationRequest:(id)a3;
- (OS_dispatch_queue)dispatchQueue;
- (id)_initWithRequest:(id)a3;
- (id)dismissedHandler;
- (void)activate;
- (void)deviceStartedAuthentication:(id)a3;
- (void)deviceTappedNotification:(id)a3;
- (void)fetchAppIconWithReplyHandler:(id)a3;
- (void)invalidate;
- (void)sessionFailed:(id)a3;
- (void)sessionFinished;
- (void)setDismissedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation CDRequesterViewService

- (id)_initWithRequest:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CDRequesterViewService;
  v5 = -[CDRequesterViewService init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, &_dispatch_main_q);
    v7 = (PBSUserPresentationRequest *)[v4 copy];
    request = v6->_request;
    v6->_request = v7;
  }

  return v6;
}

+ (id)appSignInViewServiceWithRequest:(id)a3 applicationBundleIdentifier:(id)a4 authKitAccount:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v11 setObject:PBSUPRDialogTypeCustom forKeyedSubscript:PBSUPRDialogTypeKey];
  [v11 setObject:@"com.apple.CompanionViewService" forKeyedSubscript:PBSUPRDialogCustomViewServiceNameKey];
  [v11 setObject:@"CSVSAppSignInViewController" forKeyedSubscript:PBSUPRDialogCustomViewControllerClassNameKey];
  [v11 setObject:v9 forKeyedSubscript:@"appBundleID"];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 customAuthenticationMethods]);
  [v11 setObject:v12 forKeyedSubscript:@"customAuthenticationMethods"];

  id v13 = [v10 authType];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v13));
  [v11 setObject:v14 forKeyedSubscript:@"authType"];

  if (v8)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  0LL));
    [v11 setObject:v15 forKeyedSubscript:@"accountData"];
  }

  v16 = -[PBSUserPresentationRequest initWithType:options:]( objc_alloc(&OBJC_CLASS___PBSUserPresentationRequest),  "initWithType:options:",  0LL,  v11);
  id v17 = [objc_alloc((Class)a1) _initWithRequest:v16];

  return v17;
}

+ (id)systemAuthenticationViewServiceWithSystemAuthenticationRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v5 setObject:PBSUPRDialogTypeCustom forKeyedSubscript:PBSUPRDialogTypeKey];
  [v5 setObject:@"com.apple.CompanionViewService" forKeyedSubscript:PBSUPRDialogCustomViewServiceNameKey];
  [v5 setObject:@"CSVSSystemSignInViewController" forKeyedSubscript:PBSUPRDialogCustomViewControllerClassNameKey];
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 service]));
  [v5 setObject:v6 forKeyedSubscript:@"systemService"];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 options]));
  [v5 setObject:v7 forKeyedSubscript:@"requestOptions"];

  id v8 = [v4 authType];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v8));
  [v5 setObject:v9 forKeyedSubscript:@"authType"];

  id v10 = -[PBSUserPresentationRequest initWithType:options:]( objc_alloc(&OBJC_CLASS___PBSUserPresentationRequest),  "initWithType:options:",  0LL,  v5);
  id v11 = [objc_alloc((Class)a1) _initWithRequest:v10];

  return v11;
}

+ (id)sharingViewServiceWithRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v5 setObject:PBSUPRDialogTypeCustom forKeyedSubscript:PBSUPRDialogTypeKey];
  [v5 setObject:@"com.apple.CompanionViewService" forKeyedSubscript:PBSUPRDialogCustomViewServiceNameKey];
  [v5 setObject:@"CSVSSharingViewController" forKeyedSubscript:PBSUPRDialogCustomViewControllerClassNameKey];
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 customSharingMethods]);
  [v5 setObject:v6 forKeyedSubscript:@"customSharingMethods"];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 requestData]);
  [v5 setObject:v7 forKeyedSubscript:@"requestData"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 customTitleText]);
  [v5 setObject:v8 forKeyedSubscript:@"customTitleText"];

  id v9 = -[PBSUserPresentationRequest initWithType:options:]( objc_alloc(&OBJC_CLASS___PBSUserPresentationRequest),  "initWithType:options:",  0LL,  v5);
  id v10 = [objc_alloc((Class)a1) _initWithRequest:v9];

  return v10;
}

+ (id)restrictedAccessViewServiceWithRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v5 setObject:PBSUPRDialogTypeCustom forKeyedSubscript:PBSUPRDialogTypeKey];
  [v5 setObject:@"com.apple.CompanionViewService" forKeyedSubscript:PBSUPRDialogCustomViewServiceNameKey];
  [v5 setObject:@"CSVSRestrictedAccessViewController" forKeyedSubscript:PBSUPRDialogCustomViewControllerClassNameKey];
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 authType]));
  [v5 setObject:v6 forKeyedSubscript:@"authType"];

  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"PBDialogOptionPresentWhileScreenSaverActiveKey"];
  id v7 = objc_alloc_init(&OBJC_CLASS___CPSViewServicePresentationContext);
  [v7 setRestrictedAccessRequest:v4];

  id v21 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v7,  1LL,  &v21));
  id v9 = v21;
  if (!v8)
  {
    id v10 = sub_10000A9EC();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10001F0E4((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  [v5 setObject:v8 forKeyedSubscript:@"presentationContextData"];
  v18 = -[PBSUserPresentationRequest initWithType:options:]( objc_alloc(&OBJC_CLASS___PBSUserPresentationRequest),  "initWithType:options:",  0LL,  v5);
  id v19 = [objc_alloc((Class)a1) _initWithRequest:v18];

  return v19;
}

+ (id)storeAuthenticationViewServiceWithRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v5 setObject:PBSUPRDialogTypeCustom forKeyedSubscript:PBSUPRDialogTypeKey];
  [v5 setObject:@"com.apple.CompanionViewService" forKeyedSubscript:PBSUPRDialogCustomViewServiceNameKey];
  [v5 setObject:@"CSVSStoreAuthenticationViewController" forKeyedSubscript:PBSUPRDialogCustomViewControllerClassNameKey];
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 authType]));
  [v5 setObject:v6 forKeyedSubscript:@"authType"];

  id v7 = objc_alloc_init(&OBJC_CLASS___CPSViewServicePresentationContext);
  [v7 setStoreAuthenticationRequest:v4];

  id v21 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v7,  1LL,  &v21));
  id v9 = v21;
  if (!v8)
  {
    id v10 = sub_10000A9EC();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10001F0E4((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  [v5 setObject:v8 forKeyedSubscript:@"presentationContextData"];
  v18 = -[PBSUserPresentationRequest initWithType:options:]( objc_alloc(&OBJC_CLASS___PBSUserPresentationRequest),  "initWithType:options:",  0LL,  v5);
  id v19 = [objc_alloc((Class)a1) _initWithRequest:v18];

  return v19;
}

+ (id)learnMoreViewServiceWithRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v5 setObject:PBSUPRDialogTypeCustom forKeyedSubscript:PBSUPRDialogTypeKey];
  [v5 setObject:@"com.apple.CompanionViewService" forKeyedSubscript:PBSUPRDialogCustomViewServiceNameKey];
  [v5 setObject:@"CSVSLearnMoreViewController" forKeyedSubscript:PBSUPRDialogCustomViewControllerClassNameKey];
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 authType]));
  [v5 setObject:v6 forKeyedSubscript:@"authType"];

  id v7 = objc_alloc_init(&OBJC_CLASS___CPSViewServicePresentationContext);
  [v7 setLearnMoreRequest:v4];

  id v21 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v7,  1LL,  &v21));
  id v9 = v21;
  if (!v8)
  {
    id v10 = sub_10000A9EC();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10001F0E4((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  [v5 setObject:v8 forKeyedSubscript:@"presentationContextData"];
  v18 = -[PBSUserPresentationRequest initWithType:options:]( objc_alloc(&OBJC_CLASS___PBSUserPresentationRequest),  "initWithType:options:",  0LL,  v5);
  id v19 = [objc_alloc((Class)a1) _initWithRequest:v18];

  return v19;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000ADFC;
  block[3] = &unk_100030910;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000AF78;
  block[3] = &unk_100030910;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)fetchAppIconWithReplyHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000B0D8;
  v7[3] = &unk_100030AC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)deviceTappedNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000B2A8;
  v7[3] = &unk_100030938;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)deviceStartedAuthentication:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000B4E8;
  v7[3] = &unk_100030938;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)sessionFinished
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000B704;
  block[3] = &unk_100030910;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)sessionFailed:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000B8A0;
  v7[3] = &unk_100030938;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)dismissedHandler
{
  return self->_dismissedHandler;
}

- (void)setDismissedHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end