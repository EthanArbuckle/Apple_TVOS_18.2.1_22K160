@interface UABestAppSuggestionController
- (BOOL)disableEntitlementsCheck;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)resume;
- (BOOL)suspend;
- (BOOL)terminate;
- (NSXPCListener)bestAppsListener;
- (UABestAppSuggestionController)initWithManager:(id)a3 name:(id)a4;
- (void)setBestAppsListener:(id)a3;
- (void)setDisableEntitlementsCheck:(BOOL)a3;
@end

@implementation UABestAppSuggestionController

- (UABestAppSuggestionController)initWithManager:(id)a3 name:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___UABestAppSuggestionController;
  v4 = -[UACornerActionManagerHandler initWithManager:name:](&v13, "initWithManager:name:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    id v6 = UABestAppSuggestionManagerServiceName();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = -[NSXPCListener initWithMachServiceName:](v5, "initWithMachServiceName:", v7);

    -[NSXPCListener setDelegate:](v8, "setDelegate:", v4);
    -[UABestAppSuggestionController setBestAppsListener:](v4, "setBestAppsListener:", v8);
  }

  os_log_t v9 = sub_100039584(0LL);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "BESTAPP: Created controller to handle connections to Springboard/Dock",  v12,  2u);
  }

  return v4;
}

- (BOOL)suspend
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___UABestAppSuggestionController;
  BOOL v3 = -[UACornerActionManagerHandler suspend](&v9, "suspend");
  if (v3)
  {
    os_log_t v4 = sub_100039584(0LL);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "BESTAPP: suspend", v8, 2u);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionController bestAppsListener](self, "bestAppsListener"));
    [v6 suspend];
  }

  return v3;
}

- (BOOL)resume
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___UABestAppSuggestionController;
  BOOL v3 = -[UACornerActionManagerHandler resume](&v9, "resume");
  if (v3)
  {
    os_log_t v4 = sub_100039584(0LL);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "BESTAPP: resume", v8, 2u);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionController bestAppsListener](self, "bestAppsListener"));
    [v6 resume];
  }

  return v3;
}

- (BOOL)terminate
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___UABestAppSuggestionController;
  BOOL v3 = -[UACornerActionManagerHandler terminate](&v9, "terminate");
  if (v3)
  {
    os_log_t v4 = sub_100039584(0LL);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "BESTAPP: terminate", v8, 2u);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppSuggestionController bestAppsListener](self, "bestAppsListener"));
    [v6 invalidate];

    -[UABestAppSuggestionController setBestAppsListener:](self, "setBestAppsListener:", 0LL);
  }

  return v3;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  os_log_t v6 = sub_100039584(0LL);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    if (v5) {
      [v5 auditToken];
    }
    else {
      memset(&v24, 0, sizeof(v24));
    }
    audit_token_t atoken = v24;
    audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
    atoken.val[0] = 134217984;
    *(void *)&atoken.val[1] = pidp;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "BESTAPP: received listener request from process %ld",  (uint8_t *)&atoken,  0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( [v5 valueForEntitlement:@"com.apple.private.coreservices.lsuseractivityd.bestappsuggestion"]);
  if (([v8 BOOLValue] & 1) != 0
    || ![v5 effectiveUserIdentifier])
  {
  }

  else
  {
    unsigned __int8 v9 = -[UABestAppSuggestionController disableEntitlementsCheck](self, "disableEntitlementsCheck");

    if ((v9 & 1) == 0)
    {
      os_log_t v10 = sub_100039584(0LL);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = objc_alloc(&OBJC_CLASS___UAAuditToken);
        if (v5) {
          [v5 auditToken];
        }
        else {
          memset(v23, 0, 32);
        }
        v22 = -[UAAuditToken initWithAuditToken:](v12, "initWithAuditToken:", v23);
        atoken.val[0] = 138543618;
        *(void *)&atoken.val[1] = v22;
        LOWORD(atoken.val[3]) = 2114;
        *(void *)((char *)&atoken.val[3] + 2) = @"com.apple.private.coreservices.lsuseractivityd.bestappsuggestion";
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "*** Attempt to access BestAppSuggestion xpc interface fror process %{public}@, which doesn't have the %{public}@ entitlement",  (uint8_t *)&atoken,  0x16u);
      }

      [v5 invalidate];
      BOOL v20 = 0;
      goto LABEL_19;
    }
  }

  os_log_t v13 = sub_100039584(0LL);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      [v5 auditToken];
    }
    else {
      memset(&v23[2], 0, 32);
    }
    audit_token_t atoken = *(audit_token_t *)&v23[2];
    audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
    atoken.val[0] = 134217984;
    *(void *)&atoken.val[1] = pidp;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "BESTAPP: Creating listening notifier for process %ld",  (uint8_t *)&atoken,  0xCu);
  }

  v15 = objc_alloc(&OBJC_CLASS___UABestAppSuggestionNotifier);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  v17 = -[UABestAppSuggestionNotifier initWithManager:connection:](v15, "initWithManager:connection:", v16, v5);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  [v18 addActivityNotifier:v17];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  -[UACornerActionManagerHandler setSuspended:](v17, "setSuspended:", [v19 suspended]);

  BOOL v20 = 1;
LABEL_19:

  return v20;
}

- (BOOL)disableEntitlementsCheck
{
  return self->_disableEntitlementsCheck;
}

- (void)setDisableEntitlementsCheck:(BOOL)a3
{
  self->_disableEntitlementsCheck = a3;
}

- (NSXPCListener)bestAppsListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setBestAppsListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end