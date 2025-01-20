@interface MZKeyValueStoreClampsController
+ (BOOL)supportsSecureCoding;
+ (id)_classesForTransactionClampsValues;
+ (id)sharedClampsController;
- (BOOL)_canScheduleTransactionBasedOfNetworkingBlocked:(id)a3 error:(id *)a4;
- (BOOL)_canScheduleTransactionBasedOnBackOff:(id)a3 error:(id *)a4;
- (BOOL)_canScheduleTransactionBasedOnDSIDCheck:(id)a3 error:(id *)a4;
- (BOOL)_canScheduleTransactionBasedOnType:(id)a3 error:(id *)a4;
- (BOOL)_canScheduleTransactionBasedOnUserCancelledSignIn:(id)a3 error:(id *)a4;
- (BOOL)canScheduleTransaction:(id)a3 error:(id *)a4;
- (BOOL)hasAuthenticatedTooRecentlyForTransaction:(id)a3 error:(id *)a4;
- (BOOL)hasUserRecentlyAcceptedSync;
- (BOOL)isNetworkingBlocked;
- (MZKeyValueStoreClampsController)init;
- (MZKeyValueStoreClampsController)initWithCoder:(id)a3;
- (NSData)pendingUserDefaultArchivedData;
- (NSDictionary)transactionClamps;
- (OS_dispatch_queue)queue;
- (double)_rightNow;
- (double)authenticationNeededTimestamp;
- (double)backOffUntil;
- (double)dsidCheckTimestamp;
- (double)networkingBlockedUntil;
- (double)nextUserCancelBackOffInterval;
- (double)userAcceptedSyncTimestamp;
- (double)userCancelledSignInBackOffUntil;
- (id)_keyForTransaction:(id)a3;
- (id)description;
- (void)accessTransactionClampsWithBlock:(id)a3;
- (void)backOffForTimeInterval:(double)a3;
- (void)clearAuthenticationRequest;
- (void)clearBackOff;
- (void)clearDSIDCheckTimestamp;
- (void)clearNetworkingBlocked;
- (void)clearTimestampForTransaction:(id)a3;
- (void)clearUserAcceptedSyncTimestamp;
- (void)clearUserCancelledSignIn;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)saveToUserDefaults;
- (void)setAuthenticationNeededTimestamp:(double)a3;
- (void)setAuthenticationRequest;
- (void)setBackOffUntil:(double)a3;
- (void)setDSIDCheckTimestamp;
- (void)setDsidCheckTimestamp:(double)a3;
- (void)setNetworkingBlocked;
- (void)setNetworkingBlockedUntil:(double)a3;
- (void)setNextUserCancelBackOffInterval:(double)a3;
- (void)setPendingUserDefaultArchivedData:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimestampForTransaction:(id)a3;
- (void)setTransactionClamps:(id)a3;
- (void)setUserAcceptedSyncTimestamp;
- (void)setUserAcceptedSyncTimestamp:(double)a3;
- (void)setUserCancelledSignIn;
- (void)setUserCancelledSignInBackOffUntil:(double)a3;
@end

@implementation MZKeyValueStoreClampsController

+ (id)sharedClampsController
{
  if (qword_1002B68E0 != -1) {
    dispatch_once(&qword_1002B68E0, &stru_1002407A8);
  }
  return (id)qword_1002B68E8;
}

- (MZKeyValueStoreClampsController)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MZKeyValueStoreClampsController;
  v2 = -[MZKeyValueStoreClampsController init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    transactionClamps = v2->_transactionClamps;
    v2->_transactionClamps = v3;

    v2->_nextUserCancelBackOffInterval = 300.0;
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MZKeyValueStoreClampsController", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  transactionClamps = self->_transactionClamps;
  id v6 = v4;
  if (transactionClamps)
  {
    [v4 encodeObject:transactionClamps forKey:@"MZTransactionClamps"];
    id v4 = v6;
  }

  if (fabs(self->_dsidCheckTimestamp) > 2.22044605e-16)
  {
    objc_msgSend(v6, "encodeDouble:forKey:", @"MZDSIDCheckTimestamp");
    id v4 = v6;
  }

  if (fabs(self->_authenticationNeededTimestamp) > 2.22044605e-16)
  {
    objc_msgSend(v6, "encodeDouble:forKey:", @"MZAuthenticationNeededTimestamp");
    id v4 = v6;
  }

  if (fabs(self->_userAcceptedSyncTimestamp) > 2.22044605e-16)
  {
    objc_msgSend(v6, "encodeDouble:forKey:", @"MZUserAcceptedSyncTimestamp");
    id v4 = v6;
  }

  if (fabs(self->_networkingBlockedUntil) > 2.22044605e-16)
  {
    objc_msgSend(v6, "encodeDouble:forKey:", @"MZNetworkingBlockedUntil");
    id v4 = v6;
  }

  if (fabs(self->_userCancelledSignInBackOffUntil) > 2.22044605e-16)
  {
    objc_msgSend(v6, "encodeDouble:forKey:", @"MZUserCancelledSignInBackOffUntil");
    id v4 = v6;
  }
}

- (MZKeyValueStoreClampsController)initWithCoder:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = -[MZKeyValueStoreClampsController init](self, "init");
  v7 = v5;
  if (v5)
  {
    id v8 = objc_msgSend((id)objc_opt_class(v5, v6), "_classesForTransactionClampsValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v9 forKey:@"MZTransactionClamps"]);
    id v11 = [v10 mutableCopy];

    if (v11)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100018F38;
      v18[3] = &unk_1002407D0;
      id v19 = v11;
      -[MZKeyValueStoreClampsController accessTransactionClampsWithBlock:](v7, "accessTransactionClampsWithBlock:", v18);
    }

    [v4 decodeDoubleForKey:@"MZDSIDCheckTimestamp"];
    v7->_dsidCheckTimestamp = v12;
    [v4 decodeDoubleForKey:@"MZAuthenticationNeededTimestamp"];
    v7->_authenticationNeededTimestamp = v13;
    [v4 decodeDoubleForKey:@"MZUserAcceptedSyncTimestamp"];
    v7->_userAcceptedSyncTimestamp = v14;
    [v4 decodeDoubleForKey:@"MZNetworkingBlockedUntil"];
    v7->_networkingBlockedUntil = v15;
    [v4 decodeDoubleForKey:@"MZUserCancelledSignInBackOffUntil"];
    v7->_userCancelledSignInBackOffUntil = v16;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)saveToUserDefaults
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreClampsController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100019084;
  block[3] = &unk_1002404E0;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(v3, block);

  if (*((_BYTE *)v8 + 24))
  {
    dispatch_time_t v4 = dispatch_time(0LL, 2000000000LL);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000190FC;
    v5[3] = &unk_10023FF98;
    v5[4] = self;
    dispatch_after(v4, &_dispatch_main_q, v5);
  }

  _Block_object_dispose(&v7, 8);
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  dispatch_time_t v4 = NSStringFromClass(v3);
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  self->_dsidCheckTimestamp));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  self->_authenticationNeededTimestamp));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  self->_userAcceptedSyncTimestamp));
  char v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  self->_networkingBlockedUntil));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  self->_backOffUntil));
  double v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  self->_userCancelledSignInBackOffUntil));
  double v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p>\n                             Current Date = %@\n                             dsidCheckTimestamp = %@\n                             authenticationNeededTimestamp = %@\n                             userAcceptedSyncTimestamp = %@\n                             networkingBlockedUntil = %@\n                             backOffUntil= %@\n                             userCancelledSignInBackOffUntil = %@",  v5,  self,  v6,  v7,  v8,  v9,  v10,  v11,  v12));

  return v13;
}

- (BOOL)canScheduleTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[MZKeyValueStoreClampsController _canScheduleTransactionBasedOfNetworkingBlocked:error:]( self,  "_canScheduleTransactionBasedOfNetworkingBlocked:error:",  v6,  a4)
    && -[MZKeyValueStoreClampsController _canScheduleTransactionBasedOnBackOff:error:]( self,  "_canScheduleTransactionBasedOnBackOff:error:",  v6,  a4)
    && -[MZKeyValueStoreClampsController _canScheduleTransactionBasedOnUserCancelledSignIn:error:]( self,  "_canScheduleTransactionBasedOnUserCancelledSignIn:error:",  v6,  a4)
    && -[MZKeyValueStoreClampsController _canScheduleTransactionBasedOnDSIDCheck:error:]( self,  "_canScheduleTransactionBasedOnDSIDCheck:error:",  v6,  a4))
  {
    BOOL v7 = -[MZKeyValueStoreClampsController _canScheduleTransactionBasedOnType:error:]( self,  "_canScheduleTransactionBasedOnType:error:",  v6,  a4);
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)accessTransactionClampsWithBlock:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreClampsController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000194CC;
  block[3] = &unk_100240138;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)reset
{
}

+ (id)_classesForTransactionClampsValues
{
  if (qword_1002B68F8 != -1) {
    dispatch_once(&qword_1002B68F8, &stru_100240830);
  }
  return (id)qword_1002B68F0;
}

- (void)setTimestampForTransaction:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001974C;
  v5[3] = &unk_1002407D0;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreClampsController _keyForTransaction:](self, "_keyForTransaction:", a3));
  id v4 = v6;
  -[MZKeyValueStoreClampsController accessTransactionClampsWithBlock:](self, "accessTransactionClampsWithBlock:", v5);
}

- (void)clearTimestampForTransaction:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100019834;
  v5[3] = &unk_1002407D0;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreClampsController _keyForTransaction:](self, "_keyForTransaction:", a3));
  id v4 = v6;
  -[MZKeyValueStoreClampsController accessTransactionClampsWithBlock:](self, "accessTransactionClampsWithBlock:", v5);
  -[MZKeyValueStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (void)setDSIDCheckTimestamp
{
}

- (void)clearDSIDCheckTimestamp
{
}

- (void)setAuthenticationRequest
{
}

- (void)clearAuthenticationRequest
{
}

- (BOOL)hasAuthenticatedTooRecentlyForTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[MZKeyValueStoreClampsController _rightNow](self, "_rightNow");
  double v8 = v7;
  -[MZKeyValueStoreClampsController authenticationNeededTimestamp](self, "authenticationNeededTimestamp");
  double v10 = v8 - v9;
  if (a4 && v10 < 1.0) {
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError userClampErrorWithTransaction:retrySeconds:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "userClampErrorWithTransaction:retrySeconds:underlyingError:",  v6,  0LL,  1.0 - v10));
  }

  return v10 < 1.0;
}

- (void)setUserAcceptedSyncTimestamp
{
}

- (void)clearUserAcceptedSyncTimestamp
{
}

- (BOOL)hasUserRecentlyAcceptedSync
{
  if (fabs(v3) > 2.22044605e-16
    && (-[MZKeyValueStoreClampsController _rightNow](self, "_rightNow"),
        double v5 = v4,
        -[MZKeyValueStoreClampsController userAcceptedSyncTimestamp](self, "userAcceptedSyncTimestamp"),
        v5 - v6 <= 60.0))
  {
    BOOL v7 = 1;
  }

  else
  {
    -[MZKeyValueStoreClampsController setUserAcceptedSyncTimestamp:](self, "setUserAcceptedSyncTimestamp:", 0.0);
    BOOL v7 = 0;
  }

  -[MZKeyValueStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
  return v7;
}

- (void)setUserCancelledSignIn
{
  self->_nextUserCancelBackOffInterval = fmin(self->_nextUserCancelBackOffInterval * 12.0, 18000.0);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v4 timeIntervalSinceReferenceDate];

  -[MZKeyValueStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (void)clearUserCancelledSignIn
{
  self->_nextUserCancelBackOffInterval = 300.0;
  -[MZKeyValueStoreClampsController setUserCancelledSignInBackOffUntil:]( self,  "setUserCancelledSignInBackOffUntil:",  0.0);
  -[MZKeyValueStoreClampsController saveToUserDefaults](self, "saveToUserDefaults");
}

- (void)backOffForTimeInterval:(double)a3
{
}

- (void)clearBackOff
{
}

- (void)setNetworkingBlocked
{
}

- (void)clearNetworkingBlocked
{
}

- (BOOL)isNetworkingBlocked
{
  if (fabs(v3) > 2.22044605e-16)
  {
    -[MZKeyValueStoreClampsController networkingBlockedUntil](self, "networkingBlockedUntil");
    double v5 = v4;
    -[MZKeyValueStoreClampsController _rightNow](self, "_rightNow");
    if (v5 > v6) {
      return 1;
    }
    -[MZKeyValueStoreClampsController clearNetworkingBlocked](self, "clearNetworkingBlocked");
  }

  return 0;
}

- (double)_rightNow
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  return v4;
}

- (id)_keyForTransaction:(id)a3
{
  id v3 = a3;
  id v4 = [v3 type];
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v3 processor]);
  double v6 = (objc_class *)objc_opt_class(v5);
  BOOL v7 = NSStringFromClass(v6);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v3 keys]);

  double v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%d-%@-%lu",  v4,  v8,  [v9 count]));
  return v10;
}

- (BOOL)_canScheduleTransactionBasedOnType:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = sub_1000191FC;
  v22 = sub_10001920C;
  id v23 = 0LL;
  double v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  double v14 = sub_100019E80;
  double v15 = &unk_100240858;
  v17 = &v18;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreClampsController _keyForTransaction:](self, "_keyForTransaction:", v6));
  id v16 = v7;
  -[MZKeyValueStoreClampsController accessTransactionClampsWithBlock:](self, "accessTransactionClampsWithBlock:", &v12);
  double v8 = (void *)v19[5];
  if (!v8) {
    goto LABEL_6;
  }
  objc_msgSend(v8, "timeIntervalSinceNow", v12, v13, v14, v15);
  if (v9 < 0.0) {
    double v9 = -v9;
  }
  if (v9 > 5.0)
  {
    -[MZKeyValueStoreClampsController clearTimestampForTransaction:](self, "clearTimestampForTransaction:", v6);
LABEL_6:
    BOOL v10 = 1;
    goto LABEL_9;
  }

  BOOL v10 = 0;
  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError clientClampErrorWithTransaction:retrySeconds:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "clientClampErrorWithTransaction:retrySeconds:underlyingError:",  v6,  0LL,  5.0 - v9));
  }
LABEL_9:

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (BOOL)_canScheduleTransactionBasedOfNetworkingBlocked:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = -[MZKeyValueStoreClampsController isNetworkingBlocked](self, "isNetworkingBlocked");
  if (v7) {
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError networkingBlockedErrorWithTransaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "networkingBlockedErrorWithTransaction:underlyingError:",  v6,  0LL));
  }

  return v7 ^ 1;
}

- (BOOL)_canScheduleTransactionBasedOnDSIDCheck:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[MZKeyValueStoreClampsController dsidCheckTimestamp](self, "dsidCheckTimestamp");
  double v8 = v7;
  if (a4 && v7 != 0.0) {
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError userClampErrorWithTransaction:retrySeconds:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "userClampErrorWithTransaction:retrySeconds:underlyingError:",  v6,  0LL,  0.0));
  }

  return v8 == 0.0;
}

- (BOOL)_canScheduleTransactionBasedOnBackOff:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[MZKeyValueStoreClampsController backOffUntil](self, "backOffUntil");
  if (fabs(v7) <= 2.22044605e-16) {
    goto LABEL_4;
  }
  -[MZKeyValueStoreClampsController _rightNow](self, "_rightNow");
  double v9 = v8;
  -[MZKeyValueStoreClampsController backOffUntil](self, "backOffUntil");
  if (v9 > v10)
  {
    -[MZKeyValueStoreClampsController clearBackOff](self, "clearBackOff");
LABEL_4:
    BOOL v11 = 1;
    goto LABEL_5;
  }

  -[MZKeyValueStoreClampsController backOffUntil](self, "backOffUntil");
  BOOL v11 = 0;
  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError serverClampErrorWithTransaction:retrySeconds:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "serverClampErrorWithTransaction:retrySeconds:underlyingError:",  v6,  0LL,  v13 - v9));
  }
LABEL_5:

  return v11;
}

- (BOOL)_canScheduleTransactionBasedOnUserCancelledSignIn:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[MZKeyValueStoreClampsController userCancelledSignInBackOffUntil](self, "userCancelledSignInBackOffUntil");
  if (fabs(v7) <= 2.22044605e-16) {
    goto LABEL_4;
  }
  -[MZKeyValueStoreClampsController _rightNow](self, "_rightNow");
  double v9 = v8;
  -[MZKeyValueStoreClampsController userCancelledSignInBackOffUntil](self, "userCancelledSignInBackOffUntil");
  if (v9 > v10)
  {
    -[MZKeyValueStoreClampsController clearUserCancelledSignIn](self, "clearUserCancelledSignIn");
LABEL_4:
    BOOL v11 = 1;
    goto LABEL_5;
  }

  -[MZKeyValueStoreClampsController userAcceptedSyncTimestamp](self, "userAcceptedSyncTimestamp");
  BOOL v11 = 0;
  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError userClampErrorWithTransaction:retrySeconds:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "userClampErrorWithTransaction:retrySeconds:underlyingError:",  v6,  0LL,  v13 - v9));
  }
LABEL_5:

  return v11;
}

- (NSDictionary)transactionClamps
{
  return self->_transactionClamps;
}

- (void)setTransactionClamps:(id)a3
{
}

- (double)dsidCheckTimestamp
{
  return self->_dsidCheckTimestamp;
}

- (void)setDsidCheckTimestamp:(double)a3
{
  self->_dsidCheckTimestamp = a3;
}

- (double)authenticationNeededTimestamp
{
  return self->_authenticationNeededTimestamp;
}

- (void)setAuthenticationNeededTimestamp:(double)a3
{
  self->_authenticationNeededTimestamp = a3;
}

- (double)userAcceptedSyncTimestamp
{
  return self->_userAcceptedSyncTimestamp;
}

- (void)setUserAcceptedSyncTimestamp:(double)a3
{
  self->_userAcceptedSyncTimestamp = a3;
}

- (double)networkingBlockedUntil
{
  return self->_networkingBlockedUntil;
}

- (void)setNetworkingBlockedUntil:(double)a3
{
  self->_networkingBlockedUntil = a3;
}

- (double)backOffUntil
{
  return self->_backOffUntil;
}

- (void)setBackOffUntil:(double)a3
{
  self->_backOffUntil = a3;
}

- (double)userCancelledSignInBackOffUntil
{
  return self->_userCancelledSignInBackOffUntil;
}

- (void)setUserCancelledSignInBackOffUntil:(double)a3
{
  self->_userCancelledSignInBackOffUntil = a3;
}

- (double)nextUserCancelBackOffInterval
{
  return self->_nextUserCancelBackOffInterval;
}

- (void)setNextUserCancelBackOffInterval:(double)a3
{
  self->_nextUserCancelBackOffInterval = a3;
}

- (NSData)pendingUserDefaultArchivedData
{
  return (NSData *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setPendingUserDefaultArchivedData:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end