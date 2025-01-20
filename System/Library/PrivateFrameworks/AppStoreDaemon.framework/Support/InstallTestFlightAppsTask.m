@interface InstallTestFlightAppsTask
- (void)main;
@end

@implementation InstallTestFlightAppsTask

- (void)main
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  id obj = *(id *)&self->super._success;
  id v5 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
  v52 = v4;
  if (v5)
  {
    id v7 = v5;
    uint64_t v54 = *(void *)v57;
    *(void *)&__int128 v6 = 138412546LL;
    __int128 v50 = v6;
    v51 = v3;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v57 != v54) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)v8);
        v10 = sub_10025E0B8(objc_alloc(&OBJC_CLASS___AppInstallImportAndPolicyTask), v9);
        id v11 = sub_1001E2698(v9, (uint64_t)@"automatic_type");
        if (v10)
        {
          v10[49] = v11 == 0LL;
          v10[48] = v11 != 0LL;
          objc_setProperty_atomic_copy(v10, v12, &stru_1003EE888, 80LL);
        }

        id v55 = 0LL;
        unsigned __int8 v13 = -[Task runSubTask:returningError:](self, "runSubTask:returningError:", v10, &v55, v50);
        id v14 = v55;
        uint64_t v15 = ASDLogHandleForCategory(2LL);
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        v17 = v16;
        if ((v13 & 1) != 0)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v18 = sub_100323C54(v9);
            v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
            *(_DWORD *)buf = 138412290;
            v63 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[%@] TestFlight import succeeded",  buf,  0xCu);
          }

          if (v10)
          {
            id Property = objc_getProperty(v10, v20, 96LL, 1);
            v23 = Property;
            if (Property) {
              id Property = objc_getProperty(Property, v22, 24LL, 1);
            }
          }

          else
          {
            v23 = 0LL;
            id Property = 0LL;
          }

          id v24 = Property;

          if (v24) {
            -[NSMutableArray addObject:](v3, "addObject:", v24);
          }
          if (!LOBYTE(self->super._error))
          {
            id v25 = sub_1001E26D0(v9, (uint64_t)@"bundle_id");
            v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
            if (v26)
            {
              v27 = objc_alloc(&OBJC_CLASS___ProgressInfo);
              v28 = sub_100323C54(v9);
              v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
              v30 = sub_10031EDD4((id *)&v27->super.isa, v26, 0LL, v29);

              id v31 = sub_1001E25D0(v9, (uint64_t)@"item_id");
              v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
              v34 = v32;
              if (v30)
              {
                objc_setProperty_atomic(v30, v33, v32, 152LL);

                v30[18] = (id)129;
              }

              else
              {
              }

              id v35 = sub_1002B0944((uint64_t)&OBJC_CLASS___ProgressCache);
              v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
              sub_1002B0A98((uint64_t)v36, v30, @"TestFlight");

              v3 = v51;
              v4 = v52;
            }
          }
        }

        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v37 = sub_100323C54(v9);
            v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
            *(_DWORD *)buf = v50;
            v63 = v38;
            __int16 v64 = 2114;
            id v65 = v14;
            _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "[%@] TestFlight import failed: %{public}@",  buf,  0x16u);
          }

          if (v14) {
            -[NSMutableArray addObject:](v4, "addObject:", v14);
          }
        }

        v8 = (char *)v8 + 1;
      }

      while (v7 != v8);
      id v39 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
      id v7 = v39;
    }

    while (v39);
  }

  id v40 = sub_10023B9CC((uint64_t)&OBJC_CLASS___AppInstallScheduler);
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  sub_10023C018((uint64_t)v41, 64LL);

  -[Task lock](self, "lock");
  id v42 = -[NSMutableArray copy](v3, "copy");
  v43 = *(void **)&self->_reportRemoteProgress;
  *(void *)&self->_reportRemoteProgress = v42;

  -[Task unlock](self, "unlock");
  if (-[NSMutableArray count](v4, "count"))
  {
    if (-[NSMutableArray count](v4, "count") == (id)1)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", 0LL));
    }

    else
    {
      uint64_t v45 = ASDErrorDomain;
      NSErrorUserInfoKey v60 = NSMultipleUnderlyingErrorsKey;
      id v46 = -[NSMutableArray copy](v4, "copy");
      id v61 = v46;
      v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v61,  &v60,  1LL));
      v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v45,  537LL,  v47));

      v4 = v52;
    }

    uint64_t v48 = ASDErrorWithSafeUserInfo(v44);
    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    -[Task completeWithError:](self, "completeWithError:", v49);
  }
}

- (void).cxx_destruct
{
}

@end