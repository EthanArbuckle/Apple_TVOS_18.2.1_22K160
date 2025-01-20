@interface SABaseClientBoundCommand
- (BOOL)ad_hasCallbacks;
- (BOOL)ad_requiresResponse;
- (id)_ad_aceSettingsResponseCommandRepresentationForSiriResponse:(id)a3;
- (id)_ad_alarmResponseForResponse:(id)a3;
- (id)_ad_preheatableDomain;
- (id)_ad_replyCommandValue;
- (id)_ad_settingsRequestRepresentation;
- (id)_ad_timerRequestRepresentation;
- (id)_ad_timerResponseForResponse:(id)a3;
- (id)_ad_transformedHealthSuccessResponse;
- (id)_ad_transformedMailSuccessResponse;
- (id)_ad_transformedMapsRequest;
- (id)_ad_transformedMapsSuccessResponse;
- (id)_ad_transformedSendEmailRequest;
- (id)_ad_transformedShowActivityRequest;
- (id)_ad_transformedWorkoutRequest;
- (id)_ad_transformedWorkoutSuccessResponse;
- (id)ad_OTTRequestRepresentation;
- (id)ad_aceResponseCommandGenericErrorRepresentation;
- (id)ad_aceResponseCommandRepresentationWithErrorCode:(int64_t)a3 reason:(id)a4;
- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3;
- (void)_ad_getMessagesRequestValueWithCompletionHandler:(id)a3;
- (void)_ad_getOTTRepresentationWithCompletionHandler:(id)a3;
- (void)_ad_handleAceDomainSignalRequest:(id)a3 completionHandler:(id)a4;
- (void)_ad_handleAppLaunchCommandWithRequest:(id)a3 completion:(id)a4;
@end

@implementation SABaseClientBoundCommand

- (id)_ad_timerRequestRepresentation
{
  return 0LL;
}

- (id)_ad_timerResponseForResponse:(id)a3
{
  return objc_alloc_init(&OBJC_CLASS___SACommandFailed);
}

- (id)_ad_transformedShowActivityRequest
{
  return 0LL;
}

- (id)_ad_transformedHealthSuccessResponse
{
  return 0LL;
}

- (id)_ad_transformedSendEmailRequest
{
  return 0LL;
}

- (id)_ad_transformedMailSuccessResponse
{
  return 0LL;
}

- (id)_ad_transformedMapsRequest
{
  return 0LL;
}

- (id)_ad_transformedMapsSuccessResponse
{
  return 0LL;
}

- (void)_ad_handleAppLaunchCommandWithRequest:(id)a3 completion:(id)a4
{
  if (a4)
  {
    uint64_t v5 = kAFAssistantErrorDomain;
    id v6 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v5,  700LL,  0LL));
    (*((void (**)(id, void, void, id))a4 + 2))(v6, 0LL, 0LL, v7);
  }

- (void)_ad_getMessagesRequestValueWithCompletionHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0LL);
  }
}

- (id)_ad_replyCommandValue
{
  return 0LL;
}

- (id)_ad_transformedWorkoutRequest
{
  return 0LL;
}

- (id)_ad_transformedWorkoutSuccessResponse
{
  return 0LL;
}

- (id)_ad_settingsRequestRepresentation
{
  v3 = objc_alloc(&OBJC_CLASS___NSException);
  v4 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Unable to generate settings request representation for %@",  self);
  uint64_t v5 =  -[NSException initWithName:reason:userInfo:]( v3,  "initWithName:reason:userInfo:",  NSInternalInconsistencyException,  v4,  0LL);

  objc_exception_throw(v5);
  return -[SABaseClientBoundCommand _ad_aceSettingsResponseCommandRepresentationForSiriResponse:](v6, v7, v8);
}

- (id)_ad_aceSettingsResponseCommandRepresentationForSiriResponse:(id)a3
{
  return 0LL;
}

- (BOOL)ad_hasCallbacks
{
  return -[SABaseClientBoundCommand hasArrayForPropertyForKey:]( self,  "hasArrayForPropertyForKey:",  SABaseClientBoundCommandCallbacksPListKey);
}

- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3
{
}

- (id)_ad_alarmResponseForResponse:(id)a3
{
  return 0LL;
}

- (id)ad_aceResponseCommandRepresentationWithErrorCode:(int64_t)a3 reason:(id)a4
{
  id v6 = a4;
  SEL v7 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SABaseClientBoundCommand aceId](self, "aceId"));
  -[SACommandFailed setRefId:](v7, "setRefId:", v8);

  -[SACommandFailed setErrorCode:](v7, "setErrorCode:", a3);
  -[SACommandFailed setReason:](v7, "setReason:", v6);

  return v7;
}

- (id)ad_aceResponseCommandGenericErrorRepresentation
{
  return -[SABaseClientBoundCommand ad_aceResponseCommandRepresentationWithErrorCode:reason:]( self,  "ad_aceResponseCommandRepresentationWithErrorCode:reason:",  SAGenericErrorErrorCode,  0LL);
}

- (void)_ad_handleAceDomainSignalRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  SEL v7 = (void (**)(id, void, void *))a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v10 = 136315394;
    v11 = "-[SABaseClientBoundCommand(ADAceDomainSignalRequestHandler) _ad_handleAceDomainSignalRequest:completionHandler:]";
    __int16 v12 = 2112;
    v13 = self;
    _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s ACE domain signal request handler asked to handle request %@, but didn't know how",  (uint8_t *)&v10,  0x16u);
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (v7)
  {
LABEL_3:
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  700LL,  0LL));
    v7[2](v7, 0LL, v9);
  }

- (id)_ad_preheatableDomain
{
  return 0LL;
}

- (id)ad_OTTRequestRepresentation
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[SABaseClientBoundCommand(ADMessageTransformer) ad_OTTRequestRepresentation]";
    __int16 v7 = 2112;
    id v8 = self;
    _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s No OTT-request representation for %@",  (uint8_t *)&v5,  0x16u);
  }

  return 0LL;
}

- (void)_ad_getOTTRepresentationWithCompletionHandler:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SABaseClientBoundCommand ad_OTTRequestRepresentation](self, "ad_OTTRequestRepresentation"));
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }

- (BOOL)ad_requiresResponse
{
  return -[SABaseClientBoundCommand requiresResponse](self, "requiresResponse");
}

@end