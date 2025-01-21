@interface DoAPAudioRelay
- (BOOL)isHubConnected;
- (BOOL)isStreaming;
- (DoAPAudioRelay)initWithIdentifier:(id)a3 deviceType:(int64_t)a4 properties:(id)a5 codecType:(unsigned __int8)a6 hub:(id)a7;
- (DoAPAudioRelayHub)hub;
- (DoAPAudioRelaySource)delegate;
- (NSDictionary)hidProperties;
- (NSString)identifier;
- (int64_t)deviceType;
- (unsigned)codec;
- (void)cancelStream;
- (void)handleResetStream;
- (void)handleStartStream;
- (void)handleStopStream;
- (void)invalidate;
- (void)publish;
- (void)sendAudioFrame:(id)a3;
- (void)sendMsg:(const char *)a3 args:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setIsStreaming:(BOOL)a3;
- (void)startStream:(id)a3;
- (void)stopStream:(id)a3;
@end

@implementation DoAPAudioRelay

- (DoAPAudioRelay)initWithIdentifier:(id)a3 deviceType:(int64_t)a4 properties:(id)a5 codecType:(unsigned __int8)a6 hub:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___DoAPAudioRelay;
  v16 = -[DoAPAudioRelay init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    objc_storeWeak((id *)&v17->_hub, v15);
    v17->_isStreaming = 0;
    objc_storeStrong((id *)&v17->_hidProperties, a5);
    v17->_codec = a6;
    v17->_deviceType = a4;
  }

  return v17;
}

- (BOOL)isHubConnected
{
  v2 = self;
  v3 = -[DoAPAudioRelay hub];
  LOBYTE(v2) = [v3 isXpcConnectedForDeviceType:v2->_deviceType];

  return (char)v2;
}

- (void)sendAudioFrame:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_10003A5CC(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  id v14 = @"kMsgArgData";
  id v15 = v4;
  id v13 = [NSDictionary dictionaryWithObjects:forKeys:count:v15, v14, 1LL];
  -[DoAPAudioRelay sendMsg:args:](self, "sendMsg:args:", "AudioFrame", v13);
}

- (void)invalidate
{
  v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "DoAPAudioRelay - Send invalidate to AVVC",  v4,  2u);
  }

  -[DoAPAudioRelay sendMsg:args:](self, "sendMsg:args:", "Unpublish", 0LL);
}

- (void)cancelStream
{
  v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "DoAPAudioRelay - Send cancelStream to AVVC",  v4,  2u);
  }

  -[DoAPAudioRelay sendMsg:args:](self, "sendMsg:args:", "StreamDidCancel", 0LL);
}

- (void)publish
{
  v3 = [NSMutableDictionary dictionary];
  id v4 = [NSNumber numberWithInteger: +[DoAPAudioRelay deviceType](self, "deviceType")];
  [v3 setValue:v4 forKey:@"kMsgDeviceType"];

  v5 = [self hidProperties];
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelay hidProperties](self, "hidProperties"));
    uint64_t v7 = (void *)[v6 objectForKeyedSubscript:@"ProductID"];
    [v3 setValue:v7 forKey:@"kMsgPidNum"];
  }

  uint64_t v8 = (void *)[self identifier];

  if (v8)
  {
    uint64_t v9 = (void *)[self identifier];
    [v3 setValue:v9 forKey:@"kMsgArgIdentifier"];
  }

  if (-[DoAPAudioRelay codec](self, "codec"))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  -[DoAPAudioRelay codec](self, "codec")));
    [v3 setValue:v10 forKey:@"kMsgCodecType"];
  }

  uint64_t v11 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    id v13 = [v3 description];
    int v14 = 138412290;
    id v15 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "DoAPAudioRelay - Send publish to AVVC %@",  (uint8_t *)&v14,  0xCu);
  }

  -[DoAPAudioRelay sendMsg:args:](self, "sendMsg:args:", "Publish", v3);
}

- (void)handleStartStream
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10001961C;
  v2[3] = &unk_10005D108;
  v2[4] = self;
  -[DoAPAudioRelay startStream:](self, "startStream:", v2);
}

- (void)handleStopStream
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10001975C;
  v2[3] = &unk_10005D108;
  v2[4] = self;
  -[DoAPAudioRelay stopStream:](self, "stopStream:", v2);
}

- (void)handleResetStream
{
  v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelay - handleResetStream", v4, 2u);
  }

  -[DoAPAudioRelay stopStream:](self, "stopStream:", &stru_10005D148);
}

- (void)startStream:(id)a3
{
  id v4 = a3;
  -[DoAPAudioRelay setIsStreaming:](self, "setIsStreaming:", 1LL);
  v5 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_10003A5FC(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  id v13 = [self delegate];
  [v13 doapAudioWillStart:v4];
}

- (void)stopStream:(id)a3
{
  id v4 = a3;
  -[DoAPAudioRelay setIsStreaming:](self, "setIsStreaming:", 0LL);
  v5 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_10003A62C(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  id v13 = -[DoAPAudioRelay delegate];
  [v13 doapAudioDidStop:v4];
}

- (void)sendMsg:(const char *)a3 args:(id)a4
{
  id v10 = a4;
  uint64_t v6 = (void *)[self identifier];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObject:forKey:",  v6,  @"kMsgArgIdentifier"));

  if (v10) {
    [v7 addEntriesFromDictionary:v10];
  }
  uint64_t v8 = (void *)[self hub];
  uint64_t v9 = (void *)[NSString stringWithUTF8String:a3];
  [v8 sendMsgIfCheckedIn:v9 args:v7 forClient:[self deviceType]];
}

- (DoAPAudioRelaySource)delegate
{
  return (DoAPAudioRelaySource *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (DoAPAudioRelayHub)hub
{
  return (DoAPAudioRelayHub *)objc_loadWeakRetained((id *)&self->_hub);
}

- (BOOL)isStreaming
{
  return self->_isStreaming;
}

- (void)setIsStreaming:(BOOL)a3
{
  self->_isStreaming = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)hidProperties
{
  return self->_hidProperties;
}

- (unsigned)codec
{
  return self->_codec;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void).cxx_destruct
{
}

@end