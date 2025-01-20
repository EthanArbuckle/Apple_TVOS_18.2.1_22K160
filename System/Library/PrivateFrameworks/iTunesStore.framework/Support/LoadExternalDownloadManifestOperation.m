@interface LoadExternalDownloadManifestOperation
- (BOOL)_handlePublicResponseForOperation:(id)a3 error:(id *)a4;
- (BOOL)_runForPublicFormatWithURLRequest:(id)a3 error:(id *)a4;
- (BOOL)_runForPurchaseFormatWithURLRequest:(id)a3 error:(id *)a4;
- (BOOL)_showConfirmationPromptForManifest:(id)a3 response:(id)a4;
- (BOOL)shouldHideUserPrompts;
- (ExternalDownloadManifest)manifest;
- (LoadExternalDownloadManifestOperation)initWithRequest:(id)a3;
- (NSURLRequest)URLRequest;
- (SSDownloadManifestResponse)manifestResponse;
- (int64_t)manifestFormat;
- (void)_processValidDownloads:(id)a3;
- (void)_showDialogForError:(id)a3;
- (void)run;
- (void)setManifestFormat:(int64_t)a3;
- (void)setShouldHideUserPrompts:(BOOL)a3;
- (void)setURLRequest:(id)a3;
@end

@implementation LoadExternalDownloadManifestOperation

- (LoadExternalDownloadManifestOperation)initWithRequest:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___LoadExternalDownloadManifestOperation;
  v5 = -[LoadExternalDownloadManifestOperation init](&v10, "init");
  if (v5)
  {
    v5->_manifestFormat = (int64_t)[v4 manifestFormat];
    v5->_shouldHideUserPrompts = [v4 shouldHideUserPrompts];
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 URLRequest]);
    v7 = (NSURLRequest *)[v6 copy];
    urlRequest = v5->_urlRequest;
    v5->_urlRequest = v7;
  }

  return v5;
}

- (ExternalDownloadManifest)manifest
{
  v3 = self->_manifest;
  -[LoadExternalDownloadManifestOperation unlock](self, "unlock");
  return v3;
}

- (int64_t)manifestFormat
{
  int64_t manifestFormat = self->_manifestFormat;
  -[LoadExternalDownloadManifestOperation unlock](self, "unlock");
  return manifestFormat;
}

- (SSDownloadManifestResponse)manifestResponse
{
  id v3 = -[NSOrderedSet copy](self->_downloadIDs, "copy");
  -[LoadExternalDownloadManifestOperation unlock](self, "unlock");
  if ([v3 count])
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        v9 = 0LL;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_super v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)v9);
          id v11 = objc_alloc(&OBJC_CLASS___SSDownload);
          id v12 = objc_msgSend(v11, "_initWithPersistentIdentifier:", objc_msgSend(v10, "longLongValue", (void)v15));
          -[NSMutableArray addObject:](v4, "addObject:", v12);

          v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v7);
    }

    v13 = objc_alloc_init(&OBJC_CLASS___SSDownloadManifestResponse);
    -[SSDownloadManifestResponse setValidDownloads:](v13, "setValidDownloads:", v4);
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (void)setManifestFormat:(int64_t)a3
{
  self->_int64_t manifestFormat = a3;
  -[LoadExternalDownloadManifestOperation unlock](self, "unlock");
}

- (void)setShouldHideUserPrompts:(BOOL)a3
{
  self->_shouldHideUserPrompts = a3;
  -[LoadExternalDownloadManifestOperation unlock](self, "unlock");
}

- (void)setURLRequest:(id)a3
{
  id v6 = (NSURLRequest *)a3;
  -[LoadExternalDownloadManifestOperation lock](self, "lock");
  if (self->_urlRequest != v6)
  {
    id v4 = (NSURLRequest *)-[NSURLRequest copy](v6, "copy");
    urlRequest = self->_urlRequest;
    self->_urlRequest = v4;
  }

  -[LoadExternalDownloadManifestOperation unlock](self, "unlock");
}

- (BOOL)shouldHideUserPrompts
{
  BOOL shouldHideUserPrompts = self->_shouldHideUserPrompts;
  -[LoadExternalDownloadManifestOperation unlock](self, "unlock");
  return shouldHideUserPrompts;
}

- (NSURLRequest)URLRequest
{
  id v3 = self->_urlRequest;
  -[LoadExternalDownloadManifestOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[LoadExternalDownloadManifestOperation URLRequest](self, "URLRequest"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URL]);

  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  id v6 = (void *)v5;
  if (!v4)
  {
    if (!v5) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v15 = [v6 shouldLog];
    else {
      LODWORD(v16) = v15;
    }
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v16 = v16;
    }
    else {
      v16 &= 2u;
    }
    if ((_DWORD)v16)
    {
      int v39 = 138412290;
      id v40 = (id)objc_opt_class(self);
      id v18 = v40;
      v19 = (void *)_os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "%@: Invalid url request",  &v39,  12);

      if (!v19)
      {
LABEL_29:

        id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ISErrorDomain,  3LL,  0LL));
        goto LABEL_46;
      }

      __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL));
      free(v19);
      v33 = v17;
      SSFileLog(v6, @"%@");
    }

    goto LABEL_29;
  }

  if (!v5) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v7 = [v6 shouldLog];
  else {
    LODWORD(v8) = v7;
  }
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
    uint64_t v8 = v8;
  }
  else {
    v8 &= 2u;
  }
  if (!(_DWORD)v8) {
    goto LABEL_13;
  }
  objc_super v10 = (void *)objc_opt_class(self);
  id v11 = v10;
  int v39 = 138412546;
  id v40 = v10;
  __int16 v41 = 2048;
  int64_t v42 = -[LoadExternalDownloadManifestOperation manifestFormat](self, "manifestFormat");
  id v12 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  1LL,  "%@: Running for manifest format: %ld",  &v39,  22);

  if (v12)
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
    free(v12);
    v33 = v9;
    SSFileLog(v6, @"%@");
LABEL_13:
  }

  if ((id)-[LoadExternalDownloadManifestOperation manifestFormat](self, "manifestFormat") == (id)1)
  {
    id v38 = 0LL;
    unsigned __int8 v13 = -[LoadExternalDownloadManifestOperation _runForPurchaseFormatWithURLRequest:error:]( self,  "_runForPurchaseFormatWithURLRequest:error:",  v3,  &v38);
    id v14 = v38;
    if ((v13 & 1) == 0) {
      goto LABEL_46;
    }
LABEL_31:
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[LoadExternalDownloadManifestOperation manifest](self, "manifest", v33));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v36 validDownloads]);
    if ([v21 count]) {
      -[LoadExternalDownloadManifestOperation _processValidDownloads:](self, "_processValidDownloads:", v21);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v22) {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v23 = [v22 shouldLog];
    else {
      unsigned int v24 = v23;
    }
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 OSLogObject]);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
      uint64_t v26 = v24;
    }
    else {
      uint64_t v26 = v24 & 2;
    }
    if ((_DWORD)v26)
    {
      v27 = (void *)objc_opt_class(self);
      id v35 = v27;
      id v28 = [v21 count];
      v29 = (void *)objc_claimAutoreleasedReturnValue([v36 invalidDownloads]);
      id v30 = [v29 count];
      int v39 = 138412802;
      id v40 = v27;
      __int16 v41 = 2048;
      int64_t v42 = (int64_t)v28;
      __int16 v43 = 2048;
      id v44 = v30;
      LODWORD(v34) = 32;
      v31 = (void *)_os_log_send_and_compose_impl( v26,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  1LL,  "%@: Finished with %lu valid downloads, %lu invalid downloads",  &v39,  v34);

      if (!v31)
      {
LABEL_45:

        uint64_t v32 = 1LL;
        goto LABEL_49;
      }

      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v31,  4LL));
      free(v31);
      v33 = v25;
      SSFileLog(v22, @"%@");
    }

    goto LABEL_45;
  }

  id v37 = 0LL;
  unsigned int v20 = -[LoadExternalDownloadManifestOperation _runForPublicFormatWithURLRequest:error:]( self,  "_runForPublicFormatWithURLRequest:error:",  v3,  &v37);
  id v14 = v37;
  if (v20) {
    goto LABEL_31;
  }
LABEL_46:
  if ((ISErrorIsEqual(v14, ISErrorDomain, 16LL) & 1) == 0) {
    -[LoadExternalDownloadManifestOperation _showDialogForError:](self, "_showDialogForError:", v14);
  }
  uint64_t v32 = 0LL;
LABEL_49:
  -[LoadExternalDownloadManifestOperation setSuccess:](self, "setSuccess:", v32, v33);
  -[LoadExternalDownloadManifestOperation setError:](self, "setError:", v14);
}

- (BOOL)_handlePublicResponseForOperation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = objc_alloc(&OBJC_CLASS___ExternalDownloadManifest);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 dataProvider]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 output]);
  objc_super v10 = -[ExternalDownloadManifest initWithPropertyList:](v7, "initWithPropertyList:", v9);

  if (!v10)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v18) {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v19 = [v18 shouldLog];
    else {
      LODWORD(v20) = v19;
    }
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v20 = v20;
    }
    else {
      v20 &= 2u;
    }
    if ((_DWORD)v20)
    {
      int v32 = 138412290;
      id v33 = (id)objc_opt_class(self);
      id v22 = v33;
      unsigned int v23 = (void *)_os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "%@: Could not parse manifest data",  &v32,  12);

      if (!v23)
      {
LABEL_20:

        uint64_t v24 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SSErrorDomain,  200LL,  0LL));
        goto LABEL_34;
      }

      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v23,  4LL));
      free(v23);
      SSFileLog(v18, @"%@");
    }

    goto LABEL_20;
  }

  if (!-[LoadExternalDownloadManifestOperation shouldHideUserPrompts](self, "shouldHideUserPrompts"))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ExternalDownloadManifest validDownloads](v10, "validDownloads"));
    id v12 = [v11 count];

    if (v12)
    {
      unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 response]);
      unsigned __int8 v14 = -[LoadExternalDownloadManifestOperation _showConfirmationPromptForManifest:response:]( self,  "_showConfirmationPromptForManifest:response:",  v10,  v13);

      if ((v14 & 1) == 0)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v25) {
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v26 = [v25 shouldLog];
        else {
          LODWORD(v27) = v26;
        }
        id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 OSLogObject]);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v27 = v27;
        }
        else {
          v27 &= 2u;
        }
        if ((_DWORD)v27)
        {
          int v32 = 138412290;
          id v33 = (id)objc_opt_class(self);
          id v29 = v33;
          id v30 = (void *)_os_log_send_and_compose_impl( v27,  0LL,  0LL,  0LL,  &_mh_execute_header,  v28,  0LL,  "%@: User cancelled manifest confirmation",  &v32,  12);

          if (!v30)
          {
LABEL_33:

            uint64_t v31 = SSError(ISErrorDomain, 16LL, 0LL, 0LL);
            uint64_t v24 = objc_claimAutoreleasedReturnValue(v31);
LABEL_34:
            unsigned int v15 = (void *)v24;
            BOOL v16 = 0;
            if (!a4) {
              goto LABEL_7;
            }
            goto LABEL_6;
          }

          id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v30,  4LL));
          free(v30);
          SSFileLog(v25, @"%@");
        }

        goto LABEL_33;
      }
    }
  }

  -[LoadExternalDownloadManifestOperation lock](self, "lock");
  objc_storeStrong((id *)&self->_manifest, v10);
  -[LoadExternalDownloadManifestOperation unlock](self, "unlock");
  unsigned int v15 = 0LL;
  BOOL v16 = 1;
  if (a4) {
LABEL_6:
  }
    *a4 = v15;
LABEL_7:

  return v16;
}

- (void)_processValidDownloads:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    LODWORD(v7) = v6;
  }
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if ((_DWORD)v7)
  {
    v9 = (void *)objc_opt_class(self);
    id v10 = v9;
    int v26 = 138412546;
    uint64_t v27 = v9;
    __int16 v28 = 2048;
    id v29 = [v4 count];
    id v11 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  1LL,  "%@: Processing %lu downloads from an external manifest request",  &v26,  22);

    if (!v11) {
      goto LABEL_13;
    }
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
    free(v11);
    v21 = v8;
    SSFileLog(v5, @"%@");
  }

LABEL_13:
  id v12 = -[NSMutableOrderedSet initWithCapacity:]( [NSMutableOrderedSet alloc],  "initWithCapacity:",  [v4 count]);
  unsigned __int8 v13 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v4 count]);
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100061E00;
  v22[3] = &unk_10034C668;
  id v15 = v4;
  id v23 = v15;
  BOOL v16 = v12;
  uint64_t v24 = v16;
  __int128 v17 = v13;
  v25 = v17;
  id v18 = [v14 modifyUsingTransactionBlock:v22];

  if (-[NSMutableOrderedSet count](v16, "count"))
  {
    -[LoadExternalDownloadManifestOperation lock](self, "lock");
    unsigned int v19 = (NSOrderedSet *)-[NSMutableOrderedSet copy](v16, "copy");
    downloadIDs = self->_downloadIDs;
    self->_downloadIDs = v19;

    -[LoadExternalDownloadManifestOperation unlock](self, "unlock");
  }

  if (-[NSMutableArray count](v17, "count", v21)) {
    +[AppStoreUtility sendSoftwareDownloads:withReason:manifestType:]( &OBJC_CLASS___AppStoreUtility,  "sendSoftwareDownloads:withReason:manifestType:",  v17,  @"external manifest",  1LL);
  }
}

- (BOOL)_runForPublicFormatWithURLRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___ISURLOperation);
  [v7 _setUsesPrivateCookieStore:0];
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___DaemonProtocolDataProvider);
  -[DaemonProtocolDataProvider setShouldProcessProtocol:](v8, "setShouldProcessProtocol:", 0LL);
  [v7 setDataProvider:v8];
  v9 = -[SSMutableURLRequestProperties initWithURLRequest:]( objc_alloc(&OBJC_CLASS___SSMutableURLRequestProperties),  "initWithURLRequest:",  v6);
  -[SSMutableURLRequestProperties setRequiresExtendedValidationCertificates:]( v9,  "setRequiresExtendedValidationCertificates:",  0LL);
  -[SSMutableURLRequestProperties setRequiresHTTPS:](v9, "setRequiresHTTPS:", 1LL);
  -[SSMutableURLRequestProperties setRequiresExternal:](v9, "setRequiresExternal:", 1LL);
  [v7 setRequestProperties:v9];
  id v33 = 0LL;
  unsigned __int8 v10 = -[LoadExternalDownloadManifestOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v7,  &v33);
  id v11 = v33;
  id v12 = v11;
  if ((v10 & 1) != 0)
  {
    id v32 = v11;
    BOOL v13 = -[LoadExternalDownloadManifestOperation _handlePublicResponseForOperation:error:]( self,  "_handlePublicResponseForOperation:error:",  v7,  &v32);
    unsigned __int8 v14 = v12;
    id v12 = v32;
    goto LABEL_28;
  }

  uint64_t v31 = a4;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v15) {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v16 = [v15 shouldLog];
  else {
    unsigned int v17 = v16;
  }
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v19 = v17;
  }
  else {
    uint64_t v19 = v17 & 2;
  }
  if ((_DWORD)v19)
  {
    uint64_t v20 = (void *)objc_opt_class(self);
    int v34 = 138412546;
    id v35 = v20;
    __int16 v36 = 2112;
    id v37 = v12;
    id v21 = v20;
    id v22 = (void *)_os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "%@: Request failed with error: %@",  &v34,  22);

    if (!v22) {
      goto LABEL_15;
    }
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v22,  4LL));
    free(v22);
    id v29 = v18;
    SSFileLog(v15, @"%@");
  }

LABEL_15:
  if (!ISErrorIsEqual(v12, SSErrorDomain, 128LL))
  {
    BOOL v13 = 0;
    a4 = v31;
    if (!v31) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }

  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v14) {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v23 = objc_msgSend(v14, "shouldLog", v29);
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    uint64_t v25 = v23;
  }
  else {
    uint64_t v25 = v23 & 2;
  }
  if (!(_DWORD)v25) {
    goto LABEL_26;
  }
  int v26 = (void *)objc_claimAutoreleasedReturnValue([v6 URL]);
  int v34 = 138412290;
  id v35 = v26;
  LODWORD(v30) = 12;
  uint64_t v27 = (void *)_os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v24,  16LL,  "[ERROR]: Cannot load non-https manifest URL: %@",  &v34,  v30);

  if (v27)
  {
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v27,  4LL));
    free(v27);
    SSFileLog(v14, @"%@");
LABEL_26:
  }

  BOOL v13 = 0;
  a4 = v31;
LABEL_28:

  if (a4) {
LABEL_29:
  }
    *a4 = v12;
LABEL_30:

  return v13;
}

- (BOOL)_runForPurchaseFormatWithURLRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = -[SSMutableURLRequestProperties initWithURLRequest:]( objc_alloc(&OBJC_CLASS___SSMutableURLRequestProperties),  "initWithURLRequest:",  v6);
  uint64_t v8 = -[LoadDownloadQueueOperation initWithRequestProperties:]( objc_alloc(&OBJC_CLASS___LoadDownloadQueueOperation),  "initWithRequestProperties:",  v7);
  -[LoadDownloadQueueOperation setNeedsAuthentication:](v8, "setNeedsAuthentication:", 0LL);
  -[LoadDownloadQueueOperation setReason:](v8, "setReason:", 1LL);
  -[LoadDownloadQueueOperation setRequestIdentifier:](v8, "setRequestIdentifier:", @"external");
  id v61 = 0LL;
  unsigned __int8 v9 = -[LoadExternalDownloadManifestOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v8,  &v61);
  id v10 = v61;
  id v11 = v10;
  if ((v9 & 1) != 0)
  {
    id v41 = v10;
    unsigned __int8 v42 = v9;
    id v44 = v7;
    v45 = a4;
    id v46 = v6;
    id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int16 v43 = v8;
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[LoadDownloadQueueOperation downloads](v8, "downloads"));
    unsigned __int8 v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    unsigned int v16 = v13;
    v50 = v16;
    id v52 = -[os_log_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v57,  v63,  16LL);
    if (v52)
    {
      uint64_t v51 = *(void *)v58;
      v48 = v14;
      v49 = v12;
      v47 = v15;
      do
      {
        for (i = 0LL; i != v52; i = (char *)i + 1)
        {
          if (*(void *)v58 != v51) {
            objc_enumerationMutation(v16);
          }
          id v18 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)i);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 kind]);
          int IsBookToShimKind = SSDownloadKindIsBookToShimKind();

          if (IsBookToShimKind)
          {
            -[NSMutableArray addObject:](v14, "addObject:", v18);
            -[NSMutableOrderedSet addObject:](v15, "addObject:", &off_10036D6F8);
          }

          else
          {
            id v21 = -[Download initWithStoreDownload:](objc_alloc(&OBJC_CLASS___Download), "initWithStoreDownload:", v18);
            id v22 = v21;
            if (v21)
            {
              unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(-[Download assets](v21, "assets"));
              __int128 v53 = 0u;
              __int128 v54 = 0u;
              __int128 v55 = 0u;
              __int128 v56 = 0u;
              id v24 = [v23 countByEnumeratingWithState:&v53 objects:v62 count:16];
              if (v24)
              {
                id v25 = v24;
                uint64_t v26 = *(void *)v54;
                do
                {
                  for (j = 0LL; j != v25; j = (char *)j + 1)
                  {
                    if (*(void *)v54 != v26) {
                      objc_enumerationMutation(v23);
                    }
                    __int16 v28 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)j);
                    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
                    [v28 setValue:v29 forProperty:@"is_external"];
                  }

                  id v25 = [v23 countByEnumeratingWithState:&v53 objects:v62 count:16];
                }

                while (v25);
              }

              id v12 = v49;
              -[NSMutableArray addObject:](v49, "addObject:", v22);

              unsigned int v16 = v50;
              id v15 = v47;
              unsigned __int8 v14 = v48;
            }
          }
        }

        id v52 = -[os_log_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v57,  v63,  16LL);
      }

      while (v52);
    }

    if (-[NSMutableOrderedSet count](v15, "count"))
    {
      -[LoadExternalDownloadManifestOperation lock](self, "lock");
      uint64_t v30 = (NSOrderedSet *)-[NSMutableOrderedSet copy](v15, "copy");
      downloadIDs = self->_downloadIDs;
      self->_downloadIDs = v30;

      -[LoadExternalDownloadManifestOperation unlock](self, "unlock");
    }

    if (-[NSMutableArray count](v14, "count")) {
      +[BookAssetDaemonUtility sendBookStoreDownloads:withReason:]( &OBJC_CLASS___BookAssetDaemonUtility,  "sendBookStoreDownloads:withReason:",  v14,  @"external manifest");
    }
    id v32 = -[ExternalDownloadManifest initWithValidDownloads:invalidDownloads:]( objc_alloc(&OBJC_CLASS___ExternalDownloadManifest),  "initWithValidDownloads:invalidDownloads:",  v12,  0LL);
    -[LoadExternalDownloadManifestOperation lock](self, "lock");
    manifest = self->_manifest;
    self->_manifest = v32;

    -[LoadExternalDownloadManifestOperation unlock](self, "unlock");
    a4 = v45;
    id v6 = v46;
    uint64_t v8 = v43;
    id v7 = v44;
    unsigned __int8 v9 = v42;
    id v11 = v41;
    goto LABEL_37;
  }

  id v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v12) {
    id v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  LODWORD(v34) = -[NSMutableArray shouldLog](v12, "shouldLog");
  id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSMutableArray OSLogObject](v12, "OSLogObject"));
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v34 = v34;
  }
  else {
    v34 &= 2u;
  }
  if (!(_DWORD)v34)
  {
    v50 = v35;
LABEL_37:

    goto LABEL_38;
  }

  __int16 v36 = (void *)objc_opt_class(self);
  int v64 = 138412546;
  v65 = v36;
  __int16 v66 = 2112;
  v67 = v11;
  id v37 = v36;
  id v38 = (void *)_os_log_send_and_compose_impl( v34,  0LL,  0LL,  0LL,  &_mh_execute_header,  v35,  0LL,  "%@: Request failed with error: %@",  &v64,  22);

  if (v38)
  {
    int v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v38,  4LL));
    free(v38);
    SSFileLog(v12, @"%@");
  }

- (BOOL)_showConfirmationPromptForManifest:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 URL]);
  if (v7
    || (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[LoadExternalDownloadManifestOperation URLRequest](self, "URLRequest")),
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 URL]),
        v8,
        v7))
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v7 host]);
    if ((unint64_t)[v9 length] >= 0x1F5)
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 substringToIndex:500]);

      unsigned __int8 v9 = (void *)v10;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 validDownloads]);
    uint64_t v12 = (uint64_t)[v11 count];
    uint64_t v13 = v12;
    if (v12 < 2)
    {
      if (v12 != 1) {
        goto LABEL_19;
      }
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:0]);
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 valueForProperty:@"title"]);
      if ([v17 length])
      {
        if ((unint64_t)[v17 length] >= 0x1F5)
        {
          uint64_t v19 = objc_claimAutoreleasedReturnValue([v17 substringToIndex:500]);

          unsigned int v17 = (void *)v19;
        }

        uint64_t v20 = objc_alloc(&OBJC_CLASS___NSString);
        id v21 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___SSItem));
        id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 localizedStringForKey:@"CONFIRM_MANIFEST_DOWNLOAD_SPECIFIC_%@_%@" value:&stru_10035EB18 table:0]);
        id v24 = -[NSString initWithFormat:](v20, "initWithFormat:", v23, v9, v17);
      }

      else
      {
        uint64_t v26 = objc_alloc(&OBJC_CLASS___NSString);
        uint64_t v27 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___SSItem));
        id v22 = (void *)objc_claimAutoreleasedReturnValue(v27);
        unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 localizedStringForKey:@"CONFIRM_MANIFEST_DOWNLOAD_GENERIC_%@" value:&stru_10035EB18 table:0]);
        id v24 = -[NSString initWithFormat:](v26, "initWithFormat:", v23, v9, v42);
      }

      id v18 = v24;
    }

    else
    {
      unsigned __int8 v14 = objc_alloc(&OBJC_CLASS___NSString);
      id v15 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___SSItem));
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"CONFIRM_MANIFEST_DOWNLOADS_%@_%ld" value:&stru_10035EB18 table:0]);
      id v18 = -[NSString initWithFormat:](v14, "initWithFormat:", v17, v9, v13);
    }

    if (v18)
    {
      id v44 = v11;
      id v45 = v6;
      __int16 v43 = v18;
      __int16 v28 = -[ISDialog initWithTitle:message:](objc_alloc(&OBJC_CLASS___ISDialog), "initWithTitle:message:", v18, 0LL);
      id v29 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___SSItem));
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      id v46 = self;
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( [v30 localizedStringForKey:@"CONFIRM_MANIFEST_CANCEL" value:&stru_10035EB18 table:0]);
      id v32 = (void *)objc_claimAutoreleasedReturnValue(+[ISDialogButton buttonWithTitle:](&OBJC_CLASS___ISDialogButton, "buttonWithTitle:", v31));
      id v33 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___SSItem));
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      id v35 = (void *)objc_claimAutoreleasedReturnValue( [v34 localizedStringForKey:@"CONFIRM_MANIFEST_INSTALL" value:&stru_10035EB18 table:0]);
      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(+[ISDialogButton buttonWithTitle:](&OBJC_CLASS___ISDialogButton, "buttonWithTitle:", v35));
      id v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v32, v36, 0LL));

      -[ISDialog setButtons:](v28, "setButtons:", v37);
      id v38 = objc_alloc_init(&OBJC_CLASS___ISDialogOperation);
      [v38 setDialog:v28];
      if (-[LoadExternalDownloadManifestOperation runSubOperation:returningError:]( v46,  "runSubOperation:returningError:",  v38,  0LL))
      {
        int v39 = (void *)objc_claimAutoreleasedReturnValue([v38 selectedButton]);
        if (v39) {
          BOOL v25 = [v37 indexOfObjectIdenticalTo:v39] == (id)1;
        }
        else {
          BOOL v25 = 0;
        }
        id v11 = v44;
        id v6 = v45;
        id v40 = v43;
      }

      else
      {
        BOOL v25 = 0;
        id v11 = v44;
        id v6 = v45;
        id v40 = v43;
      }

      goto LABEL_24;
    }

- (void)_showDialogForError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    unsigned int v7 = v6;
  }
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = v7 & 2;
  }
  if ((_DWORD)v9)
  {
    int v26 = 138412290;
    id v27 = v4;
    uint64_t v10 = (void *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  16LL,  "Could not load download manifest with underlying error: %@",  &v26,  12);

    if (!v10) {
      goto LABEL_13;
    }
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
    free(v10);
    BOOL v25 = v8;
    SSFileLog(v5, @"%@");
  }

LABEL_13:
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[LoadExternalDownloadManifestOperation URLRequest](self, "URLRequest"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 URL]);

  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 host]);
    if ((unint64_t)[v13 length] >= 0x1F5)
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 substringToIndex:500]);

      uint64_t v13 = (void *)v14;
    }

    int IsEqual = ISErrorIsEqual(v4, SSErrorDomain, 128LL);
    unsigned int v16 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___SSItem));
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v18 = v17;
    if (IsEqual) {
      uint64_t v19 = @"DOWNLOAD_MANIFEST_SSL_ERROR_%@";
    }
    else {
      uint64_t v19 = @"DOWNLOAD_MANIFEST_ERROR_FORMAT_%@";
    }
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v19, &stru_10035EB18, 0, v25));
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v20, v13));

    id v22 = -[ISDialog initWithTitle:message:](objc_alloc(&OBJC_CLASS___ISDialog), "initWithTitle:message:", v21, 0LL);
    unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[ISDialogOperation operationWithDialog:]( &OBJC_CLASS___ISDialogOperation,  "operationWithDialog:",  v22));
    [v23 addOperation:v24];
  }
}

- (void).cxx_destruct
{
}

@end