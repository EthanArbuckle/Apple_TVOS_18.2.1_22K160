@interface ADCoreSpeechService
+ (id)sharedService;
- (ADCoreSpeechService)init;
- (void)_handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
- (void)sendMessageWithPayload:(id)a3 toPeer:(id)a4 withReply:(id)a5;
@end

@implementation ADCoreSpeechService

- (ADCoreSpeechService)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ADCoreSpeechService;
  v2 = -[ADCoreSpeechService init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("Core Speech Service Queue", v4);

    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADCompanionService sharedInstance](&OBJC_CLASS___ADCompanionService, "sharedInstance"));
    [v7 setMessageHandler:v2 forMessageType:@"corespeech"];

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSP2PService sharedInstance](&OBJC_CLASS___CSP2PService, "sharedInstance"));
    [v8 setAdCompanionServiceProvider:v2];
  }

  return v2;
}

- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A406C;
  block[3] = &unk_1004FCBB0;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(serialQueue, block);
}

- (void)_handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void, void *))a6;
  id v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315650;
    id v17 = "-[ADCoreSpeechService _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s %@ %@", (uint8_t *)&v16, 0x20u);
  }

  if ([v10 isEqualToString:@"corespeech"])
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CSP2PService sharedInstance](&OBJC_CLASS___CSP2PService, "sharedInstance"));
    [v14 processRemoteCommandWithPayload:v9 fromPeer:v11 withReply:v12];
  }

  else
  {
    id v15 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315394;
      id v17 = "-[ADCoreSpeechService _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Received message from unknown message type: %@",  (uint8_t *)&v16,  0x16u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 1004LL));
    v12[2](v12, 0LL, v14);
  }
}

- (void)sendMessageWithPayload:(id)a3 toPeer:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "-[ADCoreSpeechService sendMessageWithPayload:toPeer:withReply:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADCompanionService sharedInstance](&OBJC_CLASS___ADCompanionService, "sharedInstance"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000A3F94;
  v14[3] = &unk_1004F4150;
  v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [v12 sendMessage:v8 messageType:@"corespeech" toDeviceWithIDSIdentifier:v9 completion:v14];
}

- (void).cxx_destruct
{
}

+ (id)sharedService
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A40F4;
  block[3] = &unk_1004FCFF8;
  block[4] = a1;
  if (qword_100577BA8 != -1) {
    dispatch_once(&qword_100577BA8, block);
  }
  return (id)qword_100577BB0;
}

@end