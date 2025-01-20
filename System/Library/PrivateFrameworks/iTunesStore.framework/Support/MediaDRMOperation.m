@interface MediaDRMOperation
- (MediaDRMOperation)initWithMediaPath:(id)a3 sinfs:(id)a4;
- (NSString)mediaFileExtension;
- (NSString)mediaPath;
- (id)sinfs;
- (void)dealloc;
- (void)run;
@end

@implementation MediaDRMOperation

- (MediaDRMOperation)initWithMediaPath:(id)a3 sinfs:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MediaDRMOperation;
  v6 = -[MediaDRMOperation init](&v8, "init");
  if (v6)
  {
    v6->_mediaPath = (NSString *)[a3 copy];
    v6->_sinfs = [a4 copy];
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MediaDRMOperation;
  -[MediaDRMOperation dealloc](&v3, "dealloc");
}

- (NSString)mediaFileExtension
{
  objc_super v3 = self->_mediaFileExtension;
  -[MediaDRMOperation unlock](self, "unlock");
  return v3;
}

- (NSString)mediaPath
{
  return self->_mediaPath;
}

- (id)sinfs
{
  return self->_sinfs;
}

- (void)run
{
  uint64_t v3 = OBJC_IVAR___ISOperation__progress;
  [*(id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress] setMaxValue:100];
  [*(id *)&self->ISOperation_opaque[v3] setUnits:0];
  id v4 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v4) {
    id v4 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v5 = [v4 shouldLog];
  else {
    LODWORD(v6) = v5;
  }
  v7 = (os_log_s *)[v4 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    uint64_t v6 = v6;
  }
  else {
    v6 &= 2u;
  }
  if ((_DWORD)v6)
  {
    uint64_t v8 = objc_opt_class(self);
    mediaPath = self->_mediaPath;
    int v30 = 138412546;
    uint64_t v31 = v8;
    __int16 v32 = 2112;
    v33 = mediaPath;
    uint64_t v10 = _os_log_send_and_compose_impl( v6,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  1LL,  "%@: Processing file: %@",  &v30,  22);
    if (v10)
    {
      v11 = (void *)v10;
      v12 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v10, 4LL);
      free(v11);
      v26 = v12;
      SSFileLog(v4, @"%@");
    }
  }

  v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v29 = 0LL;
  id sinfs = self->_sinfs;
  if (sinfs) {
    -[NSMutableDictionary setObject:forKey:]( v13,  "setObject:forKey:",  sinfs,  ISWeakLinkedStringConstantForString("AVFileProcessorAttribute_Sinfs", 14LL));
  }
  id v15 = objc_msgSend((id)ISWeakLinkedClassForString(@"AVFileProcessor", 14), "fileProcessor");
  v16 = self->_mediaPath;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10001F6EC;
  v28[3] = &unk_10034B350;
  v28[4] = self;
  v17 = (NSString *)[v15 processPurchasedItem:v16 withAttributes:v13 resultInfo:&v29 progressBlock:v28];
  if (v17)
  {
    id v18 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v18) {
      id v18 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v19 = objc_msgSend(v18, "shouldLog", v26);
    else {
      LODWORD(v20) = v19;
    }
    v21 = (os_log_s *)[v18 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v20 = v20;
    }
    else {
      v20 &= 2u;
    }
    if ((_DWORD)v20)
    {
      uint64_t v22 = objc_opt_class(self);
      int v30 = 138412546;
      uint64_t v31 = v22;
      __int16 v32 = 2112;
      v33 = v17;
      LODWORD(v27) = 22;
      uint64_t v23 = _os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "%@: Failed with error: %@",  &v30,  v27);
      if (v23)
      {
        v24 = (void *)v23;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v23, 4LL);
        free(v24);
        SSFileLog(v18, @"%@");
      }
    }

    uint64_t v25 = ISErrorWithExternalError(v17);
  }

  else
  {
    -[MediaDRMOperation lock](self, "lock");

    self->_mediaFileExtension = (NSString *) objc_msgSend( v29,  "objectForKey:",  ISWeakLinkedStringConstantForString( "AVFileProcessorAttribute_NewFileExtension",  14));
    -[MediaDRMOperation unlock](self, "unlock");
    uint64_t v25 = 0LL;
  }

  -[MediaDRMOperation setError:](self, "setError:", v25);
  -[MediaDRMOperation setSuccess:](self, "setSuccess:", v17 == 0LL);
}

@end