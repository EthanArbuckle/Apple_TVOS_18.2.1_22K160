@interface CSVoiceTriggerXPCServiceProxy
+ (id)sharedInstance;
- (BOOL)isPhraseSpotterBypassed;
- (BOOL)isRaiseToSpeakBypassed;
- (CSSiriAssertionMonitor)assertionMonitor;
- (CSVoiceTriggerXPCServiceProxy)init;
- (CSVoiceTriggerXPCServiceProxy)initWithAssertionMonitor:(id)a3;
- (NSHashTable)observers;
- (NSMutableSet)activationAssertions;
- (id)_fetchAssertionMonitor;
- (id)fetchVoiceTriggerStats;
- (void)enableVoiceTrigger:(BOOL)a3 withAssertion:(id)a4 timestamp:(double)a5;
- (void)notifyServiceConnectionLost;
- (void)notifyVoiceTriggeredSiriSessionCancelled;
- (void)registerObserver:(id)a3;
- (void)setActivationAssertions:(id)a3;
- (void)setAssertionMonitor:(id)a3;
- (void)setIsPhraseSpotterBypassed:(BOOL)a3;
- (void)setIsRaiseToSpeakBypassed:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setPhraseSpotterBypassing:(BOOL)a3 timeout:(double)a4;
- (void)setRaiseToSpeakBypassing:(BOOL)a3 timeout:(double)a4;
- (void)unregisterObserver:(id)a3;
@end

@implementation CSVoiceTriggerXPCServiceProxy

- (CSVoiceTriggerXPCServiceProxy)init
{
  return -[CSVoiceTriggerXPCServiceProxy initWithAssertionMonitor:](self, "initWithAssertionMonitor:", 0LL);
}

- (CSVoiceTriggerXPCServiceProxy)initWithAssertionMonitor:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerXPCServiceProxy;
  v6 = -[CSVoiceTriggerXPCServiceProxy init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    if (v5) {
      objc_storeStrong((id *)&v6->_assertionMonitor, a3);
    }
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    activationAssertions = v7->_activationAssertions;
    v7->_activationAssertions = (NSMutableSet *)v8;

    *(_WORD *)&v7->_isPhraseSpotterBypassed = 0;
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v10;
  }

  return v7;
}

- (void)registerObserver:(id)a3
{
}

- (void)unregisterObserver:(id)a3
{
}

- (id)_fetchAssertionMonitor
{
  assertionMonitor = self->_assertionMonitor;
  if (assertionMonitor) {
    return assertionMonitor;
  }
  else {
    return (id)objc_claimAutoreleasedReturnValue( +[CSSiriAssertionMonitor sharedInstance]( &OBJC_CLASS___CSSiriAssertionMonitor,  "sharedInstance"));
  }
}

- (void)enableVoiceTrigger:(BOOL)a3 withAssertion:(id)a4 timestamp:(double)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v18 = "-[CSVoiceTriggerXPCServiceProxy enableVoiceTrigger:withAssertion:timestamp:]";
    __int16 v19 = 2082;
    v20 = "-[CSVoiceTriggerXPCServiceProxy enableVoiceTrigger:withAssertion:timestamp:]";
    __int16 v21 = 1026;
    BOOL v22 = v6;
    __int16 v23 = 2114;
    id v24 = v8;
    __int16 v25 = 2050;
    double v26 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s ::: %{public}s enable: %{public}d reason: %{public}@ timestamp : %{public}lf",  buf,  0x30u);
  }

  if (qword_10027FBF8 == -1)
  {
    if (v8)
    {
LABEL_5:
      uint64_t v10 = (dispatch_queue_s *)qword_10027FC10;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100011B70;
      v12[3] = &unk_10022BFA0;
      BOOL v16 = v6;
      double v15 = a5;
      id v13 = v8;
      v14 = self;
      dispatch_sync(v10, v12);

      goto LABEL_9;
    }
  }

  else
  {
    dispatch_once(&qword_10027FBF8, &stru_10022A160);
    if (v8) {
      goto LABEL_5;
    }
  }

  v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[CSVoiceTriggerXPCServiceProxy enableVoiceTrigger:withAssertion:timestamp:]";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s Ignoring request to enable/disable voice trigger with nil reason.",  buf,  0xCu);
  }

- (void)setPhraseSpotterBypassing:(BOOL)a3 timeout:(double)a4
{
  if (qword_10027FC18 != -1) {
    dispatch_once(&qword_10027FC18, &stru_10022A180);
  }
  objc_initWeak(&location, self);
  v7 = (dispatch_queue_s *)qword_10027FC20;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000116DC;
  block[3] = &unk_10022A1A8;
  block[4] = self;
  BOOL v10 = a3;
  v9[1] = *(id *)&a4;
  objc_copyWeak(v9, &location);
  dispatch_sync(v7, block);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)setRaiseToSpeakBypassing:(BOOL)a3 timeout:(double)a4
{
  if (qword_10027FC30 != -1) {
    dispatch_once(&qword_10027FC30, &stru_10022A1C8);
  }
  objc_initWeak(&location, self);
  v7 = (dispatch_queue_s *)qword_10027FC38;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011248;
  block[3] = &unk_10022A1A8;
  block[4] = self;
  BOOL v10 = a3;
  v9[1] = *(id *)&a4;
  objc_copyWeak(v9, &location);
  dispatch_sync(v7, block);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)notifyVoiceTriggeredSiriSessionCancelled
{
  v2 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[CSVoiceTriggerXPCServiceProxy notifyVoiceTriggeredSiriSessionCancelled]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }

- (void)notifyServiceConnectionLost
{
  int v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[CSVoiceTriggerXPCServiceProxy notifyServiceConnectionLost]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s HandleDisconnect", buf, 0xCu);
  }

  id v4 = -[NSMutableSet copy](self->_activationAssertions, "copy");
  if ([v4 count])
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        v9 = 0LL;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo", (void)v12));
          [v11 systemUptime];
          -[CSVoiceTriggerXPCServiceProxy enableVoiceTrigger:withAssertion:timestamp:]( self,  "enableVoiceTrigger:withAssertion:timestamp:",  0LL,  v10);

          v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v7);
    }
  }

  -[CSVoiceTriggerXPCServiceProxy setPhraseSpotterBypassing:timeout:]( self,  "setPhraseSpotterBypassing:timeout:",  0LL,  0.0,  (void)v12);
  -[CSVoiceTriggerXPCServiceProxy setRaiseToSpeakBypassing:timeout:]( self,  "setRaiseToSpeakBypassing:timeout:",  0LL,  0.0);
}

- (id)fetchVoiceTriggerStats
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerDataCollector sharedInstance]( &OBJC_CLASS___CSVoiceTriggerDataCollector,  "sharedInstance"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 fetchVoiceTriggerHeartBeatMetrics]);

  return v3;
}

- (NSMutableSet)activationAssertions
{
  return self->_activationAssertions;
}

- (void)setActivationAssertions:(id)a3
{
}

- (BOOL)isPhraseSpotterBypassed
{
  return self->_isPhraseSpotterBypassed;
}

- (void)setIsPhraseSpotterBypassed:(BOOL)a3
{
  self->_isPhraseSpotterBypassed = a3;
}

- (BOOL)isRaiseToSpeakBypassed
{
  return self->_isRaiseToSpeakBypassed;
}

- (void)setIsRaiseToSpeakBypassed:(BOOL)a3
{
  self->_isRaiseToSpeakBypassed = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (CSSiriAssertionMonitor)assertionMonitor
{
  return self->_assertionMonitor;
}

- (void)setAssertionMonitor:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_10027FBF0 != -1) {
    dispatch_once(&qword_10027FBF0, &stru_10022A140);
  }
  return (id)qword_10027FBE8;
}

@end