@interface ADAnnouncementRequest
- (ADAnnouncementRequest)initWithAnnouncementRequestType:(unint64_t)a3 platform:(int64_t)a4 completion:(id)a5;
- (ADAnnouncementRequest)initWithRemoteAnnouncement:(id)a3 completion:(id)a4;
- (AFRequestInfo)requestInfo;
- (BOOL)requestSupportsBargeIn;
- (BOOL)requestWasInterrupted;
- (BOOL)requiresOpportuneTime;
- (BOOL)shouldSkipTriggerlessReply;
- (NSDate)timeOfRequestArrival;
- (NSUUID)announcementIdentifier;
- (SAStartLocalRequest)startLocalRequest;
- (id)_initWithAnnouncementRequestType:(unint64_t)a3 platform:(int64_t)a4 announcementIdentifier:(id)a5 timeOfRequestArrival:(id)a6 startLocalRequest:(id)a7 completion:(id)a8;
- (id)completion;
- (int64_t)platform;
- (unint64_t)requestType;
- (void)completeRequestWithSuccess:(BOOL)a3 forReason:(int64_t)a4 shouldEmitInstrumentationEvent:(BOOL)a5;
- (void)dealloc;
- (void)setCompletion:(id)a3;
- (void)setPlatform:(int64_t)a3;
- (void)setRequestInfo:(id)a3;
- (void)setRequestSupportsBargeIn:(BOOL)a3;
- (void)setRequestType:(unint64_t)a3;
- (void)setRequestWasInterrupted:(BOOL)a3;
- (void)setRequiresOpportuneTime:(BOOL)a3;
- (void)setShouldSkipTriggerlessReply:(BOOL)a3;
- (void)setStartLocalRequest:(id)a3;
@end

@implementation ADAnnouncementRequest

- (id)_initWithAnnouncementRequestType:(unint64_t)a3 platform:(int64_t)a4 announcementIdentifier:(id)a5 timeOfRequestArrival:(id)a6 startLocalRequest:(id)a7 completion:(id)a8
{
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___ADAnnouncementRequest;
  v17 = -[ADAnnouncementRequest init](&v25, "init");
  v18 = v17;
  if (v17)
  {
    v17->_requestType = a3;
    id v19 = [v16 copy];
    id completion = v18->_completion;
    v18->_id completion = v19;

    v18->_platform = a4;
    objc_storeStrong((id *)&v18->_announcementIdentifier, a5);
    uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    timeOfRequestArrival = v18->_timeOfRequestArrival;
    v18->_timeOfRequestArrival = (NSDate *)v21;

    objc_storeStrong((id *)&v18->_startLocalRequest, a7);
    v18->_requiresOpportuneTime = 0;
    v23 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[ADAnnouncementRequest _initWithAnnouncementRequestType:platform:announcementIdentifier:timeOfRequestArriva"
            "l:startLocalRequest:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%s Going to skip Opportune Speaking Module since the platform is not headphones",  buf,  0xCu);
    }

    v18->_shouldSkipTriggerlessReply = a4 != 1;
  }

  return v18;
}

- (ADAnnouncementRequest)initWithAnnouncementRequestType:(unint64_t)a3 platform:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v11 = -[ADAnnouncementRequest _initWithAnnouncementRequestType:platform:announcementIdentifier:timeOfRequestArrival:startLocalRequest:completion:]( self,  "_initWithAnnouncementRequestType:platform:announcementIdentifier:timeOfRequestArrival:startLocalRequest:completion:",  a3,  a4,  v9,  v10,  0LL,  v8);

  return v11;
}

- (ADAnnouncementRequest)initWithRemoteAnnouncement:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 announcementPlatform]);
  uint64_t v9 = [v8 unsignedIntValue];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 announcementType]);
  uint64_t v11 = [v10 unsignedIntValue];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 startLocalRequest]);
  v13 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 announcementIdentifier]);

  id v15 = -[NSUUID initWithUUIDString:](v13, "initWithUUIDString:", v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v17 = -[ADAnnouncementRequest _initWithAnnouncementRequestType:platform:announcementIdentifier:timeOfRequestArrival:startLocalRequest:completion:]( self,  "_initWithAnnouncementRequestType:platform:announcementIdentifier:timeOfRequestArrival:startLocalRequest:completion:",  v11,  v9,  v15,  v16,  v12,  v6);

  return v17;
}

- (void)completeRequestWithSuccess:(BOOL)a3 forReason:(int64_t)a4 shouldEmitInstrumentationEvent:(BOOL)a5
{
  id completion = (void (**)(id, BOOL, BOOL, int64_t))self->_completion;
  if (completion)
  {
    BOOL v7 = a3;
    if (a5)
    {
      +[ADExternalNotificationInstrumentationEmitter emitCoreAnalyticsEventForAnnouncementRequest:completionReason:]( &OBJC_CLASS___ADExternalNotificationInstrumentationEmitter,  "emitCoreAnalyticsEventForAnnouncementRequest:completionReason:",  self,  a4);
      id completion = (void (**)(id, BOOL, BOOL, int64_t))self->_completion;
    }

    completion[2](completion, v7, a3, a4);
    id v8 = self->_completion;
    self->_id completion = 0LL;
  }

- (void)dealloc
{
  if (self->_completion)
  {
    +[ADExternalNotificationInstrumentationEmitter emitCoreAnalyticsEventForAnnouncementRequest:completionReason:]( &OBJC_CLASS___ADExternalNotificationInstrumentationEmitter,  "emitCoreAnalyticsEventForAnnouncementRequest:completionReason:",  self,  0LL);
    v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      id v6 = "-[ADAnnouncementRequest dealloc]";
      __int16 v7 = 2112;
      id v8 = self;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "%s Dealloc before completion called for announce request: %@",  buf,  0x16u);
    }

    (*((void (**)(void))self->_completion + 2))();
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ADAnnouncementRequest;
  -[ADAnnouncementRequest dealloc](&v4, "dealloc");
}

- (NSUUID)announcementIdentifier
{
  return self->_announcementIdentifier;
}

- (AFRequestInfo)requestInfo
{
  return self->_requestInfo;
}

- (void)setRequestInfo:(id)a3
{
}

- (BOOL)requestWasInterrupted
{
  return self->_requestWasInterrupted;
}

- (void)setRequestWasInterrupted:(BOOL)a3
{
  self->_requestWasInterrupted = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (int64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(int64_t)a3
{
  self->_platform = a3;
}

- (NSDate)timeOfRequestArrival
{
  return self->_timeOfRequestArrival;
}

- (BOOL)shouldSkipTriggerlessReply
{
  return self->_shouldSkipTriggerlessReply;
}

- (void)setShouldSkipTriggerlessReply:(BOOL)a3
{
  self->_shouldSkipTriggerlessReply = a3;
}

- (BOOL)requiresOpportuneTime
{
  return self->_requiresOpportuneTime;
}

- (void)setRequiresOpportuneTime:(BOOL)a3
{
  self->_requiresOpportuneTime = a3;
}

- (SAStartLocalRequest)startLocalRequest
{
  return self->_startLocalRequest;
}

- (void)setStartLocalRequest:(id)a3
{
}

- (BOOL)requestSupportsBargeIn
{
  return self->_requestSupportsBargeIn;
}

- (void)setRequestSupportsBargeIn:(BOOL)a3
{
  self->_requestSupportsBargeIn = a3;
}

- (void).cxx_destruct
{
}

@end