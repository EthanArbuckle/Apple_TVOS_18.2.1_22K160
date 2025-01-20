@interface ADFMIPListener
+ (id)sharedListener;
- (ADFMIPListener)init;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)startListening;
@end

@implementation ADFMIPListener

- (ADFMIPListener)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ADFMIPListener;
  v2 = -[ADFMIPListener init](&v11, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("ADFMIPListener", v4);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc(&OBJC_CLASS___APSConnection);
    v8 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( v7,  "initWithEnvironmentName:namedDelegatePort:queue:",  APSEnvironmentProduction,  @"com.apple.aps.assistantd.fmip",  v2->_queue);
    connection = v2->_connection;
    v2->_connection = v8;
  }

  return v2;
}

- (void)startListening
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002D60C8;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    v6 = "-[ADFMIPListener connection:didReceivePublicToken:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[ADFMIPListener connection:didReceiveIncomingMessage:]";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 topic]);
  unsigned int v9 = [v8 isEqualToString:@"com.apple.icloud.fmip.voiceassistantsync"];

  if (v9)
  {
    v10 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@%s", @"com.apple.icloud.fmip", ".siri_data_changed");
    notify_post(-[NSString UTF8String](v10, "UTF8String"));
  }
}

- (void).cxx_destruct
{
}

+ (id)sharedListener
{
  if (qword_100578438 != -1) {
    dispatch_once(&qword_100578438, &stru_1004FA970);
  }
  return (id)qword_100578440;
}

@end