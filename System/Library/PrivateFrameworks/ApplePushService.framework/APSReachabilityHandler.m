@interface APSReachabilityHandler
- (APSReachabilityHandler)initWithReachabilityHost:(id)a3 reachabilityBlock:(id)a4;
- (BOOL)pendingReachabilityChange;
- (NSString)reachabilityHost;
- (__SCNetworkReachability)connectionReachability;
- (double)lastReachabilityChangeHandled;
- (id)description;
- (id)reachabilityBlock;
- (unsigned)currentFlags;
- (unsigned)lastReachabilityFlags;
- (void)disable;
- (void)enable;
- (void)noteReachabilityChange:(unsigned int)a3;
- (void)raiseReachabilityChange;
- (void)setConnectionReachability:(__SCNetworkReachability *)a3;
- (void)setLastReachabilityChangeHandled:(double)a3;
- (void)setLastReachabilityFlags:(unsigned int)a3;
- (void)setPendingReachabilityChange:(BOOL)a3;
- (void)setReachabilityBlock:(id)a3;
- (void)setReachabilityHost:(id)a3;
@end

@implementation APSReachabilityHandler

- (APSReachabilityHandler)initWithReachabilityHost:(id)a3 reachabilityBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___APSReachabilityHandler;
  v9 = -[APSReachabilityHandler init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_reachabilityHost, a3);
    id v11 = objc_retainBlock(v8);
    id reachabilityBlock = v10->_reachabilityBlock;
    v10->_id reachabilityBlock = v11;
  }

  return v10;
}

- (unsigned)currentFlags
{
  SCNetworkReachabilityFlags flags = 0;
  SCNetworkReachabilityGetFlags(self->_connectionReachability, &flags);
  return flags;
}

- (void)enable
{
  if (!self->_connectionReachability)
  {
    v3 = SCNetworkReachabilityCreateWithName( kCFAllocatorDefault,  -[NSString UTF8String](self->_reachabilityHost, "UTF8String"));
    self->_connectionReachability = v3;
    v6.version = 0LL;
    memset(&v6.retain, 0, 24);
    v6.info = self;
    SCNetworkReachabilitySetCallback(v3, (SCNetworkReachabilityCallBack)sub_100072F14, &v6);
    connectionReachability = self->_connectionReachability;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    SCNetworkReachabilityScheduleWithRunLoop( connectionReachability,  (CFRunLoopRef)[v5 getCFRunLoop],  (CFStringRef)NSDefaultRunLoopMode);

    SCNetworkReachabilityGetFlags(self->_connectionReachability, &self->_lastReachabilityFlags);
  }

- (void)disable
{
  connectionReachability = self->_connectionReachability;
  if (connectionReachability)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    SCNetworkReachabilityUnscheduleFromRunLoop( connectionReachability,  (CFRunLoopRef)[v4 getCFRunLoop],  (CFStringRef)NSDefaultRunLoopMode);

    CFRelease(self->_connectionReachability);
    self->_connectionReachability = 0LL;
  }

- (void)raiseReachabilityChange
{
  SCNetworkReachabilityFlags flags = 0;
  self->_pendingReachabilityChange = 0;
  SCNetworkReachabilityGetFlags(self->_connectionReachability, &flags);
  -[APSReachabilityHandler noteReachabilityChange:](self, "noteReachabilityChange:", flags);
}

- (void)noteReachabilityChange:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v6 = v5;
  unsigned int lastReachabilityFlags = self->_lastReachabilityFlags;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (lastReachabilityFlags == (_DWORD)v3)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412546;
      v18 = self;
      __int16 v19 = 1024;
      int v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: network reachability hasn't changed, still 0x%02x",  buf,  0x12u);
    }
  }

  else
  {
    if (v9)
    {
      unsigned int v10 = self->_lastReachabilityFlags;
      *(_DWORD *)buf = 138412802;
      v18 = self;
      __int16 v19 = 1024;
      int v20 = v3;
      __int16 v21 = 1024;
      unsigned int v22 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: network reachability changed to 0x%02x (from 0x%02x)",  buf,  0x18u);
    }

    self->_unsigned int lastReachabilityFlags = v3;
  }

  if (self->_pendingReachabilityChange)
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = self;
      __int16 v19 = 1024;
      int v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@: Rate limiting network reachability change events, ignoring 0x%02x",  buf,  0x12u);
    }
  }

  else
  {
    double v12 = v6 - self->_lastReachabilityChangeHandled;
    if (v12 >= 3.0 || v12 < 0.0)
    {
      self->_lastReachabilityChangeHandled = v6;
      v15 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[APSReachabilityHandler reachabilityBlock]( self,  "reachabilityBlock"));
      v15[2](v15, v3);
    }

    else
    {
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%@: Rate limiting network reachability change events, rescheduling event",  buf,  0xCu);
      }

      self->_pendingReachabilityChange = 1;
      dispatch_time_t v14 = dispatch_time(0LL, 3000000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100073274;
      block[3] = &unk_10011E4F0;
      block[4] = self;
      dispatch_after(v14, &_dispatch_main_q, block);
    }
  }

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p host:%@>",  objc_opt_class(self, a2),  self,  self->_reachabilityHost);
}

- (__SCNetworkReachability)connectionReachability
{
  return self->_connectionReachability;
}

- (void)setConnectionReachability:(__SCNetworkReachability *)a3
{
  self->_connectionReachability = a3;
}

- (unsigned)lastReachabilityFlags
{
  return self->_lastReachabilityFlags;
}

- (void)setLastReachabilityFlags:(unsigned int)a3
{
  self->_unsigned int lastReachabilityFlags = a3;
}

- (BOOL)pendingReachabilityChange
{
  return self->_pendingReachabilityChange;
}

- (void)setPendingReachabilityChange:(BOOL)a3
{
  self->_pendingReachabilityChange = a3;
}

- (double)lastReachabilityChangeHandled
{
  return self->_lastReachabilityChangeHandled;
}

- (void)setLastReachabilityChangeHandled:(double)a3
{
  self->_lastReachabilityChangeHandled = a3;
}

- (NSString)reachabilityHost
{
  return self->_reachabilityHost;
}

- (void)setReachabilityHost:(id)a3
{
}

- (id)reachabilityBlock
{
  return self->_reachabilityBlock;
}

- (void)setReachabilityBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end