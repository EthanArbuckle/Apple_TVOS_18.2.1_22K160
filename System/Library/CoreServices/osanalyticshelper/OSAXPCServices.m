@interface OSAXPCServices
+ (BOOL)handleDefaultsRequestWithParams:(id)a3 forReply:(id)a4;
+ (void)handleStabilityMonitorRequest:(id)a3 fromConnection:(id)a4 forReply:(id)a5;
- (BOOL)generateCrackShotWithParams:(id)a3;
- (BOOL)generateStackShotWithParams:(id)a3;
- (BOOL)generateSystemMemoryResetWithParams:(id)a3;
- (BOOL)serviceRequest:(id)a3 forOperation:(unint64_t)a4 fromConnection:(id)a5 forReply:(id)a6;
- (OSAXPCServices)init;
- (void)dealloc;
@end

@implementation OSAXPCServices

- (OSAXPCServices)init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___OSAXPCServices;
  v2 = -[OSAXPCServices init](&v20, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.osanalytics.defaultsQueue", 0LL);
    defaultsQueue = v2->_defaultsQueue;
    v2->_defaultsQueue = (OS_dispatch_queue *)v3;

    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.osanalytics.osanalyticshelper", 0LL, 1uLL);
    listenerConnection = v2->_listenerConnection;
    v2->_listenerConnection = mach_service;

    if (v2->_listenerConnection)
    {
      +[OSABridgeLinkRemote instantiate](&OBJC_CLASS___OSABridgeLinkRemote, "instantiate");
      +[OSALogHelper instantiate](&OBJC_CLASS___OSALogHelper, "instantiate");
      objc_initWeak(&location, v2);
      v7 = v2->_listenerConnection;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000111C8;
      v17[3] = &unk_100021178;
      objc_copyWeak(&v18, &location);
      xpc_connection_set_event_handler(v7, v17);
      xpc_connection_resume(v2->_listenerConnection);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }

    else
    {
      BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v8) {
        sub_100015D28(v8, v9, v10, v11, v12, v13, v14, v15);
      }

      return 0LL;
    }
  }

  return v2;
}

- (void)dealloc
{
  listenerConnection = self->_listenerConnection;
  if (listenerConnection) {
    xpc_connection_cancel(listenerConnection);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___OSAXPCServices;
  -[OSAXPCServices dealloc](&v4, "dealloc");
}

- (BOOL)serviceRequest:(id)a3 forOperation:(unint64_t)a4 fromConnection:(id)a5 forReply:(id)a6
{
  id v10 = a3;
  uint64_t v11 = (_xpc_connection_s *)a5;
  id v12 = a6;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  char v34 = 0;
  switch(a4)
  {
    case 2uLL:
      unsigned __int8 v13 = -[OSAXPCServices generateStackShotWithParams:](self, "generateStackShotWithParams:", v10);
      goto LABEL_13;
    case 3uLL:
      unsigned __int8 v13 = -[OSAXPCServices generateCrackShotWithParams:](self, "generateCrackShotWithParams:", v10);
      goto LABEL_13;
    case 4uLL:
      unsigned __int8 v13 = -[OSAXPCServices generateSystemMemoryResetWithParams:](self, "generateSystemMemoryResetWithParams:", v10);
      goto LABEL_13;
    case 5uLL:
      string = xpc_dictionary_get_string(v10, "log_countkey");
      uint64_t v15 = xpc_dictionary_get_string(v10, "log_filepath");
      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15));
        if (string) {
          v17 = string;
        }
        else {
          v17 = "<unknown>";
        }
        id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v17));
        +[OSABridgeLinkProxy transfer:key:](&OBJC_CLASS___OSABridgeLinkProxy, "transfer:key:", v16, v18);

        *((_BYTE *)v32 + 24) = 1;
      }

      break;
    case 6uLL:
      unsigned __int8 v13 = +[OSALogHelper createForSubmissionWithXPCRequest:forReply:]( &OBJC_CLASS___OSALogHelper,  "createForSubmissionWithXPCRequest:forReply:",  v10,  v12);
LABEL_13:
      *((_BYTE *)v32 + 24) = v13;
      break;
    case 7uLL:
      v21 = (void *)xpc_connection_copy_entitlement_value(v11, "com.apple.private.osanalytics.defaults.allow");
      v22 = v21;
      if (v21 && xpc_get_type(v21) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v22))
      {
        defaultsQueue = (dispatch_queue_s *)self->_defaultsQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100011704;
        block[3] = &unk_1000211A0;
        v30 = &v31;
        id v28 = v10;
        id v29 = v12;
        dispatch_sync(defaultsQueue, block);
      }

      else
      {
        id v24 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          pid_t pid = xpc_connection_get_pid(v11);
          sub_100015E10((uint64_t)v35, pid, v26);
        }

        *((_BYTE *)v32 + 24) = 0;
      }

      break;
    case 8uLL:
      +[OSAXPCServices handleStabilityMonitorRequest:fromConnection:forReply:]( &OBJC_CLASS___OSAXPCServices,  "handleStabilityMonitorRequest:fromConnection:forReply:",  v10,  v11,  v12);
      break;
    default:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100015D9C();
      }
      break;
  }

  BOOL v19 = *((_BYTE *)v32 + 24) != 0;
  _Block_object_dispose(&v31, 8);

  return v19;
}

+ (BOOL)handleDefaultsRequestWithParams:(id)a3 forReply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  string = xpc_dictionary_get_string(v5, "defaults_key");
  BOOL v8 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.osanalytics.internal");
  switch(xpc_dictionary_get_uint64(v5, "defaults_operation"))
  {
    case 0uLL:
      BOOL v9 = 0;
      if (v6 && string)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
        unsigned __int8 v11 = -[NSUserDefaults BOOLForKey:](v8, "BOOLForKey:", v10);

        xpc_dictionary_set_BOOL(v6, "defaults_value", v11);
        BOOL v9 = 1;
      }

      goto LABEL_43;
    case 1uLL:
      xpc_object_t value = xpc_dictionary_get_value(v5, "defaults_value");
      unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(value);
      uint64_t v14 = v13;
      BOOL v9 = 0;
      if (string && v13)
      {
        if (xpc_get_type(v13) == (xpc_type_t)&_xpc_type_BOOL)
        {
          BOOL v35 = xpc_BOOL_get_value(v14);
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
          -[NSUserDefaults setBool:forKey:](v8, "setBool:forKey:", v35, v36);

          BOOL v9 = 1;
        }

        else
        {
          BOOL v9 = 0;
        }
      }

      goto LABEL_39;
    case 2uLL:
      BOOL v9 = 0;
      if (v6 && string)
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v8, "objectForKey:", v15));

        if (v16)
        {
          uint64_t v17 = ns2xpc(v16);
          id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
          if (v18)
          {
            xpc_dictionary_set_value(v6, "defaults_value", v18);
            int v19 = 1;
          }

          else
          {
            int v19 = 0;
          }
        }

        else
        {
          int v19 = 0;
        }

        BOOL v9 = v19 != 0;
      }

      goto LABEL_43;
    case 3uLL:
      xpc_object_t v20 = xpc_dictionary_get_value(v5, "defaults_value");
      uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
      uint64_t v14 = (void *)v21;
      if (!v21)
      {
        id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
        -[NSUserDefaults removeObjectForKey:](v8, "removeObjectForKey:", v24);
LABEL_37:
        BOOL v9 = 1;
        goto LABEL_38;
      }

      uint64_t v22 = xpc2ns(v21);
      uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
      id v24 = (void *)v23;
      BOOL v9 = 0;
      if (string && v23)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        unsigned __int8 v26 = [v24 isEqual:v25];

        if ((v26 & 1) != 0)
        {
          BOOL v9 = 0;
          goto LABEL_38;
        }

        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
        -[NSUserDefaults setObject:forKey:](v8, "setObject:forKey:", v24, v37);

        goto LABEL_37;
      }

+ (void)handleStabilityMonitorRequest:(id)a3 fromConnection:(id)a4 forReply:(id)a5
{
  id v7 = a3;
  BOOL v8 = (_xpc_connection_s *)a4;
  id v9 = a5;
  xpc_type_t type = (xpc_type_t)xpc_connection_copy_entitlement_value(v8, "com.apple.private.osanalytics.stability-monitor.allow");
  unsigned __int8 v11 = type;
  if (type)
  {
    xpc_type_t type = xpc_get_type(type);
    if (type == (xpc_type_t)&_xpc_type_BOOL)
    {
      xpc_type_t type = (xpc_type_t)xpc_BOOL_get_value(v11);
      if ((_DWORD)type)
      {
        xpc_object_t value = xpc_dictionary_get_value(v7, "stability_parameters");
        uint64_t v13 = objc_claimAutoreleasedReturnValue(value);
        uint64_t v14 = (os_log_s *)v13;
        if (v13)
        {
          uint64_t v15 = xpc2ns(v13);
          uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
          if (v16)
          {
            uint64_t v17 = (void *)v16;
            xpc_object_t v18 = xpc_dictionary_get_value(v7, "stability_bundleID");
            int v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
            if (!v19)
            {
              +[OSAStabilityMonitor evaluateStabilityWithParameters:]( &OBJC_CLASS___OSAStabilityMonitor,  "evaluateStabilityWithParameters:",  v17);
              if (v9)
              {
                xpc_dictionary_set_BOOL(v9, "result", 1);
                xpc_connection_send_message(v8, v9);
              }

              id v29 = 0LL;
              goto LABEL_39;
            }

            xpc_object_t v20 = v19;
            string_ptr = xpc_string_get_string_ptr(v19);
            if (string_ptr)
            {
              uint64_t v22 = string_ptr;
              xpc_object_t v23 = xpc_dictionary_get_value(v7, "stability_coalitionName");
              id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
              BOOL v35 = v24;
              if (v24)
              {
                v25 = xpc_string_get_string_ptr(v24);
                if (!v25)
                {
                  unsigned __int8 v26 = 0LL;
LABEL_31:
                  int v31 = 1;
                  id v29 = "Unable to handle coalition name from XPC message";
                  goto LABEL_33;
                }

                unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v25));
                if (!v26) {
                  goto LABEL_31;
                }
              }

              else
              {
                unsigned __int8 v26 = 0LL;
              }

              if (v9)
              {
                v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v22));
                v36[0] = _NSConcreteStackBlock;
                v36[1] = 3221225472LL;
                v36[2] = sub_100011E70;
                v36[3] = &unk_1000211C8;
                id v37 = v9;
                v38 = v8;
                +[OSAStabilityMonitor evaluateStabilityOfBundleID:coalitionName:parameters:completionHandler:]( &OBJC_CLASS___OSAStabilityMonitor,  "evaluateStabilityOfBundleID:coalitionName:parameters:completionHandler:",  v30,  v26,  v17,  v36);

                id v29 = 0LL;
                int v31 = 0;
              }

              else
              {
                int v31 = 1;
                id v29 = "No XPC reply given for per-process stability monitor";
              }

- (BOOL)generateStackShotWithParams:(id)a3
{
  id v3 = a3;
  if (qword_100026288 != -1) {
    dispatch_once(&qword_100026288, &stru_1000211E8);
  }
  string = xpc_dictionary_get_string(v3, "reason");
  id v5 = xpc_dictionary_get_string(v3, "caller");
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "exception_code");
  uint64_t v77 = uint64;
  uint64_t v7 = xpc_dictionary_get_uint64(v3, "PID");
  uint64_t v8 = xpc_dictionary_get_uint64(v3, "flags");
  xpc_object_t value = xpc_dictionary_get_value(v3, "additional_payload");
  xpc_object_t xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue(value);
  ++dword_1000262A8;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = "<anonymous>";
    if (v5) {
      id v10 = v5;
    }
    *(_DWORD *)buf = 136446722;
    double v80 = *(double *)&v10;
    if (string) {
      unsigned __int8 v11 = string;
    }
    else {
      unsigned __int8 v11 = "<unknown>";
    }
    __int16 v81 = 2048;
    uint64_t v82 = uint64;
    __int16 v83 = 2080;
    v84 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Stackshot requested by %{public}s, code: %llx, reason: %s",  buf,  0x20u);
  }

  v61 = v5;
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)qword_100026280, 0LL))
  {
LABEL_20:
    uint64_t v17 = objc_alloc(&OBJC_CLASS___NSString);
    if (v5) {
      xpc_object_t v18 = v5;
    }
    else {
      xpc_object_t v18 = "<anonymous>";
    }
    int v19 = -[NSString initWithUTF8String:](v17, "initWithUTF8String:", v18);
    xpc_object_t v20 = (void *)qword_100026298;
    qword_100026298 = (uint64_t)v19;

    qword_100026290 = CFAbsoluteTimeGetCurrent();
    v56 = v18;
    if ((_DWORD)v7)
    {
      id v21 = [[VMUProcInfo alloc] initWithPid:v7];
      uint64_t v22 = v21;
      if (v21) {
        v60 = (void *)objc_claimAutoreleasedReturnValue([v21 name]);
      }
      else {
        v60 = 0LL;
      }
    }

    else
    {
      v60 = 0LL;
    }

    int v31 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"stackshot_%llx",  uint64));
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v31 getTaskingKey:v32]);

    char v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    BOOL v35 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    v58 = v33;
    v59 = v34;
    if ([v35 appleInternal])
    {

LABEL_41:
      id v42 = objc_alloc(&OBJC_CLASS___OSAStackShotReport);
      v43 = v42;
      if (string)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
        id v39 = [v43 initForPid:v7 process:v60 withReason:v44 exceptionCode:&v77 exceptionCodeCount:1 stackshotFlags:v8];
      }

      else
      {
        id v39 = [v42 initForPid:v7 process:v60 withReason:@"(null)" exceptionCode:&v77 exceptionCodeCount:1 stackshotFlags:v8];
      }

      __uint64_t v45 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
      [v39 acquireStackshot];
      __uint64_t v29 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v45;
      uint64_t v57 = objc_msgSend(v39, "ss_trace_length");
      if (xdict)
      {
        applier[0] = _NSConcreteStackBlock;
        applier[1] = 3221225472LL;
        applier[2] = sub_100012760;
        applier[3] = &unk_100021210;
        v46 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        v76 = v46;
        xpc_dictionary_apply(xdict, applier);
        [v39 setAdditionalPayload:v46];
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_100016028();
        }
      }

      v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Requested by %s",  v56));
      v78 = v47;
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v78, 1LL));
      [v39 addNotes:v48];

      unsigned __int8 v30 = [v39 saveWithOptions:0];
      v49 = (void *)objc_claimAutoreleasedReturnValue([v39 getExtraData:@"stackshot_duration_nsec"]);
      id v28 = [v49 longLongValue];

      v50 = (void *)objc_claimAutoreleasedReturnValue([v39 getExtraData:@"stackshot_duration_outer_nsec"]);
      id v27 = [v50 longLongValue];

      v51 = (void *)objc_claimAutoreleasedReturnValue([v39 getExtraData:@"stackshot_duration_prior_nsec"]);
      id v26 = [v51 longLongValue];

      v52 = (void *)objc_claimAutoreleasedReturnValue([v39 getExtraData:@"stackshot_size_estimate"]);
      id v24 = [v52 longLongValue];

      v53 = (void *)objc_claimAutoreleasedReturnValue([v39 getExtraData:@"stackshot_size_estimate_adj"]);
      id v23 = [v53 longLongValue];

LABEL_49:
      qword_100026290 = 0LL;
      v54 = (void *)qword_100026298;
      qword_100026298 = 0LL;

      dword_1000262A0 = 0;
      dispatch_semaphore_signal((dispatch_semaphore_t)qword_100026280);

      uint64_t uint64 = v77;
      uint64_t v25 = v57;
      goto LABEL_50;
    }

    if (v33 && (uint64_t v37 = objc_opt_class(&OBJC_CLASS___NSNumber, v36), (objc_opt_isKindOfClass(v33, v37) & 1) != 0))
    {
      unsigned __int8 v38 = [v33 BOOLValue];

      if ((v38 & 1) != 0) {
        goto LABEL_41;
      }
    }

    else
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", uint64));
      unsigned __int8 v41 = [v34 containsObject:v40];

      if ((v41 & 1) == 0) {
        goto LABEL_41;
      }
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      double v80 = *(double *)&v5;
      __int16 v81 = 2048;
      uint64_t v82 = uint64;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Ignoring stackshot requested by %{public}s with exception code 0x%llx because it is not tasked.",  buf,  0x16u);
    }

    id v23 = 0LL;
    id v24 = 0LL;
    uint64_t v57 = 0LL;
    id v26 = 0LL;
    id v27 = 0LL;
    id v28 = 0LL;
    __uint64_t v29 = 0LL;
    unsigned __int8 v30 = 0;
    id v39 = v58;
    goto LABEL_49;
  }

  id v12 = (id)qword_100026298;
  double v13 = *(double *)&qword_100026290;
  if (*(double *)&qword_100026290 == 0.0)
  {
    ++dword_1000262A0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Stackshot already in progress (just now), ignoring",  buf,  2u);
    }
  }

  else
  {
    double v14 = CFAbsoluteTimeGetCurrent() - v13;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v80 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Stackshot already in progress (%.2f ago), ignoring",  buf,  0xCu);
    }

    if (v14 > 300.0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100016090(v14);
      }
      uint64_t v15 = "<anonymous>";
      if (v5) {
        uint64_t v15 = v5;
      }
      id v3 = [objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString stringWithFormat:@"Stackshot wedged (originally requested by %@). Found by %s (ignored %d others)", v12, v15, dword_1000262A0)), "UTF8String"];
      unsigned int v16 = objc_msgSend( (id)objc_claimAutoreleasedReturnValue( +[OSASystemConfiguration sharedInstance]( OSASystemConfiguration,  "sharedInstance")),  "appleInternal");
      abort_with_reason(12LL, 1LL, v3, v16 ^ 1);
      goto LABEL_20;
    }
  }

  id v23 = 0LL;
  id v24 = 0LL;
  uint64_t v25 = 0LL;
  id v26 = 0LL;
  id v27 = 0LL;
  id v28 = 0LL;
  __uint64_t v29 = 0LL;
  unsigned __int8 v30 = 0;
LABEL_50:
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472LL;
  v63[2] = sub_1000127E0;
  v63[3] = &unk_100021238;
  v66 = v61;
  __uint64_t v67 = v29;
  id v68 = v27;
  id v69 = v28;
  unsigned __int8 v74 = v30;
  id v70 = v26;
  uint64_t v71 = v25;
  id v72 = v23;
  id v73 = v24;
  id v64 = 0LL;
  uint64_t v65 = uint64;
  analytics_send_event_lazy("com.apple.osanalytics.stackshot_usage", v63);

  return v30;
}

- (BOOL)generateCrackShotWithParams:(id)a3
{
  id v3 = a3;
  string = xpc_dictionary_get_string(v3, "reason");
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "PID");
  int v19 = xpc_dictionary_get_uint64(v3, "ers_namespace");
  uint64_t v20 = xpc_dictionary_get_uint64(v3, "ers_code");
  uint64_t v21 = xpc_dictionary_get_uint64(v3, "ers_flags");
  xpc_object_t value = xpc_dictionary_get_value(v3, "additional_payload");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(value);

  id v8 = objc_alloc(&OBJC_CLASS___OSACrackShotReport);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
  id v10 = [v8 initForPid:uint64 exitSnapshot:&v19 reason:v9];

  if (v7)
  {
    double v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472LL;
    unsigned int v16 = sub_100012B74;
    uint64_t v17 = &unk_100021210;
    unsigned __int8 v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    xpc_object_t v18 = v11;
    xpc_dictionary_apply(v7, &v14);
    objc_msgSend(v10, "setAdditionalPayload:", v11, v14, v15, v16, v17);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100016028();
    }
  }

  [v10 acquireStackshot];
  unsigned __int8 v12 = [v10 saveWithOptions:0];

  return v12;
}

- (BOOL)generateSystemMemoryResetWithParams:(id)a3
{
  id v3 = a3;
  string = xpc_dictionary_get_string(v3, "reason");
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "event_code");

  id v6 = objc_alloc(&OBJC_CLASS___OSASystemMemoryResetReport);
  uint64_t v7 = v6;
  if (string)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    id v9 = -[OSASystemMemoryResetReport initWithEvent:code:](v7, "initWithEvent:code:", v8, uint64);
  }

  else
  {
    id v9 = -[OSASystemMemoryResetReport initWithEvent:code:](v6, "initWithEvent:code:", 0LL, uint64);
  }

  -[OSASystemMemoryResetReport acquireJetsamData](v9, "acquireJetsamData");
  unsigned __int8 v10 = -[OSASystemMemoryResetReport saveWithOptions:](v9, "saveWithOptions:", 0LL);

  return v10;
}

- (void).cxx_destruct
{
}

@end