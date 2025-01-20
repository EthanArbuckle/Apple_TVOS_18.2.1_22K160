@interface ADSystemStateContextProvider
- (ADSystemStateContextProvider)initWithDonationService:(id)a3;
- (void)_donateSystemStateContextWithSnapshot:(id)a3;
- (void)_handleSleepStateChangedToState:(int64_t)a3 fromState:(int64_t)a4;
- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6;
- (void)pineBoardSystemStateObserver:(id)a3 pineBoardStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5;
@end

@implementation ADSystemStateContextProvider

- (ADSystemStateContextProvider)initWithDonationService:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ADSystemStateContextProvider;
  v5 = -[ADSystemStateContextProvider init](&v13, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_donationService, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[AFPineBoardSystemStateObserver defaultObserver]( &OBJC_CLASS___AFPineBoardSystemStateObserver,  "defaultObserver"));
    [v7 addListener:v6];

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[AFPineBoardSystemStateObserver defaultObserver]( &OBJC_CLASS___AFPineBoardSystemStateObserver,  "defaultObserver"));
    v9 = (char *)[v8 pineBoardSystemState];
    else {
      uint64_t v10 = qword_1003C9F40[(void)(v9 - 1)];
    }

    -[ADSystemStateContextProvider _handleSleepStateChangedToState:fromState:]( v6,  "_handleSleepStateChangedToState:fromState:",  v10,  0LL);
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_donationService);
    [WeakRetained registerContextTransformer:v6 forType:AFDeviceContextKeySystemState];
  }

  return v6;
}

- (void)_handleSleepStateChangedToState:(int64_t)a3 fromState:(int64_t)a4
{
  if (a3 != a4)
  {
    v7 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      v9 = v7;
      uint64_t Name = AFSleepStateGetName(a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue(Name);
      uint64_t v12 = AFSleepStateGetName(a4);
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v14 = 136315650;
      v15 = "-[ADSystemStateContextProvider _handleSleepStateChangedToState:fromState:]";
      __int16 v16 = 2112;
      v17 = v11;
      __int16 v18 = 2112;
      v19 = v13;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s #hal to: %@, from: %@",  (uint8_t *)&v14,  0x20u);
    }

    id v8 = [[AFSystemStateSnapshot alloc] initWithSleepState:a3];
    -[ADSystemStateContextProvider _donateSystemStateContextWithSnapshot:]( self,  "_donateSystemStateContextWithSnapshot:",  v8);
  }

- (void)_donateSystemStateContextWithSnapshot:(id)a3
{
  id v4 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v9 dateByAddingTimeInterval:86400.0]);
  id v6 = objc_alloc(&OBJC_CLASS___AFDeviceContextMetadata);
  id v7 = [v6 initWithType:AFDeviceContextKeySystemState deliveryDate:v9 expirationDate:v5 redactedKeyPaths:0 historyConfiguration:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_donationService);
  [WeakRetained donateContext:v4 withMetadata:v7 pushToRemote:1];
}

- (void)pineBoardSystemStateObserver:(id)a3 pineBoardStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  else {
    uint64_t v5 = qword_1003C9F40[a5 - 1];
  }
  else {
    uint64_t v6 = qword_1003C9F40[a4 - 1];
  }
  -[ADSystemStateContextProvider _handleSleepStateChangedToState:fromState:]( self,  "_handleSleepStateChangedToState:fromState:",  v5,  v6);
}

- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6
{
}

- (void).cxx_destruct
{
}

@end