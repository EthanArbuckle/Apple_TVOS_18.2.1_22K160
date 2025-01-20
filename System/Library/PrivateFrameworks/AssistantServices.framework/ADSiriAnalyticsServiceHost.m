@interface ADSiriAnalyticsServiceHost
+ (id)sharedSiriAnalyticsServiceHost;
- (ADSiriAnalyticsServiceHost)init;
- (BOOL)_siriOrDictationIsEnabled;
- (id)analyticsService;
- (id)messageStream;
- (id)siriAssistantConfiguration;
- (void)deleteLegacyMetricsAffectedBySensitiveConditionsWithCompletion:(id)a3;
- (void)writeLogViewerIdentifierDefaults;
@end

@implementation ADSiriAnalyticsServiceHost

- (ADSiriAnalyticsServiceHost)init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___ADSiriAnalyticsServiceHost;
  v2 = -[ADSiriAnalyticsServiceHost init](&v20, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create(0LL, v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___ADSiriAnalyticsAssistantConfiguration);
    assistantAnalyticsConfiguration = v2->_assistantAnalyticsConfiguration;
    v2->_assistantAnalyticsConfiguration = (AssistantSiriAnalyticsConfiguration *)v9;

    v11 = -[AssistantSiriAnalyticsService initWithQueue:delegate:]( objc_alloc(&OBJC_CLASS___AssistantSiriAnalyticsService),  "initWithQueue:delegate:",  v2->_queue,  v2);
    siriAnalyticsService = v2->_siriAnalyticsService;
    v2->_siriAnalyticsService = v11;

    v13 = -[ADSiriAnalyticsGlobalDimensionMessageResolver initWithQueue:]( objc_alloc(&OBJC_CLASS___ADSiriAnalyticsGlobalDimensionMessageResolver),  "initWithQueue:",  v2->_queue);
    globalDimensionsResolver = v2->_globalDimensionsResolver;
    v2->_globalDimensionsResolver = v13;

    -[AssistantSiriAnalyticsService registerMessageResolver:]( v2->_siriAnalyticsService,  "registerMessageResolver:",  v2->_globalDimensionsResolver);
    v15 = v2->_siriAnalyticsService;
    v16 = -[ADSiriAnalyticsPhoneCallStateObserver initWithDelegate:queue:]( objc_alloc(&OBJC_CLASS___ADSiriAnalyticsPhoneCallStateObserver),  "initWithDelegate:queue:",  v15,  v2->_queue);
    -[AssistantSiriAnalyticsService registerSensitiveConditionsObserver:]( v15,  "registerSensitiveConditionsObserver:",  v16);

    v17 = v2->_siriAnalyticsService;
    v18 = -[ADSiriAnalyticsHIPAAOptInStateObserver initWithDelegate:queue:]( objc_alloc(&OBJC_CLASS___ADSiriAnalyticsHIPAAOptInStateObserver),  "initWithDelegate:queue:",  v17,  v2->_queue);
    -[AssistantSiriAnalyticsService registerSensitiveConditionsObserver:]( v17,  "registerSensitiveConditionsObserver:",  v18);
  }

  return v2;
}

- (id)analyticsService
{
  return self->_siriAnalyticsService;
}

- (id)messageStream
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedAnalytics](&OBJC_CLASS___AssistantSiriAnalytics, "sharedAnalytics"));
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 defaultMessageStream]);

  return v3;
}

- (void)writeLogViewerIdentifierDefaults
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AC198;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)_siriOrDictationIsEnabled
{
  if ((-[AssistantSiriAnalyticsConfiguration assistantEnabled]( self->_assistantAnalyticsConfiguration,  "assistantEnabled") & 1) != 0) {
    return 1;
  }
  else {
    return -[AssistantSiriAnalyticsConfiguration dictationEnabled]( self->_assistantAnalyticsConfiguration,  "dictationEnabled");
  }
}

- (id)siriAssistantConfiguration
{
  return self->_assistantAnalyticsConfiguration;
}

- (void)deleteLegacyMetricsAffectedBySensitiveConditionsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[ADSiriAnalyticsServiceHost deleteLegacyMetricsAffectedBySensitiveConditionsWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000AB504;
  v12[3] = &unk_1004FC6E0;
  id v13 = v4;
  id v6 = v4;
  dispatch_queue_t v7 = objc_retainBlock(v12);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AB5DC;
  block[3] = &unk_1004FD990;
  block[4] = self;
  id v11 = v7;
  v9 = v7;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
}

+ (id)sharedSiriAnalyticsServiceHost
{
  if (qword_100577BB8 != -1) {
    dispatch_once(&qword_100577BB8, &stru_1004EFDE8);
  }
  return (id)qword_100577BC0;
}

@end