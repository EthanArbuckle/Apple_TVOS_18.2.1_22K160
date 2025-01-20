@interface LaunchServicesObserver
- (LaunchServicesObserver)init;
- (void)_handleAppleIDDidChangeNotification:(id)a3;
- (void)_handleInstalledEventNotification:(id)a3;
- (void)_handleUninstalledEventNotification:(id)a3;
@end

@implementation LaunchServicesObserver

- (LaunchServicesObserver)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___LaunchServicesObserver;
  v2 = -[LaunchServicesObserver init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v4 = sub_1002EB2A0((uint64_t)&OBJC_CLASS___Device);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    unsigned __int8 v6 = [v5 isHRNMode];

    if ((v6 & 1) == 0)
    {
      [v3 addObserver:v2 selector:"_handleInstalledEventNotification:" name:@"com.apple.LaunchServices.applicationRegistered" object:0];
      [v3 addObserver:v2 selector:"_handleUninstalledEventNotification:" name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
      [v3 addObserver:v2 selector:"_handleBetaAppCrashedNotification:" name:@"com.apple.ReportCrash.beta.bulletin" object:0];
      [v3 addObserver:v2 selector:"_handleAppleIDDidChangeNotification:" name:@"com.apple.appstored.ASDAppleIDDidChangeNotification" object:0];
    }
  }

  return v2;
}

- (void)_handleInstalledEventNotification:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1002CC364;
  v3[3] = &unk_1003F1B48;
  v3[4] = self;
  sub_1002CC808((uint64_t)self, a3, v3);
}

- (void)_handleAppleIDDidChangeNotification:(id)a3
{
  uint64_t v4 = ASDLogHandleForCategory(9LL);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = (id)objc_opt_class(self, v6);
    id v7 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: Received Apple ID did change notification.",  (uint8_t *)&v11,  0xCu);
  }

  objc_super v8 = objc_opt_new(&OBJC_CLASS___TaskQueue);
  p_isa = (id *)&v8->super.isa;
  if (v8)
  {
    -[NSOperationQueue setName:]( v8->_operationQueue,  "setName:",  @"com.apple.LaunchServicesObserver.AppleIDDidChange.ValidateAppleIDs");
    v10 = objc_opt_new(&OBJC_CLASS___ValidateAppleIDsTask);
    [p_isa[1] addOperation:v10];
  }

  else
  {
    v10 = objc_opt_new(&OBJC_CLASS___ValidateAppleIDsTask);
  }
}

- (void)_handleUninstalledEventNotification:(id)a3
{
}

- (void).cxx_destruct
{
}

@end