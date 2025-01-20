@interface MSDContentFilesDownloadOperation
- (BOOL)_downloadCreationList;
- (id)methodSelectors;
- (int64_t)type;
- (void)_downloadContentFile:(id)a3 ofHash:(id)a4 toPath:(id)a5 completionHandler:(id)a6;
@end

@implementation MSDContentFilesDownloadOperation

- (id)methodSelectors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", "_downloadCreationList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v2, 0LL));

  return v3;
}

- (int64_t)type
{
  return 2LL;
}

- (BOOL)_downloadCreationList
{
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentCacheManager sharedInstance](&OBJC_CLASS___MSDContentCacheManager, "sharedInstance"));
  v63 = objc_alloc_init(&OBJC_CLASS___NSCondition);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 creationList]);
  id v4 = [v3 mutableCopy];

  v56 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  unsigned int v55 = +[MSDOperationContext downloadOnly](&OBJC_CLASS___MSDOperationContext, "downloadOnly");
  uint64_t v89 = 0LL;
  v90 = &v89;
  uint64_t v91 = 0x2020000000LL;
  uint64_t v92 = 0LL;
  uint64_t v85 = 0LL;
  v86 = &v85;
  uint64_t v87 = 0x2020000000LL;
  char v88 = 1;
  uint64_t v79 = 0LL;
  v80 = &v79;
  uint64_t v81 = 0x3032000000LL;
  v82 = sub_10005C220;
  v83 = sub_10005C230;
  id v84 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (os_variant_has_internal_content("com.apple.mobilestoredemod")
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance")),
        id v6 = [v5 concurrentSession],
        v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance")),
        id v8 = [v7 concurrentDownloadRequest],
        v7,
        uint64_t v61 = (void)v8 * (void)v6,
        (uint64_t)((void)v8 * (void)v6) >= 1))
  {
    id v9 = sub_10003A95C();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v94 = v61;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Override default value for concurrent download request: %ld",  buf,  0xCu);
    }
  }

  else
  {
    uint64_t v61 = 3LL;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 cloneFailedList]);
  [v4 addObjectsFromArray:v12];

  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v76 = 0u;
  __int128 v75 = 0u;
  id obj = v4;
  id v13 = [obj countByEnumeratingWithState:&v75 objects:v97 count:16];
  if (v13)
  {
    uint64_t v59 = *(void *)v76;
LABEL_9:
    uint64_t v14 = 0LL;
    id v60 = v13;
    while (1)
    {
      if (*(void *)v76 != v59) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void *)(*((void *)&v75 + 1) + 8 * v14);
      v16 = objc_autoreleasePoolPush();
      unsigned __int8 v17 = -[MSDOperation canPassCheckpoint](self, "canPassCheckpoint");
      if ((v17 & 1) == 0) {
        goto LABEL_42;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 masterManifest]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 metadataForFile:v15]);

      if (!v20) {
        break;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 getFileType]);
      unsigned int v22 = [v21 isEqualToString:NSFileTypeRegular];

      if (v22 && [v20 getFileSize])
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue([v20 getHash]);
        id v24 = (id)objc_claimAutoreleasedReturnValue([v23 hexStringRepresentation]);

        v25 = (void *)objc_claimAutoreleasedReturnValue([v57 findFileInCache:v24]);
        if (v25)
        {
          id v26 = sub_10003AAAC();
          v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          os_signpost_id_t v28 = -[MSDOperation signpostId](self, "signpostId");
          if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v94 = (uint64_t)v24;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v27,  OS_SIGNPOST_EVENT,  v28,  "File Cache Hit",  "File cache hit: %{xcode:string}@",  buf,  0xCu);
          }
        }

        else if ((-[NSMutableSet containsObject:](v56, "containsObject:", v24) & 1) == 0)
        {
          -[NSMutableSet addObject:](v56, "addObject:", v24);
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
          v33 = (void *)objc_claimAutoreleasedReturnValue([v32 contentRootPath]);
          v30 = (void *)objc_claimAutoreleasedReturnValue([v33 stringByAppendingPathComponent:v15]);

          v34 = (void *)objc_claimAutoreleasedReturnValue([v57 fileCachePathFromSourcePath:v30 forBackgroundDownload:v55]);
          id v29 = (id)objc_claimAutoreleasedReturnValue([v34 stringByAppendingPathComponent:v24]);

          -[NSCondition lock](v63, "lock");
          while (1)
          {
            uint64_t v35 = v90[3];
            if (v35 < v61) {
              break;
            }
            -[NSCondition wait](v63, "wait");
          }

          if (*((_BYTE *)v86 + 24))
          {
            v90[3] = v35 + 1;
            -[NSCondition unlock](v63, "unlock");
            id v36 = sub_10003AAAC();
            v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
            os_signpost_id_t v38 = -[MSDOperation signpostId](self, "signpostId");
            if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v94 = (uint64_t)v24;
              _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v37,  OS_SIGNPOST_INTERVAL_BEGIN,  v38,  "Download File",  "File download hash: %{xcode:string}@",  buf,  0xCu);
            }

            v65[0] = _NSConcreteStackBlock;
            v65[1] = 3221225472LL;
            v65[2] = sub_10005C238;
            v65[3] = &unk_1000FA3F0;
            v65[4] = self;
            unsigned __int8 v74 = v17;
            id v66 = v57;
            id v24 = v24;
            v71 = &v79;
            id v67 = v24;
            uint64_t v68 = v15;
            id v29 = v29;
            id v69 = v29;
            v72 = &v85;
            v70 = v63;
            v73 = &v89;
            -[MSDContentFilesDownloadOperation _downloadContentFile:ofHash:toPath:completionHandler:]( self,  "_downloadContentFile:ofHash:toPath:completionHandler:",  v15,  v24,  v29,  v65);

            int v31 = 0;
          }

          else
          {
            id v39 = sub_10003A95C();
            v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Aborting file download due to previous error.",  buf,  2u);
            }

            -[NSCondition unlock](v63, "unlock");
            int v31 = 2;
          }

          goto LABEL_23;
        }
      }

      else
      {
        id v24 = 0LL;
      }

      id v29 = 0LL;
      v30 = 0LL;
      int v31 = 3;
LABEL_23:

      objc_autoreleasePoolPop(v16);
      if (v31 != 3 && v31)
      {

        if (v31 == 6) {
          goto LABEL_57;
        }
        goto LABEL_46;
      }

      if ((id)++v14 == v60)
      {
        id v13 = [obj countByEnumeratingWithState:&v75 objects:v97 count:16];
        if (v13) {
          goto LABEL_9;
        }
        goto LABEL_44;
      }
    }

    id v41 = sub_10003A95C();
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_10009A890(v95, &v96, v42);
    }

LABEL_42:
    id v24 = 0LL;
    id v29 = 0LL;
    v30 = 0LL;
    v20 = 0LL;
    int v31 = 6;
    goto LABEL_23;
  }

- (void)_downloadContentFile:(id)a3 ofHash:(id)a4 toPath:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  uint64_t v14 = objc_alloc_init(&OBJC_CLASS___MSDDownloadFileRequest);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadFileRequest fileInfo](v14, "fileInfo"));
  [v15 setFile:v10];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadFileRequest fileInfo](v14, "fileInfo"));
  [v16 setFileHash:v11];

  -[MSDServerRequest setSavePath:](v14, "setSavePath:", v12);
  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 originServer]);
  -[MSDCDNServerRequest setOriginServer:](v14, "setOriginServer:", v18);

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10005C614;
  v21[3] = &unk_1000FA418;
  id v19 = v13;
  id v22 = v19;
  objc_copyWeak(&v23, &location);
  -[MSDServerRequest setCompletion:](v14, "setCompletion:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](&OBJC_CLASS___MSDServerRequestHandler, "sharedInstance"));
  [v20 handleRequestAsync:v14];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

@end