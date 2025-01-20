@interface ADHomeAccessorySiriDataSharingLogger
- (ADHomeAccessorySiriDataSharingLogger)initWithTargetQueue:(id)a3;
- (id)logSiriDataSharingRepromptOptInStatus:(int64_t)a3 source:(int64_t)a4 reason:(id)a5;
- (void)_logSiriDataSharingPropagationAccessoryIdentifier:(id)a3 propagationEvent:(int64_t)a4 propagationReason:(id)a5 associatedLogEventIdentifier:(id)a6;
- (void)_logSiriDataSharingRepromptOptInStatus:(int64_t)a3 source:(int64_t)a4 reason:(id)a5 logEventIdentifier:(id)a6;
- (void)logSiriDataSharingPropagationAccessoryIdentifier:(id)a3 propagationEvent:(int64_t)a4 propagationReason:(id)a5 associatedLogEventIdentifier:(id)a6;
@end

@implementation ADHomeAccessorySiriDataSharingLogger

- (ADHomeAccessorySiriDataSharingLogger)initWithTargetQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADHomeAccessorySiriDataSharingLogger;
  v6 = -[ADHomeAccessorySiriDataSharingLogger init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (id)logSiriDataSharingRepromptOptInStatus:(int64_t)a3 source:(int64_t)a4 reason:(id)a5
{
  id v8 = a5;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100341130;
  block[3] = &unk_1004FCF38;
  int64_t v20 = a3;
  int64_t v21 = a4;
  block[4] = self;
  id v18 = v8;
  id v12 = v10;
  id v19 = v12;
  id v13 = v8;
  dispatch_async(queue, block);
  v14 = v19;
  id v15 = v12;

  return v15;
}

- (void)logSiriDataSharingPropagationAccessoryIdentifier:(id)a3 propagationEvent:(int64_t)a4 propagationReason:(id)a5 associatedLogEventIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10034111C;
  block[3] = &unk_1004FCF60;
  block[4] = self;
  id v18 = v10;
  id v20 = v12;
  int64_t v21 = a4;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(queue, block);
}

- (void)_logSiriDataSharingRepromptOptInStatus:(int64_t)a3 source:(int64_t)a4 reason:(id)a5 logEventIdentifier:(id)a6
{
  id v9 = a5;
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_100341040;
  id v18 = &unk_1004FCF88;
  id v10 = a6;
  id v19 = v10;
  int64_t v21 = a3;
  int64_t v22 = a4;
  id v11 = v9;
  id v20 = v11;
  id v12 = +[AFHomeAccessorySiriDataSharingChangeLogEvent newWithBuilder:]( &OBJC_CLASS___AFHomeAccessorySiriDataSharingChangeLogEvent,  "newWithBuilder:",  &v15);
  id v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[ADHomeAccessorySiriDataSharingLogger _logSiriDataSharingRepromptOptInStatus:source:reason:logEventIdentifier:]";
    __int16 v25 = 2112;
    id v26 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Logging home accessory Siri data sharing reprompt event: %@",  buf,  0x16u);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[AFPreferences sharedPreferences]( &OBJC_CLASS___AFPreferences,  "sharedPreferences",  v15,  v16,  v17,  v18));
  [v14 appendHomeAccessorySiriDataSharingChangeLogEvent:v12];
}

- (void)_logSiriDataSharingPropagationAccessoryIdentifier:(id)a3 propagationEvent:(int64_t)a4 propagationReason:(id)a5 associatedLogEventIdentifier:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  id v20 = sub_100340FB8;
  int64_t v21 = &unk_1004FCFB0;
  id v12 = v9;
  id v22 = v12;
  int64_t v25 = a4;
  id v13 = v10;
  id v23 = v13;
  id v14 = v11;
  id v24 = v14;
  id v15 = +[AFHomeAccessorySiriDataSharingPropagationLogEvent newWithBuilder:]( &OBJC_CLASS___AFHomeAccessorySiriDataSharingPropagationLogEvent,  "newWithBuilder:",  &v18);
  uint64_t v16 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[ADHomeAccessorySiriDataSharingLogger _logSiriDataSharingPropagationAccessoryIdentifier:propagationEvent:prop"
          "agationReason:associatedLogEventIdentifier:]";
    __int16 v28 = 2112;
    id v29 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Logging home accessory Siri data sharing propagation event: %@",  buf,  0x16u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[AFPreferences sharedPreferences]( &OBJC_CLASS___AFPreferences,  "sharedPreferences",  v18,  v19,  v20,  v21));
  [v17 insertHomeAccessorySiriDataSharingPropagationLogEvent:v15];
}

- (void).cxx_destruct
{
}

@end