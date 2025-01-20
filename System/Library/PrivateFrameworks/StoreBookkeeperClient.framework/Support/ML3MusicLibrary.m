@interface ML3MusicLibrary
- (BOOL)supportsUPP;
- (id)SBKBeginTransactionWithItemsToSyncEnumerationBlock:(id)a3;
- (id)SBKQueryForTracksNeedingPushWithEntityRevisionAnchor:(unint64_t)a3 orderingTerms:(id)a4;
- (id)SBKSQLQueryStringForItemsNeedingPush;
- (id)uppDatabase;
- (void)SBKCommitUniversalPlaybackPositionTransaction:(id)a3 domainVersion:(id)a4 metadataEnumerationBlock:(id)a5;
@end

@implementation ML3MusicLibrary

- (id)uppDatabase
{
  id AssociatedObject = objc_getAssociatedObject(self, "__SBDML3UbiquitousDatabaseKey");
  v4 = (SBDML3UbiquitousDatabase *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v4)
  {
    v4 = -[SBDML3UbiquitousDatabase initWithMusicLibrary:]( objc_alloc(&OBJC_CLASS___SBDML3UbiquitousDatabase),  "initWithMusicLibrary:",  self);
    objc_setAssociatedObject(self, "__SBDML3UbiquitousDatabaseKey", v4, (void *)1);
  }

  return v4;
}

- (BOOL)supportsUPP
{
  return 1;
}

- (id)SBKQueryForTracksNeedingPushWithEntityRevisionAnchor:(unint64_t)a3 orderingTerms:(id)a4
{
  uint64_t v6 = ML3TrackPropertyRememberBookmarkTime;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToValue:",  v6,  &__kCFBooleanTrue));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:value:comparison:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:value:comparison:",  ML3TrackPropertyStoreBookmarkMetadataTimestamp,  &off_10001DEA8,  2LL));
  uint64_t v10 = ML3TrackPropertyStoreBookmarkMetadataEntityRevision;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:value:comparison:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:value:comparison:",  v10,  v11,  4LL));

  v17[0] = v8;
  v17[1] = v9;
  v17[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 3LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[ML3AllCompoundPredicate predicateMatchingPredicates:]( &OBJC_CLASS___ML3AllCompoundPredicate,  "predicateMatchingPredicates:",  v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Track unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:]( &OBJC_CLASS___ML3Track,  "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:",  self,  v14,  v7));
  return v15;
}

- (id)SBKSQLQueryStringForItemsNeedingPush
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT key FROM cloud_kvs LEFT OUTER JOIN item_kvs using (key) WHERE item_pid IS NULL AND bookmark_sync_timestamp != 0 AND bookmark_sync_revision >= ?");
}

- (id)SBKBeginTransactionWithItemsToSyncEnumerationBlock:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___SBDPlaybackPositionTransaction);
  -[SBDPlaybackPositionTransaction setMusicLibrary:](v5, "setMusicLibrary:", self);
  uint64_t v6 = self;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000A3AC;
  v13[3] = &unk_10001CDA8;
  id v7 = v5;
  v14 = v7;
  v15 = v6;
  v16 = v6;
  id v17 = v4;
  id v8 = v4;
  v9 = v6;
  -[ML3MusicLibrary performReadOnlyDatabaseTransactionWithBlock:]( v9,  "performReadOnlyDatabaseTransactionWithBlock:",  v13);
  uint64_t v10 = v17;
  v11 = v7;

  return v11;
}

- (void)SBKCommitUniversalPlaybackPositionTransaction:(id)a3 domainVersion:(id)a4 metadataEnumerationBlock:(id)a5
{
  id v7 = a3;
  id v30 = a4;
  id v8 = (uint64_t (**)(void))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 musicLibrary]);
  id v29 = [v7 transactionEntityRevision];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v11 = v8[2](v8);
  uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
  if (v12)
  {
    v13 = (void *)v12;
    uint64_t v14 = ML3TrackPropertyStoreBookmarkMetadataIdentifier;
    do
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v13 itemIdentifier]);
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToValue:",  v14,  v15));
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[ML3Track anyInLibrary:predicate:](&OBJC_CLASS___ML3Track, "anyInLibrary:predicate:", v9, v16));

      if (v17)
      {
        [v10 setObject:v17 forKey:v13];
      }

      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        [v10 setObject:v18 forKey:v13];
      }

      uint64_t v19 = v8[2](v8);
      uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);

      v13 = (void *)v20;
    }

    while (v20);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_100009D24;
  v36[3] = &unk_10001CDF8;
  id v22 = v10;
  id v38 = v21;
  id v39 = v29;
  id v37 = v22;
  id v23 = v21;
  [v9 performDatabaseTransactionWithBlock:v36];
  [v22 removeObjectsForKeys:v23];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100009D9C;
  v31[3] = &unk_10001CE48;
  id v32 = (id)objc_claimAutoreleasedReturnValue([v9 uppDatabase]);
  id v33 = v30;
  id v34 = v22;
  id v35 = v29;
  id v24 = v32;
  id v25 = v30;
  id v26 = v22;
  [v24 updateUbiquitousDatabaseByPerformingWriteTransactionWithBlock:v31];
  v27 = (void *)objc_claimAutoreleasedReturnValue([v7 ubiquitousIdentifiersToSync]);
  [v24 updateUbiquitousDatabaseByResetingSyncEntityRevisionForItemsWithMetadataIdentifiers:v27];

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
  [v24 setDateToSyncWithUbiquitousStore:v28];
}

@end