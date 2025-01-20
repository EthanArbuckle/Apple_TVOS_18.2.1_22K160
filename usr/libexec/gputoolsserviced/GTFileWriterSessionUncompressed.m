@interface GTFileWriterSessionUncompressed
+ (id)sessionWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)_closeCurrentFileDescriptor:(id *)a3;
- (BOOL)_writeUncompressedFileData:(const char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (BOOL)finish:(id *)a3;
- (GTFileWriterSessionUncompressed)initWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6;
- (int)_getCurrentFileDescriptor:(id *)a3;
- (int)_openNextFile:(id *)a3;
- (void)writeFileData:(id)a3 completionHandler:(id)a4;
@end

@implementation GTFileWriterSessionUncompressed

+ (id)sessionWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [objc_alloc((Class)a1) initWithFileEntries:v12 relativeToURL:v11 options:v10 error:a6];

  return v13;
}

- (GTFileWriterSessionUncompressed)initWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v62.receiver = self;
  v62.super_class = (Class)&OBJC_CLASS___GTFileWriterSessionUncompressed;
  v14 = -[GTFileWriterSessionUncompressed init](&v62, "init");
  v15 = v14;
  if (!v14) {
    goto LABEL_33;
  }
  v57 = a6;
  id v58 = v13;
  objc_storeStrong((id *)&v14->_fileEntries, a3);
  objc_storeStrong((id *)&v15->_baseURL, a4);
  v15->_currentFileIndex = 0LL;
  v15->_currentFileBytesWritten = 0LL;
  v15->_fd = -1;
  os_log_t v16 = os_log_create("com.apple.gputools.transport", "FileWriterSession");
  log = v15->_log;
  v15->_log = v16;

  id v18 = v11;
  id v19 = v12;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  id obj = v18;
  id v20 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
  v59 = v19;
  if (!v20)
  {
    id v22 = 0LL;
    int v35 = 1;
    goto LABEL_30;
  }

  id v21 = v20;
  v54 = v15;
  id v55 = v12;
  id v56 = v11;
  id v22 = 0LL;
  uint64_t v61 = *(void *)v65;
  do
  {
    v23 = 0LL;
    v24 = v22;
    do
    {
      if (*(void *)v65 != v61) {
        objc_enumerationMutation(obj);
      }
      v25 = *(void **)(*((void *)&v64 + 1) + 8LL * (void)v23);
      v26 = objc_autoreleasePoolPush();
      id v63 = v24;
      id v27 = v25;
      id v28 = v19;
      v29 = objc_alloc(&OBJC_CLASS___NSURL);
      v30 = (void *)objc_claimAutoreleasedReturnValue([v27 path]);
      v31 = -[NSURL initFileURLWithPath:isDirectory:relativeToURL:]( v29,  "initFileURLWithPath:isDirectory:relativeToURL:",  v30,  0LL,  v28);

      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByDeletingLastPathComponent](v31, "URLByDeletingLastPathComponent"));
      unsigned int v34 = [v32 createDirectoryAtURL:v33 withIntermediateDirectories:1 attributes:0 error:&v63];

      int v35 = 0;
      if (v34)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue([v27 destination]);

        if (v36)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v31, "path"));
          v39 = (void *)objc_claimAutoreleasedReturnValue([v27 destination]);
          unsigned __int8 v40 = [v37 createSymbolicLinkAtPath:v38 withDestinationPath:v39 error:&v63];

          if ((v40 & 1) != 0) {
            goto LABEL_10;
          }
LABEL_22:
          int v35 = 0;
LABEL_23:
          id v19 = v59;
          goto LABEL_24;
        }

        v41 = objc_alloc_init(&OBJC_CLASS___NSData);
        unsigned int v42 = -[NSData writeToURL:options:error:](v41, "writeToURL:options:error:", v31, 0LL, &v63);

        if (!v42) {
          goto LABEL_19;
        }
        int v43 = open(-[NSURL fileSystemRepresentation](v31, "fileSystemRepresentation"), 1, 0LL);
        if (v43 < 0)
        {
          uint64_t v47 = *__error();
          NSErrorUserInfoKey v69 = NSLocalizedDescriptionKey;
          v70 = @"Failed to open file for writing";
          v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v70,  &v69,  1LL));
          id v63 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v47,  v48));

          id v19 = v59;
LABEL_19:
          int v35 = 0;
          goto LABEL_24;
        }

        int v44 = v43;
        if (ftruncate(v43, (off_t)[v27 fileSize]) < 0)
        {
          uint64_t v49 = *__error();
          NSErrorUserInfoKey v69 = NSLocalizedDescriptionKey;
          v70 = @"Failed to resize file";
          v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v70,  &v69,  1LL));
          id v63 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v49,  v50));

          id v19 = v59;
          close(v44);
          goto LABEL_19;
        }

        if (fsync(v44) < 0)
        {
          uint64_t v45 = *__error();
          NSErrorUserInfoKey v69 = NSLocalizedDescriptionKey;
          v46 = @"Failed to flush file";
        }

        else
        {
          if ((close(v44) & 0x80000000) == 0)
          {
LABEL_10:
            int v35 = 1;
            goto LABEL_23;
          }

          uint64_t v45 = *__error();
          NSErrorUserInfoKey v69 = NSLocalizedDescriptionKey;
          v46 = @"Failed to close file";
        }

        v70 = v46;
        v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v70,  &v69,  1LL));
        id v63 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v45,  v51));

        goto LABEL_22;
      }

- (int)_openNextFile:(id *)a3
{
  unint64_t currentFileIndex = self->_currentFileIndex;
  if (currentFileIndex >= -[NSArray count](self->_fileEntries, "count"))
  {
    if (!a3) {
      return -1;
    }
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    id v19 = @"No more files to write to";
    id v10 = (NSURL *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  2LL,  v10));
    goto LABEL_8;
  }

  v6 = objc_alloc(&OBJC_CLASS___NSURL);
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_fileEntries,  "objectAtIndexedSubscript:",  self->_currentFileIndex));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
  v9 = -[NSURL initFileURLWithPath:isDirectory:relativeToURL:]( v6,  "initFileURLWithPath:isDirectory:relativeToURL:",  v8,  0LL,  self->_baseURL);

  id v10 = v9;
  int v11 = open(-[NSURL fileSystemRepresentation](v10, "fileSystemRepresentation"), 1, 0LL);
  if (v11 < 0)
  {
    if (a3)
    {
      uint64_t v13 = *__error();
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      v17 = @"Failed to open file for writing";
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v13,  v14));
    }

- (void)writeFileData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  id v8 = v6;
  id v9 = [v8 bytes];
  id v10 = [v8 length];

  id v12 = 0LL;
  -[GTFileWriterSessionUncompressed _writeUncompressedFileData:length:error:]( self,  "_writeUncompressedFileData:length:error:",  v9,  v10,  &v12);
  id v11 = v12;
  v7[2](v7, v11);
}

- (BOOL)_writeUncompressedFileData:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  if (a4)
  {
    unint64_t v9 = 0LL;
    while (1)
    {
      unsigned int v10 = -[GTFileWriterSessionUncompressed _getCurrentFileDescriptor:](self, "_getCurrentFileDescriptor:", a5);
      if ((v10 & 0x80000000) != 0) {
        break;
      }
      int v11 = v10;
      unint64_t v12 = a4 - v9;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_fileEntries,  "objectAtIndexedSubscript:",  self->_currentFileIndex));
      v14 = (char *)[v13 fileSize] - self->_currentFileBytesWritten;

      uint64_t v15 = 0LL;
      do
      {
        ssize_t v16 = write(v11, &a3[v9 + v15], v12 - v15);
        if (v16 < 0) {
          goto LABEL_14;
        }
        v15 += v16;
      }

      while (v15 != v12);
      if ((v12 & 0x8000000000000000LL) != 0)
      {
LABEL_14:
        if (a5)
        {
          uint64_t v22 = *__error();
          NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
          v26 = @"Failed to write to file";
          v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
          *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v22,  v23));
        }

        break;
      }

      unint64_t currentFileIndex = self->_currentFileIndex;
      unint64_t v18 = self->_currentFileBytesWritten + v12;
      self->_currentFileBytesWritten = v18;
      id v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_fileEntries,  "objectAtIndexedSubscript:",  currentFileIndex));
      id v20 = [v19 fileSize];

      if ((id)v18 == v20)
      {
        BOOL v21 = -[GTFileWriterSessionUncompressed _closeCurrentFileDescriptor:](self, "_closeCurrentFileDescriptor:", a5);
        if (!v21) {
          return v21;
        }
        ++self->_currentFileIndex;
        self->_currentFileBytesWritten = 0LL;
      }

      v9 += v12;
      if (v9 >= a4) {
        goto LABEL_13;
      }
    }

    LOBYTE(v21) = 0;
  }

  else
  {
LABEL_13:
    LOBYTE(v21) = 1;
  }

  return v21;
}

- (int)_getCurrentFileDescriptor:(id *)a3
{
  int result = self->_fd;
  if (result < 0)
  {
    int result = -[GTFileWriterSessionUncompressed _openNextFile:](self, "_openNextFile:", a3);
    self->_fd = result;
  }

  return result;
}

- (BOOL)finish:(id *)a3
{
  baseURL = self->_baseURL;
  self->_baseURL = 0LL;

  fileEntries = self->_fileEntries;
  self->_fileEntries = 0LL;

  self->_unint64_t currentFileIndex = 0LL;
  self->_currentFileBytesWritten = 0LL;
  return -[GTFileWriterSessionUncompressed _closeCurrentFileDescriptor:](self, "_closeCurrentFileDescriptor:", a3);
}

- (BOOL)_closeCurrentFileDescriptor:(id *)a3
{
  int fd = self->_fd;
  if (fd < 0) {
    return 1;
  }
  self->_int fd = -1;
  if (fsync(fd) < 0)
  {
    if (a3)
    {
      NSErrorDomain v6 = NSPOSIXErrorDomain;
      uint64_t v7 = *__error();
      NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
      v14 = @"Failed to flush file";
      id v8 = &v14;
      unint64_t v9 = &v13;
LABEL_9:
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v9,  1LL));
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v6,  v7,  v10));
    }
  }

  else
  {
    if ((close(fd) & 0x80000000) == 0) {
      return 1;
    }
    if (a3)
    {
      NSErrorDomain v6 = NSPOSIXErrorDomain;
      uint64_t v7 = *__error();
      NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
      unint64_t v12 = @"Failed to close file";
      id v8 = &v12;
      unint64_t v9 = &v11;
      goto LABEL_9;
    }
  }

  return 0;
}

- (void).cxx_destruct
{
}

@end