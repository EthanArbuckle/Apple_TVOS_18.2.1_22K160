@interface DirectUploadEntity
+ (id)databaseTable;
+ (id)newEntityValuesWithMediaSocialAttachment:(id)a3;
- (BOOL)deleteFromDatabase;
- (MediaSocialPostEntity)postEntity;
- (NSArray)artists;
- (id)insertEntitiesForArtists:(id)a3 withProperties:(id)a4;
- (int64_t)setFailedWithError:(id)a3;
- (void)deleteAssetFile;
- (void)resetStatusProperties;
- (void)setProcessingWithResponse:(id)a3;
@end

@implementation DirectUploadEntity

+ (id)newEntityValuesWithMediaSocialAttachment:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 albumIdentifier]);
  if (v5) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v5, @"album_id");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 assetURL]);

  if (v6) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v6, @"asset_url");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 attachmentDescription]);

  if (v7) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v7, @"description");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 categoryName]);

  if (v8) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v8, @"category_name");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 subtitle]);

  if (v9) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v9, @"subtitle");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([v3 title]);

  if (v10) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v10, @"title");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue([v3 UTI]);

  if (v11) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v11, @"uti");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 deletesAssetWhenFinished]));
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v12, @"owns_asset");

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 isExplicitContent]));
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v13, @"is_explicit");

  [v3 previewFrameTimestamp];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v14, @"preview_frame_time");

  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", SSVDirectUploadKindFuse, @"kind");
  return v4;
}

- (NSArray)artists
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v15[0] = @"artist_id";
  v15[1] = @"name";
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"upload_id",  -[DirectUploadEntity persistentID](self, "persistentID")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadEntity database](self, "database"));
  v14 = @"order_index";
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[DirectUploadArtistEntity queryWithDatabase:predicate:orderingProperties:]( &OBJC_CLASS___DirectUploadArtistEntity,  "queryWithDatabase:predicate:orderingProperties:",  v5,  v4,  v6));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000D99B4;
  v12[3] = &unk_10034B450;
  id v8 = v3;
  id v13 = v8;
  [v7 enumeratePersistentIDsAndProperties:v15 count:2 usingBlock:v12];
  id v9 = v8;

  for (uint64_t i = 1LL; i != -1; --i)
  return (NSArray *)v9;
}

- (void)deleteAssetFile
{
  v26[0] = @"asset_url";
  v26[1] = @"owns_asset";
  uint64_t v24 = 0LL;
  id v25 = 0LL;
  -[DirectUploadEntity getValues:forProperties:count:](self, "getValues:forProperties:count:", &v24, v26, 2LL);
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    v4 = objc_alloc(&OBJC_CLASS___NSURL);
    v5 = -[NSURL initWithString:](v4, "initWithString:", v24);
    if (!-[NSURL isFileURL](v5, "isFileURL"))
    {
LABEL_21:

      goto LABEL_22;
    }

    v6 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
    id v17 = 0LL;
    unsigned __int8 v7 = -[NSFileManager removeItemAtURL:error:](v6, "removeItemAtURL:error:", v5, &v17);
    id v8 = v17;
    if ((v7 & 1) != 0)
    {
LABEL_20:

      goto LABEL_21;
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v9) {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      LODWORD(v11) = v10;
    }
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      id v13 = (void *)objc_opt_class(self);
      int v18 = 138412802;
      v19 = v13;
      __int16 v20 = 2112;
      id v21 = v8;
      __int16 v22 = 2112;
      v23 = v5;
      id v14 = v13;
      v15 = (void *)_os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "%@: Could not delete asset file: %@, URL: %@",  &v18,  32);

      if (!v15)
      {
LABEL_19:

        goto LABEL_20;
      }

      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v15,  4LL));
      free(v15);
      SSFileLog(v9, @"%@");
    }

    goto LABEL_19;
  }

- (id)insertEntitiesForArtists:(id)a3 withProperties:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000D9DAC;
  v16[3] = &unk_10034DEF8;
  id v17 = -[NSNumber initWithLongLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithLongLong:",  -[DirectUploadEntity persistentID](self, "persistentID"));
  id v18 = v6;
  id v19 = (id)objc_claimAutoreleasedReturnValue(-[DirectUploadEntity database](self, "database"));
  id v9 = v8;
  id v20 = v9;
  id v10 = v19;
  id v11 = v6;
  v12 = v17;
  [v7 enumerateObjectsUsingBlock:v16];

  id v13 = v20;
  id v14 = v9;

  return v14;
}

- (MediaSocialPostEntity)postEntity
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadEntity valueForProperty:](self, "valueForProperty:", @"post_id"));
  id v4 = [v3 longLongValue];

  if (v4)
  {
    v5 = objc_alloc(&OBJC_CLASS___MediaSocialPostEntity);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadEntity database](self, "database"));
    id v7 = -[MediaSocialPostEntity initWithPersistentID:inDatabase:](v5, "initWithPersistentID:inDatabase:", v4, v6);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (void)resetStatusProperties
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, @"error_code");
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, @"error_domain");
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, @"error_message");
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", &off_10036D7B8, @"state");
  -[DirectUploadEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v3);
}

- (int64_t)setFailedWithError:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", &off_10036D7D0, @"state");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadEntity valueForProperty:](self, "valueForProperty:", @"failure_count"));
  id v7 = (char *)[v6 integerValue] + 1;

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v7));
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v8, @"failure_count");

  if (v4)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    if (v9) {
      -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v9, @"error_domain");
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);

    if (v10) {
      -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v10, @"error_message");
    }
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 code]));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v11, @"error_code");
  }

  else
  {
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", &off_10036D7E8, @"error_code");
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", SSErrorDomain, @"error_domain");
  }

  -[DirectUploadEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v5);

  return (int64_t)v7;
}

- (void)setProcessingWithResponse:(id)a3
{
  id v10 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", &off_10036D800, @"state");
  v5 = (void *)objc_claimAutoreleasedReturnValue([v10 assetToken]);
  if (v5) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v5, @"asset_token");
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v10 assetTokenType]);
  if (v6) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v6, @"asset_token_type");
  }
  id v7 = objc_alloc(&OBJC_CLASS___NSNumber);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v8 timeIntervalSince1970];
  id v9 = -[NSNumber initWithDouble:](v7, "initWithDouble:");

  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v9, @"upload_time");
  -[DirectUploadEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v4);
}

+ (id)databaseTable
{
  return @"upload";
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  @"upload_id",  -[DirectUploadEntity persistentID](self, "persistentID")));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadEntity database](v2, "database"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[DirectUploadArtistEntity queryWithDatabase:predicate:]( &OBJC_CLASS___DirectUploadArtistEntity,  "queryWithDatabase:predicate:",  v4,  v3));

  [v5 deleteAllEntities];
  -[DirectUploadEntity deleteAssetFile](v2, "deleteAssetFile");
  v7.receiver = v2;
  v7.super_class = (Class)&OBJC_CLASS___DirectUploadEntity;
  LOBYTE(v2) = -[DirectUploadEntity deleteFromDatabase](&v7, "deleteFromDatabase");

  return (char)v2;
}

@end