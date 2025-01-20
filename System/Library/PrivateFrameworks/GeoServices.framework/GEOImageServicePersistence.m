@interface GEOImageServicePersistence
- (BOOL)_deleteAndRecreateDB;
- (BOOL)_setup:(id)a3;
- (GEOImageServicePersistence)init;
- (GEOImageServicePersistence)initWithDBFileURL:(id)a3;
- (GEOImageServicePersistence)initWithDBFileURL:(id)a3 maximumTotalDataSize:(unint64_t)UInteger maximumAge:(double)Double;
- (unint64_t)_evictAssetsOlderThanAllowedThreshold;
- (unint64_t)_shrinkBySize:(unint64_t)a3;
- (unint64_t)_shrinkToSize:(unint64_t)a3;
- (unint64_t)calculateFreeableSize;
- (unint64_t)shrinkBySize:(unint64_t)a3;
- (unint64_t)shrinkToSize:(unint64_t)a3;
- (void)_evictIfNecessary;
- (void)_updateDataSizeOnDBQueue;
- (void)addData:(id)a3 forIdentifier:(id)a4 width:(unsigned int)a5 height:(unsigned int)a6;
- (void)getDataForIdentifier:(id)a3 width:(unsigned int)a4 height:(unsigned int)a5 callbackQueue:(id)a6 callback:(id)a7;
- (void)tearDown;
@end

@implementation GEOImageServicePersistence

- (GEOImageServicePersistence)init
{
  return -[GEOImageServicePersistence initWithDBFileURL:](self, "initWithDBFileURL:", 0LL);
}

- (GEOImageServicePersistence)initWithDBFileURL:(id)a3
{
  return -[GEOImageServicePersistence initWithDBFileURL:maximumTotalDataSize:maximumAge:]( self,  "initWithDBFileURL:maximumTotalDataSize:maximumAge:",  a3,  0LL,  -1.0);
}

- (GEOImageServicePersistence)initWithDBFileURL:(id)a3 maximumTotalDataSize:(unint64_t)UInteger maximumAge:(double)Double
{
  id v8 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___GEOImageServicePersistence;
  v9 = -[GEOImageServicePersistence init](&v26, "init");
  if (v9)
  {
    if (!UInteger)
    {
      if ((unint64_t)GEOConfigGetUInteger( GeoServicesConfig_ImageServicePersistenceMaxBytes[0],  GeoServicesConfig_ImageServicePersistenceMaxBytes[1]) >> 23 > 0x18) {
        UInteger = 209715200LL;
      }
      else {
        UInteger = GEOConfigGetUInteger( GeoServicesConfig_ImageServicePersistenceMaxBytes[0],  GeoServicesConfig_ImageServicePersistenceMaxBytes[1]);
      }
    }

    v9->_maxTotalDataSize = UInteger;
    if (Double <= 0.0)
    {
      Double = 518400.0;
      if (GEOConfigGetDouble( GeoServicesConfig_ImageServicePersistenceMaxAge[0],  GeoServicesConfig_ImageServicePersistenceMaxAge[1]) < 518400.0) {
        Double = GEOConfigGetDouble( GeoServicesConfig_ImageServicePersistenceMaxAge[0],  GeoServicesConfig_ImageServicePersistenceMaxAge[1]);
      }
    }

    v9->_maximumAge = Double;
    if (v8)
    {
      v10 = (NSURL *)[v8 copy];
      dbFileURL = v9->_dbFileURL;
      v9->_dbFileURL = v10;
    }

    else
    {
      dbFileURL = (NSURL *)objc_claimAutoreleasedReturnValue(+[GEOFilePaths pathFor:](&OBJC_CLASS___GEOFilePaths, "pathFor:", 32794LL));
      uint64_t v12 = objc_claimAutoreleasedReturnValue(+[GEOFilePaths urlFor:](&OBJC_CLASS___GEOFilePaths, "urlFor:", 26LL));
      v13 = v9->_dbFileURL;
      v9->_dbFileURL = (NSURL *)v12;

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v9->_dbFileURL, "path"));
      +[GEOSQLiteDB migrateAllDBFilesFrom:to:](&OBJC_CLASS___GEOSQLiteDB, "migrateAllDBFilesFrom:to:", dbFileURL, v14);
    }

    objc_initWeak(&location, v9);
    v15 = objc_alloc(&OBJC_CLASS___GEOSQLiteDB);
    id v16 = sub_100027DE8();
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = v9->_dbFileURL;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100027E28;
    v23[3] = &unk_10005A298;
    objc_copyWeak(&v24, &location);
    v19 = -[GEOSQLiteDB initWithQueueName:log:databaseFileURL:sqliteFlags:pragmas:setupBlock:]( v15,  "initWithQueueName:log:databaseFileURL:sqliteFlags:pragmas:setupBlock:",  "com.apple.geod.ImageServicePersistence",  v17,  v18,  3145728LL,  0LL,  v23);
    db = v9->_db;
    v9->_db = v19;

    v21 = v9;
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (BOOL)_setup:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "user_version") != (id)1) {
    [v4 dropAllTables];
  }
  objc_msgSend(v4, "setUser_version:", 1);
  id v5 = sub_100027DE8();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v4;
  if (!objc_msgSend( v7,  "createTable:withDrop:",  "CREATE TABLE IF NOT EXISTS assets(   rowid INTEGER PRIMARY KEY NOT NULL,    identifier BLOB NO T NULL,    width INT NOT NULL,    height INT NOT NULL,    data_size INT NOT NULL,    data BLOB N OT NULL,    UNIQUE(identifier, width, height)   );",
                        0LL)
    || !objc_msgSend( v7,  "createTable:withDrop:",  "CREATE TABLE IF NOT EXISTS access_times(   asset_rowid INT NOT NULL REFERENCES assets(rowid) O N UPDATE CASCADE ON DELETE CASCADE,    timestamp INT,    UNIQUE(asset_rowid)   );",
                        0LL)
    || ![v7 createIndex:"CREATE INDEX IF NOT EXISTS access_times_asset_rowid_idx ON access_times (asset_rowid);"]
    || !objc_msgSend( v7,  "prepareStatement:forKey:",  "INSERT INTO assets    (rowid, identifier, width, height, data_size, data)    VALUES (NULL, @iden tifier, @width, @height, @data_size, @data);",
                        @"AddAsset")
    || (objc_msgSend( v7,  "prepareStatement:forKey:",  "INSERT OR REPLACE INTO access_times    (asset_rowid, timestamp)    VALUES (@asset_rowid, @timestamp);",
                        @"SetAccessTime") & 1) == 0)
  {

LABEL_16:
    BOOL v9 = 0;
    goto LABEL_14;
  }

  unsigned int v8 = objc_msgSend( v7,  "prepareStatement:forKey:",  "SELECT rowid, data    FROM assets    WHERE identifier = @identifier AND width = @width AND height = @height    LIMIT 1;",
                       @"FindAsset");

  if (!v8
    || !objc_msgSend( v7,  "prepareStatement:forKey:",  "SELECT COUNT(data_size), SUM(data_size) FROM assets;",
                        @"calculateDataSize")
    || ![v7 prepareStatement:"SELECT data_size FROM assets INNER JOIN access_times ON asset_rowid = assets.rowid ORDER BY timestamp ASC" forKey:@"enumerateDataSizeFromOldest"]
    || ![v7 prepareStatement:"DELETE FROM assets WHERE rowid IN (SELECT asset_rowid FROM access_times ORDER BY timestamp ASC LIMIT @limit)" forKey:@"deleteOldestNAssets"]
    || !objc_msgSend( v7,  "prepareStatement:forKey:",  "SELECT COUNT(data_size), SUM(data_size) FROM assets INNER JOIN access_times ON asset_rowid = ass ets.rowid WHERE timestamp < @timestamp",  @"getNumberOfOldEntries"))
  {
    goto LABEL_16;
  }

  -[GEOImageServicePersistence _evictAssetsOlderThanAllowedThreshold](self, "_evictAssetsOlderThanAllowedThreshold");
  -[GEOImageServicePersistence _updateDataSizeOnDBQueue](self, "_updateDataSizeOnDBQueue");
  BOOL v9 = 1;
LABEL_14:

  return v9;
}

- (void)tearDown
{
  db = self->_db;
  if (db)
  {
    id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GEOSQLiteDB isolationQueue](db, "isolationQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100028088;
    block[3] = &unk_100059190;
    block[4] = self;
    dispatch_sync(v4, block);
  }

- (void)_updateDataSizeOnDBQueue
{
  db = self->_db;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10002811C;
  v3[3] = &unk_10005A2C0;
  v3[4] = self;
  -[GEOSQLiteDB statementForKey:statementBlock:](db, "statementForKey:statementBlock:", @"calculateDataSize", v3);
}

- (void)_evictIfNecessary
{
  unint64_t totalDataSize = self->_totalDataSize;
  unint64_t maxTotalDataSize = self->_maxTotalDataSize;
  if (totalDataSize > maxTotalDataSize) {
    -[GEOImageServicePersistence _shrinkBySize:](self, "_shrinkBySize:", totalDataSize - maxTotalDataSize);
  }
}

- (unint64_t)_evictAssetsOlderThanAllowedThreshold
{
  unint64_t v3 = (unint64_t)(CFAbsoluteTimeGetCurrent() + kCFAbsoluteTimeIntervalSince1970 - self->_maximumAge);
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  int v21 = 0;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  uint64_t v17 = 0LL;
  db = self->_db;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000283AC;
  v13[3] = &unk_10005A2E8;
  v13[4] = self;
  v13[5] = &v18;
  v13[6] = &v14;
  v13[7] = v3;
  -[GEOSQLiteDB statementForKey:statementBlock:]( db,  "statementForKey:statementBlock:",  @"getNumberOfOldEntries",  v13);
  if (!*((_DWORD *)v19 + 6)) {
    goto LABEL_6;
  }
  id v5 = sub_100027DE8();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = *((_DWORD *)v19 + 6);
    uint64_t v8 = v15[3];
    *(_DWORD *)buf = 67109376;
    int v23 = v7;
    __int16 v24 = 2048;
    uint64_t v25 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Deleting %d assets older than allowed threshold (%{bytes}llu)",  buf,  0x12u);
  }

  BOOL v9 = self->_db;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100028458;
  v12[3] = &unk_10005A310;
  v12[4] = self;
  v12[5] = &v18;
  if (-[GEOSQLiteDB executeStatement:statementBlock:]( v9,  "executeStatement:statementBlock:",  @"deleteOldestNAssets",  v12)) {
    unint64_t v10 = v15[3];
  }
  else {
LABEL_6:
  }
    unint64_t v10 = 0LL;
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v10;
}

- (BOOL)_deleteAndRecreateDB
{
  unsigned int v3 = -[GEOSQLiteDB deleteAllDBFiles](self->_db, "deleteAllDBFiles");
  if (v3)
  {
    self->_unint64_t totalDataSize = 0LL;
    LOBYTE(v3) = -[GEOSQLiteDB setup](self->_db, "setup");
  }

  return v3;
}

- (unint64_t)_shrinkToSize:(unint64_t)a3
{
  unint64_t totalDataSize = self->_totalDataSize;
  if (a3)
  {
    if (totalDataSize > a3) {
      return -[GEOImageServicePersistence _shrinkBySize:](self, "_shrinkBySize:");
    }
    return 0LL;
  }

  else
  {
    -[GEOImageServicePersistence _deleteAndRecreateDB](self, "_deleteAndRecreateDB");
  }

  return totalDataSize;
}

- (unint64_t)_shrinkBySize:(unint64_t)a3
{
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  int v21 = 0;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  uint64_t v17 = 0LL;
  db = self->_db;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000286E0;
  v13[3] = &unk_10005A338;
  v13[4] = self;
  v13[5] = &v18;
  v13[6] = &v14;
  v13[7] = 0LL;
  void v13[8] = a3;
  -[GEOSQLiteDB statementForKey:statementBlock:]( db,  "statementForKey:statementBlock:",  @"enumerateDataSizeFromOldest",  v13);
  if (!*((_DWORD *)v19 + 6)) {
    goto LABEL_6;
  }
  id v5 = sub_100027DE8();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = *((_DWORD *)v19 + 6);
    uint64_t v8 = v15[3];
    *(_DWORD *)buf = 67109376;
    int v23 = v7;
    __int16 v24 = 2048;
    uint64_t v25 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Deleting %d oldest assets (%{bytes}llu)",  buf,  0x12u);
  }

  BOOL v9 = self->_db;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002876C;
  v12[3] = &unk_10005A310;
  v12[4] = self;
  v12[5] = &v18;
  if (-[GEOSQLiteDB executeStatement:statementBlock:]( v9,  "executeStatement:statementBlock:",  @"deleteOldestNAssets",  v12)) {
    unint64_t v10 = v15[3];
  }
  else {
LABEL_6:
  }
    unint64_t v10 = 0LL;
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v10;
}

- (unint64_t)calculateFreeableSize
{
  uint64_t v6 = 0LL;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  db = self->_db;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100028838;
  v5[3] = &unk_1000591B8;
  v5[4] = self;
  v5[5] = &v6;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)shrinkToSize:(unint64_t)a3
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  db = self->_db;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000288F8;
  v6[3] = &unk_100059660;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v6);
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (unint64_t)shrinkBySize:(unint64_t)a3
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  db = self->_db;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000289E0;
  v6[3] = &unk_100059660;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  -[GEOSQLiteDB executeSync:](db, "executeSync:", v6);
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)addData:(id)a3 forIdentifier:(id)a4 width:(unsigned int)a5 height:(unsigned int)a6
{
  id v10 = a3;
  id v11 = a4;
  db = self->_db;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100028ADC;
  v15[3] = &unk_100059F10;
  v15[4] = self;
  id v16 = v11;
  unsigned int v18 = a5;
  unsigned int v19 = a6;
  id v17 = v10;
  id v13 = v10;
  id v14 = v11;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v15);
}

- (void)getDataForIdentifier:(id)a3 width:(unsigned int)a4 height:(unsigned int)a5 callbackQueue:(id)a6 callback:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v15 = v14;
  if (v12 && v13 && v14)
  {
    db = self->_db;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100028F6C;
    v20[3] = &unk_10005A3B0;
    v20[4] = self;
    id v21 = v12;
    unsigned int v24 = a4;
    unsigned int v25 = a5;
    id v22 = v13;
    id v23 = v15;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10002923C;
    v17[3] = &unk_10005A3D8;
    id v18 = v22;
    id v19 = v23;
    -[GEOSQLiteDB executeAsync:errorHandler:](db, "executeAsync:errorHandler:", v20, v17);
  }
}

- (void).cxx_destruct
{
}

@end