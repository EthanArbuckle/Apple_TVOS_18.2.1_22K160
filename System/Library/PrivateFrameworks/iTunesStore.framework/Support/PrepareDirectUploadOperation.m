@interface PrepareDirectUploadOperation
- (PrepareDirectUploadOperation)initWithRequest:(id)a3;
- (id)_newURLRequestWithURL:(id)a3;
- (id)_uploadURL;
- (id)outputBlock;
- (void)run;
- (void)setOutputBlock:(id)a3;
@end

@implementation PrepareDirectUploadOperation

- (PrepareDirectUploadOperation)initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PrepareDirectUploadOperation;
  v6 = -[PrepareDirectUploadOperation init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

- (id)outputBlock
{
  id v3 = [self->_outputBlock copy];
  -[PrepareDirectUploadOperation unlock](self, "unlock");
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setOutputBlock:(id)a3
{
  id v6 = a3;
  -[PrepareDirectUploadOperation lock](self, "lock");
  if (self->_outputBlock != v6)
  {
    id v4 = [v6 copy];
    id outputBlock = self->_outputBlock;
    self->_id outputBlock = v4;
  }

  -[PrepareDirectUploadOperation unlock](self, "unlock");
}

- (void)run
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadRequest localAssetURL](self->_request, "localAssetURL"));
  id v4 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  if (!v3)
  {
    uint64_t v19 = 136LL;
LABEL_50:
    uint64_t v42 = SSError(SSErrorDomain, v19, 0LL, 0LL);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v42);
    id v39 = 0LL;
    v40 = 0LL;
    goto LABEL_51;
  }

  if ([v3 isFileURL])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
    unsigned __int8 v6 = -[NSFileManager isReadableFileAtPath:](v4, "isReadableFileAtPath:", v5);

    if ((v6 & 1) == 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v20) {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      LODWORD(v29) = [v20 shouldLog];
      unsigned int v30 = [v20 shouldLogToDisk];
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 OSLogObject]);
      v32 = v31;
      if (v30) {
        LODWORD(v29) = v29 | 2;
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v29 = v29;
      }
      else {
        v29 &= 2u;
      }
      if ((_DWORD)v29)
      {
        id v33 = (id)objc_opt_class(self);
        int64_t v34 = -[DirectUploadRequest databaseIdentifier](self->_request, "databaseIdentifier");
        int v46 = 138412802;
        id v47 = v33;
        __int16 v48 = 2048;
        int64_t v49 = v34;
        __int16 v50 = 2112;
        v51 = v3;
        v35 = (void *)_os_log_send_and_compose_impl( v29,  0LL,  0LL,  0LL,  &_mh_execute_header,  v32,  0LL,  "%@: File not readable for upload: %lld, URL: %@",  &v46,  32);

        if (v35)
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v35,  4LL));
          free(v35);
          SSFileLog(v20, @"%@");
        }
      }

      else
      {
      }

      uint64_t v19 = 136LL;
      goto LABEL_49;
    }
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadRequest accountIdentifier](self->_request, "accountIdentifier"));

  if (!v7)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v20) {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v21) = [v20 shouldLog];
    unsigned int v22 = [v20 shouldLogToDisk];
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 OSLogObject]);
    v24 = v23;
    if (v22) {
      LODWORD(v21) = v21 | 2;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v21 = v21;
    }
    else {
      v21 &= 2u;
    }
    if ((_DWORD)v21)
    {
      id v25 = (id)objc_opt_class(self);
      int64_t v26 = -[DirectUploadRequest databaseIdentifier](self->_request, "databaseIdentifier");
      int v46 = 138412546;
      id v47 = v25;
      __int16 v48 = 2048;
      int64_t v49 = v26;
      v27 = (void *)_os_log_send_and_compose_impl( v21,  0LL,  0LL,  0LL,  &_mh_execute_header,  v24,  0LL,  "%@: Missing account for upload: %lld",  &v46,  22);

      if (v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v27,  4LL));
        free(v27);
        SSFileLog(v20, @"%@");
      }
    }

    else
    {
    }

    uint64_t v19 = 119LL;
LABEL_49:

    goto LABEL_50;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PrepareDirectUploadOperation _uploadURL](self, "_uploadURL"));
  if (v8)
  {
    objc_super v9 = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  @"com.apple.itunesstored");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v10) {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v11) = [v10 shouldLog];
    unsigned int v12 = [v10 shouldLogToDisk];
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
    v14 = v13;
    if (v12) {
      LODWORD(v11) = v11 | 2;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      id v15 = (id)objc_opt_class(self);
      int64_t v16 = -[DirectUploadRequest databaseIdentifier](self->_request, "databaseIdentifier");
      int v46 = 138412802;
      id v47 = v15;
      __int16 v48 = 2048;
      int64_t v49 = v16;
      __int16 v50 = 2112;
      v51 = v8;
      v17 = (void *)_os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  1LL,  "%@: Preparing upload: %lld with request URL: %@",  &v46,  32);

      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL));
        free(v17);
        v45 = v18;
        SSFileLog(v10, @"%@");
      }
    }

    else
    {
    }

    id v39 = -[PrepareDirectUploadOperation _newURLRequestWithURL:](self, "_newURLRequestWithURL:", v8);
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadRequest sourceApplication](self->_request, "sourceApplication"));
    if (v41)
    {
      -[NSMutableString appendString:](v9, "appendString:", @".");
      -[NSMutableString appendString:](v9, "appendString:", v41);
    }

    v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:]( &OBJC_CLASS___NSURLSessionConfiguration,  "backgroundSessionConfigurationWithIdentifier:",  v9));
    objc_msgSend(v40, "setAllowsCellularAccess:", objc_msgSend(v39, "allowsCellularAccess"));
    [v40 setHTTPCookieAcceptPolicy:1];
    [v40 setHTTPShouldSetCookies:0];
    [v40 setHTTPShouldUsePipelining:1];
    [v40 setSessionSendsLaunchEvents:1];
    objc_msgSend(v40, "set_allowsRetryForBackgroundDataTasks:", 1);
    objc_msgSend(v40, "set_sourceApplicationBundleIdentifier:", v41);

    v38 = 0LL;
  }

  else
  {
    uint64_t v37 = SSError(SSErrorDomain, 124LL, 0LL, 0LL);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    id v39 = 0LL;
    v40 = 0LL;
  }

LABEL_51:
  -[PrepareDirectUploadOperation setError:](self, "setError:", v38);
  -[PrepareDirectUploadOperation setSuccess:](self, "setSuccess:", 0LL);
  uint64_t v43 = objc_claimAutoreleasedReturnValue(-[PrepareDirectUploadOperation outputBlock](self, "outputBlock"));
  v44 = (void *)v43;
  if (v43)
  {
    (*(void (**)(uint64_t, void *, id, void *))(v43 + 16))(v43, v40, v39, v38);
    -[PrepareDirectUploadOperation setOutputBlock:](self, "setOutputBlock:", 0LL);
  }
}

- (id)_newURLRequestWithURL:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMutableURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "initWithURL:", v4);
  -[NSMutableURLRequest setHTTPMethod:](v5, "setHTTPMethod:", @"POST");
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadRequest accountIdentifier](self->_request, "accountIdentifier"));
  +[ISStoreURLOperation addITunesStoreHeadersToRequest:withAccountIdentifier:]( &OBJC_CLASS___ISStoreURLOperation,  "addITunesStoreHeadersToRequest:withAccountIdentifier:",  v5,  v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSDevice currentDevice](&OBJC_CLASS___SSDevice, "currentDevice"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userAgent]);

  if (v8) {
    -[NSMutableURLRequest setValue:forHTTPHeaderField:](v5, "setValue:forHTTPHeaderField:", v8, SSHTTPHeaderUserAgent);
  }
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSVCookieStorage sharedStorage](&OBJC_CLASS___SSVCookieStorage, "sharedStorage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 cookieHeadersForURL:v4 userIdentifier:v6]);

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10009619C;
  v24[3] = &unk_10034B178;
  uint64_t v11 = v5;
  id v25 = v11;
  [v10 enumerateKeysAndObjectsUsingBlock:v24];
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadRequest parentRelationshipType](self->_request, "parentRelationshipType"));
  unsigned int v13 = [v12 isEqualToString:SSVMediaSocialPostAttachmentRelationshipCoverImage];

  if (v13) {
    -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v11,  "setValue:forHTTPHeaderField:",  @"RP.AudioCoverArt",  @"X-Apple-Upload-Validation-RuleSets");
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadRequest UTI](self->_request, "UTI"));
  id v15 = v14;
  if (v14)
  {
    int64_t v16 = v14;
    if ((-[__CFString isEqualToString:](v16, "isEqualToString:", @"com.apple.coreaudio-format") & 1) != 0)
    {
      v17 = @"audio/x-caf";
    }

    else
    {
      v17 = (__CFString *)UTTypeCopyPreferredTagWithClass(v16, kUTTagClassMIMEType);
      if (!v17)
      {
LABEL_10:
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 UUIDString]);

        v20 = (__CFString *)UTTypeCopyPreferredTagWithClass(v16, kUTTagClassFilenameExtension);
        if (v20)
        {
          uint64_t v21 = objc_claimAutoreleasedReturnValue([v19 stringByAppendingPathExtension:v20]);

          uint64_t v19 = (void *)v21;
        }

        -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v11,  "setValue:forHTTPHeaderField:",  v19,  @"X-Original-Filename");
        CFRelease(v16);

        goto LABEL_13;
      }
    }

    -[NSMutableURLRequest setValue:forHTTPHeaderField:](v11, "setValue:forHTTPHeaderField:", v17, @"Content-Type");

    goto LABEL_10;
  }

- (id)_uploadURL
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadRequest UTI](self->_request, "UTI"));
  uint64_t v4 = SSVMediaSocialAttachmentTypeForTypeIdentifier();

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( -[PrepareDirectUploadOperation loadedURLBagWithContext:returningError:]( self,  "loadedURLBagWithContext:returningError:",  v5,  0LL));

  if (v6 && (unint64_t)(v4 - 1) <= 3)
  {
    v7 = off_10034D0D8[v4 - 1];
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 urlForKey:v7]);
    if (v8) {
      goto LABEL_31;
    }
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:v7]);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v7]);
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0) {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v11));
      }
      else {
        v8 = 0LL;
      }

      if (v8) {
        goto LABEL_31;
      }
    }

    else
    {
    }
  }

  CFPropertyListRef v13 = CFPreferencesCopyAppValue(@"ISDirectUploadURL", kSSUserDefaultsIdentifier);
  if (v13)
  {
    v14 = v13;
    CFTypeID v15 = CFGetTypeID(v13);
    if (v15 != CFStringGetTypeID())
    {
      v8 = 0LL;
LABEL_30:
      CFRelease(v14);
      goto LABEL_31;
    }

    int64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v14));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v17) {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v18 = [v17 shouldLog];
    else {
      LODWORD(v19) = v18;
    }
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v19 = v19;
    }
    else {
      v19 &= 2u;
    }
    if ((_DWORD)v19)
    {
      int v24 = 138412546;
      id v25 = (id)objc_opt_class(self);
      __int16 v26 = 2112;
      v27 = v16;
      id v21 = v25;
      unsigned int v22 = (void *)_os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  0LL,  "%@: Using base URL from user defaults: %@",  &v24,  22);

      if (!v22)
      {
LABEL_24:

        else {
          v8 = (void *)objc_claimAutoreleasedReturnValue([v16 URLByAppendingPathComponent:off_10034D0F8[v4 - 1]]);
        }

        goto LABEL_30;
      }

      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v22,  4LL));
      free(v22);
      SSFileLog(v17, @"%@");
    }

    goto LABEL_24;
  }

  v8 = 0LL;
LABEL_31:

  return v8;
}

- (void).cxx_destruct
{
}

@end