@interface CSSoundInput
- (AFNotifyObserver)siriObserver;
- (BOOL)startRecording;
- (CSCommandControlListener)csCommandControlListener;
- (CSSoundInput)initWithDeliverSamples:(id)a3;
- (id)deliverSamples;
- (unsigned)isRecording;
- (unsigned)isSiriIdle;
- (unsigned)isSiriListeningOrSpeaking;
- (void)commandControlListener:(id)a3 didStopUnexpectedly:(BOOL)a4;
- (void)commandControlListener:(id)a3 hasLPCMBufferAvailable:(id)a4;
- (void)dealloc;
- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5;
- (void)setCsCommandControlListener:(id)a3;
- (void)setDeliverSamples:(id)a3;
- (void)setIsSiriIdle:(unsigned __int8)a3;
- (void)setIsSiriListeningOrSpeaking:(unsigned __int8)a3;
- (void)setRecording:(unsigned __int8)a3;
- (void)setSiriObserver:(id)a3;
- (void)stopRecording;
@end

@implementation CSSoundInput

- (CSSoundInput)initWithDeliverSamples:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CSSoundInput;
  v4 = -[CSSoundInput init](&v9, "init");
  if (v4)
  {
    v4->_deliverSamples = _Block_copy(a3);
    v5 = objc_alloc_init(&OBJC_CLASS___CSCommandControlListener);
    v4->_csCommandControlListener = v5;
    -[CSCommandControlListener setDelegate:](v5, "setDelegate:", v4);
    v6 = objc_alloc(&OBJC_CLASS___AFNotifyObserver);
    v7 = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  "com.apple.siri.client-state-changed");
    v4->_siriObserver = -[AFNotifyObserver initWithName:options:queue:delegate:]( v6,  "initWithName:options:queue:delegate:",  v7,  1LL,  gRDServerQueue,  v4);
    *(_WORD *)&v4->_recording = 0;
  }

  return v4;
}

- (void)dealloc
{
  if (-[CSSoundInput isRecording](self, "isRecording")) {
    -[CSSoundInput stopRecording](self, "stopRecording");
  }
  -[CSCommandControlListener setDelegate:](self->_csCommandControlListener, "setDelegate:", 0LL);

  self->_csCommandControlListener = 0LL;
  id deliverSamples = self->_deliverSamples;
  if (deliverSamples)
  {
    _Block_release(deliverSamples);
    self->_id deliverSamples = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSSoundInput;
  -[CSSoundInput dealloc](&v4, "dealloc");
}

- (BOOL)startRecording
{
  v3 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "RDSoundInputImpl_iOS_CS:startRecording",  buf,  2u);
  }

  if (-[CSSoundInput isRecording](self, "isRecording")) {
    -[CSSoundInput stopRecording](self, "stopRecording");
  }
  if (+[RDSoundInputImpl_iOS_Shared isSystemSleeping](&OBJC_CLASS___RDSoundInputImpl_iOS_Shared, "isSystemSleeping"))
  {
    objc_super v4 = (os_log_s *)RXOSLog();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "System is sleeping, so don't start recording",  buf,  2u);
      return 0;
    }
  }

  else
  {
    dispatch_time_t v7 = dispatch_time(0LL, 3000000000LL);
    v8 = dispatch_semaphore_create(0LL);
    csCommandControlListener = self->_csCommandControlListener;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100007F48;
    v13[3] = &unk_1000CDBA0;
    v13[4] = self;
    v13[5] = v8;
    -[CSCommandControlListener startListenWithOption:completion:]( csCommandControlListener,  "startListenWithOption:completion:",  +[CSCommandControlListenerOption defaultOption](&OBJC_CLASS___CSCommandControlListenerOption, "defaultOption"),  v13);
    if (dispatch_semaphore_wait(v8, v7))
    {
      v10 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Timed out waiting to start CS recording",  buf,  2u);
      }
    }

    v11 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int recording = self->_recording;
      *(_DWORD *)buf = 67109120;
      int v15 = recording;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Started recording from CS = %d", buf, 8u);
    }

    return self->_recording != 0;
  }

  return result;
}

- (void)stopRecording
{
  v3 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping to record from CS", buf, 2u);
  }

  dispatch_time_t v4 = dispatch_time(0LL, 3000000000LL);
  BOOL v5 = dispatch_semaphore_create(0LL);
  csCommandControlListener = self->_csCommandControlListener;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000815C;
  v9[3] = &unk_1000CDBA0;
  v9[4] = self;
  v9[5] = v5;
  -[CSCommandControlListener stopListenWithCompletion:](csCommandControlListener, "stopListenWithCompletion:", v9);
  if (dispatch_semaphore_wait(v5, v4))
  {
    dispatch_time_t v7 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Timed out waiting to stop CS recording",  buf,  2u);
    }
  }

  v8 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Stopped to record from CS", buf, 2u);
  }

- (void)commandControlListener:(id)a3 hasLPCMBufferAvailable:(id)a4
{
  if (!self->_isSiriListeningOrSpeaking)
  {
    id v6 = objc_msgSend(a4, "bytes", a3);
    signed int v7 = [a4 length];
    id deliverSamples = (void (**)(id, id, uint64_t))self->_deliverSamples;
    if (deliverSamples)
    {
      if (self->_recording) {
        deliverSamples[2](deliverSamples, v6, (uint64_t)v7 >> 1);
      }
    }
  }

- (void)commandControlListener:(id)a3 didStopUnexpectedly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Stopped unexpectedly", buf, 2u);
  }

  self->_int recording = 0;
  if (v4)
  {
    if (+[RDSoundInputImpl isCSVADPresent](&OBJC_CLASS___RDSoundInputImpl, "isCSVADPresent"))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000835C;
      block[3] = &unk_1000CDBC8;
      block[4] = self;
      dispatch_async((dispatch_queue_t)gRDServerQueue, block);
    }
  }

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  v8 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 134218240;
    unint64_t v21 = a4;
    __int16 v22 = 2048;
    unint64_t v23 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "CS notification didChangeStateFrom %lld to %lld ",  (uint8_t *)&v20,  0x16u);
  }

  objc_super v9 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = @"YES";
    if ((a5 & 4) == 0) {
      v10 = @"NO";
    }
    int v20 = 138412290;
    unint64_t v21 = (unint64_t)v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Siri is listening: %@", (uint8_t *)&v20, 0xCu);
  }

  v11 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = @"YES";
    if ((a5 & 8) == 0) {
      v12 = @"NO";
    }
    int v20 = 138412290;
    unint64_t v21 = (unint64_t)v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Siri is speaking: %@", (uint8_t *)&v20, 0xCu);
  }

  self->_isSiriListeningOrSpeaking = (a5 & 0xC) != 0;
  self->_isSiriIdle = a5 == 0;
  v13 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isSiriIdle) {
      v14 = @"YES";
    }
    else {
      v14 = @"NO";
    }
    int v20 = 138412290;
    unint64_t v21 = (unint64_t)v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Siri is idle: %@", (uint8_t *)&v20, 0xCu);
  }

  if (+[RDSoundInputImpl_iOS_Shared isCarPlayActive](&OBJC_CLASS___RDSoundInputImpl_iOS_Shared, "isCarPlayActive"))
  {
    int v15 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v16 = +[RDSoundInputImpl_iOS_Shared isCarPlayActive](&OBJC_CLASS___RDSoundInputImpl_iOS_Shared, "isCarPlayActive");
      v17 = @"NO";
      if (v16) {
        v17 = @"YES";
      }
      int v20 = 138412290;
      unint64_t v21 = (unint64_t)v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "CarPlay Active?: %@", (uint8_t *)&v20, 0xCu);
    }

    if (self->_isSiriIdle)
    {
      if (!self->_recording)
      {
        v18 = (os_log_s *)RXOSLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Start recording from CoreSpeech in CarPlay since Siri is Idle",  (uint8_t *)&v20,  2u);
        }

        -[CSSoundInput startRecording](self, "startRecording");
      }
    }

    else if (self->_recording)
    {
      v19 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Stop recording from CoreSpeech in CarPlay since Siri is active",  (uint8_t *)&v20,  2u);
      }

      -[CSSoundInput stopRecording](self, "stopRecording");
    }
  }

- (unsigned)isRecording
{
  return self->_recording;
}

- (void)setRecording:(unsigned __int8)a3
{
  self->_int recording = a3;
}

- (unsigned)isSiriListeningOrSpeaking
{
  return self->_isSiriListeningOrSpeaking;
}

- (void)setIsSiriListeningOrSpeaking:(unsigned __int8)a3
{
  self->_isSiriListeningOrSpeaking = a3;
}

- (unsigned)isSiriIdle
{
  return self->_isSiriIdle;
}

- (void)setIsSiriIdle:(unsigned __int8)a3
{
  self->_isSiriIdle = a3;
}

- (CSCommandControlListener)csCommandControlListener
{
  return self->_csCommandControlListener;
}

- (void)setCsCommandControlListener:(id)a3
{
}

- (AFNotifyObserver)siriObserver
{
  return self->_siriObserver;
}

- (void)setSiriObserver:(id)a3
{
}

- (id)deliverSamples
{
  return self->_deliverSamples;
}

- (void)setDeliverSamples:(id)a3
{
}

@end