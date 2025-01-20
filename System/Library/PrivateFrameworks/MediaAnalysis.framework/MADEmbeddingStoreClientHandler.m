@interface MADEmbeddingStoreClientHandler
+ (id)clientHandlerWithXPCConnection:(id)a3;
- (MADEmbeddingStoreClientHandler)init;
- (MADEmbeddingStoreClientHandler)initWithXPCConnection:(id)a3;
- (void)cancelAllRequests;
- (void)fetchEmbeddingsWithAssetUUIDs:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 reply:(id)a6;
- (void)prewarmSearchWithConcurrencyLimit:(unint64_t)a3 photoLibraryURL:(id)a4 reply:(id)a5;
- (void)requestEmbeddingStoreSandboxExtensionWithPhotoLibraryURL:(id)a3 reply:(id)a4;
- (void)searchWithEmbeddings:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 reply:(id)a6;
@end

@implementation MADEmbeddingStoreClientHandler

- (MADEmbeddingStoreClientHandler)init
{
  return 0LL;
}

- (MADEmbeddingStoreClientHandler)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MADEmbeddingStoreClientHandler;
  v6 = -[MADEmbeddingStoreClientHandler init](&v20, "init");
  v7 = v6;
  if (v6)
  {
    p_connection = (id *)&v6->_connection;
    objc_storeStrong((id *)&v6->_connection, a3);
    [*p_connection setExportedObject:v7];
    id v9 = *p_connection;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MADEmbeddingStoreClientProtocol));
    [v9 setRemoteObjectInterface:v10];

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MADEmbeddingStoreServerProtocol));
    +[MADEmbeddingStoreService configureServerInterface:]( &OBJC_CLASS___MADEmbeddingStoreService,  "configureServerInterface:",  v11);
    [*p_connection setExportedInterface:v11];
    objc_initWeak(&location, v7);
    id v12 = *p_connection;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100077D14;
    v17[3] = &unk_1001BC038;
    objc_copyWeak(&v18, &location);
    [v12 setInterruptionHandler:v17];
    id v13 = *p_connection;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100077DB8;
    v15[3] = &unk_1001BC038;
    objc_copyWeak(&v16, &location);
    [v13 setInvalidationHandler:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v7;
}

+ (id)clientHandlerWithXPCConnection:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithXPCConnection:v4];

  return v5;
}

- (void)cancelAllRequests
{
  if ((int)MediaAnalysisLogLevel(self, a2) >= 4)
  {
    uint64_t v2 = VCPLogInstance();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    os_log_type_t v4 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  v4,  "-[MADEmbeddingStoreClientHandler cancelAllRequests] Method not implemented",  v5,  2u);
    }
  }

- (void)requestEmbeddingStoreSandboxExtensionWithPhotoLibraryURL:(id)a3 reply:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void, void *))a4;
  uint64_t v8 = MediaAnalysisLogLevel(v6, v7);
  if ((int)v8 >= 6)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    os_log_type_t v12 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v11, v12))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "[MADEmbeddingStoreClientHandler] Received sandbox extension request for embedding store file",  buf,  2u);
    }
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 photoLibraryWithURL:v5]);

  if (!v14)
  {
    uint64_t v29 = MediaAnalysisLogLevel(v15, v16);
    if ((int)v29 >= 3)
    {
      uint64_t v31 = VCPLogInstance(v29, v30);
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      os_log_type_t v33 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v32, v33))
      {
        *(_DWORD *)buf = 138412290;
        id v56 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  v33,  "[MADEmbeddingStoreClientHandler] Failed to open photo library at %@",  buf,  0xCu);
      }
    }

    NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
    id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MADEmbeddingStoreClientHandler] Failed to open photo library at %@",  v5));
    id v54 = v19;
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v54,  &v53,  1LL));
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v34));
    v6[2](v6, 0LL, v35);

    goto LABEL_29;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[MADEmbeddingStore embeddingStoreDirectoryForPhotoLibrary:]( &OBJC_CLASS___MADEmbeddingStore,  "embeddingStoreDirectoryForPhotoLibrary:",  v14));
  id v19 = v17;
  if (!v17)
  {
    uint64_t v36 = MediaAnalysisLogLevel(0LL, v18);
    if ((int)v36 >= 3)
    {
      uint64_t v38 = VCPLogInstance(v36, v37);
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      os_log_type_t v40 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v39, v40))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  v40,  "[MADEmbeddingStoreClientHandler] Failed to find EmbeddingStore directory",  buf,  2u);
      }
    }

    NSErrorDomain v41 = NSOSStatusErrorDomain;
    NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MADEmbeddingStoreClientHandler] Failed to find EmbeddingStore directory"));
    v52 = v34;
    v42 = &v52;
    v43 = &v51;
    goto LABEL_28;
  }

  uint64_t v20 = APP_SANDBOX_READ_WRITE;
  id v19 = v17;
  v21 = (void *)sandbox_extension_issue_file(v20, [v19 UTF8String], 0);
  uint64_t v23 = MediaAnalysisLogLevel(v21, v22);
  if (!v21)
  {
    if ((int)v23 >= 3)
    {
      uint64_t v44 = VCPLogInstance(v23, v24);
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      os_log_type_t v46 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v45, v46))
      {
        *(_DWORD *)buf = 138412290;
        id v56 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  v46,  "[MADEmbeddingStoreClientHandler] Failed to issue sandbox extension on %@",  buf,  0xCu);
      }
    }

    NSErrorDomain v41 = NSOSStatusErrorDomain;
    NSErrorUserInfoKey v49 = NSLocalizedDescriptionKey;
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[MADEmbeddingStoreClientHandler] Failed to issue sandbox extension on %@",  v19));
    v50 = v34;
    v42 = &v50;
    v43 = &v49;
LABEL_28:
    v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v43,  1LL));
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v41,  -18LL,  v47));
    v6[2](v6, 0LL, v48);

LABEL_29:
    goto LABEL_30;
  }

  if ((int)v23 >= 7)
  {
    uint64_t v25 = VCPLogInstance(v23, v24);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    os_log_type_t v27 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v26, v27))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  v27,  "[MADEmbeddingStoreClientHandler] Issuing sandbox extension for %@",  buf,  0xCu);
    }
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v21));
  ((void (**)(id, void *, void *))v6)[2](v6, v28, 0LL);

  free(v21);
LABEL_30:
}

- (void)fetchEmbeddingsWithAssetUUIDs:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  os_log_type_t v12 = (void (**)(id, void *, id))a6;
  uint64_t v14 = MediaAnalysisLogLevel(v12, v13);
  if ((int)v14 >= 6)
  {
    uint64_t v16 = VCPLogInstance(v14, v15);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    os_log_type_t v18 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v23 = [v9 count];
      _os_log_impl( (void *)&_mh_execute_header,  v17,  v18,  "[MADEmbeddingStoreClientHandler] Received fetch embedding request for %u assets",  buf,  8u);
    }
  }

  id v21 = 0LL;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[MADEmbeddingStore fetchEmbeddingsWithAssetUUIDs:photoLibraryURL:options:error:]( &OBJC_CLASS___MADEmbeddingStore,  "fetchEmbeddingsWithAssetUUIDs:photoLibraryURL:options:error:",  v9,  v10,  v11,  &v21));
  id v20 = v21;
  v12[2](v12, v19, v20);
}

- (void)searchWithEmbeddings:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  os_log_type_t v12 = (void (**)(id, void *, id))a6;
  uint64_t v14 = MediaAnalysisLogLevel(v12, v13);
  if ((int)v14 >= 6)
  {
    uint64_t v16 = VCPLogInstance(v14, v15);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    os_log_type_t v18 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v23 = [v9 count];
      _os_log_impl( (void *)&_mh_execute_header,  v17,  v18,  "[MADEmbeddingStoreClientHandler] Received search request for %u embedding",  buf,  8u);
    }
  }

  id v21 = 0LL;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[MADEmbeddingStore searchWithEmbeddings:photoLibraryURL:options:error:]( &OBJC_CLASS___MADEmbeddingStore,  "searchWithEmbeddings:photoLibraryURL:options:error:",  v9,  v10,  v11,  &v21));
  id v20 = v21;
  v12[2](v12, v19, v20);
}

- (void)prewarmSearchWithConcurrencyLimit:(unint64_t)a3 photoLibraryURL:(id)a4 reply:(id)a5
{
  id v7 = a4;
  uint64_t v8 = (void (**)(id, id))a5;
  uint64_t v10 = MediaAnalysisLogLevel(v8, v9);
  if ((int)v10 >= 6)
  {
    uint64_t v12 = VCPLogInstance(v10, v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    os_log_type_t v14 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 67109120;
      int v18 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  v14,  "[MADEmbeddingStoreClientHandler] Received prewarm search request with concurrencyLimit %d",  buf,  8u);
    }
  }

  id v16 = 0LL;
  +[MADEmbeddingStore prewarmSearchWithConcurrencyLimit:photoLibraryURL:error:]( &OBJC_CLASS___MADEmbeddingStore,  "prewarmSearchWithConcurrencyLimit:photoLibraryURL:error:",  a3,  v7,  &v16);
  id v15 = v16;
  v8[2](v8, v15);
}

- (void).cxx_destruct
{
}

@end