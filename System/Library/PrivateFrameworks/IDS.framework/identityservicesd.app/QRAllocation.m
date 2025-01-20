@interface QRAllocation
- (BOOL)isJoinAllocation;
- (IDSQuickRelayAllocateMessage)request;
- (NSData)recipientPushToken;
- (NSMutableDictionary)pushTokenToQRSessionID;
- (NSMutableSet)responses;
- (NSString)requestIDStr;
- (NSString)sessionIDStr;
- (QRAllocation)initWithRequest:(id)a3;
- (QRAllocation)initWithResponse:(id)a3;
- (QRStreamInfo)streamInfo;
- (double)duration;
- (double)startTime;
- (id)connectReadyHandler;
- (id)getAllocation;
- (void)_allocationTimeout;
- (void)_purgeAllocation;
- (void)addAllocation:(id)a3;
- (void)cancelAllocationTimeoutTimer;
- (void)dealloc;
- (void)setConnectReadyHandler:(id)a3;
- (void)setDuration:(double)a3;
- (void)setIsJoinAllocation:(BOOL)a3;
- (void)setPurgeAtExpiration:(double)a3;
- (void)setPushTokenToQRSessionID:(id)a3;
- (void)setRecipientPushToken:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequestIDStr:(id)a3;
- (void)setResponses:(id)a3;
- (void)setSessionIDStr:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setStreamInfo:(id)a3;
@end

@implementation QRAllocation

- (QRAllocation)initWithRequest:(id)a3
{
  id v5 = a3;
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___QRAllocation;
  v6 = -[QRAllocation init](&v43, "init");
  v7 = v6;
  if (v5 && v6)
  {
    v6->_startTime = ids_monotonic_time(v6);
    objc_storeStrong((id *)&v7->_request, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 requestIDStr]);
    requestIDStr = v7->_requestIDStr;
    v7->_requestIDStr = (NSString *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 IDSSessionID]);
    BOOL v11 = [v10 length] == (id)16;

    if (v11)
    {
      v12 = objc_alloc(&OBJC_CLASS___NSUUID);
      v13 = (NSString *) objc_claimAutoreleasedReturnValue([v5 IDSSessionID]);
      v14 = -[NSUUID initWithUUIDBytes:](v12, "initWithUUIDBytes:", -[NSString bytes](v13, "bytes"));
      uint64_t v15 = objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v14, "UUIDString"));
      sessionIDStr = v7->_sessionIDStr;
      v7->_sessionIDStr = (NSString *)v15;
    }

    else
    {
      uint64_t v17 = OSLogHandleForTransportCategory("QRAllocator");
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue([v5 IDSSessionID]);
        id v20 = [v19 length];
        *(_DWORD *)buf = 134218240;
        id v45 = v20;
        __int16 v46 = 2048;
        uint64_t v47 = 16LL;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Warning: [[request IDSSessionID] length]: %lu != sizeof(uuid_t): %lu",  buf,  0x16u);
      }

      uint64_t v22 = os_log_shim_legacy_logging_enabled(v21);
      if ((_DWORD)v22)
      {
        if (_IDSShouldLogTransport(v22))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue([v5 IDSSessionID]);
          id v39 = [v23 length];
          uint64_t v40 = 16LL;
          _IDSLogTransport( @"QRAllocator",  @"IDS",  @"Warning: [[request IDSSessionID] length]: %lu != sizeof(uuid_t): %lu");

          if (_IDSShouldLog(0LL, @"QRAllocator"))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "IDSSessionID", v39, 16));
            id v39 = [v24 length];
            uint64_t v40 = 16LL;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Warning: [[request IDSSessionID] length]: %lu != sizeof(uuid_t): %lu");
          }
        }
      }

      v13 = v7->_sessionIDStr;
      v7->_sessionIDStr = 0LL;
    }

    if (!v7->_pushTokenToQRSessionID)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      pushTokenToQRSessionID = v7->_pushTokenToQRSessionID;
      v7->_pushTokenToQRSessionID = (NSMutableDictionary *)Mutable;
    }

    if (!v7->_responses)
    {
      v27 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      responses = v7->_responses;
      v7->_responses = v27;
    }

    id v29 = -[QRAllocation setPurgeAtExpiration:](v7, "setPurgeAtExpiration:", 0.0, v39, v40);
    uint64_t v31 = im_primary_queue(v29, v30);
    v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v31);
    dispatch_source_t v33 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v32);
    timeoutTimer = v7->_timeoutTimer;
    v7->_timeoutTimer = (OS_dispatch_source *)v33;

    v35 = (dispatch_source_s *)v7->_timeoutTimer;
    dispatch_time_t v36 = dispatch_time(0LL, 300000000000LL);
    dispatch_source_set_timer(v35, v36, 0x45D964B800uLL, 0x5F5E100uLL);
    v37 = (dispatch_source_s *)v7->_timeoutTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100286CA0;
    handler[3] = &unk_1008F6010;
    v42 = v7;
    dispatch_source_set_event_handler(v37, handler);
    dispatch_resume((dispatch_object_t)v7->_timeoutTimer);
  }

  return v7;
}

- (QRAllocation)initWithResponse:(id)a3
{
  v4 = (const __CFDictionary *)a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___QRAllocation;
  id v5 = -[QRAllocation init](&v24, "init");
  v6 = v5;
  if (v4 && v5)
  {
    id v7 = -[QRAllocation startTime](v5, "startTime");
    if (v8 == 0.0)
    {
      double v11 = 0.0;
    }

    else
    {
      double v9 = ids_monotonic_time(v7);
      -[QRAllocation startTime](v6, "startTime");
      double v11 = v9 - v10;
    }

    v6->_duration = v11;
    Value = (void *)kIDSQRAllocateKey_RequestID;
    if (kIDSQRAllocateKey_RequestID) {
      Value = (void *)CFDictionaryGetValue(v4, kIDSQRAllocateKey_RequestID);
    }
    objc_storeStrong((id *)&v6->_requestIDStr, Value);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v4, "objectForKey:", kIDSQRAllocateKey_IDSSessionID));
    sessionIDStr = v6->_sessionIDStr;
    v6->_sessionIDStr = (NSString *)v13;

    pushTokenToQRSessionID = v6->_pushTokenToQRSessionID;
    v6->_pushTokenToQRSessionID = 0LL;

    if (!v6->_pushTokenToQRSessionID)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      uint64_t v17 = v6->_pushTokenToQRSessionID;
      v6->_pushTokenToQRSessionID = (NSMutableDictionary *)Mutable;
    }

    responses = v6->_responses;
    v6->_responses = 0LL;

    v19 = v6->_responses;
    if (!v19)
    {
      id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      uint64_t v21 = v6->_responses;
      v6->_responses = v20;

      v19 = v6->_responses;
    }

    -[NSMutableSet addObject:](v19, "addObject:", v4);
    if (kIDSQRAllocateKey_RelayExpiryTimestamp) {
      uint64_t v22 = (void *)CFDictionaryGetValue(v4, kIDSQRAllocateKey_RelayExpiryTimestamp);
    }
    else {
      uint64_t v22 = 0LL;
    }
    [v22 doubleValue];
    -[QRAllocation setPurgeAtExpiration:](v6, "setPurgeAtExpiration:");
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v3 = OSLogHandleForTransportCategory("QRAllocator");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "QRAllocation destroyed", buf, 2u);
  }

  uint64_t v6 = os_log_shim_legacy_logging_enabled(v5);
  if ((_DWORD)v6)
  {
    if (_IDSShouldLogTransport(v6))
    {
      _IDSLogTransport(@"QRAllocator", @"IDS", @"QRAllocation destroyed");
    }
  }

  -[QRAllocation cancelAllocationTimeoutTimer](self, "cancelAllocationTimeoutTimer");
  request = self->_request;
  if (request)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage recipients](request, "recipients"));
    unsigned int v9 = [v8 count];

    if (v9 > -[NSMutableSet count](self->_responses, "count"))
    {
      id v10 = objc_alloc(&OBJC_CLASS___IDSQuickRelayMetric);
      double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2LL));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage provider](self->_request, "provider"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage allocateProtocolVersion](self->_request, "allocateProtocolVersion"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage appID](self->_request, "appID"));
      id v15 = [v10 initWithType:&off_100947740 eventSubType:&off_100947758 duration:0 resultCode:v11 providerType:v12 transportType:0 interfaceType:0 skeEnabled:0 isInitia tor:&off_100947770 protocolVersion:v13 retryCount:0 serviceName:v14 subServiceName:0 participantCount:0];

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
      [v16 logMetric:v15];

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2LL));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage provider](self->_request, "provider"));
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage allocateProtocolVersion](self->_request, "allocateProtocolVersion"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage appID](self->_request, "appID"));
      [v17 IDSQuickRelayEventType:&off_100947740 eventSubType:&off_100947758 duration:0 resultCode:v18 providerType:v19 transportType:0 interfaceType:0 skeEnabled:0 isIn itiator:&off_100947770 protocolVersion:v20 retryCount:0 serviceName:v21 subServiceName:0 participantCount:0];

      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage IDSSessionID](self->_request, "IDSSessionID"));
      id v23 = sub_1002872C0(v22);
      objc_super v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDSessionController sharedInstance](&OBJC_CLASS___IDSDSessionController, "sharedInstance"));
      v26 = (void *)objc_claimAutoreleasedReturnValue([v25 sessionWithUniqueID:v24]);

      if (v26)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        v28 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocateMessage allocateProtocolVersion]( self->_request,  "allocateProtocolVersion"));
        -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v28,  IDSDSessionReportQRVersionKey);

        -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  &off_100947758,  IDSDSessionReportQREventSubTypeKey);
        id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2LL));
        -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v29,  IDSDSessionReportResultCodeKey);

        [v26 addQREventForRTCReport:Mutable];
      }

      else
      {
        uint64_t v30 = OSLogHandleForTransportCategory("QRAllocator");
        uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Invalid session. Skip AWD report",  buf,  2u);
        }

        uint64_t v33 = os_log_shim_legacy_logging_enabled(v32);
        if ((_DWORD)v33)
        {
          if (_IDSShouldLogTransport(v33))
          {
            _IDSLogTransport(@"QRAllocator", @"IDS", @"Invalid session. Skip AWD report");
          }
        }
      }
    }
  }

  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___QRAllocation;
  -[QRAllocation dealloc](&v34, "dealloc");
}

- (void)setPurgeAtExpiration:(double)a3
{
  double v4 = a3 + IMTimeOfDay(self) * -1000.0;
  double v5 = v4 * 1000000.0;
  BOOL v6 = v4 < 120000.0;
  double v7 = 1.2e11;
  if (!v6) {
    double v7 = v5;
  }
  dispatch_time_t v8 = dispatch_time(0LL, (uint64_t)v7);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  id inited = objc_initWeak(&location, self);
  uint64_t v11 = im_primary_queue(inited, v10);
  v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100287598;
  v13[3] = &unk_1008F8A78;
  objc_copyWeak(&v14, &location);
  dispatch_after(v8, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_purgeAllocation
{
  double v3 = IMTimeOfDay(self);
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  uint64_t v40 = self;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[QRAllocation responses](self, "responses"));
  double v4 = 0LL;
  id v5 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
  if (v5)
  {
    double v6 = v3 * 1000.0;
    uint64_t v7 = *(void *)v46;
    dispatch_time_t v8 = (const void *)kIDSQRAllocateKey_RelayExpiryTimestamp;
    unsigned int v9 = (const void *)kIDSQRAllocateKey_RelaySessionID;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v46 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(const __CFDictionary **)(*((void *)&v45 + 1) + 8LL * (void)i);
        if (v11) {
          BOOL v12 = v8 == 0LL;
        }
        else {
          BOOL v12 = 1;
        }
        if (v12) {
          Value = 0LL;
        }
        else {
          Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(*((void *)&v45 + 1) + 8LL * (void)i), v8);
        }
        id v14 = Value;
        [v14 doubleValue];
        if (v6 > v15)
        {
          if (v11) {
            BOOL v16 = v9 == 0LL;
          }
          else {
            BOOL v16 = 1;
          }
          if (v16) {
            uint64_t v17 = 0LL;
          }
          else {
            uint64_t v17 = (void *)CFDictionaryGetValue(v11, v9);
          }
          id v18 = v17;
          uint64_t v19 = OSLogHandleForTransportCategory("QRAllocator");
          id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            id v51 = v18;
            __int16 v52 = 2048;
            double v53 = v6;
            __int16 v54 = 2112;
            id v55 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "access token of allocation for QR session %@ expired (%f > %@). Discard it.",  buf,  0x20u);
          }

          uint64_t v22 = os_log_shim_legacy_logging_enabled(v21);
          if ((_DWORD)v22)
          {
            if (_IDSShouldLogTransport(v22))
            {
              id v38 = v14;
              double v37 = v6;
              id v36 = v18;
              _IDSLogTransport( @"QRAllocator",  @"IDS",  @"access token of allocation for QR session %@ expired (%f > %@). Discard it.");
              if (_IDSShouldLog(0LL, @"QRAllocator"))
              {
                id v38 = v14;
                double v37 = v6;
                id v36 = v18;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"access token of allocation for QR session %@ expired (%f > %@). Discard it.");
              }
            }
          }

          if (!v4) {
            double v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          }
          -[NSMutableSet addObject:](v4, "addObject:", v11, v36, *(void *)&v37, v38);
        }
      }

      id v5 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
    }

    while (v5);
  }

  if (-[NSMutableSet count](v4, "count"))
  {
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id v23 = v4;
    id v24 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v41,  v49,  16LL);
    if (v24)
    {
      uint64_t v25 = *(void *)v42;
      do
      {
        for (j = 0LL; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v42 != v25) {
            objc_enumerationMutation(v23);
          }
          uint64_t v27 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)j);
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[QRAllocation responses](v40, "responses"));
          [v28 removeObject:v27];
        }

        id v24 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v41,  v49,  16LL);
      }

      while (v24);
    }

    -[NSMutableSet removeAllObjects](v23, "removeAllObjects");
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[QRAllocation responses](v40, "responses"));
  BOOL v30 = [v29 count] == 0;

  if (v30)
  {
    uint64_t v31 = OSLogHandleForTransportCategory("QRAllocator");
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "_purgeAllocation: Invalidate allocation",  buf,  2u);
    }

    uint64_t v34 = os_log_shim_legacy_logging_enabled(v33);
    if ((_DWORD)v34)
    {
      if (_IDSShouldLogTransport(v34))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"_purgeAllocation: Invalidate allocation");
      }
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[IDSQuickRelayAllocator sharedInstance](&OBJC_CLASS___IDSQuickRelayAllocator, "sharedInstance"));
    [v35 invalidateAllocation:v40];
  }
}

- (void)cancelAllocationTimeoutTimer
{
  if (self->_timeoutTimer)
  {
    uint64_t v3 = OSLogHandleForTransportCategory("QRAllocator");
    double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_time_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "allocation timeout timer cancelled", v8, 2u);
    }

    uint64_t v6 = os_log_shim_legacy_logging_enabled(v5);
    if ((_DWORD)v6 && _IDSShouldLogTransport(v6))
    {
      _IDSLogTransport(@"QRAllocator", @"IDS", @"allocation timeout timer cancelled");
    }

    dispatch_source_cancel((dispatch_source_t)self->_timeoutTimer);
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = 0LL;
  }

- (void)_allocationTimeout
{
  request = self->_request;
  if (request)
  {
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage requestIDStr](request, "requestIDStr"));
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage IDSSessionID](self->_request, "IDSSessionID"));
    id v5 = sub_1002872C0(v4);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage allocateType](self->_request, "allocateType"));
    dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
    [v8 handleAllocateRequestFailureForDevice:v6 requestID:v34 errorCode:0];

    uint64_t v9 = OSLogHandleForTransportCategory("QRAllocator");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "allocation timed out", buf, 2u);
    }

    uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
    if ((_DWORD)v12)
    {
      if (_IDSShouldLogTransport(v12))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"allocation timed out");
      }
    }

    uint64_t v13 = (__CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    CFDictionarySetValue(v13, kIDSQRAllocateKey_ErrorCode, &off_100947788);
    v44[0] = 0xAAAAAAAAAAAAAAAALL;
    v44[1] = 0xAAAAAAAAAAAAAAAALL;
    id v14 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v34);
    -[NSUUID getUUIDBytes:](v14, "getUUIDBytes:", v44);

    id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v44, 16LL));
    if (v15)
    {
      CFDictionarySetValue(v13, kIDSQRAllocateKey_RequestID, v15);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1006A5938();
    }

    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage appID](self->_request, "appID"));
    if (v16)
    {
      CFDictionarySetValue(v13, kIDSQRAllocateKey_AppID, v16);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1006A58B8();
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[IMDeviceSupport sharedInstance](&OBJC_CLASS___IMDeviceSupport, "sharedInstance"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 userAgentString]);

    id v19 = v18;
    if (v19)
    {
      CFDictionarySetValue(v13, kIDSQRAllocateKey_UserAgent, v19);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1006A5838();
    }

    id v20 = v7;
    if (v20)
    {
      CFDictionarySetValue(v13, kIDSQRAllocateKey_AllocateType, v20);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1006A57B8();
    }

    uint64_t v21 = OSLogHandleForTransportCategory("QRAllocator");
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v39 = v6;
      __int16 v40 = 2112;
      __int128 v41 = v34;
      __int16 v42 = 2112;
      id v43 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Sending server message QR metrics allocation timeout report for session %@ requestID: %@, ua: %@",  buf,  0x20u);
    }

    uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
    if ((_DWORD)v24)
    {
      if (_IDSShouldLogTransport(v24))
      {
        uint64_t v32 = v34;
        id v33 = v19;
        uint64_t v31 = v6;
        _IDSLogTransport( @"QRAllocator",  @"IDS",  @"Sending server message QR metrics allocation timeout report for session %@ requestID: %@, ua: %@");
        if (_IDSShouldLog(0LL, @"QRAllocator"))
        {
          uint64_t v32 = v34;
          id v33 = v19;
          uint64_t v31 = v6;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Sending server message QR metrics allocation timeout report for session %@ requestID: %@, ua: %@");
        }
      }
    }

    uint64_t v25 = -[IDSServerMessage initWithPayload:command:]( objc_alloc(&OBJC_CLASS___IDSServerMessage),  "initWithPayload:command:",  v13,  &off_1009477A0);
    uint64_t v27 = im_primary_queue(v25, v26);
    v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v27);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100288064;
    block[3] = &unk_1008F5F80;
    id v36 = v25;
    id v37 = v6;
    id v29 = v6;
    BOOL v30 = v25;
    dispatch_async(v28, block);
  }

  -[QRAllocation cancelAllocationTimeoutTimer](self, "cancelAllocationTimeoutTimer", v31, v32, v33);
}

- (void)addAllocation:(id)a3
{
  id v4 = a3;
  selfAllocations = self->_selfAllocations;
  id v8 = v4;
  if (!selfAllocations)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___QRSelfAllocationArray);
    uint64_t v7 = self->_selfAllocations;
    self->_selfAllocations = v6;

    id v4 = v8;
    selfAllocations = self->_selfAllocations;
  }

  -[QRSelfAllocationArray addAllocation:](selfAllocations, "addAllocation:", v4);
}

- (id)getAllocation
{
  selfAllocations = self->_selfAllocations;
  if (selfAllocations) {
    selfAllocations = (QRSelfAllocationArray *)objc_claimAutoreleasedReturnValue( -[QRSelfAllocationArray getAllocation]( selfAllocations,  "getAllocation"));
  }
  return selfAllocations;
}

- (NSString)requestIDStr
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setRequestIDStr:(id)a3
{
}

- (NSString)sessionIDStr
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setSessionIDStr:(id)a3
{
}

- (IDSQuickRelayAllocateMessage)request
{
  return (IDSQuickRelayAllocateMessage *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setRequest:(id)a3
{
}

- (NSMutableSet)responses
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setResponses:(id)a3
{
}

- (NSMutableDictionary)pushTokenToQRSessionID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setPushTokenToQRSessionID:(id)a3
{
}

- (NSData)recipientPushToken
{
  return (NSData *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setRecipientPushToken:(id)a3
{
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (id)connectReadyHandler
{
  return objc_getProperty(self, a2, 72LL, 1);
}

- (void)setConnectReadyHandler:(id)a3
{
}

- (BOOL)isJoinAllocation
{
  return self->_isJoinAllocation;
}

- (void)setIsJoinAllocation:(BOOL)a3
{
  self->_isJoinAlid location = a3;
}

- (QRStreamInfo)streamInfo
{
  return (QRStreamInfo *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setStreamInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end