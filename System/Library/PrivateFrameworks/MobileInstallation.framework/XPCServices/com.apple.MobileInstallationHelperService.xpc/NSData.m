@interface NSData
- (BOOL)MI_writeAtomicallyToURL:(id)a3 withMode:(unsigned __int16)a4 owner:(unsigned int)a5 group:(unsigned int)a6 error:(id *)a7;
- (BOOL)MI_writeAtomicallyToURL:(id)a3 withMode:(unsigned __int16)a4 owner:(unsigned int)a5 group:(unsigned int)a6 protectionClass:(int)a7 error:(id *)a8;
- (BOOL)MI_writeAtomicallyToURL:(id)a3 withMode:(unsigned __int16)a4 owner:(unsigned int)a5 group:(unsigned int)a6 protectionClass:(int)a7 withBarrier:(BOOL)a8 error:(id *)a9;
- (BOOL)MI_writeAtomicallyToURLMatchingCurrentFileMetadata:(id)a3 error:(id *)a4;
@end

@implementation NSData

- (BOOL)MI_writeAtomicallyToURL:(id)a3 withMode:(unsigned __int16)a4 owner:(unsigned int)a5 group:(unsigned int)a6 error:(id *)a7
{
  return -[NSData MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:error:]( self,  "MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:error:",  a3,  a4,  *(void *)&a5,  *(void *)&a6,  0xFFFFFFFFLL,  a7);
}

- (BOOL)MI_writeAtomicallyToURL:(id)a3 withMode:(unsigned __int16)a4 owner:(unsigned int)a5 group:(unsigned int)a6 protectionClass:(int)a7 error:(id *)a8
{
  return -[NSData MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:]( self,  "MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:",  a3,  a4,  *(void *)&a5,  *(void *)&a6,  *(void *)&a7,  0LL,  a8);
}

- (BOOL)MI_writeAtomicallyToURL:(id)a3 withMode:(unsigned __int16)a4 owner:(unsigned int)a5 group:(unsigned int)a6 protectionClass:(int)a7 withBarrier:(BOOL)a8 error:(id *)a9
{
  BOOL v58 = a8;
  uint64_t v12 = a4;
  v14 = a9;
  id v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v61 = 0LL;
  v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 URLForDirectory:99 inDomain:1 appropriateForURL:v15 create:1 error:&v61]);
  id v18 = v61;

  if (!v17)
  {
    BOOL v29 = 0;
    v30 = 0LL;
    if (!a9) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }

  id v60 = v15;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 UUIDString]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v17 URLByAppendingPathComponent:v20 isDirectory:0]);

  id v59 = v21;
  v22 = (const char *)[v59 fileSystemRepresentation];
  v23 = v22;
  if (a7 == -1)
  {
    int v24 = open(v22, 2818, v12);
    if (v24 < 0)
    {
      int v39 = *__error();
      uint64_t v40 = v39;
      strerror(v39);
      id Error = _CreateError( (uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionCl ass:withBarrier:error:]",  67LL,  NSPOSIXErrorDomain,  v40,  0LL,  0LL,  @"open failed for %s : %s",  v41,  (uint64_t)v23);
      goto LABEL_14;
    }
  }

  else
  {
    int v24 = open_dprotected_np(v22, 2818, a7, 0, v12);
    if (v24 < 0)
    {
      int v25 = *__error();
      uint64_t v26 = v25;
      strerror(v25);
      id Error = _CreateError( (uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionCl ass:withBarrier:error:]",  56LL,  NSPOSIXErrorDomain,  v26,  0LL,  0LL,  @"open_dprotected_np failed for %s for class %d : %s",  v27,  (uint64_t)v23);
LABEL_14:
      uint64_t v38 = objc_claimAutoreleasedReturnValue(Error);
      v14 = a9;
      goto LABEL_15;
    }
  }

  v14 = a9;
  if (fchmod(v24, v12))
  {
    int v31 = *__error();
    uint64_t v32 = v31;
    strerror(v31);
    id v34 = _CreateError( (uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass: withBarrier:error:]",  75LL,  NSPOSIXErrorDomain,  v32,  0LL,  0LL,  @"Failed to set mode to 0%o for %s : %s",  v33,  v12);
LABEL_12:
    uint64_t v38 = objc_claimAutoreleasedReturnValue(v34);
LABEL_15:
    v30 = v59;
    goto LABEL_16;
  }

  if (fchown(v24, a5, a6))
  {
    int v35 = *__error();
    uint64_t v36 = v35;
    strerror(v35);
    id v34 = _CreateError( (uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass: withBarrier:error:]",  82LL,  NSPOSIXErrorDomain,  v36,  0LL,  0LL,  @"Failed to set owner for %s : %s",  v37,  (uint64_t)v23);
    goto LABEL_12;
  }

  v43 = self;
  id v44 = -[NSData bytes](v43, "bytes");
  id v45 = -[NSData length](v43, "length");
  ssize_t v46 = write(v24, v44, (size_t)v45);
  if (v46 < 0)
  {
    int v50 = *__error();
    uint64_t v51 = v50;
    strerror(v50);
    uint64_t v52 = v51;
    v14 = a9;
    id v34 = _CreateError( (uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass: withBarrier:error:]",  92LL,  NSPOSIXErrorDomain,  v52,  0LL,  0LL,  @"Failed to write %lu bytes to %s : %s",  v53,  (uint64_t)v45);
    goto LABEL_12;
  }

  if ((id)v46 != v45)
  {
    id v34 = _CreateError( (uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass: withBarrier:error:]",  96LL,  NSPOSIXErrorDomain,  5LL,  0LL,  0LL,  @"write() returned %zd but we expected %lu when writing to %s",  v47,  v46);
    goto LABEL_12;
  }

  if (v58)
  {
    v30 = v59;
    if (!fcntl(v24, 85)) {
      goto LABEL_38;
    }
    v48 = __error();
    uint64_t v49 = gLogHandle;
    if (gLogHandle)
    {
    }
  }

  else
  {
    v30 = v59;
    if (!fsync(v24)) {
      goto LABEL_38;
    }
    v48 = __error();
    uint64_t v49 = gLogHandle;
    if (gLogHandle)
    {
    }
  }

  strerror(*v48);
  MOLogWrite(v49);
LABEL_38:
  close(v24);
  if (!rename(v23, (const char *)[v60 fileSystemRepresentation]))
  {
    BOOL v29 = 1;
    int v24 = -1;
    goto LABEL_19;
  }

  int v54 = *__error();
  uint64_t v55 = v54;
  strerror(v54);
  id v57 = _CreateError( (uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:wi thBarrier:error:]",  126LL,  NSPOSIXErrorDomain,  v55,  0LL,  0LL,  @"Failed to rename %s to %s : %s",  v56,  (uint64_t)v23);
  uint64_t v38 = objc_claimAutoreleasedReturnValue(v57);
  int v24 = -1;
LABEL_16:

  if (v23) {
    unlink(v23);
  }
  BOOL v29 = 0;
  id v18 = (id)v38;
LABEL_19:
  unlink((const char *)[v17 fileSystemRepresentation]);
  if ((v24 & 0x80000000) == 0) {
    close(v24);
  }
  id v15 = v60;
  if (v14)
  {
LABEL_22:
    if (!v29) {
      id *v14 = v18;
    }
  }

- (BOOL)MI_writeAtomicallyToURLMatchingCurrentFileMetadata:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (const char *)[v6 fileSystemRepresentation];
  int v8 = open(v7, 256);
  if (v8 < 0)
  {
    int v15 = *__error();
    uint64_t v16 = v15;
    strerror(v15);
    id Error = _CreateError( (uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURLMatchingCurrentFileMetadata:error:]",  166LL,  NSPOSIXErrorDomain,  v16,  0LL,  0LL,  @"open failed for %s : %s",  v17,  (uint64_t)v7);
    id v14 = (id)objc_claimAutoreleasedReturnValue(Error);
LABEL_6:
    BOOL v19 = 0;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

  int v9 = v8;
  if (fstat(v8, &v27))
  {
    int v10 = *__error();
    uint64_t v11 = v10;
    strerror(v10);
    id v13 = _CreateError( (uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURLMatchingCurrentFileMetadata:error:]",  172LL,  NSPOSIXErrorDomain,  v11,  0LL,  0LL,  @"fstat failed for %s : %s",  v12,  (uint64_t)v7);
LABEL_4:
    id v14 = (id)objc_claimAutoreleasedReturnValue(v13);
    close(v9);
    goto LABEL_6;
  }

  uint64_t v21 = fcntl(v9, 63);
  if ((v21 & 0x80000000) != 0)
  {
    int v23 = *__error();
    uint64_t v24 = *__error();
    strerror(v23);
    id v13 = _CreateError( (uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURLMatchingCurrentFileMetadata:error:]",  180LL,  NSPOSIXErrorDomain,  v24,  0LL,  0LL,  @"Failed to getclass of file %s: %s",  v25,  (uint64_t)v7);
    goto LABEL_4;
  }

  uint64_t v22 = v21;
  close(v9);
  id v26 = 0LL;
  BOOL v19 = -[NSData MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:error:]( self,  "MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:error:",  v6,  v27.st_mode,  v27.st_uid,  v27.st_gid,  v22,  &v26);
  id v14 = v26;
  if (!a4) {
    goto LABEL_9;
  }
LABEL_7:
  if (!v19) {
    *a4 = v14;
  }
LABEL_9:

  return v19;
}

@end