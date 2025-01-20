@interface LoadSoftwareThumbnailOperation
- (ApplicationHandle)applicationHandle;
- (BOOL)isStoreDownload;
- (LoadSoftwareThumbnailOperation)initWithApplicationHandle:(id)a3 thumbnailURL:(id)a4;
- (id)_artworkDataWithError:(id *)a3;
- (void)run;
- (void)setApplicationHandle:(id)a3;
- (void)setStoreDownload:(BOOL)a3;
@end

@implementation LoadSoftwareThumbnailOperation

- (LoadSoftwareThumbnailOperation)initWithApplicationHandle:(id)a3 thumbnailURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___LoadSoftwareThumbnailOperation;
  v8 = -[LoadSoftwareThumbnailOperation init](&v14, "init");
  if (v8)
  {
    v9 = (ApplicationHandle *)[v6 copy];
    applicationHandle = v8->_applicationHandle;
    v8->_applicationHandle = v9;

    v11 = (NSURL *)[v7 copy];
    thumbnailURL = v8->_thumbnailURL;
    v8->_thumbnailURL = v11;
  }

  return v8;
}

- (BOOL)isStoreDownload
{
  BOOL storeDownload = self->_storeDownload;
  -[LoadSoftwareThumbnailOperation unlock](self, "unlock");
  return storeDownload;
}

- (void)setStoreDownload:(BOOL)a3
{
  self->_BOOL storeDownload = a3;
  -[LoadSoftwareThumbnailOperation unlock](self, "unlock");
}

- (void)run
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationHandle bundleID](self->_applicationHandle, "bundleID"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationHandle bundleID](self->_applicationHandle, "bundleID"));
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  v4,  1LL));

    if ([v5 foundBackingBundle])
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 iconsDictionary]);
      id v7 = [v6 count];

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v8) {
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v9 = [v8 shouldLog];
        else {
          LODWORD(v10) = v9;
        }
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          uint64_t v10 = v10;
        }
        else {
          v10 &= 2u;
        }
        if ((_DWORD)v10)
        {
          v12 = (void *)objc_opt_class(self);
          applicationHandle = self->_applicationHandle;
          int v38 = 138412546;
          v39 = v12;
          __int16 v40 = 2112;
          v41 = applicationHandle;
          id v14 = v12;
          v15 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  2LL,  "%@: Skipping icon download for placeholder with icons: %@",  &v38,  22);

          if (!v15)
          {
LABEL_46:

            goto LABEL_47;
          }

          v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v15,  4LL));
          free(v15);
          SSFileLog(v8, @"%@");
        }

- (id)_artworkDataWithError:(id *)a3
{
  unsigned int v5 = -[LoadSoftwareThumbnailOperation isStoreDownload](self, "isStoreDownload");
  id v6 = objc_alloc(&OBJC_CLASS___DownloadArtworkCacheOperation);
  int64_t v7 = -[DownloadHandle downloadID](self->_applicationHandle, "downloadID");
  thumbnailURL = self->_thumbnailURL;
  if (v5) {
    unsigned int v9 = -[DownloadArtworkCacheOperation initWithStoreDownloadIdentifier:thumbnailURL:]( v6,  "initWithStoreDownloadIdentifier:thumbnailURL:",  v7,  thumbnailURL);
  }
  else {
    unsigned int v9 = -[DownloadArtworkCacheOperation initWithDownloadIdentifier:thumbnailURL:]( v6,  "initWithDownloadIdentifier:thumbnailURL:",  v7,  thumbnailURL);
  }
  uint64_t v10 = v9;
  id v15 = 0LL;
  unsigned __int8 v11 = -[LoadSoftwareThumbnailOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v9,  &v15);
  id v12 = v15;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadArtworkCacheOperation artworkData](v10, "artworkData"));
  if (a3 && (v11 & 1) == 0) {
    *a3 = v12;
  }

  return v13;
}

- (ApplicationHandle)applicationHandle
{
  return self->_applicationHandle;
}

- (void)setApplicationHandle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end