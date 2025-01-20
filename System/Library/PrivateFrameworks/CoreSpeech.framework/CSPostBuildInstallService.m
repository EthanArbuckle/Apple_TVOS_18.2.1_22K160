@interface CSPostBuildInstallService
+ (id)sharedService;
- (void)_performPostBuildInstallWithCompletion:(id)a3;
- (void)registerPostBuildInstallService;
@end

@implementation CSPostBuildInstallService

- (void)registerPostBuildInstallService
{
  v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[CSPostBuildInstallService registerPostBuildInstallService]";
    __int16 v8 = 2080;
    v9 = "com.apple.cs.postinstall";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Registering for post build install/first unlock activity - %s",  buf,  0x16u);
  }

  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_POST_INSTALL, 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100027290;
  handler[3] = &unk_10022DE70;
  handler[4] = self;
  xpc_activity_register("com.apple.cs.postinstall", v4, handler);
}

- (void)_performPostBuildInstallWithCompletion:(id)a3
{
  id v3 = a3;
  v9[0] = 0LL;
  v9[1] = v9;
  v9[2] = 0x3032000000LL;
  v9[3] = sub_100027168;
  v9[4] = sub_100027178;
  id v10 = 0LL;
  xpc_object_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSRVoiceProfileManager sharedInstance](&OBJC_CLASS___SSRVoiceProfileManager, "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100027180;
  v6[3] = &unk_10022A718;
  __int16 v8 = v9;
  id v5 = v3;
  id v7 = v5;
  [v4 triggerVoiceProfileCleanupWithCompletion:v6];

  _Block_object_dispose(v9, 8);
}

+ (id)sharedService
{
  if (qword_10027FCA0 != -1) {
    dispatch_once(&qword_10027FCA0, &stru_10022A6F0);
  }
  return (id)qword_10027FC98;
}

@end