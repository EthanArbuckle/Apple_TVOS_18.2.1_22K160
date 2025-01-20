@interface SubmissionController
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OSASubmissionPolicy)policy;
- (SubmissionController)init;
- (void)handleOptInChange;
- (void)setPolicy:(id)a3;
- (void)submitWithOptions:(id)a3 resultsCallback:(id)a4;
@end

@implementation SubmissionController

- (SubmissionController)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SubmissionController;
  v2 = -[SubmissionController init](&v18, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.OTACrashCopier.requestQueue", 0LL);
    requestQueue = v2->_requestQueue;
    v2->_requestQueue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(&OBJC_CLASS___OSASubmissionPolicy);
    policy = v2->_policy;
    v2->_policy = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___ConnectionInfo);
    connectionInfo = v2->_connectionInfo;
    v2->_connectionInfo = v7;

    v9 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
    v10 = -[NSUserDefaults initWithSuiteName:](v9, "initWithSuiteName:", kOSASubmissionDomain);
    BOOL v11 = -[NSUserDefaults BOOLForKey:](v10, "BOOLForKey:", @"UATSubmissionServer");

    v12 = (OSASubmitter *)[[OSAHttpSubmitter alloc] initWithEndpoint:v11];
    submitter = v2->_submitter;
    v2->_submitter = v12;

    v14 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    one_shot_events = v2->_one_shot_events;
    v2->_one_shot_events = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_one_shot_events,  "setObject:forKeyedSubscript:",  v16,  @"launch");
  }

  return v2;
}

- (void)handleOptInChange
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  unsigned int v4 = [v3 optInApple];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  one_shot_events = self->_one_shot_events;
  if (v4)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( one_shot_events,  "setObject:forKeyedSubscript:",  v5,  @"opt-in");

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Submission preference opt-in; retiring existing logs.",
        buf,
        2u);
    }
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( one_shot_events,  "setObject:forKeyedSubscript:",  v5,  @"opt-out");

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Submission preference opt-out; cancelling pending submissions and retiring logs",
        buf,
        2u);
    }

    -[OSASubmitter abort](self->_submitter, "abort");
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  v8 = (os_log_s *)[v7 logDomain];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    unsigned int v10 = [v9 optInApple];
    BOOL v11 = @"OUT";
    if (v10) {
      BOOL v11 = @"IN";
    }
    *(_DWORD *)buf = 138412290;
    v36 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "OptInChange (%@); purging logs", buf, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pathSubmission]);
  v34 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 pathSubmission]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[OSALog scanProxies:](&OBJC_CLASS___OSALog, "scanProxies:", v16));
  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v14 arrayByAddingObjectsFromArray:v17]);

  if (+[OSALog isDataVaultEnabled](&OBJC_CLASS___OSALog, "isDataVaultEnabled"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pathSubmissionDataVault]);

    if (v20)
    {
      id v21 = [v18 arrayByAddingObject:v20];
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[OSALog scanProxies:](&OBJC_CLASS___OSALog, "scanProxies:", v20));
      id v23 = [v18 arrayByAddingObjectsFromArray:v22];
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1000026C8();
    }
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v24 = v18;
  id v25 = [v24 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v30;
    do
    {
      v28 = 0LL;
      do
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(v24);
        }
        +[OSALog purgeLogs:]( &OBJC_CLASS___OSALog,  "purgeLogs:",  *(void *)(*((void *)&v29 + 1) + 8LL * (void)v28),  (void)v29);
        v28 = (char *)v28 + 1;
      }

      while (v26 != v28);
      id v26 = [v24 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }

    while (v26);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___OSASubmissionServices));
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 _setQueue:&_dispatch_main_q];
  [v5 resume];

  return 1;
}

- (void)submitWithOptions:(id)a3 resultsCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"checkEntitlement"]);
  if (([v8 BOOLValue] & 1) == 0)
  {

    goto LABEL_7;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForEntitlement:@"com.apple.private.osanalytics.SubmitLogs.allow"]);
  unsigned __int8 v11 = [v10 BOOLValue];

  if ((v11 & 1) != 0)
  {
LABEL_7:
    requestQueue = (dispatch_queue_s *)self->_requestQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000020C4;
    block[3] = &unk_100004378;
    id v14 = v6;
    v15 = self;
    id v16 = v7;
    dispatch_async(requestQueue, block);

    goto LABEL_8;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100002744();
    if (!v7) {
      goto LABEL_8;
    }
    goto LABEL_5;
  }

  if (v7) {
LABEL_5:
  }
    (*((void (**)(id, _UNKNOWN **))v7 + 2))(v7, &off_100004750);
LABEL_8:
}

- (OSASubmissionPolicy)policy
{
  return (OSASubmissionPolicy *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPolicy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end