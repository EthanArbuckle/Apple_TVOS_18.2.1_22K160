@interface MSMSASServiceConnection
- (NSMutableDictionary)XPCForegroundRequestByPersonID;
- (NSMutableDictionary)foregroundPingTimerByPersonID;
- (id)workQueue;
- (void)XPCNSServiceConnection:(id)a3 didReceiveRequest:(id)a4 sequenceNumber:(unint64_t)a5;
- (void)XPCNSServiceConnectionDidDisconnect:(id)a3;
- (void)_foregroundPingTimerDidExpire:(id)a3;
- (void)_handleFocusAlbum:(id)a3;
- (void)_handleForegroundPing:(id)a3 request:(id)a4;
- (void)setForegroundPingTimerByPersonID:(id)a3;
- (void)setXPCForegroundRequestByPersonID:(id)a3;
@end

@implementation MSMSASServiceConnection

- (NSMutableDictionary)foregroundPingTimerByPersonID
{
  foregroundPingTimerByPersonID = self->_foregroundPingTimerByPersonID;
  if (!foregroundPingTimerByPersonID)
  {
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v5 = self->_foregroundPingTimerByPersonID;
    self->_foregroundPingTimerByPersonID = v4;

    foregroundPingTimerByPersonID = self->_foregroundPingTimerByPersonID;
  }

  return foregroundPingTimerByPersonID;
}

- (NSMutableDictionary)XPCForegroundRequestByPersonID
{
  XPCForegroundRequestByPersonID = self->_XPCForegroundRequestByPersonID;
  if (!XPCForegroundRequestByPersonID)
  {
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v5 = self->_XPCForegroundRequestByPersonID;
    self->_XPCForegroundRequestByPersonID = v4;

    XPCForegroundRequestByPersonID = self->_XPCForegroundRequestByPersonID;
  }

  return XPCForegroundRequestByPersonID;
}

- (id)workQueue
{
  if (qword_10001E3A0 != -1) {
    dispatch_once(&qword_10001E3A0, &stru_100018B68);
  }
  return (id)qword_10001E3A8;
}

- (void)_handleForegroundPing:(id)a3 request:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kMSASPersonIDKey]);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kMSASIsUIForegroundKey]);
    unsigned int v10 = [v9 BOOLValue];

    uint64_t v11 = MSASPlatform();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 albumSharingDaemon]);

    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 delegate]);
    [v14 MSAlbumSharingDaemonDidUnidleMomentarily:v13];

    if (v10)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSMSASServiceConnection foregroundPingTimerByPersonID](self, "foregroundPingTimerByPersonID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v8]);

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  8.0));
        [v16 setFireDate:v17];
      }

      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_foregroundPingTimerDidExpire:",  v8,  0LL,  8.0));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSMSASServiceConnection foregroundPingTimerByPersonID](self, "foregroundPingTimerByPersonID"));
        [v18 setObject:v16 forKey:v8];

        [v13 didBeginForegroundFocusForPersonID:v8];
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
        [v17 addTimer:v16 forMode:NSRunLoopCommonModes];
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        int v22 = 138543618;
        v23 = self;
        __int16 v24 = 2112;
        v25 = v8;
        _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%{public}@: Holding foreground assertion for personID “%@”",  (uint8_t *)&v22,  0x16u);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSMSASServiceConnection XPCForegroundRequestByPersonID](self, "XPCForegroundRequestByPersonID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:v8]);

      if (v20) {
        [v20 sendReply:0];
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSMSASServiceConnection XPCForegroundRequestByPersonID](self, "XPCForegroundRequestByPersonID"));
      [v21 setObject:v7 forKey:v8];

      [v13 retryOutstandingActivities];
    }
  }
}

- (void)_foregroundPingTimerDidExpire:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MSASPlatform();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 albumSharingDaemon]);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v13 = 138543618;
    v14 = self;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%{public}@: Dropping foreground assertion for personID “%@”",  (uint8_t *)&v13,  0x16u);
  }

  [v7 didEndForegroundFocusForPersonID:v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSMSASServiceConnection XPCForegroundRequestByPersonID](self, "XPCForegroundRequestByPersonID"));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v8]);

  if (v10)
  {
    [v10 sendReply:0];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSMSASServiceConnection XPCForegroundRequestByPersonID](self, "XPCForegroundRequestByPersonID"));
    [v11 removeObjectForKey:v8];
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSMSASServiceConnection foregroundPingTimerByPersonID](self, "foregroundPingTimerByPersonID"));
  [v12 removeObjectForKey:v8];

  [v4 invalidate];
}

- (void)_handleFocusAlbum:(id)a3
{
  id v3 = a3;
  uint64_t v4 = MSASPlatform();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue([v5 albumSharingDaemon]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kMSASAlbumGUIDKey]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kMSASPersonIDKey]);

  [v8 setFocusAlbumGUID:v6 forPersonID:v7];
}

- (void)XPCNSServiceConnection:(id)a3 didReceiveRequest:(id)a4 sequenceNumber:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 message]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000BEC0;
  block[3] = &unk_100018C80;
  block[4] = self;
  id v15 = (id)objc_claimAutoreleasedReturnValue([v9 objectForKey:kMSASFunctionNameKey]);
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v7;
  id v13 = v15;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)XPCNSServiceConnectionDidDisconnect:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000BE14;
  v4[3] = &unk_100018BE0;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (void)setForegroundPingTimerByPersonID:(id)a3
{
}

- (void)setXPCForegroundRequestByPersonID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end