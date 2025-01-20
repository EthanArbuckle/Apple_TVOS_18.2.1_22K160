@interface SBDML3UbiquitousDatabase
- (BOOL)_databaseHasEntryForEntity:(id)a3;
- (BOOL)_setValue:(id)a3 forDatabaseProperty:(id)a4;
- (BOOL)_updateUbiquitousDatabase_setBookmarkMetadataWithValuesFromTrackWithMetadataIdentifier:(id)a3 hasBeenPlayed:(BOOL)a4 playCount:(unint64_t)a5 bookmarkTime:(double)a6 timestamp:(double)a7 syncRevision:(int64_t)a8 usingConnection:(id)a9;
- (BOOL)hasLocalChangesToPush;
- (BOOL)hasRemoteChangesToPull;
- (BOOL)hasSyncedAtleastOnce;
- (BOOL)updateUbiquitousDatabaseByInsertingUbiquitousMetadataForTrackWithMetadataIdentifier:(id)a3 hasBeenPlayed:(BOOL)a4 playCount:(unint64_t)a5 bookmarkTime:(double)a6 timestamp:(double)a7 syncRevision:(int64_t)a8;
- (BOOL)updateUbiquitousDatabaseWithClientIdentity:(id)a3 persistUbiquitousMetadataWithEntity:(id)a4;
- (ML3MusicLibrary)musicLibrary;
- (NSDate)dateLastSynced;
- (NSDate)dateToSyncWithUbiquitousStore;
- (NSString)lastNotificationDomainVersion;
- (NSString)lastSyncedDomainVersion;
- (SBDML3UbiquitousDatabase)init;
- (SBDML3UbiquitousDatabase)initWithMusicLibrary:(id)a3;
- (id)_valueForDatabaseProperty:(id)a3;
- (id)readUbiquitousDatabaseMetadataValuesWithClientIdentity:(id)a3 identifier:(id)a4;
- (id)readUbiquitousDatabaseMetadataValuesWithClientIdentity:(id)a3 identifiers:(id)a4;
- (unint64_t)lastSyncedEntityRevision;
- (void)dumpUbiquitousMetadata;
- (void)setDateLastSynced:(id)a3;
- (void)setDateToSyncWithUbiquitousStore:(id)a3;
- (void)setLastNotificationDomainVersion:(id)a3;
- (void)setLastSyncedDomainVersion:(id)a3;
- (void)setLastSyncedEntityRevision:(unint64_t)a3;
- (void)updateMusicLibraryWithClientIdentity:(id)a3 applyUbiquitousBookmarkMetadataToTrackWithPersistentID:(int64_t)a4;
- (void)updateUbiquitousDatabaseByPerformingWriteTransactionWithBlock:(id)a3;
- (void)updateUbiquitousDatabaseByResetingSyncEntityRevisionForItemsWithMetadataIdentifiers:(id)a3;
- (void)updateUbiquitousDatabaseWithClientIdentity:(id)a3 removeUbiquitousMetadataFromTrackWithPersistentID:(int64_t)a4;
@end

@implementation SBDML3UbiquitousDatabase

- (SBDML3UbiquitousDatabase)initWithMusicLibrary:(id)a3
{
  id v4 = a3;
  if ([v4 supportsUPP])
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___SBDML3UbiquitousDatabase;
    v5 = -[SBDML3UbiquitousDatabase init](&v8, "init");
    v6 = v5;
    if (v5) {
      objc_storeWeak((id *)&v5->_musicLibrary, v4);
    }
  }

  else
  {

    v6 = 0LL;
  }

  return v6;
}

- (SBDML3UbiquitousDatabase)init
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v4 handleFailureInMethod:a2 object:self file:@"SBDML3UbiquitousDatabase.m" lineNumber:39 description:@"use initWithMusicLibrary:"];

  return self;
}

- (void)updateUbiquitousDatabaseByPerformingWriteTransactionWithBlock:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_musicLibrary);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100008B90;
  v7[3] = &unk_10001CA38;
  id v8 = v4;
  id v6 = v4;
  [WeakRetained performDatabaseTransactionWithBlock:v7];
}

- (id)_valueForDatabaseProperty:(id)a3
{
  p_musicLibrary = &self->_musicLibrary;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_musicLibrary);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained valueForDatabaseProperty:v4]);

  return v6;
}

- (BOOL)_setValue:(id)a3 forDatabaseProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "setting %@ to %@", (uint8_t *)&v12, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_musicLibrary);
  unsigned __int8 v10 = [WeakRetained setValue:v6 forDatabaseProperty:v7];

  return v10;
}

- (void)setLastSyncedEntityRevision:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[SBDML3UbiquitousDatabase _setValue:forDatabaseProperty:]( self,  "_setValue:forDatabaseProperty:",  v4,  @"MLUbiquitousBookmarkEntityRevisionAnchor");
}

- (unint64_t)lastSyncedEntityRevision
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[SBDML3UbiquitousDatabase _valueForDatabaseProperty:]( self,  "_valueForDatabaseProperty:",  @"MLUbiquitousBookmarkEntityRevisionAnchor"));
  id v3 = [v2 longLongValue];

  return (unint64_t)v3;
}

- (void)setLastSyncedDomainVersion:(id)a3
{
}

- (NSString)lastSyncedDomainVersion
{
  return (NSString *)-[SBDML3UbiquitousDatabase _valueForDatabaseProperty:]( self,  "_valueForDatabaseProperty:",  @"MPUbiquitousBookmarkDomainVersionAnchorToken");
}

- (void)setDateLastSynced:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[SBDML3UbiquitousDatabase _setValue:forDatabaseProperty:]( self,  "_setValue:forDatabaseProperty:",  v4,  @"MPDateLastSynced");
}

- (NSDate)dateLastSynced
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[SBDML3UbiquitousDatabase _valueForDatabaseProperty:]( self,  "_valueForDatabaseProperty:",  @"MPDateLastSynced"));
  if ((objc_opt_respondsToSelector(v2, "doubleValue") & 1) != 0)
  {
    [v2 doubleValue];
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  }

  else
  {
    id v3 = 0LL;
  }

  return (NSDate *)v3;
}

- (void)setLastNotificationDomainVersion:(id)a3
{
}

- (NSString)lastNotificationDomainVersion
{
  return (NSString *)-[SBDML3UbiquitousDatabase _valueForDatabaseProperty:]( self,  "_valueForDatabaseProperty:",  @"MPUbiquitousBookmarkDomainVersionRemoteToken");
}

- (void)setDateToSyncWithUbiquitousStore:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[SBDML3UbiquitousDatabase _setValue:forDatabaseProperty:]( self,  "_setValue:forDatabaseProperty:",  v4,  @"MPDateToSyncWithUbiquitousStore");
}

- (NSDate)dateToSyncWithUbiquitousStore
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[SBDML3UbiquitousDatabase _valueForDatabaseProperty:]( self,  "_valueForDatabaseProperty:",  @"MPDateToSyncWithUbiquitousStore"));
  if ((objc_opt_respondsToSelector(v2, "doubleValue") & 1) != 0)
  {
    [v2 doubleValue];
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  }

  else
  {
    id v3 = 0LL;
  }

  return (NSDate *)v3;
}

- (BOOL)_updateUbiquitousDatabase_setBookmarkMetadataWithValuesFromTrackWithMetadataIdentifier:(id)a3 hasBeenPlayed:(BOOL)a4 playCount:(unint64_t)a5 bookmarkTime:(double)a6 timestamp:(double)a7 syncRevision:(int64_t)a8 usingConnection:(id)a9
{
  BOOL v14 = a4;
  id v15 = a3;
  id v16 = a9;
  if (![v15 length])
  {
LABEL_7:
    BOOL v24 = 0;
    goto LABEL_8;
  }

  v29[0] = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  v29[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v14));
  v29[2] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a6));
  v29[3] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a7));
  v29[4] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a8));
  v29[5] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 6LL));
  unsigned __int8 v23 = objc_msgSend( v16,  "executeUpdate:withParameters:error:",  @"INSERT OR REPLACE INTO cloud_kvs (key, play_count_user, has_been_played, bookmark_time_ms, bookmark_sync_timestamp, bookmark_sync_revision) VALUES (?, ?, ?, ?, ?, ?)",  v22,  0);

  if ((v23 & 1) == 0)
  {
    v25 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v27 = 138412290;
      id v28 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "failed to update ubiquitous bookmarkmatadata for metadata identifier %@.",  (uint8_t *)&v27,  0xCu);
    }

    goto LABEL_7;
  }

  BOOL v24 = 1;
LABEL_8:

  return v24;
}

- (BOOL)updateUbiquitousDatabaseByInsertingUbiquitousMetadataForTrackWithMetadataIdentifier:(id)a3 hasBeenPlayed:(BOOL)a4 playCount:(unint64_t)a5 bookmarkTime:(double)a6 timestamp:(double)a7 syncRevision:(int64_t)a8
{
  id v14 = a3;
  uint64_t v26 = 0LL;
  int v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  if ([v14 length])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_musicLibrary);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100008B3C;
    v18[3] = &unk_10001CA60;
    v20 = &v26;
    v18[4] = self;
    BOOL v25 = a4;
    id v19 = v14;
    unint64_t v21 = a5;
    double v22 = a6;
    double v23 = a7;
    int64_t v24 = a8;
    [WeakRetained performDatabaseTransactionWithBlock:v18];
  }

  char v16 = *((_BYTE *)v27 + 24);
  _Block_object_dispose(&v26, 8);

  return v16;
}

- (BOOL)updateUbiquitousDatabaseWithClientIdentity:(id)a3 persistUbiquitousMetadataWithEntity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0LL;
  unint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 0;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 ubiquitousIdentifier]);
  id v9 = [v8 length];

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_musicLibrary);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100008320;
    v14[3] = &unk_10001CAD8;
    id v15 = v6;
    char v16 = self;
    id v17 = v7;
    id v11 = WeakRetained;
    id v18 = v11;
    id v19 = &v20;
    [v11 performDatabaseTransactionWithBlock:v14];
    int v12 = *((unsigned __int8 *)v21 + 24);
  }

  else
  {
    int v12 = *((unsigned __int8 *)v21 + 24);
  }

  _Block_object_dispose(&v20, 8);

  return v12 != 0;
}

- (BOOL)_databaseHasEntryForEntity:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_musicLibrary);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000823C;
  v8[3] = &unk_10001CB00;
  id v6 = v4;
  id v9 = v6;
  unsigned __int8 v10 = &v11;
  [WeakRetained databaseConnectionAllowingWrites:0 withBlock:v8];

  LOBYTE(WeakRetained) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)WeakRetained;
}

- (void)updateUbiquitousDatabaseWithClientIdentity:(id)a3 removeUbiquitousMetadataFromTrackWithPersistentID:(int64_t)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_musicLibrary);
  id v8 = -[ML3Track initWithPersistentID:inLibrary:]( objc_alloc(&OBJC_CLASS___ML3Track),  "initWithPersistentID:inLibrary:",  a4,  WeakRetained);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ML3Track valueForProperty:](v8, "valueForProperty:", ML3TrackPropertyStoreBookmarkMetadataIdentifier));
  if ([v9 length])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10000816C;
    v10[3] = &unk_10001CB28;
    id v11 = v6;
    id v12 = v9;
    [WeakRetained databaseConnectionAllowingWrites:1 withBlock:v10];
  }
}

- (void)updateMusicLibraryWithClientIdentity:(id)a3 applyUbiquitousBookmarkMetadataToTrackWithPersistentID:(int64_t)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100007C48;
  v8[3] = &unk_10001CE48;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_musicLibrary);
  id v11 = self;
  int64_t v12 = a4;
  id v6 = WeakRetained;
  id v7 = v9;
  [v6 performDatabaseTransactionWithBlock:v8];
}

- (void)updateUbiquitousDatabaseByResetingSyncEntityRevisionForItemsWithMetadataIdentifiers:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[ML3DatabaseStatementRenderer defaultRenderer]( &OBJC_CLASS___ML3DatabaseStatementRenderer,  "defaultRenderer"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "statementWithPrefix:inParameterCount:",  @"UPDATE cloud_kvs SET bookmark_sync_revision = 0 WHERE key",  objc_msgSend(v4, "count")));
    id WeakRetained = objc_loadWeakRetained((id *)&self->_musicLibrary);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100007BE8;
    v9[3] = &unk_10001CB28;
    id v10 = v6;
    id v11 = v4;
    id v8 = v6;
    [WeakRetained databaseConnectionAllowingWrites:1 withBlock:v9];
  }
}

- (id)readUbiquitousDatabaseMetadataValuesWithClientIdentity:(id)a3 identifier:(id)a4
{
  id v12 = a4;
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SBDML3UbiquitousDatabase readUbiquitousDatabaseMetadataValuesWithClientIdentity:identifiers:]( self,  "readUbiquitousDatabaseMetadataValuesWithClientIdentity:identifiers:",  v7,  v8,  v12));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

  return v10;
}

- (id)readUbiquitousDatabaseMetadataValuesWithClientIdentity:(id)a3 identifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    uint64_t v17 = 0LL;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000LL;
    uint64_t v20 = sub_1000078B0;
    unint64_t v21 = sub_1000078C0;
    uint64_t v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_musicLibrary);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000078C8;
    v12[3] = &unk_10001CBC8;
    id v13 = v6;
    id v14 = v7;
    id v9 = WeakRetained;
    id v15 = v9;
    char v16 = &v17;
    [v9 databaseConnectionAllowingWrites:0 withBlock:v12];
    id v10 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }

  else
  {
    id v10 = &__NSArray0__struct;
  }

  return v10;
}

- (BOOL)hasSyncedAtleastOnce
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[SBDML3UbiquitousDatabase _valueForDatabaseProperty:]( self,  "_valueForDatabaseProperty:",  @"MPUbiquitousBookmarkDomainVersionAnchorToken"));
  BOOL v5 = 0;
  if (v2)
  {
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v2, v3) & 1) == 0
      || [v2 length] && (objc_msgSend(v2, "isEqualToString:", @"0") & 1) == 0)
    {
      uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
    }
  }

  return v5;
}

- (BOOL)hasRemoteChangesToPull
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SBDML3UbiquitousDatabase lastSyncedDomainVersion](self, "lastSyncedDomainVersion"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SBDML3UbiquitousDatabase lastNotificationDomainVersion](self, "lastNotificationDomainVersion"));
  char v5 = [v4 isEqual:v3] ^ 1;

  return v5;
}

- (BOOL)hasLocalChangesToPush
{
  unint64_t v3 = -[SBDML3UbiquitousDatabase lastSyncedEntityRevision](self, "lastSyncedEntityRevision");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SBDML3UbiquitousDatabase musicLibrary](self, "musicLibrary"));
  uint64_t v5 = ML3TrackPropertyStoreBookmarkMetadataEntityRevision;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:value:comparison:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:value:comparison:",  v5,  v6,  3LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ML3Track anyInLibrary:predicate:](&OBJC_CLASS___ML3Track, "anyInLibrary:predicate:", v4, v7));

  return v8 != 0LL;
}

- (void)dumpUbiquitousMetadata
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SBDML3UbiquitousDatabase musicLibrary](self, "musicLibrary"));
  [v2 performDatabaseTransactionWithBlock:&stru_10001CC08];
}

- (ML3MusicLibrary)musicLibrary
{
  return (ML3MusicLibrary *)objc_loadWeakRetained((id *)&self->_musicLibrary);
}

- (void).cxx_destruct
{
}

@end