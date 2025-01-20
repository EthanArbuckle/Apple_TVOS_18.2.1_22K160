@interface PBOpenApplicationRequest
- (BOOL)_shouldSendPayloadSourceApplication;
- (BOOL)enforceDeepLinking;
- (BOOL)hasBrowsingWebAction;
- (BOOL)hasPayloadURL;
- (BOOL)isDebugging;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForeground;
- (BOOL)isLaunchedByDeactivation;
- (BOOL)isLaunchedOverSiri;
- (BOOL)isTrustedRequest;
- (BOOL)relaunchingForUserProfileSwitch;
- (BOOL)shouldAnimatedLayout;
- (BOOL)waitForDebugger;
- (BSAuditToken)auditToken;
- (FBSOpenApplicationOptions)openApplicationOptions;
- (FBSSceneIdentity)fromSceneIdentity;
- (FBSSceneIdentity)toSceneIdentity;
- (NSString)launchReason;
- (PBAppInfo)fromAppInfo;
- (PBAppInfo)toAppInfo;
- (PBApplication)fromApplication;
- (PBApplication)sourceApplication;
- (PBOpenApplicationRequest)initWithOpenApplicationOptions:(id)a3 trustedRequest:(BOOL)a4 toAppInfo:(id)a5 fromApplication:(id)a6 sourceApplication:(id)a7 sourceAuditToken:(id)a8;
- (PBOpenApplicationRequest)initWithSystemServiceRequest:(id)a3 toAppInfo:(id)a4 fromApplication:(id)a5 sourceApplication:(id)a6;
- (id)_makeTransitionActions;
- (id)_makeTransitionPayload;
- (id)_payloadSourceApplication;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)makeProcessExecutionContext;
- (id)makeSceneTransitionContext;
- (int64_t)launchIntent;
- (unint64_t)hash;
@end

@implementation PBOpenApplicationRequest

- (PBOpenApplicationRequest)initWithSystemServiceRequest:(id)a3 toAppInfo:(id)a4 fromApplication:(id)a5 sourceApplication:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 options]);
  id v15 = [v13 isTrusted];
  v16 = (void *)objc_claimAutoreleasedReturnValue([v13 clientProcess]);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 handle]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 auditToken]);

  v19 = -[PBOpenApplicationRequest initWithOpenApplicationOptions:trustedRequest:toAppInfo:fromApplication:sourceApplication:sourceAuditToken:]( self,  "initWithOpenApplicationOptions:trustedRequest:toAppInfo:fromApplication:sourceApplication:sourceAuditToken:",  v14,  v15,  v12,  v11,  v10,  v18);
  return v19;
}

- (PBOpenApplicationRequest)initWithOpenApplicationOptions:(id)a3 trustedRequest:(BOOL)a4 toAppInfo:(id)a5 fromApplication:(id)a6 sourceApplication:(id)a7 sourceAuditToken:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v44 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v16)
  {
    v19 = v18;
    v45.receiver = self;
    v45.super_class = (Class)&OBJC_CLASS___PBOpenApplicationRequest;
    v20 = -[PBOpenApplicationRequest init](&v45, "init");
    if (v20)
    {
      v21 = (FBSOpenApplicationOptions *)[v15 copy];
      openApplicationOptions = v20->_openApplicationOptions;
      v20->_openApplicationOptions = v21;

      v23 = (BSAuditToken *)[v19 copy];
      auditToken = v20->_auditToken;
      v20->_auditToken = v23;

      v20->_trustedRequest = a4;
      objc_storeStrong((id *)&v20->_toAppInfo, a5);
      objc_storeStrong((id *)&v20->_fromApplication, a6);
      objc_storeStrong((id *)&v20->_sourceApplication, a7);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[FBSOpenApplicationOptions dictionary](v20->_openApplicationOptions, "dictionary"));
      id v26 = (id)objc_claimAutoreleasedReturnValue(-[PBAppInfo applicationInfo](v20->_toAppInfo, "applicationInfo"));
      uint64_t v27 = FBSOpenApplicationOptionKeyActivateSuspended;
      id v28 = v25;
      uint64_t v30 = objc_opt_self(&OBJC_CLASS___NSNumber, v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bs_safeObjectForKey:ofType:", v27, v31));
      unsigned int v33 = [v32 BOOLValue];

      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bs_safeNumberForKey:", FBSOpenApplicationOptionKeyLaunchIntent));
      id v35 = [v34 integerValue];

      if (v35)
      {
        uint64_t v36 = 3LL;
        if (v35 == (id)4) {
          uint64_t v36 = 4LL;
        }
        uint64_t v37 = 1LL;
        if (v35 != (id)1) {
          uint64_t v37 = 2LL;
        }
        if (v33) {
          uint64_t v38 = v37;
        }
        else {
          uint64_t v38 = v36;
        }
      }

      else if (v33)
      {
        else {
          uint64_t v38 = 2LL;
        }
      }

      else
      {
        uint64_t v38 = 4LL;
      }

      v20->_launchIntent = v38;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[FBSOpenApplicationOptions dictionary](v20->_openApplicationOptions, "dictionary"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "bs_safeArrayForKey:", FBSOpenApplicationOptionKeyActions));

      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bs_firstObjectPassingTest:", &stru_1003D5908));
      LOBYTE(v39) = v41 != 0LL;

      v20->_hasBrowsingWebAction = (char)v39;
    }

    return v20;
  }

  else
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"toAppInfo != ((void *)0)",  v44));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027C4C4(a2, (uint64_t)self, (uint64_t)v43);
    }
    result = (PBOpenApplicationRequest *)_bs_set_crash_log_message([v43 UTF8String]);
    __break(0);
  }

  return result;
}

- (PBAppInfo)fromAppInfo
{
  return (PBAppInfo *)(id)objc_claimAutoreleasedReturnValue(-[PBApplication appInfo](self->_fromApplication, "appInfo"));
}

- (FBSSceneIdentity)fromSceneIdentity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest fromAppInfo](self, "fromAppInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 defaultSceneIdentity]);

  return (FBSSceneIdentity *)v3;
}

- (FBSSceneIdentity)toSceneIdentity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest toAppInfo](self, "toAppInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 defaultSceneIdentity]);

  return (FBSSceneIdentity *)v3;
}

- (BOOL)isForeground
{
  return (id)-[PBOpenApplicationRequest launchIntent](self, "launchIntent") == (id)4;
}

- (BOOL)isLaunchedOverSiri
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBSOpenApplicationOptions dictionary](self->_openApplicationOptions, "dictionary"));
  unsigned __int8 v3 = objc_msgSend(v2, "bs_BOOLForKey:", PBAppLaunchOptionLaunchOverSiri);

  return v3;
}

- (BOOL)isLaunchedByDeactivation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBSOpenApplicationOptions dictionary](self->_openApplicationOptions, "dictionary"));
  unsigned __int8 v3 = objc_msgSend(v2, "bs_BOOLForKey:", PBAppLaunchOptionDeactivation);

  return v3;
}

- (BOOL)isDebugging
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBSOpenApplicationOptions dictionary](self->_openApplicationOptions, "dictionary"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:FBSOpenApplicationOptionKeyDebuggingOptions]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (BOOL)waitForDebugger
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBSOpenApplicationOptions dictionary](self->_openApplicationOptions, "dictionary"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:FBSOpenApplicationOptionKeyDebuggingOptions]);
  unsigned __int8 v4 = objc_msgSend(v3, "bs_BOOLForKey:", FBSDebugOptionKeyWaitForDebugger);

  return v4;
}

- (BOOL)hasPayloadURL
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBSOpenApplicationOptions url](self->_openApplicationOptions, "url"));
  if (v3) {
    BOOL hasBrowsingWebAction = 1;
  }
  else {
    BOOL hasBrowsingWebAction = self->_hasBrowsingWebAction;
  }

  return hasBrowsingWebAction;
}

- (BOOL)shouldAnimatedLayout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBSOpenApplicationOptions dictionary](self->_openApplicationOptions, "dictionary"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bs_safeNumberForKey:", PBAppLaunchOptionLaunchWithoutAnimation));

  if (v3) {
    unsigned int v4 = [v3 BOOLValue] ^ 1;
  }
  else {
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (BOOL)relaunchingForUserProfileSwitch
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBSOpenApplicationOptions dictionary](self->_openApplicationOptions, "dictionary"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bs_safeNumberForKey:", PBAppLaunchOptionRelaunchedForUserProfileSwitch));

  if (v3) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (NSString)launchReason
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBSOpenApplicationOptions dictionary](self->_openApplicationOptions, "dictionary"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bs_safeStringForKey:", @"PBAppLaunchOptionReason"));

  return (NSString *)v3;
}

- (id)makeProcessExecutionContext
{
  id v3 = objc_alloc_init(&OBJC_CLASS___FBMutableProcessExecutionContext);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBSOpenApplicationOptions dictionary](self->_openApplicationOptions, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:FBSOpenApplicationOptionKeyDebuggingOptions]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_safeArrayForKey:", FBSDebugOptionKeyArguments));
  [v3 setArguments:v6];

  if (qword_100470A28 != -1) {
    dispatch_once(&qword_100470A28, &stru_1003D58C0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfo bundleIdentifier](self->_toAppInfo, "bundleIdentifier"));
  if (([v7 isEqualToString:@"com.apple.TVSettings"] & 1) == 0)
  {

    goto LABEL_10;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v9 = [v8 BOOLForKey:@"PBLaunchSettingsWithMallocProbGuard"];

  if (!v9)
  {
LABEL_10:
    id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_safeDictionaryForKey:", FBSDebugOptionKeyEnvironment));
    [v3 setEnvironment:v16];
    goto LABEL_15;
  }

  id v10 = sub_100083CA8();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Enabling PGM for TVSettings", v24, 2u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_safeDictionaryForKey:", FBSDebugOptionKeyEnvironment));
  id v13 = [v12 mutableCopy];
  v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  id v16 = v15;

  [v16 setObject:&off_1003FDAB8 forKeyedSubscript:@"MallocProbGuard"];
  if (_BSIsInternalInstall("-[PBOpenApplicationRequest makeProcessExecutionContext]", v17))
  {
    [v16 setObject:&off_1003FDAD0 forKeyedSubscript:@"MallocProbGuardMemoryBudgetInKB"];
    [v16 setObject:&off_1003FDAE8 forKeyedSubscript:@"MallocProbGuardSampleRate"];
  }

  id v18 = [v16 copy];
  [v3 setEnvironment:v18];

LABEL_15:
  objc_msgSend(v3, "setDisableASLR:", objc_msgSend(v5, "bs_BOOLForKey:", FBSDebugOptionKeyDisableASLR));
  objc_msgSend(v3, "setWaitForDebugger:", -[PBOpenApplicationRequest waitForDebugger](self, "waitForDebugger"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_safeStringForKey:", FBSDebugOptionKeyStandardOutPath));
  if (v19)
  {
    v20 = -[NSURL initFileURLWithPath:](objc_alloc(&OBJC_CLASS___NSURL), "initFileURLWithPath:", v19);
    [v3 setStandardOutputURL:v20];
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_safeStringForKey:", FBSDebugOptionKeyStandardErrorPath));
  if (v21)
  {
    v22 = -[NSURL initFileURLWithPath:](objc_alloc(&OBJC_CLASS___NSURL), "initFileURLWithPath:", v21);
    [v3 setStandardErrorURL:v22];
  }

  objc_msgSend(v3, "setLaunchIntent:", -[PBOpenApplicationRequest launchIntent](self, "launchIntent"));

  return v3;
}

- (id)makeSceneTransitionContext
{
  id v3 = objc_alloc_init(&OBJC_CLASS___UIApplicationSceneTransitionContext);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setUserLaunchEventTime:");
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest _makeTransitionPayload](self, "_makeTransitionPayload"));
  [v3 setPayload:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest _makeTransitionActions](self, "_makeTransitionActions"));
  [v3 setActions:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBSOpenApplicationOptions dictionary](self->_openApplicationOptions, "dictionary"));
  objc_msgSend(v3, "setForTesting:", objc_msgSend(v6, "bs_BOOLForKey:", @"PBAppLaunchOptionForTesting"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBSOpenApplicationOptions dictionary](self->_openApplicationOptions, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bs_safeNumberForKey:", PBAppLaunchOptionContinuousUserLaunchEventTime));

  if (v8)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfo applicationInfo](self->_toAppInfo, "applicationInfo"));
    id v18 = 0LL;
    id v17 = [@"HomeScreen" UTF8String];
    uint64_t v10 = -[PBOpenApplicationRequest isForeground](self, "isForeground") ^ 1;
    id v11 = objc_claimAutoreleasedReturnValue([v9 bundleVersion]);
    id v12 = [v11 UTF8String];
    id v13 = objc_claimAutoreleasedReturnValue([v9 shortVersionString]);
    id v14 = [v13 UTF8String];
    id v15 = objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
    alm_app_will_launch_with_details_and_metrics_payload( v17,  v10,  v12,  v14,  [v15 UTF8String],  objc_msgSend(v8, "unsignedLongLongValue"),  &v19,  &v18);

    [v3 setSignpostID:v19];
    [v3 setLaunchMetricsPayload:v18];
  }

  return v3;
}

- (id)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest toSceneIdentity](self, "toSceneIdentity"));
  id v5 = [v3 appendObject:v4 withName:@"toSceneIdentity"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest fromSceneIdentity](self, "fromSceneIdentity"));
  id v7 = [v3 appendObject:v6 withName:@"fromSceneIdentity"];

  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return v8;
}

- (id)debugDescription
{
  v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  v8 = sub_1000C48A4;
  unsigned int v9 = &unk_1003CFEB8;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self));
  id v11 = self;
  id v3 = v10;
  [v3 appendBodySectionWithName:0 multilinePrefix:0 block:&v6];
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build", v6, v7, v8, v9));

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___PBOpenApplicationRequest));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfo bundleIdentifier](self->_toAppInfo, "bundleIdentifier"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000C4AA8;
  v19[3] = &unk_1003D2B30;
  id v8 = v4;
  id v20 = v8;
  id v9 = [v6 appendObject:v7 counterpart:v19];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBSOpenApplicationOptions dictionary](self->_openApplicationOptions, "dictionary"));
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  id v16 = sub_1000C4AE8;
  id v17 = &unk_1003D2130;
  id v18 = v8;
  id v11 = v8;
  id v12 = [v6 appendObject:v10 counterpart:&v14];

  LOBYTE(v10) = objc_msgSend(v6, "isEqual", v14, v15, v16, v17);
  return (char)v10;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(&OBJC_CLASS___BSHashBuilder);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfo bundleIdentifier](self->_toAppInfo, "bundleIdentifier"));
  id v5 = [v3 appendObject:v4];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBSOpenApplicationOptions dictionary](self->_openApplicationOptions, "dictionary"));
  id v7 = [v3 appendObject:v6];

  id v8 = [v3 hash];
  return (unint64_t)v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend( objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3),  "initWithOpenApplicationOptions:trustedRequest:toAppInfo:fromApplication:sourceApplication:sourceAuditToken:",  self->_openApplicationOptions,  self->_trustedRequest,  self->_toAppInfo,  self->_fromApplication,  self->_sourceApplication,  self->_auditToken);
}

- (id)_makeTransitionActions
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBSOpenApplicationOptions url](self->_openApplicationOptions, "url"));
  if (v4 && !self->_hasBrowsingWebAction)
  {
    id v5 = [[UIOpenURLAction alloc] initWithURL:v4];
    -[NSMutableSet addObject:](v3, "addObject:", v5);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBSOpenApplicationOptions dictionary](self->_openApplicationOptions, "dictionary"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bs_safeArrayForKey:", FBSOpenApplicationOptionKeyActions));
  if (v7) {
    -[NSMutableSet addObjectsFromArray:](v3, "addObjectsFromArray:", v7);
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bs_safeDictionaryForKey:", FBSOpenApplicationOptionKeyPayloadOptions));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_safeStringForKey:", UIApplicationLaunchOptionsURLSessionKey));
  if (v9)
  {
    id v10 = [[UIHandleBackgroundURLSessionAction alloc] initWithSessionIdentifier:v9];
    -[NSMutableSet addObject:](v3, "addObject:", v10);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bs_safeDictionaryForKey:", FBSOpenApplicationOptionKeyActivateForEvent));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:FBSActivateForEventOptionTypeBackgroundContentFetching]);

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfo bundleIdentifier](self->_toAppInfo, "bundleIdentifier"));
    id v14 = objc_alloc(&OBJC_CLASS___UIFetchContentInBackgroundAction);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000C4E10;
    v18[3] = &unk_1003D58E8;
    id v19 = v13;
    id v15 = v13;
    id v16 = [v14 initWithHandler:v18];
    -[NSMutableSet addObject:](v3, "addObject:", v16);
  }

  return v3;
}

- (BOOL)_shouldSendPayloadSourceApplication
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfo applicationInfo](self->_toAppInfo, "applicationInfo"));
  if ([v3 isArcherLinked])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplication applicationInfo](self->_fromApplication, "applicationInfo"));
    if ([v3 isSystemApplication])
    {
      unsigned __int8 v5 = 1;
    }

    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue([v3 teamIdentifier]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 teamIdentifier]);
      unsigned __int8 v5 = [v6 isEqual:v7];
    }
  }

  else
  {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (id)_payloadSourceApplication
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBSOpenApplicationOptions dictionary](self->_openApplicationOptions, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bs_safeDictionaryForKey:", FBSOpenApplicationOptionKeyPayloadOptions));

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSAuditToken bundleID](self->_auditToken, "bundleID"));
  if (self->_trustedRequest)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:UIApplicationLaunchOptionsSourceApplicationKey]);

    if (v6)
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_safeStringForKey:", UIApplicationLaunchOptionsSourceApplicationKey));

      unsigned __int8 v5 = (void *)v7;
    }
  }

  return v5;
}

- (id)_makeTransitionPayload
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBSOpenApplicationOptions dictionary](self->_openApplicationOptions, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bs_safeDictionaryForKey:", FBSOpenApplicationOptionKeyPayloadOptions));
  id v5 = [v4 mutableCopy];
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  id v8 = v7;

  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bs_safeDictionaryForKey:", FBSOpenApplicationOptionKeyPayloadAnnotation));
  objc_msgSend(v8, "bs_setSafeObject:forKey:", v9, _UIApplicationLaunchOptionsAnnotationKey);
  if (-[PBOpenApplicationRequest _shouldSendPayloadSourceApplication](self, "_shouldSendPayloadSourceApplication"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest _payloadSourceApplication](self, "_payloadSourceApplication"));
    [v8 setObject:v10 forKeyedSubscript:UIApplicationLaunchOptionsSourceApplicationKey];
  }

  else
  {
    [v8 setObject:0 forKeyedSubscript:UIApplicationLaunchOptionsSourceApplicationKey];
  }

  if (self->_hasBrowsingWebAction)
  {
    [v8 setObject:0 forKeyedSubscript:UIApplicationLaunchOptionsURLKey];
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBSOpenApplicationOptions url](self->_openApplicationOptions, "url"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 relativeString]);
    [v8 setObject:v12 forKeyedSubscript:UIApplicationLaunchOptionsURLKey];
  }

  return v8;
}

- (PBApplication)fromApplication
{
  return self->_fromApplication;
}

- (PBApplication)sourceApplication
{
  return self->_sourceApplication;
}

- (PBAppInfo)toAppInfo
{
  return self->_toAppInfo;
}

- (int64_t)launchIntent
{
  return self->_launchIntent;
}

- (FBSOpenApplicationOptions)openApplicationOptions
{
  return self->_openApplicationOptions;
}

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

- (BOOL)isTrustedRequest
{
  return self->_trustedRequest;
}

- (BOOL)hasBrowsingWebAction
{
  return self->_hasBrowsingWebAction;
}

- (void).cxx_destruct
{
}

- (BOOL)enforceDeepLinking
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBSOpenApplicationOptions dictionary](self->_openApplicationOptions, "dictionary"));
  unsigned __int8 v3 = objc_msgSend(v2, "bs_BOOLForKey:", @"PBUILaunchWithDeepLinking");

  return v3;
}

@end