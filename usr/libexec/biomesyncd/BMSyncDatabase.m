@interface BMSyncDatabase
+ (id)createDatabaseForAccount:(id)a3 queue:(id)a4;
+ (id)createPrimaryDatabaseWithQueue:(id)a3;
+ (id)primaryDatabasePath;
+ (id)primaryDatabaseWALPath;
+ (void)enumerateAccountSpecificDatabasesWithBlock:(id)a3;
- (BMSyncDatabase)initWithPath:(id)a3;
- (BMSyncDatabase)initWithPath:(id)a3 options:(unint64_t)a4 queue:(id)a5;
- (BMSyncDatabase)initWithPath:(id)a3 queue:(id)a4;
- (BMSyncDatabase)initWithQueue:(id)a3;
- (BOOL)_tryOpen:(unint64_t)a3;
- (BOOL)addCKAtomRow:(id)a3 inStream:(id)a4;
- (BOOL)beginTransaction;
- (BOOL)ckRecordExists:(id)a3 zoneName:(id)a4 recordType:(unint64_t)a5;
- (BOOL)ckZoneExists:(id)a3;
- (BOOL)ckZoneSetAttemptedRecoveryDate:(id)a3 state:(int)a4 forZoneName:(id)a5;
- (BOOL)ckZoneSetAttemptingRecoveryForZoneName:(id)a3 state:(int)a4;
- (BOOL)ckZoneSetZoneVersionUUID:(id)a3 forZoneName:(id)a4;
- (BOOL)clearCKMergeableRecordValueServerMergeableValuesForRecordName:(id)a3 zoneName:(id)a4;
- (BOOL)clearCKMergeableRecordValueServerMergeableValuesForZoneName:(id)a3;
- (BOOL)clearCKRecordLocalMergeableValueAndSetToSyncForZone:(id)a3;
- (BOOL)commit;
- (BOOL)containsCKAtomRowWithSegment:(id)a3 inStream:(id)a4;
- (BOOL)containsCKAtomRowWithTimestamp:(id)a3 inStream:(id)a4;
- (BOOL)containsCKAtomRowWithTimestamp:(id)a3 inStream:(id)a4 onDisk:(BOOL)a5;
- (BOOL)deleteAllAtomsAtOrBeforeLocation:(id)a3;
- (BOOL)deleteAllSiteIdentifiersExcept:(id)a3;
- (BOOL)disableAllCKSyncRecordsForSite:(id)a3 stream:(id)a4;
- (BOOL)enableAllCKSyncRecordsPreviouslyDisabledForSite:(id)a3 stream:(id)a4;
- (BOOL)getLatestTombstoneBookmarkForSiteIdentifier:(id)a3 inStream:(id)a4 segmentName:(id *)a5 segmentOffset:(unint64_t *)a6;
- (BOOL)isInTransaction;
- (BOOL)migration_Schema20ToSchema21;
- (BOOL)migration_Schema27ToSchema28;
- (BOOL)migration_StarSkySchema11ToSydRoSchema12;
- (BOOL)open;
- (BOOL)removeAllDeletedLocationsBeforeHighestDeletedLocation:(id)a3;
- (BOOL)resetCKRecordsMetaDataAndSetToSyncForZone:(id)a3;
- (BOOL)rollback;
- (BOOL)saveCKMergeableRecordValueRecordName:(id)a3 zoneName:(id)a4 mergeableRecordValueData:(id)a5;
- (BOOL)saveCKRecordHighestDeletedLocationRow:(id)a3 recordName:(id)a4 zoneName:(id)a5 recordExists:(BOOL)a6;
- (BOOL)saveCKRecordLocalMergeableValue:(id)a3 recordName:(id)a4 zoneName:(id)a5 locationRow:(id)a6;
- (BOOL)saveCKRecordServerMergeableValue:(id)a3 recordName:(id)a4 zoneName:(id)a5 locationRow:(id)a6;
- (BOOL)saveLatestTombstoneBookmark:(id)a3 forSiteIdentifier:(id)a4 inStream:(id)a5;
- (BOOL)setLastSyncDate:(id)a3 forDeviceWithIdentifier:(id)a4;
- (BOOL)updateAllLocationsAtOrBefore:(id)a3 state:(unint64_t)a4;
- (BOOL)updateCKAtomRow:(id)a3 inStream:(id)a4;
- (BOOL)updateLocationState:(unint64_t)a3 forLocation:(id)a4;
- (BOOL)upsertCKRecordWithLocation:(id)a3 inStream:(id)a4;
- (BOOL)upsertLocation:(id)a3;
- (BOOL)upsertSyncDevicePeer:(id)a3 isMe:(BOOL)a4;
- (BOOL)vacuumWithShouldContinueBlock:(id)a3;
- (NSDate)dateOfLastVacuum;
- (NSDate)lastCloudKitSyncAttemptDate;
- (NSDate)lastCloudKitSyncDate;
- (NSDate)lastRapportSyncAttemptDate;
- (NSDate)lastRapportSyncDate;
- (NSString)error;
- (NSString)mergeableRecordValueKey;
- (NSString)name;
- (NSUUID)sharedSyncGeneration;
- (id)CKAtomRowSiteIdentifiers;
- (id)CKAtomRowSiteIdentifiersForStreamIdentifier:(id)a3;
- (id)SELECT_ATOMS_WHERE:(id)a3 ORDER_BY:(id)a4 LIMIT:(id)a5;
- (id)activeLocationsInClockVector:(id)a3 inStream:(id)a4 error:(id *)a5;
- (id)allPeers;
- (id)ckAtomRowForAtomWithBookmark:(id)a3 type:(unint64_t)a4 forSiteIdentifier:(id)a5 inStream:(id)a6;
- (id)ckAtomRowWithTimestamp:(id)a3 inStream:(id)a4;
- (id)ckRecordForRecordName:(id)a3 zoneName:(id)a4 recordType:(unint64_t)a5;
- (id)ckRecordsToSyncToCloudKitForZone:(id)a3;
- (id)ckSyncEngineMetaData;
- (id)ckZoneForZoneName:(id)a3;
- (id)computeHighestLocationToDeleteUpToBookmark:(id)a3 forSiteIdentifier:(id)a4 inStream:(id)a5 offsetsIncrease:(BOOL)a6;
- (id)corruptionHandler;
- (id)createCKRecordFromRecordID:(id)a3 newRecord:(BOOL *)a4 recordType:(unint64_t)a5;
- (id)deviceWithIdentifier:(id)a3;
- (id)gatherAllCKSyncRecordRecordsToBeDeleted;
- (id)getSystemFieldsDataForRecordName:(id)a3 zoneName:(id)a4 recordType:(unint64_t)a5;
- (id)highestDeletedLocationForSiteIdentifier:(id)a3 inStream:(id)a4;
- (id)highestDeletedLocationsForStream:(id)a3;
- (id)highestLocationWithBufferedAtomsOlderThan:(double)a3 forSiteIdentifier:(id)a4 inStream:(id)a5;
- (id)insertLocationIfNotExists:(id)a3 withState:(unint64_t)a4;
- (id)lastSyncDateFromAnyDevice;
- (id)lastSyncDateOfDeviceWithIdentifier:(id)a3;
- (id)latestCKAtomRowForSiteIdentifier:(id)a3 inStream:(id)a4;
- (id)latestCKAtomRowOfType:(unint64_t)a3 forSiteIdentifier:(id)a4 inStream:(id)a5;
- (id)latestDistributedTimestampForSiteIdentifier:(id)a3 inStream:(id)a4;
- (id)legacyTimestampClockVectorForStreamName:(id)a3;
- (id)localDevice;
- (id)locationRowWithLocation:(id)a3;
- (id)locationRowWithLocationID:(id)a3;
- (id)locationsWithState:(unint64_t)a3;
- (id)previousLocationRowBeforeLocationRow:(id)a3;
- (id)rangeClockVectorForStreamName:(id)a3;
- (id)recordFromSystemFieldsData:(id)a3;
- (id)stateVectorForLocationRow:(id)a3;
- (id)valueForMetadataKey:(id)a3;
- (int)CRDTLocationCount;
- (int)ckAtomCount;
- (unint64_t)_numPagesToVacuum;
- (unint64_t)_sizeOfFileInKilobytes:(id)a3;
- (unint64_t)ckRecordCountForRecordType:(unint64_t)a3;
- (unint64_t)countAtomMergeResultRecords;
- (unint64_t)databaseSizeInKilobytes;
- (unint64_t)internalState;
- (unint64_t)numRowsInTable:(id)a3;
- (unint64_t)sizeOfTableInKilobytes:(id)a3;
- (unint64_t)state;
- (unint64_t)walSizeInKilobytes;
- (unsigned)version;
- (void)atomRowsInTimestampClockVector:(id)a3 forLocation:(id)a4 inStream:(id)a5 enumerateWithBlock:(id)a6;
- (void)atomRowsNotOnDiskReferencingSiteIdentifier:(id)a3 inStream:(id)a4 enumerateWithBlock:(id)a5;
- (void)atomsAtOrBeforeLocation:(id)a3 ofType:(unint64_t)a4 enumerateWithBlock:(id)a5;
- (void)clearCKSyncEngineMetaData;
- (void)clearCachedStatements;
- (void)close;
- (void)compactAndDeleteSessionLogs;
- (void)computeAggregatedSessionLogsWithHandlerBlock:(id)a3;
- (void)deleteAllCKRecordsInZone:(id)a3;
- (void)deleteCKRecordAtLocation:(id)a3;
- (void)deleteCKRecordsAtOrBeforeLocation:(id)a3;
- (void)deleteCKRecordsForStreamName:(id)a3;
- (void)disableStatementCachingForBlock:(id)a3;
- (void)enforceMaxSessionLogPrunePolicy;
- (void)enumerateCKSyncRecordRecordsSetForDeletingUsingBlock:(id)a3;
- (void)enumerateMergeableRecordValuesForRecordName:(id)a3 zoneName:(id)a4 withBlock:(id)a5;
- (void)enumerateRecordsWithBlock:(id)a3;
- (void)enumerateZonesWithBlock:(id)a3;
- (void)markCKRecordsAtOrBeforeLocationToBeDeletedOnSync:(id)a3;
- (void)recordAtomMergeResult:(unint64_t)a3 inStream:(id)a4 sessionID:(id)a5 messageID:(unint64_t)a6 ownerSite:(id)a7 originatingSite:(id)a8 eventCreatedAt:(double)a9;
- (void)recordMessageToDeviceIdentifier:(id)a3 sessionID:(id)a4 messageID:(unint64_t)a5 reachable:(BOOL)a6 bytes:(unint64_t)a7 isReciprocal:(BOOL)a8;
- (void)recordSessionEnd:(id)a3 timeSincePreviousSync:(double)a4;
- (void)recordSessionStart:(id)a3 transport:(unint64_t)a4 reason:(unint64_t)a5 isReciprocal:(BOOL)a6;
- (void)resetMetadataForRecord:(id)a3 zoneName:(id)a4;
- (void)runMetricsCollectionTask:(id)a3;
- (void)runVacuumingTask:(id)a3;
- (void)saveCKSyncEngineMetaData:(id)a3;
- (void)saveSystemFieldsDataForRecord:(id)a3 syncToCloudKit:(id)a4 recordType:(unint64_t)a5 crdtDeleted:(id)a6;
- (void)setCorruptionHandler:(id)a3;
- (void)setDateOfLastVacuum:(id)a3;
- (void)setLastCloudKitSyncAttemptDate:(id)a3;
- (void)setLastCloudKitSyncDate:(id)a3;
- (void)setLastRapportSyncAttemptDate:(id)a3;
- (void)setLastRapportSyncDate:(id)a3;
- (void)setMergeableRecordValueKey:(id)a3;
- (void)setName:(id)a3;
- (void)setSharedSyncGeneration:(id)a3;
- (void)setState:(unint64_t)a3 error:(id)a4;
- (void)setState:(unint64_t)a3 errorFormat:(id)a4;
- (void)setValue:(id)a3 forMetadataKey:(id)a4;
- (void)updateAllCKRecordsAtOrBeforeLocationToBeDeletedOnSync:(id)a3;
@end

@implementation BMSyncDatabase

- (id)locationRowWithLocation:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  fmdb = self->_fmdb;
  v13[0] = @"stream = ?";
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 streamName]);
  v13[1] = v5;
  v13[2] = @" AND site = ?";
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 siteIdentifier]);
  v13[3] = v6;
  v13[4] = @" AND day = ?";
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 day]);

  [v7 timeIntervalSinceReferenceDate];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v13[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 6LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"CRDTLocation",  &off_10006E6A8,  v9));

  if ([v10 next]) {
    v11 = -[BMSyncCRDTLocationRow initWithFMResultSet:modifier:]( objc_alloc(&OBJC_CLASS___BMSyncCRDTLocationRow),  "initWithFMResultSet:modifier:",  v10,  0LL);
  }
  else {
    v11 = 0LL;
  }
  [v10 close];

  return v11;
}

- (id)locationRowWithLocationID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    fmdb = self->_fmdb;
    v11[0] = @"id = ?";
    v11[1] = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"CRDTLocation",  &off_10006E6C0,  v7));

    if ([v8 next]) {
      v9 = -[BMSyncCRDTLocationRow initWithFMResultSet:modifier:]( objc_alloc(&OBJC_CLASS___BMSyncCRDTLocationRow),  "initWithFMResultSet:modifier:",  v8,  0LL);
    }
    else {
      v9 = 0LL;
    }
    [v8 close];
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (BOOL)updateLocationState:(unint64_t)a3 forLocation:(id)a4
{
  id v6 = a4;
  uint64_t v7 = __biome_log_for_category(11LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134218242;
    unint64_t v15 = a3;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "updateLocationState: %lu forLocation:%@",  (uint8_t *)&v14,  0x16u);
  }

  v9 = objc_alloc(&OBJC_CLASS___BMSyncCRDTLocationRow);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 location]);
  v11 = -[BMSyncCRDTLocationRow initWithLocation:state:primaryKey:]( v9,  "initWithLocation:state:primaryKey:",  v10,  a3,  [v6 primaryKey]);

  BOOL v12 = -[BMSyncDatabase upsertLocation:](self, "upsertLocation:", v11);
  return v12;
}

- (BOOL)updateAllLocationsAtOrBefore:(id)a3 state:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = __biome_log_for_category(11LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v6;
    __int16 v26 = 2048;
    unint64_t v27 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "updateAllLocationsAtOrBefore:%@ to state %lu",  buf,  0x16u);
  }

  fmdb = self->_fmdb;
  v22 = @"state";
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  v23 = v20;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
  v21[0] = @"stream = ?";
  v19 = (void *)objc_claimAutoreleasedReturnValue([v6 location]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v19 streamName]);
  v21[1] = v11;
  v21[2] = @" AND site = ?";
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v6 location]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 siteIdentifier]);
  v21[3] = v13;
  v21[4] = @" AND day <= ?";
  int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 location]);
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 day]);
  [v15 timeIntervalSinceReferenceDate];
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v21[5] = v16;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 6LL));
  LOBYTE(fmdb) = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", @"CRDTLocation", v10, v17);

  return (char)fmdb;
}

- (id)insertLocationIfNotExists:(id)a3 withState:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase locationRowWithLocation:](self, "locationRowWithLocation:", v6));
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }

  else
  {
    fmdb = self->_fmdb;
    v19[0] = @"stream";
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 streamName]);
    v20[0] = v10;
    v19[1] = @"site";
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 siteIdentifier]);
    v20[1] = v11;
    v19[2] = @"day";
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v6 day]);
    [v12 timeIntervalSinceReferenceDate];
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    v20[2] = v13;
    v19[3] = @"state";
    int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
    v20[3] = v14;
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  4LL));
    -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", @"CRDTLocation", v15);

    v9 = -[BMSyncCRDTLocationRow initWithLocation:state:primaryKey:]( objc_alloc(&OBJC_CLASS___BMSyncCRDTLocationRow),  "initWithLocation:state:primaryKey:",  v6,  a4,  -[_bmFMDatabase lastInsertRowId](self->_fmdb, "lastInsertRowId"));
  }

  __int16 v16 = v9;

  return v16;
}

- (BOOL)upsertLocation:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 location]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase locationRowWithLocation:](self, "locationRowWithLocation:", v5));
  fmdb = self->_fmdb;
  if (v6)
  {
    v25[0] = @"stream";
    v21 = v6;
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 streamName]);
    v26[0] = v8;
    v25[1] = @"site";
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 siteIdentifier]);
    v26[1] = v9;
    v25[2] = @"day";
    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 day]);
    [v10 timeIntervalSinceReferenceDate];
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    v26[2] = v11;
    v25[3] = @"state";
    id v12 = [v4 state];

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v12));
    v26[3] = v13;
    int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  4LL));
    v24[0] = @"id = ?";
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v21 primaryKey]));
    v24[1] = v15;
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));
    unsigned __int8 v17 = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", @"CRDTLocation", v14, v16);

    v18 = (void *)v8;
    id v6 = v21;
  }

  else
  {
    v22[0] = @"stream";
    v18 = (void *)objc_claimAutoreleasedReturnValue([v5 streamName]);
    v23[0] = v18;
    v22[1] = @"site";
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 siteIdentifier]);
    v23[1] = v9;
    v22[2] = @"day";
    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 day]);
    [v10 timeIntervalSinceReferenceDate];
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    v23[2] = v11;
    v22[3] = @"state";
    id v19 = [v4 state];

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v19));
    v23[3] = v13;
    int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  4LL));
    unsigned __int8 v17 = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", @"CRDTLocation", v14);
  }

  return v17;
}

- (BOOL)removeAllDeletedLocationsBeforeHighestDeletedLocation:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 location]);
  fmdb = self->_fmdb;
  v14[0] = @"stream = ?";
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 streamName]);
  v14[1] = v6;
  v14[2] = @" AND site = ?";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 siteIdentifier]);
  v14[3] = v7;
  v14[4] = @" AND state = ?";
  v14[5] = &off_10006EE40;
  v14[6] = @" AND day < ?";
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 day]);
  [v8 timeIntervalSinceReferenceDate];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v14[7] = v9;
  v14[8] = CFSTR(" AND NOT EXISTS (SELECT 1 FROM CKAtom WHERE stream = ? ");
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 streamName]);
  v14[9] = v10;
  v14[10] = @" AND site = ?";
  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 siteIdentifier]);
  v14[11] = v11;
  v14[12] = @" AND location_id = id");
  v14[13] = &stru_100069BD0;
  v14[14] = @" AND NOT EXISTS (SELECT location_id FROM CKRecord WHERE location_id = id)";
  v14[15] = &stru_100069BD0;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 16LL));
  LOBYTE(fmdb) = -[_bmFMDatabase DELETE_FROM:WHERE:](fmdb, "DELETE_FROM:WHERE:", @"CRDTLocation", v12);

  return (char)fmdb;
}

- (id)previousLocationRowBeforeLocationRow:(id)a3
{
  fmdb = self->_fmdb;
  v16[0] = @"stream = ?";
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 location]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 streamName]);
  v16[1] = v6;
  v16[2] = @" AND site = ?";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 location]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 siteIdentifier]);
  v16[3] = v8;
  v16[4] = @" AND day < ?";
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 location]);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 day]);
  [v10 timeIntervalSinceReferenceDate];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v16[5] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 6LL));
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:",  @"CRDTLocation",  &off_10006E6D8,  v12,  &off_10006E6F0,  &off_10006EE58));

  if ([v13 next]) {
    int v14 = -[BMSyncCRDTLocationRow initWithFMResultSet:modifier:]( objc_alloc(&OBJC_CLASS___BMSyncCRDTLocationRow),  "initWithFMResultSet:modifier:",  v13,  0LL);
  }
  else {
    int v14 = 0LL;
  }
  [v13 close];

  return v14;
}

- (id)locationsWithState:(unint64_t)a3
{
  fmdb = self->_fmdb;
  v11[0] = @"state = ?";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  v11[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:",  @"CRDTLocation",  &off_10006E708,  v5,  &off_10006E720,  0LL));

  uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if ([v6 next])
  {
    do
    {
      uint64_t v8 = -[BMSyncCRDTLocationRow initWithFMResultSet:modifier:]( objc_alloc(&OBJC_CLASS___BMSyncCRDTLocationRow),  "initWithFMResultSet:modifier:",  v6,  0LL);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncCRDTLocationRow location](v8, "location"));
      -[NSMutableArray addObject:](v7, "addObject:", v9);
    }

    while (([v6 next] & 1) != 0);
  }

  [v6 close];

  return v7;
}

- (id)highestDeletedLocationsForStream:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  fmdb = self->_fmdb;
  v12[0] = CFSTR("day = (select max(day) from CRDTLocation i where i.stream = ? and i.site=CRDTLocation.site");
  v12[1] = v4;
  v12[2] = @" and state = ?");
  v12[3] = &off_10006EE40;
  v12[4] = @" AND stream = ?";
  v12[5] = v4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 6LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"CRDTLocation",  &off_10006E738,  v7));

  if ([v8 next])
  {
    do
    {
      v9 = -[BMSyncCRDTLocationRow initWithFMResultSet:modifier:]( objc_alloc(&OBJC_CLASS___BMSyncCRDTLocationRow),  "initWithFMResultSet:modifier:",  v8,  0LL);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncCRDTLocationRow location](v9, "location"));
      -[NSMutableArray addObject:](v5, "addObject:", v10);
    }

    while (([v8 next] & 1) != 0);
  }

  [v8 close];

  return v5;
}

- (id)highestDeletedLocationForSiteIdentifier:(id)a3 inStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  fmdb = self->_fmdb;
  v13[0] = @"stream = ?";
  v13[1] = v7;
  v13[2] = @" AND site = ?";
  v13[3] = v6;
  v13[4] = @" AND state = ? ";
  v13[5] = &off_10006EE40;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 6LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:",  @"CRDTLocation",  &off_10006E750,  v9,  &off_10006E768,  &off_10006EE58));

  if ([v10 next]) {
    v11 = -[BMSyncCRDTLocationRow initWithFMResultSet:modifier:]( objc_alloc(&OBJC_CLASS___BMSyncCRDTLocationRow),  "initWithFMResultSet:modifier:",  v10,  0LL);
  }
  else {
    v11 = 0LL;
  }
  [v10 close];

  return v11;
}

- (int)CRDTLocationCount
{
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( self->_fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"CRDTLocation",  &off_10006E780,  0LL));
  else {
    int v5 = 0;
  }
  [v4 close];

  return v5;
}

  ;
}

- (id)localDevice
{
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( self->_fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"DevicePeer",  &off_10006E798,  &off_10006E7B0));
  if ([v4 next]) {
    int v5 = -[BMSyncDevicePeer initWithFMResultSet:]( objc_alloc(&OBJC_CLASS___BMSyncDevicePeer),  "initWithFMResultSet:",  v4);
  }
  else {
    int v5 = 0LL;
  }
  [v4 close];

  return v5;
}

- (BOOL)upsertSyncDevicePeer:(id)a3 isMe:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceIdentifier]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[BMSyncDatabase deviceWithIdentifier:](self, "deviceWithIdentifier:", v8));

  fmdb = self->_fmdb;
  v34 = (void *)v9;
  if (v9)
  {
    v36[0] = @"device_identifier";
    uint64_t v29 = objc_claimAutoreleasedReturnValue([v6 deviceIdentifier]);
    v37[0] = v29;
    v36[1] = @"ids_device_identifier";
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 idsDeviceIdentifier]);
    v33 = (void *)v10;
    if (v10) {
      v11 = (const __CFString *)v10;
    }
    else {
      v11 = &stru_100069BD0;
    }
    v37[1] = v11;
    v36[2] = @"name";
    v32 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v32 name]);
    v13 = (void *)v12;
    if (v12) {
      int v14 = (const __CFString *)v12;
    }
    else {
      int v14 = &stru_100069BD0;
    }
    v37[2] = v14;
    v36[3] = @"model";
    v30 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v30 model]);
    v37[3] = v15;
    v36[4] = @"platform";
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v16 platform]));
    v37[4] = v17;
    v36[5] = @"protocol_version";
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 protocolVersion]));
    v37[5] = v18;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  6LL));
    v35[0] = @"device_identifier = ?";
    v20 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceIdentifier]);
    v35[1] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 2LL));
    unsigned __int8 v22 = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", @"DevicePeer", v19, v21);

    v23 = (void *)v29;
  }

  else
  {
    v38[0] = @"device_identifier";
    v23 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceIdentifier]);
    v39[0] = v23;
    v38[1] = @"ids_device_identifier";
    uint64_t v24 = objc_claimAutoreleasedReturnValue([v6 idsDeviceIdentifier]);
    v33 = (void *)v24;
    if (v24) {
      id v25 = (const __CFString *)v24;
    }
    else {
      id v25 = &stru_100069BD0;
    }
    v39[1] = v25;
    v38[2] = @"name";
    v32 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
    uint64_t v26 = objc_claimAutoreleasedReturnValue([v32 name]);
    v13 = (void *)v26;
    if (v26) {
      unint64_t v27 = (const __CFString *)v26;
    }
    else {
      unint64_t v27 = &stru_100069BD0;
    }
    v39[2] = v27;
    v38[3] = @"me";
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
    v39[3] = v30;
    v38[4] = @"model";
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 model]);
    v39[4] = v16;
    v38[5] = @"platform";
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v17 platform]));
    v39[5] = v18;
    v38[6] = @"protocol_version";
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 protocolVersion]));
    v39[6] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  7LL));
    unsigned __int8 v22 = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", @"DevicePeer", v20);
  }

  return v22;
}

- (id)deviceWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v11[0] = @"device_identifier = ?";
  v11[1] = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"DevicePeer",  &off_10006E7C8,  v7));

  if ([v8 next]) {
    uint64_t v9 = -[BMSyncDevicePeer initWithFMResultSet:]( objc_alloc(&OBJC_CLASS___BMSyncDevicePeer),  "initWithFMResultSet:",  v8);
  }
  else {
    uint64_t v9 = 0LL;
  }
  [v8 close];

  return v9;
}

- (id)lastSyncDateFromAnyDevice
{
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( self->_fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"DevicePeer",  &off_10006E7E0,  0LL));
  int v5 = 0LL;
  [v4 close];

  return v5;
}

- (id)lastSyncDateOfDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v11[0] = @"device_identifier = ?";
  v11[1] = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"DevicePeer",  &off_10006E7F8,  v7));

  else {
    uint64_t v9 = 0LL;
  }
  [v8 close];

  return v9;
}

- (BOOL)setLastSyncDate:(id)a3 forDeviceWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  int v14 = @"last_sync_date";
  id v15 = v6;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
  v13[0] = @"device_identifier = ?";
  v13[1] = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
  LOBYTE(fmdb) = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", @"DevicePeer", v10, v11);

  return (char)fmdb;
}

- (id)allPeers
{
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  int v5 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( self->_fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"DevicePeer",  &off_10006E810,  0LL));
  if ([v5 next])
  {
    do
    {
      id v6 = -[BMSyncDevicePeer initWithFMResultSet:]( objc_alloc(&OBJC_CLASS___BMSyncDevicePeer),  "initWithFMResultSet:",  v5);
      -[NSMutableArray addObject:](v4, "addObject:", v6);
    }

    while (([v5 next] & 1) != 0);
  }

  [v5 close];

  return v4;
}

- (void)runMetricsCollectionTask:(id)a3
{
  id v4 = a3;
  id v6 = -[BMSyncSessionMetricsAggregator initWithDatabase:activity:]( objc_alloc(&OBJC_CLASS___BMSyncSessionMetricsAggregator),  "initWithDatabase:activity:",  self,  v4);
  -[BMSyncSessionMetricsAggregator enforceMaxSessionLogPrunePolicy](v6, "enforceMaxSessionLogPrunePolicy");
  -[BMSyncSessionMetricsAggregator computeAndSendAggregatedMetrics](v6, "computeAndSendAggregatedMetrics");
  -[BMSyncSessionMetricsAggregator compactAndDeleteSessionLogs](v6, "compactAndDeleteSessionLogs");
  int v5 = -[BMStateVectorMetricsCollector initWithDatabase:activity:]( objc_alloc(&OBJC_CLASS___BMStateVectorMetricsCollector),  "initWithDatabase:activity:",  self,  v4);

  -[BMStateVectorMetricsCollector computeAndSendStateVectorMetrics](v5, "computeAndSendStateVectorMetrics");
}

- (BOOL)ckZoneExists:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v10[0] = @"zone_name = ?";
  v10[1] = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"CKZone",  &off_10006E828,  v7));

  LOBYTE(fmdb) = [v8 next];
  return (char)fmdb;
}

- (id)ckZoneForZoneName:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v11[0] = @"zone_name = ?";
  v11[1] = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"CKZone",  &off_10006E840,  v7));

  else {
    uint64_t v9 = 0LL;
  }

  return v9;
}

- (BOOL)ckZoneSetAttemptingRecoveryForZoneName:(id)a3 state:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  unsigned int v8 = -[BMSyncDatabase ckZoneExists:](self, "ckZoneExists:", v6);
  fmdb = self->_fmdb;
  if (v8)
  {
    id v19 = @"recovery_state";
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
    v20 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    v18[0] = @"zone_name = ?";
    v18[1] = v6;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
    unsigned __int8 v13 = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", @"CKZone", v11, v12);
  }

  else
  {
    v17[0] = v6;
    v16[0] = @"zone_name";
    v16[1] = @"recovery_state";
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
    v17[1] = v10;
    v17[2] = @"UUID not set";
    v16[2] = @"zone_uuid";
    v16[3] = @"attempted_recovery_date";
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    v17[3] = v11;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  4LL));
    unsigned __int8 v13 = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", @"CKZone", v12);
  }

  BOOL v14 = v13;

  return v14;
}

- (BOOL)ckZoneSetZoneVersionUUID:(id)a3 forZoneName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  unsigned int v9 = -[BMSyncDatabase ckZoneExists:](self, "ckZoneExists:", v7);
  fmdb = self->_fmdb;
  if (v9)
  {
    id v19 = @"zone_uuid";
    id v20 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    v18[0] = @"zone_name = ?";
    v18[1] = v7;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
    unsigned __int8 v13 = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", @"CKZone", v11, v12);
  }

  else
  {
    v16[0] = @"zone_name";
    v16[1] = @"zone_uuid";
    v17[0] = v7;
    v17[1] = v6;
    v17[2] = &off_10006EEA0;
    v16[2] = @"recovery_state";
    v16[3] = @"attempted_recovery_date";
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    v17[3] = v11;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  4LL));
    unsigned __int8 v13 = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", @"CKZone", v12);
  }

  BOOL v14 = v13;

  return v14;
}

- (BOOL)ckZoneSetAttemptedRecoveryDate:(id)a3 state:(int)a4 forZoneName:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  unsigned int v11 = -[BMSyncDatabase ckZoneExists:](self, "ckZoneExists:", v9);
  fmdb = self->_fmdb;
  if (v11)
  {
    v21[0] = @"recovery_state";
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v6));
    v21[1] = @"attempted_recovery_date";
    v22[0] = v13;
    v22[1] = v8;
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));
    v20[0] = @"zone_name = ?";
    v20[1] = v9;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL));
    unsigned __int8 v16 = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", @"CKZone", v14, v15);
  }

  else
  {
    v19[0] = v9;
    v18[0] = @"zone_name";
    v18[1] = @"recovery_state";
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v6));
    v19[1] = v13;
    v19[2] = @"UUID not set";
    void v18[2] = @"zone_uuid";
    v18[3] = @"attempted_recovery_date";
    v19[3] = v8;
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  4LL));
    unsigned __int8 v16 = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", @"CKZone", v14);
  }

  return v16;
}

- (void)enumerateZonesWithBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, BMSyncCKZone *, _BYTE *))a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( self->_fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"CKZone",  &off_10006E858,  0LL));
  char v9 = 0;
  do
  {
    id v7 = objc_autoreleasePoolPush();
    id v8 = -[BMSyncCKZone initWithFMResultSet:](objc_alloc(&OBJC_CLASS___BMSyncCKZone), "initWithFMResultSet:", v6);
    v4[2](v4, v8, &v9);

    objc_autoreleasePoolPop(v7);
  }

  while (!v9);
}

- (BOOL)addCKAtomRow:(id)a3 inStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  char v9 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 timestamp]);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 siteIdentifierObject]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  unsigned __int8 v13 = -[NSString initWithData:encoding:](v9, "initWithData:encoding:", v12, 4LL);

  BOOL v14 = objc_alloc(&OBJC_CLASS___NSString);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 causalReference]);
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 timestamp]);
  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 siteIdentifierObject]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
  id v19 = -[NSString initWithData:encoding:](v14, "initWithData:encoding:", v18, 4LL);

  p_fmdb = &self->_fmdb;
  fmdb = self->_fmdb;
  v63[0] = @"stream";
  v63[1] = @"site";
  v64[0] = v7;
  v64[1] = v13;
  v61 = v13;
  v63[2] = @"clock";
  v59 = (void *)objc_claimAutoreleasedReturnValue([v6 timestamp]);
  v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v59 clockValue]));
  v64[2] = v58;
  v63[3] = @"type";
  v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 type]));
  v64[3] = v57;
  v63[4] = @"location_id";
  v56 = (void *)objc_claimAutoreleasedReturnValue([v6 location]);
  v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v56 primaryKey]));
  v64[4] = v55;
  v63[5] = @"segment_name";
  uint64_t v20 = objc_claimAutoreleasedReturnValue([v6 segmentName]);
  v21 = (void *)v20;
  if (!v20) {
    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v54 = v21;
  v43 = (void *)v20;
  v64[5] = v20;
  v63[6] = @"segment_offset";
  v53 = (void *)objc_claimAutoreleasedReturnValue([v6 segmentName]);
  if (v53) {
    uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( NSNumber,  "numberWithUnsignedLong:",  [v6 segmentOffset]));
  }
  else {
    uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v52 = (void *)v22;
  v64[6] = v22;
  v63[7] = @"on_disk";
  uint64_t v23 = objc_claimAutoreleasedReturnValue([v6 segmentName]);
  if (v23) {
    uint64_t v24 = &__kCFBooleanTrue;
  }
  else {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v42 = v24;
  v64[7] = v24;
  v63[8] = @"ref_type";
  v48 = (void *)objc_claimAutoreleasedReturnValue([v6 causalReference]);
  if (v48)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue([v6 causalReference]);
    uint64_t v25 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  [v47 type]));
  }

  else
  {
    uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v47 = (void *)v25;
  }

  v45 = (void *)v25;
  v64[8] = v25;
  v63[9] = @"ref_location_id";
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v6 referenceLocation]);
  if (v26)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue([v6 referenceLocation]);
    uint64_t v27 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v46 primaryKey]));
  }

  else
  {
    uint64_t v27 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v46 = (void *)v27;
  }

  v44 = (void *)v27;
  v64[9] = v27;
  v63[10] = @"ref_site";
  v28 = (void *)objc_claimAutoreleasedReturnValue([v6 causalReference]);
  v60 = v19;
  if (!v28) {
    id v19 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v49 = (void *)v23;
  v62 = v7;
  v41 = v19;
  v64[10] = v19;
  v63[11] = @"ref_clock";
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v6 causalReference]);
  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue([v6 causalReference]);
    v40 = (void *)objc_claimAutoreleasedReturnValue([v30 timestamp]);
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v40 clockValue]));
  }

  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v30 = v31;
  }

  v64[11] = v31;
  v63[12] = @"value_version";
  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v6 valueVersion]));
  v64[12] = v32;
  v63[13] = @"value_data";
  v33 = (void *)objc_claimAutoreleasedReturnValue([v6 valueData]);
  v34 = v33;
  if (!v33) {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v64[13] = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v64,  v63,  14LL));
  unsigned __int8 v51 = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", @"CKAtom", v35);

  if (!v33) {
  if (v29)
  }
  {
  }

  if (!v28) {
  if (v26)
  }

  if (v48) {
  if (!v49)
  }

  if (!v54) {
  if ((v51 & 1) == 0)
  }
  {
    uint64_t v36 = __biome_log_for_category(11LL);
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
      sub_100041C10((id *)p_fmdb);
    }
  }

  return v51;
}

- (id)ckAtomRowWithTimestamp:(id)a3 inStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  char v9 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 siteIdentifierObject]);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  uint64_t v12 = -[NSString initWithData:encoding:](v9, "initWithData:encoding:", v11, 4LL);

  v18[0] = @"CKAtom.site = ?";
  v18[1] = v12;
  void v18[2] = @" AND CKAtom.stream = ?";
  v18[3] = v7;
  void v18[4] = @" AND clock = ?";
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 clockValue]));
  v18[5] = v13;
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 6LL));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:]( self,  "SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:",  v14,  0LL,  0LL));

  unsigned __int8 v16 = 0LL;
  if ([v15 next]) {
    unsigned __int8 v16 = -[BMSyncCKAtomRow initWithFMResultSet:]( objc_alloc(&OBJC_CLASS___BMSyncCKAtomRow),  "initWithFMResultSet:",  v15);
  }
  [v15 close];

  return v16;
}

- (id)latestCKAtomRowForSiteIdentifier:(id)a3 inStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  v13[0] = @"CKAtom.site = ?";
  v13[1] = v6;
  void v13[2] = @" AND CKAtom.stream = ?";
  v13[3] = v7;
  v13[4] = @" AND on_disk IS ?";
  v13[5] = &__kCFBooleanTrue;
  char v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 6LL));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:]( self,  "SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:",  v9,  &off_10006E870,  &off_10006EED0));

  if ([v10 next]) {
    unsigned int v11 = -[BMSyncCKAtomRow initWithFMResultSet:]( objc_alloc(&OBJC_CLASS___BMSyncCKAtomRow),  "initWithFMResultSet:",  v10);
  }
  else {
    unsigned int v11 = 0LL;
  }
  [v10 close];

  return v11;
}

- (id)legacyTimestampClockVectorForStreamName:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v6 = (void *)objc_opt_new(&OBJC_CLASS___CKDistributedTimestampClockVector);
  fmdb = self->_fmdb;
  v17[0] = @"stream = ?";
  v17[1] = v4;
  v17[2] = @" AND on_disk IS ?";
  v17[3] = &__kCFBooleanTrue;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 4LL));
  char v9 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:GROUP_BY:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:GROUP_BY:",  @"CKAtom",  &off_10006E888,  v8,  &off_10006E8A0));

  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  BOOL v14 = sub_10001BF6C;
  id v15 = &unk_100069250;
  id v10 = v6;
  id v16 = v10;
  [v9 enumerateWithBlock:&v12];
  objc_msgSend(v9, "close", v12, v13, v14, v15);

  return v10;
}

- (id)rangeClockVectorForStreamName:(id)a3
{
  id v24 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v23 = (id)objc_opt_new(&OBJC_CLASS___CKDistributedTimestampClockVector);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase CKAtomRowSiteIdentifiersForStreamIdentifier:]( self,  "CKAtomRowSiteIdentifiersForStreamIdentifier:",  v24));
  id v5 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        char v9 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v8);
        id v10 = objc_autoreleasePoolPush();
        unsigned int v11 = objc_opt_new(&OBJC_CLASS___NSMutableIndexSet);
        fmdb = self->_fmdb;
        v33[0] = @"stream = ?";
        v33[1] = v24;
        v33[2] = @" AND site = ?";
        v33[3] = v9;
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 4LL));
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:",  @"CKAtom",  &off_10006E8B8,  v13,  &off_10006E8D0,  0LL));

        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = sub_10001C338;
        v25[3] = &unk_100069250;
        id v15 = v11;
        uint64_t v26 = v15;
        [v14 enumerateWithBlock:v25];
        [v14 close];
        id v16 = objc_alloc(&OBJC_CLASS___CKDistributedSiteIdentifier);
        unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v9 dataUsingEncoding:4]);
        id v18 = [v16 initWithIdentifier:v17];

        if (v18)
        {
          [v23 addClockValuesInIndexSet:v15 forSiteIdentifier:v18];
        }

        else
        {
          uint64_t v19 = __biome_log_for_category(11LL);
          uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v9;
            _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Failed to decode CKDistributedSiteIdentifier from site %@",  buf,  0xCu);
          }
        }

        objc_autoreleasePoolPop(v10);
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
    }

    while (v6);
  }

  return v23;
}

- (id)stateVectorForLocationRow:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v24[0] = @"location_id = ?";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 primaryKey]));
  v24[1] = v7;
  void v24[2] = @" AND on_disk IS ?";
  v24[3] = &__kCFBooleanTrue;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 4LL));
  char v9 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:",  @"CKAtom",  &off_10006E8E8,  v8,  &off_10006E900,  0LL));

  uint64_t v16 = 0LL;
  unsigned __int8 v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = sub_10001C5C4;
  uint64_t v20 = sub_10001C5D4;
  id v21 = (id)objc_opt_new(&OBJC_CLASS___CKDistributedTimestampStateVector);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10001C5DC;
  v15[3] = &unk_100069278;
  v15[4] = &v16;
  [v9 enumerateWithBlock:v15];
  [v9 close];
  uint64_t v10 = __biome_log_for_category(11LL);
  unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v17[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "stateVector: %@", buf, 0xCu);
  }

  id v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

- (id)latestCKAtomRowOfType:(unint64_t)a3 forSiteIdentifier:(id)a4 inStream:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  v16[0] = @"type = ?";
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  v16[1] = v11;
  v16[2] = @" AND CKAtom.stream = ?";
  v16[3] = v9;
  void v16[4] = @" AND CKAtom.site = ?";
  v16[5] = v8;
  void v16[6] = @" AND on_disk IS ?";
  v16[7] = &__kCFBooleanTrue;
  v16[8] = @" AND segment_name IS NOT ?";
  v16[9] = @"DOA";
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 10LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:]( self,  "SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:",  v12,  &off_10006E918,  &off_10006EED0));

  if ([v13 next]) {
    BOOL v14 = -[BMSyncCKAtomRow initWithFMResultSet:]( objc_alloc(&OBJC_CLASS___BMSyncCKAtomRow),  "initWithFMResultSet:",  v13);
  }
  else {
    BOOL v14 = 0LL;
  }
  [v13 close];

  return v14;
}

- (int)ckAtomCount
{
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( self->_fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"CKAtom",  &off_10006E930,  0LL));
  else {
    int v5 = 0;
  }
  [v4 close];

  return v5;
}

- (BOOL)containsCKAtomRowWithTimestamp:(id)a3 inStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v9 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 siteIdentifierObject]);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  uint64_t v12 = -[NSString initWithData:encoding:](v9, "initWithData:encoding:", v11, 4LL);

  fmdb = self->_fmdb;
  v19[0] = @"clock = ?";
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 clockValue]));
  v19[1] = v14;
  v19[2] = @" AND stream = ?";
  v19[3] = v7;
  void v19[4] = @" AND site = ?";
  v19[5] = v12;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 6LL));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"CKAtom",  &off_10006E948,  v15));

  else {
    BOOL v17 = 0;
  }
  [v16 close];

  return v17;
}

- (BOOL)containsCKAtomRowWithTimestamp:(id)a3 inStream:(id)a4 onDisk:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  unsigned int v11 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 siteIdentifierObject]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
  BOOL v14 = -[NSString initWithData:encoding:](v11, "initWithData:encoding:", v13, 4LL);

  fmdb = self->_fmdb;
  v22[0] = @"clock = ?";
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 clockValue]));
  v22[1] = v16;
  void v22[2] = @" AND stream = ?";
  v22[3] = v9;
  void v22[4] = @" AND site = ?";
  v22[5] = v14;
  v22[6] = @" AND on_disk IS ?";
  if (a5) {
    BOOL v17 = &__kCFBooleanTrue;
  }
  else {
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v22[7] = v17;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 8LL));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"CKAtom",  &off_10006E960,  v18));

  if (!a5) {
  else
  }
    BOOL v20 = 0;
  [v19 close];

  return v20;
}

- (BOOL)updateCKAtomRow:(id)a3 inStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v9 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 timestamp]);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 siteIdentifierObject]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  id v13 = -[NSString initWithData:encoding:](v9, "initWithData:encoding:", v12, 4LL);

  p_fmdb = &self->_fmdb;
  fmdb = self->_fmdb;
  v41[0] = @"segment_name";
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v6 segmentName]);
  id v15 = (void *)v14;
  if (!v14) {
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v37 = v15;
  v32 = (void *)v14;
  v42[0] = v14;
  v41[1] = @"segment_offset";
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v6 segmentName]);
  if (v36) {
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( NSNumber,  "numberWithUnsignedLong:",  [v6 segmentOffset]));
  }
  else {
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v35 = (void *)v16;
  v42[1] = v16;
  v41[2] = @"value_version";
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v6 valueVersion]));
  v42[2] = v33;
  v41[3] = @"value_data";
  uint64_t v17 = objc_claimAutoreleasedReturnValue([v6 valueData]);
  uint64_t v18 = (void *)v17;
  if (!v17) {
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v31 = (void *)v17;
  v42[3] = v17;
  v41[4] = @"on_disk";
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v6 segmentName]);
  if (v19) {
    BOOL v20 = &__kCFBooleanTrue;
  }
  else {
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v42[4] = v20;
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  5LL));
  v39 = v7;
  v40[0] = @"stream = ?";
  v40[1] = v7;
  v40[2] = @" AND site = ?";
  v38 = v13;
  v40[3] = v13;
  v40[4] = @" AND clock = ?";
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v6 timestamp]);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v22 clockValue]));
  v40[5] = v23;
  v40[6] = @" AND type = ?";
  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 type]));
  v40[7] = v24;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v40, 8LL));
  unsigned __int8 v26 = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", @"CKAtom", v21, v25);

  if (!v19) {
  if (!v18)
  }

  if (!v37) {
  if ((v26 & 1) == 0)
  }
  {
    uint64_t v27 = __biome_log_for_category(11LL);
    __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      sub_100041C8C((id *)p_fmdb);
    }
  }

  return v26;
}

- (id)ckAtomRowForAtomWithBookmark:(id)a3 type:(unint64_t)a4 forSiteIdentifier:(id)a5 inStream:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  v21[0] = @"CKAtom.site = ?";
  v21[1] = v11;
  void v21[2] = @" AND CKAtom.stream = ?";
  v21[3] = v12;
  v21[4] = @" AND type = ?";
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  v21[5] = v14;
  void v21[6] = @" AND segment_name = ?";
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 segmentName]);
  v21[7] = v15;
  v21[8] = @" AND segment_offset = ?";
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( NSNumber,  "numberWithUnsignedLong:",  [v10 offset]));
  v21[9] = v16;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 10LL));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:]( self,  "SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:",  v17,  0LL,  0LL));

  uint64_t v19 = 0LL;
  if ([v18 next]) {
    uint64_t v19 = -[BMSyncCKAtomRow initWithFMResultSet:]( objc_alloc(&OBJC_CLASS___BMSyncCKAtomRow),  "initWithFMResultSet:",  v18);
  }
  [v18 close];

  return v19;
}

- (id)latestDistributedTimestampForSiteIdentifier:(id)a3 inStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v18[0] = @"site = ?";
  v18[1] = v6;
  void v18[2] = @" AND stream = ?";
  v18[3] = v7;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 4LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"CKAtom",  &off_10006E978,  v10));

  if ([v11 next])
  {
    id v12 = [v11 unsignedLongLongIntForColumnIndex:0];
    id v13 = objc_alloc(&OBJC_CLASS___CKDistributedSiteIdentifier);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 dataUsingEncoding:4]);
    id v15 = [v13 initWithIdentifier:v14];

    uint64_t v16 = -[CKDistributedTimestamp initWithSiteIdentifierObject:clockValue:]( objc_alloc(&OBJC_CLASS___CKDistributedTimestamp),  "initWithSiteIdentifierObject:clockValue:",  v15,  v12);
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  [v11 close];

  return v16;
}

- (BOOL)containsCKAtomRowWithSegment:(id)a3 inStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v13[0] = @"stream = ?";
  v13[1] = v7;
  void v13[2] = @" AND segment_name = ?";
  v13[3] = v6;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 4LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"CKAtom",  &off_10006E990,  v10));

  LOBYTE(fmdb) = [v11 next];
  [v11 close];

  return (char)fmdb;
}

- (id)CKAtomRowSiteIdentifiers
{
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( self->_fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"CKAtom",  &off_10006E9A8,  0LL));
  int v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ([v4 next])
  {
    do
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringForColumnIndex:0]);
      -[NSMutableArray addObject:](v5, "addObject:", v6);
    }

    while (([v4 next] & 1) != 0);
  }

  [v4 close];

  return v5;
}

- (id)CKAtomRowSiteIdentifiersForStreamIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v12[0] = @"stream = ?";
  v12[1] = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"CKAtom",  &off_10006E9C0,  v7));

  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ([v8 next])
  {
    do
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 stringForColumnIndex:0]);
      -[NSMutableArray addObject:](v9, "addObject:", v10);
    }

    while (([v8 next] & 1) != 0);
  }

  [v8 close];

  return v9;
}

- (void)atomRowsNotOnDiskReferencingSiteIdentifier:(id)a3 inStream:(id)a4 enumerateWithBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  v20[0] = CFSTR("(ref_site = ?");
  v20[1] = v8;
  void v20[2] = @" OR (ref_site IS NULL AND CKAtom.site = ?)");
  v20[3] = v8;
  void v20[4] = @" AND CKAtom.stream = ?";
  v20[5] = v9;
  v20[6] = @" AND on_disk IS ?";
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v20[7] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 8LL));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:]( self,  "SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:",  v13,  &off_10006E9D8,  0LL));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10001D95C;
  v17[3] = &unk_1000692A0;
  id v18 = v14;
  id v19 = v10;
  id v15 = v14;
  id v16 = v10;
  [v15 enumerateWithBlock:v17];
  [v15 close];
}

- (void)atomsAtOrBeforeLocation:(id)a3 ofType:(unint64_t)a4 enumerateWithBlock:(id)a5
{
  id v8 = a3;
  id v22 = a5;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  v26[0] = @"location.stream = ?";
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v8 location]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v21 streamName]);
  v26[1] = v10;
  v26[2] = @" AND location.site = ?";
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 location]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 siteIdentifier]);
  v26[3] = v12;
  void v26[4] = @" AND location.day <= ?";
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 location]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 day]);
  [v14 timeIntervalSinceReferenceDate];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v26[5] = v15;
  v26[6] = @" AND type = ?";
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  v26[7] = v16;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 8LL));
  id v18 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:]( self,  "SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:",  v17,  &off_10006E9F0,  0LL));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10001DBF0;
  v23[3] = &unk_1000692A0;
  id v24 = v18;
  id v25 = v22;
  id v19 = v18;
  id v20 = v22;
  [v19 enumerateWithBlock:v23];
  [v19 close];
}

- (BOOL)deleteAllAtomsAtOrBeforeLocation:(id)a3
{
  id v4 = a3;
  fmdb = self->_fmdb;
  v29[0] = @"site = ?";
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 location]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 siteIdentifier]);
  v29[1] = v7;
  v29[2] = @" AND stream = ?";
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 location]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 streamName]);
  v29[3] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 4LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:",  @"CKAtom",  &off_10006EA08,  v10,  &off_10006EA20,  &off_10006EED0));

  if ([v11 next])
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v11 intForColumnIndex:0]));
    [v11 close];
    id v12 = self->_fmdb;
    v28[0] = CFSTR("location_id IN (SELECT id from CRDTLocation where stream = ?");
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v4 location]);
    unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue([v27 streamName]);
    v28[1] = v26;
    v28[2] = @" AND site = ?";
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v4 location]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v25 siteIdentifier]);
    v28[3] = v24;
    v28[4] = @" AND day <= ?");
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v4 location]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v22 day]);
    [v13 timeIntervalSinceReferenceDate];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    v28[5] = v14;
    v28[6] = @" AND clock != ?";
    v28[7] = v23;
    v28[8] = CFSTR(" AND clock != (SELECT MAX(clock) FROM CKAtom WHERE stream = ?");
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 location]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 streamName]);
    v28[9] = v16;
    v28[10] = @" AND site = ?");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 location]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 siteIdentifier]);
    v28[11] = v18;
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 12LL));
    unsigned __int8 v20 = -[_bmFMDatabase DELETE_FROM:WHERE:](v12, "DELETE_FROM:WHERE:", @"CKAtom", v19);
  }

  else
  {
    [v11 close];
    unsigned __int8 v20 = 0;
  }

  return v20;
}

- (id)activeLocationsInClockVector:(id)a3 inStream:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  __int128 v30 = v7;
  if ([v7 timestampCount])
  {
    __int128 v28 = self;
    id v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    -[NSMutableArray addObject:](v9, "addObject:", @"CKAtom.stream = ? ");
    -[NSMutableArray addObject:](v9, "addObject:", v8);
    v50[0] = 0LL;
    v50[1] = v50;
    v50[2] = 0x2020000000LL;
    v50[3] = 0LL;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 allSiteIdentifiers]);
    id v11 = [v10 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v47;
      char v13 = 1;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v47 != v12) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
          id v16 = objc_alloc(&OBJC_CLASS___NSString);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
          id v18 = -[NSString initWithData:encoding:](v16, "initWithData:encoding:", v17, 4LL);

          if ((v13 & 1) != 0) {
            id v19 = CFSTR(" AND ((CKAtom.site = ? ");
          }
          else {
            id v19 = @" OR (CKAtom.site = ? ");
          }
          -[NSMutableArray addObject:](v9, "addObject:", v19, v28);
          -[NSMutableArray addObject:](v9, "addObject:", v18);
          unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v30 clockValuesForSiteIdentifier:v15]);
          uint64_t v36 = 0LL;
          v37 = &v36;
          uint64_t v38 = 0x2020000000LL;
          LOBYTE(v39) = 1;
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472LL;
          v42[2] = sub_10001E3B0;
          v42[3] = &unk_1000692C8;
          v44 = v50;
          v45 = &v36;
          v43 = v9;
          [v20 enumerateRangesUsingBlock:v42];

          _Block_object_dispose(&v36, 8);
          char v13 = 0;
        }

        id v11 = [v10 countByEnumeratingWithState:&v46 objects:v51 count:16];
        char v13 = 0;
      }

      while (v11);
    }

    -[NSMutableArray addObject:](v9, "addObject:", @") AND on_disk IS ?"));
    -[NSMutableArray addObject:](v9, "addObject:", &__kCFBooleanTrue);
    -[NSMutableArray addObject:](v9, "addObject:", @" AND location.state = ?");
    -[NSMutableArray addObject:](v9, "addObject:", &off_10006EEE8);
    uint64_t v36 = 0LL;
    v37 = &v36;
    uint64_t v38 = 0x3032000000LL;
    v39 = sub_10001C5C4;
    v40 = sub_10001C5D4;
    id v41 = 0LL;
    id v21 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_10001E564;
    v31[3] = &unk_100069318;
    v31[4] = v28;
    id v22 = v9;
    v32 = v22;
    uint64_t v23 = v21;
    v33 = v23;
    v35 = &v36;
    id v34 = v8;
    -[BMSyncDatabase disableStatementCachingForBlock:](v28, "disableStatementCachingForBlock:", v31);
    if (a5)
    {
      id v24 = (void *)v37[5];
      if (v24) {
        *a5 = v24;
      }
    }

    id v25 = -[NSMutableArray copy](v23, "copy", v28);

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(v50, 8);
  }

  else
  {
    uint64_t v26 = __biome_log_for_category(11LL);
    id v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR)) {
      sub_100041D08();
    }
    id v25 = &__NSArray0__struct;
  }

  return v25;
}

- (void)atomRowsInTimestampClockVector:(id)a3 forLocation:(id)a4 inStream:(id)a5 enumerateWithBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v30 = a6;
  v31 = v10;
  __int128 v29 = v12;
  if ([v10 timestampCount])
  {
    __int128 v28 = self;
    char v13 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    -[NSMutableArray addObject:](v13, "addObject:", @"CKAtom.stream = ? ");
    -[NSMutableArray addObject:](v13, "addObject:", v12);
    if (v11)
    {
      -[NSMutableArray addObject:](v13, "addObject:", @" AND CKAtom.location_id = ? ");
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v11 primaryKey]));
      -[NSMutableArray addObject:](v13, "addObject:", v14);
    }

    v45[0] = 0LL;
    v45[1] = v45;
    v45[2] = 0x2020000000LL;
    v45[3] = 0LL;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 allSiteIdentifiers]);
    id v16 = [v15 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v42;
      char v18 = 1;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v42 != v17) {
            objc_enumerationMutation(v15);
          }
          unsigned __int8 v20 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
          id v21 = objc_alloc(&OBJC_CLASS___NSString);
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
          uint64_t v23 = -[NSString initWithData:encoding:](v21, "initWithData:encoding:", v22, 4LL);

          if ((v18 & 1) != 0) {
            id v24 = CFSTR(" AND ((CKAtom.site = ? ");
          }
          else {
            id v24 = @" OR (CKAtom.site = ? ");
          }
          -[NSMutableArray addObject:](v13, "addObject:", v24);
          -[NSMutableArray addObject:](v13, "addObject:", v23);
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v31 clockValuesForSiteIdentifier:v20]);
          v39[0] = 0LL;
          v39[1] = v39;
          v39[2] = 0x2020000000LL;
          char v40 = 1;
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472LL;
          void v35[2] = sub_10001EB98;
          v35[3] = &unk_1000692C8;
          v37 = v45;
          uint64_t v38 = v39;
          uint64_t v36 = v13;
          [v25 enumerateRangesUsingBlock:v35];

          _Block_object_dispose(v39, 8);
          char v18 = 0;
        }

        id v16 = [v15 countByEnumeratingWithState:&v41 objects:v46 count:16];
        char v18 = 0;
      }

      while (v16);
    }

    -[NSMutableArray addObject:](v13, "addObject:", @") AND on_disk IS ?"));
    -[NSMutableArray addObject:](v13, "addObject:", &__kCFBooleanTrue);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10001ED4C;
    v32[3] = &unk_100068DC8;
    v32[4] = v28;
    uint64_t v26 = v13;
    v33 = v26;
    id v34 = v30;
    -[BMSyncDatabase disableStatementCachingForBlock:](v28, "disableStatementCachingForBlock:", v32);

    _Block_object_dispose(v45, 8);
  }

  else
  {
    uint64_t v27 = __biome_log_for_category(11LL);
    uint64_t v26 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR)) {
      sub_100041D08();
    }
  }
}

- (id)computeHighestLocationToDeleteUpToBookmark:(id)a3 forSiteIdentifier:(id)a4 inStream:(id)a5 offsetsIncrease:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  id v12 = @" AND segment_offset < ? OR NULL) == 0");
  if (v6) {
    id v12 = @" AND segment_offset > ? OR NULL) == 0");
  }
  char v13 = v12;
  fmdb = self->_fmdb;
  v28[0] = @"CKAtom.stream = ?";
  v28[1] = v11;
  uint64_t v26 = v10;
  v28[2] = @" AND CKAtom.site = ?";
  v28[3] = v10;
  id v15 = a3;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 4LL));
  v27[0] = CFSTR("COUNT ((CAST(segment_name AS INT) > ?");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 segmentName]);
  char v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v17 longLongValue]));
  v27[1] = v18;
  v27[2] = @" OR segment_name = ?";
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 segmentName]);
  v27[3] = v19;
  v27[4] = v13;
  id v20 = [v15 offset];

  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v20));
  v27[5] = v21;
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 6LL));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:HAVING:ORDER_BY:LIMIT:]( fmdb,  "SELECT_FROM:COLUMNS:JOIN:WHERE:GROUP_BY:HAVING:ORDER_BY:LIMIT:",  @"CKAtom",  &off_10006EAB0,  &off_10006EAC8,  v16,  &off_10006EAE0,  v22,  &off_10006EAF8,  &off_10006EED0));

  if ([v23 next]) {
    id v24 = -[BMSyncCRDTLocationRow initWithFMResultSet:modifier:]( objc_alloc(&OBJC_CLASS___BMSyncCRDTLocationRow),  "initWithFMResultSet:modifier:",  v23,  1LL);
  }
  else {
    id v24 = 0LL;
  }
  [v23 close];

  return v24;
}

- (id)highestLocationWithBufferedAtomsOlderThan:(double)a3 forSiteIdentifier:(id)a4 inStream:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15[0] = @"CKAtom.stream = ?";
  v15[1] = v9;
  v15[2] = @" AND CKAtom.site = ?";
  v15[3] = v8;
  v15[4] = @" AND on_disk IS NOT ?";
  void v15[5] = &__kCFBooleanTrue;
  v15[6] = @" AND location.day <= ?";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  v15[7] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 8LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:]( self,  "SELECT_ATOMS_WHERE:ORDER_BY:LIMIT:",  v11,  &off_10006EB10,  &off_10006EED0));

  if ([v12 next]) {
    char v13 = -[BMSyncCRDTLocationRow initWithFMResultSet:modifier:]( objc_alloc(&OBJC_CLASS___BMSyncCRDTLocationRow),  "initWithFMResultSet:modifier:",  v12,  1LL);
  }
  else {
    char v13 = 0LL;
  }
  [v12 close];

  return v13;
}

- (id)SELECT_ATOMS_WHERE:(id)a3 ORDER_BY:(id)a4 LIMIT:(id)a5
{
  return -[_bmFMDatabase SELECT_FROM:COLUMNS:JOIN:WHERE:ORDER_BY:LIMIT:]( self->_fmdb,  "SELECT_FROM:COLUMNS:JOIN:WHERE:ORDER_BY:LIMIT:",  @"CKAtom",  &off_10006EB28,  &off_10006EB40,  a3,  a4,  a5);
}

- (NSUUID)sharedSyncGeneration
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase valueForMetadataKey:](self, "valueForMetadataKey:", @"SharedSyncGeneration"));
  if (v3
    && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSData, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    && [v3 length] == (id)16)
  {
    [v3 getBytes:v7 length:16];
    int v5 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v7);
  }

  else
  {
    int v5 = 0LL;
  }

  return v5;
}

- (void)setSharedSyncGeneration:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v5, 16LL));
  -[BMSyncDatabase setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, @"SharedSyncGeneration");
}

- (NSDate)lastRapportSyncAttemptDate
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase valueForMetadataKey:](self, "valueForMetadataKey:", @"LastSyncAttemptDate"));
  v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return (NSDate *)v4;
}

- (void)setLastRapportSyncAttemptDate:(id)a3
{
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  id v5 = (id)v4;
  -[BMSyncDatabase setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, @"LastSyncAttemptDate");
}

- (NSDate)lastRapportSyncDate
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase valueForMetadataKey:](self, "valueForMetadataKey:", @"LastSyncDate"));
  v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return (NSDate *)v4;
}

- (void)setLastRapportSyncDate:(id)a3
{
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  id v5 = (id)v4;
  -[BMSyncDatabase setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, @"LastSyncDate");
}

- (NSDate)lastCloudKitSyncAttemptDate
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase valueForMetadataKey:](self, "valueForMetadataKey:", @"LastCloudKitAttemptDate"));
  v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return (NSDate *)v4;
}

- (void)setLastCloudKitSyncAttemptDate:(id)a3
{
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  id v5 = (id)v4;
  -[BMSyncDatabase setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, @"LastCloudKitAttemptDate");
}

- (NSDate)lastCloudKitSyncDate
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase valueForMetadataKey:](self, "valueForMetadataKey:", @"LastCloudKitSyncDate"));
  v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return (NSDate *)v4;
}

- (void)setLastCloudKitSyncDate:(id)a3
{
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  id v5 = (id)v4;
  -[BMSyncDatabase setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, @"LastCloudKitSyncDate");
}

- (id)ckSyncEngineMetaData
{
  return -[BMSyncDatabase valueForMetadataKey:](self, "valueForMetadataKey:", @"com.apple.biome.sync.ckMetaData");
}

- (void)saveCKSyncEngineMetaData:(id)a3
{
}

- (void)clearCKSyncEngineMetaData
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  -[BMSyncDatabase setValue:forMetadataKey:]( self,  "setValue:forMetadataKey:",  v3,  @"com.apple.biome.sync.ckMetaData");
}

- (NSString)mergeableRecordValueKey
{
  return (NSString *)-[BMSyncDatabase valueForMetadataKey:]( self,  "valueForMetadataKey:",  @"MergeableRecordValueKey");
}

- (void)setMergeableRecordValueKey:(id)a3
{
}

- (BOOL)saveCKMergeableRecordValueRecordName:(id)a3 zoneName:(id)a4 mergeableRecordValueData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v15[0] = @"stream_name";
  v15[1] = @"record_name";
  v16[0] = v9;
  v16[1] = v8;
  v15[2] = @"server_mergeable_value";
  v16[2] = v10;
  char v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  3LL));
  LOBYTE(fmdb) = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", @"CKMergeableRecordValue", v13);

  return (char)fmdb;
}

- (BOOL)clearCKMergeableRecordValueServerMergeableValuesForRecordName:(id)a3 zoneName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v12[0] = @"stream_name = ?";
  v12[1] = v7;
  void v12[2] = @" AND record_name = ?";
  v12[3] = v6;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 4LL));
  LOBYTE(fmdb) = -[_bmFMDatabase DELETE_FROM:WHERE:](fmdb, "DELETE_FROM:WHERE:", @"CKMergeableRecordValue", v10);

  return (char)fmdb;
}

- (BOOL)clearCKMergeableRecordValueServerMergeableValuesForZoneName:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v9[0] = @"stream_name = ?";
  v9[1] = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));
  LOBYTE(fmdb) = -[_bmFMDatabase DELETE_FROM:WHERE:](fmdb, "DELETE_FROM:WHERE:", @"CKMergeableRecordValue", v7);

  return (char)fmdb;
}

- (void)enumerateMergeableRecordValuesForRecordName:(id)a3 zoneName:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, _BYTE *))a5;
  fmdb = self->_fmdb;
  v17[0] = @"stream_name = ?";
  v17[1] = v9;
  v17[2] = @" AND record_name = ?";
  v17[3] = v8;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 4LL));
  char v13 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:ORDER_BY:LIMIT:",  @"CKMergeableRecordValue",  &off_10006EB58,  v12,  &off_10006EB70,  0LL));

  char v16 = 0;
  do
  {
    uint64_t v14 = objc_autoreleasePoolPush();
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 dataForColumn:@"server_mergeable_value"]);
    v10[2](v10, v15, &v16);

    objc_autoreleasePoolPop(v14);
  }

  while (!v16);
}

- (BOOL)getLatestTombstoneBookmarkForSiteIdentifier:(id)a3 inStream:(id)a4 segmentName:(id *)a5 segmentOffset:(unint64_t *)a6
{
  fmdb = self->_fmdb;
  v16[0] = @"stream = ?";
  v16[1] = a4;
  v16[2] = @"AND site = ?";
  void v16[3] = a3;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 4LL));
  char v13 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"TombstoneBookmark",  &off_10006EB88,  v12));

  unsigned int v14 = [v13 next];
  if (v14)
  {
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue([v13 stringForColumn:@"segment_name"]);
    }
    if (a6) {
      *a6 = (unint64_t)[v13 longForColumn:@"segment_offset"];
    }
  }

  return v14;
}

- (BOOL)saveLatestTombstoneBookmark:(id)a3 forSiteIdentifier:(id)a4 inStream:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    unsigned int v11 = -[BMSyncDatabase getLatestTombstoneBookmarkForSiteIdentifier:inStream:segmentName:segmentOffset:]( self,  "getLatestTombstoneBookmarkForSiteIdentifier:inStream:segmentName:segmentOffset:",  v9,  v10,  0LL,  0LL);
    fmdb = self->_fmdb;
    if (v11)
    {
      v22[0] = @"segment_name";
      char v13 = (void *)objc_claimAutoreleasedReturnValue([v8 segmentName]);
      v23[0] = v13;
      v22[1] = @"segment_offset";
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( NSNumber,  "numberWithUnsignedLong:",  [v8 offset]));
      v23[1] = v14;
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  2LL));
      v21[0] = @"stream = ?";
      v21[1] = v10;
      void v21[2] = @" AND site = ?";
      v21[3] = v9;
      char v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 4LL));
      unsigned __int8 v17 = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", @"TombstoneBookmark", v15, v16);
    }

    else
    {
      v19[0] = @"stream";
      v19[1] = @"site";
      v20[0] = v10;
      v20[1] = v9;
      v19[2] = @"segment_name";
      char v13 = (void *)objc_claimAutoreleasedReturnValue([v8 segmentName]);
      void v20[2] = v13;
      v19[3] = @"segment_offset";
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( NSNumber,  "numberWithUnsignedLong:",  [v8 offset]));
      v20[3] = v14;
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  4LL));
      unsigned __int8 v17 = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", @"TombstoneBookmark", v15);
    }
  }

  else
  {
    unsigned __int8 v17 = 1;
  }

  return v17;
}

+ (id)createPrimaryDatabaseWithQueue:(id)a3
{
  id v3 = a3;
  id v4 = -[BMSyncDatabase initWithQueue:](objc_alloc(&OBJC_CLASS___BMSyncDatabase), "initWithQueue:", v3);

  -[BMSyncDatabase setName:](v4, "setName:", @"primary");
  -[BMSyncDatabase setCorruptionHandler:](v4, "setCorruptionHandler:", &stru_100069568);
  return v4;
}

+ (id)createDatabaseForAccount:(id)a3 queue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[BMPaths pathForSharedSyncWithAccount:domain:]( &OBJC_CLASS___BMPaths,  "pathForSharedSyncWithAccount:domain:",  v5,  0LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:@"sync.db"]);

  id v9 = -[BMSyncDatabase initWithPath:options:queue:]( objc_alloc(&OBJC_CLASS___BMSyncDatabase),  "initWithPath:options:queue:",  v8,  0LL,  v6);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  id v11 = [v10 length];
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  char v13 = v12;
  if ((unint64_t)v11 > 7)
  {
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v12 substringToIndex:8]);
    -[BMSyncDatabase setName:](v9, "setName:", v14);
  }

  else
  {
    -[BMSyncDatabase setName:](v9, "setName:", v12);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100024490;
  v17[3] = &unk_100068B70;
  id v18 = v5;
  id v15 = v5;
  -[BMSyncDatabase setCorruptionHandler:](v9, "setCorruptionHandler:", v17);

  return v9;
}

+ (void)enumerateAccountSpecificDatabasesWithBlock:(id)a3
{
  id v5 = (void (**)(id, void *, void *))a3;
  if (!v5)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v18 handleFailureInMethod:a2, a1, @"BMSyncDatabase+Creation.m", 73, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }

  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(current_queue);
  id v8 = objc_alloc(&OBJC_CLASS___BMAccountManager);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v19 = [v8 initWithUseCase:BMUseCaseNotApplicable];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v19 accounts]);
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        unsigned int v14 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[BMSyncDatabase createDatabaseForAccount:queue:]( &OBJC_CLASS___BMSyncDatabase,  "createDatabaseForAccount:queue:",  v14,  v7));
        if ([v15 open])
        {
          v5[2](v5, v15, v14);
          [v15 close];
        }

        else
        {
          uint64_t v16 = __biome_log_for_category(11LL);
          unsigned __int8 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_1000421D8(v24, v14, &v25, v17);
          }
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }

    while (v11);
  }
}

- (id)ckRecordsToSyncToCloudKitForZone:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", &off_10006EBB8);
  if (v4)
  {
    v15[0] = @" AND stream_identifier = ?";
    v15[1] = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
    -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v6);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( self->_fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"CKRecord",  &off_10006EBD0,  v5));
  id v8 = 0LL;
  if ([v7 next])
  {
    do
    {
      if (!v8) {
        id v8 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
      }
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 stringForColumnIndex:0]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 stringForColumnIndex:1]);
      id v11 = -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  v10,  CKCurrentUserDefaultName);
      uint64_t v12 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  v9,  v11);
      -[NSMutableSet addObject:](v8, "addObject:", v12);
    }

    while (([v7 next] & 1) != 0);
  }

  char v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v8, "allObjects"));

  return v13;
}

- (id)recordFromSystemFieldsData:(id)a3
{
  id v3 = a3;
  id v11 = 0LL;
  id v4 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v3,  &v11);

  id v5 = v11;
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0LL;
  }
  if (v6)
  {
    uint64_t v7 = __biome_log_for_category(11LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100043290();
    }

    id v9 = 0LL;
  }

  else
  {
    id v9 = -[CKRecord initWithCoder:](objc_alloc(&OBJC_CLASS___CKRecord), "initWithCoder:", v4);
  }

  return v9;
}

- (id)createCKRecordFromRecordID:(id)a3 newRecord:(BOOL *)a4 recordType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase getSystemFieldsDataForRecordName:zoneName:recordType:]( self,  "getSystemFieldsDataForRecordName:zoneName:recordType:",  v9,  v11,  a5));

  if (v12)
  {
    char v13 = (CKRecord *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase recordFromSystemFieldsData:](self, "recordFromSystemFieldsData:", v12));
    if (v13) {
      goto LABEL_12;
    }
    uint64_t v14 = __biome_log_for_category(11LL);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_100043354();
    }
  }

  uint64_t v16 = objc_alloc(&OBJC_CLASS___CKRecord);
  unsigned __int8 v17 = sub_100024A18(a5);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  char v13 = -[CKRecord initWithRecordType:recordID:](v16, "initWithRecordType:recordID:", v18, v8);

  if (v13)
  {
    if (a4) {
      *a4 = 1;
    }
  }

  else
  {
    uint64_t v19 = __biome_log_for_category(11LL);
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      sub_1000432F0();
    }

    char v13 = 0LL;
  }

- (void)saveSystemFieldsDataForRecord:(id)a3 syncToCloudKit:(id)a4 recordType:(unint64_t)a5 crdtDeleted:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 recordID]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 recordName]);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 recordID]);
  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneName]);

  unsigned __int8 v19 = -[BMSyncDatabase ckRecordExists:zoneName:recordType:](self, "ckRecordExists:zoneName:recordType:", v15, v18, a5);
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v10 recordChangeTag]);

  if (!v20)
  {
    if ((v19 & 1) == 0)
    {
      fmdb = self->_fmdb;
      v41[0] = @"record_metadata";
      goto LABEL_20;
    }

    __int128 v22 = 0LL;
LABEL_9:
    id v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v10 recordChangeTag]);

    if (v25)
    {
      if (!v22)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v37, @"record_metadata");

        if (!v11) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }

      -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v22, @"record_metadata");
    }

    if (!v11)
    {
LABEL_14:
      if (v12) {
        -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v12, @"deleted_crdt");
      }
      if (!-[NSMutableDictionary count](v24, "count"))
      {

        goto LABEL_34;
      }

      uint64_t v26 = self->_fmdb;
      v43[0] = @"record_name = ?";
      v43[1] = v15;
      v43[2] = @" AND stream_identifier = ?";
      v43[3] = v18;
      v43[4] = @" AND record_type = ?";
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
      v43[5] = v27;
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v43, 6LL));
      LOBYTE(v26) = -[_bmFMDatabase UPDATE:SET:WHERE:](v26, "UPDATE:SET:WHERE:", @"CKRecord", v24, v28);

      goto LABEL_30;
    }

- (id)getSystemFieldsDataForRecordName:(id)a3 zoneName:(id)a4 recordType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v17[0] = @"record_name = ?";
  v17[1] = v8;
  v17[2] = @" AND record_type = ?";
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  v17[3] = v12;
  void v17[4] = @" AND stream_identifier = ?";
  v17[5] = v9;
  char v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 6LL));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"CKRecord",  &off_10006EBE8,  v13));

  else {
    id v15 = 0LL;
  }

  return v15;
}

- (BOOL)resetCKRecordsMetaDataAndSetToSyncForZone:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v14[0] = @"record_metadata";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v15[0] = v7;
  v14[1] = @"local_mergeable_value";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v14[2] = @"sync_to_cloud_kit";
  v15[1] = v8;
  void v15[2] = &__kCFBooleanTrue;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  3LL));
  v13[0] = @"stream_identifier = ?";
  v13[1] = v4;
  void v13[2] = @" AND record_type = ?";
  v13[3] = &off_10006EF00;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 4LL));
  LOBYTE(fmdb) = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", @"CKRecord", v9, v10);

  unsigned __int8 v11 = -[BMSyncDatabase clearCKMergeableRecordValueServerMergeableValuesForZoneName:]( self,  "clearCKMergeableRecordValueServerMergeableValuesForZoneName:",  v4);
  return fmdb & v11;
}

- (void)resetMetadataForRecord:(id)a3 zoneName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v17[0] = @"record_metadata";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v17[1] = @"local_mergeable_value";
  v18[0] = v10;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v18[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));
  v16[0] = @"record_name = ?";
  v16[1] = v6;
  v16[2] = @" AND stream_identifier = ?";
  void v16[3] = v7;
  char v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 4LL));
  LOBYTE(fmdb) = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", @"CKRecord", v12, v13);

  if ((fmdb & 1) == 0)
  {
    uint64_t v14 = __biome_log_for_category(11LL);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100043424();
    }
  }
}

- (BOOL)saveCKRecordServerMergeableValue:(id)a3 recordName:(id)a4 zoneName:(id)a5 locationRow:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  BOOL v15 = 1;
  if (!-[BMSyncDatabase ckRecordExists:zoneName:recordType:]( self,  "ckRecordExists:zoneName:recordType:",  v11,  v12,  1LL))
  {
    fmdb = self->_fmdb;
    v22[0] = @"location_id";
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v13 primaryKey]));
    v23[0] = v17;
    v23[1] = &__kCFBooleanFalse;
    v22[1] = @"sync_to_cloud_kit";
    void v22[2] = @"deleting";
    void v23[2] = &__kCFBooleanFalse;
    v23[3] = v11;
    v22[3] = @"record_name";
    void v22[4] = @"stream_identifier";
    v22[5] = @"record_type";
    void v23[4] = v12;
    v23[5] = &off_10006EF00;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  6LL));
    LOBYTE(fmdb) = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", @"CKRecord", v18);

    if ((fmdb & 1) == 0)
    {
      uint64_t v20 = __biome_log_for_category(11LL);
      __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        sub_100043484();
      }

      BOOL v15 = 0;
      if (v10) {
        goto LABEL_7;
      }
      goto LABEL_8;
    }

    BOOL v15 = 1;
  }

  if (v10) {
LABEL_7:
  }
    BOOL v15 = -[BMSyncDatabase saveCKMergeableRecordValueRecordName:zoneName:mergeableRecordValueData:]( self,  "saveCKMergeableRecordValueRecordName:zoneName:mergeableRecordValueData:",  v11,  v12,  v10);
LABEL_8:

  return v15;
}

- (BOOL)saveCKRecordHighestDeletedLocationRow:(id)a3 recordName:(id)a4 zoneName:(id)a5 recordExists:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  if (v6)
  {
    __int128 v23 = @"location_id";
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v10 primaryKey]));
    id v24 = v15;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    v22[0] = @"record_name = ?";
    v22[1] = v11;
    void v22[2] = @" AND stream_identifier = ?";
    v22[3] = v12;
    void v22[4] = @" AND record_type = ?";
    v22[5] = &off_10006EF18;
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 6LL));
    unsigned __int8 v18 = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", @"CKRecord", v16, v17);
  }

  else
  {
    v20[0] = @"location_id";
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v10 primaryKey]));
    v21[0] = v15;
    v21[1] = &__kCFBooleanFalse;
    v20[1] = @"sync_to_cloud_kit";
    void v20[2] = @"deleting";
    void v21[2] = &__kCFBooleanFalse;
    v21[3] = v11;
    v20[3] = @"record_name";
    void v20[4] = @"stream_identifier";
    v20[5] = @"record_type";
    void v21[4] = v12;
    v21[5] = &off_10006EF18;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  6LL));
    unsigned __int8 v18 = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", @"CKRecord", v16);
  }

  return v18;
}

- (BOOL)saveCKRecordLocalMergeableValue:(id)a3 recordName:(id)a4 zoneName:(id)a5 locationRow:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  unsigned int v15 = -[BMSyncDatabase ckRecordExists:zoneName:recordType:]( self,  "ckRecordExists:zoneName:recordType:",  v11,  v12,  1LL);
  fmdb = self->_fmdb;
  if (!v15)
  {
    v24[0] = @"location_id";
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v13 primaryKey]));
    v25[0] = v17;
    v25[1] = &__kCFBooleanFalse;
    v24[1] = @"sync_to_cloud_kit";
    void v24[2] = @"deleting";
    v25[2] = &__kCFBooleanFalse;
    v25[3] = v11;
    v24[3] = @"record_name";
    uint8_t v24[4] = @"stream_identifier";
    void v25[4] = v12;
    v25[5] = &off_10006EF00;
    __int128 v21 = v10;
    v24[5] = @"record_type";
    v24[6] = @"local_mergeable_value";
    if (!v10) {
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    v25[6] = v21;
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  7LL));
    unsigned __int8 v20 = -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", @"CKRecord", v22);

    if (!v10) {
    goto LABEL_12;
    }
  }

  uint64_t v27 = @"local_mergeable_value";
  unsigned __int8 v17 = v10;
  if (!v10) {
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  __int128 v28 = v17;
  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
  v26[0] = @"record_name = ?";
  v26[1] = v11;
  v26[2] = @" AND stream_identifier = ?";
  v26[3] = v12;
  void v26[4] = @" AND record_type = ?";
  v26[5] = &off_10006EF00;
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 6LL));
  unsigned __int8 v20 = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", @"CKRecord", v18, v19);

  if (!v10) {
LABEL_12:
  }

  return v20;
}

- (BOOL)clearCKRecordLocalMergeableValueAndSetToSyncForZone:(id)a3
{
  id v4 = a3;
  uint64_t v5 = __biome_log_for_category(11LL);
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "clearCKRecordLocalMergeableValueAndSetToSyncForZone %@",  buf,  0xCu);
  }

  fmdb = self->_fmdb;
  v14[0] = @"local_mergeable_value";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v14[1] = @"sync_to_cloud_kit";
  v15[0] = v8;
  v15[1] = &__kCFBooleanTrue;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
  v13[0] = @"stream_identifier = ?";
  v13[1] = v4;
  void v13[2] = @" AND record_type = ?";
  v13[3] = &off_10006EF00;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 4LL));
  LOBYTE(fmdb) = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", @"CKRecord", v9, v10);

  unsigned __int8 v11 = -[BMSyncDatabase clearCKMergeableRecordValueServerMergeableValuesForZoneName:]( self,  "clearCKMergeableRecordValueServerMergeableValuesForZoneName:",  v4);
  return fmdb & v11;
}

- (id)ckRecordForRecordName:(id)a3 zoneName:(id)a4 recordType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v17[0] = @"record_name = ?";
  v17[1] = v8;
  void v17[2] = @" AND record_type = ?";
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  v17[3] = v12;
  void v17[4] = @" AND stream_identifier = ?";
  v17[5] = v9;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 6LL));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"CKRecord",  &off_10006EC00,  v13));

  else {
    unsigned int v15 = 0LL;
  }

  return v15;
}

- (BOOL)ckRecordExists:(id)a3 zoneName:(id)a4 recordType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v16[0] = @"record_name = ?";
  v16[1] = v8;
  v16[2] = @" AND record_type = ?";
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  void v16[3] = v12;
  void v16[4] = @" AND stream_identifier = ?";
  v16[5] = v9;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 6LL));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"CKRecord",  &off_10006EC18,  v13));

  LOBYTE(v12) = [v14 next];
  return (char)v12;
}

- (void)updateAllCKRecordsAtOrBeforeLocationToBeDeletedOnSync:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v14[0] = @"record_type = ?";
  v14[1] = &off_10006EF00;
  void v14[2] = CFSTR(" AND location_id IN(    SELECT id FROM CRDTLocation WHERE site = ?");
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 siteIdentifier]);
  void v14[3] = v7;
  v14[4] = @"     AND stream = ?";
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 streamName]);
  v14[5] = v8;
  v14[6] = @"     AND day <= ?");
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 day]);
  [v9 timeIntervalSinceReferenceDate];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v14[7] = v10;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 8LL));
  LOBYTE(fmdb) = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", @"CKRecord", &off_10006F0C0, v11);

  if ((fmdb & 1) == 0)
  {
    uint64_t v12 = __biome_log_for_category(11LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000434E4();
    }
  }
}

- (void)markCKRecordsAtOrBeforeLocationToBeDeletedOnSync:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  id v17 = @"location_id";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  unsigned __int8 v18 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
  v16[0] = @"record_type = ?";
  v16[1] = &off_10006EF00;
  v16[2] = CFSTR(" AND location_id IN(    SELECT id FROM CRDTLocation WHERE site = ?");
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 siteIdentifier]);
  void v16[3] = v9;
  void v16[4] = @"     AND stream = ?";
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 streamName]);
  v16[5] = v10;
  void v16[6] = @"     AND day <= ?");
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 day]);
  [v11 timeIntervalSinceReferenceDate];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v16[7] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 8LL));
  LOBYTE(fmdb) = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", @"CKRecord", v8, v13);

  if ((fmdb & 1) == 0)
  {
    uint64_t v14 = __biome_log_for_category(11LL);
    unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000434E4();
    }
  }
}

- (void)enumerateRecordsWithBlock:(id)a3
{
  id v4 = (void (**)(id, BMSyncCKRecord *, _BYTE *))a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:JOIN:WHERE:ORDER_BY:LIMIT:]( self->_fmdb,  "SELECT_FROM:COLUMNS:JOIN:WHERE:ORDER_BY:LIMIT:",  @"CKRecord",  &off_10006EC30,  &off_10006EC48,  &off_10006EC60,  &off_10006EC78,  0LL));
  char v9 = 0;
  do
  {
    id v7 = objc_autoreleasePoolPush();
    id v8 = -[BMSyncCKRecord initWithFMResultSet:](objc_alloc(&OBJC_CLASS___BMSyncCKRecord), "initWithFMResultSet:", v6);
    v4[2](v4, v8, &v9);

    objc_autoreleasePoolPop(v7);
  }

  while (!v9);
}

- (void)deleteCKRecordsAtOrBeforeLocation:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v14[0] = @"record_type = ?";
  v14[1] = &off_10006EF00;
  void v14[2] = CFSTR(" AND location_id IN(    SELECT id FROM CRDTLocation WHERE site = ?");
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 siteIdentifier]);
  void v14[3] = v7;
  v14[4] = @"     AND stream = ?";
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 streamName]);
  v14[5] = v8;
  v14[6] = @"     AND day <= ?");
  char v9 = (void *)objc_claimAutoreleasedReturnValue([v4 day]);
  [v9 timeIntervalSinceReferenceDate];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v14[7] = v10;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 8LL));
  LOBYTE(fmdb) = -[_bmFMDatabase DELETE_FROM:WHERE:](fmdb, "DELETE_FROM:WHERE:", @"CKRecord", v11);

  if ((fmdb & 1) == 0)
  {
    uint64_t v12 = __biome_log_for_category(11LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100043544();
    }
  }
}

- (void)deleteCKRecordsForStreamName:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v10[0] = @"stream_identifier = ?";
  v10[1] = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
  LOBYTE(fmdb) = -[_bmFMDatabase DELETE_FROM:WHERE:](fmdb, "DELETE_FROM:WHERE:", @"CKRecord", v7);

  if ((fmdb & 1) == 0)
  {
    uint64_t v8 = __biome_log_for_category(11LL);
    char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000435A4();
    }
  }
}

- (void)deleteCKRecordAtLocation:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 recordName]);
  fmdb = self->_fmdb;
  v12[0] = @"record_name = ?";
  v12[1] = v6;
  void v12[2] = @" AND record_type = ?";
  v12[3] = &off_10006EF00;
  void v12[4] = @" AND stream_identifier = ?";
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 streamName]);
  v12[5] = v8;
  char v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 6LL));
  LOBYTE(fmdb) = -[_bmFMDatabase DELETE_FROM:WHERE:](fmdb, "DELETE_FROM:WHERE:", @"CKRecord", v9);

  if ((fmdb & 1) == 0)
  {
    uint64_t v10 = __biome_log_for_category(11LL);
    unsigned __int8 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100043604();
    }
  }
}

- (void)enumerateCKSyncRecordRecordsSetForDeletingUsingBlock:(id)a3
{
  id v4 = (void (**)(id, CKRecordID *, _BYTE *))a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( self->_fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"CKRecord",  &off_10006EC90,  &off_10006ECA8));
  char v13 = 0;
  do
  {
    id v7 = objc_autoreleasePoolPush();
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringForColumn:@"stream_identifier"]);
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 stringForColumn:@"record_name"]);
    uint64_t v10 = (void *)v9;
    if (v8 && v9)
    {
      unsigned __int8 v11 = -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  v8,  CKCurrentUserDefaultName);
      uint64_t v12 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  v10,  v11);
      v4[2](v4, v12, &v13);
    }

    objc_autoreleasePoolPop(v7);
  }

  while (!v13);
}

- (id)gatherAllCKSyncRecordRecordsToBeDeleted
{
  uint64_t v5 = 0LL;
  BOOL v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  uint64_t v8 = sub_100031AC8;
  uint64_t v9 = sub_100031AD8;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100031AE0;
  v4[3] = &unk_1000698B0;
  v4[4] = &v5;
  -[BMSyncDatabase enumerateCKSyncRecordRecordsSetForDeletingUsingBlock:]( self,  "enumerateCKSyncRecordRecordsSetForDeletingUsingBlock:",  v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)deleteAllCKRecordsInZone:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v11[0] = @"stream_identifier = ?";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneName]);
  v11[1] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  LOBYTE(fmdb) = -[_bmFMDatabase DELETE_FROM:WHERE:](fmdb, "DELETE_FROM:WHERE:", @"CKRecord", v8);

  if ((fmdb & 1) == 0)
  {
    uint64_t v9 = __biome_log_for_category(11LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100043664(v4, v10);
    }
  }
}

- (unint64_t)ckRecordCountForRecordType:(unint64_t)a3
{
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v12[0] = @"record_type = ?";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  v12[1] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"CKRecord",  &off_10006ECC0,  v8));

  else {
    id v10 = 0LL;
  }

  return (unint64_t)v10;
}

- (BOOL)upsertCKRecordWithLocation:(id)a3 inStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_fmdb = (id *)&self->_fmdb;
  id v9 = *p_fmdb;
  v27[0] = @"location_id = ?";
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 primaryKey]));
  v27[1] = v10;
  v27[2] = @" AND record_type = ?";
  v27[3] = &off_10006EF00;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 4LL));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "SELECT_FROM:COLUMNS:WHERE:", @"CKRecord", &off_10006ECD8, v11));

  unsigned int v13 = [v12 next];
  id v14 = *p_fmdb;
  if (v13)
  {
    v26[0] = @"location_id =?";
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 primaryKey]));
    v26[1] = v15;
    v26[2] = @" AND record_type = ?";
    v26[3] = &off_10006EF00;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 4LL));
    unsigned __int8 v17 = [v14 UPDATE:@"CKRecord" SET:&off_10006F0E8 WHERE:v16];
  }

  else
  {
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(v6, "primaryKey", @"location_id")));
    v25[0] = v15;
    v25[1] = &__kCFBooleanTrue;
    v24[1] = @"sync_to_cloud_kit";
    void v24[2] = @"deleting";
    v25[2] = &__kCFBooleanFalse;
    v24[3] = @"record_name";
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 location]);
    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v16 recordName]);
    v25[3] = v18;
    void v25[4] = v7;
    uint8_t v24[4] = @"stream_identifier";
    v24[5] = @"record_type";
    v25[5] = &off_10006EF00;
    unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  6LL));
    unsigned __int8 v17 = objc_msgSend(v14, "INSERT_INTO:VALUES:", @"CKRecord", v19);
  }

  if ((v17 & 1) != 0)
  {
    BOOL v20 = 1;
  }

  else
  {
    uint64_t v21 = __biome_log_for_category(11LL);
    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      sub_1000436EC(p_fmdb, v22);
    }

    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)disableAllCKSyncRecordsForSite:(id)a3 stream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v19[0] = &__kCFBooleanTrue;
  v18[0] = @"sync_to_cloud_kit";
  v18[1] = @"local_mergeable_value";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v19[1] = v10;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  2LL));
  v17[0] = CFSTR("location_id IN (SELECT id FROM CRDTLocation WHERE site = ?");
  v17[1] = v6;
  void v17[2] = @" AND stream = ?");
  v17[3] = v7;
  void v17[4] = @" AND deleted_crdt = ?";
  v17[5] = &__kCFBooleanFalse;
  void v17[6] = @" AND record_type = ?";
  v17[7] = &off_10006EF00;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 8LL));
  unsigned __int8 v13 = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", @"CKRecord", v11, v12);

  if ((v13 & 1) == 0)
  {
    uint64_t v14 = __biome_log_for_category(11LL);
    unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100043770();
    }
  }

  return v13;
}

- (BOOL)enableAllCKSyncRecordsPreviouslyDisabledForSite:(id)a3 stream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  fmdb = self->_fmdb;
  v15[0] = CFSTR("location_id IN (SELECT id FROM CRDTLocation WHERE site = ?");
  v15[1] = v6;
  void v15[2] = @" AND stream = ?");
  void v15[3] = v7;
  v15[4] = @" AND record_type = ?";
  void v15[5] = &off_10006EF00;
  v15[6] = @" AND deleted_crdt = ?";
  v15[7] = &__kCFBooleanTrue;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 8LL));
  unsigned __int8 v11 = -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", @"CKRecord", &off_10006F110, v10);

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = __biome_log_for_category(11LL);
    unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100043770();
    }
  }

  return v11;
}

+ (id)primaryDatabasePath
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[BMPaths syncDirectory](&OBJC_CLASS___BMPaths, "syncDirectory"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"sync.db"]);

  return v3;
}

+ (id)primaryDatabaseWALPath
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([a1 primaryDatabasePath]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingString:@"-wal"]);

  return v3;
}

- (BMSyncDatabase)initWithQueue:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "primaryDatabasePath");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = -[BMSyncDatabase initWithPath:options:queue:](self, "initWithPath:options:queue:", v7, 0LL, v4);

  return v8;
}

- (BMSyncDatabase)initWithPath:(id)a3
{
  return -[BMSyncDatabase initWithPath:options:queue:](self, "initWithPath:options:queue:", a3, 0LL, 0LL);
}

- (BMSyncDatabase)initWithPath:(id)a3 queue:(id)a4
{
  return -[BMSyncDatabase initWithPath:options:queue:](self, "initWithPath:options:queue:", a3, 0LL, a4);
}

- (BMSyncDatabase)initWithPath:(id)a3 options:(unint64_t)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = (dispatch_queue_s *)a5;
  unsigned __int8 v11 = v10;
  if (v9)
  {
    if (!v10) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v18 handleFailureInMethod:a2, self, @"BMSyncDatabase.m", 304, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];

  if (v11) {
LABEL_3:
  }
    dispatch_assert_queue_V2(v11);
LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___BMSyncDatabase;
  uint64_t v12 = -[BMSyncDatabase init](&v19, "init");
  unsigned __int8 v13 = v12;
  if (v12)
  {
    v12->__internal_state_ivar = 0LL;
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[_bmFMDatabase databaseWithPath:](&OBJC_CLASS____bmFMDatabase, "databaseWithPath:", v9));
    fmdb = v13->_fmdb;
    v13->_fmdb = (_bmFMDatabase *)v14;

    -[_bmFMDatabase setShouldCacheStatements:](v13->_fmdb, "setShouldCacheStatements:", 1LL);
    v13->_options = a4;
    objc_storeStrong((id *)&v13->_queue, a5);
    loggingSuffix = v13->_loggingSuffix;
    v13->_loggingSuffix = (NSString *)&stru_100069BD0;
  }

  return v13;
}

- (void)setName:(id)a3
{
  id v7 = a3;
  if ((-[NSString isEqual:](self->_name, "isEqual:") & 1) == 0)
  {
    if (v7)
    {
      uint64_t v5 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"[%@]", v7);
      loggingSuffix = self->_loggingSuffix;
      self->_loggingSuffix = v5;
    }

    else
    {
      loggingSuffix = self->_loggingSuffix;
      self->_loggingSuffix = (NSString *)&stru_100069BD0;
    }

    objc_storeStrong((id *)&self->_name, a3);
  }
}

- (void)setState:(unint64_t)a3 error:(id)a4
{
  id v7 = a4;
  objc_storeStrong((id *)&self->__error_ivar, a4);
  self->__internal_state_ivar = a3;
  uint64_t v8 = __biome_log_for_category(11LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    loggingSuffix = self->_loggingSuffix;
    if (a3 > 9) {
      unsigned __int8 v11 = @"Unknown";
    }
    else {
      unsigned __int8 v11 = off_100069978[a3];
    }
    int v17 = 138412546;
    unsigned __int8 v18 = loggingSuffix;
    __int16 v19 = 2112;
    BOOL v20 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "BMSyncDatabase%@ transitioned to state: %@",  (uint8_t *)&v17,  0x16u);
  }

  if (a3 == 7)
  {
    uint64_t v14 = __biome_log_for_category(11LL);
    unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    BOOL v15 = os_log_type_enabled(v13, OS_LOG_TYPE_FAULT);
    if (v7)
    {
      if (v15) {
        sub_100043924();
      }
    }

    else if (v15)
    {
      sub_1000438C0();
    }

    goto LABEL_18;
  }

  if (a3 == 9)
  {
    uint64_t v12 = __biome_log_for_category(11LL);
    unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_100043840();
    }
LABEL_18:

    goto LABEL_19;
  }

  if (v7)
  {
    uint64_t v16 = __biome_log_for_category(11LL);
    unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000437D0();
    }
    goto LABEL_18;
  }

- (void)setState:(unint64_t)a3 errorFormat:(id)a4
{
  id v6 = a4;
  if ([v6 length]) {
    id v7 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v6, &v8);
  }
  else {
    id v7 = 0LL;
  }
  -[BMSyncDatabase setState:error:](self, "setState:error:", a3, v7);
}

- (BOOL)_tryOpen:(unint64_t)a3
{
  unint64_t v7 = a3 + 1;
  if (v7 >= 0xA)
  {
    -[BMSyncDatabase setState:error:](self, "setState:error:", 9LL, @"recursion max");
    return 0;
  }

  BOOL v6 = 1;
  switch(-[BMSyncDatabase internalState](self, "internalState"))
  {
    case 0uLL:
    case 1uLL:
    case 5uLL:
      uint64_t v8 = &stru_100069BD0;
      id v9 = self;
      uint64_t v10 = 3LL;
      goto LABEL_97;
    case 2uLL:
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase databasePath](self->_fmdb, "databasePath"));
      id v12 = (id)objc_claimAutoreleasedReturnValue([v11 stringByDeletingLastPathComponent]);

      unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v89 = 0LL;
      unsigned int v14 = [v13 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v89];
      id v15 = v89;

      if (v14 && !v15) {
        goto LABEL_11;
      }
      v59 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedFailureReason]);
      -[BMSyncDatabase setState:errorFormat:]( self,  "setState:errorFormat:",  9LL,  @"failed to create path at: %@, reason: %@",  v12,  v59);

      goto LABEL_61;
    case 3uLL:
      if ((self->_flags & 1) != 0) {
        unsigned int v16 = 6;
      }
      else {
        unsigned int v16 = 2;
      }
      if ((self->_options & 1) != 0) {
        uint64_t v17 = v16 | 0x600000;
      }
      else {
        uint64_t v17 = v16;
      }
      unsigned __int8 v18 = -[_bmFMDatabase openWithFlags:](self->_fmdb, "openWithFlags:", v17);
      fmdb = self->_fmdb;
      if ((v18 & 1) == 0)
      {
        int v61 = -[_bmFMDatabase lastErrorCode](fmdb, "lastErrorCode");
        if (v61 > 13)
        {
          if (v61 == 14)
          {
            v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
            v71 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase databasePath](self->_fmdb, "databasePath"));
            unsigned __int8 v72 = [v70 fileExistsAtPath:v71];

            if ((v72 & 1) == 0)
            {
              uint64_t v8 = &stru_100069BD0;
              id v9 = self;
              uint64_t v10 = 2LL;
              goto LABEL_97;
            }

            goto LABEL_85;
          }

          if (v61 != 23)
          {
LABEL_85:
            int v73 = sqlite3_system_errno((sqlite3 *)-[_bmFMDatabase sqliteHandle](self->_fmdb, "sqliteHandle"));
            if (v73) {
              v74 = strerror(v73);
            }
            else {
              v74 = (void *)sqlite3_errstr(-[_bmFMDatabase lastErrorCode](self->_fmdb, "lastErrorCode"));
            }
            v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v74));
            -[BMSyncDatabase setState:error:](self, "setState:error:", 9LL, v64);
            goto LABEL_94;
          }

          if ((self->_options & 1) == 0)
          {
            uint64_t v8 = &stru_100069BD0;
            id v9 = self;
            uint64_t v10 = 6LL;
            goto LABEL_97;
          }
        }

        else
        {
          if (v61 == 5)
          {
            uint64_t v8 = &stru_100069BD0;
            id v9 = self;
            uint64_t v10 = 5LL;
            goto LABEL_97;
          }

          if (v61 != 11) {
            goto LABEL_85;
          }
        }

        uint64_t v8 = &stru_100069BD0;
        goto LABEL_78;
      }

      if (!-[_bmFMDatabase executeStatements:]( fmdb,  "executeStatements:",  @"PRAGMA journal_mode = WAL;PRAGMA foreign_keys = ON;"))
      {
        uint64_t v63 = __biome_log_for_category(11LL);
        v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
          sub_100043984(v64);
        }
LABEL_94:

        goto LABEL_95;
      }

      if (!-[_bmFMDatabase tableExists:](self->_fmdb, "tableExists:", @"Metadata"))
      {
        self->_flags = 1LL;
        -[_bmFMDatabase beginTransaction](self->_fmdb, "beginTransaction");
        v67 = self->_fmdb;
        CFStringRef v68 = sub_1000348C0();
        v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
        -[_bmFMDatabase executeStatements:](v67, "executeStatements:", v69);

        -[_bmFMDatabase setUserVersion:](self->_fmdb, "setUserVersion:", 31LL);
        if (-[_bmFMDatabase commit](self->_fmdb, "commit"))
        {
LABEL_80:
          uint64_t v8 = &stru_100069BD0;
          id v9 = self;
          uint64_t v10 = 4LL;
          goto LABEL_97;
        }

- (BOOL)open
{
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  return -[BMSyncDatabase _tryOpen:](self, "_tryOpen:", 0LL);
}

- (unint64_t)state
{
  switch(-[BMSyncDatabase internalState](self, "internalState"))
  {
    case 2uLL:
    case 3uLL:
    case 5uLL:
    case 7uLL:
    case 8uLL:
      uint64_t v2 = __biome_log_for_category(11LL);
      id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
        sub_1000439C4();
      }

      goto LABEL_5;
    case 4uLL:
      unint64_t result = 1LL;
      break;
    case 6uLL:
      unint64_t result = 2LL;
      break;
    case 9uLL:
      unint64_t result = 3LL;
      break;
    default:
LABEL_5:
      unint64_t result = 0LL;
      break;
  }

  return result;
}

- (void)close
{
  p_fmdb = &self->_fmdb;
  if (-[_bmFMDatabase isOpen](self->_fmdb, "isOpen") && !-[_bmFMDatabase close](*p_fmdb, "close"))
  {
    uint64_t v4 = __biome_log_for_category(11LL);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100043A28((uint64_t)self, (id *)p_fmdb, v5);
    }
  }

- (BOOL)beginTransaction
{
  return -[_bmFMDatabase beginDeferredTransaction](self->_fmdb, "beginDeferredTransaction");
}

- (BOOL)isInTransaction
{
  return -[_bmFMDatabase isInTransaction](self->_fmdb, "isInTransaction");
}

- (BOOL)commit
{
  return -[_bmFMDatabase commit](self->_fmdb, "commit");
}

- (BOOL)rollback
{
  return -[_bmFMDatabase rollback](self->_fmdb, "rollback");
}

- (void)clearCachedStatements
{
  uint64_t v3 = __biome_log_for_category(11LL);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    loggingSuffix = self->_loggingSuffix;
    int v6 = 138412290;
    unint64_t v7 = loggingSuffix;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "BMSyncDatabase%@ clearing cached statements",  (uint8_t *)&v6,  0xCu);
  }

  -[_bmFMDatabase clearCachedStatements](self->_fmdb, "clearCachedStatements");
}

- (void)disableStatementCachingForBlock:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  -[_bmFMDatabase setShouldCacheStatementsWithoutClearingExistingStatements:]( self->_fmdb,  "setShouldCacheStatementsWithoutClearingExistingStatements:",  0LL);
  v4[2]();
  -[_bmFMDatabase setShouldCacheStatementsWithoutClearingExistingStatements:]( self->_fmdb,  "setShouldCacheStatementsWithoutClearingExistingStatements:",  1LL);
}

- (id)valueForMetadataKey:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase executeQuery:]( self->_fmdb,  "executeQuery:",  @"SELECT value FROM Metadata WHERE key=?",  a3));
  else {
    uint64_t v4 = 0LL;
  }

  return v4;
}

- (void)setValue:(id)a3 forMetadataKey:(id)a4
{
}

- (unsigned)version
{
  return -[_bmFMDatabase userVersion](self->_fmdb, "userVersion");
}

- (BOOL)migration_StarSkySchema11ToSydRoSchema12
{
  unsigned int v21 = -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", @"PRAGMA foreign_keys=OFF");
  unsigned int v20 = -[_bmFMDatabase beginTransaction](self->_fmdb, "beginTransaction");
  uint64_t v3 = -[NSMutableSet initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithArray:", &off_10006EE10);
  uint64_t v4 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase executeQuery:]( self->_fmdb,  "executeQuery:",  @"SELECT type, name FROM sqlite_schema WHERE tbl_name = 'CRDTLocation'"));
  if ([v5 next])
  {
    do
    {
      int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringForColumn:@"type"]);
      unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 stringForColumn:@"name"]);
      if (![v6 isEqualToString:@"table"]
        || ([v7 isEqualToString:@"CRDTLocation"] & 1) == 0)
      {
        -[NSMutableSet addObject:](v4, "addObject:", v7);
      }
    }

    while (([v5 next] & 1) != 0);
  }

  if (-[NSMutableSet isEqualToSet:](v3, "isEqualToSet:", v4))
  {
    unsigned int v8 = -[_bmFMDatabase executeStatements:]( self->_fmdb,  "executeStatements:",  @"CREATE TABLE new_CRDTLocation (id INTEGER primary key, stream STRING NOT NULL, site STRING NOT NULL, day INTEGER NOT NULL, state INTEGER NOT NULL)");
    unsigned int v9 = v21 & v20 & v8 & -[_bmFMDatabase executeStatements:]( self->_fmdb,  "executeStatements:",  @"INSERT INTO new_CRDTLocation SELECT * FROM CRDTLocation");
    unsigned int v10 = -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", @"DROP TABLE CRDTLocation");
    unsigned int v11 = v10 & -[_bmFMDatabase executeStatements:]( self->_fmdb,  "executeStatements:",  @"ALTER TABLE new_CRDTLocation RENAME TO CRDTLocation");
    unsigned int v12 = v9 & v11 & -[_bmFMDatabase executeStatements:]( self->_fmdb,  "executeStatements:",  @"CREATE INDEX IF NOT EXISTS idx_crdt_location ON CRDTLocation(stream, site, day)");
    unsigned int v13 = -[_bmFMDatabase executeStatements:]( self->_fmdb,  "executeStatements:",  @"CREATE INDEX IF NOT EXISTS idx_crdt_location_state ON CRDTLocation(stream, site, state, day DESC)");
    unsigned int v14 = v13 & -[_bmFMDatabase executeStatements:]( self->_fmdb,  "executeStatements:",  @"CREATE TABLE IF NOT EXISTS CKRecord (location_id INTEGER, sync_to_cloud_kit BOOL, record_metadata BLOB, record_name STRING, stream_identifier STRING, mergeable_value_delta BLOB, deleting BOOL, FOREIGN KEY (location_id) REFERENCES CRDTLocation(id));");
    unsigned int v15 = v12 & v14 & -[_bmFMDatabase executeStatements:]( self->_fmdb,  "executeStatements:",  @"CREATE INDEX IF NOT EXISTS idx_ckrecord ON CKRecord(record_name)");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self->_fmdb, "executeQuery:", @"PRAGMA foreign_key_check"));
    unsigned int v17 = v15 & ~[(id)v16 next];

    -[_bmFMDatabase setUserVersion:](self->_fmdb, "setUserVersion:", 12LL);
    LODWORD(v16) = -[_bmFMDatabase commit](self->_fmdb, "commit");
    BOOL v18 = v17 & v16 & -[_bmFMDatabase executeStatements:]( self->_fmdb,  "executeStatements:",  @"PRAGMA foreign_keys=ON");
  }

  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (BOOL)migration_Schema20ToSchema21
{
  unsigned __int8 v3 = -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", @"PRAGMA foreign_keys=OFF");
  char v4 = v3 & -[_bmFMDatabase beginTransaction](self->_fmdb, "beginTransaction");
  unsigned __int8 v5 = -[_bmFMDatabase executeStatements:]( self->_fmdb,  "executeStatements:",  @"CREATE TABLE new_CKRecord (location_id INTEGER, sync_to_cloud_kit BOOL, record_metadata BLOB, record_name STRING, stream_identifier STRING, local_mergeable_value BLOB, deleting BOOL,  PRIMARY KEY (stream_identifier, record_name), FOREIGN KEY (location_id) REFERENCES CRDTLocation(id));");
  char v6 = v4 & v5 & -[_bmFMDatabase executeStatements:]( self->_fmdb,  "executeStatements:",  @"INSERT INTO new_CKRecord SELECT location_id, sync_to_cloud_kit, record_metadata, record_name, stream_identifier, local_mergeable_value, deleting FROM CKRecord");
  unsigned __int8 v7 = -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", @"DROP TABLE CKRecord");
  char v8 = v7 & -[_bmFMDatabase executeStatements:]( self->_fmdb,  "executeStatements:",  @"ALTER TABLE new_CKRecord RENAME TO CKRecord");
  char v9 = v6 & v8 & -[_bmFMDatabase executeStatements:]( self->_fmdb,  "executeStatements:",  @"CREATE INDEX IF NOT EXISTS idx_ckrecord ON CKRecord(record_name)");
  char v10 = v9 & -[_bmFMDatabase executeStatements:]( self->_fmdb,  "executeStatements:",  @"CREATE TABLE IF NOT EXISTS CKMergeableRecordValue (stream_name STRING, record_name STRING, server_mergeable_value BLOB, FOREIGN KEY (stream_name, record_name) REFERENCES CKRecord(stream_identifier, record_name))");
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self->_fmdb, "executeQuery:", @"PRAGMA foreign_key_check"));
  char v12 = v10 & ~[(id)v11 next];

  -[_bmFMDatabase setUserVersion:](self->_fmdb, "setUserVersion:", 21LL);
  LOBYTE(v11) = -[_bmFMDatabase commit](self->_fmdb, "commit");
  return v12 & v11 & -[_bmFMDatabase executeStatements:]( self->_fmdb,  "executeStatements:",  @"PRAGMA foreign_keys=ON");
}

- (BOOL)migration_Schema27ToSchema28
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase databasePath](self->_fmdb, "databasePath"));
  char v4 = (void *)objc_claimAutoreleasedReturnValue(+[BMStoreDirectory sharedSync](&OBJC_CLASS___BMStoreDirectory, "sharedSync"));
  unsigned int v5 = [v3 containsString:v4];

  if (!v5) {
    goto LABEL_19;
  }
  uint64_t v6 = __biome_log_for_category(11LL);
  unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    loggingSuffix = self->_loggingSuffix;
    int v38 = 138412290;
    uint64_t v39 = loggingSuffix;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "BMSyncDatabase%@ Deleting all rows in SyncSessionLog",  (uint8_t *)&v38,  0xCu);
  }

  unsigned int v9 = -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", @"DELETE FROM SyncSessionLog");
  uint64_t v10 = __biome_log_for_category(11LL);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    char v12 = self->_loggingSuffix;
    int v38 = 138412290;
    uint64_t v39 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "BMSyncDatabase%@ Deleting all rows in SyncMessageLog",  (uint8_t *)&v38,  0xCu);
  }

  unsigned int v13 = v9 & -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", @"DELETE FROM SyncMessageLog");
  uint64_t v14 = __biome_log_for_category(11LL);
  unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = self->_loggingSuffix;
    int v38 = 138412290;
    uint64_t v39 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "BMSyncDatabase%@ Dropping idx_atommergedlog_session_id",  (uint8_t *)&v38,  0xCu);
  }

  unsigned int v17 = v13 & -[_bmFMDatabase executeStatements:]( self->_fmdb,  "executeStatements:",  @"DROP INDEX idx_atommergedlog_session_id");
  uint64_t v18 = __biome_log_for_category(11LL);
  __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    unsigned int v20 = self->_loggingSuffix;
    int v38 = 138412290;
    uint64_t v39 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "BMSyncDatabase%@ Dropping idx_atommergedlog_owning_site_identifier",  (uint8_t *)&v38,  0xCu);
  }

  unsigned int v21 = v17 & -[_bmFMDatabase executeStatements:]( self->_fmdb,  "executeStatements:",  @"DROP INDEX idx_atommergedlog_owning_site_identifier");
  uint64_t v22 = __biome_log_for_category(11LL);
  unint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    id v24 = self->_loggingSuffix;
    int v38 = 138412290;
    uint64_t v39 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "BMSyncDatabase%@ Dropping AtomMergedLog",  (uint8_t *)&v38,  0xCu);
  }

  unsigned int v25 = -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", @"DROP TABLE AtomMergedLog");
  unsigned int v26 = v21 & v25 & -[_bmFMDatabase executeStatements:]( self->_fmdb,  "executeStatements:",  @"PRAGMA auto_vacuum = 2");
  uint64_t v27 = __biome_log_for_category(11LL);
  __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    __int128 v29 = self->_loggingSuffix;
    int v38 = 138412290;
    uint64_t v39 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "BMSyncDatabase%@ Vacuuming",  (uint8_t *)&v38,  0xCu);
  }

  unsigned int v30 = v26 & -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", @"VACUUM");
  uint64_t v31 = __biome_log_for_category(11LL);
  id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    v33 = self->_loggingSuffix;
    int v38 = 138412290;
    uint64_t v39 = v33;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "BMSyncDatabase%@ Recreating AtomMergedLog",  (uint8_t *)&v38,  0xCu);
  }

  unsigned int v34 = v30 & -[_bmFMDatabase executeStatements:]( self->_fmdb,  "executeStatements:",  @"CREATE TABLE AtomMergedLog (session_id BLOB, message_id INTEGER, stream STRING, merge_result INTEGER, owning_site_identifier STRING, relayed_by_site_identifier STRING, synced_at INTEGER, event_created_at INTEGER);");
  unsigned int v35 = -[_bmFMDatabase executeStatements:]( self->_fmdb,  "executeStatements:",  @"CREATE INDEX idx_atommergedlog_session_id ON AtomMergedLog(session_id);");
  unsigned int v36 = -[_bmFMDatabase executeStatements:]( self->_fmdb,  "executeStatements:",  @"CREATE INDEX idx_atommergedlog_owning_site_identifier ON AtomMergedLog(owning_site_identifier);");
  BOOL result = 0;
  if (v34 == 1 && v35 && v36)
  {
LABEL_19:
    -[_bmFMDatabase setUserVersion:](self->_fmdb, "setUserVersion:", 28LL);
    return 1;
  }

  return result;
}

- (NSString)error
{
  return self->__error_ivar;
}

- (unint64_t)internalState
{
  return self->__internal_state_ivar;
}

- (id)corruptionHandler
{
  return self->_corruptionHandler;
}

- (void)setCorruptionHandler:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

- (void)recordSessionStart:(id)a3 transport:(unint64_t)a4 reason:(unint64_t)a5 isReciprocal:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  uint64_t v12 = __biome_log_for_category(11LL);
  unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "recordSessionStart: %@", buf, 0xCu);
  }

  double Current = CFAbsoluteTimeGetCurrent();
  fmdb = self->_fmdb;
  v22[0] = v10;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a4,  @"session_id",  @"transport"));
  v22[1] = v16;
  void v21[2] = @"reason";
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  void v22[2] = v17;
  v21[3] = @"is_reciprocal";
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
  v22[3] = v18;
  void v21[4] = @"start_timestamp";
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", Current));
  void v22[4] = v19;
  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  5LL));
  -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", @"SyncSessionLog", v20);
}

- (void)recordSessionEnd:(id)a3 timeSincePreviousSync:(double)a4
{
  id v6 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  uint64_t v8 = __biome_log_for_category(11LL);
  unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "recordSessionEnd: %@", buf, 0xCu);
  }

  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  fmdb = self->_fmdb;
  v17[0] = @"end_timestamp";
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", Current));
  v17[1] = @"time_since_previous_sync";
  v18[0] = v12;
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4));
  v18[1] = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));
  v16[0] = @"session_id = ?";
  v16[1] = v6;
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
  -[_bmFMDatabase UPDATE:SET:WHERE:](fmdb, "UPDATE:SET:WHERE:", @"SyncSessionLog", v14, v15);
}

- (void)recordMessageToDeviceIdentifier:(id)a3 sessionID:(id)a4 messageID:(unint64_t)a5 reachable:(BOOL)a6 bytes:(unint64_t)a7 isReciprocal:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  uint64_t v17 = __biome_log_for_category(11LL);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v30 = v14;
    __int16 v31 = 2112;
    id v32 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "recordMessageToDeviceIdentifier: %@, %@",  buf,  0x16u);
  }

  double Current = CFAbsoluteTimeGetCurrent();
  fmdb = self->_fmdb;
  v28[0] = v15;
  unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a5,  @"session_id",  @"message_id"));
  v28[1] = v21;
  v28[2] = v14;
  v27[2] = @"device_identifier";
  v27[3] = @"reachable";
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10));
  v28[3] = v22;
  void v27[4] = @"atom_batch_bytes";
  unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a7));
  void v28[4] = v23;
  v27[5] = @"is_reciprocal";
  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
  v28[5] = v24;
  void v27[6] = @"timestamp";
  unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", Current));
  v28[6] = v25;
  unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  7LL));
  -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", @"SyncMessageLog", v26);
}

- (void)recordAtomMergeResult:(unint64_t)a3 inStream:(id)a4 sessionID:(id)a5 messageID:(unint64_t)a6 ownerSite:(id)a7 originatingSite:(id)a8 eventCreatedAt:(double)a9
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  uint64_t v21 = __biome_log_for_category(11LL);
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    sub_100043B90(a3, v22);
  }

  double Current = CFAbsoluteTimeGetCurrent();
  fmdb = self->_fmdb;
  v31[0] = v17;
  unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a6,  @"session_id",  @"message_id"));
  v31[1] = v25;
  v31[2] = v16;
  v30[2] = @"stream";
  v30[3] = @"owning_site_identifier";
  v31[3] = v18;
  v31[4] = v19;
  v30[4] = @"relayed_by_site_identifier";
  v30[5] = @"merge_result";
  unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  void v31[5] = v26;
  v30[6] = @"event_created_at";
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a9));
  v31[6] = v27;
  v30[7] = @"synced_at";
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", Current));
  v31[7] = v28;
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  8LL));
  -[_bmFMDatabase INSERT_INTO:VALUES:](fmdb, "INSERT_INTO:VALUES:", @"AtomMergedLog", v29);
}

- (unint64_t)countAtomMergeResultRecords
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase SELECT_FROM:COLUMNS:WHERE:]( self->_fmdb,  "SELECT_FROM:COLUMNS:WHERE:",  @"AtomMergedLog",  &off_10006EE28,  0LL));
  unint64_t v3 = 0LL;
  if ([v2 next])
  {
    do
      LODWORD(v3) = [v2 intForColumnIndex:0];
    while (([v2 next] & 1) != 0);
    unint64_t v3 = (int)v3;
  }

  return v3;
}

- (void)computeAggregatedSessionLogsWithHandlerBlock:(id)a3
{
  BOOL v8 = (void (**)(id, void *))a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase executeQuery:]( self->_fmdb,  "executeQuery:",  @"select transport as transport_type, session_duration.session_id, time_since_previous_sync, duration, reachable_peers_cnt, is_reciprocal, reason as sync_reason, cast((select count(*) from DevicePeer) as text) as known_peers_cnt_str, cast(reachable_peers_cnt as real) / (select count(*) from DevicePeer) as peer_availabilty_pct, avg_sync_latency, atoms_dropped_cnt, atoms_causality_violation_cnt, atoms_received_cnt, atoms_relayed_cnt, relay_earliness, relay_unseen_peer_atom_cnt, atom_batch_bytes from(select transport, session_id, is_reciprocal, reason, (end_timestamp - start_timestamp) as duration, time_since_previous_sync from SyncSessionLog group by session_id, is_reciprocal, reason) as session_duration left join(select session_id, count(distinct device_identifier) as reachable_peers_cnt from SyncMessageLog group by session_id) as reachable_peers on session_duration.session_id=reachable_peers.session_id left join(select session_id, avg(case when event_created_at <> 0 then synced_at - event_created_at else null end) as avg_sync_latency from AtomMergedLog group by session_id) as sync_latency on session_duration.session_id=sync_latency.session_id left join(select a.session_id, sum(case when a.merge_result=1 THEN 1 else 0 end) as atoms_dropped_cnt, sum(case when a.merge_result=2 THEN 1 else 0 end) as atoms_causality_violation_cnt, sum(case when a.merge_result=3 THEN 1 else 0 end) as atoms_received_cnt from AtomMergedLog as a group by a.session_id) as merge_results on session_duration.session_id=merge_results.session_id left join(select session_id, count(*) as atoms_relayed_cnt from AtomMergedLog as a where owning_site_identifier <> relayed_by_site_identifier and not exists(select * from SyncMessageLog as m where a.session_id=m.session_id and device_identifier=owning_site_identifier and reachable=1) group by session_id) as relay_count on session_duration.session_id=relay_count.session_id left join(select relayed.session_id, avg(timestamp - synced_at) as relay_earliness from(select atom.session_id, synced_at, timestamp from AtomMergedLog as atom, SyncMessageLog as message where owning_site_identifier <> relayed_by_site_identifier and not exists(select * from SyncMessageLog as m where atom.session_id=m.session_id and device_identifier=owning_site_identifier and reachable=1) and device_identifier=owning_site_identifier and reachable=1 and timestamp > synced_at order by timestamp asc limit 1) as relayed group by relayed.session_id) as earliness on session_duration.session_id=earliness.session_id left join(select session_id, count(*) as relay_unseen_peer_atom_cnt from AtomMergedLog as a where owning_site_identifier <> relayed_by_site_identifier and not exists(select * from SyncMessageLog as m where device_identifier=owning_site_identifier and reachable=1) group by session_id) as atom_relay_unseen_device on session_duration.session_id=atom_relay_unseen_device.session_id left join(select session_id, sum(atom_batch_bytes) as atom_batch_bytes from SyncMessageLog group by session_id) as batch_bytes on session_duration.session_id=batch_bytes.session_id;"));
  if ([v5 next])
  {
    do
    {
      id v6 = objc_autoreleasePoolPush();
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v5 resultDictionary]);
      v8[2](v8, v7);

      objc_autoreleasePoolPop(v6);
    }

    while (([v5 next] & 1) != 0);
  }

  [v5 close];
}

- (void)compactAndDeleteSessionLogs
{
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  -[_bmFMDatabase executeUpdate:]( self->_fmdb,  "executeUpdate:",  @"DELETE FROM SyncMessageLog WHERE timestamp <> (SELECT max(timestamp) FROM SyncMessageLog message WHERE device_identifier=message.device_identifier)");
  -[_bmFMDatabase executeUpdate:](self->_fmdb, "executeUpdate:", @"DELETE FROM SyncSessionLog");
  -[_bmFMDatabase executeUpdate:](self->_fmdb, "executeUpdate:", @"DELETE FROM AtomMergedLog");
}

- (void)enforceMaxSessionLogPrunePolicy
{
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  char v4 = objc_autoreleasePoolPush();
  -[_bmFMDatabase executeUpdate:]( self->_fmdb,  "executeUpdate:",  @"DELETE FROM SyncSessionLog WHERE session_id NOT IN (SELECT session_id from SyncSessionLog ORDER BY start_timestamp DESC LIMIT 100)");
  -[_bmFMDatabase executeUpdate:]( self->_fmdb,  "executeUpdate:",  @"DELETE FROM SyncMessageLog WHERE session_id NOT IN (SELECT session_id from SyncSessionLog)");
  -[_bmFMDatabase executeUpdate:]( self->_fmdb,  "executeUpdate:",  @"DELETE FROM AtomMergedLog WHERE session_id NOT IN (SELECT session_id from SyncSessionLog)");
  objc_autoreleasePoolPop(v4);
}

- (void)runVacuumingTask:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100037970;
  v6[3] = &unk_1000699D0;
  id v4 = a3;
  id v7 = v4;
  if (-[BMSyncDatabase vacuumWithShouldContinueBlock:](self, "vacuumWithShouldContinueBlock:", v6))
  {
    unsigned int v5 = objc_opt_new(&OBJC_CLASS___NSDate);
    -[BMSyncDatabase setDateOfLastVacuum:](self, "setDateOfLastVacuum:", v5);
  }

  +[BMCoreAnalyticsEvents sendSyncDatabaseSummaryWithDatabase:]( &OBJC_CLASS___BMCoreAnalyticsEvents,  "sendSyncDatabaseSummaryWithDatabase:",  self);
}

- (NSDate)dateOfLastVacuum
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase valueForMetadataKey:](self, "valueForMetadataKey:", @"LastVacuumDate"));
  unint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  }

  else
  {
    id v4 = 0LL;
  }

  return (NSDate *)v4;
}

- (void)setDateOfLastVacuum:(id)a3
{
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  id v5 = (id)v4;
  -[BMSyncDatabase setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, @"LastVacuumDate");
}

- (unint64_t)_numPagesToVacuum
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self->_fmdb, "executeQuery:", @"PRAGMA page_count"));
  id v33 = 0LL;
  unsigned __int8 v4 = [v3 nextWithError:&v33];
  id v5 = v33;
  if ((v4 & 1) != 0)
  {
    id v6 = [v3 unsignedLongLongIntForColumnIndex:0];
    [v3 close];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self->_fmdb, "executeQuery:", @"PRAGMA freelist_count"));
    id v32 = v5;
    unsigned __int8 v8 = [v7 nextWithError:&v32];
    id v9 = v32;

    if ((v8 & 1) != 0)
    {
      BOOL v10 = [v7 unsignedLongLongIntForColumnIndex:0];
      [v7 close];
      uint64_t v11 = __biome_log_for_category(11LL);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        unsigned int v35 = v6;
        __int16 v36 = 2048;
        v37 = v10;
        __int16 v38 = 2048;
        double v39 = (double)(unint64_t)(v6 - v10) / (double)(unint64_t)v6;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "vacuumWithShouldContinueBlock calculating pages to vacuum -- pageCount %tu freeCount %tu loadFactor %f",  buf,  0x20u);
      }

      if ((double)(unint64_t)(v6 - v10) / (double)(unint64_t)v6 <= 0.85 || (unint64_t)v10 > 0x3FF)
      {
        unint64_t v22 = (unint64_t)((double)(unint64_t)v10 * 0.8);
        goto LABEL_18;
      }

      uint64_t v13 = __biome_log_for_category(11LL);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        unsigned int v35 = v6;
        __int16 v36 = 2048;
        v37 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "vacuumWithShouldContinueBlock not enough pages to vacuum: pageCount: %lu; freeCount: %lu",
          buf,
          0x16u);
      }
    }

    else
    {
      uint64_t v23 = __biome_log_for_category(11LL);
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100043C24((uint64_t)v9, v24, v25, v26, v27, v28, v29, v30);
      }
    }

    unint64_t v22 = 0LL;
  }

  else
  {
    uint64_t v15 = __biome_log_for_category(11LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_100043C88((uint64_t)v5, (os_log_s *)v7, v16, v17, v18, v19, v20, v21);
    }
    unint64_t v22 = 0LL;
    id v9 = v5;
  }

- (BOOL)vacuumWithShouldContinueBlock:(id)a3
{
  unsigned __int8 v4 = (unsigned int (**)(void))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](self->_fmdb, "executeQuery:", @"PRAGMA auto_vacuum"));
  id v63 = 0LL;
  unsigned __int8 v6 = [v5 nextWithError:&v63];
  id v7 = v63;
  if ((v6 & 1) == 0)
  {
    uint64_t v23 = __biome_log_for_category(11LL);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100043D7C((uint64_t)v7, v24, v25, v26, v27, v28, v29, v30);
    }
    goto LABEL_25;
  }

  unsigned int v8 = [v5 intForColumnIndex:0];
  [v5 close];
  uint64_t v9 = __biome_log_for_category(11LL);
  BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v65) = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "vacuumWithShouldContinueBlock current vacuum mode is %u",  buf,  8u);
  }

  if (v4 && !v4[2](v4)) {
    goto LABEL_26;
  }
  if (v8 != 2)
  {
    unsigned __int8 v32 = -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", @"PRAGMA auto_vacuum = 2");
    uint64_t v33 = __biome_log_for_category(11LL);
    unsigned int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    unsigned int v35 = v34;
    if ((v32 & 1) == 0)
    {
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_100043D4C(v35, v39, v40, v41, v42, v43, v44, v45);
      }

      goto LABEL_26;
    }

    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "vacuumWithShouldContinueBlock successfully set auto_vacuum to INCREMENTAL",  buf,  2u);
    }

    unsigned __int8 v36 = -[_bmFMDatabase executeStatements:](self->_fmdb, "executeStatements:", @"VACUUM");
    uint64_t v37 = __biome_log_for_category(11LL);
    __int16 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    id v24 = v38;
    if ((v36 & 1) != 0)
    {
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "vacuumWithShouldContinueBlock successfully ran initial VACUUM",  buf,  2u);
      }

      BOOL v22 = 1;
      goto LABEL_27;
    }

    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_100043D1C(v24, v46, v47, v48, v49, v50, v51, v52);
    }
LABEL_25:

LABEL_26:
    BOOL v22 = 0;
    goto LABEL_27;
  }

  unint64_t v11 = -[BMSyncDatabase _numPagesToVacuum](self, "_numPagesToVacuum");
  uint64_t v12 = __biome_log_for_category(11LL);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v65 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "vacuumWithShouldContinueBlock calculated pages to vacuum: %lu",  buf,  0xCu);
  }

  id v62 = v7;

  unint64_t v14 = 0LL;
  if (v11)
  {
    while (1)
    {
      if (v11 - v14 >= 0x1F4) {
        uint64_t v15 = 500LL;
      }
      else {
        uint64_t v15 = v11 - v14;
      }
      uint64_t v16 = __biome_log_for_category(11LL);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        unint64_t v65 = v15;
        __int16 v66 = 2048;
        unint64_t v67 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "vacuumWithShouldContinueBlock starting incremental_vacuum of batch size: %lu, pagesVacuumed: %lu",  buf,  0x16u);
      }

      fmdb = self->_fmdb;
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PRAGMA incremental_vacuum(%lu)",  v15));
      LOBYTE(fmdb) = -[_bmFMDatabase executeStatements:](fmdb, "executeStatements:", v19);

      v14 += v15;
      if (v4 && !v4[2](v4)) {
        goto LABEL_22;
      }
      if (v14 >= v11) {
        goto LABEL_19;
      }
    }

    uint64_t v53 = __biome_log_for_category(11LL);
    v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
    id v7 = v62;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      sub_100043CEC(v54, v55, v56, v57, v58, v59, v60, v61);
    }

    BOOL v22 = v14 != 0;
  }

  else
  {
LABEL_19:
    uint64_t v20 = __biome_log_for_category(11LL);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "vacuumWithShouldContinueBlock successfully completed",  buf,  2u);
    }

LABEL_22:
    BOOL v22 = v14 != 0;
    id v7 = v62;
  }

- (unint64_t)databaseSizeInKilobytes
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase databasePath](self->_fmdb, "databasePath"));
  unint64_t v4 = -[BMSyncDatabase _sizeOfFileInKilobytes:](self, "_sizeOfFileInKilobytes:", v3);

  return v4;
}

- (unint64_t)walSizeInKilobytes
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase databasePath](self->_fmdb, "databasePath"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingString:@"-wal"]);
  unint64_t v5 = -[BMSyncDatabase _sizeOfFileInKilobytes:](self, "_sizeOfFileInKilobytes:", v4);

  return v5;
}

- (unint64_t)_sizeOfFileInKilobytes:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v16 = 0LL;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attributesOfItemAtPath:v4 error:&v16]);
  id v7 = v16;

  if (v6)
  {
    if (!v7)
    {
      unint64_t v11 = (unint64_t)[v6 fileSize] >> 10;
      goto LABEL_8;
    }

    uint64_t v8 = __biome_log_for_category(11LL);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = (objc_class *)objc_opt_class(self, v10);
      unint64_t v14 = NSStringFromClass(v13);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138412802;
      uint64_t v18 = v15;
      __int16 v19 = 2112;
      id v20 = v4;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%@ sizeOfFileInKilobytes error fetching attributes for filepath: %@, err: %@",  buf,  0x20u);
    }
  }

  unint64_t v11 = 0LL;
LABEL_8:

  return v11;
}

- (unint64_t)numRowsInTable:(id)a3
{
  id v4 = a3;
  fmdb = self->_fmdb;
  id v37 = v4;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v37, 1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase executeQuery:withArgumentsInArray:]( fmdb,  "executeQuery:withArgumentsInArray:",  @"SELECT name FROM sqlite_schema WHERE type='table' AND name=?",  v6));

  id v30 = 0LL;
  unsigned __int8 v8 = [v7 nextWithError:&v30];
  id v9 = v30;
  if ((v8 & 1) != 0)
  {
    [v7 close];
    uint64_t v10 = self->_fmdb;
    unint64_t v11 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"SELECT COUNT(*) FROM %@",  v4);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](v10, "executeQuery:", v11));

    id v29 = v9;
    unsigned int v13 = [v12 nextWithError:&v29];
    id v14 = v29;

    if (v13)
    {
      id v15 = [v12 unsignedLongLongIntForColumnIndex:0];
    }

    else
    {
      uint64_t v19 = __biome_log_for_category(11LL);
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = (objc_class *)objc_opt_class(self, v21);
        uint64_t v27 = NSStringFromClass(v26);
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        *(_DWORD *)buf = 138412802;
        unsigned __int8 v32 = v28;
        __int16 v33 = 2112;
        id v34 = v4;
        __int16 v35 = 2112;
        id v36 = v14;
        _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%@ numRowsInTable error querying pgsize for table: %@, err: %@",  buf,  0x20u);
      }

      id v15 = 0LL;
    }

    [v12 close];

    id v9 = v14;
  }

  else
  {
    uint64_t v16 = __biome_log_for_category(11LL);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = (objc_class *)objc_opt_class(self, v18);
      id v24 = NSStringFromClass(v23);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 138412802;
      unsigned __int8 v32 = v25;
      __int16 v33 = 2112;
      id v34 = v4;
      __int16 v35 = 2112;
      id v36 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%@ numRowsInTable table name: %@ does not exist, err: %@",  buf,  0x20u);
    }

    [v7 close];
    id v15 = 0LL;
  }

  return (unint64_t)v15;
}

- (unint64_t)sizeOfTableInKilobytes:(id)a3
{
  id v4 = a3;
  fmdb = self->_fmdb;
  id v25 = v4;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[_bmFMDatabase executeQuery:withArgumentsInArray:]( fmdb,  "executeQuery:withArgumentsInArray:",  @"SELECT SUM(pgsize) FROM dbstat WHERE name = ?",  v6));

  id v18 = 0LL;
  unsigned int v8 = [v7 nextWithError:&v18];
  id v9 = v18;
  if (v8)
  {
    unint64_t v10 = (unint64_t)[v7 unsignedLongLongIntForColumnIndex:0] >> 10;
  }

  else
  {
    uint64_t v11 = __biome_log_for_category(11LL);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v15 = (objc_class *)objc_opt_class(self, v13);
      uint64_t v16 = NSStringFromClass(v15);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      *(_DWORD *)buf = 138412802;
      id v20 = v17;
      __int16 v21 = 2112;
      id v22 = v4;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%@ sizeOfTable error querying pgsize for table: %@, err: %@",  buf,  0x20u);
    }

    unint64_t v10 = 0LL;
  }

  [v7 close];

  return v10;
}

- (BOOL)deleteAllSiteIdentifiersExcept:(id)a3
{
  id v4 = a3;
  p_fmdb = &self->_fmdb;
  unsigned int v6 = -[_bmFMDatabase executeStatements:](*p_fmdb, "executeStatements:", @"PRAGMA foreign_keys=OFF");
  unsigned int v7 = v6 & -[_bmFMDatabase beginTransaction](*p_fmdb, "beginTransaction");
  unsigned int v8 = -[_bmFMDatabase executeUpdate:](*p_fmdb, "executeUpdate:", @"DELETE FROM CRDTLocation WHERE site != ?", v4);
  unsigned int v9 = v7 & v8 & -[_bmFMDatabase executeUpdate:]( *p_fmdb,  "executeUpdate:",  @"DELETE FROM CKAtom WHERE site != ?",  v4);
  unsigned int v10 = v9 & -[_bmFMDatabase executeUpdate:]( *p_fmdb,  "executeUpdate:",  @"DELETE FROM TombstoneBookmark WHERE site != ?",  v4);
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[_bmFMDatabase executeQuery:](*p_fmdb, "executeQuery:", @"PRAGMA foreign_key_check"));
  unsigned int v12 = v10 & ~[(id)v11 next];

  LODWORD(v11) = -[_bmFMDatabase executeStatements:](*p_fmdb, "executeStatements:", @"PRAGMA foreign_keys=ON");
  BOOL v13 = v12 & v11 & -[_bmFMDatabase commit](*p_fmdb, "commit");
  if (!v13)
  {
    uint64_t v14 = __biome_log_for_category(11LL);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_100043DE0((uint64_t)v4, (id *)p_fmdb, v15);
    }
  }

  return v13;
}

@end