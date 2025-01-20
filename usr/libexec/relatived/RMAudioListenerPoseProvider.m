@interface RMAudioListenerPoseProvider
- (OS_dispatch_queue)receiverQueue;
- (RMAudioListenerPoseProvider)initWithConfiguration:(id)a3 receiverQueue:(id)a4;
- (RMAudioListenerPoseProviderConfiguration)configuration;
- (id)startProducingDataWithCallback:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setReceiverQueue:(id)a3;
- (void)stopProducingData;
@end

@implementation RMAudioListenerPoseProvider

- (RMAudioListenerPoseProvider)initWithConfiguration:(id)a3 receiverQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RMAudioListenerPoseProvider;
  v8 = -[RMAudioListenerPoseProvider init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[RMAudioListenerPoseProvider setConfiguration:](v8, "setConfiguration:", v6);
    -[RMAudioListenerPoseProvider setReceiverQueue:](v9, "setReceiverQueue:", v7);
    atomic_store(0, (unsigned __int8 *)&v9->isRunning);
  }

  return v9;
}

- (id)startProducingDataWithCallback:(id)a3
{
  id v4 = a3;
  if (qword_100023970 != -1) {
    dispatch_once(&qword_100023970, &stru_10001C918);
  }
  v5 = (os_log_s *)qword_100023978;
  if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134283521;
    v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "startProducingData: %{private}p", buf, 0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioListenerPoseProvider configuration](self, "configuration"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 tempestOptions]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioListenerPoseProvider configuration](self, "configuration"));
  id v9 = [v8 forceSessionRestart];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMAudioListenerPoseEngine sharedInstance](&OBJC_CLASS___RMAudioListenerPoseEngine, "sharedInstance"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000077B8;
  v14[3] = &unk_10001C8F8;
  v14[4] = self;
  id v15 = v4;
  id v11 = v4;
  v12 = (void *)objc_claimAutoreleasedReturnValue( [v10 startProducingDataForObject:self tempestOptions:v7 forceSessionRestart:v9 callback:v14]);

  if (!v12) {
    atomic_store(1u, (unsigned __int8 *)&self->isRunning);
  }

  return v12;
}

- (void)stopProducingData
{
  if (qword_100023970 != -1) {
    dispatch_once(&qword_100023970, &stru_10001C918);
  }
  v3 = (os_log_s *)qword_100023978;
  if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134283521;
    id v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "stopProducingData: %{private}p",  (uint8_t *)&v5,  0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[RMAudioListenerPoseEngine sharedInstance](&OBJC_CLASS___RMAudioListenerPoseEngine, "sharedInstance"));
  [v4 stopProducingDataForObject:self];

  atomic_store(0, (unsigned __int8 *)&self->isRunning);
}

- (OS_dispatch_queue)receiverQueue
{
  return self->_receiverQueue;
}

- (void)setReceiverQueue:(id)a3
{
}

- (RMAudioListenerPoseProviderConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end