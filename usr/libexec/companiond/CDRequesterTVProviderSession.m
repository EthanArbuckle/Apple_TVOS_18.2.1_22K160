@interface CDRequesterTVProviderSession
- (BOOL)_requireOwnerDevice;
- (id)_idsMessageRecipientUsernames;
- (void)_configureRapportClient:(id)a3;
- (void)_handleGetAuthInfoRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_prepareForActivationWithCompletionHandler:(id)a3;
@end

@implementation CDRequesterTVProviderSession

- (void)_prepareForActivationWithCompletionHandler:(id)a3
{
  v14 = (void (**)(id, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 providerURL]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 absoluteString]);
  id v7 = [v6 length];

  if (!v7)
  {
    v11 = @"Missing provider URL";
LABEL_6:
    uint64_t v12 = CPSErrorMake(205LL, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14[2](v14, v13);

    goto LABEL_7;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 providerName]);
  id v10 = [v9 length];

  if (!v10)
  {
    v11 = @"Missing provider name";
    goto LABEL_6;
  }

  v14[2](v14, 0LL);
LABEL_7:
}

- (void)_configureRapportClient:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100010664;
  v3[3] = &unk_100030898;
  v3[4] = self;
  [a3 registerRequestID:@"com.apple.CompanionAuthentication.GetAuthInfo" options:0 handler:v3];
}

- (BOOL)_requireOwnerDevice
{
  return 1;
}

- (id)_idsMessageRecipientUsernames
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 userProfilesSnapshot]);

  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 primaryUserProfile]);
  if (v4)
  {
    id v5 = [[PBSUserProfileAccountInfo alloc] initWithUserProfile:v4];
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 iCloudAccount]);
  }

  else
  {
    v6 = 0LL;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 username]);
  if (v7)
  {
    id v10 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (void)_handleGetAuthInfoRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _os_activity_create( (void *)&_mh_execute_header,  "tv provider session/handle get auth info request",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v11, &v23);
  uint64_t v12 = -[CDGetInfoRequest initWithRapportDictionary:]( objc_alloc(&OBJC_CLASS___CDGetInfoRequest),  "initWithRapportDictionary:",  v8);
  uint64_t v13 = cps_session_log(v12);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received get auth info request: %@", buf, 0xCu);
  }

  v15 = objc_alloc_init(&OBJC_CLASS___CDTVProviderGetAuthInfoResponse);
  v16 = (void *)GestaltCopyAnswer(@"DeviceName", 0LL, 0LL);
  -[CDTVProviderGetAuthInfoResponse setDeviceClass:](v15, "setDeviceClass:", v16);

  v17 = (void *)GestaltCopyAnswer(@"UserAssignedDeviceName", 0LL, 0LL);
  -[CDTVProviderGetAuthInfoResponse setDeviceName:](v15, "setDeviceName:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 providerURL]);
  -[CDTVProviderGetAuthInfoResponse setProviderURL:](v15, "setProviderURL:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 providerName]);
  -[CDTVProviderGetAuthInfoResponse setProviderName:](v15, "setProviderName:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CDTVProviderGetAuthInfoResponse makeRapportDictionary](v15, "makeRapportDictionary"));
  (*((void (**)(id, void *, void, void))v10 + 2))(v10, v22, 0LL, 0LL);

  os_activity_scope_leave(&v23);
}

@end