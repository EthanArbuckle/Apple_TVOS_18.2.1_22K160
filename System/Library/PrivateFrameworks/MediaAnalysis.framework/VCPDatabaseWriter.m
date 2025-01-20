@interface VCPDatabaseWriter
+ (double)_ageOutIntervalForChangeTokenType:(unint64_t)a3;
+ (id)assetTypePredicatesStringWithMediaType:(int64_t)a3 mediaSubtypes:(unint64_t)a4 imageOnlyAnalysis:(BOOL)a5;
+ (id)databaseForPhotoLibrary:(id)a3;
+ (id)databaseWithFilepath:(id)a3;
+ (id)initializationCommand:(int)a3;
- (BOOL)exists;
- (BOOL)hasOutstandingTransactions;
- (BOOL)isPrioritizedLocalIdentifier:(id)a3;
- (BOOL)keyExistsInKeyValueStore:(id)a3;
- (BOOL)shouldPropagateError:(int *)a3 finalAttempt:(BOOL)a4;
- (VCPDatabaseWriter)initWithFilepath:(id)a3;
- (VCPDatabaseWriter)initWithPhotoLibrary:(id)a3;
- (id)creationDate;
- (id)photoLibrary;
- (id)queryPrioritizedLocalIdentifiersWithMediaType:(int64_t)a3 mediaSubtypes:(unint64_t)a4 shouldNegateSubtypes:(BOOL)a5 limit:(unint64_t)a6;
- (int)_deleteAsset:(id)a3;
- (int)_deleteResult:(id)a3 forAssetId:(int64_t)a4;
- (int)_getBlacklistCountForLocalIdentifier:(id)a3 count:(int *)a4;
- (int)_getBlacklistExpiredCount:(id)a3 count:(int *)a4;
- (int)_queryPropertiesForAsset:(id)a3 assetId:(int64_t *)a4 analysis:(id *)a5;
- (int)_queryResultsForAssetId:(int64_t)a3 analysis:(id)a4;
- (int)_queryValue:(int64_t *)a3 forKey:(id)a4;
- (int)_removeAllProcessingStatusForTaskID:(unint64_t)a3;
- (int)_removeKey:(id)a3;
- (int)_removeProgressRecordsBeforeDate:(id)a3;
- (int)_removeProgressRecordsBeyondMaximum:(unint64_t)a3;
- (int)_removeSchedulingHistoryForStartTimeBefore:(id)a3;
- (int)_setValue:(int64_t)a3 forKey:(id)a4;
- (int)_storeAnalysis:(id)a3 forLocalIdentifier:(id)a4;
- (int)_storeProgressForActivityID:(unint64_t)a3 withAnalysisSubtype:(unint64_t)a4 version:(unint64_t)a5 processedAssetCount:(unint64_t)a6 totalAssetCount:(unint64_t)a7;
- (int)_storeProperties:(id)a3 forLocalIdentifier:(id)a4 assetId:(int64_t *)a5;
- (int)_storeResult:(id)a3 withKey:(id)a4 forAssetId:(int64_t)a5;
- (int)_storeSchedulingHistoryForActivityID:(unint64_t)a3 andStartTime:(id)a4;
- (int)_updateAnalysis:(id)a3 withAnalysis:(id)a4 forAsset:(id)a5 withAssetId:(int64_t)a6;
- (int)_updateAnalysisInfoOnAnalysisVersionChange;
- (int)_updateAnalysisInfoWithCurrentVersion:(int)a3 andTimestamp:(int64_t)a4 forTaskID:(unint64_t)a5;
- (int)_updateOperatingSystemVersion;
- (int)_updateProperties:(id)a3 forAssetId:(int64_t)a4;
- (int)addAssetToBlacklist:(id)a3;
- (int)ageOutBlacklistBefore:(id)a3 count:(int *)a4;
- (int)analysisForAsset:(id)a3 analysis:(id *)a4;
- (int)beginTransaction;
- (int)bumpAnalysisVersionForAsset:(id)a3;
- (int)cacheCurrentFaceProgress;
- (int)cacheProcessedAssetCountAfterPromoter:(unint64_t)a3;
- (int)clearPrioritizedAssets;
- (int)commit;
- (int)commitTransaction;
- (int)containsAsset:(id)a3 result:(BOOL *)a4;
- (int)decrementBlacklistCountForLocalIdentifier:(id)a3;
- (int)deleteAnalysisForAsset:(id)a3;
- (int)executeDatabaseBlock:(id)a3 fallbackBlock:(id)a4 write:(BOOL)a5;
- (int)fetchAllMomentsScheduledAssets:(id *)a3;
- (int)fetchEligibleToRetryLocalIdentifiers:(id *)a3 processingStatus:(unint64_t)a4 taskID:(unint64_t)a5 fetchLimit:(unint64_t)a6 additionalPredicates:(id)a7;
- (int)fetchEligibleToRetryLocalIdentifiers:(id *)a3 withProcessingStatus:(unint64_t)a4 andTaskID:(unint64_t)a5 andFetchLimit:(unint64_t)a6;
- (int)fetchLocalIdentifiers:(id *)a3 processingStatus:(unint64_t)a4 taskID:(unint64_t)a5 attempts:(int)a6 fetchLimit:(unint64_t)a7 additionalPredicates:(id)a8;
- (int)fetchLocalIdentifiers:(id *)a3 taskID:(unint64_t)a4 processingStatus:(unint64_t)a5 additionalPredicates:(id)a6;
- (int)fetchLocalIdentifiers:(id *)a3 taskID:(unint64_t)a4 processingStatus:(unint64_t)a5 errorCode:(int64_t)a6 sinceDate:(id)a7 additionalPredicates:(id)a8;
- (int)fetchLocalIdentifiers:(id *)a3 withProcessingStatus:(unint64_t)a4 andTaskID:(unint64_t)a5 andAttempts:(int)a6 andFetchLimit:(unint64_t)a7;
- (int)fetchLocalIdentifiers:(id *)a3 withTaskID:(unint64_t)a4 andProcessingStatus:(unint64_t)a5;
- (int)fetchLocalIdentifiers:(id *)a3 withTaskID:(unint64_t)a4 andProcessingStatus:(unint64_t)a5 errorCode:(int64_t)a6 sinceDate:(id)a7;
- (int)fetchLocalIdentifiersEligibleForRetry:(id *)a3 taskID:(unint64_t)a4 excludingStatuses:(id)a5 fetchLimit:(unint64_t)a6 additionalPredicates:(id)a7;
- (int)fetchLocalIdentifiersEligibleForRetry:(id *)a3 taskID:(unint64_t)a4 includingStatuses:(id)a5 fetchLimit:(unint64_t)a6 additionalPredicates:(id)a7;
- (int)fetchLocalIdentifiersEligibleForRetry:(id *)a3 withTaskID:(unint64_t)a4 andFetchLimit:(unint64_t)a5;
- (int)fetchLocalIdentifiersEligibleForRetry:(id *)a3 withTaskID:(unint64_t)a4 excludingStatuses:(id)a5 andFetchLimit:(unint64_t)a6;
- (int)fetchLocalIdentifiersEligibleForRetry:(id *)a3 withTaskID:(unint64_t)a4 includingStatuses:(id)a5 andFetchLimit:(unint64_t)a6;
- (int)fetchMomentsScheduledAssetEntries:(id *)a3 forTaskID:(unint64_t)a4;
- (int)fetchProcessingErrorCode:(unint64_t *)a3 errorLine:(unint64_t *)a4 taskID:(unint64_t)a5 localIndentifier:(id)a6;
- (int)fetchProcessingErrorCodeCounts:(id *)a3 withTaskID:(unint64_t)a4 sinceDate:(id)a5 additionalPredicates:(id)a6;
- (int)flushWAL;
- (int)getBlacklistCountForLocalIdentifier:(id)a3;
- (int)getBlacklistSizeForThreshold:(int)a3 size:(unint64_t *)a4;
- (int)getBlacklistedAssetsWithCount:(int)a3 localIdentifiers:(id *)a4;
- (int)getUserVersion:(int *)a3;
- (int)hardFailAllRunningProcessingStatusForTaskID:(unint64_t)a3;
- (int)hardFailAllRunningProcessingStatusForTaskID:(unint64_t)a3 additionalPredicates:(id)a4;
- (int)loadAllKeyValuePairs:(id)a3;
- (int)openDatabase;
- (int)parseHeader:(sqlite3_stmt *)a3 startColumn:(int)a4 analysis:(id)a5;
- (int)purgeExcessiveSchedulingRecordsForActivityID:(unint64_t)a3;
- (int)queryAnalysisResultWithType:(unint64_t)a3 forAsset:(id)a4 result:(id *)a5;
- (int)queryAnalysisResultsForAssets:(id)a3 results:(id *)a4;
- (int)queryAssetCountForTaskID:(unint64_t)a3;
- (int)queryAssetCountForTaskID:(unint64_t)a3 withStatus:(unint64_t)a4;
- (int)queryAssetCountForTaskID:(unint64_t)a3 withStatus:(unint64_t)a4 andAttempts:(int)a5;
- (int)queryAssetWithLocalIdentifier:(id)a3 forMediaAnalysisVersion:(id *)a4;
- (int)queryAttemptsForLocalIdentifier:(id)a3 andTaskID:(unint64_t)a4;
- (int)queryChangeToken:(id *)a3 forTaskID:(unint64_t)a4 andChangeTokenType:(unint64_t)a5;
- (int)queryHeadersForAssets:(id)a3 analyses:(id)a4;
- (int)queryProcessingStatus:(unint64_t *)a3 attempts:(int *)a4 lastAttemptDate:(id *)a5 andNextAttemptDate:(id *)a6 forLocalIdentifier:(id)a7 andTaskID:(unint64_t)a8;
- (int)querySchedulingHistoryRecords:(id *)a3 forActivityID:(unint64_t)a4 sinceDate:(id)a5;
- (int)removeAllChangeTokensForTaskID:(unint64_t)a3;
- (int)removeAllProcessingStatusForTaskID:(unint64_t)a3;
- (int)removeChangeTokenForTaskID:(unint64_t)a3 andChangeTokenType:(unint64_t)a4;
- (int)removeKey:(id)a3;
- (int)removeLocalIdentifierFromBlacklist:(id)a3;
- (int)removeMomentsScheduledAssetWithLocalIdentifier:(id)a3 andTaskID:(unint64_t)a4;
- (int)removePrioritizedLocalIdentifier:(id)a3;
- (int)removeProcessingStatusForLocalIdentifier:(id)a3 andTaskID:(unint64_t)a4;
- (int)removeProcessingStatusForTaskID:(unint64_t)a3 mediaType:(int64_t)a4 mediaSubtypes:(unint64_t)a5;
- (int)removeProgressEntriesBeyondLimits;
- (int)restoreAnalysis:(id)a3 forLocalIdentifier:(id)a4;
- (int)setAttempts:(unint64_t)a3 asset:(id)a4 taskID:(unint64_t)a5 status:(unint64_t)a6 lastAttemptDate:(id)a7;
- (int)setAttempts:(unint64_t)a3 asset:(id)a4 taskID:(unint64_t)a5 status:(unint64_t)a6 lastAttemptDate:(id)a7 mediaType:(int64_t)a8 mediaSubtypes:(unint64_t)a9;
- (int)setAttempts:(unint64_t)a3 asset:(id)a4 taskID:(unint64_t)a5 status:(unint64_t)a6 lastAttemptDate:(id)a7 mediaType:(int64_t)a8 mediaSubtypes:(unint64_t)a9 errorCode:(unint64_t)a10 errorLine:(unint64_t)a11;
- (int)setChangeToken:(id)a3 forTaskID:(unint64_t)a4 andChangeTokenType:(unint64_t)a5;
- (int)setDeletePendingFlag:(BOOL)a3 localIdentifier:(id)a4;
- (int)setMomentsScheduledAssetWithLocalIdentifier:(id)a3 andTaskID:(unint64_t)a4;
- (int)setPrioritizedLocalIdentifier:(id)a3 mediaType:(int64_t)a4 mediaSubtypes:(unint64_t)a5;
- (int)setValue:(int64_t)a3 forKey:(id)a4;
- (int)storeAnalysisForAsset:(id)a3 analysis:(id)a4;
- (int)storeProgressForActivityID:(unint64_t)a3 withAnalysisSubtype:(unint64_t)a4 version:(unint64_t)a5 processedAssetCount:(unint64_t)a6 totalAssetCount:(unint64_t)a7;
- (int)storeSchedulingHistoryForActivityID:(unint64_t)a3 andStartTime:(id)a4;
- (int)storeStatsFlags:(unint64_t)a3 forLocalIdentifier:(id)a4;
- (int)updateChangeToken:(id)a3 forTaskID:(unint64_t)a4 andChangeTokenType:(unint64_t)a5;
- (int)updateDateModifiedForAsset:(id)a3;
- (int)updateFingerprint:(id)a3 forAsset:(id)a4;
- (int)updateLocalIdentifer:(id)a3 to:(id)a4;
- (int)updateProcessingStatus:(unint64_t)a3 andNextAttemptDate:(id)a4 andErrorCode:(unint64_t)a5 andErrorLine:(unint64_t)a6 forLocalIdentifier:(id)a7 andTaskID:(unint64_t)a8;
- (int)updateProcessingStatus:(unint64_t)a3 andNextAttemptDate:(id)a4 forLocalIdentifier:(id)a5 andTaskID:(unint64_t)a6;
- (int)updateResultsForAsset:(id)a3 results:(id)a4;
- (int)updateSchedulingHistoryForActivityID:(unint64_t)a3 startTime:(id)a4 duration:(double)a5 exitStatus:(int)a6 sessionLog:(id)a7;
- (int64_t)compareExistingAnalysis:(id)a3 toNewAnalysis:(id)a4 forAsset:(id)a5;
- (int64_t)valueForKey:(id)a3;
- (unint64_t)analysisRecordsModifiedSinceDate:(id)a3;
- (unint64_t)countOfAssetsWithMediaAnalysisResultsType:(unint64_t)a3;
- (unint64_t)getAssetCountMatchingAllFlags:(unint64_t)a3;
- (unint64_t)getAssetCountMatchingAllFlags:(unint64_t)a3 andAnyFlags:(unint64_t)a4;
- (unint64_t)getAssetCountMatchingStatsFlags:(unint64_t)a3 andAnalysisTypes:(unint64_t)a4;
- (unint64_t)queryEligibleToRetryAssetCountWithProcessingStatus:(unint64_t)a3 andTaskID:(unint64_t)a4;
- (unint64_t)queryEligibleToRetryAssetCountWithTaskID:(unint64_t)a3;
- (unint64_t)sizeBytes;
- (void)closeDatabase;
- (void)dealloc;
- (void)flush;
@end

@implementation VCPDatabaseWriter

- (VCPDatabaseWriter)initWithFilepath:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___VCPDatabaseWriter;
  v6 = -[VCPDatabaseWriter init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_filepath, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.mediaanalysisd.sql", 0LL);
    sqlSerialQueue = v7->_sqlSerialQueue;
    v7->_sqlSerialQueue = (OS_dispatch_queue *)v8;

    v7->_database = 0LL;
    v7->_transaction = 0;
    v10 = v7;
  }

  return v7;
}

- (VCPDatabaseWriter)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___VCPDatabaseWriter;
  v6 = -[VCPDatabaseWriter init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "vcp_mediaAnalysisDatabaseFilepath"));
    filepath = v7->_filepath;
    v7->_filepath = (NSString *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.mediaanalysisd.sql", 0LL);
    sqlSerialQueue = v7->_sqlSerialQueue;
    v7->_sqlSerialQueue = (OS_dispatch_queue *)v10;

    v7->_database = 0LL;
    v7->_transaction = 0;
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VCPDatabaseWriter;
  -[VCPDatabaseWriter dealloc](&v3, "dealloc");
}

+ (id)databaseForPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibrary:v4];

  return v5;
}

- (int)beginTransaction
{
  if (self->_transaction && (int)MediaAnalysisLogLevel(self, a2) >= 4)
  {
    uint64_t v3 = VCPLogInstance();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    os_log_type_t v5 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v4, v5))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Attempting to re-entrantly begin transaction", v7, 2u);
    }
  }

  int result = sqlite3_exec(self->_database, "BEGIN TRANSACTION;", 0LL, 0LL, 0LL);
  if (!result) {
    self->_transaction = 1;
  }
  return result;
}

- (int)commitTransaction
{
  if (!self->_transaction && (int)MediaAnalysisLogLevel(self, a2) >= 4)
  {
    uint64_t v3 = VCPLogInstance();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    os_log_type_t v5 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v4, v5))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Attempting to commit unpaired transaction", v7, 2u);
    }
  }

  int result = sqlite3_exec(self->_database, "COMMIT TRANSACTION;", 0LL, 0LL, 0LL);
  self->_transaction = 0;
  return result;
}

- (void)closeDatabase
{
  if (self->_transaction) {
    -[VCPDatabaseWriter commitTransaction](self, "commitTransaction");
  }
  sqlite3_close(self->_database);
  self->_database = 0LL;
}

- (int)getUserVersion:(int *)a3
{
  ppStmt = 0LL;
  int v4 = sqlite3_prepare_v2(self->_database, "PRAGMA user_version;", -1, &ppStmt, 0LL);
  if (!v4)
  {
    int v4 = sqlite3_step(ppStmt);
    if (v4 == 100)
    {
      int v4 = 0;
      *a3 = sqlite3_column_int(ppStmt, 0);
    }
  }

  sqlite3_finalize(ppStmt);
  return v4;
}

+ (id)initializationCommand:(int)a3
{
  if (a3 != 11)
  {
    uint64_t v5 = MediaAnalysisLogLevel(a1, a2);
    if ((int)v5 >= 5)
    {
      uint64_t v7 = VCPLogInstance(v5, v6);
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      os_log_type_t v9 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 67109376;
        int v13 = a3;
        __int16 v14 = 1024;
        int v15 = 11;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  v9,  "[VCPDatabaseWriter] Upgrading database schema user_version (%d -> %d)",  buf,  0xEu);
      }
    }
  }

  dispatch_queue_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  objc_msgSend( v10,  "appendString:",  @"PRAGMA foreign_keys=ON;CREATE TABLE IF NOT EXISTS Assets(   id                  INTEGER PRIMARY KEY AUTOINCREMENT,    localIdentifier     TEXT,    version             INTEGER,    dateModified        REAL,    dateAnalyzed        REAL,    analysisTypes       INTEGER,    flags               INTEGER,    quality             REAL,");
  if (a3)
  {
    objc_msgSend(v10, "appendString:", @"    masterFingerprint   TEXT,    adjustedFingerprint TEXT,");
  }

  objc_msgSend( v10,  "appendString:",  @"    UNIQUE (localIdentifier);CREATE TABLE IF NOT EXISTS Results(   assetId          INTEGER,    resultsType      INTEGER,    results          BLOB,    FOREIGN KEY(assetId) REFERENCES Assets(id) ON DELETE CASCADE,    UNIQUE (assetId, resultsType));CREATE TABLE IF NOT EXISTS Blacklist(   id               INTEGER PRIMARY KEY AUTOINCREMENT,    localIdentifier  TEXT,    date             REAL,    count            INTEGER,    UNIQUE (localIdentifier));CREATE TABLE IF NOT EXISTS KeyValueStore(   id               INTEGER PRIMARY KEY AUTOINCREMENT,    key              TEXT,    value            INTEGER,    UNIQUE (key));"));
  objc_msgSend( v10,  "appendString:",  @"CREATE TABLE IF NOT EXISTS ChangeTokens(   id               INTEGER PRIMARY KEY AUTOINCREMENT,    tokenID          INTEGER,    tokenType        INTEGER,    tokenData        BLOB,    date             REAL,    version          INTEGER,    UNIQUE (tokenID, tokenType));CREATE TABLE IF NOT EXISTS ProcessingStatus(   id               INTEGER PRIMARY KEY AUTOINCREMENT,    taskID           INTEGER,    localIdentifier  TEXT,");
  if (a3 >= 3)
  {
    objc_msgSend(v10, "appendString:", @"    lastAttemptDate  REAL,    nextAttemptDate  REAL,");
    if (a3 < 0xB)
    {
    }

    else
    {
      objc_msgSend(v10, "appendString:", @"    errorCode   INTEGER,    errorLine   INTEGER,");
    }

    v11 = @"    mediaType       INTEGER,    mediaSubtypes   INTEGER,";
  }

  else
  {
    v11 = @"    date             REAL,";
  }

  [v10 appendString:v11];
LABEL_20:
  objc_msgSend( v10,  "appendString:",  @"    attempts         INTEGER,    status           INTEGER,    UNIQUE (taskID, localIdentifier);CREATE TABLE IF NOT EXISTS BackgroundActivitySchedulingHistory(   id               INTEGER PRIMARY KEY AUTOINCREMENT,    activityID       INTEGER,    startTime        REAL,    duration         REAL,    exitStatus       INTEGER,"));
  objc_msgSend( v10,  "appendString:",  @"    UNIQUE (activityID, startTime);CREATE TABLE IF NOT EXISTS BackgroundAnalysisProgressHistory(   id                  INTEGER PRIMARY KEY AUTOINCREMENT,    activityID          INTEGER,    analysisSubtype     INTEGER,    storeDate           REAL,    version             INTEGER,    processedAssetCount INTEGER,    totalAssetCount     INTEGER);"));
  objc_msgSend( v10,  "appendString:",  @"CREATE TABLE IF NOT EXISTS MomentsScheduledAssets(   id               INTEGER PRIMARY KEY AUTOINCREMENT,    taskID           INTEGER,    localIdentifier  TEXT,");
  objc_msgSend(v10, "appendString:", @"    UNIQUE (taskID, localIdentifier);"));
  objc_msgSend( v10,  "appendString:",  @"CREATE TABLE IF NOT EXISTS PrioritizedAssets(   id              INTEGER PRIMARY KEY AUTOINCREMENT,    localIdentifier TEXT,    mediaType       INTEGER,    mediaSubtype    INTEGER);");
  if (a3 == 1) {
    goto LABEL_27;
  }
  if (!a3)
  {
    [v10 appendString:@"ALTER TABLE Assets ADD COLUMN masterFingerprint TEXT;ALTER TABLE Assets ADD COLUMN adjustedFingerprint TEXT;"];
LABEL_27:
    [v10 appendString:@"ALTER TABLE Assets ADD COLUMN statsFlags INTEGER;"];
LABEL_29:
    [v10 appendString:@"ALTER TABLE ProcessingStatus RENAME COLUMN date TO lastAttemptDate;"];
    [v10 appendString:@"ALTER TABLE ProcessingStatus ADD COLUMN nextAttemptDate REAL DEFAULT 0.0;"];
LABEL_30:
    [v10 appendString:@"ALTER TABLE MomentsScheduledAssets ADD COLUMN requestDate REAL DEFAULT 0.0;"];
LABEL_31:
    [v10 appendString:@"ALTER TABLE ProcessingStatus ADD COLUMN mediaType INTEGER DEFAULT 0;ALTER TABLE ProcessingStatus ADD COLUMN mediaSubtypes INTEGER DEFAULT 0;"];
    goto LABEL_32;
  }

  if (a3 != 9)
  {
    goto LABEL_33;
  }

- (int)openDatabase
{
  char v95 = 0;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByDeletingLastPathComponent](self->_filepath, "stringByDeletingLastPathComponent"));
  if (([v3 fileExistsAtPath:v4 isDirectory:&v95] & 1) != 0
    || (NSFileAttributeKey v100 = NSFilePosixPermissions,
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](&OBJC_CLASS___NSNumber, "numberWithShort:", 493LL)),
        v101 = v5,
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v101,  &v100,  1)),  v7 = [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:v6 error:0],  v6,  v5,  (v7 & 1) != 0))
  {
    id v10 = [v3 fileExistsAtPath:self->_filepath];
    int v12 = (int)v10;
    uint64_t v13 = MediaAnalysisLogLevel(v10, v11);
    if ((int)v13 >= 6)
    {
      uint64_t v15 = VCPLogInstance(v13, v14);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      os_log_type_t v17 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v16, v17))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "[VCPDatabaseWriter] Database file does not exist, creating one",  buf,  2u);
      }
    }

    NSFileAttributeKey v98 = NSFileProtectionKey;
    NSFileProtectionType v99 = NSFileProtectionCompleteUntilFirstUserAuthentication;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v99,  &v98,  1LL));
    id v19 = [v3 createFileAtPath:self->_filepath contents:0 attributes:v18];
    if ((v19 & 1) != 0)
    {

LABEL_10:
      unsigned int v94 = 11;
      p_database = &self->_database;
      uint64_t v22 = sqlite3_open(-[NSString UTF8String](self->_filepath, "UTF8String"), &self->_database);
      int v24 = v22;
      if ((_DWORD)v22)
      {
        uint64_t v25 = MediaAnalysisLogLevel(v22, v23);
        if ((int)v25 >= 3)
        {
          uint64_t v27 = VCPLogInstance(v25, v26);
          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          os_log_type_t v29 = VCPLogToOSLogType[3];
          if (!os_log_type_enabled(v28, v29))
          {
LABEL_22:
            id v39 = 0LL;
            goto LABEL_23;
          }

          *(_DWORD *)buf = 67109120;
          LODWORD(v97) = v24;
          v30 = "[VCPDatabaseWriter] Failed to open database: %d";
LABEL_14:
          _os_log_impl((void *)&_mh_execute_header, v28, v29, v30, buf, 8u);
          goto LABEL_22;
        }

        goto LABEL_35;
      }

      uint64_t busy = sqlite3_busy_handler(*p_database, (int (__cdecl *)(void *, int))sub_10002D760, 0LL);
      int v24 = busy;
      if ((_DWORD)busy)
      {
        uint64_t v38 = VCPLogInstance(busy, v37);
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
          sub_100046B78(v24, v28);
        }
        goto LABEL_22;
      }

      if (v12)
      {
        uint64_t v45 = -[VCPDatabaseWriter getUserVersion:](self, "getUserVersion:", &v94);
        int v24 = v45;
        if ((_DWORD)v45)
        {
          uint64_t v25 = MediaAnalysisLogLevel(v45, v46);
          if ((int)v25 >= 3)
          {
            uint64_t v47 = VCPLogInstance(v25, v26);
            v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
            os_log_type_t v29 = VCPLogToOSLogType[3];
            if (!os_log_type_enabled(v28, v29)) {
              goto LABEL_22;
            }
            *(_DWORD *)buf = 67109120;
            LODWORD(v97) = v24;
            v30 = "[VCPDatabaseWriter] Failed to query database version: %d";
            goto LABEL_14;
          }

- (int)_updateAnalysisInfoWithCurrentVersion:(int)a3 andTimestamp:(int64_t)a4 forTaskID:(unint64_t)a5
{
  uint64_t v9 = VCPVersionKeyForTask(a5);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = VCPStartTimestampKeyForTask(a5);
  int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = VCPCompleteTimestampKeyForTask(a5, 0LL);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = VCPCompleteTimestampKeyForTask(a5, 1LL);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = VCPBGSTCheckpointTimestampKeyForTask(a5, 0LL);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  uint64_t v19 = VCPBGSTCheckpointTimestampKeyForTask(a5, 1LL);
  uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
  v173 = (void *)v20;
  if (!v10 || !v12 || !v14 || !v16)
  {
    uint64_t v34 = MediaAnalysisLogLevel(v20, v21);
    if ((int)v34 >= 3)
    {
      v170 = v18;
      uint64_t v36 = VCPLogInstance(v34, v35);
      uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      os_log_type_t v38 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v37, v38))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v176 = a5;
        _os_log_impl((void *)&_mh_execute_header, v37, v38, "No corresponding keys found for taskID %lu", buf, 0xCu);
      }

      v18 = v170;
    }

    int v24 = -50;
    goto LABEL_29;
  }

  uint64_t v174 = 0LL;
  uint64_t v22 = -[VCPDatabaseWriter _queryValue:forKey:](self, "_queryValue:forKey:", &v174, v10);
  int v24 = v22;
  if (!(_DWORD)v22)
  {
    if (v174 == a3)
    {
LABEL_17:
      int v24 = 0;
      goto LABEL_29;
    }

    uint64_t v39 = MediaAnalysisLogLevel(v22, v23);
    if ((int)v39 >= 5)
    {
      v171 = v18;
      uint64_t v41 = VCPLogInstance(v39, v40);
      uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      os_log_type_t v43 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v42, v43))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)v176 = v174;
        *(_WORD *)&v176[8] = 1024;
        *(_DWORD *)&v176[10] = a3;
        _os_log_impl((void *)&_mh_execute_header, v42, v43, "Analysis version changed from %lld to %d", buf, 0x12u);
      }

      v18 = v171;
    }

    uint64_t v44 = -[VCPDatabaseWriter _setValue:forKey:](self, "_setValue:forKey:", a3, v10);
    int v24 = v44;
    if ((_DWORD)v44)
    {
      uint64_t v46 = MediaAnalysisLogLevel(v44, v45);
      v172 = v18;
      uint64_t v48 = VCPLogInstance(v46, v47);
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      os_log_type_t v49 = VCPLogToOSLogType[3];
      if (!os_log_type_enabled(v28, v49))
      {
LABEL_27:
        v18 = v172;
        goto LABEL_28;
      }

      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v176 = a3;
      *(_WORD *)&v176[4] = 2112;
      *(void *)&v176[6] = v10;
      uint64_t v50 = "[VCPDatabaseWriter] Failed to set analysis version %d for %@";
      v51 = v28;
      os_log_type_t v52 = v49;
      uint32_t v53 = 18;
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, v51, v52, v50, buf, v53);
      goto LABEL_27;
    }

    uint64_t v55 = -[VCPDatabaseWriter _setValue:forKey:](self, "_setValue:forKey:", a4, v12);
    int v24 = v55;
    if ((_DWORD)v55)
    {
      uint64_t v57 = MediaAnalysisLogLevel(v55, v56);
      uint64_t v59 = VCPLogInstance(v57, v58);
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
      os_log_type_t v60 = VCPLogToOSLogType[3];
      if (!os_log_type_enabled(v28, v60)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 134218242;
      *(void *)v176 = a4;
      *(_WORD *)&v176[8] = 2112;
      *(void *)&v176[10] = v12;
      v30 = "[VCPDatabaseWriter] Failed to set timestamp %lld for %@";
      uint64_t v31 = v28;
      os_log_type_t v32 = v60;
      uint32_t v33 = 22;
      goto LABEL_10;
    }

    uint64_t v61 = -[VCPDatabaseWriter _removeKey:](self, "_removeKey:", v14);
    int v24 = v61;
    if ((_DWORD)v61)
    {
      uint64_t v63 = MediaAnalysisLogLevel(v61, v62);
      uint64_t v65 = VCPLogInstance(v63, v64);
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
      os_log_type_t v29 = VCPLogToOSLogType[3];
      if (!os_log_type_enabled(v28, v29)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v176 = v14;
      v30 = "[VCPDatabaseWriter] Failed to remove complete timestamp for %@";
LABEL_9:
      uint64_t v31 = v28;
      os_log_type_t v32 = v29;
      uint32_t v33 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v31, v32, v30, buf, v33);
      goto LABEL_28;
    }

    uint64_t v66 = -[VCPDatabaseWriter _removeKey:](self, "_removeKey:", v18);
    int v24 = v66;
    if ((_DWORD)v66)
    {
      uint64_t v68 = MediaAnalysisLogLevel(v66, v67);
      uint64_t v70 = VCPLogInstance(v68, v69);
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
      os_log_type_t v29 = VCPLogToOSLogType[3];
      if (!os_log_type_enabled(v28, v29)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v176 = v18;
      v30 = "[VCPDatabaseWriter] Failed to remove checkpoint timestamp for %@";
      goto LABEL_9;
    }

    uint64_t v71 = -[VCPDatabaseWriter _removeKey:](self, "_removeKey:", v16);
    int v24 = v71;
    if ((_DWORD)v71)
    {
      uint64_t v73 = MediaAnalysisLogLevel(v71, v72);
      uint64_t v75 = VCPLogInstance(v73, v74);
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
      os_log_type_t v29 = VCPLogToOSLogType[3];
      if (!os_log_type_enabled(v28, v29)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v176 = v16;
      v30 = "[VCPDatabaseWriter] Failed to remove complete_with_failure timestamp for %@";
      goto LABEL_9;
    }

    uint64_t v76 = -[VCPDatabaseWriter _removeKey:](self, "_removeKey:", v173);
    int v24 = v76;
    if ((_DWORD)v76)
    {
      uint64_t v78 = MediaAnalysisLogLevel(v76, v77);
      uint64_t v80 = VCPLogInstance(v78, v79);
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
      os_log_type_t v29 = VCPLogToOSLogType[3];
      if (!os_log_type_enabled(v28, v29)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v176 = v173;
      v30 = "[VCPDatabaseWriter] Failed to remove checkpoint_with_failure timestamp for %@";
      goto LABEL_9;
    }

    v172 = v18;
    if (a5 == 1)
    {
      uint64_t v88 = VCPKeyValueMediaAnalysisImagePriority1MCEnableTimestamp;
      uint64_t v89 = -[VCPDatabaseWriter _removeKey:]( self,  "_removeKey:",  VCPKeyValueMediaAnalysisImagePriority1MCEnableTimestamp);
      int v24 = v89;
      if ((_DWORD)v89)
      {
        uint64_t v91 = MediaAnalysisLogLevel(v89, v90);
        uint64_t v93 = VCPLogInstance(v91, v92);
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
        os_log_type_t v87 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v28, v87)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v176 = v88;
        uint64_t v50 = "[VCPDatabaseWriter] Failed to remove enablement timestamp for %@";
LABEL_96:
        v51 = v28;
        os_log_type_t v52 = v87;
        uint32_t v53 = 12;
        goto LABEL_26;
      }

      uint64_t v100 = VCPKeyValueMediaAnalysisImagePriority1CompleteTimestamp;
      uint64_t v101 = -[VCPDatabaseWriter _removeKey:]( self,  "_removeKey:",  VCPKeyValueMediaAnalysisImagePriority1CompleteTimestamp);
      int v24 = v101;
      if ((_DWORD)v101)
      {
        uint64_t v103 = MediaAnalysisLogLevel(v101, v102);
        uint64_t v105 = VCPLogInstance(v103, v104);
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v105);
        os_log_type_t v87 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v28, v87)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v176 = v100;
        uint64_t v50 = "[VCPDatabaseWriter] Failed to remove complete timestamp for %@";
        goto LABEL_96;
      }

      uint64_t v112 = VCPKeyValueMediaAnalysisImagePriority1CheckpointReportedTimestamp;
      uint64_t v113 = -[VCPDatabaseWriter _removeKey:]( self,  "_removeKey:",  VCPKeyValueMediaAnalysisImagePriority1CheckpointReportedTimestamp);
      int v24 = v113;
      if ((_DWORD)v113)
      {
        uint64_t v115 = MediaAnalysisLogLevel(v113, v114);
        uint64_t v117 = VCPLogInstance(v115, v116);
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v117);
        os_log_type_t v87 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v28, v87)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v176 = v112;
        uint64_t v50 = "[VCPDatabaseWriter] Failed to remove checkpoint timestamp for %@";
        goto LABEL_96;
      }

      uint64_t v123 = VCPKeyValueMediaAnalysisImagePriority1CheckpointWithFailureReportedTimestamp;
      uint64_t v124 = -[VCPDatabaseWriter _removeKey:]( self,  "_removeKey:",  VCPKeyValueMediaAnalysisImagePriority1CheckpointWithFailureReportedTimestamp);
      int v24 = v124;
      if ((_DWORD)v124)
      {
        uint64_t v126 = MediaAnalysisLogLevel(v124, v125);
        uint64_t v128 = VCPLogInstance(v126, v127);
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v128);
        os_log_type_t v87 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v28, v87)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v176 = v123;
        uint64_t v50 = "[VCPDatabaseWriter] Failed to remove checkpoint_with_failure timestamp for %@";
        goto LABEL_96;
      }

      uint64_t v132 = VCPKeyValueMediaAnalysisImageCheckpointReportedTimestamp;
      uint64_t v133 = -[VCPDatabaseWriter _removeKey:]( self,  "_removeKey:",  VCPKeyValueMediaAnalysisImageCheckpointReportedTimestamp);
      int v24 = v133;
      if ((_DWORD)v133)
      {
        uint64_t v135 = MediaAnalysisLogLevel(v133, v134);
        uint64_t v137 = VCPLogInstance(v135, v136);
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v137);
        os_log_type_t v87 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v28, v87)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v176 = v132;
        uint64_t v50 = "[VCPDatabaseWriter] Failed to remove complete timestamp for %@";
        goto LABEL_96;
      }

      uint64_t v169 = VCPKeyValueMediaAnalysisImageCheckpointWithFailureReportedTimestamp;
      uint64_t v76 = -[VCPDatabaseWriter _removeKey:](self, "_removeKey:");
      int v24 = v76;
      if ((_DWORD)v76)
      {
        uint64_t v138 = MediaAnalysisLogLevel(v76, v77);
        uint64_t v140 = VCPLogInstance(v138, v139);
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v140);
        os_log_type_t v87 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v28, v87)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v176 = v169;
        uint64_t v50 = "[VCPDatabaseWriter] Failed to remove checkpoint_with_failure timestamp for %@";
        goto LABEL_96;
      }
    }

    else if (a5 == 3)
    {
      uint64_t v81 = VCPKeyValuePrioritizedFaceAnalysisCompleteTimestamp;
      uint64_t v82 = -[VCPDatabaseWriter _removeKey:](self, "_removeKey:", VCPKeyValuePrioritizedFaceAnalysisCompleteTimestamp);
      int v24 = v82;
      if ((_DWORD)v82)
      {
        uint64_t v84 = MediaAnalysisLogLevel(v82, v83);
        if ((int)v84 >= 3)
        {
          uint64_t v86 = VCPLogInstance(v84, v85);
          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
          os_log_type_t v87 = VCPLogToOSLogType[3];
          if (!os_log_type_enabled(v28, v87)) {
            goto LABEL_27;
          }
          *(_DWORD *)buf = 138412290;
          *(void *)v176 = v81;
          uint64_t v50 = "[VCPDatabaseWriter] Failed to remove complete timestamp for %@";
          goto LABEL_96;
        }

        goto LABEL_114;
      }

      uint64_t v94 = VCPKeyValuePrioritizedFaceCheckpointReportedTimestamp;
      uint64_t v95 = -[VCPDatabaseWriter _removeKey:](self, "_removeKey:", VCPKeyValuePrioritizedFaceCheckpointReportedTimestamp);
      int v24 = v95;
      if ((_DWORD)v95)
      {
        uint64_t v97 = MediaAnalysisLogLevel(v95, v96);
        uint64_t v99 = VCPLogInstance(v97, v98);
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
        os_log_type_t v87 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v28, v87)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v176 = v94;
        uint64_t v50 = "[VCPDatabaseWriter] Failed to remove checkpoint timestamp for %@";
        goto LABEL_96;
      }

      uint64_t v106 = VCPKeyValuePrioritizedFaceAnalysisCompleteWithFailureTimestamp;
      uint64_t v107 = -[VCPDatabaseWriter _removeKey:]( self,  "_removeKey:",  VCPKeyValuePrioritizedFaceAnalysisCompleteWithFailureTimestamp);
      int v24 = v107;
      if ((_DWORD)v107)
      {
        uint64_t v109 = MediaAnalysisLogLevel(v107, v108);
        uint64_t v111 = VCPLogInstance(v109, v110);
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v111);
        os_log_type_t v87 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v28, v87)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v176 = v106;
        uint64_t v50 = "[VCPDatabaseWriter] Failed to remove complete_with_failure timestamp for %@";
        goto LABEL_96;
      }

      uint64_t v168 = VCPKeyValuePrioritizedFaceCheckpointWithFailureReportedTimestamp;
      uint64_t v118 = -[VCPDatabaseWriter _removeKey:](self, "_removeKey:");
      int v24 = v118;
      if ((_DWORD)v118)
      {
        uint64_t v120 = MediaAnalysisLogLevel(v118, v119);
        uint64_t v122 = VCPLogInstance(v120, v121);
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v122);
        os_log_type_t v87 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v28, v87)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v176 = v168;
        uint64_t v50 = "[VCPDatabaseWriter] Failed to remove checkpoint_with_failure timestamp for %@";
        goto LABEL_96;
      }

      uint64_t v76 = -[VCPDatabaseWriter _removeKey:](self, "_removeKey:", VCPKeyValuePersonalizationCheckpointReportedTimestamp);
      int v24 = v76;
      if ((_DWORD)v76)
      {
        uint64_t v129 = MediaAnalysisLogLevel(v76, v77);
        uint64_t v131 = VCPLogInstance(v129, v130);
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v131);
        os_log_type_t v87 = VCPLogToOSLogType[3];
        if (!os_log_type_enabled(v28, v87)) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v176 = v168;
        uint64_t v50 = "[VCPDatabaseWriter] Failed to remove personalization checkpoint timestamp for %@";
        goto LABEL_96;
      }
    }

    uint64_t v141 = MediaAnalysisLogLevel(v76, v77);
    if ((int)v141 >= 7)
    {
      uint64_t v143 = VCPLogInstance(v141, v142);
      v144 = (os_log_s *)objc_claimAutoreleasedReturnValue(v143);
      os_log_type_t v145 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v144, v145))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)v176 = v10;
        *(_WORD *)&v176[8] = 1024;
        *(_DWORD *)&v176[10] = a3;
        *(_WORD *)&v176[14] = 2048;
        *(void *)&v176[16] = a4;
        _os_log_impl((void *)&_mh_execute_header, v144, v145, "Updated %@ with %d (timestamp: %lld)", buf, 0x1Cu);
      }
    }

    uint64_t v146 = -[VCPDatabaseWriter _removeAllProcessingStatusForTaskID:](self, "_removeAllProcessingStatusForTaskID:", a5);
    int v24 = v146;
    if ((_DWORD)v146)
    {
      uint64_t v148 = MediaAnalysisLogLevel(v146, v147);
      if ((int)v148 >= 3)
      {
        uint64_t v150 = VCPLogInstance(v148, v149);
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v150);
        os_log_type_t v151 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v28, v151))
        {
          uint64_t v152 = VCPTaskIDDescription(a5);
          v153 = (void *)objc_claimAutoreleasedReturnValue(v152);
          *(_DWORD *)buf = 138412290;
          *(void *)v176 = v153;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  v151,  "[VCPDatabaseWriter] Unable to drop processing status for %@",  buf,  0xCu);

          v18 = v172;
          goto LABEL_28;
        }

        goto LABEL_27;
      }

      goto LABEL_114;
    }

    if (a5 != 1) {
      goto LABEL_115;
    }
    uint64_t v154 = -[VCPDatabaseWriter _removeAllProcessingStatusForTaskID:]( self,  "_removeAllProcessingStatusForTaskID:",  255LL);
    int v24 = v154;
    if ((_DWORD)v154)
    {
      uint64_t v156 = MediaAnalysisLogLevel(v154, v155);
      if ((int)v156 >= 3)
      {
        uint64_t v158 = VCPLogInstance(v156, v157);
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v158);
        os_log_type_t v159 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v28, v159))
        {
          uint64_t v160 = VCPTaskIDDescription(1LL);
          v161 = (void *)objc_claimAutoreleasedReturnValue(v160);
          *(_DWORD *)buf = 138412290;
          *(void *)v176 = v161;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  v159,  "[VCPDatabaseWriter] Unable to drop processing status for %@",  buf,  0xCu);

          v18 = v172;
          goto LABEL_28;
        }

        goto LABEL_27;
      }

      goto LABEL_114;
    }

    uint64_t v162 = -[VCPDatabaseWriter _removeKey:](self, "_removeKey:", PrioritizedAssetCollectionFinishTimestampKey);
    int v24 = v162;
    if (!(_DWORD)v162)
    {
LABEL_115:
      v18 = v172;
      +[MADProgressManager resetProcessingCheckpointForTask:]( &OBJC_CLASS___MADProgressManager,  "resetProcessingCheckpointForTask:",  a5);
      goto LABEL_17;
    }

    uint64_t v164 = MediaAnalysisLogLevel(v162, v163);
    if ((int)v164 >= 3)
    {
      uint64_t v166 = VCPLogInstance(v164, v165);
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v166);
      os_log_type_t v167 = VCPLogToOSLogType[3];
      if (!os_log_type_enabled(v28, v167)) {
        goto LABEL_27;
      }
      *(_WORD *)buf = 0;
      uint64_t v50 = "[VCPDatabaseWriter] Failed to remove prioritized asset collection finish timestamp";
      v51 = v28;
      os_log_type_t v52 = v167;
      uint32_t v53 = 2;
      goto LABEL_26;
    }

- (int)_updateAnalysisInfoOnAnalysisVersionChange
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 6)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Checking KeyValueStore for analysis versions ...", buf, 2u);
    }
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  uint64_t v11 = -[VCPDatabaseWriter beginTransaction](self, "beginTransaction");
  int v13 = v11;
  if ((_DWORD)v11)
  {
    uint64_t v14 = MediaAnalysisLogLevel(v11, v12);
    if ((int)v14 >= 3)
    {
      uint64_t v16 = VCPLogInstance(v14, v15);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      os_log_type_t v18 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v17, v18))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  v18,  "[VCPDatabaseWriter] Failed to begin transaction for analysis version check/update",  buf,  2u);
      }
    }
  }

  else
  {
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v19 = [&off_1001C8FD0 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v34;
      while (2)
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v34 != v20) {
            objc_enumerationMutation(&off_1001C8FD0);
          }
          uint64_t v22 = (int)[*(id *)(*((void *)&v33 + 1) + 8 * (void)i) intValue];
          uint64_t v23 = -[VCPDatabaseWriter _updateAnalysisInfoWithCurrentVersion:andTimestamp:forTaskID:]( self,  "_updateAnalysisInfoWithCurrentVersion:andTimestamp:forTaskID:",  VCPVersionForTask(v22),  (uint64_t)v10,  v22);
          int v13 = v23;
          if ((_DWORD)v23)
          {
            uint64_t v25 = MediaAnalysisLogLevel(v23, v24);
            if ((int)v25 >= 3)
            {
              uint64_t v27 = VCPLogInstance(v25, v26);
              v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
              os_log_type_t v29 = VCPLogToOSLogType[3];
              if (os_log_type_enabled(v28, v29))
              {
                uint64_t v30 = VCPTaskIDDescription(v22);
                uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
                *(_DWORD *)buf = 138412290;
                os_log_type_t v38 = v31;
                _os_log_impl( (void *)&_mh_execute_header,  v28,  v29,  "[VCPDatabaseWriter] Failed to check/update analysis version for %@",  buf,  0xCu);
              }
            }

            return v13;
          }
        }

        id v19 = [&off_1001C8FD0 countByEnumeratingWithState:&v33 objects:v39 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    return -[VCPDatabaseWriter commitTransaction](self, "commitTransaction");
  }

  return v13;
}

- (int)_updateOperatingSystemVersion
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 operatingSystemVersion];
  }

  else
  {
    uint64_t v117 = 0LL;
    uint64_t v118 = 0LL;
    uint64_t v119 = 0LL;
  }

  uint64_t v6 = v117;
  uint64_t v5 = v118;
  uint64_t v116 = 0LL;
  os_log_type_t v7 = (os_log_s *)MajorOSVersionNumberKey;
  uint64_t v8 = -[VCPDatabaseWriter _queryValue:forKey:](self, "_queryValue:forKey:", &v116, MajorOSVersionNumberKey);
  int v10 = v8;
  if ((_DWORD)v8)
  {
    uint64_t v11 = MediaAnalysisLogLevel(v8, v9);
    if ((int)v11 >= 3)
    {
      uint64_t v13 = VCPLogInstance(v11, v12);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      os_log_type_t v15 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v14, v15))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v122 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "[VCPDatabaseWriter] Failed to query major os version for %@",  buf,  0xCu);
      }
    }

    return v10;
  }

  uint64_t v115 = 0LL;
  uint64_t v16 = (os_log_s *)MinorOSVersionNumberKey;
  uint64_t v17 = -[VCPDatabaseWriter _queryValue:forKey:](self, "_queryValue:forKey:", &v115, MinorOSVersionNumberKey);
  int v10 = v17;
  if ((_DWORD)v17)
  {
    uint64_t v19 = MediaAnalysisLogLevel(v17, v18);
    uint64_t v21 = VCPLogInstance(v19, v20);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    os_log_type_t v23 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v22, v23))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v122 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  v23,  "[VCPDatabaseWriter] Failed to query minor os version for %@",  buf,  0xCu);
    }

- (int)_queryValue:(int64_t *)a3 forKey:(id)a4
{
  id v6 = a4;
  ppStmt = 0LL;
  *a3 = 0LL;
  uint64_t v7 = sqlite3_prepare_v2(self->_database, "SELECT value FROM KeyValueStore WHERE key = (?);", -1, &ppStmt, 0LL);
  int v9 = v7;
  if ((_DWORD)v7) {
    goto LABEL_6;
  }
  int v10 = ppStmt;
  id v11 = v6;
  uint64_t v12 = v11;
  int v13 = v11
  int v9 = v13;

  if (v9) {
    goto LABEL_6;
  }
  uint64_t v21 = sqlite3_expanded_sql(ppStmt);
  if (v21)
  {
    uint64_t v22 = MediaAnalysisEnableDatabaseLog();
    if ((_DWORD)v22)
    {
      uint64_t v24 = VCPLogInstance(v22, v23);
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        os_log_type_t v28 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v29 = 1024;
        int v30 = 659;
        __int16 v31 = 2080;
        uint64_t v32 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "[MADB] Statement: %s[line:%d]: %s",  buf,  0x1Cu);
      }
    }

    sqlite3_free(v21);
  }

  uint64_t v7 = sqlite3_step(ppStmt);
  int v9 = v7;
  if ((_DWORD)v7 == 100)
  {
    *a3 = sqlite3_column_int64(ppStmt, 0);
    uint64_t v7 = sqlite3_step(ppStmt);
    int v9 = v7;
  }

  int v19 = 0;
  if (v9)
  {
    if (v9 != 101)
    {
LABEL_6:
      uint64_t v14 = MediaAnalysisLogLevel(v7, v8);
      if ((int)v14 >= 3)
      {
        uint64_t v16 = VCPLogInstance(v14, v15);
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        os_log_type_t v18 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v17, v18))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, v18, "Failed to query KeyValueStore", buf, 2u);
        }
      }

      int v19 = v9;
    }
  }

  sqlite3_finalize(ppStmt);

  return v19;
}

- (int)_setValue:(int64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    ppStmt = 0LL;
    uint64_t v7 = sqlite3_prepare_v2( self->_database,  "REPLACE INTO KeyValueStore (key, value) VALUES ((?), (?));",
           -1,
           &ppStmt,
           0LL);
    int v9 = v7;
    if ((_DWORD)v7) {
      goto LABEL_5;
    }
    int v10 = ppStmt;
    id v11 = v6;
    int v9 = sqlite3_bind_text(v10, 1, (const char *)[v11 UTF8String], -1, 0);

    if (v9) {
      goto LABEL_5;
    }
    uint64_t v7 = sqlite3_bind_int64(ppStmt, 2, a3);
    int v9 = v7;
    if ((_DWORD)v7) {
      goto LABEL_5;
    }
    int v19 = sqlite3_expanded_sql(ppStmt);
    if (v19)
    {
      uint64_t v20 = MediaAnalysisEnableDatabaseLog();
      if ((_DWORD)v20)
      {
        uint64_t v22 = VCPLogInstance(v20, v21);
        uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v26 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
          __int16 v27 = 1024;
          int v28 = 684;
          __int16 v29 = 2080;
          int v30 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "[MADB] Statement: %s[line:%d]: %s",  buf,  0x1Cu);
        }
      }

      sqlite3_free(v19);
    }

    uint64_t v7 = sqlite3_step(ppStmt);
    int v9 = v7;
    int v17 = 0;
    if ((_DWORD)v7)
    {
      if ((_DWORD)v7 != 101)
      {
LABEL_5:
        uint64_t v12 = MediaAnalysisLogLevel(v7, v8);
        if ((int)v12 >= 3)
        {
          uint64_t v14 = VCPLogInstance(v12, v13);
          uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          os_log_type_t v16 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v15, v16))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, v16, "Failed to update KeyValueStore", buf, 2u);
          }
        }

        int v17 = v9;
      }
    }

    sqlite3_finalize(ppStmt);
  }

  else
  {
    int v17 = -50;
  }

  return v17;
}

- (int)_removeKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    ppStmt = 0LL;
    int v5 = sqlite3_prepare_v2(self->_database, "DELETE FROM KeyValueStore WHERE key=(?);", -1, &ppStmt, 0LL);
    if (!v5)
    {
      id v6 = ppStmt;
      id v7 = v4;
      int v5 = sqlite3_bind_text(v6, 1, (const char *)[v7 UTF8String], -1, 0);

      if (!v5)
      {
        uint64_t v8 = sqlite3_expanded_sql(ppStmt);
        if (v8)
        {
          uint64_t v9 = MediaAnalysisEnableDatabaseLog();
          if ((_DWORD)v9)
          {
            uint64_t v11 = VCPLogInstance(v9, v10);
            uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              int v17 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
              __int16 v18 = 1024;
              int v19 = 699;
              __int16 v20 = 2080;
              uint64_t v21 = v8;
              _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "[MADB] Statement: %s[line:%d]: %s",  buf,  0x1Cu);
            }
          }

          sqlite3_free(v8);
        }

        int v13 = sqlite3_step(ppStmt);
        if (v13 == 101) {
          int v5 = 0;
        }
        else {
          int v5 = v13;
        }
      }
    }

    sqlite3_finalize(ppStmt);
  }

  else
  {
    int v5 = -50;
  }

  return v5;
}

- (int)_removeAllProcessingStatusForTaskID:(unint64_t)a3
{
  ppStmt = 0LL;
  int v4 = sqlite3_prepare_v2(self->_database, "DELETE FROM ProcessingStatus WHERE taskID=(?);", -1, &ppStmt, 0LL);
  if (!v4)
  {
    int v4 = sqlite3_bind_int64(ppStmt, 1, a3);
    if (!v4)
    {
      int v5 = sqlite3_expanded_sql(ppStmt);
      if (v5)
      {
        id v6 = v5;
        if (MediaAnalysisEnableDatabaseLog())
        {
          uint64_t v7 = VCPLogInstance();
          uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            int v13 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
            __int16 v14 = 1024;
            int v15 = 713;
            __int16 v16 = 2080;
            int v17 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "[MADB] Statement: %s[line:%d]: %s",  buf,  0x1Cu);
          }
        }

        sqlite3_free(v6);
      }

      int v9 = sqlite3_step(ppStmt);
      if (v9 == 101) {
        int v4 = 0;
      }
      else {
        int v4 = v9;
      }
    }
  }

  sqlite3_finalize(ppStmt);
  return v4;
}

- (BOOL)shouldPropagateError:(int *)a3 finalAttempt:(BOOL)a4
{
  int v6 = *a3;
  switch(*a3)
  {
    case 7:
      uint64_t v7 = VCPLogInstance();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      os_log_type_t v9 = VCPLogToOSLogType[3];
      if (!os_log_type_enabled(v8, v9)) {
        goto LABEL_25;
      }
      LOWORD(v31[0]) = 0;
      uint64_t v10 = "Database allocation failed";
      goto LABEL_24;
    case 8:
    case 9:
    case 12:
    case 15:
    case 16:
    case 17:
      goto LABEL_7;
    case 10:
      if ((int)MediaAnalysisLogLevel(self, a2) >= 3)
      {
        uint64_t v15 = VCPLogInstance();
        __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        os_log_type_t v17 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v16, v17))
        {
          LOWORD(v31[0]) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "Database I/O error; disk may be full",
            (uint8_t *)v31,
            2u);
        }
      }

      int v18 = -36;
      goto LABEL_32;
    case 11:
      if ((int)MediaAnalysisLogLevel(self, a2) >= 3)
      {
        uint64_t v19 = VCPLogInstance();
        __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        os_log_type_t v21 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v20, v21))
        {
          LOWORD(v31[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, v21, "Database is corrupted", (uint8_t *)v31, 2u);
        }
      }

      return 0;
    case 13:
      if ((int)MediaAnalysisLogLevel(self, a2) >= 3)
      {
        uint64_t v22 = VCPLogInstance();
        uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        os_log_type_t v9 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v8, v9))
        {
          LOWORD(v31[0]) = 0;
          uint64_t v10 = "Database or disk full";
LABEL_24:
          _os_log_impl((void *)&_mh_execute_header, v8, v9, v10, (uint8_t *)v31, 2u);
        }

- (int)executeDatabaseBlock:(id)a3 fallbackBlock:(id)a4 write:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0LL;
  __int16 v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  int v22 = 0;
  sqlSerialQueue = (dispatch_queue_s *)self->_sqlSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002FF2C;
  block[3] = &unk_1001BA848;
  BOOL v18 = a5;
  block[4] = self;
  id v15 = v8;
  id v16 = v9;
  os_log_type_t v17 = &v19;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(sqlSerialQueue, block);
  LODWORD(sqlSerialQueue) = *((_DWORD *)v20 + 6);

  _Block_object_dispose(&v19, 8);
  return (int)sqlSerialQueue;
}

- (int)commit
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100030700;
  v3[3] = &unk_1001BA870;
  v3[4] = self;
  return -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v3,  0LL,  0LL);
}

- (void)flush
{
  sqlSerialQueue = (dispatch_queue_s *)self->_sqlSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003077C;
  block[3] = &unk_1001BA0C8;
  block[4] = self;
  dispatch_sync(sqlSerialQueue, block);
}

- (unint64_t)sizeBytes
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 attributesOfItemAtPath:self->_filepath error:0]);
  id v5 = [v4 fileSize];

  return (unint64_t)v5;
}

- (id)creationDate
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 attributesOfItemAtPath:self->_filepath error:0]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:NSFileCreationDate]);

  return v5;
}

- (BOOL)exists
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v3 fileExistsAtPath:self->_filepath])
  {
    unsigned __int8 v4 = 1;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary vcp_defaultPhotoLibrary](&OBJC_CLASS___PHPhotoLibrary, "vcp_defaultPhotoLibrary"));
    int v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "vcp_mediaAnalysisBackupFilepath"));
    unsigned __int8 v4 = [v3 fileExistsAtPath:v6];
  }

  return v4;
}

- (BOOL)hasOutstandingTransactions
{
  return self->_transaction;
}

- (id)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
}

+ (double)_ageOutIntervalForChangeTokenType:(unint64_t)a3
{
  return dbl_1001978D0[(a3 & 0xFFFFFFFFFFFFFFFELL) == 2];
}

- (int)setChangeToken:(id)a3 forTaskID:(unint64_t)a4 andChangeTokenType:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v9 = MediaAnalysisEnableDatabaseLog();
  if ((_DWORD)v9)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 946;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(ChangeTokenOrBookmark) setChangeToken:forTaskID:andChangeTokenType:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  *(void *)&buf[24] = sub_100030C00;
  int v22 = sub_100030C10;
  id v23 = 0LL;
  if (a5 == 2)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v8 base64EncodedDataWithOptions:0]);
    id v14 = 0LL;
    id v15 = *(void **)(*(void *)&buf[8] + 40LL);
    *(void *)(*(void *)&buf[8] + 40LL) = v13;
  }

  else
  {
    id v20 = 0LL;
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  &v20));
    id v14 = v20;
    id v15 = *(void **)(*(void *)&buf[8] + 40LL);
    *(void *)(*(void *)&buf[8] + 40LL) = v16;
  }

  if (*(void *)(*(void *)&buf[8] + 40LL))
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100030C18;
    v19[3] = &unk_1001BA898;
    v19[6] = a4;
    v19[7] = a5;
    v19[4] = self;
    v19[5] = buf;
    int v17 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v19,  0LL,  1LL);
  }

  else
  {
    int v17 = -50;
  }

  _Block_object_dispose(buf, 8);

  return v17;
}

- (int)updateChangeToken:(id)a3 forTaskID:(unint64_t)a4 andChangeTokenType:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v9 = MediaAnalysisEnableDatabaseLog();
  if ((_DWORD)v9)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 979;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(ChangeTokenOrBookmark) updateChangeToken:forTaskID:andChangeTokenType:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  *(void *)&buf[24] = sub_100030C00;
  int v22 = sub_100030C10;
  id v23 = 0LL;
  if (a5 == 2)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v8 base64EncodedDataWithOptions:0]);
    id v14 = 0LL;
    id v15 = *(void **)(*(void *)&buf[8] + 40LL);
    *(void *)(*(void *)&buf[8] + 40LL) = v13;
  }

  else
  {
    id v20 = 0LL;
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  &v20));
    id v14 = v20;
    id v15 = *(void **)(*(void *)&buf[8] + 40LL);
    *(void *)(*(void *)&buf[8] + 40LL) = v16;
  }

  if (*(void *)(*(void *)&buf[8] + 40LL))
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100031138;
    v19[3] = &unk_1001BA898;
    v19[4] = self;
    v19[5] = buf;
    v19[6] = a4;
    v19[7] = a5;
    int v17 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v19,  0LL,  1LL);
  }

  else
  {
    int v17 = -50;
  }

  _Block_object_dispose(buf, 8);

  return v17;
}

- (int)queryChangeToken:(id *)a3 forTaskID:(unint64_t)a4 andChangeTokenType:(unint64_t)a5
{
  uint64_t v9 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v9)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v17 = 1024;
      int v18 = 1009;
      __int16 v19 = 2080;
      id v20 = "-[VCPDatabaseWriter(ChangeTokenOrBookmark) queryChangeToken:forTaskID:andChangeTokenType:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  *a3 = 0LL;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10003146C;
  v14[3] = &unk_1001BA8C0;
  v14[4] = self;
  v14[5] = a4;
  v14[6] = a5;
  v14[7] = a3;
  return -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v14,  0LL,  0LL);
}

- (int)removeChangeTokenForTaskID:(unint64_t)a3 andChangeTokenType:(unint64_t)a4
{
  uint64_t v7 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v7)
  {
    uint64_t v9 = VCPLogInstance(v7, v8);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v14 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v15 = 1024;
      int v16 = 1056;
      __int16 v17 = 2080;
      int v18 = "-[VCPDatabaseWriter(ChangeTokenOrBookmark) removeChangeTokenForTaskID:andChangeTokenType:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100031AF8;
  v12[3] = &unk_1001BA8E8;
  v12[4] = self;
  v12[5] = a3;
  v12[6] = a4;
  return -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v12,  0LL,  1LL);
}

- (int)removeAllChangeTokensForTaskID:(unint64_t)a3
{
  uint64_t v5 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v5)
  {
    uint64_t v7 = VCPLogInstance(v5, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v12 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v13 = 1024;
      int v14 = 1073;
      __int16 v15 = 2080;
      int v16 = "-[VCPDatabaseWriter(ChangeTokenOrBookmark) removeAllChangeTokensForTaskID:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100031D80;
  v10[3] = &unk_1001BA910;
  v10[4] = self;
  v10[5] = a3;
  return -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v10,  0LL,  1LL);
}

- (int)setDeletePendingFlag:(BOOL)a3 localIdentifier:(id)a4
{
  id v6 = a4;
  uint64_t v8 = MediaAnalysisEnableDatabaseLog(v6, v7);
  if ((_DWORD)v8)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v19 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v20 = 1024;
      int v21 = 1096;
      __int16 v22 = 2080;
      id v23 = "-[VCPDatabaseWriter(Maintenance) setDeletePendingFlag:localIdentifier:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100032040;
  v15[3] = &unk_1001BA938;
  BOOL v17 = a3;
  v15[4] = self;
  id v12 = v6;
  id v16 = v12;
  int v13 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v15,  0LL,  1LL);

  return v13;
}

- (int)updateFingerprint:(id)a3 forAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = MediaAnalysisEnableDatabaseLog(v7, v8);
  if ((_DWORD)v9)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v21 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v22 = 1024;
      int v23 = 1122;
      __int16 v24 = 2080;
      uint64_t v25 = "-[VCPDatabaseWriter(Maintenance) updateFingerprint:forAsset:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10003242C;
  v17[3] = &unk_1001BA960;
  v17[4] = self;
  id v13 = v6;
  id v18 = v13;
  id v14 = v7;
  id v19 = v14;
  int v15 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v17,  0LL,  1LL);

  return v15;
}

- (int)updateLocalIdentifer:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = MediaAnalysisEnableDatabaseLog(v7, v8);
  if ((_DWORD)v9)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v21 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v22 = 1024;
      int v23 = 1141;
      __int16 v24 = 2080;
      uint64_t v25 = "-[VCPDatabaseWriter(Maintenance) updateLocalIdentifer:to:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100032850;
  v17[3] = &unk_1001BA960;
  v17[4] = self;
  id v13 = v7;
  id v18 = v13;
  id v14 = v6;
  id v19 = v14;
  int v15 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v17,  0LL,  1LL);

  return v15;
}

- (int)updateDateModifiedForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MediaAnalysisEnableDatabaseLog(v4, v5);
  if ((_DWORD)v6)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v16 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v17 = 1024;
      int v18 = 1161;
      __int16 v19 = 2080;
      __int16 v20 = "-[VCPDatabaseWriter(Maintenance) updateDateModifiedForAsset:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100032C5C;
  v13[3] = &unk_1001BA988;
  v13[4] = self;
  id v10 = v4;
  id v14 = v10;
  int v11 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v13,  0LL,  1LL);

  return v11;
}

- (int)containsAsset:(id)a3 result:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v8 = MediaAnalysisEnableDatabaseLog(v6, v7);
  if ((_DWORD)v8)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v21 = 1024;
      int v22 = 1180;
      __int16 v23 = 2080;
      __int16 v24 = "-[VCPDatabaseWriter(Maintenance) containsAsset:result:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000330B0;
  v16[3] = &unk_1001BA9B0;
  v16[4] = self;
  id v12 = v6;
  id v17 = v12;
  int v18 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100033274;
  v15[3] = &unk_1001BA9D0;
  v15[4] = a4;
  int v13 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v16,  v15,  0LL);

  return v13;
}

- (int)queryAssetWithLocalIdentifier:(id)a3 forMediaAnalysisVersion:(id *)a4
{
  id v6 = a3;
  uint64_t v8 = MediaAnalysisEnableDatabaseLog(v6, v7);
  if ((_DWORD)v8)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1203;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(Maintenance) queryAssetWithLocalIdentifier:forMediaAnalysisVersion:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  *(void *)&buf[24] = sub_100030C00;
  __int16 v20 = sub_100030C10;
  __int16 v21 = &off_1001C7B08;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10003347C;
  v16[3] = &unk_1001BA9F8;
  v16[4] = self;
  id v12 = v6;
  id v17 = v12;
  int v18 = buf;
  unsigned int v13 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v16,  &stru_1001BAA38,  0LL);
  int v14 = v13;
  if (a4 && !v13) {
    *a4 = *(id *)(*(void *)&buf[8] + 40LL);
  }

  _Block_object_dispose(buf, 8);
  return v14;
}

- (int64_t)compareExistingAnalysis:(id)a3 toNewAnalysis:(id)a4 forAsset:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_msgSend(v9, "vcp_isAnalysisValid:", v7);
  if ((v10 & 1) == 0)
  {
    uint64_t v25 = MediaAnalysisLogLevel(v10, v11);
    uint64_t v27 = VCPLogInstance(v25, v26);
    int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    os_log_type_t v28 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v18, v28))
    {
      os_log_type_t v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vcp_dateModified"));
      int v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vcp_dateModified"));
      int v53 = 138412546;
      *(void *)uint64_t v54 = v29;
      *(_WORD *)&v54[8] = 2112;
      uint64_t v55 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  v28,  "    Existing analysis from previous modification (%@ vs %@); discarding",
        (uint8_t *)&v53,
        0x16u);
    }

    goto LABEL_11;
  }

  int v12 = objc_msgSend(v7, "vcp_version");
  id v13 = objc_msgSend(v8, "vcp_version");
  if (v12 <= (int)v13)
  {
    if (!objc_msgSend(v7, "vcp_degraded")
      || (id v31 = objc_msgSend(v8, "vcp_degraded"), (v31 & 1) != 0))
    {
      if ((objc_msgSend(v7, "vcp_degraded") & 1) != 0 || !objc_msgSend(v8, "vcp_degraded"))
      {
        int64_t v24 = 0LL;
        goto LABEL_33;
      }

      int v33 = objc_msgSend(v7, "vcp_version");
      if (v33 >= (int)objc_msgSend(v8, "vcp_version"))
      {
        unint64_t v34 = (unint64_t)[v9 isPhoto];
        if ((_DWORD)v34)
        {
          unint64_t v36 = (unint64_t)objc_msgSend(v7, "vcp_types");
          unint64_t v37 = (unint64_t)objc_msgSend(v8, "vcp_types");
          unint64_t v34 = (unint64_t)+[PHAsset vcp_fullAnalysisGenerativeModelAdditionalTypes]( &OBJC_CLASS___PHAsset,  "vcp_fullAnalysisGenerativeModelAdditionalTypes");
          if ((v37 & ~v36 & v34) != 0)
          {
            uint64_t v38 = MediaAnalysisLogLevel(v34, v35);
            if ((int)v38 < 6)
            {
              int64_t v24 = 2LL;
              goto LABEL_33;
            }

            uint64_t v40 = VCPLogInstance(v38, v39);
            int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
            os_log_type_t v41 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v18, v41))
            {
              uint64_t v42 = MediaAnalysisTypeDescription((unint64_t)objc_msgSend(v8, "vcp_types") & ~(unint64_t)objc_msgSend(v7, "vcp_types") & (unint64_t)+[PHAsset vcp_fullAnalysisGenerativeModelAdditionalTypes](PHAsset, "vcp_fullAnalysisGenerativeModelAdditionalTypes"));
              uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
              int v53 = 138412290;
              *(void *)uint64_t v54 = v43;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  v41,  "    Existing analysis version up-to-date but missing %@; Update missing GM additional analysis only from"
                " new degraded analysis",
                (uint8_t *)&v53,
                0xCu);
            }

            int64_t v24 = 2LL;
            goto LABEL_12;
          }
        }

        uint64_t v48 = MediaAnalysisLogLevel(v34, v35);
        if ((int)v48 >= 6)
        {
          uint64_t v50 = VCPLogInstance(v48, v49);
          int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
          os_log_type_t v51 = VCPLogToOSLogType[6];
          if (!os_log_type_enabled(v18, v51)) {
            goto LABEL_7;
          }
          LOWORD(v53) = 0;
          __int16 v20 = "    New analysis degraded; discarding";
          __int16 v21 = v18;
          os_log_type_t v22 = v51;
          uint32_t v23 = 2;
          goto LABEL_6;
        }

- (int)_deleteAsset:(id)a3
{
  id v4 = a3;
  ppStmt = 0LL;
  int v5 = sqlite3_prepare_v2(self->_database, "DELETE FROM Assets WHERE localIdentifier=(?);", -1, &ppStmt, 0LL);
  if (!v5)
  {
    id v6 = ppStmt;
    id v7 = v4;
    id v8 = v7;
    int v9 = v7
    int v5 = v9;

    if (!v5)
    {
      id v10 = sqlite3_expanded_sql(ppStmt);
      int v12 = v10;
      if (v10)
      {
        uint64_t v13 = MediaAnalysisEnableDatabaseLog(v10, v11);
        if ((_DWORD)v13)
        {
          uint64_t v15 = VCPLogInstance(v13, v14);
          uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
            __int16 v22 = 1024;
            int v23 = 1289;
            __int16 v24 = 2080;
            uint64_t v25 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "[MADB] Statement: %s[line:%d]: %s",  buf,  0x1Cu);
          }
        }

        sqlite3_free(v12);
      }

      int v17 = sqlite3_step(ppStmt);
      if (v17 == 101) {
        int v5 = 0;
      }
      else {
        int v5 = v17;
      }
    }
  }

  sqlite3_finalize(ppStmt);

  return v5;
}

- (int)_storeProperties:(id)a3 forLocalIdentifier:(id)a4 assetId:(int64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  ppStmt = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vcp_fingerprint"));
  int v11 = sqlite3_prepare_v2( self->_database,  "REPLACE INTO Assets (localIdentifier, version, dateModified, dateAnalyzed, analysisTypes, flags, quality, mast erFingerprint, adjustedFingerprint, statsFlags) VALUES ((?), (?), (?), (?), (?), (?), (?), (?), (?), (?));",
          -1,
          &ppStmt,
          0LL);
  if (!v11)
  {
    int v12 = ppStmt;
    id v13 = v9;
    uint64_t v14 = v13;
    int v15 = v13
    int v11 = v15;

    if (!v11)
    {
      int v11 = sqlite3_bind_int(ppStmt, 2, (int)objc_msgSend(v8, "vcp_version"));
      if (!v11)
      {
        uint64_t v16 = ppStmt;
        id v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vcp_dateModified"));
        int v18 = v17;
        if (v17)
        {
          [v17 timeIntervalSinceReferenceDate];
          int v20 = sqlite3_bind_double(v16, 3, v19);
        }

        else
        {
          int v20 = sqlite3_bind_null(v16, 3);
        }

        int v11 = v20;

        if (!v11)
        {
          __int16 v21 = ppStmt;
          __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vcp_dateAnalyzed"));
          int v11 = sub_100030E6C(v21, 4, v22);

          if (!v11)
          {
            int v11 = sqlite3_bind_int64(ppStmt, 5, (sqlite3_int64)objc_msgSend(v8, "vcp_types"));
            if (!v11)
            {
              int v11 = sqlite3_bind_int(ppStmt, 6, (int)objc_msgSend(v8, "vcp_flags"));
              if (!v11)
              {
                int v23 = ppStmt;
                objc_msgSend(v8, "vcp_quality");
                int v11 = sqlite3_bind_double(v23, 7, v24);
                if (!v11)
                {
                  uint64_t v25 = ppStmt;
                  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v10 master]);
                  int v11 = sub_10002F540(v25, 8, v26);

                  if (!v11)
                  {
                    uint64_t v27 = ppStmt;
                    os_log_type_t v28 = (void *)objc_claimAutoreleasedReturnValue([v10 adjusted]);
                    int v11 = sub_10002F540(v27, 9, v28);

                    if (!v11)
                    {
                      int v11 = sqlite3_bind_int64(ppStmt, 10, (sqlite3_int64)objc_msgSend(v8, "vcp_statsFlags"));
                      if (!v11)
                      {
                        os_log_type_t v29 = sqlite3_expanded_sql(ppStmt);
                        id v31 = v29;
                        if (v29)
                        {
                          uint64_t v32 = MediaAnalysisEnableDatabaseLog(v29, v30);
                          if ((_DWORD)v32)
                          {
                            uint64_t v34 = VCPLogInstance(v32, v33);
                            uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
                            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
                            {
                              *(_DWORD *)buf = 136315650;
                              uint64_t v40 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
                              __int16 v41 = 1024;
                              int v42 = 1319;
                              __int16 v43 = 2080;
                              uint64_t v44 = v31;
                              _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEBUG,  "[MADB] Statement: %s[line:%d]: %s",  buf,  0x1Cu);
                            }
                          }

                          sqlite3_free(v31);
                        }

                        int v36 = sqlite3_step(ppStmt);
                        if (v36 == 101) {
                          int v11 = 0;
                        }
                        else {
                          int v11 = v36;
                        }
                        if (a5 && v36 == 101) {
                          *a5 = sqlite3_last_insert_rowid(self->_database);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  sqlite3_finalize(ppStmt);

  return v11;
}

- (int)_storeResult:(id)a3 withKey:(id)a4 forAssetId:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 isEqualToString:MediaAnalysisKeyFrameResourceResultsKey])
  {
LABEL_2:
    int v10 = 0;
    goto LABEL_24;
  }

  uint64_t v11 = MediaAnalysisResultsKeyToType(v9);
  int v13 = v11;
  if (!v11)
  {
    uint64_t v22 = MediaAnalysisLogLevel(0LL, v12);
    if ((int)v22 >= 4)
    {
      uint64_t v24 = VCPLogInstance(v22, v23);
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      os_log_type_t v26 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v25, v26))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v30 = (const char *)v9;
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "No results type for %@; dropping result", buf, 0xCu);
      }
    }

    goto LABEL_2;
  }

  if (v8)
  {
    ppStmt = 0LL;
    int v10 = sqlite3_prepare_v2( self->_database,  "REPLACE INTO Results (assetId, resultsType, results) VALUES ((?), (?), (?));",
            -1,
            &ppStmt,
            0LL);
    if (!v10)
    {
      int v10 = sqlite3_bind_int64(ppStmt, 1, a5);
      if (!v10)
      {
        int v10 = sqlite3_bind_int(ppStmt, 2, v13);
        if (!v10)
        {
          int v10 = sub_1000342F8(ppStmt, (uint64_t)v8);
          if (!v10)
          {
            uint64_t v14 = sqlite3_expanded_sql(ppStmt);
            uint64_t v16 = v14;
            if (v14)
            {
              uint64_t v17 = MediaAnalysisEnableDatabaseLog(v14, v15);
              if ((_DWORD)v17)
              {
                uint64_t v19 = VCPLogInstance(v17, v18);
                int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  uint64_t v30 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
                  __int16 v31 = 1024;
                  int v32 = 1351;
                  __int16 v33 = 2080;
                  uint64_t v34 = v16;
                  _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "[MADB] Statement: %s[line:%d]: %s",  buf,  0x1Cu);
                }
              }

              sqlite3_free(v16);
            }

            int v21 = sqlite3_step(ppStmt);
            if (v21 == 101) {
              int v10 = 0;
            }
            else {
              int v10 = v21;
            }
          }
        }
      }
    }

    sqlite3_finalize(ppStmt);
  }

  else
  {
    int v10 = -50;
  }

- (int)_storeAnalysis:(id)a3 forLocalIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vcp_results"));
  uint64_t v21 = 0LL;
  unsigned int v9 = sqlite3_exec(self->_database, "SAVEPOINT Analysis;", 0LL, 0LL, 0LL);
  if (v9) {
    goto LABEL_14;
  }
  unsigned int v9 = -[VCPDatabaseWriter _storeProperties:forLocalIdentifier:assetId:]( self,  "_storeProperties:forLocalIdentifier:assetId:",  v6,  v7,  &v21);
  if (v9) {
    goto LABEL_14;
  }
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  int v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allKeys", 0));
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v14]);
        unsigned int v9 = -[VCPDatabaseWriter _storeResult:withKey:forAssetId:]( self,  "_storeResult:withKey:forAssetId:",  v15,  v14,  v21);

        if (v9)
        {

          goto LABEL_14;
        }
      }

      id v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  unsigned int v9 = sqlite3_exec(self->_database, "RELEASE Analysis;", 0LL, 0LL, 0LL);
  if (v9) {
LABEL_14:
  }
    sqlite3_exec(self->_database, "ROLLBACK TO Analysis;", 0LL, 0LL, 0LL);

  return v9;
}

- (int)_deleteResult:(id)a3 forAssetId:(int64_t)a4
{
  id v6 = (char *)a3;
  uint64_t v7 = MediaAnalysisResultsKeyToType();
  int v9 = v7;
  if (v7)
  {
    ppStmt = 0LL;
    int v10 = sqlite3_prepare_v2( self->_database,  "DELETE FROM Results WHERE assetId=(?) AND resultsType=(?);",
            -1,
            &ppStmt,
            0LL);
    if (!v10)
    {
      int v10 = sqlite3_bind_int64(ppStmt, 1, a4);
      if (!v10)
      {
        int v10 = sqlite3_bind_int(ppStmt, 2, v9);
        if (!v10)
        {
          id v11 = sqlite3_expanded_sql(ppStmt);
          if (v11)
          {
            if (MediaAnalysisEnableDatabaseLog())
            {
              uint64_t v12 = VCPLogInstance();
              int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315650;
                uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
                __int16 v22 = 1024;
                int v23 = 1396;
                __int16 v24 = 2080;
                uint64_t v25 = v11;
                _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "[MADB] Statement: %s[line:%d]: %s",  buf,  0x1Cu);
              }
            }

            sqlite3_free(v11);
          }

          int v14 = sqlite3_step(ppStmt);
          if (v14 == 101) {
            int v10 = 0;
          }
          else {
            int v10 = v14;
          }
        }
      }
    }

    sqlite3_finalize(ppStmt);
  }

  else
  {
    if ((int)MediaAnalysisLogLevel(0LL, v8) >= 4)
    {
      uint64_t v15 = VCPLogInstance();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      os_log_type_t v17 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v16, v17))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v6;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "No results type for %@; can't delete", buf, 0xCu);
      }
    }

    int v10 = 0;
  }

  return v10;
}

- (int)_updateProperties:(id)a3 forAssetId:(int64_t)a4
{
  id v6 = a3;
  ppStmt = 0LL;
  int v7 = sqlite3_prepare_v2( self->_database,  "UPDATE Assets SET version=(?), dateModified=(?), dateAnalyzed=(?), analysisTypes=(?), flags=(?), quality=(?), s tatsFlags=(?) WHERE id=(?);",
         -1,
         &ppStmt,
         0LL);
  if (!v7)
  {
    int v7 = sqlite3_bind_int(ppStmt, 1, (int)objc_msgSend(v6, "vcp_version"));
    if (!v7)
    {
      uint64_t v8 = ppStmt;
      id v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vcp_dateModified"));
      int v10 = v9;
      if (v9)
      {
        [v9 timeIntervalSinceReferenceDate];
        int v12 = sqlite3_bind_double(v8, 2, v11);
      }

      else
      {
        int v12 = sqlite3_bind_null(v8, 2);
      }

      int v7 = v12;

      if (!v7)
      {
        int v13 = ppStmt;
        id v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vcp_dateAnalyzed"));
        uint64_t v15 = v14;
        if (v14)
        {
          [v14 timeIntervalSinceReferenceDate];
          int v17 = sqlite3_bind_double(v13, 3, v16);
        }

        else
        {
          int v17 = sqlite3_bind_null(v13, 3);
        }

        int v7 = v17;

        if (!v7)
        {
          int v7 = sqlite3_bind_int64(ppStmt, 4, (sqlite3_int64)objc_msgSend(v6, "vcp_types"));
          if (!v7)
          {
            int v7 = sqlite3_bind_int(ppStmt, 5, (int)objc_msgSend(v6, "vcp_flags"));
            if (!v7)
            {
              __int128 v18 = ppStmt;
              objc_msgSend(v6, "vcp_quality");
              int v7 = sqlite3_bind_double(v18, 6, v19);
              if (!v7)
              {
                int v7 = sqlite3_bind_int64(ppStmt, 7, (sqlite3_int64)objc_msgSend(v6, "vcp_statsFlags"));
                if (!v7)
                {
                  int v7 = sqlite3_bind_int64(ppStmt, 8, a4);
                  if (!v7)
                  {
                    __int128 v20 = sqlite3_expanded_sql(ppStmt);
                    __int16 v22 = v20;
                    if (v20)
                    {
                      uint64_t v23 = MediaAnalysisEnableDatabaseLog(v20, v21);
                      if ((_DWORD)v23)
                      {
                        uint64_t v25 = VCPLogInstance(v23, v24);
                        os_log_type_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
                        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 136315650;
                          __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
                          __int16 v32 = 1024;
                          int v33 = 1421;
                          __int16 v34 = 2080;
                          uint64_t v35 = v22;
                          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "[MADB] Statement: %s[line:%d]: %s",  buf,  0x1Cu);
                        }
                      }

                      sqlite3_free(v22);
                    }

                    int v27 = sqlite3_step(ppStmt);
                    if (v27 == 101) {
                      int v7 = 0;
                    }
                    else {
                      int v7 = v27;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  sqlite3_finalize(ppStmt);

  return v7;
}

- (int)_updateAnalysis:(id)a3 withAnalysis:(id)a4 forAsset:(id)a5 withAssetId:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v64 = v10;
  uint64_t v65 = v12;
  uint64_t v67 = MediaAnalysisTypesUpdatedSince(objc_msgSend(v10, "vcp_version"), v12);
  unint64_t v13 = (unint64_t)objc_msgSend(v10, "vcp_types");
  unint64_t v14 = (unint64_t)objc_msgSend(v11, "vcp_types");
  unint64_t v62 = (unint64_t)objc_msgSend(v10, "vcp_types");
  unint64_t v60 = (unint64_t)objc_msgSend(v11, "vcp_types");
  unint64_t v15 = (unint64_t)objc_msgSend(v11, "vcp_types");
  unint64_t v16 = (unint64_t)objc_msgSend(v10, "vcp_types");
  unint64_t v58 = (unint64_t)objc_msgSend(v11, "vcp_types");
  unint64_t v57 = (unint64_t)objc_msgSend(v10, "vcp_types");
  unint64_t v59 = v15 & ~v16;
  uint64_t v17 = v59 | v67;
  uint64_t v66 = MediaAnalysisFlagsForTypes(v59 | v67);
  if (objc_msgSend(v12, "vcp_isLivePhoto") && (VCPMAFullAnalysisTypesLivePhoto & v17) != 0
    || [v12 isVideo] && (VCPMAFullAnalysisTypesMovie & v17) != 0)
  {
    v66 |= 0x20000000uLL;
  }

  unint64_t v56 = (unint64_t)objc_msgSend(v10, "vcp_flags");
  unint64_t v55 = (unint64_t)objc_msgSend(v11, "vcp_flags");
  if ((v17 & 0x100000) != 0) {
    __int128 v18 = v11;
  }
  else {
    __int128 v18 = v10;
  }
  id v54 = objc_msgSend(v18, "vcp_statsFlags");
  objc_msgSend(v11, "vcp_quality");
  double v19 = v11;
  if (v20 == MediaAnalysisQualityUnknown)
  {
    signed int v21 = objc_msgSend(v10, "vcp_version");
    if (v21 >= MediaAnalysisChangedVersion3) {
      double v19 = v10;
    }
    else {
      double v19 = v11;
    }
  }

  objc_msgSend(v19, "vcp_quality");
  double v23 = v22;
  uint64_t v24 = MediaAnalysisResultsUpdatedSince(objc_msgSend(v10, "vcp_version"), v12);
  uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue(v24);
  unsigned int v25 = sqlite3_exec(self->_database, "SAVEPOINT Analysis;", 0LL, 0LL, 0LL);
  if (v25) {
    goto LABEL_51;
  }
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  uint64_t v26 = MediaAnalysisResultsKeysForAnalysisTypes(v13 & ~v14 & v67);
  int v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  id v28 = [v27 countByEnumeratingWithState:&v78 objects:v86 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v79;
LABEL_16:
    uint64_t v30 = 0LL;
    while (1)
    {
      if (*(void *)v79 != v29) {
        objc_enumerationMutation(v27);
      }
      unsigned int v25 = -[VCPDatabaseWriter _deleteResult:forAssetId:]( self,  "_deleteResult:forAssetId:",  *(void *)(*((void *)&v78 + 1) + 8 * v30),  a6);
      if (v25) {
        goto LABEL_50;
      }
      if (v28 == (id)++v30)
      {
        id v28 = [v27 countByEnumeratingWithState:&v78 objects:v86 count:16];
        if (v28) {
          goto LABEL_16;
        }
        break;
      }
    }
  }

  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  uint64_t v31 = MediaAnalysisResultsKeysForAnalysisTypes(v62 & v60 & v67);
  int v27 = (void *)objc_claimAutoreleasedReturnValue(v31);
  id v32 = [v27 countByEnumeratingWithState:&v74 objects:v85 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v75;
    do
    {
      for (i = 0LL; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v75 != v33) {
          objc_enumerationMutation(v27);
        }
        uint64_t v35 = *(void *)(*((void *)&v74 + 1) + 8LL * (void)i);
        if ([v69 containsObject:v35])
        {
          int v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "vcp_results"));
          unint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKey:v35]);

          if (v37) {
            unsigned int v38 = -[VCPDatabaseWriter _storeResult:withKey:forAssetId:]( self,  "_storeResult:withKey:forAssetId:",  v37,  v35,  a6);
          }
          else {
            unsigned int v38 = -[VCPDatabaseWriter _deleteResult:forAssetId:](self, "_deleteResult:forAssetId:", v35, a6);
          }
          unsigned int v25 = v38;
          if (v38) {
            goto LABEL_49;
          }
        }
      }

      id v32 = [v27 countByEnumeratingWithState:&v74 objects:v85 count:16];
    }

    while (v32);
  }

  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  uint64_t v39 = MediaAnalysisResultsKeysForAnalysisTypes(v59);
  int v27 = (void *)objc_claimAutoreleasedReturnValue(v39);
  id v40 = [v27 countByEnumeratingWithState:&v70 objects:v84 count:16];
  if (v40)
  {
    uint64_t v41 = *(void *)v71;
LABEL_37:
    uint64_t v42 = 0LL;
    while (1)
    {
      if (*(void *)v71 != v41) {
        objc_enumerationMutation(v27);
      }
      uint64_t v43 = *(void *)(*((void *)&v70 + 1) + 8 * v42);
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "vcp_results"));
      unint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKey:v43]);

      unsigned int v45 = v37
          ? -[VCPDatabaseWriter _storeResult:withKey:forAssetId:]( self,  "_storeResult:withKey:forAssetId:",  v37,  v43,  a6)
          : -[VCPDatabaseWriter _deleteResult:forAssetId:](self, "_deleteResult:forAssetId:", v43, a6);
      unsigned int v25 = v45;
      if (v45) {
        break;
      }

      if (v40 == (id)++v42)
      {
        id v40 = [v27 countByEnumeratingWithState:&v70 objects:v84 count:16];
        if (v40) {
          goto LABEL_37;
        }
        goto LABEL_46;
      }
    }

- (int)updateResultsForAsset:(id)a3 results:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 localIdentifier]);
  ppStmt = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"SELECT id FROM Assets WHERE localIdentifier=?"));
  database = self->_database;
  id v11 = v9;
  unsigned int v12 = sqlite3_prepare_v2(database, (const char *)[v11 UTF8String], -1, &ppStmt, 0);
  if (!v12)
  {
    unint64_t v13 = ppStmt;
    id v14 = v8;
    unint64_t v15 = v14;
    int v16 = v14
    unsigned int v12 = v16;

    if (!v12)
    {
      uint64_t v17 = sqlite3_expanded_sql(ppStmt);
      double v19 = v17;
      if (v17)
      {
        uint64_t v20 = MediaAnalysisEnableDatabaseLog(v17, v18);
        if ((_DWORD)v20)
        {
          uint64_t v22 = VCPLogInstance(v20, v21);
          double v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            unint64_t v47 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
            __int16 v48 = 1024;
            int v49 = 1519;
            __int16 v50 = 2080;
            os_log_type_t v51 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "[MADB] Statement: %s[line:%d]: %s",  buf,  0x1Cu);
          }
        }

        sqlite3_free(v19);
      }

      unsigned int v12 = sqlite3_step(ppStmt);
      if (v12 != 100) {
        goto LABEL_24;
      }
      int v24 = sqlite3_column_int(ppStmt, 0);
      unsigned int v12 = sqlite3_step(ppStmt);
      if (v12 != 101) {
        goto LABEL_24;
      }
      unsigned int v12 = sqlite3_exec(self->_database, "SAVEPOINT Analysis;", 0LL, 0LL, 0LL);
      if (!v12)
      {
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue([v7 allKeys]);
        id v25 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (v25)
        {
          uint64_t v38 = v24;
          uint64_t v39 = *(void *)v41;
          while (2)
          {
            for (i = 0LL; i != v25; i = (char *)i + 1)
            {
              if (*(void *)v41 != v39) {
                objc_enumerationMutation(obj);
              }
              uint64_t v27 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)i);
              id v28 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v27]);
              unsigned int v12 = -[VCPDatabaseWriter _storeResult:withKey:forAssetId:]( self,  "_storeResult:withKey:forAssetId:",  v28,  v27,  v38);

              if (v12)
              {

                goto LABEL_25;
              }
            }

            id v25 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
            if (v25) {
              continue;
            }
            break;
          }
        }

        unsigned int v12 = sqlite3_exec(self->_database, "RELEASE Analysis;", 0LL, 0LL, 0LL);
LABEL_24:
        if (!v12) {
          goto LABEL_29;
        }
      }
    }
  }

- (int)storeAnalysisForAsset:(id)a3 analysis:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = MediaAnalysisEnableDatabaseLog(v7, v8);
  if ((_DWORD)v9)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v34 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v35 = 1024;
      int v36 = 1543;
      __int16 v37 = 2080;
      uint64_t v38 = "-[VCPDatabaseWriter(MediaAnalysis) storeAnalysisForAsset:analysis:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 localIdentifier]);
  id v14 = objc_msgSend(v6, "vcp_isAnalysisValid:", v7);
  if ((v14 & 1) != 0)
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100035BC4;
    v29[3] = &unk_1001BAA60;
    v29[4] = self;
    id v30 = v13;
    id v31 = v7;
    id v32 = v6;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100035EA0;
    v25[3] = &unk_1001BAA60;
    v25[4] = self;
    id v26 = v31;
    id v27 = v32;
    id v28 = v30;
    int v16 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v29,  v25,  1LL);
  }

  else
  {
    uint64_t v17 = MediaAnalysisLogLevel(v14, v15);
    if ((int)v17 >= 3)
    {
      uint64_t v19 = VCPLogInstance(v17, v18);
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      os_log_type_t v21 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v20, v21))
      {
        unsigned int v22 = objc_msgSend(v7, "vcp_version");
        double v23 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vcp_dateModified"));
        *(_DWORD *)buf = 138412802;
        __int16 v34 = (const char *)v13;
        __int16 v35 = 1024;
        int v36 = v22;
        __int16 v37 = 2112;
        uint64_t v38 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  v21,  "[%@] Cannot store invalid analysis (v%d) with %@",  buf,  0x1Cu);
      }
    }

    int v16 = -18;
  }

  return v16;
}

- (int)bumpAnalysisVersionForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MediaAnalysisEnableDatabaseLog(v4, v5);
  if ((_DWORD)v6)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v16 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v17 = 1024;
      int v18 = 1603;
      __int16 v19 = 2080;
      uint64_t v20 = "-[VCPDatabaseWriter(MediaAnalysis) bumpAnalysisVersionForAsset:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100036124;
  v13[3] = &unk_1001BA988;
  v13[4] = self;
  id v10 = v4;
  id v14 = v10;
  int v11 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v13,  0LL,  1LL);

  return v11;
}

- (int)_queryPropertiesForAsset:(id)a3 assetId:(int64_t *)a4 analysis:(id *)a5
{
  id v8 = a3;
  ppStmt = 0LL;
  int v9 = sqlite3_prepare_v2( self->_database,  "SELECT id, version, dateModified, dateAnalyzed, analysisTypes, flags, quality, masterFingerprint, adjustedFinge rprint, statsFlags FROM Assets WHERE localIdentifier=(?);",
         -1,
         &ppStmt,
         0LL);
  if (v9) {
    goto LABEL_40;
  }
  id v10 = ppStmt;
  id v11 = v8;
  unsigned int v12 = v11;
  int v13 = v11
  int v9 = v13;

  if (v9) {
    goto LABEL_40;
  }
  id v14 = sqlite3_expanded_sql(ppStmt);
  int v16 = v14;
  if (v14)
  {
    uint64_t v17 = MediaAnalysisEnableDatabaseLog(v14, v15);
    if ((_DWORD)v17)
    {
      uint64_t v19 = VCPLogInstance(v17, v18);
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v64 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v65 = 1024;
        int v66 = 1633;
        __int16 v67 = 2080;
        uint64_t v68 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "[MADB] Statement: %s[line:%d]: %s",  buf,  0x1Cu);
      }
    }

    sqlite3_free(v16);
  }

  int v21 = sqlite3_step(ppStmt);
  if (v21 != 100) {
    goto LABEL_37;
  }
  unsigned int v22 = ppStmt;
  if (sqlite3_column_type(ppStmt, 2) == 5)
  {
    double v23 = 0LL;
  }

  else
  {
    int v24 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  sqlite3_column_double(v22, 2));
    double v23 = (void *)objc_claimAutoreleasedReturnValue(v24);
  }

  id v25 = ppStmt;
  uint64_t v26 = sqlite3_column_type(ppStmt, 3);
  if ((_DWORD)v26 != 5)
  {
    __int16 v34 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  sqlite3_column_double(v25, 3));
    uint64_t v26 = objc_claimAutoreleasedReturnValue(v34);
    id v28 = (void *)v26;
    if (!v23 || !v26) {
      goto LABEL_18;
    }
    *a4 = sqlite3_column_int(ppStmt, 0);
    id v35 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    *a5 = v35;
    int v36 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", sqlite3_column_int(ppStmt, 1));
    __int16 v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    [v35 setObject:v37 forKey:MediaAnalysisVersionKey];

    [*a5 setObject:v23 forKey:MediaAnalysisDateModifiedKey];
    [*a5 setObject:v28 forKey:MediaAnalysisDateAnalyzedKey];
    id v38 = *a5;
    uint64_t v39 = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  sqlite3_column_int64(ppStmt, 4));
    __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    uint64_t v41 = MediaAnalysisAnalysisTypesKey;
    [v38 setObject:v40 forKey:MediaAnalysisAnalysisTypesKey];

    id v42 = *a5;
    __int128 v43 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", sqlite3_column_int(ppStmt, 5));
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    [v42 setObject:v44 forKey:MediaAnalysisFlagsKey];

    if (sqlite3_column_double(ppStmt, 6) != MediaAnalysisQualityUnknown)
    {
      id v45 = *a5;
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      [v45 setObject:v46 forKey:MediaAnalysisQualityKey];
    }

    id v47 = *a5;
    __int16 v48 = ppStmt;
    if (sqlite3_column_type(ppStmt, 7) == 5)
    {
      int v49 = 0LL;
    }

    else
    {
      __int16 v50 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  sqlite3_column_text(v48, 7));
      int v49 = (void *)objc_claimAutoreleasedReturnValue(v50);
    }

    os_log_type_t v51 = ppStmt;
    if (sqlite3_column_type(ppStmt, 8) == 5)
    {
      uint64_t v52 = 0LL;
    }

    else
    {
      int v53 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  sqlite3_column_text(v51, 8));
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(v53);
    }

    id v54 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFingerprint fingerprintWithMaster:adjusted:]( &OBJC_CLASS___VCPFingerprint,  "fingerprintWithMaster:adjusted:",  v49,  v52));
    objc_msgSend(v47, "vcp_setFingerprint:", v54);

    id v55 = *a5;
    unint64_t v56 = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  sqlite3_column_int64(ppStmt, 9));
    unint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
    [v55 setObject:v57 forKey:MediaAnalysisStatsFlagsKey];

    signed int v58 = objc_msgSend(*a5, "vcp_version");
    if (v58 < MediaAnalysisChangedVersion3 && (objc_msgSend(*a5, "vcp_types") & 4) != 0)
    {
      id v59 = *a5;
      unint64_t v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  (unint64_t)objc_msgSend(*a5, "vcp_types") | 8));
      [v59 setObject:v60 forKey:v41];
    }

    int v21 = sqlite3_step(ppStmt);

LABEL_37:
    if (v21 == 101) {
      int v9 = 0;
    }
    else {
      int v9 = v21;
    }
    goto LABEL_40;
  }

  id v28 = 0LL;
LABEL_18:
  uint64_t v29 = MediaAnalysisLogLevel(v26, v27);
  if ((int)v29 >= 3)
  {
    uint64_t v31 = VCPLogInstance(v29, v30);
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    os_log_type_t v33 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v32, v33))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v64 = (const char *)v12;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  v33,  "[%@] Existing analysis contains nil date; ignoring ...",
        buf,
        0xCu);
    }
  }

  int v9 = 0;
LABEL_40:
  sqlite3_finalize(ppStmt);
  if (v9) {
    *a5 = 0LL;
  }

  return v9;
}

- (int)_queryResultsForAssetId:(int64_t)a3 analysis:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  ppStmt = 0LL;
  int v8 = sqlite3_prepare_v2( self->_database,  "SELECT resultsType, results FROM Results WHERE assetId=(?);",
         -1,
         &ppStmt,
         0LL);
  if (!v8)
  {
    int v8 = sqlite3_bind_int64(ppStmt, 1, a3);
    if (!v8)
    {
      id v10 = sqlite3_expanded_sql(ppStmt);
      unsigned int v12 = v10;
      if (v10)
      {
        uint64_t v13 = MediaAnalysisEnableDatabaseLog(v10, v11);
        if ((_DWORD)v13)
        {
          uint64_t v15 = VCPLogInstance(v13, v14);
          int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            os_log_type_t v33 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
            __int16 v34 = 1024;
            int v35 = 1691;
            __int16 v36 = 2080;
            __int16 v37 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "[MADB] Statement: %s[line:%d]: %s",  buf,  0x1Cu);
          }
        }

        sqlite3_free(v12);
      }

      int v8 = sqlite3_step(ppStmt);
      while (v8 == 100)
      {
        int v17 = sqlite3_column_int(ppStmt, 0);
        id v18 = sub_100036D0C(ppStmt, 1);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v18);
        uint64_t v21 = v17;
        if (!v20)
        {
          uint64_t v24 = MediaAnalysisLogLevel(0LL, v19);
          if ((int)v24 >= 3)
          {
            uint64_t v26 = VCPLogInstance(v24, v25);
            uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            os_log_type_t v28 = VCPLogToOSLogType[3];
            if (os_log_type_enabled(v27, v28))
            {
              uint64_t v29 = MediaAnalysisResultsTypeToKey(v21);
              uint64_t v30 = (char *)objc_claimAutoreleasedReturnValue(v29);
              *(_DWORD *)buf = 138412290;
              os_log_type_t v33 = v30;
              _os_log_impl((void *)&_mh_execute_header, v27, v28, "Cannot load result type: %@", buf, 0xCu);
            }
          }

          int v8 = -18;
          goto LABEL_3;
        }

        uint64_t v22 = MediaAnalysisResultsTypeToKey(v17);
        double v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        if (v23) {
          [v7 setObject:v20 forKey:v23];
        }
        int v8 = sqlite3_step(ppStmt);
      }

      if (v8 == 101)
      {
        if ([v7 count]) {
          [v6 setObject:v7 forKey:MediaAnalysisResultsKey];
        }
        int v8 = 0;
      }
    }
  }

- (int)analysisForAsset:(id)a3 analysis:(id *)a4
{
  id v6 = a3;
  uint64_t v8 = MediaAnalysisEnableDatabaseLog(v6, v7);
  if ((_DWORD)v8)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v20 = 1024;
      int v21 = 1724;
      __int16 v22 = 2080;
      double v23 = "-[VCPDatabaseWriter(MediaAnalysis) analysisForAsset:analysis:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10003704C;
  v15[3] = &unk_1001BA9B0;
  int v17 = a4;
  v15[4] = self;
  id v12 = v6;
  id v16 = v12;
  int v13 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v15,  0LL,  0LL);

  return v13;
}

- (int)deleteAnalysisForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MediaAnalysisEnableDatabaseLog(v4, v5);
  if ((_DWORD)v6)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v16 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v17 = 1024;
      int v18 = 1746;
      __int16 v19 = 2080;
      __int16 v20 = "-[VCPDatabaseWriter(MediaAnalysis) deleteAnalysisForAsset:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000372DC;
  v13[3] = &unk_1001BA988;
  v13[4] = self;
  id v10 = v4;
  id v14 = v10;
  int v11 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v13,  0LL,  1LL);

  return v11;
}

- (int)queryAnalysisResultWithType:(unint64_t)a3 forAsset:(id)a4 result:(id *)a5
{
  id v8 = a4;
  uint64_t v10 = MediaAnalysisEnableDatabaseLog(v8, v9);
  if ((_DWORD)v10)
  {
    uint64_t v12 = VCPLogInstance(v10, v11);
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v23 = 1024;
      int v24 = 1757;
      __int16 v25 = 2080;
      uint64_t v26 = "-[VCPDatabaseWriter(MediaAnalysis) queryAnalysisResultWithType:forAsset:result:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100037544;
  v17[3] = &unk_1001BAA88;
  v17[4] = self;
  unint64_t v19 = a3;
  id v14 = v8;
  id v18 = v14;
  __int16 v20 = a5;
  int v15 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v17,  0LL,  0LL);

  return v15;
}

- (int)queryAnalysisResultsForAssets:(id)a3 results:(id *)a4
{
  id v6 = a3;
  uint64_t v8 = MediaAnalysisEnableDatabaseLog(v6, v7);
  if ((_DWORD)v8)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v26 = 1024;
      int v27 = 1789;
      __int16 v28 = 2080;
      uint64_t v29 = "-[VCPDatabaseWriter(MediaAnalysis) queryAnalysisResultsForAssets:results:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  if ([v6 count])
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000379AC;
    v20[3] = &unk_1001BA9B0;
    int v21 = (os_log_s *)v6;
    __int16 v22 = self;
    __int16 v23 = a4;
    int v13 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v20,  0LL,  0LL);
    id v14 = v21;
  }

  else
  {
    uint64_t v15 = MediaAnalysisLogLevel(0LL, v12);
    if ((int)v15 < 4)
    {
      int v13 = 0;
      goto LABEL_12;
    }

    uint64_t v17 = VCPLogInstance(v15, v16);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    os_log_type_t v18 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v14, v18))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  v18,  "No local identifiers provided; return empty analyses",
        buf,
        2u);
    }

    int v13 = 0;
  }

LABEL_12:
  return v13;
}

- (int)_getBlacklistExpiredCount:(id)a3 count:(int *)a4
{
  id v6 = a3;
  ppStmt = 0LL;
  int v7 = sqlite3_prepare_v2(self->_database, "SELECT count(*) FROM Blacklist WHERE date<=(?);", -1, &ppStmt, 0LL);
  if (!v7)
  {
    uint64_t v8 = ppStmt;
    id v9 = v6;
    uint64_t v10 = v9;
    if (v9)
    {
      [v9 timeIntervalSinceReferenceDate];
      int v12 = sqlite3_bind_double(v8, 1, v11);
    }

    else
    {
      int v12 = sqlite3_bind_null(v8, 1);
    }

    int v7 = v12;

    if (!v7)
    {
      int v13 = sqlite3_expanded_sql(ppStmt);
      uint64_t v15 = v13;
      if (v13)
      {
        uint64_t v16 = MediaAnalysisEnableDatabaseLog(v13, v14);
        if ((_DWORD)v16)
        {
          uint64_t v18 = VCPLogInstance(v16, v17);
          unint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
            __int16 v24 = 1024;
            int v25 = 1866;
            __int16 v26 = 2080;
            int v27 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "[MADB] Statement: %s[line:%d]: %s",  buf,  0x1Cu);
          }
        }

        sqlite3_free(v15);
      }

      int v7 = sqlite3_step(ppStmt);
      if (v7 == 100)
      {
        int v7 = 0;
        *a4 = sqlite3_column_int(ppStmt, 0);
      }
    }
  }

  sqlite3_finalize(ppStmt);

  return v7;
}

- (int)ageOutBlacklistBefore:(id)a3 count:(int *)a4
{
  id v6 = a3;
  uint64_t v8 = MediaAnalysisEnableDatabaseLog(v6, v7);
  if ((_DWORD)v8)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      unint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v20 = 1024;
      int v21 = 1876;
      __int16 v22 = 2080;
      __int16 v23 = "-[VCPDatabaseWriter(Blacklist) ageOutBlacklistBefore:count:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000382E8;
  v15[3] = &unk_1001BA9B0;
  v15[4] = self;
  id v12 = v6;
  id v16 = v12;
  uint64_t v17 = a4;
  int v13 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v15,  0LL,  1LL);

  return v13;
}

- (int)_getBlacklistCountForLocalIdentifier:(id)a3 count:(int *)a4
{
  id v6 = a3;
  ppStmt = 0LL;
  int v7 = sqlite3_prepare_v2(self->_database, "SELECT count FROM Blacklist WHERE localIdentifier=(?);", -1, &ppStmt, 0LL);
  if (!v7)
  {
    uint64_t v8 = ppStmt;
    id v9 = v6;
    uint64_t v10 = v9;
    int v11 = v9
    int v7 = v11;

    if (!v7)
    {
      id v12 = sqlite3_expanded_sql(ppStmt);
      uint64_t v14 = v12;
      if (v12)
      {
        uint64_t v15 = MediaAnalysisEnableDatabaseLog(v12, v13);
        if ((_DWORD)v15)
        {
          uint64_t v17 = VCPLogInstance(v15, v16);
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
            __int16 v24 = 1024;
            int v25 = 1901;
            __int16 v26 = 2080;
            int v27 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "[MADB] Statement: %s[line:%d]: %s",  buf,  0x1Cu);
          }
        }

        sqlite3_free(v14);
      }

      int v19 = sqlite3_step(ppStmt);
      int v7 = v19;
      if (v19 == 101)
      {
        *a4 = 0;
      }

      else
      {
        if (v19 != 100) {
          goto LABEL_18;
        }
        *a4 = sqlite3_column_int(ppStmt, 0);
        int v7 = sqlite3_step(ppStmt);
        if (v7 != 101) {
          goto LABEL_18;
        }
      }

      int v7 = 0;
    }
  }

- (int)getBlacklistCountForLocalIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MediaAnalysisEnableDatabaseLog(v4, v5);
  if ((_DWORD)v6)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1920;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(Blacklist) getBlacklistCountForLocalIdentifier:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  *(_DWORD *)&buf[24] = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10003883C;
  v13[3] = &unk_1001BA9F8;
  v13[4] = self;
  id v10 = v4;
  id v14 = v10;
  uint64_t v15 = buf;
  -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v13,  0LL,  0LL);
  int v11 = *(_DWORD *)(*(void *)&buf[8] + 24LL);

  _Block_object_dispose(buf, 8);
  return v11;
}

- (int)addAssetToBlacklist:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MediaAnalysisEnableDatabaseLog(v4, v5);
  if ((_DWORD)v6)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v21 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v22 = 1024;
      int v23 = 1929;
      __int16 v24 = 2080;
      int v25 = "-[VCPDatabaseWriter(Blacklist) addAssetToBlacklist:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  uint64_t v16 = sub_1000389DC;
  uint64_t v17 = &unk_1001BA988;
  uint64_t v18 = self;
  id v10 = v4;
  id v19 = v10;
  int v11 = objc_retainBlock(&v14);
  int v12 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v11,  v11,  1LL,  v14,  v15,  v16,  v17,  v18);

  return v12;
}

- (int)decrementBlacklistCountForLocalIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MediaAnalysisEnableDatabaseLog(v4, v5);
  if ((_DWORD)v6)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v17 = 1024;
      int v18 = 1957;
      __int16 v19 = 2080;
      __int16 v20 = "-[VCPDatabaseWriter(Blacklist) decrementBlacklistCountForLocalIdentifier:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100038DB8;
  v13[3] = &unk_1001BA988;
  v13[4] = self;
  id v10 = v4;
  id v14 = v10;
  int v11 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v13,  0LL,  1LL);

  return v11;
}

- (int)removeLocalIdentifierFromBlacklist:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MediaAnalysisEnableDatabaseLog(v4, v5);
  if ((_DWORD)v6)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v17 = 1024;
      int v18 = 1991;
      __int16 v19 = 2080;
      __int16 v20 = "-[VCPDatabaseWriter(Blacklist) removeLocalIdentifierFromBlacklist:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000392B0;
  v13[3] = &unk_1001BA988;
  v13[4] = self;
  id v10 = v4;
  id v14 = v10;
  int v11 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v13,  0LL,  1LL);

  return v11;
}

- (int)getBlacklistSizeForThreshold:(int)a3 size:(unint64_t *)a4
{
  uint64_t v7 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v7)
  {
    uint64_t v9 = VCPLogInstance(v7, v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v16 = 1024;
      int v17 = 2008;
      __int16 v18 = 2080;
      __int16 v19 = "-[VCPDatabaseWriter(Blacklist) getBlacklistSizeForThreshold:size:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100039580;
  v12[3] = &unk_1001BAAB0;
  int v13 = a3;
  v12[4] = self;
  v12[5] = a4;
  return -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v12,  &stru_1001BAAD0,  0LL);
}

- (int)getBlacklistedAssetsWithCount:(int)a3 localIdentifiers:(id *)a4
{
  uint64_t v7 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v7)
  {
    uint64_t v9 = VCPLogInstance(v7, v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2026;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(Blacklist) getBlacklistedAssetsWithCount:localIdentifiers:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  *(void *)&buf[24] = sub_100030C00;
  __int16 v16 = sub_100030C10;
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000398B4;
  v13[3] = &unk_1001BAAF8;
  int v14 = a3;
  v13[4] = self;
  void v13[5] = buf;
  int v11 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v13,  0LL,  0LL);
  *a4 = *(id *)(*(void *)&buf[8] + 40LL);
  _Block_object_dispose(buf, 8);

  return v11;
}

+ (id)assetTypePredicatesStringWithMediaType:(int64_t)a3 mediaSubtypes:(unint64_t)a4 imageOnlyAnalysis:(BOOL)a5
{
  uint64_t v5 = 0LL;
  if ((unint64_t)(a3 - 3) >= 0xFFFFFFFFFFFFFFFELL && !a5)
  {
    char v6 = a4;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"AND mediaType=(%ld) ",  a3));
    uint64_t v5 = v8;
    if (a3 == 1)
    {
      [v8 appendString:@"AND "];
      if ((v6 & 8) == 0) {
        [v5 appendString:@"NOT "];
      }
      objc_msgSend(v5, "appendFormat:", @"(mediaSubtypes & (%lu)) ", 8);
    }
  }

  return v5;
}

- (int)queryAssetCountForTaskID:(unint64_t)a3
{
  uint64_t v5 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v5)
  {
    uint64_t v7 = VCPLogInstance(v5, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2083;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(ProcessingStatus) queryAssetCountForTaskID:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  *(_DWORD *)&buf[24] = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100039D64;
  v11[3] = &unk_1001BAB20;
  v11[5] = buf;
  v11[6] = a3;
  v11[4] = self;
  -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v11,  0LL,  0LL);
  int v9 = *(_DWORD *)(*(void *)&buf[8] + 24LL);
  _Block_object_dispose(buf, 8);
  return v9;
}

- (int)queryAssetCountForTaskID:(unint64_t)a3 withStatus:(unint64_t)a4
{
  uint64_t v7 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v7)
  {
    uint64_t v9 = VCPLogInstance(v7, v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2108;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(ProcessingStatus) queryAssetCountForTaskID:withStatus:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  *(_DWORD *)&buf[24] = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10003A054;
  v13[3] = &unk_1001BA898;
  void v13[6] = a3;
  v13[7] = a4;
  v13[4] = self;
  void v13[5] = buf;
  -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v13,  0LL,  0LL);
  int v11 = *(_DWORD *)(*(void *)&buf[8] + 24LL);
  _Block_object_dispose(buf, 8);
  return v11;
}

- (int)queryAssetCountForTaskID:(unint64_t)a3 withStatus:(unint64_t)a4 andAttempts:(int)a5
{
  uint64_t v9 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v9)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2134;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(ProcessingStatus) queryAssetCountForTaskID:withStatus:andAttempts:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  *(_DWORD *)&buf[24] = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10003A36C;
  v15[3] = &unk_1001BAB48;
  v15[6] = a3;
  v15[7] = a4;
  int v16 = a5;
  v15[4] = self;
  void v15[5] = buf;
  -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v15,  0LL,  0LL);
  int v13 = *(_DWORD *)(*(void *)&buf[8] + 24LL);
  _Block_object_dispose(buf, 8);
  return v13;
}

- (int)queryAttemptsForLocalIdentifier:(id)a3 andTaskID:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v8 = MediaAnalysisEnableDatabaseLog(v6, v7);
  if ((_DWORD)v8)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2161;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(ProcessingStatus) queryAttemptsForLocalIdentifier:andTaskID:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  *(_DWORD *)&buf[24] = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10003A6C0;
  v15[3] = &unk_1001BAB70;
  v15[4] = self;
  unint64_t v18 = a4;
  id v12 = v6;
  id v16 = v12;
  id v17 = buf;
  -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v15,  0LL,  0LL);
  int v13 = *(_DWORD *)(*(void *)&buf[8] + 24LL);

  _Block_object_dispose(buf, 8);
  return v13;
}

- (int)queryProcessingStatus:(unint64_t *)a3 attempts:(int *)a4 lastAttemptDate:(id *)a5 andNextAttemptDate:(id *)a6 forLocalIdentifier:(id)a7 andTaskID:(unint64_t)a8
{
  id v14 = a7;
  uint64_t v16 = MediaAnalysisEnableDatabaseLog(v14, v15);
  if ((_DWORD)v16)
  {
    uint64_t v18 = VCPLogInstance(v16, v17);
    __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v32 = 1024;
      int v33 = 2195;
      __int16 v34 = 2080;
      int v35 = "-[VCPDatabaseWriter(ProcessingStatus) queryProcessingStatus:attempts:lastAttemptDate:andNextAttemptDate:forL"
            "ocalIdentifier:andTaskID:]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10003AA68;
  v23[3] = &unk_1001BAB98;
  v23[4] = self;
  unint64_t v25 = a8;
  id v20 = v14;
  id v24 = v20;
  __int16 v26 = a3;
  int v27 = a4;
  __int16 v28 = a5;
  uint64_t v29 = a6;
  int v21 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v23,  0LL,  0LL);

  return v21;
}

- (unint64_t)queryEligibleToRetryAssetCountWithTaskID:(unint64_t)a3
{
  uint64_t v5 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v5)
  {
    uint64_t v7 = VCPLogInstance(v5, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 136315650;
      uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v19 = 1024;
      int v20 = 2228;
      __int16 v21 = 2080;
      __int16 v22 = "-[VCPDatabaseWriter(ProcessingStatus) queryEligibleToRetryAssetCountWithTaskID:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "[MADB] Executing: %s[line:%d]: %s",  (uint8_t *)&v17,  0x1Cu);
    }
  }

  unint64_t v9 = -[VCPDatabaseWriter queryEligibleToRetryAssetCountWithProcessingStatus:andTaskID:]( self,  "queryEligibleToRetryAssetCountWithProcessingStatus:andTaskID:",  0LL,  a3);
  unint64_t v10 = -[VCPDatabaseWriter queryEligibleToRetryAssetCountWithProcessingStatus:andTaskID:]( self,  "queryEligibleToRetryAssetCountWithProcessingStatus:andTaskID:",  1LL,  a3);
  unint64_t v11 = -[VCPDatabaseWriter queryEligibleToRetryAssetCountWithProcessingStatus:andTaskID:]( self,  "queryEligibleToRetryAssetCountWithProcessingStatus:andTaskID:",  2LL,  a3);
  unint64_t v12 = -[VCPDatabaseWriter queryEligibleToRetryAssetCountWithProcessingStatus:andTaskID:]( self,  "queryEligibleToRetryAssetCountWithProcessingStatus:andTaskID:",  3LL,  a3);
  unint64_t v13 = -[VCPDatabaseWriter queryEligibleToRetryAssetCountWithProcessingStatus:andTaskID:]( self,  "queryEligibleToRetryAssetCountWithProcessingStatus:andTaskID:",  4LL,  a3);
  unint64_t v14 = -[VCPDatabaseWriter queryEligibleToRetryAssetCountWithProcessingStatus:andTaskID:]( self,  "queryEligibleToRetryAssetCountWithProcessingStatus:andTaskID:",  5LL,  a3);
  unint64_t v15 = -[VCPDatabaseWriter queryEligibleToRetryAssetCountWithProcessingStatus:andTaskID:]( self,  "queryEligibleToRetryAssetCountWithProcessingStatus:andTaskID:",  6LL,  a3);
  return -[VCPDatabaseWriter queryEligibleToRetryAssetCountWithProcessingStatus:andTaskID:]( self,  "queryEligibleToRetryAssetCountWithProcessingStatus:andTaskID:",  7LL,  a3)
       + v10
       + v9
       + v11
       + v12
       + v13
       + v14
       + v15;
}

- (unint64_t)queryEligibleToRetryAssetCountWithProcessingStatus:(unint64_t)a3 andTaskID:(unint64_t)a4
{
  uint64_t v7 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v7)
  {
    uint64_t v9 = VCPLogInstance(v7, v8);
    unint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2240;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(ProcessingStatus) queryEligibleToRetryAssetCountWithProcessingStatus:andTaskID:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  *(void *)&buf[24] = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10003B04C;
  v13[3] = &unk_1001BA898;
  void v13[6] = a4;
  v13[7] = a3;
  v13[4] = self;
  void v13[5] = buf;
  -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v13,  0LL,  0LL);
  unint64_t v11 = *(void *)(*(void *)&buf[8] + 24LL);
  _Block_object_dispose(buf, 8);
  return v11;
}

- (int)fetchEligibleToRetryLocalIdentifiers:(id *)a3 processingStatus:(unint64_t)a4 taskID:(unint64_t)a5 fetchLimit:(unint64_t)a6 additionalPredicates:(id)a7
{
  id v12 = a7;
  unint64_t v14 = v12;
  if (a3)
  {
    uint64_t v15 = MediaAnalysisEnableDatabaseLog(v12, v13);
    if ((_DWORD)v15)
    {
      uint64_t v17 = VCPLogInstance(v15, v16);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v30 = 1024;
        int v31 = 2274;
        __int16 v32 = 2080;
        int v33 = "-[VCPDatabaseWriter(ProcessingStatus) fetchEligibleToRetryLocalIdentifiers:processingStatus:taskID:fetchLi"
              "mit:additionalPredicates:]";
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "[MADB] Executing: %s[line:%d]: %s",  buf,  0x1Cu);
      }
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10003B458;
    v21[3] = &unk_1001BABC0;
    id v22 = v14;
    int v23 = self;
    unint64_t v24 = a5;
    unint64_t v25 = a4;
    unint64_t v26 = a6;
    int v27 = a3;
    int v19 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v21,  0LL,  0LL);
  }

  else
  {
    int v19 = -50;
  }

  return v19;
}

- (int)fetchEligibleToRetryLocalIdentifiers:(id *)a3 withProcessingStatus:(unint64_t)a4 andTaskID:(unint64_t)a5 andFetchLimit:(unint64_t)a6
{
  return -[VCPDatabaseWriter fetchEligibleToRetryLocalIdentifiers:processingStatus:taskID:fetchLimit:additionalPredicates:]( self,  "fetchEligibleToRetryLocalIdentifiers:processingStatus:taskID:fetchLimit:additionalPredicates:",  a3,  a4,  a5,  a6,  0LL);
}

- (int)fetchLocalIdentifiersEligibleForRetry:(id *)a3 withTaskID:(unint64_t)a4 andFetchLimit:(unint64_t)a5
{
  uint64_t v9 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v9)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v17 = 1024;
      int v18 = 2328;
      __int16 v19 = 2080;
      int v20 = "-[VCPDatabaseWriter(ProcessingStatus) fetchLocalIdentifiersEligibleForRetry:withTaskID:andFetchLimit:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10003B988;
  v14[3] = &unk_1001BA8C0;
  v14[4] = self;
  v14[5] = a4;
  v14[6] = a5;
  v14[7] = a3;
  return -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v14,  0LL,  0LL);
}

- (int)fetchLocalIdentifiersEligibleForRetry:(id *)a3 taskID:(unint64_t)a4 includingStatuses:(id)a5 fetchLimit:(unint64_t)a6 additionalPredicates:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  uint64_t v15 = v13;
  if (a3)
  {
    uint64_t v16 = MediaAnalysisEnableDatabaseLog(v13, v14);
    if ((_DWORD)v16)
    {
      uint64_t v18 = VCPLogInstance(v16, v17);
      __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v30 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v31 = 1024;
        int v32 = 2367;
        __int16 v33 = 2080;
        __int16 v34 = "-[VCPDatabaseWriter(ProcessingStatus) fetchLocalIdentifiersEligibleForRetry:taskID:includingStatuses:fetch"
              "Limit:additionalPredicates:]";
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "[MADB] Executing: %s[line:%d]: %s",  buf,  0x1Cu);
      }
    }

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10003BEC0;
    v22[3] = &unk_1001BABE8;
    id v23 = v12;
    id v24 = v15;
    unint64_t v25 = self;
    unint64_t v26 = a4;
    unint64_t v27 = a6;
    __int16 v28 = a3;
    int v20 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v22,  0LL,  0LL);
  }

  else
  {
    int v20 = -50;
  }

  return v20;
}

- (int)fetchLocalIdentifiersEligibleForRetry:(id *)a3 withTaskID:(unint64_t)a4 includingStatuses:(id)a5 andFetchLimit:(unint64_t)a6
{
  return -[VCPDatabaseWriter fetchLocalIdentifiersEligibleForRetry:taskID:includingStatuses:fetchLimit:additionalPredicates:]( self,  "fetchLocalIdentifiersEligibleForRetry:taskID:includingStatuses:fetchLimit:additionalPredicates:",  a3,  a4,  a5,  a6,  0LL);
}

- (int)fetchLocalIdentifiersEligibleForRetry:(id *)a3 taskID:(unint64_t)a4 excludingStatuses:(id)a5 fetchLimit:(unint64_t)a6 additionalPredicates:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  uint64_t v15 = v13;
  if (a3)
  {
    uint64_t v16 = MediaAnalysisEnableDatabaseLog(v13, v14);
    if ((_DWORD)v16)
    {
      uint64_t v18 = VCPLogInstance(v16, v17);
      __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v30 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v31 = 1024;
        int v32 = 2428;
        __int16 v33 = 2080;
        __int16 v34 = "-[VCPDatabaseWriter(ProcessingStatus) fetchLocalIdentifiersEligibleForRetry:taskID:excludingStatuses:fetch"
              "Limit:additionalPredicates:]";
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "[MADB] Executing: %s[line:%d]: %s",  buf,  0x1Cu);
      }
    }

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10003C598;
    v22[3] = &unk_1001BABE8;
    id v23 = v12;
    id v24 = v15;
    unint64_t v25 = self;
    unint64_t v26 = a4;
    unint64_t v27 = a6;
    __int16 v28 = a3;
    int v20 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v22,  0LL,  0LL);
  }

  else
  {
    int v20 = -50;
  }

  return v20;
}

- (int)fetchLocalIdentifiersEligibleForRetry:(id *)a3 withTaskID:(unint64_t)a4 excludingStatuses:(id)a5 andFetchLimit:(unint64_t)a6
{
  return -[VCPDatabaseWriter fetchLocalIdentifiersEligibleForRetry:taskID:excludingStatuses:fetchLimit:additionalPredicates:]( self,  "fetchLocalIdentifiersEligibleForRetry:taskID:excludingStatuses:fetchLimit:additionalPredicates:",  a3,  a4,  a5,  a6,  0LL);
}

- (int)fetchLocalIdentifiers:(id *)a3 processingStatus:(unint64_t)a4 taskID:(unint64_t)a5 attempts:(int)a6 fetchLimit:(unint64_t)a7 additionalPredicates:(id)a8
{
  id v14 = a8;
  uint64_t v16 = v14;
  if (a3)
  {
    uint64_t v17 = MediaAnalysisEnableDatabaseLog(v14, v15);
    if ((_DWORD)v17)
    {
      uint64_t v19 = VCPLogInstance(v17, v18);
      int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        int v32 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v33 = 1024;
        int v34 = 2490;
        __int16 v35 = 2080;
        __int16 v36 = "-[VCPDatabaseWriter(ProcessingStatus) fetchLocalIdentifiers:processingStatus:taskID:attempts:fetchLimit:ad"
              "ditionalPredicates:]";
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "[MADB] Executing: %s[line:%d]: %s",  buf,  0x1Cu);
      }
    }

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10003CC50;
    v23[3] = &unk_1001BAC10;
    id v24 = v16;
    unint64_t v25 = self;
    unint64_t v26 = a5;
    unint64_t v27 = a4;
    int v30 = a6;
    unint64_t v28 = a7;
    uint64_t v29 = a3;
    int v21 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v23,  0LL,  0LL);
  }

  else
  {
    int v21 = -50;
  }

  return v21;
}

- (int)fetchLocalIdentifiers:(id *)a3 withProcessingStatus:(unint64_t)a4 andTaskID:(unint64_t)a5 andAttempts:(int)a6 andFetchLimit:(unint64_t)a7
{
  return -[VCPDatabaseWriter fetchLocalIdentifiers:processingStatus:taskID:attempts:fetchLimit:additionalPredicates:]( self,  "fetchLocalIdentifiers:processingStatus:taskID:attempts:fetchLimit:additionalPredicates:",  a3,  a4,  a5,  *(void *)&a6,  a7,  0LL);
}

- (int)fetchLocalIdentifiers:(id *)a3 taskID:(unint64_t)a4 processingStatus:(unint64_t)a5 additionalPredicates:(id)a6
{
  id v10 = a6;
  id v12 = v10;
  if (a3)
  {
    uint64_t v13 = MediaAnalysisEnableDatabaseLog(v10, v11);
    if ((_DWORD)v13)
    {
      uint64_t v15 = VCPLogInstance(v13, v14);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        unint64_t v26 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v27 = 1024;
        int v28 = 2547;
        __int16 v29 = 2080;
        int v30 = "-[VCPDatabaseWriter(ProcessingStatus) fetchLocalIdentifiers:taskID:processingStatus:additionalPredicates:]";
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "[MADB] Executing: %s[line:%d]: %s",  buf,  0x1Cu);
      }
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10003D188;
    v19[3] = &unk_1001BAC38;
    id v20 = v12;
    int v21 = self;
    unint64_t v22 = a4;
    unint64_t v23 = a5;
    id v24 = a3;
    int v17 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v19,  0LL,  0LL);
  }

  else
  {
    int v17 = -50;
  }

  return v17;
}

- (int)fetchLocalIdentifiers:(id *)a3 withTaskID:(unint64_t)a4 andProcessingStatus:(unint64_t)a5
{
  return -[VCPDatabaseWriter fetchLocalIdentifiers:taskID:processingStatus:additionalPredicates:]( self,  "fetchLocalIdentifiers:taskID:processingStatus:additionalPredicates:",  a3,  a4,  a5,  0LL);
}

- (int)fetchLocalIdentifiers:(id *)a3 taskID:(unint64_t)a4 processingStatus:(unint64_t)a5 errorCode:(int64_t)a6 sinceDate:(id)a7 additionalPredicates:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  int v17 = v15;
  if (a3)
  {
    uint64_t v18 = MediaAnalysisEnableDatabaseLog(v15, v16);
    if ((_DWORD)v18)
    {
      uint64_t v20 = VCPLogInstance(v18, v19);
      int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v33 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v34 = 1024;
        int v35 = 2600;
        __int16 v36 = 2080;
        __int16 v37 = "-[VCPDatabaseWriter(ProcessingStatus) fetchLocalIdentifiers:taskID:processingStatus:errorCode:sinceDate:ad"
              "ditionalPredicates:]";
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "[MADB] Executing: %s[line:%d]: %s",  buf,  0x1Cu);
      }
    }

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10003D6C4;
    v24[3] = &unk_1001BAC60;
    id v25 = v17;
    unint64_t v26 = self;
    unint64_t v28 = a4;
    unint64_t v29 = a5;
    int64_t v30 = a6;
    id v27 = v14;
    __int16 v31 = a3;
    int v22 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v24,  0LL,  0LL);
  }

  else
  {
    int v22 = -50;
  }

  return v22;
}

- (int)fetchLocalIdentifiers:(id *)a3 withTaskID:(unint64_t)a4 andProcessingStatus:(unint64_t)a5 errorCode:(int64_t)a6 sinceDate:(id)a7
{
  return -[VCPDatabaseWriter fetchLocalIdentifiers:taskID:processingStatus:errorCode:sinceDate:additionalPredicates:]( self,  "fetchLocalIdentifiers:taskID:processingStatus:errorCode:sinceDate:additionalPredicates:",  a3,  a4,  a5,  a6,  a7,  0LL);
}

- (int)fetchProcessingErrorCode:(unint64_t *)a3 errorLine:(unint64_t *)a4 taskID:(unint64_t)a5 localIndentifier:(id)a6
{
  id v10 = a6;
  id v12 = v10;
  int v13 = -50;
  if (a3 && a4)
  {
    uint64_t v14 = MediaAnalysisEnableDatabaseLog(v10, v11);
    if ((_DWORD)v14)
    {
      uint64_t v16 = VCPLogInstance(v14, v15);
      int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        id v25 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v26 = 1024;
        int v27 = 2658;
        __int16 v28 = 2080;
        unint64_t v29 = "-[VCPDatabaseWriter(ProcessingStatus) fetchProcessingErrorCode:errorLine:taskID:localIndentifier:]";
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "[MADB] Executing: %s[line:%d]: %s",  buf,  0x1Cu);
      }
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10003DC00;
    v19[3] = &unk_1001BAC38;
    void v19[4] = self;
    unint64_t v21 = a5;
    id v20 = v12;
    int v22 = a3;
    unint64_t v23 = a4;
    int v13 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v19,  0LL,  0LL);
  }

  return v13;
}

- (int)fetchProcessingErrorCodeCounts:(id *)a3 withTaskID:(unint64_t)a4 sinceDate:(id)a5 additionalPredicates:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  int v13 = v11;
  if (a3)
  {
    uint64_t v14 = MediaAnalysisEnableDatabaseLog(v11, v12);
    if ((_DWORD)v14)
    {
      uint64_t v16 = VCPLogInstance(v14, v15);
      int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        int v27 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v28 = 1024;
        int v29 = 2691;
        __int16 v30 = 2080;
        __int16 v31 = "-[VCPDatabaseWriter(ProcessingStatus) fetchProcessingErrorCodeCounts:withTaskID:sinceDate:additionalPredicates:]";
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "[MADB] Executing: %s[line:%d]: %s",  buf,  0x1Cu);
      }
    }

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10003DFB8;
    v20[3] = &unk_1001BAC88;
    id v21 = v13;
    int v22 = self;
    unint64_t v24 = a4;
    id v23 = v10;
    id v25 = a3;
    int v18 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v20,  0LL,  0LL);
  }

  else
  {
    int v18 = -50;
  }

  return v18;
}

- (int)setAttempts:(unint64_t)a3 asset:(id)a4 taskID:(unint64_t)a5 status:(unint64_t)a6 lastAttemptDate:(id)a7 mediaType:(int64_t)a8 mediaSubtypes:(unint64_t)a9 errorCode:(unint64_t)a10 errorLine:(unint64_t)a11
{
  id v17 = a4;
  id v30 = a7;
  int v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mad_nextAttemptDateForStatus:currentAttemptDate:attemptCount:", a6, v17));
  uint64_t v19 = MediaAnalysisEnableDatabaseLog(v29, v18);
  if ((_DWORD)v19)
  {
    uint64_t v21 = VCPLogInstance(v19, v20);
    int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int128 v43 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v44 = 1024;
      int v45 = 2741;
      __int16 v46 = 2080;
      id v47 = "-[VCPDatabaseWriter(ProcessingStatus) setAttempts:asset:taskID:status:lastAttemptDate:mediaType:mediaSubtype"
            "s:errorCode:errorLine:]";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  _DWORD v31[2] = sub_10003E5EC;
  v31[3] = &unk_1001BACB0;
  v31[4] = self;
  unint64_t v35 = a5;
  id v23 = v17;
  id v32 = v23;
  id v24 = v30;
  id v33 = v24;
  id v25 = v29;
  id v34 = v25;
  unint64_t v36 = a10;
  unint64_t v37 = a11;
  int64_t v38 = a8;
  unint64_t v39 = a9;
  unint64_t v40 = a3;
  unint64_t v41 = a6;
  __int16 v26 = objc_retainBlock(v31);
  int v27 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v26,  v26,  1LL);

  return v27;
}

- (int)setAttempts:(unint64_t)a3 asset:(id)a4 taskID:(unint64_t)a5 status:(unint64_t)a6 lastAttemptDate:(id)a7 mediaType:(int64_t)a8 mediaSubtypes:(unint64_t)a9
{
  return -[VCPDatabaseWriter setAttempts:asset:taskID:status:lastAttemptDate:mediaType:mediaSubtypes:errorCode:errorLine:]( self,  "setAttempts:asset:taskID:status:lastAttemptDate:mediaType:mediaSubtypes:errorCode:errorLine:",  a3,  a4,  a5,  a6,  a7,  a8,  a9,  98LL,  0LL);
}

- (int)setAttempts:(unint64_t)a3 asset:(id)a4 taskID:(unint64_t)a5 status:(unint64_t)a6 lastAttemptDate:(id)a7
{
  return -[VCPDatabaseWriter setAttempts:asset:taskID:status:lastAttemptDate:mediaType:mediaSubtypes:errorCode:errorLine:]( self,  "setAttempts:asset:taskID:status:lastAttemptDate:mediaType:mediaSubtypes:errorCode:errorLine:",  a3,  a4,  a5,  a6,  a7,  0LL,  0LL,  98LL,  0LL);
}

- (int)removeProcessingStatusForLocalIdentifier:(id)a3 andTaskID:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v8 = MediaAnalysisEnableDatabaseLog(v6, v7);
  if ((_DWORD)v8)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v20 = 1024;
      int v21 = 2804;
      __int16 v22 = 2080;
      id v23 = "-[VCPDatabaseWriter(ProcessingStatus) removeProcessingStatusForLocalIdentifier:andTaskID:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10003EA80;
  v15[3] = &unk_1001BA9B0;
  v15[4] = self;
  unint64_t v17 = a4;
  id v12 = v6;
  id v16 = v12;
  int v13 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v15,  0LL,  1LL);

  return v13;
}

- (int)removeAllProcessingStatusForTaskID:(unint64_t)a3
{
  uint64_t v5 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v5)
  {
    uint64_t v7 = VCPLogInstance(v5, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v12 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v13 = 1024;
      int v14 = 2822;
      __int16 v15 = 2080;
      id v16 = "-[VCPDatabaseWriter(ProcessingStatus) removeAllProcessingStatusForTaskID:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10003ED5C;
  v10[3] = &unk_1001BA910;
  v10[4] = self;
  v10[5] = a3;
  return -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v10,  0LL,  1LL);
}

- (int)removeProcessingStatusForTaskID:(unint64_t)a3 mediaType:(int64_t)a4 mediaSubtypes:(unint64_t)a5
{
  uint64_t v9 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v9)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v16 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v17 = 1024;
      int v18 = 2831;
      __int16 v19 = 2080;
      __int16 v20 = "-[VCPDatabaseWriter(ProcessingStatus) removeProcessingStatusForTaskID:mediaType:mediaSubtypes:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10003EEA8;
  v14[3] = &unk_1001BA8C0;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = a4;
  v14[7] = a5;
  return -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v14,  0LL,  1LL);
}

- (int)updateProcessingStatus:(unint64_t)a3 andNextAttemptDate:(id)a4 andErrorCode:(unint64_t)a5 andErrorLine:(unint64_t)a6 forLocalIdentifier:(id)a7 andTaskID:(unint64_t)a8
{
  id v14 = a4;
  id v15 = a7;
  uint64_t v17 = MediaAnalysisEnableDatabaseLog(v15, v16);
  if ((_DWORD)v17)
  {
    uint64_t v19 = VCPLogInstance(v17, v18);
    __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v34 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v35 = 1024;
      int v36 = 2855;
      __int16 v37 = 2080;
      int64_t v38 = "-[VCPDatabaseWriter(ProcessingStatus) updateProcessingStatus:andNextAttemptDate:andErrorCode:andErrorLine:fo"
            "rLocalIdentifier:andTaskID:]";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10003F200;
  v26[3] = &unk_1001BAC60;
  v26[4] = self;
  unint64_t v29 = a3;
  id v21 = v14;
  id v27 = v21;
  unint64_t v30 = a5;
  unint64_t v31 = a6;
  unint64_t v32 = a8;
  id v22 = v15;
  id v28 = v22;
  id v23 = objc_retainBlock(v26);
  int v24 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v23,  v23,  1LL);

  return v24;
}

- (int)updateProcessingStatus:(unint64_t)a3 andNextAttemptDate:(id)a4 forLocalIdentifier:(id)a5 andTaskID:(unint64_t)a6
{
  return -[VCPDatabaseWriter updateProcessingStatus:andNextAttemptDate:andErrorCode:andErrorLine:forLocalIdentifier:andTaskID:]( self,  "updateProcessingStatus:andNextAttemptDate:andErrorCode:andErrorLine:forLocalIdentifier:andTaskID:",  a3,  a4,  98LL,  0LL,  a5,  a6);
}

- (int)hardFailAllRunningProcessingStatusForTaskID:(unint64_t)a3 additionalPredicates:(id)a4
{
  id v6 = a4;
  uint64_t v8 = MediaAnalysisEnableDatabaseLog(v6, v7);
  if ((_DWORD)v8)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v21 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v22 = 1024;
      int v23 = 2892;
      __int16 v24 = 2080;
      id v25 = "-[VCPDatabaseWriter(ProcessingStatus) hardFailAllRunningProcessingStatusForTaskID:additionalPredicates:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10003F5A8;
  v16[3] = &unk_1001BA9B0;
  id v12 = v6;
  id v17 = v12;
  uint64_t v18 = self;
  unint64_t v19 = a3;
  __int16 v13 = objc_retainBlock(v16);
  int v14 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v13,  v13,  1LL);

  return v14;
}

- (int)hardFailAllRunningProcessingStatusForTaskID:(unint64_t)a3
{
  return -[VCPDatabaseWriter hardFailAllRunningProcessingStatusForTaskID:additionalPredicates:]( self,  "hardFailAllRunningProcessingStatusForTaskID:additionalPredicates:",  a3,  0LL);
}

- (int)_removeSchedulingHistoryForStartTimeBefore:(id)a3
{
  id v4 = a3;
  ppStmt = 0LL;
  uint64_t v5 = sqlite3_prepare_v2( self->_database,  "DELETE FROM BackgroundActivitySchedulingHistory WHERE startTime<(?);",
         -1,
         &ppStmt,
         0LL);
  int v7 = v5;
  if ((_DWORD)v5) {
    goto LABEL_6;
  }
  uint64_t v8 = ppStmt;
  id v9 = v4;
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 timeIntervalSinceReferenceDate];
    int v12 = sqlite3_bind_double(v8, 1, v11);
  }

  else
  {
    int v12 = sqlite3_bind_null(v8, 1);
  }

  int v7 = v12;

  if (v7) {
    goto LABEL_6;
  }
  __int16 v20 = sqlite3_expanded_sql(ppStmt);
  __int16 v22 = v20;
  if (v20)
  {
    uint64_t v23 = MediaAnalysisEnableDatabaseLog(v20, v21);
    if ((_DWORD)v23)
    {
      uint64_t v25 = VCPLogInstance(v23, v24);
      __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        unint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v30 = 1024;
        int v31 = 2938;
        __int16 v32 = 2080;
        id v33 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "[MADB] Statement: %s[line:%d]: %s",  buf,  0x1Cu);
      }
    }

    sqlite3_free(v22);
  }

  uint64_t v5 = sqlite3_step(ppStmt);
  int v7 = v5;
  int v18 = 0;
  if ((_DWORD)v5)
  {
    if ((_DWORD)v5 != 101)
    {
LABEL_6:
      uint64_t v13 = MediaAnalysisLogLevel(v5, v6);
      if ((int)v13 >= 3)
      {
        uint64_t v15 = VCPLogInstance(v13, v14);
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        os_log_type_t v17 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v16, v17))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v29 = (const char *)v4;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "Failed to remove background activity scheduling history with start time before %@",  buf,  0xCu);
        }
      }

      int v18 = v7;
    }
  }

  sqlite3_finalize(ppStmt);

  return v18;
}

- (int)_storeSchedulingHistoryForActivityID:(unint64_t)a3 andStartTime:(id)a4
{
  id v6 = a4;
  ppStmt = 0LL;
  uint64_t v7 = sqlite3_prepare_v2( self->_database,  "REPLACE INTO BackgroundActivitySchedulingHistory (activityID, startTime, duration, exitStatus) VALUES ((?), (?), (?), (?));",
         -1,
         &ppStmt,
         0LL);
  int v9 = v7;
  if ((_DWORD)v7) {
    goto LABEL_9;
  }
  uint64_t v7 = sqlite3_bind_int64(ppStmt, 1, a3);
  int v9 = v7;
  if ((_DWORD)v7) {
    goto LABEL_9;
  }
  uint64_t v10 = ppStmt;
  id v11 = v6;
  int v12 = v11;
  if (v11)
  {
    [v11 timeIntervalSinceReferenceDate];
    int v14 = sqlite3_bind_double(v10, 2, v13);
  }

  else
  {
    int v14 = sqlite3_bind_null(v10, 2);
  }

  int v9 = v14;

  if (v9) {
    goto LABEL_9;
  }
  uint64_t v7 = sqlite3_bind_double(ppStmt, 3, -1.0);
  int v9 = v7;
  if ((_DWORD)v7) {
    goto LABEL_9;
  }
  uint64_t v7 = sqlite3_bind_int64(ppStmt, 4, 0LL);
  int v9 = v7;
  if ((_DWORD)v7) {
    goto LABEL_9;
  }
  uint64_t v24 = sqlite3_expanded_sql(ppStmt);
  __int16 v26 = v24;
  if (v24)
  {
    uint64_t v27 = MediaAnalysisEnableDatabaseLog(v24, v25);
    if ((_DWORD)v27)
    {
      uint64_t v29 = VCPLogInstance(v27, v28);
      __int16 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        id v33 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v34 = 1024;
        LODWORD(v35[0]) = 2958;
        WORD2(v35[0]) = 2080;
        *(void *)((char *)v35 + 6) = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "[MADB] Statement: %s[line:%d]: %s",  buf,  0x1Cu);
      }
    }

    sqlite3_free(v26);
  }

  uint64_t v7 = sqlite3_step(ppStmt);
  int v9 = v7;
  int v22 = 0;
  if ((_DWORD)v7)
  {
    if ((_DWORD)v7 != 101)
    {
LABEL_9:
      uint64_t v15 = MediaAnalysisLogLevel(v7, v8);
      if ((int)v15 >= 3)
      {
        uint64_t v17 = VCPLogInstance(v15, v16);
        int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        os_log_type_t v19 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v18, v19))
        {
          uint64_t v20 = VCPTaskIDDescription(a3);
          uint64_t v21 = (char *)objc_claimAutoreleasedReturnValue(v20);
          *(_DWORD *)buf = 138412546;
          id v33 = v21;
          __int16 v34 = 2112;
          v35[0] = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  v19,  "Failed to store history for background activity %@ and start time %@",  buf,  0x16u);
        }
      }

      int v22 = v9;
    }
  }

  sqlite3_finalize(ppStmt);

  return v22;
}

- (int)storeSchedulingHistoryForActivityID:(unint64_t)a3 andStartTime:(id)a4
{
  id v6 = a4;
  uint64_t v8 = MediaAnalysisEnableDatabaseLog(v6, v7);
  if ((_DWORD)v8)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v22 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v23 = 1024;
      int v24 = 2969;
      __int16 v25 = 2080;
      __int16 v26 = "-[VCPDatabaseWriter(BackgroundActivitySchedulingHistory) storeSchedulingHistoryForActivityID:andStartTime:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10003FE98;
  v18[3] = &unk_1001BA9B0;
  v18[4] = self;
  unint64_t v20 = a3;
  id v19 = v6;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10003FF18;
  v15[3] = &unk_1001BA9B0;
  v15[4] = self;
  unint64_t v17 = a3;
  id v12 = v19;
  id v16 = v12;
  int v13 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v18,  v15,  1LL);

  return v13;
}

- (int)updateSchedulingHistoryForActivityID:(unint64_t)a3 startTime:(id)a4 duration:(double)a5 exitStatus:(int)a6 sessionLog:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  uint64_t v15 = MediaAnalysisEnableDatabaseLog(v13, v14);
  if ((_DWORD)v15)
  {
    uint64_t v17 = VCPLogInstance(v15, v16);
    int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v35 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v36 = 1024;
      int v37 = 2992;
      __int16 v38 = 2080;
      unint64_t v39 = "-[VCPDatabaseWriter(BackgroundActivitySchedulingHistory) updateSchedulingHistoryForActivityID:startTime:dura"
            "tion:exitStatus:sessionLog:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  int v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472LL;
  __int16 v26 = sub_100040108;
  uint64_t v27 = &unk_1001BACD8;
  uint64_t v28 = self;
  unint64_t v31 = a3;
  id v19 = v12;
  id v29 = v19;
  double v32 = a5;
  int v33 = a6;
  id v20 = v13;
  id v30 = v20;
  uint64_t v21 = objc_retainBlock(&v24);
  int v22 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v21,  v21,  1LL,  v24,  v25,  v26,  v27,  v28);

  return v22;
}

- (int)querySchedulingHistoryRecords:(id *)a3 forActivityID:(unint64_t)a4 sinceDate:(id)a5
{
  id v8 = a5;
  uint64_t v10 = MediaAnalysisEnableDatabaseLog(v8, v9);
  if ((_DWORD)v10)
  {
    uint64_t v12 = VCPLogInstance(v10, v11);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3022;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(BackgroundActivitySchedulingHistory) querySchedulingHistoryRecords:forAc"
                            "tivityID:sinceDate:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  *(void *)&buf[24] = sub_100030C00;
  int v22 = sub_100030C10;
  id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000405CC;
  v17[3] = &unk_1001BAB70;
  v17[4] = self;
  unint64_t v20 = a4;
  id v14 = v8;
  id v18 = v14;
  id v19 = buf;
  int v15 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v17,  0LL,  0LL);
  *a3 = *(id *)(*(void *)&buf[8] + 40LL);

  _Block_object_dispose(buf, 8);
  return v15;
}

- (int)purgeExcessiveSchedulingRecordsForActivityID:(unint64_t)a3
{
  uint64_t v5 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v5)
  {
    uint64_t v7 = VCPLogInstance(v5, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v13 = 1024;
      int v14 = 3063;
      __int16 v15 = 2080;
      uint64_t v16 = "-[VCPDatabaseWriter(BackgroundActivitySchedulingHistory) purgeExcessiveSchedulingRecordsForActivityID:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100040AA4;
  v10[3] = &unk_1001BA910;
  v10[4] = self;
  v10[5] = a3;
  return -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v10,  0LL,  1LL);
}

- (int)_storeProgressForActivityID:(unint64_t)a3 withAnalysisSubtype:(unint64_t)a4 version:(unint64_t)a5 processedAssetCount:(unint64_t)a6 totalAssetCount:(unint64_t)a7
{
  ppStmt = 0LL;
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  uint64_t v14 = sqlite3_prepare_v2( self->_database,  "REPLACE INTO BackgroundAnalysisProgressHistory (activityID, analysisSubtype, storeDate, version, processedAsse tCount, totalAssetCount) VALUES ((?), (?), (?), (?), (?), (?));",
          -1,
          &ppStmt,
          0LL);
  int v16 = v14;
  if ((_DWORD)v14) {
    goto LABEL_11;
  }
  uint64_t v14 = sqlite3_bind_int64(ppStmt, 1, a3);
  int v16 = v14;
  if ((_DWORD)v14) {
    goto LABEL_11;
  }
  uint64_t v14 = sqlite3_bind_int64(ppStmt, 2, a4);
  int v16 = v14;
  if ((_DWORD)v14) {
    goto LABEL_11;
  }
  uint64_t v17 = ppStmt;
  id v18 = v13;
  id v19 = v18;
  if (v18)
  {
    [v18 timeIntervalSinceReferenceDate];
    int v21 = sqlite3_bind_double(v17, 3, v20);
  }

  else
  {
    int v21 = sqlite3_bind_null(v17, 3);
  }

  int v16 = v21;

  if (v16) {
    goto LABEL_11;
  }
  uint64_t v14 = sqlite3_bind_int64(ppStmt, 4, a5);
  int v16 = v14;
  if ((_DWORD)v14) {
    goto LABEL_11;
  }
  uint64_t v14 = sqlite3_bind_int64(ppStmt, 5, a6);
  int v16 = v14;
  if ((_DWORD)v14) {
    goto LABEL_11;
  }
  uint64_t v14 = sqlite3_bind_int64(ppStmt, 6, a7);
  int v16 = v14;
  if ((_DWORD)v14) {
    goto LABEL_11;
  }
  id v29 = sqlite3_expanded_sql(ppStmt);
  unint64_t v31 = v29;
  if (v29)
  {
    uint64_t v32 = MediaAnalysisEnableDatabaseLog(v29, v30);
    if ((_DWORD)v32)
    {
      uint64_t v34 = VCPLogInstance(v32, v33);
      __int16 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)__int16 v38 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        *(_WORD *)&v38[8] = 1024;
        *(_DWORD *)unint64_t v39 = 3117;
        *(_WORD *)&v39[4] = 2080;
        unint64_t v40 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEBUG,  "[MADB] Statement: %s[line:%d]: %s",  buf,  0x1Cu);
      }
    }

    sqlite3_free(v31);
  }

  uint64_t v14 = sqlite3_step(ppStmt);
  int v16 = v14;
  int v27 = 0;
  if ((_DWORD)v14)
  {
    if ((_DWORD)v14 != 101)
    {
LABEL_11:
      uint64_t v22 = MediaAnalysisLogLevel(v14, v15);
      if ((int)v22 >= 3)
      {
        uint64_t v24 = VCPLogInstance(v22, v23);
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        os_log_type_t v26 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v25, v26))
        {
          *(_DWORD *)buf = 67110658;
          *(_DWORD *)__int16 v38 = v16;
          *(_WORD *)&v38[4] = 1024;
          *(_DWORD *)&v38[6] = a3;
          *(_WORD *)unint64_t v39 = 1024;
          *(_DWORD *)&v39[2] = a4;
          LOWORD(v40) = 1024;
          *(_DWORD *)((char *)&v40 + 2) = a5;
          HIWORD(v40) = 1024;
          int v41 = a6;
          __int16 v42 = 1024;
          int v43 = a7;
          __int16 v44 = 2112;
          int v45 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  v26,  "Error: %d -- Failed to store progress for activity %d subtype %d version %d processed asset count %d total a sset count %d on datetime %@. ",  buf,  0x30u);
        }
      }

      int v27 = v16;
    }
  }

  sqlite3_finalize(ppStmt);

  return v27;
}

- (int)_removeProgressRecordsBeforeDate:(id)a3
{
  id v4 = a3;
  ppStmt = 0LL;
  uint64_t v5 = sqlite3_prepare_v2( self->_database,  "DELETE FROM BackgroundAnalysisProgressHistory WHERE storeDate<(?);",
         -1,
         &ppStmt,
         0LL);
  int v7 = v5;
  if ((_DWORD)v5) {
    goto LABEL_6;
  }
  id v8 = ppStmt;
  id v9 = v4;
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 timeIntervalSinceReferenceDate];
    int v12 = sqlite3_bind_double(v8, 1, v11);
  }

  else
  {
    int v12 = sqlite3_bind_null(v8, 1);
  }

  int v7 = v12;

  if (v7) {
    goto LABEL_6;
  }
  double v20 = sqlite3_expanded_sql(ppStmt);
  uint64_t v22 = v20;
  if (v20)
  {
    uint64_t v23 = MediaAnalysisEnableDatabaseLog(v20, v21);
    if ((_DWORD)v23)
    {
      uint64_t v25 = VCPLogInstance(v23, v24);
      os_log_type_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        id v29 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v30 = 1024;
        int v31 = 3133;
        __int16 v32 = 2080;
        uint64_t v33 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "[MADB] Statement: %s[line:%d]: %s",  buf,  0x1Cu);
      }
    }

    sqlite3_free(v22);
  }

  uint64_t v5 = sqlite3_step(ppStmt);
  int v7 = v5;
  int v18 = 0;
  if ((_DWORD)v5)
  {
    if ((_DWORD)v5 != 101)
    {
LABEL_6:
      uint64_t v13 = MediaAnalysisLogLevel(v5, v6);
      if ((int)v13 >= 3)
      {
        uint64_t v15 = VCPLogInstance(v13, v14);
        int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        os_log_type_t v17 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v16, v17))
        {
          *(_DWORD *)buf = 138412290;
          id v29 = (const char *)v4;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "Failed to remove background analysis progress history with storage date before %@",  buf,  0xCu);
        }
      }

      int v18 = v7;
    }
  }

  sqlite3_finalize(ppStmt);

  return v18;
}

- (int)_removeProgressRecordsBeyondMaximum:(unint64_t)a3
{
  ppStmt = 0LL;
  uint64_t v4 = sqlite3_prepare_v2( self->_database,  "DELETE FROM BackgroundAnalysisProgressHistory WHERE id NOT IN(    SELECT id FROM BackgroundAnalysisProgressHi story      ORDER BY storeDate DESC LIMIT (?));",
         -1,
         &ppStmt,
         0LL);
  int v6 = v4;
  if ((_DWORD)v4) {
    goto LABEL_3;
  }
  uint64_t v4 = sqlite3_bind_int64(ppStmt, 1, a3);
  int v6 = v4;
  if ((_DWORD)v4) {
    goto LABEL_3;
  }
  int v12 = sqlite3_expanded_sql(ppStmt);
  if (v12)
  {
    uint64_t v13 = v12;
    if (MediaAnalysisEnableDatabaseLog())
    {
      uint64_t v14 = VCPLogInstance();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        int v18 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
        __int16 v19 = 1024;
        int v20 = 3152;
        __int16 v21 = 2080;
        uint64_t v22 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "[MADB] Statement: %s[line:%d]: %s",  buf,  0x1Cu);
      }
    }

    sqlite3_free(v13);
  }

  uint64_t v4 = sqlite3_step(ppStmt);
  int v10 = 0;
  if ((_DWORD)v4)
  {
    int v6 = v4;
    if ((_DWORD)v4 != 101)
    {
LABEL_3:
      if ((int)MediaAnalysisLogLevel(v4, v5) >= 3)
      {
        uint64_t v7 = VCPLogInstance();
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
        os_log_type_t v9 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v8, v9))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v18) = a3;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  v9,  "Failed to remove background analysis progress history past max count %d",  buf,  8u);
        }
      }

      int v10 = v6;
    }
  }

  sqlite3_finalize(ppStmt);
  return v10;
}

- (int)storeProgressForActivityID:(unint64_t)a3 withAnalysisSubtype:(unint64_t)a4 version:(unint64_t)a5 processedAssetCount:(unint64_t)a6 totalAssetCount:(unint64_t)a7
{
  uint64_t v13 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v13)
  {
    uint64_t v15 = VCPLogInstance(v13, v14);
    int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v22 = 1024;
      int v23 = 3166;
      __int16 v24 = 2080;
      uint64_t v25 = "-[VCPDatabaseWriter(BackgroundAnalysisProgressHistory) storeProgressForActivityID:withAnalysisSubtype:versio"
            "n:processedAssetCount:totalAssetCount:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100041548;
  v19[3] = &unk_1001BAD00;
  void v19[4] = self;
  void v19[5] = a3;
  v19[6] = a4;
  v19[7] = a5;
  void v19[8] = a6;
  v19[9] = a7;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10004155C;
  v18[3] = &unk_1001BAD00;
  v18[4] = self;
  void v18[5] = a3;
  v18[6] = a4;
  v18[7] = a5;
  v18[8] = a6;
  v18[9] = a7;
  return -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v19,  v18,  1LL);
}

- (int)removeProgressEntriesBeyondLimits
{
  uint64_t v3 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v3)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v10 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v11 = 1024;
      int v12 = 3188;
      __int16 v13 = 2080;
      uint64_t v14 = "-[VCPDatabaseWriter(BackgroundAnalysisProgressHistory) removeProgressEntriesBeyondLimits]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100041690;
  v8[3] = &unk_1001BA870;
  v8[4] = self;
  return -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v8,  0LL,  1LL);
}

- (int)setPrioritizedLocalIdentifier:(id)a3 mediaType:(int64_t)a4 mediaSubtypes:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v10 = MediaAnalysisEnableDatabaseLog(v8, v9);
  if ((_DWORD)v10)
  {
    uint64_t v12 = VCPLogInstance(v10, v11);
    __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v27 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v28 = 1024;
      int v29 = 3214;
      __int16 v30 = 2080;
      int v31 = "-[VCPDatabaseWriter(PrioritizedAssets) setPrioritizedLocalIdentifier:mediaType:mediaSubtypes:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  int v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  int v20 = sub_1000418AC;
  __int16 v21 = &unk_1001BAA88;
  __int16 v22 = self;
  id v14 = v8;
  id v23 = v14;
  int64_t v24 = a4;
  unint64_t v25 = a5;
  uint64_t v15 = objc_retainBlock(&v18);
  int v16 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v15,  v15,  1LL,  v18,  v19,  v20,  v21,  v22);

  return v16;
}

- (int)removePrioritizedLocalIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MediaAnalysisEnableDatabaseLog(v4, v5);
  if ((_DWORD)v6)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v22 = 1024;
      int v23 = 3236;
      __int16 v24 = 2080;
      unint64_t v25 = "-[VCPDatabaseWriter(PrioritizedAssets) removePrioritizedLocalIdentifier:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  int v16 = sub_100041C04;
  os_log_type_t v17 = &unk_1001BA988;
  int v18 = self;
  id v10 = v4;
  id v19 = v10;
  uint64_t v11 = objc_retainBlock(&v14);
  int v12 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v11,  v11,  1LL,  v14,  v15,  v16,  v17,  v18);

  return v12;
}

- (id)queryPrioritizedLocalIdentifiersWithMediaType:(int64_t)a3 mediaSubtypes:(unint64_t)a4 shouldNegateSubtypes:(BOOL)a5 limit:(unint64_t)a6
{
  uint64_t v11 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v11)
  {
    uint64_t v13 = VCPLogInstance(v11, v12);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3258;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(PrioritizedAssets) queryPrioritizedLocalIdentifiersWithMediaType:mediaSu"
                            "btypes:shouldNegateSubtypes:limit:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  *(void *)&buf[24] = sub_100030C00;
  int v20 = sub_100030C10;
  id v21 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100041F70;
  v17[3] = &unk_1001BAD28;
  BOOL v18 = a5;
  v17[6] = a3;
  v17[7] = a4;
  v17[8] = a6;
  v17[4] = self;
  void v17[5] = buf;
  -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v17,  0LL,  0LL);
  id v15 = *(id *)(*(void *)&buf[8] + 40LL);
  _Block_object_dispose(buf, 8);

  return v15;
}

- (BOOL)isPrioritizedLocalIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MediaAnalysisEnableDatabaseLog(v4, v5);
  if ((_DWORD)v6)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3290;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(PrioritizedAssets) isPrioritizedLocalIdentifier:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  *(_DWORD *)&buf[24] = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000423B8;
  v13[3] = &unk_1001BA9F8;
  v13[4] = self;
  id v10 = v4;
  id v14 = v10;
  id v15 = buf;
  -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v13,  0LL,  0LL);
  BOOL v11 = *(_DWORD *)(*(void *)&buf[8] + 24LL) == 1;

  _Block_object_dispose(buf, 8);
  return v11;
}

- (int)clearPrioritizedAssets
{
  uint64_t v3 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v3)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v13 = 1024;
      int v14 = 3317;
      __int16 v15 = 2080;
      int v16 = "-[VCPDatabaseWriter(PrioritizedAssets) clearPrioritizedAssets]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000426C8;
  v10[3] = &unk_1001BA870;
  v10[4] = self;
  uint64_t v7 = objc_retainBlock(v10);
  int v8 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v7,  v7,  1LL);

  return v8;
}

- (int)parseHeader:(sqlite3_stmt *)a3 startColumn:(int)a4 analysis:(id)a5
{
  id v7 = a5;
  int v8 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", sqlite3_column_int(a3, a4));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v7 setObject:v9 forKeyedSubscript:MediaAnalysisVersionKey];

  if (sqlite3_column_type(a3, a4 + 1) == 5)
  {
    id v10 = 0LL;
  }

  else
  {
    BOOL v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  sqlite3_column_double(a3, a4 + 1));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }

  [v7 setObject:v10 forKeyedSubscript:MediaAnalysisDateModifiedKey];

  if (sqlite3_column_type(a3, a4 + 2) == 5)
  {
    uint64_t v12 = 0LL;
  }

  else
  {
    __int16 v13 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  sqlite3_column_double(a3, a4 + 2));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
  }

  [v7 setObject:v12 forKeyedSubscript:MediaAnalysisDateAnalyzedKey];

  int v14 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", sqlite3_column_int64(a3, a4 + 3));
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = MediaAnalysisAnalysisTypesKey;
  [v7 setObject:v15 forKeyedSubscript:MediaAnalysisAnalysisTypesKey];

  os_log_type_t v17 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", sqlite3_column_int(a3, a4 + 4));
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v7 setObject:v18 forKeyedSubscript:MediaAnalysisFlagsKey];

  id v19 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", sqlite3_column_int64(a3, a4 + 5));
  int v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  [v7 setObject:v20 forKeyedSubscript:MediaAnalysisStatsFlagsKey];

  if (sqlite3_column_double(a3, a4 + 6) != MediaAnalysisQualityUnknown)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v7 setObject:v21 forKeyedSubscript:MediaAnalysisQualityKey];
  }

  if (sqlite3_column_type(a3, a4 + 7) == 5)
  {
    __int16 v22 = 0LL;
  }

  else
  {
    int v23 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  sqlite3_column_text(a3, a4 + 7));
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(v23);
  }

  int v24 = a4 + 8;
  if (sqlite3_column_type(a3, v24) == 5)
  {
    unint64_t v25 = 0LL;
  }

  else
  {
    os_log_type_t v26 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  sqlite3_column_text(a3, v24));
    unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v26);
  }

  int v27 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFingerprint fingerprintWithMaster:adjusted:]( &OBJC_CLASS___VCPFingerprint,  "fingerprintWithMaster:adjusted:",  v22,  v25));
  objc_msgSend(v7, "vcp_setFingerprint:", v27);

  signed int v28 = objc_msgSend(v7, "vcp_version");
  if (v28 < MediaAnalysisChangedVersion3 && (objc_msgSend(v7, "vcp_types") & 4) != 0)
  {
    int v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  (unint64_t)objc_msgSend(v7, "vcp_types") | 8));
    [v7 setObject:v29 forKeyedSubscript:v16];
  }

  return 0;
}

- (int)queryHeadersForAssets:(id)a3 analyses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = MediaAnalysisEnableDatabaseLog(v7, v8);
  if ((_DWORD)v9)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      os_log_type_t v26 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v27 = 1024;
      int v28 = 3368;
      __int16 v29 = 2080;
      __int16 v30 = "-[VCPDatabaseWriter(DataCollection) queryHeadersForAssets:analyses:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  if ([v6 count])
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100042DF8;
    v21[3] = &unk_1001BA960;
    __int16 v22 = (os_log_s *)v6;
    int v23 = self;
    id v24 = v7;
    int v14 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v21,  0LL,  0LL);

    __int16 v15 = v22;
  }

  else
  {
    uint64_t v16 = MediaAnalysisLogLevel(0LL, v13);
    if ((int)v16 < 4)
    {
      int v14 = 0;
      goto LABEL_12;
    }

    uint64_t v18 = VCPLogInstance(v16, v17);
    __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    os_log_type_t v19 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v15, v19))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  v19,  "No local identifiers provided; return empty analyses",
        buf,
        2u);
    }

    int v14 = 0;
  }

LABEL_12:
  return v14;
}

- (int)loadAllKeyValuePairs:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MediaAnalysisEnableDatabaseLog(v4, v5);
  if ((_DWORD)v6)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v17 = 1024;
      int v18 = 3415;
      __int16 v19 = 2080;
      int v20 = "-[VCPDatabaseWriter(DataCollection) loadAllKeyValuePairs:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100043340;
  v13[3] = &unk_1001BA988;
  v13[4] = self;
  id v10 = v4;
  id v14 = v10;
  int v11 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v13,  0LL,  0LL);

  return v11;
}

- (BOOL)keyExistsInKeyValueStore:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MediaAnalysisEnableDatabaseLog(v4, v5);
  if ((_DWORD)v6)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3444;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(DataCollection) keyExistsInKeyValueStore:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  if (v4)
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    buf[24] = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000437DC;
    v12[3] = &unk_1001BA9F8;
    v12[4] = self;
    id v13 = v4;
    id v14 = buf;
    -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v12,  0LL,  0LL);
    BOOL v10 = *(_BYTE *)(*(void *)&buf[8] + 24LL) != 0;

    _Block_object_dispose(buf, 8);
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (int64_t)valueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MediaAnalysisEnableDatabaseLog(v4, v5);
  if ((_DWORD)v6)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3474;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(DataCollection) valueForKey:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  if (v4)
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    *(void *)&buf[24] = 0LL;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100043BD4;
    v12[3] = &unk_1001BAD50;
    v12[4] = self;
    id v14 = buf;
    id v13 = v4;
    -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v12,  0LL,  0LL);
    int64_t v10 = *(void *)(*(void *)&buf[8] + 24LL);

    _Block_object_dispose(buf, 8);
  }

  else
  {
    int64_t v10 = 0LL;
  }

  return v10;
}

- (int)setValue:(int64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  uint64_t v8 = MediaAnalysisEnableDatabaseLog(v6, v7);
  if ((_DWORD)v8)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v18 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v19 = 1024;
      int v20 = 3486;
      __int16 v21 = 2080;
      __int16 v22 = "-[VCPDatabaseWriter(DataCollection) setValue:forKey:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  if (v6)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100043D70;
    v14[3] = &unk_1001BA9B0;
    v14[4] = self;
    int64_t v16 = a3;
    id v15 = v6;
    int v12 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v14,  0LL,  1LL);
  }

  else
  {
    int v12 = -50;
  }

  return v12;
}

- (int)removeKey:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MediaAnalysisEnableDatabaseLog(v4, v5);
  if ((_DWORD)v6)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v15 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v16 = 1024;
      int v17 = 3494;
      __int16 v18 = 2080;
      __int16 v19 = "-[VCPDatabaseWriter(DataCollection) removeKey:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  if (v4)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100043EFC;
    v12[3] = &unk_1001BA988;
    v12[4] = self;
    id v13 = v4;
    int v10 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v12,  0LL,  1LL);
  }

  else
  {
    int v10 = -50;
  }

  return v10;
}

- (int)storeStatsFlags:(unint64_t)a3 forLocalIdentifier:(id)a4
{
  id v6 = a4;
  uint64_t v8 = MediaAnalysisEnableDatabaseLog(v6, v7);
  if ((_DWORD)v8)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v19 = 1024;
      int v20 = 3502;
      __int16 v21 = 2080;
      __int16 v22 = "-[VCPDatabaseWriter(DataCollection) storeStatsFlags:forLocalIdentifier:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  if (v6)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10004408C;
    v14[3] = &unk_1001BA9B0;
    v14[4] = self;
    unint64_t v16 = a3;
    id v15 = v6;
    int v12 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v14,  0LL,  1LL);
  }

  else
  {
    int v12 = -50;
  }

  return v12;
}

- (unint64_t)getAssetCountMatchingAllFlags:(unint64_t)a3
{
  uint64_t v5 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v5)
  {
    uint64_t v7 = VCPLogInstance(v5, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3521;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(DataCollection) getAssetCountMatchingAllFlags:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  *(void *)&buf[24] = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000443B4;
  v11[3] = &unk_1001BAB20;
  v11[5] = buf;
  v11[6] = a3;
  v11[4] = self;
  -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v11,  0LL,  0LL);
  unint64_t v9 = *(void *)(*(void *)&buf[8] + 24LL);
  _Block_object_dispose(buf, 8);
  return v9;
}

- (unint64_t)getAssetCountMatchingAllFlags:(unint64_t)a3 andAnyFlags:(unint64_t)a4
{
  uint64_t v7 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v7)
  {
    uint64_t v9 = VCPLogInstance(v7, v8);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3543;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(DataCollection) getAssetCountMatchingAllFlags:andAnyFlags:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  *(void *)&buf[24] = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000446B8;
  v13[3] = &unk_1001BA898;
  void v13[6] = a3;
  v13[7] = a4;
  v13[4] = self;
  void v13[5] = buf;
  -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v13,  0LL,  0LL);
  unint64_t v11 = *(void *)(*(void *)&buf[8] + 24LL);
  _Block_object_dispose(buf, 8);
  return v11;
}

- (unint64_t)getAssetCountMatchingStatsFlags:(unint64_t)a3 andAnalysisTypes:(unint64_t)a4
{
  uint64_t v7 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v7)
  {
    uint64_t v9 = VCPLogInstance(v7, v8);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3566;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(DataCollection) getAssetCountMatchingStatsFlags:andAnalysisTypes:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  *(void *)&buf[24] = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000449D4;
  v13[3] = &unk_1001BA898;
  void v13[6] = a3;
  v13[7] = a4;
  v13[4] = self;
  void v13[5] = buf;
  -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v13,  0LL,  0LL);
  unint64_t v11 = *(void *)(*(void *)&buf[8] + 24LL);
  _Block_object_dispose(buf, 8);
  return v11;
}

- (int)cacheCurrentFaceProgress
{
  id v30 = 0LL;
  int v3 = +[VCPAnalysisProgressQuery queryProgressDetail:photoLibrary:taskID:cancelOrExtendTimeoutBlock:]( &OBJC_CLASS___VCPAnalysisProgressQuery,  "queryProgressDetail:photoLibrary:taskID:cancelOrExtendTimeoutBlock:",  &v30,  self->_photoLibrary,  3LL,  &stru_1001BAD70);
  id v4 = v30;
  uint64_t v5 = v4;
  if (!v3)
  {
    uint64_t v6 = VCPAnalysisCountTotalAllowedKey;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:VCPAnalysisCountTotalAllowedKey]);
    id v8 = [v7 longLongValue];
    int v3 = -[VCPDatabaseWriter setValue:forKey:]( self,  "setValue:forKey:",  v8,  VCPKeyValueNumberOfAssetsAllowedForPhotosFaceProcessing);

    if (!v3)
    {
      uint64_t v9 = VCPAnalysisCountProcessedKey;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:VCPAnalysisCountProcessedKey]);
      id v11 = [v10 longLongValue];
      int v3 = -[VCPDatabaseWriter setValue:forKey:]( self,  "setValue:forKey:",  v11,  VCPKeyValueNumberOfAssetsAnalyzedForPhotosFaceProcessing);

      if (!v3)
      {
        uint64_t v12 = VCPAnalysisCountPrioritizedProcessedKey;
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:VCPAnalysisCountPrioritizedProcessedKey]);
        id v14 = [v13 longLongValue];
        int v3 = -[VCPDatabaseWriter setValue:forKey:]( self,  "setValue:forKey:",  v14,  VCPKeyValuePrioritizedProcessedForPhotosFaceProcessing);

        if (!v3)
        {
          uint64_t v15 = VCPAnalysisCountPrioritizedTotalAllowedKey;
          unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:VCPAnalysisCountPrioritizedTotalAllowedKey]);
          id v17 = [v16 longLongValue];
          int v3 = -[VCPDatabaseWriter setValue:forKey:]( self,  "setValue:forKey:",  v17,  VCPKeyValuePrioritizedTotalAllowedForPhotosFaceProcessing);

          if (!v3)
          {
            uint64_t v18 = -[VCPDatabaseWriter commit](self, "commit");
            int v3 = v18;
            if (!(_DWORD)v18)
            {
              uint64_t v20 = MediaAnalysisLogLevel(v18, v19);
              if ((int)v20 >= 5)
              {
                uint64_t v22 = VCPLogInstance(v20, v21);
                int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
                os_log_type_t v24 = VCPLogToOSLogType[5];
                if (os_log_type_enabled(v23, v24))
                {
                  unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v9]);
                  os_log_type_t v26 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
                  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v12]);
                  int v28 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v15]);
                  *(_DWORD *)buf = 138413058;
                  __int16 v32 = v25;
                  __int16 v33 = 2112;
                  uint64_t v34 = v26;
                  __int16 v35 = 2112;
                  __int16 v36 = v27;
                  __int16 v37 = 2112;
                  __int16 v38 = v28;
                  _os_log_impl( (void *)&_mh_execute_header,  v23,  v24,  "Cached face progress: %@ out of %@, and prioritized %@ out of %@",  buf,  0x2Au);
                }
              }

              int v3 = 0;
            }
          }
        }
      }
    }
  }

  return v3;
}

- (int)cacheProcessedAssetCountAfterPromoter:(unint64_t)a3
{
  int v5 = -[VCPDatabaseWriter setValue:forKey:]( self,  "setValue:forKey:",  a3,  VCPKeyValueNumberOfProcessedAssetsAfterPromoterForPhotosFaceProcessing);
  if (!v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v6 timeIntervalSinceReferenceDate];
    int v5 = -[VCPDatabaseWriter setValue:forKey:](self, "setValue:forKey:", (uint64_t)v7, VCPKeyValueLastPromoterTimestamp);
    if (!v5)
    {
      uint64_t v8 = -[VCPDatabaseWriter commit](self, "commit");
      int v5 = v8;
      if (!(_DWORD)v8)
      {
        uint64_t v10 = MediaAnalysisLogLevel(v8, v9);
        if ((int)v10 >= 5)
        {
          uint64_t v12 = VCPLogInstance(v10, v11);
          id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          os_log_type_t v14 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v13, v14))
          {
            int v16 = 134218242;
            unint64_t v17 = a3;
            __int16 v18 = 2112;
            uint64_t v19 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  v14,  "Cache processed asset count after promoter: %lu (promoter date: %@)",  (uint8_t *)&v16,  0x16u);
          }
        }

        int v5 = 0;
      }
    }
  }

  return v5;
}

- (unint64_t)countOfAssetsWithMediaAnalysisResultsType:(unint64_t)a3
{
  uint64_t v5 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v5)
  {
    uint64_t v7 = VCPLogInstance(v5, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3626;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(DataCollection) countOfAssetsWithMediaAnalysisResultsType:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  *(void *)&buf[24] = 0LL;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10004527C;
  v19[3] = &unk_1001BAB20;
  void v19[5] = buf;
  v19[6] = a3;
  void v19[4] = self;
  uint64_t v9 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v19,  0LL,  0LL);
  int v11 = v9;
  if ((_DWORD)v9)
  {
    uint64_t v12 = MediaAnalysisLogLevel(v9, v10);
    if ((int)v12 >= 5)
    {
      uint64_t v14 = VCPLogInstance(v12, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      os_log_type_t v16 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v15, v16))
      {
        *(_DWORD *)uint64_t v20 = 67109120;
        int v21 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "Failed to query countOfAssetsWithMediaAnalysisResultsType - %d",  v20,  8u);
      }
    }

    unint64_t v17 = 0LL;
  }

  else
  {
    unint64_t v17 = *(void *)(*(void *)&buf[8] + 24LL);
  }

  _Block_object_dispose(buf, 8);
  return v17;
}

+ (id)databaseWithFilepath:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithFilepath:v4];

  return v5;
}

- (int)restoreAnalysis:(id)a3 forLocalIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = MediaAnalysisEnableDatabaseLog(v7, v8);
  if ((_DWORD)v9)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      int v21 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v22 = 1024;
      int v23 = 3665;
      __int16 v24 = 2080;
      unint64_t v25 = "-[VCPDatabaseWriter(BackupRestore) restoreAnalysis:forLocalIdentifier:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000455F0;
  v17[3] = &unk_1001BA960;
  v17[4] = self;
  id v13 = v6;
  id v18 = v13;
  id v14 = v7;
  id v19 = v14;
  int v15 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v17,  &stru_1001BAD90,  1LL);

  return v15;
}

- (int)flushWAL
{
  uint64_t v3 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v3)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3674;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(BackupRestore) flushWAL]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  int v7 = -[VCPDatabaseWriter commit](self, "commit");
  if (!v7)
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    *(_DWORD *)&buf[24] = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100045780;
    v9[3] = &unk_1001BADB8;
    v9[4] = self;
    v9[5] = buf;
    -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v9,  0LL,  0LL);
    int v7 = *(_DWORD *)(*(void *)&buf[8] + 24LL);
    _Block_object_dispose(buf, 8);
  }

  return v7;
}

- (unint64_t)analysisRecordsModifiedSinceDate:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MediaAnalysisEnableDatabaseLog(v4, v5);
  if ((_DWORD)v6)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3687;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "-[VCPDatabaseWriter(BackupRestore) analysisRecordsModifiedSinceDate:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  *(void *)&buf[24] = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10004596C;
  v13[3] = &unk_1001BA9F8;
  v13[4] = self;
  id v10 = v4;
  id v14 = v10;
  int v15 = buf;
  -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v13,  0LL,  0LL);
  unint64_t v11 = *(void *)(*(void *)&buf[8] + 24LL);

  _Block_object_dispose(buf, 8);
  return v11;
}

- (int)fetchMomentsScheduledAssetEntries:(id *)a3 forTaskID:(unint64_t)a4
{
  uint64_t v7 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v7)
  {
    uint64_t v9 = VCPLogInstance(v7, v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v14 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v15 = 1024;
      int v16 = 3718;
      __int16 v17 = 2080;
      id v18 = "-[VCPDatabaseWriter(MomentsScheduledAssets) fetchMomentsScheduledAssetEntries:forTaskID:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100045CB8;
  v12[3] = &unk_1001BA8E8;
  v12[4] = self;
  void v12[5] = a4;
  void v12[6] = a3;
  return -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v12,  0LL,  0LL);
}

- (int)fetchAllMomentsScheduledAssets:(id *)a3
{
  uint64_t v5 = MediaAnalysisEnableDatabaseLog(self, a2);
  if ((_DWORD)v5)
  {
    uint64_t v7 = VCPLogInstance(v5, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v13 = 1024;
      int v14 = 3753;
      __int16 v15 = 2080;
      int v16 = "-[VCPDatabaseWriter(MomentsScheduledAssets) fetchAllMomentsScheduledAssets:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100046148;
  v10[3] = &unk_1001BA910;
  v10[4] = self;
  void v10[5] = a3;
  return -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v10,  0LL,  0LL);
}

- (int)setMomentsScheduledAssetWithLocalIdentifier:(id)a3 andTaskID:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v8 = MediaAnalysisEnableDatabaseLog(v6, v7);
  if ((_DWORD)v8)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    unint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v21 = 1024;
      int v22 = 3792;
      __int16 v23 = 2080;
      __int16 v24 = "-[VCPDatabaseWriter(MomentsScheduledAssets) setMomentsScheduledAssetWithLocalIdentifier:andTaskID:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100046638;
  v16[3] = &unk_1001BA9B0;
  void v16[4] = self;
  unint64_t v18 = a4;
  id v12 = v6;
  id v17 = v12;
  __int16 v13 = objc_retainBlock(v16);
  int v14 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v13,  v13,  1LL);

  return v14;
}

- (int)removeMomentsScheduledAssetWithLocalIdentifier:(id)a3 andTaskID:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v8 = MediaAnalysisEnableDatabaseLog(v6, v7);
  if ((_DWORD)v8)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    unint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v19 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/Daemon/Photos/DatabaseWriter.mm";
      __int16 v20 = 1024;
      int v21 = 3813;
      __int16 v22 = 2080;
      __int16 v23 = "-[VCPDatabaseWriter(MomentsScheduledAssets) removeMomentsScheduledAssetWithLocalIdentifier:andTaskID:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
    }
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000469C8;
  v15[3] = &unk_1001BA9B0;
  v15[4] = self;
  unint64_t v17 = a4;
  id v12 = v6;
  id v16 = v12;
  int v13 = -[VCPDatabaseWriter executeDatabaseBlock:fallbackBlock:write:]( self,  "executeDatabaseBlock:fallbackBlock:write:",  v15,  0LL,  1LL);

  return v13;
}

@end