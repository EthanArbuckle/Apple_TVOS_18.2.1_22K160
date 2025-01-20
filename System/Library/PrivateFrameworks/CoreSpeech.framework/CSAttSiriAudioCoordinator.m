@interface CSAttSiriAudioCoordinator
- (BOOL)hasAudioEverStarted;
- (BOOL)shouldStopDeliverAudioOnEndpoint;
- (CSAttSiriAudioCoordinator)initWithTargetQueue:(id)a3;
- (NSHashTable)receivers;
- (OS_dispatch_queue)queue;
- (void)_handleClientDidStopIfNeeded;
- (void)addReceiver:(id)a3;
- (void)attSiriAudioSrcNodeDidStartRecording:(id)a3 successfully:(BOOL)a4 error:(id)a5;
- (void)attSiriAudioSrcNodeDidStop:(id)a3;
- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4;
- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6;
- (void)intuitiveConvAudioCaptureMonitorDidStopAudioCapture:(id)a3 stopStreamOption:(id)a4 eventUUID:(id)a5;
- (void)removeReceiver:(id)a3;
- (void)reset;
- (void)setHasAudioEverStarted:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setReceivers:(id)a3;
- (void)setShouldStopDeliverAudioOnEndpoint:(BOOL)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5;
@end

@implementation CSAttSiriAudioCoordinator

- (CSAttSiriAudioCoordinator)initWithTargetQueue:(id)a3
{
  v4 = (dispatch_queue_s *)a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CSAttSiriAudioCoordinator;
  v5 = -[CSAttSiriAudioCoordinator init](&v11, "init");
  if (v5)
  {
    if (v4) {
      dispatch_queue_t v6 = dispatch_queue_create_with_target_V2("CSAttSiriAudioCoordinator Queue", 0LL, v4);
    }
    else {
      dispatch_queue_t v6 = dispatch_queue_create("CSAttSiriAudioCoordinator queue", 0LL);
    }
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    receivers = v5->_receivers;
    v5->_receivers = (NSHashTable *)v8;

    *(_WORD *)&v5->_shouldStopDeliverAudioOnEndpoint = 0;
  }

  return v5;
}

- (void)addReceiver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003EFF0;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeReceiver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003EFE4;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)reset
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003EF2C;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)attSiriAudioSrcNodeDidStartRecording:(id)a3 successfully:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10003EDD0;
  v13[3] = &unk_10022DB78;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)attSiriAudioSrcNodeDidStop:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003EC7C;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003EB6C;
  block[3] = &unk_10022EA98;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003EAB0;
  v7[3] = &unk_10022EFA8;
  BOOL v8 = a6;
  v7[4] = self;
  dispatch_async(queue, v7);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003EAA8;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)intuitiveConvAudioCaptureMonitorDidStopAudioCapture:(id)a3 stopStreamOption:(id)a4 eventUUID:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003EAA0;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_handleClientDidStopIfNeeded
{
  if (!self->_hasAudioEverStarted)
  {
    v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v16 = "-[CSAttSiriAudioCoordinator _handleClientDidStopIfNeeded]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s Client didStop but audio coordinator didn't ever received audio started, issue attSiriAudioSrcNodeDidStop her e to let all nodes hard stop",  buf,  0xCu);
    }

    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v4 = self->_receivers;
    id v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        BOOL v8 = 0LL;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend( *(id *)(*((void *)&v10 + 1) + 8 * (void)v8),  "attSiriAudioSrcNodeDidStop:",  0,  (void)v10);
          BOOL v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      }

      while (v6);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSDiagnosticReporter sharedInstance](&OBJC_CLASS___CSDiagnosticReporter, "sharedInstance"));
    [v9 submitAudioIssueReport:kCSDiagnosticReporterIntuitiveConvTandemStreamDidNotReceiveAudio];
  }

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSHashTable)receivers
{
  return self->_receivers;
}

- (void)setReceivers:(id)a3
{
}

- (BOOL)shouldStopDeliverAudioOnEndpoint
{
  return self->_shouldStopDeliverAudioOnEndpoint;
}

- (void)setShouldStopDeliverAudioOnEndpoint:(BOOL)a3
{
  self->_shouldStopDeliverAudioOnEndpoint = a3;
}

- (BOOL)hasAudioEverStarted
{
  return self->_hasAudioEverStarted;
}

- (void)setHasAudioEverStarted:(BOOL)a3
{
  self->_hasAudioEverStarted = a3;
}

- (void).cxx_destruct
{
}

@end