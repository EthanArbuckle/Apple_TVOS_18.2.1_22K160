@interface ADCallStateContextProvider
- (ADCallStateContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4;
- (void)_donateCallStateContextWithSnapshot:(id)a3 completion:(id)a4;
- (void)callObserver:(id)a3 callStateDidChangeFrom:(unint64_t)a4 to:(unint64_t)a5 isDropInCallDidChangeTo:(BOOL)a6;
- (void)callObserver:(id)a3 onSpeakerDidChange:(BOOL)a4;
- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6;
@end

@implementation ADCallStateContextProvider

- (ADCallStateContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ADCallStateContextProvider;
  v9 = -[ADCallStateContextProvider init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_donationService, a3);
    if (v8) {
      v11 = (AFInstanceContext *)v8;
    }
    else {
      v11 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue( +[AFInstanceContext defaultContext]( &OBJC_CLASS___AFInstanceContext,  "defaultContext"));
    }
    instanceContext = v10->_instanceContext;
    v10->_instanceContext = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___ADCallObserver);
    observer = v10->_observer;
    v10->_observer = v13;

    -[ADCallObserver startObservingCallStateWithDelegate:](v10->_observer, "startObservingCallStateWithDelegate:", v10);
    -[AFContextDonation registerContextTransformer:forType:]( v10->_donationService,  "registerContextTransformer:forType:",  v10,  AFDeviceContextKeyCallState);
  }

  return v10;
}

- (void)callObserver:(id)a3 callStateDidChangeFrom:(unint64_t)a4 to:(unint64_t)a5 isDropInCallDidChangeTo:(BOOL)a6
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1002761AC;
  v17[3] = &unk_1004F8C60;
  v17[4] = self;
  v17[5] = a4;
  v9 = -[AFCallStateSnapshot initWithBuilder:](objc_alloc(&OBJC_CLASS___AFCallStateSnapshot), "initWithBuilder:", v17);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100276218;
  v15[3] = &unk_1004F8C88;
  v15[4] = self;
  v15[5] = a5;
  BOOL v16 = a6;
  v10 = -[AFCallStateSnapshot initWithBuilder:](objc_alloc(&OBJC_CLASS___AFCallStateSnapshot), "initWithBuilder:", v15);
  v11 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AFCallStateSnapshot description](v9, "description"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AFCallStateSnapshot description](v10, "description"));
    *(_DWORD *)buf = 136315650;
    v19 = "-[ADCallStateContextProvider callObserver:callStateDidChangeFrom:to:isDropInCallDidChangeTo:]";
    __int16 v20 = 2112;
    v21 = v13;
    __int16 v22 = 2112;
    v23 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s #hal from = %@, to = %@", buf, 0x20u);
  }

  -[ADCallStateContextProvider _donateCallStateContextWithSnapshot:completion:]( self,  "_donateCallStateContextWithSnapshot:completion:",  v10,  0LL);
}

- (void)callObserver:(id)a3 onSpeakerDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[ADCallStateContextProvider callObserver:onSpeakerDidChange:]";
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s #hal call onSpeaker=%d", buf, 0x12u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10027613C;
  v8[3] = &unk_1004F8CB0;
  v8[4] = self;
  BOOL v9 = v4;
  id v7 = -[AFCallStateSnapshot initWithBuilder:](objc_alloc(&OBJC_CLASS___AFCallStateSnapshot), "initWithBuilder:", v8);
  -[ADCallStateContextProvider _donateCallStateContextWithSnapshot:completion:]( self,  "_donateCallStateContextWithSnapshot:completion:",  v7,  0LL);
}

- (void)_donateCallStateContextWithSnapshot:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dateByAddingTimeInterval:7200.0]);
  id v10 = objc_alloc(&OBJC_CLASS___AFDeviceContextMetadata);
  id v11 = [v10 initWithType:AFDeviceContextKeyCallState deliveryDate:v8 expirationDate:v9 redactedKeyPaths:0 historyConfiguration:0];
  __int16 v12 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    currentState = self->_currentState;
    log = v12;
    id v15 = -[AFCallStateSnapshot callState](currentState, "callState");
    uint64_t Names = AFCallStateGetNames(v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(Names);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 componentsJoinedByString:@"|"]);
    unsigned int v20 = -[AFCallStateSnapshot onSpeaker](self->_currentState, "onSpeaker");
    unsigned int v21 = -[AFCallStateSnapshot isDropInCall](self->_currentState, "isDropInCall");
    *(_DWORD *)buf = 136315906;
    v32 = "-[ADCallStateContextProvider _donateCallStateContextWithSnapshot:completion:]";
    __int16 v33 = 2112;
    v34 = v19;
    __int16 v35 = 1024;
    unsigned int v36 = v20;
    __int16 v37 = 1024;
    unsigned int v38 = v21;
    _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%s #hal Previous callState: %@, onSpeaker: %d, isDropInCall: %d",  buf,  0x22u);

    __int16 v12 = (void *)AFSiriLogContextDaemon;
  }

  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEBUG))
  {
    __int16 v22 = v12;
    id v23 = [v6 callState];
    uint64_t v25 = AFCallStateGetNames(v23, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 componentsJoinedByString:@"|"]);
    unsigned int v28 = [v6 onSpeaker];
    unsigned int v29 = [v6 isDropInCall];
    *(_DWORD *)buf = 136315906;
    v32 = "-[ADCallStateContextProvider _donateCallStateContextWithSnapshot:completion:]";
    __int16 v33 = 2112;
    v34 = v27;
    __int16 v35 = 1024;
    unsigned int v36 = v28;
    __int16 v37 = 1024;
    unsigned int v38 = v29;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "%s #hal New callState: %@, onSpeaker: %d, isDropInCall: %d",  buf,  0x22u);
  }

  -[AFContextDonation donateContext:withMetadata:pushToRemote:]( self->_donationService,  "donateContext:withMetadata:pushToRemote:",  v6,  v11,  0LL);
  BOOL v13 = self->_currentState;
  self->_currentState = (AFCallStateSnapshot *)v6;

  if (v7) {
    v7[2](v7);
  }
}

- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6
{
}

- (void).cxx_destruct
{
}

@end