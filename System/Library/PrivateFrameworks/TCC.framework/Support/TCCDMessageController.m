@interface TCCDMessageController
+ (id)sharedMessageControllerForCurrentPlatform;
- (NSMutableDictionary)messageTypesToHandlers;
- (OS_dispatch_queue)queue;
- (TCCDMessageController)init;
- (void)_sendMessage:(id)a3 handler:(id)a4;
- (void)sendMessage:(id)a3 ofType:(id)a4 handler:(id)a5;
- (void)setIncomingMessageType:(id)a3 handler:(id)a4;
- (void)setMessageTypesToHandlers:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation TCCDMessageController

+ (id)sharedMessageControllerForCurrentPlatform
{
  if (qword_100078230 != -1) {
    dispatch_once(&qword_100078230, &stru_100064D90);
  }
  return 0LL;
}

- (TCCDMessageController)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TCCDMessageController;
  id v2 = -[TCCDMessageController init](&v9, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("TCCDIdsMessageController", 0LL);
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v6 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v5;

    if (!*((void *)v2 + 2) || !*((void *)v2 + 1))
    {
      v7 = (os_log_s *)qword_100078460;
      if (os_log_type_enabled((os_log_t)qword_100078460, OS_LOG_TYPE_ERROR)) {
        sub_10003C6E4((uint64_t *)v2 + 2, (uint64_t *)v2 + 1, v7);
      }

      return 0LL;
    }
  }

  return (TCCDMessageController *)v2;
}

- (void)setIncomingMessageType:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TCCDMessageController queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100004EEC;
    block[3] = &unk_100064DB8;
    id v20 = v7;
    block[4] = self;
    id v19 = v6;
    dispatch_async(v8, block);

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100004F4C;
    v17[3] = &unk_100064D50;
    v17[4] = self;
    if (qword_100078238 != -1) {
      dispatch_once(&qword_100078238, v17);
    }
  }

  else
  {
    objc_super v9 = (os_log_s *)qword_100078460;
    if (os_log_type_enabled((os_log_t)qword_100078460, OS_LOG_TYPE_ERROR)) {
      sub_10003C780(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (void)sendMessage:(id)a3 ofType:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v8));
    id v12 = [v9 copy];
    [v11 setObject:v12 forKeyedSubscript:@"TCCDMessageTypeKey"];

    -[TCCDMessageController _sendMessage:handler:](self, "_sendMessage:handler:", v11, v10);
  }

  else
  {
    uint64_t v13 = (os_log_s *)qword_100078460;
    if (os_log_type_enabled((os_log_t)qword_100078460, OS_LOG_TYPE_ERROR)) {
      sub_10003C7F4(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

- (void)_sendMessage:(id)a3 handler:(id)a4
{
  v4 = (os_log_s *)qword_100078460;
  if (os_log_type_enabled((os_log_t)qword_100078460, OS_LOG_TYPE_ERROR)) {
    sub_10003C868(v4);
  }
}

- (NSMutableDictionary)messageTypesToHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setMessageTypesToHandlers:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end