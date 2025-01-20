@interface AMSDCloudDataFetchChangedRecordsTask
- (AMSDCloudDataDatabase)database;
- (AMSDCloudDataFetchChangedRecordsTask)initWithRecordZoneIdentifiers:(id)a3 inDatabase:(id)a4;
- (AMSDCloudDataFetchChangedRecordsTask)initWithRecordZoneIdentifiers:(id)a3 inDatabase:(id)a4 batchSize:(int64_t)a5;
- (NSArray)identifiers;
- (id)performFetch;
- (int64_t)batchSize;
@end

@implementation AMSDCloudDataFetchChangedRecordsTask

- (AMSDCloudDataFetchChangedRecordsTask)initWithRecordZoneIdentifiers:(id)a3 inDatabase:(id)a4
{
  return -[AMSDCloudDataFetchChangedRecordsTask initWithRecordZoneIdentifiers:inDatabase:batchSize:]( self,  "initWithRecordZoneIdentifiers:inDatabase:batchSize:",  a3,  a4,  400LL);
}

- (AMSDCloudDataFetchChangedRecordsTask)initWithRecordZoneIdentifiers:(id)a3 inDatabase:(id)a4 batchSize:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___AMSDCloudDataFetchChangedRecordsTask;
  v11 = -[AMSDCloudDataFetchChangedRecordsTask init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifiers, a3);
    objc_storeStrong((id *)&v12->_database, a4);
    v12->_batchSize = a5;
  }

  return v12;
}

- (id)performFetch
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000B15C;
  v3[3] = &unk_1000D5B50;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( -[AMSDCloudDataFetchChangedRecordsTask performTaskWithPromiseBlock:]( self,  "performTaskWithPromiseBlock:",  v3));
}

- (AMSDCloudDataDatabase)database
{
  return self->_database;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (void).cxx_destruct
{
}

@end