@interface ADSiriClientStateContextProvider
- (ADSiriClientStateContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4 queue:(id)a5;
- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6;
- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5;
@end

@implementation ADSiriClientStateContextProvider

- (ADSiriClientStateContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___ADSiriClientStateContextProvider;
  v11 = -[ADSiriClientStateContextProvider init](&v22, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_donationService, v8);
    if (v9) {
      v13 = (AFInstanceContext *)v9;
    }
    else {
      v13 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue( +[AFInstanceContext currentContext]( &OBJC_CLASS___AFInstanceContext,  "currentContext"));
    }
    instanceContext = v12->_instanceContext;
    v12->_instanceContext = v13;

    v15 = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  "com.apple.siri.client-state-changed");
    uint64_t EffectiveNotificationName = AFNotifyGetEffectiveNotificationName(v15, v12->_instanceContext);
    v17 = (void *)objc_claimAutoreleasedReturnValue(EffectiveNotificationName);

    v18 = -[AFNotifyObserver initWithName:options:queue:delegate:]( objc_alloc(&OBJC_CLASS___AFNotifyObserver),  "initWithName:options:queue:delegate:",  v17,  1LL,  v10,  v12);
    observer = v12->_observer;
    v12->_observer = v18;

    id WeakRetained = objc_loadWeakRetained((id *)&v12->_donationService);
    [WeakRetained registerContextTransformer:v12 forType:AFDeviceContextKeySiriClientState];
  }

  return v12;
}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 136315650;
    v18 = "-[ADSiriClientStateContextProvider notifyObserver:didChangeStateFrom:to:]";
    __int16 v19 = 2048;
    unint64_t v20 = a4;
    __int16 v21 = 2048;
    unint64_t v22 = a5;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s AFSiriClientState changed from %llu to %llu",  (uint8_t *)&v17,  0x20u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v10 = [[AFDeviceContextHistoryConfiguration alloc] initWithKeepsHistory:1 historyBufferSize:3];
  id v11 = objc_alloc(&OBJC_CLASS___AFDeviceContextMetadata);
  uint64_t v12 = AFDeviceContextKeySiriClientState;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v9,  60.0));
  id v14 = [v11 initWithType:v12 deliveryDate:v9 expirationDate:v13 redactedKeyPaths:0 historyConfiguration:v10];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_donationService);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a5));
  [WeakRetained donateContext:v16 withMetadata:v14 pushToRemote:0];
}

- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6
{
  v7 = (void (*)(id, id, id))*((void *)a6 + 2);
  if (a5 == 10) {
    v7(a6, a3, a4);
  }
  else {
    ((void (*)(id, void, void, id))v7)(a6, 0LL, 0LL, a4);
  }
}

- (void).cxx_destruct
{
}

@end