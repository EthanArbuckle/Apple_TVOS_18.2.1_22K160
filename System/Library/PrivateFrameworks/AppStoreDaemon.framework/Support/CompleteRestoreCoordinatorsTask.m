@interface CompleteRestoreCoordinatorsTask
- (void)main;
@end

@implementation CompleteRestoreCoordinatorsTask

- (void)main
{
  uint64_t v3 = ASDLogHandleForCategory(29LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v5 = self->super._error;
      id v6 = *(id *)&self->super._success;
      clientID = self->_clientID;
    }

    else
    {
      id v6 = 0LL;
      v5 = 0LL;
      clientID = 0LL;
    }

    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    v82 = clientID;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[%@] Checking for incomplete coordinators for client: %{public}@ reason: %{public}@",  buf,  0x20u);
  }

  v66 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  if (self)
  {
    id v8 = sub_10020FAD4((uint64_t)&OBJC_CLASS___RestoreManager);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = sub_1002102C0((uint64_t)v9);
    v64 = (void *)objc_claimAutoreleasedReturnValue(v10);

    uint64_t v74 = 0LL;
    v75 = &v74;
    uint64_t v76 = 0x3032000000LL;
    v77 = sub_1002FC730;
    v78 = sub_1002FC740;
    v79 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v70 = 0LL;
    v71 = &v70;
    uint64_t v72 = 0x2020000000LL;
    uint64_t v73 = 0LL;
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v11 = self->super._error;
    objc_opt_self(&OBJC_CLASS___CompleteRestoreCoordinatorsTask);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v14 = sub_1002EEBC0((uint64_t)&OBJC_CLASS___AppInstallsDatabaseStore);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(void *)v91 = _NSConcreteStackBlock;
    *(void *)&v91[8] = 3221225472LL;
    *(void *)&v91[16] = sub_1002FCF58;
    v92 = &unk_1003EF8D8;
    id v93 = v13;
    id v94 = v12;
    v95 = v11;
    v16 = v11;
    id v17 = v12;
    id v18 = v13;
    [v15 readUsingSession:v91];

    v19 = objc_alloc(&OBJC_CLASS___CompleteRestoreRestoringInfo);
    id v20 = [v17 copy];
    id v21 = [v18 copy];
    id v22 = v20;
    id v23 = v21;
    if (v19)
    {
      v80.receiver = v19;
      v80.super_class = (Class)&OBJC_CLASS___CompleteRestoreRestoringInfo;
      v24 = -[Task init](&v80, "init");
      if (v24 == (CompleteRestoreCoordinatorsTask *)v19)
      {
        objc_storeStrong((id *)&v19->_coordinators, v20);
        objc_storeStrong((id *)&v19->_needBootstrap, v21);
        v24 = (CompleteRestoreCoordinatorsTask *)v19;
      }
    }

    else
    {
      v24 = 0LL;
    }

    if (v24) {
      id Property = objc_getProperty(v24, v25, 8LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v27 = Property;
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v69 = 0LL;
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = sub_1002FC748;
    v82 = (NSString *)&unk_1003F27E8;
    v83 = self;
    id v28 = v27;
    id v84 = v28;
    id v29 = v64;
    id v85 = v29;
    id v30 = v62;
    id v86 = v30;
    v31 = v66;
    v87 = v31;
    v88 = &v74;
    v89 = &v70;
    uint64_t v90 = 0LL;
    unsigned int v32 = +[IXRestoringAppInstallCoordinator enumerateCoordinatorsWithError:usingBlock:]( &OBJC_CLASS___IXRestoringAppInstallCoordinator,  "enumerateCoordinatorsWithError:usingBlock:",  &v69,  buf);
    id v33 = v69;
    if (v32)
    {
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472LL;
      v68[2] = sub_1002FCCB4;
      v68[3] = &unk_1003F2810;
      v68[4] = self;
      [v30 enumerateKeysAndObjectsUsingBlock:v68];
      if ([(id)v75[5] count])
      {
        id v35 = sub_1002EEBC0((uint64_t)&OBJC_CLASS___AppInstallsDatabaseStore);
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 3221225472LL;
        v67[2] = sub_1002FCF24;
        v67[3] = &unk_1003EBA18;
        v67[4] = &v74;
        [v36 modifyUsingTransaction:v67];

        id v37 = [(id)v75[5] count];
        v71[3] += (uint64_t)v37;
      }

      if (v24) {
        id v38 = objc_getProperty(v24, v34, 16LL, 1);
      }
      else {
        id v38 = 0LL;
      }
      id v39 = v38;
      uint64_t v40 = (uint64_t)[v39 count];

      if (v71[3] | v40)
      {
        uint64_t v47 = ASDLogHandleForCategory(29LL);
        v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          error = self->super._error;
          uint64_t v50 = v71[3];
          *(_DWORD *)v91 = 138412802;
          *(void *)&v91[4] = error;
          *(_WORD *)&v91[12] = 2048;
          *(void *)&v91[14] = v50;
          *(_WORD *)&v91[22] = 2048;
          v92 = (void *)v40;
          _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "[%@] Discovered %ld coordinators to complete and %ld restores that need to be bootstrapped",  v91,  0x20u);
        }

        if (v40 >= 1)
        {
          uint64_t v51 = ASDLogHandleForCategory(29LL);
          v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            v65 = self->super._error;
            if (v24) {
              id v54 = objc_getProperty(v24, v53, 16LL, 1);
            }
            else {
              id v54 = 0LL;
            }
            id v63 = v54;
            uint64_t v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "componentsJoinedByString:", @", "));
            *(_DWORD *)v91 = 138412546;
            *(void *)&v91[4] = v65;
            *(_WORD *)&v91[12] = 2114;
            v60 = (void *)v55;
            *(void *)&v91[14] = v55;
            _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "[%@] Will re-bootstrap restores: [%{public}@]",  v91,  0x16u);
          }
        }

        id v56 = sub_10020FAD4((uint64_t)&OBJC_CLASS___RestoreManager);
        v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
        sub_100210B70((uint64_t)v42, @"Complete coordinators called", 0LL, 0);
      }

      else
      {
        uint64_t v41 = ASDLogHandleForCategory(29LL);
        v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v43 = self->super._error;
          *(_DWORD *)v91 = 138412290;
          *(void *)&v91[4] = v43;
          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "[%@] No incomplete coordinators were found.",  v91,  0xCu);
        }
      }

      id v46 = 0LL;
    }

    else
    {
      uint64_t v44 = ASDLogHandleForCategory(29LL);
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v59 = self->super._error;
        *(_DWORD *)v91 = 138412546;
        *(void *)&v91[4] = v59;
        *(_WORD *)&v91[12] = 2114;
        *(void *)&v91[14] = v33;
        _os_log_error_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "[%@] Failed to enumerate restoring coordinators error: %{public}@",  v91,  0x16u);
      }

      id v46 = v33;
    }

    _Block_object_dispose(&v70, 8);
    _Block_object_dispose(&v74, 8);

    id v57 = v46;
    LOBYTE(self->super._keepAlive) = v32;
    objc_setProperty_atomic_copy(self, v58, v57, 32LL);
  }

  else
  {

    id v57 = 0LL;
  }
}

- (void).cxx_destruct
{
}

@end