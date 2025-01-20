@interface ADCloudKitRecordZoneInfo
- (ADCloudKitDataStoreProtocol)dataStore;
- (ADCloudKitRecordZoneInfo)initWithZone:(id)a3 dataStore:(id)a4 subscriptionNames:(id)a5;
- (ADCloudKitRecordZoneInfo)initWithZoneName:(id)a3 subscriptionName:(id)a4;
- (ADCloudKitRecordZoneInfo)initWithZoneName:(id)a3 subscriptionNames:(id)a4;
- (ADCloudKitRecordZoneInfo)initWithZoneName:(id)a3 subscriptionNames:(id)a4 ckAccountInfo:(id)a5;
- (BOOL)fetchInProgress;
- (BOOL)hasSetUpRecordZoneSubscription;
- (BOOL)simulatedError;
- (CKAccountInfo)ckAcctInfo;
- (CKRecordZone)zone;
- (CKServerChangeToken)serverChangeToken;
- (NSArray)subscriptionNames;
- (NSMutableArray)subscriptionList;
- (NSString)subscriptionId;
- (NSString)subscriptionName;
- (NSString)zoneId;
- (NSString)zoneName;
- (OS_dispatch_source)rateLimitTimer;
- (OS_dispatch_source)shareCreationTimer;
- (OS_dispatch_source)subscriptionSetupTimer;
- (OS_dispatch_source)syncRetryTimer;
- (OS_dispatch_source)zoneSetupTimer;
- (double)currentRetryInterval;
- (int64_t)retryState;
- (unint64_t)shareCreationRetryCount;
- (void)reset;
- (void)setCurrentRetryInterval:(double)a3;
- (void)setDataStore:(id)a3;
- (void)setFetchInProgress:(BOOL)a3;
- (void)setHasSetUpRecordZoneSubscription:(BOOL)a3;
- (void)setRateLimitTimer:(id)a3;
- (void)setRetryState:(int64_t)a3;
- (void)setServerChangeToken:(id)a3;
- (void)setShareCreationRetryCount:(unint64_t)a3;
- (void)setShareCreationTimer:(id)a3;
- (void)setSimulatedError:(BOOL)a3;
- (void)setSubscriptionId:(id)a3;
- (void)setSubscriptionList:(id)a3;
- (void)setSubscriptionSetupTimer:(id)a3;
- (void)setSyncRetryTimer:(id)a3;
- (void)setZone:(id)a3;
- (void)setZoneId:(id)a3;
- (void)setZoneSetupTimer:(id)a3;
@end

@implementation ADCloudKitRecordZoneInfo

- (ADCloudKitRecordZoneInfo)initWithZoneName:(id)a3 subscriptionName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ADCloudKitRecordZoneInfo;
  v9 = -[ADCloudKitRecordZoneInfo init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_zoneName, a3);
    objc_storeStrong((id *)&v10->_subscriptionName, a4);
    v11 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", v8, 0LL);
    subscriptionNames = v10->_subscriptionNames;
    v10->_subscriptionNames = v11;

    -[ADCloudKitRecordZoneInfo reset](v10, "reset");
  }

  return v10;
}

- (ADCloudKitRecordZoneInfo)initWithZoneName:(id)a3 subscriptionNames:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ADCloudKitRecordZoneInfo;
  v9 = -[ADCloudKitRecordZoneInfo init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_zoneName, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 firstObject]);
    subscriptionName = v10->_subscriptionName;
    v10->_subscriptionName = (NSString *)v11;

    objc_storeStrong((id *)&v10->_subscriptionNames, a4);
    -[ADCloudKitRecordZoneInfo reset](v10, "reset");
  }

  return v10;
}

- (ADCloudKitRecordZoneInfo)initWithZoneName:(id)a3 subscriptionNames:(id)a4 ckAccountInfo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___ADCloudKitRecordZoneInfo;
  v12 = -[ADCloudKitRecordZoneInfo init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_zoneName, a3);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v10 firstObject]);
    subscriptionName = v13->_subscriptionName;
    v13->_subscriptionName = (NSString *)v14;

    objc_storeStrong((id *)&v13->_subscriptionNames, a4);
    objc_storeStrong((id *)&v13->_ckAcctInfo, a5);
    -[ADCloudKitRecordZoneInfo reset](v13, "reset");
  }

  return v13;
}

- (ADCloudKitRecordZoneInfo)initWithZone:(id)a3 dataStore:(id)a4 subscriptionNames:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___ADCloudKitRecordZoneInfo;
  v12 = -[ADCloudKitRecordZoneInfo init](&v19, "init");
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 zoneName]);
    zoneName = v12->_zoneName;
    v12->_zoneName = (NSString *)v14;

    objc_storeStrong((id *)&v12->_dataStore, a4);
    objc_storeStrong((id *)&v12->_zone, a3);
    [v10 setZone:v9];
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v11 firstObject]);
    subscriptionName = v12->_subscriptionName;
    v12->_subscriptionName = (NSString *)v16;

    objc_storeStrong((id *)&v12->_subscriptionNames, a5);
  }

  return v12;
}

- (CKServerChangeToken)serverChangeToken
{
  return (CKServerChangeToken *)-[ADCloudKitDataStoreProtocol serverChangeToken](self->_dataStore, "serverChangeToken");
}

- (void)setServerChangeToken:(id)a3
{
}

- (BOOL)hasSetUpRecordZoneSubscription
{
  return -[ADCloudKitDataStoreProtocol hasSetUpRecordZoneSubscription]( self->_dataStore,  "hasSetUpRecordZoneSubscription");
}

- (void)setHasSetUpRecordZoneSubscription:(BOOL)a3
{
}

- (void)setZone:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_zone, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo dataStore](self, "dataStore"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo dataStore](self, "dataStore"));
    [v6 setZone:v7];
  }
}

- (void)reset
{
  if (-[NSString length](self->_zoneName, "length"))
  {
    v3 = -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  self->_zoneName,  CKCurrentUserDefaultName);
    v4 = -[CKRecordZone initWithZoneID:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneID:", v3);
    zone = self->_zone;
    self->_zone = v4;
  }

  else
  {
    v3 = (CKRecordZoneID *)self->_zone;
    self->_zone = 0LL;
  }

  -[ADCloudKitDataStoreProtocol setZone:](self->_dataStore, "setZone:", self->_zone);
  if (self->_zone
    && -[ADCloudKitDataStoreProtocol hasSetUpRecordZoneSubscription]( self->_dataStore,  "hasSetUpRecordZoneSubscription"))
  {
    v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[ADCloudKitDataStoreProtocol supportedRecordTypes]( self->_dataStore,  "supportedRecordTypes"));
    if (-[NSMutableArray count](v18, "count"))
    {
      uint64_t v6 = 0LL;
      unsigned int v7 = 1;
      do
      {
        id v8 = objc_alloc(&OBJC_CLASS___CKRecordZoneSubscription);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](self->_zone, "zoneID"));
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_subscriptionNames, "objectAtIndexedSubscript:", v6));
        id v11 = -[CKRecordZoneSubscription initWithZoneID:subscriptionID:](v8, "initWithZoneID:subscriptionID:", v9, v10);

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", v6));
        -[CKRecordZoneSubscription setRecordType:](v11, "setRecordType:", v12);

        subscriptionList = self->_subscriptionList;
        if (!subscriptionList)
        {
          uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          v15 = self->_subscriptionList;
          self->_subscriptionList = v14;

          subscriptionList = self->_subscriptionList;
        }

        -[NSMutableArray addObject:](subscriptionList, "addObject:", v11);

        uint64_t v6 = v7;
      }

      while ((unint64_t)-[NSMutableArray count](v18, "count") > v7++);
    }

    objc_super v17 = v18;
  }

  else
  {
    objc_super v17 = self->_subscriptionList;
    self->_subscriptionList = 0LL;
  }
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSString)subscriptionName
{
  return self->_subscriptionName;
}

- (NSArray)subscriptionNames
{
  return self->_subscriptionNames;
}

- (CKRecordZone)zone
{
  return self->_zone;
}

- (CKAccountInfo)ckAcctInfo
{
  return self->_ckAcctInfo;
}

- (OS_dispatch_source)zoneSetupTimer
{
  return self->_zoneSetupTimer;
}

- (void)setZoneSetupTimer:(id)a3
{
}

- (NSMutableArray)subscriptionList
{
  return self->_subscriptionList;
}

- (void)setSubscriptionList:(id)a3
{
}

- (OS_dispatch_source)subscriptionSetupTimer
{
  return self->_subscriptionSetupTimer;
}

- (void)setSubscriptionSetupTimer:(id)a3
{
}

- (ADCloudKitDataStoreProtocol)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
}

- (OS_dispatch_source)rateLimitTimer
{
  return self->_rateLimitTimer;
}

- (void)setRateLimitTimer:(id)a3
{
}

- (OS_dispatch_source)syncRetryTimer
{
  return self->_syncRetryTimer;
}

- (void)setSyncRetryTimer:(id)a3
{
}

- (OS_dispatch_source)shareCreationTimer
{
  return self->_shareCreationTimer;
}

- (void)setShareCreationTimer:(id)a3
{
}

- (unint64_t)shareCreationRetryCount
{
  return self->_shareCreationRetryCount;
}

- (void)setShareCreationRetryCount:(unint64_t)a3
{
  self->_shareCreationRetryCount = a3;
}

- (BOOL)fetchInProgress
{
  return self->_fetchInProgress;
}

- (void)setFetchInProgress:(BOOL)a3
{
  self->_fetchInProgress = a3;
}

- (int64_t)retryState
{
  return self->_retryState;
}

- (void)setRetryState:(int64_t)a3
{
  self->_retryState = a3;
}

- (double)currentRetryInterval
{
  return self->_currentRetryInterval;
}

- (void)setCurrentRetryInterval:(double)a3
{
  self->_currentRetryInterval = a3;
}

- (BOOL)simulatedError
{
  return self->_simulatedError;
}

- (void)setSimulatedError:(BOOL)a3
{
  self->_simulatedError = a3;
}

- (NSString)zoneId
{
  return self->_zoneId;
}

- (void)setZoneId:(id)a3
{
}

- (NSString)subscriptionId
{
  return self->_subscriptionId;
}

- (void)setSubscriptionId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end