@interface MSDSessionTask
- (BOOL)redirected;
- (MSDPartialDownload)contentRange;
- (MSDSessionTaskInfo)info;
- (NSError)error;
- (NSFileHandle)fileHandle;
- (NSMutableData)outData;
- (NSURLSessionTask)task;
- (id)initFromTaskInfo:(id)a3;
- (id)prepareToWrite:(id)a3;
- (int)state;
- (int64_t)currentRetry;
- (void)resetData;
- (void)resetFileHandle;
- (void)setContentRange:(id)a3;
- (void)setCurrentRetry:(int64_t)a3;
- (void)setError:(id)a3;
- (void)setFileHandle:(id)a3;
- (void)setInfo:(id)a3;
- (void)setOutData:(id)a3;
- (void)setRedirected:(BOOL)a3;
- (void)setState:(int)a3;
- (void)setTask:(id)a3;
@end

@implementation MSDSessionTask

- (id)initFromTaskInfo:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MSDSessionTask;
  v5 = -[MSDSessionTask init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[MSDSessionTask setInfo:](v5, "setInfo:", v4);
    -[MSDSessionTask resetFileHandle](v6, "resetFileHandle");
    -[MSDSessionTask resetData](v6, "resetData");
    v7 = v6;
  }

  return v6;
}

- (void)resetFileHandle
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTask info](self, "info"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 savePath]);

  if (v4)
  {
    v5 = objc_alloc(&OBJC_CLASS___MSDPartialDownload);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTask info](self, "info"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 savePath]);
    v8 = -[MSDPartialDownload initWithFilePath:](v5, "initWithFilePath:", v7);
    -[MSDSessionTask setContentRange:](self, "setContentRange:", v8);

    v11 = (MSDPartialDownload *)objc_claimAutoreleasedReturnValue(-[MSDSessionTask info](self, "info"));
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPartialDownload savePath](v11, "savePath"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTask prepareToWrite:](self, "prepareToWrite:", v9));
    -[MSDSessionTask setFileHandle:](self, "setFileHandle:", v10);
  }

  else
  {
    v11 = objc_alloc_init(&OBJC_CLASS___MSDPartialDownload);
    -[MSDSessionTask setContentRange:](self, "setContentRange:");
  }
}

- (void)resetData
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 0LL));
  -[MSDSessionTask setOutData:](self, "setOutData:", v3);
}

- (id)prepareToWrite:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

  if ((v5 & 1) != 0)
  {
    id v6 = 0LL;
    goto LABEL_6;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByDeletingLastPathComponent]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v19 = 0LL;
  unsigned __int8 v9 = [v8 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v19];
  id v6 = v19;

  if ((v9 & 1) == 0)
  {
    id v16 = sub_10003A95C();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100096BA4((uint64_t)v7, v6);
    }
    goto LABEL_15;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v11 = [v10 createFileAtPath:v3 contents:0 attributes:0];

  if ((v11 & 1) == 0)
  {
    id v18 = sub_10003A95C();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100096AFC();
    }
LABEL_15:

LABEL_16:
    v13 = 0LL;
    goto LABEL_8;
  }

LABEL_6:
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForWritingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForWritingAtPath:",  v3));
  if (!v12)
  {
    id v15 = sub_10003A95C();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_100096A98();
    }
    goto LABEL_16;
  }

  v13 = v12;
  [v12 seekToEndOfFile];
  fcntl((int)[v13 fileDescriptor], 48, 1);
LABEL_8:

  return v13;
}

- (NSURLSessionTask)task
{
  return (NSURLSessionTask *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setTask:(id)a3
{
}

- (MSDSessionTaskInfo)info
{
  return (MSDSessionTaskInfo *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setInfo:(id)a3
{
}

- (MSDPartialDownload)contentRange
{
  return (MSDPartialDownload *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setContentRange:(id)a3
{
}

- (int64_t)currentRetry
{
  return self->_currentRetry;
}

- (void)setCurrentRetry:(int64_t)a3
{
  self->_currentRetry = a3;
}

- (NSMutableData)outData
{
  return (NSMutableData *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setOutData:(id)a3
{
}

- (NSFileHandle)fileHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setFileHandle:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (BOOL)redirected
{
  return self->_redirected;
}

- (void)setRedirected:(BOOL)a3
{
  self->_redirected = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end