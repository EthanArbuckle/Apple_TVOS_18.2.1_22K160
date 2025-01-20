@interface MediaSocialPostEntity
+ (id)databaseTable;
+ (id)newEntityValuesWithMediaSocialPost:(id)a3;
- (BOOL)deleteFromDatabase;
- (BOOL)hasActiivtyID;
- (BOOL)isOverPollDuration;
- (BOOL)isReadyToSend;
- (MediaSocialStatusPollRequest)statusPollRequest;
- (NSArray)contentItems;
- (NSArray)externalServiceDestinations;
- (NSArray)uploadedAttachments;
- (id)_insertUploadWithAttachment:(id)a3 properties:(id)a4 database:(id)a5;
- (id)allUploadPersistentIdentifiers;
- (id)insertEntitiesForAttachments:(id)a3 withProperties:(id)a4;
- (id)insertEntitiesForContentItems:(id)a3;
- (id)insertEntitiesForExternalDestinations:(id)a3;
- (void)updateWithPollingResponse:(id)a3;
@end

@implementation MediaSocialPostEntity

+ (id)newEntityValuesWithMediaSocialPost:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 accountIdentifier]);
  if (v5) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v5, @"account_id");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 authorIdentifier]);

  if (v6) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v6, @"author_id");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 authorType]);

  if (v7) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v7, @"author_type");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 text]);

  if (v8) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v8, @"message");
  }

  return v4;
}

- (id)allUploadPersistentIdentifiers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"post_id",  -[MediaSocialPostEntity persistentID](self, "persistentID")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MediaSocialPostEntity database](self, "database"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[DirectUploadEntity queryWithDatabase:predicate:]( &OBJC_CLASS___DirectUploadEntity,  "queryWithDatabase:predicate:",  v5,  v4));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000513D4;
  v9[3] = &unk_10034B548;
  id v7 = v3;
  id v10 = v7;
  [v6 enumeratePersistentIDsUsingBlock:v9];

  return v7;
}

- (NSArray)contentItems
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v13[0] = @"item_id";
  v13[1] = @"type";
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"post_id",  -[MediaSocialPostEntity persistentID](self, "persistentID")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MediaSocialPostEntity database](self, "database"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[MediaSocialContentItemEntity queryWithDatabase:predicate:]( &OBJC_CLASS___MediaSocialContentItemEntity,  "queryWithDatabase:predicate:",  v5,  v4));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000515A8;
  v11[3] = &unk_10034B450;
  id v7 = v3;
  id v12 = v7;
  [v6 enumeratePersistentIDsAndProperties:v13 count:2 usingBlock:v11];
  id v8 = v7;

  for (uint64_t i = 1LL; i != -1; --i)
  return (NSArray *)v8;
}

- (NSArray)externalServiceDestinations
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v13[0] = @"access_token";
  v13[1] = @"page_access_token";
  void v13[2] = @"page_id";
  v13[3] = @"service_type";
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"post_id",  -[MediaSocialPostEntity persistentID](self, "persistentID")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MediaSocialPostEntity database](self, "database"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[MediaSocialExternalTargetEntity queryWithDatabase:predicate:]( &OBJC_CLASS___MediaSocialExternalTargetEntity,  "queryWithDatabase:predicate:",  v5,  v4));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000517B0;
  v11[3] = &unk_10034B450;
  id v7 = v3;
  id v12 = v7;
  [v6 enumeratePersistentIDsAndProperties:v13 count:4 usingBlock:v11];
  id v8 = v7;

  for (uint64_t i = 3LL; i != -1; --i)
  return (NSArray *)v8;
}

- (id)insertEntitiesForAttachments:(id)a3 withProperties:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v9 = (NSMutableDictionary *)[v6 mutableCopy];

  if (!v9) {
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  id v10 = -[NSNumber initWithDouble:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithDouble:", CFAbsoluteTimeGetCurrent());
  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, @"creation_time");
  v11 = -[NSNumber initWithLongLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithLongLong:",  -[MediaSocialPostEntity persistentID](self, "persistentID"));
  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v11, @"post_id");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000519E8;
  v18[3] = &unk_10034C430;
  v18[4] = self;
  v19 = v9;
  id v20 = (id)objc_claimAutoreleasedReturnValue(-[MediaSocialPostEntity database](self, "database"));
  id v12 = v8;
  id v21 = v12;
  id v13 = v20;
  v14 = v9;
  [v7 enumerateObjectsUsingBlock:v18];

  v15 = v21;
  id v16 = v12;

  return v16;
}

- (id)insertEntitiesForContentItems:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100051CCC;
  v12[3] = &unk_10034C458;
  id v13 = -[NSNumber initWithLongLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithLongLong:",  -[MediaSocialPostEntity persistentID](self, "persistentID"));
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[MediaSocialPostEntity database](self, "database"));
  id v6 = v5;
  id v15 = v6;
  id v7 = v14;
  id v8 = v13;
  [v4 enumerateObjectsUsingBlock:v12];

  v9 = v15;
  id v10 = v6;

  return v10;
}

- (id)insertEntitiesForExternalDestinations:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MediaSocialPostEntity database](self, "database"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  void v13[2] = sub_100051E64;
  v13[3] = &unk_10034C480;
  id v14 = -[NSNumber initWithLongLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithLongLong:",  -[MediaSocialPostEntity persistentID](self, "persistentID"));
  id v15 = v6;
  id v7 = v5;
  id v16 = v7;
  id v8 = v6;
  v9 = v14;
  [v4 enumerateObjectsUsingBlock:v13];

  id v10 = v16;
  id v11 = v7;

  return v11;
}

- (BOOL)isReadyToSend
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MediaSocialPostEntity valueForProperty:](self, "valueForProperty:", @"is_failed"));
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:value:comparisonType:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:value:comparisonType:",  @"state",  &off_10036D6E0,  2LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"post_id",  -[MediaSocialPostEntity persistentID](self, "persistentID")));
    v13[0] = v7;
    v13[1] = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v8));

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MediaSocialPostEntity database](self, "database"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[DirectUploadEntity anyInDatabase:predicate:]( &OBJC_CLASS___DirectUploadEntity,  "anyInDatabase:predicate:",  v10,  v9));

    if (v11) {
      LOBYTE(v5) = 0;
    }
    else {
      unsigned int v5 = !-[MediaSocialPostEntity hasActiivtyID](self, "hasActiivtyID");
    }
  }

  return v5;
}

- (BOOL)hasActiivtyID
{
  id v4 = 0LL;
  unsigned int v5 = @"activity_id";
  -[MediaSocialPostEntity getValues:forProperties:count:](self, "getValues:forProperties:count:", &v4, &v5, 1LL);
  if (v4) {
    BOOL v2 = [v4 length] != 0;
  }
  else {
    BOOL v2 = 0;
  }

  return v2;
}

- (BOOL)isOverPollDuration
{
  v11[0] = @"poll_duration";
  v11[1] = @"creation_time";
  id v9 = 0LL;
  id v10 = 0LL;
  -[MediaSocialPostEntity getValues:forProperties:count:](self, "getValues:forProperties:count:", &v9, v11, 2LL);
  [v9 doubleValue];
  double v3 = v2;
  [v10 doubleValue];
  double v5 = v4;
  double Current = CFAbsoluteTimeGetCurrent();
  for (uint64_t i = 1LL; i != -1; --i)

  return v3 + v5 < Current;
}

- (MediaSocialStatusPollRequest)statusPollRequest
{
  double v3 = objc_alloc_init(&OBJC_CLASS___MediaSocialStatusPollRequest);
  v9[0] = @"account_id";
  v9[1] = @"activity_id";
  v9[2] = @"poll_interval";
  v9[3] = @"source_app";
  void v9[4] = @"poll_duration";
  v9[5] = @"creation_time";
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v6 = 0u;
  -[MediaSocialPostEntity getValues:forProperties:count:](self, "getValues:forProperties:count:", &v6, v9, 6LL);
  -[MediaSocialStatusPollRequest setAccountIdentifier:](v3, "setAccountIdentifier:", (void)v6);
  -[MediaSocialStatusPollRequest setActivityIdentifier:](v3, "setActivityIdentifier:", *((void *)&v6 + 1));
  [(id)v7 doubleValue];
  -[MediaSocialStatusPollRequest setPollingInterval:](v3, "setPollingInterval:");
  -[MediaSocialStatusPollRequest setPostIdentifier:]( v3,  "setPostIdentifier:",  -[MediaSocialPostEntity persistentID](self, "persistentID"));
  -[MediaSocialStatusPollRequest setSourceApplicationIdentifier:]( v3,  "setSourceApplicationIdentifier:",  *((void *)&v7 + 1));
  [(id)v8 doubleValue];
  -[MediaSocialStatusPollRequest setPollingDuration:](v3, "setPollingDuration:");
  [*((id *)&v8 + 1) doubleValue];
  -[MediaSocialStatusPollRequest setPostCreateTime:](v3, "setPostCreateTime:");
  for (uint64_t i = 5LL; i != -1; --i)

  return v3;
}

- (void)updateWithPollingResponse:(id)a3
{
  id v12 = a3;
  double v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MediaSocialPostEntity valueForProperty:](self, "valueForProperty:", @"poll_count"));
  __int128 v6 = (char *)[v5 integerValue];

  __int128 v7 = -[NSNumber initWithInteger:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInteger:", v6 + 1);
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v7, @"poll_count");
  [v12 pollingInterval];
  if (v8 <= 2.22044605e-16)
  {
    [v12 pollDuration];
  }

  else
  {
    id v9 = -[NSNumber initWithDouble:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithDouble:", v8);
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v9, @"poll_interval");

    [v12 pollDuration];
    id v11 = -[NSNumber initWithDouble:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithDouble:", v10);
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v11, @"poll_duration");
  }

  -[MediaSocialPostEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v4);
}

- (NSArray)uploadedAttachments
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"post_id",  -[MediaSocialPostEntity persistentID](self, "persistentID")));
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"state",  2LL));
  v25[0] = v4;
  v25[1] = v5;
  __int128 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL));
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v6));

  id v8 = objc_alloc_init(&OBJC_CLASS___SSSQLiteQueryDescriptor);
  [v8 setEntityClass:objc_opt_class(DirectUploadEntity)];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[DirectUploadEntity databaseTable](&OBJC_CLASS___DirectUploadEntity, "databaseTable"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(%@.%@ != 0) ASC",  v9,  @"parent_upload_id"));
  [v8 setOrderingClause:v10];

  [v8 setPredicate:v7];
  v24[0] = @"album_id";
  v24[1] = @"asset_token";
  v24[2] = @"asset_token_type";
  v24[3] = @"category_name";
  v24[4] = @"description";
  v24[5] = @"is_explicit";
  v24[6] = @"parent_upload_id";
  v24[7] = @"parent_relationship_type";
  v24[8] = @"preview_frame_time";
  v24[9] = @"title";
  v24[10] = @"upload_time";
  v24[11] = @"uti";
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MediaSocialPostEntity database](self, "database"));
  id v13 = -[SSSQLiteQuery initWithDatabase:descriptor:]( objc_alloc(&OBJC_CLASS___SSSQLiteQuery),  "initWithDatabase:descriptor:",  v12,  v8);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000527D8;
  v20[3] = &unk_10034C4D8;
  id v21 = v12;
  v22 = v11;
  id v14 = v3;
  id v23 = v14;
  id v15 = v11;
  id v16 = v12;
  -[SSSQLiteQuery enumeratePersistentIDsAndProperties:count:usingBlock:]( v13,  "enumeratePersistentIDsAndProperties:count:usingBlock:",  v24,  12LL,  v20);
  id v17 = v14;

  for (uint64_t i = 11LL; i != -1; --i)
  return (NSArray *)v17;
}

+ (id)databaseTable
{
  return @"post";
}

- (BOOL)deleteFromDatabase
{
  double v2 = self;
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MediaSocialPostEntity database](self, "database"));
  id v4 = -[MediaSocialPostEntity persistentID](v2, "persistentID");
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"post_id",  v4));
  __int128 v6 = (void *)objc_claimAutoreleasedReturnValue( +[MediaSocialExternalTargetEntity queryWithDatabase:predicate:]( &OBJC_CLASS___MediaSocialExternalTargetEntity,  "queryWithDatabase:predicate:",  v3,  v5));
  [v6 deleteAllEntities];
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"post_id",  v4));

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[DirectUploadEntity queryWithDatabase:predicate:]( &OBJC_CLASS___DirectUploadEntity,  "queryWithDatabase:predicate:",  v3,  v7));
  [v8 deleteAllEntities];
  v10.receiver = v2;
  v10.super_class = (Class)&OBJC_CLASS___MediaSocialPostEntity;
  LOBYTE(v2) = -[MediaSocialPostEntity deleteFromDatabase](&v10, "deleteFromDatabase");

  return (char)v2;
}

- (id)_insertUploadWithAttachment:(id)a3 properties:(id)a4 database:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = +[DirectUploadEntity newEntityValuesWithMediaSocialAttachment:]( &OBJC_CLASS___DirectUploadEntity,  "newEntityValuesWithMediaSocialAttachment:",  v7);
  [v10 addEntriesFromDictionary:v9];

  id v11 = -[DirectUploadEntity initWithPropertyValues:inDatabase:]( objc_alloc(&OBJC_CLASS___DirectUploadEntity),  "initWithPropertyValues:inDatabase:",  v10,  v8);
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 artists]);
    if ([v12 count]) {
      id v13 =  -[DirectUploadEntity insertEntitiesForArtists:withProperties:]( v11,  "insertEntitiesForArtists:withProperties:",  v12,  0LL);
    }
  }

  return v11;
}

@end