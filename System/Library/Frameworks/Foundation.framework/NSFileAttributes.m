@interface NSFileAttributes
+ (BOOL)_populateCatInfo:(id *)a3 forURL:(id)a4 statInfo:(stat *)a5 error:(id *)a6;
+ (id)_attributesAtPath:(id)a3 partialReturn:(BOOL)a4 filterResourceFork:(BOOL)a5 error:(id *)a6;
+ (id)_attributesAtURL:(id)a3 partialReturn:(BOOL)a4 filterResourceFork:(BOOL)a5 error:(id *)a6;
+ (id)attributesAtPath:(id)a3 traverseLink:(BOOL)a4;
+ (id)attributesWithStat:(stat *)a3;
- (BOOL)isDirectory;
- (BOOL)isEqual:(id)a3;
- (id)fileGroupOwnerAccountName;
- (id)fileModificationDate;
- (id)fileOwnerAccountName;
- (id)fileType;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (int64_t)fileSystemNumber;
- (unint64_t)count;
- (unint64_t)fileGroupOwnerAccountNumber;
- (unint64_t)fileOwnerAccountNumber;
- (unint64_t)filePosixPermissions;
- (unint64_t)fileSize;
- (unint64_t)fileSystemFileNumber;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation NSFileAttributes

+ (id)attributesAtPath:(id)a3 traverseLink:(BOOL)a4
{
  id v4 = a3;
  if (a4)
  {
    v5 = -[NSFileManager destinationOfSymbolicLinkAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "destinationOfSymbolicLinkAtPath:error:",  a3,  0LL);
    v6 = v5;
    if (v5 && !-[NSString isAbsolutePath](v5, "isAbsolutePath")) {
      v6 = (NSString *)objc_msgSend( (id)objc_msgSend(v4, "stringByDeletingLastPathComponent"),  "stringByAppendingPathComponent:",  v6);
    }
    if (v6) {
      a3 = v6;
    }
    else {
      a3 = v4;
    }
  }

  return +[NSFileAttributes _attributesAtPath:partialReturn:filterResourceFork:error:]( &OBJC_CLASS___NSFileAttributes,  "_attributesAtPath:partialReturn:filterResourceFork:error:",  a3,  1LL,  1LL,  0LL);
}

+ (BOOL)_populateCatInfo:(id *)a3 forURL:(id)a4 statInfo:(stat *)a5 error:(id *)a6
{
  v13[2] = *MEMORY[0x1895F89C0];
  uint64_t v7 = *MEMORY[0x189603C30];
  uint64_t v8 = *MEMORY[0x189603B88];
  v13[0] = *MEMORY[0x189603C30];
  v13[1] = v8;
  v9 = (void *)objc_msgSend( a4,  "resourceValuesForKeys:error:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v13, 2, a5),  a6);
  v10 = v9;
  if (v9)
  {
    a3->var0 = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", v7), "BOOLValue");
    *(_DWORD *)&a3->var2 |= 1u;
    v11 = (void *)[v10 objectForKey:v8];
    if (v11)
    {
      a3->var1 = (id)[v11 copy];
      *(_DWORD *)&a3->var2 |= 2u;
    }
  }

  return v10 != 0LL;
}

+ (id)_attributesAtPath:(id)a3 partialReturn:(BOOL)a4 filterResourceFork:(BOOL)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (!-[NSFileManager getFileSystemRepresentation:maxLength:withPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "getFileSystemRepresentation:maxLength:withPath:",  v20,  1024LL,  a3))
  {
    if (a6)
    {
      v11 = _NSErrorWithFilePath(256LL, (uint64_t)a3);
      goto LABEL_7;
    }

    return 0LL;
  }

  if (lstat(v20, &v21))
  {
    if (a6)
    {
      v10 = __error();
      v11 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(*v10, (uint64_t)a3, 1, 0LL, 0LL);
LABEL_7:
      v12 = v11;
      id result = 0LL;
      *a6 = v12;
      return result;
    }

    return 0LL;
  }

  v14 = +[NSFileAttributes attributesWithStat:](&OBJC_CLASS___NSFileAttributes, "attributesWithStat:", &v21);
  uint64_t v15 = [MEMORY[0x189604030] fileURLWithPath:a3 isDirectory:0];
  if (v8) {
    a6 = 0LL;
  }
  if (+[NSFileAttributes _populateCatInfo:forURL:statInfo:error:]( &OBJC_CLASS___NSFileAttributes,  "_populateCatInfo:forURL:statInfo:error:",  &v14->catInfo,  v15,  &v21,  a6)
    || (id result = 0LL, v8))
  {
    v16 = _attributesAtPath(v20, a5, (NSError **)a6);
    v14->extendedAttrs = v16;
    if (!v16 && !v8) {
      return 0LL;
    }
    int v17 = v21.st_mode & 0xF000;
    if (v17 == 0x8000 || v17 == 0x4000)
    {
      v19[1] = 0LL;
      v19[2] = 0LL;
      v19[0] = 0x4000000000000005LL;
      if (getattrlist(v20, v19, &v18, 8uLL, 1u) || HIDWORD(v18) == -1) {
        v14->fileProtectionClass = 0;
      }
      else {
        v14->fileProtectionClass = HIDWORD(v18);
      }
    }

    return v14;
  }

  return result;
}

+ (id)_attributesAtURL:(id)a3 partialReturn:(BOOL)a4 filterResourceFork:(BOOL)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v25 = *MEMORY[0x1895F89C0];
  v10 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  if (![a3 isFileURL])
  {
    if (a6)
    {
      uint64_t v15 = [MEMORY[0x189603F68] dictionaryWithObject:a3 forKey:@"NSURL"];
      uint64_t v16 = 262LL;
LABEL_11:
      v14 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  v16,  v15);
      goto LABEL_12;
    }

    return 0LL;
  }

  uint64_t v11 = [a3 path];
  if (!v11)
  {
    if (a6)
    {
      uint64_t v15 = [MEMORY[0x189603F68] dictionaryWithObject:a3 forKey:@"NSURL"];
      uint64_t v16 = 260LL;
      goto LABEL_11;
    }

    return 0LL;
  }

  uint64_t v12 = v11;
  if (!-[NSFileManager getFileSystemRepresentation:maxLength:withPath:]( v10,  "getFileSystemRepresentation:maxLength:withPath:",  v23,  1024LL,  v11))
  {
    if (a6)
    {
      v14 = _NSErrorWithFilePath(256LL, v12);
      goto LABEL_12;
    }

    return 0LL;
  }

  if (lstat(v23, &v24))
  {
    if (a6)
    {
      v13 = __error();
      v14 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(*v13, v12, 1, 0LL, 0LL);
LABEL_12:
      int v17 = v14;
      id result = 0LL;
      *a6 = v17;
      return result;
    }

    return 0LL;
  }

  v19 = +[NSFileAttributes attributesWithStat:](&OBJC_CLASS___NSFileAttributes, "attributesWithStat:", &v24);
  if (v8) {
    a6 = 0LL;
  }
  if (+[NSFileAttributes _populateCatInfo:forURL:statInfo:error:]( &OBJC_CLASS___NSFileAttributes,  "_populateCatInfo:forURL:statInfo:error:",  &v19->catInfo,  a3,  &v24,  a6)
    || (id result = 0LL, v8))
  {
    v20 = _attributesAtPath(v23, a5, (NSError **)a6);
    v19->extendedAttrs = v20;
    if (!v20 && !v8) {
      return 0LL;
    }
    int v21 = v24.st_mode & 0xF000;
    if (v21 == 0x8000 || v21 == 0x4000)
    {
      int v22 = _NSFileProtectionValueForPath(v23);
      if (v22 == -1) {
        v19->fileProtectionClass = 0;
      }
      else {
        v19->fileProtectionClass = v22;
      }
    }

    return v19;
  }

  return result;
}

+ (id)attributesWithStat:(stat *)a3
{
  id v4 = (char *)objc_allocWithZone((Class)a1);
  memmove(v4 + 16, a3, 0x90uLL);
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileAttributes;
  -[NSFileAttributes dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  dict = self->dict;
  if (!dict)
  {
    dict = (NSMutableDictionary *)_fillDictionary( &self->statInfo.st_dev,  (unsigned __int8 *)&self->catInfo,  (uint64_t)self->extendedAttrs,  self->fileProtectionClass);
    self->dict = dict;
  }

  return -[NSMutableDictionary hash](dict, "hash");
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    if (self->statInfo.st_ino == *((void *)a3 + 3)
      && self->statInfo.st_dev == *((_DWORD *)a3 + 4)
      && self->statInfo.st_mtimespec.tv_sec == *((void *)a3 + 8)
      && self->statInfo.st_mtimespec.tv_nsec == *((void *)a3 + 9)
      && self->statInfo.st_mode == *((unsigned __int16 *)a3 + 10)
      && self->statInfo.st_size == *((void *)a3 + 14)
      && self->statInfo.st_nlink == *((unsigned __int16 *)a3 + 11)
      && self->statInfo.st_uid == *((_DWORD *)a3 + 8)
      && self->statInfo.st_gid == *((_DWORD *)a3 + 9))
    {
      return self->statInfo.st_flags == *((_DWORD *)a3 + 33);
    }

    return 0;
  }

  dict = self->dict;
  if (!dict)
  {
    dict = (NSMutableDictionary *)_fillDictionary( &self->statInfo.st_dev,  (unsigned __int8 *)&self->catInfo,  (uint64_t)self->extendedAttrs,  self->fileProtectionClass);
    self->dict = dict;
  }

  return [a3 isEqual:dict];
}

- (id)objectForKey:(id)a3
{
  dict = self->dict;
  if (dict) {
    return (id)-[NSMutableDictionary objectForKey:](dict, "objectForKey:", a3);
  }
  if ([a3 isEqual:@"NSFileModificationDate"]) {
    return (id)[MEMORY[0x189603F50] dateWithTimeIntervalSinceReferenceDate:(double)self->statInfo.st_mtimespec.tv_sec - *MEMORY[0x189604DA8] + (double)self->statInfo.st_mtimespec.tv_nsec * 0.000000001];
  }
  if ([a3 isEqual:@"NSFileSize"]) {
    return +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->statInfo.st_size);
  }
  if ([a3 isEqual:@"NSFilePosixPermissions"])
  {
    __darwin_ino64_t st_nlink = self->statInfo.st_mode & 0xFFF;
    return +[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", st_nlink);
  }

  if (![a3 isEqual:@"NSFileType"])
  {
    if ([a3 isEqual:@"NSFileReferenceCount"])
    {
      __darwin_ino64_t st_nlink = self->statInfo.st_nlink;
      return +[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", st_nlink);
    }

    if ([a3 isEqual:@"NSFileSystemNumber"])
    {
      __darwin_ino64_t st_nlink = self->statInfo.st_dev;
      return +[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", st_nlink);
    }

    if ([a3 isEqual:@"NSFileSystemFileNumber"])
    {
      __darwin_ino64_t st_nlink = self->statInfo.st_ino;
      return +[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", st_nlink);
    }

    if ([a3 isEqual:@"NSFileDeviceIdentifier"])
    {
      if ((self->statInfo.st_mode & 0xB000 | 0x4000) == 0x6000)
      {
        __darwin_ino64_t st_nlink = self->statInfo.st_rdev;
        return +[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", st_nlink);
      }

      return 0LL;
    }

    if ([a3 isEqual:@"NSFileExtensionHidden"])
    {
      if ((*(_BYTE *)&self->catInfo.validFields & 1) != 0)
      {
        BOOL extensionHidden = self->catInfo.extensionHidden;
        return +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", extensionHidden);
      }

      return 0LL;
    }

    if ([a3 isEqual:@"NSFileCreationDate"])
    {
      if ((*(_BYTE *)&self->catInfo.validFields & 2) != 0) {
        return self->catInfo.creationDate;
      }
      return 0LL;
    }

    if ([a3 isEqual:@"NSFileImmutable"])
    {
      BOOL v11 = (self->statInfo.st_flags & 0x20002) == 0;
    }

    else
    {
      if (![a3 isEqual:@"NSFileAppendOnly"])
      {
        if ([a3 isEqual:@"NSFileOwnerAccountID"])
        {
          uint64_t st_uid = self->statInfo.st_uid;
        }

        else
        {
          if (![a3 isEqual:@"NSFileGroupOwnerAccountID"])
          {
            if ([a3 isEqual:@"NSFileProtectionKey"])
            {
              unsigned int v13 = self->fileProtectionClass - 1;
              if (v13 < 7) {
                return off_189C9ACF8[v13];
              }
            }

            return 0LL;
          }

          uint64_t st_uid = self->statInfo.st_gid;
        }

        return +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", st_uid);
      }

      BOOL v11 = (self->statInfo.st_flags & 0x40004) == 0;
    }

    BOOL extensionHidden = !v11;
    return +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", extensionHidden);
  }

  unsigned int st_mode = self->statInfo.st_mode;
  if ((st_mode & 0x1000) != 0) {
    return @"NSFileTypeUnknown";
  }
  uint64_t v9 = (st_mode >> 13) - 1LL;
  else {
    return off_189C9AD30[v9];
  }
}

- (unint64_t)count
{
  dict = self->dict;
  if (!dict)
  {
    dict = (NSMutableDictionary *)_fillDictionary( &self->statInfo.st_dev,  (unsigned __int8 *)&self->catInfo,  (uint64_t)self->extendedAttrs,  self->fileProtectionClass);
    self->dict = dict;
  }

  return -[NSMutableDictionary count](dict, "count");
}

- (id)keyEnumerator
{
  dict = self->dict;
  if (!dict)
  {
    dict = (NSMutableDictionary *)_fillDictionary( &self->statInfo.st_dev,  (unsigned __int8 *)&self->catInfo,  (uint64_t)self->extendedAttrs,  self->fileProtectionClass);
    self->dict = dict;
  }

  return (id)-[NSMutableDictionary keyEnumerator](dict, "keyEnumerator");
}

- (unint64_t)fileSize
{
  return self->statInfo.st_size;
}

- (id)fileModificationDate
{
  return (id)[MEMORY[0x189603F50] dateWithTimeIntervalSinceReferenceDate:(double)self->statInfo.st_mtimespec.tv_sec - *MEMORY[0x189604DA8] + (double)self->statInfo.st_mtimespec.tv_nsec * 0.000000001];
}

- (id)fileType
{
  unsigned int st_mode = self->statInfo.st_mode;
  if ((st_mode & 0x1000) != 0) {
    return @"NSFileTypeUnknown";
  }
  uint64_t v3 = (st_mode >> 13) - 1LL;
  else {
    return off_189C9AD30[v3];
  }
}

- (unint64_t)filePosixPermissions
{
  return self->statInfo.st_mode & 0xFFF;
}

- (id)fileOwnerAccountName
{
  return __NSUserAccountNumberToName(self->statInfo.st_uid);
}

- (unint64_t)fileOwnerAccountNumber
{
  return self->statInfo.st_uid;
}

- (id)fileGroupOwnerAccountName
{
  return __NSGroupAccountNumberToName(self->statInfo.st_gid);
}

- (unint64_t)fileGroupOwnerAccountNumber
{
  return self->statInfo.st_gid;
}

- (int64_t)fileSystemNumber
{
  return self->statInfo.st_dev;
}

- (unint64_t)fileSystemFileNumber
{
  return self->statInfo.st_ino;
}

- (BOOL)isDirectory
{
  return (self->statInfo.st_mode & 0xF000) == 0x4000;
}

@end