@interface SKBaseDiskArbOperation
+ (id)getMountState:(id)a3;
+ (void)clearMountState:(id)a3;
+ (void)storeMountState:(id)a3;
- (BOOL)completeDiskArbOp;
- (BOOL)diskArbOpDone;
- (BOOL)raidTraverse;
- (BOOL)recursive;
- (BOOL)run;
- (BOOL)toOperateWithDisk:(id)a3;
- (NSDictionary)options;
- (NSString)DAstatusString;
- (NSString)currentOperationName;
- (SKBaseDiskArbOperation)initWithTarget:(id)a3 options:(id)a4 callbackBlock:(id)a5;
- (id)callbackBlock;
- (id)diskWithFSRefresh:(id)a3;
- (id)disksForOperationWithTarget:(id)a3 ignoreGroup:(BOOL)a4;
- (id)newDAError;
- (id)newPerformOperation;
- (int)DAstatus;
- (int)dissenterPID;
- (int64_t)defaultErrorCode;
- (void)diskArbCallbackWithDissenter:(__DADissenter *)a3;
- (void)removeWithMountPoint:(id)a3;
- (void)setCallbackBlock:(id)a3;
- (void)setCurrentOperationName:(id)a3;
- (void)setDAstatus:(int)a3;
- (void)setDAstatusString:(id)a3;
- (void)setDiskArbOpDone:(BOOL)a3;
- (void)setDissenterPID:(int)a3;
- (void)setOptions:(id)a3;
@end

@implementation SKBaseDiskArbOperation

+ (void)storeMountState:(id)a3
{
  id v7 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue([v7 mountPoint]);

  if (v3)
  {
    v4 = objc_alloc(&OBJC_CLASS___SKMountState);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v7 mountPoint]);
    v6 = -[SKMountState initWithMountPoint:](v4, "initWithMountPoint:", v5);

    [v7 setPreviousMount:v6];
  }
}

+ (id)getMountState:(id)a3
{
  return [a3 previousMount];
}

+ (void)clearMountState:(id)a3
{
}

- (SKBaseDiskArbOperation)initWithTarget:(id)a3 options:(id)a4 callbackBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___SKBaseDiskArbOperation;
  v11 = -[SKManagerOperation init](&v24, "init");
  if (v8
    && (uint64_t v12 = objc_claimAutoreleasedReturnValue([v8 daDisk])) != 0
    && (v13 = (void *)v12, unsigned int v14 = [v8 isValid], v13, v14)
    && v11)
  {
    if (v9) {
      v15 = v9;
    }
    else {
      v15 = &__NSDictionary0__struct;
    }
    objc_storeStrong((id *)&v11->_options, v15);
    id v16 = [v10 copy];
    id callbackBlock = v11->_callbackBlock;
    v11->_id callbackBlock = v16;

    v18 = v11;
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager"));
    [v19 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&stru_100045238];

    id v20 = sub_10000E2BC();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      v26 = "-[SKBaseDiskArbOperation initWithTarget:options:callbackBlock:]";
      __int16 v27 = 2112;
      id v28 = v8;
      __int16 v29 = 2112;
      v30 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_FAULT,  "%s: Reached with invalid disk (%@) or init failed (%@)",  buf,  0x20u);
    }

    if (v10)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", 102LL, 0LL));
      (*((void (**)(id, void *))v10 + 2))(v10, v22);
    }

    v18 = 0LL;
  }

  return v18;
}

- (BOOL)recursive
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:kSKDiskMountOptionRecursive]);

  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (BOOL)raidTraverse
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:kSKDiskMountOptionRecursiveRAID]);

  LOBYTE(v2) = sub_100012488(v3);
  return (char)v2;
}

- (id)diskWithFSRefresh:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 filesystem]);
  if (v4)
  {

LABEL_5:
    id v7 = v3;
    goto LABEL_6;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 diskIdentifier]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"/dev/%@", v5));
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[SKMediaKit getMediaKitFilesystemType:](&OBJC_CLASS___SKMediaKit, "getMediaKitFilesystemType:", v6));

  if (v7) {
    goto LABEL_5;
  }
LABEL_6:

  return v7;
}

- (id)disksForOperationWithTarget:(id)a3 ignoreGroup:(BOOL)a4
{
  id v5 = a3;
  id v67 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  if (-[SKBaseDiskArbOperation recursive](self, "recursive"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v5));
    if ([v5 isWholeDisk])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 children]);
      if (v7) {
        [v6 addObjectsFromArray:v7];
      }
    }

    v61 = v5;
    -[SKBaseDiskArbOperation raidTraverse](self, "raidTraverse");
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    id obj = v6;
    id v8 = [obj countByEnumeratingWithState:&v76 objects:v82 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v77;
      v11 = &APFSCancelContainerResize_ptr;
      uint64_t v62 = *(void *)v77;
      do
      {
        uint64_t v12 = 0LL;
        id v64 = v9;
        do
        {
          if (*(void *)v77 != v10) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(id *)(*((void *)&v76 + 1) + 8LL * (void)v12);
          uint64_t v14 = objc_opt_class(v11[120]);
          if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
          {
            uint64_t v15 = objc_claimAutoreleasedReturnValue([v13 container]);
            if (!v15) {
              goto LABEL_58;
            }
            id v16 = (void *)v15;

            id v13 = v16;
          }

          uint64_t v17 = objc_opt_class(&OBJC_CLASS___SKAPFSContainerDisk);
          if ((objc_opt_isKindOfClass(v13, v17) & 1) != 0)
          {
            v18 = v12;
            id v19 = v13;
            id v20 = v13;
            v21 = (void *)objc_claimAutoreleasedReturnValue([v20 volumes]);
            __int128 v72 = 0u;
            __int128 v73 = 0u;
            __int128 v74 = 0u;
            __int128 v75 = 0u;
            id v22 = [v21 countByEnumeratingWithState:&v72 objects:v81 count:16];
            if (v22)
            {
              id v23 = v22;
              uint64_t v24 = *(void *)v73;
              do
              {
                for (i = 0LL; i != v23; i = (char *)i + 1)
                {
                  if (*(void *)v73 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  uint64_t v26 = *(void *)(*((void *)&v72 + 1) + 8LL * (void)i);
                  if (-[SKBaseDiskArbOperation toOperateWithDisk:](self, "toOperateWithDisk:", v26)) {
                    [v67 addObject:v26];
                  }
                }

                id v23 = [v21 countByEnumeratingWithState:&v72 objects:v81 count:16];
              }

              while (v23);
            }

            v11 = &APFSCancelContainerResize_ptr;
            id v9 = v64;
            uint64_t v12 = v18;
            id v13 = v19;
            goto LABEL_57;
          }

          __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v13 type]);
          if ([v27 isEqualToString:kSKDiskTypeEFI])
          {
            id v28 = v12;
            id v29 = v13;
            v30 = (void *)objc_claimAutoreleasedReturnValue([v13 diskIdentifier]);
            v31 = (void *)objc_claimAutoreleasedReturnValue([v61 diskIdentifier]);
            if (![v30 isEqualToString:v31])
            {
              v52 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
              v53 = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKeyedSubscript:kSKDiskMountOptionWithoutEFI]);
              unsigned __int8 v54 = sub_100012488(v53);

              uint64_t v12 = v28;
              id v13 = v29;
              v11 = &APFSCancelContainerResize_ptr;
              id v9 = v64;
              if ((v54 & 1) != 0)
              {
                uint64_t v10 = v62;
                goto LABEL_58;
              }

              goto LABEL_29;
            }

            uint64_t v12 = v28;
            id v13 = v29;
            v11 = &APFSCancelContainerResize_ptr;
            id v9 = v64;
          }

LABEL_29:
          uint64_t v32 = objc_opt_class(&OBJC_CLASS___SKAPFSDisk);
          if ((objc_opt_isKindOfClass(v13, v32) & 1) == 0
            || (v33 = (void *)objc_claimAutoreleasedReturnValue([v13 apfsVolumeGroupUUID]),
                v33,
                !v33)
            || a4)
          {
            id v20 = (id)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation diskWithFSRefresh:](self, "diskWithFSRefresh:", v13));
            if (v20) {
              [v67 addObject:v20];
            }
            uint64_t v10 = v62;
            goto LABEL_57;
          }

          v60 = v12;
          id v20 = (id)objc_claimAutoreleasedReturnValue([v13 apfsVolumeGroupUUID]);
          id v59 = v13;
          v34 = (void *)objc_claimAutoreleasedReturnValue([v13 container]);
          __int128 v68 = 0u;
          __int128 v69 = 0u;
          __int128 v70 = 0u;
          __int128 v71 = 0u;
          v35 = (void *)objc_claimAutoreleasedReturnValue([v34 volumes]);
          id v36 = [v35 countByEnumeratingWithState:&v68 objects:v80 count:16];
          if (!v36)
          {

            v38 = 0LL;
            v51 = 0LL;
            uint64_t v10 = v62;
            goto LABEL_55;
          }

          id v37 = v36;
          v65 = 0LL;
          id v66 = v35;
          v57 = v34;
          v38 = 0LL;
          uint64_t v39 = *(void *)v69;
          do
          {
            for (j = 0LL; j != v37; j = (char *)j + 1)
            {
              if (*(void *)v69 != v39) {
                objc_enumerationMutation(v66);
              }
              v41 = *(void **)(*((void *)&v68 + 1) + 8LL * (void)j);
              v42 = (void *)objc_claimAutoreleasedReturnValue([v41 apfsVolumeGroupUUID]);
              unsigned int v43 = [v42 isEqualToString:v20];

              if (v43)
              {
                v44 = (void *)objc_claimAutoreleasedReturnValue([v41 getAPFSVolumeRole]);
                unsigned __int8 v45 = [v44 isEqualToString:SKAPFSVolumeRoleData];

                if ((v45 & 1) != 0)
                {
                  v46 = v65;
                  v65 = v41;
                  v47 = v38;
                }

                else
                {
                  v48 = (void *)objc_claimAutoreleasedReturnValue([v41 getAPFSVolumeRole]);
                  unsigned int v49 = [v48 isEqualToString:SKAPFSVolumeRoleSystem];

                  v46 = v38;
                  v47 = v41;
                  if (!v49) {
                    continue;
                  }
                }

                id v50 = v41;

                v38 = v47;
              }
            }

            id v37 = [v66 countByEnumeratingWithState:&v68 objects:v80 count:16];
          }

          while (v37);

          v51 = v65;
          if (v65)
          {
            uint64_t v10 = v62;
            v11 = &APFSCancelContainerResize_ptr;
            id v9 = v64;
            id v13 = v59;
            uint64_t v12 = v60;
            if (v38)
            {
              [v67 addObject:v65];
              [v67 addObject:v38];
              v34 = v57;
              goto LABEL_56;
            }
          }

          else
          {
            uint64_t v10 = v62;
            v11 = &APFSCancelContainerResize_ptr;
            id v9 = v64;
            id v13 = v59;
            uint64_t v12 = v60;
          }

          v34 = v57;
LABEL_55:
          [v67 addObject:v13];
LABEL_56:

LABEL_57:
LABEL_58:

          uint64_t v12 = (char *)v12 + 1;
        }

        while (v12 != v9);
        id v9 = [obj countByEnumeratingWithState:&v76 objects:v82 count:16];
      }

      while (v9);
    }

    id v5 = v61;
  }

  else
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation diskWithFSRefresh:](self, "diskWithFSRefresh:", v5));
    if (v55) {
      [v67 addObject:v55];
    }
  }

  return v67;
}

- (BOOL)toOperateWithDisk:(id)a3
{
  return 1;
}

- (void)diskArbCallbackWithDissenter:(__DADissenter *)a3
{
  if (a3)
  {
    -[SKBaseDiskArbOperation setDAstatus:](self, "setDAstatus:", DADissenterGetStatus(a3));
    -[SKBaseDiskArbOperation setDissenterPID:](self, "setDissenterPID:", DADissenterGetProcessID(a3));
    -[SKBaseDiskArbOperation setDAstatusString:](self, "setDAstatusString:", DADissenterGetStatusString(a3));
    id v5 = sub_10000E2BC();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation currentOperationName](self, "currentOperationName"));
      unsigned int v8 = -[SKBaseDiskArbOperation DAstatus](self, "DAstatus");
      unsigned int v9 = -[SKBaseDiskArbOperation dissenterPID](self, "dissenterPID");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation DAstatusString](self, "DAstatusString"));
      if (v10) {
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation DAstatusString](self, "DAstatusString"));
      }
      else {
        v11 = @"(no status details)";
      }
      int v14 = 136316162;
      uint64_t v15 = "-[SKBaseDiskArbOperation diskArbCallbackWithDissenter:]";
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      __int16 v18 = 1024;
      unsigned int v19 = v8;
      __int16 v20 = 1024;
      unsigned int v21 = v9;
      __int16 v22 = 2112;
      id v23 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s: %@: dissented with status 0x%x by pid %d: %@",  (uint8_t *)&v14,  0x2Cu);
      if (v10) {

      }
      goto LABEL_11;
    }
  }

  else
  {
    -[SKBaseDiskArbOperation setDAstatus:](self, "setDAstatus:");
    id v12 = sub_10000E2BC();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation currentOperationName](self, "currentOperationName"));
      int v14 = 136315394;
      uint64_t v15 = "-[SKBaseDiskArbOperation diskArbCallbackWithDissenter:]";
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@: success", (uint8_t *)&v14, 0x16u);
LABEL_11:
    }
  }

  -[SKBaseDiskArbOperation setDiskArbOpDone:](self, "setDiskArbOpDone:", 1LL);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  [v13 dispatchToWorkThread:&stru_100045258];
}

- (BOOL)completeDiskArbOp
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation currentOperationName](self, "currentOperationName"));

  if (!v3)
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation description](self, "description"));
    -[SKBaseDiskArbOperation setCurrentOperationName:](self, "setCurrentOperationName:", v4);
  }

  id v5 = sub_10000E2BC();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation currentOperationName](self, "currentOperationName"));
    int v12 = 136315394;
    id v13 = "-[SKBaseDiskArbOperation completeDiskArbOp]";
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@: running", (uint8_t *)&v12, 0x16u);
  }

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  if (!-[SKBaseDiskArbOperation diskArbOpDone](self, "diskArbOpDone"))
  {
    do
    {
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 1.0));
      [v8 runMode:NSDefaultRunLoopMode beforeDate:v9];
    }

    while (!-[SKBaseDiskArbOperation diskArbOpDone](self, "diskArbOpDone"));
  }

  -[SKBaseDiskArbOperation setDiskArbOpDone:](self, "setDiskArbOpDone:", 0LL);
  BOOL v10 = -[SKBaseDiskArbOperation DAstatus](self, "DAstatus") == 0;

  return v10;
}

- (id)newDAError
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation DAstatusString](self, "DAstatusString"));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation DAstatusString](self, "DAstatusString"));
    [v3 setObject:v5 forKeyedSubscript:kSKErrorDiskArbErrorStringKey];

    uint64_t v6 = -[SKBaseDiskArbOperation DAstatus](self, "DAstatus");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation DAstatusString](self, "DAstatusString"));
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DA error code 0x%x: %@",  v6,  v7));
  }

  else
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DA error code 0x%x",  -[SKBaseDiskArbOperation DAstatus](self, "DAstatus")));
  }

  unsigned int v9 = -[SKBaseDiskArbOperation dissenterPID](self, "dissenterPID");
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation description](self, "description"));
  v11 = (void *)v10;
  if (v9)
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ dissented by process with PID %d, %@",  v10,  -[SKBaseDiskArbOperation dissenterPID](self, "dissenterPID"),  v8));
    [v3 setObject:v12 forKeyedSubscript:NSDebugDescriptionErrorKey];

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[SKBaseDiskArbOperation dissenterPID](self, "dissenterPID")));
    [v3 setObject:v11 forKeyedSubscript:kSKErrorDissenterPIDKey];
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ failed, %@",  v10,  v8));
    [v3 setObject:v13 forKeyedSubscript:NSDebugDescriptionErrorKey];
  }

  if (-[SKBaseDiskArbOperation DAstatus](self, "DAstatus") < 49152
    || -[SKBaseDiskArbOperation DAstatus](self, "DAstatus") > 49258)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:userInfo:",  -[SKBaseDiskArbOperation defaultErrorCode](self, "defaultErrorCode"),  v3));
  }

  else
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  (int)(-[SKBaseDiskArbOperation DAstatus](self, "DAstatus") & 0xFFFF3FFF),  v3));
  }

  uint64_t v15 = (void *)v14;

  return v15;
}

- (id)newPerformOperation
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"No implementation provided for generic base class.",  0LL));
  objc_exception_throw(v2);
  return (id)-[SKBaseDiskArbOperation run](v3, v4);
}

- (BOOL)run
{
  id v3 = -[SKBaseDiskArbOperation newPerformOperation](self, "newPerformOperation");
  SEL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation callbackBlock](self, "callbackBlock"));

  if (v4)
  {
    id v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation callbackBlock](self, "callbackBlock"));
    ((void (**)(void, id))v5)[2](v5, v3);
  }

  -[SKManagerOperation finished](self, "finished");

  return v3 == 0LL;
}

- (void)removeWithMountPoint:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"/private/var/mnt"])
  {
    SEL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v14 = 0LL;
    unsigned int v5 = [v4 removeItemAtPath:v3 error:&v14];
    id v6 = v14;

    id v7 = sub_10000E2BC();
    unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    unsigned int v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v3;
        uint64_t v10 = "Removed %@";
        v11 = v9;
        os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
        uint32_t v13 = 12;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, buf, v13);
      }
    }

    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v3;
      __int16 v17 = 2112;
      id v18 = v6;
      uint64_t v10 = "Failed to remove %@: %@";
      v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 22;
      goto LABEL_7;
    }
  }
}

- (id)callbackBlock
{
  return self->_callbackBlock;
}

- (void)setCallbackBlock:(id)a3
{
}

- (int)dissenterPID
{
  return self->_dissenterPID;
}

- (void)setDissenterPID:(int)a3
{
  self->_dissenterPID = a3;
}

- (int)DAstatus
{
  return self->_DAstatus;
}

- (void)setDAstatus:(int)a3
{
  self->_DAstatus = a3;
}

- (NSString)DAstatusString
{
  return self->_DAstatusString;
}

- (void)setDAstatusString:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSString)currentOperationName
{
  return self->_currentOperationName;
}

- (void)setCurrentOperationName:(id)a3
{
}

- (int64_t)defaultErrorCode
{
  return self->_defaultErrorCode;
}

- (BOOL)diskArbOpDone
{
  return self->_diskArbOpDone;
}

- (void)setDiskArbOpDone:(BOOL)a3
{
  self->_diskArbOpDone = a3;
}

- (void).cxx_destruct
{
}

@end