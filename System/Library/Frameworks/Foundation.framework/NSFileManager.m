@interface NSFileManager
+ (NSFileManager)defaultManager;
- (BOOL)_handleFaultedOutCloudDocFromSource:(id)a3 toDestination:(id)a4 handled:(BOOL *)a5 error:(id *)a6;
- (BOOL)_processCanAccessUbiquityIdentityToken;
- (BOOL)_processHasUbiquityContainerEntitlement;
- (BOOL)_processUsesCloudServices;
- (BOOL)_web_changeFileAttributes_nowarn:(id)a3 atPath:(id)a4;
- (BOOL)_web_changeFinderAttributes:(id)a3 forFileAtPath:(id)a4;
- (BOOL)_web_createDirectoryAtPathWithIntermediateDirectories:(id)a3 attributes:(id)a4;
- (BOOL)_web_createFileAtPath:(id)a3 contents:(id)a4 attributes:(id)a5;
- (BOOL)_web_createFileAtPathWithIntermediateDirectories:(id)a3 contents:(id)a4 attributes:(id)a5 directoryAttributes:(id)a6;
- (BOOL)_web_createIntermediateDirectoriesForPath_nowarn:(id)a3 attributes:(id)a4;
- (BOOL)_web_fileExistsAtPath_nowarn:(id)a3 isDirectory:(BOOL *)a4 traverseLink:(BOOL)a5;
- (BOOL)_web_removeFileOnlyAtPath:(id)a3;
- (BOOL)changeCurrentDirectoryPath:(NSString *)path;
- (BOOL)changeFileAttributes:(NSDictionary *)attributes atPath:(NSString *)path;
- (BOOL)contentsEqualAtPath:(NSString *)path1 andPath:(NSString *)path2;
- (BOOL)copyItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError *)error;
- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)copyItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL error:(NSError *)error;
- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)createDirectoryAtPath:(NSString *)path attributes:(NSDictionary *)attributes;
- (BOOL)createDirectoryAtPath:(NSString *)path withIntermediateDirectories:(BOOL)createIntermediates attributes:(NSDictionary *)attributes error:(NSError *)error;
- (BOOL)createDirectoryAtURL:(NSURL *)url withIntermediateDirectories:(BOOL)createIntermediates attributes:(NSDictionary *)attributes error:(NSError *)error;
- (BOOL)createFileAtPath:(NSString *)path contents:(NSData *)data attributes:(NSDictionary *)attr;
- (BOOL)createSymbolicLinkAtPath:(NSString *)path pathContent:(NSString *)otherpath;
- (BOOL)createSymbolicLinkAtPath:(NSString *)path withDestinationPath:(NSString *)destPath error:(NSError *)error;
- (BOOL)createSymbolicLinkAtURL:(NSURL *)url withDestinationURL:(NSURL *)destURL error:(NSError *)error;
- (BOOL)directoryCanBeCreatedAtPath:(id)a3;
- (BOOL)evictUbiquitousItemAtURL:(NSURL *)url error:(NSError *)error;
- (BOOL)fileExistsAtPath:(NSString *)path;
- (BOOL)fileExistsAtPath:(NSString *)path isDirectory:(BOOL *)isDirectory;
- (BOOL)getFileSystemRepresentation:(char *)a3 maxLength:(unint64_t)a4 withPath:(id)a5;
- (BOOL)getRelationship:(NSURLRelationship *)outRelationship ofDirectory:(NSSearchPathDirectory)directory inDomain:(NSSearchPathDomainMask)domainMask toItemAtURL:(NSURL *)url error:(NSError *)error;
- (BOOL)getRelationship:(NSURLRelationship *)outRelationship ofDirectoryAtURL:(NSURL *)directoryURL toItemAtURL:(NSURL *)otherURL error:(NSError *)error;
- (BOOL)isDeletableFileAtPath:(NSString *)path;
- (BOOL)isExecutableFileAtPath:(NSString *)path;
- (BOOL)isReadableFileAtPath:(NSString *)path;
- (BOOL)isUbiquitousItemAtURL:(NSURL *)url;
- (BOOL)isWritableFileAtPath:(NSString *)path;
- (BOOL)linkItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError *)error;
- (BOOL)linkItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL error:(NSError *)error;
- (BOOL)moveItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError *)error;
- (BOOL)moveItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL error:(NSError *)error;
- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)removeFileAtPath:(NSString *)path handler:(id)handler;
- (BOOL)removeItemAtPath:(NSString *)path error:(NSError *)error;
- (BOOL)removeItemAtURL:(NSURL *)URL error:(NSError *)error;
- (BOOL)replaceItemAtURL:(NSURL *)originalItemURL withItemAtURL:(NSURL *)newItemURL backupItemName:(NSString *)backupItemName options:(NSFileManagerItemReplacementOptions)options resultingItemURL:(NSURL *)resultingURL error:(NSError *)error;
- (BOOL)setAttributes:(NSDictionary *)attributes ofItemAtPath:(NSString *)path error:(NSError *)error;
- (BOOL)setUbiquitous:(BOOL)flag itemAtURL:(NSURL *)url destinationURL:(NSURL *)destinationURL error:(NSError *)error;
- (BOOL)startDownloadingUbiquitousItemAtURL:(NSURL *)url error:(NSError *)error;
- (NSArray)URLsForDirectory:(NSSearchPathDirectory)directory inDomains:(NSSearchPathDomainMask)domainMask;
- (NSArray)componentsToDisplayForPath:(NSString *)path;
- (NSArray)contentsOfDirectoryAtPath:(NSString *)path error:(NSError *)error;
- (NSArray)contentsOfDirectoryAtURL:(NSURL *)url includingPropertiesForKeys:(NSArray *)keys options:(NSDirectoryEnumerationOptions)mask error:(NSError *)error;
- (NSArray)directoryContentsAtPath:(NSString *)path;
- (NSArray)mountedVolumeURLsIncludingResourceValuesForKeys:(NSArray *)propertyKeys options:(NSVolumeEnumerationOptions)options;
- (NSArray)subpathsAtPath:(NSString *)path;
- (NSArray)subpathsOfDirectoryAtPath:(NSString *)path error:(NSError *)error;
- (NSData)contentsAtPath:(NSString *)path;
- (NSDictionary)attributesOfFileSystemForPath:(NSString *)path error:(NSError *)error;
- (NSDictionary)attributesOfItemAtPath:(NSString *)path error:(NSError *)error;
- (NSDictionary)fileAttributesAtPath:(NSString *)path traverseLink:(BOOL)yorn;
- (NSDictionary)fileSystemAttributesAtPath:(NSString *)path;
- (NSDirectoryEnumerator)enumeratorAtPath:(NSString *)path;
- (NSDirectoryEnumerator)enumeratorAtURL:(NSURL *)url includingPropertiesForKeys:(NSArray *)keys options:(NSDirectoryEnumerationOptions)mask errorHandler:(void *)handler;
- (NSFileManager)init;
- (NSFileManager)retain;
- (NSString)currentDirectoryPath;
- (NSString)destinationOfSymbolicLinkAtPath:(NSString *)path error:(NSError *)error;
- (NSString)displayNameAtPath:(NSString *)path;
- (NSString)pathContentOfSymbolicLinkAtPath:(NSString *)path;
- (NSString)stringWithFileSystemRepresentation:(const char *)str length:(NSUInteger)len;
- (NSURL)URLForDirectory:(NSSearchPathDirectory)directory inDomain:(NSSearchPathDomainMask)domain appropriateForURL:(NSURL *)url create:(BOOL)shouldCreate error:(NSError *)error;
- (NSURL)URLForPublishingUbiquitousItemAtURL:(NSURL *)url expirationDate:(NSDate *)outDate error:(NSError *)error;
- (NSURL)URLForUbiquityContainerIdentifier:(NSString *)containerIdentifier;
- (NSURL)containerURLForSecurityApplicationGroupIdentifier:(NSString *)groupIdentifier;
- (NSURL)temporaryDirectory;
- (const)fileSystemRepresentationWithPath:(NSString *)path;
- (id)_URLForReplacingItemAtURL:(id)a3 error:(id *)a4;
- (id)_attributesOfItemAtPath:(id)a3 filterResourceFork:(BOOL)a4 error:(id *)a5;
- (id)_attributesOfItemAtURL:(id)a3 filterResourceFork:(BOOL)a4 error:(id *)a5;
- (id)_displayPathForPath:(id)a3;
- (id)_safeDelegate;
- (id)_web_carbonPathForPath_nowarn:(id)a3;
- (id)_web_pathWithUniqueFilenameForPath:(id)a3;
- (id)_web_startupVolumeName_nowarn;
- (id)_web_visibleItemsInDirectoryAtPath:(id)a3;
- (id)delegate;
- (id)directoryContentsAtPath:(id)a3 matchingExtension:(id)a4 options:(int64_t)a5 keepExtension:(BOOL)a6;
- (id)directoryContentsAtPath:(id)a3 matchingExtension:(id)a4 options:(int64_t)a5 keepExtension:(BOOL)a6 error:(id *)a7;
- (id)ubiquityIdentityToken;
- (void)_performRemoveFileAtPath:(id)a3;
- (void)_web_backgroundRemoveFileAtPath:(id)a3;
- (void)_web_backgroundRemoveLeftoverFiles:(id)a3;
- (void)dealloc;
- (void)release;
- (void)setDelegate:(id)delegate;
@end

@implementation NSFileManager

- (NSFileManager)init
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSFileManager;
  v2 = -[NSFileManager init](&v4, sel_init);
  if (v2) {
    v2->swiftBridge = -[_NSFileManagerBridge initWithFileManager:]( objc_alloc(&OBJC_CLASS____NSFileManagerBridge),  "initWithFileManager:",  v2);
  }
  return v2;
}

- (NSArray)mountedVolumeURLsIncludingResourceValuesForKeys:(NSArray *)propertyKeys options:(NSVolumeEnumerationOptions)options
{
  return 0LL;
}

- (NSDirectoryEnumerator)enumeratorAtURL:(NSURL *)url includingPropertiesForKeys:(NSArray *)keys options:(NSDirectoryEnumerationOptions)mask errorHandler:(void *)handler
{
  if (url) {
    return (NSDirectoryEnumerator *) -[NSURLDirectoryEnumerator initWithURL:includingPropertiesForKeys:options:errorHandler:]( objc_alloc(&OBJC_CLASS___NSURLDirectoryEnumerator),  "initWithURL:includingPropertiesForKeys:options:errorHandler:",  url,  keys,  mask,  handler);
  }
  v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: URL is nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v7);
  return (NSDirectoryEnumerator *)-[NSFileManager contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:]( v8,  v9,  v10,  v11,  v12,  v13);
}

- (NSArray)contentsOfDirectoryAtURL:(NSURL *)url includingPropertiesForKeys:(NSArray *)keys options:(NSDirectoryEnumerationOptions)mask error:(NSError *)error
{
  v41[129] = *(id *)MEMORY[0x1895F89C0];
  if (!url)
  {
    v32 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: URL is nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v32);
  }

  v11 = (NSArray *)[MEMORY[0x189603FA8] arrayWithCapacity:10];
  if (!keys && !mask) {
    keys = (NSArray *)[MEMORY[0x189603F18] arrayWithObject:*MEMORY[0x1896053B8]];
  }
  NSDirectoryEnumerationOptions v12 = mask & 4;
  uint64_t v13 = MEMORY[0x186E1E358]( *MEMORY[0x189604DD0],  url,  mask & 0x80000000 | (v12 >> 1) & 0xFFFFFFFFFFFFFFBFLL | (((mask >> 4) & 1) << 6),  keys);
  if (v13)
  {
    v14 = (const void *)v13;
    v41[0] = 0LL;
    *(void *)&v40.st_dev = 0LL;
    do
    {
      while (1)
      {
        uint64_t v15 = MEMORY[0x186E1E370](v14, &v40, v41);
        if (v15 != 1) {
          break;
        }
        -[NSArray addObject:](v11, "addObject:", *(void *)&v40.st_dev);
      }
    }

    while (v15 != 2);
    id v16 = v41[0];
    if (v41[0])
    {
      if (error)
      {
        *error = (NSError *)v41[0];
        id v17 = v16;
      }

      else
      {
        CFRelease(v41[0]);
      }

      v11 = 0LL;
    }

    CFRelease(v14);
    return v11;
  }

  v34 = 0LL;
  id v18 = -[NSURL path](url, "path");
  if (!v18)
  {
    v31 = _NSErrorWithFilePath(4LL, (uint64_t)url);
    if (!v31) {
      return v11;
    }
    goto LABEL_44;
  }

  v19 = v18;
  v33 = error;
  v20 = -[NSFileManager contentsOfDirectoryAtPath:error:](self, "contentsOfDirectoryAtPath:error:", v18, &v34);
  if (-[NSFileManager getFileSystemRepresentation:maxLength:withPath:]( self,  "getFileSystemRepresentation:maxLength:withPath:",  v41,  1024LL,  v19))
  {
    int v21 = lstat((const char *)v41, &v40);
    if (v20)
    {
      if (!v21)
      {
        if ((v40.st_mode & 0xF000) == 0x4000)
        {
          __int128 v38 = 0u;
          __int128 v39 = 0u;
          __int128 v36 = 0u;
          __int128 v37 = 0u;
          uint64_t v22 = -[NSArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v36,  v35,  16LL);
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v37;
            do
            {
              for (uint64_t i = 0LL; i != v23; ++i)
              {
                if (*(void *)v37 != v24) {
                  objc_enumerationMutation(v20);
                }
                v26 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                uint64_t v27 = [v19 stringByAppendingPathComponent:v26];
                if (-[NSFileManager getFileSystemRepresentation:maxLength:withPath:]( self,  "getFileSystemRepresentation:maxLength:withPath:",  v41,  1024LL,  v27)
                  && !lstat((const char *)v41, &v40))
                {
                  int v28 = [v26 characterAtIndex:0];
                  if (!v12 || (v28 != 46 ? (BOOL v29 = (v40.st_flags & 0x8000) == 0) : (BOOL v29 = 0), v29)) {
                    -[NSArray addObject:]( v11,  "addObject:",  [MEMORY[0x189604030] fileURLWithPath:v27 isDirectory:(v40.st_mode & 0xF000) == 0x4000]);
                  }
                }
              }

              uint64_t v23 = -[NSArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v36,  v35,  16LL);
            }

            while (v23);
          }
        }

        else
        {
          v34 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(20LL, (uint64_t)url, 1, 0LL, 0LL);
        }
      }
    }
  }

  error = v33;
  v31 = v34;
  if (v34)
  {
LABEL_44:
    v11 = 0LL;
    if (error) {
      *error = v31;
    }
  }

  return v11;
}

- (NSArray)URLsForDirectory:(NSSearchPathDirectory)directory inDomains:(NSSearchPathDomainMask)domainMask
{
  return (NSArray *)-[_NSFileManagerBridge urlsFor:in:](self->swiftBridge, "urlsFor:in:", directory, domainMask);
}

- (id)_URLForReplacingItemAtURL:(id)a3 error:(id *)a4
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  uint64_t v47 = 0LL;
  v48 = &v47;
  uint64_t v49 = 0x3052000000LL;
  v50 = __Block_byref_object_copy__3;
  v51 = __Block_byref_object_dispose__3;
  uint64_t v52 = 0LL;
  if (![a3 fileSystemRepresentation]
    || !_dirhelper_relative()
    && (!objc_msgSend((id)objc_msgSend(a3, "URLByDeletingLastPathComponent"), "fileSystemRepresentation")
     || !_dirhelper_relative())
    || (v6 = (void *)[MEMORY[0x189604030] fileURLWithFileSystemRepresentation:__s isDirectory:1 relativeToURL:0],  (v7 = v6) != 0)
    && ((*(void *)__s = 0LL,
         id v46 = 0LL,
         uint64_t v8 = *MEMORY[0x189603DC0],
         int v9 = [v6 getResourceValue:__s forKey:*MEMORY[0x189603DC0] error:0],
         ([a3 getResourceValue:&v46 forKey:v8 error:0] & 1) == 0)
      ? (int v10 = objc_msgSend( (id)objc_msgSend(a3, "URLByDeletingLastPathComponent"),  "getResourceValue:forKey:error:",  &v46,  v8,  0))
      : (int v10 = 1),
        (v9 & v10) != 1 || ([*(id *)__s isEqual:v46] & 1) == 0))
  {
    v7 = 0LL;
  }

  getpid();
  int v11 = sandbox_check();
  if (!v7 && v11)
  {
    NSDirectoryEnumerationOptions v12 = (const char *)objc_msgSend((id)objc_msgSend(a3, "path"), "fileSystemRepresentation");
    uint64_t v13 = (char *)_amkrtemp();
    if (v13
      || (int v17 = _NSOpenFileDescriptor(v12, 512, 448LL), (v17 & 0x80000000) == 0)
      && (close(v17), (uint64_t v13 = (char *)_amkrtemp()) != 0LL))
    {
      if (mkdir(v13, 0x1C0u))
      {
        if (a4)
        {
          uint64_t v14 = *__error();
          uint64_t v15 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo((int)v14, (uint64_t)a3, 0, 0LL, 0LL);
          *a4 = v15;
          if (!-[NSError localizedFailureReason](v15, "localizedFailureReason")) {
            NSLog( (NSString *)@"Foundation called mkdir(%s), it didn't return 0, and errno was set to %i.",  v13,  v14);
          }
        }
      }

      else
      {
        uint64_t v34 = objc_msgSend( MEMORY[0x189604030],  "fileURLWithPath:isDirectory:",  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v13),  1);
        v48[5] = v34;
      }

      free(v13);
      goto LABEL_64;
    }

    goto LABEL_24;
  }

  if (!v7)
  {
LABEL_24:
    v7 = (void *)[a3 URLByDeletingLastPathComponent];
    BOOL v16 = [(id)_NSFoundationBundle() localizedStringForKey:@"(A Document Being Saved By %@)" value:&stru_189CA6A28 table:@"Document"] != 0;
    goto LABEL_25;
  }

  BOOL v16 = 0;
LABEL_25:
  id v46 = 0LL;
  else {
    char v18 = 0;
  }
  MainBundle = CFBundleGetMainBundle();
  ValueForInfoDictionaryKey = (NSString *)CFBundleGetValueForInfoDictionaryKey(MainBundle, @"CFBundleName");
  if (!ValueForInfoDictionaryKey) {
    ValueForInfoDictionaryKey = -[NSProcessInfo processName]( +[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"),  "processName");
  }
  int v21 = -[NSString stringByReplacingOccurrencesOfString:withString:]( ValueForInfoDictionaryKey,  "stringByReplacingOccurrencesOfString:withString:",  @"/",  @":");
  uint64_t v22 = v21;
  v40[0] = MEMORY[0x1895F87A8];
  v40[1] = 3221225472LL;
  v41 = __49__NSFileManager__URLForReplacingItemAtURL_error___block_invoke;
  v42 = &unk_189C9AC80;
  char v45 = v18;
  v43 = &v47;
  v44 = a4;
  if (!v16)
  {
    if (-[NSString length](v21, "length") >= 0x41) {
      uint64_t v22 = -[NSString substringToIndex:](v22, "substringToIndex:", 64LL);
    }
    v30 = (void *)[v7 URLByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"NSIRD_%@_", v22), 0 isDirectory];
    bzero(__s, 0x402uLL);
    [v30 getFileSystemRepresentation:__s maxLength:1018];
    if (v48[5]) {
      goto LABEL_64;
    }
    v31 = &__s[strlen(__s)];
    while (1)
    {
      strcpy(v31, "XXXXXX");
      if (!mktemp(__s)) {
        break;
      }
      uint64_t v32 = [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:__s isDirectory:1 relativeToURL:0];
      int v33 = v41((uint64_t)v40, v32);
      if (v33)
      {
        if (v33 != 17)
        {
          if (!a4) {
            goto LABEL_64;
          }
          __int128 v38 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v33, (uint64_t)a3, 0, 0LL, 0LL);
          goto LABEL_73;
        }

        if (v48[5]) {
          goto LABEL_64;
        }
      }

      else
      {
        v48[5] = v32;
        if (v32) {
          goto LABEL_64;
        }
      }
    }

    if (!a4) {
      goto LABEL_64;
    }
    __int128 v37 = __error();
    __int128 v38 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(*v37, (uint64_t)a3, 0, 0LL, 0LL);
LABEL_73:
    *a4 = v38;
    goto LABEL_64;
  }

  if (v48[5]) {
    goto LABEL_64;
  }
  int v23 = 1;
  char v24 = 1;
  while (1)
  {
    if ((v24 & 1) != 0)
    {
      if (v23 < 2) {
        v25 = -[NSString initWithFormat:]( [NSString alloc],  "initWithFormat:",  [(id)_NSFoundationBundle() localizedStringForKey:@"(A Document Being Saved By %@)" value:&stru_189CA6A28 table:@"Document"],  v22);
      }
      else {
        v25 = -[NSString initWithFormat:]( [NSString alloc],  "initWithFormat:",  [(id)_NSFoundationBundle() localizedStringForKey:@"(A Document Being Saved By %@ %ld)" value:&stru_189CA6A28 table:@"Document"],  v22,  v23);
      }
    }

    else if (v23 < 2)
    {
      v25 = -[NSString initWithString:]( [NSString alloc],  "initWithString:",  [(id)_NSFoundationBundle() localizedStringForKey:@"(A Document Being Saved)" value:&stru_189CA6A28 table:@"Document"]);
    }

    else
    {
      v25 = -[NSString initWithFormat:]( [NSString alloc],  "initWithFormat:",  [(id)_NSFoundationBundle() localizedStringForKey:@"(A Document Being Saved %ld)" value:&stru_189CA6A28 table:@"Document"],  v23);
    }

    v26 = v25;
    uint64_t v27 = (void *)[v7 URLByAppendingPathComponent:v25 isDirectory:1];

    uint64_t v28 = v41((uint64_t)v40, (uint64_t)v27);
    uint64_t v29 = v28;
    if ((int)v28 <= 62)
    {
      if ((_DWORD)v28)
      {
        if ((_DWORD)v28 != 17) {
          goto LABEL_68;
        }
        if (v23 >= 1000)
        {
          if (a4)
          {
            v53 = @"NSDebugDescription";
            v54 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Too many temporary directories for %@ in %@",  v22,  v7);
            *a4 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  512,  [MEMORY[0x189603F68] dictionaryWithObjects:&v54 forKeys:&v53 count:1]);
          }

          goto LABEL_64;
        }

        ++v23;
      }

      else
      {
        v48[5] = (uint64_t)v27;
      }

      goto LABEL_49;
    }

    if ((_DWORD)v28 != 63) {
      break;
    }
    if ((v24 & 1) == 0) {
      goto LABEL_68;
    }
    char v24 = 0;
    int v23 = 1;
LABEL_49:
    if (v48[5]) {
      goto LABEL_64;
    }
  }

  if ((_DWORD)v28 == 1000000) {
    goto LABEL_64;
  }
LABEL_68:
  if (a4)
  {
    __int128 v39 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo((int)v28, (uint64_t)a3, 0, 0LL, 0LL);
    *a4 = v39;
    if (!-[NSError localizedFailureReason](v39, "localizedFailureReason")) {
      NSLog( (NSString *)@"Foundation called mkdir(%@), it didn't return 0, and errno was set to %i.",  [v27 path],  v29);
    }
  }

uint64_t __49__NSFileManager__URLForReplacingItemAtURL_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v9 = 0LL;
  int v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  int v12 = 1000000;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __49__NSFileManager__URLForReplacingItemAtURL_error___block_invoke_2;
  v8[3] = &unk_189C9AC38;
  v8[4] = a2;
  v8[5] = &v9;
  if (qword_18C496208 != -1) {
    dispatch_once(&qword_18C496208, &__block_literal_global_221);
  }
  if (*(_BYTE *)(a1 + 48) || !_MergedGlobals_25_0)
  {
    __49__NSFileManager__URLForReplacingItemAtURL_error___block_invoke_2((uint64_t)v8);
  }

  else
  {
    objc_super v4 = objc_alloc_init(&OBJC_CLASS___NSFileCoordinator);
    -[NSFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:]( v4,  "coordinateWritingItemAtURL:options:error:byAccessor:",  a2,  0LL,  *(void *)(a1 + 40),  v8);
  }

  id v5 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  uint64_t v6 = *((unsigned int *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v6;
}

int *__49__NSFileManager__URLForReplacingItemAtURL_error___block_invoke_2(uint64_t a1)
{
  result = (int *)mkdir((const char *)[*(id *)(a1 + 32) fileSystemRepresentation], 0x1C0u);
  if ((_DWORD)result)
  {
    result = __error();
    int v3 = *result;
  }

  else
  {
    int v3 = 0;
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3;
  return result;
}

uint64_t __49__NSFileManager__URLForReplacingItemAtURL_error___block_invoke_3()
{
  uint64_t result = sandbox_check();
  _MergedGlobals_25_0 = (_DWORD)result == 0;
  return result;
}

- (NSURL)URLForDirectory:(NSSearchPathDirectory)directory inDomain:(NSSearchPathDomainMask)domain appropriateForURL:(NSURL *)url create:(BOOL)shouldCreate error:(NSError *)error
{
  return (NSURL *)-[_NSFileManagerBridge urlFor:in:appropriateFor:create:error:]( self->swiftBridge,  "urlFor:in:appropriateFor:create:error:",  directory,  domain,  url,  shouldCreate,  error);
}

- (BOOL)getRelationship:(NSURLRelationship *)outRelationship ofDirectoryAtURL:(NSURL *)directoryURL toItemAtURL:(NSURL *)otherURL error:(NSError *)error
{
  return directoryURL
      && otherURL
      && -[_NSFileManagerBridge getRelationship:ofDirectoryAt:toItemAt:error:]( self->swiftBridge,  "getRelationship:ofDirectoryAt:toItemAt:error:",  outRelationship);
}

- (BOOL)getRelationship:(NSURLRelationship *)outRelationship ofDirectory:(NSSearchPathDirectory)directory inDomain:(NSSearchPathDomainMask)domainMask toItemAtURL:(NSURL *)url error:(NSError *)error
{
  return -[_NSFileManagerBridge getRelationship:of:in:toItemAt:error:]( self->swiftBridge,  "getRelationship:of:in:toItemAt:error:",  outRelationship,  directory,  domainMask,  url,  error);
}

- (id)_displayPathForPath:(id)a3
{
  objc_super v4 = +[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 512LL);
  id v5 = (void *)[a3 stringByStandardizingPath];
  if (([v5 isEqualToString:&stru_189CA6A28] & 1) == 0)
  {
    do
    {
      if ([v5 isEqualToString:@"/"]) {
        break;
      }
      -[NSMutableString insertString:atIndex:]( v4,  "insertString:atIndex:",  -[NSFileManager displayNameAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "displayNameAtPath:",  v5),  0LL);
      id v5 = (void *)[v5 stringByDeletingLastPathComponent];
      if (([v5 isEqualToString:&stru_189CA6A28] & 1) == 0) {
        -[NSMutableString insertString:atIndex:](v4, "insertString:atIndex:", @"/", 0LL);
      }
    }

    while (![v5 isEqualToString:&stru_189CA6A28]);
  }

  if (-[NSString isAbsolutePath](v4, "isAbsolutePath"))
  {
    if (-[NSString hasPrefix:](v4, "hasPrefix:", @"/Volumes"))
    {
      -[NSMutableString deleteCharactersInRange:](v4, "deleteCharactersInRange:", 0LL, 8LL);
    }

    else if (!-[NSString hasPrefix:](v4, "hasPrefix:", @"/Network"))
    {
      -[NSMutableString insertString:atIndex:]( v4,  "insertString:atIndex:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/%@",  -[NSFileManager displayNameAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "displayNameAtPath:",  @"/")),  0LL);
    }
  }

  return v4;
}

- (BOOL)directoryCanBeCreatedAtPath:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  objc_super v4 = (const char *)[a3 fileSystemRepresentation];
  if ((objc_msgSend( (id)objc_msgSend(a3, "stringByDeletingLastPathComponent"),  "getFileSystemRepresentation:maxLength:",  v6,  1024) & 1) == 0 || access(v6, 3))
  {
    return 0;
  }

  if (!mkdir(v4, 0x1FFu))
  {
    rmdir(v4);
    return 1;
  }

  return *__error() == 17;
}

+ (NSFileManager)defaultManager
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __31__NSFileManager_defaultManager__block_invoke;
  v3[3] = &unk_189C9A030;
  v3[4] = a1;
  if (qword_18C496210 != -1) {
    dispatch_once(&qword_18C496210, v3);
  }
  return (NSFileManager *)qword_18C496218;
}

uint64_t __31__NSFileManager_defaultManager__block_invoke(uint64_t a1)
{
  uint64_t result = [objc_allocWithZone(*(Class *)(a1 + 32)) init];
  qword_18C496218 = result;
  return result;
}

- (NSString)currentDirectoryPath
{
  return -[_NSFileManagerBridge currentDirectoryPath](self->swiftBridge, "currentDirectoryPath");
}

- (BOOL)changeCurrentDirectoryPath:(NSString *)path
{
  return path && -[_NSFileManagerBridge changeCurrentDirectoryPath:](self->swiftBridge, "changeCurrentDirectoryPath:");
}

- (NSDictionary)fileAttributesAtPath:(NSString *)path traverseLink:(BOOL)yorn
{
  return (NSDictionary *)+[NSFileAttributes attributesAtPath:traverseLink:]( &OBJC_CLASS___NSFileAttributes,  "attributesAtPath:traverseLink:",  path,  yorn);
}

- (BOOL)changeFileAttributes:(NSDictionary *)attributes atPath:(NSString *)path
{
  return -[NSFileManager setAttributes:ofItemAtPath:error:]( self,  "setAttributes:ofItemAtPath:error:",  attributes,  path,  0LL);
}

- (BOOL)fileExistsAtPath:(NSString *)path
{
  return path && -[_NSFileManagerBridge fileExistsAtPath:](self->swiftBridge, "fileExistsAtPath:");
}

- (BOOL)fileExistsAtPath:(NSString *)path isDirectory:(BOOL *)isDirectory
{
  return path
      && -[_NSFileManagerBridge fileExistsAtPath:isDirectory:]( self->swiftBridge,  "fileExistsAtPath:isDirectory:",  path,  isDirectory);
}

- (BOOL)isReadableFileAtPath:(NSString *)path
{
  return path && -[_NSFileManagerBridge isReadableFileAtPath:](self->swiftBridge, "isReadableFileAtPath:");
}

- (BOOL)isWritableFileAtPath:(NSString *)path
{
  return path && -[_NSFileManagerBridge isWritableFileAtPath:](self->swiftBridge, "isWritableFileAtPath:");
}

- (BOOL)isExecutableFileAtPath:(NSString *)path
{
  return path && -[_NSFileManagerBridge isExecutableFileAtPath:](self->swiftBridge, "isExecutableFileAtPath:");
}

- (BOOL)isDeletableFileAtPath:(NSString *)path
{
  if (!path) {
    path = -[NSFileManager currentDirectoryPath](self, "currentDirectoryPath");
  }
  return -[_NSFileManagerBridge isDeletableFileAtPath:](self->swiftBridge, "isDeletableFileAtPath:", path);
}

- (NSString)displayNameAtPath:(NSString *)path
{
  if (path) {
    return (NSString *)-[_NSFileManagerBridge displayNameAtPath:](self->swiftBridge, "displayNameAtPath:");
  }
  else {
    return (NSString *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(0, "lastPathComponent"),  "componentsSeparatedByString:",  @":"),  "componentsJoinedByString:",  @"/");
  }
}

- (BOOL)removeFileAtPath:(NSString *)path handler:(id)handler
{
  return -[NSFileManager removeItemAtPath:error:](self, "removeItemAtPath:error:", path, 0LL);
}

- (id)directoryContentsAtPath:(id)a3 matchingExtension:(id)a4 options:(int64_t)a5 keepExtension:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v43 = *MEMORY[0x1895F89C0];
  if (a4)
  {
    strcpy(__s, ".");
    if (!-[NSFileManager getFileSystemRepresentation:maxLength:withPath:]( self,  "getFileSystemRepresentation:maxLength:withPath:",  &__s[1],  1023LL,  a4)) {
      return 0LL;
    }
    uint64_t v11 = (const char *)[a3 fileSystemRepresentation];
    int v12 = __s;
    size_t v13 = strlen(__s);
    if (!v11) {
      goto LABEL_4;
    }
  }

  else
  {
    uint64_t v11 = (const char *)[a3 fileSystemRepresentation];
    int v12 = 0LL;
    size_t v13 = 0LL;
    if (!v11)
    {
LABEL_4:
      if (a7)
      {
        uint64_t v14 = __error();
        uint64_t v15 = 0LL;
        int v16 = *v14;
LABEL_36:
        v19 = 0LL;
        *a7 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v16, (uint64_t)v15, 1, (uint64_t)@"Folder", 0LL);
        return v19;
      }

      return 0LL;
    }
  }

  int v17 = opendir(v11);
  if (!v17)
  {
    if (a7)
    {
      int v16 = *__error();
      uint64_t v15 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v11);
      goto LABEL_36;
    }

    return 0LL;
  }

  char v18 = v17;
  v19 = (void *)[MEMORY[0x189603FA8] array];
  v20 = (void *)[objc_allocWithZone((Class)NSCheapMutableString) init];
  if ((_DWORD)v13) {
    int v21 = v8;
  }
  else {
    int v21 = 1;
  }
  if (v21) {
    size_t v22 = 0LL;
  }
  else {
    size_t v22 = v13;
  }
  if (!readdir_r(v18, &v42, &v40) && v40)
  {
    d_name = v42.d_name;
    __int128 v39 = v19;
    do
    {
      if (v42.d_ino)
      {
        int d_namlen = v42.d_namlen;
        if (v42.d_name[0] != 46 || v42.d_namlen != 1 && (v42.d_namlen != 2 || v42.d_name[1] != 46))
        {
          if (v42.d_namlen > v13)
          {
            if ((a5 & 1) != 0)
            {
              v25 = CFStringCreateWithFileSystemRepresentation(0LL, d_name);
              CFStringRef v26 = CFStringCreateWithFileSystemRepresentation(0LL, v12);
              uint64_t v27 = d_name;
              size_t v28 = v22;
              int64_t v29 = a5;
              v30 = v12;
              v31 = v20;
              uint64_t v32 = v26;
              CFIndex Length = CFStringGetLength(v25);
              v44.length = CFStringGetLength(v32);
              v44.location = Length - v44.length;
              CFComparisonResult v34 = CFStringCompareWithOptions(v25, v32, v44, 0x21uLL);
              v35 = v32;
              v20 = v31;
              int v12 = v30;
              a5 = v29;
              size_t v22 = v28;
              d_name = v27;
              v19 = v39;
              CFRelease(v35);
              CFRelease(v25);
              if (v34)
              {
                int d_namlen = v42.d_namlen;
LABEL_29:
                uint64_t v36 = [objc_allocWithZone((Class)NSString) initWithBytes:d_name length:d_namlen - (int)v22 encoding:4];
                if (v36)
                {
                  __int128 v37 = (void *)v36;
                  [v19 addObject:v36];
                }
              }
            }

            else if (!strcmp(&v42.d_name[v42.d_namlen - v13], v12))
            {
              goto LABEL_29;
            }
          }
        }
      }
    }

    while (!readdir_r(v18, &v42, &v40) && v40);
  }

  closedir(v18);
  return v19;
}

- (id)directoryContentsAtPath:(id)a3 matchingExtension:(id)a4 options:(int64_t)a5 keepExtension:(BOOL)a6
{
  return -[NSFileManager directoryContentsAtPath:matchingExtension:options:keepExtension:error:]( self,  "directoryContentsAtPath:matchingExtension:options:keepExtension:error:",  a3,  a4,  a5,  a6,  0LL);
}

- (NSArray)directoryContentsAtPath:(NSString *)path
{
  return (NSArray *)-[NSFileManager directoryContentsAtPath:matchingExtension:options:keepExtension:]( self,  "directoryContentsAtPath:matchingExtension:options:keepExtension:",  path,  0LL,  0LL,  1LL);
}

- (NSDirectoryEnumerator)enumeratorAtPath:(NSString *)path
{
  uint64_t result = +[NSFileAttributes attributesAtPath:traverseLink:]( &OBJC_CLASS___NSFileAttributes,  "attributesAtPath:traverseLink:",  path,  1LL);
  if (result) {
    return (NSDirectoryEnumerator *) +[NSAllDescendantPathsEnumerator newWithPath:prepend:attributes:cross:depth:]( &OBJC_CLASS___NSAllDescendantPathsEnumerator,  "newWithPath:prepend:attributes:cross:depth:",  path,  0LL,  result,  1LL,  1LL);
  }
  return result;
}

- (NSArray)subpathsAtPath:(NSString *)path
{
  return (NSArray *)-[NSEnumerator allObjects]( -[NSFileManager enumeratorAtPath:](self, "enumeratorAtPath:", path),  "allObjects");
}

- (BOOL)createDirectoryAtPath:(NSString *)path attributes:(NSDictionary *)attributes
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (!-[NSString getFileSystemRepresentation:maxLength:](path, "getFileSystemRepresentation:maxLength:", v9, 1024LL)) {
    return 0;
  }
  int v7 = mkdir(v9, 0x1FFu);
  BOOL result = v7 == 0;
  if (attributes)
  {
    if (!v7)
    {
      -[NSFileManager changeFileAttributes:atPath:](self, "changeFileAttributes:atPath:", attributes, path);
      return 1;
    }
  }

  return result;
}

- (NSString)pathContentOfSymbolicLinkAtPath:(NSString *)path
{
  return -[NSFileManager destinationOfSymbolicLinkAtPath:error:]( self,  "destinationOfSymbolicLinkAtPath:error:",  path,  0LL);
}

- (BOOL)createSymbolicLinkAtPath:(NSString *)path pathContent:(NSString *)otherpath
{
  return -[NSFileManager createSymbolicLinkAtPath:withDestinationPath:error:]( self,  "createSymbolicLinkAtPath:withDestinationPath:error:",  path,  otherpath,  0LL);
}

- (BOOL)createFileAtPath:(NSString *)path contents:(NSData *)data attributes:(NSDictionary *)attr
{
  if (path)
  {
    if (_NSIsNSString())
    {
      BOOL v9 = -[NSData writeToFile:atomically:](data, "writeToFile:atomically:", path, 1LL);
      if (attr && v9)
      {
        -[NSFileManager setAttributes:ofItemAtPath:error:](self, "setAttributes:ofItemAtPath:error:", attr, path, 0LL);
        LOBYTE(v9) = 1;
      }
    }

    else
    {
      LOBYTE(v9) = -[_NSFileManagerBridge createFileAtPath:contents:attributes:]( self->swiftBridge,  "createFileAtPath:contents:attributes:",  path,  data,  attr);
    }
  }

  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (NSData)contentsAtPath:(NSString *)path
{
  return (NSData *)(id)[objc_allocWithZone(MEMORY[0x189603F48]) initWithContentsOfFile:path];
}

- (BOOL)contentsEqualAtPath:(NSString *)path1 andPath:(NSString *)path2
{
  return -[_NSFileManagerBridge contentsEqualAtPath:andPath:]( self->swiftBridge,  "contentsEqualAtPath:andPath:",  path1,  path2);
}

- (NSDictionary)fileSystemAttributesAtPath:(NSString *)path
{
  return -[NSFileManager attributesOfFileSystemForPath:error:](self, "attributesOfFileSystemForPath:error:", path, 0LL);
}

- (BOOL)getFileSystemRepresentation:(char *)a3 maxLength:(unint64_t)a4 withPath:(id)a5
{
  return _NSGetFileSystemRepresentation(a3, a4, a5);
}

- (const)fileSystemRepresentationWithPath:(NSString *)path
{
  return (const char *)_NSFileSystemRepresentationWithPath((__CFString *)path);
}

- (NSString)stringWithFileSystemRepresentation:(const char *)str length:(NSUInteger)len
{
  return (NSString *)_NSFileSystemRepresentationString((uint64_t)str, len);
}

- (NSArray)componentsToDisplayForPath:(NSString *)path
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (!path) {
    return 0LL;
  }
  if (!objc_msgSend( (id)objc_msgSend( MEMORY[0x189604030],  "fileURLWithPath:",  -[NSString stringByResolvingSymlinksInPath](path, "stringByResolvingSymlinksInPath")),  "fileReferenceURL")) {
    return 0LL;
  }
  uint64_t v3 = _CFURLCreateDisplayPathComponentsArray();
  if (!v3) {
    return 0LL;
  }
  objc_super v4 = (void *)v3;
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = *MEMORY[0x189603CE0];
    while (2)
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v16 + 1) + 8 * v10) getResourceValue:&v14 forKey:v9 error:0]) {
          BOOL v11 = v14 == 0;
        }
        else {
          BOOL v11 = 1;
        }
        if (v11)
        {

          goto LABEL_19;
        }

        objc_msgSend(v5, "insertObject:atIndex:");
        ++v10;
      }

      while (v7 != v10);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v16 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (v5)
  {
    int v12 = (NSArray *)[MEMORY[0x189603F18] arrayWithArray:v5];
  }

  else
  {
LABEL_19:
    int v12 = 0LL;
  }

  CFRelease(v4);
  return v12;
}

- (NSFileManager)retain
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  if ((NSFileManager *)qword_18C496218 != self)
  {
    v2.receiver = self;
    v2.super_class = (Class)&OBJC_CLASS___NSFileManager;
    return -[NSFileManager retain](&v2, sel_retain);
  }

  return self;
}

- (void)release
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  if ((NSFileManager *)qword_18C496218 != self)
  {
    v2.receiver = self;
    v2.super_class = (Class)&OBJC_CLASS___NSFileManager;
    -[NSFileManager release](&v2, sel_release);
  }

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if ((NSFileManager *)qword_18C496218 == self)
  {
    qword_18C5D6210 = (uint64_t)"You cannot deallocate the default file manager singleton";
    __break(1u);
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileManager;
  -[NSFileManager dealloc](&v3, sel_dealloc);
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = (NSFileManagerDelegate *)delegate;

  if (delegate) {
    id v5 = +[NSValue valueWithWeakObject:](&OBJC_CLASS___NSValue, "valueWithWeakObject:", delegate);
  }
  else {
    id v5 = 0LL;
  }
  self->_weakDelegateValue = v5;
}

- (id)_safeDelegate
{
  if (dyld_program_sdk_at_least()
    && ((objc_super v3 = (__objc2_class *)objc_opt_class(), v3 == &OBJC_CLASS___NSFileManager)
     || (InstanceMethod = class_getInstanceMethod((Class)v3, sel_delegate),
         InstanceMethod == class_getInstanceMethod((Class)&OBJC_CLASS___NSFileManager, sel_delegate))))
  {
    return -[NSValue weakObjectValue](self->_weakDelegateValue, "weakObjectValue");
  }

  else
  {
    return -[NSFileManager delegate](self, "delegate");
  }

- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  if (!a3)
  {
    int v8 = _CFExecutableLinkedOnOrAfter();
    if (!v8) {
      return v8;
    }
    uint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: source path is nil",  _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_8;
  }

  if (!a4)
  {
    uint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: destination path is nil",  _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_8:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v9 userInfo:0]);
    LOBYTE(v8) = -[NSFileManager copyItemAtPath:toPath:error:](v10, v11, v12, v13, v14);
    return v8;
  }

  LOBYTE(v8) = -[_NSFileManagerBridge copyItemAtPath:toPath:options:error:]( self->swiftBridge,  "copyItemAtPath:toPath:options:error:");
  return v8;
}

- (BOOL)copyItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError *)error
{
  return -[NSFileManager copyItemAtPath:toPath:options:error:]( self,  "copyItemAtPath:toPath:options:error:",  srcPath,  dstPath,  0LL,  error);
}

- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  if (!a3)
  {
    int v8 = _CFExecutableLinkedOnOrAfter();
    if (!v8) {
      return v8;
    }
    uint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: source URL is nil",  _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_8;
  }

  if (!a4)
  {
    uint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: destination URL is nil",  _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_8:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v9 userInfo:0]);
    LOBYTE(v8) = -[NSFileManager copyItemAtURL:toURL:error:](v10, v11, v12, v13, v14);
    return v8;
  }

  LOBYTE(v8) = -[_NSFileManagerBridge copyItemAt:to:options:error:](self->swiftBridge, "copyItemAt:to:options:error:");
  return v8;
}

- (BOOL)copyItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL error:(NSError *)error
{
  return -[NSFileManager copyItemAtURL:toURL:options:error:]( self,  "copyItemAtURL:toURL:options:error:",  srcURL,  dstURL,  0LL,  error);
}

- (BOOL)_handleFaultedOutCloudDocFromSource:(id)a3 toDestination:(id)a4 handled:(BOOL *)a5 error:(id *)a6
{
  if (a5) {
    *a5 = 0;
  }
  return 1;
}

- (BOOL)moveItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError *)error
{
  if (!srcPath && _CFExecutableLinkedOnOrAfter())
  {
    SEL v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: source path is nil",  _NSMethodExceptionProem((objc_class *)self, a2));
  }

  else
  {
    if (dstPath) {
      return -[_NSFileManagerBridge moveItemAtPath:toPath:options:error:]( self->swiftBridge,  "moveItemAtPath:toPath:options:error:",  srcPath,  dstPath,  0LL,  error);
    }
    SEL v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: destination path is nil",  _NSMethodExceptionProem((objc_class *)self, a2));
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v11 userInfo:0]);
  return -[NSFileManager moveItemAtURL:toURL:options:error:](v12, v13, v14, v15, v16, v17);
}

- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  if (!a3)
  {
    int v8 = _CFExecutableLinkedOnOrAfter();
    if (!v8) {
      return v8;
    }
    uint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: source URL is nil",  _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_8;
  }

  if (!a4)
  {
    uint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: destination URL is nil",  _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_8:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v9 userInfo:0]);
    LOBYTE(v8) = -[NSFileManager moveItemAtURL:toURL:error:](v10, v11, v12, v13, v14);
    return v8;
  }

  LOBYTE(v8) = -[_NSFileManagerBridge moveItemAt:to:options:error:](self->swiftBridge, "moveItemAt:to:options:error:");
  return v8;
}

- (BOOL)moveItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL error:(NSError *)error
{
  return -[NSFileManager moveItemAtURL:toURL:options:error:]( self,  "moveItemAtURL:toURL:options:error:",  srcURL,  dstURL,  0LL,  error);
}

- (BOOL)linkItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError *)error
{
  if (!srcPath && _CFExecutableLinkedOnOrAfter())
  {
    SEL v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: source path is nil",  _NSMethodExceptionProem((objc_class *)self, a2));
  }

  else
  {
    if (dstPath) {
      return -[_NSFileManagerBridge linkItemAtPath:toPath:error:]( self->swiftBridge,  "linkItemAtPath:toPath:error:",  srcPath,  dstPath,  error);
    }
    SEL v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: destination path is nil",  _NSMethodExceptionProem((objc_class *)self, a2));
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v11 userInfo:0]);
  return -[NSFileManager linkItemAtURL:toURL:error:](v12, v13, v14, v15, v16);
}

- (BOOL)linkItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL error:(NSError *)error
{
  if (!srcURL && _CFExecutableLinkedOnOrAfter())
  {
    SEL v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: source URL is nil",  _NSMethodExceptionProem((objc_class *)self, a2));
  }

  else
  {
    if (dstURL) {
      return -[_NSFileManagerBridge linkItemAt:to:error:]( self->swiftBridge,  "linkItemAt:to:error:",  srcURL,  dstURL,  error);
    }
    SEL v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: destination URL is nil",  _NSMethodExceptionProem((objc_class *)self, a2));
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v11 userInfo:0]);
  return -[NSFileManager removeItemAtPath:error:](v12, v13, v14, v15);
}

- (BOOL)removeItemAtPath:(NSString *)path error:(NSError *)error
{
  return !path
      || -[_NSFileManagerBridge removeItemAtPath:error:](self->swiftBridge, "removeItemAtPath:error:", path, error);
}

- (BOOL)removeItemAtURL:(NSURL *)URL error:(NSError *)error
{
  return !URL || -[_NSFileManagerBridge removeItemAt:error:](self->swiftBridge, "removeItemAt:error:", URL, error);
}

- (BOOL)setAttributes:(NSDictionary *)attributes ofItemAtPath:(NSString *)path error:(NSError *)error
{
  return -[_NSFileManagerBridge setAttributes:ofItemAtPath:error:]( self->swiftBridge,  "setAttributes:ofItemAtPath:error:",  attributes,  path,  error);
}

- (BOOL)createDirectoryAtPath:(NSString *)path withIntermediateDirectories:(BOOL)createIntermediates attributes:(NSDictionary *)attributes error:(NSError *)error
{
  return -[_NSFileManagerBridge createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( self->swiftBridge,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  path,  createIntermediates,  attributes,  error);
}

- (BOOL)createDirectoryAtURL:(NSURL *)url withIntermediateDirectories:(BOOL)createIntermediates attributes:(NSDictionary *)attributes error:(NSError *)error
{
  if (url) {
    return -[_NSFileManagerBridge createDirectoryAt:withIntermediateDirectories:attributes:error:]( self->swiftBridge,  "createDirectoryAt:withIntermediateDirectories:attributes:error:",  url,  createIntermediates,  attributes,  error);
  }
  uint64_t v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: URL is nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v7);
  return -[NSFileManager contentsOfDirectoryAtPath:error:](v8, v9, v10, v11);
}

- (NSArray)contentsOfDirectoryAtPath:(NSString *)path error:(NSError *)error
{
  if (path) {
    return (NSArray *)-[_NSFileManagerBridge contentsOfDirectoryAtPath:error:]( self->swiftBridge,  "contentsOfDirectoryAtPath:error:",  path,  error);
  }
  if (error) {
    *error = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(14LL, 0LL, 1, (uint64_t)@"Folder", 0LL);
  }
  return 0LL;
}

- (NSArray)subpathsOfDirectoryAtPath:(NSString *)path error:(NSError *)error
{
  if (path || !_CFExecutableLinkedOnOrAfter()) {
    return (NSArray *)-[_NSFileManagerBridge subpathsOfDirectoryAtPath:error:]( self->swiftBridge,  "subpathsOfDirectoryAtPath:error:",  path,  error);
  }
  SEL v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: path is nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v9);
  return (NSArray *)-[NSFileManager attributesOfItemAtPath:error:](v10, v11, v12, v13);
}

- (NSDictionary)attributesOfItemAtPath:(NSString *)path error:(NSError *)error
{
  return (NSDictionary *)-[_NSFileManagerBridge attributesOfItemAtPath:error:]( self->swiftBridge,  "attributesOfItemAtPath:error:",  path,  error);
}

- (id)_attributesOfItemAtPath:(id)a3 filterResourceFork:(BOOL)a4 error:(id *)a5
{
  return +[NSFileAttributes _attributesAtPath:partialReturn:filterResourceFork:error:]( &OBJC_CLASS___NSFileAttributes,  "_attributesAtPath:partialReturn:filterResourceFork:error:",  a3,  1LL,  a4,  a5);
}

- (id)_attributesOfItemAtURL:(id)a3 filterResourceFork:(BOOL)a4 error:(id *)a5
{
  return +[NSFileAttributes _attributesAtURL:partialReturn:filterResourceFork:error:]( &OBJC_CLASS___NSFileAttributes,  "_attributesAtURL:partialReturn:filterResourceFork:error:",  a3,  1LL,  a4,  a5);
}

- (NSDictionary)attributesOfFileSystemForPath:(NSString *)path error:(NSError *)error
{
  return (NSDictionary *)-[_NSFileManagerBridge attributesOfFileSystemForPath:error:]( self->swiftBridge,  "attributesOfFileSystemForPath:error:",  path,  error);
}

- (BOOL)createSymbolicLinkAtPath:(NSString *)path withDestinationPath:(NSString *)destPath error:(NSError *)error
{
  return -[_NSFileManagerBridge createSymbolicLinkAtPath:withDestinationPath:error:]( self->swiftBridge,  "createSymbolicLinkAtPath:withDestinationPath:error:",  path,  destPath,  error);
}

- (BOOL)createSymbolicLinkAtURL:(NSURL *)url withDestinationURL:(NSURL *)destURL error:(NSError *)error
{
  if (url)
  {
    if (destURL) {
      return -[_NSFileManagerBridge createSymbolicLinkAt:withDestinationURL:error:]( self->swiftBridge,  "createSymbolicLinkAt:withDestinationURL:error:");
    }
    uint64_t v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: destURL is nil",  _NSMethodExceptionProem((objc_class *)self, a2));
  }

  else
  {
    uint64_t v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: URL is nil",  _NSMethodExceptionProem((objc_class *)self, a2));
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v6 userInfo:0]);
  return -[NSFileManager destinationOfSymbolicLinkAtPath:error:](v7, v8, v9, v10);
}

- (NSString)destinationOfSymbolicLinkAtPath:(NSString *)path error:(NSError *)error
{
  return (NSString *)-[_NSFileManagerBridge destinationOfSymbolicLinkAtPath:error:]( self->swiftBridge,  "destinationOfSymbolicLinkAtPath:error:",  path,  error);
}

- (BOOL)replaceItemAtURL:(NSURL *)originalItemURL withItemAtURL:(NSURL *)newItemURL backupItemName:(NSString *)backupItemName options:(NSFileManagerItemReplacementOptions)options resultingItemURL:(NSURL *)resultingURL error:(NSError *)error
{
  v15[1] = *(id *)MEMORY[0x1895F89C0];
  if (!originalItemURL)
  {
    SEL v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: original item URL is nil",  _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_12;
  }

  if (!newItemURL)
  {
    SEL v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: new item URL is nil",  _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_12:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v13 userInfo:0]);
  }

  int v10 = MEMORY[0x186E1EE14]( 0LL,  originalItemURL,  newItemURL,  0LL,  backupItemName,  (8 * (int)options) & 0x10LL | (2 * (options & 1)),  v15,  &v14);
  if (!v10)
  {
    id v11 = v14;
    if (error)
    {
      *error = (NSError *)v14;
      return v10 != 0;
    }

- (BOOL)startDownloadingUbiquitousItemAtURL:(NSURL *)url error:(NSError *)error
{
  if (error) {
    *error = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  3328LL,  0LL);
  }
  return 0;
}

- (BOOL)setUbiquitous:(BOOL)flag itemAtURL:(NSURL *)url destinationURL:(NSURL *)destinationURL error:(NSError *)error
{
  if (error) {
    *error = _librarianMissingError(0);
  }
  return 0;
}

- (BOOL)isUbiquitousItemAtURL:(NSURL *)url
{
  BOOLean[1] = *(CFBooleanRef *)MEMORY[0x1895F89C0];
  if (!url) {
    return 0;
  }
  if (!CFURLCopyResourcePropertyForKey((CFURLRef)url, (CFStringRef)*MEMORY[0x1896053D8], BOOLean, 0LL)
    || BOOLean[0] == 0LL)
  {
    return 0;
  }

  BOOL v4 = CFBooleanGetValue(BOOLean[0]) != 0;
  CFRelease(BOOLean[0]);
  return v4;
}

- (BOOL)evictUbiquitousItemAtURL:(NSURL *)url error:(NSError *)error
{
  if (error) {
    *error = _librarianMissingError(0);
  }
  return 0;
}

- (NSURL)URLForUbiquityContainerIdentifier:(NSString *)containerIdentifier
{
  return 0LL;
}

- (NSURL)URLForPublishingUbiquitousItemAtURL:(NSURL *)url expirationDate:(NSDate *)outDate error:(NSError *)error
{
  if (error) {
    *error = _librarianMissingError(1);
  }
  return 0LL;
}

- (BOOL)_processHasUbiquityContainerEntitlement
{
  return 0;
}

- (BOOL)_processUsesCloudServices
{
  if (qword_18C496220 != -1) {
    dispatch_once(&qword_18C496220, &__block_literal_global_273);
  }
  return byte_18C496201;
}

void __42__NSFileManager__processUsesCloudServices__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  mach_msg_type_number_t task_info_outCnt = 8;
  task_info(*MEMORY[0x1895FBBE0], 0xFu, task_info_out, &task_info_outCnt);
  v0 = (void *)xpc_copy_entitlement_for_token();
  if (v0)
  {
    v1 = v0;
    if (object_getClass(v0) == (Class)MEMORY[0x1895F9220] && xpc_array_get_count(v1) && xpc_array_get_string(v1, 0LL)) {
      byte_18C496201 = 1;
    }
    xpc_release(v1);
  }

  if (!byte_18C496201)
  {
    objc_super v2 = (void *)xpc_copy_entitlement_for_token();
    if (v2)
    {
      objc_super v3 = v2;
      byte_18C496201 = object_getClass(v2) == (Class)MEMORY[0x1895F92E8];
      xpc_release(v3);
    }
  }

- (BOOL)_processCanAccessUbiquityIdentityToken
{
  return 0;
}

- (id)ubiquityIdentityToken
{
  return 0LL;
}

- (NSURL)containerURLForSecurityApplicationGroupIdentifier:(NSString *)groupIdentifier
{
  BOOL result = (NSURL *)container_create_or_lookup_app_group_path_by_app_group_identifier();
  if (result)
  {
    BOOL v4 = result;
    id v5 = (NSURL *)[MEMORY[0x189604030] fileURLWithFileSystemRepresentation:result isDirectory:1 relativeToURL:0];
    free(v4);
    return v5;
  }

  return result;
}

- (NSURL)temporaryDirectory
{
  return -[_NSFileManagerBridge temporaryDirectory](self->swiftBridge, "temporaryDirectory");
}

- (BOOL)_web_createDirectoryAtPathWithIntermediateDirectories:(id)a3 attributes:(id)a4
{
  return -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( self,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  a3,  1LL,  a4,  0LL);
}

- (BOOL)_web_createFileAtPathWithIntermediateDirectories:(id)a3 contents:(id)a4 attributes:(id)a5 directoryAttributes:(id)a6
{
  if (-[NSFileManager createFileAtPath:contents:attributes:](self, "createFileAtPath:contents:attributes:"))
  {
    LOBYTE(v11) = 1;
  }

  else
  {
    BOOL v11 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( self,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  [a3 stringByDeletingLastPathComponent],  1,  a6,  0);
    if (v11) {
      LOBYTE(v11) = -[NSFileManager createFileAtPath:contents:attributes:]( self,  "createFileAtPath:contents:attributes:",  a3,  a4,  a5);
    }
  }

  return v11;
}

- (BOOL)_web_changeFinderAttributes:(id)a3 forFileAtPath:(id)a4
{
  return 0;
}

- (BOOL)_web_createFileAtPath:(id)a3 contents:(id)a4 attributes:(id)a5
{
  BOOL v8 = -[NSFileManager createFileAtPath:contents:attributes:](self, "createFileAtPath:contents:attributes:", a3, a4);
  if (v8) {
    -[NSFileManager _web_changeFinderAttributes:forFileAtPath:]( self,  "_web_changeFinderAttributes:forFileAtPath:",  a5,  a3);
  }
  return v8;
}

- (void)_performRemoveFileAtPath:(id)a3
{
}

- (void)_web_backgroundRemoveFileAtPath:(id)a3
{
  v9[1] = *(NSString **)MEMORY[0x1895F89C0];
  BOOL v8 = 0LL;
  if (_NSCreateTemporaryFile(a3, v9, &v7, &v8, 0LL))
  {
    id v5 = strdup(-[NSString fileSystemRepresentation](v9[0], "fileSystemRepresentation"));
    uint64_t v6 = (const char *)[a3 fileSystemRepresentation];
    close(v7);
    if (!rename(v6, v5))
    {
      v9[0] = -[NSFileManager stringWithFileSystemRepresentation:length:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "stringWithFileSystemRepresentation:length:",  v5,  strlen(v5));
      +[NSThread detachNewThreadSelector:toTarget:withObject:]( &OBJC_CLASS___NSThread,  "detachNewThreadSelector:toTarget:withObject:",  sel__performRemoveFileAtPath_,  self,  v9[0]);
    }

    free(v5);
    _NSCleanupTemporaryDirectory(v8);
  }

- (BOOL)_web_removeFileOnlyAtPath:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  int v4 = unlink((const char *)[a3 fileSystemRepresentation]);
  if (!statfs((const char *)[a3 fileSystemRepresentation], &v7) && (v7.f_flags & 0x8000) == 0)
  {
    id v5 = (void *)[a3 lastPathComponent];
    if ([v5 length])
    {
      if (([v5 isEqualToString:@"/"] & 1) == 0) {
        v4 |= unlink((const char *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(a3, "stringByDeletingLastPathComponent"),  "stringByAppendingString:",  objc_msgSend(@"._", "stringByAppendingString:", v5)),  "fileSystemRepresentation"));
      }
    }
  }

  return v4 == 0;
}

- (void)_web_backgroundRemoveLeftoverFiles:(id)a3
{
  id v5 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  uint64_t v6 = [a3 stringByDeletingLastPathComponent];
  statfs v7 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/.tmp%ld", v6, 0LL);
  if (-[NSFileManager fileExistsAtPath:](v5, "fileExistsAtPath:", v7))
  {
    uint64_t v8 = 1LL;
    do
    {
      +[NSThread detachNewThreadSelector:toTarget:withObject:]( &OBJC_CLASS___NSThread,  "detachNewThreadSelector:toTarget:withObject:",  sel__performRemoveFileAtPath_,  self,  v7);
      statfs v7 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/.tmp%ld", v6, v8++);
    }

    while (-[NSFileManager fileExistsAtPath:](v5, "fileExistsAtPath:", v7));
  }

- (id)_web_visibleItemsInDirectoryAtPath:(id)a3
{
  return -[NSFileManager contentsOfDirectoryAtPath:error:](self, "contentsOfDirectoryAtPath:error:", a3, 0LL);
}

- (id)_web_pathWithUniqueFilenameForPath:(id)a3
{
  objc_super v3 = (void *)objc_msgSend( (id)objc_msgSend(a3, "stringByDeletingLastPathComponent"),  "stringByAppendingPathComponent:",  objc_msgSend((id)objc_msgSend(a3, "lastPathComponent"), "_web_filenameByFixingIllegalCharacters"));
  int v4 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  if (!-[NSFileManager fileExistsAtPath:](v4, "fileExistsAtPath:", v3)) {
    return v3;
  }
  id v5 = (void *)[v3 lastPathComponent];
  uint64_t v6 = [v5 rangeOfString:@"."];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    statfs v7 = 0LL;
  }

  else
  {
    uint64_t v9 = v6;
    statfs v7 = (void *)[v5 substringFromIndex:v6 + 1];
    objc_super v3 = (void *)objc_msgSend( (id)objc_msgSend(v3, "stringByDeletingLastPathComponent"),  "stringByAppendingPathComponent:",  objc_msgSend(v5, "substringToIndex:", v9));
  }

  uint64_t v10 = 1LL;
  do
  {
    uint64_t v8 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%ld", v3, v10);
    if ([v7 length]) {
      uint64_t v8 = -[NSString stringByAppendingPathExtension:](v8, "stringByAppendingPathExtension:", v7);
    }
    ++v10;
  }

  while (-[NSFileManager fileExistsAtPath:](v4, "fileExistsAtPath:", v8));
  return v8;
}

- (BOOL)_web_fileExistsAtPath_nowarn:(id)a3 isDirectory:(BOOL *)a4 traverseLink:(BOOL)a5
{
  if (a5)
  {
    if (a4) {
      *a4 = 0;
    }
    uint64_t v8 = -[NSFileManager destinationOfSymbolicLinkAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "destinationOfSymbolicLinkAtPath:error:",  a3,  0LL);
    uint64_t v9 = (uint64_t)v8;
    if (v8 && !-[NSString isAbsolutePath](v8, "isAbsolutePath")) {
      uint64_t v9 = objc_msgSend( (id)objc_msgSend(a3, "stringByDeletingLastPathComponent"),  "stringByAppendingPathComponent:",  v9);
    }
    if (v9) {
      id v10 = (id)v9;
    }
    else {
      id v10 = a3;
    }
    BOOL v11 = -[NSFileManager attributesOfItemAtPath:error:](self, "attributesOfItemAtPath:error:", v10, 0LL);
    if (v11)
    {
      int v12 = objc_msgSend( -[NSDictionary objectForKey:](v11, "objectForKey:", @"NSFileType"),  "isEqualToString:",  @"NSFileTypeDirectory");
      LOBYTE(v11) = 1;
      if (a4)
      {
        if (v12) {
          *a4 = 1;
        }
      }
    }
  }

  else
  {
    LOBYTE(v11) = -[NSFileManager fileExistsAtPath:isDirectory:](self, "fileExistsAtPath:isDirectory:", a3, a4);
  }

  return (char)v11;
}

- (id)_web_carbonPathForPath_nowarn:(id)a3
{
  return 0LL;
}

- (id)_web_startupVolumeName_nowarn
{
  id v2 = -[NSFileManager _web_carbonPathForPath_nowarn:](self, "_web_carbonPathForPath_nowarn:", @"/");
  return (id)objc_msgSend(v2, "substringToIndex:", objc_msgSend(v2, "length") - 1);
}

- (BOOL)_web_createIntermediateDirectoriesForPath_nowarn:(id)a3 attributes:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (a3 && [a3 length] && objc_msgSend(a3, "isAbsolutePath"))
  {
    if (-[NSFileManager _web_fileExistsAtPath_nowarn:isDirectory:traverseLink:]( self,  "_web_fileExistsAtPath_nowarn:isDirectory:traverseLink:",  [a3 stringByDeletingLastPathComponent],  &v15,  1))
    {
      return v15 != 0;
    }

    else
    {
      id v8 = a3;
      while (([v8 isEqualToString:@"/"] & 1) == 0)
      {
        id v8 = (id)[v8 stringByDeletingLastPathComponent];
        if (-[NSFileManager _web_fileExistsAtPath_nowarn:isDirectory:traverseLink:]( self,  "_web_fileExistsAtPath_nowarn:isDirectory:traverseLink:",  v8,  &v15,  1LL))
        {
          if (!v15) {
            return 0;
          }
          break;
        }
      }

      uint64_t v9 = -[NSMutableString initWithCapacity:]( [NSMutableString alloc],  "initWithCapacity:",  [a3 length]);
      id v10 = (void *)[a3 componentsSeparatedByString:@"/"];
      uint64_t v11 = [v10 count];
      unint64_t v12 = 0LL;
      unint64_t v13 = v11 - 1;
      if (v11 != 1)
      {
        while (!-[NSString isEqualToString:](v9, "isEqualToString:", v8))
        {
          if (v12) {
            -[NSMutableString appendString:](v9, "appendString:", @"/");
          }
          -[NSMutableString appendString:](v9, "appendString:", [v10 objectAtIndex:v12++]);
          if (v13 == v12) {
            goto LABEL_29;
          }
        }
      }

      if (v12 >= v13)
      {
LABEL_29:
        BOOL v7 = 1;
      }

      else
      {
        BOOL v7 = 0;
        do
        {
          while (!objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", v12), "length"))
            ;
          if (v12) {
            -[NSMutableString appendString:](v9, "appendString:", @"/");
          }
          -[NSMutableString appendString:](v9, "appendString:", [v10 objectAtIndex:v12]);
          if (-[NSFileManager _web_fileExistsAtPath_nowarn:isDirectory:traverseLink:]( self,  "_web_fileExistsAtPath_nowarn:isDirectory:traverseLink:",  v9,  &v15,  1LL))
          {
            if (!v15) {
              break;
            }
          }

          else if (!-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( self,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v9,  0LL,  a4,  0LL))
          {
            break;
          }

          BOOL v7 = ++v12 >= v13;
        }

        while (v12 != v13);
      }
    }
  }

  else
  {
    return 0;
  }

  return v7;
}

- (BOOL)_web_changeFileAttributes_nowarn:(id)a3 atPath:(id)a4
{
  BOOL v7 = -[NSFileManager setAttributes:ofItemAtPath:error:](self, "setAttributes:ofItemAtPath:error:", a3, a4, 0LL);
  return -[NSFileManager _web_changeFinderAttributes:forFileAtPath:]( self,  "_web_changeFinderAttributes:forFileAtPath:",  a3,  a4)
      && v7;
}

@end