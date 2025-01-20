@interface PBRestrictionServiceRequestManager
+ (id)sharedManager;
+ (void)initialize;
- (BOOL)_isBooleanSettingType:(unint64_t)a3;
- (BOOL)_isContentType:(unint64_t)a3 allowedWithRating:(id)a4;
- (BOOL)_isContentTypeRestrictedByProfile:(unint64_t)a3;
- (BOOL)_isSettingRestrictedByProfile:(unint64_t)a3;
- (BOOL)requestPassesAgeRestriction:(id)a3;
- (NSMutableArray)pendingServiceRequestsQueue;
- (NSMutableDictionary)pendingTokenToRequestMapping;
- (PBRestrictionServiceRequest)currentRequest;
- (PBRestrictionServiceRequestManager)init;
- (TVSStateMachine)stateMachine;
- (id)_dequeueNextServiceRequest;
- (id)_featureNameForContentType:(unint64_t)a3;
- (id)_featureNameForSetting:(unint64_t)a3;
- (id)_init;
- (void)_authorizeRestrictionsWithRequest:(id)a3;
- (void)_checkRestrictionSettingWithRequest:(id)a3;
- (void)_enqueueIncomingRequest:(id)a3;
- (void)_initializeRestrictionServiceStateMachine;
- (void)_validatePINWithRequest:(id)a3 postCompletionEvent:(BOOL)a4;
- (void)_validateRestrictionForContentTypesWithRequest:(id)a3;
- (void)_validateRestrictionForSettingWithRequest:(id)a3;
- (void)authorizeRestrictionsWithRequest:(id)a3;
- (void)cancelRequestWithToken:(id)a3;
- (void)checkRestrictionSettingWithRequest:(id)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)validatePINWithRequest:(id)a3;
- (void)validateRestrictionForContentTypesWithRequest:(id)a3;
- (void)validateRestrictionForSettingWithRequest:(id)a3;
@end

@implementation PBRestrictionServiceRequestManager

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___PBRestrictionServiceRequestManager) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.PineBoardServices.Server", "PBRestrictionServiceRequestManager");
    v3 = (void *)qword_100471150;
    qword_100471150 = (uint64_t)v2;
  }

+ (id)sharedManager
{
  if (qword_100471160 != -1) {
    dispatch_once(&qword_100471160, &stru_1003D9D10);
  }
  return (id)qword_100471158;
}

- (PBRestrictionServiceRequestManager)init
{
  return 0LL;
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBRestrictionServiceRequestManager;
  os_log_t v2 = -[PBRestrictionServiceRequestManager init](&v9, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pendingServiceRequestsQueue = v2->_pendingServiceRequestsQueue;
    v2->_pendingServiceRequestsQueue = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pendingTokenToRequestMapping = v2->_pendingTokenToRequestMapping;
    v2->_pendingTokenToRequestMapping = v5;

    -[PBRestrictionServiceRequestManager _initializeRestrictionServiceStateMachine]( v2,  "_initializeRestrictionServiceStateMachine");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBRestrictionServiceRequestManager stateMachine](v2, "stateMachine"));
    [v7 postEvent:@"Update"];
  }

  return v2;
}

- (void)validatePINWithRequest:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10016D5D8;
  v4[3] = &unk_1003CFEB8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (void)validateRestrictionForContentTypesWithRequest:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10016D694;
  v4[3] = &unk_1003CFEB8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (BOOL)requestPassesAgeRestriction:(id)a3
{
  id v4 = a3;
  id v5 = [v4 restrictionContentType];
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 rating]);

  LOBYTE(self) = -[PBRestrictionServiceRequestManager _isContentType:allowedWithRating:]( self,  "_isContentType:allowedWithRating:",  v5,  v6);
  return (char)self;
}

- (void)validateRestrictionForSettingWithRequest:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10016D7B4;
  v4[3] = &unk_1003CFEB8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (void)checkRestrictionSettingWithRequest:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10016D870;
  v4[3] = &unk_1003CFEB8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (void)authorizeRestrictionsWithRequest:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10016D92C;
  v4[3] = &unk_1003CFEB8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (void)cancelRequestWithToken:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10016D9E8;
  v4[3] = &unk_1003CFEB8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (void)_initializeRestrictionServiceStateMachine
{
  id v3 = objc_alloc(&OBJC_CLASS___TVSStateMachine);
  id v4 = (objc_class *)objc_opt_class(self);
  id v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[TVSStateMachine initWithName:initialState:mode:stateChangeHandler:]( v3,  "initWithName:initialState:mode:stateChangeHandler:",  v6,  @"Loading",  0LL,  &stru_1003D9D50);
  stateMachine = self->_stateMachine;
  self->_stateMachine = v7;

  objc_super v9 = self->_stateMachine;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_10016E180;
  v48[3] = &unk_1003D0990;
  objc_copyWeak(&v49, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v9,  "registerHandlerForEvent:onState:withBlock:",  @"Begin Validating Restriction For Content Types",  @"Idle",  v48);
  v10 = self->_stateMachine;
  v57[0] = @"Validating Restriction for Content Types";
  v57[1] = @"Validating Restriction for Setting";
  v57[2] = @"Authorizing Restrictions";
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v57, 3LL));
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_10016E2A8;
  v46[3] = &unk_1003D0990;
  objc_copyWeak(&v47, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v10,  "registerHandlerForEvent:onStates:withBlock:",  @"Begin Validating Restriction For Content Types",  v11,  v46);

  v12 = self->_stateMachine;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_10016E3EC;
  v44[3] = &unk_1003D0990;
  objc_copyWeak(&v45, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v12,  "registerHandlerForEvent:onState:withBlock:",  @"Begin Validating Restriction For Setting",  @"Idle",  v44);
  v13 = self->_stateMachine;
  v56[0] = @"Validating Restriction for Content Types";
  v56[1] = @"Validating Restriction for Setting";
  v56[2] = @"Authorizing Restrictions";
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v56, 3LL));
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_10016E514;
  v42[3] = &unk_1003D0990;
  objc_copyWeak(&v43, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v13,  "registerHandlerForEvent:onStates:withBlock:",  @"Begin Validating Restriction For Setting",  v14,  v42);

  v15 = self->_stateMachine;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_10016E658;
  v40[3] = &unk_1003D0990;
  objc_copyWeak(&v41, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v15,  "registerHandlerForEvent:onState:withBlock:",  @"Begin Authorizing Restrictions",  @"Idle",  v40);
  v16 = self->_stateMachine;
  v55[0] = @"Validating Restriction for Content Types";
  v55[1] = @"Validating Restriction for Setting";
  v55[2] = @"Authorizing Restrictions";
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v55, 3LL));
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_10016E780;
  v38[3] = &unk_1003D0990;
  objc_copyWeak(&v39, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v16,  "registerHandlerForEvent:onStates:withBlock:",  @"Begin Authorizing Restrictions",  v17,  v38);

  v18 = self->_stateMachine;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_10016E8C4;
  v36[3] = &unk_1003D0990;
  objc_copyWeak(&v37, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v18,  "registerHandlerForEvent:onState:withBlock:",  @"Check Restriction Setting",  @"Idle",  v36);
  v19 = self->_stateMachine;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10016E9EC;
  v34[3] = &unk_1003D0990;
  objc_copyWeak(&v35, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v19,  "registerHandlerForEvent:onState:withBlock:",  @"Begin PIN Code Validation",  @"Idle",  v34);
  v20 = self->_stateMachine;
  v54[0] = @"Validating Restriction for Content Types";
  v54[1] = @"Validating Restriction for Setting";
  v54[2] = @"Authorizing Restrictions";
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v54, 3LL));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10016EB24;
  v32[3] = &unk_1003D0990;
  objc_copyWeak(&v33, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v20,  "registerHandlerForEvent:onStates:withBlock:",  @"Begin PIN Code Validation",  v21,  v32);

  v22 = self->_stateMachine;
  v53[0] = @"Validating Restriction for Setting";
  v53[1] = @"Validating Restriction for Content Types";
  v53[2] = @"Authorizing Restrictions";
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v53, 3LL));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10016ED28;
  v30[3] = &unk_1003D0990;
  objc_copyWeak(&v31, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v22,  "registerHandlerForEvent:onStates:withBlock:",  @"Cancel Restriction Authorization",  v23,  v30);

  v24 = self->_stateMachine;
  v52[0] = @"Validating Restriction for Setting";
  v52[1] = @"Validating Restriction for Content Types";
  v52[2] = @"Authorizing Restrictions";
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v52, 3LL));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10016F088;
  v28[3] = &unk_1003D1740;
  objc_copyWeak(&v29, &location);
  v28[4] = self;
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v24,  "registerHandlerForEvent:onStates:withBlock:",  @"Complete",  v25,  v28);

  v26 = self->_stateMachine;
  v51[0] = @"Validating PIN Code";
  v51[1] = @"Checking Restriction Setting enabled or disabled";
  v51[2] = @"Cancelling Restriction Authorization";
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v51, 3LL));
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v26,  "registerHandlerForEvent:onStates:withBlock:",  @"Complete",  v27,  &stru_1003D9D98);

  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( self->_stateMachine,  "registerHandlerForEvent:onState:withBlock:",  @"Update",  @"Loading",  &stru_1003D9DB8);
  -[TVSStateMachine setLogObject:](self->_stateMachine, "setLogObject:", qword_100471150);
  -[TVSStateMachine setCallsStateChangeHandlerSynchronously:]( self->_stateMachine,  "setCallsStateChangeHandlerSynchronously:",  1LL);
  -[TVSStateMachine setShouldAcceptEvents:](self->_stateMachine, "setShouldAcceptEvents:", 1LL);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v45);
  objc_destroyWeak(&v47);
  objc_destroyWeak(&v49);
  objc_destroyWeak(&location);
}

- (void)_validateRestrictionForContentTypesWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  -[PBRestrictionServiceRequestManager setCurrentRequest:](self, "setCurrentRequest:", v4);
  id v5 = (void (**)(void))objc_claimAutoreleasedReturnValue([v4 serviceRequestCompletionBlock]);
  if (-[PBRestrictionServiceRequestManager requestPassesAgeRestriction:](self, "requestPassesAgeRestriction:", v4))
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    unsigned int v7 = -[PBRestrictionServiceRequestManager _isContentTypeRestrictedByProfile:]( self,  "_isContentTypeRestrictedByProfile:",  [v4 restrictionContentType]);
    unsigned int v8 = v7 | +[SFRestrictionsPasscodeController settingEnabled]( &OBJC_CLASS___SFRestrictionsPasscodeController,  "settingEnabled") ^ 1;
    if (v7) {
      uint64_t v6 = 1LL;
    }
    else {
      uint64_t v6 = 2LL;
    }
    if ((v8 & 1) == 0)
    {
      if ([v4 allowInteraction])
      {
        objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[PBRestrictionPINManager sharedInstance]( &OBJC_CLASS___PBRestrictionPINManager,  "sharedInstance"));
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472LL;
        v11[2] = sub_10016F608;
        v11[3] = &unk_1003D9E08;
        v14 = &v15;
        v13 = v5;
        v11[4] = self;
        id v12 = v4;
        [v9 presentWithRequest:v12 resultBlock:v11];

        v10 = v13;
        goto LABEL_13;
      }

      uint64_t v6 = 2LL;
    }
  }

  v16[3] = v6;
  if (v5) {
    v5[2](v5);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBRestrictionServiceRequestManager stateMachine](self, "stateMachine"));
  [v10 postEvent:@"Complete"];
LABEL_13:

  _Block_object_dispose(&v15, 8);
}

- (void)_validateRestrictionForSettingWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  -[PBRestrictionServiceRequestManager setCurrentRequest:](self, "setCurrentRequest:", v4);
  id v5 = (void (**)(void))objc_claimAutoreleasedReturnValue([v4 serviceRequestCompletionBlock]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[PBRestrictionServiceRequestManager _featureNameForSetting:]( self,  "_featureNameForSetting:",  [v4 restrictedSettingType]));
  char v19 = 0;
  if ([v4 restrictedSettingType] == (id)4)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSRestrictionsSettings sharedInstance](&OBJC_CLASS___PBSRestrictionsSettings, "sharedInstance"));
    unsigned __int8 v8 = [v7 allowsLocationServicesUI];

    if ((v8 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v11 = 0LL;
    goto LABEL_18;
  }

  if ([v4 restrictedSettingType] != (id)1)
  {
    if (!v6) {
      goto LABEL_11;
    }
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    unsigned int v10 = [v9 effectiveBoolValueForSetting:v6 outAsk:&v19];

    if (v10 == 2 || v19) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  if ((+[SFRestrictionsPasscodeController settingEnabled]( &OBJC_CLASS___SFRestrictionsPasscodeController,  "settingEnabled") & 1) == 0) {
    goto LABEL_10;
  }
LABEL_11:
  unsigned int v12 = -[PBRestrictionServiceRequestManager _isSettingRestrictedByProfile:]( self,  "_isSettingRestrictedByProfile:",  [v4 restrictedSettingType]);
  unsigned int v13 = v12 | +[SFRestrictionsPasscodeController settingEnabled]( &OBJC_CLASS___SFRestrictionsPasscodeController,  "settingEnabled") ^ 1;
  if (v12) {
    uint64_t v11 = 1LL;
  }
  else {
    uint64_t v11 = 2LL;
  }
  if ((v13 & 1) == 0)
  {
    if ([v4 allowInteraction])
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[PBRestrictionPINManager sharedInstance](&OBJC_CLASS___PBRestrictionPINManager, "sharedInstance"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10016FA34;
      v16[3] = &unk_1003D9E30;
      v18 = &v20;
      v16[4] = self;
      uint64_t v17 = v5;
      [v14 presentWithRequest:v4 resultBlock:v16];

      uint64_t v15 = v17;
      goto LABEL_21;
    }

    uint64_t v11 = 2LL;
  }

- (void)_authorizeRestrictionsWithRequest:(id)a3
{
  id v4 = a3;
  -[PBRestrictionServiceRequestManager setCurrentRequest:](self, "setCurrentRequest:", v4);
  if (+[SFRestrictionsPasscodeController settingEnabled]( &OBJC_CLASS___SFRestrictionsPasscodeController,  "settingEnabled"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBRestrictionPINManager sharedInstance](&OBJC_CLASS___PBRestrictionPINManager, "sharedInstance"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10016FC30;
    v9[3] = &unk_1003D9E58;
    id v10 = v4;
    uint64_t v11 = self;
    [v5 presentWithRequest:v10 resultBlock:v9];

    uint64_t v6 = v10;
  }

  else
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 resultHandler]);
    uint64_t v6 = (void *)v7;
    if (v7) {
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 1LL);
    }
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBRestrictionServiceRequestManager stateMachine](self, "stateMachine"));
    [v8 postEvent:@"Complete"];
  }
}

- (void)_checkRestrictionSettingWithRequest:(id)a3
{
  id v4 = a3;
  -[PBRestrictionServiceRequestManager setCurrentRequest:](self, "setCurrentRequest:", v4);
  id v5 = +[SFRestrictionsPasscodeController settingEnabled]( &OBJC_CLASS___SFRestrictionsPasscodeController,  "settingEnabled");
  uint64_t v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v4 resultHandler]);

  if (v6) {
    ((void (**)(void, id))v6)[2](v6, v5);
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBRestrictionServiceRequestManager stateMachine](self, "stateMachine"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10016FDE4;
  v8[3] = &unk_1003CFF08;
  v8[4] = self;
  [v7 executeBlockAfterCurrentStateTransition:v8];
}

- (void)_validatePINWithRequest:(id)a3 postCompletionEvent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 PIN]);
  id v8 = +[SFRestrictionsPasscodeController validatePIN:]( &OBJC_CLASS___SFRestrictionsPasscodeController,  "validatePIN:",  v7);

  objc_super v9 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v6 resultHandler]);
  if (v9) {
    ((void (**)(void, id))v9)[2](v9, v8);
  }
  if (v4)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBRestrictionServiceRequestManager stateMachine](self, "stateMachine"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10016FF00;
    v11[3] = &unk_1003CFF08;
    v11[4] = self;
    [v10 executeBlockAfterCurrentStateTransition:v11];
  }
}

- (void)_enqueueIncomingRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 token]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_pendingTokenToRequestMapping, "objectForKey:", v5));

  uint64_t v7 = (os_log_s *)qword_100471150;
  BOOL v8 = os_log_type_enabled((os_log_t)qword_100471150, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Request %@ has already been enqueued.....",  (uint8_t *)&v11,  0xCu);
    }
  }

  else
  {
    if (v8)
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Enqueuing pending service request %@",  (uint8_t *)&v11,  0xCu);
    }

    -[NSMutableArray addObject:](self->_pendingServiceRequestsQueue, "addObject:", v4);
    pendingTokenToRequestMapping = self->_pendingTokenToRequestMapping;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 token]);
    -[NSMutableDictionary setObject:forKey:](pendingTokenToRequestMapping, "setObject:forKey:", v4, v10);
  }
}

- (id)_dequeueNextServiceRequest
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_pendingServiceRequestsQueue, "firstObject"));
  id v4 = (os_log_s *)qword_100471150;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_100471150, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Dequeued next pending service request %@",  (uint8_t *)&v9,  0xCu);
    }

    -[NSMutableArray removeObjectAtIndex:](self->_pendingServiceRequestsQueue, "removeObjectAtIndex:", 0LL);
    pendingTokenToRequestMapping = self->_pendingTokenToRequestMapping;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 token]);
    -[NSMutableDictionary removeObjectForKey:](pendingTokenToRequestMapping, "removeObjectForKey:", v7);
  }

  else if (v5)
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No pending requests...", (uint8_t *)&v9, 2u);
  }

  return v3;
}

- (id)_featureNameForContentType:(unint64_t)a3
{
  if (a3 > 5) {
    id v3 = 0LL;
  }
  else {
    id v3 = *(id *)*(&off_1003D9EA8 + a3);
  }
  return v3;
}

- (id)_featureNameForSetting:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 3)
    {
      id v3 = (id *)&MCFeatureConferenceRoomDisplaySettingsUIAllowed;
    }

    else
    {
      if (a3 != 2)
      {
        id v4 = 0LL;
        return v4;
      }

      id v3 = (id *)&MCFeatureAirPlaySettingsUIAllowed;
    }
  }

  else
  {
    id v3 = (id *)&MCFeatureMediaPurchaseAllowed;
  }

  id v4 = *v3;
  return v4;
}

- (BOOL)_isBooleanSettingType:(unint64_t)a3
{
  return (a3 < 6) & (0x34u >> a3);
}

- (BOOL)_isContentType:(unint64_t)a3 allowedWithRating:(id)a4
{
  id v6 = a4;
  unsigned int v7 = -[PBRestrictionServiceRequestManager _isBooleanSettingType:](self, "_isBooleanSettingType:", a3);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( -[PBRestrictionServiceRequestManager _featureNameForContentType:]( self,  "_featureNameForContentType:",  a3));
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v10 = v9;
  if (v7)
  {
    unsigned int v11 = [v9 effectiveBoolValueForSetting:v8];

    BOOL v12 = v11 == 1 || [v6 compare:&off_1003FDE78] != 0;
  }

  else
  {
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v9 effectiveValueForSetting:v8]);

    if (v13)
    {
      BOOL v12 = ([v13 isEqualToNumber:&off_1003FDE90] & 1) == 0
         && [v6 compare:v13] != (id)1;
    }

    else
    {
      v14 = (os_log_s *)qword_100471150;
      if (os_log_type_enabled((os_log_t)qword_100471150, OS_LOG_TYPE_ERROR)) {
        sub_1002889B0((uint64_t)v8, v14);
      }
      BOOL v12 = 1;
    }
  }

  return v12;
}

- (BOOL)_isContentTypeRestrictedByProfile:(unint64_t)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBRestrictionServiceRequestManager _featureNameForContentType:](self, "_featureNameForContentType:"));
  LODWORD(a3) = -[PBRestrictionServiceRequestManager _isBooleanSettingType:](self, "_isBooleanSettingType:", a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned int v7 = v6;
  if ((_DWORD)a3)
  {
    LOBYTE(v8) = [v6 isSettingLockedDownByRestrictions:v5];
  }

  else
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 parametersForValueSetting:v5]);

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 effectiveParametersForValueSetting:v5]);

    uint64_t v12 = MCSettingParameterRangeMaximumKey;
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:MCSettingParameterRangeMaximumKey]);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v11 objectForKey:v12]);
    uint64_t v15 = (void *)v14;
    if (v13) {
      BOOL v16 = v14 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (v16) {
      LOBYTE(v8) = 0;
    }
    else {
      unsigned int v8 = [v13 isEqual:v14] ^ 1;
    }

    unsigned int v7 = v9;
  }

  return v8;
}

- (BOOL)_isSettingRestrictedByProfile:(unint64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBRestrictionServiceRequestManager _featureNameForSetting:](self, "_featureNameForSetting:", a3));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    unsigned __int8 v5 = [v4 isSettingLockedDownByRestrictions:v3];
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (TVSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (NSMutableArray)pendingServiceRequestsQueue
{
  return self->_pendingServiceRequestsQueue;
}

- (NSMutableDictionary)pendingTokenToRequestMapping
{
  return self->_pendingTokenToRequestMapping;
}

- (PBRestrictionServiceRequest)currentRequest
{
  return self->_currentRequest;
}

- (void)setCurrentRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end