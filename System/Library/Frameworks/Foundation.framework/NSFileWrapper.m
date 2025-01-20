@interface NSFileWrapper
+ (BOOL)_canSafelyMapFilesAtPath:(id)a3;
+ (BOOL)_finishWritingToURL:(id)a3 byMovingItemAtURL:(id)a4 addingAttributes:(id)a5 error:(id *)a6;
+ (BOOL)_finishWritingToURL:(id)a3 byTakingContentsFromItemAtURL:(id)a4 addingAttributes:(id)a5 usingTemporaryDirectoryAtURL:(id)a6 backupFileName:(id)a7 error:(id *)a8;
+ (BOOL)_forPath:(id)a3 getItemKind:(id *)a4 modificationDate:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (id)_newContentsAtURL:(id)a3 path:(id)a4 itemKind:(id)a5 oldChildrenByUniqueFileName:(id)a6 options:(unint64_t)a7 error:(id *)a8;
+ (id)_pathForURL:(id)a3 reading:(BOOL)a4 error:(id *)a5;
+ (id)_temporaryDirectoryURLForWritingToURL:(id)a3 error:(id *)a4;
+ (void)_removeTemporaryDirectoryAtURL:(id)a3;
+ (void)_writeAttributes:(id)a3 toURL:(id)a4;
+ (void)initialize;
- (BOOL)_forWritingToURL:(id)a3 returnContentsLazyReadingError:(id *)a4;
- (BOOL)_matchesItemKind:(id)a3 modificationDate:(id)a4;
- (BOOL)_readContentsFromURL:(id)a3 path:(id)a4 itemKind:(id)a5 options:(unint64_t)a6 error:(id *)a7;
- (BOOL)_writeContentsToURL:(id)a3 path:(id)a4 originalContentsURL:(id)a5 tryHardLinking:(BOOL)a6 didHardLinking:(BOOL *)a7 error:(id *)a8;
- (BOOL)isDirectory;
- (BOOL)isRegularFile;
- (BOOL)isSymbolicLink;
- (BOOL)matchesContentsOfURL:(NSURL *)url;
- (BOOL)readFromURL:(NSURL *)url options:(NSFileWrapperReadingOptions)options error:(NSError *)outError;
- (BOOL)writeToURL:(NSURL *)url options:(NSFileWrapperWritingOptions)options originalContentsURL:(NSURL *)originalContentsURL error:(NSError *)outError;
- (NSData)regularFileContents;
- (NSData)serializedRepresentation;
- (NSDictionary)fileAttributes;
- (NSDictionary)fileWrappers;
- (NSFileWrapper)init;
- (NSFileWrapper)initDirectoryWithFileWrappers:(NSDictionary *)childrenByPreferredName;
- (NSFileWrapper)initRegularFileWithContents:(NSData *)contents;
- (NSFileWrapper)initSymbolicLinkWithDestinationURL:(NSURL *)url;
- (NSFileWrapper)initWithCoder:(NSCoder *)inCoder;
- (NSFileWrapper)initWithSerializedRepresentation:(NSData *)serializeRepresentation;
- (NSFileWrapper)initWithURL:(NSURL *)url options:(NSFileWrapperReadingOptions)options error:(NSError *)outError;
- (NSString)addFileWrapper:(NSFileWrapper *)child;
- (NSString)addRegularFileWithContents:(NSData *)data preferredFilename:(NSString *)fileName;
- (NSString)filename;
- (NSString)keyForFileWrapper:(NSFileWrapper *)child;
- (NSString)preferredFilename;
- (NSURL)symbolicLinkDestinationURL;
- (id)_addChild:(id)a3 forUniqueFileName:(id)a4;
- (id)_attributesToWrite;
- (id)_fullDescription:(BOOL)a3;
- (id)_initWithImpl:(id)a3 preferredFileName:(id)a4 uniqueFileName:(id)a5 docInfo:(id)a6 iconData:(id)a7;
- (id)_newImpl;
- (id)_uniqueFileNameOfChild:(id)a3;
- (void)_addParent:(id)a3;
- (void)_initDirectoryContents;
- (void)_observePreferredFileNameOfChild:(id)a3;
- (void)_removeChild:(id)a3 forUniqueFileName:(id)a4;
- (void)_removeParent:(id)a3;
- (void)_resetFileModificationDate;
- (void)_updateDescendantFileNames;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)removeFileWrapper:(NSFileWrapper *)child;
- (void)setFileAttributes:(NSDictionary *)fileAttributes;
- (void)setFilename:(NSString *)filename;
- (void)setPreferredFilename:(NSString *)preferredFilename;
@end

@implementation NSFileWrapper

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    [a1 setVersion:46];
  }
}

- (NSFileWrapper)init
{
  return -[NSFileWrapper initRegularFileWithContents:](self, "initRegularFileWithContents:", 0LL);
}

- (NSFileWrapper)initWithURL:(NSURL *)url options:(NSFileWrapperReadingOptions)options error:(NSError *)outError
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___NSFileWrapper;
  v8 = -[NSFileWrapper init](&v20, sel_init);
  if (v8)
  {
    v9 = v8;
    v10 = (NSURL *)[(id)objc_opt_class() _pathForURL:url reading:1 error:outError];
    if (v10)
    {
      v11 = v10;
      if ((-[NSURL isEqualToString:](v10, "isEqualToString:", @"/") & 1) == 0)
      {
        if ((options & 0x202) == 0)
        {
          int v14 = [(id)objc_opt_class() _canSafelyMapFilesAtPath:v11];
          NSFileWrapperReadingOptions v15 = options | 2;
          if (v14) {
            NSFileWrapperReadingOptions v15 = options;
          }
          options = v15 | 0x200;
        }

        v16 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
        uint64_t v17 = objc_msgSend( -[NSFileManager _attributesOfItemAtURL:filterResourceFork:error:]( v16,  "_attributesOfItemAtURL:filterResourceFork:error:",  url,  0,  outError),  "copy");
        v9->_fileAttributes = (NSDictionary *)v17;
        if (!v17) {
          goto LABEL_24;
        }
        v18 = (NSString *)-[NSString copy](-[NSURL lastPathComponent](v11, "lastPathComponent"), "copy");
        v9->_preferredFileName = v18;
        v9->_fileName = v18;
        if ((options & 1) != 0)
        {
          if (-[NSFileWrapper _readContentsFromURL:path:itemKind:options:error:]( v9,  "_readContentsFromURL:path:itemKind:options:error:",  url,  v11,  -[NSDictionary fileType](v9->_fileAttributes, "fileType"),  options,  outError))
          {
            return v9;
          }

          goto LABEL_24;
        }

        if (url)
        {
          if (-[NSFileManager isReadableFileAtPath:](v16, "isReadableFileAtPath:", v11) || (options & 0x100) != 0)
          {
            v9->_contentsURL = url;
            v9->_contentsMustBeReadWithoutMapping = (options & 2) != 0;
            return v9;
          }

          if (!outError) {
            goto LABEL_24;
          }
          uint64_t v12 = 13LL;
          v13 = url;
        }

        else
        {
          if (!outError) {
            goto LABEL_24;
          }
          uint64_t v12 = 2LL;
          v13 = 0LL;
        }

        goto LABEL_6;
      }

      if (outError)
      {
        uint64_t v12 = 27LL;
        v13 = v11;
LABEL_6:
        *outError = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v12, (uint64_t)v13, 1, 0LL, 0LL);
      }
    }

- (NSFileWrapper)initDirectoryWithFileWrappers:(NSDictionary *)childrenByPreferredName
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSFileWrapper;
  v4 = -[NSFileWrapper init](&v12, sel_init);
  if (v4)
  {
    v4->_fileAttributes = (NSDictionary *)objc_msgSend( objc_alloc(MEMORY[0x189603F68]),  "initWithObjectsAndKeys:",  @"NSFileTypeDirectory",  @"NSFileType",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 511),  @"NSFilePosixPermissions",  0);
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    NSUInteger v5 = -[NSDictionary countByEnumeratingWithState:objects:count:]( childrenByPreferredName,  "countByEnumeratingWithState:objects:count:",  &v14,  v13,  16LL);
    if (v5)
    {
      NSUInteger v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(childrenByPreferredName);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          id v10 = -[NSDictionary objectForKey:](childrenByPreferredName, "objectForKey:", v9);
          if (![v10 preferredFilename]) {
            [v10 setPreferredFilename:v9];
          }
          -[NSFileWrapper _addChild:forUniqueFileName:](v4, "_addChild:forUniqueFileName:", v10, 0LL);
        }

        NSUInteger v6 = -[NSDictionary countByEnumeratingWithState:objects:count:]( childrenByPreferredName,  "countByEnumeratingWithState:objects:count:",  &v14,  v13,  16LL);
      }

      while (v6);
    }

    if (!v4->_contents) {
      -[NSFileWrapper _initDirectoryContents](v4, "_initDirectoryContents");
    }
  }

  return v4;
}

- (NSFileWrapper)initRegularFileWithContents:(NSData *)contents
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSFileWrapper;
  v4 = -[NSFileWrapper init](&v9, sel_init);
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x189603F68]);
    NSUInteger v6 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 438LL);
    v4->_fileAttributes = (NSDictionary *)objc_msgSend( v5,  "initWithObjectsAndKeys:",  @"NSFileTypeRegular",  @"NSFileType",  v6,  @"NSFilePosixPermissions",  objc_msgSend(MEMORY[0x189603F50], "date"),  @"NSFileModificationDate",  0);
    if (contents) {
      id v7 = (id)-[NSData copy](contents, "copy");
    }
    else {
      id v7 = objc_alloc_init(MEMORY[0x189603F48]);
    }
    v4->_contents = v7;
  }

  return v4;
}

- (NSFileWrapper)initSymbolicLinkWithDestinationURL:(NSURL *)url
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSFileWrapper;
  v4 = -[NSFileWrapper init](&v6, sel_init);
  if (v4)
  {
    v4->_fileAttributes = (NSDictionary *)objc_msgSend( objc_alloc(MEMORY[0x189603F68]),  "initWithObjectsAndKeys:",  @"NSFileTypeSymbolicLink",  @"NSFileType",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 438),  @"NSFilePosixPermissions",  0);
    v4->_contents = (id)-[NSURL copy](url, "copy");
  }

  return v4;
}

- (NSFileWrapper)initWithSerializedRepresentation:(NSData *)serializeRepresentation
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  v4 = -[NSRTFD initWithDataRepresentation:]( objc_alloc(&OBJC_CLASS___NSRTFD),  "initWithDataRepresentation:",  serializeRepresentation);
  if (!v4)
  {
LABEL_15:

    return 0LL;
  }

  id v5 = v4;
  uint64_t v6 = -[NSRTFD objectForKey:](v4, "objectForKey:", @"__@UTF8PreferredName@__");
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = objc_alloc(&OBJC_CLASS___NSString);
    objc_super v9 = (NSString *)v7;
    uint64_t v10 = 4LL;
  }

  else
  {
    v11 = -[NSRTFD objectForKey:](v5, "objectForKey:", @"__@PreferredName@__");
    if (!v11) {
      goto LABEL_8;
    }
    v8 = objc_alloc(&OBJC_CLASS___NSString);
    objc_super v9 = v11;
    uint64_t v10 = 2LL;
  }

  v11 = -[NSString initWithData:encoding:](v8, "initWithData:encoding:", v9, v10);
  if (v11)
  {
    -[NSRTFD removeObjectForKey:](v5, "removeObjectForKey:", @"__@UTF8PreferredName@__");
    -[NSRTFD removeObjectForKey:](v5, "removeObjectForKey:", @"__@PreferredName@__");
    if ((_validateFilename(v11) & 1) == 0)
    {
      objc_super v20 = (os_log_s *)_NSOSLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v22 = 138477827;
        v23 = v11;
        _os_log_error_impl( &dword_182EB1000,  v20,  OS_LOG_TYPE_ERROR,  "-[NSFileWrapper initWithSerializedRepresentation:] encountered an invalid preferredFileName: %{private}@",  (uint8_t *)&v22,  0xCu);
      }

      goto LABEL_15;
    }
  }

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    v3 = (void *)[self->_contents objectEnumerator];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v9 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0LL;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v7++) _removeParent:self];
        }

        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v9 count:16];
      }

      while (v5);
    }
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSFileWrapper;
  -[NSFileWrapper dealloc](&v8, sel_dealloc);
}

- (BOOL)isDirectory
{
  return objc_msgSend( -[NSDictionary fileType](-[NSFileWrapper fileAttributes](self, "fileAttributes"), "fileType"),  "isEqualToString:",  @"NSFileTypeDirectory");
}

- (BOOL)isRegularFile
{
  return objc_msgSend( -[NSDictionary fileType](-[NSFileWrapper fileAttributes](self, "fileAttributes"), "fileType"),  "isEqualToString:",  @"NSFileTypeRegular");
}

- (BOOL)isSymbolicLink
{
  return objc_msgSend( -[NSDictionary fileType](-[NSFileWrapper fileAttributes](self, "fileAttributes"), "fileType"),  "isEqualToString:",  @"NSFileTypeSymbolicLink");
}

- (void)_observePreferredFileNameOfChild:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = -[NSArray count]( -[NSDictionary allKeysForObject:](-[NSFileWrapper fileWrappers](self, "fileWrappers"), "allKeysForObject:", a3),  "count");
  if (v5)
  {
    NSUInteger v6 = v5;
    NSUInteger v7 = v5;
    do
    {
      -[NSFileWrapper removeFileWrapper:](self, "removeFileWrapper:", a3);
      --v7;
    }

    while (v7);
    do
    {
      -[NSFileWrapper addFileWrapper:](self, "addFileWrapper:", a3);
      --v6;
    }

    while (v6);
  }
}

- (void)setPreferredFilename:(NSString *)preferredFilename
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (!-[NSString length](preferredFilename, "length"))
  {
    __int128 v12 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ *** preferredFilename cannot be empty.", _NSFullMethodName((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v12);
  }

  NSUInteger v6 = self->_preferredFileName;
  if (v6 != preferredFilename)
  {

    self->_preferredFileName = (NSString *)-[NSString copy](preferredFilename, "copy");
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    parents = self->_parents;
    uint64_t v8 = -[NSHashTable countByEnumeratingWithState:objects:count:]( parents,  "countByEnumeratingWithState:objects:count:",  &v14,  v13,  16LL);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(parents);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * i) _observePreferredFileNameOfChild:self];
        }

        uint64_t v9 = -[NSHashTable countByEnumeratingWithState:objects:count:]( parents,  "countByEnumeratingWithState:objects:count:",  &v14,  v13,  16LL);
      }

      while (v9);
    }
  }

- (NSString)preferredFilename
{
  return self->_preferredFileName;
}

- (void)setFilename:(NSString *)filename
{
  v3 = self->_fileName;
  if (v3 != filename)
  {

    self->_fileName = (NSString *)-[NSString copy](filename, "copy");
  }

- (NSString)filename
{
  return self->_fileName;
}

- (void)setFileAttributes:(NSDictionary *)fileAttributes
{
  if (-[NSDictionary objectForKey:](fileAttributes, "objectForKey:", @"NSFileType")
    && -[NSDictionary objectForKey:](fileAttributes, "objectForKey:", @"NSFilePosixPermissions"))
  {
    os_unfair_lock_lock_with_options();
    NSUInteger v6 = self->_fileAttributes;
    if (v6 != fileAttributes)
    {

      self->_fileAttributes = (NSDictionary *)-[NSDictionary copy](fileAttributes, "copy");
      self->_attributesMustBeWrittenSoNoHardLinking = 1;
    }

    os_unfair_lock_unlock(&self->_propertyLock);
  }

  else
  {
    NSUInteger v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ *** file attributes cannot be nil and must contain at least NSFileType and NSFilePosixPermissions.", _NSFullMethodName((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v7);
    -[NSFileWrapper fileAttributes](v8, v9);
  }

- (NSDictionary)fileAttributes
{
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  if (_CFAppVersionCheckLessThan() || _CFAppVersionCheckLessThan())
  {
    id v4 = (NSDictionary *)-[NSDictionary mutableCopy](self->_fileAttributes, "mutableCopy");
    id v5 = -[NSDictionary objectForKey:](v4, "objectForKey:", @"NSFileHFSCreatorCode");
    id v6 = -[NSDictionary objectForKey:](v4, "objectForKey:", @"NSFileHFSTypeCode");
  }

  else
  {
    id v4 = self->_fileAttributes;
  }

  os_unfair_lock_unlock(p_propertyLock);
  return v4;
}

+ (BOOL)_forPath:(id)a3 getItemKind:(id *)a4 modificationDate:(id *)a5
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  int v7 = lstat((const char *)[a3 fileSystemRepresentation], &v11);
  if (!v7)
  {
    if (a4)
    {
      else {
        SEL v9 = (id *)off_189CA2950[v8];
      }
      *a4 = *v9;
    }

    if (a5) {
      *a5 = (id)[MEMORY[0x189603F50] dateWithTimeIntervalSince1970:(double)v11.st_mtimespec.tv_sec];
    }
  }

  return v7 == 0;
}

- (BOOL)_matchesItemKind:(id)a3 modificationDate:(id)a4
{
  id v7 = -[NSDictionary fileModificationDate]( -[NSFileWrapper fileAttributes](self, "fileAttributes"),  "fileModificationDate");
  BOOL result = 0;
  if (a4 && v7)
  {
    [a4 timeIntervalSinceReferenceDate];
    double v10 = v9;
    [v7 timeIntervalSinceReferenceDate];
    return vabdd_f64(v10, v11) < 1.0
        && ([a3 isEqualToString:@"NSFileTypeDirectory"]
         && -[NSFileWrapper isDirectory](self, "isDirectory")
         || [a3 isEqualToString:@"NSFileTypeRegular"]
         && -[NSFileWrapper isRegularFile](self, "isRegularFile")
  }

  return result;
}

- (BOOL)matchesContentsOfURL:(NSURL *)url
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v4 = [(id)objc_opt_class() _pathForURL:url reading:1 error:0];
  if (v4)
  {
    id v5 = (void *)v4;
    LODWORD(v4) = [(id)objc_opt_class() _forPath:v4 getItemKind:&v17 modificationDate:&v16];
    if ((_DWORD)v4)
    {
      LODWORD(v4) = -[NSFileWrapper _matchesItemKind:modificationDate:]( self,  "_matchesItemKind:modificationDate:",  v17,  v16);
      if ((_DWORD)v4)
      {
        if (-[NSFileWrapper isDirectory](self, "isDirectory")
          && (id contents = self->_contents,
              __int128 v19 = 0u,
              __int128 v20 = 0u,
              __int128 v21 = 0u,
              __int128 v22 = 0u,
              (uint64_t v7 = [contents countByEnumeratingWithState:&v19 objects:v18 count:16]) != 0))
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v20;
          while (2)
          {
            for (uint64_t i = 0LL; i != v8; ++i)
            {
              if (*(void *)v20 != v9) {
                objc_enumerationMutation(contents);
              }
              uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
              uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
              __int128 v13 = (void *)[contents objectForKey:v11];
              __int128 v14 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189604030]),  "initFileURLWithPath:",  objc_msgSend(v5, "stringByAppendingPathComponent:", v11));
              LODWORD(v13) = [v13 matchesContentsOfURL:v14];

              -[NSAutoreleasePool drain](v12, "drain");
              if (!(_DWORD)v13)
              {
                LOBYTE(v4) = 0;
                return v4;
              }
            }

            uint64_t v8 = [contents countByEnumeratingWithState:&v19 objects:v18 count:16];
            LOBYTE(v4) = 1;
            if (v8) {
              continue;
            }
            break;
          }
        }

        else
        {
          LOBYTE(v4) = 1;
        }
      }
    }
  }

  return v4;
}

+ (BOOL)_canSafelyMapFilesAtPath:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  int IsSafeForMapping = [a3 getFileSystemRepresentation:v11 maxLength:1024];
  if (IsSafeForMapping)
  {
    uint64_t v10 = 0LL;
    uint64_t v7 = 0LL;
    uint64_t v8 = 5LL;
    uint64_t v9 = 2147500032LL;
    int v4 = getattrlist(v11, &v8, &v7, 8uLL, 0);
    LOBYTE(IsSafeForMapping) = 0;
    if (!v4 && (WORD2(v7) & 0x1200) == 0x1000)
    {
      int IsSafeForMapping = _NSFileCompressionTypeIsSafeForMapping((uint64_t)v11);
      if (IsSafeForMapping)
      {
        uint64_t v9 = 0LL;
        uint64_t v10 = 0LL;
        uint64_t v8 = 0x4000000000000005LL;
        if (getattrlist(v11, &v8, &v7, 8uLL, 1u)) {
          BOOL v5 = 0;
        }
        else {
          BOOL v5 = HIDWORD(v7) == 1;
        }
        LOBYTE(IsSafeForMapping) = !v5;
      }
    }
  }

  return IsSafeForMapping;
}

+ (id)_newContentsAtURL:(id)a3 path:(id)a4 itemKind:(id)a5 oldChildrenByUniqueFileName:(id)a6 options:(unint64_t)a7 error:(id *)a8
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  __int128 v14 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  if ([a5 isEqualToString:@"NSFileTypeDirectory"])
  {
    uint64_t v15 = -[NSFileManager contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:]( v14,  "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:",  a3,  0LL,  0LL,  a8);
    if (v15)
    {
      uint64_t v16 = (void *)v15;
      id v17 = objc_alloc_init(MEMORY[0x189603FA8]);
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      uint64_t v18 = [v16 countByEnumeratingWithState:&v49 objects:v48 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        __int128 v20 = 0LL;
        unint64_t v41 = a7 | 0x100;
        uint64_t v42 = *(void *)v50;
        id v37 = v17;
        v38 = a8;
        id v39 = a6;
        while (2)
        {
          for (uint64_t i = 0LL; i != v19; ++i)
          {
            if (*(void *)v50 != v42) {
              objc_enumerationMutation(v16);
            }
            __int128 v22 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            uint64_t v23 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
            uint64_t v24 = (void *)[v22 lastPathComponent];
            if (!v20)
            {
              __int128 v20 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FE0]),  "initWithCapacity:",  objc_msgSend(v16, "count"));
              __int128 v44 = 0u;
              __int128 v45 = 0u;
              __int128 v46 = 0u;
              __int128 v47 = 0u;
              uint64_t v25 = [v16 countByEnumeratingWithState:&v44 objects:v43 count:16];
              if (v25)
              {
                uint64_t v26 = v25;
                uint64_t v27 = *(void *)v45;
                do
                {
                  for (uint64_t j = 0LL; j != v26; ++j)
                  {
                    if (*(void *)v45 != v27) {
                      objc_enumerationMutation(v16);
                    }
                    uint64_t v29 = objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * j), "lastPathComponent", v37, v38);
                    if (v29) {
                      [v20 addObject:v29];
                    }
                  }

                  uint64_t v26 = [v16 countByEnumeratingWithState:&v44 objects:v43 count:16];
                }

                while (v26);
                id v17 = v37;
                a8 = v38;
              }

              a6 = v39;
            }

            if ((objc_msgSend(v20, "containsObject:", objc_msgSend(v24, "stringByDeletingPathExtension", v37, v38)) & 1) == 0)
            {
LABEL_47:
              if (v24 && (v30 = (void *)[a6 objectForKey:v24]) != 0)
              {
                [a6 removeObjectForKey:v24];
              }

              else
              {
                uint64_t v31 = [objc_alloc((Class)a1) initWithURL:v22 options:v41 error:a8];
                if (!v31)
                {
LABEL_36:
                  if (a8)
                  {
                    id v35 = *a8;
                    -[NSAutoreleasePool drain](v23, "drain");
                    id v36 = *a8;
                  }

                  else
                  {
                    -[NSAutoreleasePool drain](v23, "drain");
                  }

                  return 0LL;
                }

                v32 = (void *)v31;
                [v17 addObject:v31];
              }
            }

            -[NSAutoreleasePool drain](v23, "drain", v37, v38);
          }

          uint64_t v19 = [v16 countByEnumeratingWithState:&v49 objects:v48 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      return v17;
    }

    return 0LL;
  }

  if ([a5 isEqualToString:@"NSFileTypeRegular"]) {
    return (id)[objc_alloc(MEMORY[0x189603F48]) initWithContentsOfURL:a3 options:~(a7 >> 1) & 1 error:a8];
  }
  if ([a5 isEqualToString:@"NSFileTypeSymbolicLink"])
  {
    uint64_t v34 = -[NSFileManager destinationOfSymbolicLinkAtPath:error:](v14, "destinationOfSymbolicLinkAtPath:error:", a4, a8);
    if (v34) {
      return (id)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:v34];
    }
    return 0LL;
  }

  if (!a8) {
    return 0LL;
  }
  id v17 = 0LL;
  *a8 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(5LL, (uint64_t)a3, 1, 0LL, 0LL);
  return v17;
}

- (BOOL)_readContentsFromURL:(id)a3 path:(id)a4 itemKind:(id)a5 options:(unint64_t)a6 error:(id *)a7
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  int v13 = [a3 startAccessingSecurityScopedResource];
  if (!a4)
  {
    a4 = (id)[(id)objc_opt_class() _pathForURL:a3 reading:1 error:a7];
    if (!a4)
    {
      BOOL v27 = 0;
      if (!v13) {
        return v27;
      }
      goto LABEL_30;
    }
  }

  if (-[NSFileWrapper isDirectory](self, "isDirectory")) {
    __int128 v14 = (void *)[self->_contents mutableCopy];
  }
  else {
    __int128 v14 = 0LL;
  }
  uint64_t v15 = [(id)objc_opt_class() _newContentsAtURL:a3 path:a4 itemKind:a5 oldChildrenByUniqueFileName:v14 options:a6 error:a7];
  unint64_t v16 = a6 & 0x100 | v15;
  BOOL v17 = v16 == 0;
  if (v16)
  {
    uint64_t v18 = (void *)v15;
    int v29 = v13;
    if (a7 && !v15) {
      *a7 = 0LL;
    }
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    uint64_t v19 = [v14 countByEnumeratingWithState:&v36 objects:v35 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v37;
      do
      {
        for (uint64_t i = 0LL; i != v20; ++i)
        {
          if (*(void *)v37 != v21) {
            objc_enumerationMutation(v14);
          }
          -[NSFileWrapper _removeChild:forUniqueFileName:]( self,  "_removeChild:forUniqueFileName:",  [v14 objectForKey:*(void *)(*((void *)&v36 + 1) + 8 * i)],  *(void *)(*((void *)&v36 + 1) + 8 * i));
        }

        uint64_t v20 = [v14 countByEnumeratingWithState:&v36 objects:v35 count:16];
      }

      while (v20);
    }

    if ([a5 isEqualToString:@"NSFileTypeDirectory"])
    {
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      uint64_t v23 = [v18 countByEnumeratingWithState:&v31 objects:v30 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v32;
        do
        {
          for (uint64_t j = 0LL; j != v24; ++j)
          {
            if (*(void *)v32 != v25) {
              objc_enumerationMutation(v18);
            }
            -[NSFileWrapper _addChild:forUniqueFileName:]( self,  "_addChild:forUniqueFileName:",  *(void *)(*((void *)&v31 + 1) + 8 * j),  0LL);
          }

          uint64_t v24 = [v18 countByEnumeratingWithState:&v31 objects:v30 count:16];
        }

        while (v24);
      }

      int v13 = v29;
      if (v18 && !self->_contents) {
        -[NSFileWrapper _initDirectoryContents](self, "_initDirectoryContents");
      }
    }

    else
    {

      self->_id contents = v18;
      int v13 = v29;
    }
  }

  BOOL v27 = !v17;

  if (v13) {
LABEL_30:
  }
    [a3 stopAccessingSecurityScopedResource];
  return v27;
}

- (BOOL)readFromURL:(NSURL *)url options:(NSFileWrapperReadingOptions)options error:(NSError *)outError
{
  id v9 = (id)[(id)objc_opt_class() _pathForURL:url reading:1 error:outError];
  if (v9)
  {
    id v10 = v9;
    if ((options & 0x202) == 0)
    {
      int v11 = [(id)objc_opt_class() _canSafelyMapFilesAtPath:v9];
      NSFileWrapperReadingOptions v12 = options | 2;
      if (v11) {
        NSFileWrapperReadingOptions v12 = options;
      }
      options = v12 | 0x200;
    }

    int v13 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
    id v9 = -[NSFileManager _attributesOfItemAtURL:filterResourceFork:error:]( v13,  "_attributesOfItemAtURL:filterResourceFork:error:",  url,  0LL,  outError);
    if (v9)
    {
      __int128 v14 = v9;
      id contents = self->_contents;
      if (contents)
      {
        if (!-[NSFileWrapper _matchesItemKind:modificationDate:]( self,  "_matchesItemKind:modificationDate:",  [v9 fileType],  objc_msgSend(v9, "fileModificationDate"))
          || -[NSFileWrapper isDirectory](self, "isDirectory"))
        {
LABEL_13:
          LODWORD(v9) = -[NSFileWrapper _readContentsFromURL:path:itemKind:options:error:]( self,  "_readContentsFromURL:path:itemKind:options:error:",  url,  v10,  [v14 fileType],  options,  outError);
          if (!(_DWORD)v9) {
            return (char)v9;
          }
LABEL_19:
          -[NSFileWrapper setFileAttributes:](self, "setFileAttributes:", v14);
          self->_attributesMustBeWrittenSoNoHardLinking = 0;

          self->_cachedDirectoryChildrenAsDictionary = 0LL;
          LOBYTE(v9) = 1;
          return (char)v9;
        }

        LOBYTE(contents) = self->_contents != 0LL;
      }

      if ((options & 1) != 0) {
        goto LABEL_19;
      }
      if (url)
      {
        if (-[NSFileManager isReadableFileAtPath:](v13, "isReadableFileAtPath:", v10))
        {

          self->_contentsURL = url;
          self->_contentsMustBeReadWithoutMapping = (options & 2) != 0;
          goto LABEL_19;
        }

        if (outError)
        {
          uint64_t v16 = 13LL;
          BOOL v17 = url;
          goto LABEL_25;
        }
      }

      else if (outError)
      {
        uint64_t v16 = 2LL;
        BOOL v17 = 0LL;
LABEL_25:
        uint64_t v18 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v16, (uint64_t)v17, 1, 0LL, 0LL);
        LOBYTE(v9) = 0;
        *outError = v18;
        return (char)v9;
      }

      LOBYTE(v9) = 0;
    }
  }

  return (char)v9;
}

- (BOOL)_forWritingToURL:(id)a3 returnContentsLazyReadingError:(id *)a4
{
  if (a4)
  {
    contentsLazyReadingError = self->_contentsLazyReadingError;
    if (contentsLazyReadingError) {
      uint64_t v7 = contentsLazyReadingError;
    }
    else {
      uint64_t v7 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(9LL, (uint64_t)a3, 0, 0LL, 0LL);
    }
    *a4 = v7;
  }

  self->_contentsLazyReadingError = 0LL;
  return 0;
}

- (BOOL)_writeContentsToURL:(id)a3 path:(id)a4 originalContentsURL:(id)a5 tryHardLinking:(BOOL)a6 didHardLinking:(BOOL *)a7 error:(id *)a8
{
  BOOL v10 = a6;
  uint64_t v61 = *MEMORY[0x1895F89C0];
  __int128 v14 = (void *)objc_opt_class();
  uint64_t v15 = v14;
  if (a5)
  {
    uint64_t v16 = (void *)[v14 _pathForURL:a5 reading:1 error:0];
    if (!a7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  uint64_t v16 = 0LL;
  if (a7) {
LABEL_3:
  }
    *a7 = 0;
LABEL_4:
  BOOL v17 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  if (!-[NSFileWrapper isDirectory](self, "isDirectory"))
  {
    if (-[NSFileWrapper isRegularFile](self, "isRegularFile"))
    {
      BOOL v37 = 0;
      if (v16 && v10)
      {
        if (!self->_attributesMustBeWrittenSoNoHardLinking
          && [v15 _forPath:v16 getItemKind:&v55 modificationDate:&v54]
          && -[NSFileWrapper _matchesItemKind:modificationDate:](self, "_matchesItemKind:modificationDate:", v55, v54))
        {
          int v38 = link( (const char *)[v16 fileSystemRepresentation],  (const char *)objc_msgSend(a4, "fileSystemRepresentation"));
          if (a7 && !v38)
          {
            BOOL result = 1;
            *a7 = 1;
            return result;
          }

          BOOL v37 = v38 == 0;
          if (!v38) {
            return 1;
          }
        }

        else
        {
          BOOL v37 = 0;
        }
      }

      self->_contentsLazyReadingError = 0LL;
      unint64_t v41 = -[NSFileWrapper regularFileContents](self, "regularFileContents");
      if (v41) {
        return -[NSData writeToURL:options:error:](v41, "writeToURL:options:error:", a3, 0LL, a8);
      }
      else {
        -[NSFileWrapper _forWritingToURL:returnContentsLazyReadingError:]( self,  "_forWritingToURL:returnContentsLazyReadingError:",  a3,  a8);
      }
      return v37;
    }

    if (-[NSFileWrapper isSymbolicLink](self, "isSymbolicLink"))
    {

      self->_contentsLazyReadingError = 0LL;
      __int128 v39 = -[NSFileWrapper symbolicLinkDestinationURL](self, "symbolicLinkDestinationURL");
      if (v39) {
        return -[NSFileManager createSymbolicLinkAtPath:withDestinationPath:error:]( v17,  "createSymbolicLinkAtPath:withDestinationPath:error:",  a4,  -[NSURL relativePath](v39, "relativePath"),  a8);
      }
      -[NSFileWrapper _forWritingToURL:returnContentsLazyReadingError:]( self,  "_forWritingToURL:returnContentsLazyReadingError:",  a3,  a8);
    }

    else if (a8)
    {
      uint64_t v40 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(5LL, (uint64_t)a3, 1, 0LL, 0LL);
      BOOL result = 0;
      *a8 = v40;
      return result;
    }

    return 0;
  }

  __int128 v51 = v17;
  if (!-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v17,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  a4,  0LL,  0LL,  a8))
  {
LABEL_51:
    -[NSFileManager removeItemAtPath:error:](v51, "removeItemAtPath:error:", a4, 0LL);
    return 0;
  }

  self->_contentsLazyReadingError = 0LL;
  uint64_t v18 = -[NSFileWrapper fileWrappers](self, "fileWrappers");
  if (!v18)
  {
    -[NSFileWrapper _forWritingToURL:returnContentsLazyReadingError:]( self,  "_forWritingToURL:returnContentsLazyReadingError:",  a3,  a8);
    goto LABEL_51;
  }

  uint64_t v19 = v18;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  uint64_t v52 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v57,  v56,  16LL);
  if (!v52) {
    return 1;
  }
  uint64_t v20 = *(void *)v58;
  uint64_t v50 = *(void *)v58;
  while (2)
  {
    uint64_t v21 = 0LL;
    do
    {
      if (*(void *)v58 != v20) {
        objc_enumerationMutation(v19);
      }
      uint64_t v22 = *(void *)(*((void *)&v57 + 1) + 8 * v21);
      uint64_t v23 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
      id v24 = -[NSDictionary objectForKey:](v19, "objectForKey:", v22);
      uint64_t v25 = [v24 isDirectory];
      uint64_t v26 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189604030]),  "initFileURLWithPath:isDirectory:",  objc_msgSend(a4, "stringByAppendingPathComponent:", v22),  v25);
      if (v16 && (uint64_t v27 = [v24 filename]) != 0)
      {
        uint64_t v28 = v27;
        int v29 = a8;
        id v30 = objc_alloc(MEMORY[0x189604030]);
        uint64_t v31 = [v16 stringByAppendingPathComponent:v28];
        __int128 v32 = v30;
        a8 = v29;
        uint64_t v20 = v50;
        __int128 v33 = (void *)[v32 initFileURLWithPath:v31 isDirectory:v25];
      }

      else
      {
        __int128 v33 = 0LL;
      }

      int v34 = [v24 writeToURL:v26 options:256 originalContentsURL:v33 error:a8];

      if (a8 && (v34 & 1) == 0)
      {
        if (*a8)
        {
          uint64_t v42 = (void *)[*a8 domain];
          uint64_t v43 = [*a8 code];
          if ([v42 isEqualToString:@"NSCocoaErrorDomain"] && v43 == 640)
          {
            __int128 v44 = a8;
            __int128 v45 = objc_alloc(&OBJC_CLASS___NSError);
            uint64_t v46 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  a4,  @"NSFilePath",  *v44,  @"NSUnderlyingError",  0);
            __int128 v47 = v45;
            a8 = v44;
            *__int128 v44 = -[NSError initWithDomain:code:userInfo:](v47, "initWithDomain:code:userInfo:", v42, 640LL, v46);
          }

          else
          {
            id v48 = *a8;
          }
        }

        -[NSAutoreleasePool drain](v23, "drain");
        id v49 = *a8;
        goto LABEL_51;
      }

      -[NSAutoreleasePool drain](v23, "drain");
      if (!v34) {
        goto LABEL_51;
      }
      ++v21;
    }

    while (v52 != v21);
    uint64_t v35 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v57,  v56,  16LL);
    BOOL result = 1;
    uint64_t v52 = v35;
    if (v35) {
      continue;
    }
    return result;
  }

- (id)_attributesToWrite
{
  v13[5] = *MEMORY[0x1895F89C0];
  v3 = (void *)[MEMORY[0x189603FC8] dictionary];
  int v4 = -[NSFileWrapper fileAttributes](self, "fileAttributes");
  if ((objc_msgSend(-[NSDictionary fileType](v4, "fileType"), "isEqualToString:", @"NSFileTypeSymbolicLink") & 1) == 0)
  {
    uint64_t v5 = -[NSDictionary objectForKey:](v4, "objectForKey:", @"NSFileCreationDate");
    if (v5) {
      [v3 setObject:v5 forKey:@"NSFileCreationDate"];
    }
    uint64_t v6 = -[NSDictionary objectForKey:](v4, "objectForKey:", @"NSFileModificationDate");
    if (v6) {
      [v3 setObject:v6 forKey:@"NSFileModificationDate"];
    }
    uint64_t v7 = -[NSDictionary objectForKey:](v4, "objectForKey:", @"NSFileExtensionHidden");
    if (v7) {
      [v3 setObject:v7 forKey:@"NSFileExtensionHidden"];
    }
    id v8 = -[NSDictionary objectForKey:](v4, "objectForKey:", @"NSFilePosixPermissions");
    if (v8) {
      objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithUnsignedLong:]( NSNumber,  "numberWithUnsignedLong:",  objc_msgSend(v8, "unsignedLongValue") & ~+[NSPageData _umask](NSPageData, "_umask")),  @"NSFilePosixPermissions");
    }
    uint64_t v9 = -[NSDictionary objectForKey:](v4, "objectForKey:", @"NSFileExtendedAttributes");
    if (v9) {
      [v3 setObject:v9 forKey:@"NSFileExtendedAttributes"];
    }
  }

  if (objc_msgSend( -[NSDictionary fileType](v4, "fileType"),  "isEqualToString:",  @"NSFileTypeRegular"))
  {
    id v10 = -[NSDictionary objectForKey:](v4, "objectForKey:", @"NSFileHFSCreatorCode");
    id v11 = -[NSDictionary objectForKey:](v4, "objectForKey:", @"NSFileHFSTypeCode");
  }

  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __35__NSFileWrapper__attributesToWrite__block_invoke;
  v13[3] = &unk_189CA15A8;
  v13[4] = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v4, "enumerateKeysAndObjectsUsingBlock:", v13);
  return v3;
}

uint64_t __35__NSFileWrapper__attributesToWrite__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 hasPrefix:@"NSFile"];
  if ((result & 1) == 0) {
    return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
  }
  return result;
}

- (void)_updateDescendantFileNames
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (-[NSFileWrapper isDirectory](self, "isDirectory"))
  {
    v3 = -[NSFileWrapper fileWrappers](self, "fileWrappers");
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v4 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v10,  16LL);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0LL; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          id v9 = -[NSDictionary objectForKey:](v3, "objectForKey:", v8);
          [v9 setFilename:v8];
          [v9 _updateDescendantFileNames];
        }

        uint64_t v5 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v10,  16LL);
      }

      while (v5);
    }
  }

- (BOOL)writeToURL:(NSURL *)url options:(NSFileWrapperWritingOptions)options originalContentsURL:(NSURL *)originalContentsURL error:(NSError *)outError
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  __int128 v11 = (void *)[(id)objc_opt_class() _pathForURL:url reading:0 error:outError];
  if (!v11) {
    return (char)v11;
  }
  __int128 v12 = v11;
  __int128 v13 = (void *)objc_opt_class();
  if ((options & 1) != 0)
  {
    BOOL v15 = -[NSURL isEqual:](originalContentsURL, "isEqual:", url);
    __int128 v11 = (void *)[v13 _temporaryDirectoryURLForWritingToURL:url error:outError];
    if (!v11) {
      return (char)v11;
    }
    uint64_t v16 = v11;
    BOOL v17 = (void *)objc_msgSend( v11,  "URLByAppendingPathComponent:",  -[NSURL lastPathComponent](url, "lastPathComponent"));
    if (!-[NSFileWrapper _writeContentsToURL:path:originalContentsURL:tryHardLinking:didHardLinking:error:]( self,  "_writeContentsToURL:path:originalContentsURL:tryHardLinking:didHardLinking:error:",  v17,  [v17 path],  originalContentsURL,  (options >> 8) & 1,  &v22,  outError))
    {
LABEL_22:
      [v13 _removeTemporaryDirectoryAtURL:v16];
      LOBYTE(v11) = 0;
      return (char)v11;
    }

    if (v22) {
      id v18 = (id)[MEMORY[0x189603F68] dictionary];
    }
    else {
      id v18 = -[NSFileWrapper _attributesToWrite](self, "_attributesToWrite");
    }
    if (v15)
    {
      if (([v13 _finishWritingToURL:url byTakingContentsFromItemAtURL:v17 addingAttributes:v18 usingTemporaryDirectoryAtURL:v16 backupFileName:0 error:outError] & 1) == 0)
      {
LABEL_19:
        if (!-[NSFileManager removeItemAtURL:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtURL:error:",  v17,  &v21))
        {
          uint64_t v19 = (os_log_s *)_NSOSLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v24 = v17;
            __int16 v25 = 2112;
            uint64_t v26 = v21;
            _os_log_error_impl( &dword_182EB1000,  v19,  OS_LOG_TYPE_ERROR,  "NSFileWrapper could not delete the temporary item at %@. Here's the error:\n%@",  buf,  0x16u);
          }
        }

        goto LABEL_22;
      }
    }

    else if (([v13 _finishWritingToURL:url byMovingItemAtURL:v17 addingAttributes:v18 error:outError] & 1) == 0)
    {
      goto LABEL_19;
    }

    [v13 _removeTemporaryDirectoryAtURL:v16];
    if (!originalContentsURL) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

  LODWORD(v11) = -[NSFileWrapper _writeContentsToURL:path:originalContentsURL:tryHardLinking:didHardLinking:error:]( self,  "_writeContentsToURL:path:originalContentsURL:tryHardLinking:didHardLinking:error:",  url,  v12,  originalContentsURL,  (options >> 8) & 1,  buf,  outError);
  if (!(_DWORD)v11) {
    return (char)v11;
  }
  if (buf[0]) {
    id v14 = (id)[MEMORY[0x189603F68] dictionary];
  }
  else {
    id v14 = -[NSFileWrapper _attributesToWrite](self, "_attributesToWrite");
  }
  [v13 _writeAttributes:v14 toURL:url];
  if (!originalContentsURL) {
    goto LABEL_13;
  }
LABEL_12:
  self->_attributesMustBeWrittenSoNoHardLinking = 0;
LABEL_13:
  if ((options & 2) != 0) {
    -[NSFileWrapper _updateDescendantFileNames](self, "_updateDescendantFileNames");
  }
  LOBYTE(v11) = 1;
  return (char)v11;
}

- (id)_initWithImpl:(id)a3 preferredFileName:(id)a4 uniqueFileName:(id)a5 docInfo:(id)a6 iconData:(id)a7
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___NSFileWrapper;
  __int128 v11 = -[NSFileWrapper init](&v41, sel_init, a3, a4, a5, a6, a7);
  if (!v11) {
    return v11;
  }
  if (a6)
  {
    id v12 = objc_alloc(MEMORY[0x189603F68]);
    __int128 v13 = +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  *((unsigned __int16 *)a6 + 8));
    __int16 v14 = *((_WORD *)a6 + 9);
    if ((v14 & 4) != 0)
    {
      uint64_t v16 = &NSFileTypeSymbolicLink;
    }

    else
    {
      BOOL v15 = (v14 & 1) == 0;
      uint64_t v16 = &NSFileTypeDirectory;
      if (v15) {
        uint64_t v16 = &NSFileTypeRegular;
      }
    }

    v11->_fileAttributes = (NSDictionary *)objc_msgSend( v12,  "initWithObjectsAndKeys:",  v13,  @"NSFilePosixPermissions",  *v16,  @"NSFileType",  objc_msgSend( MEMORY[0x189603F50],  "dateWithTimeIntervalSince1970:",  (double)*((uint64_t *)a6 + 1)),  @"NSFileModificationDate",  0);
    if (a4) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v22 = [a5 rangeOfString:@"__#$!@%!#__"];
    if (v23) {
      id v21 = (id)[a5 substringFromIndex:v22 + v23];
    }
    else {
      id v21 = a5;
    }
    goto LABEL_17;
  }

  char isKindOfClass = objc_opt_isKindOfClass();
  id v18 = objc_alloc(MEMORY[0x189603F68]);
  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v19 = @"NSFileTypeDirectory";
    uint64_t v20 = 511LL;
  }

  else
  {
    uint64_t v19 = @"NSFileTypeRegular";
    uint64_t v20 = 438LL;
  }

  v11->_fileAttributes = (NSDictionary *)objc_msgSend( v18,  "initWithObjectsAndKeys:",  v19,  @"NSFileType",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v20),  @"NSFilePosixPermissions",  0);
  if (!a4) {
    goto LABEL_14;
  }
LABEL_11:
  id v21 = a4;
LABEL_17:
  v11->_preferredFileName = (NSString *)[v21 copy];
  v11->_fileName = (NSString *)[a5 copy];
  id v24 = -[NSDictionary fileType](v11->_fileAttributes, "fileType");
  if (![v24 isEqualToString:@"NSFileTypeDirectory"])
  {
    if ([v24 isEqualToString:@"NSFileTypeRegular"])
    {
      v11->_id contents = (id)[a3 data];
    }

    else if ([v24 isEqualToString:@"NSFileTypeSymbolicLink"])
    {
      int v38 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", a3, 4LL);
      v11->_id contents = (id)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:v38];
    }

    return v11;
  }

  __int16 v25 = (void *)objc_msgSend((id)objc_msgSend(a3, "allKeys"), "mutableCopy");
  if (![v25 count])
  {
LABEL_31:

    if (!v11->_contents) {
      -[NSFileWrapper _initDirectoryContents](v11, "_initDirectoryContents");
    }
    return v11;
  }

  while (1)
  {
    uint64_t v26 = (void *)[v25 objectAtIndex:0];
    if ([v26 isEqualToString:0x189CAB2E8]) {
      goto LABEL_30;
    }
    if ((_validateFilename(v26) & 1) == 0) {
      break;
    }
    if (objc_msgSend((id)objc_msgSend(v26, "pathExtension"), "isEqualToString:", @"tiff")
      && (uint64_t v27 = [v26 stringByDeletingPathExtension],
          uint64_t v28 = [v25 indexOfObject:v27],
          v28 != 0x7FFFFFFFFFFFFFFFLL))
    {
      uint64_t v35 = v28;
      uint64_t v36 = objc_msgSend( objc_alloc((Class)objc_opt_class()),  "_initWithImpl:preferredFileName:uniqueFileName:docInfo:iconData:",  objc_msgSend(a3, "objectForKey:", v27),  0,  v27,  objc_msgSend(a3, "_getDocInfoForKey:", v27),  objc_msgSend(a3, "objectForKey:", v26));
      if (!v36) {
        goto LABEL_39;
      }
      BOOL v37 = (void *)v36;
      -[NSFileWrapper _addChild:forUniqueFileName:](v11, "_addChild:forUniqueFileName:", v36, v27);

      [v25 removeObjectAtIndex:v35];
    }

    else
    {
      uint64_t v29 = [v26 stringByAppendingPathExtension:@"tiff"];
      uint64_t v30 = [v25 indexOfObject:v29];
      if (v30 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v31 = 0LL;
      }

      else
      {
        uint64_t v32 = v30;
        uint64_t v31 = [a3 objectForKey:v29];
        [v25 removeObjectAtIndex:v32];
      }

      uint64_t v33 = objc_msgSend( objc_alloc((Class)objc_opt_class()),  "_initWithImpl:preferredFileName:uniqueFileName:docInfo:iconData:",  objc_msgSend(a3, "objectForKey:", v26),  0,  v26,  objc_msgSend(a3, "_getDocInfoForKey:", v26),  v31);
      if (!v33) {
        goto LABEL_39;
      }
      int v34 = (void *)v33;
      -[NSFileWrapper _addChild:forUniqueFileName:](v11, "_addChild:forUniqueFileName:", v33, v26);
    }

- (id)_newImpl
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (-[NSFileWrapper isDirectory](self, "isDirectory"))
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSRTFD);
    uint64_t v4 = -[NSFileWrapper fileWrappers](self, "fileWrappers");
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    uint64_t v5 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v16,  v15,  16LL);
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          id v10 = -[NSDictionary objectForKey:](v4, "objectForKey:", v9);
          __int128 v11 = (void *)[v10 _newImpl];
          id v12 = _NSDocInfoFromFileAttributes((NSDocInfo *)[v10 fileAttributes], 1);
          -[NSRTFD setObject:forKey:](v3, "setObject:forKey:", v11, v9);
          if (v12) {
            objc_msgSend(-[NSRTFD getDirInfo:](v3, "getDirInfo:", 1), "setObject:forKey:", v12, v9);
          }
        }

        uint64_t v6 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v16,  v15,  16LL);
      }

      while (v6);
    }
  }

  else if (-[NSFileWrapper isRegularFile](self, "isRegularFile"))
  {
    v3 = -[NSFileWrapper regularFileContents](self, "regularFileContents");
    if (v3) {
      return -[NSPageData initWithDataNoCopy:](objc_alloc(&OBJC_CLASS___NSPageData), "initWithDataNoCopy:", v3);
    }
  }

  else
  {
    if (-[NSFileWrapper isSymbolicLink](self, "isSymbolicLink"))
    {
      __int16 v14 = -[NSFileWrapper symbolicLinkDestinationURL](self, "symbolicLinkDestinationURL");
      if (v14) {
        return -[NSPageData initWithData:]( [NSPageData alloc],  "initWithData:",  objc_msgSend( -[NSURL relativePath](v14, "relativePath"),  "dataUsingEncoding:allowLossyConversion:",  4,  1));
      }
    }

    return 0LL;
  }

  return v3;
}

- (NSData)serializedRepresentation
{
  v3 = -[NSFileWrapper _newImpl](self, "_newImpl");
  BOOL v4 = -[NSFileWrapper isDirectory](self, "isDirectory");
  uint64_t v5 = v3;
  if (!v4)
  {
    uint64_t v6 = -[NSFileWrapper zone](self, "zone");
    uint64_t v7 = _NSDocInfoFromFileAttributes((NSDocInfo *)self->_fileAttributes, 0);
    uint64_t v5 = -[NSRTFD init](+[NSRTFD allocWithZone:](&OBJC_CLASS___NSRTFD, "allocWithZone:", v6), "init");
    -[NSRTFD setObject:forKey:](v5, "setObject:forKey:", v3, 0x189CB8808LL);
    if (v7)
    {
      *(&v7->mode + 1) |= 2u;
      objc_msgSend(-[NSRTFD getDirInfo:](v5, "getDirInfo:", 1), "setObject:forKey:", v7, 0x189CB8808);
    }
  }

  if (self->_preferredFileName)
  {
    uint64_t v8 = -[NSPageData initWithData:]( +[NSData allocWithZone:](&OBJC_CLASS___NSPageData, "allocWithZone:", -[NSFileWrapper zone](self, "zone")),  "initWithData:",  -[NSString dataUsingEncoding:allowLossyConversion:]( self->_preferredFileName,  "dataUsingEncoding:allowLossyConversion:",  2LL,  1LL));
    -[NSRTFD setObject:forKey:](v5, "setObject:forKey:", v8, @"__@PreferredName@__");

    uint64_t v9 = -[NSPageData initWithData:]( +[NSData allocWithZone:](&OBJC_CLASS___NSPageData, "allocWithZone:", -[NSFileWrapper zone](self, "zone")),  "initWithData:",  -[NSString dataUsingEncoding:allowLossyConversion:]( self->_preferredFileName,  "dataUsingEncoding:allowLossyConversion:",  4LL,  1LL));
    -[NSRTFD setObject:forKey:](v5, "setObject:forKey:", v9, @"__@UTF8PreferredName@__");
  }

  id v10 = -[NSRTFD dataRepresentation](v5, "dataRepresentation");
  if (self->_preferredFileName)
  {
    -[NSRTFD removeObjectForKey:](v5, "removeObjectForKey:", @"__@PreferredName@__");
    -[NSRTFD removeObjectForKey:](v5, "removeObjectForKey:", @"__@UTF8PreferredName@__");
  }

  if (!v4) {

  }
  return v10;
}

- (void)_addParent:(id)a3
{
  parents = self->_parents;
  if (!parents)
  {
    parents = +[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable");
    self->_parents = parents;
  }

  -[NSHashTable addObject:](parents, "addObject:", a3);
  os_unfair_lock_unlock(&NSFileWrapperLock);
}

- (void)_removeParent:(id)a3
{
}

- (void)_initDirectoryContents
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  __int128 v2 = *(_OWORD *)(MEMORY[0x189605240] + 16LL);
  *(_OWORD *)&v3.version = *MEMORY[0x189605240];
  *(_OWORD *)&v3.release = v2;
  v3.equal = (CFDictionaryEqualCallBack)NSFileWrapperChildNameIsEqual_CFDictionary;
  v3.hash = (CFDictionaryHashCallBack)NSFileWrapperChildNameHash_CFDictionary;
  self->_id contents = CFDictionaryCreateMutable(0LL, 0LL, &v3, MEMORY[0x189605250]);
}

- (id)_addChild:(id)a3 forUniqueFileName:(id)a4
{
  id v4 = a4;
  if (!a4)
  {
    id v4 = (id)[a3 preferredFilename];
    uint64_t v7 = [self->_contents objectForKey:v4];
    if (!v4 || v7)
    {
      uint64_t v8 = 1LL;
      do
      {
        uint64_t v9 = v8 + 1;
        id v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu%@%@",  v8,  @"__#$!@%!#__",  v4);
        uint64_t v11 = [self->_contents objectForKey:v10];
        if (v10) {
          BOOL v12 = v11 == 0;
        }
        else {
          BOOL v12 = 0;
        }
        uint64_t v8 = v9;
      }

      while (!v12);
      id v4 = v10;
    }
  }

  id contents = self->_contents;
  if (!contents)
  {
    -[NSFileWrapper _initDirectoryContents](self, "_initDirectoryContents");
    id contents = self->_contents;
  }

  [contents setObject:a3 forKey:v4];
  [a3 _addParent:self];
  return v4;
}

- (void)_resetFileModificationDate
{
  CFDictionaryKeyCallBacks v3 = -[NSFileWrapper fileAttributes](self, "fileAttributes");
  if (-[NSDictionary objectForKey:](v3, "objectForKey:", @"NSFileModificationDate"))
  {
    id v4 = (id)-[NSDictionary mutableCopy](v3, "mutableCopy");
    [v4 removeObjectForKey:@"NSFileModificationDate"];
    -[NSFileWrapper setFileAttributes:](self, "setFileAttributes:", v4);
  }

- (NSString)addFileWrapper:(NSFileWrapper *)child
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v6 = -[NSFileWrapper preferredFilename](child, "preferredFilename");
  if (!-[NSFileWrapper isDirectory](self, "isDirectory"))
  {
    __int128 v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ *** this method is only for directory type NSFileWrappers.",  _NSFullMethodName((objc_class *)self, a2));
    __int16 v14 = (void *)MEMORY[0x189603F70];
    BOOL v15 = (void *)MEMORY[0x189603A58];
LABEL_16:
    objc_exception_throw((id)[v14 exceptionWithName:*v15 reason:v13 userInfo:0]);
  }

  if (!v6 || -[NSString isEqualToString:](v6, "isEqualToString:", &stru_189CA6A28))
  {
    __int128 v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ *** a document must have a preferredFilename before it can be added as the subdocument of another document.",  _NSFullMethodName((objc_class *)self, a2));
    __int16 v14 = (void *)MEMORY[0x189603F70];
    BOOL v15 = (void *)MEMORY[0x189603A60];
    goto LABEL_16;
  }

  if (!self->_contents)
  {
    contentsURL = self->_contentsURL;
    if (contentsURL)
    {
      if (!-[NSFileWrapper _readContentsFromURL:path:itemKind:options:error:]( self,  "_readContentsFromURL:path:itemKind:options:error:",  contentsURL,  0LL,  @"NSFileTypeDirectory",  2LL * self->_contentsMustBeReadWithoutMapping,  &v16)
        && (objc_msgSend( (id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"),  "BOOLForKey:",  @"NSFileWrapperLogsLess") & 1) == 0 && (addFileWrapper__alreadyWarned & 1) == 0)
      {
        addFileWrapper__alreadyWarned = 1;
        id v10 = (os_log_s *)_NSOSLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = _NSFullMethodName((objc_class *)self, a2);
          uint64_t v12 = [v16 localizedDescription];
          *(_DWORD *)buf = 138412546;
          __int128 v18 = v11;
          __int16 v19 = 2112;
          uint64_t v20 = v12;
          _os_log_error_impl( &dword_182EB1000,  v10,  OS_LOG_TYPE_ERROR,  "%@ tried to read the file wrapper's contents lazily but an error occurred: %@",  buf,  0x16u);
        }
      }
    }
  }

  uint64_t v7 = -[NSFileWrapper keyForFileWrapper:](self, "keyForFileWrapper:", child);
  if (!v7)
  {
    uint64_t v7 = -[NSFileWrapper _addChild:forUniqueFileName:](self, "_addChild:forUniqueFileName:", child, 0LL);
    -[NSFileWrapper _resetFileModificationDate](self, "_resetFileModificationDate");
  }

  self->_cachedDirectoryChildrenAsDictionary = 0LL;
  return v7;
}

- (NSString)addRegularFileWithContents:(NSData *)data preferredFilename:(NSString *)fileName
{
  if (-[NSFileWrapper isDirectory](self, "isDirectory"))
  {
    uint64_t result = (NSString *)[objc_alloc((Class)objc_opt_class()) initRegularFileWithContents:data];
    if (result)
    {
      uint64_t v9 = result;
      -[NSString setPreferredFilename:](result, "setPreferredFilename:", fileName);
      id v10 = -[NSFileWrapper addFileWrapper:](self, "addFileWrapper:", v9);

      return v10;
    }
  }

  else
  {
    uint64_t v11 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ *** this method is only for directory type NSFileWrappers", _NSFullMethodName((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v11);
    return (NSString *)-[NSFileWrapper _uniqueFileNameOfChild:](v12, v13, v14);
  }

  return result;
}

- (id)_uniqueFileNameOfChild:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id contents = self->_contents;
  uint64_t v6 = [contents countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (!v6) {
    return 0LL;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v14;
LABEL_3:
  uint64_t v9 = 0LL;
  while (1)
  {
    if (*(void *)v14 != v8) {
      objc_enumerationMutation(contents);
    }
    id v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
    if ((id)[self->_contents objectForKey:v10] == a3) {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [contents countByEnumeratingWithState:&v13 objects:v12 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (void)_removeChild:(id)a3 forUniqueFileName:(id)a4
{
}

- (void)removeFileWrapper:(NSFileWrapper *)child
{
  if (-[NSFileWrapper isDirectory](self, "isDirectory"))
  {
    id v6 = -[NSFileWrapper _uniqueFileNameOfChild:](self, "_uniqueFileNameOfChild:", child);
    if (v6)
    {
      -[NSFileWrapper _removeChild:forUniqueFileName:](self, "_removeChild:forUniqueFileName:", child, v6);
      -[NSFileWrapper _resetFileModificationDate](self, "_resetFileModificationDate");
    }

    self->_cachedDirectoryChildrenAsDictionary = 0LL;
  }

  else
  {
    uint64_t v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ *** this method is only for directory type NSFileWrappers", _NSFullMethodName((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v7);
    -[NSFileWrapper fileWrappers](v8, v9);
  }

- (NSDictionary)fileWrappers
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (!-[NSFileWrapper isDirectory](self, "isDirectory"))
  {
    SEL v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ *** this method is only for directory type NSFileWrappers", _NSFullMethodName((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }

  if (!self->_contents)
  {
    contentsURL = self->_contentsURL;
    if (contentsURL)
    {
      if (!-[NSFileWrapper _readContentsFromURL:path:itemKind:options:error:]( self,  "_readContentsFromURL:path:itemKind:options:error:",  contentsURL,  0LL,  @"NSFileTypeDirectory",  2LL * self->_contentsMustBeReadWithoutMapping,  &v10))
      {

        self->_contentsLazyReadingError = (NSError *)v10;
        if ((objc_msgSend( (id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"),  "BOOLForKey:",  @"NSFileWrapperLogsLess") & 1) == 0 && (fileWrappers_alreadyWarned & 1) == 0)
        {
          fileWrappers_alreadyWarned = 1;
          id v6 = (os_log_s *)_NSOSLog();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            uint64_t v7 = _NSFullMethodName((objc_class *)self, a2);
            uint64_t v8 = [v10 localizedDescription];
            *(_DWORD *)buf = 138412546;
            uint64_t v12 = v7;
            __int16 v13 = 2112;
            uint64_t v14 = v8;
            _os_log_error_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_ERROR,  "%@ tried to read the file wrapper's contents lazily but an error occurred: %@",  buf,  0x16u);
          }
        }
      }
    }
  }

  uint64_t result = self->_cachedDirectoryChildrenAsDictionary;
  if (!result)
  {
    uint64_t result = (NSDictionary *)[self->_contents copy];
    self->_cachedDirectoryChildrenAsDictionary = result;
  }

  return result;
}

- (NSString)keyForFileWrapper:(NSFileWrapper *)child
{
  if (-[NSFileWrapper isDirectory](self, "isDirectory")) {
    return (NSString *)-[NSFileWrapper _uniqueFileNameOfChild:](self, "_uniqueFileNameOfChild:", child);
  }
  uint64_t v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ *** this method is only for directory type NSFileWrappers", _NSFullMethodName((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v7);
  return (NSString *)-[NSFileWrapper regularFileContents](v8, v9);
}

- (NSData)regularFileContents
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (!-[NSFileWrapper isRegularFile](self, "isRegularFile"))
  {
    id v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ *** this method is only for regular file type NSFileWrappers", _NSFullMethodName((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v10);
  }

  id contents = self->_contents;
  if (!contents)
  {
    contentsURL = self->_contentsURL;
    if (contentsURL)
    {
      if (!-[NSFileWrapper _readContentsFromURL:path:itemKind:options:error:]( self,  "_readContentsFromURL:path:itemKind:options:error:",  contentsURL,  0LL,  @"NSFileTypeRegular",  2LL * self->_contentsMustBeReadWithoutMapping,  &v11))
      {

        self->_contentsLazyReadingError = (NSError *)v11;
        if ((objc_msgSend( (id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"),  "BOOLForKey:",  @"NSFileWrapperLogsLess") & 1) == 0 && (regularFileContents_alreadyWarned & 1) == 0)
        {
          regularFileContents_alreadyWarned = 1;
          id v6 = (os_log_s *)_NSOSLog();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            uint64_t v8 = _NSFullMethodName((objc_class *)self, a2);
            uint64_t v9 = [v11 localizedDescription];
            *(_DWORD *)buf = 138412546;
            __int16 v13 = v8;
            __int16 v14 = 2112;
            uint64_t v15 = v9;
            _os_log_error_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_ERROR,  "%@ tried to read the file wrapper's contents lazily but an error occurred: %@",  buf,  0x16u);
          }
        }
      }

      id contents = self->_contents;
    }

    else
    {
      id contents = 0LL;
    }
  }

  return (NSData *)contents;
}

- (NSURL)symbolicLinkDestinationURL
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (!-[NSFileWrapper isSymbolicLink](self, "isSymbolicLink"))
  {
    id v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ *** this method is only for symbolic link type NSFileWrappers", _NSFullMethodName((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v10);
  }

  id contents = self->_contents;
  if (!contents)
  {
    contentsURL = self->_contentsURL;
    if (contentsURL)
    {
      if (!-[NSFileWrapper _readContentsFromURL:path:itemKind:options:error:]( self,  "_readContentsFromURL:path:itemKind:options:error:",  contentsURL,  0LL,  @"NSFileTypeSymbolicLink",  2LL * self->_contentsMustBeReadWithoutMapping,  &v11))
      {

        self->_contentsLazyReadingError = (NSError *)v11;
        if ((objc_msgSend( (id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"),  "BOOLForKey:",  @"NSFileWrapperLogsLess") & 1) == 0 && (symbolicLinkDestinationURL_alreadyWarned & 1) == 0)
        {
          symbolicLinkDestinationURL_alreadyWarned = 1;
          id v6 = (os_log_s *)_NSOSLog();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            uint64_t v8 = _NSFullMethodName((objc_class *)self, a2);
            uint64_t v9 = [v11 localizedDescription];
            *(_DWORD *)buf = 138412546;
            __int16 v13 = v8;
            __int16 v14 = 2112;
            uint64_t v15 = v9;
            _os_log_error_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_ERROR,  "%@ tried to read the file wrapper's contents lazily but an error occurred: %@",  buf,  0x16u);
          }
        }
      }

      id contents = self->_contents;
    }

    else
    {
      id contents = 0LL;
    }
  }

  return (NSURL *)contents;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = -[NSFileWrapper serializedRepresentation](self, "serializedRepresentation");
  else {
    [a3 encodeObject:v4];
  }
}

- (NSFileWrapper)initWithCoder:(NSCoder *)inCoder
{
  if (-[NSCoder allowsKeyedCoding](inCoder, "allowsKeyedCoding")) {
    id v5 = -[NSCoder decodeObjectOfClass:forKey:]( inCoder,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NSFileWrapperData");
  }
  else {
    id v5 = -[NSCoder decodeObject](inCoder, "decodeObject");
  }
  if (v5) {
    return -[NSFileWrapper initWithSerializedRepresentation:](self, "initWithSerializedRepresentation:", v5);
  }

  return 0LL;
}

+ (id)_pathForURL:(id)a3 reading:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  if (![a3 isFileURL])
  {
    if (!a5) {
      return 0LL;
    }
    if (a3) {
      uint64_t v10 = [MEMORY[0x189603F68] dictionaryWithObject:a3 forKey:@"NSURL"];
    }
    else {
      uint64_t v10 = 0LL;
    }
    if (v6) {
      uint64_t v11 = 262LL;
    }
    else {
      uint64_t v11 = 518LL;
    }
    goto LABEL_16;
  }

  id result = (id)[a3 path];
  if (a5 && !result)
  {
    if (v6) {
      uint64_t v9 = 260LL;
    }
    else {
      uint64_t v9 = 4LL;
    }
    uint64_t v10 = [MEMORY[0x189603F68] dictionaryWithObject:a3 forKey:@"NSURL"];
    uint64_t v11 = v9;
LABEL_16:
    uint64_t v12 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  v11,  v10);
    id result = 0LL;
    *a5 = v12;
  }

  return result;
}

+ (id)_temporaryDirectoryURLForWritingToURL:(id)a3 error:(id *)a4
{
  return -[NSFileManager URLForDirectory:inDomain:appropriateForURL:create:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "URLForDirectory:inDomain:appropriateForURL:create:error:",  99LL,  1LL,  a3,  1LL,  a4);
}

+ (void)_writeAttributes:(id)a3 toURL:(id)a4
{
  v10[6] = *MEMORY[0x1895F89C0];
  BOOL v6 = (void *)[MEMORY[0x189603FC8] dictionary];
  uint64_t v7 = [MEMORY[0x189603FC8] dictionary];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __61__NSFileWrapper_NSInternalForAppKit___writeAttributes_toURL___block_invoke;
  v10[3] = &unk_189CA2930;
  v10[4] = v6;
  v10[5] = v7;
  [a3 enumerateKeysAndObjectsUsingBlock:v10];
  uint64_t v8 = (void *)[v6 objectForKey:@"NSFileExtensionHidden"];
  if ([v6 count] != (v8 != 0) || objc_msgSend(v8, "BOOLValue"))
  {
    uint64_t v9 = [a4 path];
    if (v9) {
      -[NSFileManager setAttributes:ofItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "setAttributes:ofItemAtPath:error:",  v6,  v9,  0LL);
    }
  }

  [a4 setResourceValues:v7 error:0];
}

uint64_t __61__NSFileWrapper_NSInternalForAppKit___writeAttributes_toURL___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t result = _NSIsNSString();
  if ((_DWORD)result)
  {
    int v7 = [a2 hasPrefix:@"NSFile"];
    uint64_t v8 = 40LL;
    if (v7) {
      uint64_t v8 = 32LL;
    }
    return [*(id *)(a1 + v8) setObject:a3 forKey:a2];
  }

  return result;
}

+ (BOOL)_finishWritingToURL:(id)a3 byMovingItemAtURL:(id)a4 addingAttributes:(id)a5 error:(id *)a6
{
  uint64_t v11 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  uint64_t v12 = [a3 path];
  if (!-[NSFileManager fileExistsAtPath:](v11, "fileExistsAtPath:", v12)
    || (BOOL v13 = -[NSFileManager removeItemAtPath:error:](v11, "removeItemAtPath:error:", v12, a6)))
  {
    [a1 _writeAttributes:a5 toURL:a4];
    LOBYTE(v13) = -[NSFileManager moveItemAtPath:toPath:error:]( v11,  "moveItemAtPath:toPath:error:",  [a4 path],  v12,  a6);
  }

  return v13;
}

+ (BOOL)_finishWritingToURL:(id)a3 byTakingContentsFromItemAtURL:(id)a4 addingAttributes:(id)a5 usingTemporaryDirectoryAtURL:(id)a6 backupFileName:(id)a7 error:(id *)a8
{
  BOOL v11 = -[NSFileManager replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager", a3, a4, a5, a6),  "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:",  a3,  a4,  a7,  2LL * (a7 != 0LL),  0LL,  a8);
  if (v11) {
    [a1 _writeAttributes:a5 toURL:a3];
  }
  return v11;
}

+ (void)_removeTemporaryDirectoryAtURL:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v4 = (void *)[a3 path];
  if (v4)
  {
    id v5 = v4;
    int v6 = *__error();
    int v7 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      uint64_t v9 = v5;
      __int16 v10 = 1024;
      int v11 = v6;
      _os_log_error_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_ERROR,  "AppKit called rmdir(%@), it didn't return 0, and errno was set to %i.",  (uint8_t *)&v8,  0x12u);
    }
  }

  -[NSFileManager removeItemAtURL:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtURL:error:",  a3,  0LL);
}

- (id)_fullDescription:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 50LL);
  _NSDescribeFileContentsInstance(v5, (id *)&self->super.isa, 0LL, 0LL, v3);
  return v5;
}

@end