@interface RPSiriSession
- (BOOL)isDestinationPTTEligible;
- (BOOL)voiceControllerSetupAndReturnError:(id *)a3;
- (NSString)description;
- (NSString)destinationID;
- (NSString)sourceID;
- (RPMessageable)messenger;
- (RPSiriSession)init;
- (RPSiriSessionDelegate)delegate;
- (void)_activate2;
- (void)_activateCompletedWithError:(id)a3;
- (void)_activateWithCompletion:(id)a3;
- (void)_invalidateWithCompletion:(id)a3;
- (void)_invalidated;
- (void)_recordingLimitTimerFired;
- (void)_recordingLimitTimerStart:(unsigned int)a3;
- (void)_sendSiriStop;
- (void)_startActivationWithDestinationID:(id)a3 messenger:(id)a4 completion:(id)a5;
- (void)_stopRecording;
- (void)_teardownVoiceController;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateWithCompletion:(id)a3;
- (void)prewarmWithCompletion:(id)a3;
- (void)receivedButtonUpWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestinationID:(id)a3;
- (void)setIsDestinationPTTEligible:(BOOL)a3;
- (void)setMessenger:(id)a3;
- (void)setSourceID:(id)a3;
- (void)voiceControllerAudioCallback:(id)a3 forStream:(unint64_t)a4 buffer:(id)a5;
- (void)voiceControllerDidDetectEndpoint:(id)a3 ofType:(int)a4 atTime:(double)a5;
- (void)voiceControllerDidDetectStartpoint:(id)a3;
- (void)voiceControllerDidStartRecording:(id)a3 forStream:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6;
- (void)voiceControllerDidStopRecording:(id)a3 forStream:(unint64_t)a4 forReason:(int64_t)a5;
- (void)voiceControllerEncoderErrorDidOccur:(id)a3 error:(id)a4;
- (void)voiceControllerMediaServicesWereReset:(id)a3;
- (void)voiceControllerTearDown;
@end

@implementation RPSiriSession

- (RPSiriSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPSiriSession;
  v2 = -[RPSiriSession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v3->_isSourcePTTEligible = _os_feature_enabled_impl();
    v4 = v3;
  }

  return v3;
}

- (void)setMessenger:(id)a3
{
  v5 = (RPMessageable *)a3;
  if (self->_messenger != v5)
  {
    objc_storeStrong((id *)&self->_messenger, a3);
    if (_os_feature_enabled_impl())
    {
      if (-[RPSiriSession isDestinationPTTEligible](self, "isDestinationPTTEligible"))
      {
        messenger = self->_messenger;
        v7[0] = MEMORY[0x1895F87A8];
        v7[1] = 3221225472LL;
        v7[2] = __30__RPSiriSession_setMessenger___block_invoke;
        v7[3] = &unk_18A033E80;
        v7[4] = self;
        -[RPMessageable registerRequestID:options:handler:]( messenger,  "registerRequestID:options:handler:",  @"_siriEndpoint",  0LL,  v7);
      }
    }
  }
}

void __30__RPSiriSession_setMessenger___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
  {
    id v9 = v10;
    LogPrintF();
  }

  objc_msgSend(*(id *)(a1 + 32), "_stopRecording", v9);
  (*((void (**)(id, void, void, void))v8 + 2))(v8, MEMORY[0x189604A60], 0LL, 0LL);
}

- (void)_stopRecording
{
  int startRecordingState = self->_startRecordingState;
  if (startRecordingState == 6 || startRecordingState == 1)
  {
    -[RPSiriSession delegate](self, "delegate");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v4 rpSiriSessionDidReceiveStopRecording];
  }

- (NSString)description
{
  return (NSString *)0LL;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  -[RPMessageable dispatchQueue](self->_messenger, "dispatchQueue");
  v5 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = v5;
  if (!v5) {
    dispatchQueue = self->_dispatchQueue;
  }
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  id v7 = (dispatch_queue_s *)self->_dispatchQueue;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __40__RPSiriSession_activateWithCompletion___block_invoke;
  v9[3] = &unk_18A031B60;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

uint64_t __40__RPSiriSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)prewarmWithCompletion:(id)a3
{
  id v4 = a3;
  -[RPMessageable dispatchQueue](self->_messenger, "dispatchQueue");
  v5 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = v5;
  if (!v5) {
    dispatchQueue = self->_dispatchQueue;
  }
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  id v7 = (dispatch_queue_s *)self->_dispatchQueue;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __39__RPSiriSession_prewarmWithCompletion___block_invoke;
  v9[3] = &unk_18A031B60;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

void __39__RPSiriSession_prewarmWithCompletion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = 0LL;
  char v3 = [v2 voiceControllerSetupAndReturnError:&v6];
  id v4 = v6;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);
  }
  if ((v3 & 1) != 0)
  {
    if (gLogCategory_RPSiriSession <= 30
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
LABEL_9:
      LogPrintF();
    }
  }

  else if (gLogCategory_RPSiriSession <= 90 {
         && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_9;
  }
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_destinationID;
  if (v5)
  {
    id v6 = self->_messenger;
    if (v6)
    {
      if (self->_activateState)
      {
        if (gLogCategory_RPSiriSession <= 40
          && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }

        uint64_t activateState = self->_activateState;
        RPErrorF();
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (_os_feature_enabled_impl()
          && -[RPSiriSession isDestinationPTTEligible](self, "isDestinationPTTEligible", activateState)
          && ((int startRecordingState = self->_startRecordingState, startRecordingState == 6) || startRecordingState == 1))
        {
          id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
          [MEMORY[0x189607968] numberWithBool:self->_isSourcePTTEligible];
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 setObject:v11 forKeyedSubscript:@"_pttEligible"];

          if (gLogCategory_RPSiriSession <= 40
            && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }

          v15[0] = MEMORY[0x1895F87A8];
          v15[1] = 3221225472LL;
          v15[2] = __41__RPSiriSession__activateWithCompletion___block_invoke;
          v15[3] = &unk_18A0325E8;
          id v16 = v4;
          -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:]( v6,  "sendRequestID:request:destinationID:options:responseHandler:",  @"_siriStartWhileRecording",  MEMORY[0x189604A60],  v5,  v10,  v15);
        }

        else if (v4)
        {
          (*((void (**)(id, void *))v4 + 2))(v4, v8);
        }
      }

      else if (self->_voiceController)
      {
        -[RPSiriSession _startActivationWithDestinationID:messenger:completion:]( self,  "_startActivationWithDestinationID:messenger:completion:",  v5,  v6,  v4);
      }

      else
      {
        if (gLogCategory_RPSiriSession <= 40
          && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }

        v13[0] = MEMORY[0x1895F87A8];
        v13[1] = 3221225472LL;
        v13[2] = __41__RPSiriSession__activateWithCompletion___block_invoke_2;
        v13[3] = &unk_18A033EA8;
        v13[4] = self;
        v13[5] = v5;
        v13[6] = v6;
        id v14 = v4;
        -[RPSiriSession prewarmWithCompletion:](self, "prewarmWithCompletion:", v13);
      }
    }

    else
    {
      RPErrorF();
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_RPSiriSession <= 90
        && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

      if (v4) {
        (*((void (**)(id, void *))v4 + 2))(v4, v7);
      }
    }
  }

  else
  {
    RPErrorF();
    id v6 = (RPMessageable *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPSiriSession <= 90
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    if (v4) {
      (*((void (**)(id, RPMessageable *))v4 + 2))(v4, v6);
    }
  }
}

void __41__RPSiriSession__activateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v8);
  }
}

void __41__RPSiriSession__activateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (!v3)
  {
    [*(id *)(a1 + 32) _startActivationWithDestinationID:*(void *)(a1 + 40) messenger:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
LABEL_9:
    id v4 = v7;
    goto LABEL_10;
  }

  id v4 = v3;
  if (gLogCategory_RPSiriSession <= 90)
  {
    if (gLogCategory_RPSiriSession != -1 || (v5 = _LogCategory_Initialize(), id v4 = v7, v5))
    {
      LogPrintF();
      id v4 = v7;
    }
  }

  uint64_t v6 = *(void *)(a1 + 56);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    goto LABEL_9;
  }

- (void)_startActivationWithDestinationID:(id)a3 messenger:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  self->_uint64_t activateState = 1;
  id v10 = (void *)MEMORY[0x1895A4770](a5);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = v10;

  objc_storeStrong((id *)&self->_selfRef, self);
  if (gLogCategory_RPSiriSession <= 30 && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
  {
    id v15 = v8;
    LogPrintF();
  }

  -[RPSiriSession _activate2](self, "_activate2", v15);
  id v12 = objc_alloc_init(MEMORY[0x189603FC8]);
  [MEMORY[0x189607968] numberWithBool:self->_isSourcePTTEligible];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setObject:v13 forKeyedSubscript:@"_pttEligible"];

  if (_os_feature_enabled_impl())
  {
    if (-[RPSiriSession isDestinationPTTEligible](self, "isDestinationPTTEligible"))
    {
      sourceID = self->_sourceID;
      if (sourceID) {
        [v12 setObject:sourceID forKeyedSubscript:@"senderIDS"];
      }
    }
  }

  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __72__RPSiriSession__startActivationWithDestinationID_messenger_completion___block_invoke;
  v16[3] = &unk_18A0329B0;
  v16[4] = self;
  [v9 sendRequestID:@"_siriStart" request:MEMORY[0x189604A60] destinationID:v8 options:v12 responseHandler:v16];
}

void __72__RPSiriSession__startActivationWithDestinationID_messenger_completion___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = *(_DWORD **)(a1 + 32);
    if (v9[4] == 1) {
      [v9 _activateCompletedWithError:v8];
    }
  }
}

- (void)_activate2
{
  self->_int startRecordingState = 1;
  id v3 = (void *)[objc_alloc(getAVVCStartRecordSettingsClass()) initWithStreamID:self->_streamId atStartHostTime:0];
  voiceController = self->_voiceController;
  id v8 = 0LL;
  char v5 = -[AVVoiceController startRecordForStream:error:](voiceController, "startRecordForStream:error:", v3, &v8);
  id v6 = v8;
  -[RPSiriSession _recordingLimitTimerStart:](self, "_recordingLimitTimerStart:", 60LL);
  if ((v5 & 1) == 0)
  {
    self->_int startRecordingState = 3;
    RPNestedErrorF();
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPSiriSession _activateCompletedWithError:](self, "_activateCompletedWithError:", v7);
  }
}

- (void)_activateCompletedWithError:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    if (gLogCategory_RPSiriSession <= 90
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    int v4 = 3;
  }

  else
  {
    int v4 = 4;
  }

  self->_uint64_t activateState = v4;
  char v5 = (void (**)(void, void))MEMORY[0x1895A4770](self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0LL;

  if (v5) {
    ((void (**)(void, id))v5)[2](v5, v7);
  }
  if (self->_invalidateCalled) {
    -[RPSiriSession _invalidated](self, "_invalidated");
  }
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __27__RPSiriSession_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __27__RPSiriSession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateWithCompletion:0];
}

- (void)invalidateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __42__RPSiriSession_invalidateWithCompletion___block_invoke;
  v7[3] = &unk_18A031B60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __42__RPSiriSession_invalidateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateWithCompletion:*(void *)(a1 + 40)];
}

- (void)receivedButtonUpWithCompletion:(id)a3
{
  if (_os_feature_enabled_impl()
    && -[RPSiriSession isDestinationPTTEligible](self, "isDestinationPTTEligible"))
  {
    if (gLogCategory_RPSiriSession <= 30
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    -[RPSiriSession _sendSiriStop](self, "_sendSiriStop");
  }

- (void)_sendSiriStop
{
  int activateState = self->_activateState;
  if (activateState == 4 || activateState == 1)
  {
    id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
    [MEMORY[0x189607968] numberWithBool:self->_isSourcePTTEligible];
    char v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v5 forKeyedSubscript:@"_pttEligible"];

    if (gLogCategory_RPSiriSession <= 30
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:]( self->_messenger,  "sendRequestID:request:destinationID:options:responseHandler:",  @"_siriStop",  MEMORY[0x189604A60],  self->_destinationID,  v6,  &__block_literal_global_14);
  }

  else
  {
    if (gLogCategory_RPSiriSession <= 40
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    -[RPSiriSession invalidateWithCompletion:](self, "invalidateWithCompletion:", 0LL);
  }

void __30__RPSiriSession__sendSiriStop__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v6 = a3;
  id v7 = a4;
  if (v7
    && gLogCategory_RPSiriSession <= 90
    && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_invalidateWithCompletion:(id)a3
{
  id v4 = a3;
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (gLogCategory_RPSiriSession <= 30
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    int activateState = self->_activateState;
    self->_int activateState = 7;
    -[RPSiriSession voiceControllerTearDown](self, "voiceControllerTearDown");
    if (!_os_feature_enabled_impl()
      || !-[RPSiriSession isDestinationPTTEligible](self, "isDestinationPTTEligible"))
    {
      if (activateState == 4 || activateState == 1)
      {
        id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
        [MEMORY[0x189607968] numberWithBool:self->_isSourcePTTEligible];
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 setObject:v7 forKeyedSubscript:@"_pttEligible"];

        if (gLogCategory_RPSiriSession <= 30
          && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }

        messenger = self->_messenger;
        destinationID = self->_destinationID;
        v16[0] = MEMORY[0x1895F87A8];
        v16[1] = 3221225472LL;
        v16[2] = __43__RPSiriSession__invalidateWithCompletion___block_invoke;
        v16[3] = &unk_18A033D50;
        v16[4] = self;
        id v17 = v4;
        -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:]( messenger,  "sendRequestID:request:destinationID:options:responseHandler:",  @"_siriStop",  MEMORY[0x189604A60],  destinationID,  v6,  v16);
        v11 = self->_messenger;
        self->_messenger = 0LL;
      }

      else
      {
        id v8 = self->_messenger;
        self->_messenger = 0LL;

        -[RPSiriSession _invalidated](self, "_invalidated");
      }
    }

    id v12 = self->_messenger;
    self->_messenger = 0LL;

    -[RPSiriSession _invalidated](self, "_invalidated");
    if (_os_feature_enabled_impl()
      && -[RPSiriSession isDestinationPTTEligible](self, "isDestinationPTTEligible"))
    {
      -[RPMessageable deregisterRequestID:](self->_messenger, "deregisterRequestID:", @"_siriEndpoint");
    }

    recordingLimitTimer = self->_recordingLimitTimer;
    if (recordingLimitTimer)
    {
      id v14 = recordingLimitTimer;
      dispatch_source_cancel(v14);
      id v15 = self->_recordingLimitTimer;
      self->_recordingLimitTimer = 0LL;
    }
  }
}

void __43__RPSiriSession__invalidateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (gLogCategory_RPSiriSession <= 90
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      id v10 = v8;
LABEL_7:
      LogPrintF();
    }
  }

  else if (gLogCategory_RPSiriSession <= 30 {
         && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }

  objc_msgSend(*(id *)(a1 + 32), "_invalidated", v10);
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v8);
  }
}

- (void)_teardownVoiceController
{
  voiceController = self->_voiceController;
  if (voiceController)
  {
    id v8 = 0LL;
    -[AVVoiceController teardownWithError:](voiceController, "teardownWithError:", &v8);
    id v4 = v8;
    char v5 = v4;
    if (v4)
    {
      if (gLogCategory_RPSiriSession <= 90)
      {
        if (gLogCategory_RPSiriSession != -1 || (id v4 = (id)_LogCategory_Initialize(), (_DWORD)v4)) {
          id v4 = (id)LogPrintF();
        }
      }
    }

    id v6 = (void *)MEMORY[0x1895A45CC](v4);
    id v7 = self->_voiceController;
    self->_voiceController = 0LL;

    objc_autoreleasePoolPop(v6);
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RPSiriSession;
  -[RPSiriSession dealloc](&v3, sel_dealloc);
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_messenger)
  {
    int startRecordingState = self->_startRecordingState;
    if (startRecordingState != 1 && startRecordingState != 6 && self->_stopRecordingState != 1)
    {
      -[AVVoiceController deactivateAudioSessionForStream:withOptions:error:]( self->_voiceController,  "deactivateAudioSessionForStream:withOptions:error:",  self->_streamId,  1LL,  0LL);
      if (self->_voiceController)
      {
        -[RPSiriSession _teardownVoiceController](self, "_teardownVoiceController");
        if (gLogCategory_RPSiriSession <= 30
          && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }

      voiceController = self->_voiceController;
      self->_voiceController = 0LL;

      delegate = self->_delegate;
      self->_delegate = 0LL;

      self->_streamId = 0LL;
      self->_invalidateDone = 1;
      if (gLogCategory_RPSiriSession <= 30
        && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

      selfRef = self->_selfRef;
      self->_selfRef = 0LL;
    }
  }

- (BOOL)voiceControllerSetupAndReturnError:(id *)a3
{
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  uint64_t v29 = 0x40CF400000000000LL;
  LODWORD(v30) = 1869641075;
  HIDWORD(v30) = 320;
  DWORD1(v31) = 1;
  char v5 = (AVAudioFormat *)[objc_alloc(getAVAudioFormatClass()) initWithStreamDescription:&v29];
  audioFormat = self->_audioFormat;
  self->_audioFormat = v5;

  if (self->_audioFormat)
  {
    if (gLogCategory_RPSiriSession <= 30
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      v22 = &v29;
      LogPrintF();
    }

    voiceController = self->_voiceController;
    if (voiceController)
    {
      id v9 = 0LL;
    }

    else
    {
      id v28 = 0LL;
      id v10 = (AVVoiceController *)[objc_alloc(getAVVoiceControllerClass()) initVoiceControllerForClient:3 withError:&v28];
      id v9 = v28;
      id v11 = self->_voiceController;
      self->_voiceController = v10;

      voiceController = self->_voiceController;
      if (!voiceController)
      {
        if (a3)
        {
          RPNestedErrorF();
          char v7 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          char v7 = 0;
        }

- (void)voiceControllerTearDown
{
  *(void *)&self->_int startRecordingState = 0x100000007LL;
  voiceController = self->_voiceController;
  if (voiceController)
  {
    unint64_t streamId = self->_streamId;
    id v7 = 0LL;
    char v5 = -[AVVoiceController stopRecordForStream:error:](voiceController, "stopRecordForStream:error:", streamId, &v7);
    id v6 = v7;
    if ((v5 & 1) == 0
      && gLogCategory_RPSiriSession <= 90
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

  else
  {
    if (gLogCategory_RPSiriSession <= 40
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    id v6 = 0LL;
  }
}

- (void)voiceControllerDidStartRecording:(id)a3 forStream:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6
{
  id v9 = a6;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __79__RPSiriSession_voiceControllerDidStartRecording_forStream_successfully_error___block_invoke;
  v12[3] = &unk_18A033EF0;
  BOOL v15 = a5;
  v12[4] = self;
  id v13 = v9;
  unint64_t v14 = a4;
  id v11 = v9;
  dispatch_async(dispatchQueue, v12);
}

void __79__RPSiriSession_voiceControllerDidStartRecording_forStream_successfully_error___block_invoke( uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56))
  {
    if (*(void *)(a1 + 40)) {
      int v2 = 3;
    }
    else {
      int v2 = 6;
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 56LL) = v2;
    if (gLogCategory_RPSiriSession <= 30
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    id v4 = *(_BYTE **)(a1 + 32);
    if (v4[40])
    {
      [v4 voiceControllerTearDown];
      id v4 = *(_BYTE **)(a1 + 32);
    }

    [v4 _activateCompletedWithError:0];
  }

  else
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 56LL) = 3;
    objc_super v3 = *(void **)(a1 + 32);
    RPNestedErrorF();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v3 _activateCompletedWithError:v5];
  }

- (void)voiceControllerDidStopRecording:(id)a3 forStream:(unint64_t)a4 forReason:(int64_t)a5
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __69__RPSiriSession_voiceControllerDidStopRecording_forStream_forReason___block_invoke;
  block[3] = &unk_18A033420;
  block[4] = self;
  void block[5] = a4;
  block[6] = a5;
  dispatch_async(dispatchQueue, block);
}

_BYTE *__69__RPSiriSession_voiceControllerDidStopRecording_forStream_forReason___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 60LL) = 5;
  result = *(_BYTE **)(a1 + 32);
  if (result[40]) {
    return (_BYTE *)[result _invalidated];
  }
  return result;
}

- (void)voiceControllerAudioCallback:(id)a3 forStream:(unint64_t)a4 buffer:(id)a5
{
  id v7 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __63__RPSiriSession_voiceControllerAudioCallback_forStream_buffer___block_invoke;
  block[3] = &unk_18A033F18;
  id v11 = v7;
  unint64_t v12 = a4;
  block[4] = self;
  id v9 = v7;
  dispatch_async(dispatchQueue, block);
}

void __63__RPSiriSession_voiceControllerAudioCallback_forStream_buffer___block_invoke(uint64_t a1)
{
  v27[2] = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v1 + 56) == 6)
  {
    [*(id *)(v1 + 64) updateMeterForStream:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 64) getAveragePowerForStream:*(void *)(a1 + 48) forChannel:0];
    float v4 = __exp10f(v3 / 20.0);
    if (gLogCategory_RPSiriSession <= 10
      && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v5 = [*(id *)(a1 + 40) timeStamp];
      uint64_t v6 = [*(id *)(a1 + 40) bytesDataSize];
      double v23 = v4;
      uint64_t v21 = [*(id *)(a1 + 40) packetDescriptionCount];
      uint64_t v22 = [*(id *)(a1 + 40) channels];
      uint64_t v19 = v5;
      uint64_t v20 = v6;
      LogPrintF();
    }

    id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
    uint64_t v8 = [*(id *)(a1 + 40) packetDescriptions];
    int v9 = [*(id *)(a1 + 40) packetDescriptionCount];
    if (v9)
    {
      uint64_t v10 = 16LL * v9;
      do
      {
        v26[0] = &unk_18A04E098;
        objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  *(unsigned int *)(v8 + 12),  v19,  v20,  v21,  v22,  *(void *)&v23);
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = &unk_18A04E0B0;
        v27[0] = v11;
        uint64_t v12 = *(void *)v8;
        v8 += 16LL;
        [MEMORY[0x189607968] numberWithLongLong:v12];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        v27[1] = v13;
        [MEMORY[0x189603F68] dictionaryWithObjects:v27 forKeys:v26 count:2];
        unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 addObject:v14];

        v10 -= 16LL;
      }

      while (v10);
    }

    BOOL v15 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F48]),  "initWithBytes:length:",  objc_msgSend(*(id *)(a1 + 40), "data"),  (int)objc_msgSend(*(id *)(a1 + 40), "bytesDataSize"));
    v25[0] = v15;
    v24[0] = &unk_18A04E0C8;
    v24[1] = &unk_18A04E0E0;
    *(float *)&double v16 = v4;
    [MEMORY[0x189607968] numberWithFloat:v16];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = &unk_18A04E0F8;
    v25[1] = v17;
    v25[2] = v7;
    [MEMORY[0x189603F68] dictionaryWithObjects:v25 forKeys:v24 count:3];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();

    [*(id *)(*(void *)(a1 + 32) + 112) sendEventID:@"_siA" event:v18 destinationID:*(void *)(*(void *)(a1 + 32) + 96) options:0 completion:0];
  }

- (void)voiceControllerDidDetectStartpoint:(id)a3
{
  id v3 = a3;
  float v4 = v3;
  if (gLogCategory_RPSiriSession <= 30
    && ((uint64_t v6 = v3, gLogCategory_RPSiriSession != -1) || (v5 = _LogCategory_Initialize(), v4 = v6, v5)))
  {
    LogPrintF();
  }

  else
  {
  }

- (void)voiceControllerDidDetectEndpoint:(id)a3 ofType:(int)a4 atTime:(double)a5
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (gLogCategory_RPSiriSession <= 30)
  {
    id v8 = v5;
    if (gLogCategory_RPSiriSession != -1 || (v7 = _LogCategory_Initialize(), uint64_t v6 = v8, v7))
    {
      LogPrintF();
      uint64_t v6 = v8;
    }
  }
}

- (void)voiceControllerEncoderErrorDidOccur:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v5 = a4;
}

- (void)voiceControllerMediaServicesWereReset:(id)a3
{
  id v3 = a3;
  float v4 = v3;
  if (gLogCategory_RPSiriSession <= 60
    && ((id v6 = v3, gLogCategory_RPSiriSession != -1) || (v5 = _LogCategory_Initialize(), v4 = v6, v5)))
  {
    LogPrintF();
  }

  else
  {
  }

- (void)_recordingLimitTimerStart:(unsigned int)a3
{
  recordingLimitTimer = self->_recordingLimitTimer;
  if (recordingLimitTimer)
  {
    int v5 = recordingLimitTimer;
    dispatch_source_cancel(v5);
    id v6 = self->_recordingLimitTimer;
    self->_recordingLimitTimer = 0LL;
  }

  int v7 = (OS_dispatch_source *)dispatch_source_create( MEMORY[0x1895F8B78],  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  id v8 = self->_recordingLimitTimer;
  self->_recordingLimitTimer = v7;
  int v9 = v7;

  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __43__RPSiriSession__recordingLimitTimerStart___block_invoke;
  handler[3] = &unk_18A031AE8;
  handler[4] = v9;
  handler[5] = self;
  dispatch_source_set_event_handler(v9, handler);
  CUDispatchTimerSet();
  dispatch_activate(v9);
}

void *__43__RPSiriSession__recordingLimitTimerStart___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v2 == result[10]) {
    return (void *)[result _recordingLimitTimerFired];
  }
  return result;
}

- (void)_recordingLimitTimerFired
{
  if (_os_feature_enabled_impl())
  {
    if (-[RPSiriSession isDestinationPTTEligible](self, "isDestinationPTTEligible")) {
      -[RPSiriSession _stopRecording](self, "_stopRecording");
    }
  }

- (NSString)destinationID
{
  return self->_destinationID;
}

- (void)setDestinationID:(id)a3
{
}

- (NSString)sourceID
{
  return self->_sourceID;
}

- (void)setSourceID:(id)a3
{
}

- (BOOL)isDestinationPTTEligible
{
  return self->_isDestinationPTTEligible;
}

- (void)setIsDestinationPTTEligible:(BOOL)a3
{
  self->_isDestinationPTTEligible = a3;
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (RPSiriSessionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end