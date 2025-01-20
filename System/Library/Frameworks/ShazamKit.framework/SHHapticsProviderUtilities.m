@interface SHHapticsProviderUtilities
+ (BOOL)isValidAppleArchiveFileURL:(id)a3;
+ (id)availableHapticAlgorithms;
+ (id)cachedHapticTracksForMediaItem:(id)a3;
+ (id)decompressionDirectoryForMediaItem:(id)a3;
+ (id)folderNameForMediaItem:(id)a3;
+ (id)hapticFromResponse:(id)a3;
+ (id)hapticTracksForMediaItem:(id)a3 inDirectory:(id)a4;
+ (id)hapticsFromDownloadResponses:(id)a3;
+ (id)musicHapticsRootDirectory;
@end

@implementation SHHapticsProviderUtilities

+ (id)hapticsFromDownloadResponses:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "hapticFromResponse:",  *(void *)(*((void *)&v14 + 1) + 8 * (void)v10),  (void)v14));
        [v5 addObject:v11];

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  id v12 = [v5 copy];
  return v12;
}

+ (id)cachedHapticTracksForMediaItem:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 appleMusicID]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 decompressionDirectoryForMediaItem:v4]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 hapticTracksForMediaItem:v4 inDirectory:v6]);
  }

  else
  {
    id v7 = &__NSArray0__struct;
  }

  return v7;
}

+ (id)hapticFromResponse:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 networkDownloadResponse]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 networkDownloadResponse]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 downloadedFileLocation]);

  id v9 = [a1 isValidAppleArchiveFileURL:v8];
  if ((_DWORD)v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaItem]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([a1 decompressionDirectoryForMediaItem:v10]);

    id v29 = v6;
    unsigned int v12 = +[SHCompression decompressAppleArchiveAtURL:toDirectoryURL:error:]( &OBJC_CLASS___SHCompression,  "decompressAppleArchiveAtURL:toDirectoryURL:error:",  v8,  v11,  &v29);
    id v13 = v29;

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaItem]);
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([a1 hapticTracksForMediaItem:v14 inDirectory:v11]);

    if (v12)
    {
      id v16 = [v15 count];
      if (v16)
      {
        id v17 = objc_alloc(&OBJC_CLASS___SHHaptic);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaItem]);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v4 spatialOffsets]);
        id v20 = [v17 initWithHapticTracks:v15 representingMediaItem:v18 spatialOffsets:v19 error:0];

        goto LABEL_10;
      }
    }

    uint64_t v26 = sh_log_object(v16);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v28 = @"No";
      if (v12) {
        v28 = @"Yes";
      }
      *(_DWORD *)buf = 138412290;
      v31 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "Could not find default haptics file in archive. ArchiveWasDecompressed: %@",  buf,  0xCu);
    }

    if (!v13) {
      goto LABEL_6;
    }
  }

  else
  {
    id v13 = v6;
    if (!v6)
    {
LABEL_6:
      NSErrorUserInfoKey v34 = NSDebugDescriptionErrorKey;
      v35 = @"Failed to download/unzip archive to extract haptics file";
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
      id v13 = (id)objc_claimAutoreleasedReturnValue( +[SHError errorWithCode:underlyingError:keyOverrides:]( &OBJC_CLASS___SHError,  "errorWithCode:underlyingError:keyOverrides:",  600LL,  0LL,  v21));
    }
  }

  uint64_t v22 = sh_log_object(v9);
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v31 = @"Failed to download/unzip archive to extract haptics file";
    __int16 v32 = 2112;
    id v33 = v13;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@. Error: %@", buf, 0x16u);
  }

  id v24 = objc_alloc(&OBJC_CLASS___SHHaptic);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaItem]);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v4 spatialOffsets]);
  id v20 = [v24 initWithHapticTracks:0 representingMediaItem:v11 spatialOffsets:v15 error:v13];
LABEL_10:

  return v20;
}

+ (id)hapticTracksForMediaItem:(id)a3 inDirectory:(id)a4
{
  id v6 = a3;
  id v34 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 availableHapticAlgorithms]);
  __int16 v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v7 count]));

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v31 = a1;
  id obj = (id)objc_claimAutoreleasedReturnValue([a1 availableHapticAlgorithms]);
  id v8 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v36;
    *(void *)&__int128 v9 = 138412802LL;
    __int128 v30 = v9;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "URLByAppendingPathComponent:conformingToType:", v13, UTTypeAHAP, v30));
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
        unsigned __int8 v17 = [v15 fileExistsAtPath:v16];

        uint64_t v19 = sh_log_object(v18);
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
        if ((v17 & 1) != 0)
        {
          if (v21)
          {
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v6 appleMusicID]);
            v23 = (void *)objc_claimAutoreleasedReturnValue([v6 isrc]);
            *(_DWORD *)buf = v30;
            uint64_t v40 = v13;
            __int16 v41 = 2112;
            id v42 = v22;
            __int16 v43 = 2112;
            v44 = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "Downloaded variant: %@ for media item. AdamID: %@, ISRC: %@",  buf,  0x20u);
          }

          id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v14));
          id v24 = objc_alloc(&OBJC_CLASS___SHHapticTrack);
          v25 = (void *)objc_claimAutoreleasedReturnValue([v31 folderNameForMediaItem:v6]);
          id v26 = [v24 initWithFileIdentifier:v25 hapticData:v20 algorithm:v13];

          [v32 addObject:v26];
        }

        else
        {
          if (!v21) {
            goto LABEL_13;
          }
          id v26 = (id)objc_claimAutoreleasedReturnValue([v6 appleMusicID]);
          v27 = (void *)objc_claimAutoreleasedReturnValue([v6 isrc]);
          *(_DWORD *)buf = v30;
          uint64_t v40 = v13;
          __int16 v41 = 2112;
          id v42 = v26;
          __int16 v43 = 2112;
          v44 = v27;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "No variant: %@ downloaded for media item. AdamID: %@, ISRC: %@",  buf,  0x20u);
        }

LABEL_13:
      }

      id v10 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
    }

    while (v10);
  }

  id v28 = [v32 copy];
  return v28;
}

+ (BOOL)isValidAppleArchiveFileURL:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 pathExtension]);

    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 pathExtension]);
      id v7 = (UTType *)objc_claimAutoreleasedReturnValue(+[UTType typeWithFilenameExtension:](&OBJC_CLASS___UTType, "typeWithFilenameExtension:", v6));

      LOBYTE(v5) = v7 == UTTypeAppleArchive;
    }
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

+ (id)decompressionDirectoryForMediaItem:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 musicHapticsRootDirectory]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 folderNameForMediaItem:v4]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:v6]);
  return v7;
}

+ (id)folderNameForMediaItem:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 appleMusicID]);
  if (!v4 && (id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 isrc])) == 0
    || (v5 = [v4 isEqualToString:&stru_10006E730], id v6 = v4, (_DWORD)v5))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
    __int128 v9 = v8;
    if (v8)
    {
      id v6 = v8;
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      id v6 = (id)objc_claimAutoreleasedReturnValue([v10 UUIDString]);

      id v4 = v10;
    }

    uint64_t v12 = sh_log_object(v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v3 properties]);
      int v20 = 138412546;
      id v21 = v6;
      __int16 v22 = 2112;
      v23 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Setting haptics folder name: %@ using media item identifier in media item: %@",  (uint8_t *)&v20,  0x16u);
    }
  }

  uint64_t v15 = sh_log_object(v5);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v3 appleMusicID]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v3 isrc]);
    int v20 = 138412802;
    id v21 = v6;
    __int16 v22 = 2112;
    v23 = v17;
    __int16 v24 = 2112;
    v25 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "Returning haptics folder name: %@, MusicID: %@, ISRC:%@",  (uint8_t *)&v20,  0x20u);
  }

  return v6;
}

+ (id)musicHapticsRootDirectory
{
  if (qword_100088A00 != -1) {
    dispatch_once(&qword_100088A00, &stru_10006DF10);
  }
  return (id)qword_1000889F8;
}

+ (id)availableHapticAlgorithms
{
  if (qword_100088A10 != -1) {
    dispatch_once(&qword_100088A10, &stru_10006DF30);
  }
  return (id)qword_100088A08;
}

@end