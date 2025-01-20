@interface MSDLocalMessageResponder
+ (id)sharedInstance;
- (BOOL)checkEntitlementsWithRequest:(id)a3 from:(id)a4;
- (BOOL)demoPrepareInProgress;
- (BOOL)saveOperationRequestIfNeeded:(id)a3 completeBy:(int)a4;
- (OS_os_transaction)transaction;
- (OS_xpc_object)connectionForPricing;
- (OS_xpc_object)xpcListener;
- (id)getEntitlementsFrom:(id)a3;
- (void)handleMessage:(id)a3 from:(id)a4;
- (void)lostClientConnection:(id)a3;
- (void)sendRebootTimeoutMessageToPricing:(int)a3;
- (void)setConnectionForPricing:(id)a3;
- (void)setDemoPrepareInProgress:(BOOL)a3;
- (void)setTransaction:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)start;
@end

@implementation MSDLocalMessageResponder

+ (id)sharedInstance
{
  if (qword_100125400 != -1) {
    dispatch_once(&qword_100125400, &stru_1000F9E80);
  }
  return (id)qword_1001253F8;
}

- (id)getEntitlementsFrom:(id)a3
{
  audit_token_t v31 = v32;
  v3 = SecTaskCreateWithAuditToken(0LL, &v31);
  if (v3)
  {
    v4 = v3;
    v5 = (__CFString *)SecTaskCopySigningIdentifier(v3, 0LL);
    v6 = (_UNKNOWN **)SecTaskCopyValueForEntitlement(v4, @"com.apple.private.mobilestoredemo.enabledemo", 0LL);
    if (v6)
    {
      v7 = v6;
      CFTypeID v8 = CFGetTypeID(v6);
      if (v8 != CFBooleanGetTypeID())
      {
        CFTypeID v9 = CFGetTypeID(v7);
        if (v9 != CFArrayGetTypeID()) {
          v7 = 0LL;
        }
LABEL_8:
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
        if ([v10 macOS])
        {
          if ((-[__CFString containsString:]( v5,  "containsString:",  @"com.apple.SecurityAgentHelper") & 1) != 0)
          {
          }

          else
          {
            unsigned __int8 v11 = -[__CFString containsString:]( v5,  "containsString:",  @"com.apple.SecurityAgent");

            if ((v11 & 1) == 0)
            {
LABEL_14:
              CFRelease(v4);
              goto LABEL_15;
            }
          }

          v10 = v7;
          v7 = &off_100106090;
        }

        goto LABEL_14;
      }

      if (CFBooleanGetValue((CFBooleanRef)v7))
      {
        CFRelease(v7);
        v7 = &off_100106078;
        goto LABEL_8;
      }
    }

    else
    {
      id v22 = sub_10003AA3C();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100097928(v23, v24, v25, v26, v27, v28, v29, v30);
      }
    }

    v7 = 0LL;
    goto LABEL_8;
  }

  id v13 = sub_10003AA3C();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_1000978B8(v14, v15, v16, v17, v18, v19, v20, v21);
  }

  v5 = 0LL;
  v7 = 0LL;
LABEL_15:

  return v7;
}

- (BOOL)checkEntitlementsWithRequest:(id)a3 from:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLocalMessageResponder getEntitlementsFrom:](self, "getEntitlementsFrom:", a4));
  if (!v7)
  {
    id v19 = sub_10003AA3C();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100097998();
    }

    goto LABEL_37;
  }

  string = xpc_dictionary_get_string(v6, "RequestOperation");
  if (string)
  {
    CFTypeID v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    if ([v9 isEqualToString:@"GetDeviceOptions"]
      && (v10 = xpc_dictionary_get_string(v6, "SubKey")) != 0LL)
    {
      unsigned __int8 v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v10));
    }

    else
    {
      unsigned __int8 v11 = 0LL;
    }

    if ([&off_1001060C0 containsObject:v9])
    {
      v12 = @"Enroll";
    }

    else
    {
      if ([&off_1001060A8 containsObject:v9])
      {
        if (![v7 containsObject:@"DigitalCatalog"])
        {
LABEL_36:

LABEL_37:
          BOOL v17 = 0;
          goto LABEL_25;
        }

        id v13 = &off_1001060F0;
        v12 = v11;
LABEL_10:
        if ([v13 containsObject:v12])
        {
LABEL_11:

          goto LABEL_12;
        }

        goto LABEL_36;
      }

      if ([&off_1001060D8 containsObject:v9])
      {
        v12 = @"AccessPersistDemoVolume";
      }

      else if ([&off_100106108 containsObject:v9])
      {
        v12 = @"KeychainAccess";
      }

      else if ([&off_100106120 containsObject:v9])
      {
        v12 = @"UserKeychainAccess";
      }

      else
      {
        if (![&off_100106138 containsObject:v9])
        {
          if ([&off_100106150 containsObject:v9]
            && [v7 containsObject:@"PeerDemoDevice"])
          {
            goto LABEL_11;
          }

          goto LABEL_36;
        }

        v12 = @"SecurityPlugin";
      }
    }

    id v13 = (_UNKNOWN **)v7;
    goto LABEL_10;
  }

- (void)start
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLocalMessageResponder xpcListener](self, "xpcListener"));

  if (!v3)
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.mobilestoredemod", 0LL, 1uLL);
    -[MSDLocalMessageResponder setXpcListener:](self, "setXpcListener:", mach_service);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLocalMessageResponder xpcListener](self, "xpcListener"));
    if (!v5)
    {
      id v11 = sub_10003AA3C();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Could not create XPC listener.", buf, 2u);
      }

      exit(1);
    }

    id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[MSDLocalMessageResponder xpcListener](self, "xpcListener"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](&OBJC_CLASS___MSDWorkQueueSet, "sharedInstance"));
    CFTypeID v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 messageQueue]);
    xpc_connection_set_target_queue(v6, v8);

    CFTypeID v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[MSDLocalMessageResponder xpcListener](self, "xpcListener"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100040998;
    handler[3] = &unk_1000F9C68;
    handler[4] = self;
    xpc_connection_set_event_handler(v9, handler);

    v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[MSDLocalMessageResponder xpcListener](self, "xpcListener"));
    xpc_connection_resume(v10);
  }

- (void)handleMessage:(id)a3 from:(id)a4
{
  id v5 = a3;
  connection = (_xpc_connection_s *)a4;
  uint64_t v357 = 0LL;
  v358 = (id *)&v357;
  uint64_t v359 = 0x3032000000LL;
  v360 = sub_100043D70;
  v361 = sub_100043D80;
  id v362 = 0LL;
  uint64_t v354 = 0LL;
  v355 = &v354;
  uint64_t v356 = 0x2020000000LL;
  v313 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPricingUpdateController sharedInstance]( &OBJC_CLASS___MSDPricingUpdateController,  "sharedInstance"));
  id v6 = sub_10003AA3C();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10009825C();
  }

  unsigned __int8 v8 = -[MSDLocalMessageResponder checkEntitlementsWithRequest:from:]( self,  "checkEntitlementsWithRequest:from:",  v5,  connection);
  *((_BYTE *)v355 + 24) = v8;
  if ((v8 & 1) == 0)
  {
    id v146 = sub_10003AA3C();
    reply = (os_log_s *)objc_claimAutoreleasedReturnValue(v146);
    if (os_log_type_enabled(reply, OS_LOG_TYPE_ERROR)) {
      sub_100098230();
    }
    v315 = 0LL;
    v316 = 0LL;
    v320 = 0LL;
    v311 = 0LL;
    v312 = 0LL;
    v314 = 0LL;
    v317 = 0LL;
    v318 = 0LL;
    v10 = 0LL;
    goto LABEL_97;
  }

  v320 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  v316 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateController sharedInstance](&OBJC_CLASS___MSDDemoUpdateController, "sharedInstance"));
  CFTypeID v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithXPCDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithXPCDictionary:",  v5));
  v10 = v9;
  if (!v9)
  {
    v311 = 0LL;
    v312 = 0LL;
    v314 = 0LL;
    v315 = 0LL;
    v317 = 0LL;
    v318 = 0LL;
    goto LABEL_96;
  }

  v318 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"ContentServer"]);
  v317 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"Port"]);
  v315 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"PairingCredential"]);
  v314 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"DeviceName"]);
  v312 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"ContainerUniqueIdentifier"]);
  v311 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"PersistentDataBlob"]);
  string = xpc_dictionary_get_string(v5, "RequestOperation");
  if (!string) {
    goto LABEL_64;
  }
  id v12 = sub_10003AA3C();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v364 = string;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received an operation request: %{public}s",  buf,  0xCu);
  }

  int64_t int64 = xpc_dictionary_get_int64(v5, "Duration");
  if (int64)
  {
    int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)int64));
    [v15 timeIntervalSinceReferenceDate];
    double v17 = v16;

    uint64_t v18 = (int)v17;
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  string,  4LL,  v311));
  unsigned __int8 v20 = -[MSDLocalMessageResponder saveOperationRequestIfNeeded:completeBy:]( self,  "saveOperationRequestIfNeeded:completeBy:",  v19,  v18);
  *((_BYTE *)v355 + 24) = v20;

  uint64_t v21 = v355;
  if (!*((_BYTE *)v355 + 24)) {
    goto LABEL_96;
  }
  if (!strncmp(string, "DemoEnroll", 0xBuLL))
  {
    if (v318 && (uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString, v22), (objc_opt_isKindOfClass(v318, v26) & 1) != 0))
    {
      if (v317)
      {
        uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSString, v27);
        if ((objc_opt_isKindOfClass(v317, v28) & 1) != 0)
        {
          if (!v315)
          {
            id v29 = sub_10003AA3C();
            uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v364 = "-[MSDLocalMessageResponder handleMessage:from:]";
              _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%s: warning: no credential from app",  buf,  0xCu);
            }
          }

          if (!v314)
          {
            id v31 = sub_10003AA3C();
            audit_token_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v364 = "-[MSDLocalMessageResponder handleMessage:from:]";
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%s: warning: no device name from app",  buf,  0xCu);
            }
          }

          [v320 setupDemoDeviceMetadataFolder];
          [v320 setDemoEnrollmentFlag:@"enrollmentStarted"];
          v33 = (void *)os_transaction_create("Enrolling.");
          -[MSDLocalMessageResponder setTransaction:](self, "setTransaction:", v33);

          v34 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](&OBJC_CLASS___MSDWorkQueueSet, "sharedInstance"));
          v35 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v34 demoUpdateQueue]);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100043D88;
          block[3] = &unk_1000F9EA8;
          v352 = &v354;
          v36 = block;
          block[4] = v316;
          id v347 = v314;
          id v348 = v315;
          id v349 = v318;
          id v350 = v317;
          v353 = &v357;
          id v351 = v320;
          dispatch_async(v35, block);

          goto LABEL_62;
        }
      }

      id v161 = sub_10003AA3C();
      reply = (os_log_s *)objc_claimAutoreleasedReturnValue(v161);
      if (os_log_type_enabled(reply, OS_LOG_TYPE_ERROR)) {
        goto LABEL_215;
      }
    }

    else
    {
      id v160 = sub_10003AA3C();
      reply = (os_log_s *)objc_claimAutoreleasedReturnValue(v160);
      if (os_log_type_enabled(reply, OS_LOG_TYPE_ERROR)) {
LABEL_215:
      }
        sub_100097AA8();
    }

- (void)sendRebootTimeoutMessageToPricing:(int)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLocalMessageResponder connectionForPricing](self, "connectionForPricing"));

  if (v5)
  {
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v6)
    {
      id v7 = sub_10003AA3C();
      unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_100098288();
      }

      xpc_dictionary_set_int64(v6, "MSDRebootTimeout", a3);
      CFTypeID v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[MSDLocalMessageResponder connectionForPricing](self, "connectionForPricing"));
      xpc_connection_send_message(v9, v6);
    }
  }

- (void)lostClientConnection:(id)a3
{
  id v9 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MSDLocalMessageResponder connectionForPricing](self, "connectionForPricing"));

  if (v4 == v9) {
    -[MSDLocalMessageResponder setConnectionForPricing:](self, "setConnectionForPricing:", 0LL);
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v5 connection]);

  id v7 = v9;
  if (v6 == v9)
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
    [v8 setConnection:0];

    id v7 = v9;
  }
}

- (BOOL)saveOperationRequestIfNeeded:(id)a3 completeBy:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  if ([v5 isEqualToString:@"DemoUpdate"])
  {
    uint64_t v6 = 1LL;
    id v7 = @"UpdateContent";
  }

  else if ([v5 isEqualToString:@"Demo"])
  {
    uint64_t v6 = 0LL;
    id v7 = @"TurnSnapshotON";
  }

  else if ([v5 isEqualToString:@"DemoMaualUpdate"])
  {
    uint64_t v6 = 0LL;
    id v7 = @"TurnSnapshotOFF";
  }

  else if ([v5 isEqualToString:@"DemoSnapshotRevert"])
  {
    uint64_t v6 = 8LL;
    id v7 = @"RevertSnapshot";
  }

  else if ([v5 isEqualToString:@"OSUpdate"])
  {
    uint64_t v6 = 0LL;
    id v7 = @"UpdateOS";
  }

  else
  {
    if (![v5 isEqualToString:@"Reboot"])
    {
      unsigned __int8 v9 = 1;
      goto LABEL_14;
    }

    uint64_t v6 = 0LL;
    id v7 = @"Restart";
  }

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  unsigned __int8 v9 = [v8 saveOperationRequest:v7 requestFlag:v6 completeBy:v4];

LABEL_14:
  return v9;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setTransaction:(id)a3
{
}

- (OS_xpc_object)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (OS_xpc_object)connectionForPricing
{
  return (OS_xpc_object *)objc_loadWeakRetained((id *)&self->_connectionForPricing);
}

- (void)setConnectionForPricing:(id)a3
{
}

- (BOOL)demoPrepareInProgress
{
  return self->_demoPrepareInProgress;
}

- (void)setDemoPrepareInProgress:(BOOL)a3
{
  self->_demoPrepareInProgress = a3;
}

- (void).cxx_destruct
{
}

@end