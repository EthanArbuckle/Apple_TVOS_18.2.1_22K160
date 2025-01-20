@interface SKMountOperation
+ (BOOL)mountWithDisk:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)nilWithBlock:(id)a3 error:(id)a4;
+ (id)resolveWithPath:(id)a3 error:(id *)a4;
- (BOOL)authenticateOnInit;
- (BOOL)force;
- (BOOL)toOperateWithDisk:(id)a3;
- (BOOL)validateMountOptionsWithDisk:(id)a3 error:(id *)a4;
- (BOOL)validateMountPointWithConnection:(id)a3 error:(id *)a4;
- (NSSet)disksToMount;
- (NSString)mountPoint;
- (SKMountOperation)initWithDisk:(id)a3 options:(id)a4 connection:(id)a5 completionBlock:(id)a6;
- (id)copyMountURLWithDisk:(id)a3;
- (id)description;
- (id)filterEFIWithDisks:(id)a3;
- (id)newPerformOperation;
- (int64_t)defaultErrorCode;
- (unsigned)clientUID;
- (void)setAuthenticateOnInit:(BOOL)a3;
- (void)setMountPoint:(id)a3;
@end

@implementation SKMountOperation

+ (id)nilWithBlock:(id)a3 error:(id)a4
{
  if (a3) {
    (*((void (**)(id, id))a3 + 2))(a3, a4);
  }
  return 0LL;
}

+ (id)resolveWithPath:(id)a3 error:(id *)a4
{
  v5 = (const char *)[a3 UTF8String];
  if (!v5)
  {
    v7 = @"Invalid mount point string";
    uint64_t v8 = 22LL;
LABEL_6:
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[SKError nilWithPOSIXCode:debugDescription:error:]( &OBJC_CLASS___SKError,  "nilWithPOSIXCode:debugDescription:error:",  v8,  v7,  a4));
    return v6;
  }

  if (!realpath_DARWIN_EXTSN(v5, v10))
  {
    uint64_t v8 = *__error();
    v7 = @"Cannot resolve mount point";
    goto LABEL_6;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v10));
  return v6;
}

- (SKMountOperation)initWithDisk:(id)a3 options:(id)a4 connection:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v57.receiver = self;
  v57.super_class = (Class)&OBJC_CLASS___SKMountOperation;
  v13 = -[SKBaseDiskArbOperation initWithTarget:options:callbackBlock:]( &v57,  "initWithTarget:options:callbackBlock:",  v10,  a4,  v12);
  if (v13)
  {
    if (v11) {
      unsigned int v14 = [v11 uid];
    }
    else {
      unsigned int v14 = -1;
    }
    v13->_clientUID = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](v13, "options"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:kSKAPFSDiskMountIgnoreGroup]);
    id v18 = -[SKBaseDiskArbOperation disksForOperationWithTarget:ignoreGroup:]( v13,  "disksForOperationWithTarget:ignoreGroup:",  v10,  sub_100012488(v17));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    uint64_t v20 = objc_claimAutoreleasedReturnValue(-[SKMountOperation filterEFIWithDisks:](v13, "filterEFIWithDisks:", v19));
    disksToMount = v13->_disksToMount;
    v13->_disksToMount = (NSSet *)v20;

    if (!-[NSSet count](v13->_disksToMount, "count"))
    {
      if (-[SKBaseDiskArbOperation recursive](v13, "recursive") && !-[SKMountOperation force](v13, "force"))
      {
        id v40 = sub_10000E2BC();
        v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v59 = "-[SKMountOperation initWithDisk:options:connection:completionBlock:]";
          _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "%s: Nothing to mount on recursive mount, returning success",  buf,  0xCu);
        }

        id v42 = [(id)objc_opt_class(v13) nilWithBlock:v12 error:0];
        v15 = (SKMountOperation *)objc_claimAutoreleasedReturnValue(v42);
      }

      else
      {
        v29 = (void *)objc_opt_class(v13);
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", 124LL, 0LL));
        v15 = (SKMountOperation *)objc_claimAutoreleasedReturnValue([v29 nilWithBlock:v12 error:v30]);
      }

      goto LABEL_34;
    }

    if ((id)-[NSSet count](v13->_disksToMount, "count") == (id)1)
    {
      id v22 = (id)objc_claimAutoreleasedReturnValue(-[NSSet anyObject](v13->_disksToMount, "anyObject"));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 mountPoint]);

      if (v23)
      {
        id v24 = sub_10000E2BC();
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v59 = "-[SKMountOperation initWithDisk:options:connection:completionBlock:]";
          __int16 v60 = 2112;
          id v61 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s: %@ is already mounted, returning success",  buf,  0x16u);
        }

        v26 = (void *)objc_opt_class(v13);
        id v27 = v12;
        id v28 = 0LL;
        goto LABEL_31;
      }
    }

    id v56 = 0LL;
    unsigned __int8 v31 = -[SKMountOperation validateMountOptionsWithDisk:error:](v13, "validateMountOptionsWithDisk:error:", v10, &v56);
    id v22 = v56;
    if ((v31 & 1) != 0)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](v13, "options"));
      uint64_t v33 = kSKDiskMountOptionMountPoint;
      v34 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:kSKDiskMountOptionMountPoint]);

      if (!v34) {
        goto LABEL_28;
      }
      if (-[NSSet count](v13->_disksToMount, "count") >= 2)
      {
        id v35 = sub_10000E2BC();
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v59 = "-[SKMountOperation initWithDisk:options:connection:completionBlock:]";
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "%s: Multiple disks to mount, cannot specify mount point",  buf,  0xCu);
        }

        v37 = (void *)objc_opt_class(v13);
        NSErrorDomain v38 = NSPOSIXErrorDomain;
        uint64_t v39 = 22LL;
        goto LABEL_37;
      }

      v43 = (void *)objc_opt_class(v13);
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](v13, "options"));
      v45 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKeyedSubscript:v33]);
      id v55 = v22;
      uint64_t v46 = objc_claimAutoreleasedReturnValue([v43 resolveWithPath:v45 error:&v55]);
      id v47 = v55;

      mountPoint = v13->_mountPoint;
      v13->_mountPoint = (NSString *)v46;

      if (!v13->_mountPoint)
      {
        id v53 = [(id)objc_opt_class(v13) nilWithBlock:v12 error:v47];
        v15 = (SKMountOperation *)objc_claimAutoreleasedReturnValue(v53);
        id v22 = v47;
        goto LABEL_33;
      }

      id v54 = v47;
      unsigned __int8 v49 = -[SKMountOperation validateMountPointWithConnection:error:]( v13,  "validateMountPointWithConnection:error:",  v11,  &v54);
      id v22 = v54;

      if ((v49 & 1) != 0)
      {
LABEL_28:
        if (!-[SKMountOperation authenticateOnInit](v13, "authenticateOnInit")
          || ([v11 authorizeRequestForRoot] & 1) != 0)
        {
          v50 = v13;
LABEL_32:
          v15 = v50;
LABEL_33:

LABEL_34:
          goto LABEL_35;
        }

        v37 = (void *)objc_opt_class(v13);
        NSErrorDomain v38 = NSPOSIXErrorDomain;
        uint64_t v39 = 1LL;
LABEL_37:
        v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v38,  v39,  0LL));
        v15 = (SKMountOperation *)objc_claimAutoreleasedReturnValue([v37 nilWithBlock:v12 error:v52]);

        goto LABEL_33;
      }
    }

    v26 = (void *)objc_opt_class(v13);
    id v27 = v12;
    id v28 = v22;
LABEL_31:
    v50 = (SKMountOperation *)objc_claimAutoreleasedReturnValue([v26 nilWithBlock:v27 error:v28]);
    goto LABEL_32;
  }

  v15 = 0LL;
LABEL_35:

  return v15;
}

- (id)filterEFIWithDisks:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v26;
    *(void *)&__int128 v8 = 136315906LL;
    __int128 v24 = v8;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "type", v24, (void)v25));
        unsigned int v14 = [v13 isEqualToString:kSKDiskTypeEFI];

        if (v14
          && -[SKMountOperation clientUID](self, "clientUID")
          && (unsigned int v15 = -[SKMountOperation clientUID](self, "clientUID"), v15 != [v12 ownerUID]))
        {
          id v16 = sub_10000E2BC();
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v18 = -[SKMountOperation clientUID](self, "clientUID");
            id v19 = v6;
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v12 diskIdentifier]);
            unsigned int v21 = [v12 ownerUID];
            *(_DWORD *)buf = v24;
            v30 = "-[SKMountOperation filterEFIWithDisks:]";
            __int16 v31 = 1024;
            unsigned int v32 = v18;
            __int16 v33 = 2114;
            v34 = v20;
            __int16 v35 = 1024;
            unsigned int v36 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s: Client uid %d, skipping EFI partition %{public}@ owned by uid %d",  buf,  0x22u);

            id v6 = v19;
          }
        }

        else
        {
          [v5 addObject:v12];
        }

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v22 = [v6 countByEnumeratingWithState:&v25 objects:v37 count:16];
      id v9 = v22;
    }

    while (v22);
  }

  return v5;
}

- (BOOL)toOperateWithDisk:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___SKAPFSDisk);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 role]);
    if ([v5 isEqualToString:kSKDiskRoleVirtualMemory])
    {
      LOBYTE(v6) = 0;
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 role]);
      if ([v7 isEqualToString:kSKDiskRoleBooter])
      {
        LOBYTE(v6) = 0;
      }

      else
      {
        __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v3 role]);
        else {
          unsigned int v6 = [v3 isLocked] ^ 1;
        }
      }
    }
  }

  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

+ (BOOL)mountWithDisk:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = -[SKMountOperation initWithDisk:options:connection:completionBlock:]( objc_alloc(&OBJC_CLASS___SKMountOperation),  "initWithDisk:options:connection:completionBlock:",  v8,  v7,  0LL,  0LL);

  id v10 = -[SKMountOperation newPerformOperation](v9, "newPerformOperation");
  id v11 = v10;
  if (a5) {
    *a5 = v10;
  }

  return v11 == 0LL;
}

- (id)copyMountURLWithDisk:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKMountOperation mountPoint](self, "mountPoint"));
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___SKAPFSContainerDisk);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 filesystem]);
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 filesystem]);
    if ([v8 isExtension])
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 filesystem]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 majorType]);
      if ([v10 isEqualToString:@"apfs"])
      {
        if ([v4 isExternal])
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 filesystem]);
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 majorType]);
          unsigned __int8 v13 = [v12 isEqualToString:@"apfs"];
        }

        else
        {
          unsigned __int8 v13 = 0;
        }
      }

      else
      {
        unsigned __int8 v13 = 1;
      }
    }

    else
    {
      unsigned __int8 v13 = 0;
    }
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  if (v5 || (v13 & 1) != 0)
  {
LABEL_51:
    if (v5)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5));
      goto LABEL_54;
    }

- (BOOL)validateMountOptionsWithDisk:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kSKDiskMountOptionToolOptions]);
  id v9 = (void *)v8;
  id v10 = &__NSArray0__struct;
  if (v8) {
    id v10 = (void *)v8;
  }
  id v11 = v10;

  if ((unint64_t)[v11 count] >= 0x40)
  {
    unsigned __int8 v12 = +[SKError failWithPOSIXCode:debugDescription:error:]( &OBJC_CLASS___SKError,  "failWithPOSIXCode:debugDescription:error:",  22LL,  @"Too many mount options",  a4);
    goto LABEL_24;
  }

  if (!-[SKMountOperation clientUID](self, "clientUID") || ![v11 count])
  {
LABEL_20:
    unsigned __int8 v12 = 1;
    goto LABEL_24;
  }

  uint64_t v13 = 0LL;
  while (1)
  {
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:v13]);
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lowercaseString]);

    if ([v15 hasPrefix:@"-o="])
    {
      uint64_t v16 = 3LL;
    }

    else
    {
      uint64_t v16 = 2LL;
    }

    uint64_t v17 = objc_claimAutoreleasedReturnValue([v15 substringFromIndex:v16]);

    unsigned int v15 = (void *)v17;
LABEL_13:
    if ([v15 isEqualToString:@"noowners"]
      && ([v6 isTrusted] & 1) != 0
      || [v15 isEqualToString:@"suid"]
      && ![v6 isTrusted]
      || [v15 isEqualToString:@"dev"]
      && ([v6 isTrusted] & 1) == 0)
    {
      break;
    }
  }

  id v18 = sub_10000E2BC();
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v20 = -[SKMountOperation clientUID](self, "clientUID");
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 diskIdentifier]);
    int v23 = 136315906;
    __int128 v24 = "-[SKMountOperation validateMountOptionsWithDisk:error:]";
    __int16 v25 = 1024;
    unsigned int v26 = v20;
    __int16 v27 = 2112;
    __int128 v28 = v21;
    __int16 v29 = 2112;
    v30 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s: Client %d asks to mount %@ with %@ option",  (uint8_t *)&v23,  0x26u);
  }

  unsigned __int8 v12 = 1;
  -[SKMountOperation setAuthenticateOnInit:](self, "setAuthenticateOnInit:", 1LL);

LABEL_24:
  return v12;
}

- (BOOL)validateMountPointWithConnection:(id)a3 error:(id *)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKMountOperation mountPoint](self, "mountPoint"));
  if (!sub_10001232C(v7))
  {

    goto LABEL_10;
  }

  id v8 = objc_claimAutoreleasedReturnValue(-[SKMountOperation mountPoint](self, "mountPoint"));
  id v9 = [v8 fileSystemRepresentation];

  if (!v9)
  {
LABEL_10:
    id v17 = sub_10000E2BC();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SKMountOperation mountPoint](self, "mountPoint"));
      v40.st_dev = 138412290;
      *(void *)&v40.st_mode = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Invalid mount point %@", (uint8_t *)&v40, 0xCu);
    }

    uint64_t v16 = 22LL;
    return +[SKError failWithPOSIXCode:error:]( &OBJC_CLASS___SKError,  "failWithPOSIXCode:error:",  v16,  a4);
  }

  if (!a3)
  {
    id v23 = sub_10000E2BC();
    __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v40.st_dev) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Unknown audit token, denying use of mount point",  (uint8_t *)&v40,  2u);
    }

    return +[SKError failWithSKErrorCode:error:]( &OBJC_CLASS___SKError,  "failWithSKErrorCode:error:",  102LL,  a4);
  }

  if (!-[SKMountOperation clientUID](self, "clientUID")) {
    goto LABEL_20;
  }
  memset(&v40, 0, sizeof(v40));
  id v10 = objc_claimAutoreleasedReturnValue(-[SKMountOperation mountPoint](self, "mountPoint"));
  int v11 = stat((const char *)[v10 fileSystemRepresentation], &v40);

  if (v11)
  {
    uint64_t v12 = *__error();
    id v13 = sub_10000E2BC();
    unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[SKMountOperation mountPoint](self, "mountPoint"));
      int v32 = 136315650;
      id v33 = "-[SKMountOperation validateMountPointWithConnection:error:]";
      __int16 v34 = 2112;
      id v35 = v15;
      __int16 v36 = 1024;
      unsigned int v37 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s: Stat failed on %@, errno %d",  (uint8_t *)&v32,  0x1Cu);
    }

    uint64_t v16 = v12;
    return +[SKError failWithPOSIXCode:error:]( &OBJC_CLASS___SKError,  "failWithPOSIXCode:error:",  v16,  a4);
  }

  unsigned int v25 = -[SKMountOperation clientUID](self, "clientUID");
  if (v25 != v40.st_uid)
  {
    id v29 = sub_10000E2BC();
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(-[SKMountOperation mountPoint](self, "mountPoint"));
      int v32 = 136315906;
      id v33 = "-[SKMountOperation validateMountPointWithConnection:error:]";
      __int16 v34 = 2112;
      id v35 = v31;
      __int16 v36 = 1024;
      unsigned int v37 = -[SKMountOperation clientUID](self, "clientUID");
      __int16 v38 = 1024;
      uid_t st_uid = v40.st_uid;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%s: Client is not the owner of %@. clientUID = %d, path_info.uid_t st_uid = %d, asking for permission",  (uint8_t *)&v32,  0x22u);
    }

    BOOL v21 = 1;
    -[SKMountOperation setAuthenticateOnInit:](self, "setAuthenticateOnInit:", 1LL);
  }

  else
  {
LABEL_20:
    id v26 = sub_10000E2BC();
    __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[SKMountOperation mountPoint](self, "mountPoint"));
      v40.st_dev = 136315394;
      *(void *)&v40.st_mode = "-[SKMountOperation validateMountPointWithConnection:error:]";
      WORD2(v40.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&v40.st_ino + 6) = (__darwin_ino64_t)v28;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%s: Client is allowed to mount to %@",  (uint8_t *)&v40,  0x16u);
    }

    return 1;
  }

  return v21;
}

- (id)newPerformOperation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kSKDiskMountOptionToolOptions]);

  id v5 = [v4 count];
  group = dispatch_group_create();
  if (v5)
  {
    for (i = 0LL; i != v5; i = (char *)i + 1)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:i]);
      v103[(void)i] = v7;
    }
  }

  id v8 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKMountOperation disksToMount](self, "disksToMount"));
  objc_super v57 = -[NSMutableArray initWithCapacity:](v8, "initWithCapacity:", [v9 count]);

  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue(-[SKMountOperation disksToMount](self, "disksToMount"));
  id v10 = [obj countByEnumeratingWithState:&v66 objects:v102 count:16];
  uint64_t v52 = v4;
  if (!v10)
  {
    id v12 = 0LL;
    goto LABEL_41;
  }

  id v11 = v10;
  id v12 = 0LL;
  uint64_t v13 = *(void *)v67;
  unsigned int v14 = (CFStringRef *)v103;
  if (!v5) {
    unsigned int v14 = 0LL;
  }
  arguments = v14;
  uint64_t v56 = *(void *)v67;
  do
  {
    unsigned int v15 = 0LL;
    id v58 = v11;
    do
    {
      if (*(void *)v67 != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v16 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)v15);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 mountPoint]);

      if (!v17)
      {
        unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Mount of %@",  v16,  v52));
        -[SKBaseDiskArbOperation setCurrentOperationName:](self, "setCurrentOperationName:", v20);

        id v21 = -[SKMountOperation copyMountURLWithDisk:](self, "copyMountURLWithDisk:", v16);
        id v22 = [(id)objc_opt_class(self) getMountState:v16];
        id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        if (v23
          && (__int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options")),
              unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:kSKDiskMountOptionRestore]),
              unsigned int v26 = sub_100012488(v25),
              v25,
              uint64_t v13 = v56,
              v24,
              v26))
        {
          __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v23 mountPoint]);
          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v27));

          id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 path]);
          unsigned __int8 v30 = [v29 hasPrefix:@"/Volumes"];

          id v53 = v12;
          if ((v30 & 1) != 0) {
            id v19 = 0LL;
          }
          else {
            id v19 = v28;
          }

          __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v23 mountFlags]);
          __int128 v100 = 0u;
          __int128 v101 = 0u;
          __int128 v98 = 0u;
          __int128 v99 = 0u;
          __int128 v96 = 0u;
          __int128 v97 = 0u;
          __int128 v94 = 0u;
          __int128 v95 = 0u;
          __int128 v92 = 0u;
          __int128 v93 = 0u;
          __int128 v90 = 0u;
          __int128 v91 = 0u;
          __int128 v88 = 0u;
          __int128 v89 = 0u;
          __int128 v86 = 0u;
          __int128 v87 = 0u;
          __int128 v84 = 0u;
          __int128 v85 = 0u;
          __int128 v82 = 0u;
          __int128 v83 = 0u;
          __int128 v80 = 0u;
          __int128 v81 = 0u;
          __int128 v78 = 0u;
          __int128 v79 = 0u;
          __int128 v76 = 0u;
          __int128 v77 = 0u;
          __int128 v74 = 0u;
          __int128 v75 = 0u;
          __int128 v72 = 0u;
          __int128 v73 = 0u;
          memset(buf, 0, sizeof(buf));
          id v32 = [v31 count];
          else {
            uint64_t v33 = (uint64_t)v32;
          }
          if (v33)
          {
            for (uint64_t j = 0LL; j != v33; ++j)
            {
              id v35 = (void *)objc_claimAutoreleasedReturnValue([v31 objectAtIndexedSubscript:j]);
              __int16 v36 = (CFStringRef *)buf;
              buf[j] = v35;
            }
          }

          else
          {
            __int16 v36 = 0LL;
          }

          unsigned int v37 = (__DADisk *)objc_claimAutoreleasedReturnValue([v16 daDisk]);
          DADiskMountWithArguments(v37, v19, 2u, (DADiskMountCallback)sub_1000196D4, self, v36);

          id v12 = v53;
          uint64_t v13 = v56;
        }

        else
        {
          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v16 daDisk]);
          DADiskMountWithArguments( (DADiskRef)v28,  (CFURLRef)v21,  2u,  (DADiskMountCallback)sub_1000196D4,  self,  arguments);
          id v19 = (const __CFURL *)v21;
        }

        id v11 = v58;
        if (!-[SKBaseDiskArbOperation completeDiskArbOp](self, "completeDiskArbOp"))
        {
          if (v12)
          {
            if (v19) {
              goto LABEL_32;
            }
          }

          else
          {
            id v12 = -[SKBaseDiskArbOperation newDAError](self, "newDAError");
            if (v19)
            {
LABEL_32:
              __int16 v38 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v19, "path"));
              -[SKBaseDiskArbOperation removeWithMountPoint:](self, "removeWithMountPoint:", v38);
            }
          }
        }

        [(id)objc_opt_class(self) clearMountState:v16];
        -[NSMutableArray addObject:](v57, "addObject:", v16);

        goto LABEL_34;
      }

      id v18 = sub_10000E2BC();
      id v19 = (const __CFURL *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf[0]) = 136315394;
        *(void *)((char *)buf + 4) = "-[SKMountOperation newPerformOperation]";
        WORD2(buf[1]) = 2112;
        *(void *)((char *)&buf[1] + 6) = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s: %@ is already mounted, skipping",  (uint8_t *)buf,  0x16u);
      }

- (BOOL)force
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:kSKDiskMountOptionForce]);
  unsigned __int8 v4 = sub_100012488(v3);

  return v4;
}

- (id)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKMountOperation disksToMount](self, "disksToMount"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Mount Operation for %@ with %@",  v3,  v4));

  return v5;
}

- (int64_t)defaultErrorCode
{
  return 400LL;
}

- (BOOL)authenticateOnInit
{
  return self->_authenticateOnInit;
}

- (void)setAuthenticateOnInit:(BOOL)a3
{
  self->_authenticateOnInit = a3;
}

- (NSSet)disksToMount
{
  return self->_disksToMount;
}

- (unsigned)clientUID
{
  return self->_clientUID;
}

- (NSString)mountPoint
{
  return self->_mountPoint;
}

- (void)setMountPoint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end