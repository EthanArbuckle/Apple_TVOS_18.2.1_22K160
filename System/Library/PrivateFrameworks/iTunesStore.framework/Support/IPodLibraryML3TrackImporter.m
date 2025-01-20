@interface IPodLibraryML3TrackImporter
- (BOOL)importLibraryItems:(id)a3 toMusicLibrary:(id)a4 importedItemPids:(id)a5;
- (id)_absoluteTimeValueForDateValue:(id)a3;
- (id)_currentTrackChapterDataForTrackPid:(int64_t)a3 libraryItem:(id)a4 usingLibrary:(id)a5;
- (id)_currentTrackMovieInfoFromMetadata:(id)a3;
- (id)_extendedContentRatingStringForLibraryItem:(id)a3;
- (id)_importPropertiesFromLibraryItem:(id)a3 fromAccount:(id)a4 usingLibrary:(id)a5;
- (id)_storeArtworkTokenFromLibraryItem:(id)a3 metadata:(id)a4;
- (id)_stringValueForURLValue:(id)a3;
@end

@implementation IPodLibraryML3TrackImporter

- (BOOL)importLibraryItems:(id)a3 toMusicLibrary:(id)a4 importedItemPids:(id)a5
{
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  char v36 = 1;
  id v9 = objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount");
  if ([a3 count])
  {
    v10 = +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [a3 count]);
    __int128 v32 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v29 = 0u;
    id v11 = [a3 countByEnumeratingWithState:&v29 objects:v43 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v30;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(a3);
          }
          -[NSMutableArray addObject:]( v10,  "addObject:",  -[IPodLibraryML3TrackImporter _importPropertiesFromLibraryItem:fromAccount:usingLibrary:]( self,  "_importPropertiesFromLibraryItem:fromAccount:usingLibrary:",  *(void *)(*((void *)&v29 + 1) + 8LL * (void)i),  v9,  a4));
        }

        id v11 = [a3 countByEnumeratingWithState:&v29 objects:v43 count:16];
      }

      while (v11);
    }

    v41 = @"track_items";
    v42 = v10;
    uint64_t v28 = 0LL;
    v14 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL),  1LL,  &v28);
    if (v28)
    {
      id v15 = +[SSLogConfig sharedStoreServicesConfig](&OBJC_CLASS___SSLogConfig, "sharedStoreServicesConfig");
      if (!v15) {
        id v15 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      LODWORD(v16) = [v15 shouldLog];
      unsigned int v17 = [v15 shouldLogToDisk];
      v18 = (os_log_s *)[v15 OSLogObject];
      v19 = v18;
      if (v17) {
        LODWORD(v16) = v16 | 2;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        uint64_t v16 = v16;
      }
      else {
        v16 &= 2u;
      }
      if ((_DWORD)v16)
      {
        uint64_t v20 = objc_opt_class(self);
        int v37 = 138543618;
        uint64_t v38 = v20;
        __int16 v39 = 2114;
        uint64_t v40 = v28;
        uint64_t v21 = _os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  16LL,  "%{public}@: Failed to archive track items. Error = %{public}@",  &v37,  22);
        if (v21)
        {
          v22 = (void *)v21;
          +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v21, 4LL);
          free(v22);
          SSFileLog(v15, @"%@");
        }
      }
    }

    v23 = dispatch_semaphore_create(0LL);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001841A4;
    block[3] = &unk_1003508F0;
    block[4] = v14;
    block[5] = self;
    block[6] = a5;
    block[7] = a3;
    block[8] = v23;
    block[9] = &v33;
    dispatch_async(global_queue, block);
    dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v23);
  }

  char v25 = *((_BYTE *)v34 + 24);
  _Block_object_dispose(&v33, 8);
  return v25;
}

- (id)_importPropertiesFromLibraryItem:(id)a3 fromAccount:(id)a4 usingLibrary:(id)a5
{
  v8 = +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  100LL);
  id v9 = [a3 itemMetadata];
  uint64_t v10 = +[IPodLibraryItem mediaTypeForStoreDownload:](&OBJC_CLASS___IPodLibraryItem, "mediaTypeForStoreDownload:", v9);
  if ([a3 libraryPersistentIdentifier])
  {
    id v11 = [a3 libraryPersistentIdentifier];
LABEL_6:
    -[NSMutableDictionary setObject:forKey:]( v8,  "setObject:forKey:",  +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v11),  &off_10036D9F8);
    goto LABEL_7;
  }

  if ([a3 itemDownloadIdentifier])
  {
    id v12 = +[ML3Track anyInLibrary:predicate:]( ML3Track,  "anyInLibrary:predicate:",  a5,  +[ML3ComparisonPredicate predicateWithProperty:equalToValue:]( ML3ComparisonPredicate,  "predicateWithProperty:equalToValue:",  ML3TrackPropertyDownloadIdentifier,  [a3 itemDownloadIdentifier]));
    if (v12)
    {
      id v11 = [v12 persistentID];
      goto LABEL_6;
    }
  }

- (id)_absoluteTimeValueForDateValue:(id)a3
{
  return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
}

- (id)_stringValueForURLValue:(id)a3
{
  return [a3 absoluteString];
}

- (id)_currentTrackMovieInfoFromMetadata:(id)a3
{
  v3 = (NSData *)[a3 videoDetailsDictionary];
  if (v3)
  {
    v3 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v3,  100LL,  0LL,  0LL);
    if (v3) {
      v3 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v3, 4LL);
    }
  }

  return v3;
}

- (id)_storeArtworkTokenFromLibraryItem:(id)a3 metadata:(id)a4
{
  id v5 = [a4 collectionIdentifier];
  if (v5) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"store_collection_id=%llu",  v5);
  }
  id v7 = [a4 itemIdentifier];
  if (v7) {
    return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"store_item_id=%llu", v7);
  }
  else {
    return -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
  }
}

- (id)_currentTrackChapterDataForTrackPid:(int64_t)a3 libraryItem:(id)a4 usingLibrary:(id)a5
{
  id v7 = (id)a3;
  if (!a3) {
    id v7 = [a4 libraryPersistentIdentifier];
  }
  return +[ML3Track flattenedChapterDataWithImportChapters:library:trackPersistentID:]( ML3Track,  "flattenedChapterDataWithImportChapters:library:trackPersistentID:",  [a4 chapters],  a5,  v7);
}

- (id)_extendedContentRatingStringForLibraryItem:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(a3, "itemMetadata"), "contentRating");
  if (!v3) {
    return 0LL;
  }
  v4 = v3;
  id v5 = [v3 rank];
  id v6 = [v4 ratingLabel];
  id v7 = +[SSItemContentRating stringForRatingSystem:]( SSItemContentRating,  "stringForRatingSystem:",  [v4 ratingSystem]);
  v8 = (const __CFString *)[v4 ratingDescription];
  if (![v7 length] || !objc_msgSend(v6, "length")) {
    return 0LL;
  }
  id v9 = &stru_10035EB18;
  if (v8) {
    id v9 = v8;
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@|%@|%ld|%@",  v7,  v6,  v5,  v9);
}

@end