@interface ADClientLite
- (ADClientLite)initWithListener:(id)a3 connection:(id)a4;
- (void)adRequestDidReceiveCommand:(id)a3 reply:(id)a4;
- (void)handleRemoteCommand:(id)a3 afterCurrentRequest:(BOOL)a4 isOneWay:(BOOL)a5 completion:(id)a6;
@end

@implementation ADClientLite

- (ADClientLite)initWithListener:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ADClientLite;
  v8 = -[ADClientLite init](&v16, "init");
  if (v8)
  {
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create(0LL, v10);

    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v11;

    dispatch_group_t v13 = dispatch_group_create();
    outstandingCommandGroup = v8->_outstandingCommandGroup;
    v8->_outstandingCommandGroup = (OS_dispatch_group *)v13;

    objc_storeWeak((id *)&v8->_listener, v6);
    objc_storeWeak((id *)&v8->_connection, v7);
  }

  return v8;
}

- (void)handleRemoteCommand:(id)a3 afterCurrentRequest:(BOOL)a4 isOneWay:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v13 = [v12 assistantIsEnabled];

  v14 = (os_log_s *)AFSiriLogContextDaemon;
  if ((v13 & 1) != 0)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      v52 = "-[ADClientLite handleRemoteCommand:afterCurrentRequest:isOneWay:completion:]";
      __int16 v53 = 2112;
      id v54 = v10;
      __int16 v55 = 1024;
      BOOL v56 = v8;
      __int16 v57 = 1024;
      BOOL v58 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s command = %@, afterCurrent = %d, isOneWay = %d",  buf,  0x22u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v15 acquireShutdownAssertion]);

    v17 = self->_queue;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_1001509D8;
    v47[3] = &unk_1004F2F88;
    v47[4] = self;
    BOOL v31 = v7;
    v18 = v17;
    v48 = v18;
    id v50 = v11;
    id v19 = v16;
    id v49 = v19;
    v20 = objc_retainBlock(v47);
    id v21 = objc_alloc(&OBJC_CLASS___AFThreeArgumentSafetyBlock);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_100150AE0;
    v45[3] = &unk_1004F2FB0;
    v22 = v20;
    id v46 = v22;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_100150B5C;
    v40[3] = &unk_1004FC250;
    id v23 = [v21 initWithBlock:v45];
    id v41 = v23;
    v42 = self;
    id v32 = v10;
    id v24 = v10;
    id v43 = v24;
    BOOL v44 = v8;
    v25 = objc_retainBlock(v40);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100150C30;
    v33[3] = &unk_1004F3000;
    v26 = v18;
    v34 = v26;
    BOOL v38 = v8;
    BOOL v39 = v31;
    id v35 = v24;
    v36 = self;
    id v37 = v23;
    id v27 = v23;
    v28 = objc_retainBlock(v33);
    v29 = v28;
    if (v8)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
      [WeakRetained doClientWork:v29 withTimeoutBlock:v25];
    }

    else
    {
      ((void (*)(void *))v28[2])(v28);
    }

    id v10 = v32;
  }

  else
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v52 = "-[ADClientLite handleRemoteCommand:afterCurrentRequest:isOneWay:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Rejecting ClientLite command because Siri is disabled",  buf,  0xCu);
    }

    id v19 = (id)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 18LL));
    (*((void (**)(id, void, id))v11 + 2))(v11, 0LL, v19);
  }
}

- (void)adRequestDidReceiveCommand:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = self->_outstandingCommandGroup;
  dispatch_group_enter((dispatch_group_t)v8);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1001507DC;
  v18[3] = &unk_1004F3028;
  id v19 = v8;
  id v20 = v7;
  id v9 = v7;
  id v10 = v8;
  id v11 = objc_retainBlock(v18);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015082C;
  block[3] = &unk_1004FD9E0;
  id v16 = v6;
  id v17 = v11;
  block[4] = self;
  id v13 = v6;
  v14 = v11;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
}

@end