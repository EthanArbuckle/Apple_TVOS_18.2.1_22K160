@interface ADRemoteRequestHelper
+ (id)requestWithActivityInfo:(id)a3;
+ (void)getInfoForHandoffPayload:(id)a3 userInfo:(id *)a4 wepageURL:(id *)a5;
- (ADRemoteRequestHelper)initWithQueue:(id)a3;
- (AFRequestInfo)remoteRequestInfo;
- (id)completion;
- (id)userNotificationRequestForRemoteRequest;
- (void)setCompletion:(id)a3;
- (void)setRemoteRequestInfo:(id)a3;
@end

@implementation ADRemoteRequestHelper

- (ADRemoteRequestHelper)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADRemoteRequestHelper;
  v6 = -[ADRemoteRequestHelper init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (void)setRemoteRequestInfo:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_remoteRequestInfo, a3);
  if (self->_handoffNotificationID)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[ADUserNotificationServiceProvider personalDomainNotificationProvider]( &OBJC_CLASS___ADUserNotificationServiceProvider,  "personalDomainNotificationProvider"));
    [v5 withdrawNotificationRequestWithIdentifier:self->_handoffNotificationID];
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  handoffNotificationID = self->_handoffNotificationID;
  self->_handoffNotificationID = v7;
}

- (id)userNotificationRequestForRemoteRequest
{
  if (self->_remoteRequestInfo)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___UNMutableNotificationContent);
    -[UNMutableNotificationContent setShouldBackgroundDefaultAction:](v3, "setShouldBackgroundDefaultAction:", 1LL);
    v4 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___AFRequestInfo));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    else {
      v6 = @"ASSISTANT_SERVICES_HOMEPOD_REQUEST_HANDOFF_NOTIFICATION_TITLE";
    }
    if (sub_1001EBEE8())
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v5 localizations]);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"AppleLanguages"]);
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle preferredLocalizationsFromArray:forPreferences:]( &OBJC_CLASS___NSBundle,  "preferredLocalizationsFromArray:forPreferences:",  v7,  v9));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedStringForKey:v6 value:0 table:0 localization:v11]);
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:v6 value:0 table:0]);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AFRequestInfo handoffOriginDeviceName](self->_remoteRequestInfo, "handoffOriginDeviceName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v13,  @"%@",  0LL,  v15));

    -[UNMutableNotificationContent setTitle:](v3, "setTitle:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[AFRequestInfo handoffNotification](self->_remoteRequestInfo, "handoffNotification"));
    -[UNMutableNotificationContent setBody:](v3, "setBody:", v17);

    v14 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationRequest requestWithIdentifier:content:trigger:]( &OBJC_CLASS___UNNotificationRequest,  "requestWithIdentifier:content:trigger:",  self->_handoffNotificationID,  v3,  0LL));
  }

  else
  {
    v14 = 0LL;
  }

  return v14;
}

- (AFRequestInfo)remoteRequestInfo
{
  return self->_remoteRequestInfo;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)requestWithActivityInfo:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___SAStartHandoffRequest);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Data"]);

  [v4 setHandoffData:v5];
  return v4;
}

+ (void)getInfoForHandoffPayload:(id)a3 userInfo:(id *)a4 wepageURL:(id *)a5
{
  v7 = (void *)objc_claimAutoreleasedReturnValue([a3 handoffPayload]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___SASessionHandoffPayload);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionHandoffData]);
    id v10 = [v9 copy];

    if (v10)
    {
      v15 = @"Data";
      id v16 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    }

    else
    {
      v11 = 0LL;
    }
  }

  else
  {
    v11 = 0LL;
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___SAURIHandoffPayload);
  if ((objc_opt_isKindOfClass(v7, v12) & 1) == 0)
  {
    id v14 = 0LL;
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 link]);
  id v14 = [v13 copy];

  if (a4) {
LABEL_11:
  }
    *a4 = v11;
LABEL_12:
  if (a5) {
    *a5 = v14;
  }
}

@end