@interface AAPCommandLaunch
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4 executionInfo:(id)a5;
@end

@implementation AAPCommandLaunch

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4 executionInfo:(id)a5
{
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v24 = sub_5568;
  v25 = &unk_1C628;
  v26 = self;
  id v27 = a3;
  v7 = (FBSOpenApplicationOptions *)-[AAPCommandLaunch launchId](self, "launchId", a3, a4);
  id v8 = [a5 turnId];
  v9 = (os_log_s *)AFSiriLogContextPlugin;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[AAPCommandLaunch performWithCompletion:serviceHelper:executionInfo:]";
    __int16 v30 = 2112;
    uint64_t v31 = (uint64_t)a5;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: ExecutionInfo: %@", buf, 0x16u);
  }

  if (!v7)
  {
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_10AB4((uint64_t)self);
    }
    goto LABEL_14;
  }

  v10 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint");
  v36[0] = FBSOpenApplicationOptionKeyUnlockDevice;
  v36[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v37[0] = &__kCFBooleanTrue;
  v37[1] = &__kCFBooleanTrue;
  v11 = +[FBSOpenApplicationOptions optionsWithDictionary:]( &OBJC_CLASS___FBSOpenApplicationOptions,  "optionsWithDictionary:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  2LL));
  v12 = (os_log_s *)AFSiriLogContextPlugin;
  if (!v10)
  {
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_10B4C((uint64_t)self);
    }
LABEL_14:
    id v16 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
    v24((uint64_t)v23, (uint64_t)[v16 dictionary]);

    return;
  }

  v13 = v11;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = objc_opt_class(self);
    *(_DWORD *)buf = 136315906;
    v29 = "-[AAPCommandLaunch performWithCompletion:serviceHelper:executionInfo:]";
    __int16 v30 = 2114;
    uint64_t v31 = v14;
    __int16 v32 = 2048;
    v33 = self;
    __int16 v34 = 2112;
    v35 = v7;
    _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "%s com.apple.siri.applications: <%{public}@:%p> processing command for app (%@)",  buf,  0x2Au);
  }

  if (v8)
  {
    id v15 = objc_alloc_init(&OBJC_CLASS___SISchemaUEIUUFRReady);
    objc_msgSend( +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics"),  "logInstrumentation:machAbsoluteTime:turnIdentifier:",  v15,  mach_absolute_time(),  v8);

    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
      sub_10C78();
    }
  }

  else
  {
    v17 = (os_log_s *)AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_10BF8(v17);
    }
  }

  v18 = +[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance");
  -[PBSSystemService wakeSystemForReason:](v18, "wakeSystemForReason:", PBSWakeReasonSiriCommand);
  v19 = v10;
  v20 = (os_log_s *)AFSiriLogContextPlugin;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = objc_opt_class(self);
    *(_DWORD *)buf = 136315906;
    v29 = "-[AAPCommandLaunch performWithCompletion:serviceHelper:executionInfo:]";
    __int16 v30 = 2114;
    uint64_t v31 = v21;
    __int16 v32 = 2048;
    v33 = self;
    __int16 v34 = 2112;
    v35 = v13;
    _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "%s com.apple.siri.applications: <%{public}@:%p> launchOptions (%@)",  buf,  0x2Au);
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_56DC;
  v22[3] = &unk_1C650;
  v22[4] = self;
  v22[5] = v7;
  v22[6] = v10;
  v22[7] = v23;
  -[FBSOpenApplicationService openApplication:withOptions:completion:]( v10,  "openApplication:withOptions:completion:",  v7,  v13,  v22);
}

@end