@interface IXSCoordinatorManager
+ (NSURL)saveDir;
+ (id)prioritySaveURL;
+ (id)savePathForCoordinator:(id)a3;
+ (id)sharedInstance;
- (BOOL)_coordinator:(id)a3 isApplicableToConnection:(id)a4;
- (BOOL)_onMapQueue_removeCoordinatorFromMaps:(id)a3;
- (BOOL)prioritizeCoordinator:(id)a3;
- (BOOL)prioritizeCoordinatorWithIdentity:(id)a3;
- (IXSCoordinatorManager)init;
- (NSMutableArray)identityPriority;
- (NSMutableDictionary)connectionToProcessScopedCoordinatorMap;
- (NSMutableDictionary)identityToCoordinatorMap;
- (NSMutableDictionary)uuidToCoordinatorMap;
- (OS_dispatch_queue)createQueue;
- (OS_dispatch_queue)mapQueue;
- (id)_lookupCoordinatorForIdentity:(id)a3;
- (id)_lookupCoordinatorForIdentity:(id)a3 checkingScopeForConnection:(id)a4 error:(id *)a5;
- (id)coordinatorForIdentity:(id)a3;
- (id)coordinatorForIdentity:(id)a3 connection:(id)a4 error:(id *)a5 creatingIfNotExisting:(id)a6;
- (id)coordinatorForUUID:(id)a3;
- (id)coordinatorsForBundleIdentifier:(id)a3;
- (unint64_t)coordinatorCount;
- (void)_enumerateCoordinatorsForConnection:(id)a3 usingBlock:(id)a4;
- (void)_onMapQueue_saveIdentityPriority;
- (void)clearAllCoordinatorsForCreator:(unint64_t)a3;
- (void)connectionInvalidated:(id)a3;
- (void)convertProcessScopedCoordinatorToGlobalScoped:(id)a3;
- (void)enumerateCoordinators:(id)a3;
- (void)enumerateCoordinatorsApplicableToConnection:(id)a3 usingBlock:(id)a4;
- (void)performCreationBlockingOperation:(id)a3;
- (void)unregisterCoordinator:(id)a3;
@end

@implementation IXSCoordinatorManager

+ (id)savePathForCoordinator:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 saveDir]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identity]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.plist", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:v8 isDirectory:0]);

  return v9;
}

+ (NSURL)saveDir
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IXGlobalConfiguration sharedInstance](&OBJC_CLASS___IXGlobalConfiguration, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dataDirectoryAbortingOnError]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@"Coordinators" isDirectory:1]);
  return (NSURL *)v4;
}

+ (id)prioritySaveURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IXGlobalConfiguration sharedInstance](&OBJC_CLASS___IXGlobalConfiguration, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dataDirectoryAbortingOnError]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@"CoordinatorPriority.plist" isDirectory:0]);
  return v4;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000CB2C;
  block[3] = &unk_1000CCB20;
  block[4] = a1;
  if (qword_1000E8E60 != -1) {
    dispatch_once(&qword_1000E8E60, block);
  }
  return (id)qword_1000E8E58;
}

- (unint64_t)coordinatorCount
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager mapQueue](self, "mapQueue"));
  dispatch_assert_queue_not_V2(v3);
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000CBF8;
  v6[3] = &unk_1000CCEF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (IXSCoordinatorManager)init
{
  v179.receiver = self;
  v179.super_class = (Class)&OBJC_CLASS___IXSCoordinatorManager;
  v2 = -[IXSCoordinatorManager init](&v179, "init");
  if (!v2) {
    return v2;
  }
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  unint64_t v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.installcoordinationd.IXSCoordinatorManager", v4);
  mapQueue = v2->_mapQueue;
  v2->_mapQueue = (OS_dispatch_queue *)v5;

  dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.installcoordinationd.IXSCoordinatorManager.create", v8);
  createQueue = v2->_createQueue;
  v2->_createQueue = (OS_dispatch_queue *)v9;

  v11 = &APP_SANDBOX_READ_WRITE_ptr;
  v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  connectionToProcessScopedCoordinatorMap = v2->_connectionToProcessScopedCoordinatorMap;
  v2->_connectionToProcessScopedCoordinatorMap = v12;

  id v14 = [(id)objc_opt_class(v2) saveDir];
  uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
  id v178 = 0LL;
  v138 = (os_log_s *)v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 urlsForItemsInDirectoryAtURL:v15 ignoringSymlinks:1 error:&v178]);
  id v18 = v178;

  v137 = v17;
  if (v17)
  {
    v19 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    identityToCoordinatorMap = v2->_identityToCoordinatorMap;
    v2->_identityToCoordinatorMap = v19;

    v21 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uuidToCoordinatorMap = v2->_uuidToCoordinatorMap;
    v2->_uuidToCoordinatorMap = v21;

    dispatch_queue_attr_t v23 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v23);
    dispatch_queue_t v139 = dispatch_queue_create("com.apple.installcoordinationd.IXSCoordinatorManager.cancelQueue", v24);

    __int128 v176 = 0u;
    __int128 v177 = 0u;
    __int128 v174 = 0u;
    __int128 v175 = 0u;
    id obj = v17;
    id v25 = [obj countByEnumeratingWithState:&v174 objects:v191 count:16];
    if (!v25) {
      goto LABEL_47;
    }
    id v26 = v25;
    uint64_t v27 = *(void *)v175;
    uint64_t v148 = *(void *)v175;
    while (1)
    {
      v28 = 0LL;
      id v150 = v26;
      do
      {
        if (*(void *)v175 != v27) {
          objc_enumerationMutation(obj);
        }
        v29 = *(void **)(*((void *)&v174 + 1) + 8LL * (void)v28);
        v30 = objc_autoreleasePoolPush();
        v31 = (void *)objc_claimAutoreleasedReturnValue([v29 lastPathComponent]);
        unsigned __int8 v32 = [v31 hasPrefix:@"."];

        if ((v32 & 1) == 0)
        {
          id v173 = v18;
          v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v29,  3LL,  &v173));
          id v34 = v173;

          if (v33)
          {
            v35 = objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver);
            id v172 = v34;
            v36 = -[NSKeyedUnarchiver initForReadingFromData:error:](v35, "initForReadingFromData:error:", v33, &v172);
            id v18 = v172;

            if (v36)
            {
              v37 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  objc_opt_class(&OBJC_CLASS___IXSCoordinatedAppInstall),  0LL);
              v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
              uint64_t v39 = objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodeObjectOfClasses:forKey:]( v36,  "decodeObjectOfClasses:forKey:",  v38,  NSKeyedArchiveRootObjectKey));
              if (v39)
              {
                v40 = (void *)v39;
                -[NSKeyedUnarchiver finishDecoding](v36, "finishDecoding");

                v41 = (void *)objc_claimAutoreleasedReturnValue([v40 identity]);
                if (v41)
                {
                  [v40 setIsTracked:1];
                  id v171 = 0LL;
                  unsigned int v42 = [v40 awakeFromSerializationWithError:&v171];
                  id v43 = v171;
                  id v44 = v43;
                  if (!v42) {
                    goto LABEL_44;
                  }
                  v144 = v43;
                  v45 = (void *)objc_claimAutoreleasedReturnValue([v40 identity]);
                  uint64_t v46 = objc_claimAutoreleasedReturnValue([v40 uniqueIdentifier]);
                  v47 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_identityToCoordinatorMap,  "objectForKeyedSubscript:",  v45));
                  uint64_t v48 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_uuidToCoordinatorMap,  "objectForKeyedSubscript:",  v46));
                  v142 = (void *)v46;
                  v143 = (os_log_s *)v48;
                  if (v47)
                  {
                    v140 = v45;
                    v49 = sub_1000047B4((uint64_t)off_1000E8CA0);
                    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315906;
                      v184 = "-[IXSCoordinatorManager init]";
                      __int16 v185 = 2112;
                      v186 = v47;
                      __int16 v187 = 2112;
                      uint64_t v188 = (uint64_t)v40;
                      __int16 v189 = 2112;
                      uint64_t v190 = 0LL;
                      _os_log_error_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "%s: Discovered already registered coordinator %@; canceling deserialized coordinator with the sa"
                        "me identity %@ : %@",
                        buf,
                        0x2Au);
                    }

                    int v51 = 1;
                    id v53 = sub_10003556C( (uint64_t)"-[IXSCoordinatorManager init]",  150LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Discovered already registered coordinator %@; canceling deserialized coordinator with the same identity %@",
                            v52,
                            (uint64_t)v47);
                    uint64_t v54 = objc_claimAutoreleasedReturnValue(v53);

                    v144 = (void *)v54;
                    v45 = v140;
                  }

                  else
                  {
                    if (v48)
                    {
                      v141 = v45;
                      v65 = sub_1000047B4((uint64_t)off_1000E8CA0);
                      v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
                      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136315906;
                        v184 = "-[IXSCoordinatorManager init]";
                        __int16 v185 = 2112;
                        v186 = v143;
                        __int16 v187 = 2112;
                        uint64_t v188 = (uint64_t)v40;
                        __int16 v189 = 2112;
                        uint64_t v190 = 0LL;
                        _os_log_error_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_ERROR,  "%s: Discovered already registered coordinator %@; canceling deserialized coordinator with the "
                          "same UUID %@ : %@",
                          buf,
                          0x2Au);
                      }

                      int v51 = 1;
                      id v68 = sub_10003556C( (uint64_t)"-[IXSCoordinatorManager init]",  153LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Discovered already registered coordinator %@; canceling deserialized coordinator with the same UUID %@",
                              v67,
                              (uint64_t)v143);
                      uint64_t v69 = objc_claimAutoreleasedReturnValue(v68);

                      v144 = (void *)v69;
                      v45 = v141;
                    }

                    else
                    {
                      -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_identityToCoordinatorMap,  "setObject:forKeyedSubscript:",  v40,  v45);
                      -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_uuidToCoordinatorMap,  "setObject:forKeyedSubscript:",  v40,  v46);
                      int v51 = 0;
                    }

                    v47 = 0LL;
                  }

                  id v44 = v144;
                  if (v51)
                  {
LABEL_44:
                    [v40 setIsTracked:0];
                    v168[0] = _NSConcreteStackBlock;
                    v168[1] = 3221225472LL;
                    v168[2] = sub_10000DDAC;
                    v168[3] = &unk_1000CCCB8;
                    id v169 = v40;
                    id v44 = v44;
                    id v170 = v44;
                    sub_10005A8F0(v139, v168);
                  }

                  id v26 = v150;
                  goto LABEL_32;
                }

                v64 = sub_1000047B4((uint64_t)off_1000E8CA0);
                v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
                if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v184 = "-[IXSCoordinatorManager init]";
                  __int16 v185 = 2112;
                  v186 = (os_log_s *)v40;
                  v62 = v61;
                  v63 = "%s: Somehow got coordinator without identity : %@";
LABEL_28:
                  _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, v63, buf, 0x16u);
                }

                goto LABEL_30;
              }

              v58 = sub_1000047B4((uint64_t)off_1000E8CA0);
              v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                v145 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 path]);
                uint64_t v71 = objc_claimAutoreleasedReturnValue(-[NSKeyedUnarchiver error](v36, "error"));
                *(_DWORD *)buf = 136315650;
                v184 = "-[IXSCoordinatorManager init]";
                __int16 v185 = 2112;
                v186 = v145;
                __int16 v187 = 2112;
                uint64_t v188 = v71;
                v72 = (void *)v71;
                _os_log_error_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_ERROR,  "%s: Failed to decode coordinator from data at %@ : %@",  buf,  0x20u);
              }

              -[NSKeyedUnarchiver finishDecoding](v36, "finishDecoding");
            }

            else
            {
              v56 = sub_1000047B4((uint64_t)off_1000E8CA0);
              v38 = (void *)objc_claimAutoreleasedReturnValue(v56);
              if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR))
              {
                v57 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 path]);
                *(_DWORD *)buf = 136315650;
                v184 = "-[IXSCoordinatorManager init]";
                __int16 v185 = 2112;
                v186 = v57;
                __int16 v187 = 2112;
                uint64_t v188 = (uint64_t)v18;
                _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v38,  OS_LOG_TYPE_ERROR,  "%s: Failed to create unarchiver to deserialize coordinator at %@ : %@",  buf,  0x20u);
              }
            }

            v60 = sub_1000047B4((uint64_t)off_1000E8CA0);
            v40 = (void *)objc_claimAutoreleasedReturnValue(v60);
            if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEFAULT))
            {
              v61 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 path]);
              *(_DWORD *)buf = 136315394;
              v184 = "-[IXSCoordinatorManager init]";
              __int16 v185 = 2112;
              v186 = v61;
              v62 = (os_log_s *)v40;
              v63 = "%s: Failed to decode coordinator from %@";
              goto LABEL_28;
            }

- (BOOL)_onMapQueue_removeCoordinatorFromMaps:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager mapQueue](self, "mapQueue"));
  dispatch_assert_queue_V2(v5);

  if ([v4 isTracked])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
    if (v6)
    {
      dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager uuidToCoordinatorMap](self, "uuidToCoordinatorMap"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);

      if (v8)
      {
        dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 identity]);
        BOOL v10 = v9 != 0LL;
        if (v9)
        {
          [v4 setIsTracked:0];
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager identityToCoordinatorMap](self, "identityToCoordinatorMap"));
          [v11 removeObjectForKey:v9];

          v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager uuidToCoordinatorMap](self, "uuidToCoordinatorMap"));
          [v12 removeObjectForKey:v6];

          v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager identityPriority](self, "identityPriority"));
          [v13 removeObject:v9];

          id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 scopedToConnection]);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 connectionUUID]);

          if (v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue( -[IXSCoordinatorManager connectionToProcessScopedCoordinatorMap]( self,  "connectionToProcessScopedCoordinatorMap"));
            v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v15]);

            [v17 removeObject:v4];
            if (![v17 count])
            {
              id v18 = (void *)objc_claimAutoreleasedReturnValue( -[IXSCoordinatorManager connectionToProcessScopedCoordinatorMap]( self,  "connectionToProcessScopedCoordinatorMap"));
              [v18 removeObjectForKey:v15];
            }
          }
        }

        goto LABEL_14;
      }

      [v4 setIsTracked:0];
    }

    BOOL v10 = 0;
LABEL_14:

    goto LABEL_15;
  }

  BOOL v10 = 0;
LABEL_15:

  return v10;
}

- (void)_onMapQueue_saveIdentityPriority
{
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager mapQueue](self, "mapQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = [(id)objc_opt_class(self) prioritySaveURL];
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager identityPriority](self, "identityPriority"));
  id v15 = 0LL;
  dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  &v15));
  id v8 = v15;

  if (!v7)
  {
    v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[IXSCoordinatorManager _onMapQueue_saveIdentityPriority]";
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to archive identity priority array: %@",  buf,  0x16u);
    }

    goto LABEL_8;
  }

  id v14 = v8;
  unsigned __int8 v9 = [v7 writeToURL:v5 options:1 error:&v14];
  id v10 = v14;

  if ((v9 & 1) == 0)
  {
    v11 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v17 = "-[IXSCoordinatorManager _onMapQueue_saveIdentityPriority]";
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to save coordinator priority array to %@ : %@",  buf,  0x20u);
    }

    id v8 = v10;
LABEL_8:

    id v10 = v8;
  }
}

- (BOOL)_coordinator:(id)a3 isApplicableToConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v11 = 1;
  if (v5)
  {
    if ([v5 coordinatorScope] == 1)
    {
      dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 scopedToConnection]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 connectionUUID]);

      if (v8)
      {
        unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 connectionUUID]);
        unsigned int v10 = [v9 isEqual:v8];

        if (!v10) {
          BOOL v11 = 0;
        }
      }
    }
  }

  return v11;
}

- (id)coordinatorForUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_10000E344;
  v16 = sub_10000E354;
  id v17 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager mapQueue](self, "mapQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E35C;
  block[3] = &unk_1000CCF40;
  id v10 = v4;
  BOOL v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)coordinatorForIdentity:(id)a3
{
  return -[IXSCoordinatorManager _lookupCoordinatorForIdentity:](self, "_lookupCoordinatorForIdentity:", a3);
}

- (id)coordinatorsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager mapQueue](self, "mapQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E488;
  block[3] = &unk_1000CCF90;
  block[4] = self;
  id v12 = v4;
  v13 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_sync(v6, block);

  id v9 = -[NSMutableSet copy](v7, "copy");
  return v9;
}

- (id)_lookupCoordinatorForIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_10000E344;
  v16 = sub_10000E354;
  id v17 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager mapQueue](self, "mapQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E698;
  block[3] = &unk_1000CCF40;
  id v10 = v4;
  BOOL v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_lookupCoordinatorForIdentity:(id)a3 checkingScopeForConnection:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  v40 = sub_10000E344;
  v41 = sub_10000E354;
  id v42 = 0LL;
  uint64_t v33 = 0LL;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  char v36 = 0;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager mapQueue](self, "mapQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000EA10;
  block[3] = &unk_1000CCFB8;
  v31 = &v37;
  block[4] = self;
  id v11 = v8;
  id v30 = v11;
  unsigned __int8 v32 = &v33;
  dispatch_sync(v10, block);

  if (!v38[5]) {
    goto LABEL_6;
  }
  if (*((_BYTE *)v34 + 24))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 clientName]);
    id v14 = sub_10003556C( (uint64_t)"-[IXSCoordinatorManager _lookupCoordinatorForIdentity:checkingScopeForConnection:error:]",  399LL,  @"IXErrorDomain",  0x2FuLL,  0LL,  0LL,  @"Creator of this process-scoped coordinator, %@, has gone away; canceling coordinator.",
            v13,
            (uint64_t)v12);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    [(id)v38[5] cancelForReason:v15 client:15 error:0];
    v16 = (void *)v38[5];
    v38[5] = 0LL;

    if (!v38[5])
    {
LABEL_6:
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v9 clientName]);
      id v20 = sub_10003556C( (uint64_t)"-[IXSCoordinatorManager _lookupCoordinatorForIdentity:checkingScopeForConnection:error:]",  411LL,  @"IXErrorDomain",  6uLL,  0LL,  0LL,  @"Failed to locate an existing coordinated app install with bundle ID %@ for client %@",  v19,  (uint64_t)v11);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v20);
LABEL_8:

      goto LABEL_9;
    }
  }

  if (!-[IXSCoordinatorManager _coordinator:isApplicableToConnection:](self, "_coordinator:isApplicableToConnection:"))
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue([(id)v38[5] identity]);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([(id)v38[5] uniqueIdentifier]);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v9 clientName]);
    id v23 = sub_10003556C( (uint64_t)"-[IXSCoordinatorManager _lookupCoordinatorForIdentity:checkingScopeForConnection:error:]",  407LL,  @"IXErrorDomain",  0x30uLL,  0LL,  0LL,  @"Coordinator found for %@ with UUID %@ was process-scoped, but not for client %@.",  v22,  (uint64_t)v21);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v23);

    __int16 v18 = (void *)v38[5];
    v38[5] = 0LL;
    goto LABEL_8;
  }

  id v17 = 0LL;
LABEL_9:
  v24 = (void *)v38[5];
  if (a5 && !v24)
  {
    *a5 = v17;
    v24 = (void *)v38[5];
  }

  id v25 = v24;

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v25;
}

- (id)coordinatorForIdentity:(id)a3 connection:(id)a4 error:(id *)a5 creatingIfNotExisting:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v34 = 0LL;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  uint64_t v37 = sub_10000E344;
  v38 = sub_10000E354;
  id v39 = 0LL;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  v31 = sub_10000E344;
  unsigned __int8 v32 = sub_10000E354;
  id obj = 0LL;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[IXSCoordinatorManager _lookupCoordinatorForIdentity:checkingScopeForConnection:error:]( self,  "_lookupCoordinatorForIdentity:checkingScopeForConnection:error:",  v10,  v11,  &obj));
  objc_storeStrong(&v39, obj);
  id v33 = v13;
  if (!v29[5])
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([(id)v35[5] domain]);
    if ([v14 isEqualToString:@"IXErrorDomain"])
    {
      id v15 = [(id)v35[5] code];

      if (v12 && v15 == (id)6)
      {
        v16 = (void *)v35[5];
        v35[5] = 0LL;

        id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager createQueue](self, "createQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10000ED40;
        block[3] = &unk_1000CD008;
        id v25 = &v28;
        block[4] = self;
        id v22 = v10;
        id v23 = v11;
        id v24 = v12;
        id v26 = &v34;
        dispatch_sync(v17, block);
      }
    }

    else
    {
    }
  }

  __int16 v18 = (void *)v29[5];
  if (a5 && !v18)
  {
    *a5 = (id) v35[5];
    __int16 v18 = (void *)v29[5];
  }

  id v19 = v18;
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v19;
}

- (void)performCreationBlockingOperation:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager createQueue](self, "createQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000F294;
  v7[3] = &unk_1000CD030;
  id v8 = v4;
  id v6 = v4;
  sub_10005A8F0(v5, v7);
}

- (void)unregisterCoordinator:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager mapQueue](self, "mapQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F430;
  block[3] = &unk_1000CCF40;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  id v10 = v6;
  dispatch_sync(v5, block);

  if (*((_BYTE *)v13 + 24))
  {
    id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v17 = "-[IXSCoordinatorManager unregisterCoordinator:]";
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Unregistered coordinator: %@", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v12, 8);
}

- (BOOL)prioritizeCoordinatorWithIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0LL;
  char v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager mapQueue](self, "mapQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F62C;
  block[3] = &unk_1000CD058;
  block[4] = self;
  id v6 = v4;
  id v12 = v6;
  uint64_t v13 = &v14;
  dispatch_sync(v5, block);

  if (*((_BYTE *)v15 + 24))
  {
    id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "-[IXSCoordinatorManager prioritizeCoordinatorWithIdentity:]";
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: Prioritized coordinator with ID %@",  buf,  0x16u);
    }

    BOOL v9 = *((_BYTE *)v15 + 24) != 0;
  }

  else
  {
    BOOL v9 = 0;
  }

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (BOOL)prioritizeCoordinator:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 identity]);
  if (v4) {
    BOOL v5 = -[IXSCoordinatorManager prioritizeCoordinatorWithIdentity:](self, "prioritizeCoordinatorWithIdentity:", v4);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)enumerateCoordinators:(id)a3
{
}

- (void)enumerateCoordinatorsApplicableToConnection:(id)a3 usingBlock:(id)a4
{
}

- (void)_enumerateCoordinatorsForConnection:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = (unsigned int (**)(id, void))a4;
  uint64_t v19 = 0LL;
  __int16 v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_10000E344;
  id v23 = sub_10000E354;
  id v24 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager mapQueue](self, "mapQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F938;
  block[3] = &unk_1000CD080;
  block[4] = self;
  void block[5] = &v19;
  dispatch_sync(v8, block);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v9 = (id)v20[5];
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v11) {
        objc_enumerationMutation(v9);
      }
      uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * v12);
      if ((!v6
         || -[IXSCoordinatorManager _coordinator:isApplicableToConnection:]( self,  "_coordinator:isApplicableToConnection:",  *(void *)(*((void *)&v14 + 1) + 8 * v12),  v6,  (void)v14))
        && !v7[2](v7, v13))
      {
        break;
      }

      if (v10 == (id)++v12)
      {
        id v10 = [v9 countByEnumeratingWithState:&v14 objects:v25 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v19, 8);
}

- (void)clearAllCoordinatorsForCreator:(unint64_t)a3
{
  BOOL v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = IXStringForClientID(a3);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[IXSCoordinatorManager clearAllCoordinatorsForCreator:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Clearing all coordinators for creator %@",  buf,  0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  id v25 = sub_10000E344;
  id v26 = sub_10000E354;
  id v27 = 0LL;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager mapQueue](self, "mapQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000FDAC;
  block[3] = &unk_1000CCEF8;
  block[4] = self;
  void block[5] = buf;
  dispatch_sync(v9, block);

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v10 = *(id *)(*(void *)&buf[8] + 40LL);
  id v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    do
    {
      __int128 v14 = 0LL;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        __int128 v15 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v14);
        if (!a3 || [*(id *)(*((void *)&v18 + 1) + 8 * (void)v14) creator] == (id)a3)
        {
          id v16 = sub_10003556C( (uint64_t)"-[IXSCoordinatorManager clearAllCoordinatorsForCreator:]",  577LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Clearing all coordinators",  v11,  v18);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          [v15 cancelForReason:v17 client:15 error:0];
        }

        __int128 v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }

    while (v12);
  }

  _Block_object_dispose(buf, 8);
}

- (void)connectionInvalidated:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 connectionUUID]);
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  id v26 = sub_10000E344;
  id v27 = sub_10000E354;
  id v28 = 0LL;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager mapQueue](self, "mapQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010064;
  block[3] = &unk_1000CCF40;
  id v22 = &v23;
  block[4] = self;
  id v7 = v5;
  id v21 = v7;
  dispatch_sync(v6, block);

  if (v24[5])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 clientName]);
    id v10 = sub_10003556C( (uint64_t)"-[IXSCoordinatorManager connectionInvalidated:]",  607LL,  @"IXErrorDomain",  0x2FuLL,  0LL,  0LL,  @"Creator of this process-scoped coordinator, %@, has gone away; canceling coordinator.",
            v9,
            (uint64_t)v8);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v12 = (id)v24[5];
    id v13 = [v12 countByEnumeratingWithState:&v16 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v17;
      do
      {
        __int128 v15 = 0LL;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * (void)v15) cancelForReason:v11 client:15 error:0];
          __int128 v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v12 countByEnumeratingWithState:&v16 objects:v29 count:16];
      }

      while (v13);
    }
  }

  _Block_object_dispose(&v23, 8);
}

- (void)convertProcessScopedCoordinatorToGlobalScoped:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 scopedToConnection]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 connectionUUID]);

  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager mapQueue](self, "mapQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000102AC;
  block[3] = &unk_1000CCF90;
  block[4] = self;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_sync(v7, block);
}

- (OS_dispatch_queue)mapQueue
{
  return self->_mapQueue;
}

- (OS_dispatch_queue)createQueue
{
  return self->_createQueue;
}

- (NSMutableDictionary)identityToCoordinatorMap
{
  return self->_identityToCoordinatorMap;
}

- (NSMutableDictionary)uuidToCoordinatorMap
{
  return self->_uuidToCoordinatorMap;
}

- (NSMutableDictionary)connectionToProcessScopedCoordinatorMap
{
  return self->_connectionToProcessScopedCoordinatorMap;
}

- (NSMutableArray)identityPriority
{
  return self->_identityPriority;
}

- (void).cxx_destruct
{
}

@end