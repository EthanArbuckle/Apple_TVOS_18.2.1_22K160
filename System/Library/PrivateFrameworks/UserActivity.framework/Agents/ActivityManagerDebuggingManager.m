@interface ActivityManagerDebuggingManager
+ (id)actionStrs:(int64_t)a3 maximumInternal:(double)a4 clear:(BOOL)a5;
+ (void)appendRecentAction:(id)a3;
+ (void)log:(int)a3 format:(id)a4;
+ (void)log:(int)a3 format:(id)a4 args:(char *)a5;
- (ActivityManagerDebuggingManager)initWithManager:(id)a3;
- (BOOL)disableAdminEntitlmentChecking;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)supportNetworkPeers;
- (NSXPCListener)listener;
- (SharingBTLESuggestedItem)fakeBTLEInjectedItem;
- (UAActivityReplay)replayManager;
- (UACornerActionManager)manager;
- (UANetworkReplayRendevousHandler)networkConnectionHandler;
- (UAPingController)pingController;
- (double)currentPerfTime;
- (id)perfSummaryString;
- (timeval)ignoredRTimeVal;
- (unint64_t)recentActionsStateHandler;
- (void)doCopyAdvertisedUUIDWithCompletionHandler:(id)a3;
- (void)doCopyAllUUIDsOfType:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)doCopyDebuggingInfo:(id)a3 completionHandler:(id)a4;
- (void)doCopyDefaults:(BOOL)a3 completionHandler:(id)a4;
- (void)doCopyDynamicUserActivitiesString:(id)a3 completionHandler:(id)a4;
- (void)doCopyEnabledUUIDsWithCompletionHandler:(id)a3;
- (void)doCopyRecentActions:(id)a3 completionHandler:(id)a4;
- (void)doCopySimulatorStatusString:(id)a3 completionHandler:(id)a4;
- (void)doCopyStatusString:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)doDidSaveDelegate:(id)a3 completionHandler:(id)a4;
- (void)doFetchMoreAppSuggestions;
- (void)doFindMatchingUserActivityForString:(id)a3 withCompletionHandler:(id)a4;
- (void)doGetCurrentAdvertisedItemUUID:(id)a3;
- (void)doGetLoggingFileForClient:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)doGetPairedDevices:(id)a3 completionHandler:(id)a4;
- (void)doGetSFActivityAdvertisement:(id)a3 completionHandler:(id)a4;
- (void)doGetSysdiagnoseStringsIncludingPrivateData:(BOOL)a3 completionHandler:(id)a4;
- (void)doInjectBTLEItem:(id)a3 type:(unint64_t)a4 identifier:(id)a5 title:(id)a6 activityPayload:(id)a7 webPageURL:(id)a8 remoteModel:(id)a9 duration:(double)a10 payloadDelay:(double)a11;
- (void)doNOP:(id)a3 withCompletionHandler:(id)a4;
- (void)doReplayCommands:(id)a3 completionHandler:(id)a4;
- (void)doSetDebugOption:(id)a3 value:(id)a4;
- (void)doSetDefaults:(id)a3 archivedValue:(id)a4;
- (void)doSetLocalPasteboardReflection:(BOOL)a3;
- (void)doSetRemotePasteboardAvailable:(BOOL)a3;
- (void)doSetupNetworkedPairs:(id)a3 port:(int64_t)a4;
- (void)doSetupRendevous:(id)a3 domain:(id)a4 activate:(BOOL)a5;
- (void)doTerminateServer;
- (void)doWillSaveDelegate:(id)a3 completionHandler:(id)a4;
- (void)receivePing:(id)a3;
- (void)resume;
- (void)setDebugging:(BOOL)a3;
- (void)setDisableAdminEntitlmentChecking:(BOOL)a3;
- (void)setFakeBTLEInjectedItem:(id)a3;
- (void)setListener:(id)a3;
- (void)setManager:(id)a3;
- (void)setNetworkConnectionHandler:(id)a3;
- (void)setPingController:(id)a3;
- (void)setRecentActionsStateHandler:(unint64_t)a3;
- (void)setReplayManager:(id)a3;
- (void)setSupportNetworkPeers:(BOOL)a3;
- (void)startAdvertisingPingWithTimeInterval:(double)a3;
- (void)stopAdvertisingPing;
- (void)suspend;
@end

@implementation ActivityManagerDebuggingManager

+ (void)log:(int)a3 format:(id)a4 args:(char *)a5
{
  id v7 = a4;
  if (v7 && a5)
  {
    id v9 = v7;
    v8 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v7, a5);
    syslog(a3, "%s", -[NSString UTF8String](v8, "UTF8String"));

    id v7 = v9;
  }
}

+ (void)log:(int)a3 format:(id)a4
{
}

- (ActivityManagerDebuggingManager)initWithManager:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___ActivityManagerDebuggingManager;
  v6 = -[ActivityManagerDebuggingManager init](&v18, "init");
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->manager, a3);
    v8 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    uint64_t v9 = UAResumableActivitiesManagerServiceName();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = -[NSXPCListener initWithMachServiceName:](v8, "initWithMachServiceName:", v10);
    listener = v7->listener;
    v7->listener = v11;

    -[NSXPCListener setDelegate:](v7->listener, "setDelegate:", v7);
    v13 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"STARTING pid=%d", getpid());
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    +[ActivityManagerDebuggingManager appendRecentAction:]( &OBJC_CLASS___ActivityManagerDebuggingManager,  "appendRecentAction:",  v14);

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v16 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    -[ActivityManagerDebuggingManager setRecentActionsStateHandler:]( v7,  "setRecentActionsStateHandler:",  os_state_add_handler(v16, &stru_1000BE1B8));
  }

  return v7;
}

- (void)suspend
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager networkConnectionHandler](self, "networkConnectionHandler"));
  [v3 suspend];
}

- (void)resume
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager networkConnectionHandler](self, "networkConnectionHandler"));
  [v3 resume];
}

- (void)setDebugging:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[ActivityManagerDebuggingManager doSetDebugOption:value:](self, "doSetDebugOption:value:", @"EnableLogging");
}

+ (void)appendRecentAction:(id)a3
{
  id v6 = a3;
  id v3 = sub_1000709E4();
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  objc_sync_enter(v4);
  id v5 = -[ActivityManagerDebugRecentActionItem initWithString:]( objc_alloc(&OBJC_CLASS___ActivityManagerDebugRecentActionItem),  "initWithString:",  v6);
  [v4 addObject:v5];

  objc_sync_exit(v4);
}

+ (id)actionStrs:(int64_t)a3 maximumInternal:(double)a4 clear:(BOOL)a5
{
  BOOL v5 = a5;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v8 = sub_1000709E4();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v11 = v9;
  objc_sync_enter(v11);
  id v12 = [v11 copy];
  if (v5) {
    [v11 removeAllObjects];
  }
  objc_sync_exit(v11);
  v28 = v11;

  v13 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  v14 = -[NSLocale initWithLocaleIdentifier:]( objc_alloc(&OBJC_CLASS___NSLocale),  "initWithLocaleIdentifier:",  @"en_US");
  -[NSDateFormatter setLocale:](v13, "setLocale:", v14);

  -[NSDateFormatter setDateFormat:](v13, "setDateFormat:", @"HH:MM:ss.SSSS");
  if (!a3) {
    a3 = (int64_t)[v12 count];
  }
  if (a4 == 0.0) {
    double v15 = 3.40282347e38;
  }
  else {
    double v15 = a4;
  }
  uint64_t v16 = (uint64_t)[v12 count] - a3;
  for (unint64_t i = v16 & ~(v16 >> 63); i < (unint64_t)[v12 count]; ++i)
  {
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:i]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 when]);
    [v19 timeIntervalSinceDate:v10];
    double v21 = v20;

    if (v21 <= v15)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v18 when]);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v13, "stringFromDate:", v22));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v18 str]);
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  v23,  v24));
      [v29 addObject:v25];
    }
  }

  id v26 = [v29 copy];

  return v26;
}

- (BOOL)supportNetworkPeers
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL supportNetworkPeers = v2->_supportNetworkPeers;
  objc_sync_exit(v2);

  return supportNetworkPeers;
}

- (void)setSupportNetworkPeers:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  id v4 = obj;
  if (obj->_supportNetworkPeers != v3)
  {
    obj->_BOOL supportNetworkPeers = v3;
    if (v3)
    {
      BOOL v5 = objc_alloc(&OBJC_CLASS___UANetworkReplayRendevousHandler);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager manager](obj, "manager"));
      id v7 = -[UANetworkReplayRendevousHandler initWithManager:](v5, "initWithManager:", v6);
      -[ActivityManagerDebuggingManager setNetworkConnectionHandler:](obj, "setNetworkConnectionHandler:", v7);

      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager manager](obj, "manager"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager networkConnectionHandler](obj, "networkConnectionHandler"));
      [v8 addHandler:v9];

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 rendevousPairingType]);

      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      unsigned int v13 = [v12 enableNetworkControlListener];

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
        id v15 = [v14 networkControlListenerPort];

        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager networkConnectionHandler](obj, "networkConnectionHandler"));
        [v16 listenForIncomingConnections:0 port:v15 type:v11];
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      unsigned int v18 = [v17 enableAutomaticRendevousPairing];

      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager networkConnectionHandler](obj, "networkConnectionHandler"));
        [v19 scanForPeersOfType:0 domain:0];
      }

      else
      {
        if (!v11)
        {
LABEL_12:

          id v4 = obj;
          goto LABEL_13;
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager networkConnectionHandler](obj, "networkConnectionHandler"));
        [v19 scanForPeersOfType:v11 domain:0];
      }

      goto LABEL_12;
    }

    double v20 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager networkConnectionHandler](obj, "networkConnectionHandler"));

    id v4 = obj;
    if (v20)
    {
      double v21 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager manager](obj, "manager"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager networkConnectionHandler](obj, "networkConnectionHandler"));
      [v21 removeHandler:v22];

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager networkConnectionHandler](obj, "networkConnectionHandler"));
      [v23 suspend];

      -[ActivityManagerDebuggingManager setNetworkConnectionHandler:](obj, "setNetworkConnectionHandler:", 0LL);
      id v4 = obj;
    }
  }

- (id)perfSummaryString
{
  if (getrusage(0, &v3)) {
    return 0LL;
  }
  else {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(user=%.5gs/system=%.5gs)",  (double)v3.ru_utime.tv_usec / 1000000.0 + (double)v3.ru_utime.tv_sec,  (double)v3.ru_stime.tv_usec / 1000000.0 + (double)v3.ru_stime.tv_sec));
  }
}

- (double)currentPerfTime
{
  int v2 = getrusage(0, &v4);
  double result = 0.0;
  if (!v2) {
    return (double)v4.ru_utime.tv_usec / 1000000.0 + (double)v4.ru_utime.tv_sec;
  }
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 valueForEntitlement:@"com.apple.private.coreservices.lsuseractivityd.admininterface"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"application-identifier"]);
  if (([v7 isEqual:@"com.apple.Preferences"] & 1) != 0
    || ![v5 effectiveUserIdentifier])
  {

LABEL_9:
    goto LABEL_10;
  }

  unsigned __int8 v8 = -[ActivityManagerDebuggingManager disableAdminEntitlmentChecking](self, "disableAdminEntitlmentChecking");

  if ((v8 & 1) != 0)
  {
LABEL_10:
    uint64_t v13 = _LSGetResumableActivitiesAdministrativeProtocolInterface();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [v5 setExportedInterface:v14];

    [v5 setExportedObject:self];
    [v5 setInterruptionHandler:&stru_1000BE1D8];
    [v5 setInvalidationHandler:&stru_1000BE1F8];
    goto LABEL_11;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.private.useractivity.sysdiagnose"]);
  if ([v9 BOOLValue])
  {
    unsigned int v10 = [v5 effectiveUserIdentifier];

    if (!v10)
    {
      uint64_t v11 = _LSGetResumableActivitiesSysdiagnoseSupportProtocolInterface();
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      [v5 setExportedInterface:v12];

      [v5 setExportedObject:self];
LABEL_11:
      [v5 resume];
      BOOL v15 = 1;
      goto LABEL_12;
    }
  }

  else
  {
  }

  os_log_t v17 = sub_100039584(0LL);
  unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v19 = objc_alloc(&OBJC_CLASS___UAAuditToken);
    if (v5) {
      [v5 auditToken];
    }
    else {
      memset(v21, 0, sizeof(v21));
    }
    double v20 = -[UAAuditToken initWithAuditToken:](v19, "initWithAuditToken:", v21);
    *(_DWORD *)buf = 138543618;
    v23 = v20;
    __int16 v24 = 2114;
    v25 = @"com.apple.private.coreservices.lsuseractivityd.admininterface";
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "*** Attempt to access adminstrative interface fror process pid=%{public}@, which doesn't have the %{public}@ entitlement.",  buf,  0x16u);
  }

  [v5 invalidate];
  BOOL v15 = 0;
LABEL_12:

  return v15;
}

- (void)receivePing:(id)a3
{
  id v3 = a3;
  os_log_t v4 = sub_100039584(0LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138477827;
    id v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "*** SENDING PING %{private}@ to clients.",  (uint8_t *)&v6,  0xCu);
  }
}

- (void)doNOP:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  int v6 = (void (**)(id, id, void))a4;
  id v7 = objc_autoreleasePoolPush();
  os_log_t v8 = sub_100039584(0LL);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138477827;
    id v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "- doNOP, str=%{private}@, so echoing that back to client.",  (uint8_t *)&v10,  0xCu);
  }

  v6[2](v6, v5, 0LL);
  objc_autoreleasePoolPop(v7);
}

- (void)doSetDebugOption:(id)a3 value:(id)a4
{
  v50 = (__CFString *)a3;
  id v49 = a4;
  os_log_t v5 = sub_100039584(0LL);
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v84 = v50;
    __int16 v85 = 2114;
    id v86 = v49;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "### DEBUGGING: doSetDebugOption:%{public}@ => %{public}@",  buf,  0x16u);
  }

  if (!-[__CFString isEqual:](v50, "isEqual:", @"EnableDebugging"))
  {
    if (-[__CFString isEqual:](v50, "isEqual:", @"sharing"))
    {
      unsigned int v8 = [v49 BOOLValue];
      id obj = (id)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
      if (v8 != [obj enableSharingFramework]
        && objc_opt_class(&OBJC_CLASS___SFActivityScanner))
      {
        BOOL v9 = objc_opt_class(&OBJC_CLASS___SFActivityAdvertiser) == 0;

        if (v9) {
          goto LABEL_70;
        }
        unsigned int v62 = [v49 BOOLValue];
        os_log_t v10 = sub_100039584(0LL);
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = @"OFF";
          if (v62) {
            id v12 = @"ON";
          }
          *(_DWORD *)buf = 138543362;
          v84 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "### DEBUGGING: Changing EnableSharingFramework to %{public}@",  buf,  0xCu);
        }

        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
        [v13 setEnableSharingFramework:v62];

        __int128 v77 = 0u;
        __int128 v78 = 0u;
        __int128 v75 = 0u;
        __int128 v76 = 0u;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager manager](self, "manager"));
        id obja = (id)objc_claimAutoreleasedReturnValue([v14 advertisers]);

        id v58 = [obja countByEnumeratingWithState:&v75 objects:v82 count:16];
        if (v58)
        {
          uint64_t v56 = *(void *)v76;
          do
          {
            for (unint64_t i = 0LL; i != v58; unint64_t i = (char *)i + 1)
            {
              if (*(void *)v76 != v56) {
                objc_enumerationMutation(obja);
              }
              BOOL v15 = *(void **)(*((void *)&v75 + 1) + 8LL * (void)i);
              uint64_t v16 = objc_opt_class(&OBJC_CLASS___UASharingAdvertiser);
              if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
              {
                id v17 = v15;
                __int128 v71 = 0u;
                __int128 v72 = 0u;
                __int128 v73 = 0u;
                __int128 v74 = 0u;
                unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 sfActivityAdvertisers]);
                id v19 = [v18 countByEnumeratingWithState:&v71 objects:v81 count:16];
                char v20 = v62;
                if (v19)
                {
                  uint64_t v21 = *(void *)v72;
                  char v20 = v62;
                  do
                  {
                    for (j = 0LL; j != v19; j = (char *)j + 1)
                    {
                      if (*(void *)v72 != v21) {
                        objc_enumerationMutation(v18);
                      }
                      uint64_t v23 = *(void *)(*((void *)&v71 + 1) + 8LL * (void)j);
                      uint64_t v24 = objc_opt_class(&OBJC_CLASS___SFActivityAdvertiser);
                      if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0)
                      {
                        os_log_t v25 = sub_100039584(0LL);
                        id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
                        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "### Removing SFActivityAdvertiser from UASharingAdvertiser",  buf,  2u);
                        }

                        [v17 removeSFActivityAdvertiser:v23];
                        v20 &= v62 ^ 1;
                      }
                    }

                    id v19 = [v18 countByEnumeratingWithState:&v71 objects:v81 count:16];
                  }

                  while (v19);
                }

                if ((v20 & 1) != 0)
                {
                  v27 = (void *)objc_claimAutoreleasedReturnValue( +[SFActivityAdvertiser sharedAdvertiser]( &OBJC_CLASS___SFActivityAdvertiser,  "sharedAdvertiser"));
                  os_log_t v28 = sub_100039584(0LL);
                  v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "### Adding SFActivityAdvertiser to UASharingAdvertiser.",  buf,  2u);
                  }

                  [v17 addSFActivityAdvertiser:v27];
                }
              }
            }

            id v58 = [obja countByEnumeratingWithState:&v75 objects:v82 count:16];
          }

          while (v58);
        }

        __int128 v69 = 0u;
        __int128 v70 = 0u;
        __int128 v67 = 0u;
        __int128 v68 = 0u;
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager manager](self, "manager"));
        id obj = (id)objc_claimAutoreleasedReturnValue([v30 receivers]);

        id v31 = [obj countByEnumeratingWithState:&v67 objects:v80 count:16];
        if (v31)
        {
          uint64_t v57 = *(void *)v68;
          id v59 = v31;
          do
          {
            for (k = 0LL; k != v59; k = (char *)k + 1)
            {
              if (*(void *)v68 != v57) {
                objc_enumerationMutation(obj);
              }
              v32 = *(void **)(*((void *)&v67 + 1) + 8LL * (void)k);
              uint64_t v33 = objc_opt_class(&OBJC_CLASS___UASharingReceiver);
              if ((objc_opt_isKindOfClass(v32, v33) & 1) != 0)
              {
                id v34 = v32;
                __int128 v63 = 0u;
                __int128 v64 = 0u;
                __int128 v65 = 0u;
                __int128 v66 = 0u;
                v35 = (void *)objc_claimAutoreleasedReturnValue([v34 sfActivityScanners]);
                id v36 = [v35 countByEnumeratingWithState:&v63 objects:v79 count:16];
                char v37 = v62;
                if (v36)
                {
                  uint64_t v38 = *(void *)v64;
                  char v37 = v62;
                  do
                  {
                    for (m = 0LL; m != v36; m = (char *)m + 1)
                    {
                      if (*(void *)v64 != v38) {
                        objc_enumerationMutation(v35);
                      }
                      uint64_t v40 = *(void *)(*((void *)&v63 + 1) + 8LL * (void)m);
                      uint64_t v41 = objc_opt_class(&OBJC_CLASS___SFActivityScanner);
                      int v42 = objc_opt_isKindOfClass(v40, v41) ^ 1;
                      if (((v42 | v62) & 1) != 0)
                      {
                        v37 &= v42;
                      }

                      else
                      {
                        os_log_t v43 = sub_100039584(0LL);
                        v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
                        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "### Removing SFActivityScanner from UASharingReceiver.",  buf,  2u);
                        }

                        [v34 removeSFActivityScanner:v40];
                      }
                    }

                    id v36 = [v35 countByEnumeratingWithState:&v63 objects:v79 count:16];
                  }

                  while (v36);
                }

                if ((v37 & 1) != 0)
                {
                  v45 = -[SFActivityScanner initWithDelegate:]( objc_alloc(&OBJC_CLASS___SFActivityScanner),  "initWithDelegate:",  v34);
                  os_log_t v46 = sub_100039584(0LL);
                  v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "### Adding SFActivityScanner to UASharingReceiver.",  buf,  2u);
                  }

                  [v34 addSFActivityScanner:v45];
                }
              }
            }

            id v59 = [obj countByEnumeratingWithState:&v67 objects:v80 count:16];
          }

          while (v59);
        }
      }
    }

    else
    {
      if (-[__CFString isEqual:](v50, "isEqual:", @"screensaver"))
      {
        id objc = (id)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager manager](self, "manager"));
        objc_msgSend(objc, "updateScreenSaverActive:", objc_msgSend(v49, "BOOLValue"));

        goto LABEL_70;
      }

      if (-[__CFString isEqual:](v50, "isEqual:", @"screendim"))
      {
        id objd = (id)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager manager](self, "manager"));
        objc_msgSend(objd, "updateScreenDimStateState:", objc_msgSend(v49, "BOOLValue"));

        goto LABEL_70;
      }

      id obj = (id)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager manager](self, "manager"));
      objc_msgSend(obj, "updateUserActiveState:", objc_msgSend(v49, "BOOLValue"));
    }

    goto LABEL_70;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v7 setObject:v49 forKey:v50];

  id objb = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [objb synchronize];

LABEL_70:
}

- (void)doFindMatchingUserActivityForString:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v57 = (void (**)(id, void *))a4;
  os_log_t v7 = sub_100039584(0LL);
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v81 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "str=%{private}@", buf, 0xCu);
  }

  context = objc_autoreleasePoolPush();
  __int128 v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertiseableItems](self->manager, "advertiseableItems"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager cornerActionItems](self->manager, "cornerActionItems"));
  if (v6 && [v6 length])
  {
    if (![v64 count] && !objc_msgSend(v6, "compare:options:", @"best", 1))
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager manager](self, "manager"));
      os_log_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bestCornerItem]);

      if (v10)
      {
        os_log_t v11 = sub_100039584(0LL);
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 uuid]);
          v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
          *(_DWORD *)buf = 138543619;
          id v81 = v14;
          __int16 v82 = 2113;
          v83 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "-- Matching current best item %{public}@/%{private}@",  buf,  0x16u);
        }

        [v64 addObject:v10];
      }
    }

    if (![v64 count])
    {
      __int128 v75 = 0u;
      __int128 v76 = 0u;
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      id obj = v54;
      id v15 = [obj countByEnumeratingWithState:&v73 objects:v79 count:16];
      if (v15)
      {
        id v61 = *(id *)v74;
        do
        {
          for (unint64_t i = 0LL; i != v15; unint64_t i = (char *)i + 1)
          {
            if (*(id *)v74 != v61) {
              objc_enumerationMutation(obj);
            }
            id v17 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)i);
            if ([v6 containsString:@"."])
            {
              unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 activityType]);
              BOOL v19 = [v18 compare:v6 options:1] == 0;

              if (v19) {
                [v64 addObject:v17];
              }
            }

            id v20 = sub_1000035C0(v6);
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            if (v21)
            {
              uint64_t v22 = objc_opt_class(&OBJC_CLASS___SharingBTLESuggestedItem);
              if ((objc_opt_isKindOfClass(v17, v22) & 1) != 0)
              {
                id v23 = v17;
                uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 advertisementPayload]);
                os_log_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 payloadBytes]);
                unsigned int v26 = [v21 isEqual:v25];

                if (v26) {
                  [v64 addObject:v23];
                }
              }
            }

            if ([v6 containsString:@"."])
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue([v17 bundleIdentifier]);
              BOOL v28 = [v27 compare:v6 options:1] == 0;

              if (v28) {
                [v64 addObject:v17];
              }
            }
          }

          id v15 = [obj countByEnumeratingWithState:&v73 objects:v79 count:16];
        }

        while (v15);
      }
    }

    if (![v64 count])
    {
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      id v58 = v53;
      id v29 = [v58 countByEnumeratingWithState:&v69 objects:v78 count:16];
      if (!v29) {
        goto LABEL_56;
      }
      id obja = *(id *)v70;
      while (1)
      {
        id v62 = v29;
        for (j = 0LL; j != v62; j = (char *)j + 1)
        {
          if (*(id *)v70 != obja) {
            objc_enumerationMutation(v58);
          }
          id v31 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)j);
          v32 = (void *)objc_claimAutoreleasedReturnValue([v31 uuid]);
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 UUIDString]);
          id v34 = (void *)objc_claimAutoreleasedReturnValue([v31 uuid]);
          v35 = (void *)objc_claimAutoreleasedReturnValue([v34 UUIDString]);
          id v36 = (void *)objc_claimAutoreleasedReturnValue([v31 title]);
          char v37 = (void *)objc_claimAutoreleasedReturnValue([v31 title]);
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v31 title]);
          if ([v38 hasSuffix:v6])
          {

LABEL_44:
LABEL_45:

LABEL_46:
LABEL_47:

LABEL_48:
            [v64 addObject:v31];
            continue;
          }

          if ([v6 containsString:@"."])
          {
            uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v31 activityType]);
            BOOL v55 = [v56 compare:v6 options:1] == 0;

            if (v55) {
              goto LABEL_48;
            }
          }

          else
          {
          }
        }

        id v29 = [v58 countByEnumeratingWithState:&v69 objects:v78 count:16];
        if (!v29)
        {
LABEL_56:

          break;
        }
      }
    }

    if ([v64 count]) {
      goto LABEL_71;
    }
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    id v63 = v54;
    id v39 = [v63 countByEnumeratingWithState:&v65 objects:v77 count:16];
    if (!v39) {
      goto LABEL_70;
    }
    uint64_t v40 = *(void *)v66;
LABEL_60:
    uint64_t v41 = 0LL;
    while (1)
    {
      if (*(void *)v66 != v40) {
        objc_enumerationMutation(v63);
      }
      int v42 = *(void **)(*((void *)&v65 + 1) + 8 * v41);
      os_log_t v43 = (void *)objc_claimAutoreleasedReturnValue([v42 uuid]);
      v44 = (void *)objc_claimAutoreleasedReturnValue([v43 UUIDString]);
      if ([v44 hasPrefix:v6])
      {
      }

      else
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue([v42 uuid]);
        os_log_t v46 = (void *)objc_claimAutoreleasedReturnValue([v45 UUIDString]);
        unsigned __int8 v47 = [v46 hasSuffix:v6];

        if ((v47 & 1) == 0)
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue([v42 bundleIdentifier]);
          BOOL v49 = [v48 compare:v6 options:1] == 0;

          if (!v49) {
            goto LABEL_68;
          }
        }
      }

      [v64 addObject:v42];
LABEL_68:
      if (v39 == (id)++v41)
      {
        id v39 = [v63 countByEnumeratingWithState:&v65 objects:v77 count:16];
        if (!v39)
        {
LABEL_70:

          break;
        }

        goto LABEL_60;
      }
    }
  }

- (void)doCopyAllUUIDsOfType:(unint64_t)a3 withCompletionHandler:(id)a4
{
  os_log_t v11 = (void (**)(id, id))a4;
  id v6 = objc_autoreleasePoolPush();
  os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager advertiseableItems](self->manager, "advertiseableItems"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10007290C;
  v12[3] = &unk_1000BE220;
  unint64_t v14 = a3;
  id v9 = v7;
  id v13 = v9;
  [v8 enumerateObjectsUsingBlock:v12];
  id v10 = [v9 copy];
  v11[2](v11, v10);

  objc_autoreleasePoolPop(v6);
}

- (void)doCopyAdvertisedUUIDWithCompletionHandler:(id)a3
{
  id v9 = (void (**)(id, void *))a3;
  os_log_t v4 = objc_autoreleasePoolPush();
  if (-[UACornerActionManager weAreAdvertisingAnItem](self->manager, "weAreAdvertisingAnItem"))
  {
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager uaAdvertisableItemsInOrder](self->manager, "uaAdvertisableItemsInOrder"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

    if (v6)
    {
      os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
      char v8 = 0;
      goto LABEL_6;
    }
  }

  else
  {
    id v6 = 0LL;
  }

  os_log_t v7 = 0LL;
  char v8 = 1;
LABEL_6:
  v9[2](v9, v7);
  if ((v8 & 1) == 0) {

  }
  objc_autoreleasePoolPop(v4);
}

- (void)doCopyEnabledUUIDsWithCompletionHandler:(id)a3
{
  id v6 = (void (**)(id, void *))a3;
  os_log_t v4 = objc_autoreleasePoolPush();
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager activeAdvertiseableItemsUUIDs](self->manager, "activeAdvertiseableItemsUUIDs"));
  v6[2](v6, v5);

  objc_autoreleasePoolPop(v4);
}

- (void)doCopyDebuggingInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager debuggingInfo](self->manager, "debuggingInfo"));
  if (v6) {
    v6[2](v6, v5);
  }
}

- (void)doCopyDynamicUserActivitiesString:(id)a3 completionHandler:(id)a4
{
  os_log_t v7 = (void (**)(id, void *))a4;
  os_log_t v5 = objc_autoreleasePoolPush();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager dynamicUserActivitiesString](self->manager, "dynamicUserActivitiesString"));
  if (v7) {
    v7[2](v7, v6);
  }

  objc_autoreleasePoolPop(v5);
}

- (void)doCopyStatusString:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, const __CFString *))a5;
  if (v9)
  {
    id v10 = objc_autoreleasePoolPush();
    if (v15 && ![v15 isEqual:@"status"])
    {
      if ([v15 isEqual:@"simulatorStatus"])
      {
        v9[2](v9, @"This platform does not support the iOS simulator.");
        goto LABEL_6;
      }

      if (![v15 isEqual:@"recentEligible"])
      {
        unint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Command %@ not recognized",  v15));
        v9[2](v9, v14);

        goto LABEL_6;
      }

      id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager mainDispatchQ](self->manager, "mainDispatchQ"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100072E84;
      v16[3] = &unk_1000BE270;
      v16[4] = self;
      id v17 = v9;
      dispatch_sync(v13, v16);

      id v12 = v17;
    }

    else
    {
      os_log_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager mainDispatchQ](self->manager, "mainDispatchQ"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100072E28;
      block[3] = &unk_1000BE248;
      block[4] = self;
      BOOL v19 = v9;
      dispatch_sync(v11, block);

      id v12 = v19;
    }

LABEL_6:
    objc_autoreleasePoolPop(v10);
  }
}

- (void)doFetchMoreAppSuggestions
{
}

- (void)doCopyRecentActions:(id)a3 completionHandler:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, void *))a4;
  os_log_t v7 = objc_autoreleasePoolPush();
  if (v6)
  {
    id v8 = (void *)objc_opt_class(self);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"clear"]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionStrs:maximumInternal:clear:", 50, objc_msgSend(v9, "BOOLValue"), 300.0));
    v6[2](v6, v10);
  }

  objc_autoreleasePoolPop(v7);
}

- (void)doCopySimulatorStatusString:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  os_log_t v4 = objc_autoreleasePoolPush();
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  [v5 appendString:@"This platform does not support the iOS simulator."];
  if (v6) {
    v6[2](v6, v5);
  }

  objc_autoreleasePoolPop(v4);
}

- (void)doGetCurrentAdvertisedItemUUID:(id)a3
{
  id v8 = (void (**)(id, void *))a3;
  os_log_t v4 = objc_autoreleasePoolPush();
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager uaAdvertisableItemsInOrder](self->manager, "uaAdvertisableItemsInOrder"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);

  v8[2](v8, v7);
  objc_autoreleasePoolPop(v4);
}

- (void)doInjectBTLEItem:(id)a3 type:(unint64_t)a4 identifier:(id)a5 title:(id)a6 activityPayload:(id)a7 webPageURL:(id)a8 remoteModel:(id)a9 duration:(double)a10 payloadDelay:(double)a11
{
  id v53 = a3;
  id v19 = a5;
  id v51 = a6;
  id v52 = a7;
  id v49 = a8;
  id v50 = a9;
  context = objc_autoreleasePoolPush();
  if (self->fakeBTLEInjectedItem)
  {
    os_log_t v20 = sub_100039584(0LL);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLESuggestedItem uuid](self->fakeBTLEInjectedItem, "uuid", context, v49));
      *(_DWORD *)buf = 138412290;
      id v61 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "Removing previous injected fake BTLE item %@",  buf,  0xCu);
    }

    -[UACornerActionManager setDebugCornerItem:](self->manager, "setDebugCornerItem:", 0LL);
    fakeBTLEInjectedItem = self->fakeBTLEInjectedItem;
    self->fakeBTLEInjectedItem = 0LL;
  }

  if (v53 && v19)
  {
    uint64_t v24 = -[SharingBTLESuggestedItem initWithUUID:type:options:]( objc_alloc(&OBJC_CLASS___SharingBTLESuggestedItem),  "initWithUUID:type:options:",  v53,  a4,  0LL);
    os_log_t v25 = self->fakeBTLEInjectedItem;
    self->fakeBTLEInjectedItem = v24;

    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 applicationForUserActivityType:v19]);
    BOOL v28 = (void *)objc_claimAutoreleasedReturnValue([v27 bundleIdentifier]);
    unsigned __int8 v29 = [v26 applicationIsInstalled:v28];

    if ((v29 & 1) != 0)
    {
      if (v27) {
        goto LABEL_26;
      }
    }

    else
    {
    }

    if ((objc_msgSend(v19, "containsString:", @":", context) & 1) == 0)
    {
      id v31 = (void *)objc_claimAutoreleasedReturnValue([@":" stringByAppendingString:v19]);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 applicationForUserActivityType:v31]);

      if (v27) {
        goto LABEL_26;
      }
    }

    if (([v19 containsString:@":"] & 1) == 0)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue([v19 lowercaseString]);
      if ([v26 applicationIsInstalled:v32])
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v32));

        if (v27) {
          goto LABEL_26;
        }
      }

      else
      {
      }
    }

    if ([v19 containsString:@":"])
    {
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v19 componentsSeparatedByString:@":"]);
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 lastObject]);
      v35 = (void *)objc_claimAutoreleasedReturnValue([v34 lowercaseString]);

      if ([v26 applicationIsInstalled:v35])
      {
        id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 lowercaseString]);
        v27 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v36));
      }

      else
      {
        v27 = 0LL;
      }
    }

    else
    {
      v27 = 0LL;
    }

- (void)doTerminateServer
{
  id v3 = objc_autoreleasePoolPush();
  -[UACornerActionManager terminate](self->manager, "terminate");
  objc_autoreleasePoolPop(v3);
}

- (void)doWillSaveDelegate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_autoreleasePoolPush();
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager clients](self->manager, "clients"));
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (unint64_t i = 0LL; i != v10; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___UAUserActivityClientProcessesController);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 userActivityClientForUUID:v6]);
          os_log_t v16 = sub_100039584(0LL);
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
            *(_DWORD *)buf = 138543362;
            v27 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "About to call prepareToResumeActivityWithUUID for activityUUID %{public}@",  buf,  0xCu);
          }

          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472LL;
          v19[2] = sub_100073FD0;
          v19[3] = &unk_1000BCD10;
          id v20 = v6;
          id v21 = v7;
          [v15 askSourceProcessToUpdateActivityWithUUID:v20 evenIfClean:1 completionHandler:v19];

          goto LABEL_13;
        }
      }

      id v10 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

- (void)doDidSaveDelegate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  context = objc_autoreleasePoolPush();
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManager clients](self->manager, "clients"));
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    do
    {
      for (unint64_t i = 0LL; i != v9; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___UAUserActivityClientProcessesController);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 userActivityClientForUUID:v6]);
          os_log_t v15 = sub_100039584(0LL);
          os_log_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
            *(_DWORD *)buf = 138543362;
            BOOL v28 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "About to call didResumeUserActivityWithUUID for activityUUID %{public}@",  buf,  0xCu);
          }

          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472LL;
          v20[2] = sub_10007437C;
          v20[3] = &unk_1000BCD10;
          id v18 = v6;
          id v21 = v18;
          id v22 = v7;
          [v14 didResumeUserActivityWithUUID:v18 completionHandler:v20];
        }
      }

      id v9 = [v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }

    while (v9);
  }

  objc_autoreleasePoolPop(context);
}

- (void)doSetupNetworkedPairs:(id)a3 port:(int64_t)a4
{
  id v6 = a3;
  os_log_t v7 = sub_100039584(0LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138478083;
    id v11 = v6;
    __int16 v12 = 2048;
    int64_t v13 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Setting up network connection to other machine %{private}@ %ld",  (uint8_t *)&v10,  0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager manager](self, "manager"));
  +[UANetworkReplayController createConnection:host:port:]( &OBJC_CLASS___UANetworkReplayController,  "createConnection:host:port:",  v9,  v6,  a4);
}

- (void)doSetupRendevous:(id)a3 domain:(id)a4 activate:(BOOL)a5
{
  id v9 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager networkConnectionHandler](self, "networkConnectionHandler"));
  [v8 scanForPeersOfType:v9 domain:v7];
}

- (void)startAdvertisingPingWithTimeInterval:(double)a3
{
  os_log_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager pingController](self, "pingController", a3));

  if (v4)
  {
    id v7 = -[UAPingUserActivityInfo initWithPayloadSize:]( objc_alloc(&OBJC_CLASS___UAPingUserActivityInfo),  "initWithPayloadSize:",  128LL);
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager pingController](self, "pingController"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 client]);
    [v6 pushItem:v7];
  }

- (void)stopAdvertisingPing
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager pingController](self, "pingController"));

  if (v3)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager pingController](self, "pingController"));
    os_log_t v4 = (void *)objc_claimAutoreleasedReturnValue([v5 client]);
    [v4 removeItem:0];
  }

- (void)doGetSysdiagnoseStringsIncludingPrivateData:(BOOL)a3 completionHandler:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  [v6 addObjectsFromArray:&off_1000C4910];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager manager](self, "manager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 statusString]);

  [v6 addObject:v8];
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager manager](self, "manager"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 handlers]);

  id v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v24;
    do
    {
      int64_t v13 = 0LL;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v23 + 1) + 8 * (void)v13) statusString]);
        if (v14) {
          [v6 addObject:v14];
        }

        int64_t v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v11);
  }

  [v6 addObjectsFromArray:&off_1000C4928];
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue( +[ActivityManagerDebuggingManager actionStrs:maximumInternal:clear:]( &OBJC_CLASS___ActivityManagerDebuggingManager,  "actionStrs:maximumInternal:clear:",  100LL,  0LL,  86400.0));
  id v16 = [v15 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v20;
    do
    {
      id v18 = 0LL;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(v6, "addObject:", *(void *)(*((void *)&v19 + 1) + 8 * (void)v18), (void)v19);
        id v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v15 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }

    while (v16);
  }

  v5[2](v5, v6);
}

- (void)doReplayCommands:(id)a3 completionHandler:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager replayManager](self, "replayManager"));

  if (!v7)
  {
    id v8 = objc_alloc(&OBJC_CLASS___UAActivityReplay);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager manager](self, "manager"));
    int v10 = -[UAActivityReplay initWithManager:name:](v8, "initWithManager:name:", v9, @"ReplayManager");
    -[ActivityManagerDebuggingManager setReplayManager:](self, "setReplayManager:", v10);

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager manager](self, "manager"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager replayManager](self, "replayManager"));
    [v11 addHandler:v12];
  }

  if (v14 && [v14 count])
  {
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager replayManager](self, "replayManager"));
    [v13 processCommands:v14 completionHandler:v6];
  }

  else
  {
    -[ActivityManagerDebuggingManager setReplayManager:](self, "setReplayManager:", 0LL);
  }
}

- (void)doCopyDefaults:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 defaults:v4]);
  v7[2](v7, v6, 0LL);
}

- (void)doSetDefaults:(id)a3 archivedValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = objc_opt_class(&OBJC_CLASS___NSArray);
  v11[1] = objc_opt_class(&OBJC_CLASS___NSData);
  v11[2] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v11[3] = objc_opt_class(&OBJC_CLASS___NSNull);
  v11[4] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v11[5] = objc_opt_class(&OBJC_CLASS___NSString);
  v11[6] = objc_opt_class(&OBJC_CLASS___NSURL);
  v11[7] = objc_opt_class(&OBJC_CLASS___NSUUID);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 8LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v8,  v6,  0LL));
  if (v9)
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
    [v10 setDefault:v5 value:v9];
  }
}

- (void)doSetRemotePasteboardAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager manager](self, "manager"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v5 pasteboardController]);
  [v4 setRemotePasteboardAvalibility:v3 withDataRequester:0];
}

- (void)doSetLocalPasteboardReflection:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager manager](self, "manager"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v5 pasteboardController]);
  [v4 setLocalPasteboardReflection:v3];
}

- (void)doGetLoggingFileForClient:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v5 = (void (**)(id, void, void *))a5;
  if (v5)
  {
    id v7 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  -1LL,  0LL));
    v7[2](v7, 0LL, v6);

    id v5 = v7;
  }
}

- (void)doGetSFActivityAdvertisement:(id)a3 completionHandler:(id)a4
{
  id v5 = (void (**)(id, void *, void *, void *, void))a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager manager](self, "manager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 advertisers]);

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)v11);
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___UASharingAdvertiser);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          id v15 = v12;
          id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentAdvertisedBytes", (void)v20));
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 mostRecentAdvertisedBytesTime]);
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 currentAdvertisedItem]);
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 uuid]);
          v5[2](v5, v16, v17, v19, 0LL);

          id v14 = v8;
          goto LABEL_11;
        }

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -129LL,  0LL,  (void)v20));
  ((void (**)(id, void *, void *, void *, void *))v5)[2](v5, 0LL, 0LL, 0LL, v14);
LABEL_11:
}

- (void)doGetPairedDevices:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityManagerDebuggingManager manager](self, "manager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 advertisers]);

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      for (unint64_t i = 0LL; i != v10; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v13, "pairedDevices") & 1) != 0)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pairedDevices", (void)v18));
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 allObjects]);
          [v6 addObjectsFromArray:v15];
        }
      }

      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }

    while (v10);
  }

  os_log_t v16 = sub_100039584(0LL);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    __int128 v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "doGetPairedDevices(%{public}@)", buf, 0xCu);
  }

  (*((void (**)(id, void *, void, void))v5 + 2))(v5, v6, 0LL, 0LL);
}

- (UACornerActionManager)manager
{
  return (UACornerActionManager *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setManager:(id)a3
{
}

- (SharingBTLESuggestedItem)fakeBTLEInjectedItem
{
  return (SharingBTLESuggestedItem *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setFakeBTLEInjectedItem:(id)a3
{
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setListener:(id)a3
{
}

- (BOOL)disableAdminEntitlmentChecking
{
  return self->_disableAdminEntitlmentChecking;
}

- (void)setDisableAdminEntitlmentChecking:(BOOL)a3
{
  self->_disableAdminEntitlmentChecking = a3;
}

- (UAActivityReplay)replayManager
{
  return (UAActivityReplay *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setReplayManager:(id)a3
{
}

- (UAPingController)pingController
{
  return (UAPingController *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPingController:(id)a3
{
}

- (UANetworkReplayRendevousHandler)networkConnectionHandler
{
  return (UANetworkReplayRendevousHandler *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setNetworkConnectionHandler:(id)a3
{
}

- (timeval)ignoredRTimeVal
{
  __darwin_time_t v2 = v4[0];
  uint64_t v3 = v4[1];
  result.tv_usec = v3;
  result.tv_sec = v2;
  return result;
}

- (unint64_t)recentActionsStateHandler
{
  return self->_recentActionsStateHandler;
}

- (void)setRecentActionsStateHandler:(unint64_t)a3
{
  self->_recentActionsStateHandler = a3;
}

- (void).cxx_destruct
{
}

@end