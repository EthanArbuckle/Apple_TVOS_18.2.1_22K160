@interface MSDDownloadFileRequest
- (BOOL)isValid;
- (Class)getResponseClass;
- (MSDDownloadFileRequest)init;
- (MSDFileDownloadInfo)fileInfo;
- (double)dispatchTime;
- (id)description;
- (id)parseResponseForError:(id)a3 andPayload:(id)a4;
- (int64_t)retryCount;
- (void)setDispatchTime:(double)a3;
- (void)setFileInfo:(id)a3;
- (void)setRetryCount:(int64_t)a3;
@end

@implementation MSDDownloadFileRequest

- (MSDDownloadFileRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDDownloadFileRequest;
  v2 = -[MSDDownloadFileRequest init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___MSDFileDownloadInfo);
    -[MSDDownloadFileRequest setFileInfo:](v2, "setFileInfo:", v3);

    -[MSDDownloadFileRequest setRetryCount:](v2, "setRetryCount:", 2LL);
    -[MSDDownloadFileRequest setDispatchTime:](v2, "setDispatchTime:", 0.0);
    v4 = v2;
  }

  return v2;
}

- (BOOL)isValid
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MSDDownloadFileRequest;
  if (!-[MSDCDNServerRequest isValid](&v9, "isValid")) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadFileRequest fileInfo](self, "fileInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fileHash]);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest savePath](self, "savePath"));
    if (v5)
    {
      objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest completion](self, "completion"));
      BOOL v7 = v6 != 0LL;
    }

    else
    {
      BOOL v7 = 0;
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest getName](self, "getName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadFileRequest fileInfo](self, "fileInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 fileHash]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest savePath](self, "savePath"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: hash=%@; toPath=%@",
                   v3,
                   v5,
                   v6));

  return v7;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___MSDDownloadFileResponse, a2);
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___MSDDownloadFileRequest;
  id v9 = -[MSDServerRequest parseResponseForError:andPayload:](&v42, "parseResponseForError:andPayload:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 error]);
  if (v11)
  {
    id v21 = 0LL;
    v13 = 0LL;
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"fileSize"]);
    v13 = v12;
    if (v12) {
      id v14 = [v12 integerValue];
    }
    else {
      id v14 = 0LL;
    }
    [v10 setDownloadedSize:v14];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadFileRequest fileInfo](self, "fileInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest savePath](self, "savePath"));
    unsigned __int8 v17 = [v15 hashCheckForFile:v16];

    if ((v17 & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadFileRequest fileInfo](self, "fileInfo"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest savePath](self, "savePath"));
      unsigned __int8 v20 = [v18 entitlementCheckForFile:v19];

      if ((v20 & 1) != 0)
      {
        id v21 = 0LL;
        goto LABEL_8;
      }

      uint64_t v40 = 0LL;
      v36 = @"Some file(s) are not allowed to install.";
      v37 = (id *)&v40;
      v38 = &v40;
      uint64_t v35 = 3727740932LL;
    }

    else
    {
      uint64_t v41 = 0LL;
      uint64_t v35 = 3727740946LL;
      v36 = @"Some file(s) are corrupted.";
      v37 = (id *)&v41;
      v38 = &v41;
    }

    sub_100087610(v38, v35, (uint64_t)v36);
    id v21 = *v37;
  }

- (MSDFileDownloadInfo)fileInfo
{
  return (MSDFileDownloadInfo *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setFileInfo:(id)a3
{
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (double)dispatchTime
{
  return self->_dispatchTime;
}

- (void)setDispatchTime:(double)a3
{
  self->_dispatchTime = a3;
}

- (void).cxx_destruct
{
}

@end