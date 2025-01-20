@interface CSAdBlockerLogger
- (BOOL)hasLogged;
- (CSAdBlockerLogger)init;
- (OS_dispatch_queue)queue;
- (void)_logStartAdBlockerEventWithRequestMHUUID:(id)a3 withAssetVersion:(id)a4;
- (void)_logStopAdBlockerEventWithDissmissalType:(int)a3 withAdName:(id)a4 withRequestMHUUID:(id)a5 fromEndpoint:(BOOL)a6;
- (void)emitAdblockerLoggingWithDismissalType:(int)a3 withAdName:(id)a4 withAssetVersion:(id)a5 fromEndpoint:(BOOL)a6 withRequestMHUUID:(id)a7;
- (void)sendAnalyticInformation:(BOOL)a3 withAdName:(id)a4 withTimeForAdBlockerDecision:(float)a5;
- (void)setHasLogged:(BOOL)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSAdBlockerLogger

- (CSAdBlockerLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSAdBlockerLogger;
  v2 = -[CSAdBlockerLogger init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("AdBlockerLogger", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_hasLogged = 0;
  }

  return v2;
}

- (void)emitAdblockerLoggingWithDismissalType:(int)a3 withAdName:(id)a4 withAssetVersion:(id)a5 fromEndpoint:(BOOL)a6 withRequestMHUUID:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005A80;
  block[3] = &unk_100229F08;
  block[4] = self;
  id v20 = v14;
  id v21 = v12;
  id v22 = v13;
  BOOL v24 = a6;
  int v23 = a3;
  id v16 = v13;
  id v17 = v12;
  id v18 = v14;
  dispatch_async(queue, block);
}

- (void)_logStartAdBlockerEventWithRequestMHUUID:(id)a3 withAssetVersion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v12 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHAdMatchingStarted);
  [v12 setModelVersion:v5];

  id v7 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHVoiceAdBlockerContext);
  [v7 setStartedOrChanged:v12];
  id v8 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEvent);
  id v9 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEventMetadata);
  id v10 = [[SISchemaUUID alloc] initWithNSUUID:v6];

  [v9 setMhId:v10];
  [v8 setAdblockerContext:v7];
  [v8 setEventMetadata:v9];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v11 emitMessage:v8];
}

- (void)_logStopAdBlockerEventWithDissmissalType:(int)a3 withAdName:(id)a4 withRequestMHUUID:(id)a5 fromEndpoint:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a3;
  id v17 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHAdMatchingEnded);
  [v10 setAdBlockerDismissalType:v8];
  if (v17) {
    [v10 setAdName:v17];
  }
  if (v6) {
    uint64_t v11 = 2LL;
  }
  else {
    uint64_t v11 = 1LL;
  }
  [v10 setAdBlockerSource:v11];
  id v12 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHVoiceAdBlockerContext);
  [v12 setEnded:v10];
  id v13 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEvent);
  id v14 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEventMetadata);
  id v15 = [[SISchemaUUID alloc] initWithNSUUID:v9];

  [v14 setMhId:v15];
  [v13 setAdblockerContext:v12];
  [v13 setEventMetadata:v14];
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v16 emitMessage:v13];
}

- (void)sendAnalyticInformation:(BOOL)a3 withAdName:(id)a4 withTimeForAdBlockerDecision:(float)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000059A4;
  v7[3] = &unk_100229F30;
  BOOL v10 = a3;
  id v8 = a4;
  float v9 = a5;
  id v6 = v8;
  AnalyticsSendEventLazy(@"com.apple.corespeech.ondeviceadblocker", v7);
}

- (BOOL)hasLogged
{
  return self->_hasLogged;
}

- (void)setHasLogged:(BOOL)a3
{
  self->_hasLogged = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end