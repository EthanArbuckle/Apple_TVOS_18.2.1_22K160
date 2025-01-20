@interface AAPSyncStatePersistence
- (AAPSyncState)state;
- (NSURL)URL;
- (id)_errWithCode:(int64_t)a3 desc:(id)a4 err:(id)a5;
- (id)_fileManager;
- (id)_generateURLIfNeededWithError:(id *)a3;
- (id)load;
- (id)reset;
- (id)save:(id)a3;
- (void)dealloc;
- (void)setURL:(id)a3;
@end

@implementation AAPSyncStatePersistence

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AAPSyncStatePersistence;
  -[AAPSyncStatePersistence dealloc](&v3, "dealloc");
}

- (NSURL)URL
{
  return (NSURL *)-[AAPSyncStatePersistence _generateURLIfNeededWithError:](self, "_generateURLIfNeededWithError:", 0LL);
}

- (void)setURL:(id)a3
{
  url = self->_url;
  if (url != a3 && (-[NSURL isEqual:](url, "isEqual:") & 1) == 0)
  {

    self->_url = (NSURL *)[a3 copy];
  }

- (id)load
{
  v15 = 0LL;
  id v3 = -[AAPSyncStatePersistence _generateURLIfNeededWithError:](self, "_generateURLIfNeededWithError:", &v15);
  if (v15)
  {
    v4 = @"could not create saved state URL";
    v5 = self;
    uint64_t v6 = 101LL;
LABEL_3:
    id v7 = -[AAPSyncStatePersistence _errWithCode:desc:err:](v5, "_errWithCode:desc:err:", v6, v4);
    goto LABEL_4;
  }

  v10 = v3;
  v11 = +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v3,  2LL,  &v15);
  if (!v11)
  {
    if (!objc_msgSend( -[AAPSyncStatePersistence _fileManager](self, "_fileManager"),  "fileExistsAtPath:",  objc_msgSend(v10, "path")))
    {
      v8 = 0LL;
      goto LABEL_5;
    }

    v4 = @"could not read saved state";
    v5 = self;
    uint64_t v6 = 102LL;
    goto LABEL_3;
  }

  uint64_t v14 = 0LL;
  id v12 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___AAPSyncState),  v11,  &v14);
  if (v14)
  {
    id v7 = -[AAPSyncStatePersistence _errWithCode:desc:err:]( self,  "_errWithCode:desc:err:",  105LL,  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"saved state was corrupted - error -> %@",  v14),  0LL);
  }

  else
  {
    v8 = v12;
    if (v12)
    {
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___AAPSyncState);
      if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0) {
        goto LABEL_5;
      }
      id v7 = -[AAPSyncStatePersistence _errWithCode:desc:err:]( self,  "_errWithCode:desc:err:",  104LL,  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"saved state was in an unexpected format - tossing -> %@",  v8),  0LL);
    }

    else
    {
      id v7 = -[AAPSyncStatePersistence _errWithCode:desc:err:]( self,  "_errWithCode:desc:err:",  103LL,  @"saved state was badly defined - tossing",  0LL);
    }
  }

- (id)save:(id)a3
{
  id v13 = 0LL;
  if (!a3) {
    return -[AAPSyncStatePersistence _errWithCode:desc:err:]( self,  "_errWithCode:desc:err:",  201LL,  @"could not save nil state",  0LL);
  }
  id v5 = -[AAPSyncStatePersistence _generateURLIfNeededWithError:](self, "_generateURLIfNeededWithError:", &v13);
  if (v13)
  {
    uint64_t v6 = @"could not create saved state URL";
    id v7 = self;
    uint64_t v8 = 202LL;
  }

  else
  {
    id v10 = v5;
    if ((objc_msgSend( -[AAPSyncStatePersistence _fileManager](self, "_fileManager"),  "createDirectoryAtURL:withIntermediateDirectories:attributes:error:",  objc_msgSend(v5, "URLByDeletingLastPathComponent"),  1,  0,  &v13) & 1) == 0) {
      id v13 = -[AAPSyncStatePersistence _errWithCode:desc:err:]( self,  "_errWithCode:desc:err:",  203LL,  @"could not create the saved state parent directory",  v13);
    }
    uint64_t v12 = 0LL;
    v11 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  &v12);
    if (!v11 || v12)
    {
      uint64_t v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"could not archive state -> %@ -> error -> %@",  a3,  v12);
      id v7 = self;
      uint64_t v8 = 204LL;
    }

    else
    {
      if (-[NSData writeToURL:options:error:](v11, "writeToURL:options:error:", v10, 1LL, &v13))
      {

        self->_state = (AAPSyncState *)[a3 copy];
        return v13;
      }

      uint64_t v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"could not save state -> %@",  a3);
      id v7 = self;
      uint64_t v8 = 205LL;
    }
  }

  return -[AAPSyncStatePersistence _errWithCode:desc:err:](v7, "_errWithCode:desc:err:", v8, v6);
}

- (id)reset
{
  id v10 = 0LL;
  id v3 = -[AAPSyncStatePersistence _generateURLIfNeededWithError:](self, "_generateURLIfNeededWithError:", &v10);
  if (v10)
  {
    v4 = @"could not create saved state URL";
    id v5 = self;
    uint64_t v6 = 301LL;
    return -[AAPSyncStatePersistence _errWithCode:desc:err:](v5, "_errWithCode:desc:err:", v6, v4);
  }

  unsigned __int8 v7 = objc_msgSend( -[AAPSyncStatePersistence _fileManager](self, "_fileManager"),  "removeItemAtURL:error:",  v3,  &v10);
  uint64_t v8 = v10;
  if ((v7 & 1) == 0)
  {
    v4 = @"could not reset state";
    id v5 = self;
    uint64_t v6 = 302LL;
    return -[AAPSyncStatePersistence _errWithCode:desc:err:](v5, "_errWithCode:desc:err:", v6, v4);
  }

  return v8;
}

- (id)_fileManager
{
  id result = self->_fileManager;
  if (!result)
  {
    id result = objc_alloc_init(&OBJC_CLASS___NSFileManager);
    self->_fileManager = (NSFileManager *)result;
    if (!result)
    {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncStatePersistence.m",  144LL,  @"failed to create fileManager");
      return self->_fileManager;
    }
  }

  return result;
}

- (id)_generateURLIfNeededWithError:(id *)a3
{
  url = self->_url;
  if (!url)
  {
    -[AAPSyncStatePersistence setURL:]( self,  "setURL:",  objc_msgSend( objc_msgSend( -[AAPSyncStatePersistence _fileManager](self, "_fileManager"),  "URLForDirectory:inDomain:appropriateForURL:create:error:",  5,  1,  0,  0,  a3),  "URLByAppendingPathComponent:isDirectory:",  @"Assistant/com.apple.siri.applications.laststate.plist",  0));
    url = self->_url;
  }

  return url;
}

- (id)_errWithCode:(int64_t)a3 desc:(id)a4 err:(id)a5
{
  v9 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 2LL);
  id v10 = v9;
  if (a4) {
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a4, NSLocalizedDescriptionKey);
  }
  if (a5) {
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", a5, NSUnderlyingErrorKey);
  }
  v11 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  [(id)objc_opt_class(self) description],  a3,  v10);

  return v11;
}

- (AAPSyncState)state
{
  return self->_state;
}

@end