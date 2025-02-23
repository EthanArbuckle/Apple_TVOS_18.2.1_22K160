@interface SDLog
- (BOOL)supportsPartialCollection;
- (NSArray)offsets;
- (NSArray)sizes;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSString)fileOwner;
- (NSString)fileType;
- (NSString)filename;
- (NSString)path;
- (NSString)subdirectory;
- (SDLog)init;
- (SDLog)initWithPath:(id)a3 subdirectory:(id)a4 error:(id *)a5;
- (int64_t)compareLogDateDescending:(id)a3;
- (unint64_t)sizeBytes;
- (void)setCreationDate:(id)a3;
- (void)setFileOwner:(id)a3;
- (void)setFileType:(id)a3;
- (void)setFilename:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setOffsets:(id)a3;
- (void)setPath:(id)a3;
- (void)setSizeBytes:(unint64_t)a3;
- (void)setSizes:(id)a3;
- (void)setSubdirectory:(id)a3;
@end

@implementation SDLog

- (SDLog)init
{
  return -[SDLog initWithPath:subdirectory:error:]( self,  "initWithPath:subdirectory:error:",  &stru_10008D288,  &stru_10008D288,  0LL);
}

- (SDLog)initWithPath:(id)a3 subdirectory:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___SDLog;
  v11 = -[SDLog init](&v34, "init");
  v12 = v11;
  if (v11)
  {
    p_path = (void **)&v11->_path;
    objc_storeStrong((id *)&v11->_path, a3);
    objc_storeStrong((id *)&v12->_subdirectory, a4);
    offsets = v12->_offsets;
    v12->_offsets = 0LL;

    sizes = v12->_sizes;
    v12->_sizes = 0LL;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[NSString lastPathComponent](v12->_path, "lastPathComponent"));
    filename = v12->_filename;
    v12->_filename = (NSString *)v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 attributesOfItemAtPath:v12->_path error:a5]);
    v20 = v19;
    if (v19)
    {
      uint64_t v21 = objc_claimAutoreleasedReturnValue([v19 fileType]);
      fileType = v12->_fileType;
      v12->_fileType = (NSString *)v21;

      if (v12->_fileType == NSFileTypeDirectory) {
        id v23 = (id)sub_100021AE0(*p_path);
      }
      else {
        id v23 = [v20 fileSize];
      }
      v12->_sizeBytes = (unint64_t)v23;
      uint64_t v26 = objc_claimAutoreleasedReturnValue([v20 fileCreationDate]);
      creationDate = v12->_creationDate;
      v12->_creationDate = (NSDate *)v26;

      uint64_t v28 = objc_claimAutoreleasedReturnValue([v20 fileModificationDate]);
      modificationDate = v12->_modificationDate;
      v12->_modificationDate = (NSDate *)v28;

      fileOwner = v12->_fileOwner;
      v12->_fileOwner = 0LL;

      uint64_t v31 = objc_claimAutoreleasedReturnValue([v20 objectForKey:NSFileOwnerAccountName]);
      v32 = v12->_fileOwner;
      v12->_fileOwner = (NSString *)v31;

      v24 = v12;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *p_path;
        *(_DWORD *)buf = 138412290;
        v36 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "couldn't get file attributes for %@",  buf,  0xCu);
      }

      v24 = 0LL;
    }
  }

  else
  {
    v24 = 0LL;
  }

  return v24;
}

- (int64_t)compareLogDateDescending:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 creationDate]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDLog creationDate](self, "creationDate"));
  id v6 = [v4 compare:v5];

  return (int64_t)v6;
}

- (BOOL)supportsPartialCollection
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDLog path](self, "path"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pathExtension]);
  if ([v4 containsString:@"log"])
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDLog path](self, "path"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pathExtension]);
    unsigned __int8 v5 = [v7 containsString:@"txt"];
  }

  return v5;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSString)subdirectory
{
  return self->_subdirectory;
}

- (void)setSubdirectory:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (unint64_t)sizeBytes
{
  return self->_sizeBytes;
}

- (void)setSizeBytes:(unint64_t)a3
{
  self->_sizeBytes = a3;
}

- (NSString)fileType
{
  return self->_fileType;
}

- (void)setFileType:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
}

- (NSString)fileOwner
{
  return self->_fileOwner;
}

- (void)setFileOwner:(id)a3
{
}

- (NSArray)offsets
{
  return self->_offsets;
}

- (void)setOffsets:(id)a3
{
}

- (NSArray)sizes
{
  return self->_sizes;
}

- (void)setSizes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end