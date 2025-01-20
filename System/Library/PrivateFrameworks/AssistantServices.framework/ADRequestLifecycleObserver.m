@interface ADRequestLifecycleObserver
+ (id)sharedObserver;
- (ADRequestLifecycleObserver)init;
- (void)_addListener:(id)a3;
- (void)_enumerateListenersUsingBlock:(id)a3;
- (void)_handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
- (void)_removeListener:(id)a3;
- (void)addListener:(id)a3;
- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
- (void)removeListener:(id)a3;
- (void)requestDidEndWithInfo:(id)a3 fromOrigin:(int64_t)a4 client:(id)a5;
- (void)requestWasCancelledWithInfo:(id)a3 forReason:(int64_t)a4 origin:(int64_t)a5 client:(id)a6 successorInfo:(id)a7;
- (void)requestWillBeginWithInfo:(id)a3 fromOrigin:(int64_t)a4 client:(id)a5;
@end

@implementation ADRequestLifecycleObserver

- (ADRequestLifecycleObserver)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ADRequestLifecycleObserver;
  v2 = -[ADRequestLifecycleObserver init](&v13, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_DEFAULT, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.assistant.request-lifecycle-observer", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v2->_listenersLock._os_unfair_lock_opaque = 0;
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    listeners = v2->_listeners;
    v2->_listeners = (NSHashTable *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ADCompanionService sharedInstance](&OBJC_CLASS___ADCompanionService, "sharedInstance"));
    [v11 setMessageHandler:v2 forMessageType:@"requestlifecycle"];
  }

  return v2;
}

- (void)addListener:(id)a3
{
}

- (void)removeListener:(id)a3
{
}

- (void)requestWillBeginWithInfo:(id)a3 fromOrigin:(int64_t)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v26 = "-[ADRequestLifecycleObserver requestWillBeginWithInfo:fromOrigin:client:]";
    __int16 v27 = 2048;
    int64_t v28 = a4;
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    id v32 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s origin = %ld client = %@ requestInfo = %@",  buf,  0x2Au);
  }

  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_1001FEA80;
  v18 = &unk_1004F63C0;
  v19 = self;
  id v11 = v8;
  id v20 = v11;
  int64_t v22 = a4;
  id v12 = v9;
  id v21 = v12;
  -[ADRequestLifecycleObserver _enumerateListenersUsingBlock:](self, "_enumerateListenersUsingBlock:", &v15);
  if (a4 == 5)
  {
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue( +[ADCompanionService sharedInstance]( &OBJC_CLASS___ADCompanionService,  "sharedInstance",  v15,  v16,  v17,  v18,  v19,  v20));
    v23 = @"event";
    v24 = @"requestWillBegin";
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    [v13 sendStereoPartnerMessage:v14 messageType:@"requestlifecycle" completion:&stru_1004F6400];
  }
}

- (void)requestWasCancelledWithInfo:(id)a3 forReason:(int64_t)a4 origin:(int64_t)a5 client:(id)a6 successorInfo:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v15 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v34 = "-[ADRequestLifecycleObserver requestWasCancelledWithInfo:forReason:origin:client:successorInfo:]";
    __int16 v35 = 2048;
    int64_t v36 = a5;
    __int16 v37 = 2112;
    id v38 = v13;
    __int16 v39 = 2112;
    id v40 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s origin = %ld client = %@ requestInfo = %@",  buf,  0x2Au);
  }

  id v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472LL;
  v23 = sub_1001FEA28;
  v24 = &unk_1004F6428;
  v25 = self;
  id v16 = v12;
  id v26 = v16;
  int64_t v29 = a4;
  int64_t v30 = a5;
  id v17 = v13;
  id v27 = v17;
  id v18 = v14;
  id v28 = v18;
  -[ADRequestLifecycleObserver _enumerateListenersUsingBlock:](self, "_enumerateListenersUsingBlock:", &v21);
  if (a5 == 5)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[ADCompanionService sharedInstance]( &OBJC_CLASS___ADCompanionService,  "sharedInstance",  v21,  v22,  v23,  v24,  v25,  v26,  v27));
    __int16 v31 = @"event";
    id v32 = @"requestWasCancelled";
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
    [v19 sendStereoPartnerMessage:v20 messageType:@"requestlifecycle" completion:&stru_1004F6448];
  }
}

- (void)requestDidEndWithInfo:(id)a3 fromOrigin:(int64_t)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    id v26 = "-[ADRequestLifecycleObserver requestDidEndWithInfo:fromOrigin:client:]";
    __int16 v27 = 2048;
    int64_t v28 = a4;
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    id v32 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s origin = %ld client = %@ requestInfo = %@",  buf,  0x2Au);
  }

  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_1001FE9D4;
  id v18 = &unk_1004F63C0;
  v19 = self;
  id v11 = v8;
  id v20 = v11;
  int64_t v22 = a4;
  id v12 = v9;
  id v21 = v12;
  -[ADRequestLifecycleObserver _enumerateListenersUsingBlock:](self, "_enumerateListenersUsingBlock:", &v15);
  if (a4 == 5)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[ADCompanionService sharedInstance]( &OBJC_CLASS___ADCompanionService,  "sharedInstance",  v15,  v16,  v17,  v18,  v19,  v20));
    v23 = @"event";
    v24 = @"requestDidEnd";
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    [v13 sendStereoPartnerMessage:v14 messageType:@"requestlifecycle" completion:&stru_1004F6468];
  }
}

- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001FE9C0;
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
  dispatch_async(queue, block);
}

- (void)_handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, uint64_t))a6;
  id v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315650;
    v19 = "-[ADRequestLifecycleObserver _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s deviceIdentifier = %@, messageType = %@",  (uint8_t *)&v18,  0x20u);
  }

  if ([v11 isEqualToString:@"requestlifecycle"])
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"event"]);
    if ([v15 isEqualToString:@"requestWillBegin"])
    {
      -[ADRequestLifecycleObserver requestWillBeginWithInfo:fromOrigin:client:]( self,  "requestWillBeginWithInfo:fromOrigin:client:",  0LL,  7LL,  0LL);
    }

    else if ([v15 isEqualToString:@"requestDidEnd"])
    {
      -[ADRequestLifecycleObserver requestDidEndWithInfo:fromOrigin:client:]( self,  "requestDidEndWithInfo:fromOrigin:client:",  0LL,  7LL,  0LL);
    }

    else if ([v15 isEqualToString:@"requestWasCancelled"])
    {
      -[ADRequestLifecycleObserver requestWasCancelledWithInfo:forReason:origin:client:successorInfo:]( self,  "requestWasCancelledWithInfo:forReason:origin:client:successorInfo:",  0LL,  0LL,  7LL,  0LL,  0LL);
    }

    if (!v13) {
      goto LABEL_16;
    }
    uint64_t v17 = 0LL;
LABEL_15:
    v13[2](v13, 0LL, v17);
LABEL_16:

    goto LABEL_17;
  }

  id v16 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v18 = 136315394;
    v19 = "-[ADRequestLifecycleObserver _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Received message from unknown message type: %@",  (uint8_t *)&v18,  0x16u);
    if (!v13) {
      goto LABEL_17;
    }
    goto LABEL_8;
  }

  if (v13)
  {
LABEL_8:
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 1004LL));
    id v15 = (void *)v17;
    goto LABEL_15;
  }

- (void)_addListener:(id)a3
{
  p_listenersLock = &self->_listenersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_listenersLock);
  -[NSHashTable addObject:](self->_listeners, "addObject:", v5);

  os_unfair_lock_unlock(p_listenersLock);
}

- (void)_removeListener:(id)a3
{
  if (a3)
  {
    p_listenersLock = &self->_listenersLock;
    id v5 = a3;
    os_unfair_lock_lock(p_listenersLock);
    -[NSHashTable removeObject:](self->_listeners, "removeObject:", v5);

    os_unfair_lock_unlock(p_listenersLock);
  }

- (void)_enumerateListenersUsingBlock:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    p_listenersLock = &self->_listenersLock;
    os_unfair_lock_lock(&self->_listenersLock);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable setRepresentation](self->_listeners, "setRepresentation"));
    os_unfair_lock_unlock(p_listenersLock);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001FE9B4;
    v7[3] = &unk_1004F6490;
    id v8 = v6;
    [v5 enumerateObjectsUsingBlock:v7];
  }
}

- (void).cxx_destruct
{
}

+ (id)sharedObserver
{
  if (qword_100578138 != -1) {
    dispatch_once(&qword_100578138, &stru_1004F6398);
  }
  return (id)qword_100578140;
}

@end