@interface MSDInstallableFileDownloadOperation
- (BOOL)_downloadInstallableFile;
- (BOOL)_downloadInstallableFile:(id)a3 ofHash:(id)a4 toPath:(id)a5;
- (id)methodSelectors;
- (int64_t)type;
@end

@implementation MSDInstallableFileDownloadOperation

- (id)methodSelectors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", "_downloadInstallableFile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v2, 0LL));

  return v3;
}

- (int64_t)type
{
  return 2LL;
}

- (BOOL)_downloadInstallableFile
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentCacheManager sharedInstance](&OBJC_CLASS___MSDContentCacheManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 fileHash]);

  BOOL v8 = +[MSDOperationContext downloadOnly](&OBJC_CLASS___MSDOperationContext, "downloadOnly");
  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 findFileInCache:v7]);

  if (v9)
  {
    id v10 = sub_10003AAAC();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    unint64_t v12 = -[MSDOperation signpostId](self, "signpostId");
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v13 = v12;
      if (os_signpost_enabled(v11))
      {
        int v32 = 138412290;
        id v33 = v7;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_EVENT,  v13,  "File Cache Hit",  "File cache hit: %{xcode:string}@",  (uint8_t *)&v32,  0xCu);
      }
    }

- (BOOL)_downloadInstallableFile:(id)a3 ofHash:(id)a4 toPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 originServer]);

  os_signpost_id_t v13 = objc_alloc_init(&OBJC_CLASS___MSDDownloadFileRequest);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadFileRequest fileInfo](v13, "fileInfo"));
  [v14 setFile:v10];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadFileRequest fileInfo](v13, "fileInfo"));
  [v15 setFileHash:v9];

  -[MSDServerRequest setSavePath:](v13, "setSavePath:", v8);
  -[MSDCDNServerRequest setOriginServer:](v13, "setOriginServer:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](&OBJC_CLASS___MSDServerRequestHandler, "sharedInstance"));
  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 handleRequestSync:v13]);

  os_signpost_id_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 error]);
  if (v18) {
    -[MSDOperation setError:](self, "setError:", v18);
  }

  return v18 == 0LL;
}

@end