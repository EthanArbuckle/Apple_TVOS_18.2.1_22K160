@interface AMSDMultiUserMetrics
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)_eventWithTopic:(id)a3;
+ (id)_metricsInstanceWithBag:(id)a3;
+ (id)createBagForSubProfile;
- (AMSBagProtocol)bag;
- (AMSDMultiUserMetrics)init;
- (AMSDMultiUserMetrics)initWithBag:(id)a3;
- (AMSMetrics)metrics;
- (BOOL)_accountIsSecondaryHomeUser:(id)a3;
- (BOOL)_isTopicDefined:(id)a3;
- (NSDate)cloudKitFetchBeginDate;
- (NSDate)cloudKitSaveBeginDate;
- (NSDate)homeKitRepairRequestBeginDate;
- (NSDate)multiUserAuthBeginDate;
- (NSDate)multiUserGenerateTokenBeginDate;
- (NSString)metricsIdentifier;
- (id)_clampTimeStampValue:(id)a3;
- (id)_durationSinceDate:(id)a3;
- (id)_enqueueEventWithTopic:(id)a3 properties:(id)a4;
- (id)_enqueueEvents:(id)a3;
- (id)_enqueueProperties:(id)a3;
- (id)_enqueueProperties:(id)a3 account:(id)a4;
- (id)_eventTime;
- (id)_topicFromBag;
- (id)_userIdForBagNamespace:(id)a3;
- (id)enqueueCloudKitFetchBeganEvent;
- (id)enqueueCloudKitFetchFailedEventWithError:(id)a3;
- (id)enqueueCloudKitFetchFinishEventWithError:(id)a3;
- (id)enqueueCloudKitFetchSuccessEvent;
- (id)enqueueCloudKitSaveReceivedEvent;
- (id)enqueueCloudKitSaveRecordEvent;
- (id)enqueueCloudKitSaveRecordFinishEventWithError:(id)a3;
- (id)enqueueCloudKitSaveRecordSucceededEvent;
- (id)enqueueGenerateMultiUserTokenBeginEvent;
- (id)enqueueGenerateMultiUserTokenFailedEventWithError:(id)a3;
- (id)enqueueGenerateMultiUserTokenFinishEventWithError:(id)a3;
- (id)enqueueGenerateMultiUserTokenSuccessEvent;
- (id)enqueueHomeKitChangedReceivedEvent;
- (id)enqueueHomeKitRepairRequestCompletedFailedEventWithError:(id)a3;
- (id)enqueueHomeKitRepairRequestCompletedFinishEventWithError:(id)a3;
- (id)enqueueHomeKitRepairRequestCompletedSuccessEvent;
- (id)enqueueHomeKitRepairRequestReceivedEvent;
- (id)enqueueHomeKitRepairRequestSentEventForAccount:(id)a3;
- (id)enqueueMultiUserAuthenticationTokenFetchBeginEventForAccount:(id)a3;
- (id)enqueueMultiUserAuthenticationTokenFetchFailedEventForAccount:(id)a3 error:(id)a4;
- (id)enqueueMultiUserAuthenticationTokenFetchFinishEventForAccount:(id)a3 error:(id)a4;
- (id)enqueueMultiUserAuthenticationTokenFetchSuccessEventForAccount:(id)a3;
- (id)enqueueMultiUserRefreshBeginEventWithOptions:(id)a3;
- (void)flushEvents;
- (void)homeKitRepairRequestUpdateTokenBegin;
- (void)setCloudKitFetchBeginDate:(id)a3;
- (void)setCloudKitSaveBeginDate:(id)a3;
- (void)setHomeKitRepairRequestBeginDate:(id)a3;
- (void)setMetricsIdentifier:(id)a3;
- (void)setMultiUserAuthBeginDate:(id)a3;
- (void)setMultiUserGenerateTokenBeginDate:(id)a3;
@end

@implementation AMSDMultiUserMetrics

- (AMSDMultiUserMetrics)init
{
  id v3 = objc_msgSend((id)objc_opt_class(self, a2), "createBagForSubProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[AMSDMultiUserMetrics initWithBag:](self, "initWithBag:", v4);

  return v5;
}

- (AMSDMultiUserMetrics)initWithBag:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___AMSDMultiUserMetrics;
  v6 = -[AMSDMultiUserMetrics init](&v14, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bag, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[AMSDMultiUserMetrics _metricsInstanceWithBag:]( &OBJC_CLASS___AMSDMultiUserMetrics,  "_metricsInstanceWithBag:",  v7->_bag));
    metrics = v7->_metrics;
    v7->_metrics = (AMSMetrics *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 UUIDString]);
    metricsIdentifier = v7->_metricsIdentifier;
    v7->_metricsIdentifier = (NSString *)v11;
  }

  return v7;
}

- (void)flushEvents
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics metrics](self, "metrics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 flush]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002A824;
  v5[3] = &unk_1000D7020;
  v5[4] = self;
  [v4 addFinishBlock:v5];
}

- (id)enqueueCloudKitFetchBeganEvent
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[AMSDMultiUserMetrics setCloudKitFetchBeginDate:](self, "setCloudKitFetchBeginDate:", v3);

  v7 = @"eventType";
  uint64_t v8 = @"MultiUserTokenFetchCloudKitBegin";
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics _enqueueProperties:](self, "_enqueueProperties:", v4));

  return v5;
}

- (id)enqueueCloudKitFetchFinishEventWithError:(id)a3
{
  id v4 = a3;
  v12 = @"duration";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics cloudKitFetchBeginDate](self, "cloudKitFetchBeginDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics _durationSinceDate:](self, "_durationSinceDate:", v5));
  v13 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v7));

  if (v4)
  {
    [v8 setObject:@"MultiUserTokenFetchCloudKitFailure" forKey:@"eventType"];
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 code]));
    [v8 setObject:v9 forKey:@"errorCode"];
  }

  else
  {
    [v8 setObject:@"MultiUserTokenFetchCloudKitSuccess" forKey:@"eventType"];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics _enqueueProperties:](self, "_enqueueProperties:", v8));

  return v10;
}

- (id)enqueueCloudKitFetchFailedEventWithError:(id)a3
{
  return -[AMSDMultiUserMetrics enqueueCloudKitFetchFinishEventWithError:]( self,  "enqueueCloudKitFetchFinishEventWithError:",  a3);
}

- (id)enqueueCloudKitFetchSuccessEvent
{
  return -[AMSDMultiUserMetrics enqueueCloudKitFetchFinishEventWithError:]( self,  "enqueueCloudKitFetchFinishEventWithError:",  0LL);
}

- (id)enqueueCloudKitSaveRecordEvent
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[AMSDMultiUserMetrics setCloudKitSaveBeginDate:](self, "setCloudKitSaveBeginDate:", v3);

  v7 = @"eventType";
  uint64_t v8 = @"MultiUserTokenGenerationCloudKitSave";
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics _enqueueProperties:](self, "_enqueueProperties:", v4));

  return v5;
}

- (id)enqueueCloudKitSaveRecordFinishEventWithError:(id)a3
{
  id v4 = a3;
  v12 = @"duration";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics cloudKitSaveBeginDate](self, "cloudKitSaveBeginDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics _durationSinceDate:](self, "_durationSinceDate:", v5));
  v13 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v7));

  if (v4)
  {
    [v8 setObject:@"MultiUserTokenGenerationCloudKitSaveFailed" forKey:@"eventType"];
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 code]));
    [v8 setObject:v9 forKey:@"errorCode"];
  }

  else
  {
    [v8 setObject:@"MultiUserTokenGenerationCloudKitSaveSuccess" forKey:@"eventType"];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics _enqueueProperties:](self, "_enqueueProperties:", v8));

  return v10;
}

- (id)enqueueCloudKitSaveRecordSucceededEvent
{
  return -[AMSDMultiUserMetrics enqueueCloudKitSaveRecordFinishEventWithError:]( self,  "enqueueCloudKitSaveRecordFinishEventWithError:",  0LL);
}

- (id)enqueueCloudKitSaveReceivedEvent
{
  v6 = @"eventType";
  v7 = @"MultiUserTokenGenerationCloudKitNotificationReceived";
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics _enqueueProperties:](self, "_enqueueProperties:", v3));

  return v4;
}

- (id)enqueueGenerateMultiUserTokenBeginEvent
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[AMSDMultiUserMetrics setMultiUserGenerateTokenBeginDate:](self, "setMultiUserGenerateTokenBeginDate:", v3);

  v7 = @"eventType";
  uint64_t v8 = @"MultiUserTokenGenerationBegin";
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics _enqueueProperties:](self, "_enqueueProperties:", v4));

  return v5;
}

- (id)enqueueGenerateMultiUserTokenFinishEventWithError:(id)a3
{
  id v4 = a3;
  v12 = @"duration";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics multiUserGenerateTokenBeginDate](self, "multiUserGenerateTokenBeginDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics _durationSinceDate:](self, "_durationSinceDate:", v5));
  v13 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v7));

  if (v4)
  {
    [v8 setObject:@"MultiUserTokenGenerationFailure" forKey:@"eventType"];
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 code]));
    [v8 setObject:v9 forKey:@"errorCode"];
  }

  else
  {
    [v8 setObject:@"MultiUserTokenGenerationSuccess" forKey:@"eventType"];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics _enqueueProperties:](self, "_enqueueProperties:", v8));

  return v10;
}

- (id)enqueueGenerateMultiUserTokenFailedEventWithError:(id)a3
{
  return -[AMSDMultiUserMetrics enqueueGenerateMultiUserTokenFinishEventWithError:]( self,  "enqueueGenerateMultiUserTokenFinishEventWithError:",  a3);
}

- (id)enqueueGenerateMultiUserTokenSuccessEvent
{
  return -[AMSDMultiUserMetrics enqueueGenerateMultiUserTokenFinishEventWithError:]( self,  "enqueueGenerateMultiUserTokenFinishEventWithError:",  0LL);
}

- (id)enqueueHomeKitChangedReceivedEvent
{
  v6 = @"eventType";
  v7 = @"HomeKitChangedNotificationReceived";
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics _enqueueProperties:](self, "_enqueueProperties:", v3));

  return v4;
}

- (id)enqueueHomeKitRepairRequestReceivedEvent
{
  v6 = @"eventType";
  v7 = @"HomeKitRepairRequestNotificationReceived";
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics _enqueueProperties:](self, "_enqueueProperties:", v3));

  return v4;
}

- (id)enqueueHomeKitRepairRequestCompletedFinishEventWithError:(id)a3
{
  id v4 = a3;
  v12 = @"duration";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics homeKitRepairRequestBeginDate](self, "homeKitRepairRequestBeginDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics _durationSinceDate:](self, "_durationSinceDate:", v5));
  v13 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v7));

  if (v4)
  {
    [v8 setObject:@"HomeKitRepairRequestCompletedFailure" forKey:@"eventType"];
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 code]));
    [v8 setObject:v9 forKey:@"errorCode"];
  }

  else
  {
    [v8 setObject:@"HomeKitRepairRequestCompletedSuccess" forKey:@"eventType"];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics _enqueueProperties:](self, "_enqueueProperties:", v8));

  return v10;
}

- (id)enqueueHomeKitRepairRequestCompletedFailedEventWithError:(id)a3
{
  return -[AMSDMultiUserMetrics enqueueHomeKitRepairRequestCompletedFinishEventWithError:]( self,  "enqueueHomeKitRepairRequestCompletedFinishEventWithError:",  a3);
}

- (id)enqueueHomeKitRepairRequestCompletedSuccessEvent
{
  return -[AMSDMultiUserMetrics enqueueHomeKitRepairRequestCompletedFinishEventWithError:]( self,  "enqueueHomeKitRepairRequestCompletedFinishEventWithError:",  0LL);
}

- (id)enqueueHomeKitRepairRequestSentEventForAccount:(id)a3
{
  v9 = @"eventType";
  v10 = @"HomeKitRepairRequestSend";
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics _enqueueProperties:account:](self, "_enqueueProperties:account:", v6, v4));
  return v7;
}

- (void)homeKitRepairRequestUpdateTokenBegin
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[AMSDMultiUserMetrics setHomeKitRepairRequestBeginDate:](self, "setHomeKitRepairRequestBeginDate:", v3);
}

- (id)enqueueMultiUserAuthenticationTokenFetchBeginEventForAccount:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[AMSDMultiUserMetrics setMultiUserAuthBeginDate:](self, "setMultiUserAuthBeginDate:", v5);

  v9 = @"eventType";
  v10 = @"MultiUserTokenFetchBegin";
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics _enqueueProperties:account:](self, "_enqueueProperties:account:", v6, v4));

  return v7;
}

- (id)enqueueMultiUserAuthenticationTokenFetchFinishEventForAccount:(id)a3 error:(id)a4
{
  id v6 = a4;
  v16 = @"duration";
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics multiUserAuthBeginDate](self, "multiUserAuthBeginDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics _durationSinceDate:](self, "_durationSinceDate:", v8));
  v17 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v10));

  if (v6)
  {
    [v11 setObject:@"MultiUserTokenFetchFailure" forKey:@"eventType"];
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v6 code]));
    [v11 setObject:v12 forKey:@"errorCode"];
  }

  else
  {
    [v11 setObject:@"MultiUserTokenFetchSuccess" forKey:@"eventType"];
  }

  id v13 = [v11 copy];
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics _enqueueProperties:account:](self, "_enqueueProperties:account:", v13, v7));

  return v14;
}

- (id)enqueueMultiUserAuthenticationTokenFetchFailedEventForAccount:(id)a3 error:(id)a4
{
  return -[AMSDMultiUserMetrics enqueueMultiUserAuthenticationTokenFetchFinishEventForAccount:error:]( self,  "enqueueMultiUserAuthenticationTokenFetchFinishEventForAccount:error:",  a3,  a4);
}

- (id)enqueueMultiUserAuthenticationTokenFetchSuccessEventForAccount:(id)a3
{
  return -[AMSDMultiUserMetrics enqueueMultiUserAuthenticationTokenFetchFinishEventForAccount:error:]( self,  "enqueueMultiUserAuthenticationTokenFetchFinishEventForAccount:error:",  a3,  0LL);
}

- (id)enqueueMultiUserRefreshBeginEventWithOptions:(id)a3
{
  v8[0] = @"eventType";
  v8[1] = @"refreshReason";
  v9[0] = @"MultiUserRefreshBegin";
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [a3 reasonType]));
  v9[1] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics _enqueueProperties:](self, "_enqueueProperties:", v5));
  return v6;
}

+ (NSString)bagSubProfile
{
  if (qword_1000F2008 != -1) {
    dispatch_once(&qword_1000F2008, &stru_1000D7040);
  }
  return (NSString *)(id)qword_1000F2010;
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1000F2018 != -1) {
    dispatch_once(&qword_1000F2018, &stru_1000D7060);
  }
  return (NSString *)(id)qword_1000F2020;
}

+ (id)createBagForSubProfile
{
  id v3 = objc_msgSend((id)objc_opt_class(a1, a2), "bagSubProfile");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v6 = objc_msgSend((id)objc_opt_class(a1, v5), "bagSubProfileVersion");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag bagForProfile:profileVersion:](&OBJC_CLASS___AMSBag, "bagForProfile:profileVersion:", v4, v7));

  return v8;
}

- (BOOL)_accountIsSecondaryHomeUser:(id)a3
{
  if (a3) {
    return objc_msgSend(a3, "ams_isSecondaryHomeUser");
  }
  else {
    return 0;
  }
}

- (id)_clampTimeStampValue:(id)a3
{
  uint64_t v3 = (uint64_t)[a3 longLongValue];
  return +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  v3 / qword_1000EF910 * qword_1000EF910);
}

- (id)_durationSinceDate:(id)a3
{
  if (!a3) {
    return &off_1000DEBF0;
  }
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v4 timeIntervalSinceDate:v3];
  double v6 = v5;

  return (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  v6));
}

- (id)_enqueueEventWithTopic:(id)a3 properties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9 = v7;
  if (v6 && v7)
  {
    id v10 = objc_msgSend((id)objc_opt_class(self, v8), "_eventWithTopic:", v6);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v11 addPropertiesWithDictionary:v9];
    v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"canaryIdentifier"]);
    [v11 setCanaryIdentifier:v12];

    v34 = v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics _enqueueEvents:](self, "_enqueueEvents:", v13));
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsConfig"));
    if (!v15) {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_opt_class(self, v17);
      uint64_t v20 = AMSLogKey(v18, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      uint64_t v22 = AMSHashIfNeeded(v9);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      int v26 = 138544130;
      uint64_t v27 = v18;
      __int16 v28 = 2114;
      v29 = v21;
      __int16 v30 = 2114;
      id v31 = v6;
      __int16 v32 = 2114;
      v33 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Attempted to enqueue event without topic or properties. topic = %{public}@ properties = %{public}@",  (uint8_t *)&v26,  0x2Au);
    }

    uint64_t v24 = AMSError(2LL, @"Missing topic or properties", 0LL, 0LL);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v24);
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBinaryPromise promiseWithError:](&OBJC_CLASS___AMSBinaryPromise, "promiseWithError:", v11));
  }

  return v14;
}

- (id)_enqueueEvents:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics metrics](self, "metrics"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 promiseForEnqueueingEvents:v4]);

  return v6;
}

- (id)_enqueueProperties:(id)a3
{
  return -[AMSDMultiUserMetrics _enqueueProperties:account:](self, "_enqueueProperties:account:", a3, 0LL);
}

- (id)_enqueueProperties:(id)a3 account:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = [a3 mutableCopy];
    if (-[AMSDMultiUserMetrics _accountIsSecondaryHomeUser:](self, "_accountIsSecondaryHomeUser:", v6)) {
      uint64_t v8 = @"authPerformanceSecondary";
    }
    else {
      uint64_t v8 = @"authPerformance";
    }
    if (v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  objc_msgSend(v6, "ams_isSecondaryHomeUser")));
      [v7 setObject:v9 forKey:@"isSecondaryHomeUser"];
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics metricsIdentifier](self, "metricsIdentifier"));
    [v7 setObject:v10 forKey:@"canaryIdentifier"];

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsConfig"));
    if (!v11) {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class(self, v13);
      uint64_t v16 = AMSLogKey(v14, v15);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      uint64_t v18 = AMSHashIfNeeded(v7);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      uint64_t v20 = AMSHashIfNeeded(v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      *(_DWORD *)buf = 138544130;
      uint64_t v43 = v14;
      __int16 v44 = 2114;
      v45 = v17;
      __int16 v46 = 2114;
      v47 = v19;
      __int16 v48 = 2114;
      v49 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Creating Event with properties = %{public}@ using account = %{public}@",  buf,  0x2Au);
    }

    uint64_t v22 = objc_alloc_init(&OBJC_CLASS___AMSMutableBinaryPromise);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics _topicFromBag](self, "_topicFromBag"));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_10002BFD8;
    v37[3] = &unk_1000D7088;
    uint64_t v24 = v22;
    v38 = v24;
    v39 = self;
    v40 = (__CFString *)v8;
    id v41 = v7;
    id v25 = v7;
    [v23 resultWithCompletion:v37];

    int v26 = v41;
    uint64_t v27 = v24;
  }

  else
  {
    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsConfig"));
    if (!v28) {
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 OSLogObject]);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = objc_opt_class(self, v30);
      uint64_t v33 = AMSLogKey(v31, v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      *(_DWORD *)buf = 138543618;
      uint64_t v43 = v31;
      __int16 v44 = 2114;
      v45 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Attempted to enqueue event without properties.",  buf,  0x16u);
    }

    uint64_t v35 = AMSError(2LL, @"Missing Properties", 0LL, 0LL);
    id v25 = (id)objc_claimAutoreleasedReturnValue(v35);
    uint64_t v27 = (AMSMutableBinaryPromise *)objc_claimAutoreleasedReturnValue( +[AMSBinaryPromise promiseWithError:]( &OBJC_CLASS___AMSBinaryPromise,  "promiseWithError:",  v25));
  }

  return v27;
}

- (id)_eventTime
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSMetrics serverTimeFromDate:](&OBJC_CLASS___AMSMetrics, "serverTimeFromDate:", v3));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics _clampTimeStampValue:](self, "_clampTimeStampValue:", v4));

  return v5;
}

+ (id)_eventWithTopic:(id)a3
{
  id v3 = a3;
  id v4 = [[AMSMetricsEvent alloc] initWithTopic:v3];

  [v4 setCheckDiagnosticsAndUsageSetting:1];
  return v4;
}

- (BOOL)_isTopicDefined:(id)a3
{
  unsigned int v4 = [a3 isEqualToString:@"_topic_not_defined_"] ^ 1;
  if (a3) {
    return v4;
  }
  else {
    return 0;
  }
}

+ (id)_metricsInstanceWithBag:(id)a3
{
  id v3 = a3;
  unsigned int v4 = -[AMSMetrics initWithContainerID:bag:]( objc_alloc(&OBJC_CLASS___AMSMetrics),  "initWithContainerID:bag:",  @"com.apple.AppleMediaServices",  v3);

  return v4;
}

- (id)_topicFromBag
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics bag](self, "bag"));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___AMSBag, v4);
  uint64_t v7 = objc_opt_class(v5, v6);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v7);

  if ((isKindOfClass & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics bag](self, "bag"));
    [v9 setDefaultValue:@"_topic_not_defined_" forKey:@"authPerfTopicName"];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics bag](self, "bag"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringForKey:@"authPerfTopicName"]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 valuePromise]);

  return v12;
}

- (id)_userIdForBagNamespace:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserMetrics bag](self, "bag"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[AMSMetricsIdentifierStore identifierForAccount:bag:bagNamespace:keyName:]( &OBJC_CLASS___AMSMetricsIdentifierStore,  "identifierForAccount:bag:bagNamespace:keyName:",  0LL,  v5,  v4,  @"userId"));

  return v6;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSDate)cloudKitFetchBeginDate
{
  return self->_cloudKitFetchBeginDate;
}

- (void)setCloudKitFetchBeginDate:(id)a3
{
}

- (NSDate)cloudKitSaveBeginDate
{
  return self->_cloudKitSaveBeginDate;
}

- (void)setCloudKitSaveBeginDate:(id)a3
{
}

- (NSDate)homeKitRepairRequestBeginDate
{
  return self->_homeKitRepairRequestBeginDate;
}

- (void)setHomeKitRepairRequestBeginDate:(id)a3
{
}

- (AMSMetrics)metrics
{
  return self->_metrics;
}

- (NSString)metricsIdentifier
{
  return self->_metricsIdentifier;
}

- (void)setMetricsIdentifier:(id)a3
{
}

- (NSDate)multiUserAuthBeginDate
{
  return self->_multiUserAuthBeginDate;
}

- (void)setMultiUserAuthBeginDate:(id)a3
{
}

- (NSDate)multiUserGenerateTokenBeginDate
{
  return self->_multiUserGenerateTokenBeginDate;
}

- (void)setMultiUserGenerateTokenBeginDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end