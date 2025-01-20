@interface IXFileManager
+ (id)defaultManager;
- (BOOL)_copyItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 error:(id *)a6;
- (BOOL)_moveItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 error:(id *)a6;
- (BOOL)_removeACLAtPath:(const char *)a3 isDir:(BOOL)a4 error:(id *)a5;
- (BOOL)_traverseDirectory:(id)a3 ignoringFTSErrors:(BOOL)a4 error:(id *)a5 withBlock:(id)a6;
- (BOOL)_validateSymlink:(id)a3 withStartingDepth:(unsigned int)a4 andEndingDepth:(unsigned int *)a5;
- (BOOL)copyACLFrom:(id)a3 toAllChildrenOfPath:(id)a4 error:(id *)a5;
- (BOOL)copyACLFrom:(id)a3 toAllChildrenOfPath:(id)a4 ignoringCopyErrors:(BOOL)a5 error:(id *)a6;
- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)copyItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 class:(int)a6 error:(id *)a7;
- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 error:(id *)a6;
- (BOOL)createSymbolicLinkAtURL:(id)a3 withDestinationURL:(id)a4 error:(id *)a5;
- (BOOL)dataProtectionClassOfItemAtURL:(id)a3 class:(int *)a4 error:(id *)a5;
- (BOOL)itemDoesNotExistAtURL:(id)a3;
- (BOOL)itemExistsAtURL:(id)a3;
- (BOOL)itemExistsAtURL:(id)a3 error:(id *)a4;
- (BOOL)itemExistsAtURL:(id)a3 isDirectory:(BOOL *)a4 error:(id *)a5;
- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)moveItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4;
- (BOOL)removeItemAtURL:(id)a3 keepParent:(BOOL)a4 error:(id *)a5;
- (BOOL)setDataProtectionClassOfItemAtURL:(id)a3 toClass:(int)a4 ifPredicate:(id)a5 error:(id *)a6;
- (BOOL)setPermissions:(unsigned __int16)a3 onAllChildrenOfPath:(id)a4 error:(id *)a5;
- (BOOL)setPermissionsOfItemAtURL:(id)a3 toMode:(unsigned __int16)a4 error:(id *)a5;
- (id)_realPathForURL:(id)a3 allowNonExistentPathComponents:(BOOL)a4;
- (id)_realPathWhatExistsInPath:(id)a3;
- (id)createTemporaryDirectoryInDirectoryURL:(id)a3 error:(id *)a4;
- (id)createTemporaryExtractionDirectoryWithError:(id *)a3;
- (id)createTemporaryIconsDirectoryWithError:(id *)a3;
- (id)debugDescriptionOfItemAtURL:(id)a3;
- (id)destinationOfSymbolicLinkAtURL:(id)a3 error:(id *)a4;
- (id)realPathForURL:(id)a3 ifChildOfURL:(id)a4;
- (id)urlsForItemsInDirectoryAtURL:(id)a3 ignoringSymlinks:(BOOL)a4 error:(id *)a5;
- (unint64_t)_diskUsageForDirectoryURL:(id)a3;
- (unint64_t)diskUsageForURL:(id)a3;
@end

@implementation IXFileManager

+ (id)defaultManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003560C;
  block[3] = &unk_1000CCB20;
  block[4] = a1;
  if (qword_1000E8F48 != -1) {
    dispatch_once(&qword_1000E8F48, block);
  }
  return (id)qword_1000E8F40;
}

- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4
{
  return -[IXFileManager removeItemAtURL:keepParent:error:](self, "removeItemAtURL:keepParent:error:", a3, 0LL, a4);
}

- (BOOL)removeItemAtURL:(id)a3 keepParent:(BOOL)a4 error:(id *)a5
{
  return IXRemoveItemAtURL(a3, a4, a5);
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 class:(int)a6 error:(id *)a7
{
  return IXCreateDirectoryAtURL(a3, a4, a5, *(uint64_t *)&a6, a7);
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  return -[IXFileManager createDirectoryAtURL:withIntermediateDirectories:mode:class:error:]( self,  "createDirectoryAtURL:withIntermediateDirectories:mode:class:error:",  a3,  a4,  a5,  0xFFFFFFFFLL,  a6);
}

- (BOOL)_copyItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 error:(id *)a6
{
  return IXCopyItemAtURL(a3, a4, a5, a6);
}

- (BOOL)_moveItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (!a5)
  {
    memset(&v36, 0, sizeof(v36));
    id v12 = v10;
    if (lstat((const char *)[v12 fileSystemRepresentation], &v36))
    {
      int v13 = *__error();
      BOOL v14 = v13 == 2;
      if (v13 == 2)
      {
        v15 = 0LL;
        if (!a6) {
          goto LABEL_22;
        }
      }

      else
      {
        unint64_t v29 = *__error();
        v30 = __error();
        strerror(*v30);
        id v32 = sub_10003556C( (uint64_t)"-[IXFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]",  83LL,  NSPOSIXErrorDomain,  v29,  0LL,  0LL,  @"stat of %@ failed: %s",  v31,  (uint64_t)v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v32);
        if (!a6) {
          goto LABEL_22;
        }
      }

- (BOOL)copyItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return -[IXFileManager _copyItemAtURL:toURL:failIfSrcMissing:error:]( self,  "_copyItemAtURL:toURL:failIfSrcMissing:error:",  a3,  a4,  0LL,  a5);
}

- (BOOL)moveItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return -[IXFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]( self,  "_moveItemAtURL:toURL:failIfSrcMissing:error:",  a3,  a4,  0LL,  a5);
}

- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return -[IXFileManager _copyItemAtURL:toURL:failIfSrcMissing:error:]( self,  "_copyItemAtURL:toURL:failIfSrcMissing:error:",  a3,  a4,  1LL,  a5);
}

- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return -[IXFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]( self,  "_moveItemAtURL:toURL:failIfSrcMissing:error:",  a3,  a4,  1LL,  a5);
}

- (id)createTemporaryDirectoryInDirectoryURL:(id)a3 error:(id *)a4
{
  return IXCreateTemporaryDirectoryInDirectoryURL(a3, a4);
}

- (id)createTemporaryExtractionDirectoryWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IXGlobalConfiguration sharedInstance](&OBJC_CLASS___IXGlobalConfiguration, "sharedInstance"));
  id v14 = 0LL;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 extractedInstallableStagingDirectory:&v14]);
  id v7 = v14;

  if (v6)
  {
    id v13 = v7;
    unsigned int v8 = -[IXFileManager createDirectoryAtURL:withIntermediateDirectories:mode:error:]( self,  "createDirectoryAtURL:withIntermediateDirectories:mode:error:",  v6,  0LL,  493LL,  &v13);
    id v9 = v13;

    if (v8)
    {
      id v12 = v9;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( -[IXFileManager createTemporaryDirectoryInDirectoryURL:error:]( self,  "createTemporaryDirectoryInDirectoryURL:error:",  v6,  &v12));
      id v7 = v12;

      if (!a3) {
        goto LABEL_10;
      }
    }

    else
    {
      id v10 = 0LL;
      id v7 = v9;
      if (!a3) {
        goto LABEL_10;
      }
    }
  }

  else
  {
    id v10 = 0LL;
    if (!a3) {
      goto LABEL_10;
    }
  }

  if (!v10) {
    *a3 = v7;
  }
LABEL_10:

  return v10;
}

- (id)createTemporaryIconsDirectoryWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IXGlobalConfiguration sharedInstance](&OBJC_CLASS___IXGlobalConfiguration, "sharedInstance"));
  id v14 = 0LL;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 iconStagingDirectoryWithError:&v14]);
  id v7 = v14;

  if (v6)
  {
    id v13 = v7;
    unsigned int v8 = -[IXFileManager createDirectoryAtURL:withIntermediateDirectories:mode:error:]( self,  "createDirectoryAtURL:withIntermediateDirectories:mode:error:",  v6,  0LL,  493LL,  &v13);
    id v9 = v13;

    if (v8)
    {
      id v12 = v9;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( -[IXFileManager createTemporaryDirectoryInDirectoryURL:error:]( self,  "createTemporaryDirectoryInDirectoryURL:error:",  v6,  &v12));
      id v7 = v12;

      if (!a3) {
        goto LABEL_10;
      }
    }

    else
    {
      id v10 = 0LL;
      id v7 = v9;
      if (!a3) {
        goto LABEL_10;
      }
    }
  }

  else
  {
    id v10 = 0LL;
    if (!a3) {
      goto LABEL_10;
    }
  }

  if (!v10) {
    *a3 = v7;
  }
LABEL_10:

  return v10;
}

- (BOOL)_traverseDirectory:(id)a3 ignoringFTSErrors:(BOOL)a4 error:(id *)a5 withBlock:(id)a6
{
  id v9 = a3;
  id v10 = (uint64_t (**)(void))a6;
  id v11 = v9;
  id v12 = (char *)[v11 fileSystemRepresentation];
  v37[0] = v12;
  v37[1] = 0LL;
  id v13 = fts_open(v37, 84, 0LL);
  if (!v13)
  {
    unint64_t v24 = *__error();
    unint64_t v25 = __error();
    strerror(*v25);
    id v27 = sub_10003556C( (uint64_t)"-[IXFileManager _traverseDirectory:ignoringFTSErrors:error:withBlock:]",  206LL,  NSPOSIXErrorDomain,  v24,  0LL,  0LL,  @"fts_open failed for %s with error %s",  v26,  (uint64_t)v12);
    goto LABEL_21;
  }

  id v14 = v13;
  v15 = fts_read(v13);
  if (!v15)
  {
    if (fts_close(v14)) {
      goto LABEL_20;
    }
    BOOL v23 = 0;
    v17 = 0LL;
    goto LABEL_23;
  }

  id v16 = v15;
  v17 = 0LL;
  while (1)
  {
    unsigned int fts_info = v16->fts_info;
    BOOL v19 = fts_info > 0xA;
    int v20 = (1 << fts_info) & 0x490;
    if (!v19 && v20 != 0) {
      break;
    }
    char v22 = v10[2](v10);
    id v32 = v17;

    if ((v22 & 1) == 0) {
      goto LABEL_17;
    }
    v17 = v32;
LABEL_12:
    id v16 = fts_read(v14);
    if (!v16)
    {
      BOOL v23 = 1;
      goto LABEL_18;
    }
  }

  if (a4) {
    goto LABEL_12;
  }
  int fts_errno = v16->fts_errno;
  unint64_t v29 = fts_errno;
  strerror(fts_errno);
  id v31 = sub_10003556C( (uint64_t)"-[IXFileManager _traverseDirectory:ignoringFTSErrors:error:withBlock:]",  218LL,  NSPOSIXErrorDomain,  v29,  0LL,  0LL,  @"Error for path %s: %s",  v30,  (uint64_t)v12);
  id v32 = (id)objc_claimAutoreleasedReturnValue(v31);

LABEL_17:
  BOOL v23 = 0;
  v17 = v32;
LABEL_18:
  if (fts_close(v14))
  {
    if (!v17)
    {
LABEL_20:
      unint64_t v33 = *__error();
      id v34 = __error();
      strerror(*v34);
      id v27 = sub_10003556C( (uint64_t)"-[IXFileManager _traverseDirectory:ignoringFTSErrors:error:withBlock:]",  235LL,  NSPOSIXErrorDomain,  v33,  0LL,  0LL,  @"fts_close failed for %s with error %s",  v35,  (uint64_t)v12);
LABEL_21:
      v17 = (void *)objc_claimAutoreleasedReturnValue(v27);
    }

    BOOL v23 = 0;
  }

- (BOOL)_removeACLAtPath:(const char *)a3 isDir:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  acl_t v8 = acl_init(0);
  if (v8)
  {
    id v9 = v8;
    if (v6)
    {
      id v10 = opendir(a3);
      if (v10)
      {
        id v11 = v10;
        int v12 = dirfd(v10);
        if (v12 < 0)
        {
          v62 = sub_1000047B4((uint64_t)off_1000E8CA0);
          v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
            sub_10007EEA8();
          }

          unint64_t v64 = *__error();
          v65 = __error();
          strerror(*v65);
          id v67 = sub_10003556C( (uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]",  270LL,  NSPOSIXErrorDomain,  v64,  0LL,  0LL,  @"dirfd of %s failed: %s",  v66,  (uint64_t)a3);
          int v20 = (void *)objc_claimAutoreleasedReturnValue(v67);
          uint64_t v21 = 270LL;
        }

        else
        {
          if (!acl_set_fd(v12, v9))
          {
            id v32 = 0LL;
            BOOL v33 = 1;
            goto LABEL_32;
          }

          id v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_10007EF4C();
          }

          unint64_t v15 = *__error();
          id v16 = __error();
          strerror(*v16);
          id v18 = sub_10003556C( (uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]",  275LL,  NSPOSIXErrorDomain,  v15,  0LL,  0LL,  @"Failed to set ACL on dir %s: %s",  v17,  (uint64_t)a3);
          int v20 = (void *)objc_claimAutoreleasedReturnValue(v18);
          uint64_t v21 = 275LL;
        }

        id v68 = sub_10003556C( (uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]",  v21,  @"IXErrorDomain",  1uLL,  v20,  0LL,  @"Failed to remove ACL",  v19,  v70);
        id v32 = (void *)objc_claimAutoreleasedReturnValue(v68);

        BOOL v33 = 0;
LABEL_32:
        closedir(v11);
        goto LABEL_33;
      }

      v46 = sub_1000047B4((uint64_t)off_1000E8CA0);
      v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        sub_10007EE04();
      }

      unint64_t v48 = *__error();
      v49 = __error();
      strerror(*v49);
      id v51 = sub_10003556C( (uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]",  264LL,  NSPOSIXErrorDomain,  v48,  0LL,  0LL,  @"opendir of %s failed: %s",  v50,  (uint64_t)a3);
      v53 = (void *)objc_claimAutoreleasedReturnValue(v51);
      uint64_t v54 = 264LL;
    }

    else
    {
      int v34 = open(a3, 2097154);
      if ((v34 & 0x80000000) == 0)
      {
        int v35 = v34;
        int v36 = acl_set_fd(v34, v9);
        BOOL v33 = v36 == 0;
        if (v36)
        {
          v37 = sub_1000047B4((uint64_t)off_1000E8CA0);
          v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            sub_10007F094();
          }

          unint64_t v39 = *__error();
          v40 = __error();
          strerror(*v40);
          id v42 = sub_10003556C( (uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]",  286LL,  NSPOSIXErrorDomain,  v39,  0LL,  0LL,  @"Failed to set ACL on %s: %s",  v41,  (uint64_t)a3);
          v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
          id v45 = sub_10003556C( (uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]",  286LL,  @"IXErrorDomain",  1uLL,  v43,  0LL,  @"Failed to remove ACL",  v44,  v72);
          id v32 = (void *)objc_claimAutoreleasedReturnValue(v45);
        }

        else
        {
          id v32 = 0LL;
        }

        close(v35);
LABEL_33:
        acl_free(v9);
        if (!a5) {
          goto LABEL_36;
        }
        goto LABEL_34;
      }

      v55 = sub_1000047B4((uint64_t)off_1000E8CA0);
      v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_10007EFF0();
      }

      unint64_t v57 = *__error();
      v58 = __error();
      strerror(*v58);
      id v60 = sub_10003556C( (uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]",  281LL,  NSPOSIXErrorDomain,  v57,  0LL,  0LL,  @"open of %s failed: %s",  v59,  (uint64_t)a3);
      v53 = (void *)objc_claimAutoreleasedReturnValue(v60);
      uint64_t v54 = 281LL;
    }

    id v61 = sub_10003556C( (uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]",  v54,  @"IXErrorDomain",  1uLL,  v53,  0LL,  @"Failed to remove ACL",  v52,  v73);
    id v32 = (void *)objc_claimAutoreleasedReturnValue(v61);

    BOOL v33 = 0;
    goto LABEL_33;
  }

  char v22 = sub_1000047B4((uint64_t)off_1000E8CA0);
  BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_10007ED3C(NSPOSIXErrorDomain);
  }

  unint64_t v24 = *__error();
  unint64_t v25 = __error();
  uint64_t v26 = strerror(*v25);
  id v28 = sub_10003556C( (uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]",  257LL,  NSPOSIXErrorDomain,  v24,  0LL,  0LL,  @"acl_init() failed: %s",  v27,  (uint64_t)v26);
  unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  id v31 = sub_10003556C( (uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]",  257LL,  @"IXErrorDomain",  1uLL,  v29,  0LL,  @"Failed to remove ACL",  v30,  v71);
  id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

  BOOL v33 = 0;
  if (a5)
  {
LABEL_34:
    if (!v33) {
      *a5 = v32;
    }
  }

- (BOOL)setPermissions:(unsigned __int16)a3 onAllChildrenOfPath:(id)a4 error:(id *)a5
{
  id v12 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100036430;
  v10[3] = &unk_1000CDF58;
  unsigned __int16 v11 = a3;
  BOOL v6 = -[IXFileManager _traverseDirectory:ignoringFTSErrors:error:withBlock:]( self,  "_traverseDirectory:ignoringFTSErrors:error:withBlock:",  a4,  0LL,  &v12,  v10);
  id v7 = v12;
  acl_t v8 = v7;
  if (a5 && !v6) {
    *a5 = v7;
  }

  return v6;
}

- (BOOL)copyACLFrom:(id)a3 toAllChildrenOfPath:(id)a4 error:(id *)a5
{
  return -[IXFileManager copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:]( self,  "copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:",  a3,  a4,  0LL,  a5);
}

- (BOOL)copyACLFrom:(id)a3 toAllChildrenOfPath:(id)a4 ignoringCopyErrors:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = v10;
  id v13 = (const char *)[v12 fileSystemRepresentation];
  acl_t link_np = acl_get_link_np(v13, ACL_TYPE_EXTENDED);
  if (link_np)
  {
    acl_t v15 = link_np;
    id v24 = 0LL;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000366B8;
    v22[3] = &unk_1000CDF78;
    v22[4] = link_np;
    BOOL v23 = v7;
    BOOL v16 = -[IXFileManager _traverseDirectory:ignoringFTSErrors:error:withBlock:]( self,  "_traverseDirectory:ignoringFTSErrors:error:withBlock:",  v11,  v7,  &v24,  v22);
    id v17 = v24;
    acl_free(v15);
    if (!a6) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }

  unint64_t v19 = *__error();
  if ((_DWORD)v19 == 2 && -[IXFileManager itemExistsAtURL:](self, "itemExistsAtURL:", v12)) {
    id v20 = sub_10003556C( (uint64_t)"-[IXFileManager copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:]",  361LL,  NSPOSIXErrorDomain,  0x5DuLL,  0LL,  0LL,  @"acl_get_link_np found no ACLs on %s",  v18,  (uint64_t)v13);
  }
  else {
    id v20 = sub_10003556C( (uint64_t)"-[IXFileManager copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:]",  366LL,  NSPOSIXErrorDomain,  v19,  0LL,  0LL,  @"acl_get_link_np failed for %s",  v18,  (uint64_t)v13);
  }
  id v17 = (id)objc_claimAutoreleasedReturnValue(v20);
  BOOL v16 = 0;
  if (a6)
  {
LABEL_9:
    if (!v16) {
      *a6 = v17;
    }
  }

- (id)urlsForItemsInDirectoryAtURL:(id)a3 ignoringSymlinks:(BOOL)a4 error:(id *)a5
{
  return IXUrlsForItemsInDirectoryAtURL(a3, a4, a5);
}

- (BOOL)createSymbolicLinkAtURL:(id)a3 withDestinationURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (const char *)[v8 fileSystemRepresentation];
  id v10 = v7;
  int v11 = symlink(v9, (const char *)[v10 fileSystemRepresentation]);
  if (v11)
  {
    unint64_t v12 = *__error();
    id v13 = [v8 fileSystemRepresentation];
    [v10 fileSystemRepresentation];
    id v14 = __error();
    strerror(*v14);
    id v16 = sub_10003556C( (uint64_t)"-[IXFileManager createSymbolicLinkAtURL:withDestinationURL:error:]",  418LL,  NSPOSIXErrorDomain,  v12,  0LL,  0LL,  @"Could not create symlink containing %s at %s: %s",  v15,  (uint64_t)v13);
    id v17 = (id)objc_claimAutoreleasedReturnValue(v16);
    if (a5)
    {
      id v17 = v17;
      *a5 = v17;
    }
  }

  else
  {
    id v17 = 0LL;
  }

  return v11 == 0;
}

- (id)destinationOfSymbolicLinkAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  ssize_t v6 = readlink((const char *)[v5 fileSystemRepresentation], v16, 0x400uLL);
  if (v6 < 0)
  {
    unint64_t v10 = *__error();
    id v11 = [v5 fileSystemRepresentation];
    unint64_t v12 = __error();
    strerror(*v12);
    id v14 = sub_10003556C( (uint64_t)"-[IXFileManager destinationOfSymbolicLinkAtURL:error:]",  438LL,  NSPOSIXErrorDomain,  v10,  0LL,  0LL,  @"Could not readlink %s : %s",  v13,  (uint64_t)v11);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v8 = 0LL;
    if (!a4) {
      goto LABEL_7;
    }
  }

  else
  {
    v16[v6] = 0;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFileSystemRepresentation:length:]( &OBJC_CLASS___NSString,  "stringWithFileSystemRepresentation:length:",  v16,  v6));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v7));

    id v9 = 0LL;
    if (!a4) {
      goto LABEL_7;
    }
  }

  if (!v8) {
    *a4 = v9;
  }
LABEL_7:

  return v8;
}

- (BOOL)itemExistsAtURL:(id)a3 isDirectory:(BOOL *)a4 error:(id *)a5
{
  return IXItemExistsAtURL(a3, a4, a5);
}

- (BOOL)itemExistsAtURL:(id)a3 error:(id *)a4
{
  return -[IXFileManager itemExistsAtURL:isDirectory:error:](self, "itemExistsAtURL:isDirectory:error:", a3, 0LL, a4);
}

- (BOOL)itemExistsAtURL:(id)a3
{
  return -[IXFileManager itemExistsAtURL:error:](self, "itemExistsAtURL:error:", a3, 0LL);
}

- (BOOL)itemDoesNotExistAtURL:(id)a3
{
  id v3 = a3;
  if (!lstat( (const char *)objc_msgSend( v3,  "fileSystemRepresentation",  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0),  &v10))
  {
LABEL_7:
    BOOL v4 = 0;
    goto LABEL_8;
  }

  if (*__error() != 2)
  {
    id v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
    ssize_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = __error();
      id v8 = strerror(*v7);
      *(_DWORD *)buf = 136315650;
      unint64_t v12 = "-[IXFileManager itemDoesNotExistAtURL:]";
      __int16 v13 = 2112;
      id v14 = v3;
      __int16 v15 = 2080;
      id v16 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to determine if %@ exists: %s",  buf,  0x20u);
    }

    goto LABEL_7;
  }

  BOOL v4 = 1;
LABEL_8:

  return v4;
}

- (id)debugDescriptionOfItemAtURL:(id)a3
{
  if (lstat((const char *)[a3 fileSystemRepresentation], &v10))
  {
    id v3 = __error();
    ssize_t v6 = strerror(*v3);
    BOOL v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<lstat error: %s>",  v6,  v7,  v8,  v9,  *(void *)&v10.st_dev,  v10.st_ino);
  }

  else
  {
    BOOL v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<uid:%u gid:%u mode:0%ho flags:0x%x>",  v10.st_uid,  v10.st_gid,  v10.st_mode,  v10.st_flags,  *(void *)&v10.st_dev,  v10.st_ino);
  }

  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (BOOL)dataProtectionClassOfItemAtURL:(id)a3 class:(int *)a4 error:(id *)a5
{
  id v7 = a3;
  int v8 = open((const char *)[v7 fileSystemRepresentation], 256);
  int v9 = v8;
  if (v8 < 0)
  {
    unint64_t v13 = *__error();
    id v14 = [v7 fileSystemRepresentation];
    __int16 v15 = __error();
    strerror(*v15);
    id v17 = sub_10003556C( (uint64_t)"-[IXFileManager dataProtectionClassOfItemAtURL:class:error:]",  498LL,  NSPOSIXErrorDomain,  v13,  0LL,  0LL,  @"Failed to open %s : %s",  v16,  (uint64_t)v14);
  }

  else
  {
    int v10 = fcntl(v8, 63);
    if ((v10 & 0x80000000) == 0)
    {
      id v11 = 0LL;
      *a4 = v10;
      char v12 = 1;
LABEL_9:
      close(v9);
      BOOL v23 = v12;
      goto LABEL_10;
    }

    unint64_t v18 = *__error();
    id v19 = [v7 fileSystemRepresentation];
    id v20 = __error();
    strerror(*v20);
    id v17 = sub_10003556C( (uint64_t)"-[IXFileManager dataProtectionClassOfItemAtURL:class:error:]",  504LL,  NSPOSIXErrorDomain,  v18,  0LL,  0LL,  @"Failed to getclass of file %s: %s",  v21,  (uint64_t)v19);
  }

  char v22 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v11 = v22;
  if (a5) {
    *a5 = v22;
  }
  char v12 = 0;
  BOOL v23 = 0;
  if ((v9 & 0x80000000) == 0) {
    goto LABEL_9;
  }
LABEL_10:

  return v23;
}

- (BOOL)setDataProtectionClassOfItemAtURL:(id)a3 toClass:(int)a4 ifPredicate:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  id v9 = a3;
  int v10 = (unsigned int (**)(id, void))a5;
  id v11 = v9;
  int v12 = open((const char *)[v11 fileSystemRepresentation], 256);
  int v13 = v12;
  if (v12 < 0)
  {
    NSErrorDomain v19 = NSPOSIXErrorDomain;
    unint64_t v20 = *__error();
    id v21 = [v11 fileSystemRepresentation];
    char v22 = __error();
    uint64_t v33 = (uint64_t)v21;
    strerror(*v22);
    id v24 = @"Failed to open %s : %s";
    uint64_t v25 = 530LL;
  }

  else
  {
    if (!v10)
    {
LABEL_5:
      if (fcntl(v13, 64, v8))
      {
        unint64_t v15 = *__error();
        [v11 fileSystemRepresentation];
        uint64_t v16 = __error();
        strerror(*v16);
        id v18 = sub_10003556C( (uint64_t)"-[IXFileManager setDataProtectionClassOfItemAtURL:toClass:ifPredicate:error:]",  547LL,  NSPOSIXErrorDomain,  v15,  0LL,  0LL,  @"Failed to setclass(%d) on file %s: %s",  v17,  v8);
        goto LABEL_11;
      }

- (BOOL)setPermissionsOfItemAtURL:(id)a3 toMode:(unsigned __int16)a4 error:(id *)a5
{
  id v7 = (const char *)[a3 fileSystemRepresentation];
  int v8 = lchmod(v7, a4);
  if (v8)
  {
    unint64_t v9 = *__error();
    int v10 = __error();
    strerror(*v10);
    id v12 = sub_10003556C( (uint64_t)"-[IXFileManager setPermissionsOfItemAtURL:toMode:error:]",  567LL,  NSPOSIXErrorDomain,  v9,  0LL,  0LL,  @"Failed to lchmod %s to mode 0%o : %s",  v11,  (uint64_t)v7);
    int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v14 = v13;
    if (a5) {
      *a5 = v13;
    }
  }

  return v8 == 0;
}

- (id)_realPathWhatExistsInPath:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([a3 pathComponents]);
  id v5 = (char *)[v4 count];
  ssize_t v6 = v5 - 1;
  if (v5 == (char *)1)
  {
    unint64_t v9 = 0LL;
  }

  else
  {
    do
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subarrayWithRange:", 0, v6 + 1));
      int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](&OBJC_CLASS___NSURL, "fileURLWithPathComponents:", v7));
      unint64_t v9 = 0LL;
      if (-[IXFileManager itemExistsAtURL:](self, "itemExistsAtURL:", v8))
      {
        int v10 = (void *)objc_claimAutoreleasedReturnValue( -[IXFileManager _realPathForURL:allowNonExistentPathComponents:]( self,  "_realPathForURL:allowNonExistentPathComponents:",  v8,  0LL));
        if (v10)
        {
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subarrayWithRange:", v6 + 1, (_BYTE *)objc_msgSend(v4, "count") - (v6 + 1)));
          id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v11));
          int v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
          uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
            *(_DWORD *)buf = 136315650;
            id v18 = "-[IXFileManager _realPathWhatExistsInPath:]";
            __int16 v19 = 2112;
            unint64_t v20 = v16;
            __int16 v21 = 2112;
            char v22 = v12;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%s: Realpathed %@ ; appending non-existing components %@",
              buf,
              0x20u);
          }

          unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v10 URLByAppendingPathComponent:v12 isDirectory:0]);
        }

        else
        {
          unint64_t v9 = 0LL;
        }
      }

      if (v9) {
        break;
      }
      --v6;
    }

    while (v6);
  }

  return v9;
}

- (id)_realPathForURL:(id)a3 allowNonExistentPathComponents:(BOOL)a4
{
  BOOL v4 = a4;
  bzero(v25, 0x400uLL);
  id v7 = objc_claimAutoreleasedReturnValue([a3 path]);
  if (realpath_DARWIN_EXTSN((const char *)[v7 fileSystemRepresentation], v25))
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v25,  0LL,  0LL));
LABEL_11:
    unint64_t v15 = (void *)v8;
    goto LABEL_12;
  }

  if (*__error() == 2 && v4)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[IXFileManager _realPathWhatExistsInPath:](self, "_realPathWhatExistsInPath:", v7));
    goto LABEL_11;
  }

  int v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v7 fileSystemRepresentation];
    int v13 = __error();
    uint64_t v14 = strerror(*v13);
    int v17 = 136315906;
    id v18 = "-[IXFileManager _realPathForURL:allowNonExistentPathComponents:]";
    __int16 v19 = 2080;
    id v20 = v12;
    __int16 v21 = 2080;
    char v22 = v14;
    __int16 v23 = 2080;
    id v24 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to realpath %s : %s at %s",  (uint8_t *)&v17,  0x2Au);
  }

  unint64_t v15 = 0LL;
LABEL_12:

  return v15;
}

- (BOOL)_validateSymlink:(id)a3 withStartingDepth:(unsigned int)a4 andEndingDepth:(unsigned int *)a5
{
  id v7 = a3;
  uint64_t v8 = v7;
  if (v7)
  {
    id v18 = a5;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue([v7 pathComponents]);
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      signed int v13 = a4;
      while (2)
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          unint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          if ([v15 isEqualToString:@".."])
          {
            --v13;
          }

          else if (([v15 isEqualToString:&stru_1000D08C0] & 1) == 0 {
                 && ([v15 isEqualToString:@"."] & 1) == 0)
          }
          {
            v13 += [v15 isEqualToString:@"/"] ^ 1;
          }

          if (v13 < (int)a4)
          {

            goto LABEL_18;
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    else
    {
      signed int v13 = a4;
    }

    if (v18) {
      *id v18 = v13;
    }
    BOOL v16 = 1;
  }

  else
  {
    id v9 = 0LL;
LABEL_18:
    BOOL v16 = 0;
  }

  return v16;
}

- (id)realPathForURL:(id)a3 ifChildOfURL:(id)a4
{
  ssize_t v6 = (char *)a3;
  id v7 = a4;
  bzero(v114, 0x400uLL);
  if (!v6 || !v7)
  {
    unint64_t v29 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315650;
    v101 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
    __int16 v102 = 2112;
    id v103 = v7;
    __int16 v104 = 2112;
    v105 = v6;
    uint64_t v30 = "%s: The base path %@ and/or suspicious path %@ were nil";
    BOOL v31 = v24;
    uint32_t v32 = 32;
    goto LABEL_14;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
  unsigned int v9 = [v8 hasPrefix:@"/private/"];

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringFromIndex:", objc_msgSend(@"/private", "length")));
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v11));

    id v7 = (id)v12;
  }

  signed int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
  unsigned int v14 = [v13 hasPrefix:@"/private/"];

  if (v14)
  {
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "substringFromIndex:", objc_msgSend(@"/private", "length")));
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v16));

    ssize_t v6 = (char *)v17;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
  unsigned __int8 v20 = [v18 hasPrefix:v19];

  if ((v20 & 1) == 0)
  {
    uint64_t v33 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
      int v34 = (char *)objc_claimAutoreleasedReturnValue([v7 path]);
      *(_DWORD *)buf = 136315650;
      v101 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
      __int16 v102 = 2112;
      id v103 = v25;
      __int16 v104 = 2112;
      v105 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s: supiscious path %@ does not contain base path %@ as a prefix",  buf,  0x20u);

LABEL_22:
      goto LABEL_23;
    }

    goto LABEL_23;
  }

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v6 pathComponents]);
  unsigned int v22 = [v21 containsObject:@".."];

  if (!v22)
  {
    ssize_t v6 = v6;
    ssize_t v35 = readlink((const char *)[v6 fileSystemRepresentation], v114, 0x400uLL);
    if ((v35 & 0x8000000000000000LL) == 0)
    {
      if (v114[0] == 47)
      {
        int v36 = sub_1000047B4((uint64_t)off_1000E8CA0);
        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
          *(_DWORD *)buf = 136315650;
          v101 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
          __int16 v102 = 2112;
          id v103 = v25;
          __int16 v104 = 2080;
          v105 = v114;
          uint64_t v26 = "%s: Rejecting %@ -> %s, as absolute symlinks are not allowed";
          char v27 = v24;
          uint32_t v28 = 32;
          goto LABEL_21;
        }

        goto LABEL_23;
      }

      unsigned int v99 = 0;
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
      unsigned __int8 v45 = -[IXFileManager _validateSymlink:withStartingDepth:andEndingDepth:]( self,  "_validateSymlink:withStartingDepth:andEndingDepth:",  v44,  0LL,  &v99);

      if ((v45 & 1) == 0)
      {
        uint64_t v52 = sub_1000047B4((uint64_t)off_1000E8CA0);
        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
        *(_DWORD *)buf = 136315394;
        v101 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
        __int16 v102 = 2112;
        id v103 = v25;
        uint64_t v26 = "%s: Failed to retrieve depth of %@";
        goto LABEL_11;
      }

      v46 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
      v47 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
      unint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "substringFromIndex:", objc_msgSend(v47, "length")));

      v37 = (void *)objc_claimAutoreleasedReturnValue([v48 stringByDeletingLastPathComponent]);
      v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFileSystemRepresentation:length:]( &OBJC_CLASS___NSString,  "stringWithFileSystemRepresentation:length:",  v114,  v35));
      v38 = (char *)objc_claimAutoreleasedReturnValue([v37 stringByAppendingPathComponent:v49]);

      if (!-[IXFileManager _validateSymlink:withStartingDepth:andEndingDepth:]( self,  "_validateSymlink:withStartingDepth:andEndingDepth:",  v38,  v99,  0LL))
      {
        v62 = sub_1000047B4((uint64_t)off_1000E8CA0);
        uint64_t v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          v55 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
          v63 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
          *(_DWORD *)buf = 136315906;
          v101 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
          __int16 v102 = 2112;
          id v103 = v55;
          __int16 v104 = 2112;
          v105 = v38;
          __int16 v106 = 2112;
          v107 = v63;
          _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "%s: Rejecting %@ -> %@, as it is points outside or to the base %@",  buf,  0x2Au);

          goto LABEL_48;
        }

- (unint64_t)_diskUsageForDirectoryURL:(id)a3
{
  id v3 = (char *)a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL));
  int v66 = 0;
  int v68 = 0;
  unint64_t v65 = 0xA200000900000005LL;
  uint64_t v67 = 0x500000002LL;
  ssize_t v6 = (int *)malloc(0x8000uLL);
  unint64_t v57 = v3;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v3 path]);
  v56 = (void *)v7;
  if (v7)
  {
    [v5 addObject:v7];
  }

  else
  {
    uint64_t v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v70 = "-[IXFileManager _diskUsageForDirectoryURL:]";
      __int16 v71 = 2112;
      uint64_t v72 = v57;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Failed to get path to url %@", buf, 0x16u);
    }
  }

  if ([v5 count])
  {
    unint64_t v63 = 0LL;
    id v61 = v4;
    v58 = v6;
    while (1)
    {
      id v10 = objc_autoreleasePoolPush();
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:0]);
      [v5 removeObjectAtIndex:0];
      id v64 = v11;
      int v12 = open((const char *)[v64 fileSystemRepresentation], 1048832);
      if (v12 < 0)
      {
        v47 = sub_1000047B4((uint64_t)off_1000E8CA0);
        unint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = __error();
          uint64_t v50 = strerror(*v49);
          *(_DWORD *)buf = 136315650;
          uint64_t v70 = "-[IXFileManager _diskUsageForDirectoryURL:]";
          __int16 v71 = 2112;
          uint64_t v72 = (char *)v64;
          __int16 v73 = 2080;
          v74 = v50;
          _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to open directory %@ : %s",  buf,  0x20u);
        }
      }

      else
      {
        int v60 = v12;
        uint64_t v59 = v10;
        signed int v13 = 0LL;
LABEL_10:
        ssize_t v6 = v58;
        while (1)
        {
          int v14 = getattrlistbulk(v60, &v65, v58, 0x8000uLL, 0LL);
          if (v14 == -1) {
            break;
          }
          int v15 = v14;
          if (!v14) {
            goto LABEL_64;
          }
          if (v14 >= 1)
          {
            while (1)
            {
              uint64_t v17 = *v6;
              unsigned int v16 = v6[1];
              unsigned int v18 = v6[4];
              if ((v16 & 0x20000000) != 0)
              {
                if (v6[6])
                {
                  uint64_t v26 = sub_1000047B4((uint64_t)off_1000E8CA0);
                  char v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                  {
                    uint32_t v28 = __error();
                    unint64_t v29 = strerror(*v28);
                    *(_DWORD *)buf = 136315906;
                    uint64_t v70 = "-[IXFileManager _diskUsageForDirectoryURL:]";
                    __int16 v71 = 2080;
                    uint64_t v72 = v29;
                    __int16 v73 = 2048;
                    v74 = v13;
                    __int16 v75 = 2112;
                    uint64_t v76 = (char *)v64;
                    uint64_t v30 = v27;
                    BOOL v31 = "%s: Got error %s while processing entry %llu in %@";
                    uint32_t v32 = 42;
                    goto LABEL_45;
                  }

- (unint64_t)diskUsageForURL:(id)a3
{
  id v4 = a3;
  if (lstat( (const char *)objc_msgSend( v4,  "fileSystemRepresentation",  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0),  &v12))
  {
    id v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
    ssize_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v4 fileSystemRepresentation];
      uint64_t v8 = __error();
      unsigned int v9 = strerror(*v8);
      *(_DWORD *)buf = 136315650;
      int v14 = "-[IXFileManager diskUsageForURL:]";
      __int16 v15 = 2080;
      id v16 = v7;
      __int16 v17 = 2080;
      unsigned int v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to stat %s : %s", buf, 0x20u);
    }

    unint64_t v10 = 0LL;
  }

  else if ((v12.st_mode & 0xF000) == 0x4000)
  {
    unint64_t v10 = -[IXFileManager _diskUsageForDirectoryURL:](self, "_diskUsageForDirectoryURL:", v4);
  }

  else
  {
    unint64_t v10 = v12.st_blocks << 9;
  }

  return v10;
}

@end