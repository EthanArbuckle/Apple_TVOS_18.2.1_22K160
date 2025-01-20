@interface MSDApplicationFileDownloadOperation
- (BOOL)_downloadAppArchiveFile;
- (id)_downloadAppArchiveFile:(id)a3 ofHash:(id)a4 ofAppUID:(id)a5 currenntAppUID:(id)a6 toFolder:(id)a7;
- (id)methodSelectors;
- (int64_t)type;
@end

@implementation MSDApplicationFileDownloadOperation

- (id)methodSelectors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", "_downloadAppArchiveFile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v2, 0LL));

  return v3;
}

- (int64_t)type
{
  return 2LL;
}

- (BOOL)_downloadAppArchiveFile
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentCacheManager sharedInstance](&OBJC_CLASS___MSDContentCacheManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentUniqueIdentifier]);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 fileHash]);

  BOOL v12 = +[MSDOperationContext downloadOnly](&OBJC_CLASS___MSDOperationContext, "downloadOnly");
  if (v9)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v3 appDiffPatchFileForSourceAppUID:v9 targetAppUID:v7]);
    if (v13)
    {
      v14 = (void *)v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      [v15 setUseDiffPatch:1];

LABEL_5:
      id v16 = sub_10003AAAC();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      unint64_t v18 = -[MSDOperation signpostId](self, "signpostId");
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v19 = v18;
        if (os_signpost_enabled(v17))
        {
          int v39 = 138412290;
          id v40 = v14;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v17,  OS_SIGNPOST_EVENT,  v19,  "File Cache Hit",  "File cache hit: %{xcode:string}@",  (uint8_t *)&v39,  0xCu);
        }
      }

- (id)_downloadAppArchiveFile:(id)a3 ofHash:(id)a4 ofAppUID:(id)a5 currenntAppUID:(id)a6 toFolder:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = objc_alloc_init(&OBJC_CLASS___MSDDownloadIPARequest);
  -[MSDDownloadIPARequest setAppID:](v17, "setAppID:", v16);

  -[MSDDownloadIPARequest setFileHash:](v17, "setFileHash:", v15);
  -[MSDDownloadIPARequest setUid:](v17, "setUid:", v14);

  -[MSDDownloadIPARequest setCurrentUID:](v17, "setCurrentUID:", v13);
  -[MSDServerRequest setSavePath:](v17, "setSavePath:", v12);

  unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  os_signpost_id_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 originServer]);
  -[MSDDownloadIPARequest setOriginServer:](v17, "setOriginServer:", v19);

  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](&OBJC_CLASS___MSDServerRequestHandler, "sharedInstance"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 handleRequestSync:v17]);

  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 error]);
  if (v22)
  {
    -[MSDOperation setError:](self, "setError:", v22);
    v25 = 0LL;
  }

  else
  {
    id v23 = [v21 isDiffPatch];
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    [v24 setUseDiffPatch:v23];

    v25 = (void *)objc_claimAutoreleasedReturnValue([v21 fileName]);
  }

  return v25;
}

@end