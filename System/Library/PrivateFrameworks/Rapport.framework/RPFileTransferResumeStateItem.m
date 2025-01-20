@interface RPFileTransferResumeStateItem
- (BOOL)outputFileItemUsable:(id)a3;
- (BOOL)sourceFileItemUsable:(id)a3;
- (RPFileTransferResumeStateItem)initWithFileTransferRequestDict:(id)a3;
- (RPFileTransferResumeStateItem)initWithStateDict:(id)a3;
- (id)error;
- (id)fileInfo;
- (id)fileName;
- (id)itemURL;
- (unint64_t)bytesWritten;
- (unint64_t)fileModTime;
- (unint64_t)fileModTimeNsec;
- (unint64_t)fileOffset;
- (unint64_t)fileSize;
- (void)dealloc;
- (void)setBytesWritten:(unint64_t)a3;
- (void)setError:(id)a3;
- (void)setFileModTime:(unint64_t)a3;
- (void)setFileModTimeNsec:(unint64_t)a3;
- (void)setFileName:(id)a3;
- (void)setFileOffset:(unint64_t)a3;
- (void)setFileSize:(unint64_t)a3;
- (void)setItemURL:(id)a3;
@end

@implementation RPFileTransferResumeStateItem

- (RPFileTransferResumeStateItem)initWithFileTransferRequestDict:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___RPFileTransferResumeStateItem;
  v5 = -[RPFileTransferResumeStateItem init](&v16, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    fileInfo = v5->_fileInfo;
    v5->_fileInfo = v6;

    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8) {
      -[RPFileTransferResumeStateItem setFileName:](v5, "setFileName:", v8);
    }
    uint64_t Int64 = CFDictionaryGetInt64();
    if (!v15) {
      -[RPFileTransferResumeStateItem setFileSize:](v5, "setFileSize:", Int64);
    }
    uint64_t v10 = CFDictionaryGetInt64();
    if (!v15) {
      -[RPFileTransferResumeStateItem setFileOffset:](v5, "setFileOffset:", v10);
    }
    uint64_t v11 = CFDictionaryGetInt64();
    if (!v15) {
      -[RPFileTransferResumeStateItem setFileModTime:](v5, "setFileModTime:", v11);
    }
    uint64_t v12 = CFDictionaryGetInt64();
    if (!v15) {
      -[RPFileTransferResumeStateItem setFileModTimeNsec:](v5, "setFileModTimeNsec:", v12);
    }
    -[RPFileTransferResumeStateItem setBytesWritten:](v5, "setBytesWritten:", 0LL);
    -[RPFileTransferResumeStateItem setError:](v5, "setError:", 0LL);
    v13 = v5;
  }

  return v5;
}

- (RPFileTransferResumeStateItem)initWithStateDict:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RPFileTransferResumeStateItem;
  v6 = -[RPFileTransferResumeStateItem init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fileInfo, a3);
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  fileInfo = self->_fileInfo;
  self->_fileInfo = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RPFileTransferResumeStateItem;
  -[RPFileTransferResumeStateItem dealloc](&v4, sel_dealloc);
}

- (id)fileInfo
{
  return self->_fileInfo;
}

- (id)itemURL
{
  return (id)-[NSMutableDictionary objectForKey:](self->_fileInfo, "objectForKey:", @"sourceFileURL");
}

- (void)setItemURL:(id)a3
{
}

- (id)fileName
{
  return (id)-[NSMutableDictionary objectForKey:](self->_fileInfo, "objectForKey:", @"outputFileName");
}

- (void)setFileName:(id)a3
{
}

- (unint64_t)fileSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = 0LL;
  }

  return v4;
}

- (void)setFileSize:(unint64_t)a3
{
  fileInfo = self->_fileInfo;
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](fileInfo, "setValue:forKey:", v4, @"fileSize");
}

- (unint64_t)fileOffset
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = 0LL;
  }

  return v4;
}

- (void)setFileOffset:(unint64_t)a3
{
  fileInfo = self->_fileInfo;
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](fileInfo, "setValue:forKey:", v4, @"fileOffset");
}

- (unint64_t)fileModTime
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = 0LL;
  }

  return v4;
}

- (void)setFileModTime:(unint64_t)a3
{
  fileInfo = self->_fileInfo;
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](fileInfo, "setValue:forKey:", v4, @"modTime");
}

- (unint64_t)fileModTimeNsec
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = 0LL;
  }

  return v4;
}

- (void)setFileModTimeNsec:(unint64_t)a3
{
  fileInfo = self->_fileInfo;
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](fileInfo, "setValue:forKey:", v4, @"modTimeNsec");
}

- (unint64_t)bytesWritten
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = 0LL;
  }

  return v4;
}

- (void)setBytesWritten:(unint64_t)a3
{
  fileInfo = self->_fileInfo;
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](fileInfo, "setValue:forKey:", v4, @"bytesWritten");
}

- (id)error
{
  return (id)-[NSMutableDictionary objectForKey:](self->_fileInfo, "objectForKey:", @"error");
}

- (void)setError:(id)a3
{
  fileInfo = self->_fileInfo;
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setValue:forKey:](fileInfo, "setValue:forKey:", v4, @"error");
}

- (BOOL)sourceFileItemUsable:(id)a3
{
  id v4 = a3;
  -[RPFileTransferResumeStateItem error](self, "error");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (gLogCategory_RPFileTransferSession > 30
      || gLogCategory_RPFileTransferSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_25;
    }

    goto LABEL_12;
  }

  [MEMORY[0x1896078A8] defaultManager];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = [v6 fileExistsAtPath:v4];

  if ((v7 & 1) == 0)
  {
    if (gLogCategory_RPFileTransferSession > 30
      || gLogCategory_RPFileTransferSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_25;
    }

- (BOOL)outputFileItemUsable:(id)a3
{
  id v4 = a3;
  -[RPFileTransferResumeStateItem fileName](self, "fileName");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringByAppendingPathComponent:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  unint64_t v7 = -[RPFileTransferResumeStateItem fileOffset](self, "fileOffset");
  unint64_t v8 = -[RPFileTransferResumeStateItem bytesWritten](self, "bytesWritten");
  -[RPFileTransferResumeStateItem error](self, "error");
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (gLogCategory_RPFileTransferSession > 30
      || gLogCategory_RPFileTransferSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_34;
    }

    goto LABEL_4;
  }

  off_t v10 = v8 + v7;
  if (!(v8 + v7))
  {
    if (gLogCategory_RPFileTransferSession > 30
      || gLogCategory_RPFileTransferSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_34;
    }

- (void).cxx_destruct
{
}

@end