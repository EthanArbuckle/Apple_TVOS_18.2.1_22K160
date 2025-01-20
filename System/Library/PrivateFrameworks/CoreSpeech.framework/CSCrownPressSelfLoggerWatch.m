@interface CSCrownPressSelfLoggerWatch
- (BOOL)listeningEnabled;
- (CSCrownPressSelfLoggerWatch)init;
- (OS_dispatch_queue)queue;
- (unint64_t)displayWakeHostTime;
- (void)CSSiriAssertionMonitor:(id)a3 didReceiveBacklightOnEnabled:(BOOL)a4 atHostTime:(unint64_t)a5;
- (void)_emitCrownPressedEventwithMHUUID:(id)a3 didUseAOM:(BOOL)a4;
- (void)_handleDidStartStreamWithContext:(id)a3 withOption:(id)a4 successfully:(BOOL)a5;
- (void)dealloc;
- (void)setDisplayWakeHostTime:(unint64_t)a3;
- (void)setListeningEnabled:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setup;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
@end

@implementation CSCrownPressSelfLoggerWatch

- (CSCrownPressSelfLoggerWatch)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSCrownPressSelfLoggerWatch;
  v2 = -[CSCrownPressSelfLoggerWatch init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, -2);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("CSCrownPressSelfLoggerWatch queue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v2->_listeningEnabled = 0;
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
  [v3 unregisterObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSSiriAssertionMonitor sharedInstance](&OBJC_CLASS___CSSiriAssertionMonitor, "sharedInstance"));
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSCrownPressSelfLoggerWatch;
  -[CSCrownPressSelfLoggerWatch dealloc](&v5, "dealloc");
}

- (void)setup
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C5E80;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_emitCrownPressedEventwithMHUUID:(id)a3 didUseAOM:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v5 = (id)objc_claimAutoreleasedReturnValue([v6 UUIDString]);

    v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      v16 = "-[CSCrownPressSelfLoggerWatch _emitCrownPressedEventwithMHUUID:didUseAOM:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Mint a new MHUUID for crown press events",  (uint8_t *)&v15,  0xCu);
    }
  }

  id v8 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHCrownPressed);
  [v8 setIsAlwaysOnMicAudioUsed:v4];
  id v9 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEvent);
  id v10 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEventMetadata);
  id v11 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
  v12 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v5);
  id v13 = [v11 initWithNSUUID:v12];
  [v10 setMhId:v13];

  [v9 setEventMetadata:v10];
  [v9 setCrownPressed:v8];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v14 emitMessage:v9];
}

- (void)_handleDidStartStreamWithContext:(id)a3 withOption:(id)a4 successfully:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  if (v5)
  {
    v16 = v8;
    unsigned int v9 = [a3 isHomePressed];
    id v8 = v16;
    if (v9)
    {
      if (self->_listeningEnabled
        && (unint64_t v10 = -[CSCrownPressSelfLoggerWatch displayWakeHostTime](self, "displayWakeHostTime"),
            id v11 = [v16 startRecordingHostTime],
            id v8 = v16,
            v10 <= (unint64_t)v11))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([v16 requestMHUUID]);
        id v13 = self;
        v14 = v12;
        uint64_t v15 = 0LL;
      }

      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([v8 requestMHUUID]);
        id v13 = self;
        v14 = v12;
        uint64_t v15 = 1LL;
      }

      -[CSCrownPressSelfLoggerWatch _emitCrownPressedEventwithMHUUID:didUseAOM:]( v13,  "_emitCrownPressedEventwithMHUUID:didUseAOM:",  v14,  v15);

      id v8 = v16;
    }
  }
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  id v10 = a4;
  id v11 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000C5E6C;
  v15[3] = &unk_10022DB78;
  v15[4] = self;
  id v16 = v10;
  id v17 = v11;
  BOOL v18 = a5;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(queue, v15);
}

- (void)CSSiriAssertionMonitor:(id)a3 didReceiveBacklightOnEnabled:(BOOL)a4 atHostTime:(unint64_t)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C5E4C;
  block[3] = &unk_10022E458;
  BOOL v7 = a4;
  block[4] = self;
  void block[5] = a5;
  dispatch_async(queue, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)displayWakeHostTime
{
  return self->_displayWakeHostTime;
}

- (void)setDisplayWakeHostTime:(unint64_t)a3
{
  self->_displayWakeHostTime = a3;
}

- (BOOL)listeningEnabled
{
  return self->_listeningEnabled;
}

- (void)setListeningEnabled:(BOOL)a3
{
  self->_listeningEnabled = a3;
}

- (void).cxx_destruct
{
}

@end