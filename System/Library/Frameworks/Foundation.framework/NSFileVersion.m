@interface NSFileVersion
+ (BOOL)_isTemporaryStorageRequiredForGSError:(id)a3 andURL:(id)a4;
+ (BOOL)_permanentVersionStorageSupportedForURL:(id)a3 temporaryStorageIdentifier:(id *)a4 error:(id *)a5;
+ (BOOL)_removeOtherVersionsOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4 error:(id *)a5;
+ (BOOL)removeOtherVersionsOfItemAtURL:(NSURL *)url error:(NSError *)outError;
+ (BOOL)unresolvedConflictsExistForItemAtURL:(id)a3;
+ (NSArray)otherVersionsOfItemAtURL:(NSURL *)url;
+ (NSArray)unresolvedConflictVersionsOfItemAtURL:(NSURL *)url;
+ (NSFileVersion)addVersionOfItemAtURL:(NSURL *)url withContentsOfURL:(NSURL *)contentsURL options:(NSFileVersionAddingOptions)options error:(NSError *)outError;
+ (NSFileVersion)currentVersionOfItemAtURL:(NSURL *)url;
+ (NSFileVersion)versionOfItemAtURL:(NSURL *)url forPersistentIdentifier:(id)persistentIdentifier;
+ (NSURL)temporaryDirectoryURLForNewVersionOfItemAtURL:(NSURL *)url;
+ (id)_addVersionOfItemAtURL:(id)a3 withContentsOfURL:(id)a4 options:(unint64_t)a5 temporaryStorageIdentifier:(id *)a6 error:(id *)a7;
+ (id)_addVersionOfItemAtURL:(id)a3 withContentsOfURL:(id)a4 options:(unint64_t)a5 userInfo:(id)a6 temporaryStorageIdentifier:(id *)a7 error:(id *)a8;
+ (id)_autosaveDirectoryURLCreateIfNecessary:(BOOL)a3;
+ (id)_existingLibraryForURL:(id)a3 temporaryStorageIdentifier:(id)a4;
+ (id)_libraryForURL:(id)a3 temporaryStorageIdentifier:(id *)a4;
+ (id)_makePermanentStorageLibraryForURL:(id)a3 temporaryStorageRequired:(BOOL *)a4 error:(id *)a5;
+ (id)_makeTemporaryStorageIdentifier;
+ (id)_otherNonpurgeableVersionsOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4;
+ (id)_otherVersionsOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4;
+ (id)_otherVersionsOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4 withoutOptions:(unint64_t)a5;
+ (id)_supportedGenerationalStorageClientIDs;
+ (id)_temporaryDirectoryURLForNewVersionOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4;
+ (id)_temporaryStorageLocationForIdentifier:(id)a3;
+ (id)_versionOfItemAtURL:(id)a3 forClientID:(id)a4 name:(id)a5 temporaryStorageIdentifier:(id)a6 evenIfDeleted:(BOOL)a7;
+ (id)_versionOfItemAtURL:(id)a3 forPersistentIdentifier:(id)a4 temporaryStorageIdentifier:(id)a5;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
+ (void)_addConflictObserverForItemAtURL:(id)a3 statusChangedHandler:(id)a4;
+ (void)_markConflicts:(id)a3 asHandledForItemAtURL:(id)a4;
+ (void)_removeTemporaryDirectoryAtURL:(id)a3;
+ (void)getNonlocalVersionsOfItemAtURL:(NSURL *)url completionHandler:(void *)completionHandler;
+ (void)getNonlocalVersionsOfItemAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
+ (void)getNonlocalVersionsOfItemFromBRAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
+ (void)getNonlocalVersionsOfItemFromFPAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (BOOL)_isBackup;
- (BOOL)_preserveConflictVersionLocally;
- (BOOL)_setDocumentInfo:(id)a3;
- (BOOL)hasLocalContents;
- (BOOL)hasThumbnail;
- (BOOL)isConflict;
- (BOOL)isDiscardable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isResolved;
- (BOOL)isUbiquitous;
- (BOOL)removeAndReturnError:(NSError *)outError;
- (NSDate)modificationDate;
- (NSFileVersion)init;
- (NSPersonNameComponents)originatorNameComponents;
- (NSString)etag;
- (NSString)localizedName;
- (NSString)localizedNameOfSavingComputer;
- (NSString)originalPOSIXName;
- (NSString)originatorName;
- (NSURL)URL;
- (NSURL)replaceItemAtURL:(NSURL *)url options:(NSFileVersionReplacingOptions)options error:(NSError *)error;
- (id)_documentInfo;
- (id)_initWithAddition:(id)a3;
- (id)_initWithFileURL:(id)a3 library:(id)a4 clientID:(id)a5 name:(id)a6 contentsURL:(id)a7 isBackup:(BOOL)a8 revision:(id)a9;
- (id)description;
- (id)persistentIdentifier;
- (id)restoreOverItemAtURL:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (unint64_t)size;
- (void)_overrideModificationDateWithDate:(id)a3;
- (void)dealloc;
- (void)setDiscardable:(BOOL)discardable;
- (void)setResolved:(BOOL)resolved;
@end

@implementation NSFileVersion

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NSFileVersion;
  return objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingValueForKey_, a3);
}

- (NSFileVersion)init
{
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"-[NSFileVersion init]: You have to use one of the factory methods to instantiate NSFileVersion." userInfo:0]);
  -[NSFileVersion dealloc](v2, v3);
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileVersion;
  -[NSFileVersion dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    return objc_msgSend( -[NSFileVersion persistentIdentifier](self, "persistentIdentifier"),  "isEqual:",  objc_msgSend(a3, "persistentIdentifier"));
  }
  return 0;
}

- (unint64_t)hash
{
  return objc_msgSend(-[NSFileVersion persistentIdentifier](self, "persistentIdentifier"), "hash");
}

- (id)description
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (self->_nonLocalVersion)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___NSFileVersion;
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ type:NonLocal forURL:'%@', %@",  -[NSFileVersion description](&v8, sel_description),  -[NSURL path](self->_fileURL, "path"),  self->_nonLocalVersion,  v5,  v6);
  }

  else
  {
    if (self->_isBackup)
    {
      uint64_t v4 = @"Backup";
    }

    else if (self->_deadVersionIdentifier)
    {
      uint64_t v4 = @"Dead";
    }

    else if (-[NSFileVersion isConflict](self, "isConflict"))
    {
      uint64_t v4 = @"Conflict";
    }

    else
    {
      uint64_t v4 = @"Local";
    }

    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___NSFileVersion;
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ type:%@ forURL:'%@' contentsURL:'%@' name:'%@'",  -[NSFileVersion description](&v7, sel_description),  v4,  -[NSURL path](self->_fileURL, "path"),  -[NSURL path](self->_contentsURL, "path"),  self->_localizedName);
  }

+ (NSFileVersion)currentVersionOfItemAtURL:(NSURL *)url
{
  if (-[NSURL checkResourceIsReachableAndReturnError:](url, "checkResourceIsReachableAndReturnError:", 0LL)) {
    return (NSFileVersion *)(id)[objc_alloc((Class)a1) _initWithFileURL:url library:0 clientID:0 name:0 contentsURL:url isBackup:0 revision:0];
  }
  else {
    return 0LL;
  }
}

+ (NSArray)otherVersionsOfItemAtURL:(NSURL *)url
{
  return (NSArray *)[a1 _otherVersionsOfItemAtURL:url temporaryStorageIdentifier:0];
}

+ (void)getNonlocalVersionsOfItemAtURL:(NSURL *)url completionHandler:(void *)completionHandler
{
}

+ (NSFileVersion)versionOfItemAtURL:(NSURL *)url forPersistentIdentifier:(id)persistentIdentifier
{
  return (NSFileVersion *)[a1 _versionOfItemAtURL:url forPersistentIdentifier:persistentIdentifier temporaryStorageIdentifier:0];
}

+ (NSFileVersion)addVersionOfItemAtURL:(NSURL *)url withContentsOfURL:(NSURL *)contentsURL options:(NSFileVersionAddingOptions)options error:(NSError *)outError
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___NSFileVersion;
  objc_msgSendSuper2(&v7, sel_doesNotRecognizeSelector_, a2, contentsURL, options, outError);
  return 0LL;
}

+ (NSURL)temporaryDirectoryURLForNewVersionOfItemAtURL:(NSURL *)url
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSFileVersion;
  objc_msgSendSuper2(&v4, sel_doesNotRecognizeSelector_, a2);
  return 0LL;
}

+ (NSArray)unresolvedConflictVersionsOfItemAtURL:(NSURL *)url
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v17 = 0LL;
  uint64_t v5 = *MEMORY[0x189603D58];
  -[NSURL removeCachedResourceValueForKey:](url, "removeCachedResourceValueForKey:", *MEMORY[0x189603D58]);
  BOOL v6 = -[NSURL getResourceValue:forKey:error:](url, "getResourceValue:forKey:error:", &v17, v5, 0LL);
  objc_super v7 = 0LL;
  if (v6)
  {
    if ([v17 BOOLValue])
    {
      uint64_t v8 = (void *)[(id)gsDefaultStorageManager() permanentStorageForItemAtURL:url allocateIfNone:0 error:0];
      uint64_t v9 = (void *)objc_msgSend( (id)objc_msgSend( v8,  "enumeratorForAdditionsInNameSpace:withOptions:withoutOptions:ordering:",  @"com.apple.ubiquity",  0,  0,  0),  "allObjects");
      v10 = (void *)objc_msgSend( (id)objc_msgSend( v8,  "enumeratorForAdditionsInNameSpace:withOptions:withoutOptions:ordering:",  @"com.apple.FileProvider.conflict",  0,  0,  0),  "allObjects");
      if (v9) {
        v10 = (void *)[v9 arrayByAddingObjectsFromArray:v10];
      }
      if (v10)
      {
        objc_super v7 = (NSArray *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v18 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v20;
          do
          {
            for (uint64_t i = 0LL; i != v12; ++i)
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = (void *)[objc_alloc((Class)a1) _initWithAddition:*(void *)(*((void *)&v19 + 1) + 8 * i)];
              -[NSArray addObject:](v7, "addObject:", v15);
            }

            uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v18 count:16];
          }

          while (v12);
        }
      }

      else
      {
        return 0LL;
      }
    }

    else
    {
      return (NSArray *)MEMORY[0x189604A58];
    }
  }

  return v7;
}

- (NSURL)URL
{
  BOOL v3 = -[NSURL isFileReferenceURL](self->_contentsURL, "isFileReferenceURL");
  contentsURL = self->_contentsURL;
  if (v3) {
    return -[NSURL filePathURL](contentsURL, "filePathURL");
  }
  else {
    return contentsURL;
  }
}

- (NSString)originalPOSIXName
{
  if (self->_addition) {
    return (NSString *)-[GSAddition originalPOSIXName](self->_addition, "originalPOSIXName");
  }
  if (self->_nonLocalVersion || self->_isBackup || self->_deadVersionIdentifier) {
    return 0LL;
  }
  return -[NSURL lastPathComponent](self->_contentsURL, "lastPathComponent");
}

- (NSString)localizedName
{
  v4[1] = *MEMORY[0x1895F89C0];
  result = self->_localizedName;
  v4[0] = result;
  if (!result)
  {
    -[NSURL getResourceValue:forKey:error:]( self->_contentsURL,  "getResourceValue:forKey:error:",  v4,  *MEMORY[0x189603CE0],  0LL);
    return (NSString *)v4[0];
  }

  return result;
}

- (NSString)localizedNameOfSavingComputer
{
  return 0LL;
}

- (NSString)originatorName
{
  return 0LL;
}

- (NSPersonNameComponents)originatorNameComponents
{
  return 0LL;
}

- (NSDate)modificationDate
{
  v4[1] = *MEMORY[0x1895F89C0];
  result = self->_modificationDate;
  v4[0] = result;
  if (!result)
  {
    -[NSURL getResourceValue:forKey:error:]( self->_contentsURL,  "getResourceValue:forKey:error:",  v4,  *MEMORY[0x189603B70],  0LL);
    return (NSDate *)v4[0];
  }

  return result;
}

- (unint64_t)size
{
  if (self->_addition && (objc_opt_respondsToSelector() & 1) != 0) {
    return objc_msgSend( (id)-[GSAddition performSelector:](self->_addition, "performSelector:", sel_size),  "unsignedLongLongValue");
  }
  else {
    return 0LL;
  }
}

- (id)persistentIdentifier
{
  if (self->_addition)
  {
    addition = self->_addition;
    return (id)[addition persistentIdentifier];
  }

  if (self->_deadVersionIdentifier) {
    return self->_deadVersionIdentifier;
  }
  if (self->_isBackup)
  {
    id v4 = -[NSURL path](self->_contentsURL, "path");
    return (id)objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjectsAndKeys:", v4, @"path", 0);
  }

  else
  {
    addition = self->_nonLocalVersion;
    if (addition) {
      return (id)[addition persistentIdentifier];
    }
    return (id)[MEMORY[0x189603F68] dictionary];
  }

- (BOOL)isConflict
{
  if (objc_msgSend( (id)-[GSAddition nameSpace](self->_addition, "nameSpace"),  "isEqualToString:",  @"com.apple.ubiquity") & 1) != 0 || (objc_msgSend( (id)-[GSAddition nameSpace](self->_addition, "nameSpace"),  "isEqualToString:",  @"com.apple.FileProvider.conflict"))
  {
    return 1;
  }

  else
  {
    return -[GSAddition isSavedConflict](self->_addition, "isSavedConflict");
  }

- (BOOL)isUbiquitous
{
  return self->_nonLocalVersion != 0LL;
}

- (BOOL)hasLocalContents
{
  return self->_nonLocalVersion == 0LL;
}

- (BOOL)hasThumbnail
{
  return [self->_nonLocalVersion hasThumbnail];
}

- (NSString)etag
{
  return (NSString *)[self->_nonLocalVersion etag];
}

- (void)setResolved:(BOOL)resolved
{
  if (!resolved)
  {
    objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A60],  @"-[NSFileVersion setResolved:]: You can't make a conflict version unresolved once it's been resolved.",  0,  v3,  v4));
    -[NSFileVersion isResolved](v5, v6);
  }

- (BOOL)isResolved
{
  return -[GSAddition isSavedConflict](self->_addition, "isSavedConflict");
}

- (NSURL)replaceItemAtURL:(NSURL *)url options:(NSFileVersionReplacingOptions)options error:(NSError *)error
{
  objc_super v7 = url;
  uint64_t v25 = *MEMORY[0x1895F89C0];
  addition = self->_addition;
  if (addition)
  {
    v10 = (NSURL *)-[GSAddition replaceItemAtURL:error:](addition, "replaceItemAtURL:error:", url, error);
    if (v10)
    {
      if ((options & 1) != 0 && !-[NSFileVersion removeAndReturnError:](self, "removeAndReturnError:", 0LL))
      {
        uint64_t v11 = (os_log_s *)_NSOSLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( &dword_182EB1000,  v11,  OS_LOG_TYPE_ERROR,  "-[NSFileVersion replaceItemAtURL:options:error:] failed to remove the version that it replaced a file with.",  buf,  2u);
        }
      }

      goto LABEL_15;
    }

    return v10;
  }

  if (self->_nonLocalVersion)
  {
    uint64_t v12 = (void *)objc_msgSend( (id)objc_opt_class(),  "versionOfItemAtURL:forPersistentIdentifier:",  self->_fileURL,  objc_msgSend(self->_nonLocalVersion, "persistentIdentifier"));
    if (v12)
    {
      objc_super v7 = (NSURL *)[v12 replaceItemAtURL:v7 options:options error:error];
      goto LABEL_14;
    }

    v16 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v23 = 0;
      _os_log_error_impl( &dword_182EB1000,  v16,  OS_LOG_TYPE_ERROR,  "-[NSFileVersion replaceItemAtURL:optionsError:] for a non-local NSFileVersion failed. Did you forget a coordinated read?",  v23,  2u);
      if (error) {
        goto LABEL_19;
      }
    }

    else if (error)
    {
LABEL_19:
      v10 = 0LL;
      *error = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4LL,  0LL);
      return v10;
    }

    return 0LL;
  }

  if (self->_isBackup)
  {
    if ((options & 1) == 0)
    {
      uint64_t v13 = -[NSFileWrapper initWithURL:options:error:]( objc_alloc(&OBJC_CLASS___NSFileWrapper),  "initWithURL:options:error:",  self->_contentsURL,  0LL,  error);
      v10 = (NSURL *)v13;
      if (!v13) {
        return v10;
      }
      BOOL v14 = -[NSFileWrapper writeToURL:options:originalContentsURL:error:]( v13,  "writeToURL:options:originalContentsURL:error:",  v7,  1LL,  0LL,  error);

      v10 = 0LL;
      if (!v14) {
        return v10;
      }
LABEL_14:
      v10 = v7;
      if (v7) {
LABEL_15:
      }
        CFURLClearResourcePropertyCache((CFURLRef)v10);
      return v10;
    }

    id v17 = (void *)MEMORY[0x189603F70];
    uint64_t v18 = *MEMORY[0x189603A48];
    __int128 v19 = @"-[NSFileVersion replaceItemAtURL:options:error:]: NSFileVersionReplacingByMoving with this kind of version isn't supported.";
  }

  else
  {
    id v17 = (void *)MEMORY[0x189603F70];
    uint64_t v18 = *MEMORY[0x189603A48];
    __int128 v19 = @"-[NSFileVersion replaceItemAtURL:options:error:]: You can't use it with current versions.";
  }

  objc_exception_throw((id)[v17 exceptionWithName:v18 reason:v19 userInfo:0]);
  return (NSURL *)-[NSFileVersion removeAndReturnError:](v20, v21, v22);
}

- (BOOL)removeAndReturnError:(NSError *)outError
{
  v22[1] = *MEMORY[0x1895F89C0];
  if (!self->_addition)
  {
    if (self->_isBackup)
    {
      v10 = (os_log_s *)_NSOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v11 = "-[NSFileVersion removeAndReturnError:]: You can't use it with a backup version.";
        goto LABEL_18;
      }

uint64_t __38__NSFileVersion_removeAndReturnError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (!a3) {
    a3 = (void *)objc_msgSend((id)objc_msgSend(a2, "objectEnumerator"), "nextObject");
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)removeOtherVersionsOfItemAtURL:(NSURL *)url error:(NSError *)outError
{
  return [a1 _removeOtherVersionsOfItemAtURL:url temporaryStorageIdentifier:0 error:outError];
}

- (BOOL)isDiscardable
{
  return self->_discardable;
}

- (void)setDiscardable:(BOOL)discardable
{
  self->_discardable = discardable;
}

- (id)_initWithFileURL:(id)a3 library:(id)a4 clientID:(id)a5 name:(id)a6 contentsURL:(id)a7 isBackup:(BOOL)a8 revision:(id)a9
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___NSFileVersion;
  v15 = -[NSFileVersion init](&v20, sel_init);
  if (v15)
  {
    v15->_fileURL = (NSURL *)[a3 copy];
    v15->_contentsURL = (NSURL *)[a7 copy];
    v15->_isBackup = a8;
    v15->_name = (NSString *)[a6 copy];
    if (a4)
    {
      v16 = (void *)[(id)gsDefaultStorageManager() persistentIdentifierInStorage:a4 forAdditionNamed:a6 inNameSpace:a5];
      v15->_deadVersionIdentifier = v16;
      id v17 = v16;
    }

    if (v15->_isBackup)
    {
      if (-[NSURL getResourceValue:forKey:error:]( v15->_contentsURL,  "getResourceValue:forKey:error:",  &v19,  *MEMORY[0x189603CE0],  0LL))
      {
        v15->_localizedName = (NSString *)[v19 copy];
      }

      if (v15->_isBackup
        && -[NSURL getResourceValue:forKey:error:]( v15->_contentsURL,  "getResourceValue:forKey:error:",  &v19,  *MEMORY[0x189603B70],  0LL))
      {
        v15->_modificationDate = (NSDate *)[v19 copy];
      }
    }
  }

  return v15;
}

- (id)_initWithAddition:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSFileVersion;
  uint64_t v4 = -[NSFileVersion init](&v10, sel_init);
  if (v4)
  {
    uint64_t v5 = (GSAddition *)a3;
    v4->_addition = v5;
    v4->_fileURL = (NSURL *)objc_msgSend( (id)objc_msgSend((id)-[GSAddition storage](v5, "storage"), "documentURL"),  "copy");
    v4->_contentsURL = (NSURL *)(id)-[GSAddition url](v4->_addition, "url");
    v4->_isBackup = 0;
    SEL v6 = (NSString *)(id)-[GSAddition displayName](v4->_addition, "displayName");
    v4->_localizedName = v6;
    if (!v6
      && -[NSURL getResourceValue:forKey:error:]( v4->_fileURL,  "getResourceValue:forKey:error:",  &v9,  *MEMORY[0x189603CE0],  0LL))
    {
      v4->_localizedName = (NSString *)[v9 copy];
    }

    uint64_t v7 = (NSDate *)(id)objc_msgSend( -[NSFileVersion _documentInfo](v4, "_documentInfo"),  "objectForKey:",  @"modificationDate");
    v4->_modificationDate = v7;
    if (!v7
      && -[NSURL getResourceValue:forKey:error:]( v4->_contentsURL,  "getResourceValue:forKey:error:",  &v9,  *MEMORY[0x189603B70],  0LL))
    {
      v4->_modificationDate = (NSDate *)[v9 copy];
    }
  }

  return v4;
}

+ (void)getNonlocalVersionsOfItemFromBRAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
}

+ (void)getNonlocalVersionsOfItemFromFPAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
}

+ (void)getNonlocalVersionsOfItemAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
}

+ (id)_autosaveDirectoryURLCreateIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v4 = -[NSFileManager URLForDirectory:inDomain:appropriateForURL:create:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "URLForDirectory:inDomain:appropriateForURL:create:error:",  11LL,  1LL,  0LL,  a3,  &v8);
  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !v3;
  }
  if (!v5)
  {
    SEL v6 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v8;
      _os_log_error_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_ERROR,  "NSFileVersions's invocation of -[NSFileManager URLForDirectory:inDomain:appropriateForURL:create:error:] returne d nil for NSAutosavedInformationDirectory. Here's the error:\n %@",  buf,  0xCu);
    }
  }

  return v4;
}

+ (id)_temporaryStorageLocationForIdentifier:(id)a3
{
  return (id)objc_msgSend( (id)objc_msgSend((id)objc_opt_class(), "_autosaveDirectoryURLCreateIfNecessary:", 1),  "URLByAppendingPathComponent:",  objc_msgSend(a3, "stringByAppendingPathExtension:", @"genstore.noindex"));
}

+ (id)_supportedGenerationalStorageClientIDs
{
  return (id)objc_msgSend( MEMORY[0x189604010],  "setWithObjects:",  @"com.apple.documentVersions",  @"com.apple.ubiquity",  @"com.apple.FileProvider.conflict",  0);
}

+ (BOOL)_isTemporaryStorageRequiredForGSError:(id)a3 andURL:(id)a4
{
  if (a3
    && (SEL v6 = (void *)[a3 domain], objc_msgSend(v6, "isEqualToString:", _MergedGlobals_150))
    && [a3 code] != 5
    && [a3 code] == 2)
  {
    return [a4 checkResourceIsReachableAndReturnError:0];
  }

  else
  {
    return 1;
  }

+ (id)_makePermanentStorageLibraryForURL:(id)a3 temporaryStorageRequired:(BOOL *)a4 error:(id *)a5
{
  v12[1] = *MEMORY[0x1895F89C0];
  uint64_t v9 = [(id)gsDefaultStorageManager() permanentStorageForItemAtURL:a3 allocateIfNone:1 error:v12];
  uint64_t v10 = (void *)v9;
  if (a4)
  {
    if (!v9)
    {
      *a4 = [a1 _isTemporaryStorageRequiredForGSError:v12[0] andURL:a3];
      if (a5) {
        *a5 = (id)v12[0];
      }
    }
  }

  return v10;
}

+ (id)_makeTemporaryStorageIdentifier
{
  v2 = CFUUIDCreate(0LL);
  BOOL v3 = (id)CFUUIDCreateString(0LL, v2);
  CFRelease(v2);
  return (id)v3;
}

+ (BOOL)_permanentVersionStorageSupportedForURL:(id)a3 temporaryStorageIdentifier:(id *)a4 error:(id *)a5
{
  v11[1] = *MEMORY[0x1895F89C0];
  v11[0] = 0LL;
  char v9 = [(id)gsDefaultStorageManager() isPermanentStorageSupportedAtURL:a3 error:v11];
  if ((v9 & 1) == 0)
  {
    if (a5) {
      *a5 = (id)v11[0];
    }
  }

  return v9;
}

+ (id)_existingLibraryForURL:(id)a3 temporaryStorageIdentifier:(id)a4
{
  if (!a4) {
    return (id)[(id)gsDefaultStorageManager() permanentStorageForItemAtURL:a3 allocateIfNone:0 error:0];
  }
  BOOL v5 = (void *)[a1 _temporaryStorageLocationForIdentifier:a4];
  if ([v5 checkResourceIsReachableAndReturnError:0]) {
    return (id)[(id)gsDefaultStorageManager() temporaryStorageForItemAtURL:a3 locatedAtURL:v5 error:0];
  }
  else {
    return 0LL;
  }
}

+ (id)_libraryForURL:(id)a3 temporaryStorageIdentifier:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  char v13 = 0;
  uint64_t v12 = 0LL;
  if (a4 && [*a4 isEqualToString:@"com.apple.NSFileVersionTestTempID"])
  {
    BOOL v7 = 1;
    char v13 = 1;
  }

  else
  {
    id result = (id)objc_msgSend( a1,  "_makePermanentStorageLibraryForURL:temporaryStorageRequired:error:",  a3,  &v13,  0,  v12);
    if (result) {
      return result;
    }
    BOOL v7 = v13 != 0;
  }

  id result = 0LL;
  if (a4 && v7)
  {
    id v9 = *a4;
    if (!*a4) {
      id v9 = (id)[a1 _makeTemporaryStorageIdentifier];
    }
    id result = (id)objc_msgSend(a1, "_temporaryStorageLocationForIdentifier:", v9, v12);
    if (result)
    {
      id v10 = result;
      -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  [result path],  0,  0,  0);
      id result = (id)[(id)gsDefaultStorageManager() temporaryStorageForItemAtURL:a3 locatedAtURL:v10 error:&v12];
      if (result)
      {
        *a4 = v9;
      }

      else
      {
        uint64_t v11 = (os_log_s *)_NSOSLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v15 = v10;
          __int16 v16 = 2112;
          uint64_t v17 = v12;
          _os_log_error_impl( &dword_182EB1000,  v11,  OS_LOG_TYPE_ERROR,  "NSDocument could not create temporary version storage at %@. Here's the error:\n%@",  buf,  0x16u);
        }

        return 0LL;
      }
    }
  }

  return result;
}

+ (id)_otherVersionsOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4 withoutOptions:(unint64_t)a5
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  uint64_t v23 = (void *)[a1 _existingLibraryForURL:a3 temporaryStorageIdentifier:a4];
  if (!v23) {
    return (id)MEMORY[0x189604A58];
  }
  id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  uint64_t v7 = [&unk_189D1EED0 countByEnumeratingWithState:&v35 objects:v34 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v36;
    *(void *)&__int128 v8 = 138412546LL;
    __int128 v21 = v8;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(&unk_189D1EED0);
        }
        uint64_t v12 = (void *)objc_msgSend( v23,  "enumeratorForAdditionsInNameSpace:withOptions:withoutOptions:ordering:",  *(void *)(*((void *)&v35 + 1) + 8 * v11),  0,  a5,  0,  v21);
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v29 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v31;
          do
          {
            for (uint64_t i = 0LL; i != v14; ++i)
            {
              if (*(void *)v31 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = (void *)[objc_alloc((Class)a1) _initWithAddition:*(void *)(*((void *)&v30 + 1) + 8 * i)];
              [v6 addObject:v17];
            }

            uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v29 count:16];
          }

          while (v14);
        }

        if ([v12 error])
        {
          uint64_t v18 = (os_log_s *)_NSOSLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            uint64_t v19 = [v12 error];
            *(_DWORD *)buf = v21;
            id v26 = a3;
            __int16 v27 = 2112;
            uint64_t v28 = v19;
            _os_log_error_impl( &dword_182EB1000,  v18,  OS_LOG_TYPE_ERROR,  "Enumeration of versions for %@ failed. Here's the error:\n%@",  buf,  0x16u);
          }
        }

        ++v11;
      }

      while (v11 != v9);
      uint64_t v9 = [&unk_189D1EED0 countByEnumeratingWithState:&v35 objects:v34 count:16];
    }

    while (v9);
  }

  return v6;
}

+ (id)_otherVersionsOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4
{
  return (id)[a1 _otherVersionsOfItemAtURL:a3 temporaryStorageIdentifier:a4 withoutOptions:0];
}

+ (id)_otherNonpurgeableVersionsOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4
{
  return (id)[a1 _otherVersionsOfItemAtURL:a3 temporaryStorageIdentifier:a4 withoutOptions:8];
}

+ (id)_versionOfItemAtURL:(id)a3 forPersistentIdentifier:(id)a4 temporaryStorageIdentifier:(id)a5
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v21 = 0LL;
  uint64_t v9 = [(id)gsDefaultStorageManager() additionForItemAtURL:a3 forPersistentIdentifier:a4 error:&v21];
  if (v9)
  {
    uint64_t v10 = (void *)[objc_alloc((Class)a1) _initWithAddition:v9];
    return v10;
  }

  if (v21)
  {
    uint64_t v13 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = a4;
      __int16 v24 = 2112;
      uint64_t v25 = v21;
      _os_log_error_impl( &dword_182EB1000,  v13,  OS_LOG_TYPE_ERROR,  "Failed to get a GSAddition with persistent identifier: %@. Here's the error: %@",  buf,  0x16u);
    }

    return 0LL;
  }

  uint64_t v15 = [a4 objectForKey:@"clientID"];
  uint64_t v16 = [a4 objectForKey:@"name"];
  uint64_t v17 = [a4 objectForKey:@"path"];
  if (v15)
  {
    if (v16)
    {
      uint64_t v18 = [a1 _existingLibraryForURL:a3 temporaryStorageIdentifier:a5];
      if (v18)
      {
        uint64_t v19 = [(id)gsDefaultStorageManager() persistentIdentifierInStorage:v18 forAdditionNamed:v16 inNameSpace:v15];
        if (v19) {
          return (id)[a1 _versionOfItemAtURL:a3 forPersistentIdentifier:v19 temporaryStorageIdentifier:v19];
        }
      }
    }

    return 0LL;
  }

  if (!v17)
  {
    id v12 = 0LL;
    uint64_t v10 = (void *)[objc_alloc((Class)a1) _initWithFileURL:a3 library:0 clientID:0 name:0 contentsURL:a3 isBackup:0 revision:0];
    return v10;
  }

  objc_super v20 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:v17];
  id v12 = 0LL;
  if ([v20 checkResourceIsReachableAndReturnError:0]) {
    id v12 = (id)[objc_alloc((Class)a1) _initWithFileURL:a3 library:0 clientID:0 name:0 contentsURL:v20 isBackup:1 revision:0];
  }

  return v12;
}

+ (id)_addVersionOfItemAtURL:(id)a3 withContentsOfURL:(id)a4 options:(unint64_t)a5 userInfo:(id)a6 temporaryStorageIdentifier:(id *)a7 error:(id *)a8
{
  char v10 = a5;
  v53[1] = *MEMORY[0x1895F89C0];
  uint64_t v14 = [a1 _libraryForURL:a3 temporaryStorageIdentifier:a7];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    uint64_t v16 = (void *)[a4 path];
    uint64_t v17 = (void *)[v16 pathExtension];
    uint64_t v18 = -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString");
    if ([v17 length]) {
      uint64_t v18 = -[NSString stringByAppendingPathExtension:](v18, "stringByAppendingPathExtension:", v17);
    }
    uint64_t v19 = (void *)[MEMORY[0x189603FC8] dictionary];
    [v19 setObject:@"com.apple.documentVersions" forKey:qword_18C497230];
    [v19 setObject:v18 forKey:qword_18C497238];
    if (a6)
    {
      v52 = @"NSDocumentInfo";
      v53[0] = a6;
      uint64_t v20 = [MEMORY[0x189603F68] dictionaryWithObjects:v53 forKeys:&v52 count:1];
      [v19 setObject:v20 forKey:qword_18C497240];
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v48 = 0x3052000000LL;
    v49 = __Block_byref_object_copy__30;
    v50 = __Block_byref_object_dispose__30;
    uint64_t v51 = 0LL;
    uint64_t v35 = 0LL;
    __int128 v36 = &v35;
    uint64_t v37 = 0x3052000000LL;
    __int128 v38 = __Block_byref_object_copy__30;
    uint64_t v39 = __Block_byref_object_dispose__30;
    uint64_t v40 = 0LL;
    uint64_t v21 = [v15 prepareAdditionCreationWithItemAtURL:a4 byMoving:v10 & 1 creationInfo:v19 error:&v51];
    if (v21)
    {
      __int128 v22 = dispatch_semaphore_create(0LL);
      v34[0] = MEMORY[0x1895F87A8];
      v34[1] = 3221225472LL;
      v34[2] = __119__NSFileVersion_NSPrivate___addVersionOfItemAtURL_withContentsOfURL_options_userInfo_temporaryStorageIdentifier_error___block_invoke;
      v34[3] = &unk_189CA5778;
      v34[4] = a3;
      v34[5] = a1;
      v34[9] = &v35;
      v34[10] = &buf;
      v34[6] = v15;
      v34[7] = v21;
      v34[8] = v22;
      [v15 createAdditionStagedAtURL:v21 creationInfo:v19 completionHandler:v34];
      dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v22);
      id v23 = (void *)v36[5];
      if (v23)
      {
        id v24 = v23;
LABEL_24:
        _Block_object_dispose(&v35, 8);
        _Block_object_dispose(&buf, 8);
        return v24;
      }

      v29 = (os_log_s *)_NSOSLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = *(void *)(*((void *)&buf + 1) + 40LL);
        *(_DWORD *)v41 = 138412802;
        id v42 = a3;
        __int16 v43 = 2112;
        id v44 = a4;
        __int16 v45 = 2112;
        uint64_t v46 = v33;
        _os_log_error_impl( &dword_182EB1000,  v29,  OS_LOG_TYPE_ERROR,  "NSFileVersion tried to tried to add a new generation and failed. Versioned file URL: %@, contents URL: %@, error: %@",  v41,  0x20u);
      }

      __int128 v30 = *(void **)(*((void *)&buf + 1) + 40LL);
      if (a8)
      {
        id v28 = v30;
        goto LABEL_21;
      }

LABEL_23:
      id v24 = 0LL;
      goto LABEL_24;
    }

    __int16 v27 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = *(void *)(*((void *)&buf + 1) + 40LL);
      *(_DWORD *)v41 = 138412802;
      id v42 = a3;
      __int16 v43 = 2112;
      id v44 = a4;
      __int16 v45 = 2112;
      uint64_t v46 = v32;
      _os_log_error_impl( &dword_182EB1000,  v27,  OS_LOG_TYPE_ERROR,  "NSFileVersion tried to tried to add a new generation and failed. Versioned file URL: %@, contents URL: %@, error: %@",  v41,  0x20u);
      if (!a8) {
        goto LABEL_23;
      }
    }

    else if (!a8)
    {
      goto LABEL_23;
    }

    id v28 = *(id *)(*((void *)&buf + 1) + 40LL);
LABEL_21:
    id v24 = 0LL;
    *a8 = v28;
    goto LABEL_24;
  }

  uint64_t v25 = (os_log_s *)_NSOSLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_error_impl( &dword_182EB1000,  v25,  OS_LOG_TYPE_ERROR,  "NSFileVersion couldn't find the library for a file. URL: %@",  (uint8_t *)&buf,  0xCu);
    if (a8) {
      goto LABEL_13;
    }
    return 0LL;
  }

  if (!a8) {
    return 0LL;
  }
LABEL_13:
  uint64_t v26 = _NSErrorWithFilePath(512LL, (uint64_t)a3);
  id v24 = 0LL;
  *a8 = v26;
  return v24;
}

uint64_t __119__NSFileVersion_NSPrivate___addVersionOfItemAtURL_withContentsOfURL_options_userInfo_temporaryStorageIdentifier_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  if (a2)
  {
    +[NSFileCoordinator __itemAtURL:didGainVersionWithClientID:name:purposeID:]( NSFileCoordinator,  "__itemAtURL:didGainVersionWithClientID:name:purposeID:",  *(void *)(a1 + 32),  [a2 nameSpace],  objc_msgSend(a2, "name"),  0);
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [objc_alloc(*(Class *)(a1 + 40)) _initWithAddition:a2];
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL) = a3;
    [*(id *)(a1 + 48) cleanupStagingURL:*(void *)(a1 + 56)];
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

+ (id)_addVersionOfItemAtURL:(id)a3 withContentsOfURL:(id)a4 options:(unint64_t)a5 temporaryStorageIdentifier:(id *)a6 error:(id *)a7
{
  return (id)[a1 _addVersionOfItemAtURL:a3 withContentsOfURL:a4 options:a5 userInfo:0 temporaryStorageIdentifier:a6 error:a7];
}

+ (id)_temporaryDirectoryURLForNewVersionOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a4) {
    a3 = (id)[a1 _temporaryStorageLocationForIdentifier:a4];
  }
  if (a3)
  {
    a3 = -[NSFileManager URLForDirectory:inDomain:appropriateForURL:create:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "URLForDirectory:inDomain:appropriateForURL:create:error:",  99LL,  1LL,  a3,  1LL,  &v7);
    if (!a3)
    {
      BOOL v5 = (os_log_s *)_NSOSLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v9 = v7;
        _os_log_error_impl( &dword_182EB1000,  v5,  OS_LOG_TYPE_ERROR,  "NSFileVersion invoked -[NSFileManager URLForDirectory:inDomain:appropriateForURL:create:error:] and that faile d. Here's the error:\n %@",  buf,  0xCu);
      }
    }
  }

  return a3;
}

+ (BOOL)_removeOtherVersionsOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  uint64_t v7 = (void *)[a1 _existingLibraryForURL:a3 temporaryStorageIdentifier:a4];
  if (v7)
  {
    __int128 v8 = v7;
    uint64_t v23 = 0LL;
    id v24 = &v23;
    uint64_t v25 = 0x3052000000LL;
    uint64_t v26 = __Block_byref_object_copy__30;
    __int16 v27 = __Block_byref_object_dispose__30;
    uint64_t v28 = 0LL;
    uint64_t v9 = (void *)[v7 enumeratorForAdditionsInNameSpace:@"com.apple.documentVersions" withOptions:0 withoutOptions:0 ordering:0];
    uint64_t v10 = (void *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithArray:", objc_msgSend(v9, "allObjects"));
    if ([v9 error])
    {
      uint64_t v11 = (os_log_s *)_NSOSLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = [v9 error];
        *(_DWORD *)__int128 buf = 138412546;
        id v35 = a3;
        __int16 v36 = 2112;
        uint64_t v37 = v20;
        _os_log_error_impl( &dword_182EB1000,  v11,  OS_LOG_TYPE_ERROR,  "Enumeration of versions for %@ failed. Here's the error:\n%@",  buf,  0x16u);
      }
    }

    objc_lookUpClass("GSTemporaryStorage");
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ([(id)gsDefaultStorageManager() removeTemporaryStorage:v8 error:v24 + 5])
      {
LABEL_7:
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v29 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v31;
          do
          {
            for (uint64_t i = 0LL; i != v12; ++i)
            {
              if (*(void *)v31 != v13) {
                objc_enumerationMutation(v10);
              }
              +[NSFileCoordinator __itemAtURL:didLoseVersionWithClientID:name:purposeID:]( NSFileCoordinator,  "__itemAtURL:didLoseVersionWithClientID:name:purposeID:",  a3,  [*(id *)(*((void *)&v30 + 1) + 8 * i) nameSpace],  objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "name"),  0);
            }

            uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v29 count:16];
          }

          while (v12);
        }

        BOOL v15 = 1;
LABEL_21:
        _Block_object_dispose(&v23, 8);
        return v15;
      }
    }

    else
    {
      uint64_t v16 = dispatch_semaphore_create(0LL);
      v22[0] = MEMORY[0x1895F87A8];
      v22[1] = 3221225472LL;
      void v22[2] = __93__NSFileVersion_NSPrivate___removeOtherVersionsOfItemAtURL_temporaryStorageIdentifier_error___block_invoke;
      v22[3] = &unk_189CA57A0;
      v22[4] = v16;
      v22[5] = &v23;
      [v8 removeAllAdditionsForNamespaces:&unk_189D1EEE8 completionHandler:v22];
      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v16);
      id v17 = (id)v24[5];
      if (!v24[5]) {
        goto LABEL_7;
      }
    }

    uint64_t v18 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = v24[5];
      *(_DWORD *)__int128 buf = 138412546;
      id v35 = a3;
      __int16 v36 = 2112;
      uint64_t v37 = v21;
      _os_log_error_impl( &dword_182EB1000,  v18,  OS_LOG_TYPE_ERROR,  "NSFileVersion tried to tried to delete temporary version storage and failed. Versioned file URL: %@, error: %@",  buf,  0x16u);
    }

    BOOL v15 = 0;
    if (a5) {
      *a5 = (id)v24[5];
    }
    goto LABEL_21;
  }

  return 1;
}

id __93__NSFileVersion_NSPrivate___removeOtherVersionsOfItemAtURL_temporaryStorageIdentifier_error___block_invoke( uint64_t a1,  void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = result;
  return result;
}

+ (id)_versionOfItemAtURL:(id)a3 forClientID:(id)a4 name:(id)a5 temporaryStorageIdentifier:(id)a6 evenIfDeleted:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v12 = (void *)[a1 _existingLibraryForURL:a3 temporaryStorageIdentifier:a6];
  uint64_t v13 = [v12 additionWithName:a5 inNameSpace:a4 error:0];
  if (v13)
  {
    uint64_t v14 = (void *)[objc_alloc((Class)a1) _initWithAddition:v13];
  }

  else if (v7)
  {
    uint64_t v14 = (void *)[objc_alloc((Class)a1) _initWithFileURL:a3 library:v12 clientID:a4 name:a5 contentsURL:0 isBackup:0 revision:0];
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  return v14;
}

+ (void)_removeTemporaryDirectoryAtURL:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)[a3 path];
  if (v4)
  {
    BOOL v5 = v4;
    int v6 = *__error();
    BOOL v7 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      uint64_t v9 = v5;
      __int16 v10 = 1024;
      int v11 = v6;
      _os_log_error_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_ERROR,  "NSDocument called rmdir(%@), it didn't return 0, and errno was set to %{errno}d.",  (uint8_t *)&v8,  0x12u);
    }
  }

  -[NSFileManager removeItemAtURL:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtURL:error:",  a3,  0LL);
}

- (id)_documentInfo
{
  id result = (id)objc_msgSend( (id)-[GSAddition userInfo](self->_addition, "userInfo"),  "objectForKey:",  @"NSDocumentInfo");
  if (!result) {
    return (id)MEMORY[0x189604A60];
  }
  return result;
}

- (BOOL)_setDocumentInfo:(id)a3
{
  v6[1] = *MEMORY[0x1895F89C0];
  addition = self->_addition;
  BOOL v5 = @"NSDocumentInfo";
  v6[0] = a3;
  return -[GSAddition mergeUserInfo:error:]( addition,  "mergeUserInfo:error:",  [MEMORY[0x189603F68] dictionaryWithObjects:v6 forKeys:&v5 count:1],  0);
}

- (void)_overrideModificationDateWithDate:(id)a3
{
  if (self->_modificationDate != a3)
  {
    if (self->_addition)
    {
      id v5 = -[NSFileVersion _documentInfo](self, "_documentInfo");
      if (v5)
      {
        id v6 = (id)[v5 mutableCopy];
        [v6 setObject:a3 forKey:@"modificationDate"];
        if (-[NSFileVersion _setDocumentInfo:](self, "_setDocumentInfo:", v6))
        {

          self->_modificationDate = (NSDate *)[a3 copy];
        }
      }
    }
  }

- (BOOL)_isBackup
{
  return self->_isBackup;
}

- (BOOL)_preserveConflictVersionLocally
{
  if (-[NSFileVersion isConflict](self, "isConflict"))
  {
    -[NSFileVersion setResolved:](self, "setResolved:", 1LL);
    return 1;
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"-[NSFileVersion _preserveConflictVersionLocally]: You can only use it with conflict versions." userInfo:0]);
    return +[NSFileVersion versionsOfItemAtURL:](v4, v5, v6);
  }

- (id)restoreOverItemAtURL:(id)a3 error:(id *)a4
{
  return -[NSFileVersion replaceItemAtURL:options:error:](self, "replaceItemAtURL:options:error:", a3, 0LL, a4);
}

+ (BOOL)unresolvedConflictsExistForItemAtURL:(id)a3
{
  v5[1] = *(id *)MEMORY[0x1895F89C0];
  int v3 = [a3 getResourceValue:v5 forKey:*MEMORY[0x189603D58] error:0];
  if (v3) {
    LOBYTE(v3) = [v5[0] BOOLValue];
  }
  return v3;
}

+ (void)_markConflicts:(id)a3 asHandledForItemAtURL:(id)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: URL parameter may not be nil", NSStringFromSelector(a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v8++) setResolved:1];
      }

      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }

    while (v6);
  }

+ (void)_addConflictObserverForItemAtURL:(id)a3 statusChangedHandler:(id)a4
{
  return 0LL;
}

@end