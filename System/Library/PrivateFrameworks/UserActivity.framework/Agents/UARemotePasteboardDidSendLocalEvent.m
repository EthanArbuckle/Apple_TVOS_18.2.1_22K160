@interface UARemotePasteboardDidSendLocalEvent
- (BOOL)usedStreams;
- (id)eventName;
- (id)eventPayload;
- (int64_t)errorCode;
- (unint64_t)clientWriteSize;
- (unint64_t)clientWriteSpeed;
- (unint64_t)clientWriteTime;
- (unint64_t)streamDataSize;
- (unint64_t)streamDataXferSpeed;
- (unint64_t)streamDataXferTime;
- (unint64_t)streamOpenDelay;
- (unint64_t)totalTime;
- (void)setClientWriteSize:(unint64_t)a3;
- (void)setClientWriteSpeed:(unint64_t)a3;
- (void)setClientWriteTime:(unint64_t)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setStreamDataSize:(unint64_t)a3;
- (void)setStreamDataXferSpeed:(unint64_t)a3;
- (void)setStreamDataXferTime:(unint64_t)a3;
- (void)setStreamOpenDelay:(unint64_t)a3;
- (void)setTotalTime:(unint64_t)a3;
- (void)setUsedStreams:(BOOL)a3;
@end

@implementation UARemotePasteboardDidSendLocalEvent

- (id)eventName
{
  return @"com.apple.UserActivity.UniversalClipboard.Sent";
}

- (id)eventPayload
{
  v15[0] = @"clientWriteSize";
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[UARemotePasteboardDidSendLocalEvent clientWriteSize](self, "clientWriteSize")));
  v16[0] = v14;
  v15[1] = @"clientWriteTime";
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[UARemotePasteboardDidSendLocalEvent clientWriteTime](self, "clientWriteTime")));
  v16[1] = v3;
  v15[2] = @"clientWriteSpeed";
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[UARemotePasteboardDidSendLocalEvent clientWriteSpeed](self, "clientWriteSpeed")));
  v16[2] = v4;
  v15[3] = @"usedStreams";
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[UARemotePasteboardDidSendLocalEvent usedStreams](self, "usedStreams")));
  v16[3] = v5;
  v15[4] = @"streamOpenDelay";
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[UARemotePasteboardDidSendLocalEvent streamOpenDelay](self, "streamOpenDelay")));
  v16[4] = v6;
  v15[5] = @"streamDataSize";
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[UARemotePasteboardDidSendLocalEvent streamDataSize](self, "streamDataSize")));
  v16[5] = v7;
  v15[6] = @"streamTransferTime";
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[UARemotePasteboardDidSendLocalEvent streamDataXferTime](self, "streamDataXferTime")));
  v16[6] = v8;
  v15[7] = @"streamTransferSpeed";
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[UARemotePasteboardDidSendLocalEvent streamDataXferSpeed](self, "streamDataXferSpeed")));
  v16[7] = v9;
  v15[8] = @"totalTime";
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[UARemotePasteboardDidSendLocalEvent totalTime](self, "totalTime")));
  v16[8] = v10;
  v15[9] = @"errorCode";
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[UARemotePasteboardDidSendLocalEvent errorCode](self, "errorCode")));
  v16[9] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  10LL));

  return v12;
}

- (unint64_t)clientWriteSize
{
  return self->_clientWriteSize;
}

- (void)setClientWriteSize:(unint64_t)a3
{
  self->_clientWriteSize = a3;
}

- (unint64_t)clientWriteTime
{
  return self->_clientWriteTime;
}

- (void)setClientWriteTime:(unint64_t)a3
{
  self->_clientWriteTime = a3;
}

- (unint64_t)clientWriteSpeed
{
  return self->_clientWriteSpeed;
}

- (void)setClientWriteSpeed:(unint64_t)a3
{
  self->_clientWriteSpeed = a3;
}

- (BOOL)usedStreams
{
  return self->_usedStreams;
}

- (void)setUsedStreams:(BOOL)a3
{
  self->_usedStreams = a3;
}

- (unint64_t)streamOpenDelay
{
  return self->_streamOpenDelay;
}

- (void)setStreamOpenDelay:(unint64_t)a3
{
  self->_streamOpenDelay = a3;
}

- (unint64_t)streamDataSize
{
  return self->_streamDataSize;
}

- (void)setStreamDataSize:(unint64_t)a3
{
  self->_streamDataSize = a3;
}

- (unint64_t)streamDataXferTime
{
  return self->_streamDataXferTime;
}

- (void)setStreamDataXferTime:(unint64_t)a3
{
  self->_streamDataXferTime = a3;
}

- (unint64_t)streamDataXferSpeed
{
  return self->_streamDataXferSpeed;
}

- (void)setStreamDataXferSpeed:(unint64_t)a3
{
  self->_streamDataXferSpeed = a3;
}

- (unint64_t)totalTime
{
  return self->_totalTime;
}

- (void)setTotalTime:(unint64_t)a3
{
  self->_totalTime = a3;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

@end