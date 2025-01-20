@interface SDAirDropFileZipper
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)addFile:(__CFURL *)a3 withBase:(__CFURL *)a4 toBom:(_BOMBom *)a5;
- (BOOL)addFileURLToBom:(_BOMBom *)a3 file:(__CFURL *)a4 base:(__CFURL *)a5 propertyKeys:(id)a6 topLevel:(BOOL)a7;
- (BOOL)createPlaceholderFiles;
- (BOOL)disableAdaptiveCompressionForZipping;
- (BOOL)initBomWithFiles;
- (BOOL)isCompressor;
- (BOOL)isDecompressor;
- (BOOL)pathExistsInPlaceholderInfo:(id)a3;
- (BOOL)shouldExtractMediaFromPhotosBundles;
- (BOOL)validFileName:(id)a3;
- (NSArray)sourceFiles;
- (NSSet)skipReadableCheckFiles;
- (NSString)senderName;
- (NSString)unzipCompressionType;
- (NSString)zipCompressionType;
- (NSURL)destination;
- (SDAirDropFileZipper)init;
- (SDAirDropFileZipper)initWithQueue:(id)a3 boundStreamSize:(int64_t)a4;
- (SDAirDropFileZipperDelegate)delegate;
- (__CFArray)copyReverseParentChain:(__CFURL *)a3 base:(__CFURL *)a4;
- (__CFReadStream)copyReadStream;
- (id)URLFromFileInfo:(id)a3;
- (id)absoluteURLIfTopLevelFile:(const char *)a3 isDirectory:(BOOL)a4 base:(__CFURL *)a5;
- (id)conflictResolvedURL:(id)a3;
- (id)fixedRelativePath:(const char *)a3;
- (id)prettyNameBasedOnUUID:(id)a3;
- (id)temporaryBomPath;
- (id)timeRemaining:(int64_t)a3 timeNow:(double)a4;
- (int)bomCopierCopy:(id)a3 destination:(id)a4 options:(id)a5;
- (int)clientPid;
- (int64_t)totalBytes;
- (int64_t)totalFileSize:(__CFURL *)a3;
- (void)addParentChain:(_BOMBom *)a3 file:(__CFURL *)a4 base:(__CFURL *)a5;
- (void)allowProgressCircleToComplete;
- (void)bomCopierCopyFileFinished:(const char *)a3 type:(int)a4 size:(int64_t)a5 operation:(int)a6;
- (void)bomCopierFatalError:(const char *)a3;
- (void)bomCopierFatalFileError:(int)a3;
- (void)dealloc;
- (void)moveFile:(__CFURL *)a3 toDestination:(__CFURL *)a4;
- (void)moveFilesToDestination;
- (void)notifyClientForEvent:(int64_t)a3 withProperty:(void *)a4;
- (void)notifyProgress:(int64_t)a3 force:(BOOL)a4;
- (void)removeFileFromPlaceholderList:(id)a3;
- (void)removeUnusedPlaceholderFiles;
- (void)setAuditToken:(id *)a3;
- (void)setClientPid:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setDestination:(id)a3;
- (void)setDisableAdaptiveCompressionForZipping:(BOOL)a3;
- (void)setPlaceholderFiles:(id)a3 withCreationCompletionHandler:(id)a4;
- (void)setReadStream:(__CFReadStream *)a3;
- (void)setSenderName:(id)a3;
- (void)setShouldExtractMediaFromPhotosBundles:(BOOL)a3;
- (void)setSkipReadableCheckFiles:(id)a3;
- (void)setSourceFiles:(id)a3;
- (void)setTotalBytes:(id)a3;
- (void)setUnzipCompressionType:(id)a3;
- (void)startBomCopy:(id)a3 destination:(id)a4 options:(id)a5;
- (void)stop;
- (void)unzip;
- (void)zip;
@end

@implementation SDAirDropFileZipper

- (SDAirDropFileZipper)init
{
  return -[SDAirDropFileZipper initWithQueue:boundStreamSize:]( self,  "initWithQueue:boundStreamSize:",  &_dispatch_main_q,  0x20000LL);
}

- (SDAirDropFileZipper)initWithQueue:(id)a3 boundStreamSize:(int64_t)a4
{
  id v7 = a3;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___SDAirDropFileZipper;
  v8 = -[SDAirDropFileZipper init](&v33, "init");
  v9 = v8;
  if (v8)
  {
    bomPath = v8->_bomPath;
    v8->_bomPath = 0LL;

    v9->_usePKZip = 0;
    v9->_clientPid = 0;
    v9->_bomCopier = 0LL;
    senderName = v9->_senderName;
    v9->_senderName = 0LL;

    tempFolder = v9->_tempFolder;
    v9->_tempFolder = 0LL;

    destination = v9->_destination;
    v9->_destination = 0LL;

    v9->_bomArchive = 0LL;
    v9->_readStream = 0LL;
    v9->_writeStream = 0LL;
    sourceFiles = v9->_sourceFiles;
    v9->_sourceFiles = 0LL;

    progressTimer = v9->_progressTimer;
    v9->_progressTimer = 0LL;

    zipCompressionType = v9->_zipCompressionType;
    v9->_zipCompressionType = 0LL;

    unzipCompressionType = v9->_unzipCompressionType;
    v9->_unzipCompressionType = 0LL;

    placeholderFiles = v9->_placeholderFiles;
    v9->_placeholderFiles = 0LL;

    orderedRelativePaths = v9->_orderedRelativePaths;
    v9->_orderedRelativePaths = 0LL;

    compressionEngine = v9->_compressionEngine;
    v9->_compressionEngine = 0LL;

    skipReadableCheckFiles = v9->_skipReadableCheckFiles;
    v9->_skipReadableCheckFiles = 0LL;

    v9->_fileCount = 0LL;
    v9->_totalBytes = 0LL;
    v9->_lastBytesCopied = 0LL;
    v9->_totalBytesCopied = 0LL;
    v9->_timeStarted = 0.0;
    v9->_lastProgress = 0.0;
    v22 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    topLevelFiles = v9->_topLevelFiles;
    v9->_topLevelFiles = v22;

    v24 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    alternateNames = v9->_alternateNames;
    v9->_alternateNames = v24;

    v26 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    relativePathToFile = v9->_relativePathToFile;
    v9->_relativePathToFile = v26;

    uint64_t v28 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    monitor = v9->_monitor;
    v9->_monitor = (SDStatusMonitor *)v28;

    objc_storeStrong((id *)&v9->_queue, a3);
    dispatch_queue_t v30 = dispatch_queue_create("com.apple.airdrop.zip", &_dispatch_queue_attr_concurrent);
    zipQueue = v9->_zipQueue;
    v9->_zipQueue = (OS_dispatch_queue *)v30;

    v9->_boundStreamSize = a4;
  }

  return v9;
}

- (void)dealloc
{
  readStream = self->_readStream;
  if (readStream) {
    CFRelease(readStream);
  }
  bomArchive = self->_bomArchive;
  if (bomArchive) {
    BOMBomFree(bomArchive, a2);
  }
  writeStream = self->_writeStream;
  if (writeStream) {
    CFRelease(writeStream);
  }
  bomPath = self->_bomPath;
  if (bomPath) {
    remove(-[NSString UTF8String](bomPath, "UTF8String"));
  }
  tempFolder = self->_tempFolder;
  if (tempFolder) {
    sub_100115580(tempFolder);
  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAirDropFileZipper;
  -[SDAirDropFileZipper dealloc](&v8, "dealloc");
}

- (void)notifyClientForEvent:(int64_t)a3 withProperty:(void *)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D4FA0;
  block[3] = &unk_1005CDD10;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (BOOL)isCompressor
{
  return self->_bomPath != 0LL;
}

- (BOOL)isDecompressor
{
  return !-[SDAirDropFileZipper isCompressor](self, "isCompressor");
}

- (int64_t)totalBytes
{
  return self->_totalBytes;
}

- (void)setTotalBytes:(id)a3
{
  self->_totalBytes = (int64_t)[a3 longLongValue];
}

- (void)setPlaceholderFiles:(id)a3 withCreationCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (NSMutableArray *)[a3 mutableCopy];
  placeholderFiles = self->_placeholderFiles;
  self->_placeholderFiles = v7;

  v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  orderedRelativePaths = self->_orderedRelativePaths;
  self->_orderedRelativePaths = v9;

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v11 = self->_placeholderFiles;
  id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    uint64_t v15 = kSFOperationFileBomPathKey;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v20 + 1) + 8 * (void)v16),  "objectForKeyedSubscript:",  v15,  (void)v20));
        if (v17) {
          -[NSMutableArray addObject:](self->_orderedRelativePaths, "addObject:", v17);
        }

        v16 = (char *)v16 + 1;
      }

      while (v13 != v16);
      id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
    }

    while (v13);
  }

  id v18 = [v6 copy];
  id creationCompletionHandler = self->_creationCompletionHandler;
  self->_id creationCompletionHandler = v18;
}

- (void)setDestination:(id)a3
{
  id v4 = a3;
  uint64_t v5 = airdrop_log(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
    int v11 = 138412290;
    id v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "AirDrop destination set to %@",  (uint8_t *)&v11,  0xCu);
  }

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v4 filePathURL]);
  v9 = (NSURL *)objc_claimAutoreleasedReturnValue([v8 URLByResolvingSymlinksInPath]);
  destination = self->_destination;
  self->_destination = v9;
}

- (NSURL)destination
{
  return self->_destination;
}

- (void)setReadStream:(__CFReadStream *)a3
{
  readStream = self->_readStream;
  if (readStream != a3)
  {
    if (readStream) {
      CFRelease(readStream);
    }
    self->_readStream = (__CFReadStream *)CFRetain(a3);
  }

- (__CFReadStream)copyReadStream
{
  result = self->_readStream;
  if (result) {
    return (__CFReadStream *)CFRetain(result);
  }
  return result;
}

- (id)timeRemaining:(int64_t)a3 timeNow:(double)a4
{
  float v4 = (double)a3 / (a4 - self->_timeStarted);
  return +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  (int)(float)((float)(self->_totalBytes - a3) / v4));
}

- (void)notifyProgress:(int64_t)a3 force:(BOOL)a4
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (a4 || Current > self->_lastProgress + 0.2)
  {
    int64_t totalBytes = self->_totalBytes;
    if (self->_totalBytesCopied + a3 <= totalBytes || totalBytes == 0) {
      int64_t v10 = self->_totalBytesCopied + a3;
    }
    else {
      int64_t v10 = self->_totalBytes;
    }
    if (v10 > self->_lastBytesCopied || -[SDStatusMonitor enableBugs](self->_monitor, "enableBugs"))
    {
      self->_lastProgress = Current;
      self->_lastBytesCopied = v10;
      id v11 = -[NSMutableArray count](self->_topLevelFiles, "count");
      v17 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropFileZipper timeRemaining:timeNow:](self, "timeRemaining:timeNow:", v10, Current));
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v11));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v13,  kSFOperationFilesCopiedKey);

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v10));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v14,  kSFOperationBytesCopiedKey);

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v12,  kSFOperationTimeRemainingKey);
      -[SDAirDropFileZipper notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 7LL, v17);
    }
  }

  else
  {
    progressTimer = self->_progressTimer;
    dispatch_time_t v16 = dispatch_time(0LL, 200000000LL);
    sub_100114638((dispatch_source_s *)progressTimer, v16);
  }

- (id)absoluteURLIfTopLevelFile:(const char *)a3 isDirectory:(BOOL)a4 base:(__CFURL *)a5
{
  size_t v8 = strlen(a3);
  v9 = CFURLCreateFromFileSystemRepresentation(0LL, (const UInt8 *)a3, v8, a4);
  if (v9)
  {
    int64_t v10 = v9;
    PathComponent = CFURLCreateCopyDeletingLastPathComponent(0LL, v9);
    if (PathComponent)
    {
      id v12 = PathComponent;
      CFStringRef v13 = CFURLCopyFileSystemPath(PathComponent, kCFURLPOSIXPathStyle);
      if (v13)
      {
        CFStringRef v14 = v13;
        if (CFEqual(v13, @"."))
        {
          size_t v15 = strlen(a3);
          CFURLRef v16 = CFURLCreateFromFileSystemRepresentationRelativeToBase(0LL, (const UInt8 *)a3, v15, a4, a5);
        }

        else
        {
          CFURLRef v16 = 0LL;
        }

        CFRelease(v14);
      }

      else
      {
        CFURLRef v16 = 0LL;
      }

      CFRelease(v12);
    }

    else
    {
      CFURLRef v16 = 0LL;
    }

    CFRelease(v10);
  }

  else
  {
    CFURLRef v16 = 0LL;
  }

  return v16;
}

- (BOOL)validFileName:(id)a3
{
  id v4 = a3;
  if (-[SDStatusMonitor enableBugs](self->_monitor, "enableBugs"))
  {
    BOOL v5 = 1;
  }

  else
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    obj = self->_placeholderFiles;
    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v20;
      uint64_t v9 = kSFOperationFileNameKey;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_alternateNames,  "objectForKeyedSubscript:",  v4));
          CFStringRef v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v9]);
          CFStringRef v14 = v13;
          if (v12 && [v13 isEqual:v12])
          {

LABEL_16:
            BOOL v5 = 1;
            goto LABEL_17;
          }

          size_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
          unsigned __int8 v16 = [v14 isEqual:v15];

          if ((v16 & 1) != 0) {
            goto LABEL_16;
          }
        }

        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
        BOOL v5 = 0;
        if (v7) {
          continue;
        }
        break;
      }
    }

    else
    {
      BOOL v5 = 0;
    }

- (void)removeFileFromPlaceholderList:(id)a3
{
  id v15 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_alternateNames, "objectForKeyedSubscript:"));
  BOOL v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_claimAutoreleasedReturnValue([v15 lastPathComponent]);
  }
  id v7 = v6;

  id v8 = -[NSMutableArray count](self->_placeholderFiles, "count");
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = 0LL;
    uint64_t v11 = kSFOperationFileNameKey;
    while (1)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_placeholderFiles,  "objectAtIndexedSubscript:",  v10));
      CFStringRef v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v11]);
      unsigned __int8 v14 = [v7 isEqual:v13];

      if ((v14 & 1) != 0) {
        break;
      }
      if (v9 == (id)++v10) {
        goto LABEL_10;
      }
    }

    -[NSMutableArray removeObjectAtIndex:](self->_placeholderFiles, "removeObjectAtIndex:", v10);
  }

- (id)fixedRelativePath:(const char *)a3
{
  id v4 = CFStringCreateWithCString(0LL, a3, 0x8000100u);
  BOOL v5 = (__CFString *)v4;
  if (v4 && !CFStringHasPrefix(v4, @"./") && !-[SDStatusMonitor enableBugs](self->_monitor, "enableBugs"))
  {
    CFStringRef v6 = CFStringCreateWithFormat(0LL, 0LL, @"%@%@", @"./", v5);
    CFRelease(v5);
    BOOL v5 = (__CFString *)v6;
  }

  return v5;
}

- (BOOL)pathExistsInPlaceholderInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    BOOL v5 = self->_placeholderFiles;
    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      uint64_t v9 = kSFOperationFileBomPathKey;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v15 + 1) + 8 * (void)i),  "objectForKeyedSubscript:",  v9,  (void)v15));
          id v12 = v11;
          if (v11 && ([v11 isEqual:v4] & 1) != 0)
          {

            BOOL v13 = 1;
            goto LABEL_14;
          }
        }

        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
        if (v7) {
          continue;
        }
        break;
      }
    }

    BOOL v13 = 0;
LABEL_14:
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)bomCopierCopyFileFinished:(const char *)a3 type:(int)a4 size:(int64_t)a5 operation:(int)a6
{
  if (!a6)
  {
    self->_totalBytesCopied += a5;
    if (-[SDAirDropFileZipper isCompressor](self, "isCompressor"))
    {
      id v9 = (id)objc_claimAutoreleasedReturnValue( -[SDAirDropFileZipper absoluteURLIfTopLevelFile:isDirectory:base:]( self,  "absoluteURLIfTopLevelFile:isDirectory:base:",  a3,  a4 == 2,  self->_destination));
      if (v9)
      {
        if ((-[NSMutableArray containsObject:](self->_topLevelFiles, "containsObject:", v9) & 1) == 0)
        {
          -[NSMutableArray addObject:](self->_topLevelFiles, "addObject:", v9);
          -[SDAirDropFileZipper notifyProgress:force:](self, "notifyProgress:force:", 0LL, 1LL);
        }
      }

      -[SDAirDropCompressor fileComplete](self->_compressionEngine, "fileComplete");
    }

    else
    {
      id v9 = objc_claimAutoreleasedReturnValue(-[SDAirDropFileZipper fixedRelativePath:](self, "fixedRelativePath:", a3));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  [v9 UTF8String],  a4 == 2,  self->_tempFolder));
      if (v10)
      {
        -[SDAirDropFileZipper quarantineFile:](self, "quarantineFile:", v10);
        if (-[SDAirDropFileZipper pathExistsInPlaceholderInfo:](self, "pathExistsInPlaceholderInfo:", v9))
        {
          if (-[SDAirDropFileZipper validFileName:](self, "validFileName:", v9))
          {
            if ((-[NSMutableArray containsObject:](self->_topLevelFiles, "containsObject:", v10) & 1) == 0)
            {
              -[NSMutableArray addObject:](self->_topLevelFiles, "addObject:", v10);
              relativePathToFile = self->_relativePathToFile;
              id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 relativePath]);
              -[NSMutableDictionary setObject:forKeyedSubscript:]( relativePathToFile,  "setObject:forKeyedSubscript:",  v10,  v12);

              -[SDAirDropFileZipper notifyProgress:force:](self, "notifyProgress:force:", 0LL, 1LL);
            }

            -[SDAirDropFileZipper removeFileFromPlaceholderList:](self, "removeFileFromPlaceholderList:", v9);
          }
        }
      }
    }

    -[SDAirDropFileZipper notifyProgress:force:](self, "notifyProgress:force:", 0LL, 0LL);
  }

- (void)bomCopierFatalFileError:(int)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  a3,  0LL));
  -[SDAirDropFileZipper notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10LL, v4);
}

- (void)bomCopierFatalError:(const char *)a3
{
  NSErrorUserInfoKey v7 = NSLocalizedDescriptionKey;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a3));
  uint64_t v8 = v4;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  5LL,  v5));
  -[SDAirDropFileZipper notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10LL, v6);
}

- (int64_t)totalFileSize:(__CFURL *)a3
{
  int64_t v3 = -1LL;
  CFNumberRef number = 0LL;
  int64_t valuePtr = -1LL;
  if (CFURLCopyResourcePropertyForKey(a3, kCFURLTotalFileSizeKey, &number, 0LL)) {
    BOOL v4 = number == 0LL;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    if (!CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr)) {
      int64_t valuePtr = -1LL;
    }
    CFRelease(number);
    return valuePtr;
  }

  return v3;
}

- (__CFArray)copyReverseParentChain:(__CFURL *)a3 base:(__CFURL *)a4
{
  Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  CFURLRef PathComponent = CFURLCreateCopyDeletingLastPathComponent(0LL, a3);
  if (CFEqual(a4, PathComponent))
  {
    CFURLRef v8 = PathComponent;
  }

  else
  {
    do
    {
      CFArrayAppendValue(Mutable, PathComponent);
      CFURLRef v8 = CFURLCreateCopyDeletingLastPathComponent(0LL, PathComponent);
      CFRelease(PathComponent);
      CFURLRef PathComponent = v8;
    }

    while (!CFEqual(a4, v8));
  }

  CFRelease(v8);
  return Mutable;
}

- (BOOL)addFile:(__CFURL *)a3 withBase:(__CFURL *)a4 toBom:(_BOMBom *)a5
{
  CFURLRef v8 = sub_100114F24(a3);
  if (!v8) {
    return 0;
  }
  id v9 = v8;
  uint64_t v10 = BOMFSObjectNewFromPath(v8, B_PATHONLY);
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = sub_1001149DC(a3, a4);
    if (v12)
    {
      BOOL v13 = v12;
      BOMFSObjectSetPathName(v11, v12, 1LL);
      uint64_t inserted = BOMBomInsertFSObject(a5, v11, 1LL);
      BOOL v15 = (_DWORD)inserted == 0;
      if ((_DWORD)inserted)
      {
        uint64_t v16 = airdrop_log(inserted);
        __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_1000D870C();
        }
      }

      free(v13);
    }

    else
    {
      BOOL v15 = 0;
    }

    BOMFSObjectFree(v11);
  }

  else
  {
    uint64_t v18 = airdrop_log(0LL);
    __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000D86AC();
    }

    BOOL v15 = 0;
  }

  free(v9);
  return v15;
}

- (void)addParentChain:(_BOMBom *)a3 file:(__CFURL *)a4 base:(__CFURL *)a5
{
  CFURLRef v8 = -[SDAirDropFileZipper copyReverseParentChain:base:](self, "copyReverseParentChain:base:", a4, a5);
  CFIndex Count = CFArrayGetCount(v8);
  if (Count >= 1)
  {
    unint64_t v10 = Count + 1;
    do
    {
      -[SDAirDropFileZipper addFile:withBase:toBom:]( self,  "addFile:withBase:toBom:",  CFArrayGetValueAtIndex(v8, v10 - 2),  a5,  a3);
      --v10;
    }

    while (v10 > 1);
  }

  CFRelease(v8);
}

- (BOOL)addFileURLToBom:(_BOMBom *)a3 file:(__CFURL *)a4 base:(__CFURL *)a5 propertyKeys:(id)a6 topLevel:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = (const __CFArray *)a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained) {
    goto LABEL_17;
  }
  unsigned __int8 v14 = WeakRetained;
  if (-[NSSet containsObject:](self->_skipReadableCheckFiles, "containsObject:", a4))
  {

    goto LABEL_5;
  }

  __int128 v15 = *(_OWORD *)&self->_auditToken.val[4];
  v23[0] = *(_OWORD *)self->_auditToken.val;
  v23[1] = v15;
  char v16 = sub_100114F90(a4, v23);

  if ((v16 & 1) == 0)
  {
LABEL_17:
    LOBYTE(v17) = 0;
    goto LABEL_24;
  }

- (id)URLFromFileInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (!v4) {
    goto LABEL_12;
  }
  id v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kSFOperationFileNameKey]);

  BOOL v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kSFOperationFileTypeKey]);
  CFURLRef v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kSFOperationFileIsDirectoryKey]);

  if (self->_shouldExtractMediaFromPhotosBundles)
  {
    Boolean v9 = 0;
  }

  else
  {
    if (v8) {
      int Value = CFBooleanGetValue((CFBooleanRef)v8);
    }
    else {
      int Value = v7 ? UTTypeConformsTo(v7, kUTTypeDirectory) : 0;
    }
    Boolean v9 = Value != 0;
  }

  uint64_t v11 = CFURLCreateWithFileSystemPathRelativeToBase(0LL, v6, kCFURLPOSIXPathStyle, v9, (CFURLRef)self->_destination);
  if (v11)
  {
    id v12 = v11;
    CFURLRef v13 = CFURLCopyAbsoluteURL(v11);
    CFRelease(v12);
  }

  else
  {
LABEL_12:
    CFURLRef v13 = 0LL;
  }

  return v13;
}

- (id)prettyNameBasedOnUUID:(id)a3
{
  v5[0] = 0LL;
  v5[1] = 0LL;
  [a3 getUUIDBytes:v5];
  unsigned int v3 = bswap32(LOWORD(v5[0]));
  return objc_autoreleaseReturnValue((id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IMG_%04u",  (unsigned __int16)(HIWORD(v3)
                                                              - 10000
                                                              * ((unsigned __int16)((839 * (v3 >> 20)) >> 16) >> 3)))));
}

- (BOOL)createPlaceholderFiles
{
  v2 = self;
  placeholderFiles = self->_placeholderFiles;
  if (placeholderFiles)
  {
    id v49 = -[NSMutableArray count](placeholderFiles, "count");
    if (v49)
    {
      uint64_t v4 = 0LL;
      uint64_t v53 = kSFOperationFileNameKey;
      uint64_t v51 = kSFOperationFileBomPathKey;
      while (1)
      {
        BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( v2->_placeholderFiles,  "objectAtIndexedSubscript:",  v4));
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v53]);
        BOOL v7 = v6;
        if (!v6) {
          break;
        }
        CFURLRef v8 = (void *)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
        if (![v7 isEqual:v8]
          || ([v7 isEqual:@"."] & 1) != 0)
        {

LABEL_37:
          uint64_t v39 = airdrop_log([v7 UTF8String]);
          v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
            sub_1000D8828();
          }
          goto LABEL_41;
        }

        unsigned __int8 v9 = [v7 isEqual:@".."];

        if ((v9 & 1) != 0) {
          goto LABEL_37;
        }
        v50 = v7;
        unint64_t v10 = (const __CFURL *)objc_claimAutoreleasedReturnValue(-[SDAirDropFileZipper URLFromFileInfo:](v2, "URLFromFileInfo:", v5));
        while (v10)
        {
          id v58 = 0LL;
          BOOL v11 = sub_1001157C4(v10, &v58);
          id v12 = v58;
          CFURLRef v13 = v12;
          if (v11) {
            goto LABEL_29;
          }
          unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 domain]);
          if (![v14 isEqual:NSPOSIXErrorDomain])
          {

LABEL_24:
            uint64_t v34 = airdrop_log(v16);
            v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v60 = v13;
              _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "SDAirDropFileZipper: createPlaceholder %@",  buf,  0xCu);
            }

- (void)removeUnusedPlaceholderFiles
{
  placeholderFiles = self->_placeholderFiles;
  if (placeholderFiles)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v4 = placeholderFiles;
    id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        CFURLRef v8 = 0LL;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          unsigned __int8 v9 = (const __CFURL *)objc_claimAutoreleasedReturnValue( -[SDAirDropFileZipper URLFromFileInfo:]( self,  "URLFromFileInfo:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v8),  (void)v13));
          unint64_t v10 = v9;
          if (v9)
          {
            CFStringRef v11 = CFURLCopyFileSystemPath(v9, kCFURLPOSIXPathStyle);
            if (v11)
            {
              id v12 = v11;
              bzero(buffer, 0x400uLL);
              if (CFStringGetCString(v12, buffer, 1024LL, 0x8000100u)) {
                remove(buffer);
              }
              CFRelease(v12);
            }
          }

          CFURLRef v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
      }

      while (v6);
    }
  }

- (id)conflictResolvedURL:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 relativePath]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_alternateNames, "objectForKeyedSubscript:", v6));
    CFURLRef v8 = (void *)v7;
    if (v7) {
      unsigned __int8 v9 = (void *)v7;
    }
    else {
      unsigned __int8 v9 = v5;
    }
    id v10 = v9;

    CFStringRef v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_destination, "URLByAppendingPathComponent:", v10));
  }

  else
  {
    CFStringRef v11 = 0LL;
  }

  return v11;
}

- (void)moveFile:(__CFURL *)a3 toDestination:(__CFURL *)a4
{
  id v24 = 0LL;
  BOOL v6 = sub_100116298(a3, a4, &v24);
  id v7 = v24;
  CFURLRef v8 = v7;
  if (!v6)
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
    if ([v9 isEqual:NSPOSIXErrorDomain])
    {
      id v10 = [v8 code];

      if (v10 == (id)20)
      {
        id v23 = 0LL;
        BOOL v12 = sub_1001155D4(a4, &v23);
        id v13 = v23;
        __int128 v14 = v13;
        if (v12)
        {
          id v22 = v13;
          BOOL v15 = sub_100116298(a3, a4, &v22);
          id v16 = v22;

          if (v15)
          {
LABEL_15:

            goto LABEL_16;
          }

          uint64_t v18 = airdrop_log(v17);
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            sub_1000D88F0();
          }
        }

        else
        {
          uint64_t v21 = airdrop_log(v13);
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            sub_1000D8950();
          }
          id v16 = v14;
        }

        goto LABEL_15;
      }
    }

    else
    {
    }

    uint64_t v20 = airdrop_log(v11);
    id v16 = (id)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
      sub_1000D89B0();
    }
    goto LABEL_15;
  }

- (void)moveFilesToDestination
{
  unsigned int v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v4 = self->_orderedRelativePaths;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      CFURLRef v8 = 0LL;
      do
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_relativePathToFile,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v23 + 1) + 8LL * (void)v8)));
        if (v9) {
          -[NSMutableArray addObject:](v3, "addObject:", v9);
        }

        CFURLRef v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
    }

    while (v6);
  }

  id v10 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v11 = v3;
  id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v19,  v27,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      BOOL v15 = 0LL;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(id *)(*((void *)&v19 + 1) + 8LL * (void)v15);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropFileZipper conflictResolvedURL:](self, "conflictResolvedURL:", v16, (void)v19));
        if (v17)
        {
          -[SDAirDropFileZipper moveFile:toDestination:](self, "moveFile:toDestination:", v16, v17);
          -[NSMutableArray addObject:](v10, "addObject:", v17);
        }

        BOOL v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v19,  v27,  16LL);
    }

    while (v13);
  }

  topLevelFiles = self->_topLevelFiles;
  self->_topLevelFiles = v10;
}

- (int)bomCopierCopy:(id)a3 destination:(id)a4 options:(id)a5
{
  CFURLRef v8 = (const __CFURL *)a4;
  id v9 = a5;
  id v10 = (const __CFURL *)a3;
  self->_bomCopier = (_BOMCopier *)BOMCopierNew();
  BOMCopierSetUserData();
  BOMCopierSetFileErrorHandler(self->_bomCopier, sub_1000D6F94);
  BOMCopierSetFatalErrorHandler(self->_bomCopier, sub_1000D6FF0);
  BOMCopierSetCopyFileUpdateHandler(self->_bomCopier, sub_1000D7060);
  BOMCopierSetFatalFileErrorHandler(self->_bomCopier, sub_1000D70A0);
  BOMCopierSetCopyFileFinishedHandler(self->_bomCopier, sub_1000D7118);
  BOMCopierSetFileConflictErrorHandler(self->_bomCopier, sub_1000D7174);
  uint64_t v11 = sub_100114F24(v10);

  id v12 = sub_100114F24(v8);
  if (self->_compressionEngine)
  {
    id v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    zipQueue = (dispatch_queue_s *)self->_zipQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000D71C0;
    block[3] = &unk_1005CBC20;
    __int128 v19 = v8;
    __int128 v20 = self;
    __int128 v21 = v13;
    BOOL v15 = v13;
    dispatch_async(zipQueue, block);
    int v16 = BOMCopierCopyWithOptions(self->_bomCopier, v11, v12, v9);
    dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

    if (!v11) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  int v16 = BOMCopierCopyWithOptions(self->_bomCopier, v11, v12, v9);
  if (v11) {
LABEL_3:
  }
    free(v11);
LABEL_4:
  if (v12) {
    free(v12);
  }

  return v16;
}

- (void)allowProgressCircleToComplete
{
  CFAbsoluteTime v2 = CFAbsoluteTimeGetCurrent() - self->_timeStarted;
  double v3 = (0.95 - v2) * 1000000.0;
  BOOL v4 = v2 < 0.45;
  double v5 = 500000.0;
  if (v4) {
    double v5 = v3;
  }
  usleep(v5);
}

- (void)startBomCopy:(id)a3 destination:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = (const __CFURL *)a4;
  id v10 = a5;
  BOOL v11 = -[SDAirDropFileZipper isDecompressor](self, "isDecompressor");
  if (v11
    && (__int128 v12 = *(_OWORD *)&self->_auditToken.val[4],
        *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val,
        *(_OWORD *)&buf[16] = v12,
        BOOL v11 = sub_10011502C(v9))
    || self->_fileCount)
  {
    id v13 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->_totalBytes));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v14,  kSFOperationTotalBytesKey);

    -[SDAirDropFileZipper notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 5LL, v13);
    double Current = CFAbsoluteTimeGetCurrent();
    self->_timeStarted = Current;
    self->_lastProgress = Current + -0.2;
    zipQueue = (dispatch_queue_s *)self->_zipQueue;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472LL;
    v52[2] = sub_1000D7670;
    v52[3] = &unk_1005CB2F8;
    v52[4] = self;
    uint64_t v17 = sub_100114598(0, zipQueue, v52);
    uint64_t v18 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue(v17);
    progressTimer = self->_progressTimer;
    self->_progressTimer = v18;

    dispatch_resume((dispatch_object_t)self->_progressTimer);
    if (-[SDAirDropFileZipper isDecompressor](self, "isDecompressor")
      && !(BOOL v20 = -[SDAirDropFileZipper createPlaceholderFiles](self, "createPlaceholderFiles")))
    {
      uint64_t v30 = airdrop_log(v20);
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_1000D8C90();
      }
    }

    else
    {
      if (-[SDAirDropFileZipper isDecompressor](self, "isDecompressor")) {
        (*((void (**)(void))self->_creationCompletionHandler + 2))();
      }
      uint64_t v21 = -[SDAirDropFileZipper bomCopierCopy:destination:options:]( self,  "bomCopierCopy:destination:options:",  v8,  v9,  v10);
      if ((_DWORD)v21) {
        goto LABEL_18;
      }
      if (-[SDAirDropFileZipper isDecompressor](self, "isDecompressor"))
      {
        -[SDAirDropFileZipper moveFilesToDestination](self, "moveFilesToDestination");
        -[SDAirDropFileZipper removeUnusedPlaceholderFiles](self, "removeUnusedPlaceholderFiles");
      }
    }

    uint64_t v21 = 0LL;
LABEL_18:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      id v33 = -[NSMutableArray count](self->_topLevelFiles, "count");
      if (v33)
      {
        self->_totalBytesCopied = self->_totalBytes;
        uint64_t v34 = airdrop_log(v33);
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          id v36 = -[NSMutableArray count](self->_topLevelFiles, "count");
          topLevelFiles = self->_topLevelFiles;
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = v36;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = topLevelFiles;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "SDAirDropFileZipper: %lu files saved: %@",  buf,  0x16u);
        }

        -[SDAirDropFileZipper notifyProgress:force:](self, "notifyProgress:force:", 0LL, 1LL);
        -[SDAirDropFileZipper allowProgressCircleToComplete](self, "allowProgressCircleToComplete");
        -[SDAirDropFileZipper notifyClientForEvent:withProperty:]( self,  "notifyClientForEvent:withProperty:",  9LL,  self->_topLevelFiles);
      }

      else
      {
        uint64_t v38 = airdrop_log(0LL);
        uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
        if ((_DWORD)v21)
        {
          if (v40) {
            sub_1000D8C2C(v21, v39, v41, v42, v43, v44, v45, v46);
          }

          NSErrorDomain v47 = NSPOSIXErrorDomain;
          uint64_t v48 = (int)v21;
        }

        else
        {
          if (v40) {
            sub_1000D8C00();
          }

          NSErrorDomain v47 = NSPOSIXErrorDomain;
          uint64_t v48 = 2LL;
        }

        id v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v47,  v48,  0LL));
        -[SDAirDropFileZipper notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10LL, v49);
      }
    }

    dispatch_source_cancel((dispatch_source_t)self->_progressTimer);
    queue = (dispatch_queue_s *)self->_queue;
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472LL;
    v51[2] = sub_1000D7680;
    v51[3] = &unk_1005CB2F8;
    v51[4] = self;
    dispatch_async(queue, v51);
    goto LABEL_32;
  }

  uint64_t v22 = airdrop_log(v11);
  __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_1000D8CBC((uint64_t)self, v23, v24, v25, v26, v27, v28, v29);
  }

  id v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  2LL,  0LL));
  -[SDAirDropFileZipper notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10LL, v13);
LABEL_32:
}

- (BOOL)initBomWithFiles
{
  bomPath = self->_bomPath;
  if (bomPath)
  {
    BOOL v4 = (_BOMBom *)BOMBomNew(-[NSString UTF8String](bomPath, "UTF8String"));
    self->_bomArchive = v4;
    if (v4)
    {
      uint64_t v5 = BOMFSObjectNewFromPath(".", B_PATHONLY);
      if (!v5)
      {
        uint64_t v14 = airdrop_log(0LL);
        BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_1000D8D94();
        }

        BOOL v10 = 0;
        goto LABEL_34;
      }

      uint64_t v6 = v5;
      uint64_t inserted = BOMBomInsertFSObject(self->_bomArchive, v5, 1LL);
      if ((_DWORD)inserted)
      {
        uint64_t v8 = airdrop_log(inserted);
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1000D8E54();
        }
      }

      else
      {
        CFStringRef v45 = kCFURLTotalFileSizeKey;
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v45,  1LL));
        CFTypeRef v16 = sub_10011488C((const __CFArray *)self->_sourceFiles);
        uint64_t v17 = airdrop_log(v16);
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        __int128 v19 = v18;
        if (v16)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "SDAirDropFileZipper: start adding files to BOM",  buf,  2u);
          }

          __int128 v41 = 0u;
          __int128 v42 = 0u;
          __int128 v39 = 0u;
          __int128 v40 = 0u;
          BOOL v20 = self->_sourceFiles;
          id v21 = -[NSArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v39,  v44,  16LL);
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v40;
            do
            {
              for (i = 0LL; i != v22; i = (char *)i + 1)
              {
                if (*(void *)v40 != v23) {
                  objc_enumerationMutation(v20);
                }
                -[SDAirDropFileZipper addFileURLToBom:file:base:propertyKeys:topLevel:]( self,  "addFileURLToBom:file:base:propertyKeys:topLevel:",  self->_bomArchive,  *(void *)(*((void *)&v39 + 1) + 8LL * (void)i),  v16,  v9,  1LL,  (void)v39);
              }

              id v22 = -[NSArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v39,  v44,  16LL);
            }

            while (v22);
          }

          uint64_t v26 = airdrop_log(v25);
          uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "SDAirDropFileZipper: done adding files to BOM",  buf,  2u);
          }

          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          BOOL v10 = WeakRetained != 0LL;
          if (!WeakRetained)
          {
            uint64_t v30 = airdrop_log(v29);
            v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              sub_1000D8E28();
            }
          }

          CFRelease(v16);
          goto LABEL_33;
        }

        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_1000D8DC0((uint64_t)&self->_sourceFiles, v19, v33, v34, v35, v36, v37, v38);
        }
      }

      BOOL v10 = 0;
LABEL_33:

      BOMFSObjectFree(v6);
LABEL_34:
      BOMBomCommit(self->_bomArchive);
      return v10;
    }

    uint64_t v13 = airdrop_log(0LL);
    __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000D8D68();
    }
  }

  else
  {
    uint64_t v11 = airdrop_log(0LL);
    __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000D8D3C();
    }
  }

  return 0;
}

- (id)temporaryBomPath
{
  CFURLRef v2 = sub_1001156C4(0LL, 65537);
  if (v2)
  {
    double v3 = v2;
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    uint64_t v6 = CFStringCreateWithFormat(0LL, 0LL, @"%@.bom", v5);

    if (v6)
    {
      uint64_t v7 = CFURLCreateWithFileSystemPathRelativeToBase(0LL, v6, kCFURLPOSIXPathStyle, 0, v3);
      if (v7)
      {
        uint64_t v8 = v7;
        id v9 = CFURLCopyAbsoluteURL(v7);
        if (v9)
        {
          BOOL v10 = v9;
          uint64_t v11 = (__CFString *)CFURLCopyFileSystemPath(v9, kCFURLPOSIXPathStyle);
          CFRelease(v10);
        }

        else
        {
          uint64_t v16 = airdrop_log(0LL);
          uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_1000D8ED8();
          }

          uint64_t v11 = 0LL;
        }

        CFRelease(v8);
      }

      else
      {
        uint64_t v14 = airdrop_log(0LL);
        BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_1000D8EAC();
        }

        uint64_t v11 = 0LL;
      }

      CFRelease(v6);
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    CFRelease(v3);
  }

  else
  {
    uint64_t v12 = airdrop_log(0LL);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000D8E80();
    }

    uint64_t v11 = 0LL;
  }

  return v11;
}

- (void)zip
{
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[SDAirDropFileZipper temporaryBomPath](self, "temporaryBomPath"));
  bomPath = self->_bomPath;
  self->_bomPath = v3;

  if (!self->_destination) {
    CFStreamCreateBoundPair(0LL, &self->_readStream, &self->_writeStream, self->_boundStreamSize);
  }
  zipQueue = (dispatch_queue_s *)self->_zipQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D7C1C;
  block[3] = &unk_1005CB2F8;
  void block[4] = self;
  dispatch_async(zipQueue, block);
}

- (void)unzip
{
  destination = self->_destination;
  id v13 = 0LL;
  id v4 = sub_100115134(destination, &v13);
  uint64_t v5 = (NSURL *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v13;
  tempFolder = self->_tempFolder;
  self->_tempFolder = v5;

  if (self->_tempFolder)
  {
    zipQueue = (dispatch_queue_s *)self->_zipQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000D8188;
    v12[3] = &unk_1005CB2F8;
    v12[4] = self;
    dispatch_async(zipQueue, v12);
  }

  else
  {
    uint64_t v10 = airdrop_log(v8);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000D8F5C();
    }

    -[SDAirDropFileZipper notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10LL, v6);
  }
}

- (void)stop
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D84A0;
  block[3] = &unk_1005CB2F8;
  void block[4] = self;
  dispatch_async(queue, block);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  return result;
}

- (void)setAuditToken:(id *)a3
{
}

- (int)clientPid
{
  return self->_clientPid;
}

- (void)setClientPid:(int)a3
{
  self->_clientPid = a3;
}

- (NSArray)sourceFiles
{
  return (NSArray *)objc_getProperty(self, a2, 224LL, 1);
}

- (void)setSourceFiles:(id)a3
{
}

- (NSString)senderName
{
  return (NSString *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setSenderName:(id)a3
{
}

- (NSString)unzipCompressionType
{
  return (NSString *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setUnzipCompressionType:(id)a3
{
}

- (NSString)zipCompressionType
{
  return (NSString *)objc_getProperty(self, a2, 248LL, 1);
}

- (NSSet)skipReadableCheckFiles
{
  return (NSSet *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setSkipReadableCheckFiles:(id)a3
{
}

- (BOOL)disableAdaptiveCompressionForZipping
{
  return self->_disableAdaptiveCompressionForZipping;
}

- (void)setDisableAdaptiveCompressionForZipping:(BOOL)a3
{
  self->_disableAdaptiveCompressionForZipping = a3;
}

- (BOOL)shouldExtractMediaFromPhotosBundles
{
  return self->_shouldExtractMediaFromPhotosBundles;
}

- (void)setShouldExtractMediaFromPhotosBundles:(BOOL)a3
{
  self->_shouldExtractMediaFromPhotosBundles = a3;
}

- (SDAirDropFileZipperDelegate)delegate
{
  return (SDAirDropFileZipperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end