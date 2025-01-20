@interface Copier
+ (id)copierWithSourceURL:(id)a3 uniqueIdentifier:(id)a4 destURL:(id)a5 sandboxExtension:(id)a6 callbackTarget:(id)a7 selector:(SEL)a8 options:(int)a9;
+ (id)inboxPath;
+ (id)sharedInstance;
- (BOOL)createDirectory:(id)a3 error:(id *)a4;
- (BOOL)destroyTemporaryDirectory:(id)a3 error:(id *)a4;
- (BOOL)fileName:(id)a3 inDirectory:(id)a4 hasUniqueIdentifier:(id)a5;
- (BOOL)isCandidateFileName:(id)a3 forSourceFileName:(id)a4;
- (BOOL)setUniqueIdentifier:(id)a3 forPath:(id)a4;
- (BOOL)startCopy;
- (BOOL)validateSourceURLForCopying:(id)a3 error:(id *)a4;
- (BOOL)validateSourceURLForMoving:(id)a3 error:(id *)a4;
- (Copier)initWithSourceURL:(id)a3 uniqueIdentifier:(id)a4 destURL:(id)a5 sandboxExtension:(id)a6 callbackTarget:(id)a7 selector:(SEL)a8 options:(int)a9;
- (id)createTemporaryDirectory:(id *)a3;
- (id)identicalDocumentInDirectory:(id)a3 sourceURL:(id)a4 uniqueIdentifier:(id)a5;
- (id)uniquePathInDirectory:(id)a3 sourceURL:(id)a4;
- (void)_copyThread:(id)a3;
- (void)cancelCopy;
- (void)dealloc;
- (void)invalidate;
@end

@implementation Copier

+ (id)sharedInstance
{
  return (id)qword_10000C648;
}

+ (id)inboxPath
{
  return @"Inbox";
}

+ (id)copierWithSourceURL:(id)a3 uniqueIdentifier:(id)a4 destURL:(id)a5 sandboxExtension:(id)a6 callbackTarget:(id)a7 selector:(SEL)a8 options:(int)a9
{
  LODWORD(v10) = a9;
  return  -[Copier initWithSourceURL:uniqueIdentifier:destURL:sandboxExtension:callbackTarget:selector:options:]( objc_alloc(&OBJC_CLASS___Copier),  "initWithSourceURL:uniqueIdentifier:destURL:sandboxExtension:callbackTarget:selector:options:",  a3,  a4,  a5,  a6,  a7,  a8,  v10);
}

- (Copier)initWithSourceURL:(id)a3 uniqueIdentifier:(id)a4 destURL:(id)a5 sandboxExtension:(id)a6 callbackTarget:(id)a7 selector:(SEL)a8 options:(int)a9
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___Copier;
  v15 = -[Copier init](&v18, "init");
  v15->_sourceURL = (NSURL *)[a3 copy];
  v15->_destURL = (NSURL *)[a5 copy];
  if (a4) {
    v16 = (NSString *)[a4 copy];
  }
  else {
    v16 = 0LL;
  }
  v15->_uniqueID = v16;
  v15->_sandboxExtension = (NSString *)[a6 copy];
  v15->_callbackTarget = a7;
  v15->_callbackSelector = a8;
  v15->_options = a9;
  return v15;
}

- (void)dealloc
{
  self->_continue = 0;

  self->_thread = 0LL;
  self->_sourceURL = 0LL;

  self->_destURL = 0LL;
  self->_uniqueID = 0LL;

  self->_sandboxExtension = 0LL;
  self->_callbackTarget = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___Copier;
  -[Copier dealloc](&v3, "dealloc");
}

- (BOOL)validateSourceURLForCopying:(id)a3 error:(id *)a4
{
  if (([a3 isFileURL] & 1) == 0)
  {
    if (a4)
    {
      v9 = +[NSDictionary dictionaryWithObject:forKey:]( NSDictionary,  "dictionaryWithObject:forKey:",  [a3 path],  NSFilePathErrorKey);
      NSErrorDomain v10 = NSPOSIXErrorDomain;
      uint64_t v11 = 9LL;
      goto LABEL_11;
    }

    return 0;
  }

  v6 = (const char *)objc_msgSend(objc_msgSend(a3, "path"), "cStringUsingEncoding:", 4);
  if (lstat(v6, &v15)) {
    goto LABEL_7;
  }
  int v7 = v15.st_mode & 0xF000;
  if (v7 != 0x4000 && v7 != 0x8000 && v7 != 40960)
  {
    if (a4)
    {
      v9 = +[NSDictionary dictionaryWithObject:forKey:]( NSDictionary,  "dictionaryWithObject:forKey:",  [a3 path],  NSFilePathErrorKey);
      NSErrorDomain v10 = NSPOSIXErrorDomain;
      uint64_t v11 = 22LL;
      goto LABEL_11;
    }

    return 0;
  }

  if (stat(v6, &v15))
  {
LABEL_7:
    if (a4)
    {
      uint64_t v8 = *__error();
      v9 = +[NSDictionary dictionaryWithObject:forKey:]( NSDictionary,  "dictionaryWithObject:forKey:",  [a3 path],  NSFilePathErrorKey);
      NSErrorDomain v10 = NSPOSIXErrorDomain;
      uint64_t v11 = v8;
LABEL_11:
      v12 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v10,  v11,  v9);
      BOOL result = 0;
      *a4 = v12;
      return result;
    }

    return 0;
  }

  int v14 = v15.st_mode & 0xF000;
  BOOL result = 1;
  if (v14 != 0x4000 && v14 != 0x8000)
  {
    if (a4)
    {
      v9 = +[NSDictionary dictionaryWithObject:forKey:]( NSDictionary,  "dictionaryWithObject:forKey:",  [a3 path],  NSFilePathErrorKey);
      NSErrorDomain v10 = NSPOSIXErrorDomain;
      uint64_t v11 = 20LL;
      goto LABEL_11;
    }

    return 0;
  }

  return result;
}

- (BOOL)validateSourceURLForMoving:(id)a3 error:(id *)a4
{
  BOOL v6 = -[Copier validateSourceURLForCopying:error:](self, "validateSourceURLForCopying:error:");
  if (v6)
  {
    if (lstat((const char *)objc_msgSend(objc_msgSend(a3, "path"), "cStringUsingEncoding:", 4), &v13))
    {
      if (a4)
      {
        uint64_t v7 = *__error();
        uint64_t v8 = +[NSDictionary dictionaryWithObject:forKey:]( NSDictionary,  "dictionaryWithObject:forKey:",  [a3 path],  NSFilePathErrorKey);
        NSErrorDomain v9 = NSPOSIXErrorDomain;
        uint64_t v10 = v7;
LABEL_9:
        uint64_t v11 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v9,  v10,  v8);
        LOBYTE(v6) = 0;
        *a4 = v11;
        return v6;
      }

      goto LABEL_10;
    }

    if (v13.st_nlink != 1)
    {
      if (a4)
      {
        uint64_t v8 = +[NSDictionary dictionaryWithObject:forKey:]( NSDictionary,  "dictionaryWithObject:forKey:",  [a3 path],  NSFilePathErrorKey);
        NSErrorDomain v9 = NSPOSIXErrorDomain;
        uint64_t v10 = 31LL;
        goto LABEL_9;
      }

- (BOOL)createDirectory:(id)a3 error:(id *)a4
{
  BOOL v6 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  id v7 = [a3 path];
  char v13 = 0;
  if (-[NSFileManager fileExistsAtPath:isDirectory:](v6, "fileExistsAtPath:isDirectory:", v7, &v13)) {
    BOOL v8 = v13 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8) {
    return 1;
  }
  BOOL v11 = 1;
  if (!-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v6,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v7,  1LL,  +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  +[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", 509LL),  NSFilePosixPermissions),  a4))
  {
    if (a4)
    {
      id v9 = *a4;
      if (*a4)
      {
        uint64_t v10 = (NSMutableDictionary *)objc_msgSend(objc_msgSend(*a4, "userInfo"), "mutableCopy");
        if (!v10) {
          uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        }
        if (!-[NSMutableDictionary valueForKey:](v10, "valueForKey:", NSFilePathErrorKey)) {
          -[NSMutableDictionary setValue:forKey:](v10, "setValue:forKey:", [a3 path], NSFilePathErrorKey);
        }
        *a4 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  [v9 domain],  objc_msgSend(v9, "code"),  v10);
      }
    }

    return 0;
  }

  return v11;
}

- (BOOL)fileName:(id)a3 inDirectory:(id)a4 hasUniqueIdentifier:(id)a5
{
  BOOL v6 = (const char *)objc_msgSend(objc_msgSend(a4, "stringByAppendingPathComponent:", a3), "fileSystemRepresentation");
  uint64_t value = 0LL;
  if (getxattr(v6, "com.apple.mdt.modTime", &value, 8uLL, 0, 1) != 8
    || lstat(v6, &v15)
    || value != v15.st_mtimespec.tv_nsec + 1000000000 * v15.st_mtimespec.tv_sec)
  {
    goto LABEL_16;
  }

  id v7 = v17;
  ssize_t v8 = getxattr(v6, "com.apple.mdt.uniqueDocumentIdentifier", v17, 0xFFuLL, 0, 1);
  if (v8 > 0)
  {
    id v9 = 0LL;
    goto LABEL_6;
  }

  if ((v8 & 0x8000000000000000LL) == 0
    || *__error() != 34
    || (ssize_t v13 = getxattr(v6, "com.apple.mdt.uniqueDocumentIdentifier", 0LL, 0LL, 0, 1), v13 < 1))
  {
LABEL_16:
    LOBYTE(v12) = 0;
    return (char)v12;
  }

  v12 = malloc(v13 + 1);
  if (!v12) {
    return (char)v12;
  }
  id v9 = v12;
  ssize_t v8 = getxattr(v6, "com.apple.mdt.uniqueDocumentIdentifier", v17, 0xFFuLL, 0, 1);
  if (v8 < 1)
  {
    char v11 = 0;
    goto LABEL_9;
  }

  id v7 = v9;
LABEL_6:
  v7[v8] = 0;
  uint64_t v10 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v7, 4LL);
  if (!v10 || -[NSString compare:](v10, "compare:", a5))
  {
    char v11 = 0;
    LOBYTE(v12) = 0;
    if (!v9) {
      return (char)v12;
    }
  }

  else
  {
    char v11 = 1;
    LOBYTE(v12) = 1;
    if (!v9) {
      return (char)v12;
    }
  }

- (BOOL)setUniqueIdentifier:(id)a3 forPath:(id)a4
{
  __darwin_time_t v6 = (mach_absolute_time() / 0x3B9ACA00);
  id v7 = (const char *)objc_msgSend(a4, "fileSystemRepresentation", 1000000000 * v6);
  if (!v7) {
    return 0;
  }
  ssize_t v8 = v7;
  if (!a3)
  {
    BOOL v12 = 1;
    removexattr(v7, "com.apple.mdt.uniqueDocumentIdentifier", 1);
    removexattr(v8, "com.apple.mdt.modTime", 1);
    return v12;
  }

  id v9 = (const char *)[a3 cStringUsingEncoding:4];
  if (!v9) {
    return 0;
  }
  uint64_t v10 = v9;
  size_t v11 = strlen(v9);
  if (setxattr(v8, "com.apple.mdt.uniqueDocumentIdentifier", v10, v11, 0, 1)) {
    return 0;
  }
  if (setxattr(v8, "com.apple.mdt.modTime", &v14, 8uLL, 0, 1)) {
    return 0;
  }
  v15.tv_sec = v6;
  __darwin_time_t v16 = v6;
  v15.tv_usec = 0;
  int v17 = 0;
  return !utimes(v8, &v15);
}

- (BOOL)isCandidateFileName:(id)a3 forSourceFileName:(id)a4
{
  if (!a3) {
    sub_100006098();
  }
  if (!a4) {
    sub_1000060C0();
  }
  if ([a3 isEqual:a4])
  {
LABEL_4:
    LOBYTE(v6) = 1;
    return (char)v6;
  }

  __darwin_time_t v6 = (unsigned __int8 *)[a4 stringByDeletingPathExtension];
  if (v6)
  {
    id v7 = v6;
    LODWORD(v6) = [a3 hasPrefix:v6];
    if ((_DWORD)v6)
    {
      __darwin_time_t v6 = (unsigned __int8 *)objc_msgSend(objc_msgSend(a4, "pathExtension"), "fileSystemRepresentation");
      if (v6)
      {
        ssize_t v8 = v6;
        __darwin_time_t v6 = (unsigned __int8 *)objc_msgSend(a3, "substringFromIndex:", objc_msgSend(v7, "length"));
        if (v6)
        {
          id v9 = v6;
          __darwin_time_t v6 = (unsigned __int8 *)[v6 length];
          if (v6)
          {
            __darwin_time_t v6 = (unsigned __int8 *)[v9 fileSystemRepresentation];
            if (v6)
            {
              if (*v6 == 45)
              {
                uint64_t v10 = v6 + 1;
                do
                {
                  int v12 = *v10++;
                  int v11 = v12;
                }

                while ((v12 - 58) > 0xFFFFFFF5);
                if (v11 == 46)
                {
                  uint64_t v13 = 0LL;
                  do
                  {
                    int v14 = v10[v13];
                    if (!v10[v13]) {
                      goto LABEL_4;
                    }
                    int v15 = v8[v13];
                    if (!v8[v13]) {
                      goto LABEL_4;
                    }
                    ++v13;
                  }

                  while (v14 == v15);
                }
              }

              LOBYTE(v6) = 0;
            }
          }
        }
      }
    }
  }

  return (char)v6;
}

- (id)identicalDocumentInDirectory:(id)a3 sourceURL:(id)a4 uniqueIdentifier:(id)a5
{
  id v8 = objc_msgSend(objc_msgSend(a4, "path"), "lastPathComponent");
  id v9 = [a3 path];
  uint64_t v20 = 0LL;
  id result = -[NSFileManager contentsOfDirectoryAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "contentsOfDirectoryAtPath:error:",  v9,  &v20);
  if (result)
  {
    id v11 = result;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id result = [result countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (result)
    {
      id v12 = result;
      uint64_t v13 = *(void *)v17;
      while (2)
      {
        int v14 = 0LL;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v14);
          if (-[Copier isCandidateFileName:forSourceFileName:](self, "isCandidateFileName:forSourceFileName:", v15, v8)
            && -[Copier fileName:inDirectory:hasUniqueIdentifier:]( self,  "fileName:inDirectory:hasUniqueIdentifier:",  v15,  v9,  a5))
          {
            return +[NSURL fileURLWithPath:]( NSURL,  "fileURLWithPath:",  [v9 stringByAppendingPathComponent:v15]);
          }

          int v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id result = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
        id v12 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }

  return result;
}

- (id)uniquePathInDirectory:(id)a3 sourceURL:(id)a4
{
  id v5 = objc_msgSend(objc_msgSend(a4, "path"), "lastPathComponent");
  id v6 = [a3 path];
  id v7 = [v6 stringByAppendingPathComponent:v5];
  if (lstat((const char *)[v7 cStringUsingEncoding:4], &v14))
  {
LABEL_9:
    if (*__error() == 2) {
      return +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v7);
    }
  }

  else
  {
    uint64_t v8 = 1LL;
    while ((_DWORD)v8 != 0x10000)
    {
      id v9 = [v5 pathExtension];
      if (v9 && (id v10 = v9, [v9 length])) {
        id v11 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@-%u.%@",  [v5 stringByDeletingPathExtension],  v8,  v10);
      }
      else {
        id v11 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%u", v5, v8, v13);
      }
      id v7 = [v6 stringByAppendingPathComponent:v11];
      uint64_t v8 = (v8 + 1);
    }
  }

  return 0LL;
}

- (id)createTemporaryDirectory:(id *)a3
{
  id v5 = CFUUIDCreate(0LL);
  CFStringRef v6 = CFUUIDCreateString(0LL, v5);
  id v7 = objc_msgSend( objc_msgSend( -[NSArray objectAtIndex:]( NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1),  "objectAtIndex:",  0),  "stringByAppendingPathComponent:",  @"com.apple.mdt"),  "stringByAppendingPathComponent:",  v6);
  CFRelease(v6);
  CFRelease(v5);
  uint64_t v8 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v7);
  if (-[Copier createDirectory:error:](self, "createDirectory:error:", v8, a3)) {
    return v8;
  }
  else {
    return 0LL;
  }
}

- (BOOL)destroyTemporaryDirectory:(id)a3 error:(id *)a4
{
  return -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  [a3 path],  a4);
}

- (void)_copyThread:(id)a3
{
  v24 = 0LL;
  char v23 = 0;
  v4 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v5 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  sandboxExtension = self->_sandboxExtension;
  if (sandboxExtension)
  {
    uint64_t v7 = sandbox_extension_consume(-[NSString UTF8String](sandboxExtension, "UTF8String"));
    if (v7 < 0) {
      NSLog(@"could not consume extension token!");
    }
  }

  else
  {
    uint64_t v7 = -1LL;
  }

  if (!-[Copier validateSourceURLForCopying:error:](self, "validateSourceURLForCopying:error:", self->_sourceURL, &v24)) {
    goto LABEL_22;
  }
  if (!self->_uniqueID
    || (destURL = -[Copier identicalDocumentInDirectory:sourceURL:uniqueIdentifier:]( self,  "identicalDocumentInDirectory:sourceURL:uniqueIdentifier:",  self->_destURL,  self->_sourceURL)) == 0LL)
  {
    if (-[NSFileManager fileExistsAtPath:isDirectory:]( v5,  "fileExistsAtPath:isDirectory:",  -[NSURL path](self->_destURL, "path"),  &v23))
    {
      if (!v23)
      {
        destURL = 0LL;
        v24 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  17LL,  +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  -[NSURL path](self->_destURL, "path"),  NSFilePathErrorKey));
        goto LABEL_23;
      }

      goto LABEL_13;
    }

    destURL = self->_destURL;
    if ((self->_options & 1) == 0) {
      goto LABEL_14;
    }
    if (-[Copier createDirectory:error:](self, "createDirectory:error:", self->_destURL, &v24))
    {
LABEL_13:
      destURL = -[Copier uniquePathInDirectory:sourceURL:]( self,  "uniquePathInDirectory:sourceURL:",  self->_destURL,  self->_sourceURL);
LABEL_14:
      id v9 = -[Copier createTemporaryDirectory:](self, "createTemporaryDirectory:", &v24);
      if (!v9) {
        goto LABEL_23;
      }
      id v10 = v9;
      id v11 = -[NSDictionary objectForKey:]( -[NSFileManager attributesOfItemAtPath:error:]( v5,  "attributesOfItemAtPath:error:",  -[NSURL path](self->_destURL, "path"),  0LL),  "objectForKey:",  NSFileProtectionKey);
      if (v11
        && !-[NSFileManager setAttributes:ofItemAtPath:error:]( v5,  "setAttributes:ofItemAtPath:error:",  +[NSDictionary dictionaryWithObject:forKey:]( NSDictionary,  "dictionaryWithObject:forKey:",  v11,  NSFileProtectionKey),  [v10 path],  &v22))
      {
        id v12 = [v10 path];
        NSLog(@" Setting NSFileProtection: %@ on the path: %@ failed with error: %@", v11, v12, v22);
      }

      v21 = v10;
      id v13 = objc_msgSend( -[Copier uniquePathInDirectory:sourceURL:]( self,  "uniquePathInDirectory:sourceURL:",  v10,  self->_sourceURL),  "path");
      stat v14 = -[NSString cStringUsingEncoding:](-[NSURL path](self->_sourceURL, "path"), "cStringUsingEncoding:", 4LL);
      uint64_t v15 = (const char *)[v13 cStringUsingEncoding:4];
      if ((self->_options & 2) != 0)
      {
        if (!-[NSFileManager moveItemAtPath:toPath:error:]( v5,  "moveItemAtPath:toPath:error:",  -[NSURL path](self->_sourceURL, "path"),  v13,  &v24))
        {
          uint64_t v20 = -[NSURL path](self->_sourceURL, "path");
          NSLog(@"Move from SRC(%@ -> %@) to temp failed with error %@", v20, v13, v24);
          destURL = 0LL;
          uint64_t v18 = 5LL;
          goto LABEL_35;
        }

        if (!v11) {
          goto LABEL_31;
        }
        if (-[NSFileManager setAttributes:ofItemAtPath:error:]( v5,  "setAttributes:ofItemAtPath:error:",  +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v11,  NSFileProtectionKey),  v13,  &v22))
        {
          uint64_t v18 = 0LL;
        }

        else
        {
          NSLog(@" Setting NSFileProtection: %@ on the path: %@ failed with error: %@", v11, v13, v22);
          -[NSFileManager moveItemAtPath:toPath:error:]( v5,  "moveItemAtPath:toPath:error:",  v13,  -[NSURL path](self->_sourceURL, "path"),  &v24);
          uint64_t v18 = 1LL;
        }
      }

      else
      {
        __int128 v16 = v15;
        __int128 v17 = copyfile_state_alloc();
        copyfile_state_set(v17, 6u, sub_100003F2C);
        copyfile_state_set(v17, 7u, self);
        uint64_t v18 = copyfile(v14, v16, v17, 0xC800Fu);
        copyfile_state_free(v17);
        id v10 = v21;
      }

      if (!(_DWORD)v18)
      {
LABEL_31:
        -[Copier setUniqueIdentifier:forPath:](self, "setUniqueIdentifier:forPath:", self->_uniqueID, v13);
        uint64_t v18 = 0LL;
        if (!-[NSFileManager moveItemAtPath:toPath:error:]( v5,  "moveItemAtPath:toPath:error:",  v13,  -[NSURL path](destURL, "path"),  &v24)) {
          destURL = 0LL;
        }
      }

- (BOOL)startCopy
{
  self->_continue = 1;
  objc_super v3 = -[NSThread initWithTarget:selector:object:]( objc_alloc(&OBJC_CLASS___NSThread),  "initWithTarget:selector:object:",  self,  "_copyThread:",  0LL);
  self->_thread = v3;
  -[NSThread start](v3, "start");
  return self->_thread != 0LL;
}

- (void)cancelCopy
{
  self->_continue = 0;
}

- (void)invalidate
{
  id callbackTarget = self->_callbackTarget;
  self->_id callbackTarget = 0LL;

  -[NSThread cancel](self->_thread, "cancel");
}

@end