@interface PBRestrictionService
- (BOOL)_hasValidEntitlement;
- (BSServiceConnectionHost)remoteConnection;
- (PBRestrictionService)init;
- (PBRestrictionService)initWithRemoteConnection:(id)a3;
- (id)_getDefaultServiceRequestWithResultHandler:(id)a3;
- (void)authorizeRestrictionsWithResult:(id)a3;
- (void)canUserBypassRestrictionsUsingCompanionDevice:(id)a3 result:(id)a4;
- (void)cancelRestrictionAuthorization:(id)a3;
- (void)restrictionsEnabledWithResult:(id)a3;
- (void)setUser:(id)a3 canBypassRestrictionsUsingCompanionDevice:(id)a4;
- (void)validatePIN:(id)a3 withResult:(id)a4;
- (void)validateRestrictionForContentType:(id)a3 withRating:(id)a4 allowInteraction:(id)a5 requestToken:(id)a6 withCompletion:(id)a7;
- (void)validateRestrictionForSetting:(id)a3 allowInteraction:(id)a4 requestToken:(id)a5 withCompletion:(id)a6;
@end

@implementation PBRestrictionService

- (PBRestrictionService)init
{
  return 0LL;
}

- (PBRestrictionService)initWithRemoteConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBRestrictionService;
  v5 = -[PBRestrictionService init](&v8, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_remoteConnection, v4);
  }

  return v6;
}

- (void)validateRestrictionForContentType:(id)a3 withRating:(id)a4 allowInteraction:(id)a5 requestToken:(id)a6 withCompletion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = -[PBRestrictionServiceRequest initWithToken:requestType:]( objc_alloc(&OBJC_CLASS___PBRestrictionServiceRequest),  "initWithToken:requestType:",  v12,  1LL);

  id v17 = [v15 unsignedIntegerValue];
  -[PBRestrictionServiceRequest setRestrictionContentType:](v16, "setRestrictionContentType:", v17);
  -[PBRestrictionServiceRequest setRating:](v16, "setRating:", v14);

  id v18 = [v13 BOOLValue];
  -[PBRestrictionServiceRequest setAllowInteraction:](v16, "setAllowInteraction:", v18);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000C5554;
  v21[3] = &unk_1003D5930;
  id v22 = v11;
  id v19 = v11;
  -[PBRestrictionServiceRequest setServiceRequestCompletionBlock:](v16, "setServiceRequestCompletionBlock:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[PBRestrictionServiceRequestManager sharedManager]( &OBJC_CLASS___PBRestrictionServiceRequestManager,  "sharedManager"));
  [v20 validateRestrictionForContentTypesWithRequest:v16];
}

- (void)validateRestrictionForSetting:(id)a3 allowInteraction:(id)a4 requestToken:(id)a5 withCompletion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = -[PBRestrictionServiceRequest initWithToken:requestType:]( objc_alloc(&OBJC_CLASS___PBRestrictionServiceRequest),  "initWithToken:requestType:",  v10,  2LL);

  id v14 = [v12 unsignedIntegerValue];
  -[PBRestrictionServiceRequest setRestrictedSettingType:](v13, "setRestrictedSettingType:", v14);
  id v15 = [v11 BOOLValue];

  -[PBRestrictionServiceRequest setAllowInteraction:](v13, "setAllowInteraction:", v15);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000C56CC;
  v18[3] = &unk_1003D5930;
  id v19 = v9;
  id v16 = v9;
  -[PBRestrictionServiceRequest setServiceRequestCompletionBlock:](v13, "setServiceRequestCompletionBlock:", v18);
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[PBRestrictionServiceRequestManager sharedManager]( &OBJC_CLASS___PBRestrictionServiceRequestManager,  "sharedManager"));
  [v17 validateRestrictionForSettingWithRequest:v13];
}

- (void)cancelRestrictionAuthorization:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBRestrictionServiceRequestManager sharedManager]( &OBJC_CLASS___PBRestrictionServiceRequestManager,  "sharedManager"));
  [v4 cancelRequestWithToken:v3];
}

- (void)restrictionsEnabledWithResult:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBRestrictionServiceRequestManager sharedManager]( &OBJC_CLASS___PBRestrictionServiceRequestManager,  "sharedManager"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000C5814;
    v7[3] = &unk_1003CFF30;
    id v8 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[PBRestrictionService _getDefaultServiceRequestWithResultHandler:]( self,  "_getDefaultServiceRequestWithResultHandler:",  v7));
    [v5 checkRestrictionSettingWithRequest:v6];
  }
}

- (void)authorizeRestrictionsWithResult:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBRestrictionServiceRequestManager sharedManager]( &OBJC_CLASS___PBRestrictionServiceRequestManager,  "sharedManager"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000C5914;
    v7[3] = &unk_1003CFF30;
    id v8 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[PBRestrictionService _getDefaultServiceRequestWithResultHandler:]( self,  "_getDefaultServiceRequestWithResultHandler:",  v7));
    [v5 authorizeRestrictionsWithRequest:v6];
  }
}

- (void)validatePIN:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C5A0C;
    block[3] = &unk_1003D5958;
    block[4] = self;
    id v11 = v7;
    id v10 = v6;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)canUserBypassRestrictionsUsingCompanionDevice:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bypassRestrictionsUsingCompanionDeviceUserSettingsDictionary]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v12]);
    unint64_t v14 = (unint64_t)[v13 BOOLValue];
  }

  else
  {
    unint64_t v14 = [v6 type] == 0;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v14));
    -[PBRestrictionService setUser:canBypassRestrictionsUsingCompanionDevice:]( self,  "setUser:canBypassRestrictionsUsingCompanionDevice:",  v6,  v12);
  }

  if (v7)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v14));
    v7[2](v7, v15, 0LL);
  }
}

- (void)setUser:(id)a3 canBypassRestrictionsUsingCompanionDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PBRestrictionService _hasValidEntitlement](self, "_hasValidEntitlement"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bypassRestrictionsUsingCompanionDeviceUserSettingsDictionary]);
    id v10 = (NSMutableDictionary *)[v9 mutableCopy];

    if (!v10) {
      id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v7, v11);

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v12 setBypassRestrictionsUsingCompanionDeviceUserSettingsDictionary:v10];
  }

  else
  {
    id v13 = sub_100083654();
    id v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      sub_10027C5C0((uint64_t)self, (os_log_s *)v10);
    }
  }
}

- (id)_getDefaultServiceRequestWithResultHandler:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v5 = -[PBRestrictionServiceRequest initWithToken:]( objc_alloc(&OBJC_CLASS___PBRestrictionServiceRequest),  "initWithToken:",  v4);
  -[PBRestrictionServiceRequest setResultHandler:](v5, "setResultHandler:", v3);

  return v5;
}

- (BOOL)_hasValidEntitlement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteConnection);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained remoteProcess]);
  unsigned __int8 v4 = [v3 hasEntitlement:@"com.apple.appletv.pbs.restrictions.companion-device-bypass-users.edit"];

  return v4;
}

- (BSServiceConnectionHost)remoteConnection
{
  return (BSServiceConnectionHost *)objc_loadWeakRetained((id *)&self->_remoteConnection);
}

- (void).cxx_destruct
{
}

@end