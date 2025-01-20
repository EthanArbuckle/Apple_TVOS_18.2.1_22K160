@interface CSDPowerLogReporter
- (CSDPowerLogReporter)init;
- (NSDictionary)callStateContext;
- (NSDictionary)visibilityContext;
- (NSMutableDictionary)screeningCalls;
- (id)_bundleIdentifierForCall:(id)a3;
- (id)_contextDictionaryWithCall:(id)a3;
- (id)eventBlock;
- (id)systemTimeProvider;
- (void)_registerCallBackgroundedEvent;
- (void)_registerCallForegroundedEventForCall:(id)a3;
- (void)_registerCallStartEventForCall:(id)a3;
- (void)_registerCallStopEvent;
- (void)_registerEventWithContext:(id)a3 status:(id)a4;
- (void)_reportScreeningDurationEventForCall:(id)a3;
- (void)_reportScreeningEnabledEvent:(BOOL)a3;
- (void)_reportScreeningEventForCall:(id)a3;
- (void)_stopScreeningEventIfNecessaryForCall:(id)a3;
- (void)allCallsBackgroundedForReportingController:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reportingController:(id)a3 callEnteredForeground:(id)a4;
- (void)reportingController:(id)a3 didEndSession:(id)a4 startDate:(id)a5 endDate:(id)a6;
- (void)reportingController:(id)a3 screeningChangedForCall:(id)a4;
- (void)reportingController:(id)a3 statusChangedForCall:(id)a4 totalCallCount:(unint64_t)a5;
- (void)setCallStateContext:(id)a3;
- (void)setEventBlock:(id)a3;
- (void)setScreeningCalls:(id)a3;
- (void)setSystemTimeProvider:(id)a3;
- (void)setVisibilityContext:(id)a3;
@end

@implementation CSDPowerLogReporter

- (CSDPowerLogReporter)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CSDPowerLogReporter;
  v2 = -[CSDPowerLogReporter init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    id eventBlock = v2->_eventBlock;
    v2->_id eventBlock = &stru_1003D92C8;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    screeningCalls = v3->_screeningCalls;
    v3->_screeningCalls = v5;

    id systemTimeProvider = v3->_systemTimeProvider;
    v3->_id systemTimeProvider = &stru_1003D9328;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults tu_defaults](&OBJC_CLASS___NSUserDefaults, "tu_defaults"));
    [v8 addObserver:v3 forKeyPath:TUCallScreeningDisabledKey options:0 context:&off_1003D9348];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults tu_defaults](&OBJC_CLASS___NSUserDefaults, "tu_defaults"));
  [v3 removeObserver:self forKeyPath:TUCallScreeningDisabledKey context:&off_1003D9348];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSDPowerLogReporter;
  -[CSDPowerLogReporter dealloc](&v4, "dealloc");
}

- (void)reportingController:(id)a3 screeningChangedForCall:(id)a4
{
}

- (void)reportingController:(id)a3 statusChangedForCall:(id)a4 totalCallCount:(unint64_t)a5
{
  id v10 = a4;
  unsigned int v7 = [v10 status];
  if (!v7 || v7 == 6)
  {
    -[CSDPowerLogReporter _stopScreeningEventIfNecessaryForCall:](self, "_stopScreeningEventIfNecessaryForCall:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPowerLogReporter callStateContext](self, "callStateContext"));

    if (!a5 && v9) {
      -[CSDPowerLogReporter _registerCallStopEvent](self, "_registerCallStopEvent");
    }
  }

  else if (v7 == 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPowerLogReporter callStateContext](self, "callStateContext"));

    if (v8) {
      -[CSDPowerLogReporter _registerCallStopEvent](self, "_registerCallStopEvent");
    }
    -[CSDPowerLogReporter _registerCallStartEventForCall:](self, "_registerCallStartEventForCall:", v10);
  }
}

- (void)reportingController:(id)a3 callEnteredForeground:(id)a4
{
  id v6 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPowerLogReporter visibilityContext](self, "visibilityContext"));

  if (v5) {
    -[CSDPowerLogReporter _registerCallBackgroundedEvent](self, "_registerCallBackgroundedEvent");
  }
  -[CSDPowerLogReporter _registerCallForegroundedEventForCall:](self, "_registerCallForegroundedEventForCall:", v6);
}

- (void)allCallsBackgroundedForReportingController:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPowerLogReporter visibilityContext](self, "visibilityContext", a3));

  if (v4) {
    -[CSDPowerLogReporter _registerCallBackgroundedEvent](self, "_registerCallBackgroundedEvent");
  }
}

- (void)reportingController:(id)a3 didEndSession:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  id v16 = a4;
  id v9 = a5;
  id v10 = a6;
  v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v16 activity]);
  v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[NSMutableDictionary bundleIdentifier](v11, "bundleIdentifier"));
  v13 = v12;
  if (!v9 || !v12) {
    goto LABEL_5;
  }

  if (v10)
  {
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v16 activity]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v15, @"bundleID");

    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v9, @"timestamp");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, @"timestampEnd");
    v13 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[CSDPowerLogReporter eventBlock](self, "eventBlock"));
    ((void (**)(void, const __CFString *, NSMutableDictionary *))v13)[2]( v13,  @"GroupSessionEventEnded",  v11);
LABEL_5:
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &off_1003D9348)
  {
    if (objc_msgSend(a3, "isEqualToString:", TUCallScreeningDisabledKey, a4, a5))
    {
      uint64_t v7 = TUCallScreeningDisabledUserDefault() ^ 1;
      -[CSDPowerLogReporter _reportScreeningEnabledEvent:](self, "_reportScreeningEnabledEvent:", v7);
    }
  }

- (void)_registerEventWithContext:(id)a3 status:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10)
  {
    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPowerLogReporter eventBlock](self, "eventBlock"));

      if (v7)
      {
        id v8 = [v10 mutableCopy];
        [v8 setObject:v6 forKeyedSubscript:@"status"];
        id v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[CSDPowerLogReporter eventBlock](self, "eventBlock"));
        ((void (**)(void, const __CFString *, id))v9)[2](v9, @"CallState", v8);
      }
    }
  }
}

- (void)_registerCallStartEventForCall:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPowerLogReporter _contextDictionaryWithCall:](self, "_contextDictionaryWithCall:", a3));
  -[CSDPowerLogReporter setCallStateContext:](self, "setCallStateContext:", v4);

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDPowerLogReporter callStateContext](self, "callStateContext"));
  -[CSDPowerLogReporter _registerEventWithContext:status:]( self,  "_registerEventWithContext:status:",  v5,  @"callStart");
}

- (void)_registerCallStopEvent
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPowerLogReporter callStateContext](self, "callStateContext"));
  -[CSDPowerLogReporter _registerEventWithContext:status:]( self,  "_registerEventWithContext:status:",  v3,  @"callStop");

  -[CSDPowerLogReporter setCallStateContext:](self, "setCallStateContext:", 0LL);
}

- (void)_registerCallForegroundedEventForCall:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPowerLogReporter _contextDictionaryWithCall:](self, "_contextDictionaryWithCall:", a3));
  -[CSDPowerLogReporter setVisibilityContext:](self, "setVisibilityContext:", v4);

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDPowerLogReporter visibilityContext](self, "visibilityContext"));
  -[CSDPowerLogReporter _registerEventWithContext:status:]( self,  "_registerEventWithContext:status:",  v5,  @"callForegrounded");
}

- (void)_registerCallBackgroundedEvent
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPowerLogReporter visibilityContext](self, "visibilityContext"));
  -[CSDPowerLogReporter _registerEventWithContext:status:]( self,  "_registerEventWithContext:status:",  v3,  @"callBackgrounded");

  -[CSDPowerLogReporter setVisibilityContext:](self, "setVisibilityContext:", 0LL);
}

- (void)_reportScreeningEventForCall:(id)a3
{
  id v8 = a3;
  if ([v8 isScreening])
  {
    objc_super v4 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  (*((uint64_t (**)(void))self->_systemTimeProvider + 2))());
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPowerLogReporter screeningCalls](self, "screeningCalls"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueProxyIdentifier]);
    [v6 setObject:v5 forKeyedSubscript:v7];
  }

  else
  {
    -[CSDPowerLogReporter _reportScreeningDurationEventForCall:](self, "_reportScreeningDurationEventForCall:", v8);
  }
}

- (void)_stopScreeningEventIfNecessaryForCall:(id)a3
{
  id v9 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPowerLogReporter screeningCalls](self, "screeningCalls"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  if (v6)
  {
    -[CSDPowerLogReporter _reportScreeningDurationEventForCall:](self, "_reportScreeningDurationEventForCall:", v9);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPowerLogReporter screeningCalls](self, "screeningCalls"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueProxyIdentifier]);
    [v7 setObject:0 forKeyedSubscript:v8];
  }
}

- (void)_reportScreeningEnabledEvent:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v5, @"Enabled");

  id v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[CSDPowerLogReporter eventBlock](self, "eventBlock"));
  ((void (**)(void, const __CFString *, NSMutableDictionary *))v6)[2]( v6,  @"CallScreeningEnabled",  v7);
}

- (void)_reportScreeningDurationEventForCall:(id)a3
{
  id v15 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPowerLogReporter screeningCalls](self, "screeningCalls"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  if (v6)
  {
    uint64_t v7 = (*((uint64_t (**)(void))self->_systemTimeProvider + 2))();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPowerLogReporter screeningCalls](self, "screeningCalls"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueProxyIdentifier]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);
    double v11 = (double)(unint64_t)(v7 - (void)[v10 unsignedLongLongValue]);

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v11 / 1000000000.0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v13, @"Duration");

    v14 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[CSDPowerLogReporter eventBlock](self, "eventBlock"));
    ((void (**)(void, const __CFString *, NSMutableDictionary *))v14)[2]( v14,  @"CallScreeningDuration",  v12);
  }
}

- (id)_contextDictionaryWithCall:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPowerLogReporter _bundleIdentifierForCall:](self, "_bundleIdentifierForCall:", v4));
  [v5 setObject:v6 forKeyedSubscript:@"bundleID"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 identifier]);
  [v5 setObject:v8 forKeyedSubscript:@"providerIdentifier"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
  LOBYTE(v8) = [v9 isFaceTimeProvider];

  if ((v8 & 1) == 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 providerContext]);
    [v5 setObject:v10 forKeyedSubscript:@"providerContext"];
  }

  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isVideo]));
  [v5 setObject:v11 forKeyedSubscript:@"video"];

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 isHostedOnCurrentDevice]));
  [v5 setObject:v12 forKeyedSubscript:@"hostedOnCurrentDevice"];

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 isEndpointOnCurrentDevice]));
  [v5 setObject:v13 forKeyedSubscript:@"endpointOnCurrentDevice"];

  return v5;
}

- (id)_bundleIdentifierForCall:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 provider]);
  unsigned int v5 = [v4 isTelephonyProvider];

  if (!v5)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 provider]);
    unsigned int v9 = [v8 isFaceTimeProvider];

    if (!v9)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v3 provider]);
      double v11 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);

      goto LABEL_8;
    }

    goto LABEL_5;
  }

  id v6 = +[TUCallCapabilities supportsPrimaryCalling](&OBJC_CLASS___TUCallCapabilities, "supportsPrimaryCalling");
  if (!(_DWORD)v6)
  {
LABEL_5:
    uint64_t v10 = TUPreferredFaceTimeBundleIdentifier(v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue(v10);
    goto LABEL_6;
  }

  id v7 = TUBundleIdentifierMobilePhoneApplication;
LABEL_6:
  double v11 = v7;
LABEL_8:

  return v11;
}

- (id)systemTimeProvider
{
  return self->_systemTimeProvider;
}

- (void)setSystemTimeProvider:(id)a3
{
}

- (id)eventBlock
{
  return self->_eventBlock;
}

- (void)setEventBlock:(id)a3
{
}

- (NSDictionary)callStateContext
{
  return self->_callStateContext;
}

- (void)setCallStateContext:(id)a3
{
}

- (NSDictionary)visibilityContext
{
  return self->_visibilityContext;
}

- (void)setVisibilityContext:(id)a3
{
}

- (NSMutableDictionary)screeningCalls
{
  return self->_screeningCalls;
}

- (void)setScreeningCalls:(id)a3
{
}

- (void).cxx_destruct
{
}

@end