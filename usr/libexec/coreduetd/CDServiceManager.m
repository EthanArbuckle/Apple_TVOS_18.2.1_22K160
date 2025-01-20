@interface CDServiceManager
+ (id)sharedInstance;
- (CDKnowledgeDaemon)knowledgeDaemon;
- (CDPeopleDaemon)peopleDaemon;
- (CDServiceManager)init;
- (void)setupServices;
@end

@implementation CDServiceManager

+ (id)sharedInstance
{
  if (qword_100022648 != -1) {
    dispatch_once(&qword_100022648, &stru_10001C5A0);
  }
  return (id)qword_100022640;
}

- (CDServiceManager)init
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeSignpost](&OBJC_CLASS____CDLogging, "knowledgeSignpost"));
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v3,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "CDServiceManagerInit",  " enableTelemetry=YES ",  buf,  2u);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CDServiceManager;
  v4 = -[CDServiceManager init](&v9, "init");
  if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[CDKnowledgeDaemon defaultDaemon](&OBJC_CLASS___CDKnowledgeDaemon, "defaultDaemon"));
    knowledgeDaemon = v4->_knowledgeDaemon;
    v4->_knowledgeDaemon = (CDKnowledgeDaemon *)v5;

    -[CDServiceManager setupServices](v4, "setupServices");
  }

  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeSignpost](&OBJC_CLASS____CDLogging, "knowledgeSignpost"));
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "CDServiceManagerInit",  (const char *)&unk_1000164A2,  buf,  2u);
  }

  return v4;
}

- (void)setupServices
{
  BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v2) {
    sub_100011508(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, &stru_10001C5E0);
  BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v10) {
    sub_1000114D0(v10, v11, v12, v13, v14, v15, v16, v17);
  }
  xpc_set_event_stream_handler("com.apple.distnoted.matching", &_dispatch_main_q, &stru_10001C600);
}

- (CDKnowledgeDaemon)knowledgeDaemon
{
  return self->_knowledgeDaemon;
}

- (CDPeopleDaemon)peopleDaemon
{
  return self->_peopleDaemon;
}

- (void).cxx_destruct
{
}

@end