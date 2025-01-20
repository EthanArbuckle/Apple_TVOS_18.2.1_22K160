@interface ADSecurityService
+ (id)sharedService;
- (ADSecurityService)init;
- (void)_accountDidChange:(id)a3;
- (void)_dispatchCallbackForProcessedData:(id)a3 error:(id)a4 completion:(id)a5;
- (void)_dispatchCallbackForProcessedDataMap:(id)a3 errorMap:(id)a4 completion:(id)a5;
- (void)_retrieveKeyAndSaltWithCompletion:(id)a3;
- (void)processData:(id)a3 usingProcedure:(int64_t)a4 completion:(id)a5;
- (void)processDataMap:(id)a3 usingProcedure:(int64_t)a4 completion:(id)a5;
- (void)setKeychainValue:(id)a3 forKey:(id)a4 accountIdentifier:(id)a5 completion:(id)a6;
@end

@implementation ADSecurityService

- (ADSecurityService)init
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___ADSecurityService;
  v2 = -[ADSecurityService init](&v30, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.assistant.security.service.procedure", v4);

    procedureQueue = v2->_procedureQueue;
    v2->_procedureQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.assistant.security.service.keychain", v8);

    keychainQueue = v2->_keychainQueue;
    v2->_keychainQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.assistant.security.service.callback", v12);

    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v13;

    uint64_t RandomData = AFSecurityGenerateRandomData(1024LL, 0LL);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(RandomData);
    inMemorySalt = v2->_inMemorySalt;
    v2->_inMemorySalt = (NSData *)v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v18 addObserver:v2 selector:"_accountDidChange:" name:@"ADActiveAccountIdentifierDidChangeNotification" object:0];

    v19 = v2->_procedureQueue;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[ADQueueMonitor sharedMonitor](&OBJC_CLASS___ADQueueMonitor, "sharedMonitor"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10019A4B8;
    v28[3] = &unk_1004FBBD0;
    v29 = v19;
    v21 = v19;
    [v20 addQueue:v21 heartBeatInterval:v28 timeoutInterval:5.0 timeoutHandler:5.0];

    v22 = v2->_keychainQueue;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[ADQueueMonitor sharedMonitor](&OBJC_CLASS___ADQueueMonitor, "sharedMonitor"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10019A5D0;
    v26[3] = &unk_1004FBBD0;
    v27 = v22;
    v24 = v22;
    [v23 addQueue:v24 heartBeatInterval:v26 timeoutInterval:5.0 timeoutHandler:5.0];
  }

  return v2;
}

- (void)processData:(id)a3 usingProcedure:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    if (v8)
    {
      procedureQueue = (dispatch_queue_s *)self->_procedureQueue;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_10019A088;
      v12[3] = &unk_1004FBA38;
      int64_t v16 = a4;
      id v13 = v8;
      v14 = self;
      id v15 = v9;
      dispatch_async(procedureQueue, v12);
    }

    else
    {
      dispatch_queue_attr_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 1603LL));
      -[ADSecurityService _dispatchCallbackForProcessedData:error:completion:]( self,  "_dispatchCallbackForProcessedData:error:completion:",  0LL,  v11,  v9);
    }
  }
}

- (void)processDataMap:(id)a3 usingProcedure:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    if (v8)
    {
      procedureQueue = (dispatch_queue_s *)self->_procedureQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001996C8;
      block[3] = &unk_1004FBA38;
      int64_t v17 = a4;
      id v14 = v8;
      id v15 = self;
      id v16 = v9;
      dispatch_async(procedureQueue, block);

      dispatch_queue_attr_t v11 = v14;
    }

    else
    {
      v18 = @"error";
      dispatch_queue_attr_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 1603LL));
      v19 = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
      -[ADSecurityService _dispatchCallbackForProcessedDataMap:errorMap:completion:]( self,  "_dispatchCallbackForProcessedDataMap:errorMap:completion:",  0LL,  v12,  v9);
    }
  }
}

- (void)setKeychainValue:(id)a3 forKey:(id)a4 accountIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001995C4;
  block[3] = &unk_1004FCBB0;
  id v20 = v10;
  id v21 = v12;
  v23 = self;
  id v24 = v13;
  id v22 = v11;
  id v15 = v13;
  id v16 = v11;
  id v17 = v12;
  id v18 = v10;
  dispatch_async(keychainQueue, block);
}

- (void)_dispatchCallbackForProcessedData:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    callbackQueue = (dispatch_queue_s *)self->_callbackQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001995B0;
    block[3] = &unk_1004FD9E0;
    id v16 = v10;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(callbackQueue, block);
  }
}

- (void)_dispatchCallbackForProcessedDataMap:(id)a3 errorMap:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    callbackQueue = (dispatch_queue_s *)self->_callbackQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10019959C;
    block[3] = &unk_1004FD9E0;
    id v16 = v10;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(callbackQueue, block);
  }
}

- (void)_retrieveKeyAndSaltWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 _queue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100199414;
    block[3] = &unk_1004FD9E0;
    id v9 = v5;
    id v10 = self;
    id v11 = v4;
    id v7 = v5;
    dispatch_async(v6, block);
  }
}

- (void)_accountDidChange:(id)a3
{
  dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    v6 = "-[ADSecurityService _accountDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }

  notify_post(AFSecurityEncryptionKeyDidChangeNotification);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 postNotificationName:@"ADSecurityServiceEncryptionKeyDidChangeNotification" object:0];
}

- (void).cxx_destruct
{
}

+ (id)sharedService
{
  if (qword_100578008 != -1) {
    dispatch_once(&qword_100578008, &stru_1004F44C8);
  }
  return (id)qword_100578010;
}

@end