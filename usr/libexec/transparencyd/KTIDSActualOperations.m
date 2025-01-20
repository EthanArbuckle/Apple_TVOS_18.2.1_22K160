@interface KTIDSActualOperations
+ (BOOL)ktVerifyError:(id)a3 code:(int64_t)a4;
+ (id)healableError:(id)a3 selfValidationResult:(id)a4;
- (BOOL)haveIDSAccount:(id)a3;
- (BOOL)registeredDelegate;
- (IDSAccountControllerProtocol)accountController;
- (IDSKeyTransparencyManager)manager;
- (IDSSignInController)idsSignInController;
- (KTIDSActualOperations)initWithIDSAccountController:(id)a3 lockStateTracker:(id)a4;
- (KTIDSSignInServiceUserInfo)lastMessagesStatus;
- (KTIDSSignInServiceUserInfo)lastPhoneAccountStatus;
- (KTLockStateTracker)lockStateTracker;
- (KTNearFutureScheduler)checkAccountNFS;
- (KTVerificationInfoProvider)provider;
- (NSArray)idsAccounts;
- (NSDate)timeOfLastUpsell;
- (OS_dispatch_queue)idsControllerQueue;
- (OS_dispatch_queue)idsQueue;
- (OS_dispatch_queue)workQueue;
- (double)checkIDSTimeoutSeconds;
- (double)sleepTimeBetweenIDSCheckups;
- (id)idsObserver;
- (unint64_t)_serviceTypeForName:(id)a3;
- (unint64_t)idsAccountType;
- (void)accountController:(id)a3 accountAdded:(id)a4;
- (void)accountController:(id)a3 accountDisabled:(id)a4;
- (void)accountController:(id)a3 accountEnabled:(id)a4;
- (void)accountController:(id)a3 accountRemoved:(id)a4;
- (void)accountController:(id)a3 accountUpdated:(id)a4;
- (void)cacheClearRequest:(id)a3;
- (void)checkAccountChange;
- (void)dealloc;
- (void)drain;
- (void)fetchKTRegistrationStatus:(id)a3;
- (void)fetchPeerVerificationInfos:(id)a3 application:(id)a4 completionBlock:(id)a5;
- (void)fetchSelfVerificationInfo:(id)a3 completionBlock:(id)a4;
- (void)getKeyTransparencyOptInEligiblityForApplication:(id)a3 withCompletion:(id)a4;
- (void)onQueueDrain;
- (void)onQueueProcessStatus:(id)a3;
- (void)peerVerificationFinishedWithResults:(id)a3;
- (void)registrationDataNeedsUpdate:(id)a3;
- (void)sendOptInUpdateRequest:(id)a3 withCompletion:(id)a4;
- (void)setAccountController:(id)a3;
- (void)setCheckAccountNFS:(id)a3;
- (void)setCheckIDSTimeoutSeconds:(double)a3;
- (void)setIdsAccounts:(id)a3;
- (void)setIdsControllerQueue:(id)a3;
- (void)setIdsObserver:(id)a3;
- (void)setIdsQueue:(id)a3;
- (void)setIdsSignInController:(id)a3;
- (void)setLastMessagesStatus:(id)a3;
- (void)setLastPhoneAccountStatus:(id)a3;
- (void)setLockStateTracker:(id)a3;
- (void)setManager:(id)a3;
- (void)setProvider:(id)a3;
- (void)setRegisteredDelegate:(BOOL)a3;
- (void)setSleepTimeBetweenIDSCheckups:(double)a3;
- (void)setTimeOfLastUpsell:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)signInController:(id)a3 service:(unint64_t)a4 didChangeStatus:(id)a5;
- (void)triggerIDSCheck:(id)a3 selfValidationResult:(id)a4 complete:(id)a5;
@end

@implementation KTIDSActualOperations

- (KTIDSActualOperations)initWithIDSAccountController:(id)a3 lockStateTracker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___KTIDSActualOperations;
  v8 = -[KTIDSActualOperations init](&v31, "init");
  if (v8)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___IDSKeyTransparencyManager);
    -[KTIDSActualOperations setManager:](v8, "setManager:", v9);

    dispatch_queue_t v10 = dispatch_queue_create("KTIDSActualOperations", 0LL);
    -[KTIDSActualOperations setIdsQueue:](v8, "setIdsQueue:", v10);

    dispatch_queue_t v11 = dispatch_queue_create("KTIDSActualOperations-idsController", 0LL);
    -[KTIDSActualOperations setIdsControllerQueue:](v8, "setIdsControllerQueue:", v11);

    dispatch_queue_t v12 = dispatch_queue_create("KTIDSActualOperations-work", 0LL);
    -[KTIDSActualOperations setWorkQueue:](v8, "setWorkQueue:", v12);

    v13 = objc_alloc(&OBJC_CLASS___IDSSignInController);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsQueue](v8, "idsQueue"));
    v15 = -[IDSSignInController initWithQueue:](v13, "initWithQueue:", v14);
    -[KTIDSActualOperations setIdsSignInController:](v8, "setIdsSignInController:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsSignInController](v8, "idsSignInController"));
    [v16 setDelegate:v8 forService:1];

    -[KTIDSActualOperations setCheckIDSTimeoutSeconds:](v8, "setCheckIDSTimeoutSeconds:", 90.0);
    -[KTIDSActualOperations setSleepTimeBetweenIDSCheckups:](v8, "setSleepTimeBetweenIDSCheckups:", 10.0);
    -[KTIDSActualOperations setAccountController:](v8, "setAccountController:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations accountController](v8, "accountController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsQueue](v8, "idsQueue"));
    [v17 addDelegate:v8 queue:v18];

    -[KTIDSActualOperations setRegisteredDelegate:](v8, "setRegisteredDelegate:", 1LL);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    -[KTIDSActualOperations setIdsAccounts:](v8, "setIdsAccounts:", v19);

    -[KTIDSActualOperations setLockStateTracker:](v8, "setLockStateTracker:", v7);
    id location = 0LL;
    objc_initWeak(&location, v8);
    v20 = objc_alloc(&OBJC_CLASS___KTNearFutureScheduler);
    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472LL;
    v27 = sub_10019E0D0;
    v28 = &unk_100276D20;
    objc_copyWeak(&v29, &location);
    v21 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v20,  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"KTIDSAccountChecker",  1000000000LL,  60000000000LL,  0LL,  0LL,  &v25,  1.2);
    -[KTIDSActualOperations setCheckAccountNFS:](v8, "setCheckAccountNFS:", v21, v25, v26, v27, v28);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations checkAccountNFS](v8, "checkAccountNFS"));
    [v22 trigger];

    v23 = v8;
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)drain
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsControllerQueue](self, "idsControllerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10019E1F0;
  block[3] = &unk_100276740;
  block[4] = self;
  dispatch_sync(v3, block);

  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsQueue](self, "idsQueue"));
  dispatch_sync(v4, &stru_100287BF0);
}

- (void)onQueueDrain
{
  if (-[KTIDSActualOperations registeredDelegate](self, "registeredDelegate"))
  {
    -[KTIDSActualOperations setRegisteredDelegate:](self, "setRegisteredDelegate:", 0LL);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations checkAccountNFS](self, "checkAccountNFS"));
    [v3 cancel];

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations accountController](self, "accountController"));
    [v4 removeDelegate:self];

    id v5 = (id)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsSignInController](self, "idsSignInController"));
    [v5 removeDelegateForService:1];
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___KTIDSActualOperations;
  -[KTIDSActualOperations dealloc](&v3, "dealloc");
}

- (void)checkAccountChange
{
  id location = 0LL;
  objc_initWeak(&location, self);
  objc_super v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsControllerQueue](self, "idsControllerQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations accountController](self, "accountController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accounts]);

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        dispatch_queue_t v10 = -[KTIDSAccountHolder initWithIDSAccount:]( objc_alloc(&OBJC_CLASS___KTIDSAccountHolder),  "initWithIDSAccount:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v9));
        if (v10) {
          [v4 addObject:v10];
        }

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }

    while (v7);
  }

  -[KTIDSActualOperations setIdsAccounts:](self, "setIdsAccounts:", v4);
  dispatch_queue_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsSignInController](self, "idsSignInController"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10019E518;
  v12[3] = &unk_100287C58;
  v12[4] = self;
  objc_copyWeak(&v13, &location);
  [v11 statusOfUsersOnService:1 withCompletion:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

+ (BOOL)ktVerifyError:(id)a3 code:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  else {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)healableError:(id)a3 selfValidationResult:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(&OBJC_CLASS___KTSelfVerificationHealableErrors);
  [v6 addHealableState:1];
  if (!v5) {
    [v6 addAccountHealableError:0];
  }
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v5 resultError]);
  unsigned __int8 v8 = [a1 ktVerifyError:v7 code:-271];

  if ((v8 & 1) != 0)
  {
    uint64_t v9 = 2LL;
LABEL_7:
    [v6 addAccountHealableError:v9];
    goto LABEL_8;
  }

  dispatch_queue_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 resultError]);
  unsigned int v11 = [a1 ktVerifyError:v10 code:-289];

  if (v11)
  {
    uint64_t v9 = 7LL;
    goto LABEL_7;
  }

- (void)triggerIDSCheck:(id)a3 selfValidationResult:(id)a4 complete:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "healableError:selfValidationResult:", v10, v9);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations manager](self, "manager"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 verificationInfoProviderIdForApplication:v10]);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10019ED3C;
  v17[3] = &unk_100287CA0;
  id v18 = v8;
  id v16 = v8;
  [v15 healSelf:v13 completionBlock:v17];
}

- (void)fetchPeerVerificationInfos:(id)a3 application:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations manager](self, "manager"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 verificationInfoProviderIdForApplication:v10]);

  if (v12)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10019EF44;
    v13[3] = &unk_100276DF8;
    id v14 = v9;
    [v12 fetchPeerVerificationInfos:v8 completionBlock:v13];
  }

  else
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, 0LL);
  }
}

- (void)fetchSelfVerificationInfo:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations manager](self, "manager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 verificationInfoProviderIdForApplication:v7]);

  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10019F024;
    v10[3] = &unk_100287CC8;
    id v11 = v6;
    [v9 fetchSelfVerificationInfo:v10];
  }

  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
  }
}

- (void)getKeyTransparencyOptInEligiblityForApplication:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations manager](self, "manager"));
  [v8 getKeyTransparencyOptInEligiblityForApplication:v7 withCompletion:v6];
}

- (void)sendOptInUpdateRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = objc_alloc_init(&OBJC_CLASS___IDSKTOptInOutRequest);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10019F184;
  v11[3] = &unk_100287CF0;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v8 = v12;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];

  [v10 setApplicationsToOptInStatusData:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations manager](self, "manager"));
  [v9 sendOptInUpdateRequest:v10 withCompletion:v6];
}

- (void)registrationDataNeedsUpdate:(id)a3
{
  id v4 = a3;
  if (qword_1002EED10 != -1) {
    dispatch_once(&qword_1002EED10, &stru_100287D10);
  }
  id v5 = (os_log_s *)qword_1002EED18;
  if (os_log_type_enabled((os_log_t)qword_1002EED18, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "registrationDataNeedsUpdate reason: %@",  (uint8_t *)&v7,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations manager](self, "manager"));
  [v6 registrationDataNeedsUpdate];
}

- (void)fetchKTRegistrationStatus:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations manager](self, "manager"));
  [v5 fetchKTRegistrationStatusWithCompletion:v4];
}

- (void)peerVerificationFinishedWithResults:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations manager](self, "manager"));
  [v5 peerVerificationFinishedWithResults:v4];
}

- (void)cacheClearRequest:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations manager](self, "manager"));
  [v5 cacheClearRequest:v4];
}

- (BOOL)haveIDSAccount:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"D:%@", a3));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsAccounts](self, "idsAccounts"));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ([v9 accountType] == 1)
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 idsDSID]);
          unsigned __int8 v11 = [v10 isEqual:v4];

          if ((v11 & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (unint64_t)idsAccountType
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations messagesStatus](self, "messagesStatus"));
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations messagesStatus](self, "messagesStatus"));
    id v6 = [v5 status];

    if (v6 == (id)3) {
      return 3LL;
    }
  }

  unint64_t result = objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations lastPhoneAccountStatus](self, "lastPhoneAccountStatus"));
  if (result)
  {
    id v8 = (void *)result;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations lastPhoneAccountStatus](self, "lastPhoneAccountStatus"));
    id v10 = [v9 status];

    if (v10 == (id)3)
    {
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations messagesStatus](self, "messagesStatus"));

      if (v11) {
        return 2LL;
      }
      else {
        return 1LL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

- (void)onQueueProcessStatus:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsQueue](self, "idsQueue"));
  dispatch_assert_queue_V2(v5);

  if ([v4 type])
  {
    if ([v4 type] == (id)1)
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations lastMessagesStatus](self, "lastMessagesStatus"));
      if (v6
        && (uint64_t v7 = (void *)v6,
            id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations lastMessagesStatus](self, "lastMessagesStatus")),
            id v9 = [v8 status],
            id v10 = [v4 status],
            v8,
            v7,
            v9 == v10))
      {
        if (qword_1002EED10 != -1) {
          dispatch_once(&qword_1002EED10, &stru_100287D30);
        }
        unsigned __int8 v11 = (os_log_s *)qword_1002EED18;
        if (os_log_type_enabled((os_log_t)qword_1002EED18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "no change", buf, 2u);
        }
      }

      else
      {
        -[KTIDSActualOperations setLastMessagesStatus:](self, "setLastMessagesStatus:", v4);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsObserver](self, "idsObserver"));

        if (v12)
        {
          __int128 v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations workQueue](self, "workQueue"));
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472LL;
          v14[2] = sub_10019F864;
          v14[3] = &unk_1002777A0;
          id v15 = v4;
          __int128 v16 = self;
          dispatch_async(v13, v14);
        }
      }
    }
  }

  else
  {
    -[KTIDSActualOperations setLastPhoneAccountStatus:](self, "setLastPhoneAccountStatus:", v4);
  }
}

- (void)signInController:(id)a3 service:(unint64_t)a4 didChangeStatus:(id)a5
{
  int v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (qword_1002EED10 != -1) {
    dispatch_once(&qword_1002EED10, &stru_100287D70);
  }
  id v10 = (os_log_s *)qword_1002EED18;
  if (os_log_type_enabled((os_log_t)qword_1002EED18, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109378;
    v12[1] = v6;
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "signInController:service:didChangeStatus: %d/%@",  (uint8_t *)v12,  0x12u);
  }

  unsigned __int8 v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations idsQueue](self, "idsQueue"));
  dispatch_assert_queue_V2(v11);
}

- (unint64_t)_serviceTypeForName:(id)a3
{
  return [a3 isEqualToString:IDSServiceNameFaceTime] ^ 1;
}

- (void)accountController:(id)a3 accountAdded:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1002EED10 != -1) {
    dispatch_once(&qword_1002EED10, &stru_100287D90);
  }
  id v8 = (os_log_s *)qword_1002EED18;
  if (os_log_type_enabled((os_log_t)qword_1002EED18, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "accountController:accountAdded: %@",  (uint8_t *)&v12,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceName]);
  unint64_t v10 = -[KTIDSActualOperations _serviceTypeForName:](self, "_serviceTypeForName:", v9);

  if (v10 == 1)
  {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations checkAccountNFS](self, "checkAccountNFS"));
    [v11 trigger];
  }
}

- (void)accountController:(id)a3 accountUpdated:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1002EED10 != -1) {
    dispatch_once(&qword_1002EED10, &stru_100287DB0);
  }
  id v8 = (os_log_s *)qword_1002EED18;
  if (os_log_type_enabled((os_log_t)qword_1002EED18, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "accountController:accountUpdated: %@",  (uint8_t *)&v12,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceName]);
  unint64_t v10 = -[KTIDSActualOperations _serviceTypeForName:](self, "_serviceTypeForName:", v9);

  if (v10 == 1)
  {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations checkAccountNFS](self, "checkAccountNFS"));
    [v11 trigger];
  }
}

- (void)accountController:(id)a3 accountRemoved:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1002EED10 != -1) {
    dispatch_once(&qword_1002EED10, &stru_100287DD0);
  }
  id v8 = (os_log_s *)qword_1002EED18;
  if (os_log_type_enabled((os_log_t)qword_1002EED18, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "accountController:accountRemoved: %@",  (uint8_t *)&v12,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceName]);
  unint64_t v10 = -[KTIDSActualOperations _serviceTypeForName:](self, "_serviceTypeForName:", v9);

  if (v10 == 1)
  {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations checkAccountNFS](self, "checkAccountNFS"));
    [v11 trigger];
  }
}

- (void)accountController:(id)a3 accountEnabled:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1002EED10 != -1) {
    dispatch_once(&qword_1002EED10, &stru_100287DF0);
  }
  id v8 = (os_log_s *)qword_1002EED18;
  if (os_log_type_enabled((os_log_t)qword_1002EED18, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "accountController:accountEnabled: %@",  (uint8_t *)&v12,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceName]);
  unint64_t v10 = -[KTIDSActualOperations _serviceTypeForName:](self, "_serviceTypeForName:", v9);

  if (v10 == 1)
  {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations checkAccountNFS](self, "checkAccountNFS"));
    [v11 trigger];
  }
}

- (void)accountController:(id)a3 accountDisabled:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1002EED10 != -1) {
    dispatch_once(&qword_1002EED10, &stru_100287E10);
  }
  id v8 = (os_log_s *)qword_1002EED18;
  if (os_log_type_enabled((os_log_t)qword_1002EED18, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "accountController:accountDisabled: %@",  (uint8_t *)&v12,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceName]);
  unint64_t v10 = -[KTIDSActualOperations _serviceTypeForName:](self, "_serviceTypeForName:", v9);

  if (v10 == 1)
  {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSActualOperations checkAccountNFS](self, "checkAccountNFS"));
    [v11 trigger];
  }
}

- (double)checkIDSTimeoutSeconds
{
  return self->checkIDSTimeoutSeconds;
}

- (void)setCheckIDSTimeoutSeconds:(double)a3
{
  self->checkIDSTimeoutSeconds = a3;
}

- (double)sleepTimeBetweenIDSCheckups
{
  return self->sleepTimeBetweenIDSCheckups;
}

- (void)setSleepTimeBetweenIDSCheckups:(double)a3
{
  self->sleepTimeBetweenIDSCheckups = a3;
}

- (id)idsObserver
{
  return objc_getProperty(self, a2, 32LL, 1);
}

- (void)setIdsObserver:(id)a3
{
}

- (NSDate)timeOfLastUpsell
{
  return (NSDate *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setTimeOfLastUpsell:(id)a3
{
}

- (NSArray)idsAccounts
{
  return (NSArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setIdsAccounts:(id)a3
{
}

- (KTIDSSignInServiceUserInfo)lastPhoneAccountStatus
{
  return (KTIDSSignInServiceUserInfo *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setLastPhoneAccountStatus:(id)a3
{
}

- (KTVerificationInfoProvider)provider
{
  return (KTVerificationInfoProvider *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setProvider:(id)a3
{
}

- (KTIDSSignInServiceUserInfo)lastMessagesStatus
{
  return (KTIDSSignInServiceUserInfo *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setLastMessagesStatus:(id)a3
{
}

- (KTLockStateTracker)lockStateTracker
{
  return (KTLockStateTracker *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setLockStateTracker:(id)a3
{
}

- (IDSKeyTransparencyManager)manager
{
  return (IDSKeyTransparencyManager *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setManager:(id)a3
{
}

- (OS_dispatch_queue)idsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setIdsQueue:(id)a3
{
}

- (OS_dispatch_queue)idsControllerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setIdsControllerQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (IDSSignInController)idsSignInController
{
  return (IDSSignInController *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setIdsSignInController:(id)a3
{
}

- (BOOL)registeredDelegate
{
  return self->_registeredDelegate;
}

- (void)setRegisteredDelegate:(BOOL)a3
{
  self->_registeredDelegate = a3;
}

- (IDSAccountControllerProtocol)accountController
{
  return (IDSAccountControllerProtocol *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setAccountController:(id)a3
{
}

- (KTNearFutureScheduler)checkAccountNFS
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setCheckAccountNFS:(id)a3
{
}

- (void).cxx_destruct
{
}

@end