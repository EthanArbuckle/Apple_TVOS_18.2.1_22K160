@interface DownloadArtworkCacheOperation
- (DownloadArtworkCacheOperation)initWithDownloadIdentifier:(int64_t)a3 thumbnailURL:(id)a4;
- (DownloadArtworkCacheOperation)initWithStoreDownloadIdentifier:(int64_t)a3 thumbnailURL:(id)a4;
- (NSData)artworkData;
- (void)_setArtworkData:(id)a3;
- (void)dealloc;
- (void)run;
@end

@implementation DownloadArtworkCacheOperation

- (DownloadArtworkCacheOperation)initWithDownloadIdentifier:(int64_t)a3 thumbnailURL:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DownloadArtworkCacheOperation;
  v6 = -[DownloadArtworkCacheOperation init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_downloadID = a3;
    v6->_thumbnailURL = (NSURL *)[a4 copy];
  }

  return v7;
}

- (DownloadArtworkCacheOperation)initWithStoreDownloadIdentifier:(int64_t)a3 thumbnailURL:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DownloadArtworkCacheOperation;
  v6 = -[DownloadArtworkCacheOperation init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_downloadID = a3;
    v6->_isStoreDownload = 1;
    v6->_thumbnailURL = (NSURL *)[a4 copy];
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DownloadArtworkCacheOperation;
  -[DownloadArtworkCacheOperation dealloc](&v3, "dealloc");
}

- (NSData)artworkData
{
  objc_super v3 = self->_artworkData;
  -[DownloadArtworkCacheOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
  uint64_t v36 = 0LL;
  id v3 = objc_msgSend( +[ScratchManager directoryPathForDownloadID:kind:createIfNeeded:]( ScratchManager,  "directoryPathForDownloadID:kind:createIfNeeded:",  self->_downloadID,  0,  1),  "stringByAppendingPathComponent:",  @"thumbnail");
  v4 = -[NSData initWithContentsOfFile:](objc_alloc(&OBJC_CLASS___NSData), "initWithContentsOfFile:", v3);
  if (!v4)
  {
    if (self->_thumbnailURL)
    {
      id v15 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v15) {
        id v15 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v16 = [v15 shouldLog];
      else {
        LODWORD(v17) = v16;
      }
      v18 = (os_log_s *)[v15 OSLogObject];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
        uint64_t v17 = v17;
      }
      else {
        v17 &= 2u;
      }
      if ((_DWORD)v17)
      {
        uint64_t v19 = objc_opt_class(self);
        thumbnailURL = self->_thumbnailURL;
        int v37 = 138412546;
        uint64_t v38 = v19;
        __int16 v39 = 2112;
        int64_t v40 = (int64_t)thumbnailURL;
        uint64_t v21 = _os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  1LL,  "%@: Loading thumbnail from URL: %@",  &v37,  22);
        if (v21)
        {
          v22 = (void *)v21;
          v23 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v21, 4LL);
          free(v22);
          v34 = v23;
          SSFileLog(v15, @"%@");
        }
      }

      if (-[NSString caseInsensitiveCompare:]( -[NSURL scheme](self->_thumbnailURL, "scheme", v34),  "caseInsensitiveCompare:",  @"file"))
      {
        v24 = -[SSMutableURLRequestProperties initWithURL:]( objc_alloc(&OBJC_CLASS___SSMutableURLRequestProperties),  "initWithURL:",  self->_thumbnailURL);
        BOOL isStoreDownload = self->_isStoreDownload;
        if (self->_isStoreDownload)
        {
          id v26 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
          [v26 setUrlKnownToBeTrusted:1];
        }

        else
        {
          id v26 = objc_alloc_init(&OBJC_CLASS___ISURLOperation);
          [v26 _setUsesPrivateCookieStore:0];
        }

        -[SSMutableURLRequestProperties setITunesStoreRequest:](v24, "setITunesStoreRequest:", isStoreDownload);
        objc_msgSend(v26, "setDataProvider:", +[ISDataProvider provider](ISDataProvider, "provider"));
        [v26 setRequestProperties:v24];
        if (-[DownloadArtworkCacheOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v26,  &v36))
        {
          v5 = (NSData *)objc_msgSend(objc_msgSend(v26, "dataProvider"), "output");
          -[NSData writeToFile:options:error:](v5, "writeToFile:options:error:", v3, 1LL, 0LL);
        }

        else
        {
          v5 = 0LL;
        }

        goto LABEL_46;
      }

      v5 = -[NSData initWithContentsOfURL:options:error:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithContentsOfURL:options:error:",  self->_thumbnailURL,  0LL,  &v36);
      if (v5) {
        goto LABEL_46;
      }
      id v27 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v27) {
        id v27 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v28 = [v27 shouldLog];
      else {
        LODWORD(v29) = v28;
      }
      v30 = (os_log_s *)[v27 OSLogObject];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v29 = v29;
      }
      else {
        v29 &= 2u;
      }
      if ((_DWORD)v29)
      {
        uint64_t v31 = objc_opt_class(self);
        v32 = self->_thumbnailURL;
        int v37 = 138412802;
        uint64_t v38 = v31;
        __int16 v39 = 2112;
        int64_t v40 = (int64_t)v32;
        __int16 v41 = 2112;
        uint64_t v42 = v36;
        LODWORD(v35) = 32;
        v5 = (NSData *)_os_log_send_and_compose_impl( v29,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  0LL,  "%@: Could not load artwork file: %@: %@",  &v37,  v35);
        if (!v5) {
          goto LABEL_46;
        }
        v33 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v5, 4LL);
        free(v5);
        v34 = v33;
        SSFileLog(v27, @"%@");
      }
    }

    v5 = 0LL;
    goto LABEL_46;
  }

  v5 = v4;
  id v6 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v6) {
    id v6 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v7 = [v6 shouldLog];
  else {
    LODWORD(v8) = v7;
  }
  objc_super v9 = (os_log_s *)[v6 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
    uint64_t v8 = v8;
  }
  else {
    v8 &= 2u;
  }
  if ((_DWORD)v8)
  {
    uint64_t v10 = objc_opt_class(self);
    int64_t downloadID = self->_downloadID;
    int v37 = 138412546;
    uint64_t v38 = v10;
    __int16 v39 = 2048;
    int64_t v40 = downloadID;
    uint64_t v12 = _os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  1LL,  "%@: Using cached thumbnail for download: %lld",  &v37,  22);
    if (v12)
    {
      v13 = (void *)v12;
      v14 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v12, 4LL);
      free(v13);
      v34 = v14;
      SSFileLog(v6, @"%@");
    }
  }

- (void)_setArtworkData:(id)a3
{
  artworkData = self->_artworkData;
  if (artworkData != a3)
  {

    self->_artworkData = (NSData *)a3;
  }

  -[DownloadArtworkCacheOperation unlock](self, "unlock");
}

@end