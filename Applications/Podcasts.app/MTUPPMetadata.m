@interface MTUPPMetadata
+ (id)createOrUpdateUPPMetadataFromUPPMediaItem:(id)a3 inCtx:(id)a4;
+ (id)createOrUpdateUPPMetadataFromUPPRecord:(id)a3 inCtx:(id)a4;
+ (id)deleteAllContentInCtx:(id)a3 error:(id *)a4;
+ (void)updateUPPMetadata:(id)a3 fromUPPRecord:(id)a4;
@end

@implementation MTUPPMetadata

+ (id)createOrUpdateUPPMetadataFromUPPMediaItem:(id)a3 inCtx:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[MZUniversalPlaybackPositionMetadata metadataWithValuesFromDataSourceItem:]( &OBJC_CLASS___MZUniversalPlaybackPositionMetadata,  "metadataWithValuesFromDataSourceItem:",  a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 createOrUpdateUPPMetadataFromUPPRecord:v7 inCtx:v6]);

  return v8;
}

+ (id)createOrUpdateUPPMetadataFromUPPRecord:(id)a3 inCtx:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 itemIdentifier]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 uppMetadataForMetadataIdentifier:v8]);

  if (!v9)
  {
    uint64_t v11 = _MTLogCategoryUPPSync(v10);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Creating UPP Metadata Record for: %{public}@",  (uint8_t *)&v14,  0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  @"MTUPPMetadata",  v7));
  }

  [(id)objc_opt_class(a1) updateUPPMetadata:v9 fromUPPRecord:v6];

  return v9;
}

+ (void)updateUPPMetadata:(id)a3 fromUPPRecord:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = _MTLogCategoryUPPSync(v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = v5;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Updating UPP Metadata Record\n from: %{public}@\n to: %{public}@",  (uint8_t *)&v10,  0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 itemIdentifier]);
  [v5 setMetadataIdentifier:v9];

  [v6 timestamp];
  objc_msgSend(v5, "setTimestamp:");
  [v6 bookmarkTime];
  objc_msgSend(v5, "setBookmarkTime:");
  objc_msgSend(v5, "setPlayCount:", objc_msgSend(v6, "playCount"));
  objc_msgSend(v5, "setHasBeenPlayed:", objc_msgSend(v6, "hasBeenPlayed"));
}

+ (id)deleteAllContentInCtx:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"MTUPPMetadata"));
  uint64_t v7 = -[NSBatchDeleteRequest initWithFetchRequest:]( objc_alloc(&OBJC_CLASS___NSBatchDeleteRequest),  "initWithFetchRequest:",  v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 executeRequest:v7 error:a4]);
  [v5 saveInCurrentBlock];

  return v8;
}

@end