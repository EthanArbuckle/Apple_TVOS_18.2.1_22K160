@interface AFSiriRequest
- (id)_ad_preheatableServiceDomainForDomainSignalRequest;
- (void)_ad_handleAceDomainSignalRequestWithCompletionHandler:(id)a3;
- (void)_ad_handleAlarmRequestWithCompletionHandler:(id)a3;
- (void)_ad_handleSettingsRequestWithCompletionHandler:(id)a3;
- (void)_ad_handleShowNextEventRequestWithCompletionHandler:(id)a3;
- (void)_ad_handleStopwatchRequestWithCompletionHandler:(id)a3;
- (void)_ad_handleTimerRequestWithCompletionHandler:(id)a3;
@end

@implementation AFSiriRequest

- (void)_ad_handleSettingsRequestWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    v8 = "-[AFSiriRequest(ADSettingsRequestHandler) _ad_handleSettingsRequestWithCompletionHandler:]";
    __int16 v9 = 2112;
    v10 = self;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Settings handler asked to handle request %@, but didn't know how",  (uint8_t *)&v7,  0x16u);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (v4)
  {
LABEL_3:
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  700LL,  0LL));
    v4[2](v4, 0LL, v6);
  }

- (void)_ad_handleTimerRequestWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    v8 = "-[AFSiriRequest(ADTimerRequestHandler) _ad_handleTimerRequestWithCompletionHandler:]";
    __int16 v9 = 2112;
    v10 = self;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Timer handler asked to handle request %@, but didn't know how",  (uint8_t *)&v7,  0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  700LL,  0LL));
  v4[2](v4, 0LL, v6);
}

- (void)_ad_handleStopwatchRequestWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    v8 = "-[AFSiriRequest(ADTimerRequestHandler) _ad_handleStopwatchRequestWithCompletionHandler:]";
    __int16 v9 = 2112;
    v10 = self;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Stopwatch handler asked to handle request %@, but didn't know how",  (uint8_t *)&v7,  0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  700LL,  0LL));
  v4[2](v4, 0LL, v6);
}

- (void)_ad_handleAlarmRequestWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    v8 = "-[AFSiriRequest(ADAlarmRequestHandler) _ad_handleAlarmRequestWithCompletionHandler:]";
    __int16 v9 = 2112;
    v10 = self;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Alarm handler asked to handle request %@, but didn't know how",  (uint8_t *)&v7,  0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  700LL,  0LL));
  v4[2](v4, 0LL, v6);
}

- (void)_ad_handleShowNextEventRequestWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    v8 = "-[AFSiriRequest(ADShowNextEventRequestHandler) _ad_handleShowNextEventRequestWithCompletionHandler:]";
    __int16 v9 = 2112;
    v10 = self;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Show next event handler asked to handle request %@, but didn't know how",  (uint8_t *)&v7,  0x16u);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (v4)
  {
LABEL_3:
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  700LL,  0LL));
    v4[2](v4, 0LL, v6);
  }

- (void)_ad_handleAceDomainSignalRequestWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    v8 = "-[AFSiriRequest(ADAceDomainSignalRequestHandler) _ad_handleAceDomainSignalRequestWithCompletionHandler:]";
    __int16 v9 = 2112;
    v10 = self;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s ACE domain signal request handler asked to handle request %@, but didn't know how",  (uint8_t *)&v7,  0x16u);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (v4)
  {
LABEL_3:
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  700LL,  0LL));
    v4[2](v4, 0LL, v6);
  }

- (id)_ad_preheatableServiceDomainForDomainSignalRequest
{
  return 0LL;
}

@end