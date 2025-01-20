@interface IDSOTRSessionInfo
- (BOOL)isNegotiating;
- (BOOL)isReady;
- (BOOL)isSuspended;
- (IDSOTRSessionInfo)initWithToken:(id)a3;
- (NSString)token;
- (double)lastStartTime;
- (id)otrTestBlock;
- (unsigned)negotiationCount;
- (void)_handleNegotiationTimeout;
- (void)_negotiationTimerFiredOnMain;
- (void)dealloc;
- (void)removeNegotiationTimer;
- (void)setIsNegotiating:(BOOL)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setIsSuspended:(BOOL)a3;
- (void)setLastStartTime:(double)a3;
- (void)setNegotiationCount:(unsigned int)a3;
- (void)setNegotiationTimer;
- (void)setOtrTestBlock:(id)a3;
@end

@implementation IDSOTRSessionInfo

- (IDSOTRSessionInfo)initWithToken:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSOTRSessionInfo;
  v6 = -[IDSOTRSessionInfo init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_token, a3);
  }

  return v7;
}

- (void)dealloc
{
  negotiationTimer = self->_negotiationTimer;
  if (negotiationTimer)
  {
    -[IMTimer invalidate](negotiationTimer, "invalidate");
    v4 = self->_negotiationTimer;
    self->_negotiationTimer = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSOTRSessionInfo;
  -[IDSOTRSessionInfo dealloc](&v5, "dealloc");
}

- (void)removeNegotiationTimer
{
  if (self->_negotiationTimer)
  {
    uint64_t v3 = OSLogHandleForTransportCategory("OTRController");
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      negotiationTimer = self->_negotiationTimer;
      token = self->_token;
      *(_DWORD *)buf = 134218242;
      v15 = negotiationTimer;
      __int16 v16 = 2112;
      v17 = token;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Remove OTR timer %p for %@.", buf, 0x16u);
    }

    uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
    if ((_DWORD)v8 && _IDSShouldLogTransport(v8))
    {
      v12 = self->_negotiationTimer;
      v13 = self->_token;
      _IDSLogTransport(@"OTRController", @"IDS", @"Remove OTR timer %p for %@.");
      if (_IDSShouldLog(0LL, @"OTRController"))
      {
        v12 = self->_negotiationTimer;
        v13 = self->_token;
        _IDSLogV(0LL, @"IDSFoundation", @"OTRController", @"Remove OTR timer %p for %@.");
      }
    }

    v10 = self->_negotiationTimer;
    p_negotiationTimer = &self->_negotiationTimer;
    -[IMTimer invalidate](v10, "invalidate", v12, v13);
    v11 = *p_negotiationTimer;
    *p_negotiationTimer = 0LL;
  }

- (void)_handleNegotiationTimeout
{
  uint64_t v3 = OSLogHandleForTransportCategory("OTRController");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    token = self->_token;
    negotiationTimer = self->_negotiationTimer;
    *(_DWORD *)buf = 138412546;
    v23 = token;
    __int16 v24 = 2048;
    v25 = negotiationTimer;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "OTR timed out for %@, timer %p.", buf, 0x16u);
  }

  uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
  if ((_DWORD)v8)
  {
    if (_IDSShouldLogTransport(v8))
    {
      v20 = self->_token;
      v21 = self->_negotiationTimer;
      _IDSLogTransport(@"OTRController", @"IDS", @"OTR timed out for %@, timer %p.");
      if (_IDSShouldLog(0LL, @"OTRController"))
      {
        v20 = self->_token;
        v21 = self->_negotiationTimer;
        _IDSLogV(0LL, @"IDSFoundation", @"OTRController", @"OTR timed out for %@, timer %p.");
      }
    }
  }

  *(_WORD *)&self->_isNegotiating = 0;
  self->_lastStartTime = 0.0;
  -[IDSOTRSessionInfo removeNegotiationTimer](self, "removeNegotiationTimer", v20, v21);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRController sharedInstance](&OBJC_CLASS___IDSOTRController, "sharedInstance"));
  v11 = self->_token;
  p_token = (void **)&self->_token;
  [v9 performOTRSessionBlock:2 token:v11];

  id v12 = objc_alloc(&OBJC_CLASS___IDSOTRSessionNegotiationMetric);
  id v13 = sub_100265B38(*p_token);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = [v12 initWithService:v14 priority:sub_100265CB0(*p_token) duration:30000 result:2];

  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
  [v16 logMetric:v15];

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
  id v18 = sub_100265B38(*p_token);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  [v17 OTRSessionNegotiation:v19 priority:sub_100265CB0(*p_token) duration:30000 result:2];
}

- (void)setNegotiationTimer
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___IMTimer);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"otr-timer-%@",  self->_token));
  uint64_t v6 = im_primary_queue(v4, v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = -[IMTimer initWithTimeInterval:name:shouldWake:target:selector:userInfo:queue:]( v3,  "initWithTimeInterval:name:shouldWake:target:selector:userInfo:queue:",  v4,  1LL,  self,  "_handleNegotiationTimeout",  0LL,  v7,  30.0);
  negotiationTimer = self->_negotiationTimer;
  self->_negotiationTimer = v8;

  uint64_t v10 = OSLogHandleForTransportCategory("OTRController");
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = self->_negotiationTimer;
    token = self->_token;
    *(_DWORD *)buf = 134218242;
    v17 = v12;
    __int16 v18 = 2112;
    v19 = token;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Set OTR timer %p for %@", buf, 0x16u);
  }

  uint64_t v15 = os_log_shim_legacy_logging_enabled(v14);
  if ((_DWORD)v15 && _IDSShouldLogTransport(v15))
  {
    _IDSLogTransport(@"OTRController", @"IDS", @"Set OTR timer %p for %@");
  }

- (void)_negotiationTimerFiredOnMain
{
  uint64_t v3 = im_primary_queue(self, a2);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100266074;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v4, block);
}

- (NSString)token
{
  return self->_token;
}

- (BOOL)isNegotiating
{
  return self->_isNegotiating;
}

- (void)setIsNegotiating:(BOOL)a3
{
  self->_isNegotiating = a3;
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (BOOL)isSuspended
{
  return self->_isSuspended;
}

- (void)setIsSuspended:(BOOL)a3
{
  self->_isSuspended = a3;
}

- (double)lastStartTime
{
  return self->_lastStartTime;
}

- (void)setLastStartTime:(double)a3
{
  self->_lastStartTime = a3;
}

- (unsigned)negotiationCount
{
  return self->_negotiationCount;
}

- (void)setNegotiationCount:(unsigned int)a3
{
  self->_negotiationCount = a3;
}

- (id)otrTestBlock
{
  return self->_otrTestBlock;
}

- (void)setOtrTestBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end