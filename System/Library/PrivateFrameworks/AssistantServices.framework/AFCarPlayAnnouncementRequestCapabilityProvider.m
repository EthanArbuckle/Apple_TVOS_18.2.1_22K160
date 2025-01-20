@interface AFCarPlayAnnouncementRequestCapabilityProvider
+ (id)announceableIntentIdentifiersForUserNotificationAnnouncementType:(int64_t)a3;
+ (id)provider;
+ (id)requiredIntentIdentifiersForUserNotificationAnnouncementType:(int64_t)a3;
+ (int64_t)platform;
- (AFCarPlayAnnouncementRequestCapabilityProvider)initWithQueue:(id)a3;
- (unint64_t)_requestTypesForCarPlayAvailableOrConnected:(BOOL)a3;
- (unint64_t)lastKnownEligibleAnnouncementRequestTypes;
- (void)_availableAnnouncementRequestTypesForCarPlayConnectionWithCompletion:(id)a3;
- (void)_isCarPlayConnectedWithCompletion:(id)a3;
- (void)_notifyObserversOfUpdatedAvailableAnnouncementRequestTypes:(unint64_t)a3;
- (void)_setLastKnownAvailableAnnouncementRequestTypesAndNotifyObservers:(unint64_t)a3;
- (void)_updateForCarPlaySessionConnected:(BOOL)a3;
- (void)addDelegate:(id)a3;
- (void)fetchAvailableAnnouncementRequestTypesWithCompletion:(id)a3;
- (void)fetchEligibleAnnouncementRequestTypesWithCompletion:(id)a3;
- (void)isCarPlayConnectedWithCompletion:(id)a3;
- (void)updateForCarPlaySessionConnected:(BOOL)a3;
@end

@implementation AFCarPlayAnnouncementRequestCapabilityProvider

- (AFCarPlayAnnouncementRequestCapabilityProvider)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___AFCarPlayAnnouncementRequestCapabilityProvider;
  v6 = -[AFCarPlayAnnouncementRequestCapabilityProvider init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_providerQueue, a3);
    v7->_lastKnownAvailableAnnouncementRequestTypes = 0LL;
    v7->_lastKnownEligibleAnnouncementRequestTypes = 0LL;
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    delegates = v7->_delegates;
    v7->_delegates = (NSHashTable *)v8;

    v7->_lastKnownEligibleAnnouncementRequestTypes = -[AFCarPlayAnnouncementRequestCapabilityProvider _requestTypesForCarPlayAvailableOrConnected:]( v7,  "_requestTypesForCarPlayAvailableOrConnected:",  AFDeviceSupportsCarPlay());
  }

  return v7;
}

- (void)isCarPlayConnectedWithCompletion:(id)a3
{
  id v4 = a3;
  providerQueue = (dispatch_queue_s *)self->_providerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10014F24C;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(providerQueue, v7);
}

- (void)_isCarPlayConnectedWithCompletion:(id)a3
{
  v3 = (void (**)(id, void))a3;
  AFDeviceSupportsCarPlay();
  v3[2](v3, 0LL);
}

- (void)updateForCarPlaySessionConnected:(BOOL)a3
{
  providerQueue = (dispatch_queue_s *)self->_providerQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10014F23C;
  v4[3] = &unk_1004FC4D0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(providerQueue, v4);
}

- (void)_updateForCarPlaySessionConnected:(BOOL)a3
{
}

- (void)addDelegate:(id)a3
{
}

- (unint64_t)lastKnownEligibleAnnouncementRequestTypes
{
  return self->_lastKnownEligibleAnnouncementRequestTypes;
}

- (void)fetchEligibleAnnouncementRequestTypesWithCompletion:(id)a3
{
  id v4 = a3;
  providerQueue = (dispatch_queue_s *)self->_providerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10014F210;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(providerQueue, v7);
}

- (void)fetchAvailableAnnouncementRequestTypesWithCompletion:(id)a3
{
  id v4 = a3;
  providerQueue = (dispatch_queue_s *)self->_providerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10014F204;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(providerQueue, v7);
}

- (void)_availableAnnouncementRequestTypesForCarPlayConnectionWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10014F1C0;
  v4[3] = &unk_1004FC010;
  BOOL v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[AFCarPlayAnnouncementRequestCapabilityProvider isCarPlayConnectedWithCompletion:]( v5,  "isCarPlayConnectedWithCompletion:",  v4);
}

- (unint64_t)_requestTypesForCarPlayAvailableOrConnected:(BOOL)a3
{
  return a3;
}

- (void)_setLastKnownAvailableAnnouncementRequestTypesAndNotifyObservers:(unint64_t)a3
{
  if (self->_lastKnownAvailableAnnouncementRequestTypes != a3)
  {
    self->_lastKnownAvailableAnnouncementRequestTypes = a3;
    -[AFCarPlayAnnouncementRequestCapabilityProvider _notifyObserversOfUpdatedAvailableAnnouncementRequestTypes:]( self,  "_notifyObserversOfUpdatedAvailableAnnouncementRequestTypes:");
  }

- (void)_notifyObserversOfUpdatedAvailableAnnouncementRequestTypes:(unint64_t)a3
{
  BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[AFCarPlayAnnouncementRequestCapabilityProvider _notifyObserversOfUpdatedAvailableAnnouncementRequestTypes:]";
    __int16 v18 = 2048;
    unint64_t v19 = a3;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s Notifying observers, available announcement request types changed: %lu",  buf,  0x16u);
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v6 = self->_delegates;
  id v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend( *(id *)(*((void *)&v11 + 1) + 8 * (void)v10),  "provider:availableAnnouncementRequestTypesChanged:",  self,  a3,  (void)v11);
        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v8);
  }
}

- (void).cxx_destruct
{
}

+ (id)provider
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10014F714;
  block[3] = &unk_1004FCFF8;
  block[4] = a1;
  if (qword_100577F40 != -1) {
    dispatch_once(&qword_100577F40, block);
  }
  return (id)qword_100577F48;
}

+ (int64_t)platform
{
  return 2LL;
}

+ (id)announceableIntentIdentifiersForUserNotificationAnnouncementType:(int64_t)a3
{
  int IsValid = AFSiriUserNotificationAnnouncementTypeGetIsValid(a3, a2);
  BOOL v5 = 0LL;
  if (a3 == 1 && IsValid)
  {
    sub_10014F51C();
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v9 = v7;
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  }

  return v5;
}

+ (id)requiredIntentIdentifiersForUserNotificationAnnouncementType:(int64_t)a3
{
  if (a3 != 1) {
    return 0LL;
  }
  sub_10014F51C();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v13 = 0LL;
  __int128 v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  id v7 = (id *)qword_100577F60;
  uint64_t v16 = qword_100577F60;
  v17 = v6;
  if (!qword_100577F60)
  {
    id v8 = sub_10014F610();
    id v7 = (id *)dlsym(v8, "INSendMessageIntentIdentifier");
    v14[3] = (uint64_t)v7;
    qword_100577F60 = (uint64_t)v7;
  }

  _Block_object_dispose(&v13, 8);
  if (!v7)
  {
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getINSendMessageIntentIdentifier(void)"));
    objc_msgSend( v11,  "handleFailureInFunction:file:lineNumber:description:",  v12,  @"AFCarPlayAnnouncementRequestCapabilityProvider.m",  30,  @"%s",  dlerror(),  v13);

    __break(1u);
  }

  id v18 = *v7;
  id v9 = v18;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 2LL));

  return v10;
}

@end