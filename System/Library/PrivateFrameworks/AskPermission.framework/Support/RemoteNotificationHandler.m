@interface RemoteNotificationHandler
+ (RemoteNotificationHandler)sharedHandler;
- (APSConnection)apsConnection;
- (OS_dispatch_queue)apsQueue;
- (id)_accountMediaTypes;
- (id)_activeStoreDSIDs;
- (id)_allStoreDSIDs;
- (id)_cloudDSID;
- (id)_storeDSIDsForMediaType:(id)a3 onlyIncludeActive:(BOOL)a4;
- (void)_handleApproverNotification:(id)a3;
- (void)_handleCloudNotificationPayload:(id)a3;
- (void)_handleRequesterNotification:(id)a3 andSuppressDialog:(BOOL)a4;
- (void)_handleStoreNotificationPayload:(id)a3;
- (void)_startConnection;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)handleLegacyStoreNotificationPayload:(id)a3;
- (void)setApsConnection:(id)a3;
- (void)setApsQueue:(id)a3;
- (void)start;
@end

@implementation RemoteNotificationHandler

+ (RemoteNotificationHandler)sharedHandler
{
  if (qword_10003A9B8 != -1) {
    dispatch_once(&qword_10003A9B8, &stru_100030A48);
  }
  return (RemoteNotificationHandler *)(id)qword_10003A9C0;
}

- (void)start
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteNotificationHandler apsQueue](self, "apsQueue"));

  if (!v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.AskPermission.RemoteNotificationHandler", 0LL);
    -[RemoteNotificationHandler setApsQueue:](self, "setApsQueue:", v4);
  }

  -[RemoteNotificationHandler _startConnection](self, "_startConnection");
}

- (void)handleLegacyStoreNotificationPayload:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RemoteNotificationHandler apsQueue](self, "apsQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000F86C;
  v7[3] = &unk_1000305D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig", a3, a4));
  if (!v5) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = (id)objc_opt_class(self);
    id v7 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Received public token",  (uint8_t *)&v8,  0xCu);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RemoteNotificationHandler apsQueue](self, "apsQueue"));
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v7) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v22 = 138543362;
    *(void *)&v22[4] = objc_opt_class(self);
    id v9 = *(id *)&v22[4];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Received APS notification",  v22,  0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  if (!v10)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v13) {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "OSLogObject", *(_OWORD *)v22));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_opt_class(self);
      *(_DWORD *)v22 = 138543362;
      *(void *)&v22[4] = v15;
      id v16 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%{public}@: Notification doesn't contain payload",  v22,  0xCu);
    }

    goto LABEL_18;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 topic]);
  unsigned int v12 = [v11 isEqualToString:@"com.icloud.askpermission"];

  if (!v12)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v5 topic]);
    unsigned int v18 = [v17 isEqualToString:@"com.apple.askpermissiond"];

    if (v18)
    {
      -[RemoteNotificationHandler _handleStoreNotificationPayload:](self, "_handleStoreNotificationPayload:", v10);
      goto LABEL_19;
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v13) {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "OSLogObject", *(void *)v22, *(void *)&v22[8]));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_opt_class(self);
      id v20 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue([v5 topic]);
      *(_DWORD *)v22 = 138543618;
      *(void *)&v22[4] = v19;
      *(_WORD *)&v22[12] = 2114;
      *(void *)&v22[14] = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%{public}@: Unsupported notification topic. Topic: %{public}@",  v22,  0x16u);
    }

- (void)_startConnection
{
  v26[0] = @"com.icloud.askpermission";
  v26[1] = @"com.apple.askpermissiond";
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 2LL));
  unsigned int v4 = +[APDefaults APSDevelopmentEnvironment](&OBJC_CLASS___APDefaults, "APSDevelopmentEnvironment");
  id v5 = (id *)&APSEnvironmentDevelopment;
  if (!v4) {
    id v5 = (id *)&APSEnvironmentProduction;
  }
  id v6 = *v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteNotificationHandler apsConnection](self, "apsConnection"));

  if (v7)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteNotificationHandler apsConnection](self, "apsConnection"));
    [v8 shutdown];
  }

  id v9 = objc_alloc(&OBJC_CLASS___APSConnection);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteNotificationHandler apsQueue](self, "apsQueue"));
  v11 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( v9,  "initWithEnvironmentName:namedDelegatePort:queue:",  v6,  @"com.apple.aps.askpermission",  v10);
  -[RemoteNotificationHandler setApsConnection:](self, "setApsConnection:", v11);

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteNotificationHandler apsConnection](self, "apsConnection"));
  [v12 _setEnabledTopics:v3];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteNotificationHandler apsConnection](self, "apsConnection"));
  [v13 setDelegate:self];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteNotificationHandler apsConnection](self, "apsConnection"));
  uint64_t v15 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  id v16 = (void *)v15;
  if (v14)
  {
    if (!v15) {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543618;
      id v23 = (id)objc_opt_class(self);
      __int16 v24 = 2114;
      id v25 = v6;
      id v18 = v23;
      v19 = "%{public}@: Started APS connection succesfully. Environment: %{public}@";
      id v20 = v17;
      os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, (uint8_t *)&v22, 0x16u);
    }
  }

  else
  {
    if (!v15) {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v22 = 138543618;
      id v23 = (id)objc_opt_class(self);
      __int16 v24 = 2114;
      id v25 = v6;
      id v18 = v23;
      v19 = "%{public}@: Failed to start APS connection. Environment: %{public}@";
      id v20 = v17;
      os_log_type_t v21 = OS_LOG_TYPE_ERROR;
      goto LABEL_14;
    }
  }
}

- (void)_handleCloudNotificationPayload:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RemoteNotificationHandler apsQueue](self, "apsQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v6) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = (id)objc_opt_class(self);
    id v8 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Checking cloud notification",  buf,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteNotificationHandler _cloudDSID](self, "_cloudDSID"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"0"]);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
      id v12 = v10;
    }
    else {
      id v12 = 0LL;
    }

    if (v12 && ([v9 isEqualToNumber:v12] & 1) == 0)
    {
      id v13 = (id)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
      if (!v13) {
        id v13 = (id)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v20 = (void *)objc_opt_class(self);
        *(_DWORD *)buf = 138543362;
        id v28 = v20;
        id v21 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%{public}@: Payload request DSID doesn't match cloud DSID",  buf,  0xCu);
      }
    }

    else
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"8"]);
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0) {
        id v13 = v16;
      }
      else {
        id v13 = 0LL;
      }

      if (v13)
      {
        id v18 = -[FamilyRequestTask initWithDSID:](objc_alloc(&OBJC_CLASS___FamilyRequestTask), "initWithDSID:", v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s perform](v18, "perform"));
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_100010314;
        v24[3] = &unk_100030A70;
        v24[4] = self;
        id v25 = v13;
        id v26 = v4;
        [v19 resultWithCompletion:v24];
      }

      else
      {
        id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
        if (!v18) {
          id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s OSLogObject](v18, "OSLogObject"));
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
        {
          int v22 = (void *)objc_opt_class(self);
          *(_DWORD *)buf = 138543362;
          id v28 = v22;
          id v23 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_ERROR,  "%{public}@: Payload doesn't contain request identifier",  buf,  0xCu);
        }
      }
    }
  }

  else
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v12) {
      id v12 = (id)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v13 = (id)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      id v28 = v14;
      id v15 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_ERROR,  "%{public}@: No cloud account",  buf,  0xCu);
    }
  }
}

- (void)_handleApproverNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig", a3));
  if (!v4) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543362;
    id v8 = (id)objc_opt_class(self);
    id v6 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%{public}@: Handle approver remote notification not supported on this platform",  (uint8_t *)&v7,  0xCu);
  }
}

- (void)_handleStoreNotificationPayload:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RemoteNotificationHandler apsQueue](self, "apsQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v6) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = (id)objc_opt_class(self);
    id v8 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Checking store notification",  buf,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteNotificationHandler _activeStoreDSIDs](self, "_activeStoreDSIDs"));
  if ([v9 count])
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"0"]);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
      id v12 = v10;
    }
    else {
      id v12 = 0LL;
    }

    if (v12 && ([v9 containsObject:v12] & 1) == 0)
    {
      id v13 = (id)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
      if (!v13) {
        id v13 = (id)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      id v20 = (void *)objc_opt_class(self);
      id v19 = v20;
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 stringValue]);
      *(_DWORD *)buf = 138543618;
      id v28 = v20;
      __int16 v29 = 2112;
      v30 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%{public}@: Payload request DSID doesn't match store DSIDs: %@",  buf,  0x16u);
    }

    else
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"8"]);
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0) {
        id v13 = v16;
      }
      else {
        id v13 = 0LL;
      }

      if (v13)
      {
        id v18 = -[FamilyRequestTask initWithDSID:](objc_alloc(&OBJC_CLASS___FamilyRequestTask), "initWithDSID:", v12);
        id v19 = (id)objc_claimAutoreleasedReturnValue(-[os_log_s perform](v18, "perform"));
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_100010ABC;
        v24[3] = &unk_100030A98;
        v24[4] = self;
        id v25 = v4;
        char v26 = 0;
        [v19 resultWithCompletion:v24];
      }

      else
      {
        id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
        if (!v18) {
          id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
        }
        id v19 = (id)objc_claimAutoreleasedReturnValue(-[os_log_s OSLogObject](v18, "OSLogObject"));
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
        {
          int v22 = (void *)objc_opt_class(self);
          *(_DWORD *)buf = 138543362;
          id v28 = v22;
          id v23 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_ERROR,  "%{public}@: Payload doesn't contain request identifier",  buf,  0xCu);
        }
      }
    }

LABEL_29:
    goto LABEL_30;
  }

  id v12 = (id)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v12) {
    id v12 = (id)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v13 = (id)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_opt_class(self);
    *(_DWORD *)buf = 138543362;
    id v28 = v14;
    id v15 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_ERROR,  "%{public}@: No store accounts",  buf,  0xCu);
  }

- (void)_handleRequesterNotification:(id)a3 andSuppressDialog:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = -[RequesterRemoteNotificationTask initWithPayload:andSuppressDialog:]( objc_alloc(&OBJC_CLASS___RequesterRemoteNotificationTask),  "initWithPayload:andSuppressDialog:",  v6,  v4);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterRemoteNotificationTask perform](v7, "perform"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100010DDC;
  v9[3] = &unk_1000307B8;
  v9[4] = self;
  [v8 addFinishBlock:v9];
}

- (id)_cloudDSID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_activeiCloudAccount"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_DSID"));

  return v4;
}

- (id)_accountMediaTypes
{
  uint64_t v3 = AMSAccountMediaTypeProduction;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v3,  1LL));
}

- (id)_activeStoreDSIDs
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = (id)objc_opt_class(self);
    id v5 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Getting ACTIVE Store Accounts",  buf,  0xCu);
  }

  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteNotificationHandler _accountMediaTypes](self, "_accountMediaTypes", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = (void *)objc_claimAutoreleasedReturnValue( -[RemoteNotificationHandler _storeDSIDsForMediaType:onlyIncludeActive:]( self,  "_storeDSIDsForMediaType:onlyIncludeActive:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v11),  1LL));
        -[NSMutableSet addObjectsFromArray:](v6, "addObjectsFromArray:", v12);

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }

  return v6;
}

- (id)_allStoreDSIDs
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = (id)objc_opt_class(self);
    id v5 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Getting ALL Store Accounts",  buf,  0xCu);
  }

  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteNotificationHandler _accountMediaTypes](self, "_accountMediaTypes", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = (void *)objc_claimAutoreleasedReturnValue( -[RemoteNotificationHandler _storeDSIDsForMediaType:onlyIncludeActive:]( self,  "_storeDSIDsForMediaType:onlyIncludeActive:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v11),  0LL));
        -[NSMutableSet addObjectsFromArray:](v6, "addObjectsFromArray:", v12);

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }

  return v6;
}

- (id)_storeDSIDsForMediaType:(id)a3 onlyIncludeActive:(BOOL)a4
{
  BOOL v31 = a4;
  id v4 = a3;
  __int16 v29 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v27 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStoreForMediaType:]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStoreForMediaType:",  v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_iTunesAccounts"));

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v30 = *(void *)v33;
    uint64_t v11 = "com.apple.AskPermission";
    *(void *)&__int128 v9 = 138544130LL;
    __int128 v25 = v9;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v33 != v30) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ams_DSID", v25));
        if (os_variant_has_internal_content(v11))
        {
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
          if (!v15) {
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
          }
          __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = v10;
            id v18 = v11;
            id v19 = v7;
            id v20 = (void *)objc_opt_class(self);
            id v28 = v20;
            unsigned int v21 = [v13 isActive];
            *(_DWORD *)buf = v25;
            v37 = v20;
            id v7 = v19;
            uint64_t v11 = v18;
            id v10 = v17;
            __int16 v38 = 2112;
            v39 = v27;
            __int16 v40 = 2112;
            v41 = v14;
            __int16 v42 = 1024;
            unsigned int v43 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Store: %@ - DSID: %@ - Active: %d",  buf,  0x26u);
          }
        }

        if (!v31)
        {
          if (!v14) {
            goto LABEL_21;
          }
LABEL_20:
          -[NSMutableArray addObject:](v29, "addObject:", v14);
          goto LABEL_21;
        }

        else {
          BOOL v22 = 1;
        }
        if (!v22) {
          goto LABEL_20;
        }
LABEL_21:
      }

      id v10 = [v7 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }

    while (v10);
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v29));
  return v23;
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (void)setApsConnection:(id)a3
{
}

- (OS_dispatch_queue)apsQueue
{
  return self->_apsQueue;
}

- (void)setApsQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end