@interface BMCoreAnalyticsEvents
+ (id)dictionaryWithSyncDatabase:(id)a3;
+ (void)sendCKRecordCRDTLog:(id)a3;
+ (void)sendSyncDatabaseSummaryWithDatabase:(id)a3;
+ (void)sendSyncSessionLog:(id)a3;
@end

@implementation BMCoreAnalyticsEvents

+ (void)sendSyncSessionLog:(id)a3
{
}

+ (void)sendSyncDatabaseSummaryWithDatabase:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([a1 dictionaryWithSyncDatabase:a3]);
  +[BMCoreAnalyticsEvents sendEvent:payload:]( &OBJC_CLASS___BMCoreAnalyticsEvents,  "sendEvent:payload:",  @"com.apple.biome.syncdatabase",  v3);
}

+ (void)sendCKRecordCRDTLog:(id)a3
{
}

+ (id)dictionaryWithSyncDatabase:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dateOfLastVacuum]);
  if (v4)
  {
    v5 = objc_opt_new(&OBJC_CLASS___NSDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 dateOfLastVacuum]);
    -[NSDate timeIntervalSinceDate:](v5, "timeIntervalSinceDate:", v6);
    uint64_t v18 = (uint64_t)v7;
  }

  else
  {
    uint64_t v18 = -1LL;
  }

  v20[0] = @"database_size";
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v3 databaseSizeInKilobytes]));
  v21[0] = v19;
  v20[1] = @"wal_size";
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v3 walSizeInKilobytes]));
  v21[1] = v8;
  v20[2] = @"num_rows_CKAtom";
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 numRowsInTable:@"CKAtom"]));
  v21[2] = v9;
  v20[3] = @"table_size_CKAtom";
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v3 sizeOfTableInKilobytes:@"CKAtom"]));
  v21[3] = v10;
  v20[4] = @"num_rows_CKRecord";
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 numRowsInTable:@"CKRecord"]));
  v21[4] = v11;
  v20[5] = @"table_size_CKRecord";
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v3 sizeOfTableInKilobytes:@"CKRecord"]));
  v21[5] = v12;
  v20[6] = @"num_rows_CRDTLocation";
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 numRowsInTable:@"CRDTLocation"]));
  v21[6] = v13;
  v20[7] = @"time_since_vacuum";
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v18));
  v21[7] = v14;
  v20[8] = @"table_size_CRDTLocation";
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v3 sizeOfTableInKilobytes:@"CRDTLocation"]));
  v21[8] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  9LL));

  return v16;
}

@end