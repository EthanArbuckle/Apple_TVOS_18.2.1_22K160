@interface ML3MusicLibrary
- (BOOL)_updateUbiquitousDatabaseWithEntity:(id)a3 syncRevision:(int64_t)a4 usingConnection:(id)a5;
- (BOOL)removeAllUbiquitousMetadataUsingClientIdentity:(id)a3 error:(id *)a4;
- (BOOL)updateMusicLibraryWithClientIdentity:(id)a3 applyUbiquitousBookmarkMetadataToTrackWithPersistentID:(int64_t)a4;
- (BOOL)updateUbiquitousDatabaseWithClientIdentity:(id)a3 removeUbiquitousMetadataFromTrackWithPersistentID:(int64_t)a4 error:(id *)a5;
- (BOOL)updateWithEntity:(id)a3 clientIdentity:(id)a4;
- (NSDate)dateLastSynced;
- (NSString)lastNotificationDomainVersion;
- (NSString)lastSyncedDomainVersion;
- (id)_keyValueStoreItemIdentifierForItem:(id)a3;
- (id)_kvsEntityWithKVSKey:(id)a3 domain:(id)a4;
- (id)_queryForTracksNeedingPushWithEntityRevisionAnchor:(unint64_t)a3 orderingTerms:(id)a4;
- (id)_sqlQueryStringForItemsNeedingPush;
- (id)beginTransactionWithItemsToSyncWithDomain:(id)a3 enumerationBlock:(id)a4;
- (id)readUbiquitousDatabaseMetadataValuesForIdentifiers:(id)a3 forDomain:(id)a4 clientIdentity:(id)a5;
- (int64_t)icd_preferredVideoQuality;
- (int64_t)icd_sagaCloudAddToPlaylistBehavior;
- (int64_t)icd_sagaCloudFavoriteSongAddToLibraryBehavior;
- (int64_t)icd_sagaDatabaseUserVersion;
- (unint64_t)lastSyncedEntityRevision;
- (void)_populateMetadataValues:(id)a3 fromDataSourceTrack:(id)a4;
- (void)_updateDatabaseByResetingSyncEntityRevisionForItemsWithIdentifiers:(id)a3;
- (void)commitUniversalPlaybackPositions:(id)a3 context:(id)a4 domain:(id)a5 domainVersion:(id)a6;
- (void)icd_setPreferredVideoQuality:(int64_t)a3;
- (void)icd_setSagaCloudAddToPlaylistBehavior:(int64_t)a3;
- (void)icd_setSagaCloudFavoriteSongAddToLibraryBehavior:(int64_t)a3;
- (void)icd_setSagaDatabaseUserVersion:(int64_t)a3;
- (void)setDateLastSynced:(id)a3;
- (void)setLastNotificationDomainVersion:(id)a3;
- (void)setLastSyncedDomainVersion:(id)a3;
- (void)setLastSyncedEntityRevision:(unint64_t)a3;
@end

@implementation ML3MusicLibrary

- (int64_t)icd_sagaDatabaseUserVersion
{
  return (int64_t)-[ML3MusicLibrary sagaDatabaseUserVersion](self, "sagaDatabaseUserVersion");
}

- (void)icd_setSagaDatabaseUserVersion:(int64_t)a3
{
}

- (int64_t)icd_sagaCloudAddToPlaylistBehavior
{
  id v2 = -[ML3MusicLibrary sagaCloudAddToPlaylistBehavior](self, "sagaCloudAddToPlaylistBehavior");
  if (v2 == (id)1) {
    return 1LL;
  }
  else {
    return 2LL * (v2 == (id)2);
  }
}

- (int64_t)icd_sagaCloudFavoriteSongAddToLibraryBehavior
{
  int64_t result = (int64_t)-[ML3MusicLibrary sagaCloudAddToPlaylistBehavior](self, "sagaCloudAddToPlaylistBehavior");
  if (result != 2) {
    return result == 1;
  }
  return result;
}

- (void)icd_setSagaCloudAddToPlaylistBehavior:(int64_t)a3
{
  if (a3 == 1) {
    uint64_t v3 = 1LL;
  }
  else {
    uint64_t v3 = 2LL * (a3 == 2);
  }
  -[ML3MusicLibrary setSagaCloudAddToPlaylistBehavior:](self, "setSagaCloudAddToPlaylistBehavior:", v3);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification( DarwinNotifyCenter,  ICCloudClientCloudAddToPlaylistBehaviorDidChangeNotification,  0LL,  0LL,  1u);
}

- (void)icd_setSagaCloudFavoriteSongAddToLibraryBehavior:(int64_t)a3
{
  if (a3 == 1) {
    uint64_t v3 = 1LL;
  }
  else {
    uint64_t v3 = 2LL * (a3 == 2);
  }
  -[ML3MusicLibrary setSagaCloudFavoriteSongAddToLibraryBehavior:]( self,  "setSagaCloudFavoriteSongAddToLibraryBehavior:",  v3);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification( DarwinNotifyCenter,  ICCloudClientCloudFavoriteSongAddToLibraryBehaviorDidChangeNotification,  0LL,  0LL,  1u);
}

- (int64_t)icd_preferredVideoQuality
{
  int64_t result = (int64_t)-[ML3MusicLibrary preferredVideoQuality](self, "preferredVideoQuality");
  return result;
}

- (void)icd_setPreferredVideoQuality:(int64_t)a3
{
}

- (unint64_t)lastSyncedEntityRevision
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( -[ML3MusicLibrary valueForDatabaseProperty:]( self,  "valueForDatabaseProperty:",  @"MLUbiquitousBookmarkEntityRevisionAnchor"));
  id v3 = [v2 longLongValue];

  return (unint64_t)v3;
}

- (void)setLastSyncedEntityRevision:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[ML3MusicLibrary setValue:forDatabaseProperty:]( self,  "setValue:forDatabaseProperty:",  v4,  @"MLUbiquitousBookmarkEntityRevisionAnchor");
}

- (NSString)lastSyncedDomainVersion
{
  return (NSString *)-[ML3MusicLibrary valueForDatabaseProperty:]( self,  "valueForDatabaseProperty:",  @"MPUbiquitousBookmarkDomainVersionAnchorToken");
}

- (void)setLastSyncedDomainVersion:(id)a3
{
}

- (NSDate)dateLastSynced
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( -[ML3MusicLibrary valueForDatabaseProperty:]( self,  "valueForDatabaseProperty:",  @"MPDateLastSynced"));
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

- (void)setDateLastSynced:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[ML3MusicLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v4, @"MPDateLastSynced");
}

- (NSString)lastNotificationDomainVersion
{
  return (NSString *)-[ML3MusicLibrary valueForDatabaseProperty:]( self,  "valueForDatabaseProperty:",  @"MPUbiquitousBookmarkDomainVersionRemoteToken");
}

- (void)setLastNotificationDomainVersion:(id)a3
{
}

- (id)beginTransactionWithItemsToSyncWithDomain:(id)a3 enumerationBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000A70EC;
  v15[3] = &unk_1001A4548;
  v15[4] = self;
  v8 =  -[ICDPlaybackPositionDatabaseContext initWithLibrary:]( objc_alloc(&OBJC_CLASS___ICDPlaybackPositionDatabaseContext),  "initWithLibrary:",  self);
  v16 = v8;
  id v17 = v6;
  id v18 = v7;
  id v9 = v7;
  id v10 = v6;
  v11 = self;
  -[ML3MusicLibrary performReadOnlyDatabaseTransactionWithBlock:]( v11,  "performReadOnlyDatabaseTransactionWithBlock:",  v15);
  v12 = v18;
  v13 = v8;

  return v13;
}

- (void)commitUniversalPlaybackPositions:(id)a3 context:(id)a4 domain:(id)a5 domainVersion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v35 = a5;
  id v36 = a6;
  v37 = v11;
  id v34 = [v11 transactionEntityRevision];
  v12 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v54 = self;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting commit", buf, 0xCu);
  }

  v13 = self;

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id obj = v10;
  id v15 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v49;
    uint64_t v18 = ML3TrackPropertyStoreBookmarkMetadataIdentifier;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v49 != v17) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)i);
        v21 = (void *)objc_claimAutoreleasedReturnValue([v20 playbackPositionKey]);
        if (v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToValue:",  v18,  v21));
          v23 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Track anyInLibrary:predicate:]( &OBJC_CLASS___ML3Track,  "anyInLibrary:predicate:",  v13,  v22));

          if (v23)
          {
            [v14 setObject:v23 forKey:v20];
          }

          else
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
            [v14 setObject:v24 forKey:v20];
          }
        }
      }

      id v16 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    }

    while (v16);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_1000A6C44;
  v44[3] = &unk_1001A4598;
  id v26 = v14;
  id v45 = v26;
  id v47 = v34;
  id v27 = v25;
  id v46 = v27;
  -[ML3MusicLibrary performDatabaseTransactionWithBlock:](v13, "performDatabaseTransactionWithBlock:", v44);
  v28 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v54 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Done Updating Local Items",  buf,  0xCu);
  }

  [v26 removeObjectsForKeys:v27];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1000A6CBC;
  v39[3] = &unk_1001A45E8;
  v39[4] = v13;
  id v40 = v36;
  id v41 = v26;
  id v42 = v35;
  id v43 = v34;
  id v29 = v35;
  id v30 = v26;
  id v31 = v36;
  -[ML3MusicLibrary performDatabaseTransactionWithBlock:](v13, "performDatabaseTransactionWithBlock:", v39);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v37 ubiquitousIdentifiersToSync]);
  -[ML3MusicLibrary _updateDatabaseByResetingSyncEntityRevisionForItemsWithIdentifiers:]( v13,  "_updateDatabaseByResetingSyncEntityRevisionForItemsWithIdentifiers:",  v32);

  v33 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v54 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Done Updating ubiquitous_bookmarks table (all items)",  buf,  0xCu);
  }
}

- (id)readUbiquitousDatabaseMetadataValuesForIdentifiers:(id)a3 forDomain:(id)a4 clientIdentity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    uint64_t v18 = 0LL;
    v19 = &v18;
    uint64_t v20 = 0x3032000000LL;
    v21 = sub_1000A5870;
    v22 = sub_1000A5880;
    v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000A6920;
    v13[3] = &unk_1001A4E88;
    id v14 = v10;
    id v15 = v8;
    id v16 = v9;
    uint64_t v17 = &v18;
    -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:]( self,  "databaseConnectionAllowingWrites:withBlock:",  0LL,  v13);
    id v11 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
  }

  else
  {
    id v11 = &__NSArray0__struct;
  }

  return v11;
}

- (BOOL)removeAllUbiquitousMetadataUsingClientIdentity:(id)a3 error:(id *)a4
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = sub_1000A5870;
  uint64_t v17 = sub_1000A5880;
  id v18 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000A6874;
  v9[3] = &unk_1001A4638;
  id v6 = a3;
  id v10 = v6;
  id v11 = &v19;
  v12 = &v13;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:]( self,  "databaseConnectionAllowingWrites:withBlock:",  1LL,  v9);
  if (*((_BYTE *)v20 + 24))
  {
    BOOL v7 = 1;
  }

  else
  {
    *a4 = (id) v14[5];
    BOOL v7 = *((_BYTE *)v20 + 24) != 0;
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

- (BOOL)updateMusicLibraryWithClientIdentity:(id)a3 applyUbiquitousBookmarkMetadataToTrackWithPersistentID:(int64_t)a4
{
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000A6450;
  v8[3] = &unk_1001A4688;
  id v6 = a3;
  id v9 = v6;
  id v10 = self;
  id v11 = &v13;
  int64_t v12 = a4;
  -[ML3MusicLibrary performDatabaseTransactionWithBlock:](self, "performDatabaseTransactionWithBlock:", v8);
  LOBYTE(a4) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return a4;
}

- (BOOL)updateWithEntity:(id)a3 clientIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 playbackPositionKey]);
  id v10 = [v9 length];

  if (v10)
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    char v21 = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000A5C44;
    v14[3] = &unk_1001A4700;
    id v15 = v7;
    id v16 = v6;
    id v18 = v8;
    uint64_t v19 = buf;
    uint64_t v17 = v18;
    -[ML3MusicLibrary performDatabaseTransactionWithBlock:](v18, "performDatabaseTransactionWithBlock:", v14);
    BOOL v11 = *(_BYTE *)(*(void *)&buf[8] + 24LL) != 0;

    _Block_object_dispose(buf, 8);
  }

  else
  {
    int64_t v12 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%{public}@ Entity has no playbackPositionKey. entity=%{public}@",  buf,  0x16u);
    }

    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)updateUbiquitousDatabaseWithClientIdentity:(id)a3 removeUbiquitousMetadataFromTrackWithPersistentID:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 0;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  char v21 = sub_1000A5870;
  char v22 = sub_1000A5880;
  id v23 = 0LL;
  id v9 = [[ML3Track alloc] initWithPersistentID:a4 inLibrary:self];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForProperty:ML3TrackPropertyStoreBookmarkMetadataIdentifier]);
  if ([v10 length])
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000A5B40;
    v13[3] = &unk_1001A4728;
    id v14 = v8;
    id v16 = &v24;
    id v15 = v10;
    uint64_t v17 = &v18;
    -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:]( self,  "databaseConnectionAllowingWrites:withBlock:",  1LL,  v13);
  }

  if (*((_BYTE *)v25 + 24))
  {
    BOOL v11 = 1;
  }

  else
  {
    *a5 = (id) v19[5];
    BOOL v11 = *((_BYTE *)v25 + 24) != 0;
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

- (void)_populateMetadataValues:(id)a3 fromDataSourceTrack:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[ML3MusicLibrary _keyValueStoreItemIdentifierForItem:]( self,  "_keyValueStoreItemIdentifierForItem:",  v6));
  [v16 setPlaybackPositionKey:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForProperty:ML3TrackPropertyStoreBookmarkMetadataTimestamp]);
  [v16 setBookmarkTimestamp:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForProperty:ML3TrackPropertyHasBeenPlayed]);
  [v16 setHasBeenPlayed:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForProperty:ML3TrackPropertyPlayCountUser]);
  [v16 setUserPlayCount:v10];

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForProperty:ML3TrackPropertyBookmarkTime]);
  [v16 setBookmarkTime:v11];

  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v16 bookmarkTime]);
  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v16 bookmarkTime]);
    [v13 doubleValue];
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v14 / 1000.0));
    [v16 setBookmarkTime:v15];
  }
}

- (id)_kvsEntityWithKVSKey:(id)a3 domain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_1000A5870;
  char v21 = sub_1000A5880;
  id v22 = 0LL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000A5888;
  v12[3] = &unk_1001A4778;
  id v8 = v6;
  id v13 = v8;
  id v16 = &v17;
  id v9 = v7;
  id v14 = v9;
  id v15 = self;
  -[ML3MusicLibrary performDatabaseTransactionWithBlock:](self, "performDatabaseTransactionWithBlock:", v12);
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (id)_keyValueStoreItemIdentifierForItem:(id)a3
{
  id v3 = a3;
  uint64_t v4 = ML3TrackPropertyStoreItemID;
  uint64_t v5 = ML3TrackPropertySubscriptionStoreItemID;
  v49[0] = ML3TrackPropertyStoreItemID;
  v49[1] = ML3TrackPropertySubscriptionStoreItemID;
  uint64_t v6 = ML3TrackPropertyMediaType;
  v49[2] = ML3TrackPropertyMediaType;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 3LL));
  id v8 = sub_1000A5740(v3, v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v6]);
  unsigned int v11 = [v10 unsignedIntValue];

  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v4]);
  char v13 = _NSIsNSString(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v4]);
  id v15 = v14;
  if ((v13 & 1) != 0) {
    id v16 = [v14 longLongValue];
  }
  else {
    id v16 = [v14 unsignedLongLongValue];
  }
  id v17 = v16;

  if (!v17)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v5]);
    uint64_t v19 = _NSIsNSString(v18);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v5]);
    char v21 = v20;
    if ((v19 & 1) != 0) {
      id v22 = [v20 longLongValue];
    }
    else {
      id v22 = [v20 unsignedLongLongValue];
    }
    id v17 = v22;
  }

  if (!v17 || v11 == 256 || v11 == 4096)
  {
    v48[0] = ML3TrackPropertyFeedURL;
    v48[1] = ML3TrackPropertyPodcastExternalGUID;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 2LL));

    id v26 = sub_1000A5740(v3, v25);
    char v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

    uint64_t v28 = ICPlaybackPositionEntityIdentifierForProperties(v25, v27);
    uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);
    if (!v29)
    {
      uint64_t v31 = ML3TrackPropertyTitle;
      uint64_t v32 = ML3TrackPropertyArtist;
      v47[0] = ML3TrackPropertyTitle;
      v47[1] = ML3TrackPropertyArtist;
      uint64_t v33 = ML3TrackPropertyAlbum;
      v47[2] = ML3TrackPropertyAlbum;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 3LL));

      id v34 = sub_1000A5740(v3, v7);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v34);

      uint64_t v35 = ICPlaybackPositionEntityIdentifierForProperties(v7, v9);
      uint64_t v23 = objc_claimAutoreleasedReturnValue(v35);
      if (v23) {
        goto LABEL_13;
      }
      v46[0] = v31;
      v46[1] = v33;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v46, 2LL));

      id v36 = sub_1000A5740(v3, v25);
      char v27 = (void *)objc_claimAutoreleasedReturnValue(v36);

      uint64_t v37 = ICPlaybackPositionEntityIdentifierForProperties(v25, v27);
      uint64_t v29 = objc_claimAutoreleasedReturnValue(v37);
      if (!v29)
      {
        v45[0] = v31;
        v45[1] = v32;
        id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v45, 2LL));

        id v38 = sub_1000A5740(v3, v7);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(v38);

        uint64_t v39 = ICPlaybackPositionEntityIdentifierForProperties(v7, v9);
        uint64_t v23 = objc_claimAutoreleasedReturnValue(v39);
        if (!v23)
        {
          uint64_t v44 = v31;
          id v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v44,  1LL));

          id v41 = sub_1000A5740(v3, v40);
          uint64_t v42 = objc_claimAutoreleasedReturnValue(v41);

          uint64_t v43 = ICPlaybackPositionEntityIdentifierForProperties(v40, v42);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v43);
          id v7 = v40;
          id v9 = (void *)v42;
          goto LABEL_16;
        }

        goto LABEL_13;
      }
    }

    uint64_t v24 = (void *)v29;
    id v7 = v25;
    id v9 = v27;
    goto LABEL_16;
  }

  uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", v17));
LABEL_13:
  uint64_t v24 = (void *)v23;
LABEL_16:

  return v24;
}

- (id)_sqlQueryStringForItemsNeedingPush
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT key FROM cloud_kvs LEFT OUTER JOIN item_kvs using (key) WHERE item_pid IS NULL AND bookmark_sync_timestamp != 0 AND bookmark_sync_revision >= ?");
}

- (id)_queryForTracksNeedingPushWithEntityRevisionAnchor:(unint64_t)a3 orderingTerms:(id)a4
{
  uint64_t v6 = ML3TrackPropertyRememberBookmarkTime;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToValue:",  v6,  &__kCFBooleanTrue));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:value:comparison:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:value:comparison:",  ML3TrackPropertyStoreBookmarkMetadataTimestamp,  &off_1001B4078,  2LL));
  uint64_t v10 = ML3TrackPropertyStoreBookmarkMetadataEntityRevision;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:value:comparison:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:value:comparison:",  v10,  v11,  4LL));

  v17[0] = v8;
  v17[1] = v9;
  v17[2] = v12;
  char v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 3LL));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[ML3AllCompoundPredicate predicateMatchingPredicates:]( &OBJC_CLASS___ML3AllCompoundPredicate,  "predicateMatchingPredicates:",  v13));

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Track unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:]( &OBJC_CLASS___ML3Track,  "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:",  self,  v14,  v7));
  return v15;
}

- (void)_updateDatabaseByResetingSyncEntityRevisionForItemsWithIdentifiers:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[ML3DatabaseStatementRenderer defaultRenderer]( &OBJC_CLASS___ML3DatabaseStatementRenderer,  "defaultRenderer"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000A56E0;
    v7[3] = &unk_1001A64D0;
    id v8 = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "statementWithPrefix:inParameterCount:",  @"UPDATE cloud_kvs SET bookmark_sync_revision = 0 WHERE key",  objc_msgSend(v4, "count")));
    id v9 = v4;
    id v6 = v8;
    -[ML3MusicLibrary performDatabaseTransactionWithBlock:](self, "performDatabaseTransactionWithBlock:", v7);
  }
}

- (BOOL)_updateUbiquitousDatabaseWithEntity:(id)a3 syncRevision:(int64_t)a4 usingConnection:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 playbackPositionKey]);
  id v10 = [v9 length];

  if (v10)
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v7 bookmarkTime]);
    if (v11)
    {
      int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 bookmarkTime]);
      [v12 doubleValue];
      id v14 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v13 * 1000.0));
    }

    else
    {
      id v14 = &off_1001B4078;
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 playbackPositionKey]);
    v33[0] = v16;
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v7 userPlayCount]);
    uint64_t v18 = (void *)v17;
    if (v17) {
      uint64_t v19 = (_UNKNOWN **)v17;
    }
    else {
      uint64_t v19 = &off_1001B4078;
    }
    v33[1] = v19;
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v7 hasBeenPlayed]);
    char v21 = (void *)v20;
    if (v20) {
      id v22 = (_UNKNOWN **)v20;
    }
    else {
      id v22 = &off_1001B4078;
    }
    v33[2] = v22;
    v33[3] = v14;
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v7 bookmarkTimestamp]);
    uint64_t v24 = (void *)v23;
    if (v23) {
      v25 = (_UNKNOWN **)v23;
    }
    else {
      v25 = &off_1001B4078;
    }
    v33[4] = v25;
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
    v33[5] = v26;
    char v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 6LL));
    unsigned __int8 v15 = objc_msgSend( v8,  "executeUpdate:withParameters:error:",  @"INSERT OR REPLACE INTO cloud_kvs (key, play_count_user, has_been_played, bookmark_time_ms, bookmark_sync_timestamp, bookmark_sync_revision) VALUES (?, ?, ?, ?, ?, ?)",  v27,  0);

    if ((v15 & 1) == 0)
    {
      uint64_t v28 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v7 playbackPositionKey]);
        int v31 = 138412290;
        uint64_t v32 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "failed to update ubiquitous bookmarkmatadata for identifier %@.",  (uint8_t *)&v31,  0xCu);
      }
    }
  }

  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

@end