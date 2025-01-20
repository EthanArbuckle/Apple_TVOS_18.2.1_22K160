__CFString *IXStringForPlaceholderDisposition(unint64_t a1)
{
  if (a1 >= 4) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown IXPlaceholderDisposition value: %lu",  a1));
  }
  else {
    return off_1000CCB00[a1];
  }
}

void sub_100003690(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  v2 = (void *)qword_1000E8E08;
  qword_1000E8E08 = (uint64_t)v1;
}

LABEL_30:
            v17 = v62;
            v18 = v63;
          }

          goto LABEL_31;
        }

        v26 = 0LL;
LABEL_31:
        v39 = (void *)objc_claimAutoreleasedReturnValue([v20 bundleID]);
        [v16 addObject:v39];

        if (!v18)
        {
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord localizedName](v23, "localizedName"));
          v35 = v61;
          v61 = v23;
LABEL_33:

          v17 = v62;
        }

            v26 = v150;
          }

          else
          {
            v55 = sub_1000047B4((uint64_t)off_1000E8CA0);
            v36 = (NSKeyedUnarchiver *)objc_claimAutoreleasedReturnValue(v55);
            if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
            {
              v70 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 path]);
              *(_DWORD *)buf = 136315650;
              v184 = "-[IXSCoordinatorManager init]";
              v185 = 2112;
              v186 = v70;
              v187 = 2112;
              v188 = (uint64_t)v34;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v36,  OS_LOG_TYPE_ERROR,  "%s: Failed to deserialize coordinator at %@ : %@",  buf,  0x20u);
            }

            v18 = v34;
            v26 = v150;
          }

          v40 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
          [v40 removeItemAtURL:v29 error:0];
LABEL_32:

          v27 = v148;
        }

        objc_autoreleasePoolPop(v30);
        v28 = (char *)v28 + 1;
      }

      while (v26 != v28);
      v73 = [obj countByEnumeratingWithState:&v174 objects:v191 count:16];
      v26 = v73;
      if (!v73)
      {
LABEL_47:

        v74 = v18;
        v11 = &APP_SANDBOX_READ_WRITE_ptr;
        v75 = (os_log_s *)v139;
        goto LABEL_57;
      }
    }
  }

  v76 = (void *)objc_claimAutoreleasedReturnValue([v18 domain]);
  if (![v76 isEqualToString:NSPOSIXErrorDomain])
  {

    goto LABEL_54;
  }

  v77 = [v18 code];

  if (v77 != (id)2)
  {
LABEL_54:
    v82 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v184 = "-[IXSCoordinatorManager init]";
      v185 = 2112;
      v186 = v138;
      v187 = 2112;
      v188 = (uint64_t)v18;
      _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to enumerate saved coordinators at %@ : %@",  buf,  0x20u);
    }

    v74 = v18;
    goto LABEL_57;
  }

  v78 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
  v167 = v18;
  v79 = [v78 createDirectoryAtURL:v138 withIntermediateDirectories:1 mode:493 class:4 error:&v167];
  v74 = v167;

  if ((v79 & 1) == 0)
  {
    v80 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v138, "path"));
      *(_DWORD *)buf = 136315650;
      v184 = "-[IXSCoordinatorManager init]";
      v185 = 2112;
      v186 = v81;
      v187 = 2112;
      v188 = (uint64_t)v74;
      _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to create coordinator save directory at %@: %@",  buf,  0x20u);
    }

        v32 = 0LL;
        v33 = 0LL;
        goto LABEL_31;
      }

      v39 = sub_1000047B4((uint64_t)off_1000E8CA0);
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_10007DC74();
      }
    }

    else
    {
      v38 = sub_1000047B4((uint64_t)off_1000E8CA0);
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_10007DC00();
      }
    }

    v31 = 0LL;
    goto LABEL_30;
  }

  v26 = 0LL;
LABEL_35:

  return v26;
}

LABEL_34:
LABEL_35:
      }

      v65 = [v17 countByEnumeratingWithState:&v73 objects:v78 count:16];
      if (!v65)
      {
LABEL_41:

        if ([v16 count])
        {
          v11 = v58;
          v10 = v59;
          v41 = (uint64_t)v18;
          if (!v18)
          {
            v42 = sub_1000047B4((uint64_t)off_1000E8CA0);
            v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
              sub_100078FFC((uint64_t)v16, v43, v44, v45, v46, v47, v48, v49);
            }

            v41 = objc_claimAutoreleasedReturnValue([v16 firstObject]);
          }

          v50 = v61;
          -[IXSErrorPresenter _presentErrorHighlightingLocalizedAppName:withHighlightedAppRecord:bundleIDs:code:errorSource:underlyingError:]( v55,  "_presentErrorHighlightingLocalizedAppName:withHighlightedAppRecord:bundleIDs:code:errorSource:underlyingError:",  v41,  v61,  v16,  v57,  v56,  v58);
          v18 = (os_log_s *)v41;
        }

        else
        {
          v51 = [v17 count];
          v52 = sub_1000047B4((uint64_t)off_1000E8CA0);
          v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
          v54 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
          v11 = v58;
          if (v51 == (id)1)
          {
            v10 = v59;
            if (v54) {
              sub_100078EC8(v17);
            }
          }

          else
          {
            v10 = v59;
            if (v54) {
              sub_100078F70(v17);
            }
          }

          v50 = v61;
        }

        goto LABEL_54;
      }
    }
  }

  v40 = sub_1000047B4((uint64_t)off_1000E8CA0);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_100078E4C(v18);
  }
LABEL_54:
}

BOOL sub_100003E20(id a1, LSApplicationIdentity *a2)
{
  return -[LSApplicationIdentity personaType](a2, "personaType") == (id)1;
}

id sub_100003E40(uint64_t a1, void *a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a2 personaUniqueString]);
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_1000040AC(uint64_t a1)
{
  uint64_t v1 = a1;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id obj = *(id *)(a1 + 32);
  id v2 = [obj countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v27;
    v5 = (objc_class *)&OBJC_IVAR___IXGlobalConfiguration__dynamicPropertyLock;
    v6 = (uint64_t *)&off_1000E8CA0;
    v7 = &OBJC_IVAR___IXGlobalConfiguration__dynamicPropertyLock;
    uint64_t v24 = v1;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v27 != v4) {
          objc_enumerationMutation(obj);
        }
        id v9 = [objc_alloc(v5 + 213) initWithBundleIdentifier:*(void *)(*((void *)&v26 + 1) + 8 * (void)i)];
        v10 = sub_1000047B4(*v6);
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = sub_10002ADD0(*(void *)(v1 + 40));
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          v14 = IXStringForClientID(*(void *)(v1 + 48));
          id v15 = v3;
          uint64_t v16 = v4;
          v17 = v7;
          v18 = v6;
          v19 = v5;
          v20 = (void *)objc_claimAutoreleasedReturnValue(v14);
          *(_DWORD *)buf = 136315906;
          v31 = "-[IXSErrorPresenter _presentErrorHighlightingLocalizedAppName:withHighlightedAppRecord:bundleIDs:code:er"
                "rorSource:underlyingError:]_block_invoke";
          __int16 v32 = 2112;
          id v33 = v9;
          __int16 v34 = 2112;
          v35 = v13;
          __int16 v36 = 2112;
          v37 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Uninstall of %@ requested by user due to error %@, client %@",  buf,  0x2Au);

          v5 = v19;
          v6 = v18;
          v7 = v17;
          uint64_t v4 = v16;
          id v3 = v15;
          uint64_t v1 = v24;
        }

        v21 = (void *)objc_claimAutoreleasedReturnValue([v7 + 656 sharedUninstaller]);
        v22 = IXStringForClientID(*(void *)(v1 + 48));
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        [v21 uninstallAppWithIdentity:v9 clientName:v23 options:2 completion:0];
      }

      id v3 = [obj countByEnumeratingWithState:&v26 objects:v38 count:16];
    }

    while (v3);
  }
}

void sub_100004538( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000454C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_1000046FC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) seed]);
  [v3 setArchiveBytesConsumed:v2];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) seed]);
  id v5 = [v4 archiveSizeBytes];

  if (v5)
  {
    double v6 = (double)*(unint64_t *)(a1 + 40);
    id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) seed]);
    objc_msgSend( *(id *)(a1 + 32),  "setPercentComplete:",  v6 / (double)(unint64_t)objc_msgSend(v7, "archiveSizeBytes"));
  }
}

void *sub_1000047B4(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004828;
  block[3] = &unk_1000CCB20;
  block[4] = a1;
  if (qword_1000E8E18 != -1) {
    dispatch_once(&qword_1000E8E18, block);
  }
  return off_1000E8898;
}

void sub_100004828(uint64_t a1)
{
  os_log_t v1 = os_log_create(*(const char **)(a1 + 32), "daemon");
  uint64_t v2 = off_1000E8898;
  off_1000E8898 = v1;
}

uint64_t start(uint64_t a1, uint64_t *a2)
{
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  targetq = dispatch_queue_create("com.apple.installcoordinationd.notifications", v4);

  dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  double v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.InstallCoordination.StateDumpQueue", v6);

  bzero(v82, 0x400uLL);
  if ((_set_user_dir_suffix("com.apple.installcoordinationd") & 1) == 0) {
    sub_1000790F0(v83, buf);
  }
  if (!confstr(65537, v82, 0x400uLL))
  {
    int v8 = *__error();
    id v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = strerror(v8);
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "main";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v8;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to initialize temporary directory: error = %d (%s), attempting to continue...",  buf,  0x1Cu);
    }
  }

  context = objc_autoreleasePoolPush();
  v59 = (void *)os_transaction_create("com.apple.InstallCoordination.startup");
  v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *a2;
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "main";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2080;
    *(void *)&buf[24] = "Nov 10 2024";
    LOWORD(v89[0]) = 2080;
    *(id *)((char *)v89 + 2) = "02:42:47";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: %s starting, built %s %s", buf, 0x2Au);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[IXGlobalConfiguration sharedInstance](&OBJC_CLASS___IXGlobalConfiguration, "sharedInstance"));
  [v15 createDirectories];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472LL;
  v72[2] = sub_1000050C0;
  v72[3] = &unk_1000CCC28;
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
  id v73 = v17;
  os_state_add_handler(v7, v72);
  os_state_add_handler(v7, &stru_1000CCC68);
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472LL;
  v69[2] = sub_1000057D4;
  v69[3] = &unk_1000CCCB8;
  id v58 = v16;
  id v70 = v58;
  id v18 = v17;
  id v71 = v18;
  if (!sub_1000316C4(@"installcoordinationd.run", v69))
  {
    id v19 = v18;
    id v21 = sub_10003556C( (uint64_t)"_DumpCoordinatorsAndPurgeProcessScoped",  335LL,  @"IXErrorDomain",  0x21uLL,  0LL,  0LL,  @"Coordinator orphaned by installcoordinationd restart",  v20,  v57);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = sub_10000654C;
    *(void *)&buf[24] = &unk_1000CCE30;
    v89[0] = v22;
    id v23 = v22;
    [v19 enumerateCoordinators:buf];
  }

  dispatch_queue_t v61 = v7;
  id v66 = v18;
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationRecord enumeratorWithOptions:]( &OBJC_CLASS___LSApplicationRecord,  "enumeratorWithOptions:",  0LL));
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  id v25 = [v24 countByEnumeratingWithState:&v78 objects:buf count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v79;
    uint64_t v63 = *(void *)v79;
    v64 = v24;
    do
    {
      __int128 v28 = 0LL;
      id v65 = v26;
      do
      {
        if (*(void *)v79 != v27) {
          objc_enumerationMutation(v24);
        }
        __int128 v29 = *(void **)(*((void *)&v78 + 1) + 8LL * (void)v28);
        if ([v29 hasParallelPlaceholder])
        {
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 bundleIdentifier]);
          if (v30)
          {
            v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v66 coordinatorsForBundleIdentifier:v30]);
            __int16 v32 = v31;
            if (!v31 || !-[os_log_s count](v31, "count"))
            {
              v67 = v32;
              v68 = v28;
              id v33 = (void *)objc_claimAutoreleasedReturnValue([v29 managedPersonas]);
              __int128 v74 = 0u;
              __int128 v75 = 0u;
              __int128 v76 = 0u;
              __int128 v77 = 0u;
              id v34 = [v33 countByEnumeratingWithState:&v74 objects:v83 count:16];
              if (v34)
              {
                id v35 = v34;
                uint64_t v36 = *(void *)v75;
                do
                {
                  for (i = 0LL; i != v35; i = (char *)i + 1)
                  {
                    if (*(void *)v75 != v36) {
                      objc_enumerationMutation(v33);
                    }
                    v38 = -[IXApplicationIdentity initWithBundleIdentifier:personaUniqueString:]( objc_alloc(&OBJC_CLASS___IXApplicationIdentity),  "initWithBundleIdentifier:personaUniqueString:",  v30,  *(void *)(*((void *)&v74 + 1) + 8LL * (void)i));
                    v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Uninstalling orphaned parallel placeholder for %@",  v38,  v58,  v59));
                    v40 = (void *)objc_claimAutoreleasedReturnValue( +[IXSAppUninstaller sharedUninstaller]( &OBJC_CLASS___IXSAppUninstaller,  "sharedUninstaller"));
                    [v40 uninstallParallelPlaceholderForIdentity:v38 reason:v39];
                  }

                  id v35 = [v33 countByEnumeratingWithState:&v74 objects:v83 count:16];
                }

                while (v35);
              }

              v41 = -[IXApplicationIdentity initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___IXApplicationIdentity),  "initWithBundleIdentifier:",  v30);
              v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Uninstalling orphaned parallel placeholder for %@",  v41));
              v43 = (void *)objc_claimAutoreleasedReturnValue( +[IXSAppUninstaller sharedUninstaller]( &OBJC_CLASS___IXSAppUninstaller,  "sharedUninstaller"));
              [v43 uninstallParallelPlaceholderForIdentity:v41 reason:v42];

              uint64_t v27 = v63;
              uint64_t v24 = v64;
              id v26 = v65;
              __int16 v32 = v67;
              __int128 v28 = v68;
            }
          }

          else
          {
            v45 = sub_1000047B4((uint64_t)off_1000E8CA0);
            __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v84 = 136315394;
              v85 = "_RemoveOrphanedParallelPlaceholders";
              __int16 v86 = 2112;
              v87 = v29;
              _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "%s: Got LSApplicationRecord %@ without bundle ID",  v84,  0x16u);
            }
          }
        }

        else
        {
          v44 = sub_1000047B4((uint64_t)off_1000E8CA0);
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v84 = 136315394;
            v85 = "_RemoveOrphanedParallelPlaceholders";
            __int16 v86 = 2112;
            v87 = v29;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "%s: Skipping because it doesn't have a parallel placeholder: %@",  v84,  0x16u);
          }
        }

        __int128 v28 = (char *)v28 + 1;
      }

      while (v28 != v26);
      id v26 = [v24 countByEnumeratingWithState:&v78 objects:buf count:16];
    }

    while (v26);
  }

  +[IXSClientConnectionManager configureService](&OBJC_CLASS___IXSClientConnectionManager, "configureService");
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  v47 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  signal(15, (void (__cdecl *)(int))1);
  v48 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v47);
  dispatch_source_set_event_handler(v48, &stru_1000CCCF8);
  dispatch_activate(v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue( +[IXSAppDeletionEligibilityManager sharedInstance]( &OBJC_CLASS___IXSAppDeletionEligibilityManager,  "sharedInstance"));
  [v49 reconcileAppRemovabilityForSystemAppPlaceholders];

  xpc_set_event_stream_handler("com.apple.notifyd.matching", targetq, &stru_1000CCD38);
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  id v52 =  [v50 addObserverForName:NSCurrentLocaleDidChangeNotification object:0 queue:v51 usingBlock:&stru_1000CCDB8];

  id v53 = sub_100034B1C();
  v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
  [v54 resume];

  objc_autoreleasePoolPop(context);
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v55 run];

  return 0LL;
}

_DWORD *sub_1000050C0(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 16) != 3) {
    return 0LL;
  }
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_100005250;
  id v25 = sub_100005260;
  id v26 = @"Coordinators";
  id v3 = [*(id *)(a1 + 32) coordinatorCount];
  uint64_t v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_100005250;
  id v19 = sub_100005260;
  id v5 = sub_100005268(v4);
  id v20 = (id)objc_claimAutoreleasedReturnValue(v5);
  double v6 = *(void **)(a1 + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100005348;
  v10[3] = &unk_1000CCC00;
  dispatch_queue_t v7 = v4;
  v11 = v7;
  v12 = &v15;
  v13 = &v21;
  id v14 = v3;
  [v6 enumerateCoordinators:v10];
  int v8 = sub_100005418((void *)v16[5], (void *)v22[5]);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v8;
}

void sub_10000521C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t sub_100005250(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100005260(uint64_t a1)
{
}

id sub_100005268(void *a1)
{
  id v1 = a1;
  id v8 = 0LL;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v1,  200LL,  0LL,  &v8));
  id v3 = v8;
  if (!v2)
  {
    id v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
    double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000791BC();
    }

    goto LABEL_7;
  }

  if ([v2 length] - 32569 < 0xFFFF7FFF)
  {
LABEL_7:
    id v4 = 0LL;
    goto LABEL_8;
  }

  id v4 = v2;
LABEL_8:

  return v4;
}

BOOL sub_100005348(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a2 description]);
  [v3 addObject:v4];

  id v5 = sub_100005268(*(void **)(a1 + 32));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  dispatch_queue_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v9 = v6;
    v10 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }

  else
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Coordinators [%lu of %lu]",  (char *)[*(id *)(a1 + 32) count] - 1,  *(void *)(a1 + 56)));
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8LL);
    v10 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }

  return v7 != 0LL;
}

_DWORD *sub_100005418(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unsigned int v5 = [v3 length];
  size_t v6 = v5 + 200;
  if (v6 <= 0x8000)
  {
    id v9 = calloc(1uLL, v6);
    __strlcpy_chk(v9 + 34, [v4 UTF8String], 64, 64);
    *id v9 = 1;
    v9[1] = v5;
    memcpy(v9 + 50, [v3 bytes], v5);
  }

  else
  {
    dispatch_queue_t v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10007922C((uint64_t)v3, v8);
    }

    id v9 = 0LL;
  }

  return v9;
}

os_state_data_s *__cdecl sub_10000551C(id a1, os_state_hints_s *a2)
{
  if (a2->var2 != 3) {
    return 0LL;
  }
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_100005250;
  id v25 = sub_100005260;
  id v26 = @"Removability";
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IXSAppRemovabilityManager sharedInstance](&OBJC_CLASS___IXSAppRemovabilityManager, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 removabilityInfoForAllIdentities]);

  id v4 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v3 count]);
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_100005250;
  id v19 = sub_100005260;
  id v5 = sub_100005268(v4);
  id v20 = (id)objc_claimAutoreleasedReturnValue(v5);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000056E8;
  v10[3] = &unk_1000CCC90;
  size_t v6 = v4;
  uint64_t v11 = v6;
  v13 = &v15;
  id v14 = &v21;
  id v7 = v3;
  id v12 = v7;
  [v7 enumerateKeysAndObjectsUsingBlock:v10];
  uint64_t v8 = (os_state_data_s *)sub_100005418((void *)v16[5], (void *)v22[5]);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v8;
}

void sub_1000056B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_1000056E8(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  size_t v6 = *(void **)(a1 + 32);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: %@", a2, a3));
  [v6 addObject:v7];

  id v8 = sub_100005268(*(void **)(a1 + 32));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v16 = v9;
  if (v9)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v11 = v9;
    char v12 = 0;
    v13 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v11;
  }

  else
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Removability [%lu of %lu]",  (char *)[*(id *)(a1 + 32) count] - 1,  objc_msgSend(*(id *)(a1 + 40), "count")));
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8LL);
    v13 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
    char v12 = 1;
  }

  *a4 = v12;
}

void sub_1000057D4(uint64_t a1)
{
  id v1 = *(void **)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  id v3 = v1;
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472LL;
  v84[2] = sub_100006310;
  v84[3] = &unk_1000CCDE0;
  v64 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  v85 = v64;
  id v66 = v2;
  [v2 enumeratePromises:v84];
  id v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  size_t v6 = &off_100095000;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v97 = "_DoFirstRunCleanup";
    __int16 v98 = 2112;
    v99 = v64;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Found existing promise UUIDs: %@",  buf,  0x16u);
  }

  id v7 = objc_autoreleasePoolPush();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IXGlobalConfiguration sharedInstance](&OBJC_CLASS___IXGlobalConfiguration, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 promiseStagingRootDirectoryAbortingOnError]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
  id v83 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 urlsForItemsInDirectoryAtURL:v9 ignoringSymlinks:1 error:&v83]);
  id v12 = v83;

  v62 = v3;
  if (v11)
  {
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    id v13 = v11;
    id v14 = [v13 countByEnumeratingWithState:&v79 objects:buf count:16];
    if (!v14) {
      goto LABEL_29;
    }
    id v15 = v14;
    id v58 = v11;
    id v59 = v12;
    v60 = v9;
    dispatch_queue_t v61 = v7;
    uint64_t v16 = *(void *)v80;
    while (1)
    {
      uint64_t v17 = 0LL;
      do
      {
        if (*(void *)v80 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v79 + 1) + 8LL * (void)v17);
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 lastPathComponent]);
        id v20 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v19);
        if (v20)
        {
          if ((-[NSMutableSet containsObject:](v64, "containsObject:", v20) & 1) != 0)
          {
            id v21 = 0LL;
            goto LABEL_22;
          }

          __int128 v28 = sub_1000047B4((uint64_t)off_1000E8CA0);
          __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue([v18 path]);
            *(_DWORD *)v90 = 136315394;
            v91 = "_DoFirstRunCleanup";
            __int16 v92 = 2112;
            v93 = v30;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%s: Removing orphaned promise staging directory: %@",  v90,  0x16u);
          }

          v31 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
          id v77 = 0LL;
          unsigned __int8 v32 = [v31 removeItemAtURL:v18 error:&v77];
          id v21 = v77;

          if ((v32 & 1) == 0)
          {
            id v33 = sub_1000047B4((uint64_t)off_1000E8CA0);
            uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
            if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
              goto LABEL_21;
            }
            goto LABEL_24;
          }
        }

        else
        {
          v22 = sub_1000047B4((uint64_t)off_1000E8CA0);
          uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            id v34 = (void *)objc_claimAutoreleasedReturnValue([v18 path]);
            *(_DWORD *)v90 = 136315394;
            v91 = "_DoFirstRunCleanup";
            __int16 v92 = 2112;
            v93 = v34;
            _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s: Removing non-UUID item found in promise staging: %@",  v90,  0x16u);
          }

          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
          id v78 = 0LL;
          unsigned __int8 v25 = [v24 removeItemAtURL:v18 error:&v78];
          id v21 = v78;

          if ((v25 & 1) == 0)
          {
            id v26 = sub_1000047B4((uint64_t)off_1000E8CA0);
            uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
LABEL_21:

              goto LABEL_22;
            }

LABEL_24:
            id v35 = (void *)objc_claimAutoreleasedReturnValue([v18 path]);
            *(_DWORD *)v90 = 136315650;
            v91 = "_DoFirstRunCleanup";
            __int16 v92 = 2112;
            v93 = v35;
            __int16 v94 = 2112;
            id v95 = v21;
            _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s: Failed to purge %@ : %@",  v90,  0x20u);

            goto LABEL_21;
          }
        }

  return v5;
}

  *a4 = 0;
}

  return v29;
}

              v22 = 0;
              if ((v16 & 0x2000000) != 0)
              {
LABEL_18:
                unsigned __int8 v25 = *(void *)v19;
                v19 += 2;
                uint64_t v24 = v25;
                goto LABEL_26;
              }

  return v18;
}

LABEL_22:
        uint64_t v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v36 = [v13 countByEnumeratingWithState:&v79 objects:buf count:16];
      id v15 = v36;
      if (!v36)
      {
        size_t v6 = &off_100095000;
        id v7 = v61;
        id v3 = v62;
        id v12 = v59;
        id v9 = v60;
        id v11 = v58;
        goto LABEL_29;
      }
    }
  }

  v37 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v13 = (id)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
    sub_1000792B4();
  }
LABEL_29:

  objc_autoreleasePoolPop(v7);
  id v39 = sub_10003556C( (uint64_t)"_DoFirstRunCleanup",  195LL,  @"IXErrorDomain",  0x21uLL,  0LL,  0LL,  @"Coordinator orphaned by device reboot",  v38,  v56);
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472LL;
  v74[2] = sub_100006350;
  v74[3] = &unk_1000CCE08;
  v41 = v64;
  __int128 v75 = v41;
  id v63 = v40;
  id v76 = v63;
  [v3 enumerateCoordinators:v74];
  id v43 = sub_10003556C( (uint64_t)"_DoFirstRunCleanup",  218LL,  @"IXErrorDomain",  0x12uLL,  0LL,  0LL,  @"Promise orphaned",  v42,  v57);
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  v45 = v41;
  id v46 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v45,  "countByEnumeratingWithState:objects:count:",  &v70,  v90,  16LL);
  if (v46)
  {
    id v47 = v46;
    uint64_t v48 = *(void *)v71;
    int v65 = *((void *)v6 + 85);
    do
    {
      for (i = 0LL; i != v47; i = (char *)i + 1)
      {
        if (*(void *)v71 != v48) {
          objc_enumerationMutation(v45);
        }
        v50 = *(void **)(*((void *)&v70 + 1) + 8LL * (void)i);
        v51 = (void *)objc_claimAutoreleasedReturnValue([v66 promiseForUUID:v50]);
        id v52 = sub_1000047B4((uint64_t)off_1000E8CA0);
        id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
        v54 = v53;
        if (v51)
        {
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int16 v86 = v65;
            v87 = "_DoFirstRunCleanup";
            __int16 v88 = 2112;
            v89 = v51;
            _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "%s: Canceling orphaned data promise %@",  v86,  0x16u);
          }

          v55 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v51 accessQueue]);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100006538;
          block[3] = &unk_1000CCCB8;
          v68 = v51;
          id v69 = v44;
          dispatch_sync(v55, block);

          v54 = v68;
        }

        else if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int16 v86 = v65;
          v87 = "_DoFirstRunCleanup";
          __int16 v88 = 2112;
          v89 = v50;
          _os_log_error_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_ERROR,  "%s: Failed to locate orphaned data promise with UUID %@",  v86,  0x16u);
        }
      }

      id v47 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v45,  "countByEnumeratingWithState:objects:count:",  &v70,  v90,  16LL);
    }

    while (v47);
  }
}

      v22 = v15;
      goto LABEL_23;
    }
  }

  uint64_t v16 = v10;
  uint64_t v17 = (const char *)[v16 fileSystemRepresentation];
  id v18 = v11;
  if (rename(v17, (const char *)[v18 fileSystemRepresentation]))
  {
    if (*__error() == 18)
    {
      id v35 = 0LL;
      id v19 = -[IXFileManager _copyItemAtURL:toURL:failIfSrcMissing:error:]( self,  "_copyItemAtURL:toURL:failIfSrcMissing:error:",  v16,  v18,  1LL,  &v35);
      id v20 = v35;
      id v15 = v20;
      if (v19)
      {
        id v34 = v20;
        id v21 = -[IXFileManager removeItemAtURL:error:](self, "removeItemAtURL:error:", v16, &v34);
        v22 = v34;

        if ((v21 & 1) == 0)
        {
          uint64_t v23 = sub_1000047B4((uint64_t)off_1000E8CA0);
          uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            sub_10007EC8C(v16, (uint64_t)v22, v24);
          }
        }

        goto LABEL_15;
      }
    }

    else
    {
      unsigned __int8 v25 = *__error();
      id v26 = __error();
      strerror(*v26);
      __int128 v28 = sub_10003556C( (uint64_t)"-[IXFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]",  98LL,  NSPOSIXErrorDomain,  v25,  0LL,  0LL,  @"rename of %@ to %@ failed: %s",  v27,  (uint64_t)v16);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v28);
    }

    id v14 = 0;
    if (!a6) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }

  v22 = 0LL;
LABEL_15:
  id v14 = 1;
LABEL_23:

  return v14;
}

    if (v14 >= a5)
    {
      LOBYTE(v42) = 0;
LABEL_40:
      id v47 = v56;
      uint64_t v48 = v57;
      goto LABEL_45;
    }

    unsigned __int8 v32 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
    id v33 = [v32 itemDoesNotExistAtURL:v11];

    if (v33)
    {
      v49 = sub_1000047B4((uint64_t)off_1000E8CA0);
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int128 v73 = "-[IXSCoordinatedAppInstall _limitedConcurrency_doRetryingInstallOperationForPlaceholder:installTargetURL:r"
              "etries:error:installAttemptBlock:]";
        __int128 v74 = 2112;
        __int128 v75 = (uint64_t)v59;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%s: %@: installable no longer present, skipping retry",  buf,  0x16u);
      }

      goto LABEL_43;
    }

    ++v14;
    id v34 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      __int128 v73 = "-[IXSCoordinatedAppInstall _limitedConcurrency_doRetryingInstallOperationForPlaceholder:installTargetURL:ret"
            "ries:error:installAttemptBlock:]";
      __int128 v74 = 2112;
      __int128 v75 = (uint64_t)v16;
      id v76 = 1024;
      *(_DWORD *)id v77 = 5;
      *(_WORD *)&v77[4] = 2048;
      *(void *)&v77[6] = v14;
      *(_WORD *)&v77[14] = 2048;
      *(void *)&v77[16] = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%s: Call to install SPI returned retryable error %@; retrying in %d seconds (%lu/%lu tries)",
        buf,
        0x30u);
    }

    sleep(5u);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue([v16 domain]);
  if ([v31 isEqualToString:NSCocoaErrorDomain] && objc_msgSend(v16, "code") == (id)4099)
  {

    goto LABEL_22;
  }

LABEL_43:
  LOBYTE(v42) = 0;
LABEL_44:
  id v47 = v56;
  uint64_t v48 = v57;

LABEL_45:
  if ((v58 & 1) == 0)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](v59, "internalQueue"));
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472LL;
    v62[2] = sub_100042F00;
    v62[3] = &unk_1000CE230;
    v64 = v42;
    v62[4] = v59;
    id v63 = v48;
    sub_10005A8F0(v50, v62);
  }

  if (v47) {
    v51 = v42;
  }
  else {
    v51 = 1;
  }
  if ((v51 & 1) == 0)
  {
    uint64_t v16 = v16;
    dispatch_queue_s *v47 = v16;
  }

  return v23;
}

void sub_100006050(id a1)
{
  id v1 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "main_block_invoke_5";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%s: Got SIGTERM; Exiting when clean.",
      (uint8_t *)&v3,
      0xCu);
  }

  xpc_transaction_exit_clean();
}

void sub_100006104(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  int v3 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "main_block_invoke";
    __int16 v8 = 2080;
    id v9 = string;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: Got darwin notification %s",  (uint8_t *)&v6,  0x16u);
  }

  if (!strcmp(string, "com.apple.mobile.keybagd.first_unlock"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
    [v5 enumerateCoordinators:&stru_1000CCD78];
  }

  else
  {
    if (strcmp(string, "com.apple.os-eligibility-domain.change")) {
      return;
    }
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[IXSAppDeletionEligibilityManager sharedInstance]( &OBJC_CLASS___IXSAppDeletionEligibilityManager,  "sharedInstance"));
    [v5 eligibilityDidChange];
  }
}

BOOL sub_100006240(id a1, IXSCoordinatedAppInstall *a2)
{
  return 1;
}

void sub_10000625C(id a1, NSNotification *a2)
{
  id v2 = sub_1000047B4((uint64_t)off_1000E8CA0);
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "main_block_invoke_2";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s: User changed locale; exiting when clean to reload locale",
      (uint8_t *)&v4,
      0xCu);
  }

  xpc_transaction_exit_clean();
}

uint64_t sub_100006310(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a2 uniqueIdentifier]);
  [v2 addObject:v3];

  return 1LL;
}

uint64_t sub_100006350(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    id v13 = "_DoFirstRunCleanup_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Found coordinator: %@",  (uint8_t *)&v12,  0x16u);
  }

  int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 promiseUUIDs]);
  [*(id *)(a1 + 32) minusSet:v6];
  if ([v3 creator] == (id)12)
  {
    id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
    __int16 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      id v13 = "_DoFirstRunCleanup_block_invoke";
      __int16 v14 = 2112;
      id v15 = v3;
      id v9 = "%s: Canceling orphaned IXClientSimpleSPI coordinator %@";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0x16u);
      goto LABEL_10;
    }

    goto LABEL_10;
  }

  if ([v3 coordinatorScope] == 1)
  {
    uint64_t v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
    __int16 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      id v13 = "_DoFirstRunCleanup_block_invoke";
      __int16 v14 = 2112;
      id v15 = v3;
      id v9 = "%s: Canceling process-scoped coordinator %@";
      goto LABEL_9;
    }

LABEL_10:
    [v3 cancelForReason:*(void *)(a1 + 40) client:15 error:0];
  }

  return 1LL;
}

  return v21;
}

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[LSDatabaseContext sharedDatabaseContext](&OBJC_CLASS___LSDatabaseContext, "sharedDatabaseContext"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10001359C;
  v26[3] = &unk_1000CD150;
  __int128 v28 = &v31;
  __int128 v29 = &v37;
  uint64_t v27 = v6;
  [v13 accessSystemScopeUsingBlock:v26];

LABEL_14:
LABEL_15:
  uint64_t v23 = (void *)v38[5];
  if (a3 && !v23)
  {
    *a3 = (id) v32[5];
    uint64_t v23 = (void *)v38[5];
  }

  uint64_t v24 = v23;

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v24;
}

  return v18;
}
}

            uint64_t v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
            v44[0] = _NSConcreteStackBlock;
            v44[1] = 3221225472LL;
            v44[2] = sub_1000217AC;
            v44[3] = &unk_1000CCCB8;
            v44[4] = self;
            uint64_t v16 = v16;
            v45 = v16;
            dispatch_sync(v27, v44);

            __int128 v28 = v45;
LABEL_27:
          }

        uint64_t v10 = 0;
        goto LABEL_16;
      }
    }

    id v9 = 0LL;
    uint64_t v10 = 1;
    goto LABEL_16;
  }

  if (!a4)
  {
    id v9 = 0LL;
    goto LABEL_10;
  }

  __int16 v8 = (id)objc_claimAutoreleasedReturnValue(-[IXSOwnedDataPromise awakeningError](self, "awakeningError"));
  id v9 = 0LL;
LABEL_4:
  uint64_t v10 = 0;
  *a4 = v8;
LABEL_16:

  return v10;
}

  *a4 = 0;
}

  ;
}

  return v4;
}

    goto LABEL_11;
  }

  [v3 setInstallState:1];
  if ([v4 totalUnitCount] != *(id *)(a1 + 40)) {
    objc_msgSend(v4, "setTotalUnitCount:");
  }
  [v4 setCompletedUnitCount:*(void *)(a1 + 48)];
LABEL_11:
}

  return v9;
}

id sub_100006538(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelForReason:*(void *)(a1 + 40) client:15 error:0];
}

uint64_t sub_10000654C(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "_DumpCoordinatorsAndPurgeProcessScoped_block_invoke";
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Found coordinator: %@",  (uint8_t *)&v9,  0x16u);
  }

  if ([v3 coordinatorScope] == 1)
  {
    int v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      uint64_t v10 = "_DumpCoordinatorsAndPurgeProcessScoped_block_invoke";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Canceling process-scoped coordinator %@",  (uint8_t *)&v9,  0x16u);
    }

    [v3 cancelForReason:*(void *)(a1 + 32) client:15 error:0];
  }

  return 1LL;
}

  ;
}

void sub_1000066CC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

LABEL_6:
    uint64_t v10 = 0LL;
  }

    int v9 = v4;
LABEL_13:
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stagedPath]);
    unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 lastPathComponent]);

    id v26 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:v25 isDirectory:1]);
    uint64_t v27 = *(void **)(a1 + 48);
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stagedPath]);
    id v63 = 0LL;
    __int128 v29 = [v27 moveItemAtURL:v28 toURL:v26 error:&v63];
    v30 = v63;

    v31 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unsigned __int8 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    id v33 = v32;
    if (v29)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        id v34 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 136315650;
        id v66 = "-[IXSPlaceholder _materialize]_block_invoke";
        v67 = 2112;
        v68 = v34;
        id v69 = 2112;
        __int128 v70 = v25;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s: %@: added appex %@", buf, 0x20u);
      }
    }

    else
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        uint64_t v56 = *(void **)(a1 + 32);
        v62 = v30;
        uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v56 stagedPath]);
        id v58 = (void *)objc_claimAutoreleasedReturnValue([v57 path]);
        id v59 = (void *)objc_claimAutoreleasedReturnValue([v26 path]);
        v60 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 136316162;
        id v66 = "-[IXSPlaceholder _materialize]_block_invoke";
        v67 = 2112;
        v68 = v56;
        id v69 = 2112;
        __int128 v70 = v58;
        __int128 v71 = 2112;
        __int128 v72 = v59;
        __int128 v73 = 2112;
        __int128 v74 = v60;
        _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "%s: Failed to move app extension placeholder %@ from %@ to %@ : %@",  buf,  0x34u);

        v30 = v62;
      }

      id v35 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      v37 = &off_100095000;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stagedPath]);
        dispatch_queue_t v61 = v30;
        id v39 = (void *)objc_claimAutoreleasedReturnValue([v38 path]);
        v40 = *(void **)(a1 + 48);
        v41 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stagedPath]);
        uint64_t v42 = v40;
        v37 = &off_100095000;
        id v43 = [v42 itemExistsAtURL:v41];
        *(_DWORD *)buf = 136315650;
        id v66 = "-[IXSPlaceholder _materialize]_block_invoke";
        if (v43) {
          v44 = 89;
        }
        else {
          v44 = 78;
        }
        v67 = 2112;
        v68 = v39;
        id v69 = 1024;
        LODWORD(v70) = v44;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%s: %@ exists: %c", buf, 0x1Cu);

        v30 = v61;
      }

      v45 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        id v47 = (void *)objc_claimAutoreleasedReturnValue([v26 path]);
        uint64_t v48 = [*(id *)(a1 + 48) itemExistsAtURL:v26];
        *(_DWORD *)buf = *((void *)v37 + 82);
        id v66 = "-[IXSPlaceholder _materialize]_block_invoke";
        if (v48) {
          v49 = 89;
        }
        else {
          v49 = 78;
        }
        v67 = 2112;
        v68 = v47;
        id v69 = 1024;
        LODWORD(v70) = v49;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%s: %@ exists: %c", buf, 0x1Cu);
      }

      v50 = *(void *)(*(void *)(a1 + 88) + 8LL);
      v51 = v30;
      id v33 = *(os_log_s **)(v50 + 40);
      *(void *)(v50 + 40) = v51;
    }

    goto LABEL_30;
  }

  if (v3 != (id)3)
  {
    uint64_t v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
    __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10007BF60((uint64_t)v3, v11, v12);
    }

    __int16 v14 = sub_10003556C( (uint64_t)"-[IXSPlaceholder _materialize]_block_invoke",  1515LL,  @"IXErrorDomain",  0x14uLL,  0LL,  0LL,  @"Placeholder type of %lu in list of app extension placeholders is not supported",  v13,  (uint64_t)v3);
    id v15 = objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = *(void *)(*(void *)(a1 + 88) + 8LL);
    int v9 = *(id *)(v16 + 40);
    *(void *)(v16 + 40) = v15;
    goto LABEL_30;
  }

  int v4 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  if (v4) {
    goto LABEL_6;
  }
  id v5 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) URLByAppendingPathComponent:@"Extensions" isDirectory:1]);
  int v6 = *(void *)(*(void *)(a1 + 72) + 8LL);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  __int16 v8 = *(void *)(a1 + 72);
LABEL_11:
  int v9 = *(id *)(*(void *)(v8 + 8) + 40LL);
  id v20 = *(void **)(a1 + 48);
  v64 = 0LL;
  id v21 = [v20 createDirectoryAtURL:v9 withIntermediateDirectories:0 mode:493 error:&v64];
  v22 = v64;
  uint64_t v23 = v22;
  if ((v21 & 1) != 0)
  {

    goto LABEL_13;
  }

  id v52 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v66 = "-[IXSPlaceholder _materialize]_block_invoke";
    v67 = 2112;
    v68 = v9;
    id v69 = 2112;
    __int128 v70 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to create directory at %@ : %@",  buf,  0x20u);
  }

  v54 = *(void *)(*(void *)(a1 + 88) + 8LL);
  v55 = *(void **)(v54 + 40);
  *(void *)(v54 + 40) = v23;

LABEL_30:
}

  objc_msgSend( v5,  "setIsPreferredButton:",  -[IXSUninstallButtonConfiguration isPreferredButton](self, "isPreferredButton"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 build]);

  return (NSDictionary *)v7;
}

  id v20 = (IXAppInstallCoordinatorSeed *)v5;
LABEL_7:

  return v20;
}

LABEL_7:
  return v10;
}

  *a4 = 0;
}

  return v9;
}

void sub_100006E10(uint64_t a1)
{
  id v2 = (uint64_t *)(a1 + 40);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) coordinatorForIdentity:*(void *)(a1 + 40)]);
  if (v3)
  {
    int v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000794C8();
    }

    id v7 = sub_10003556C( (uint64_t)"-[IXSRevertManager _revertAppWithIdentity:forClientWithName:completion:]_block_invoke",  92LL,  @"IXErrorDomain",  5uLL,  0LL,  0LL,  @"Failed to revert app because a coordinator %@ already existed",  v6,  (uint64_t)v3);
    id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
    id v9 = 0LL;
    goto LABEL_5;
  }

  uint64_t v12 = *(void *)(a1 + 40);
  __int16 v11 = *(void **)(a1 + 48);
  id v28 = 0LL;
  id v9 = (id)objc_claimAutoreleasedReturnValue([v11 _acquireTerminationAssertionForIdentity:v12 withError:&v28]);
  id v8 = v28;
  if (!v9)
  {
LABEL_5:
    id v10 = 0LL;
    goto LABEL_12;
  }

  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) internalQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000070CC;
  block[3] = &unk_1000CCCB8;
  void block[4] = *(void *)(a1 + 48);
  id v9 = v9;
  id v27 = v9;
  dispatch_sync(v13, block);

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000070D4;
  v25[3] = &unk_1000CCE58;
  v25[4] = *(void *)(a1 + 48);
  __int16 v14 = objc_retainBlock(v25);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) miAppIdentity]);
  id v23 = v8;
  id v24 = 0LL;
  char v16 = MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError(v15, 0LL, 0LL, &v24, &v23, 0LL, v14);
  id v10 = v24;
  id v17 = v23;

  if ((v16 & 1) == 0)
  {
    id v18 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100079438(v2, (uint64_t)v17, v19);
    }

    id v21 = sub_10003556C( (uint64_t)"-[IXSRevertManager _revertAppWithIdentity:forClientWithName:completion:]_block_invoke",  114LL,  @"IXErrorDomain",  0x28uLL,  v17,  0LL,  @"Failed to revert application with identity %@",  v20,  *v2);
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);

    ((void (*)(void *))v14[2])(v14);
    id v17 = (id)v22;
  }

  id v8 = v17;
LABEL_12:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

id sub_1000070CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTerminationAssertion:*(void *)(a1 + 40)];
}

void sub_1000070D4(uint64_t a1)
{
  id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) internalQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007148;
  block[3] = &unk_1000CCE58;
  void block[4] = *(void *)(a1 + 32);
  dispatch_sync(v2, block);
}

id sub_100007148(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTerminationAssertion:0];
}

id sub_100007258(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTerminationAssertion:0];
}

void sub_1000072B0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

LABEL_33:
        id v10 = 0;
LABEL_34:

        goto LABEL_35;
      }

      __int16 v11 = -[IXUninstallOptions waitForDeletion](self, "waitForDeletion");
      if (v11 == -[IXUninstallOptions waitForDeletion](v6, "waitForDeletion"))
      {
        id v13 = -[IXUninstallOptions showArchiveOption](self, "showArchiveOption");
        if (v13 != -[IXUninstallOptions showArchiveOption](v6, "showArchiveOption"))
        {
          __int16 v14 = sub_1000047B4((uint64_t)off_1000E8CA0);
          id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            id v28 = 136315394;
            __int128 v29 = "-[IXUninstallOptions isEqual:]";
            v30 = 2080;
            v31 = "showArchiveOption";
            goto LABEL_32;
          }

          goto LABEL_33;
        }

        id v15 = -[IXUninstallOptions showDemotionOption](self, "showDemotionOption");
        if (v15 != -[IXUninstallOptions showDemotionOption](v6, "showDemotionOption"))
        {
          char v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
          id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            id v28 = 136315394;
            __int128 v29 = "-[IXUninstallOptions isEqual:]";
            v30 = 2080;
            v31 = "showDemotionOption";
            goto LABEL_32;
          }

          goto LABEL_33;
        }

        id v17 = -[IXUninstallOptions waitForDeletion](self, "waitForDeletion");
        if (v17 == -[IXUninstallOptions waitForDeletion](v6, "waitForDeletion"))
        {
          id v19 = -[IXUninstallOptions systemAppNotAllowed](self, "systemAppNotAllowed");
          if (v19 == -[IXUninstallOptions systemAppNotAllowed](v6, "systemAppNotAllowed"))
          {
            id v21 = -[IXUninstallOptions ignoreRemovability](self, "ignoreRemovability");
            if (v21 == -[IXUninstallOptions ignoreRemovability](v6, "ignoreRemovability"))
            {
              id v23 = -[IXUninstallOptions ignoreRestrictions](self, "ignoreRestrictions");
              if (v23 == -[IXUninstallOptions ignoreRestrictions](v6, "ignoreRestrictions"))
              {
                unsigned __int8 v25 = -[IXUninstallOptions ignoreAppProtection](self, "ignoreAppProtection");
                if (v25 == -[IXUninstallOptions ignoreAppProtection](v6, "ignoreAppProtection"))
                {
                  id v10 = 1;
                  goto LABEL_34;
                }

                id v26 = sub_1000047B4((uint64_t)off_1000E8CA0);
                id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
                if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
                {
                  id v28 = 136315394;
                  __int128 v29 = "-[IXUninstallOptions isEqual:]";
                  v30 = 2080;
                  v31 = "ignoreAppProtection";
                  goto LABEL_32;
                }
              }

              else
              {
                id v24 = sub_1000047B4((uint64_t)off_1000E8CA0);
                id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
                if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
                {
                  id v28 = 136315394;
                  __int128 v29 = "-[IXUninstallOptions isEqual:]";
                  v30 = 2080;
                  v31 = "ignoreRestrictions";
                  goto LABEL_32;
                }
              }
            }

            else
            {
              uint64_t v22 = sub_1000047B4((uint64_t)off_1000E8CA0);
              id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
              if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
              {
                id v28 = 136315394;
                __int128 v29 = "-[IXUninstallOptions isEqual:]";
                v30 = 2080;
                v31 = "ignoreRemovability";
                goto LABEL_32;
              }
            }
          }

          else
          {
            uint64_t v20 = sub_1000047B4((uint64_t)off_1000E8CA0);
            id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              id v28 = 136315394;
              __int128 v29 = "-[IXUninstallOptions isEqual:]";
              v30 = 2080;
              v31 = "systemAppNotAllowed";
              goto LABEL_32;
            }
          }

          goto LABEL_33;
        }

        id v18 = sub_1000047B4((uint64_t)off_1000E8CA0);
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_33;
        }
      }

      else
      {
        uint64_t v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_33;
        }
      }

      id v28 = 136315394;
      __int128 v29 = "-[IXUninstallOptions isEqual:]";
      v30 = 2080;
      v31 = "waitForDeletion";
      goto LABEL_32;
    }

    id v10 = 0;
  }

      v50 = objc_claimAutoreleasedReturnValue( -[IXFileManager _realPathForURL:allowNonExistentPathComponents:]( self,  "_realPathForURL:allowNonExistentPathComponents:",  v7,  0LL));
      if (v50)
      {
        id v39 = (void *)v50;
        v51 = (void *)objc_claimAutoreleasedReturnValue( -[IXFileManager _realPathForURL:allowNonExistentPathComponents:]( self,  "_realPathForURL:allowNonExistentPathComponents:",  v6,  1LL));
        if (!v51)
        {
          id v59 = sub_1000047B4((uint64_t)off_1000E8CA0);
          v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            dispatch_queue_t v61 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
            *(_DWORD *)buf = 136315394;
            v101 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
            v102 = 2112;
            v103 = v61;
            _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to retrieve realpath for suspicious path %@",  buf,  0x16u);
          }

          goto LABEL_25;
        }

        v40 = v51;
        if ((v35 & 0x8000000000000000LL) == 0)
        {
LABEL_36:
          v40 = v40;
          v41 = v40;
          goto LABEL_27;
        }

        v64 = (void *)objc_claimAutoreleasedReturnValue([v51 pathComponents]);
        v97 = (void *)objc_claimAutoreleasedReturnValue([v39 pathComponents]);
        int v65 = (char *)[v97 count];
        __int16 v98 = v64;
        id v66 = (char *)[v64 count];
        if ((unint64_t)v66 < 2 || (unint64_t)v65 <= 1)
        {
          id v78 = sub_1000047B4((uint64_t)off_1000E8CA0);
          __int128 v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            loga = v73;
            __int128 v79 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
            __int128 v80 = (char *)objc_claimAutoreleasedReturnValue([v7 path]);
            __int128 v81 = (void *)objc_claimAutoreleasedReturnValue([v40 path]);
            __int128 v82 = (void *)objc_claimAutoreleasedReturnValue([v39 path]);
            *(_DWORD *)buf = 136316162;
            v101 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
            v102 = 2112;
            v103 = v79;
            v104 = 2112;
            v105 = v80;
            v106 = 2112;
            v107 = v81;
            v108 = 2112;
            v109 = (uint64_t)v82;
            _os_log_impl( (void *)&_mh_execute_header,  loga,  OS_LOG_TYPE_DEFAULT,  "%s: Rejecting %@ with base %@ because real component counts don't make sense (reals %@ ; %@)",
              buf,
              0x34u);

            __int128 v73 = loga;
          }
        }

        else
        {
          v67 = v66;
          v68 = 1LL;
          id v69 = (void *)objc_claimAutoreleasedReturnValue([v97 objectAtIndexedSubscript:1]);

          __int16 v92 = v65;
          __int128 v70 = (void *)objc_claimAutoreleasedReturnValue([v98 objectAtIndexedSubscript:1]);
          else {
            __int128 v71 = 1LL;
          }

          if (&v92[-v68] <= &v67[-v71])
          {
            if ((unint64_t)v92 <= v68)
            {
LABEL_65:

              goto LABEL_36;
            }

            while (1)
            {
              id v83 = (void *)objc_claimAutoreleasedReturnValue([v97 objectAtIndexedSubscript:v68]);
              v84 = (void *)objc_claimAutoreleasedReturnValue([v98 objectAtIndexedSubscript:v71]);
              logb = [v83 isEqualToString:v84];

              if ((logb & 1) == 0) {
                break;
              }
              ++v68;
              ++v71;
            }

            v85 = sub_1000047B4((uint64_t)off_1000E8CA0);
            __int128 v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
            if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
            {
              logc = (os_log_t)objc_claimAutoreleasedReturnValue([v6 path]);
              v91 = (char *)objc_claimAutoreleasedReturnValue([v7 path]);
              v90 = (void *)objc_claimAutoreleasedReturnValue([v40 path]);
              v89 = (void *)objc_claimAutoreleasedReturnValue([v39 path]);
              __int16 v86 = (void *)objc_claimAutoreleasedReturnValue([v97 objectAtIndexedSubscript:v68]);
              v87 = objc_claimAutoreleasedReturnValue([v98 objectAtIndexedSubscript:v71]);
              *(_DWORD *)buf = 136316674;
              v101 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
              v102 = 2112;
              v103 = logc;
              v104 = 2112;
              v105 = v91;
              v106 = 2112;
              v107 = v90;
              v108 = 2112;
              v109 = (uint64_t)v89;
              v110 = 2112;
              v111 = v86;
              v112 = 2112;
              v113 = v87;
              __int16 v88 = (void *)v87;
              _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEFAULT,  "%s: Rejecting %@ with base %@ (reals %@ ; %@) because components diverge at %@ != %@",
                buf,
                0x48u);
            }
          }

          else
          {
            __int128 v72 = sub_1000047B4((uint64_t)off_1000E8CA0);
            __int128 v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
            if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
            {
              log = (os_log_t)objc_claimAutoreleasedReturnValue([v6 path]);
              __int128 v74 = (char *)objc_claimAutoreleasedReturnValue([v7 path]);
              __int128 v75 = (void *)objc_claimAutoreleasedReturnValue([v40 path]);
              id v76 = objc_claimAutoreleasedReturnValue([v39 path]);
              *(_DWORD *)buf = 136316162;
              v101 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
              v102 = 2112;
              v103 = log;
              v104 = 2112;
              v105 = v74;
              v106 = 2112;
              v107 = v75;
              v108 = 2112;
              v109 = v76;
              id v77 = (void *)v76;
              _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEFAULT,  "%s: Rejecting %@ with base %@ because base component count is greater than child component count (reals %@ ; %@)",
                buf,
                0x34u);
            }
          }
        }

        goto LABEL_26;
      }

      id v53 = sub_1000047B4((uint64_t)off_1000E8CA0);
      v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
        *(_DWORD *)buf = 136315394;
        v101 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
        v102 = 2112;
        v103 = v55;
        _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to retrieve realpath for base path %@ ",  buf,  0x16u);
LABEL_48:

        goto LABEL_49;
      }

      goto LABEL_49;
    }

    if (*__error() == 22 || *__error() == 2)
    {
      uint64_t v38 = (char *)objc_claimAutoreleasedReturnValue([v6 path]);
      v37 = 0LL;
      goto LABEL_33;
    }

    uint64_t v56 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    uint64_t v57 = __error();
    id v58 = strerror(*v57);
    *(_DWORD *)buf = 136315394;
    v101 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
    v102 = 2080;
    v103 = v58;
    v30 = "%s: Readlink failed: %s";
    v31 = v24;
    unsigned __int8 v32 = 22;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
    goto LABEL_23;
  }

  id v23 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
    *(_DWORD *)buf = 136315394;
    v101 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
    v102 = 2112;
    v103 = v25;
    id v26 = "%s: The suspicious path %@ contains '..' paths, which are invalid";
LABEL_11:
    id v27 = v24;
    id v28 = 22;
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
    goto LABEL_22;
  }

LABEL_35:
  return v10;
}

  else {
    __int16 v11 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v11, "InstallPlaceholder");
  if ((a1 & 0x20) == 0)
  {
LABEL_7:
    if ((a1 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_43;
  }

        if (v10 == 4)
        {
LABEL_36:
          if (-[IXSCoordinatedAppInstall needsPostProcessing](self, "needsPostProcessing", v56))
          {
            if (v8 - 1 < 3) {
              return 25LL;
            }
            if (!v8) {
              return 24LL;
            }
            if (v8 != 4)
            {
              id v52 = sub_1000047B4((uint64_t)off_1000E8CA0);
              id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
                sub_10007FE44();
              }

              return 1LL;
            }

            id v43 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall essentialAssetPromises](self, "essentialAssetPromises"));
            id v58 = v43;
            v44 = v43;
            if (v43)
            {
              __int128 v81 = 0LL;
              __int128 v82 = &v81;
              id v83 = 0x2020000000LL;
              v84 = 1;
              v60 = 0u;
              dispatch_queue_t v61 = 0u;
              v62 = 0u;
              id v63 = 0u;
              v45 = v43;
              id v46 = [v45 countByEnumeratingWithState:&v60 objects:v85 count:16];
              if (v46)
              {
                id v47 = *(void *)v61;
LABEL_71:
                uint64_t v48 = 0LL;
                while (1)
                {
                  if (*(void *)v61 != v47) {
                    objc_enumerationMutation(v45);
                  }
                  v49 = *(void **)(*((void *)&v60 + 1) + 8 * v48);
                  v50 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v49 accessQueue]);
                  v59[0] = _NSConcreteStackBlock;
                  v59[1] = 3221225472LL;
                  v59[2] = sub_100040984;
                  v59[3] = &unk_1000CD080;
                  v59[4] = v49;
                  v59[5] = &v81;
                  dispatch_sync(v50, v59);

                  if (!*((_BYTE *)v82 + 24)) {
                    break;
                  }
                  if (v46 == (id)++v48)
                  {
                    id v46 = [v45 countByEnumeratingWithState:&v60 objects:v85 count:16];
                    if (v46) {
                      goto LABEL_71;
                    }
                    break;
                  }
                }
              }

              v51 = *((unsigned __int8 *)v82 + 24);
              _Block_object_dispose(&v81, 8);
              if (v51)
              {

                return 28LL;
              }

              int v4 = 27LL;
              v44 = v58;
            }

            else
            {
              int v4 = 26LL;
            }

            return v4;
          }

          return 28LL;
        }

BOOL sub_10000860C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  BOOL v6 = (v3 != 0) == (v4 != 0) && (!v3 || !v4 || [v3 isEqual:v4]);

  return v6;
}

LABEL_27:
  return v32;
}

  else {
    id v9 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v9, "Pause");
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_35;
  }

void sub_100008D98(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  id v2 = (void *)qword_1000E8E20;
  qword_1000E8E20 = (uint64_t)v1;
}

uint64_t sub_100009D34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _os_log_send_and_compose_impl(a1, v6, v5, 80LL, a5, v7, 16LL);
}

double sub_100009D4C(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t sub_100009D70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _os_log_send_and_compose_impl(a1, a2, a3, 80LL, a5, v5, 16LL);
}

BOOL sub_100009D80()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

  ;
}

uint64_t sub_100009DA8(uint64_t a1)
{
  return _os_crash_msg(*v1, a1);
}

id sub_100009DB4(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 domain]);
  if ([v2 isEqualToString:@"IXUserPresentableErrorDomain"])
  {
    id v3 = [v1 code];

    if (v3 == (id)11)
    {
      id v4 = v1;
      goto LABEL_16;
    }
  }

  else
  {
  }

  id v5 = v1;
  id v4 = v5;
  if (!v5) {
    goto LABEL_16;
  }
  uint64_t v6 = v5;
  while (1)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    if (![v7 isEqualToString:NSPOSIXErrorDomain])
    {

      goto LABEL_11;
    }

    id v8 = [v6 code];

    if (v8 == (id)28) {
      break;
    }
LABEL_11:
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    uint64_t v6 = (void *)v10;
    if (!v10)
    {
      id v4 = 0LL;
      goto LABEL_16;
    }
  }

  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  int v12 = [v11 isEqual:@"IXUserPresentableErrorDomain"];

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"AlertUser"]);
    int v12 = sub_100072D10(v14, 0LL);
  }

  id v15 = IXCreateUserPresentableError(0xBuLL, v12, v4);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v15);

LABEL_16:
  return v4;
}

void sub_10000A060(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  id v2 = (void *)qword_1000E8E30;
  qword_1000E8E30 = (uint64_t)v1;
}

void sub_10000A2FC(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5 = a2;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
  unsigned __int8 v8 = [v6 applicationIsInstalled:v7];

  if ((v8 & 1) != 0
    || (id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]),
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _testAppRemovabilityBundleID]),
        unsigned int v11 = [v9 isEqual:v10],
        v10,
        v9,
        v11))
  {
    objc_msgSend( *(id *)(a1 + 32),  "_onQueue_setRemovabilityForAppWithIdentity:usingEligibilityAnswer:",  v5,  *(void *)(a1 + 40));
  }

  else
  {
    int v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315394;
      id v15 = "-[IXSAppDeletionEligibilityManager _onQueue_updateRemovabilityForAppIdentities:usingEligibilityAnswer:]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: No LSApplicationRecord found for %@, assuming uninstalled, skipping",  (uint8_t *)&v14,  0x16u);
    }
  }

  *a3 = 0;
}

void sub_10000A8E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000A910(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v15 = a2;
  id v7 = a3;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", 0LL));
  id v9 = objc_msgSend(*(id *)(a1 + 32), "_eligibilityAnswerForDomain:", objc_msgSend(v15, "longLongValue"));
  if (v9)
  {
    id v10 = v9;
    if (v9 != [v7 longLongValue])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
      uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v10));

      int v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) domainToEligibilityAnswerMap]);
      [v12 setObject:v11 forKey:v15];

      id v13 = *(void **)(a1 + 32);
      int v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v15]);
      objc_msgSend(v13, "_onQueue_updateRemovabilityForAppIdentities:usingEligibilityAnswer:", v14, v10);

      unsigned __int8 v8 = (void *)v11;
    }
  }

  *a4 = 0;
}

id sub_10000AA90(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_processEligibilityDomainChange");
}

id sub_10000ADD0(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_onQueue_enumerateSystemAppPlaceholdersAndSetAppRemovability:",  *(void *)(a1 + 40));
}

void sub_10000AEA4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10000AEBC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000AECC(uint64_t a1)
{
}

void sub_10000AED4(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) domainToEligibilityAnswerMap]);
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10000AFC4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) mutableCopy];
  [*(id *)(a1 + 32) setDomainToEligibilityAnswerMap:v2];
}

LABEL_11:
  return v6;
}

  return v19;
}

  return v16;
}

  __int16 v16 = 0LL;
LABEL_12:
  id v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
  unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 bundleID]);
  id v26 = sub_100031BB0(v25, 16LL);

  if (v26)
  {
    id v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) internalQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100043660;
    block[3] = &unk_1000CCE58;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(v27, block);
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 miAppIdentity]);
  v30 = [*(id *)(a1 + 32) installationDomain];
  v31 = *(void *)(a1 + 48);
  id v36 = *(void *)(a1 + 56);
  v37 = 0LL;
  unsigned __int8 v32 = MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError( v7,  v29,  v30,  v31,  0LL,  0LL,  &v37,  a4,  v8,  v36);

  id v33 = v37;
  id v34 = v37;

  if ((_DWORD)v32) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), v33);
  }

  return v32;
}

  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL)) {
    *a4 = 1;
  }
}

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10007491C;
  v15[3] = &unk_1000CF078;
  v15[4] = *(void *)(a1 + 32);
  -[NSMutableArray enumerateObjectsUsingBlock:](v4, "enumerateObjectsUsingBlock:", v15);
  if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_writeRemovabilityWithError:", 0))
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100074A14;
    v14[3] = &unk_1000CF078;
    v14[4] = *(void *)(a1 + 32);
    -[NSMutableArray enumerateObjectsUsingBlock:](v4, "enumerateObjectsUsingBlock:", v14);
  }

  if (-[NSMutableArray count](v4, "count")) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }
}

void sub_10000BCDC(id a1)
{
  id v39 = 0LL;
  int v1 = sub_10000C0D8((uint64_t)"com.apple.mobile.usermanagerd.xpc", &v39);
  id v2 = v39;
  id v38 = 0LL;
  int v3 = sub_10000C0D8((uint64_t)"com.apple.mobile.keybagd.UserManager.xpc", &v38);
  id v4 = v38;
  *(void *)error = 0LL;
  id v5 = SecTaskCreateFromSelf(0LL);
  if (!v5)
  {
    int v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100079F4C();
    }

    id v15 = sub_10003556C( (uint64_t)"_ProcessHasUMEntitlement",  272LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"SecTaskCreateFromSelf returned NULL when attempting to fetch UM entitlement",  v14,  v37);
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    goto LABEL_14;
  }

  uint64_t v6 = v5;
  id v7 = (void *)SecTaskCopyValueForEntitlement(v5, @"com.apple.usermanagerd.persona.fetch", (CFErrorRef *)error);
  if (!v7)
  {
    id v17 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100079FBC((void **)error);
    }

    id v19 = *(void **)error;
    id v21 = sub_10003556C( (uint64_t)"_ProcessHasUMEntitlement",  278LL,  @"IXErrorDomain",  1uLL,  *(void **)error,  0LL,  @"SecTaskCopyValueForEntitlement returned NULL when attempting to fetch the value for the entitlement com.apple.usermanagerd.persona.fetch in the current process.",  v20,  v37);
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(v21);

    CFRelease(v6);
LABEL_14:
    id v10 = v16;

    int v11 = 0;
    goto LABEL_15;
  }

  unsigned __int8 v8 = v7;
  unsigned int v9 = sub_100072D10(v7, 0LL);

  if (v9)
  {
    CFRelease(v6);
    id v10 = 0LL;
    int v11 = 1;
    goto LABEL_15;
  }

  uint64_t v22 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_10007A040();
  }

  int v11 = 1;
  id v25 = sub_10003556C( (uint64_t)"_ProcessHasUMEntitlement",  284LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Client process has a value other than true for the entitlement com.apple.usermanagerd.persona.fetch.",  v24,  v37);
  id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

  CFRelease(v6);
  __int16 v16 = 0LL;
  id v10 = 0LL;
  if (!v26) {
    goto LABEL_14;
  }
LABEL_15:
  id v27 = v10;
  if (v1)
  {
    byte_1000E8E40 = v3 & v11;
    if ((v3 & v11 & 1) != 0) {
      goto LABEL_24;
    }
  }

  else
  {
    byte_1000E8E40 = 0;
  }

  id v28 = sub_1000047B4((uint64_t)off_1000E8CA0);
  __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)error = 136316930;
    *(void *)&error[4] = "_ProcessCanAccessUM_block_invoke";
    __int16 v41 = 1024;
    if (v1) {
      uint64_t v30 = 89LL;
    }
    else {
      uint64_t v30 = 78LL;
    }
    int v42 = v30;
    if (v3) {
      int v35 = 89;
    }
    else {
      int v35 = 78;
    }
    __int16 v43 = 1024;
    if (v11) {
      int v36 = 89;
    }
    else {
      int v36 = 78;
    }
    int v44 = v35;
    __int16 v45 = 1024;
    int v46 = v36;
    __int16 v47 = 2112;
    id v48 = v2;
    __int16 v49 = 2112;
    id v50 = v4;
    __int16 v51 = 2112;
    id v52 = v27;
    __int16 v53 = 2112;
    uint64_t v54 = 0LL;
    _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%s: This process can't access UM (mach-lookup com.apple.mobile.usermanagerd.xpc: %c, mach-lookup com.apple.mobile. keybagd.UserManager.xpc: %c, entitlement com.apple.usermanagerd.persona.fetch: %c): (%@, %@, %@) : %@",  error,  0x46u);
  }

  else if (v1)
  {
    uint64_t v30 = 89LL;
  }

  else
  {
    uint64_t v30 = 78LL;
  }

  id v32 = sub_10003556C( (uint64_t)"_ProcessCanAccessUM_block_invoke",  344LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"This process can't access UM (mach-lookup com.apple.mobile.usermanagerd.xpc: %c, mach-lookup com.apple.mobile.keybagd.UserManager.xpc: %c, entitlement com.apple.usermanagerd.persona.fetch: %c): (%@, %@, %@)",  v31,  v30);
  uint64_t v33 = objc_claimAutoreleasedReturnValue(v32);
  id v34 = (void *)qword_1000E8E48;
  qword_1000E8E48 = v33;

LABEL_24:
}

uint64_t sub_10000C0D8(uint64_t a1, void *a2)
{
  uint64_t v4 = getpid();
  int v5 = sandbox_check(v4, "mach-lookup", SANDBOX_CHECK_NO_REPORT | 2u);
  if (v5)
  {
    if (v5 == 1)
    {
      uint64_t v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10007A168(a1, v7, v8);
      }

      id v10 = sub_10003556C( (uint64_t)"_ClientProcessLookupMachPortName",  311LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"This process does not have sandbox access to mach-lookup %s",  v9,  a1);
    }

    else
    {
      int v13 = *__error();
      uint64_t v14 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10007A0B0(a1, v13, v15);
      }

      strerror(v13);
      id v10 = sub_10003556C( (uint64_t)"_ClientProcessLookupMachPortName",  316LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"sandbox_check returned an error when checking if this process can mach-lookup %s : %s",  v16,  a1);
    }

    id v11 = (id)objc_claimAutoreleasedReturnValue(v10);
    if (a2)
    {
      id v11 = v11;
      uint64_t v12 = 0LL;
      *a2 = v11;
    }

    else
    {
      uint64_t v12 = 0LL;
    }
  }

  else
  {
    id v11 = 0LL;
    uint64_t v12 = 1LL;
  }

  return v12;
}

void sub_10000C24C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

__CFString *sub_10000C26C(int a1)
{
  int v1 = proc_pidpath(a1, buffer, 0x1000u);
  if (v1 < 1) {
    return @"Unknown Process Name";
  }
  id v2 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  buffer,  v1,  4LL);
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lastPathComponent](v2, "lastPathComponent"));

  return (__CFString *)v3;
}

id sub_10000C330(void *a1)
{
  id v1 = [a1 processIdentifier];
  id v2 = sub_10000C26C((int)v1);
  int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (pid %d)",  v3,  v1));

  return v4;
}

id sub_10000C398(void *a1, uint64_t a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([a1 valueForEntitlement:a2]);
  if ((objc_opt_respondsToSelector(v2, "BOOLValue") & 1) != 0) {
    id v3 = [v2 BOOLValue];
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

uint64_t sub_10000C3EC(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 valueForEntitlement:@"com.apple.private.mobileinstall.allowedSPI"]);
  if (!v4) {
    goto LABEL_8;
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    if (([v4 isEqualToString:v3] & 1) == 0)
    {
LABEL_8:
      uint64_t v7 = 0LL;
      goto LABEL_9;
    }
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
  }

  uint64_t v7 = 1LL;
LABEL_9:

  return v7;
}

id sub_10000C4A8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ((sub_10000C3EC(v3, v4) & 1) != 0)
  {
    uint64_t v5 = 0LL;
  }

  else
  {
    uint64_t v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10007A1F4(v3, (uint64_t)v4, v7);
    }

    id v8 = sub_10000C330(v3);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v11 = sub_10003556C( (uint64_t)"IXValidateMobileInstallationSPIEntitlement",  84LL,  @"IXErrorDomain",  0x19uLL,  0LL,  0LL,  @"Process %@ is required to have an entitlement named %@ with an array containing %@ to call this SPI.",  v10,  (uint64_t)v9);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }

  return v5;
}

id sub_10000C5A4(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue( [a1 valueForEntitlement:@"com.apple.private.mobileinstall.allowed-linked-parents"]);
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSArray);
  id v3 = v1;
  if ((objc_opt_isKindOfClass(v3, v2) & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0LL;
  }

  else {
    id v6 = 0LL;
  }

  return v6;
}

__CFString *sub_10000C64C(uint64_t a1)
{
  if ((int)a1 > 20)
  {
    switch((_DWORD)a1)
    {
      case 0x15:
        return @"QOS_CLASS_DEFAULT";
      case 0x21:
        return @"QOS_CLASS_USER_INTERACTIVE";
      case 0x19:
        return @"QOS_CLASS_USER_INITIATED";
    }

    goto LABEL_16;
  }

  if (!(_DWORD)a1) {
    return @"QOS_CLASS_UNSPECIFIED";
  }
  if ((_DWORD)a1 == 9) {
    return @"QOS_CLASS_BACKGROUND";
  }
  if ((_DWORD)a1 != 17)
  {
LABEL_16:
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown Class: %u",  a1));
    return v1;
  }

  id v1 = @"QOS_CLASS_UTILITY";
  return v1;
}

id sub_10000C700(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a1;
  id v10 = [v9 copy];
  unsigned __int8 v11 = sub_10000C398(v7, (uint64_t)@"com.apple.private.install.distributor-info-source");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 distributorInfo]);

  if ((v11 & 1) != 0 || !v12)
  {
    id v21 = v10;
    uint64_t v20 = 0LL;
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }

  int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 distributorID]);
  uint64_t v14 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    id v23 = sub_10000C330(v7);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    *(_DWORD *)buf = 136316418;
    id v26 = "IXSanitizeAndValidateRestrictedStoreMetadata";
    __int16 v27 = 2112;
    id v28 = v24;
    __int16 v29 = 2112;
    id v30 = v8;
    __int16 v31 = 2112;
    id v32 = @"com.apple.private.install.distributor-info-source";
    __int16 v33 = 2112;
    id v34 = v13;
    __int16 v35 = 2112;
    uint64_t v36 = 0LL;
    _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s: Client %@ setting the %@ did not have the required entitlement %@ = TRUE to allow the distribution info in the store metadata to be set (supplied distributor ID was '%@'). : %@",  buf,  0x3Eu);
  }

  id v16 = sub_10000C330(v7);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v19 = sub_10003556C( (uint64_t)"IXSanitizeAndValidateRestrictedStoreMetadata",  142LL,  @"IXErrorDomain",  0x19uLL,  0LL,  0LL,  @"Client %@ setting the %@ did not have the required entitlement %@ = TRUE to allow the distribution info in the store metadata to be set (supplied distributor ID was '%@').",  v18,  (uint64_t)v17);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  id v21 = 0LL;
  if (a4)
  {
LABEL_8:
    if (!v21) {
      *a4 = v20;
    }
  }

void sub_10000CB2C(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  uint64_t v2 = (void *)qword_1000E8E58;
  qword_1000E8E58 = (uint64_t)v1;
}

void sub_10000CBF8(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identityToCoordinatorMap]);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

LABEL_57:
  }

  if (!v2->_identityToCoordinatorMap || !v2->_uuidToCoordinatorMap)
  {
    id v83 = objc_opt_new(v11[92]);
    v84 = v2->_identityToCoordinatorMap;
    v2->_identityToCoordinatorMap = (NSMutableDictionary *)v83;

    v85 = objc_opt_new(v11[92]);
    __int16 v86 = v2->_uuidToCoordinatorMap;
    v2->_uuidToCoordinatorMap = (NSMutableDictionary *)v85;
  }

  v87 = [(id)objc_opt_class(v2) prioritySaveURL];
  v166[1] = v74;
  v151 = (void *)objc_claimAutoreleasedReturnValue(v87);
  __int16 v88 = objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:options:error:"));
  v89 = v74;

  v149 = (void *)v88;
  if (v88)
  {
    v166[0] = v89;
    v90 = +[NSKeyedUnarchiver unarchivedArrayOfObjectsOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedArrayOfObjectsOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___IXApplicationIdentity),  v88,  v166);
    v91 = (void *)objc_claimAutoreleasedReturnValue(v90);
    __int16 v92 = v166[0];

    if (v91)
    {
      v146 = v92;
      v93 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      v162 = 0u;
      v163 = 0u;
      v164 = 0u;
      v165 = 0u;
      v147 = v91;
      __int16 v94 = v91;
      id v95 = [v94 countByEnumeratingWithState:&v162 objects:v182 count:16];
      if (v95)
      {
        v96 = v95;
        v97 = 0LL;
        __int16 v98 = *(void *)v163;
        do
        {
          v99 = 0LL;
          v100 = v97;
          do
          {
            if (*(void *)v163 != v98) {
              objc_enumerationMutation(v94);
            }
            v101 = *(void **)(*((void *)&v162 + 1) + 8LL * (void)v99);
            v161 = v100;
            v102 = [v101 resolvePersonaWithError:&v161];
            v97 = v161;

            if ((v102 & 1) != 0)
            {
              -[NSMutableArray addObject:](v93, "addObject:", v101);
            }

            else
            {
              v103 = sub_1000047B4((uint64_t)off_1000E8CA0);
              v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
              if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
              {
                v105 = (os_log_s *)objc_claimAutoreleasedReturnValue([v101 bundleID]);
                *(_DWORD *)buf = 136315650;
                v184 = "-[IXSCoordinatorManager init]";
                v185 = 2112;
                v186 = v105;
                v187 = 2112;
                v188 = (uint64_t)v97;
                _os_log_impl( (void *)&_mh_execute_header,  v104,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to resolve persona %@ : %@",  buf,  0x20u);
              }
            }

            v99 = (char *)v99 + 1;
            v100 = v97;
          }

          while (v96 != v99);
          v96 = [v94 countByEnumeratingWithState:&v162 objects:v182 count:16];
        }

        while (v96);
      }

      else
      {
        v97 = 0LL;
      }

      identityPriority = v2->_identityPriority;
      v2->_identityPriority = v93;

      __int16 v92 = v146;
      v91 = v147;
    }

    else
    {
      v108 = sub_1000047B4((uint64_t)off_1000E8CA0);
      v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v184 = "-[IXSCoordinatorManager init]";
        v185 = 2112;
        v186 = (os_log_s *)v92;
        _os_log_impl( (void *)&_mh_execute_header,  v97,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to deserialize identity priority data: %@",  buf,  0x16u);
      }
    }
  }

  else
  {
    v106 = (void *)objc_claimAutoreleasedReturnValue([v89 domain]);
    if ([v106 isEqualToString:NSCocoaErrorDomain])
    {
      v107 = [v89 code];

      if (v107 == (id)260) {
        goto LABEL_89;
      }
    }

    else
    {
    }

    v109 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v91 = (void *)objc_claimAutoreleasedReturnValue(v109);
    if (os_log_type_enabled((os_log_t)v91, OS_LOG_TYPE_DEFAULT))
    {
      v110 = (os_log_s *)objc_claimAutoreleasedReturnValue([v151 path]);
      *(_DWORD *)buf = 136315650;
      v184 = "-[IXSCoordinatorManager init]";
      v185 = 2112;
      v186 = v110;
      v187 = 2112;
      v188 = (uint64_t)v89;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v91,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to read identity priority serialization from %@ : %@",  buf,  0x20u);
    }

    __int16 v92 = v89;
  }

  v89 = v92;
LABEL_89:
  if (!v2->_identityPriority)
  {
    v112 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager identityToCoordinatorMap](v2, "identityToCoordinatorMap"));
    v113 = (void *)objc_claimAutoreleasedReturnValue([v112 allKeys]);
    v114 = (NSMutableArray *)[v113 mutableCopy];
    v115 = v2->_identityPriority;
    v2->_identityPriority = v114;

    v116 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
    [v116 removeItemAtURL:v151 error:0];
  }

  v117 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v157 = 0u;
  v158 = 0u;
  v159 = 0u;
  v160 = 0u;
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager identityPriority](v2, "identityPriority"));
  v119 = [v118 countByEnumeratingWithState:&v157 objects:v181 count:16];
  if (v119)
  {
    v120 = v119;
    v121 = *(void *)v158;
    do
    {
      for (i = 0LL; i != v120; i = (char *)i + 1)
      {
        if (*(void *)v158 != v121) {
          objc_enumerationMutation(v118);
        }
        v123 = *(void *)(*((void *)&v157 + 1) + 8LL * (void)i);
        v124 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager identityToCoordinatorMap](v2, "identityToCoordinatorMap"));
        v125 = (void *)objc_claimAutoreleasedReturnValue([v124 objectForKeyedSubscript:v123]);

        if (!v125) {
          -[NSMutableArray addObject:](v117, "addObject:", v123);
        }
      }

      v120 = [v118 countByEnumeratingWithState:&v157 objects:v181 count:16];
    }

    while (v120);
  }

  v126 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager identityPriority](v2, "identityPriority"));
  [v126 removeObjectsInArray:v117];

  v155 = 0u;
  v156 = 0u;
  v153 = 0u;
  v154 = 0u;
  v127 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager identityToCoordinatorMap](v2, "identityToCoordinatorMap"));
  v128 = [v127 countByEnumeratingWithState:&v153 objects:v180 count:16];
  if (v128)
  {
    v129 = v128;
    v130 = *(void *)v154;
    do
    {
      for (j = 0LL; j != v129; j = (char *)j + 1)
      {
        if (*(void *)v154 != v130) {
          objc_enumerationMutation(v127);
        }
        v132 = *(void *)(*((void *)&v153 + 1) + 8LL * (void)j);
        v133 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager identityPriority](v2, "identityPriority"));
        v134 = [v133 containsObject:v132];

        if ((v134 & 1) == 0)
        {
          v135 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorManager identityPriority](v2, "identityPriority"));
          [v135 addObject:v132];
        }
      }

      v129 = [v127 countByEnumeratingWithState:&v153 objects:v180 count:16];
    }

    while (v129);
  }

  return v2;
}

id sub_10000DDAC(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelForReason:*(void *)(a1 + 40) client:15 error:0];
}

void sub_10000E32C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10000E344(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000E354(uint64_t a1)
{
}

void sub_10000E35C(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuidToCoordinatorMap]);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10000E488(id *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1[4] identityToCoordinatorMap]);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000E51C;
  v3[3] = &unk_1000CCF68;
  id v4 = a1[5];
  id v5 = a1[6];
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void sub_10000E51C(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a2 bundleID]);
  LODWORD(v5) = [v5 isEqualToString:v6];

  if ((_DWORD)v5) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

void sub_10000E680( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000E698(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identityToCoordinatorMap]);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10000E9E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000EA10(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identityToCoordinatorMap]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:*(void *)(a1 + 40)]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) scopedToConnection]);
  unsigned int v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) coordinatorScope];
  id v7 = v10;
  if (v6 == 1 && v10 != 0LL)
  {
    unsigned __int8 v9 = [v10 clientProcessExists];
    id v7 = v10;
    if ((v9 & 1) == 0)
    {
      if (objc_msgSend( *(id *)(a1 + 32),  "_onMapQueue_removeCoordinatorFromMaps:",  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))) {
        objc_msgSend(*(id *)(a1 + 32), "_onMapQueue_saveIdentityPriority");
      }
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
      id v7 = v10;
    }
  }
}

void sub_10000ED14( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_10000ED40(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v41 = 0LL;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v2 _lookupCoordinatorForIdentity:v3 checkingScopeForConnection:v4 error:&v41]);
  id v6 = v41;
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL))
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    if ([v9 isEqualToString:@"IXErrorDomain"])
    {
      id v10 = [v6 code];

      if (v10 == (id)6)
      {

        uint64_t v11 = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
        uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
        uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8LL);
        uint64_t v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;

        unsigned __int8 v15 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) coordinatorScope];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) connectionUUID]);
        uint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mapQueue]);
        block[0] = _NSConcreteStackBlock;
        block[2] = sub_10000F0D8;
        block[3] = &unk_1000CCFE0;
        uint64_t v19 = *(void *)(a1 + 32);
        uint64_t v20 = *(void **)(a1 + 40);
        uint64_t v39 = *(void *)(a1 + 64);
        void block[4] = v19;
        block[1] = 3221225472LL;
        id v36 = v20;
        id v21 = v16;
        id v37 = v21;
        unsigned __int8 v40 = v15;
        id v22 = v17;
        id v38 = v22;
        dispatch_sync(v18, block);

        id v23 = sub_1000047B4((uint64_t)off_1000E8CA0);
        uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
          *(_DWORD *)buf = 136315394;
          __int16 v43 = "-[IXSCoordinatorManager coordinatorForIdentity:connection:error:creatingIfNotExisting:]_block_invoke";
          __int16 v44 = 2112;
          uint64_t v45 = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s: Registered coordinator: %@",  buf,  0x16u);
        }

        unint64_t v27 = (unint64_t)[v26 intent];
        if (v27 >= 8) {
          id v28 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown intent value %lu",  v27));
        }
        else {
          id v28 = off_1000CD0A0[v27];
        }
        id v30 = IXStringForClientID((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) creator]);
        __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Created coordinator with intent %@ for client %@",  v28,  v31));

        if (v27 - 1 > 6) {
          uint64_t v33 = 17LL;
        }
        else {
          uint64_t v33 = qword_1000952E8[v27 - 1];
        }
        id v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleID]);
        +[AITransactionLog logStep:byParty:phase:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:description:",  v33,  4LL,  1LL,  1LL,  v34,  v32);

        id v6 = 0LL;
        goto LABEL_15;
      }
    }

    else
    {
    }

    uint64_t v29 = *(void *)(*(void *)(a1 + 72) + 8LL);
    id v6 = v6;
    id v21 = *(id *)(v29 + 40);
    *(void *)(v29 + 40) = v6;
LABEL_15:
  }
}

id sub_10000F0D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identityToCoordinatorMap]);
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuidToCoordinatorMap]);
  [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 48)];

  if (*(_BYTE *)(a1 + 72) == 1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connectionToProcessScopedCoordinatorMap]);
    uint64_t v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:*(void *)(a1 + 56)]);

    if (!v7)
    {
      uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connectionToProcessScopedCoordinatorMap]);
      [v8 setObject:v7 forKeyedSubscript:*(void *)(a1 + 56)];
    }

    -[NSMutableSet addObject:](v7, "addObject:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL));
  }

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identityPriority]);
  [v9 addObject:*(void *)(a1 + 40)];

  return objc_msgSend(*(id *)(a1 + 32), "_onMapQueue_saveIdentityPriority");
}

uint64_t sub_10000F294(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000F40C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

id sub_10000F430(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_onMapQueue_removeCoordinatorFromMaps:", *(void *)(a1 + 40));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = (_BYTE)result;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
    return objc_msgSend(*(id *)(a1 + 32), "_onMapQueue_saveIdentityPriority");
  }
  return result;
}

void sub_10000F608( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000F62C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identityPriority]);
  unsigned int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identityPriority]);
    [v4 removeObject:*(void *)(a1 + 40)];

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identityPriority]);
    [v5 insertObject:*(void *)(a1 + 40) atIndex:0];

    objc_msgSend(*(id *)(a1 + 32), "_onMapQueue_saveIdentityPriority");
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

void sub_10000F90C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
}

void sub_10000F938(uint64_t a1)
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identityPriority]);
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v15;
    *(void *)&__int128 v4 = 136315394LL;
    __int128 v13 = v4;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v7);
        unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identityToCoordinatorMap", v13));
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v8]);

        if (v10)
        {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v10];
        }

        else
        {
          uint64_t v11 = sub_1000047B4((uint64_t)off_1000E8CA0);
          uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v13;
            uint64_t v19 = "-[IXSCoordinatorManager _enumerateCoordinatorsForConnection:usingBlock:]_block_invoke";
            __int16 v20 = 2112;
            uint64_t v21 = v8;
            _os_log_fault_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "%s: Identity %@ found in identityPriority array was not found in identityToCoordinatorMap",  buf,  0x16u);
          }
        }

        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }

    while (v5);
  }
}

void sub_10000FD80(_Unwind_Exception *a1)
{
}

void sub_10000FDAC(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identityToCoordinatorMap]);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v5 allValues]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  __int128 v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100010030( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

void sub_100010064(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connectionToProcessScopedCoordinatorMap]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:*(void *)(a1 + 40)]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connectionToProcessScopedCoordinatorMap]);
    [v6 removeObjectForKey:*(void *)(a1 + 40)];

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v7 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      int v10 = 0;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v7);
          }
          v10 |= objc_msgSend( *(id *)(a1 + 32),  "_onMapQueue_removeCoordinatorFromMaps:",  *(void *)(*((void *)&v13 + 1) + 8 * (void)i),  (void)v13);
        }

        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v9);

      if ((v10 & 1) != 0) {
        objc_msgSend(*(id *)(a1 + 32), "_onMapQueue_saveIdentityPriority");
      }
    }

    else
    {
    }
  }

void sub_1000102AC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connectionToProcessScopedCoordinatorMap]);
  id v4 = (id)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:*(void *)(a1 + 40)]);

  [v4 removeObject:*(void *)(a1 + 48)];
  if (![v4 count])
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connectionToProcessScopedCoordinatorMap]);
    [v3 removeObjectForKey:*(void *)(a1 + 40)];
  }
}

CFStringRef IXStringForCoordinatorImportance(unint64_t a1)
{
  if (a1 > 4) {
    return @"Unhandled";
  }
  else {
    return off_1000CD0E0[a1];
  }
}

void sub_100011064(uint64_t a1)
{
  id v1 = [objc_alloc((Class)objc_opt_class(*(void *)(a1 + 32))) initWithWidth:5];
  uint64_t v2 = (void *)qword_1000E8E68;
  qword_1000E8E68 = (uint64_t)v1;
}

void sub_100011108(uint64_t a1)
{
  id v1 = [objc_alloc((Class)objc_opt_class(*(void *)(a1 + 32))) initWithWidth:5];
  uint64_t v2 = (void *)qword_1000E8E78;
  qword_1000E8E78 = (uint64_t)v1;
}

id sub_100011300(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_onQueue_runAsyncForIdentity:description:operation:",  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 56));
}

LABEL_13:
LABEL_26:
      uint64_t v39 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_10007A3C0(v21, v40, v41, v42, v43, v44, v45, v46);
      }
    }
  }

  else
  {
    __int16 v20 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_10007A350(v21, v22, v23, v24, v25, v26, v27, v28);
    }
  }

  return v9;
}

    int v10 = 0LL;
    uint64_t v12 = 0LL;
    goto LABEL_14;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodeObjectOfClasses:forKey:]( v10,  "decodeObjectOfClasses:forKey:",  v7,  NSKeyedArchiveRootObjectKey));
  if (!v12)
  {
    __int128 v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);
      objc_claimAutoreleasedReturnValue(-[NSKeyedUnarchiver error](v10, "error"));
      sub_10007B624();
    }
  }

  -[NSKeyedUnarchiver finishDecoding](v10, "finishDecoding");
LABEL_14:
  __int16 v20 = v25;
  uint64_t v21 = v12;

  _Block_object_dispose(&v27, 8);
  return v21;
}

  return v13 == 0LL;
}

LABEL_40:
}

  [v4 removeItemAtURL:v19 error:0];
  -[IXSPlaceholder cancelForReason:client:error:](self, "cancelForReason:client:error:", v36, 15LL, 0LL);
  uint64_t v54 = 0;
LABEL_41:

  return v54 & 1;
}

void sub_100011834(id *a1)
{
  uint64_t v2 = (void (**)(void))objc_claimAutoreleasedReturnValue([a1[4] block]);
  v2[2]();

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1[5] internalQueue]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000118EC;
  v6[3] = &unk_1000CCF90;
  id v7 = a1[6];
  id v4 = a1[4];
  id v5 = a1[5];
  id v8 = v4;
  id v9 = v5;
  sub_10005A8F0(v3, v6);
}

id sub_1000118EC(uint64_t a1)
{
  uint64_t v2 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10007A734(a1);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) activeIdentities]);
  [v4 removeObject:*(void *)(a1 + 32)];

  return objc_msgSend(*(id *)(a1 + 48), "_onQueue_deQueueIfNeeded");
}

void sub_100011B60( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100011B84( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100011B94( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

CFStringRef sub_100011BA8(const __CFString *a1, uint64_t a2)
{
  if (a2 > 1023) {
    return 0LL;
  }
  CFMutableStringRef MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy( kCFAllocatorDefault,  chars,  0LL,  1024LL,  kCFAllocatorNull);
  if (!MutableWithExternalCharactersNoCopy) {
    return 0LL;
  }
  id v5 = MutableWithExternalCharactersNoCopy;
  CFIndex Length = CFStringGetLength(a1);
  if (Length >= 1 && a2 >= 1)
  {
    CFIndex v7 = Length;
    CFIndex v8 = 0LL;
    id v9 = buffer;
    while (1)
    {
      CFRange RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex(a1, v8);
      if (RangeOfComposedCharactersAtIndex.length > 1024)
      {
        CFStringRef v12 = 0LL;
        goto LABEL_15;
      }

      CFStringGetCharacters(a1, RangeOfComposedCharactersAtIndex, chars);
      CFStringSetExternalCharactersNoCopy(v5, chars, RangeOfComposedCharactersAtIndex.length, 1024LL);
      if (!CFStringGetFileSystemRepresentation(v5, v9, a2 + 1)) {
        break;
      }
      v8 += RangeOfComposedCharactersAtIndex.length;
      size_t v11 = strlen(v9);
      if (v8 < v7)
      {
        v9 += v11;
        a2 -= v11;
        if (a2 > 0) {
          continue;
        }
      }

      goto LABEL_14;
    }

    *id v9 = 0;
  }

LABEL_14:
  CFStringRef v12 = CFStringCreateWithFileSystemRepresentation(kCFAllocatorDefault, buffer);
LABEL_15:
  CFRelease(v5);
  return v12;
}
}
}

  return v11;
}

  return v28;
}

uint64_t sub_100011D44(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  size_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kMIUninstallParallelPlaceholderKey]);
  if (v11)
  {
    BOOL v12 = 0;
  }

  else
  {
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"UninstallPlaceholdersOnly"]);
    BOOL v12 = v13 == 0LL;
  }

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleID]);
  __int128 v15 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", geteuid());
  uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
  id v41 = (void *)v16;
  int v42 = v10;
  if (v12)
  {
    uint64_t v17 = v16;
    id v18 = v9;
    id v19 = objc_alloc_init(&OBJC_CLASS___LSOperationRequestContext);
    [v19 setTargetUserID:v17];
    id v44 = 0LL;
    LOBYTE(v17) = [v10 sendNotificationOfType:2 forApplicationWithBundleIdentifier:v14 requestContext:v19 error:&v44];
    id v20 = v44;
    if ((v17 & 1) == 0)
    {
      uint64_t v21 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10007A8CC();
      }
    }

    id v9 = v18;
  }

  else
  {
    id v20 = 0LL;
  }

  id v23 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v47 = "IXUninstallIdentityWithOptions";
    __int16 v48 = 2112;
    id v49 = v9;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s: Uninstallation reason: %@", buf, 0x16u);
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v8));
  id v26 = v9;
  [v25 setObject:v9 forKeyedSubscript:@"UninstallReasonString"];
  id v27 = [v25 copy];

  if (!+[ICLFeatureFlags appReferencesEnabled](&OBJC_CLASS___ICLFeatureFlags, "appReferencesEnabled"))
  {
    uint64_t v45 = v14;
    id v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v45, 1LL));
    uint64_t v38 = MobileInstallationUninstallForInstallCoordinationWithError(v37, v27, 0LL, a4, 0LL);
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(v38);

    if (!v39) {
      goto LABEL_15;
    }
LABEL_22:
    __int16 v31 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Uninstall of %@",  v7);
    sub_100012CC0(v31);
    uint64_t v36 = 1LL;
    id v30 = v41;
    goto LABEL_23;
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue([v7 miAppIdentity]);
  char v29 = MobileInstallationUninstallAppWithIdentity(v28, v27, a4);

  if ((v29 & 1) != 0) {
    goto LABEL_22;
  }
LABEL_15:
  id v30 = v41;
  if (!v12)
  {
    uint64_t v36 = 0LL;
    goto LABEL_25;
  }

  __int16 v31 = (NSString *)objc_alloc_init(&OBJC_CLASS___LSOperationRequestContext);
  -[NSString setTargetUserID:](v31, "setTargetUserID:", v41);
  id v43 = v20;
  unsigned __int8 v32 = [v42 sendNotificationOfType:4 forApplicationWithBundleIdentifier:v14 requestContext:v31 error:&v43];
  id v33 = v43;

  if ((v32 & 1) == 0)
  {
    id v34 = sub_1000047B4((uint64_t)off_1000E8CA0);
    __int16 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_10007A85C();
    }
  }

  uint64_t v36 = 0LL;
  id v20 = v33;
  id v30 = v41;
LABEL_23:

LABEL_25:
  return v36;
}

void sub_10001212C(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v10 = a1;
  id v11 = objc_alloc_init(&OBJC_CLASS___SDRDiagnosticReporter);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 signatureWithDomain:v10 type:v9 subType:v8 subtypeContext:v7 detectedProcess:@"installcoordinationd" triggerThresholdValues:0]);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100012274;
  v16[3] = &unk_1000CD128;
  id v13 = v12;
  id v17 = v13;
  if (([v11 snapshotWithSignature:v13 duration:0 event:0 payload:v16 reply:0.0] & 1) == 0)
  {
    __int128 v14 = sub_1000047B4((uint64_t)off_1000E8CA0);
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10007A93C((uint64_t)v13, v15);
    }
  }
}

void sub_100012274(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kSymptomDiagnosticReplySuccess]);
  unsigned int v5 = [v4 BOOLValue];

  uint64_t v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      id v9 = *(void **)(a1 + 32);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kSymptomDiagnosticReplySessionID]);
      int v11 = 136315650;
      BOOL v12 = "IXReportIncidentUsingAutoBugCapture_block_invoke";
      __int16 v13 = 2112;
      id v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Successfully reported incident for signature %@ (Session identifier: %@)",  (uint8_t *)&v11,  0x20u);
    }
  }

  else if (v8)
  {
    int v11 = 136315394;
    BOOL v12 = "IXReportIncidentUsingAutoBugCapture_block_invoke";
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Request to report incident rejected %@",  (uint8_t *)&v11,  0x16u);
  }
}

LABEL_18:
  return v24;
}

  unsigned __int8 v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100023DB8;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  uint64_t v56 = v9;
  dispatch_sync(v32, block);

  v7[2](v7, 0LL);
LABEL_24:
}

  objc_msgSend(v3, "appendFormat:", @" (%lu)]", a1);
  unsigned int v5 = [v3 copy];

  return v5;
}

id sub_100012978(uint64_t a1)
{
  return [*(id *)(a1 + 32) setComplete:1];
}

void sub_100012CC0(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    BOOL v8 = "IXSyncLSDatabase";
    __int16 v9 = 2112;
    id v10 = v1;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s: %@; re-fetching local LS database",
      (uint8_t *)&v7,
      0x16u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  [v4 acquireDatabase];

  unsigned int v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    BOOL v8 = "IXSyncLSDatabase";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Fetch of local LS database complete",  (uint8_t *)&v7,  0xCu);
  }
}

LSApplicationRecord *sub_100012E00(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v3)
  {
    id v10 = @"Did not receive a LSRecordPromise";
    goto LABEL_19;
  }

  id v40 = 0LL;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 fulfillReturningError:&v40]);
  id v6 = v40;
  int v7 = v6;
  if (!v5)
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    if ([v11 isEqualToString:NSOSStatusErrorDomain])
    {
      id v12 = [v7 code];

      if (v12 == (id)-10814LL)
      {
        __int16 v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          id v43 = "_FulfillLSRecordPromise";
          __int16 v44 = 2112;
          id v45 = v3;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: Could not fulfill record promise %@; the record was likely superseded or the app was uninstalled. Fallin"
            "g back to fetching the current record",
            buf,
            0x16u);
        }

        goto LABEL_15;
      }
    }

    else
    {
    }

    uint64_t v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_10007ACA4();
    }
    goto LABEL_15;
  }

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___LSApplicationRecord);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) == 0)
  {
    __int16 v15 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_10007AD14((uint64_t)v3, (uint64_t)v5, v14);
    }
LABEL_15:

    __int16 v9 = 0LL;
    goto LABEL_16;
  }

  __int16 v9 = v5;
LABEL_16:

  if (v9)
  {
    id v34 = v3;
    id v17 = v4;
    id v18 = 0LL;
LABEL_22:
    id v20 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord applicationExtensionRecords](v9, "applicationExtensionRecords"));
    id v22 = [v21 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v36 != v24) {
            objc_enumerationMutation(v21);
          }
          id v26 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
          id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 extensionPointRecord]);
          if (v27) {
            -[NSMutableArray addObject:](v20, "addObject:", v27);
          }
          -[NSMutableArray addObject:](v20, "addObject:", v26);
        }

        id v23 = [v21 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }

      while (v23);
    }

    -[NSMutableArray addObject:](v20, "addObject:", v9);
    id v28 = -[NSMutableArray copy](v20, "copy");
    +[LSRecord resolveAllPropertiesOfRecords:andDetachOnQueue:]( &OBJC_CLASS___LSRecord,  "resolveAllPropertiesOfRecords:andDetachOnQueue:",  v28,  0LL);

    id v4 = v17;
    id v3 = v34;
    goto LABEL_32;
  }

  id v10 = @"Could not fulfill LSRecordPromise";
LABEL_19:
  sub_100012CC0(v10);
  if (!v4)
  {
    id v18 = 0LL;
    __int16 v9 = 0LL;
    goto LABEL_34;
  }

  id v39 = 0LL;
  __int16 v9 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  v4,  1LL,  &v39);
  id v19 = v39;
  id v18 = v19;
  if (v9)
  {
    id v34 = v3;
    id v17 = v4;
    goto LABEL_22;
  }

  id v30 = (void *)objc_claimAutoreleasedReturnValue([v19 domain]);
  if (![v30 isEqualToString:NSOSStatusErrorDomain])
  {

LABEL_40:
    id v33 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_FAULT)) {
      sub_10007AC34();
    }
    goto LABEL_42;
  }

  id v31 = [v18 code];

  if (v31 != (id)-10814LL) {
    goto LABEL_40;
  }
  unsigned __int8 v32 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v43 = "IXApplicationRecordForRecordPromise";
    __int16 v44 = 2112;
    id v45 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v20,  OS_LOG_TYPE_DEFAULT,  "%s: Application record for %@ was not found and its LSRecordPromise could not be fulfilled; likely the application"
      " was uninstalled. Caller will get a nil LSApplicationRecord",
      buf,
      0x16u);
  }

LABEL_42:
  __int16 v9 = 0LL;
LABEL_32:

LABEL_34:
  return v9;
}

id sub_100013294(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  uint64_t v37 = 0LL;
  __int128 v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  id v40 = sub_100013584;
  id v41 = sub_100013594;
  id v42 = 0LL;
  uint64_t v31 = 0LL;
  unsigned __int8 v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  id v34 = sub_100013584;
  __int128 v35 = sub_100013594;
  id v36 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
  if (a2 == 1)
  {
    char v7 = 0;
LABEL_6:
    uint64_t v8 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
    __int16 v9 = (id *)(v32 + 5);
    id obj = (id)v32[5];
    id v10 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( v8,  "initWithBundleIdentifier:allowPlaceholder:error:",  v6,  1LL,  &obj);
    objc_storeStrong(v9, obj);
    int v11 = (void *)v38[5];
    v38[5] = (uint64_t)v10;

    if (v38[5]) {
      char v12 = 1;
    }
    else {
      char v12 = v7;
    }
    if ((v12 & 1) != 0) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }

  if (a2 != 2)
  {
    if (a2 != 3)
    {
      id v14 = sub_1000047B4((uint64_t)off_1000E8CA0);
      __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = MIStringForInstallationDomain(a2);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        sub_10007ADE4(v17, buf, v15);
      }

      uint64_t v18 = MIStringForInstallationDomain(a2);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      id v21 = sub_10003556C( (uint64_t)"IXApplicationRecordForIdentityInDomain",  139LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Unexpected value for installation domain: %@",  v20,  (uint64_t)v19);
      uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);

      __int16 v13 = (void *)v32[5];
      v32[5] = v22;
      goto LABEL_14;
    }

    char v7 = 1;
    goto LABEL_6;
  }

void sub_10001354C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100013584(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100013594(uint64_t a1)
{
}

void sub_10001359C(void *a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6 || (a2 & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8LL) + 40LL), a3);
  }

  else
  {
    char v7 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
    uint64_t v8 = a1[4];
    uint64_t v9 = *(void *)(a1[5] + 8LL);
    id obj = *(id *)(v9 + 40);
    id v10 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( v7,  "initWithBundleIdentifier:allowPlaceholder:error:",  v8,  1LL,  &obj);
    objc_storeStrong((id *)(v9 + 40), obj);
    uint64_t v11 = *(void *)(a1[6] + 8LL);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

LSRecordPromise *sub_100013648(void *a1, uint64_t a2, void *a3)
{
  id v11 = 0LL;
  id v4 = sub_100013294(a1, a2, &v11);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v11;
  if (v5)
  {
    id v10 = v6;
    char v7 = -[LSRecordPromise initWithRecord:error:]( objc_alloc(&OBJC_CLASS___LSRecordPromise),  "initWithRecord:error:",  v5,  &v10);
    id v8 = v10;

    id v6 = v8;
    if (!a3) {
      goto LABEL_7;
    }
  }

  else
  {
    char v7 = 0LL;
    if (!a3) {
      goto LABEL_7;
    }
  }

  if (!v7) {
    *a3 = v6;
  }
LABEL_7:

  return v7;
}

void sub_100013700(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_100015538(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  uint64_t v2 = (void *)qword_1000E8E88;
  qword_1000E8E88 = (uint64_t)v1;
}

void sub_100015844(uint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
  char v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = sub_100033618(a2);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = (objc_class *)objc_opt_class(*(void *)(a1 + 32));
    id v11 = NSStringFromClass(v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = *(void *)(a1 + 40);
    int v16 = 136315906;
    uint64_t v17 = "-[IXSAppUninstaller _promptViewHealthKitDataWithIdentity:record:]_block_invoke";
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    uint64_t v23 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Received disposition %@ from %@ for identity:%@",  (uint8_t *)&v16,  0x2Au);
  }

  if (a2 == 1)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleID]);
    +[IXSHealthKitDataUninstallAlert viewHealthKitDataForAppWithBundleID:]( &OBJC_CLASS___IXSHealthKitDataUninstallAlert,  "viewHealthKitDataForAppWithBundleID:",  v15);
LABEL_8:

    goto LABEL_9;
  }

  if (!a2)
  {
    uint64_t v14 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315394;
      uint64_t v17 = "-[IXSAppUninstaller _promptViewHealthKitDataWithIdentity:record:]_block_invoke";
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_DEFAULT,  "%s: Prompting for HealthKit related data failed (non-fatal): %@",  (uint8_t *)&v16,  0x16u);
    }

    goto LABEL_8;
  }

LABEL_9:
}

    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue(v5);
    goto LABEL_10;
  }

  id v4 = @"Unknown error.";
  switch(a2)
  {
    case 0uLL:
      break;
    case 1uLL:
      id v4 = @"Could not install at this time.";
      break;
    case 2uLL:
      id v4 = @"Could not install.";
      break;
    case 3uLL:
      id v4 = @"User canceled.";
      break;
    case 4uLL:
      id v4 = @"Incompatible device architecture.";
      break;
    case 5uLL:
      id v4 = @"Device lacks required capabilities.";
      break;
    case 6uLL:
      id v4 = @"Incompatible platform.";
      break;
    case 7uLL:
      id v4 = @"Needs reinstallation from MDM.";
      break;
    case 8uLL:
      id v4 = @"Needs manual reinstallation.";
      break;
    case 9uLL:
      id v4 = @"No longer available in App Store.";
      break;
    case 0xAuLL:
      id v4 = @"Content is not owned by this user.";
      break;
    case 0xBuLL:
      id v4 = @"Insufficient storage.";
      break;
    case 0xCuLL:
      id v4 = @"User data for this app failed to restore from backup.";
      break;
    case 0xDuLL:
      id v4 = @"Forbidden.";
      break;
    case 0xEuLL:
      id v4 = @"Unable to verify integrity.";
      break;
    case 0xFuLL:
      id v4 = @"SINF not for this platform.";
      break;
    case 0x10uLL:
      id v4 = @"Device OS version is too low to run this app.";
      break;
    case 0x11uLL:
      id v4 = @"Code signature version is no longer supported.";
      break;
    case 0x12uLL:
      id v4 = @"Device is not eligible to install this app.";
      break;
    default:
      if (a2 != 54)
      {
        id v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unhandled reason for code: %lu in domain IXUserPresentableErrorDomain",  a2,  v7);
        goto LABEL_9;
      }

      id v4 = @"Reached code meant only for testing.";
      break;
  }

  return v10;
}

id *sub_100015ADC(id *result, int a2)
{
  if (a2) {
    return (id *)[result[4] _promptViewHealthKitDataWithIdentity:result[5] record:result[6]];
  }
  return result;
}

void sub_100015E90(uint64_t a1)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) coordinatorForIdentity:*(void *)(a1 + 40)]);
  if (v3)
  {
    id v4 = sub_10003556C( (uint64_t)"-[IXSAppUninstaller _performUninstallOfAppWithIdentity:clientName:withFlags:record:completion:]_block_invoke",  342LL,  @"IXErrorDomain",  0x18uLL,  0LL,  0LL,  @"Client %@ requested uninstall for %@",  v2,  *(void *)(a1 + 48));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    [v3 cancelForReason:v5 client:15 error:0];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Uninstalling %@ for %@ (flags: 0x%lx)",  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 88)));
  uint64_t v7 = (*(void *)(a1 + 88) >> 4) & 1LL;
  id v58 = @"WaitForStorageDeletion";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
  id v59 = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v59,  &v58,  1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v9));

  if ((*(_BYTE *)(a1 + 88) & 0x40) != 0) {
    [v10 setObject:@"UninstallReasonSystemAppNotAllowed" forKeyedSubscript:@"UninstallReason"];
  }
  id v11 = *(void **)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 40);
  id v49 = 0LL;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 _acquireTerminationAssertionForIdentity:v12 withError:&v49]);
  id v14 = v49;
  if (v13)
  {
    uint64_t v15 = *(void **)(a1 + 40);
    id v48 = v14;
    int v16 = sub_100011D44(v15, v10, v6, (uint64_t)&v48);
    id v17 = v48;

    [v13 invalidate];
    if (v16)
    {
      if ((*(_BYTE *)(a1 + 88) & 2) != 0)
      {
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472LL;
        v44[2] = sub_10001630C;
        v44[3] = &unk_1000CD1C8;
        v44[4] = *(void *)(a1 + 64);
        id v18 = *(id *)(a1 + 40);
        uint64_t v19 = *(void *)(a1 + 88);
        id v45 = v18;
        uint64_t v47 = v19;
        id v46 = *(id *)(a1 + 72);
        sub_10005A8F0(&_dispatch_main_q, v44);
      }

      __int16 v20 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v22 = sub_100033618(3uLL);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        uint64_t v24 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 136315650;
        __int16 v51 = "-[IXSAppUninstaller _performUninstallOfAppWithIdentity:clientName:withFlags:record:completion:]_block_invoke";
        __int16 v52 = 2112;
        __int16 v53 = v23;
        __int16 v54 = 2112;
        uint64_t v55 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s: Uninstall succeeded with disposition:%@ for bundleID:%@",  buf,  0x20u);
      }

      uint64_t v25 = *(void *)(a1 + 80);
      if (!v25) {
        goto LABEL_24;
      }
      id v26 = *(void (**)(void))(v25 + 16);
    }

    else
    {
      if (!v17)
      {
        id v28 = sub_1000047B4((uint64_t)off_1000E8CA0);
        char v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_10007AEE4(a1, v29, v30, v31, v32, v33, v34, v35);
        }

        id v37 = sub_10003556C( (uint64_t)"-[IXSAppUninstaller _performUninstallOfAppWithIdentity:clientName:withFlags:record:completion:]_block_invoke",  389LL,  @"IXErrorDomain",  0xEuLL,  0LL,  0LL,  @"-[LSApplicationWorkspace uninstallApplication:] for %@ returned NO but did not set an error.",  v36,  *(void *)(a1 + 56));
        id v17 = (id)objc_claimAutoreleasedReturnValue(v37);
      }

      __int128 v38 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        id v40 = sub_100033618(0LL);
        id v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        uint64_t v42 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 136315906;
        __int16 v51 = "-[IXSAppUninstaller _performUninstallOfAppWithIdentity:clientName:withFlags:record:completion:]_block_invoke";
        __int16 v52 = 2112;
        __int16 v53 = v41;
        __int16 v54 = 2112;
        uint64_t v55 = v42;
        __int16 v56 = 2112;
        id v57 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "%s: Uninstall failed with disposition:%@ for bundleID:%@ with error:%@",  buf,  0x2Au);
      }

      uint64_t v43 = *(void *)(a1 + 80);
      if (!v43) {
        goto LABEL_24;
      }
      id v26 = *(void (**)(void))(v43 + 16);
    }

    v26();
LABEL_24:
    id v14 = v17;
    goto LABEL_25;
  }

  uint64_t v27 = *(void *)(a1 + 80);
  if (v27) {
    (*(void (**)(uint64_t, void, id))(v27 + 16))(v27, 0LL, v14);
  }
LABEL_25:
}

id sub_10001630C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postUninstallAlertsWithIdentity:*(void *)(a1 + 40) flags:*(void *)(a1 + 56) record:*(void *)(a1 + 48)];
}

void sub_10001652C(uint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 3)
  {
    [*(id *)(a1 + 48) _promptForDeletionWithRecord:*(void *)(a1 + 56) identity:*(void *)(a1 + 40) clientName:*(void *)(a1 + 64) flags:*(void *)(a1 + 80) completion:*(void *)(a1 + 72) removability:*(void *)(a1 + 88)];
  }

  else if (*(void *)(a1 + 72))
  {
    id v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = sub_100033618(a2);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      id v10 = (objc_class *)objc_opt_class(*(void *)(a1 + 32));
      id v11 = NSStringFromClass(v10);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = *(void *)(a1 + 40);
      int v14 = 136315906;
      uint64_t v15 = "-[IXSAppUninstaller _promptForMoveOrDeleteAppRecord:identity:clientName:flags:completion:removability:]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v9;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Received disposition %@ from %@ for identity:%@",  (uint8_t *)&v14,  0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
  }
}

void sub_1000168DC(uint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 3)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 72);
    uint64_t v10 = *(void *)(a1 + 80);
    if (*(_BYTE *)(a1 + 88)) {
      [v6 _promptToOverrideManagedSettingsOfAppWithRecord:v7 identity:v8 clientName:v9 flags:v10 completion:v11];
    }
    else {
      [v6 _promptForRelatedDataAndUninstallAppWithRecord:v7 identity:v8 clientName:v9 flags:v10 completion:v11];
    }
  }

  else if (*(void *)(a1 + 72))
  {
    uint64_t v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = sub_100033618(a2);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      __int16 v16 = (objc_class *)objc_opt_class(*(void *)(a1 + 64));
      id v17 = NSStringFromClass(v16);
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      uint64_t v19 = *(void *)(a1 + 48);
      int v20 = 136315906;
      uint64_t v21 = "-[IXSAppUninstaller _finalDeletionPromptWithRecord:identity:clientName:flags:removability:completion:]_block_invoke";
      __int16 v22 = 2112;
      uint64_t v23 = v15;
      __int16 v24 = 2112;
      uint64_t v25 = v18;
      __int16 v26 = 2112;
      uint64_t v27 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Received disposition %@ from %@ for %@",  (uint8_t *)&v20,  0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
  }
}

void sub_100016AD4(uint64_t a1)
{
  SInt32 error = 0;
  id v2 = sub_10002ACEC();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v18[0] = kCFUserNotificationAlertHeaderKey;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"COULD_NOT_AUTHENTICATE" value:&stru_1000D08C0 table:@"IXUninstallAlert"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v4, *(void *)(a1 + 32)));
  v19[0] = v5;
  v18[1] = kCFUserNotificationAlertMessageKey;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"AUTHENTICATE_TO_DELETE_APP_MESSAGE" value:&stru_1000D08C0 table:@"IXUninstallAlert"]);
  v19[1] = v6;
  v19[2] = &__kCFBooleanTrue;
  v18[2] = SBUserNotificationAllowMenuButtonDismissal;
  v18[3] = SBUserNotificationDismissOnLock;
  v19[3] = &__kCFBooleanTrue;
  uint64_t v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  4LL));

  CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 3uLL, &error, v7);
  uint64_t v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (objc_class *)objc_opt_class(*(void *)(a1 + 40));
    uint64_t v11 = NSStringFromClass(v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[IXSAppUninstaller _displayAuthenticationErrorForApp:]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Showing user alert of type:%@", buf, 0x16u);
  }
}

void sub_100017610(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  id v10 = v5;
  if (a2 == 3 && !v5)
  {
    id v7 = sub_100034B1C();
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v8 identityWasUninstalled:*(void *)(a1 + 32)];

    id v6 = v10;
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v10);
    id v6 = v10;
  }
}

  ;
}

void sub_1000176AC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

LABEL_101:
        id v7 = 1;
        goto LABEL_102;
      }

      id v58 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder infoPlistIconContentPromise](v39, "infoPlistIconContentPromise"));
      id v59 = v58 == 0LL;

      if (v59) {
        goto LABEL_37;
      }
      -[IXSPlaceholder setInfoPlistIconContentPromise:](v199, "setInfoPlistIconContentPromise:", 0LL);
      -[IXSPlaceholder setInfoPlistIconContentPromiseUUID:](v199, "setInfoPlistIconContentPromiseUUID:", 0LL);
      v60 = sub_1000047B4((uint64_t)off_1000E8CA0);
      dispatch_queue_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
        sub_10007B3F4();
      }

      id v63 = sub_10003556C( (uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]",  256LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"%@: Found info plist icon content promise but not icon resources promise",  v62,  (uint64_t)v199);
      v64 = objc_claimAutoreleasedReturnValue(v63);
    }

    id v69 = v64;
    id v57 = (void *)v237[5];
    v237[5] = v69;
    goto LABEL_36;
  }

  id v7 = 0;
  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder awakeningError](self, "awakeningError"));
  }
LABEL_102:
  _Block_object_dispose(&v236, 8);

  return v7;
}

void sub_1000194F4(_Unwind_Exception *a1)
{
}

uint64_t sub_100019590(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000195A0(uint64_t a1)
{
}

void sub_1000195A8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 192LL);
  id v9 = 0LL;
  unsigned int v4 = [v3 awakeFromSerializationWithLookupBlock:v2 error:&v9];
  id v5 = v9;
  id v6 = v9;
  if (v4)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 192), "setDelegate:");
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v5);
    [*(id *)(a1 + 32) setIconPromiseUUID:0];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 192);
    *(void *)(v7 + 192) = 0LL;
  }
}

void sub_100019650(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 200LL);
  id v9 = 0LL;
  unsigned int v4 = [v3 awakeFromSerializationWithLookupBlock:v2 error:&v9];
  id v5 = v9;
  id v6 = v9;
  if (v4)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 200), "setDelegate:");
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v5);
    [*(id *)(a1 + 32) setIconResourcesPromiseUUID:0];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 200);
    *(void *)(v7 + 200) = 0LL;
  }
}

void sub_1000196F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 208LL);
  id v9 = 0LL;
  unsigned int v4 = [v3 awakeFromSerializationWithLookupBlock:v2 error:&v9];
  id v5 = v9;
  id v6 = v9;
  if (v4)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 208), "setDelegate:");
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v5);
    [*(id *)(a1 + 32) setInfoPlistIconContentPromiseUUID:0];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 208);
    *(void *)(v7 + 20_Block_object_dispose(&STACK[0x2A0], 8) = 0LL;
  }
}

void sub_1000197A0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 216LL);
  id v9 = 0LL;
  unsigned int v4 = [v3 awakeFromSerializationWithLookupBlock:v2 error:&v9];
  id v5 = v9;
  id v6 = v9;
  if (v4)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 216), "setDelegate:");
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v5);
    [*(id *)(a1 + 32) setEntitlementsPromiseUUID:0];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 216);
    *(void *)(v7 + 216) = 0LL;
  }
}

void sub_100019848(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 224LL);
  id v9 = 0LL;
  unsigned int v4 = [v3 awakeFromSerializationWithLookupBlock:v2 error:&v9];
  id v5 = v9;
  id v6 = v9;
  if (v4)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "setDelegate:");
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v5);
    [*(id *)(a1 + 32) setInfoPlistLoctablePromiseUUID:0];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 224);
    *(void *)(v7 + 224) = 0LL;
  }
}

void sub_1000198F0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 248LL);
  id v9 = 0LL;
  unsigned int v4 = [v3 awakeFromSerializationWithLookupBlock:v2 error:&v9];
  id v5 = v9;
  id v6 = v9;
  if (v4)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "setDelegate:");
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v5);
    [*(id *)(a1 + 32) setMetadataPromiseUUID:0];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 248);
    *(void *)(v7 + 24_Block_object_dispose(&STACK[0x2A0], 8) = 0LL;
  }
}

void sub_100019998(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 256LL);
  id v9 = 0LL;
  unsigned int v4 = [v3 awakeFromSerializationWithLookupBlock:v2 error:&v9];
  id v5 = v9;
  id v6 = v9;
  if (v4)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 256), "setDelegate:");
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v5);
    [*(id *)(a1 + 32) setSinfPromiseUUID:0];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 256);
    *(void *)(v7 + 256) = 0LL;
  }
}

void sub_100019A40(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 264LL);
  id v9 = 0LL;
  unsigned int v4 = [v3 awakeFromSerializationWithLookupBlock:v2 error:&v9];
  id v5 = v9;
  id v6 = v9;
  if (v4)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 264), "setDelegate:");
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v5);
    [*(id *)(a1 + 32) setLocalizationDictionaryPromiseUUID:0];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 264);
    *(void *)(v7 + 264) = 0LL;
  }
}

void sub_100019AE8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 64);
  id v7 = 0LL;
  unsigned int v4 = [v2 awakeFromSerializationWithLookupBlock:v3 error:&v7];
  id v5 = v7;
  id v6 = v7;
  if (v4)
  {
    [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL), v5);
    [*(id *)(a1 + 48) addObject:*(void *)(a1 + 56)];
  }
}

id sub_100019D68(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 192) decommission];
}

id sub_100019D7C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

id sub_100019F98(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 200) decommission];
}

id sub_100019FAC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

id sub_10001A1C8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) decommission];
}

id sub_10001A1DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

id sub_10001A47C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 248) supersede];
}

id sub_10001A490(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

id sub_10001A6B4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 256) supersede];
}

id sub_10001A6C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

id sub_10001A8EC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 264) supersede];
}

id sub_10001A900(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

id sub_10001AB2C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 216) decommission];
}

id sub_10001AB40(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

id sub_10001AD6C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 224) decommission];
}

id sub_10001AD80(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

void sub_10001B130(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleID]);
  unsigned __int8 v3 = [v2 hasPrefix:*(void *)(a1 + 40)];

  if ((v3 & 1) != 0)
  {
    unsigned int v4 = *(void **)(a1 + 56);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uniqueIdentifier]);
    [v4 addObject:v5];

    [*(id *)(a1 + 32) setStagedPathMayNotExistWhenAwakening:1];
    [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 48)];
  }

  else
  {
    id v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = "-[IXSPlaceholder setAppExtensionPlaceholders:]_block_invoke";
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      __int16 v22 = 2112;
      uint64_t v23 = 0LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s: Attempted to set placeholder %@ which does not have the required bundle identifier prefix of %@ for parent %@ : %@",  buf,  0x34u);
    }

    id v9 = sub_10003556C( (uint64_t)"-[IXSPlaceholder setAppExtensionPlaceholders:]_block_invoke",  672LL,  @"IXErrorDomain",  8uLL,  0LL,  0LL,  @"Attempted to set placeholder %@ which does not have the required bundle identifier prefix of %@ for parent %@",  v8,  *(void *)(a1 + 32));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    [*(id *)(a1 + 32) cancelForReason:v10 client:15 error:0];
  }

id sub_10001B304(uint64_t a1)
{
  return [*(id *)(a1 + 32) decommission];
}

void sub_10001B818( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10001B850(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) data]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  unsigned int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10001BACC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001BAF4(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sinfPromise]);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v5 data]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  unsigned int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10001BD20( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001BD48(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localizationDictionaryPromise]);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v5 dictionary]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  unsigned int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

LABEL_26:
  return v27;
}

void sub_10001C2B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,char a51)
{
}

void sub_10001C2E0(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isComplete]
    && (uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]), v2, !v2))
  {
    char v5 = 1;
  }

  else
  {
    uint64_t v3 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10007B78C(a1);
    }

    char v5 = 0;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v5;
}

void sub_10001C370(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isComplete]
    && (uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]), v2, !v2))
  {
    char v5 = 1;
  }

  else
  {
    uint64_t v3 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10007B818(a1);
    }

    char v5 = 0;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v5;
}

void sub_10001C400(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) entitlements]);
  unsigned __int8 v4 = [v3 isComplete];

  if ((v4 & 1) != 0)
  {
    char v5 = 1;
  }

  else
  {
    id v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10007B8A4(v2);
    }

    char v5 = 0;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v5;
}

void sub_10001C498(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) infoPlistLoctable]);
  unsigned __int8 v4 = [v3 isComplete];

  if ((v4 & 1) != 0)
  {
    char v5 = 1;
  }

  else
  {
    id v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10007B930(v2);
    }

    char v5 = 0;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v5;
}

void sub_10001C530(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isComplete])
  {
    char v2 = 1;
  }

  else
  {
    uint64_t v3 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10007B9BC();
    }

    char v2 = 0;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v2;
}

id sub_10001C6B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) promiseDidComplete:*(void *)(a1 + 40)];
}

void sub_10001CB18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, char a43)
{
}

double sub_10001CB58(uint64_t a1)
{
  double result = v2 * 0.300000012;
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

void sub_10001CB94(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) entitlements]);
  [v3 percentComplete];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v2 * 0.200000003;
}

double sub_10001CBE8(uint64_t a1)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v2
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  double result = *(double *)(v3 + 24) + 1.0;
  *(double *)(v3 + 24) = result;
  return result;
}

void sub_10001CD24(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);

  if (!v2) {
    [*(id *)(a1 + 32) cancelForReason:*(void *)(a1 + 40) client:*(void *)(a1 + 48) error:0];
  }
}

LABEL_23:
  return v24;
}

          v10[2](v10, v22);

          _Block_object_dispose(&v54, 8);
          goto LABEL_24;
        }

        uint64_t v39 = sub_1000047B4((uint64_t)off_1000E8CA0);
        uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          sub_10007C0C8();
        }
        uint64_t v36 = @"Metadata promise %@ did not contain a decodeable MIStoreMetadata instance.";
        id v37 = 1679LL;
        __int128 v38 = 53LL;
      }

      else
      {
        uint64_t v34 = sub_1000047B4((uint64_t)off_1000E8CA0);
        uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          sub_10007C058();
        }
        uint64_t v36 = @"Client attempted to set metadata promise that was not complete: %@";
        id v37 = 1673LL;
        __int128 v38 = 3LL;
      }

      id v41 = sub_10003556C( (uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setMetadataPromiseUUID:fromConnection:completion:]",  v37,  @"IXErrorDomain",  v38,  0LL,  0LL,  v36,  v40,  (uint64_t)v16);
      __int16 v22 = (id)objc_claimAutoreleasedReturnValue(v41);
    }

    else
    {
      uint64_t v30 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_10007BFE8();
      }

      uint64_t v33 = sub_10003556C( (uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setMetadataPromiseUUID:fromConnection:completion:]",  1662LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"Could not find metadata promise with UUID %@",  v32,  (uint64_t)v8);
      __int16 v22 = (id)objc_claimAutoreleasedReturnValue(v33);
      __int16 v16 = 0LL;
    }

    uint64_t v19 = 0LL;
    uint64_t v21 = 0LL;
    goto LABEL_23;
  }

  char v29 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = sub_100021768;
  v58[3] = &unk_1000CCE58;
  v58[4] = self;
  dispatch_sync(v29, v58);

  v10[2](v10, 0LL);
LABEL_24:
}

  if (a5 && !v23) {
    *a5 = v17;
  }

  return v23;
}

  id v37 = 0LL;
  __int128 v38 = 0LL;
LABEL_24:
  uint64_t v39 = 0LL;
LABEL_25:
  id v40 = 0LL;
LABEL_26:
  id v41 = 0LL;
LABEL_27:
  uint64_t v42 = v41;

  return v42;
}

  -[IXSCoordinatedAppInstall setTermAssertion:](self, "setTermAssertion:", 0LL);
  char v29 = -[IXSCoordinatedAppInstall _onQueue_assertionRetrySeconds](self, "_onQueue_assertionRetrySeconds");
  if (v29 == -1)
  {
    uint64_t v31 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_100080258();
    }

    uint64_t v34 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall _onQueue_handleAssertionAcquisitionFailureForPlaceholder:withError:]",  1679LL,  @"IXErrorDomain",  0x13uLL,  v6,  0LL,  @"Cancelling %@ because we failed to acquire a termination assertion",  v33,  (uint64_t)self);
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    -[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:]( self,  "_onQueue_internal_cancelForReason:client:",  v35,  15LL);
  }

  else
  {
    uint64_t v30 = v29;
    -[IXSCoordinatedAppInstall setAssertionRetryCount:]( self,  "setAssertionRetryCount:",  (char *)-[IXSCoordinatedAppInstall assertionRetryCount](self, "assertionRetryCount") + 1);
    if (v4) {
      -[IXSCoordinatedAppInstall setPlaceholderInstallState:](self, "setPlaceholderInstallState:", 2LL);
    }
    else {
      -[IXSCoordinatedAppInstall setAppInstallState:](self, "setAppInstallState:", 2LL);
    }
    -[IXSCoordinatedAppInstall _onQueue_saveState](self, "_onQueue_saveState");
    uint64_t v36 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v60 = "-[IXSCoordinatedAppInstall _onQueue_handleAssertionAcquisitionFailureForPlaceholder:withError:]";
      dispatch_queue_t v61 = 2112;
      v62 = self;
      id v63 = 2048;
      *(void *)v64 = v30;
      *(_WORD *)&v64[8] = 2112;
      *(void *)&v64[10] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to get assertion for %@; will retry in %lld seconds (%@)",
        buf,
        0x2Au);
    }

    __int128 v38 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
    uint64_t v39 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v38);

    id v40 = dispatch_time(0LL, 1000000000 * v30);
    dispatch_source_set_timer(v39, v40, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000421E8;
    handler[3] = &unk_1000CE230;
    __int16 v56 = v39;
    id v57 = self;
    id v58 = v4;
    id v41 = v39;
    dispatch_source_set_event_handler(v41, handler);
    if (v4) {
      uint64_t v42 = @"-for-placeholder";
    }
    else {
      uint64_t v42 = &stru_1000D08C0;
    }
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
    __int16 v44 = (void *)objc_claimAutoreleasedReturnValue([v43 uniqueIdentifier]);
    id v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.InstallCoordination.retry-acquire-assertion%@.%@",  v42,  v44));

    id v46 = v45;
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472LL;
    v53[2] = nullsub_11;
    v53[3] = &unk_1000CCE58;
    __int16 v54 = (id)os_transaction_create([v46 UTF8String]);
    uint64_t v47 = v54;
    dispatch_source_set_cancel_handler(v41, v53);
    -[IXSCoordinatedAppInstall setAssertionRetryTimer:](self, "setAssertionRetryTimer:", v41);
    dispatch_resume(v41);
  }

          __int16 v24 = 0LL;
LABEL_24:
          v10[2](v10, v22);

          _Block_object_dispose(&v69, 8);
          goto LABEL_25;
        }

        uint64_t v36 = sub_1000047B4((uint64_t)off_1000E8CA0);
        id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          sub_10008180C();
        }

        uint64_t v39 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setInstallOptionsPromiseUUID:forConnection:completion:]",  6505LL,  @"IXErrorDomain",  1uLL,  v20,  0LL,  @"Failed to decode MIInstallOptions from promise %@",  v38,  (uint64_t)v16);
        __int16 v22 = (id)objc_claimAutoreleasedReturnValue(v39);
      }

      else
      {
        uint64_t v32 = sub_1000047B4((uint64_t)off_1000E8CA0);
        uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_10008179C();
        }

        uint64_t v35 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setInstallOptionsPromiseUUID:forConnection:completion:]",  6499LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"Client attempted to set install options promise that was not complete: %@",  v34,  (uint64_t)v16);
        __int16 v22 = (id)objc_claimAutoreleasedReturnValue(v35);
      }
    }

    else
    {
      id v28 = sub_1000047B4((uint64_t)off_1000E8CA0);
      char v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10008172C();
      }

      uint64_t v31 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setInstallOptionsPromiseUUID:forConnection:completion:]",  6488LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"Failed to locate install options promise with UUID %@",  v30,  (uint64_t)v8);
      __int16 v22 = (id)objc_claimAutoreleasedReturnValue(v31);
      __int16 v16 = 0LL;
    }

    __int16 v18 = 0LL;
    goto LABEL_23;
  }

  uint64_t v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472LL;
  v73[2] = sub_100054584;
  v73[3] = &unk_1000CCE58;
  v73[4] = self;
  dispatch_sync(v27, v73);

  v10[2](v10, 0LL);
LABEL_25:
}

void sub_10001D410(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (v3)
  {
    id v5 = v3;
    unsigned __int8 v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 accessQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000242A4;
    block[3] = &unk_1000CCBD8;
    uint64_t v8 = a2;
    id v7 = v5;
    dispatch_sync(v4, block);

    id v3 = v5;
  }
}

void sub_10001D5AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001D5C4(uint64_t a1)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) subPromiseUUIDs]);
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uniqueIdentifier]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v6 setByAddingObject:v2]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id sub_10001D9E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) decommission];
}

void sub_10001EEB4(_Unwind_Exception *a1)
{
}

void sub_10001EF24(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dictionary]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10001EF5C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);

  if (!v2)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stagedPath]);
    uint64_t v4 = *(void **)(a1 + 40);
    id v47 = 0LL;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 urlsForItemsInDirectoryAtURL:v3 ignoringSymlinks:1 error:&v47]);
    id v6 = v47;
    id v7 = v47;
    if (v5)
    {
      uint64_t v39 = v3;
      uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8LL);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = 0LL;

      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v38 = v5;
      id obj = v5;
      id v10 = [obj countByEnumeratingWithState:&v43 objects:v56 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v41 = *(void *)v44;
        while (2)
        {
          uint64_t v12 = 0LL;
          uint64_t v13 = v7;
          do
          {
            if (*(void *)v44 != v41) {
              objc_enumerationMutation(obj);
            }
            int v14 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)v12);
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent", v38));
            __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) URLByAppendingPathComponent:v15 isDirectory:0]);
            uint64_t v17 = *(void **)(a1 + 40);
            id v42 = v13;
            unsigned int v18 = [v17 moveItemAtURL:v14 toURL:v16 error:&v42];
            id v19 = v42;
            id v7 = v42;

            __int16 v20 = sub_1000047B4((uint64_t)off_1000E8CA0);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            __int16 v22 = v21;
            if (!v18)
            {
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
                id v37 = (void *)objc_claimAutoreleasedReturnValue([v16 path]);
                *(_DWORD *)buf = 136315906;
                id v49 = "-[IXSPlaceholder _materialize]_block_invoke";
                __int16 v50 = 2112;
                __int16 v51 = v36;
                __int16 v52 = 2112;
                __int16 v53 = v37;
                __int16 v54 = 2112;
                id v55 = v7;
                _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s: Failed to move icon asset from %@ to %@ : %@",  buf,  0x2Au);
              }

              objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), v19);
              goto LABEL_17;
            }

            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v23 = *(void **)(a1 + 56);
              *(_DWORD *)buf = 136315650;
              id v49 = "-[IXSPlaceholder _materialize]_block_invoke";
              __int16 v50 = 2112;
              __int16 v51 = v23;
              __int16 v52 = 2112;
              __int16 v53 = v15;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Using icon resource %@",  buf,  0x20u);
            }

            uint64_t v12 = (char *)v12 + 1;
            uint64_t v13 = v7;
          }

          while (v11 != v12);
          id v11 = [obj countByEnumeratingWithState:&v43 objects:v56 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

LABEL_17:
      id v5 = v38;
      uint64_t v3 = v39;
    }

    else
    {
      __int16 v24 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_10007BDD4();
      }

      __int16 v26 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
        unsigned int v29 = [*(id *)(a1 + 40) itemExistsAtURL:v3];
        *(_DWORD *)buf = 136315650;
        id v49 = "-[IXSPlaceholder _materialize]_block_invoke";
        if (v29) {
          int v30 = 89;
        }
        else {
          int v30 = 78;
        }
        __int16 v50 = 2112;
        __int16 v51 = v28;
        __int16 v52 = 1024;
        LODWORD(v53) = v30;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s: %@ exists: %c", buf, 0x1Cu);
      }

      uint64_t v31 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
        unsigned int v34 = [*(id *)(a1 + 40) itemExistsAtURL:v3];
        *(_DWORD *)buf = 136315650;
        id v49 = "-[IXSPlaceholder _materialize]_block_invoke";
        if (v34) {
          int v35 = 89;
        }
        else {
          int v35 = 78;
        }
        __int16 v50 = 2112;
        __int16 v51 = v33;
        __int16 v52 = 1024;
        LODWORD(v53) = v35;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s: %@ exists: %c", buf, 0x1Cu);
      }

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), v6);
    }
  }

          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain", v21));
          if ([v17 isEqualToString:NSCocoaErrorDomain])
          {
            unsigned int v18 = [v7 code];

            if (v18 == (id)260) {
              goto LABEL_24;
            }
          }

          else
          {
          }

          id v19 = sub_1000047B4((uint64_t)off_1000E8CA0);
          uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_10007E1C8(v3, (uint64_t)v7, v15);
          }
          goto LABEL_23;
        }
      }

      goto LABEL_17;
    }
  }

  else
  {
    __int16 v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_FAULT)) {
      sub_10007E0B4((os_log_t)v7);
    }
    id v5 = 0LL;
  }

  *a4 = 0;
}

void sub_10001F418(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);

  if (!v2)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stagedPath]);
    uint64_t v5 = *(void *)(a1 + 48);
    id v29 = 0LL;
    unsigned int v6 = [v3 moveItemAtURL:v4 toURL:v5 error:&v29];
    id v7 = v29;

    uint64_t v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 136315394;
        uint64_t v31 = "-[IXSPlaceholder _materialize]_block_invoke";
        __int16 v32 = 2112;
        uint64_t v33 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Using single PNG icon promise",  buf,  0x16u);
      }
    }

    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stagedPath]);
        uint64_t v28 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 136315906;
        uint64_t v31 = "-[IXSPlaceholder _materialize]_block_invoke";
        __int16 v32 = 2112;
        uint64_t v33 = v27;
        __int16 v34 = 2112;
        uint64_t v35 = v28;
        __int16 v36 = 2112;
        id v37 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s: Failed to move icon from %@ to %@ : %@",  buf,  0x2Au);
      }

      uint64_t v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stagedPath]);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
        __int16 v16 = *(void **)(a1 + 40);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stagedPath]);
        unsigned int v18 = [v16 itemExistsAtURL:v17];
        *(_DWORD *)buf = 136315650;
        if (v18) {
          int v19 = 89;
        }
        else {
          int v19 = 78;
        }
        uint64_t v31 = "-[IXSPlaceholder _materialize]_block_invoke";
        __int16 v32 = 2112;
        uint64_t v33 = v15;
        __int16 v34 = 1024;
        LODWORD(v35) = v19;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: %@ exists: %c", buf, 0x1Cu);
      }

      __int16 v20 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) path]);
        unsigned int v23 = [*(id *)(a1 + 40) itemExistsAtURL:*(void *)(a1 + 48)];
        *(_DWORD *)buf = 136315650;
        if (v23) {
          int v24 = 89;
        }
        else {
          int v24 = 78;
        }
        uint64_t v31 = "-[IXSPlaceholder _materialize]_block_invoke";
        __int16 v32 = 2112;
        uint64_t v33 = v22;
        __int16 v34 = 1024;
        LODWORD(v35) = v24;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s: %@ exists: %c", buf, 0x1Cu);
      }

      uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 8LL);
      id v26 = v7;
      id v10 = *(os_log_s **)(v25 + 40);
      *(void *)(v25 + 40) = v26;
    }
  }

void sub_10001F748(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v38 = 0LL;
  unsigned int v3 = [v2 _validateClientEntitlements:&v38];
  id v4 = v38;
  uint64_t v5 = v4;
  if (!v3)
  {
    uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v17 = v4;
    id v11 = 0LL;
LABEL_19:
    int v14 = *(os_log_s **)(v16 + 40);
    *(void *)(v16 + 40) = v17;
    goto LABEL_20;
  }

  unsigned int v6 = *(void **)(a1 + 40);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) entitlements]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stagedPath]);
  uint64_t v9 = *(void *)(a1 + 48);
  id v37 = 0LL;
  unsigned int v10 = [v6 moveItemAtURL:v8 toURL:v9 error:&v37];
  id v11 = v37;

  uint64_t v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  int v14 = v13;
  if (!v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) entitlements]);
      __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v33 stagedPath]);
      uint64_t v35 = *(void *)(a1 + 48);
      uint64_t v36 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 136315906;
      id v40 = "-[IXSPlaceholder _materialize]_block_invoke";
      __int16 v41 = 2112;
      id v42 = v34;
      __int16 v43 = 2112;
      uint64_t v44 = v35;
      __int16 v45 = 2112;
      uint64_t v46 = v36;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s: Failed to move entitlements from %@ to %@ : %@",  buf,  0x2Au);
    }

    unsigned int v18 = sub_1000047B4((uint64_t)off_1000E8CA0);
    int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) entitlements]);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 stagedPath]);
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 path]);
      unsigned int v23 = *(void **)(a1 + 40);
      int v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) entitlements]);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 stagedPath]);
      unsigned int v26 = [v23 itemExistsAtURL:v25];
      *(_DWORD *)buf = 136315650;
      if (v26) {
        int v27 = 89;
      }
      else {
        int v27 = 78;
      }
      id v40 = "-[IXSPlaceholder _materialize]_block_invoke";
      __int16 v41 = 2112;
      id v42 = v22;
      __int16 v43 = 1024;
      LODWORD(v44) = v27;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s: %@ exists: %c", buf, 0x1Cu);
    }

    uint64_t v28 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) path]);
      unsigned int v31 = [*(id *)(a1 + 40) itemExistsAtURL:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 136315650;
      if (v31) {
        int v32 = 89;
      }
      else {
        int v32 = 78;
      }
      id v40 = "-[IXSPlaceholder _materialize]_block_invoke";
      __int16 v41 = 2112;
      id v42 = v30;
      __int16 v43 = 1024;
      LODWORD(v44) = v32;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s: %@ exists: %c", buf, 0x1Cu);
    }

    uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v17 = v11;
    id v11 = v17;
    goto LABEL_19;
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v40 = "-[IXSPlaceholder _materialize]_block_invoke";
    __int16 v41 = 2112;
    id v42 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: %@: Added entitlements", buf, 0x16u);
  }

LABEL_20:
}

  return v28;
}

      if (!v14)
      {
        __int16 v22 = v15;
        int v14 = 0;
        *a6 = v22;
        goto LABEL_23;
      }

void sub_10001FAF4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) stagedPath]);
  uint64_t v4 = *(void *)(a1 + 48);
  id v28 = 0LL;
  unsigned int v5 = [v2 moveItemAtURL:v3 toURL:v4 error:&v28];
  id v6 = v28;

  id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 136315394;
      int v30 = "-[IXSPlaceholder _materialize]_block_invoke";
      __int16 v31 = 2112;
      int v32 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %@: Added InfoPlist.loctable", buf, 0x16u);
    }
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) stagedPath]);
      uint64_t v27 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 136315906;
      int v30 = "-[IXSPlaceholder _materialize]_block_invoke";
      __int16 v31 = 2112;
      int v32 = v26;
      __int16 v33 = 2112;
      uint64_t v34 = v27;
      __int16 v35 = 2112;
      id v36 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s: Failed to move loctable from %@ to %@ : %@",  buf,  0x2Au);
    }

    id v11 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) stagedPath]);
      int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 path]);
      uint64_t v15 = *(void **)(a1 + 32);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) stagedPath]);
      unsigned int v17 = [v15 itemExistsAtURL:v16];
      *(_DWORD *)buf = 136315650;
      if (v17) {
        int v18 = 89;
      }
      else {
        int v18 = 78;
      }
      int v30 = "-[IXSPlaceholder _materialize]_block_invoke";
      __int16 v31 = 2112;
      int v32 = v14;
      __int16 v33 = 1024;
      LODWORD(v34) = v18;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: %@ exists: %c", buf, 0x1Cu);
    }

    int v19 = sub_1000047B4((uint64_t)off_1000E8CA0);
    __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) path]);
      unsigned int v22 = [*(id *)(a1 + 32) itemExistsAtURL:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 136315650;
      if (v22) {
        int v23 = 89;
      }
      else {
        int v23 = 78;
      }
      int v30 = "-[IXSPlaceholder _materialize]_block_invoke";
      __int16 v31 = 2112;
      int v32 = v21;
      __int16 v33 = 1024;
      LODWORD(v34) = v23;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: %@ exists: %c", buf, 0x1Cu);
    }

    uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v25 = v6;
    uint64_t v9 = *(os_log_s **)(v24 + 40);
    *(void *)(v24 + 40) = v25;
  }
}

void sub_10001FE10(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a2 stringByAppendingString:@".lproj"]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) URLByAppendingPathComponent:v8 isDirectory:1]);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:@"InfoPlist.strings" isDirectory:0]);
  id v11 = *(void **)(a1 + 40);
  id v32 = 0LL;
  unsigned __int8 v12 = [v11 createDirectoryAtURL:v9 withIntermediateDirectories:0 mode:493 class:4 error:&v32];
  id v13 = v32;
  if ((v12 & 1) == 0)
  {
    uint64_t v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10007BED0();
    }

    int v18 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
    id v20 = sub_10003556C( (uint64_t)"-[IXSPlaceholder _materialize]_block_invoke",  1454LL,  @"IXErrorDomain",  0x14uLL,  v13,  0LL,  @"Failed to create lproj directory at %@",  v19,  (uint64_t)v18);
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);

    uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8LL);
    int v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;
    goto LABEL_9;
  }

  if (!*(_BYTE *)(a1 + 56) && [v7 count])
  {
    id v31 = v13;
    unsigned __int8 v14 = objc_msgSend(v7, "IX_writeToURL:format:options:error:", v10, 200, 0x10000000, &v31);
    id v15 = v31;

    if ((v14 & 1) != 0)
    {
      id v13 = v15;
      goto LABEL_10;
    }

    uint64_t v24 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10007BE40();
    }

    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
    id v28 = sub_10003556C( (uint64_t)"-[IXSPlaceholder _materialize]_block_invoke",  1469LL,  @"IXErrorDomain",  0x14uLL,  v15,  0LL,  @"Failed to write %@",  v27,  (uint64_t)v26);
    uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);

    uint64_t v30 = *(void *)(*(void *)(a1 + 48) + 8LL);
    int v23 = *(void **)(v30 + 40);
    *(void *)(v30 + 40) = v29;
    id v13 = v15;
LABEL_9:

    *a4 = 1;
  }

void sub_100020098(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) seed]);
  id v3 = [v2 placeholderType];

  if (v3 == (id)2)
  {
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL);
    if (!v4)
    {
      uint64_t v17 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) URLByAppendingPathComponent:@"PlugIns" isDirectory:1]);
      uint64_t v18 = *(void *)(*(void *)(a1 + 80) + 8LL);
      uint64_t v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;

      uint64_t v8 = *(void *)(a1 + 80);
      goto LABEL_11;
    }

void sub_1000207B0(uint64_t a1)
{
  if (([*(id *)(a1 + 32) sentDidBegin] & 1) == 0)
  {
    [*(id *)(a1 + 32) setSentDidBegin:1];
    uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
    id v3 = (void *)v2;
    if (v2)
    {
      if ((objc_opt_respondsToSelector(v2, "promiseDidBegin:") & 1) != 0)
      {
        uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegateDeliveryQueue]);
        v7[0] = _NSConcreteStackBlock;
        v7[1] = 3221225472LL;
        v7[2] = sub_100020880;
        v7[3] = &unk_1000CCCB8;
        id v5 = v3;
        uint64_t v6 = *(void *)(a1 + 32);
        id v8 = v5;
        uint64_t v9 = v6;
        sub_10005A8F0(v4, v7);
      }
    }
  }

id sub_100020880(uint64_t a1)
{
  return [*(id *)(a1 + 32) promiseDidBegin:*(void *)(a1 + 40)];
}

id sub_100020910(uint64_t a1)
{
  return [*(id *)(a1 + 32) _materializeIfReady];
}

void sub_10002099C(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  id v3 = (void *)v2;
  if (v2 && (objc_opt_respondsToSelector(v2, "promise:didUpdateProgress:") & 1) != 0)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegateDeliveryQueue]);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100020A54;
    v7[3] = &unk_1000CCCB8;
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 32);
    id v8 = v5;
    uint64_t v9 = v6;
    sub_10005A8F0(v4, v7);
  }
}

id sub_100020A54(uint64_t a1)
{
  return [*(id *)(a1 + 32) promiseDidReset:*(void *)(a1 + 40)];
}

void sub_100020AE4(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  id v3 = (void *)v2;
  if (v2 && (objc_opt_respondsToSelector(v2, "promise:didUpdateProgress:") & 1) != 0)
  {
    [*(id *)(a1 + 32) percentComplete];
    uint64_t v5 = v4;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegateDeliveryQueue]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100020BB4;
    v9[3] = &unk_1000CD358;
    id v7 = v3;
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = v7;
    uint64_t v11 = v8;
    uint64_t v12 = v5;
    sub_10005A8F0(v6, v9);
  }
}

id sub_100020BB4(uint64_t a1)
{
  return [*(id *)(a1 + 32) promise:*(void *)(a1 + 40) didUpdateProgress:*(double *)(a1 + 48)];
}

id sub_100020CA4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) icon]);
  id v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v13 = 136315394;
      id v14 = "-[IXSPlaceholder promise:didCancelForReason:client:]_block_invoke";
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: %@: got icon promise cancelation; ignoring",
        (uint8_t *)&v13,
        0x16u);
    }

    return [*(id *)(a1 + 32) setIcon:0];
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) iconResourcesPromise]);
    uint64_t v5 = *(void **)(a1 + 40);

    if (v4 == v5)
    {
      id v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        int v13 = 136315394;
        id v14 = "-[IXSPlaceholder promise:didCancelForReason:client:]_block_invoke";
        __int16 v15 = 2112;
        uint64_t v16 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: %@: got icon resources promise cancelation; ignoring",
          (uint8_t *)&v13,
          0x16u);
      }

      return [*(id *)(a1 + 32) setIconResourcesPromise:0];
    }

    else
    {
      return [*(id *)(a1 + 32) cancelForReason:*(void *)(a1 + 48) client:*(void *)(a1 + 56) error:0];
    }
  }

void sub_100021740(_Unwind_Exception *a1)
{
}

id sub_100021768(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMetadataPromise:0];
}

id sub_100021774(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

id sub_1000217A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) supersede];
}

id sub_1000217AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMetadataPromise:*(void *)(a1 + 40)];
}

void sub_1000218A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000218C0(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) metadata]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_100021AA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSinfPromise:*(void *)(a1 + 40)];
}

void sub_100021BA0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100021BB8(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sinfData]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100021CA4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attributes]);

  if (v2) {
    uint64_t v3 = (IXPlaceholderAttributes *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attributes]);
  }
  else {
    uint64_t v3 = objc_opt_new(&OBJC_CLASS___IXPlaceholderAttributes);
  }
  uint64_t v4 = v3;
  -[IXPlaceholderAttributes setLaunchProhibited:](v3, "setLaunchProhibited:", *(unsigned __int8 *)(a1 + 40));
  [*(id *)(a1 + 32) setAttributes:v4];
}

void sub_100021DF0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100021E08(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attributes]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 launchProhibited];
}

id sub_100021F20(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAttributes:*(void *)(a1 + 40)];
}

void sub_10002201C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100022034(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attributes]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_100022218(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIcon:*(void *)(a1 + 40)];
}

void sub_1000222F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100022310(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) icon]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v2 != 0LL;
}

void sub_100022440( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100022458(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) icon]);
  if (v2)
  {
    id v4 = v2;
    uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v2 accessQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000224F8;
    block[3] = &unk_1000CCEF8;
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = v4;
    dispatch_sync(v3, block);

    uint64_t v2 = v4;
  }
}

void sub_1000224F8(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientSeed]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_1000227CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIconResourcesPromise:*(void *)(a1 + 40) andInfoPlistIconContentPromise:*(void *)(a1 + 48)];
}

void sub_1000228B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000228CC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) iconResourcesPromise]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v2 != 0LL;
}

void sub_100022A38( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100022A5C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) iconResourcesPromise]);
  id v7 = v2;
  if (v2)
  {
    uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v2 accessQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100022B8C;
    block[3] = &unk_1000CCEF8;
    uint64_t v13 = *(void *)(a1 + 40);
    id v12 = v7;
    dispatch_sync(v3, block);

    uint64_t v2 = v7;
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) infoPlistIconContentPromise]);
    uint64_t v5 = v4;
    if (v4)
    {
      id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 accessQueue]);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_100022BC4;
      v8[3] = &unk_1000CCEF8;
      uint64_t v10 = *(void *)(a1 + 48);
      id v9 = v5;
      dispatch_sync(v6, v8);
    }

    uint64_t v2 = v7;
  }
}

void sub_100022B8C(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientSeed]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100022BC4(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dictionary]);
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_100022DC0(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLocalizationDictionaryPromise:*(void *)(a1 + 40)];
}

void sub_100022EBC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100022ED4(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localizationDictionary]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_1000230B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEntitlements:*(void *)(a1 + 40)];
}

void sub_100023198( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000231B0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) entitlements]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v2 != 0LL;
}

void sub_1000232E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000232F8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) entitlements]);
  if (v2)
  {
    id v4 = v2;
    uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v2 accessQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100023398;
    block[3] = &unk_1000CCEF8;
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = v4;
    dispatch_sync(v3, block);

    uint64_t v2 = v4;
  }
}

void sub_100023398(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientSeed]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_10002357C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInfoPlistLoctable:*(void *)(a1 + 40)];
}

void sub_10002365C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100023674(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) infoPlistLoctable]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v2 != 0LL;
}

void sub_1000237A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000237BC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) infoPlistLoctable]);
  if (v2)
  {
    id v4 = v2;
    uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v2 accessQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002385C;
    block[3] = &unk_1000CCEF8;
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = v4;
    dispatch_sync(v3, block);

    uint64_t v2 = v4;
  }
}

void sub_10002385C(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientSeed]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_100023DB8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAppExtensionPlaceholders:*(void *)(a1 + 40)];
}

void sub_100023E98( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100023EB0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appExtensionPlaceholders]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v2 != 0LL;
}

void sub_100023FE0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100023FF8(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appExtensionPlaceholders]);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appExtensionPlaceholders]);
    id v5 = [v4 count];

    if (v5)
    {
      id v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appExtensionPlaceholders]);
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
            __int16 v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 accessQueue]);
            v17[0] = _NSConcreteStackBlock;
            v17[1] = 3221225472LL;
            v17[2] = sub_1000241A4;
            v17[3] = &unk_1000CCEF8;
            uint64_t v16 = *(void *)(a1 + 40);
            v17[4] = v14;
            v17[5] = v16;
            dispatch_sync(v15, v17);
          }

          id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }

        while (v11);
      }
    }
  }

void sub_1000241A4(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientSeed]);
  [v1 addObject:v2];
}

id sub_100024298(uint64_t a1)
{
  return [*(id *)(a1 + 32) setConfigurationComplete:1];
}

id sub_1000242A4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) totalBytesNeededOnDisk];
  **(void **)(a1 + 40) += result;
  return result;
}

uint64_t sub_1000242D8(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 4) = v3;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = result;
  *(_WORD *)(a3 + 22) = 2112;
  *(void *)(a3 + 24) = a2;
  *(_WORD *)(a3 + 32) = 2112;
  *(void *)(a3 + 34) = 0LL;
  return result;
}

  ;
}

void sub_100024310(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, os_log_s *a4@<X8>)
{
}

void sub_100024320(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10002432C( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

uint64_t sub_100024380(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 4) = v3;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = result;
  *(_WORD *)(a3 + 22) = 2112;
  *(void *)(a3 + 24) = a2;
  return result;
}

  ;
}

void sub_10002444C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue([v1 stagingBaseDir]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@"extract" isDirectory:1]);
  objc_msgSend(v1, "_internal_setStagedPath:", v2);
}

void sub_100024674(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) seed]);
  [v3 setArchiveBytesConsumed:v2];

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) seed]);
  id v5 = [v4 archiveSizeBytes];

  if (v5)
  {
    double v6 = (double)*(unint64_t *)(a1 + 40);
    id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) seed]);
    objc_msgSend( *(id *)(a1 + 32),  "setPercentComplete:",  v6 / (double)(unint64_t)objc_msgSend(v7, "archiveSizeBytes"));
  }

void sub_1000247A0(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  uint64_t v2 = (void *)qword_1000E8E98;
  qword_1000E8E98 = (uint64_t)v1;
}

void sub_100024DC0(id a1, NSNumber *a2, NSSet *a3, BOOL *a4)
{
  id v5 = a2;
  double v6 = a3;
  id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = IXStringForClientID(-[NSNumber unsignedIntegerValue](v5, "unsignedIntegerValue"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v11 = 136315650;
    uint64_t v12 = "-[IXSAppInstallObserverManager init]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: Client ID %@ has interested services: %@",  (uint8_t *)&v11,  0x20u);
  }
}

void sub_100024EC0(id a1, NSString *a2, NSNumber *a3, BOOL *a4)
{
  id v5 = a2;
  double v6 = a3;
  id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = sub_100024FC0(-[NSNumber unsignedIntegerValue](v6, "unsignedIntegerValue"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v11 = 136315650;
    uint64_t v12 = "-[IXSAppInstallObserverManager init]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: Service name %@ implements selectors %@",  (uint8_t *)&v11,  0x20u);
  }
}

id sub_100024FC0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"["));
  id v3 = v2;
  if ((a1 & 1) != 0)
  {
    else {
      id v7 = @" %s";
    }
    objc_msgSend(v3, "appendFormat:", v7, "Prioritize");
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }

  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }

  else {
    uint64_t v8 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v8, "Resume");
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_31;
  }

LABEL_31:
  else {
    id v10 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v10, "PromiseBegin");
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }

            unsigned int v26 = 0LL;
            if (v52) {
              *__int16 v52 = 0LL;
            }
            goto LABEL_33;
          }

          unsigned int v48 = sub_1000047B4((uint64_t)off_1000E8CA0);
          id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            sub_10007DD78();
          }
        }

        else
        {
          id v47 = sub_1000047B4((uint64_t)off_1000E8CA0);
          id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            sub_10007DCFC();
          }
        }

  if (!v12) {
    goto LABEL_32;
  }
LABEL_33:
  -[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:]( self,  "_onQueue_internal_cancelForReason:client:",  v12,  v13);
}

LABEL_39:
  else {
    uint64_t v12 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v12, "Complete");
  if ((a1 & 0x40) == 0)
  {
LABEL_8:
    if ((a1 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_47;
  }

    if (v26)
    {
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472LL;
      v61[2] = sub_1000476C0;
      v61[3] = &unk_1000CCCB8;
      id v62 = v11;
      id v63 = v12;
      sub_10005A8F0(v6, v61);
    }

    id v32 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall userDataPromise](self, "userDataPromise"));
    __int16 v33 = sub_100047594(v32);

    if (v33)
    {
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472LL;
      v58[2] = sub_1000476D0;
      v58[3] = &unk_1000CCCB8;
      id v59 = v11;
      uint64_t v60 = v12;
      sub_10005A8F0(v6, v58);
    }

    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall preparationPromise](self, "preparationPromise"));
    __int16 v35 = sub_100047594(v34);

    uint64_t v8 = v39;
    if (v35)
    {
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472LL;
      v55[2] = sub_1000476E0;
      v55[3] = &unk_1000CCCB8;
      __int16 v56 = v11;
      id v57 = v12;
      sub_10005A8F0(v6, v55);
    }

    id v36 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall deviceSecurityPromise](self, "deviceSecurityPromise"));
    id v37 = sub_100047594(v36);

    if (v37)
    {
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472LL;
      v52[2] = sub_1000476F0;
      v52[3] = &unk_1000CCCB8;
      __int16 v53 = v11;
      uint64_t v54 = v12;
      sub_10005A8F0(v6, v52);
    }

    if (v38)
    {
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472LL;
      v49[2] = sub_100047700;
      v49[3] = &unk_1000CCCB8;
      uint64_t v50 = v11;
      id v51 = v12;
      sub_10005A8F0(v6, v49);
    }

    if ((id)-[IXSCoordinatedAppInstall placeholderInstallState](self, "placeholderInstallState") == (id)4)
    {
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472LL;
      v46[2] = sub_100047710;
      v46[3] = &unk_1000CCCB8;
      id v47 = v11;
      unsigned int v48 = v12;
      sub_10005A8F0(v6, v46);
    }

    if (-[IXSCoordinatedAppInstall isPaused](self, "isPaused"))
    {
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472LL;
      v43[2] = sub_100047720;
      v43[3] = &unk_1000CCCB8;
      id v14 = &v44;
      int v44 = v11;
      __int16 v15 = &v45;
      __int16 v45 = v12;
      uint64_t v16 = v43;
    }

    else
    {
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_10004772C;
      v40[3] = &unk_1000CCCB8;
      id v14 = &v41;
      __int16 v41 = v11;
      __int16 v15 = &v42;
      id v42 = v12;
      uint64_t v16 = v40;
    }
  }

  sub_10005A8F0(v6, v16);
LABEL_6:
}

LABEL_43:
  else {
    __int16 v13 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v13, "Cancel");
  if ((a1 & 0x80) == 0)
  {
LABEL_9:
    if ((a1 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_51;
  }

LABEL_47:
  else {
    id v14 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v14, "PrioritizeBundleID");
  if ((a1 & 0x100) == 0)
  {
LABEL_10:
    if ((a1 & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_55;
  }

LABEL_51:
  else {
    __int16 v15 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v15, "BeginRestoringUserData");
  if ((a1 & 0x800) == 0)
  {
LABEL_11:
    if ((a1 & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_59;
  }

          __int128 v81 = (void *)objc_claimAutoreleasedReturnValue([v116 uniqueIdentifier]);
          -[IXSClientConnection addInterestedCoordinatorUUID:](self, "addInterestedCoordinatorUUID:", v81);

          __int128 v82 = (void *)objc_claimAutoreleasedReturnValue([v116 seed]);
          (*((void (**)(id, void *, void, void))v13 + 2))(v13, v82, *((unsigned __int8 *)v125 + 24), 0LL);

          id v23 = 0LL;
          goto LABEL_52;
        }

        __int16 v69 = sub_1000047B4((uint64_t)off_1000E8CA0);
        __int128 v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          __int16 v94 = IXStringForCoordinatorScope([v116 coordinatorScope]);
          v114 = (id)objc_claimAutoreleasedReturnValue(v94);
          id v95 = IXStringForClientID((unint64_t)[v116 creator]);
          v96 = (id)objc_claimAutoreleasedReturnValue(v95);
          v97 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
          __int16 v98 = sub_100031738(v8);
          v99 = objc_claimAutoreleasedReturnValue(v98);
          *(_DWORD *)buf = 136316674;
          v129 = "-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIn"
                 "tent:scopeRequirement:completion:]";
          v130 = 2112;
          v131 = v15;
          v132 = 2112;
          v133 = v114;
          v134 = 2112;
          v135 = v96;
          v136 = 2112;
          v137 = v97;
          v138 = 2112;
          v113 = (void *)v99;
          v139 = v99;
          v140 = 2112;
          v141 = 0LL;
          _os_log_error_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_ERROR,  "%s: A coordinated app install already exists for %@ with scope %@ (creator %@) but request by %@ had scope r equirement %@ : %@",  buf,  0x48u);
        }

        __int16 v71 = IXStringForCoordinatorScope([v116 coordinatorScope]);
        __int128 v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
        __int16 v73 = IXStringForClientID((unint64_t)[v116 creator]);
        uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
        __int128 v75 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
        id v76 = sub_100031738(v8);
        id v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
        __int128 v79 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMa tchingIntent:scopeRequirement:completion:]",  630LL,  @"IXErrorDomain",  0x2EuLL,  0LL,  0LL,  @"A coordinated app install already exists for %@ with scope %@ (creator %@) but request by %@ had scope requirement %@",  v78,  (uint64_t)v15);
        __int128 v80 = objc_claimAutoreleasedReturnValue(v79);
      }

      id v23 = (id)v80;

      goto LABEL_49;
    }

    (*((void (**)(id, void, void, id))v13 + 2))(v13, 0LL, 0LL, v17);
    uint64_t v24 = 0LL;
  }

  else
  {
    id v25 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unsigned int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
      sub_100082CF4(v27, buf);
    }

    id v28 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](self, "clientName"));
    id v30 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchi ngIntent:scopeRequirement:completion:]",  559LL,  @"IXErrorDomain",  0x2DuLL,  0LL,  0LL,  @"Expected a non-nil identity from client: %@",  v29,  (uint64_t)v28);
    uint64_t v17 = (id)objc_claimAutoreleasedReturnValue(v30);

    (*((void (**)(id, void, void, id))v13 + 2))(v13, 0LL, 0LL, v17);
    uint64_t v24 = 0LL;
  }

LABEL_55:
  else {
    uint64_t v16 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v16, "InstallPlaceholderForRecord");
  if ((a1 & 0x1000) == 0)
  {
LABEL_12:
    if ((a1 & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_63;
  }

                  goto LABEL_56;
                }

                __int128 v19 = v6 + 7;
                if ((v16 & 1) == 0)
                {
LABEL_16:
                  __int128 v20 = 0;
                  __int128 v21 = 0LL;
                  if ((v16 & 8) != 0) {
                    goto LABEL_17;
                  }
                  goto LABEL_24;
                }
              }

              else
              {
                __int128 v19 = v6 + 6;
                if ((v16 & 1) == 0) {
                  goto LABEL_16;
                }
              }

              __int128 v20 = v19[1];
              __int128 v21 = (char *)v19 + *v19;
              v19 += 2;
              if ((v16 & 8) != 0)
              {
LABEL_17:
                id v23 = *v19++;
                id v22 = v23;
                if ((v16 & 0x2000000) != 0) {
                  goto LABEL_18;
                }
                goto LABEL_25;
              }

LABEL_59:
  else {
    uint64_t v17 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v17, "CompleteForRecord");
  if ((a1 & 0x2000) == 0)
  {
LABEL_13:
    if ((a1 & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }

LABEL_63:
  else {
    __int128 v18 = @" %s";
  }
  objc_msgSend(v3, "appendFormat:", v18, "PrioritizeAppWithIdentity");
  if ((a1 & 0x4000) != 0)
  {
LABEL_14:
    else {
      id v4 = @" %s";
    }
    objc_msgSend(v3, "appendFormat:", v4, "ShouldBeginPostProcessing");
  }

        return v4;
      }

      id v57 = 0;
      id v28 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall userDataPromise](self, "userDataPromise"));
      unsigned int v29 = v28;
      if (v28)
      {
        __int128 v81 = 0LL;
        __int128 v82 = &v81;
        id v83 = 0x2020000000LL;
        v84 = 0;
        id v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v28 accessQueue]);
        v75[0] = _NSConcreteStackBlock;
        v75[1] = 3221225472LL;
        v75[2] = sub_1000408C0;
        v75[3] = &unk_1000CCEF8;
        id v77 = &v81;
        __int128 v21 = v29;
        id v76 = v21;
        dispatch_sync(v30, v75);

        LOBYTE(v30) = *((_BYTE *)v82 + 24) == 0;
        _Block_object_dispose(&v81, 8);
        id v4 = 10LL;
      }

      else
      {
        id v4 = 9LL;
      }

      return v4;
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall placeholderPromise](self, "placeholderPromise"));
    uint64_t v17 = v16;
    if (v16)
    {
      __int128 v81 = 0LL;
      __int128 v82 = &v81;
      id v83 = 0x2020000000LL;
      v84 = 0;
      __int128 v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v16 accessQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100040890;
      block[3] = &unk_1000CCEF8;
      __int128 v80 = &v81;
      __int128 v79 = v17;
      dispatch_sync(v18, block);

      if (*((_BYTE *)v82 + 24))
      {
        if (v6 >= 4)
        {
          id v31 = sub_1000047B4((uint64_t)off_1000E8CA0);
          id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            sub_10007FF2C();
          }

          id v4 = 1LL;
        }

        else
        {
          id v4 = qword_1000953B8[v6];
        }
      }

      else
      {
        id v4 = 5LL;
      }

      _Block_object_dispose(&v81, 8);
    }

    else
    {
      id v4 = 4LL;
    }
  }

  return v4;
}

void sub_100025444(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v2 = objc_begin_catch(exception_object);
      id v3 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_10007C984();
      }

      objc_end_catch();
      JUMPOUT(0x100025410LL);
    }

    objc_begin_catch(exception_object);
    objc_exception_rethrow();
    __break(1u);
    JUMPOUT(0x1000254C4LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_1000255AC(uint64_t a1)
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    id v4 = v3;
    char v5 = 0;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "clientToObserverServiceNameMap", (void)v18));
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v8]);

        if (([v10 containsObject:*(void *)(a1 + 48)] & 1) == 0)
        {
          int v11 = (NSMutableSet *)[v10 mutableCopy];
          if (!v11) {
            int v11 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
          }
          -[NSMutableSet addObject:](v11, "addObject:", *(void *)(a1 + 48));
          id v12 = -[NSMutableSet copy](v11, "copy");

          __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) clientToObserverServiceNameMap]);
          [v13 setObject:v12 forKeyedSubscript:v8];

          char v5 = 1;
          id v10 = v12;
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v4);
  }

  else
  {
    char v5 = 0;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) serviceRespondsToMap]);
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:*(void *)(a1 + 48)]);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 56)));
  if (v15 && ([v15 isEqualToNumber:v16] & 1) != 0)
  {
    if ((v5 & 1) == 0) {
      goto LABEL_20;
    }
  }

  else
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "serviceRespondsToMap", (void)v18));
    [v17 setObject:v16 forKeyedSubscript:*(void *)(a1 + 48)];
  }

  objc_msgSend(*(id *)(a1 + 40), "_saveMapping", (void)v18);
LABEL_20:
}

void sub_1000258A0(uint64_t a1)
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = *(id *)(a1 + 32);
  id v2 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v17;
    do
    {
      char v5 = 0LL;
      do
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v5);
        id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) clientToObserverEndpointMap]);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);

        id v9 = (NSMutableSet *)[v8 mutableCopy];
        if (!v9) {
          id v9 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
        }
        -[NSMutableSet addObject:](v9, "addObject:", *(void *)(a1 + 48));
        id v10 = -[NSMutableSet copy](v9, "copy");

        int v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) clientToObserverEndpointMap]);
        [v11 setObject:v10 forKeyedSubscript:v6];

        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 56)));
        __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) listenerRespondsToMap]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [*(id *)(a1 + 48) hash]));
        [v13 setObject:v12 forKeyedSubscript:v14];

        char v5 = (char *)v5 + 1;
      }

      while (v3 != v5);
      id v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v3);
  }
}

void sub_100025B20(uint64_t a1)
{
  id v2 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 136315394;
    id v7 = "-[IXSAppInstallObserverManager registerClientConnection:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Adding client %@", (uint8_t *)&v6, 0x16u);
  }

  char v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) clientConnections]);
  [v5 addObject:*(void *)(a1 + 32)];
}

void sub_100025C98(uint64_t a1)
{
  id v2 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 136315394;
    id v7 = "-[IXSAppInstallObserverManager unregisterClientConnection:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Removing client %@", (uint8_t *)&v6, 0x16u);
  }

  char v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) clientConnections]);
  [v5 removeObject:*(void *)(a1 + 32)];
}

void sub_100025FF0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, id a23)
{
}

void sub_100026030(uint64_t a1)
{
  id v2 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 136315394;
    id v7 = "-[IXSAppInstallObserverManager _onQueue_connectionForServiceName:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s: Connection interrupted to %@",  (uint8_t *)&v6,  0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

void sub_100026108(uint64_t a1)
{
  id v2 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    int v11 = "-[IXSAppInstallObserverManager _onQueue_connectionForServiceName:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Connection invalidated to %@", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained internalQueue]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10002624C;
    v8[3] = &unk_1000CCCB8;
    void v8[4] = v6;
    id v9 = *(id *)(a1 + 32);
    dispatch_async(v7, v8);
  }
}

void sub_10002624C(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serviceToConnectionMap]);
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_100026570(uint64_t a1)
{
  id v2 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 136315394;
    int v6 = "-[IXSAppInstallObserverManager _onQueue_connectionForObserverEndpoint:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s: Connection interrupted to %@",  (uint8_t *)&v5,  0x16u);
  }
}

void sub_100026634(uint64_t a1)
{
  id v2 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10007C9FC(a1, v3);
  }
}

void sub_10002688C(uint64_t a1)
{
  id v2 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  id obj = *(id *)(a1 + 32);
  id v58 = v2;
  id v55 = [obj countByEnumeratingWithState:&v74 objects:v87 count:16];
  if (v55)
  {
    uint64_t v53 = *(void *)v75;
    do
    {
      uint64_t v3 = 0LL;
      do
      {
        if (*(void *)v75 != v53) {
          objc_enumerationMutation(obj);
        }
        uint64_t v57 = v3;
        uint64_t v4 = *(void *)(*((void *)&v74 + 1) + 8 * v3);
        int v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) clientToObserverServiceNameMap]);
        int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

        __int128 v72 = 0u;
        __int128 v73 = 0u;
        __int128 v70 = 0u;
        __int128 v71 = 0u;
        id v7 = v6;
        id v8 = [v7 countByEnumeratingWithState:&v70 objects:v86 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v71;
          do
          {
            for (i = 0LL; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v71 != v10) {
                objc_enumerationMutation(v7);
              }
              __int16 v12 = *(void **)(*((void *)&v70 + 1) + 8LL * (void)i);
              if ((-[NSMutableSet containsObject:](v2, "containsObject:", v12) & 1) == 0)
              {
                uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) serviceRespondsToMap]);
                id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v12]);
                unint64_t v15 = (unint64_t)[v14 unsignedIntegerValue];

                unint64_t v16 = *(void *)(a1 + 56) & v15;
                __int128 v17 = sub_1000047B4((uint64_t)off_1000E8CA0);
                __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
                BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
                if (v16)
                {
                  if (v19)
                  {
                    id v20 = sub_100024FC0(*(void *)(a1 + 56));
                    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
                    *(_DWORD *)buf = 136315650;
                    __int128 v81 = "-[IXSAppInstallObserverManager _messageInterestedServicesForClientIDs:forMethod:callMethodOnPr"
                          "oxy:]_block_invoke";
                    __int16 v82 = 2112;
                    id v83 = v12;
                    __int16 v84 = 2112;
                    v85 = v21;
                    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s: Notifying service %@ for selector %@",  buf,  0x20u);
                  }

                  v69[0] = _NSConcreteStackBlock;
                  v69[1] = 3221225472LL;
                  v69[2] = sub_100026F40;
                  v69[3] = &unk_1000CD518;
                  uint64_t v22 = *(void *)(a1 + 48);
                  uint64_t v23 = *(void *)(a1 + 56);
                  void v69[4] = v12;
                  v69[5] = v23;
                  objc_msgSend( *(id *)(a1 + 40),  "_onQueue_callRemoteObjectProxyForServiceName:errorHandler:callHandler:",  v12,  v69,  v22);
                  id v2 = v58;
                  -[NSMutableSet addObject:](v58, "addObject:", v12);
                }

                else
                {
                  if (v19)
                  {
                    id v24 = sub_100024FC0(*(void *)(a1 + 56));
                    id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
                    *(_DWORD *)buf = 136315650;
                    __int128 v81 = "-[IXSAppInstallObserverManager _messageInterestedServicesForClientIDs:forMethod:callMethodOnPr"
                          "oxy:]_block_invoke";
                    __int16 v82 = 2112;
                    id v83 = v12;
                    __int16 v84 = 2112;
                    v85 = v25;
                    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s: Not notifying service %@ because it doesn't implement selector for %@",  buf,  0x20u);
                  }

                  id v2 = v58;
                }
              }
            }

            id v9 = [v7 countByEnumeratingWithState:&v70 objects:v86 count:16];
          }

          while (v9);
        }

        uint64_t v3 = v57 + 1;
      }

      while ((id)(v57 + 1) != v55);
      id v55 = [obj countByEnumeratingWithState:&v74 objects:v87 count:16];
    }

    while (v55);
  }

  unsigned int v26 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  id v50 = *(id *)(a1 + 32);
  id v54 = [v50 countByEnumeratingWithState:&v65 objects:v79 count:16];
  if (v54)
  {
    id obja = *(id *)v66;
    do
    {
      uint64_t v27 = 0LL;
      do
      {
        if (*(id *)v66 != obja) {
          objc_enumerationMutation(v50);
        }
        uint64_t v56 = v27;
        uint64_t v28 = *(void *)(*((void *)&v65 + 1) + 8 * v27);
        unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) clientToObserverEndpointMap]);
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:v28]);

        __int128 v63 = 0u;
        __int128 v64 = 0u;
        __int128 v61 = 0u;
        __int128 v62 = 0u;
        id v59 = v30;
        id v31 = [v59 countByEnumeratingWithState:&v61 objects:v78 count:16];
        if (v31)
        {
          id v32 = v31;
          uint64_t v33 = *(void *)v62;
          do
          {
            for (j = 0LL; j != v32; j = (char *)j + 1)
            {
              if (*(void *)v62 != v33) {
                objc_enumerationMutation(v59);
              }
              __int16 v35 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)j);
              if ((-[NSMutableSet containsObject:](v26, "containsObject:", v35) & 1) == 0)
              {
                id v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) listenerRespondsToMap]);
                id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v35 hash]));
                id v38 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:v37]);
                unint64_t v39 = (unint64_t)[v38 unsignedIntegerValue];

                unint64_t v40 = *(void *)(a1 + 56) & v39;
                __int16 v41 = sub_1000047B4((uint64_t)off_1000E8CA0);
                id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
                BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
                if (v40)
                {
                  if (v43)
                  {
                    id v44 = sub_100024FC0(*(void *)(a1 + 56));
                    __int16 v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
                    *(_DWORD *)buf = 136315650;
                    __int128 v81 = "-[IXSAppInstallObserverManager _messageInterestedServicesForClientIDs:forMethod:callMethodOnPr"
                          "oxy:]_block_invoke";
                    __int16 v82 = 2112;
                    id v83 = v35;
                    __int16 v84 = 2112;
                    v85 = v45;
                    _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "%s: Notifying endpoint %@ for selector %@",  buf,  0x20u);
                  }

                  v60[0] = _NSConcreteStackBlock;
                  v60[1] = 3221225472LL;
                  v60[2] = sub_100026FAC;
                  v60[3] = &unk_1000CD518;
                  uint64_t v46 = *(void *)(a1 + 48);
                  uint64_t v47 = *(void *)(a1 + 56);
                  v60[4] = v35;
                  v60[5] = v47;
                  objc_msgSend( *(id *)(a1 + 40),  "_onQueue_callRemoteObjectProxyForServiceEndpoint:errorHandler:callHandler:",  v35,  v60,  v46);
                  -[NSMutableSet addObject:](v26, "addObject:", v35);
                }

                else
                {
                  if (v43)
                  {
                    id v48 = sub_100024FC0(*(void *)(a1 + 56));
                    int v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
                    *(_DWORD *)buf = 136315650;
                    __int128 v81 = "-[IXSAppInstallObserverManager _messageInterestedServicesForClientIDs:forMethod:callMethodOnPr"
                          "oxy:]_block_invoke";
                    __int16 v82 = 2112;
                    id v83 = v35;
                    __int16 v84 = 2112;
                    v85 = v49;
                    _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "%s: Not notifying endpoint %@ because it doesn't implement selector for %@",  buf,  0x20u);
                  }
                }
              }
            }

            id v32 = [v59 countByEnumeratingWithState:&v61 objects:v78 count:16];
          }

          while (v32);
        }

        uint64_t v27 = v56 + 1;
      }

      while ((id)(v56 + 1) != v54);
      id v54 = [v50 countByEnumeratingWithState:&v65 objects:v79 count:16];
    }

    while (v54);
  }
}

void sub_100026F40(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10007CA84(a1);
  }
}

void sub_100026FAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10007CB1C(a1);
  }
}

void sub_1000270B0(uint64_t a1)
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "clientConnections", 0));
  id v3 = (char *)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      int v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
        ++v6;
      }

      while (v4 != v6);
      uint64_t v4 = (char *)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

void sub_1000272FC(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue([v2 seed]);
  objc_msgSend(v3, "_client_coordinatorShouldPrioritizeWithSeed:", v4);
}

id sub_10002734C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_client_coordinatorShouldPrioritizeWithUUID:", *(void *)(a1 + 32));
}

void sub_10002743C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue([v2 bundleID]);
  objc_msgSend(v3, "_client_shouldPrioritizeAppWithBundleID:", v4);
}

id sub_10002748C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_client_shouldPrioritizeAppWithIdentity:", *(void *)(a1 + 32));
}

void sub_1000275EC(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue([v2 seed]);
  objc_msgSend(v3, "_client_coordinatorShouldResumeWithSeed:", v4);
}

id sub_10002763C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_client_coordinatorShouldResumeWithUUID:", *(void *)(a1 + 32));
}

void sub_10002779C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue([v2 seed]);
  objc_msgSend(v3, "_client_coordinatorShouldPauseWithSeed:", v4);
}

id sub_1000277EC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_client_coordinatorShouldPauseWithUUID:", *(void *)(a1 + 32));
}

void sub_100027958(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 seed]);
  objc_msgSend(v4, "_client_coordinatorWithSeed:configuredPromiseDidBeginFulfillment:", v5, *(void *)(a1 + 40));
}

id sub_1000279B8(uint64_t a1, void *a2)
{
  return objc_msgSend( a2,  "_client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
}

void sub_100027AF8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue([v2 seed]);
  objc_msgSend(v3, "_client_coordinatorShouldBeginRestoringUserDataWithSeed:", v4);
}

id sub_100027B48(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_client_coordinatorShouldBeginRestoringUserDataWithUUID:", *(void *)(a1 + 32));
}

void sub_100027CEC(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 seed]);
  objc_msgSend(v4, "_client_coordinatorDidInstallPlaceholderWithSeed:forRecordPromise:", v5, *(void *)(a1 + 40));
}

id sub_100027D4C(uint64_t a1, void *a2)
{
  return objc_msgSend( a2,  "_client_coordinatorDidInstallPlaceholderWithUUID:forRecordPromise:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
}

void sub_100027ED4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 seed]);
  objc_msgSend(v4, "_client_coordinatorShouldBeginPostProcessingWithSeed:forRecordPromise:", v5, *(void *)(a1 + 40));
}

id sub_100027F34(uint64_t a1, void *a2)
{
  return objc_msgSend( a2,  "_client_coordinatorShouldBeginPostProcessingWithUUID:forRecordPromise:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
}

void sub_1000280D8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 seed]);
  objc_msgSend(v4, "_client_coordinatorDidCompleteSuccessfullyWithSeed:forRecordPromise:", v5, *(void *)(a1 + 40));
}

id sub_100028138(uint64_t a1, void *a2)
{
  return objc_msgSend( a2,  "_client_coordinatorDidCompleteSuccessfullyWithUUID:forRecordPromise:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
}

void sub_1000282E4(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 seed]);
  objc_msgSend(v4, "_client_coordinatorWithSeed:didCancelWithReason:client:", v5, a1[5], a1[6]);
}

id sub_100028344(void *a1, void *a2)
{
  return objc_msgSend(a2, "_client_coordinatorWithUUID:didCancelWithReason:client:", a1[4], a1[5], a1[6]);
}

id sub_1000283F4(uint64_t a1, void *a2)
{
  return objc_msgSend( a2,  "_client_coordinatorWithUUID:didUpdateProgress:forPhase:overallProgress:",  *(void *)(a1 + 32),  *(void *)(a1 + 48),  *(double *)(a1 + 40),  *(double *)(a1 + 56));
}

id sub_10002848C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_client_promiseDidCompleteSuccessfullyWithUUID:", *(void *)(a1 + 32));
}

id sub_10002854C(void *a1, void *a2)
{
  return objc_msgSend(a2, "_client_promiseWithUUID:didCancelWithReason:client:", a1[4], a1[5], a1[6]);
}

void sub_100028600( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100028634( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_100028E64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100028E88(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100028E98(uint64_t a1)
{
}

void sub_100028EA0(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[5] + 8LL);
  id obj = *(id *)(v3 + 40);
  unsigned __int8 v4 = objc_msgSend(v2, "_onQueue_initWithSeedWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if ((v4 & 1) == 0) {
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
  }
}

id sub_100029064(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_setStagedPath:", *(void *)(a1 + 40));
}

void sub_100029DD0(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) path]);
  id v5 = *(void **)(a1 + 40);
  unsigned __int8 v4 = (id *)(a1 + 40);
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 seed]);
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stagingBaseDir]);
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
  unsigned __int8 v9 = [v3 hasPrefix:v8];

  if ((v9 & 1) != 0)
  {
    [*v4 setStagedPath:*v2];
  }

  else
  {
    __int128 v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10007CE18(v2, v4, v11);
    }

    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([*v2 path]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*v4 seed]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stagingBaseDir]);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
    id v16 = sub_10003556C( (uint64_t)"-[IXSOwnedDataPromise(IXSOwnedDataPromiseIPCMethods) _remote_setStagedPath:]_block_invoke",  376LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Attempt to set the stagedPath to %@ which does not start with the staged item prefix %@",  v15,  (uint64_t)v12);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    [*v4 cancelForReason:v17 client:15 error:0];
  }

void sub_10002A0A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10002A0BC(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stagedPath]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  unsigned __int8 v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_10002A268(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTargetLastPathComponent:*(void *)(a1 + 40)];
}

void sub_10002A364( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10002A37C(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) targetLastPathComponent]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  unsigned __int8 v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

__CFString *IXStringForClientID(unint64_t a1)
{
  if (a1 >= 0x1D) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown IXClientIdentifier: %lu",  a1));
  }
  else {
    return *(&off_1000CD6F0 + a1);
  }
}

id sub_10002ACEC()
{
  if (qword_1000E8EB0 != -1) {
    dispatch_once(&qword_1000E8EB0, &stru_1000CD7D8);
  }
  return (id)qword_1000E8EA8;
}

void sub_10002AD2C(id a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[IXGlobalConfiguration sharedInstance](&OBJC_CLASS___IXGlobalConfiguration, "sharedInstance"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 frameworkURL]);

  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v2));
  unsigned __int8 v4 = (void *)qword_1000E8EA8;
  qword_1000E8EA8 = v3;

  if (!qword_1000E8EA8)
  {
    id v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10007D31C();
    }
  }
}

CFStringRef sub_10002ADD0(uint64_t a1)
{
  else {
    return *(&off_1000CD8F0 + a1 - 1);
  }
}

void IXPresentErrorHighlightingLocalizedAppName( void *a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002AF24;
  block[3] = &unk_1000CD868;
  id v27 = [v13 count];
  uint64_t v28 = a4;
  id v22 = v11;
  id v23 = v15;
  id v25 = v13;
  id v26 = v14;
  id v24 = v12;
  id v16 = v13;
  id v17 = v12;
  id v18 = v14;
  id v19 = v15;
  id v20 = v11;
  dispatch_async(&_dispatch_main_q, block);
}

void sub_10002AF24(uint64_t a1)
{
  id v2 = sub_10002ACEC();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"DismissOnLock"];
  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"SBUserNotificationAllowMenuButtonDismissal"];
  id v5 = sub_10002B478(*(void **)(a1 + 32), *(void *)(a1 + 72), *(void *)(a1 + 80));
  int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v4 setObject:v6 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

  uint64_t v7 = *(void *)(a1 + 80);
  if (v7 == 16) {
    id v8 = sub_10002B550(*(void **)(a1 + 40), *(void **)(a1 + 32), *(void *)(a1 + 72));
  }
  else {
    id v8 = sub_10002B690(*(void **)(a1 + 32), *(void *)(a1 + 72), v7);
  }
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v4 setObject:v9 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

  switch(*(void *)(a1 + 80))
  {
    case 4LL:
    case 5LL:
    case 6LL:
    case 7LL:
    case 8LL:
    case 9LL:
    case 0xDLL:
    case 0xFLL:
    case 0x11LL:
    case 0x12LL:
      if (*(void *)(a1 + 72) != 1LL) {
        goto LABEL_10;
      }
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"BUTTON_TITLE_DELETE" value:&stru_1000D08C0 table:@"IXUserPresentableErrors"]);
      [v4 setObject:v10 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

      [v4 setObject:&off_1000D6D20 forKeyedSubscript:@"SBUserNotificationDefaultButtonPresentationStyle"];
      id v11 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"BUTTON_TITLE_KEEP" value:&stru_1000D08C0 table:@"IXUserPresentableErrors"]);
      [v4 setObject:v11 forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];

      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_10002B8BC;
      v30[3] = &unk_1000CD030;
      id v31 = *(id *)(a1 + 64);
      id v12 = objc_retainBlock(v30);
      id v13 = v31;
      goto LABEL_7;
    case 0xALL:
      if (*(void *)(a1 + 72) != 1LL) {
        goto LABEL_10;
      }
      id v14 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"BUTTON_TITLE_VIEW_IN_APP_STORE" value:&stru_1000D08C0 table:@"IXUserPresentableErrors"]);
      [v4 setObject:v14 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

      id v15 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"BUTTON_TITLE_OK" value:&stru_1000D08C0 table:@"IXUserPresentableErrors"]);
      [v4 setObject:v15 forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];

      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_10002B8D0;
      v26[3] = &unk_1000CD358;
      uint64_t v29 = *(void *)(a1 + 72);
      id v27 = *(id *)(a1 + 48);
      id v28 = *(id *)(a1 + 56);
      id v12 = objc_retainBlock(v26);

      id v13 = v27;
LABEL_7:

      break;
    case 0xBLL:
      id v22 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"BUTTON_TITLE_SETTINGS" value:&stru_1000D08C0 table:@"IXUserPresentableErrors"]);
      [v4 setObject:v22 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

      id v23 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"BUTTON_TITLE_OK" value:&stru_1000D08C0 table:@"IXUserPresentableErrors"]);
      [v4 setObject:v23 forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];

      id v12 = &stru_1000CD7F8;
      break;
    case 0x10LL:
      id v24 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"BUTTON_TITLE_SETTINGS" value:&stru_1000D08C0 table:@"IXUserPresentableErrors"]);
      [v4 setObject:v24 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

      id v25 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"BUTTON_TITLE_OK" value:&stru_1000D08C0 table:@"IXUserPresentableErrors"]);
      [v4 setObject:v25 forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];

      id v12 = &stru_1000CD818;
      break;
    default:
LABEL_10:
      id v16 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"BUTTON_TITLE_OK" value:&stru_1000D08C0 table:@"IXUserPresentableErrors"]);
      [v4 setObject:v16 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

      id v12 = 0LL;
      break;
  }

  if (*(void *)(a1 + 72) == 1LL) {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) objectAtIndexedSubscript:0]);
  }
  else {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%lu bundleIDs>",  *(void *)(a1 + 72)));
  }
  id v18 = v17;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002BD20;
  block[3] = &unk_1000CD890;
  id v33 = v4;
  id v34 = v17;
  __int16 v35 = v12;
  id v36 = 0LL;
  id v19 = v12;
  id v20 = v4;
  id v21 = v18;
  dispatch_async(&_dispatch_main_q, block);
}

id sub_10002B478(void *a1, unint64_t a2, uint64_t a3)
{
  id v5 = a1;
  int v6 = sub_10002ADD0(a3);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (a2 >= 2) {
    unsigned __int8 v9 = @"_TITLE_MULTIPLE";
  }
  else {
    unsigned __int8 v9 = @"_TITLE";
  }
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingString:v9]);
  id v11 = sub_10002ACEC();
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:v10 value:&stru_1000D08C0 table:@"IXUserPresentableErrors"]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v13, v5));
  return v14;
}

id sub_10002B550(void *a1, void *a2, unint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  if (v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:MIRequiredOSVersionErrorKey]);

    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:MIRequiredOSErrorKey]);

    id v11 = @"kIXUserPresentableDeviceOSVersionTooLowError";
    if (v10)
    {
      if ([v10 unsignedIntegerValue] != (id)1 && a3 < 2) {
        id v11 = @"kIXUserPresentableDeviceOSVersionTooLowDiffPlatformError";
      }
    }
  }

  else
  {
    id v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10007D38C();
    }

    id v8 = 0LL;
    id v11 = @"kIXUserPresentableDeviceOSVersionTooLowError";
  }

  id v15 = sub_10002BC28(v11, v8, v6, a3);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return v16;
}

id sub_10002B690(void *a1, unint64_t a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = sub_10002ADD0(a3);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = sub_10002BC28(v7, v5, v5, a2);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

void sub_10002B6F4(id a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"prefs:root=DeviceUsage"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  id v7 = 0LL;
  unsigned __int8 v3 = [v2 openSensitiveURL:v1 withOptions:0 error:&v7];
  id v4 = v7;

  if ((v3 & 1) == 0)
  {
    id v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10007D418();
    }
  }
}

void sub_10002B7B8(id a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"prefs:root=General&path=SOFTWARE_UPDATE_LINK"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  unsigned __int8 v3 = [v2 openSensitiveURL:v1 withOptions:0];

  if ((v3 & 1) == 0)
  {
    id v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "IXPresentErrorHighlightingLocalizedAppName_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to open software update Settings",  (uint8_t *)&v6,  0xCu);
    }
  }
}

uint64_t sub_10002B8BC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10002B8D0(uint64_t a1)
{
  if (*(void *)(a1 + 48) == 1LL
    && (id v2 = *(void **)(a1 + 32)) != 0LL
    && (unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iTunesMetadata]),
        id v4 = [v3 storeItemIdentifier],
        v3,
        v4))
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSURLComponents);
    int v6 = -[NSURLQueryItem initWithName:value:]( objc_alloc(&OBJC_CLASS___NSURLQueryItem),  "initWithName:value:",  @"action",  @"lookup");
    id v7 = objc_alloc(&OBJC_CLASS___NSURLQueryItem);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", v4));
    unsigned __int8 v9 = -[NSURLQueryItem initWithName:value:](v7, "initWithName:value:", @"ids", v8);

    -[NSURLComponents setScheme:](v5, "setScheme:", @"itms-apps");
    -[NSURLComponents setHost:](v5, "setHost:", &stru_1000D08C0);
    v15[0] = v6;
    v15[1] = v9;
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
    -[NSURLComponents setQueryItems:](v5, "setQueryItems:", v10);

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v5, "URL"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10002BB30;
    v13[3] = &unk_1000CD840;
    id v14 = *(id *)(a1 + 40);
    [v12 openURL:v11 configuration:0 completionHandler:v13];
  }

  else
  {
    sub_10002BAE8();
  }

void sub_10002BAE8()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  [v0 openApplicationWithBundleIdentifier:@"com.apple.AppStore" configuration:0 completionHandler:&stru_1000CD8D0];
}

void sub_10002BB30(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectAtIndexedSubscript:0]);
      int v8 = 136315650;
      unsigned __int8 v9 = "IXPresentErrorHighlightingLocalizedAppName_block_invoke_3";
      __int16 v10 = 2112;
      id v11 = v7;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to open app with bundle ID %@ in the App Store. Error: %@",  (uint8_t *)&v8,  0x20u);
    }
  }
}

id sub_10002BC28(void *a1, void *a2, void *a3, unint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if (a4 >= 2) {
    __int16 v10 = @"_BODY_MULTIPLE";
  }
  else {
    __int16 v10 = @"_BODY";
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingString:v10]);
  id v12 = sub_10002ACEC();
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:v11 value:&stru_1000D08C0 table:@"IXUserPresentableErrors"]);

  if (a4 > 1) {
    id v15 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v14, v9, a4 - 1);
  }
  else {
    id v15 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v14, v8, v18);
  }
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return v16;
}

void sub_10002BD20(uint64_t a1)
{
  SInt32 error = 0;
  id v2 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 2uLL, &error, *(CFDictionaryRef *)(a1 + 32));
  if (v2)
  {
    unsigned __int8 v3 = v2;
    CFOptionFlags v16 = 0LL;
    if (CFUserNotificationReceiveResponse(v2, 0.0, &v16))
    {
      id v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        id v19 = "_ShowUserNotice_block_invoke";
        __int16 v20 = 2112;
        uint64_t v21 = v6;
        __int16 v22 = 1024;
        SInt32 v23 = error;
        id v7 = "%s: Failed to recieve notification response for error presentation alert for app with bundle ID %@, error code %d";
        id v8 = v5;
        uint32_t v9 = 28;
LABEL_5:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }

    else
    {
      if (v16 != 2)
      {
        if (v16 == 1)
        {
          uint64_t v13 = *(void *)(a1 + 56);
          if (!v13) {
            goto LABEL_7;
          }
        }

        else
        {
          if (v16) {
            goto LABEL_7;
          }
          uint64_t v13 = *(void *)(a1 + 48);
          if (!v13) {
            goto LABEL_7;
          }
        }

        (*(void (**)(void))(v13 + 16))();
        goto LABEL_7;
      }

      id v14 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315394;
        id v19 = "_ShowUserNotice_block_invoke";
        __int16 v20 = 2112;
        uint64_t v21 = v15;
        id v7 = "%s: Received an invalid response (kCFUserNotificationOtherResponse) from the error presentation alert for a"
             "pp with bundleID %@";
        id v8 = v5;
        uint32_t v9 = 22;
        goto LABEL_5;
      }
    }

LABEL_7:
    CFRelease(v3);
    return;
  }

  __int16 v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    id v19 = "_ShowUserNotice_block_invoke";
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    __int16 v22 = 1024;
    SInt32 v23 = error;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to create error presentation alert for app with bundle ID %@, error code %d",  buf,  0x1Cu);
  }
}

void sub_10002BF74(id a1, BOOL a2, NSError *a3)
{
  id v4 = a3;
  if (v4 && !a2)
  {
    id v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      id v8 = "_LaunchAppStore_block_invoke";
      __int16 v9 = 2112;
      __int16 v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to open App Store : %@",  (uint8_t *)&v7,  0x16u);
    }
  }
}

void sub_10002C938(id a1)
{
  if (dlopen("/System/Library/PrivateFrameworks/HeadBoardModel.framework/HeadBoardModel", 1))
  {
    qword_1000E8EC8 = (uint64_t)NSClassFromString(@"HBMCloudSyncUtility");
  }

  else
  {
    id v1 = dlerror();
    id v3 = sub_10003556C( (uint64_t)"+[IXSAppUninstallAlert _loadHBMCloudSyncUtilityClass]_block_invoke",  107LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Failed to dlopen HeadBoardModel: %s",  v2,  (uint64_t)v1);
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    id v5 = (void *)qword_1000E8EC0;
    qword_1000E8EC0 = v4;
  }

void sub_10002D45C(id a1)
{
  id v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.installcoordinationd");
  id v1 = objc_opt_new(&OBJC_CLASS___IXSClientConnectionManager);
  uint64_t v2 = (void *)qword_1000E8ED0;
  qword_1000E8ED0 = (uint64_t)v1;

  -[NSXPCListener setDelegate:](v3, "setDelegate:", qword_1000E8ED0);
  -[NSXPCListener resume](v3, "resume");
}

void sub_10002D7F8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, id location)
{
}

void sub_10002D824(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "-[IXSClientConnectionManager listener:shouldAcceptNewConnection:]_block_invoke_2";
      __int16 v15 = 2112;
      id v16 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Connection invalidated: %@", buf, 0x16u);
    }

    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allConnectionsQueue]);
    int v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472LL;
    __int16 v9 = sub_10002D970;
    __int16 v10 = &unk_1000CCCB8;
    uint64_t v11 = *(void *)(a1 + 32);
    id v6 = WeakRetained;
    id v12 = v6;
    dispatch_sync(v5, &v7);

    objc_msgSend(v6, "connectionInvalidated", v7, v8, v9, v10, v11);
  }
}

void sub_10002D970(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allConnections]);
  [v2 removeObject:*(void *)(a1 + 40)];
}

void sub_10002D9B0(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allConnections]);
  [v2 addObject:*(void *)(a1 + 40)];
}

void sub_10002DC5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10002DC74(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10002DC84(uint64_t a1)
{
}

void sub_10002DC8C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stagingBaseDir]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@"Dictionary.plist" isDirectory:0]);

  uint64_t v4 = a1 + 48;
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id obj = *(id *)(v6 + 40);
  unsigned __int8 v7 = objc_msgSend(v5, "IX_writeToURL:format:options:error:", v3, 200, 268435457, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if ((v7 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_internal_setStagedPath:", v3);
    [*(id *)(a1 + 32) setComplete:1];
  }

  else
  {
    uint64_t v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    __int16 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10007D530(v3, v4, v9);
    }

    __int16 v10 = *(void **)(*(void *)(*(void *)v4 + 8LL) + 40LL);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
    id v13 = sub_10003556C( (uint64_t)"-[IXSPromisedInMemoryDictionary initWithSeed:dictionary:error:]_block_invoke",  59LL,  @"IXErrorDomain",  1uLL,  v10,  0LL,  @"Could not write dictionary promise dictionary to disk at %@",  v12,  (uint64_t)v11);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);

    uint64_t v15 = *(void *)(*(void *)v4 + 8LL);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

id sub_10002DF40()
{
  if (qword_1000E8EE0) {
    return (id)qword_1000E8EE0;
  }
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[IXGlobalConfiguration sharedInstance](&OBJC_CLASS___IXGlobalConfiguration, "sharedInstance"));
  id v7 = 0LL;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 removabilityDirectoryWithError:&v7]);
  id v3 = v7;

  if (v2)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( [v2 URLByAppendingPathComponent:@"RemovabilityMetadataWithMultipleSources.plist" isDirectory:0]);
  }

  else
  {
    id v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10007D5F8();
    }

    uint64_t v4 = 0LL;
  }

  return v4;
}

id sub_10002E024()
{
  if (qword_1000E8EE8) {
    return (id)qword_1000E8EE8;
  }
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[IXGlobalConfiguration sharedInstance](&OBJC_CLASS___IXGlobalConfiguration, "sharedInstance"));
  id v7 = 0LL;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 removabilityDirectoryWithError:&v7]);
  id v3 = v7;

  if (v2)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( [v2 URLByAppendingPathComponent:@"ClockedRemovabilityMetadata.plist" isDirectory:0]);
  }

  else
  {
    id v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10007D664();
    }

    uint64_t v4 = 0LL;
  }

  return v4;
}

id sub_10002E108()
{
  if (qword_1000E8EF8) {
    return (id)qword_1000E8EF8;
  }
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[IXGlobalConfiguration sharedInstance](&OBJC_CLASS___IXGlobalConfiguration, "sharedInstance"));
  id v7 = 0LL;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 removabilityDirectoryWithError:&v7]);
  id v3 = v7;

  if (v2)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( [v2 URLByAppendingPathComponent:@"RemovabilityMetadata.plist" isDirectory:0]);
  }

  else
  {
    id v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10007D6D0();
    }

    uint64_t v4 = 0LL;
  }

  return v4;
}

id sub_10002E1EC()
{
  if (qword_1000E8EF0) {
    return (id)qword_1000E8EF0;
  }
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[IXGlobalConfiguration sharedInstance](&OBJC_CLASS___IXGlobalConfiguration, "sharedInstance"));
  id v7 = 0LL;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 dataDirectoryWithError:&v7]);
  id v3 = v7;

  if (v2)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@"removability.plist" isDirectory:0]);
  }

  else
  {
    id v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10007D73C();
    }

    uint64_t v4 = 0LL;
  }

  return v4;
}

void sub_10002E2D0(id obj)
{
}

void sub_10002E2E0(id obj)
{
}

void sub_10002E2F0(id obj)
{
}

void sub_10002E300(id obj)
{
}

id sub_10002E310(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10002E4D0;
  v16[3] = &unk_1000CDA30;
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v17 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v16];

  v18[0] = @"RemovabilityEntries";
  id v6 = -[NSMutableDictionary copy](v5, "copy");
  v18[1] = @"RemovabilityChangeClock";
  v19[0] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 dictionaryRepresentation]);

  v19[1] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  2LL));

  id v15 = 0LL;
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v8,  200LL,  0LL,  &v15));
  id v10 = v15;
  if (v9)
  {
    id v11 = v9;
  }

  else
  {
    uint64_t v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10007D7A8();
    }
  }

  return v9;
}

void sub_10002E4D0(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v10 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 propertyListRepresentation]);
  if (v7)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v10 canonicalSerializationForPlistKey]);
    [v8 setObject:v7 forKeyedSubscript:v9];
  }

  *a4 = 0;
}

id sub_10002E554(void *a1)
{
  id v1 = a1;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10002E66C;
  v10[3] = &unk_1000CDA30;
  id v2 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v11 = v2;
  [v1 enumerateKeysAndObjectsUsingBlock:v10];

  id v9 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v2,  200LL,  0LL,  &v9));
  id v4 = v9;
  if (v3)
  {
    id v5 = v3;
  }

  else
  {
    id v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10007D814();
    }
  }

  return v3;
}

void sub_10002E66C(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v14 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 mostRestrictiveRemovabilityMetadata]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dictionaryRepresentation]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  id v10 = v8;
  if ((objc_opt_isKindOfClass(v10, v9) & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0LL;
  }

  if (v11)
  {
    uint64_t v12 = *(void **)(a1 + 32);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v14 canonicalSerializationForPlistKey]);
    [v12 setObject:v11 forKeyedSubscript:v13];
  }

  *a4 = 0;
}

id sub_10002E744(void *a1)
{
  id v1 = a1;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v2 = v1;
  }
  else {
    id v2 = 0LL;
  }

  return v2;
}

NSDictionary *sub_10002E78C(void *a1, BOOL *a2)
{
  uint64_t v4 = 3LL;
  id v5 = sub_10002EAC0(3LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    uint64_t v4 = 2LL;
    id v7 = sub_10002EAC0(2LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (!v6)
    {
      uint64_t v4 = 1LL;
      id v8 = sub_10002EAC0(1LL);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(v8);
      if (!v6)
      {
        id v9 = sub_10002EAC0(0LL);
        id v6 = (void *)objc_claimAutoreleasedReturnValue(v9);
        if (!v6)
        {
          id v15 = 0LL;
          uint64_t v4 = 0LL;
          goto LABEL_21;
        }

        uint64_t v4 = 0LL;
      }
    }
  }

  id v29 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v6,  0LL,  0LL,  &v29));
  id v11 = v29;
  if (!v10)
  {
    id v17 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10007D880();
    }

    id v15 = 0LL;
    goto LABEL_21;
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  id v13 = v10;
  if ((objc_opt_isKindOfClass(v13, v12) & 1) != 0)
  {
    if ((unint64_t)(v4 - 2) >= 2)
    {
      id v15 = +[IXDataStoreClock newClock](&OBJC_CLASS___IXDataStoreClock, "newClock");
      id v16 = v13;
      __int16 v20 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      v30[0] = _NSConcreteStackBlock;
      if (v4) {
        uint64_t v21 = sub_10002FCB0;
      }
      else {
        uint64_t v21 = sub_10002FE58;
      }
      v30[1] = 3221225472LL;
      v30[2] = v21;
      v30[3] = &unk_1000CDA80;
      id v31 = v20;
      __int16 v22 = v20;
      [v16 enumerateKeysAndObjectsUsingBlock:v30];

      id v14 = (NSDictionary *)-[NSMutableDictionary copy](v22, "copy");
    }

    else
    {
      id v27 = 0LL;
      id v28 = 0LL;
      sub_10002EB38(v13, &v28, &v27, v4);
      id v14 = (NSDictionary *)v28;
      id v15 = v27;
      id v16 = v13;
    }
  }

  else
  {

    id v19 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v16 = (id)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
      sub_10007D8EC();
    }
    id v15 = 0LL;
    id v14 = 0LL;
  }

  if (!v14)
  {
LABEL_21:
    id v14 = objc_opt_new(&OBJC_CLASS___NSDictionary);
    id v23 = +[IXDataStoreClock newClock](&OBJC_CLASS___IXDataStoreClock, "newClock");

    id v15 = v23;
  }

  if (a2)
  {
    BOOL v24 = v4 != 3 && -[NSDictionary count](v14, "count") != 0;
    *a2 = v24;
  }

  if (a1) {
    *a1 = v15;
  }
  id v25 = v14;

  return v25;
}

id sub_10002EAC0(uint64_t a1)
{
  if (a1 == 1)
  {
    id v3 = sub_10002E108();
    id v2 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }

  else if (a1 == 2)
  {
    id v4 = sub_10002E024();
    id v2 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }

  else
  {
    if (a1 == 3) {
      id v1 = sub_10002DF40();
    }
    else {
      id v1 = sub_10002E1EC();
    }
    id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  }

  id v5 = v2;
  id v6 = sub_10002F748(v2, 1);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

uint64_t sub_10002EB38(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"RemovabilityEntries"]);
  if (v8)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v10 = v8;
    if ((objc_opt_isKindOfClass(v10, v9) & 1) != 0) {
      id v11 = v10;
    }
    else {
      id v11 = 0LL;
    }

    if (v11)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"RemovabilityChangeClock"]);
      if (v13)
      {
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        id v15 = v13;
        if ((objc_opt_isKindOfClass(v15, v14) & 1) != 0) {
          id v16 = v15;
        }
        else {
          id v16 = 0LL;
        }

        if (v16)
        {
          id v21 = sub_10002F9A4(v10, a4);
          __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(v21);
          if (v20)
          {
            __int16 v22 = +[IXDataStoreClock newClockWithDictionary:]( &OBJC_CLASS___IXDataStoreClock,  "newClockWithDictionary:",  v15);
            id v23 = v22;
            if (v22)
            {
              if (a3) {
                *a3 = v22;
              }
              if (a2) {
                *a2 = v20;
              }
              uint64_t v18 = 1LL;
              goto LABEL_34;
            }

            id v26 = sub_1000047B4((uint64_t)off_1000E8CA0);
            id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
              sub_10007DB94();
            }
          }

          else
          {
            id v25 = sub_1000047B4((uint64_t)off_1000E8CA0);
            id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              sub_10007DB28();
            }
          }

          uint64_t v18 = 0LL;
LABEL_34:

          goto LABEL_35;
        }

        BOOL v24 = sub_1000047B4((uint64_t)off_1000E8CA0);
        __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR)) {
          sub_10007DABC();
        }
      }

      else
      {
        id v19 = sub_1000047B4((uint64_t)off_1000E8CA0);
        __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR)) {
          sub_10007DA40();
        }
      }

      uint64_t v18 = 0LL;
LABEL_35:

      goto LABEL_36;
    }

    id v17 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      sub_10007D9D4();
    }
  }

  else
  {
    uint64_t v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      sub_10007D958();
    }
  }

  uint64_t v18 = 0LL;
LABEL_36:

  return v18;
}

IXAppRemovabilityMetadata *sub_10002EDF4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:a2]);
  id v7 = v6;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 mostRestrictiveRemovabilityMetadata]);
    uint64_t v9 = v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = -[IXAppRemovabilityMetadata initWithRemovability:client:]( objc_alloc(&OBJC_CLASS___IXAppRemovabilityMetadata),  "initWithRemovability:client:",  a3,  a4);
    }
    id v11 = v10;
  }

  else
  {
    id v11 = -[IXAppRemovabilityMetadata initWithRemovability:client:]( objc_alloc(&OBJC_CLASS___IXAppRemovabilityMetadata),  "initWithRemovability:client:",  a3,  a4);
  }

  return v11;
}

id sub_10002EE94(void *a1, uint64_t a2, id a3, uint64_t a4)
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:a2]);
  id v7 = v6;
  if (v6) {
    a3 = [v6 removabilityForClient:a4 notFoundRemovability:a3];
  }

  return a3;
}

id sub_10002EEEC(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = sub_10002EF60(v7, a4);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v9;
  if (v9) {
    id v11 = sub_10002EE94(v9, (uint64_t)v7, a3, a2);
  }
  else {
    id v11 = 0LL;
  }

  return v11;
}

id sub_10002EF60(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = sub_10002DF40();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = sub_10002F748(v5, 0);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    id v60 = 0LL;
    unsigned __int8 v8 = [v3 resolvePersonaRespectingSandboxingWithError:&v60];
    id v9 = v60;
    id v10 = v9;
    if ((v8 & 1) == 0)
    {
      id v27 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        sub_10007DF50();
      }
      id v26 = 0LL;
      goto LABEL_34;
    }

    __int16 v52 = a2;
    uint64_t v53 = v9;
    id v51 = v3;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 possibleSerializationsForPlistKey]);
    uint64_t v12 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    id v13 = v11;
    id v14 = [v13 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v57;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v57 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@",  @"RemovabilityEntries",  *(void *)(*((void *)&v56 + 1) + 8LL * (void)i)));
          -[NSMutableSet addObject:](v12, "addObject:", v18);
        }

        id v15 = [v13 countByEnumeratingWithState:&v56 objects:v61 count:16];
      }

      while (v15);
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@",  @"RemovabilityChangeClock",  @"sequenceNumber"));
    -[NSMutableSet addObject:](v12, "addObject:", v19);

    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@",  @"RemovabilityChangeClock",  @"guid"));
    -[NSMutableSet addObject:](v12, "addObject:", v20);

    id v21 = (os_log_s *)-[NSMutableSet copy](v12, "copy");
    id v54 = 0LL;
    id v55 = 0LL;
    if (!_CFPropertyListCreateFiltered(kCFAllocatorDefault, v7, 0LL, v21, &v55, &v54)
      || (__int16 v22 = v55) == 0LL)
    {
      id v28 = v54;

      id v29 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        id v3 = v51;
        sub_10007DEDC();
        id v24 = 0LL;
        id v31 = 0LL;
        id v32 = 0LL;
        id v33 = 0LL;
        uint64_t v53 = v28;
      }

      else
      {
        id v24 = 0LL;
        id v31 = 0LL;
        id v32 = 0LL;
        id v33 = 0LL;
        uint64_t v53 = v28;
        id v3 = v51;
      }

      goto LABEL_31;
    }

    uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v24 = v22;
    if ((objc_opt_isKindOfClass(v24, v23) & 1) != 0) {
      id v25 = v24;
    }
    else {
      id v25 = 0LL;
    }
    id v3 = v51;

    if (v25)
    {
      uint64_t v34 = objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:@"RemovabilityEntries"]);
      if (v34)
      {
        __int16 v35 = (void *)v34;
        uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        id v31 = v35;
        if ((objc_opt_isKindOfClass(v31, v36) & 1) != 0) {
          id v37 = v31;
        }
        else {
          id v37 = 0LL;
        }

        if (v37)
        {
          id v41 = sub_10002F9A4(v31, 3LL);
          uint64_t v42 = objc_claimAutoreleasedReturnValue(v41);
          if (v42)
          {
            id v33 = (id)v42;
            uint64_t v43 = objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:@"RemovabilityChangeClock"]);
            if (v43)
            {
              id v32 = (void *)v43;
              objc_opt_class(&OBJC_CLASS___NSDictionary);
              id v44 = sub_10002E744(v32);
              __int16 v45 = (void *)objc_claimAutoreleasedReturnValue(v44);

              if (v45)
              {
                if (v52)
                {
                  id v46 = +[IXDataStoreClock newClockWithDictionary:]( &OBJC_CLASS___IXDataStoreClock, "newClockWithDictionary:", v32);
                  *__int16 v52 = v46;
                }

                id v33 = v33;
                id v26 = v33;
LABEL_33:

                id v10 = v53;
LABEL_34:

                goto LABEL_35;
              }

              id v50 = sub_1000047B4((uint64_t)off_1000E8CA0);
              id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                sub_10007DE60();
              }
            }

            else
            {
              int v49 = sub_1000047B4((uint64_t)off_1000E8CA0);
              id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                sub_10007DDE4();
              }
              id v32 = 0LL;
            }

IXAppRemovabilityMetadata *sub_10002F538(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = sub_10002EF60(v7, a4);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v9;
  if (v9)
  {
    id v11 = sub_10002EDF4(v9, (uint64_t)v7, a2, a3);
    uint64_t v12 = (IXAppRemovabilityMetadata *)objc_claimAutoreleasedReturnValue(v11);
  }

  else
  {
    uint64_t v12 = -[IXAppRemovabilityMetadata initWithRemovability:client:]( objc_alloc(&OBJC_CLASS___IXAppRemovabilityMetadata),  "initWithRemovability:client:",  0LL,  0LL);
  }

  id v13 = v12;

  return v13;
}

id sub_10002F5C4(void *a1)
{
  id v2 = sub_10002DF40();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = sub_10002F748(v3, 0);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  if (v5)
  {
    id v18 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v5,  0LL,  0LL,  &v18));
    id v7 = v18;
    if (v6)
    {
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      id v9 = v6;
      if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0)
      {
        id v17 = 0LL;
        int v10 = sub_10002EB38(v9, &v17, a1, 3LL);
        id v11 = v17;
        uint64_t v12 = v11;
        id v13 = 0LL;
        if (v10) {
          id v13 = v11;
        }

        goto LABEL_13;
      }

      id v15 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v9 = (id)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
        sub_10007E038((os_log_t)v9);
      }
    }

    else
    {
      id v14 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v9 = (id)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
        sub_10007DFCC();
      }
    }

    id v13 = 0LL;
LABEL_13:

    goto LABEL_14;
  }

  id v13 = 0LL;
LABEL_14:

  return v13;
}

id sub_10002F748(void *a1, int a2)
{
  id v3 = a1;
  if (v3)
  {
    if (a2) {
      uint64_t v4 = 3LL;
    }
    else {
      uint64_t v4 = 1LL;
    }
    id v22 = 0LL;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v3,  v4,  &v22));
    id v6 = v22;
    id v7 = v6;
    if (!v5)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
      if ([v8 isEqualToString:NSCocoaErrorDomain] && objc_msgSend(v7, "code") == (id)257)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
        int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:NSUnderlyingErrorKey]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]);
        if ([v11 isEqualToString:NSPOSIXErrorDomain])
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:NSUnderlyingErrorKey]);
          id v21 = [v13 code];

          if (v21 == (id)1)
          {
            id v14 = sub_1000047B4((uint64_t)off_1000E8CA0);
            id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
              sub_10007E130(v3, v15);
            }
LABEL_23:

            goto LABEL_24;
          }

id sub_10002F9A4(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  id v9 = sub_10002FA4C;
  int v10 = &unk_1000CDA58;
  id v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v12 = a2;
  uint64_t v4 = v11;
  [v3 enumerateKeysAndObjectsUsingBlock:&v7];

  id v5 = -[NSMutableDictionary copy](v4, "copy", v7, v8, v9, v10);
  return v5;
}

void sub_10002FA4C(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  id v10 = v7;
  if ((objc_opt_isKindOfClass(v10, v9) & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0LL;
  }

  if (v11)
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v13 = v8;
    if ((objc_opt_isKindOfClass(v13, v12) & 1) != 0)
    {
      if (v13)
      {
        id v14 = -[IXApplicationIdentity initWithPlistKeySerialization:]( objc_alloc(&OBJC_CLASS___IXApplicationIdentity),  "initWithPlistKeySerialization:",  v10);
        if (v14)
        {
          uint64_t v15 = *(void *)(a1 + 40);
          id v16 = v13;
          id v17 = v14;
          if (v15 == 2)
          {
            id v22 = -[IXAppRemovabilityMetadata initWithMetadataDictionary:]( objc_alloc(&OBJC_CLASS___IXAppRemovabilityMetadata),  "initWithMetadataDictionary:",  v16);
            id v18 = -[IXAppRemovabilityMetadataList initWithInitialRemovabilityMetadata:]( objc_alloc(&OBJC_CLASS___IXAppRemovabilityMetadataList),  "initWithInitialRemovabilityMetadata:",  v22);
          }

          else if (v15 == 3)
          {
            id v18 = -[IXAppRemovabilityMetadataList initWithSerializedDictionary:]( objc_alloc(&OBJC_CLASS___IXAppRemovabilityMetadataList),  "initWithSerializedDictionary:",  v16);
          }

          else
          {
            uint64_t v23 = sub_1000047B4((uint64_t)off_1000E8CA0);
            id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
              sub_10007E3C8();
            }

            id v18 = 0LL;
          }

          [*(id *)(a1 + 32) setObject:v18 forKeyedSubscript:v17];
        }

        else
        {
          id v21 = sub_1000047B4((uint64_t)off_1000E8CA0);
          id v18 = (IXAppRemovabilityMetadataList *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR)) {
            sub_10007E35C();
          }
        }

        goto LABEL_24;
      }
    }

    else
    {
    }

    __int16 v20 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      sub_10007E2F0();
    }
  }

  else
  {
    id v19 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      sub_10007E27C();
    }
  }

void sub_10002FCB0(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  id v10 = v7;
  if ((objc_opt_isKindOfClass(v10, v9) & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0LL;
  }

  if (v11)
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v13 = v8;
    if ((objc_opt_isKindOfClass(v13, v12) & 1) == 0)
    {
LABEL_16:

      goto LABEL_17;
    }

    if (v13)
    {
      id v14 = -[IXApplicationIdentity initWithPlistKeySerialization:]( objc_alloc(&OBJC_CLASS___IXApplicationIdentity),  "initWithPlistKeySerialization:",  v10);
      if (v14)
      {
        uint64_t v15 = -[IXAppRemovabilityMetadata initWithMetadataDictionary:]( objc_alloc(&OBJC_CLASS___IXAppRemovabilityMetadata),  "initWithMetadataDictionary:",  v13);
        id v16 = -[IXAppRemovabilityMetadataList initWithInitialRemovabilityMetadata:]( objc_alloc(&OBJC_CLASS___IXAppRemovabilityMetadataList),  "initWithInitialRemovabilityMetadata:",  v15);
        [*(id *)(a1 + 32) setObject:v16 forKeyedSubscript:v14];
      }

      else
      {
        id v19 = sub_1000047B4((uint64_t)off_1000E8CA0);
        __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_10007E4BC();
        }
      }

      goto LABEL_16;
    }
  }

  else
  {
    id v17 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10007E448();
    }
  }

void sub_10002FE58(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v10 = v8;
  if ((objc_opt_isKindOfClass(v10, v9) & 1) == 0)
  {
LABEL_9:

    goto LABEL_10;
  }

  if (v10)
  {
    id v11 = [v10 unsignedIntegerValue];
    uint64_t v12 = -[IXApplicationIdentity initWithPlistKeySerialization:]( objc_alloc(&OBJC_CLASS___IXApplicationIdentity),  "initWithPlistKeySerialization:",  v7);
    if (v12)
    {
      id v13 = -[IXAppRemovabilityMetadataList initWithInitialRemovability:client:]( objc_alloc(&OBJC_CLASS___IXAppRemovabilityMetadataList),  "initWithInitialRemovability:client:",  v11,  1LL);
      [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:v12];
    }

    else
    {
      id v14 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10007E528();
      }
    }

    goto LABEL_9;
  }

BOOL IXIsAppExtensionForPlaceholderType(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

__CFString *IXStringForAppRemovability(unint64_t a1)
{
  if (a1 >= 4) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown IXAppRemovability value: %lu",  a1));
  }
  else {
    return off_1000CDAA0[a1];
  }
}

__CFString *IXStringForAppRemovabilityClient(unint64_t a1)
{
  if (a1 >= 5) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown IXAppRemovabilityClient value: %lu",  a1));
  }
  else {
    return off_1000CDAC0[a1];
  }
}

__CFString *IXStringForIXError(void *a1, unint64_t a2)
{
  id v3 = a1;
  if (![v3 isEqualToString:@"IXUserPresentableErrorDomain"])
  {
    if ([v3 isEqualToString:@"IXErrorDomain"])
    {
      if (a2 < 0x3A)
      {
        uint64_t v4 = off_1000CDB18[a2];
        goto LABEL_10;
      }

      id v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unhandled reason for code: %lu in domain IXErrorDomain",  a2,  v7);
    }

    else
    {
      id v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unhandled error domain %@, code %lu",  v3,  a2);
    }

id IXCreateUserPresentableError(unint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v7 = v6;
    if (v5)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v5, NSUnderlyingErrorKey);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:NSLocalizedDescriptionKey]);

      if (v9)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v9,  NSLocalizedFailureReasonErrorKey);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v9,  NSLocalizedRecoverySuggestionErrorKey);
      }
    }

    if (a2) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"AlertUser");
    }
    id v10 = IXStringForIXError(@"IXUserPresentableErrorDomain", a1);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v11,  NSLocalizedFailureReasonErrorKey);

    if (a1 >= 0x13) {
      uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unhandled IXUserPresentableErrorCode %lu",  a1));
    }
    else {
      uint64_t v12 = off_1000CDCE8[a1 - 1];
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v12,  NSLocalizedDescriptionKey);

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IXUserPresentableErrorDomain",  a1,  v7));
  }

  else
  {
    id v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10007E62C(v14);
    }

    uint64_t v15 = 0LL;
  }

  return v15;
}

uint64_t IXUserPresentableErrorCodeIsHardError(unint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1D) {
    unsigned int v2 = 1;
  }
  else {
    unsigned int v2 = (0xF7FFFFDu >> a2) & 1;
  }
  if (((1LL << a1) & 0x34010) != 0) {
    unsigned int v3 = v2;
  }
  else {
    unsigned int v3 = 0;
  }
  if (((1LL << a1) & 0xA1E4) != 0) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a1 <= 0x11) {
    return v4;
  }
  else {
    return 0LL;
  }
}

id sub_10003059C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) seed]);
  [v3 setTransferPath:v2];

  return [*(id *)(a1 + 32) saveState];
}

id sub_100030674(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) seed]);
  [v3 setShouldCopy:v2];

  return [*(id *)(a1 + 32) saveState];
}

id sub_100030750(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) seed]);
  [v3 setTryDeltaCopy:v2];

  return [*(id *)(a1 + 32) saveState];
}

void sub_100030A98(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = a2;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  id v14 = v6;
  char isKindOfClass = objc_opt_isKindOfClass(v14, v7);
  uint64_t v9 = v14;
  if ((isKindOfClass & 1) == 0)
  {
LABEL_6:

    uint64_t v9 = v14;
    goto LABEL_7;
  }

  if (v14)
  {
    id v10 = -[IXAppRemovabilityMetadata initWithMetadataDictionary:]( objc_alloc(&OBJC_CLASS___IXAppRemovabilityMetadata),  "initWithMetadataDictionary:",  v14);
    id v11 = v10;
    if (v10)
    {
      uint64_t v12 = *(void **)(a1 + 32);
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXAppRemovabilityMetadata client](v10, "client")));
      [v12 setObject:v11 forKeyedSubscript:v13];
    }

    goto LABEL_6;
  }

void sub_100030C5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100030C80(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100030C90(uint64_t a1)
{
}

void sub_100030C98(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = v7;
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (!*(void *)(v9 + 40)) {
    goto LABEL_4;
  }
  unint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (v10 < (unint64_t)[v7 removability])
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
LABEL_4:
    objc_storeStrong((id *)(v9 + 40), a3);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 40LL),
                                                                    "removability");
  }

  *a4 = 0;
}

void sub_1000310A4(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 description]);
  [v5 addObject:v6];

  *a4 = 0;
}

void sub_100031200(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 dictionaryRepresentation]);
  [v5 addObject:v6];

  *a4 = 0;
}

BOOL sub_1000314D8(void *a1)
{
  id v1 = (const char *)[a1 UTF8String];
  size_t v2 = strlen(v1);
  if (v2 >= 0x20) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Identifier %s must be less <= %d bytes in length but was %ld bytes",  v1,  31LL,  v2);
  }
  unsigned int v3 = sem_open(v1, 0);
  unsigned int v4 = v3;
  if (v3 != (sem_t *)-1LL) {
    sem_close(v3);
  }
  return v4 == (sem_t *)-1LL;
}

void sub_100031568(void *a1)
{
  id v1 = (const char *)[a1 UTF8String];
  size_t v2 = strlen(v1);
  if (v2 >= 0x20) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Identifier %s must be less <= %d bytes in length but was %ld bytes",  v1,  31LL,  v2);
  }
  unsigned int v3 = sem_open(v1, 512, 256LL, 0LL);
  if (v3 == (sem_t *)-1LL)
  {
    unsigned int v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = __error();
      id v7 = strerror(*v6);
      *(_DWORD *)buf = 136315650;
      uint64_t v9 = "IXSetOncePerBootWorkCompleted";
      __int16 v10 = 2080;
      id v11 = v1;
      __int16 v12 = 2080;
      id v13 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to create semaphore %s: %s",  buf,  0x20u);
    }
  }

  else
  {
    sem_close(v3);
  }

BOOL sub_1000316C4(void *a1, void *a2)
{
  id v3 = a1;
  unsigned int v4 = a2;
  BOOL v5 = sub_1000314D8(v3);
  if (v5)
  {
    id v6 = objc_autoreleasePoolPush();
    v4[2](v4);
    objc_autoreleasePoolPop(v6);
    sub_100031568(v3);
  }

  return v5;
}

__CFString *sub_100031738(unsigned int a1)
{
  if (a1 >= 3) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown Coordinator Scope Requirement: %hhu",  a1));
  }
  else {
    return off_1000CDDF0[(char)a1];
  }
}

BOOL sub_100031790(unsigned int a1)
{
  return a1 < 3;
}

BOOL sub_100031830(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  unsigned __int8 v6 = atomic_load(byte_1000E8F00);
  if ((v6 & 1) != 0)
  {
    if (qword_1000E8F18 != -1) {
      dispatch_once(&qword_1000E8F18, &stru_1000CDE78);
    }
    uint64_t v22 = 0LL;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x2020000000LL;
    char v25 = 0;
    uint64_t v16 = 0LL;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000LL;
    id v19 = sub_1000319A0;
    __int16 v20 = sub_1000319B0;
    id v21 = 0LL;
    id v8 = (dispatch_queue_s *)qword_1000E8F08;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000319B8;
    v11[3] = &unk_1000CDE38;
    id v12 = v5;
    id v13 = &v16;
    id v14 = &v22;
    uint64_t v15 = a2;
    dispatch_sync(v8, v11);
    int v9 = *((unsigned __int8 *)v23 + 24);
    if (a3 && *((_BYTE *)v23 + 24))
    {
      *a3 = (id) v17[5];
      int v9 = *((unsigned __int8 *)v23 + 24);
    }

    BOOL v7 = v9 != 0;

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
  }

  else
  {
    BOOL v7 = 0LL;
  }

  return v7;
}

uint64_t sub_1000319A0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000319B0(uint64_t a1)
{
}

void sub_1000319B8(uint64_t a1)
{
  size_t v2 = (void *)qword_1000E8F10;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100031A3C;
  v3[3] = &unk_1000CDE10;
  id v4 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  __int128 v5 = *(_OWORD *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void sub_100031A3C(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7 = a3;
  if ([*(id *)(a1 + 32) hasPrefix:a2])
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          if (objc_msgSend(v13, "mode", (void)v19) == *(id *)(a1 + 56))
          {
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 testSpecificValidationData]);
            uint64_t v15 = v14;
            if (v14)
            {
              id v16 = [v14 copy];
              uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8LL);
              uint64_t v18 = *(void **)(v17 + 40);
              *(void *)(v17 + 40) = v16;
            }

            *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
            *a4 = 1;
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v10);
    }
  }
}

BOOL sub_100031BB0(void *a1, uint64_t a2)
{
  return sub_100031830(a1, a2, 0LL);
}

void sub_100031BB8(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  if (qword_1000E8F18 != -1) {
    dispatch_once(&qword_1000E8F18, &stru_1000CDE78);
  }
  id v7 = (dispatch_queue_s *)qword_1000E8F08;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100031C90;
  block[3] = &unk_1000CD358;
  id v12 = v5;
  uint64_t v13 = a2;
  id v11 = v6;
  id v8 = v5;
  id v9 = v6;
  dispatch_sync(v7, block);
}

void sub_100031C90(void *a1)
{
  id v3 = -[TestModeMetadata initWithMode:testSpecificValidationData:]( objc_alloc(&OBJC_CLASS___TestModeMetadata),  "initWithMode:testSpecificValidationData:",  a1[6],  a1[4]);
  size_t v2 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000E8F10 objectForKeyedSubscript:a1[5]]);
  if (!v2)
  {
    size_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL));
    [(id)qword_1000E8F10 setObject:v2 forKeyedSubscript:a1[5]];
  }

  [v2 addObject:v3];
}

void sub_100031D30()
{
}

void sub_100031D44()
{
  if (qword_1000E8F18 != -1) {
    dispatch_once(&qword_1000E8F18, &stru_1000CDE78);
  }
  dispatch_sync((dispatch_queue_t)qword_1000E8F08, &stru_1000CDE58);
}

void sub_100031D98(id a1)
{
}

void sub_100031DA4(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  size_t v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.installcoordinationd.TestMode", v2);
  id v4 = (void *)qword_1000E8F08;
  qword_1000E8F08 = (uint64_t)v3;

  uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
  id v6 = (void *)qword_1000E8F10;
  qword_1000E8F10 = v5;
}

void sub_100031E88(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  size_t v2 = (void *)qword_1000E8F20;
  qword_1000E8F20 = (uint64_t)v1;
}

LABEL_12:
LABEL_13:
        id v12 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
        pendingOperationIdentities = self->_pendingOperationIdentities;
        self->_pendingOperationIdentities = v12;

        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
        [v14 removeItemAtURL:v3 error:0];

        goto LABEL_14;
      }
    }

    else
    {
    }

    id v11 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10007E7C8();
    }
    goto LABEL_12;
  }

  if (!-[IXSPendingOperationsTracker _deserializePlistFormatFromData:atURL:]( self,  "_deserializePlistFormatFromData:atURL:",  v4,  v3)
    && !-[IXSPendingOperationsTracker _deserializeKeyedArchiveFromData:atURL:]( self,  "_deserializeKeyedArchiveFromData:atURL:",  v4,  v3))
  {
    goto LABEL_13;
  }

      uint64_t v13 = (char *)v13 + 1;
    }

    while (v9 != v13);
    uint64_t v18 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    id v9 = v18;
  }

  while (v18);
LABEL_19:

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedPromiseUUIDs]);
  [v19 minusSet:*(void *)(a1 + 40)];
}

    id v28 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v40 = "-[IXSClientConnection _remote_cancelCoordinatorForAppWithIdentity:reason:client:completion:]";
      id v41 = 2112;
      uint64_t v42 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%s: No coordinator existed for %@, but SpringBoard is canceling so transforming into an uninstall",  buf,  0x16u);
    }

    char v25 = objc_opt_new(&OBJC_CLASS___IXUninstallOptions);
    -[IXUninstallOptions setRequestUserConfirmation:](v25, "setRequestUserConfirmation:", 0LL);
    -[IXUninstallOptions setWaitForDeletion:](v25, "setWaitForDeletion:", 0LL);
    -[IXUninstallOptions setShowArchiveOption:](v25, "setShowArchiveOption:", 0LL);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100060CD8;
    v35[3] = &unk_1000CE970;
    uint64_t v36 = v12;
    -[IXSClientConnection _remote_uninstallAppWithIdentity:options:completion:]( self,  "_remote_uninstallAppWithIdentity:options:completion:",  v10,  v25,  v35);

    goto LABEL_15;
  }

  v12[2](v12, 0LL, v14);
LABEL_17:
}

void sub_1000326EC(uint64_t a1)
{
  size_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pendingOperationIdentities]);
  unsigned int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  id v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10007E9D8();
    }
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v9 = 136315394;
      id v10 = "-[IXSPendingOperationsTracker beginPendingOperationForIdentity:]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Beginning pending operation for %@",  (uint8_t *)&v9,  0x16u);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pendingOperationIdentities]);
    [v8 addObject:*(void *)(a1 + 40)];

    objc_msgSend(*(id *)(a1 + 32), "_onQueue_writePendingWork");
  }

void sub_1000328C0(uint64_t a1)
{
  size_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pendingOperationIdentities]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  id v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v9 = 136315394;
      id v10 = "-[IXSPendingOperationsTracker endPendingOperationForIdentity:]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Ending pending operation for %@",  (uint8_t *)&v9,  0x16u);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pendingOperationIdentities]);
    [v8 removeObject:*(void *)(a1 + 40)];

    objc_msgSend(*(id *)(a1 + 32), "_onQueue_writePendingWork");
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10007EA48();
    }
  }

void sub_100032AC4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100032ADC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100032AEC(uint64_t a1)
{
}

void sub_100032AF4(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pendingOperationIdentities]);
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100032BB0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sentinelPath]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
  id v8 = 0LL;
  unsigned __int8 v4 = [v3 removeItemAtURL:v2 error:&v8];
  id v5 = v8;

  if ((v4 & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pendingOperationIdentities]);
    [v6 removeAllObjects];
  }

  else
  {
    uint64_t v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
      sub_10007EAB8();
    }
  }
}

__CFString *sub_100033618(unint64_t a1)
{
  if (a1 >= 6) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown uninstall disposition: %lu",  a1));
  }
  else {
    return off_1000CDEC0[a1];
  }
}

uint64_t sub_100033668(uint64_t a1)
{
  else {
    return qword_100095358[a1 - 1];
  }
}

uint64_t IXRemoveItemAtURL(void *a1, int a2, void *a3)
{
  id v5 = a1;
  id v6 = removefile_state_alloc();
  id v8 = v6;
  int value = 0;
  if (!v5)
  {
    NSErrorDomain v22 = NSPOSIXErrorDomain;
    uint64_t v23 = @"nil url passed to -removeItemAtURL:error:";
    uint64_t v24 = 54LL;
    unint64_t v25 = 14LL;
LABEL_19:
    id v21 = sub_10003556C((uint64_t)"IXRemoveItemAtURL", v24, v22, v25, 0LL, 0LL, v23, v7, v31);
    goto LABEL_20;
  }

  if (removefile_state_set(v6, 3u, sub_100033968))
  {
    int v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = __error();
      uint64_t v12 = strerror(*v11);
      *(_DWORD *)buf = 136315394;
      uint64_t v34 = "IXRemoveItemAtURL";
      __int16 v35 = 2080;
      uint64_t v36 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: removefile_state_set REMOVEFILE_STATE_ERROR_CALLBACK failed: %s",  buf,  0x16u);
    }
  }

  if (removefile_state_set(v8, 4u, &value))
  {
    uint64_t v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = __error();
      id v16 = strerror(*v15);
      *(_DWORD *)buf = 136315394;
      uint64_t v34 = "IXRemoveItemAtURL";
      __int16 v35 = 2080;
      uint64_t v36 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: removefile_state_set REMOVEFILE_STATE_ERROR_CONTEXT failed: %s",  buf,  0x16u);
    }
  }

  if (a2) {
    removefile_flags_t v17 = 3;
  }
  else {
    removefile_flags_t v17 = 1;
  }
  id v18 = v5;
  if (removefile((const char *)[v18 fileSystemRepresentation], v8, v17) && *__error() != 2)
  {
    unint64_t v26 = *__error();
    id v27 = __error();
    uint64_t v31 = (uint64_t)v18;
    strerror(*v27);
    uint64_t v23 = @"removefile of %@ failed: %s";
    uint64_t v24 = 75LL;
    NSErrorDomain v22 = NSPOSIXErrorDomain;
    unint64_t v25 = v26;
    goto LABEL_19;
  }

  unint64_t v19 = value;
  if ((value & 0xFFFFFFFD) == 0)
  {
    removefile_state_free(v8);
    id v28 = 0LL;
    uint64_t v29 = 1LL;
    goto LABEL_24;
  }

  strerror(value);
  id v21 = sub_10003556C( (uint64_t)"IXRemoveItemAtURL",  81LL,  NSPOSIXErrorDomain,  v19,  0LL,  0LL,  @"removefile of %@ failed: %s",  v20,  (uint64_t)v18);
LABEL_20:
  id v28 = (id)objc_claimAutoreleasedReturnValue(v21);
  removefile_state_free(v8);
  if (a3)
  {
    id v28 = v28;
    uint64_t v29 = 0LL;
    *a3 = v28;
  }

  else
  {
    uint64_t v29 = 0LL;
  }

uint64_t sub_100033968(_removefile_state *a1, uint64_t a2, _DWORD *a3)
{
  int dst = 0;
  if (removefile_state_get(a1, 5u, &dst))
  {
    id v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "_removefile_error_callback";
      __int16 v14 = 2080;
      uint64_t v15 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: removefile hit error for %s but we failed to get the error number",  buf,  0x16u);
    }

    int dst = 2;
  }

  else if (dst != 2)
  {
    uint64_t v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = strerror(dst);
      *(_DWORD *)buf = 136315650;
      uint64_t v13 = "_removefile_error_callback";
      __int16 v14 = 2080;
      uint64_t v15 = a2;
      __int16 v16 = 2080;
      removefile_flags_t v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: removefile hit error for %s : %s",  buf,  0x20u);
    }
  }

  if (a3 && !*a3) {
    *a3 = dst;
  }
  return 0LL;
}

BOOL IXCopyItemAtURL(void *a1, void *a2, char a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  if ((a3 & 1) != 0
    || (memset(&v23, 0, sizeof(v23)),
        id v9 = v7,
        !lstat((const char *)[v9 fileSystemRepresentation], &v23)))
  {
    id v12 = v7;
    if (!copyfile( (const char *)[v12 fileSystemRepresentation], (const char *)objc_msgSend(v8, "fileSystemRepresentation"), 0, 0x10C800Fu))
    {
      id v21 = 0LL;
      BOOL v11 = 1LL;
      goto LABEL_14;
    }

    unint64_t v13 = *__error();
    __int16 v14 = __error();
    strerror(*v14);
    id v16 = sub_10003556C( (uint64_t)"IXCopyItemAtURL",  121LL,  NSPOSIXErrorDomain,  v13,  0LL,  0LL,  @"copyfile of %@ to %@ failed: %s",  v15,  (uint64_t)v12);
    id v21 = (id)objc_claimAutoreleasedReturnValue(v16);
    BOOL v11 = 0LL;
    if (!a4) {
      goto LABEL_14;
    }
  }

  else
  {
    int v10 = *__error();
    BOOL v11 = v10 == 2;
    if (v10 == 2)
    {
      id v21 = 0LL;
      if (!a4) {
        goto LABEL_14;
      }
    }

    else
    {
      unint64_t v17 = *__error();
      id v18 = __error();
      strerror(*v18);
      id v20 = sub_10003556C( (uint64_t)"IXCopyItemAtURL",  106LL,  NSPOSIXErrorDomain,  v17,  0LL,  0LL,  @"stat of %@ failed: %s",  v19,  (uint64_t)v9);
      id v21 = (id)objc_claimAutoreleasedReturnValue(v20);
      if (!a4) {
        goto LABEL_14;
      }
    }
  }

  if (!v11)
  {
    id v21 = v21;
    BOOL v11 = 0LL;
    *a4 = v21;
  }

BOOL IXItemExistsAtURL(void *a1, BOOL *a2, void *a3)
{
  id v5 = a1;
  int v6 = lstat((const char *)[v5 fileSystemRepresentation], &v15);
  if (v6)
  {
    unint64_t v7 = *__error();
    if ((_DWORD)v7 != 2)
    {
      id v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = strerror(v7);
        *(_DWORD *)buf = 136315650;
        unint64_t v17 = "IXItemExistsAtURL";
        __int16 v18 = 2112;
        id v19 = v5;
        __int16 v20 = 2080;
        id v21 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to determine if %@ exists: %s",  buf,  0x20u);
      }
    }

    if (a3)
    {
      id v11 = [v5 fileSystemRepresentation];
      strerror(v7);
      id v13 = sub_10003556C( (uint64_t)"IXItemExistsAtURL",  155LL,  NSPOSIXErrorDomain,  v7,  0LL,  0LL,  @"lstat of %s failed: %s",  v12,  (uint64_t)v11);
      *a3 = (id)objc_claimAutoreleasedReturnValue(v13);
    }
  }

  else if (a2)
  {
    *a2 = (v15.st_mode & 0xF000) == 0x4000;
  }

  return v6 == 0;
}

BOOL IXCreateDirectoryAtURL(void *a1, int a2, mode_t a3, uint64_t a4, void *a5)
{
  id v9 = a1;
  int v10 = (const char *)[v9 fileSystemRepresentation];
  if (a2)
  {
    int v11 = mkpath_np(v10, a3);
    if (v11)
    {
      int v12 = v11;
      if (v11 != 17)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
        strerror(v12);
        id v15 = sub_10003556C( (uint64_t)"IXCreateDirectoryAtURL",  171LL,  NSPOSIXErrorDomain,  v12,  0LL,  0LL,  @"mkpath_np of %@ failed: %s",  v14,  (uint64_t)v13);
        id v16 = (id)objc_claimAutoreleasedReturnValue(v15);

        goto LABEL_15;
      }
    }
  }

  else if (mkdir(v10, a3) && *__error() != 17)
  {
    unint64_t v28 = *__error();
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
    id v30 = __error();
    strerror(*v30);
    id v32 = sub_10003556C( (uint64_t)"IXCreateDirectoryAtURL",  177LL,  NSPOSIXErrorDomain,  v28,  0LL,  0LL,  @"mkdir of %@ failed: %s",  v31,  (uint64_t)v29);
LABEL_14:
    id v16 = (id)objc_claimAutoreleasedReturnValue(v32);

LABEL_15:
    BOOL v22 = 0LL;
    if (!a5) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }

  if ((_DWORD)a4 == -1)
  {
    id v16 = 0LL;
    BOOL v22 = 1LL;
    goto LABEL_21;
  }

  id v17 = v9;
  __int16 v18 = opendir((const char *)[v17 fileSystemRepresentation]);
  if (!v18)
  {
    unint64_t v33 = *__error();
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v17 path]);
    uint64_t v34 = __error();
    strerror(*v34);
    id v32 = sub_10003556C( (uint64_t)"IXCreateDirectoryAtURL",  189LL,  NSPOSIXErrorDomain,  v33,  0LL,  0LL,  @"opendir of %@ failed: %s",  v35,  (uint64_t)v29);
    goto LABEL_14;
  }

  id v19 = v18;
  int v20 = dirfd(v18);
  int v21 = fcntl(v20, 64, a4);
  BOOL v22 = v21 == 0;
  if (v21)
  {
    unint64_t v23 = *__error();
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v17 path]);
    unint64_t v25 = __error();
    strerror(*v25);
    id v27 = sub_10003556C( (uint64_t)"IXCreateDirectoryAtURL",  195LL,  NSPOSIXErrorDomain,  v23,  0LL,  0LL,  @"Failed to setclass(%d) on directory %@: %s",  v26,  a4);
    id v16 = (id)objc_claimAutoreleasedReturnValue(v27);
  }

  else
  {
    id v16 = 0LL;
  }

  closedir(v19);
  if (a5)
  {
LABEL_19:
    if (!v22)
    {
      id v16 = v16;
      BOOL v22 = 0LL;
      *a5 = v16;
    }
  }

LABEL_21:
  return v22;
}

id IXUrlsForItemsInDirectoryAtURL(void *a1, char a2, void *a3)
{
  id v5 = a1;
  int v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  uint64_t v34 = sub_100034424;
  uint64_t v35 = &unk_1000CDEF8;
  char v38 = a2;
  id v36 = v5;
  unint64_t v7 = v6;
  id v37 = v7;
  id v8 = v36;
  id v9 = v33;
  unint64_t v39 = 0LL;
  id v10 = v8;
  int v11 = open((const char *)[v10 fileSystemRepresentation], 1048832);
  if ((v11 & 0x80000000) == 0)
  {
    int v12 = fdopendir(v11);
    if (v12)
    {
      id v13 = v12;
      uint64_t v31 = v7;
      id v32 = a3;
      while (1)
      {
        int v14 = readdir_r(v13, &v41, &v39);
        if (v14 || !v39)
        {
LABEL_17:
          closedir(v13);
          unint64_t v7 = v31;
          a3 = v32;
          goto LABEL_19;
        }

        id v15 = objc_autoreleasePoolPush();
        id v16 = v39;
        if (!v39->d_type) {
          break;
        }
LABEL_16:
        char v24 = v34((uint64_t)v9, (uint64_t)v16);
        objc_autoreleasePoolPop(v15);
        if ((v24 & 1) == 0) {
          goto LABEL_17;
        }
      }

      uint64_t d_namlen = v39->d_namlen;
      id v18 = v10;
      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFileSystemRepresentation:length:]( &OBJC_CLASS___NSString,  "stringWithFileSystemRepresentation:length:",  v16->d_name,  d_namlen));
      int v20 = (void *)objc_claimAutoreleasedReturnValue([v18 URLByAppendingPathComponent:v19 isDirectory:0]);

      id v21 = v20;
      if (!lstat((const char *)[v21 fileSystemRepresentation], &v40))
      {
        int v22 = v40.st_mode & 0xF000;
        switch(v22)
        {
          case 16384:
            char v23 = 4;
            goto LABEL_14;
          case 32768:
            char v23 = 8;
            goto LABEL_14;
          case 40960:
            char v23 = 10;
LABEL_14:
            v16->d_type = v23;
            break;
        }
      }

      id v16 = v39;
      goto LABEL_16;
    }
  }

  int v14 = *__error();
LABEL_19:

  if (v14)
  {
    id v25 = [v10 fileSystemRepresentation];
    strerror(v14);
    id v27 = sub_10003556C( (uint64_t)"IXUrlsForItemsInDirectoryAtURL",  298LL,  NSPOSIXErrorDomain,  v14,  0LL,  0LL,  @"_IterateDirectory for %s returned %s",  v26,  (uint64_t)v25);
    unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    id v29 = 0LL;
    if (!a3) {
      goto LABEL_25;
    }
  }

  else
  {
    id v29 = -[NSMutableArray copy](v7, "copy");
    unint64_t v28 = 0LL;
    if (!a3) {
      goto LABEL_25;
    }
  }

  if (!v29) {
    *a3 = v28;
  }
LABEL_25:

  return v29;
}

uint64_t sub_100034424(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v4 = (const char *)(a2 + 21);
  if (strcmp((const char *)(a2 + 21), ".") && strcmp(v4, ".."))
  {
    if (*(_BYTE *)(a2 + 20) == 10 && *(_BYTE *)(a1 + 48))
    {
      id v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
      int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_10007EB40(a1, (uint64_t)v4, v6);
      }
    }

    else
    {
      unint64_t v7 = *(void **)(a1 + 32);
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFileSystemRepresentation:length:]( &OBJC_CLASS___NSString,  "stringWithFileSystemRepresentation:length:",  v4,  *(unsigned __int16 *)(a2 + 18)));
      int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( [v7 URLByAppendingPathComponent:v8 isDirectory:*(unsigned __int8 *)(a2 + 20) == 4]);

      if (v6)
      {
        [*(id *)(a1 + 40) addObject:v6];
      }

      else
      {
        id v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) path]);
          int v13 = 136315650;
          int v14 = "IXUrlsForItemsInDirectoryAtURL_block_invoke";
          __int16 v15 = 2080;
          id v16 = v4;
          __int16 v17 = 2112;
          id v18 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to create URL by appending %s to %@",  (uint8_t *)&v13,  0x20u);
        }
      }
    }
  }

  return 1LL;
}

id IXCreateTemporaryDirectoryInDirectoryURL(void *a1, void *a2)
{
  id v3 = objc_claimAutoreleasedReturnValue( [a1 URLByAppendingPathComponent:@"temp.XXXXXX" isDirectory:1]);
  unsigned __int8 v4 = strdup((const char *)[v3 fileSystemRepresentation]);
  if (mkdtemp(v4))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v4,  1LL,  0LL));
    int v6 = 0LL;
    if (!a2) {
      goto LABEL_7;
    }
  }

  else
  {
    unint64_t v7 = __error();
    id v9 = sub_10003556C( (uint64_t)"IXCreateTemporaryDirectoryInDirectoryURL",  321LL,  NSPOSIXErrorDomain,  *v7,  0LL,  0LL,  @"Failed to create temp dir at path %s",  v8,  (uint64_t)v4);
    int v6 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v5 = 0LL;
    if (!a2) {
      goto LABEL_7;
    }
  }

  if (!v5) {
    *a2 = v6;
  }
LABEL_7:
  free(v4);

  return v5;
}

id sub_100034B1C()
{
  if (qword_1000E8F38 != -1) {
    dispatch_once(&qword_1000E8F38, &stru_1000CDF18);
  }
  return (id)qword_1000E8F30;
}

void sub_100034B5C(id a1)
{
  int v6 = objc_opt_new(&OBJC_CLASS___IXSInstallProgressServer);
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.installcoordination.IXSInstallProgressServer", v2);

  id v4 = [[IPProgressServer alloc] initWithDelegate:v6 delegateQueue:v3];
  id v5 = (void *)qword_1000E8F30;
  qword_1000E8F30 = (uint64_t)v4;
}

void sub_100034D90(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = @"pause";
      int v7 = *(unsigned __int8 *)(a1 + 32);
      id v9 = "-[IXSInstallProgressServer _setIsPaused:forIdentity:]_block_invoke";
      int v8 = 136315650;
      __int16 v10 = 2112;
      if (!v7) {
        int v6 = @"resume";
      }
      int v11 = v6;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to %@ coordinator, ignoring request: %@",  (uint8_t *)&v8,  0x20u);
    }
  }
}

id sub_100035028(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
  -[NSKeyedArchiver encodeObject:forKey:](v4, "encodeObject:forKey:", v3, NSKeyedArchiveRootObjectKey);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v4, "encodedData"));

  if (a2 && !v5) {
    *a2 = 0LL;
  }

  return v5;
}

id sub_1000353B4( uint64_t a1, uint64_t a2, void *a3, unint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v17) {
    id v19 = (NSMutableDictionary *)[v17 mutableCopy];
  }
  else {
    id v19 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }
  int v20 = v19;
  id v21 = IXStringForIXError(v15, a4);
  int v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v22,  NSLocalizedFailureReasonErrorKey);

  if (v18)
  {
    char v23 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v18,  a8);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v23,  NSLocalizedDescriptionKey);
  }

  if (v16) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v16, NSUnderlyingErrorKey);
  }
  char v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v24, @"FunctionName");

  id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a2));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v25, @"SourceFileLine");

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v15,  a4,  v20));
  return v26;
}

id sub_10003556C( uint64_t a1, uint64_t a2, void *a3, unint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  id v9 = sub_1000353B4(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue(v9);
}

void sub_10003560C(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  id v2 = (void *)qword_1000E8F40;
  qword_1000E8F40 = (uint64_t)v1;
}

LABEL_36:
  return v33;
}
}

uint64_t sub_100036430(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v4 = *(unsigned __int16 *)(a2 + 88);
  uint64_t result = 1LL;
  BOOL v6 = v4 > 0xC;
  int v7 = (1 << v4) & 0x110A;
  if (!v6 && v7 != 0)
  {
    __int16 v10 = *(const char **)(a2 + 48);
    if (lchmod(v10, *(_WORD *)(a1 + 32)))
    {
      int v11 = *__error();
      unint64_t v12 = *__error();
      strerror(v11);
      id v14 = sub_10003556C( (uint64_t)"-[IXFileManager setPermissions:onAllChildrenOfPath:error:]_block_invoke",  325LL,  NSPOSIXErrorDomain,  v12,  0LL,  0LL,  @"Failed to lchmod %s to mode 0%o : %s",  v13,  (uint64_t)v10);
      id v15 = (id)objc_claimAutoreleasedReturnValue(v14);
      uint64_t result = 0LL;
      *a3 = v15;
    }

    else
    {
      return 1LL;
    }
  }

  return result;
}

uint64_t sub_1000366B8(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v4 = *(unsigned __int16 *)(a2 + 88);
  uint64_t result = 1LL;
  BOOL v6 = v4 >= 8;
  BOOL v8 = v4 == 8;
  int v7 = (1 << v4) & 0x10A;
  BOOL v8 = !v8 && v6 || v7 == 0;
  if (!v8)
  {
    __int16 v10 = *(const char **)(a2 + 48);
    int v11 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10007F138((uint64_t)v10, v12);
    }

    if (!acl_set_link_np(v10, ACL_TYPE_EXTENDED, *(acl_t *)(a1 + 32))) {
      return 1LL;
    }
    unint64_t v14 = *__error();
    if (*(_BYTE *)(a1 + 40))
    {
      id v15 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        int v20 = "-[IXFileManager copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:]_block_invoke";
        __int16 v21 = 2080;
        int v22 = strerror(v14);
        __int16 v23 = 2080;
        char v24 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%s: Ignoring error %s from acl_set_link_np for %s",  buf,  0x20u);
      }

      return 1LL;
    }

    id v17 = sub_10003556C( (uint64_t)"-[IXFileManager copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:]_block_invoke",  384LL,  NSPOSIXErrorDomain,  v14,  0LL,  0LL,  @"acl_set_link_np for %s failed",  v13,  (uint64_t)v10);
    id v18 = (id)objc_claimAutoreleasedReturnValue(v17);
    uint64_t result = 0LL;
    *a3 = v18;
  }

  return result;
}

LABEL_8:
      uint64_t v26 = 0LL;
      id v27 = 1;
LABEL_14:
      close(v13);
      uint64_t v31 = v27;
      goto LABEL_15;
    }

    unint64_t v14 = fcntl(v12, 63);
    if ((v14 & 0x80000000) == 0)
    {
      if (!v10[2](v10, v14)) {
        goto LABEL_8;
      }
      goto LABEL_5;
    }

    id v19 = NSPOSIXErrorDomain;
    int v20 = *__error();
    unint64_t v28 = [v11 fileSystemRepresentation];
    id v29 = __error();
    unint64_t v33 = (uint64_t)v28;
    strerror(*v29);
    char v24 = @"Failed to getclass of file %s: %s";
    id v25 = 538LL;
  }

  id v18 = sub_10003556C( (uint64_t)"-[IXFileManager setDataProtectionClassOfItemAtURL:toClass:ifPredicate:error:]",  v25,  v19,  v20,  0LL,  0LL,  v24,  v23,  v33);
LABEL_11:
  id v30 = (void *)objc_claimAutoreleasedReturnValue(v18);
  uint64_t v26 = v30;
  if (a6) {
    *a6 = v30;
  }
  id v27 = 0;
  uint64_t v31 = 0;
  if ((v13 & 0x80000000) == 0) {
    goto LABEL_14;
  }
LABEL_15:

  return v31;
}
}

    goto LABEL_9;
  }

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[IXSErrorPresenter sharedPresenter](&OBJC_CLASS___IXSErrorPresenter, "sharedPresenter"));
  [v8 presentErrorForIdentity:v7 code:a4 underlyingError:0 errorSource:0];

LABEL_9:
}

LABEL_49:
        goto LABEL_24;
      }

LABEL_25:
              char v24 = 0LL;
LABEL_26:
              if (v22 == 2)
              {
                if ((v6[3] & 2) != 0 && !*v19)
                {
                  id v46 = sub_1000047B4((uint64_t)off_1000E8CA0);
                  id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 136315650;
                    __int128 v70 = "-[IXFileManager _diskUsageForDirectoryURL:]";
                    __int128 v71 = 2112;
                    __int128 v72 = (char *)v64;
                    __int128 v73 = 2080;
                    __int128 v74 = v21;
                    _os_log_debug_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "%s: skipping empty directory at %@/%s",  buf,  0x20u);
                  }

                  goto LABEL_55;
                }

                if (!v21)
                {
                  uint64_t v42 = sub_1000047B4((uint64_t)off_1000E8CA0);
                  id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    __int128 v70 = "-[IXFileManager _diskUsageForDirectoryURL:]";
                    __int128 v71 = 2048;
                    __int128 v72 = v13;
                    __int128 v73 = 2112;
                    __int128 v74 = (char *)v64;
                    id v30 = v27;
                    uint64_t v31 = "%s: Failed to get name for directory item %llu in %@; not counting its children";
                    id v32 = 32;
LABEL_45:
                    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v31, buf, v32);
                  }

                  goto LABEL_55;
                }

                unint64_t v33 = objc_autoreleasePoolPush();
                uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFileSystemRepresentation:length:]( &OBJC_CLASS___NSString,  "stringWithFileSystemRepresentation:length:",  v21,  (v20 - 1)));
                uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v64 stringByAppendingPathComponent:v34]);

                if (v35)
                {
                  [v5 addObject:v35];
                }

                else
                {
                  id v44 = sub_1000047B4((uint64_t)off_1000E8CA0);
                  __int16 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    __int128 v70 = "-[IXFileManager _diskUsageForDirectoryURL:]";
                    __int128 v71 = 2080;
                    __int128 v72 = v21;
                    __int128 v73 = 2112;
                    __int128 v74 = (char *)v64;
                    _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to create path to child directory by appending %s to %@",  buf,  0x20u);
                  }
                }

                uint64_t v43 = v33;
                goto LABEL_52;
              }

              if ((v18 & 1) != 0)
              {
                char v38 = *v19++;
                id v36 = v38;
                if ((v18 & 4) != 0)
                {
LABEL_34:
                  id v37 = *(void *)v19;
                  goto LABEL_37;
                }
              }

              else
              {
                id v36 = 0;
                if ((v18 & 4) != 0) {
                  goto LABEL_34;
                }
              }

              id v37 = 0LL;
LABEL_37:
              if (v36 != 1)
              {
                __int128 v62 = objc_autoreleasePoolPush();
                unint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v24));
                if ([v61 containsObject:v39])
                {
                  stat v40 = sub_1000047B4((uint64_t)off_1000E8CA0);
                  dirent v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 136315650;
                    __int128 v70 = "-[IXFileManager _diskUsageForDirectoryURL:]";
                    __int128 v71 = 2112;
                    __int128 v72 = (char *)v64;
                    __int128 v73 = 2080;
                    __int128 v74 = v21;
                    _os_log_debug_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEBUG,  "%s: Skipping hardlinked file at %@/%s",  buf,  0x20u);
                  }
                }

                else
                {
                  v63 += v37;
                  [v61 addObject:v39];
                }

                uint64_t v43 = v62;
LABEL_52:
                objc_autoreleasePoolPop(v43);
                goto LABEL_56;
              }

              v63 += v37;
LABEL_56:
              BOOL v6 = (int *)((char *)v6 + v17);
              ++v13;
              if (!--v15) {
                goto LABEL_10;
              }
            }
          }
        }

        id v51 = sub_1000047B4((uint64_t)off_1000E8CA0);
        __int16 v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v53 = __error();
          id v54 = strerror(*v53);
          *(_DWORD *)buf = 136315906;
          __int128 v70 = "-[IXFileManager _diskUsageForDirectoryURL:]";
          __int128 v71 = 2048;
          __int128 v72 = v13;
          __int128 v73 = 2112;
          __int128 v74 = (char *)v64;
          __int128 v75 = 2080;
          __int128 v76 = v54;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "%s: getattrlistbulk on entry %llu in %@ returned error %s",  buf,  0x2Au);
        }

LABEL_64:
        close(v60);
        unsigned int v4 = v61;
        __int16 v10 = v59;
      }

      objc_autoreleasePoolPop(v10);
      if (![v5 count]) {
        goto LABEL_68;
      }
    }
  }

  __int128 v63 = 0LL;
LABEL_68:
  free(v6);

  return v63;
}

void sub_100038C14( void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
}

  ;
}

  ;
}

  ;
}

int *sub_100038C64()
{
  return __error();
}

char *sub_100038C6C(int *a1)
{
  return strerror(*a1);
}

int *sub_100038C74()
{
  return __error();
}

void sub_10003969C(id a1)
{
  id v1 = dlopen("/System/Library/PrivateFrameworks/CloudDocs.framework/CloudDocs", 1);
  qword_1000E8F50 = (uint64_t)v1;
  if (v1)
  {
    off_1000E8F58 = dlsym(v1, "BREntitledContainerIdentifiersForPropertyList");
    if (off_1000E8F58) {
      return;
    }
    id v2 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      int v7 = "-[IXSUninstallAlert appHasiCloudDataOrDocuments]_block_invoke";
      __int16 v8 = 2080;
      id v9 = dlerror();
      unsigned int v4 = "%s: No CloudDocs entitlement checking because BREntitledContainerIdentifiersForPropertyList function was not found: %s";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v6, 0x16u);
    }
  }

  else
  {
    id v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      int v7 = "-[IXSUninstallAlert appHasiCloudDataOrDocuments]_block_invoke";
      __int16 v8 = 2080;
      id v9 = dlerror();
      unsigned int v4 = "%s: No CloudDocs entitlement checking because CloudDocs framework failed to open: %s";
      goto LABEL_7;
    }
  }
}

id sub_10003A218(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_onMainQueue_displayAlertWithCompletion:uninstallAlertConfiguration:",  *(void *)(a1 + 48),  *(void *)(a1 + 40));
}

void sub_10003A3E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", *(void *)(a1 + 32)));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  id v10 = 0LL;
  unsigned __int8 v6 = [v5 openSensitiveURL:v4 withOptions:0 error:&v10];
  id v7 = v10;

  if ((v6 & 1) == 0)
  {
    __int16 v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10007F5C8();
    }
  }

  v3[2](v3, 1LL, 0LL);
}

void sub_10003A8BC(id a1, id a2)
{
}

id sub_10003A8D0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) otherButtonActionWithCompletion:a2];
}

id sub_10003A8DC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) otherButtonActionWithCompletion:a2];
}

void sub_10003A8E8(id a1, id a2)
{
}

void sub_10003A8FC(id a1, id a2)
{
}

void sub_10003A910(id a1, id a2)
{
}

void sub_10003A924(id a1, id a2)
{
}

void sub_10003A938(id a1, id a2)
{
}

void sub_10003A94C(id a1, id a2)
{
}

void sub_10003A960(id a1, id a2)
{
}

void sub_10003AC60( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

__CFString *IXStringForUninstallDisposition(unint64_t a1)
{
  if (a1 >= 5) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown uninstall disposition: %lu",  a1));
  }
  else {
    return off_1000CE148[a1];
  }
}

void sub_10003AEF0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10003AF08(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10003AF18(uint64_t a1)
{
}

void sub_10003AF20(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stagingBaseDir]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@"Data.data" isDirectory:0]);

  uint64_t v4 = a1 + 48;
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id obj = *(id *)(v6 + 40);
  unsigned __int8 v7 = [v5 writeToURL:v3 options:268435457 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if ((v7 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_internal_setStagedPath:", v3);
    [*(id *)(a1 + 32) setComplete:1];
  }

  else
  {
    __int16 v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10007F640(v3, v4, v9);
    }

    id v10 = *(void **)(*(void *)(*(void *)v4 + 8LL) + 40LL);
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
    id v13 = sub_10003556C( (uint64_t)"-[IXSPromisedInMemoryData initWithSeed:data:error:]_block_invoke",  58LL,  @"IXErrorDomain",  1uLL,  v10,  0LL,  @"Could not write data promise data to disk at %@",  v12,  (uint64_t)v11);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);

    uint64_t v15 = *(void *)(*(void *)v4 + 8LL);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

__CFString *IXStringForCoordinatorScope(unsigned int a1)
{
  if (a1 >= 3) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown IXCoordinatorScope value %hhu",  a1));
  }
  else {
    return off_1000CE170[(char)a1];
  }
}

void sub_10003BE68(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  id v2 = (void *)qword_1000E8F68;
  qword_1000E8F68 = (uint64_t)v1;
}

NSUUID *sub_10003C27C(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 componentsSeparatedByString:@"/"]);
  id v2 = v1;
  if (v1 && [v1 count] == (id)2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectAtIndexedSubscript:1]);
    uint64_t v4 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v3);
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return v4;
}

id sub_10003C304(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleNextTask];
}

void sub_10003C378(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_onQueue_dequeueInstallTask"));
  [*(id *)(a1 + 32) setScheduledInstallIsRunning:0];
  if (v2)
  {
    id v3 = *(void **)(a1 + 32);
    id v8 = 0LL;
    unsigned __int8 v4 = objc_msgSend(v3, "_onQueue_scheduleUpdateRequestForTask:error:", v2, &v8);
    id v5 = v8;
    if ((v4 & 1) == 0)
    {
      uint64_t v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
      unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        id v10 = "-[IXSAppUpdateScheduler _scheduleNextTask]_block_invoke";
        __int16 v11 = 2112;
        uint64_t v12 = v2;
        __int16 v13 = 2112;
        id v14 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to schedule install task %@ : %@. Executing it right away.",  buf,  0x20u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_onQueue_invokeInstallerForTask:", v2);
    }
  }
}

void sub_10003C610(uint64_t a1, void *a2)
{
  id v3 = off_1000E8CA0;
  id v4 = a2;
  id v5 = sub_1000047B4((uint64_t)v3);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v16 = "-[IXSAppUpdateScheduler _onQueue_registerUpdateRequestForTask:]_block_invoke";
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Running opportunistic install for: %@",  buf,  0x16u);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10003C7B4;
  v13[3] = &unk_1000CCE58;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v14 = v8;
  [v4 setExpirationHandler:v13];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) internalQueue]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10003C878;
  v11[3] = &unk_1000CCCB8;
  void v11[4] = *(void *)(a1 + 40);
  id v12 = v8;
  id v10 = v8;
  sub_10005A8F0(v9, v11);

  [v4 setTaskCompleted];
}

void sub_10003C7B4(uint64_t a1)
{
  id v2 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 136315394;
    uint64_t v6 = "-[IXSAppUpdateScheduler _onQueue_registerUpdateRequestForTask:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s: Expiration handler invoked for %@",  (uint8_t *)&v5,  0x16u);
  }
}

id sub_10003C878(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) scheduledInstallCount];
  if (result) {
    return objc_msgSend( *(id *)(a1 + 32),  "setScheduledInstallCount:",  (char *)objc_msgSend(*(id *)(a1 + 32), "scheduledInstallCount") - 1);
  }
  return result;
}

void sub_10003CDD4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10003CDF8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10003CE08(uint64_t a1)
{
}

void sub_10003CE10(uint64_t a1)
{
  id v2 = sub_10003CF9C(*(void **)(a1 + 32));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(*(id *)(a1 + 40), "_onQueue_registerUpdateRequestForTask:", v3);
  if ([*(id *)(a1 + 40) scheduledInstallCount]
    || [*(id *)(a1 + 40) scheduledInstallIsRunning])
  {
    objc_msgSend(*(id *)(a1 + 40), "_onQueue_enqueueInstallTask:", v3);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

  else
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id obj = *(id *)(v5 + 40);
    unsigned __int8 v6 = objc_msgSend(v4, "_onQueue_scheduleUpdateRequestForTask:error:", v3, &obj);
    objc_storeStrong((id *)(v5 + 40), obj);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v6;
    if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
    {
      __int16 v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
        *(_DWORD *)buf = 136315650;
        id v12 = "-[IXSAppUpdateScheduler scheduleUpdateInstallForCoordinatorUUID:error:]_block_invoke";
        __int16 v13 = 2112;
        id v14 = v3;
        __int16 v15 = 2112;
        uint64_t v16 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to schedule install for %@; running immediately (scheduling error: %@)",
          buf,
          0x20u);
      }

      objc_msgSend(*(id *)(a1 + 40), "_onQueue_invokeInstallerForTask:", v3);
    }
  }
}

id sub_10003CF9C(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 UUIDString]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.installcoordination/%@",  v1));

  return v2;
}

void sub_10003D08C(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  id v3 = sub_10003CF9C(*(void **)(a1 + 32));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
  unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10007F8B8((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
  }

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 taskRequestForIdentifier:v4]);
  if (v14)
  {
    if (([v13 deregisterTaskWithIdentifier:v4] & 1) == 0)
    {
      __int16 v15 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = 136315394;
        id v29 = "-[IXSAppUpdateScheduler removeUpdateRequestForCoordinatorUUID:]_block_invoke";
        __int16 v30 = 2112;
        uint64_t v31 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to cancel the request for %@",  (uint8_t *)&v28,  0x16u);
      }
    }

    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) queuedInstalls]);
    unsigned int v18 = [v17 containsObject:v4];

    id v19 = *(void **)(a1 + 40);
    if (v18)
    {
      objc_msgSend(v19, "_onQueue_removeEnqueuedTask:", v4);
    }

    else if ([v19 scheduledInstallCount])
    {
      objc_msgSend( *(id *)(a1 + 40),  "setScheduledInstallCount:",  (char *)objc_msgSend(*(id *)(a1 + 40), "scheduledInstallCount") - 1);
    }
  }

  else
  {
    int v20 = sub_1000047B4((uint64_t)off_1000E8CA0);
    __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_10007F838(v2, v21, v22, v23, v24, v25, v26, v27);
    }
  }
}

id sub_10003E024(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 104LL) = 0LL;
  *(void *)(*(void *)(a1 + 32) + 120LL) = 0LL;
  *(void *)(*(void *)(a1 + 32) + 112LL) = 0LL;
  *(void *)(*(void *)(a1 + 32) + 128LL) = 0LL;
  *(void *)(*(void *)(a1 + 32) + 184LL) = 1LL;
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_internal_saveState");
}

void sub_10003E9C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10003E9E8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10003E9F8(uint64_t a1)
{
}

void sub_10003EA00(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
  uint64_t v4 = *((void *)v2[1] + 1);
  id obj = *(id *)(v4 + 40);
  unsigned __int8 v5 = [v3 resolvePersonaWithError:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);

  if ((v5 & 1) == 0)
  {
    unsigned __int8 v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*v2 identity]);
      *(_DWORD *)buf = 136315394;
      v212 = "-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke";
      __int16 v213 = 2112;
      v214 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to resolve persona for %@",  buf,  0x16u);
    }
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*v2 placeholderPromiseUUID]);

  p_info = &OBJC_METACLASS___IXSInstallProgressServer.info;
  if (v9)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*v2 placeholderPromiseUUID]);
    id v13 = [v11 promiseForUUID:v12 ofType:objc_opt_class(IXSPlaceholder)];
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    __int16 v15 = (id *)*v2;
    if (v14)
    {
      objc_storeStrong(v15 + 3, v14);
      uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 accessQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10003FB8C;
      block[3] = &unk_1000CCCB8;
      __int16 v17 = v14;
      id v18 = *v2;
      v207 = v17;
      id v208 = v18;
      dispatch_sync(v16, block);

      id v19 = v207;
    }

    else
    {
      unint64_t v20 = (unint64_t)v15[39] & 0xFFFFFFFFFFFFFFFDLL;
      __int16 v21 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      id v19 = v22;
      if (v20 == 4)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([*v2 placeholderPromiseUUID]);
          *(_DWORD *)buf = 136315394;
          v212 = "-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke";
          __int16 v213 = 2112;
          v214 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s: Unable to find placeholder promise with UUID %@; proceeding because it's not needed",
            buf,
            0x16u);
        }
      }

      else
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_10007FCA8();
        }

        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) identity]);
        v168 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) placeholderPromiseUUID]);
        id v26 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke",  841LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"%@: Failed to locate IXSPlaceholder instance with UUID %@ after deserialization",  v25,  (uint64_t)v24);
        uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);

        uint64_t v28 = *(void *)(*(void *)(v1 + 48) + 8LL);
        id v19 = *(os_log_s **)(v28 + 40);
        *(void *)(v28 + 40) = v27;
      }
    }

    p_info = &OBJC_METACLASS___IXSInstallProgressServer.info;
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue([*v2 appAssetPromiseUUID]);

  if (v29)
  {
    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([*v2 appAssetPromiseUUID]);
    id v32 = [v30 promiseForUUID:v31 ofType:objc_opt_class(IXSOwnedDataPromise)];
    unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

    if (v33)
    {
      objc_storeStrong((id *)*v2 + 4, v33);
      uint64_t v34 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v33 accessQueue]);
      v203[0] = _NSConcreteStackBlock;
      v203[1] = 3221225472LL;
      v203[2] = sub_10003FB94;
      v203[3] = &unk_1000CCCB8;
      id v35 = v33;
      id v36 = *v2;
      id v204 = v35;
      id v205 = v36;
      dispatch_sync(v34, v203);

      id v37 = v204;
    }

    else
    {
      char v38 = sub_1000047B4((uint64_t)off_1000E8CA0);
      unint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_10007FC10();
      }

      stat v40 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) identity]);
      v169 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) appAssetPromiseUUID]);
      id v42 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke",  857LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"%@: Failed to locate app asset promise with UUID %@ after deserialization",  v41,  (uint64_t)v40);
      uint64_t v43 = objc_claimAutoreleasedReturnValue(v42);

      uint64_t v44 = *(void *)(*(void *)(v1 + 48) + 8LL);
      id v37 = *(void **)(v44 + 40);
      *(void *)(v44 + 40) = v43;
    }

    p_info = &OBJC_METACLASS___IXSInstallProgressServer.info;
  }

  __int16 v45 = (void *)objc_claimAutoreleasedReturnValue([*v2 initialODRAssetPromiseUUIDs]);

  uint64_t v174 = v1;
  v175 = v2;
  if (v45)
  {
    id v46 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v199 = 0u;
    __int128 v200 = 0u;
    __int128 v201 = 0u;
    __int128 v202 = 0u;
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([*v2 initialODRAssetPromiseUUIDs]);
    id v48 = [v47 countByEnumeratingWithState:&v199 objects:v219 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v200;
      do
      {
        id v51 = 0LL;
        do
        {
          if (*(void *)v200 != v50) {
            objc_enumerationMutation(v47);
          }
          uint64_t v52 = *(void *)(*((void *)&v199 + 1) + 8LL * (void)v51);
          uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
          id v54 = [v53 promiseForUUID:v52 ofType:objc_opt_class(IXSOpaqueDataPromise)];
          id v55 = (void *)objc_claimAutoreleasedReturnValue(v54);

          if (v55)
          {
            -[NSMutableArray addObject:](v46, "addObject:", v55);
            __int128 v56 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v55 accessQueue]);
            v196[0] = _NSConcreteStackBlock;
            v196[1] = 3221225472LL;
            v196[2] = sub_10003FB9C;
            v196[3] = &unk_1000CCCB8;
            id v57 = v55;
            id v58 = *v2;
            id v197 = v57;
            id v198 = v58;
            dispatch_sync(v56, v196);

            __int128 v59 = v197;
          }

          else
          {
            id v60 = sub_1000047B4((uint64_t)off_1000E8CA0);
            __int128 v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            {
              __int128 v67 = (void *)objc_claimAutoreleasedReturnValue([*v175 identity]);
              *(_DWORD *)buf = 136315906;
              v212 = "-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke";
              __int16 v213 = 2112;
              v214 = v67;
              __int16 v215 = 2112;
              uint64_t v216 = v52;
              __int16 v217 = 2112;
              uint64_t v218 = 0LL;
              _os_log_error_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_ERROR,  "%s: %@: Failed to locate initial ODR promise instance with UUID %@ after deserialization : %@",  buf,  0x2Au);
            }

            __int128 v62 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v174 + 32) identity]);
            id v64 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke",  872LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"%@: Failed to locate initial ODR promise instance with UUID %@ after deserialization",  v63,  (uint64_t)v62);
            uint64_t v65 = objc_claimAutoreleasedReturnValue(v64);

            uint64_t v66 = *(void *)(*(void *)(v174 + 48) + 8LL);
            __int128 v59 = *(void **)(v66 + 40);
            *(void *)(v66 + 40) = v65;
            uint64_t v2 = v175;
            p_info = &OBJC_METACLASS___IXSInstallProgressServer.info;
          }

          id v51 = (char *)v51 + 1;
        }

        while (v49 != v51);
        id v49 = [v47 countByEnumeratingWithState:&v199 objects:v219 count:16];
      }

      while (v49);
    }

    id v68 = -[NSMutableArray copy](v46, "copy");
    __int16 v69 = (void *)*((void *)*v2 + 6);
    *((void *)*v2 + 6) = v68;

    uint64_t v1 = v174;
  }

  __int128 v70 = (void *)objc_claimAutoreleasedReturnValue([*v2 userDataPromiseUUID]);

  if (v70)
  {
    __int128 v71 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
    __int128 v72 = v2;
    __int128 v73 = (void *)objc_claimAutoreleasedReturnValue([*v2 userDataPromiseUUID]);
    id v74 = [v71 promiseForUUID:v73 ofType:objc_opt_class(IXSPromisedOutOfBandTransfer)];
    __int128 v75 = (void *)objc_claimAutoreleasedReturnValue(v74);

    if (v75)
    {
      objc_storeStrong((id *)*v72 + 7, v75);
      __int128 v76 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v75 accessQueue]);
      v193[0] = _NSConcreteStackBlock;
      v193[1] = 3221225472LL;
      v193[2] = sub_10003FBA4;
      v193[3] = &unk_1000CCCB8;
      id v77 = v75;
      id v78 = *v72;
      id v194 = v77;
      id v195 = v78;
      dispatch_sync(v76, v193);

      __int128 v79 = v194;
      uint64_t v2 = v72;
    }

    else
    {
      __int128 v80 = sub_1000047B4((uint64_t)off_1000E8CA0);
      __int128 v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
        sub_10007FB78();
      }

      __int16 v82 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) identity]);
      v170 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) userDataPromiseUUID]);
      id v84 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke",  887LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"%@: Failed to locate user data promise with UUID %@ after deserialization",  v83,  (uint64_t)v82);
      uint64_t v85 = objc_claimAutoreleasedReturnValue(v84);

      uint64_t v86 = *(void *)(*(void *)(v1 + 48) + 8LL);
      __int128 v79 = *(void **)(v86 + 40);
      *(void *)(v86 + 40) = v85;
      uint64_t v2 = v175;
    }

    p_info = &OBJC_METACLASS___IXSInstallProgressServer.info;
  }

  v87 = (void *)objc_claimAutoreleasedReturnValue([*v2 preparationPromiseUUID]);

  if (v87)
  {
    __int16 v88 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
    v89 = v2;
    v90 = (void *)objc_claimAutoreleasedReturnValue([*v2 preparationPromiseUUID]);
    id v91 = [v88 promiseForUUID:v90 ofType:objc_opt_class(IXSPromisedOutOfBandTransfer)];
    __int16 v92 = (void *)objc_claimAutoreleasedReturnValue(v91);

    if (v92)
    {
      objc_storeStrong((id *)*v89 + 9, v92);
      v93 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v92 accessQueue]);
      v190[0] = _NSConcreteStackBlock;
      v190[1] = 3221225472LL;
      v190[2] = sub_10003FBAC;
      v190[3] = &unk_1000CCCB8;
      id v94 = v92;
      id v95 = *v89;
      id v191 = v94;
      id v192 = v95;
      dispatch_sync(v93, v190);

      v96 = v191;
      uint64_t v2 = v89;
    }

    else
    {
      v97 = sub_1000047B4((uint64_t)off_1000E8CA0);
      __int16 v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
      if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR)) {
        sub_10007FAE0();
      }

      v99 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) identity]);
      v171 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) preparationPromiseUUID]);
      id v101 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke",  900LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"%@: Failed to locate preparation promise with UUID %@ after deserialization",  v100,  (uint64_t)v99);
      uint64_t v102 = objc_claimAutoreleasedReturnValue(v101);

      uint64_t v103 = *(void *)(*(void *)(v1 + 48) + 8LL);
      v96 = *(void **)(v103 + 40);
      *(void *)(v103 + 40) = v102;
      uint64_t v2 = v175;
    }

    p_info = &OBJC_METACLASS___IXSInstallProgressServer.info;
  }

  v104 = (void *)objc_claimAutoreleasedReturnValue([*v2 installOptionsPromiseUUID]);

  if (v104)
  {
    v105 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
    v106 = v2;
    v107 = (void *)objc_claimAutoreleasedReturnValue([*v2 installOptionsPromiseUUID]);
    id v108 = [v105 promiseForUUID:v107 ofType:objc_opt_class(IXSOwnedDataPromise)];
    v109 = (void *)objc_claimAutoreleasedReturnValue(v108);

    if (v109)
    {
      objc_storeStrong((id *)*v106 + 10, v109);
      v110 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v109 accessQueue]);
      v187[0] = _NSConcreteStackBlock;
      v187[1] = 3221225472LL;
      v187[2] = sub_10003FBB4;
      v187[3] = &unk_1000CCCB8;
      id v111 = v109;
      id v112 = *v106;
      id v188 = v111;
      id v189 = v112;
      dispatch_sync(v110, v187);

      v113 = v188;
      uint64_t v2 = v106;
    }

    else
    {
      v114 = sub_1000047B4((uint64_t)off_1000E8CA0);
      v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
        sub_10007FA48();
      }

      v116 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) identity]);
      v172 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) installOptionsPromiseUUID]);
      id v118 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke",  913LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"%@: Failed to locate install options promise with UUID %@ after deserialization",  v117,  (uint64_t)v116);
      uint64_t v119 = objc_claimAutoreleasedReturnValue(v118);

      uint64_t v120 = *(void *)(*(void *)(v1 + 48) + 8LL);
      v113 = *(void **)(v120 + 40);
      *(void *)(v120 + 40) = v119;
      uint64_t v2 = v175;
    }

    p_info = &OBJC_METACLASS___IXSInstallProgressServer.info;
  }

  v121 = (void *)objc_claimAutoreleasedReturnValue([*v2 deviceSecurityPromiseUUID]);

  if (v121)
  {
    v122 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
    v123 = v2;
    v124 = (void *)objc_claimAutoreleasedReturnValue([*v2 deviceSecurityPromiseUUID]);
    id v125 = [v122 promiseForUUID:v124 ofType:objc_opt_class(IXSPromisedOutOfBandTransfer)];
    v126 = (void *)objc_claimAutoreleasedReturnValue(v125);

    if (v126)
    {
      objc_storeStrong((id *)*v123 + 8, v126);
      v127 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v126 accessQueue]);
      v184[0] = _NSConcreteStackBlock;
      v184[1] = 3221225472LL;
      v184[2] = sub_10003FBBC;
      v184[3] = &unk_1000CCCB8;
      id v128 = v126;
      id v129 = *v123;
      id v185 = v128;
      id v186 = v129;
      dispatch_sync(v127, v184);

      v130 = v185;
      uint64_t v2 = v123;
    }

    else
    {
      v131 = sub_1000047B4((uint64_t)off_1000E8CA0);
      v132 = (os_log_s *)objc_claimAutoreleasedReturnValue(v131);
      if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR)) {
        sub_10007F9B0();
      }

      v133 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) identity]);
      v173 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) deviceSecurityPromiseUUID]);
      id v135 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke",  926LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"%@: Failed to locate device security promise with UUID %@ after deserialization",  v134,  (uint64_t)v133);
      uint64_t v136 = objc_claimAutoreleasedReturnValue(v135);

      uint64_t v137 = *(void *)(*(void *)(v1 + 48) + 8LL);
      v130 = *(void **)(v137 + 40);
      *(void *)(v137 + 40) = v136;
      uint64_t v2 = v175;
    }

    p_info = &OBJC_METACLASS___IXSInstallProgressServer.info;
  }

  v138 = (void *)objc_claimAutoreleasedReturnValue([*v2 essentialAssetPromiseUUIDs]);

  if (v138)
  {
    v139 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v180 = 0u;
    __int128 v181 = 0u;
    __int128 v182 = 0u;
    __int128 v183 = 0u;
    v140 = (void *)objc_claimAutoreleasedReturnValue([*v2 essentialAssetPromiseUUIDs]);
    id v141 = [v140 countByEnumeratingWithState:&v180 objects:v210 count:16];
    if (v141)
    {
      id v142 = v141;
      uint64_t v143 = *(void *)v181;
      do
      {
        v144 = 0LL;
        do
        {
          if (*(void *)v181 != v143) {
            objc_enumerationMutation(v140);
          }
          uint64_t v145 = *(void *)(*((void *)&v180 + 1) + 8LL * (void)v144);
          v146 = (void *)objc_claimAutoreleasedReturnValue([p_info + 171 sharedInstance]);
          id v147 = [v146 promiseForUUID:v145 ofType:objc_opt_class(IXSOpaqueDataPromise)];
          v148 = (void *)objc_claimAutoreleasedReturnValue(v147);

          if (v148)
          {
            -[NSMutableArray addObject:](v139, "addObject:", v148);
            v149 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v148 accessQueue]);
            v177[0] = _NSConcreteStackBlock;
            v177[1] = 3221225472LL;
            v177[2] = sub_10003FBC4;
            v177[3] = &unk_1000CCCB8;
            id v150 = v148;
            id v151 = *v2;
            id v178 = v150;
            id v179 = v151;
            dispatch_sync(v149, v177);

            v152 = v178;
          }

          else
          {
            v153 = sub_1000047B4((uint64_t)off_1000E8CA0);
            v154 = (os_log_s *)objc_claimAutoreleasedReturnValue(v153);
            if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
            {
              v160 = (void *)objc_claimAutoreleasedReturnValue([*v175 identity]);
              *(_DWORD *)buf = 136315906;
              v212 = "-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke";
              __int16 v213 = 2112;
              v214 = v160;
              __int16 v215 = 2112;
              uint64_t v216 = v145;
              __int16 v217 = 2112;
              uint64_t v218 = 0LL;
              _os_log_error_impl( (void *)&_mh_execute_header,  v154,  OS_LOG_TYPE_ERROR,  "%s: %@: Failed to locate essential asset promise instance with UUID %@ after deserialization : %@",  buf,  0x2Au);
            }

            v155 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v174 + 32) identity]);
            id v157 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall awakeFromSerializationWithError:]_block_invoke",  956LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"%@: Failed to locate essential asset promise instance with UUID %@ after deserialization",  v156,  (uint64_t)v155);
            uint64_t v158 = objc_claimAutoreleasedReturnValue(v157);

            uint64_t v159 = *(void *)(*(void *)(v174 + 48) + 8LL);
            v152 = *(void **)(v159 + 40);
            *(void *)(v159 + 40) = v158;
            uint64_t v2 = v175;
            p_info = (__objc2_class_ro **)(&OBJC_METACLASS___IXSInstallProgressServer + 32);
          }

          v144 = (char *)v144 + 1;
        }

        while (v142 != v144);
        id v142 = [v140 countByEnumeratingWithState:&v180 objects:v210 count:16];
      }

      while (v142);
    }

    id v161 = -[NSMutableArray copy](v139, "copy");
    v162 = (void *)*((void *)*v2 + 11);
    *((void *)*v2 + 11) = v161;

    uint64_t v1 = v174;
  }

  id v163 = sub_100034B1C();
  v164 = (void *)objc_claimAutoreleasedReturnValue(v163);
  v165 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) identity]);
  v166 = (void *)objc_claimAutoreleasedReturnValue([v164 resumeProgressForIdentity:v165]);
  [*(id *)(v1 + 32) setPublishedInstallProgress:v166];

  if (!*(void *)(*(void *)(*(void *)(v1 + 48) + 8LL) + 40LL)
    && !*(void *)(*(void *)(*(void *)(v1 + 40) + 8LL) + 40LL))
  {
    v167 = (void *)objc_claimAutoreleasedReturnValue([*v175 internalQueue]);
    v176[0] = _NSConcreteStackBlock;
    v176[1] = 3221225472LL;
    v176[2] = sub_10003FBCC;
    v176[3] = &unk_1000CCE58;
    v176[4] = *v175;
    sub_10005A8F0(v167, v176);
  }

id sub_10003FB8C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

id sub_10003FB94(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

id sub_10003FB9C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

id sub_10003FBA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

id sub_10003FBAC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

id sub_10003FBB4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

id sub_10003FBBC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

id sub_10003FBC4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

id sub_10003FBCC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_checkState");
}

id sub_10003FE54(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onAssertionQueue_setTermAssertion:", *(void *)(a1 + 40));
}

id sub_10003FECC(uint64_t a1)
{
  uint64_t v2 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 136315394;
    uint64_t v7 = "-[IXSCoordinatedAppInstall handleFirstUnlockNotification]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s: Handling first unlock for %@",  (uint8_t *)&v6,  0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_checkState");
}

LABEL_46:
        unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall appAssetPromise](self, "appAssetPromise", v56));
        uint64_t v34 = v33;
        if (v33)
        {
          __int128 v81 = 0LL;
          __int16 v82 = &v81;
          uint64_t v83 = 0x2020000000LL;
          id v84 = 0;
          id v35 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v33 accessQueue]);
          v67[0] = _NSConcreteStackBlock;
          v67[1] = 3221225472LL;
          v67[2] = sub_100040924;
          v67[3] = &unk_1000CCEF8;
          __int16 v69 = &v81;
          id v36 = v34;
          id v68 = v36;
          dispatch_sync(v35, v67);

          LOBYTE(v35) = *((_BYTE *)v82 + 24) == 0;
          _Block_object_dispose(&v81, 8);
          if ((v35 & 1) != 0)
          {
            uint64_t v4 = 14LL;
          }

          else
          {
            id v37 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall installOptionsPromise](self, "installOptionsPromise"));
            char v38 = v37 == 0LL;

            if (v38)
            {
              uint64_t v4 = 15LL;
            }

            else
            {
              if (!v57)
              {
LABEL_53:
                if ((id)-[IXSCoordinatedAppInstall updateScheduleState](self, "updateScheduleState") != (id)1)
                {
                  uint64_t v4 = 17LL;
                  switch(v7)
                  {
                    case 0uLL:
                      goto LABEL_63;
                    case 1uLL:
                    case 2uLL:
                      uint64_t v4 = 19LL;
                      goto LABEL_63;
                    case 3uLL:
                      uint64_t v4 = 21LL;
                      goto LABEL_63;
                    case 4uLL:

                      goto LABEL_36;
                    default:
                      id v54 = sub_1000047B4((uint64_t)off_1000E8CA0);
                      id v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
                      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
                        sub_10007FEB8();
                      }

                      uint64_t v4 = 1LL;
                      goto LABEL_63;
                  }
                }

                uint64_t v4 = 18LL;
                goto LABEL_63;
              }

              unint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall deviceSecurityPromise](self, "deviceSecurityPromise"));
              stat v40 = v39;
              if (!v39) {
                goto LABEL_52;
              }
              __int128 v81 = 0LL;
              __int16 v82 = &v81;
              uint64_t v83 = 0x2020000000LL;
              id v84 = 0;
              uint64_t v41 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v39 accessQueue]);
              v64[0] = _NSConcreteStackBlock;
              v64[1] = 3221225472LL;
              v64[2] = sub_100040954;
              v64[3] = &unk_1000CCEF8;
              uint64_t v66 = &v81;
              id v42 = v40;
              uint64_t v65 = v42;
              dispatch_sync(v41, v64);

              LOBYTE(v41) = *((_BYTE *)v82 + 24) == 0;
              _Block_object_dispose(&v81, 8);
              if ((v41 & 1) == 0)
              {
LABEL_52:

                goto LABEL_53;
              }

              uint64_t v4 = 16LL;
            }
          }
        }

        else
        {
          uint64_t v4 = 13LL;
        }

void sub_100040848( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

id sub_100040890(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

id sub_1000408C0(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

id sub_1000408F0(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  return result;
}

id sub_100040924(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

id sub_100040954(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

id sub_100040984(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  return result;
}

void sub_100040D98( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_100040DC8(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appReference]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_10004134C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setComplete:1];
}

id sub_100041358(uint64_t a1)
{
  return [*(id *)(a1 + 32) setComplete:1];
}

void sub_100041498( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000414B0(uint64_t a1)
{
}

void sub_1000415CC(uint64_t a1)
{
  uint64_t v2 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) outstandingInstallOperationsGroup]);
  dispatch_group_leave(v2);
}

id sub_1000421E8(uint64_t a1)
{
  id result = (id)dispatch_source_testcancel(*(dispatch_source_t *)(a1 + 32));
  if (!result)
  {
    uint64_t v3 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 136315394;
      uint64_t v7 = "-[IXSCoordinatedAppInstall _onQueue_handleAssertionAcquisitionFailureForPlaceholder:withError:]_block_invoke";
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: Retrying assertion for %@",  (uint8_t *)&v6,  0x16u);
    }

    return objc_msgSend(*(id *)(a1 + 40), "_onQueue_acquireAssertionForPlaceholder:", *(unsigned __int8 *)(a1 + 48));
  }

  return result;
}

id sub_10004258C(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 40),  "_onQueue_handleAssertionAcquisitionFailureForPlaceholder:withError:",  *(unsigned __int8 *)(a1 + 56),  *(void *)(a1 + 48));
}

LABEL_52:
  return v42;
}

void sub_100042DC0(uint64_t a1, void *a2)
{
  if (!*(_BYTE *)(a1 + 48))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a2 objectForKeyedSubscript:kMICallbackPercentCompleteKey]);
    id v4 = [v3 unsignedLongValue];
    uint64_t v5 = *(void **)(a1 + 32);
    if (v5)
    {
      [v5 setTotalUnitCount:100];
      [*(id *)(a1 + 32) setCompletedUnitCount:v4];
    }

    int v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) internalQueue]);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100042E88;
    v7[3] = &unk_1000CCBD8;
    void v7[4] = *(void *)(a1 + 40);
    v7[5] = v4;
    sub_10005A8F0(v6, v7);
  }

id sub_100042E88(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) coordinatorProgress]);
  [v2 setTotalUnits:100];

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) coordinatorProgress]);
  [v4 setTotalUnitsCompleted:v3];

  return objc_msgSend( *(id *)(a1 + 32),  "_onQueue_setInstallProgressPercentComplete:forPhase:",  1,  (double)*(unint64_t *)(a1 + 40) / 100.0);
}

id sub_100042F00(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2) {
    return objc_msgSend(v3, "_onQueue_finishProgress:", v4);
  }
  else {
    return objc_msgSend(v3, "_onQueue_cancelProgress:", v4);
  }
}

void sub_100043270( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

void sub_1000432A0(uint64_t a1)
{
  int v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assertionQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100043314;
  block[3] = &unk_1000CCE58;
  void block[4] = *(void *)(a1 + 32);
  dispatch_sync(v2, block);
}

id sub_100043314(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) needsPostProcessing];
  return result;
}

uint64_t sub_100043350(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  id v8 = a2;
  id v9 = objc_alloc_init(&OBJC_CLASS___LSOperationRequestContext);
  uint64_t v10 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", geteuid());
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v9 setTargetUserID:v11];

  if (!*(_BYTE *)(a1 + 72) && [*(id *)(a1 + 32) effectiveIntent] == (id)2)
  {
    uint64_t v12 = *(void **)(a1 + 40);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleID]);
    id v40 = 0LL;
    unsigned __int8 v15 = [v12 sendNotificationOfType:0 forApplicationWithBundleIdentifier:v14 requestContext:v9 error:&v40];
    id v16 = v40;

    if ((v15 & 1) != 0) {
      goto LABEL_12;
    }
    __int16 v17 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10008035C();
    }
LABEL_10:

    goto LABEL_11;
  }

  if ([*(id *)(a1 + 32) effectiveIntent] == (id)6)
  {
    id v19 = *(void **)(a1 + 40);
    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 bundleID]);
    id v39 = 0LL;
    unsigned __int8 v22 = [v19 sendNotificationOfType:1 forApplicationWithBundleIdentifier:v21 requestContext:v9 error:&v39];
    id v16 = v39;

    if ((v22 & 1) != 0) {
      goto LABEL_12;
    }
    uint64_t v23 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100080400();
    }
    goto LABEL_10;
  }

void sub_100043660(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleID]);
  id v5 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall _limitedConcurrency_installApplication:isPlaceholder:options:retries:error:]_block_invoke",  1982LL,  @"IXErrorDomain",  0x36uLL,  0LL,  0LL,  @"Testing preemptive cancelation of coordinator for %@",  v4,  (uint64_t)v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_internal_cancelForReason:client:", v6, 15);
}

void sub_100043C34(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 objectForKeyedSubscript:@"CACHE_DELETE_ERROR"]);
  if (v4)
  {
    id v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleID]);
      int v8 = 136315650;
      id v9 = "-[IXSCoordinatedAppInstall _finishPlaceholderInstallAtURL:result:recordPromise:error:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to purge cache for app with bundleID '%@': %@",  (uint8_t *)&v8,  0x20u);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id sub_100043D50(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTermAssertion:0];
}

id sub_100043D5C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_handleCancelForInstallFailure:", *(void *)(a1 + 40));
}

void sub_100043D68(uint64_t a1)
{
  int v2 = (id *)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) placeholderFailureInfo]);

  if (v3)
  {
    id v4 = *v2;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*v2 placeholderFailureInfo]);
    id v6 = [v5 installType];
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*v2 placeholderFailureInfo]);
    id v8 = [v7 reason];
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*v2 placeholderFailureInfo]);
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 underlyingError]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*v2 placeholderFailureInfo]);
    objc_msgSend( v4,  "_asyncUpdatePlaceholderMetadataWithInstallType:reason:underlyingError:client:",  v6,  v8,  v10,  objc_msgSend(v11, "client"));

    [*v2 setPlaceholderFailureInfo:0];
  }

  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([*v2 error]);

  if (v12)
  {
    id v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = *v2;
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = "-[IXSCoordinatedAppInstall _finishPlaceholderInstallAtURL:result:recordPromise:error:]_block_invoke_2";
      __int16 v24 = 2112;
      id v25 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Placeholder install completed successfully but coordinator was canceled while install was in flight; ignoring",
        buf,
        0x16u);
    }
  }

  else
  {
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([*v2 placeholderPromise]);
    id v14 = v16;
    if (v16)
    {
      __int16 v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[os_log_s accessQueue](v16, "accessQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100043FE0;
      block[3] = &unk_1000CCE58;
      __int16 v21 = v14;
      dispatch_sync(v17, block);
    }

    else
    {
      id v18 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000805BC();
      }
    }

    [*(id *)(a1 + 32) setPlaceholderInstallState:4 withLSRecordPromiseForCompletion:*(void *)(a1 + 40)];
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_checkState");
  }
}

id sub_100043FE0(uint64_t a1)
{
  return [*(id *)(a1 + 32) setStagedPathMayNotExistWhenAwakening:1];
}

void sub_100044F88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, char a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, char a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, char a50)
{
}

void sub_100045004(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) isComplete];
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stagedPath]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) metadata]);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) installType];
  uint64_t v8 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sinfData]);
  uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8LL);
  __int16 v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

id sub_1000450A4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_internal_cancelForReason:client:", *(void *)(a1 + 40), 15);
}

void sub_1000450B4(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "_limitedConcurrency_installApplication:isPlaceholder:options:retries:error:",  v2,  1,  v4,  5,  &v7));
  id v6 = v7;
  [*(id *)(a1 + 32) _finishPlaceholderInstallAtURL:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) result:v5 != 0 recordPromise:v5 error:v6];
  [*(id *)(a1 + 48) invalidate];
}

void sub_100045730( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100045768(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stagedPath]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

LABEL_29:
      BOOL v26 = IXCreateUserPresentableError(v8, 0, v27);
      __int16 v12 = (id)objc_claimAutoreleasedReturnValue(v26);
LABEL_30:
      id v13 = 17LL;
      break;
  }

        objc_autoreleasePoolPop(v11);
      }

      uint64_t v8 = [obj countByEnumeratingWithState:&v64 objects:v75 count:16];
      if (!v8)
      {
LABEL_31:

        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472LL;
        v61[2] = sub_10005B5F0;
        v61[3] = &unk_1000CE8A8;
        v61[4] = self;
        id v37 = objc_retainBlock(v61);
        char v38 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromiseManager uuidToPromiseMap](self, "uuidToPromiseMap"));
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472LL;
        v59[2] = sub_10005B604;
        v59[3] = &unk_1000CE8D0;
        id v39 = v37;
        id v60 = v39;
        [v38 enumerateKeysAndObjectsUsingBlock:v59];

        goto LABEL_43;
      }
    }
  }

  id v40 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  if ([v40 isEqualToString:NSPOSIXErrorDomain])
  {
    uint64_t v41 = [v5 code] == (id)2;

    if (v41)
    {
      id v42 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
      id v58 = v5;
      uint64_t v43 = [v42 createDirectoryAtURL:v52 withIntermediateDirectories:1 mode:493 class:4 error:&v58];
      uint64_t v44 = v58;

      if ((v43 & 1) == 0)
      {
        __int16 v45 = sub_1000047B4((uint64_t)off_1000E8CA0);
        id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v52 path]);
          *(_DWORD *)buf = 136315650;
          __int128 v70 = "-[IXSDataPromiseManager _onQueue_restoreSavedPromises]";
          __int128 v71 = 2112;
          __int128 v72 = v47;
          __int128 v73 = 2112;
          id v74 = v44;
          _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to create promise save directory at %@: %@",  buf,  0x20u);
        }
      }

      uint64_t v5 = v44;
      goto LABEL_43;
    }
  }

  else
  {
  }

  id v48 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int128 v70 = "-[IXSDataPromiseManager _onQueue_restoreSavedPromises]";
    __int128 v71 = 2112;
    __int128 v72 = v52;
    __int128 v73 = 2112;
    id v74 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to get list of saved promises from %@ : %@",  buf,  0x20u);
  }

LABEL_43:
  if (!self->_uuidToPromiseMap)
  {
    uint64_t v50 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    id v51 = self->_uuidToPromiseMap;
    self->_uuidToPromiseMap = v50;
  }

id sub_100045E70(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_handleCancelForInstallFailure:", *(void *)(a1 + 40));
}

void sub_100045E9C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);

  if (v2)
  {
    uint64_t v3 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 136315394;
      id v7 = "-[IXSCoordinatedAppInstall _finishAppInstallAtURL:result:recordPromise:error:]_block_invoke_2";
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: %@: App completed installation successfully but coordinator was canceled while install was in flight; ignoring.",
        (uint8_t *)&v6,
        0x16u);
    }
  }

  else
  {
    [*(id *)(a1 + 32) setCompletedRecordPromise:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setAppInstallState:4];
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveState");
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_checkState");
  }

void sub_100046190( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_1000461AC(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appReference]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_1000461E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) markAppReferenceAsConsumed];
}

void sub_1000467E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_100046818(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stagedPath]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) targetLastPathComponent]);
  if (v5)
  {
    int v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) path]);
      int v12 = 136315650;
      id v13 = "-[IXSCoordinatedAppInstall _onQueue_doInstall]_block_invoke";
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      __int16 v17 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Updating the promise path from %@ based on the last path component for the target %@",  (uint8_t *)&v12,  0x20u);
    }

    uint64_t v9 = objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) URLByAppendingPathComponent:v5 isDirectory:1]);
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

void sub_10004696C(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 8);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(v3 + 16) + 8LL) + 40LL);
  id v17 = 0LL;
  int v6 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v2,  "_limitedConcurrency_installApplication:isPlaceholder:options:retries:error:",  v5,  0,  v4,  5,  &v17));
  id v7 = v17;
  if (*(_BYTE *)(v3 + 24)) {
    __int16 v8 = 0LL;
  }
  else {
    __int16 v8 = v6;
  }
  if (*(_BYTE *)(v3 + 24)) {
    BOOL v9 = v6 == 0LL;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)v3 identity]);
    id v11 = [*(id *)v3 installationDomain];
    id v16 = 0LL;
    int v12 = sub_100013648(v10, (uint64_t)v11, &v16);
    __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v13 = v16;

    if (!v8)
    {
      __int16 v14 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100080CB4();
      }
    }
  }

  [*(id *)(a1 + 32) _finishAppInstallAtURL:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) result:v6 != 0 recordPromise:v8 error:v7];
}

id sub_100047518(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_client_coordinatorDidRegisterForObservationWithUUID:", *(void *)(a1 + 40));
}

void sub_100047524(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) error]);
  objc_msgSend( v2,  "_client_coordinatorWithUUID:didCancelWithReason:client:",  v3,  v4,  objc_msgSend(*(id *)(a1 + 48), "errorSourceIdentifier"));
}

id sub_100047584(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_client_coordinatorDidCompleteSuccessfullyWithUUID:forRecordPromise:",  *(void *)(a1 + 40),  *(void *)(a1 + 48));
}

BOOL sub_100047594(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000LL;
    char v12 = 0;
    uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v1 accessQueue]);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100058384;
    v6[3] = &unk_1000CCEF8;
    __int16 v8 = &v9;
    id v7 = v2;
    dispatch_sync(v3, v6);

    BOOL v4 = *((_BYTE *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }

  else
  {
    BOOL v4 = 0LL;
  }

  return v4;
}

void sub_10004766C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100047684(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:",  *(void *)(a1 + 40),  1);
}

id sub_100047694(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:",  *(void *)(a1 + 40),  2);
}

id sub_1000476A4(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_client_coordinatorShouldBeginRestoringUserDataWithUUID:",  *(void *)(a1 + 40));
}

id sub_1000476B0(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_client_coordinatorShouldBeginPostProcessingWithUUID:forRecordPromise:",  *(void *)(a1 + 40),  *(void *)(a1 + 48));
}

id sub_1000476C0(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:",  *(void *)(a1 + 40),  3);
}

id sub_1000476D0(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:",  *(void *)(a1 + 40),  4);
}

id sub_1000476E0(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:",  *(void *)(a1 + 40),  5);
}

id sub_1000476F0(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:",  *(void *)(a1 + 40),  6);
}

id sub_100047700(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:",  *(void *)(a1 + 40),  8);
}

id sub_100047710(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_client_coordinatorDidInstallPlaceholderWithUUID:forRecordPromise:",  *(void *)(a1 + 40),  0);
}

id sub_100047720(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_client_coordinatorShouldPauseWithUUID:", *(void *)(a1 + 40));
}

id sub_10004772C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_client_coordinatorShouldResumeWithUUID:", *(void *)(a1 + 40));
}

LABEL_16:
}

void sub_100047A58(void *a1, void *a2, uint64_t a3)
{
  id v7 = a1;
  id v5 = a2;
  if (v7)
  {
    int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 accessQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000583EC;
    block[3] = &unk_1000CD358;
    id v9 = v7;
    id v10 = v5;
    uint64_t v11 = a3;
    dispatch_sync(v6, block);
  }
}

id sub_100047B18(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) supersede];
}

id sub_100047B24(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setDelegate:");
}

id sub_100047C5C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) supersede];
}

id sub_100047C68(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setDelegate:");
}

id sub_1000483FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

void sub_100048404(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uniqueIdentifier]);
  LOBYTE(v2) = [v2 containsObject:v3];
}

id sub_1000486A4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) supersede];
}

id sub_1000486B0(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setDelegate:");
}

id sub_1000488FC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) supersede];
}

id sub_100048908(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "setDelegate:");
}

id sub_100048AF0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) supersede];
}

id sub_100048AFC(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "setDelegate:");
}

id sub_100048C34(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) supersede];
}

id sub_100048C40(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "setDelegate:");
}

id sub_1000493D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
}

void sub_1000493DC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uniqueIdentifier]);
  LOBYTE(v2) = [v2 containsObject:v3];
}

uint64_t sub_100049674(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100049684(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IXSAppInstallObserverManager sharedInstance]( &OBJC_CLASS___IXSAppInstallObserverManager,  "sharedInstance"));
  BOOL v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v2) {
    [v3 coordinatorShouldPause:v5];
  }
  else {
    [v3 coordinatorShouldResume:v5];
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0LL);
  }
  return result;
}

id sub_100049798(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsPaused:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

void sub_10004984C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100049864(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isPaused];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

uint64_t sub_100049FA4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10004A164( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_10004A214(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_prioritizeWithCompletion:", *(void *)(a1 + 40));
}

uint64_t sub_10004A488(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_10004A498(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue( +[IXSAppInstallObserverManager sharedInstance]( &OBJC_CLASS___IXSAppInstallObserverManager,  "sharedInstance"));
  [v2 coordinatorShouldPrioritize:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0LL);
  }
  return result;
}

void sub_10004ABD0(_Unwind_Exception *a1)
{
}

void sub_10004AC00(uint64_t a1)
{
  int v2 = (id *)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
  uint64_t v28 = kMIUninstallParallelPlaceholderKey;
  id v29 = &__kCFBooleanTrue;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
  uint64_t v5 = IXStringForClientID((unint64_t)[*v2 creator]);
  int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Parallel placeholder cleanup for %@ after post processing, creator: %@",  v3,  v6));

  id v21 = 0LL;
  char v8 = sub_100011D44(v3, v4, v7, (uint64_t)&v21);
  id v9 = v21;
  if ((v8 & 1) == 0)
  {
    id v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v23 = "-[IXSCoordinatedAppInstall setComplete:]_block_invoke";
      __int16 v24 = 2112;
      id v25 = v3;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to uninstall parallel placeholder %@: %@",  buf,  0x20u);
    }
  }

  sub_100012CC0(@"Resync after uninstalling parallel placeholder");
  id v12 = [*(id *)(a1 + 32) installationDomain];
  id v20 = 0LL;
  id v13 = sub_100013648(v3, (uint64_t)v12, &v20);
  uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
  id v15 = v20;
  uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v14;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    id v18 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100080E38();
    }
  }
}

void sub_10004AE48(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v3 = v1;
    int v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v1 accessQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000583E4;
    block[3] = &unk_1000CCE58;
    id v5 = v3;
    dispatch_sync(v2, block);

    id v1 = v3;
  }
}

void sub_10004AED4(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[IXSAppInstallObserverManager sharedInstance]( &OBJC_CLASS___IXSAppInstallObserverManager,  "sharedInstance"));
  [v2 coordinatorDidCompleteSuccessfully:*(void *)(a1 + 32) forRecordPromise:*(void *)(a1 + 40)];
}

void sub_10004B0BC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleID]);
  uint64_t updated = MobileInstallationUpdatePlaceholderMetadata( v3,  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(void *)(a1 + 40),  *(void *)(a1 + 64));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(updated);

  if (v5)
  {
    int v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      char v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
      int v9 = 136315650;
      id v10 = "-[IXSCoordinatedAppInstall _asyncUpdatePlaceholderMetadataWithInstallType:reason:underlyingError:client:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to update placeholder metadata for %@ : %@",  (uint8_t *)&v9,  0x20u);
    }
  }
}

void sub_10004B770(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[IXSAppInstallObserverManager sharedInstance]( &OBJC_CLASS___IXSAppInstallObserverManager,  "sharedInstance"));
  [v2 coordinatorShouldBeginRestoringUserData:*(void *)(a1 + 32)];
}

void sub_10004B8C8(uint64_t a1)
{
  uint64_t v17 = kMIUninstallParallelPlaceholderKey;
  id v18 = &__kCFBooleanTrue;
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
  BOOL v4 = *(void **)(a1 + 40);
  id v10 = 0LL;
  char v5 = sub_100011D44(v3, v2, v4, (uint64_t)&v10);
  id v6 = v10;

  if ((v5 & 1) == 0)
  {
    id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
    char v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
      *(_DWORD *)buf = 136315650;
      id v12 = "-[IXSCoordinatedAppInstall _onQueue_removeParallelPlaceholder:]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to uninstall parallel placeholder %@: %@",  buf,  0x20u);
    }
  }
}

void sub_10004BB88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10004BBA4(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) metadata]);
  if (v2)
  {
    id v3 = v2;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 deviceBasedVPP];
    id v2 = v3;
  }
}

void sub_10004BF38(uint64_t a1)
{
  id v19 = @"UninstallPlaceholdersOnly";
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 48)));
  id v20 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
  char v5 = *(void **)(a1 + 40);
  id v12 = 0LL;
  char v6 = sub_100011D44(v4, v3, v5, (uint64_t)&v12);
  id v7 = v12;

  if ((v6 & 1) == 0)
  {
    char v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleID]);
      *(_DWORD *)buf = 136315650;
      uint64_t v14 = "-[IXSCoordinatedAppInstall _onQueue_cancelPlaceholderIfNeededForReason:client:needsLSDatabaseSync:]_block_invoke";
      __int16 v15 = 2112;
      id v16 = v11;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to uninstall placeholder %@: %@",  buf,  0x20u);
    }
  }
}

void sub_10004C1C8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

id sub_10004C1E0(uint64_t a1)
{
  id result = objc_msgSend( *(id *)(a1 + 32),  "_onQueue_internal_cancelForReason:client:needsLSDatabaseSync:error:",  *(void *)(a1 + 40),  *(void *)(a1 + 56),  *(void *)(a1 + 64),  *(void *)(a1 + 72));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

LABEL_58:
    id v10 = v28;
    goto LABEL_59;
  }

  id v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
  __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v111 = "-[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:needsLSDatabaseSync:error:]";
    id v112 = 2112;
    v113 = v9;
    v114 = 2112;
    v115 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s: Ignoring cancel request with reason %@ for coordinator that was already canceled: %@",  buf,  0x20u);
  }

  id v18 = 0LL;
  id v19 = 0LL;
  id v20 = 0LL;
  id v21 = 0LL;
  unsigned __int8 v22 = 0LL;
  uint64_t v23 = 0LL;
LABEL_59:

  return v9 != 0LL;
}

void sub_10004CECC(void *a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[IXSAppInstallObserverManager sharedInstance]( &OBJC_CLASS___IXSAppInstallObserverManager,  "sharedInstance"));
  [v2 coordinator:a1[4] canceledWithReason:a1[5] client:a1[6]];
}

uint64_t sub_10004D51C(unint64_t a1)
{
  if (a1 < 7) {
    return (0xEu >> a1) & 1;
  }
  id v3 = sub_1000047B4((uint64_t)off_1000E8CA0);
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    char v6 = "_IsPendingInstallState";
    __int16 v7 = 2048;
    unint64_t v8 = a1;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: Unknown install state: %lu",  (uint8_t *)&v5,  0x16u);
  }

  return 0LL;
}

void sub_10004D80C(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[IXSAppInstallObserverManager sharedInstance]( &OBJC_CLASS___IXSAppInstallObserverManager,  "sharedInstance"));
  [v2 coordinatorDidInstallPlaceholder:*(void *)(a1 + 32) forRecordPromise:*(void *)(a1 + 40)];
}

void sub_10004D850(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[IXSAppInstallObserverManager sharedInstance]( &OBJC_CLASS___IXSAppInstallObserverManager,  "sharedInstance"));
  [v2 coordinatorShouldBeginRestoringUserData:*(void *)(a1 + 32)];
}

uint64_t sub_10004DA24(void *a1, char a2, char a3, char a4)
{
  id v7 = a1;
  unint64_t v8 = v7;
  if (v7)
  {
    uint64_t v14 = 0LL;
    __int16 v15 = &v14;
    uint64_t v16 = 0x2020000000LL;
    char v17 = 0;
    int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 accessQueue]);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100058444;
    v11[3] = &unk_1000CCEF8;
    __int16 v13 = &v14;
    id v12 = v8;
    dispatch_sync(v9, v11);

    if (*((_BYTE *)v15 + 24)) {
      a4 = a2;
    }
    else {
      a4 = a3;
    }

    _Block_object_dispose(&v14, 8);
  }

  return a4;
}

void sub_10004DB08( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10004E1EC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appAssetPromise]);

  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appAssetPromise]);
    BOOL v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 accessQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004E640;
    block[3] = &unk_1000CCCB8;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 32);
    id v63 = v5;
    uint64_t v64 = v6;
    dispatch_sync(v4, block);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) placeholderPromise]);

  if (v7)
  {
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) placeholderPromise]);
    int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 accessQueue]);
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472LL;
    v59[2] = sub_10004E6CC;
    v59[3] = &unk_1000CCCB8;
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 32);
    id v60 = v10;
    uint64_t v61 = v11;
    dispatch_sync(v9, v59);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) initialODRAssetPromises]);

  if (v12)
  {
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) initialODRAssetPromises]);
    id v14 = [v13 countByEnumeratingWithState:&v55 objects:v65 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v56;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v56 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
          id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v18 accessQueue]);
          v52[0] = _NSConcreteStackBlock;
          v52[1] = 3221225472LL;
          v52[2] = sub_10004E758;
          v52[3] = &unk_1000CCCB8;
          id v53 = *(id *)(a1 + 40);
          id v54 = v18;
          dispatch_sync(v19, v52);
        }

        id v15 = [v13 countByEnumeratingWithState:&v55 objects:v65 count:16];
      }

      while (v15);
    }
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) userDataPromise]);

  if (v20)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) userDataPromise]);
    unsigned __int8 v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v21 accessQueue]);
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_10004E7C4;
    v49[3] = &unk_1000CCCB8;
    id v23 = *(id *)(a1 + 40);
    uint64_t v24 = *(void *)(a1 + 32);
    id v50 = v23;
    uint64_t v51 = v24;
    dispatch_sync(v22, v49);
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceSecurityPromise]);

  if (v25)
  {
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceSecurityPromise]);
    id v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v26 accessQueue]);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_10004E850;
    v46[3] = &unk_1000CCCB8;
    id v28 = *(id *)(a1 + 40);
    uint64_t v29 = *(void *)(a1 + 32);
    id v47 = v28;
    uint64_t v48 = v29;
    dispatch_sync(v27, v46);
  }

  id v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) preparationPromise]);

  if (v30)
  {
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) preparationPromise]);
    uint64_t v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v31 accessQueue]);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_10004E8DC;
    v43[3] = &unk_1000CCCB8;
    id v33 = *(id *)(a1 + 40);
    uint64_t v34 = *(void *)(a1 + 32);
    id v44 = v33;
    uint64_t v45 = v34;
    dispatch_sync(v32, v43);
  }

  id v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) installOptionsPromise]);

  if (v35)
  {
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) installOptionsPromise]);
    id v37 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v36 accessQueue]);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_10004E968;
    v40[3] = &unk_1000CCCB8;
    id v38 = *(id *)(a1 + 40);
    uint64_t v39 = *(void *)(a1 + 32);
    id v41 = v38;
    uint64_t v42 = v39;
    dispatch_sync(v37, v40);
  }

void sub_10004E640(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) appAssetPromise]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
  [v2 addObject:v4];

  id v5 = *(void **)(a1 + 32);
  id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) appAssetPromise]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v7 subPromiseUUIDs]);
  [v5 unionSet:v6];
}

void sub_10004E6CC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) placeholderPromise]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
  [v2 addObject:v4];

  id v5 = *(void **)(a1 + 32);
  id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) placeholderPromise]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v7 subPromiseUUIDs]);
  [v5 unionSet:v6];
}

void sub_10004E758(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uniqueIdentifier]);
  [v2 addObject:v3];

  BOOL v4 = *(void **)(a1 + 32);
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) subPromiseUUIDs]);
  [v4 unionSet:v5];
}

void sub_10004E7C4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) userDataPromise]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
  [v2 addObject:v4];

  id v5 = *(void **)(a1 + 32);
  id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) userDataPromise]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v7 subPromiseUUIDs]);
  [v5 unionSet:v6];
}

void sub_10004E850(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) deviceSecurityPromise]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
  [v2 addObject:v4];

  id v5 = *(void **)(a1 + 32);
  id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) deviceSecurityPromise]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v7 subPromiseUUIDs]);
  [v5 unionSet:v6];
}

void sub_10004E8DC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) preparationPromise]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
  [v2 addObject:v4];

  id v5 = *(void **)(a1 + 32);
  id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) preparationPromise]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v7 subPromiseUUIDs]);
  [v5 unionSet:v6];
}

void sub_10004E968(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) installOptionsPromise]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
  [v2 addObject:v4];

  id v5 = *(void **)(a1 + 32);
  id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) installOptionsPromise]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v7 subPromiseUUIDs]);
  [v5 unionSet:v6];
}

id sub_10004EDB4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInstallState:2];
}

id sub_10004EE54(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _pauseProgressObject:a2];
}

void sub_10004EE9C(id a1, NSProgress *a2)
{
  if (a2)
  {
    id v2 = a2;
    -[NSProgress resume](v2, "resume");
    -[NSProgress setInstallState:](v2, "setInstallState:", 0LL);
  }

id sub_10004EFE0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_cancelProgress:", a2);
}

id sub_10004F130(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_finishProgress:", a2);
}

void sub_10004F410(_Unwind_Exception *a1)
{
}

void sub_10004F42C(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) placeholderPromise]);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 installType];
}

id sub_10004F474(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = (unint64_t *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 64);
  if (v6 == 2) {
    return objc_msgSend( *(id *)(a1 + 32),  "_limitedConcurrency_fetchPostProcessingProgressAndRun:",  *(void *)(a1 + 48),  a4,  a5);
  }
  if (!v6) {
    return objc_msgSend( *(id *)(a1 + 32),  "_limitedConcurrency_fetchLoadingProgressForPlaceholderInstallType:progressHint:andRun:",  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24),  *(void *)(a1 + 40),  *(void *)(a1 + 48));
  }
  unint64_t v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    sub_100080F8C(a1, v7, v9);
  }

  return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

__CFString *sub_10004F530(unint64_t a1)
{
  if (a1 >= 3) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown progress value %lu",  a1));
  }
  else {
    return *(&off_1000CE5F0 + a1);
  }
}

id sub_10004F63C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (!*(void *)(v3 + 296)) {
      objc_storeStrong((id *)(v3 + 296), v2);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "pendingProgressRequests", 0));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      unint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)v8);
        id v10 = objc_autoreleasePoolPush();
        (*(void (**)(uint64_t, void))(v9 + 16))(v9, *(void *)(a1 + 32));
        objc_autoreleasePoolPop(v10);
        unint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  return [*(id *)(a1 + 40) setPendingProgressRequests:0];
}

id sub_10004FAD4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) originalInstallType];
  if (!result) {
    return [*(id *)(a1 + 32) setOriginalInstallType:*(void *)(a1 + 40)];
  }
  return result;
}

id sub_10004FBAC(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = a2;
  [a3 doubleValue];
  unint64_t v7 = (unint64_t)(v6 * 10000.0);
  id v8 = [v5 unsignedIntegerValue];

  return [v4 setTotalUnitCount:v7 forPhase:v8];
}

void sub_1000508C8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

id sub_10005091C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v2;
  id result = [*(id *)(a1 + 32) totalBytesForProgress];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
  return result;
}

id sub_100050960(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) isComplete];
  [*(id *)(a1 + 32) percentComplete];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v2;
  id result = [*(id *)(a1 + 32) totalBytesForProgress];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = result;
  return result;
}

id sub_1000509B8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v2;
  id result = [*(id *)(a1 + 32) totalBytesForProgress];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
  return result;
}

void sub_1000509FC(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) preparationPromise]);
  [v3 percentComplete];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v2;
}

void sub_100050A44(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3;
  if (!v3)
  {
    id v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
    double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100081280(a1);
    }
    goto LABEL_10;
  }

  if (!*(_BYTE *)(a1 + 56))
  {
    unint64_t v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
    double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
      int v9 = 136315394;
      id v10 = "-[IXSCoordinatedAppInstall _onQueue_updateLoadingProgress]_block_invoke";
      __int16 v11 = 2112;
      __int128 v12 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Not updating loading progress: no relevant promises set",  (uint8_t *)&v9,  0x16u);
    }

void sub_100051188( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

id sub_1000511B4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v2;
  id result = [*(id *)(a1 + 32) totalBytesForProgress];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
  return result;
}

void sub_1000511F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3;
  if (v3)
  {
    if ([v3 totalUnitCount] != *(id *)(a1 + 40)) {
      objc_msgSend(v4, "setTotalUnitCount:");
    }
    [v4 setCompletedUnitCount:*(void *)(a1 + 48)];
  }

  else
  {
    id v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
    double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10008141C(a1);
    }
  }
}

void sub_100051324(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[IXSAppInstallObserverManager sharedInstance]( &OBJC_CLASS___IXSAppInstallObserverManager,  "sharedInstance"));
  [v2 coordinator:*(void *)(a1 + 32) didUpdateProgress:*(void *)(a1 + 48) forPhase:*(double *)(a1 + 40) overallProgress:*(double *)(a1 + 56)];
}

void sub_1000515AC(uint64_t a1)
{
  id v2 = (char *)[*(id *)(a1 + 32) transactionStepForPromise:*(void *)(a1 + 40)];
  if (v2 != (char *)17)
  {
    id v3 = v2;
    else {
      uint64_t v4 = (uint64_t)*(&off_1000CE6F0 + (void)(v2 - 1));
    }
    id v5 = [*(id *)(a1 + 32) state];
    else {
      uint64_t v6 = (uint64_t)*(&off_1000CE608 + (void)v5);
    }
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ began. Coordinator State: %@",  v4,  v6));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
    +[AITransactionLog logStep:byParty:phase:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:description:",  v3,  4LL,  1LL,  1LL,  v9,  v7);
  }

  id v10 = *(void **)(a1 + 40);
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) placeholderPromise]);

  if (v10 == v11)
  {
    int v24 = 0;
    uint64_t v25 = 1LL;
    goto LABEL_25;
  }

  __int128 v12 = *(void **)(a1 + 40);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appAssetPromise]);

  if (v12 == v13)
  {
    int v24 = 1;
    uint64_t v25 = 2LL;
    goto LABEL_25;
  }

  __int128 v14 = *(void **)(a1 + 40);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) userDataPromise]);

  if (v14 == v15)
  {
    int v24 = 0;
    uint64_t v25 = 4LL;
    goto LABEL_25;
  }

  uint64_t v16 = *(void **)(a1 + 40);
  char v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceSecurityPromise]);

  if (v16 == v17)
  {
    int v24 = 0;
    uint64_t v25 = 6LL;
    goto LABEL_25;
  }

  id v18 = *(void **)(a1 + 40);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) preparationPromise]);

  if (v18 == v19)
  {
    int v24 = 0;
    uint64_t v25 = 5LL;
    goto LABEL_25;
  }

  uint64_t v20 = *(void *)(a1 + 40);
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___IXSOpaqueDataPromise);
  if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
  {
    unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) initialODRAssetPromises]);
    unsigned __int8 v23 = [v22 containsObject:*(void *)(a1 + 40)];

    if ((v23 & 1) != 0)
    {
      int v24 = 0;
      uint64_t v25 = 3LL;
LABEL_25:
      id v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegateCallQueue]);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_10005198C;
      v37[3] = &unk_1000CCBD8;
      v37[4] = *(void *)(a1 + 32);
      v37[5] = v25;
      sub_10005A8F0(v30, v37);

      if (v24
        && ([*(id *)(a1 + 32) sentBeginRestoringUserData] & 1) == 0
        && [*(id *)(a1 + 32) shouldBeginRestoringUserData])
      {
        [*(id *)(a1 + 32) setSentBeginRestoringUserData:1];
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegateCallQueue]);
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472LL;
        v36[2] = sub_1000519D0;
        v36[3] = &unk_1000CCE58;
        v36[4] = *(void *)(a1 + 32);
        sub_10005A8F0(v31, v36);
LABEL_29:

        return;
      }

      return;
    }
  }

  uint64_t v26 = *(void *)(a1 + 40);
  uint64_t v27 = objc_opt_class(&OBJC_CLASS___IXSOpaqueDataPromise);
  if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) essentialAssetPromises]);
    unsigned __int8 v29 = [v28 containsObject:*(void *)(a1 + 40)];

    if ((v29 & 1) != 0)
    {
      int v24 = 0;
      uint64_t v25 = 8LL;
      goto LABEL_25;
    }
  }

  uint64_t v32 = *(void **)(a1 + 40);
  id v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) installOptionsPromise]);

  if (v32 != v33)
  {
    uint64_t v34 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      uint64_t v39 = "-[IXSCoordinatedAppInstall promiseDidBegin:]_block_invoke";
      __int16 v40 = 2112;
      uint64_t v41 = v35;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v31,  OS_LOG_TYPE_DEFAULT,  "%s: Got promise did begin for unknown promise %@",  buf,  0x16u);
    }

    goto LABEL_29;
  }

void sub_10005198C(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[IXSAppInstallObserverManager sharedInstance]( &OBJC_CLASS___IXSAppInstallObserverManager,  "sharedInstance"));
  [v2 coordinator:*(void *)(a1 + 32) configuredPromiseDidBeginFulfillment:*(void *)(a1 + 40)];
}

void sub_1000519D0(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[IXSAppInstallObserverManager sharedInstance]( &OBJC_CLASS___IXSAppInstallObserverManager,  "sharedInstance"));
  [v2 coordinatorShouldBeginRestoringUserData:*(void *)(a1 + 32)];
}

id sub_100051B50(uint64_t a1)
{
  id v2 = (char *)[*(id *)(a1 + 32) transactionStepForPromise:*(void *)(a1 + 40)];
  if (v2 != (char *)17)
  {
    id v3 = v2;
    else {
      uint64_t v4 = (uint64_t)*(&off_1000CE6F0 + (void)(v2 - 1));
    }
    id v5 = [*(id *)(a1 + 32) state];
    else {
      uint64_t v6 = (uint64_t)*(&off_1000CE608 + (void)v5);
    }
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ completed. Coordinator State: %@",  v4,  v6));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
    +[AITransactionLog logStep:byParty:phase:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:description:",  v3,  4LL,  2LL,  1LL,  v9,  v7);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_checkState");
}

id sub_100051CC8(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) sentBeginPostProcessing];
  id v3 = *(void **)(a1 + 32);
  if (v2) {
    return objc_msgSend(v3, "_onQueue_updatePostProcessingProgress");
  }
  else {
    return objc_msgSend(v3, "_onQueue_updateLoadingProgress");
  }
}

void sub_100051F34(uint64_t a1)
{
  unsigned int v2 = (char *)[*(id *)(a1 + 32) transactionStepForPromise:*(void *)(a1 + 40)];
  if (v2 != (char *)17)
  {
    id v3 = v2;
    else {
      uint64_t v4 = (uint64_t)*(&off_1000CE6F0 + (void)(v2 - 1));
    }
    id v5 = IXStringForClientID(*(void *)(a1 + 56));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ canceled by client %@ for reason %@",  v4,  v6,  *(void *)(a1 + 48)));

    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleID]);
    +[AITransactionLog logStep:byParty:phase:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:description:",  v3,  4LL,  2LL,  0LL,  v8,  v9);
  }

id sub_100052048(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_onQueue_handleAppAssetPromiseCancellationWhenRestoringWithReason:client:",  *(void *)(a1 + 40),  *(void *)(a1 + 48));
}

void sub_1000521DC(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[IXSAppInstallObserverManager sharedInstance]( &OBJC_CLASS___IXSAppInstallObserverManager,  "sharedInstance"));
  [v2 coordinatorShouldBeginPostProcessing:*(void *)(a1 + 32) forRecordPromise:*(void *)(a1 + 40)];
}

id sub_1000522B8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_checkState");
}

void sub_1000523F8(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) termAssertion]);

  if (v2)
  {
    if ([*v1 expectTermAssertionCallback])
    {
      [*v1 setExpectTermAssertionCallback:0];
      [*v1 setAssertionTransaction:0];
      id v3 = [*v1 postProcessingAssertionState];
      id v4 = *v1;
      if (v3 == (id)1) {
        objc_msgSend(v4, "_onQueue_runPostProcessingAssertionHandler");
      }
      else {
        objc_msgSend(v4, "_onQueue_runAssertionHandlerForPlaceholder:", (unint64_t)objc_msgSend(v4, "state") < 8);
      }
    }

    else
    {
      unint64_t v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_1000814A8();
      }
    }
  }

  else
  {
    id v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[IXSCoordinatedAppInstall assertionTargetProcessDidExit:]_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: We didn't have a termination assertion that we're tracking, so not acting on the callback from RBS",  (uint8_t *)&v9,  0xCu);
    }
  }

id sub_100052D58(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPlaceholderPromise:*(void *)(a1 + 40)];
}

void sub_100052E3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100052E54(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) placeholderPromise]);
  if (v2)
  {
    id v4 = v2;
    id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v2 accessQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100052EF4;
    block[3] = &unk_1000CCEF8;
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = v4;
    dispatch_sync(v3, block);

    id v2 = v4;
  }
}

void sub_100052EF4(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientSeed]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100052FEC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100053004(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) placeholderPromise]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v2 != 0LL;
}

void sub_100053308( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
}

void sub_100053320(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientSeed]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identity]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identity]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientSeed]);
  id v6 = [v5 installationDomain];

  id v7 = [*(id *)(a1 + 40) installationDomain];
  if (([v3 isEqual:v4] & 1) == 0)
  {
    id v18 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000816AC();
    }

    id v21 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setAppAssetPromiseUUID:fromConnection:completion:]_block_invoke",  6355LL,  @"IXErrorDomain",  0x33uLL,  0LL,  0LL,  @"Client attempted to set an app reference with identity %@ that did not match the coordinator's identity, %@",  v20,  (uint64_t)v3);
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8LL);
    char v17 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;
    goto LABEL_9;
  }

  if (v6 != v7)
  {
    id v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = MIStringForInstallationDomain(v6);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      uint64_t v26 = MIStringForInstallationDomain(v7);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      *(_DWORD *)buf = 136316162;
      id v30 = "-[IXSCoordinatedAppInstall(IPCMethods) _remote_setAppAssetPromiseUUID:fromConnection:completion:]_block_invoke";
      __int16 v31 = 2112;
      uint64_t v32 = v3;
      __int16 v33 = 2112;
      uint64_t v34 = v25;
      __int16 v35 = 2112;
      uint64_t v36 = v27;
      __int16 v37 = 2112;
      uint64_t v38 = 0LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s: Client attempted to set an app reference with identity %@ in installation domain %@ that did not match the c oordinator's installation domain %@. : %@",  buf,  0x34u);
    }

    uint64_t v10 = MIStringForInstallationDomain(v6);
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = MIStringForInstallationDomain(v7);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setAppAssetPromiseUUID:fromConnection:completion:]_block_invoke",  6357LL,  @"IXErrorDomain",  0x34uLL,  0LL,  0LL,  @"Client attempted to set an app reference with identity %@ in installation domain %@ that did not match the coordinator's installation domain %@.",  v13,  (uint64_t)v3);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);

    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8LL);
    char v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
LABEL_9:
  }
}

id sub_1000535BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAppAssetPromiseSetterCanInstallLocalProvisionedContent:*(unsigned __int8 *)(a1 + 48)];
}

void sub_1000536C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000536DC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appAssetPromise]);
  if (v2)
  {
    id v4 = v2;
    uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v2 accessQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005377C;
    block[3] = &unk_1000CCEF8;
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = v4;
    dispatch_sync(v3, block);

    uint64_t v2 = v4;
  }
}

void sub_10005377C(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientSeed]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100053874( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10005388C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appAssetPromise]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v2 != 0LL;
}

void sub_100053A10( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100053A38(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appAssetPromise]);
  if (v2)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    id v4 = v2;
    uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v2 accessQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100053AE8;
    block[3] = &unk_1000CCEF8;
    uint64_t v7 = *(void *)(a1 + 48);
    id v6 = v4;
    dispatch_sync(v3, block);

    uint64_t v2 = v4;
  }
}

id sub_100053AE8(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) hasBegun];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

void sub_100053BD8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100053BF0(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) appAssetPromiseDRI];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

id sub_100053CB8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAppAssetPromiseDRI:*(void *)(a1 + 40)];
}

void sub_100054548( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, char a36)
{
}

id sub_100054584(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInstallOptionsPromise:0];
}

id sub_100054590(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

id sub_1000545C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) supersede];
}

id sub_1000545C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInstallOptionsPromise:*(void *)(a1 + 40)];
}

void sub_100054690( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000546A8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) installOptionsPromise]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v2 != 0LL;
}

void sub_1000547F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10005481C(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v8 = 0LL;
  uint64_t v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_onQueue_fetchInstallOptionsWithError:", &v8));
  id v4 = v8;
  id v5 = v8;
  uint64_t v6 = *(void *)(a1[5] + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;

  if (!*(void *)(*(void *)(a1[5] + 8LL) + 40LL)) {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), v4);
  }
}

id sub_100054A40(uint64_t a1)
{
  return [*(id *)(a1 + 32) setImportance:*(void *)(a1 + 40)];
}

void sub_100054B08( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100054B20(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) importance];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

void sub_100054D9C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_100054DD0(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_100054DF8(uint64_t a1)
{
}

void sub_100054E00(uint64_t a1)
{
  id v11 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) priorityBoostCompletion]);
  if (v11 && !*(_BYTE *)(a1 + 72))
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) priorityBoostSourceInfo]);
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v9 = objc_retainBlock(*(id *)(a1 + 48));
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v3 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }

  else
  {
    id v2 = sub_100054EB8(*(void **)(a1 + 40));
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    [*(id *)(a1 + 32) setPriorityBoostCompletion:*(void *)(a1 + 48) withSourceInfo:v3];
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0LL;
  }
}

id sub_100054EB8(void *a1)
{
  id v1 = [a1 processIdentifier];
  uint64_t v2 = qos_class_self();
  uint64_t v3 = sub_10000C26C((int)v1);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = sub_10000C64C(v2);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"completion from %@ (%u), %@ (0x%x)",  v4,  v1,  v6,  v2));

  return v7;
}

id sub_1000551DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInitialODRAssetPromises:*(void *)(a1 + 40)];
}

void sub_1000552C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000552D8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) initialODRAssetPromises]);
  if (v2)
  {
    uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v14 = v2;
    id v6 = v2;
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 accessQueue]);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100055464;
          block[3] = &unk_1000CCEF8;
          uint64_t v13 = *(void *)(a1 + 40);
          void block[4] = v11;
          void block[5] = v13;
          dispatch_sync(v12, block);
        }

        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v8);
    }

    uint64_t v2 = v14;
  }
}

void sub_100055464(uint64_t a1)
{
  id v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientSeed]);
  [v1 addObject:v2];
}

void sub_10005556C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100055584(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) initialODRAssetPromises]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v2 != 0LL;
}

id sub_100055758(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUserDataPromise:*(void *)(a1 + 40)];
}

void sub_10005583C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100055854(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) userDataPromise]);
  if (v2)
  {
    id v4 = v2;
    uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v2 accessQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000558F4;
    block[3] = &unk_1000CCEF8;
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = v4;
    dispatch_sync(v3, block);

    id v2 = v4;
  }
}

void sub_1000558F4(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientSeed]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1000559EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100055A04(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) userDataPromise]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v2 != 0LL;
}

void sub_100055B00( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100055B18(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) shouldBeginRestoringUserData];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

id sub_100055CE0(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPreparationPromise:*(void *)(a1 + 40)];
}

void sub_100055DC4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100055DDC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) preparationPromise]);
  if (v2)
  {
    id v4 = v2;
    uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v2 accessQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100055E7C;
    block[3] = &unk_1000CCEF8;
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = v4;
    dispatch_sync(v3, block);

    uint64_t v2 = v4;
  }
}

void sub_100055E7C(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientSeed]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_10005604C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDeviceSecurityPromise:*(void *)(a1 + 40)];
}

void sub_100056130( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100056148(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceSecurityPromise]);
  if (v2)
  {
    id v4 = v2;
    uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v2 accessQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000561E8;
    block[3] = &unk_1000CCEF8;
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = v4;
    dispatch_sync(v3, block);

    uint64_t v2 = v4;
  }
}

void sub_1000561E8(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientSeed]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1000562E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000562F8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceSecurityPromise]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v2 != 0LL;
}

id sub_1000564C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsPostProcessing:*(unsigned __int8 *)(a1 + 40)];
}

void sub_10005667C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

id sub_100056694(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) needsPostProcessing];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

void sub_100056784( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_10005679C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) shouldBeginPostProcessing];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

void sub_100056C00( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

id sub_100056C48(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) needsPostProcessing];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

id sub_100056C78(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEssentialAssetPromises:*(void *)(a1 + 40)];
}

void sub_100056ED8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100056F04(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) needsPostProcessing];
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) essentialAssetPromises]);
    if (v2)
    {
      uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8LL);
      id v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;

      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      uint64_t v14 = v2;
      id v6 = v2;
      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v17;
        do
        {
          for (i = 0LL; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v6);
            }
            id v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
            uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 accessQueue]);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_1000570B4;
            block[3] = &unk_1000CCEF8;
            uint64_t v13 = *(void *)(a1 + 48);
            void block[4] = v11;
            void block[5] = v13;
            dispatch_sync(v12, block);
          }

          id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }

        while (v8);
      }

      uint64_t v2 = v14;
    }
  }

void sub_1000570B4(uint64_t a1)
{
  id v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientSeed]);
  [v1 addObject:v2];
}

void sub_100057324( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100057350(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) needsPostProcessing];
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) essentialAssetPromises]);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v2 != 0LL;
  }

void sub_10005747C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100057494(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

void sub_1000575D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000575F8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) errorSourceIdentifier];
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_1000576FC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_fireObserversForClient:", *(void *)(a1 + 40));
}

id sub_1000577A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsPaused:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

void sub_100057878( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100057890(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isPaused];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

id sub_100057958(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_prioritizeWithCompletion:", *(void *)(a1 + 40));
}

void sub_100057A14(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) state];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegateCallQueue]);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100057AAC;
  v4[3] = &unk_1000CE590;
  id v5 = *(id *)(a1 + 40);
  id v6 = v2;
  sub_10005A8F0(v3, v4);
}

uint64_t sub_100057AAC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(void *)(a1 + 40),  0LL);
}

id sub_100057BA0(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) coordinatorScope];
  if ((_DWORD)result == 1)
  {
    uint64_t v3 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 136315394;
      id v8 = "-[IXSCoordinatedAppInstall(IPCMethods) _remote_convertToGloballyScopedWithCompletion:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: Converting to global scope: %@",  (uint8_t *)&v7,  0x16u);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
    [v6 convertProcessScopedCoordinatorToGlobalScoped:*(void *)(a1 + 32)];

    [*(id *)(a1 + 32) setCoordinatorScope:2];
    return [*(id *)(a1 + 32) setScopedToConnection:0];
  }

  return result;
}

id sub_100057EC4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPlaceholderDisposition:*(void *)(a1 + 40)];
}

void sub_100057F90( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100057FA8(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) placeholderDisposition];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

id sub_100058090(uint64_t a1)
{
  return [*(id *)(a1 + 32) setProgressHint:*(void *)(a1 + 40)];
}

void sub_100058174( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10005818C(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) progressHint]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_10005826C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNewRemovabilityState:*(void *)(a1 + 40) removabilityClient:*(void *)(a1 + 48)];
}

void sub_10005833C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100058354(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) newRemovability];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

id sub_100058384(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) hasBegun];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

id sub_1000583B4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

id sub_1000583E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) decommission];
}

void sub_1000583EC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);

  if (!v2)
  {
    [*(id *)(a1 + 32) setDelegate:0];
    [*(id *)(a1 + 32) cancelForReason:*(void *)(a1 + 40) client:*(void *)(a1 + 48) error:0];
  }

id sub_100058444(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

  ;
}

void sub_100058498(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

void sub_1000584F0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

uint64_t sub_100058528()
{
  return *(void *)v0;
}

uint64_t sub_100058534@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 40) = a2;
  return *(void *)a1;
}

  ;
}

void sub_10005854C(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

uint64_t sub_100058558@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = result;
  return result;
}

void sub_1000585AC(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___IXSContainerRefreshManager);
  uint64_t v2 = (void *)qword_1000E8F80;
  qword_1000E8F80 = (uint64_t)v1;
}

LABEL_19:
    uint64_t v10 = v10;
    id v11 = 0;
    *a5 = v10;
    goto LABEL_26;
  }

  uint64_t v10 = 0LL;
  if ((v6 & 1) != 0) {
    goto LABEL_22;
  }
LABEL_3:
  id v11 = 1;
LABEL_26:

  return v11;
}

uint64_t sub_100058BCC(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
  uint64_t v7 = container_query_create();
  uint64_t v8 = v7;
  if (v7)
  {
    container_query_operation_set_flags(v7, 2LL);
    id v9 = v6;
    xpc_object_t v10 = xpc_string_create((const char *)[v9 UTF8String]);
    container_query_set_identifiers(v8, v10);

    container_query_set_transient(v8, 0LL);
    if ([v5 isPersonalPersonaPlaceholder])
    {
      id v11 = (id)CONTAINER_PERSONA_PRIMARY;
    }

    else
    {
      id v16 = objc_claimAutoreleasedReturnValue([v5 personaUniqueString]);
      id v11 = [v16 UTF8String];
    }

    container_query_set_persona_unique_string(v8, v11);
    container_query_set_class(v8, a2);
    if (container_query_get_single_result(v8))
    {
      if (container_delete_all_container_content() == 1)
      {
        container_query_free(v8);
        id v17 = 0LL;
        uint64_t v18 = 1LL;
        goto LABEL_24;
      }

      container_get_error_description();
      id v28 = sub_1000047B4((uint64_t)off_1000E8CA0);
      unsigned __int8 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10008236C();
      }

      id v15 = sub_10003556C( (uint64_t)"_ClearContainer",  125LL,  @"IXErrorDomain",  0x23uLL,  0LL,  0LL,  @"Failed to wipe container for identifier %@ : %s",  v30,  (uint64_t)v9);
    }

    else
    {
      last_SInt32 error = container_query_get_last_error(v8);
      if (last_error)
      {
        uint64_t v20 = last_error;
        id v21 = (void *)container_error_copy_unlocalized_description();
        int posix_errno = container_error_get_posix_errno(v20);
        if (posix_errno)
        {
          unint64_t v23 = posix_errno;
          uint64_t v24 = strerror(posix_errno);
          id v26 = sub_10003556C( (uint64_t)"_ClearContainer",  112LL,  NSPOSIXErrorDomain,  v23,  0LL,  0LL,  @"Underlying errno set by container manager is %s",  v25,  (uint64_t)v24);
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        }

        else
        {
          uint64_t v27 = 0LL;
        }

        __int16 v35 = sub_1000047B4((uint64_t)off_1000E8CA0);
        uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_1000822E0((uint64_t)v21, (uint64_t)v27, v36);
        }

        id v38 = sub_10003556C( (uint64_t)"_ClearContainer",  114LL,  @"IXErrorDomain",  0x23uLL,  v27,  0LL,  @"container_query_get_single_result failed : %s",  v37,  (uint64_t)v21);
        id v17 = (id)objc_claimAutoreleasedReturnValue(v38);
        free(v21);

        goto LABEL_21;
      }

      __int16 v31 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_10008226C();
      }

      id v15 = sub_10003556C( (uint64_t)"_ClearContainer",  117LL,  @"IXErrorDomain",  0x23uLL,  0LL,  0LL,  @"Failed to fetch container for identity %@ of class %llu",  v33,  (uint64_t)v5);
    }
  }

  else
  {
    uint64_t v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000821FC();
    }

    id v15 = sub_10003556C( (uint64_t)"_ClearContainer",  90LL,  @"IXErrorDomain",  0x23uLL,  0LL,  0LL,  @"Failed to create container query for %@",  v14,  (uint64_t)v6);
  }

  id v17 = (id)objc_claimAutoreleasedReturnValue(v15);
LABEL_21:
  container_query_free(v8);
  if (a3)
  {
    id v17 = v17;
    uint64_t v18 = 0LL;
    *a3 = v17;
  }

  else
  {
    uint64_t v18 = 0LL;
  }

void sub_100059060(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 40);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) coordinatorForIdentity:*(void *)(a1 + 40)]);
  if (v3)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000823E0(v2, (uint64_t)v3, v5);
    }

    id v7 = sub_10003556C( (uint64_t)"-[IXSContainerRefreshManager refreshContainerTypes:forAppWithIdentity:reason:completion:]_block_invoke",  190LL,  @"IXErrorDomain",  5uLL,  0LL,  0LL,  @"Failed to refresh container %@ because a coordinator already existed: %@",  v6,  *v2);
    id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
    id v9 = 0LL;
    goto LABEL_5;
  }

  id v11 = *(void **)(a1 + 48);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleID]);
  uint64_t v13 = *(void *)(a1 + 56);
  id v20 = 0LL;
  id v21 = 0LL;
  unsigned int v14 = objc_msgSend( v11,  "_onQueue_terminateBundleID:reason:terminationAssertion:error:",  v12,  v13,  &v21,  &v20);
  id v9 = v21;
  id v8 = v20;

  if (!v14)
  {
    if (v9) {
      [v9 invalidate];
    }
    goto LABEL_5;
  }

  uint64_t v15 = *(void *)(a1 + 72);
  uint64_t v17 = *(void *)(a1 + 40);
  id v16 = *(void **)(a1 + 48);
  id v19 = v8;
  unsigned int v18 = objc_msgSend(v16, "_onQueue_refreshContainerTypes:forAppWithIdentity:error:", v15, v17, &v19);
  id v10 = v19;

  if (v9)
  {
    [v9 invalidate];
    if ((v18 & 1) == 0) {
      goto LABEL_16;
    }
LABEL_14:
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
    goto LABEL_6;
  }

  if (v18) {
    goto LABEL_14;
  }
  id v9 = 0LL;
LABEL_16:
  id v8 = v10;
LABEL_5:
  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  id v10 = v8;
LABEL_6:
}

void sub_100059210(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

LABEL_3:
  if ([v4 containsValueForKey:@"installationDomain"])
  {
    unsigned int v18 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"installationDomain"];
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    *((void *)v5 + 6) = [v19 unsignedIntegerValue];
  }

  else
  {
    *((void *)v5 + 6) = 1LL;
  }

void sub_100059A58(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 name]);

  id v4 = [objc_allocWithZone(NSMutableString) initWithString:@"** INTERNAL ERROR: Uncaught Exception **\n"];
  [v4 appendString:@"Exception: "];
  if (v3)
  {
    [v4 appendString:@"<"];
    [v4 appendString:v3];
    [v4 appendString:@"> "];
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v1 name]);

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v1 name]);
    [v4 appendString:v6];

    [v4 appendString:@": "];
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v1 reason]);

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v1 reason]);
    [v4 appendString:v8];
  }

  [v4 appendString:@"\nStack:\n"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v1 callStackSymbols]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 componentsJoinedByString:@"\n"]);
  [v4 appendString:v10];

  pthread_mutex_lock(&stru_1000E8C60);
  if (v4) {
    qword_1000E8DD0 = (uint64_t)strdup((const char *)[v4 UTF8String]);
  }
  uint64_t v14 = 0LL;
  memset(v13, 0, sizeof(v13));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v11 = 3LL;
  }
  else {
    uint64_t v11 = 2LL;
  }
  uint64_t v12 = _os_log_send_and_compose_impl(v11, &v14, v13, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  _os_crash_msg(v14, v12);
  __break(1u);
}

void sub_100059CA4(id a1)
{
  if (!dlopen("/System/Library/Frameworks/HealthKit.framework/HealthKit", 1))
  {
    uint64_t v6 = dlerror();
    id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_10008258C((uint64_t)v6, v5);
    }
    goto LABEL_14;
  }

  qword_1000E8FA0 = (uint64_t)NSClassFromString(@"HKHealthStore");
  qword_1000E8FA8 = (uint64_t)NSClassFromString(@"HKSourceStore");
  Class v1 = NSClassFromString(@"_HKBehavior");
  qword_1000E8FB0 = (uint64_t)v1;
  if (qword_1000E8FA0) {
    BOOL v2 = qword_1000E8FA8 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2 || v1 == 0LL)
  {
    id v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100082614(v5);
    }
LABEL_14:
  }

void sub_100059E38(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue( -[objc_class sharedBehavior]( +[IXSHealthKitDataUninstallAlert hkBehaviorClass]( &OBJC_CLASS___IXSHealthKitDataUninstallAlert,  "hkBehaviorClass"),  "sharedBehavior"));
  byte_1000E8F90 = [v1 healthAppSupportedOnDevice];
}

void sub_10005A2C8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000826C0(a1, (uint64_t)v5, v8);
    }

    (*(void (**)(void, void))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), 0LL);
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = "is not";
      uint64_t v12 = "+[IXSHealthKitDataUninstallAlert healthKitDataPresentForAppWithBundleID:completion:]_block_invoke";
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 136315650;
      if ((_DWORD)a2) {
        id v9 = "is";
      }
      __int16 v13 = 2080;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: HealthKit data %s present for app with bundle ID %@",  (uint8_t *)&v11,  0x20u);
    }

    (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), a2);
  }
}

void sub_10005A844(dispatch_queue_s *a1, void *a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005A8BC;
  block[3] = &unk_1000CD030;
  id v5 = a2;
  id v3 = v5;
  dispatch_async(a1, block);
}

void sub_10005A8BC(uint64_t a1)
{
  BOOL v2 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  objc_autoreleasePoolPop(v2);
}

void sub_10005A8F0(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005A9A0;
  v7[3] = &unk_1000CE208;
  id v8 = (id)os_transaction_create("com.apple.InstallCoordination.async-block");
  id v9 = v3;
  id v5 = v8;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void sub_10005A9A0(uint64_t a1)
{
  BOOL v2 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  objc_autoreleasePoolPop(v2);
}

dispatch_queue_global_t sub_10005A9D4()
{
  qos_class_t v0 = qos_class_self();
  return dispatch_get_global_queue(v0, 0LL);
}

uint64_t sub_10005A9F0()
{
  return os_variant_has_internal_diagnostics("com.apple.installcoordination");
}

void sub_10005AB74(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  BOOL v2 = (void *)qword_1000E8FB8;
  qword_1000E8FB8 = (uint64_t)v1;
}

id sub_10005AC74(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_restoreSavedPromises");
}

void sub_10005B4A8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, __int128 buf)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v43 = objc_begin_catch(exception_object);
      id v44 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315394;
        *(void *)((char *)&buf + 4) = "-[IXSDataPromiseManager _onQueue_restoreSavedPromises]";
        WORD6(buf) = 2112;
        *(void *)((char *)&buf + 14) = v43;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "%s: Got exception while decoding promises: %@",  (uint8_t *)&buf,  0x16u);
      }

      id v46 = *(void **)(a15 + 16);
      *(void *)(a15 + 16) = 0LL;

      objc_end_catch();
      JUMPOUT(0x10005B434LL);
    }

    objc_begin_catch(exception_object);
    JUMPOUT(0x10005B43CLL);
  }

  _Unwind_Resume(exception_object);
}

id sub_10005B5F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _promiseForUUID:a2 ofType:a3 useQueue:0];
}

void sub_10005B604(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 accessQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005B6AC;
  block[3] = &unk_1000CD568;
  id v8 = v4;
  id v9 = *(id *)(a1 + 32);
  id v6 = v4;
  dispatch_sync(v5, block);
}

id sub_10005B6AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) awakeFromSerializationWithLookupBlock:*(void *)(a1 + 40) error:0];
}

void sub_10005B93C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10005B954(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10005B964(uint64_t a1)
{
}

void sub_10005B96C(uint64_t a1)
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuidToPromiseMap]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 objectForKey:*(void *)(a1 + 40)]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isTracked] & 1) == 0)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0LL;
  }

void sub_10005BB40(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuidToPromiseMap]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uniqueIdentifier]);
  [v3 setObject:v2 forKeyedSubscript:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) accessQueue]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10005BC08;
  v8[3] = &unk_1000CCCB8;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  sub_10005A8F0(v5, v8);
}

id sub_10005BC08(uint64_t a1)
{
  return [*(id *)(a1 + 32) saveState];
}

void sub_10005BCC8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuidToPromiseMap]);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10005BD48;
  v3[3] = &unk_1000CE8D0;
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void sub_10005BD48(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6 = a3;
}

void sub_10005BE3C(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuidToPromiseMap]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uniqueIdentifier]);
  [v3 removeObjectForKey:v2];
}

void sub_10005C104( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

void sub_10005C138(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuidToPromiseMap]);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v5 allValues]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10005C18C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);

  if (!v2)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = sub_10003556C( (uint64_t)"-[IXSDataPromiseManager clearAllPromisesForCreator:]_block_invoke_2",  262LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Clearing all promises",  v3,  v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue(v5);
    [v4 cancelForReason:v7 client:15 error:0];
  }

void sub_10005C2FC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) delegate]);

  if (v2 == v3) {
    [*(id *)(a1 + 40) cancelForReason:*(void *)(a1 + 48) client:*(void *)(a1 + 56) error:0];
  }
}

void sub_10005C894(_Unwind_Exception *a1)
{
}

void sub_10005CCE0(uint64_t a1)
{
  uint64_t v2 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 136315650;
    id v8 = "-[IXSClientConnection addInterestedCoordinatorUUIDs:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Interested in UUIDs: %@",  (uint8_t *)&v7,  0x20u);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  [v6 unionSet:*(void *)(a1 + 40)];
}

void sub_10005CE60(uint64_t a1)
{
  uint64_t v2 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 136315650;
    id v8 = "-[IXSClientConnection addInterestedCoordinatorUUID:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Interested in UUID: %@",  (uint8_t *)&v7,  0x20u);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  [v6 addObject:*(void *)(a1 + 40)];
}

void sub_10005CFE0(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)&off_1000E8CA0;
  uint64_t v3 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(NSMutableSet **)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    uint64_t v41 = "-[IXSClientConnection removeInterestedCoordinatorUUIDs:]_block_invoke";
    __int16 v42 = 2112;
    uint64_t v43 = v5;
    __int16 v44 = 2112;
    uint64_t v45 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: %@: No longer interested in UUIDs: %@",  buf,  0x20u);
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  id v8 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = *(id *)(a1 + 40);
  id v9 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (!v9)
  {
    uint64_t v32 = 0LL;
    __int16 v11 = 0LL;
    goto LABEL_27;
  }

  id v10 = v9;
  uint64_t v32 = 0LL;
  __int16 v11 = 0LL;
  uint64_t v12 = *(void *)v36;
  do
  {
    for (i = 0LL; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v36 != v12) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(NSMutableSet **)(*((void *)&v35 + 1) + 8LL * (void)i);
      id v15 = [v7 countForObject:v14];
      if (v15)
      {
        if (v15 != (id)1) {
          continue;
        }
        -[NSMutableSet addObject:](v8, "addObject:", v14);
        if (!v11) {
          __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
        }
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 coordinatorForUUID:v14]);
        uint64_t v17 = v16;
        if (v16 && [v16 coordinatorScope] == 1)
        {
          uint64_t v33 = v11;
          unsigned int v18 = v8;
          id v19 = v2;
          uint64_t v20 = a1;
          id v21 = *(void **)(a1 + 32);
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v17 scopedToConnection]);

          if (v21 == v22)
          {
            a1 = v20;
            uint64_t v25 = (uint64_t)v32;
            if (!v32)
            {
              id v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientName]);
              id v28 = sub_10003556C( (uint64_t)"-[IXSClientConnection removeInterestedCoordinatorUUIDs:]_block_invoke",  214LL,  @"IXErrorDomain",  0x21uLL,  0LL,  0LL,  @"Process-scoped coordinator no longer referenced by client %@",  v27,  (uint64_t)v26);
              uint64_t v25 = objc_claimAutoreleasedReturnValue(v28);
            }

            uint64_t v32 = (void *)v25;
            [v17 cancelForReason:v25 client:15 error:0];
          }

          else
          {
            a1 = v20;
          }

          uint64_t v2 = v19;
          id v8 = v18;
          __int16 v11 = v33;
        }
      }

      else
      {
        unint64_t v23 = sub_1000047B4(*v2);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_FAULT))
        {
          uint64_t v24 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 136315650;
          uint64_t v41 = "-[IXSClientConnection removeInterestedCoordinatorUUIDs:]_block_invoke";
          __int16 v42 = 2112;
          uint64_t v43 = v24;
          __int16 v44 = 2112;
          uint64_t v45 = v14;
          _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_FAULT,  "%s: %@: Client is no longer interested in %@ but we didn't know they were interested",  buf,  0x20u);
        }
      }
    }

    id v10 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  }

  while (v10);
LABEL_27:

  [v7 minusSet:*(void *)(a1 + 40)];
  if (-[NSMutableSet count](v8, "count"))
  {
    unsigned __int8 v29 = sub_1000047B4(*v2);
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      uint64_t v41 = "-[IXSClientConnection removeInterestedCoordinatorUUIDs:]_block_invoke";
      __int16 v42 = 2112;
      uint64_t v43 = v31;
      __int16 v44 = 2112;
      uint64_t v45 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Removed last reference for UUIDs: %@",  buf,  0x20u);
    }
  }
}

void sub_10005D4EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10005D504(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

void sub_10005D660(uint64_t a1)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "interestedPromiseUUIDs", 0));
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 40) cancelPromiseForUUIDIfNotAssociatedWithAnyCoordinator:*(void *)(*((void *)&v8 + 1) + 8 * (void)v6) withReason:*(void *)(a1 + 48) client:15];
        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v4);
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedPromiseUUIDs]);
  [v7 removeAllObjects];
}

void sub_10005D808(uint64_t a1)
{
  id v2 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 136315650;
    __int128 v8 = "-[IXSClientConnection addInterestedPromiseUUID:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Interested in UUID: %@",  (uint8_t *)&v7,  0x20u);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedPromiseUUIDs]);
  [v6 addObject:*(void *)(a1 + 40)];
}

void sub_10005D988(uint64_t a1)
{
  id v2 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 136315650;
    __int128 v8 = "-[IXSClientConnection addInterestedPromiseUUIDs:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Interested in UUIDs: %@",  (uint8_t *)&v7,  0x20u);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedPromiseUUIDs]);
  [v6 unionSet:*(void *)(a1 + 40)];
}

void sub_10005DB08(uint64_t a1)
{
  id v2 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    id v26 = "-[IXSClientConnection removeInterestedPromiseUUIDs:]_block_invoke";
    __int16 v27 = 2112;
    uint64_t v28 = v4;
    __int16 v29 = 2112;
    uint64_t v30 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s: %@: No longer interested in UUIDs: %@",  buf,  0x20u);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedPromiseUUIDs]);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v7 = *(id *)(a1 + 40);
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v8)
  {
    uint64_t v10 = 0LL;
    __int16 v11 = 0LL;
    goto LABEL_19;
  }

  id v9 = v8;
  uint64_t v10 = 0LL;
  __int16 v11 = 0LL;
  uint64_t v12 = *(void *)v21;
  do
  {
    __int16 v13 = 0LL;
    do
    {
      if (*(void *)v21 != v12) {
        objc_enumerationMutation(v7);
      }
      uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v13);
      if ([v6 countForObject:v14] == (id)1)
      {
        if (v11)
        {
          if (v10)
          {
LABEL_11:
            [v11 cancelPromiseForUUIDIfNotAssociatedWithAnyCoordinator:v14 withReason:v10 client:15];
            goto LABEL_12;
          }
        }

        else
        {
          __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
          if (v10) {
            goto LABEL_11;
          }
        }

        id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientName]);
        id v17 = sub_10003556C( (uint64_t)"-[IXSClientConnection removeInterestedPromiseUUIDs:]_block_invoke",  302LL,  @"IXErrorDomain",  0x12uLL,  0LL,  0LL,  @"Promise was not attached to a coordinator and is no longer referenced by client %@",  v16,  (uint64_t)v15);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v17);

        goto LABEL_11;
      }

void sub_10005DE88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10005DEA0(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedPromiseUUIDs]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

void sub_10005E1A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

uint64_t sub_10005E1CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10005E1DC(uint64_t a1)
{
}

void sub_10005E1E4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id obj = *(id *)(v3 + 40);
  unsigned int v4 = [v2 issueSandboxExtensionWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientSeed]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }

void sub_10005E50C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

void sub_10005E530(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id obj = *(id *)(v3 + 40);
  unsigned int v4 = [v2 issueSandboxExtensionWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientSeed]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }

void sub_10005E828( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10005E84C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id obj = *(id *)(v3 + 40);
  unsigned int v4 = [v2 issueSandboxExtensionWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientSeed]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }

void sub_10005EB2C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

void sub_10005EB44(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientSeed]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  unsigned int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10005EDE0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

void sub_10005EDF8(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientSeed]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  unsigned int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10005F080( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

void sub_10005F098(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientSeed]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  unsigned int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10005F320( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

void sub_10005F338(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientSeed]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  unsigned int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10005F5DC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientSeed]);
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0LL);
}

LABEL_54:
  _Block_object_dispose(&v124, 8);
}

void sub_100060340( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

IXSCoordinatedAppInstall *sub_1000603B4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56) == 1) {
    id v2 = *(id *)(a1 + 32);
  }
  else {
    id v2 = 0LL;
  }
  uint64_t v3 = -[IXSCoordinatedAppInstall initWithSeed:scopedToConnection:]( objc_alloc(&OBJC_CLASS___IXSCoordinatedAppInstall),  "initWithSeed:scopedToConnection:",  *(void *)(a1 + 40),  v2);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;

  return v3;
}

BOOL sub_10006042C(void *a1, int a2)
{
  id v3 = a1;
  unsigned int v4 = v3;
  if (a2)
  {
    else {
      BOOL v5 = a2 == 2;
    }
  }

  else
  {
    BOOL v5 = 1LL;
  }

  return v5;
}

__CFString *sub_100060484(unint64_t a1)
{
  if (a1 >= 8) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown intent value %lu",  a1));
  }
  else {
    return off_1000CEF18[a1];
  }
}

uint64_t sub_1000606BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 originalIntent];
  id v5 = *(id *)(a1 + 40);
  if (v5) {
    BOOL v6 = v5 == v4;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 seed]);
    [v7 addObject:v8];
  }

  return 1LL;
}

uint64_t sub_100060800(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  id v5 = *(id *)(a1 + 40);
  if (!v5 || v5 == [v3 creatorIdentifier])
  {
    BOOL v6 = *(void **)(a1 + 32);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
    [v6 addObject:v7];
  }

  return 1LL;
}

uint64_t sub_100060CD8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100061248( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, char a46)
{
}

void sub_100061294(uint64_t a1, char a2, void *a3)
{
  id v9 = a3;
  if (v9)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v8 = *(void *)(v6 + 40);
    id v7 = (id *)(v6 + 40);
    if (!v8) {
      objc_storeStrong(v7, a3);
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) |= a2;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_100061310(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 80))
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) userInfo]);
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IXSErrorPresenter sharedPresenter](&OBJC_CLASS___IXSErrorPresenter, "sharedPresenter"));
    objc_msgSend( v4,  "presentErrorForIdentities:code:underlyingError:errorSource:",  *(void *)(a1 + 40),  objc_msgSend(*(id *)(a1 + 32), "code"),  v3,  *(void *)(a1 + 72));
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

LABEL_62:
        id v63 = (void *)objc_claimAutoreleasedReturnValue(+[IXSErrorPresenter sharedPresenter](&OBJC_CLASS___IXSErrorPresenter, "sharedPresenter"));
        __int128 v62 = (void *)v74;
        [v63 presentErrorForIdentity:v6 code:v40 underlyingError:v74 errorSource:v71];
        goto LABEL_63;
      }

      if ((v31 & 1) != 0)
      {
        uint64_t v17 = v72;
        if (!v43) {
          goto LABEL_62;
        }
        *(_DWORD *)buf = 136315394;
        uint64_t v86 = "-[IXSClientConnection _remote_prioritizeCoordinatorForAppWithIdentity:completion:]";
        v87 = 2112;
        __int16 v88 = v6;
        __int16 v44 = "%s: No coordinator found for %@ and prioritize is otherwise unhandled; showing alert";
      }

      else
      {
        uint64_t v17 = v72;
        if (!v43) {
          goto LABEL_62;
        }
        *(_DWORD *)buf = 136315394;
        uint64_t v86 = "-[IXSClientConnection _remote_prioritizeCoordinatorForAppWithIdentity:completion:]";
        v87 = 2112;
        __int16 v88 = v6;
        __int16 v44 = "%s: No coordinator found for %@ and app is not vendable by App Store so showing alert";
      }

      uint64_t v45 = v42;
      uint64_t v46 = 22;
      goto LABEL_61;
    }

    if (v70 || v69)
    {
      uint64_t v17 = v72;
      __int128 v57 = 13LL;
    }

    else
    {
      if (v36 == 23)
      {
        __int128 v58 = sub_1000047B4((uint64_t)off_1000E8CA0);
        __int128 v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v86 = "-[IXSClientConnection _remote_prioritizeCoordinatorForAppWithIdentity:completion:]";
          v87 = 2112;
          __int16 v88 = v6;
          v89 = 2048;
          v90 = v75;
          _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "%s: No coordinator found for %@ and app is vendable by MDM (error %ld); sending message to prioritize by identity.",
            buf,
            0x20u);
        }

        __int128 v57 = 23LL;
      }

      else
      {
        if (!v31) {
          goto LABEL_24;
        }
        if (v68) {
          __int128 v57 = 28LL;
        }
        else {
          __int128 v57 = 1LL;
        }
        uint64_t v65 = sub_1000047B4((uint64_t)off_1000E8CA0);
        __int128 v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v66 = IXStringForClientID(v57);
          __int128 v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
          *(_DWORD *)buf = 136315906;
          uint64_t v86 = "-[IXSClientConnection _remote_prioritizeCoordinatorForAppWithIdentity:completion:]";
          v87 = 2112;
          __int16 v88 = v6;
          v89 = 2048;
          v90 = v75;
          id v91 = 2112;
          __int16 v92 = v67;
          _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "%s: No coordinator found for %@ and app is vendable by App Store (error %ld); sending message to prioritize "
            "by identity to %@.",
            buf,
            0x2Au);
        }
      }

      uint64_t v17 = v72;
    }

    id v60 = objc_claimAutoreleasedReturnValue(+[IXSAppInstallObserverManager sharedInstance](&OBJC_CLASS___IXSAppInstallObserverManager, "sharedInstance"));
    uint64_t v61 = v57;
    __int128 v62 = (void *)v60;
    id v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v61));
    uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v63, 0LL));
    [v62 shouldPrioritizeAppWithIdentity:v6 forClientIDs:v64];

LABEL_63:
    uint64_t v16 = 0LL;

    id v53 = v78;
    __int128 v56 = v76;
    goto LABEL_64;
  }

  (*((void (**)(id, void, id))v7 + 2))(v7, 0LL, v9);
LABEL_70:
}

uint64_t sub_100061F60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

LABEL_38:
    uint64_t v52 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      id v54 = (void *)objc_claimAutoreleasedReturnValue(-[IXSClientConnection clientName](v60, "clientName"));
      *(_DWORD *)buf = 136315650;
      id v74 = "-[IXSClientConnection _remote_unregisterContentsForDiskImageAtURL:options:completion:]";
      __int128 v75 = 2112;
      __int128 v76 = v23;
      id v77 = 2112;
      id v78 = v54;
      _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "%s: Unregistering contents on disk image mounted at %@ by client %@",  buf,  0x20u);
    }

    uint64_t v65 = v45;
    __int128 v55 = MobileInstallationUnregisterContentsForDiskImageAtURL(v63, &v65);
    __int128 v20 = v65;

    if ((v55 & 1) != 0)
    {
      uint64_t v46 = 1LL;
      goto LABEL_46;
    }

    __int128 v56 = sub_1000047B4((uint64_t)off_1000E8CA0);
    __int128 v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      sub_10008360C();
    }
  }

  uint64_t v46 = 0LL;
LABEL_46:
  id v9 = v62;
  [v43 invalidate];
  v9[2](v9, v46, v20);

  uint64_t v8 = v63;
  __int128 v21 = v61;
LABEL_47:

LABEL_10:
}

void sub_100064824(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a3 mostRestrictiveRemovabilityMetadata]);
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];

  *a4 = 0;
}

void sub_100064DAC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = a3;
  uint64_t v5 = sub_100033668(a2);
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, v5, v6);
}

void sub_100065D58(uint64_t a1)
{
  id v2 = (uint64_t *)(a1 + 40);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) coordinatorForIdentity:*(void *)(a1 + 40)]);
  if (v3)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000840D4();
    }

    id v7 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_updateSINFForAppWithIdentity:sinfData:options:completion:]_block_invoke",  1683LL,  @"IXErrorDomain",  0x1DuLL,  0LL,  0LL,  @"Failed to update the SINF for %@ because a coordinator already existed: %@",  v6,  *v2);
    id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleID]);
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 56);
    id v18 = 0LL;
    uint64_t updated = MobileInstallationUpdateSinfDataForInstallCoordination(v13, v14, v15, &v18);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(updated);
    id v8 = v18;

    if (v17)
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();

      goto LABEL_12;
    }
  }

  if (!v8)
  {
    id v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100084064();
    }

    id v12 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_updateSINFForAppWithIdentity:sinfData:options:completion:]_block_invoke",  1699LL,  @"IXErrorDomain",  0xEuLL,  0LL,  0LL,  @"Updating SINF for %@ returned NO but did not set an error.",  v11,  *v2);
    id v8 = (id)objc_claimAutoreleasedReturnValue(v12);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
LABEL_12:
}

void sub_100066168(uint64_t a1)
{
  id v2 = (uint64_t *)(a1 + 40);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) coordinatorForIdentity:*(void *)(a1 + 40)]);
  if (v3)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000841BC();
    }

    id v7 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_updateiTunesMetadata:forAppWithIdentity:completion:]_block_invoke",  1736LL,  @"IXErrorDomain",  0x1DuLL,  0LL,  0LL,  @"Failed to update the iTunesMetadata for %@ because a coordinator already existed: %@",  v6,  *v2);
    id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleID]);
    uint64_t v10 = *(void *)(a1 + 48);
    id v17 = 0LL;
    int v11 = MobileInstallationUpdateiTunesMetadataForInstallCoordination(v9, v10, &v17);
    id v8 = v17;

    if (v11)
    {
      id v12 = *(void (**)(void))(*(void *)(a1 + 56) + 16LL);
      goto LABEL_12;
    }
  }

  if (!v8)
  {
    uint64_t v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10008414C();
    }

    id v16 = sub_10003556C( (uint64_t)"-[IXSClientConnection _remote_updateiTunesMetadata:forAppWithIdentity:completion:]_block_invoke",  1751LL,  @"IXErrorDomain",  0xEuLL,  0LL,  0LL,  @"Updating iTunesMetadata for %@ returned NO but did not set an error.",  v15,  *v2);
    id v8 = (id)objc_claimAutoreleasedReturnValue(v16);
  }

  id v12 = *(void (**)(void))(*(void *)(a1 + 56) + 16LL);
LABEL_12:
  v12();
}

void sub_100066638(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100084234();
    }
  }

id sub_1000666C0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_appAssetPromiseHasBegunFulfillment:", *(void *)(a1 + 32));
}

uint64_t sub_1000666CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100066844(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_1000842BC();
    }
  }

id sub_1000668CC(void *a1, void *a2)
{
  return objc_msgSend(a2, "_remote_cancelForReason:client:completion:", a1[4], a1[6], a1[5]);
}

uint64_t sub_1000668DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100066A24(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100084344();
    }
  }

id sub_100066AAC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_fireObserversForClient:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_100066AB8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100066BF8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_1000843CC();
    }
  }

void sub_100066C80(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100066CF4;
  v4[3] = &unk_1000CEAC8;
  unsigned __int8 v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "_remote_getAppAssetPromise:", v4);
}

void sub_100066CF4(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
    [v6 addInterestedPromiseUUID:v7];
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_100066D7C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100066EC0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100084454();
    }
  }

id sub_100066F48(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getAppAssetPromiseDRI:", *(void *)(a1 + 32));
}

uint64_t sub_100066F54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100067098(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_1000844DC();
    }
  }

id sub_100067120(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getCoordinationState:", *(void *)(a1 + 32));
}

uint64_t sub_10006712C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100067270(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100084564();
    }
  }

id sub_1000672F8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getErrorInfo:", *(void *)(a1 + 32));
}

uint64_t sub_100067304(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006744C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_1000845EC();
    }
  }

void sub_1000674D4(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100067548;
  v4[3] = &unk_1000CEAF0;
  unsigned __int8 v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "_remote_getInitialODRAssetPromises:", v4);
}

void sub_100067548(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        int v11 = *(void **)(a1 + 32);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) uniqueIdentifier]);
        [v11 addInterestedPromiseUUID:v12];

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_100067684(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000677C8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100084674();
    }
  }

id sub_100067850(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getIsComplete:", *(void *)(a1 + 32));
}

uint64_t sub_10006785C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000679A0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_1000846FC();
    }
  }

id sub_100067A28(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getIsPausedWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_100067A34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100067B7C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100084784();
    }
  }

void sub_100067C04(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100067C78;
  v4[3] = &unk_1000CEAC8;
  unsigned __int8 v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "_remote_getPlaceholderPromise:", v4);
}

void sub_100067C78(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
    [v6 addInterestedPromiseUUID:v7];
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_100067D00(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100067E48(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_10008480C();
    }
  }

void sub_100067ED0(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100067F44;
  v4[3] = &unk_1000CEAC8;
  unsigned __int8 v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "_remote_getPreparationPromise:", v4);
}

void sub_100067F44(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
    [v6 addInterestedPromiseUUID:v7];
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_100067FCC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100068114(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100084894();
    }
  }

void sub_10006819C(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100068210;
  v4[3] = &unk_1000CEAC8;
  unsigned __int8 v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "_remote_getUserDataPromise:", v4);
}

void sub_100068210(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
    [v6 addInterestedPromiseUUID:v7];
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_100068298(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000683E0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_10008491C();
    }
  }

void sub_100068468(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000684DC;
  v4[3] = &unk_1000CEAC8;
  unsigned __int8 v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "_remote_getDeviceSecurityPromise:", v4);
}

void sub_1000684DC(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
    [v6 addInterestedPromiseUUID:v7];
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_100068564(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000686A8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_1000849A4();
    }
  }

id sub_100068730(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getHasDeviceSecurityPromise:", *(void *)(a1 + 32));
}

uint64_t sub_10006873C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100068890(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100084A2C();
    }
  }

id sub_100068918(uint64_t a1, void *a2)
{
  return objc_msgSend( a2,  "_remote_setNeedsPostProcessing:completion:",  *(unsigned __int8 *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t sub_100068928(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100068A64(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100084AB4();
    }
  }

id sub_100068AEC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getNeedsPostProcessing:", *(void *)(a1 + 32));
}

uint64_t sub_100068AF8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100068C3C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100084B3C();
    }
  }

id sub_100068CC4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getPostProcessingShouldBegin:", *(void *)(a1 + 32));
}

uint64_t sub_100068CD0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100068E40(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100084BC4();
    }
  }

id sub_100068EC8(uint64_t a1, void *a2)
{
  return objc_msgSend( a2,  "_remote_setEssentialAssetPromiseUUIDs:completion:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
}

uint64_t sub_100068ED4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100069014(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100084C4C();
    }
  }

void sub_10006909C(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100069110;
  v4[3] = &unk_1000CEAF0;
  unsigned __int8 v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "_remote_getEssentialAssetPromises:", v4);
}

void sub_100069110(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        int v11 = *(void **)(a1 + 32);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) uniqueIdentifier]);
        [v11 addInterestedPromiseUUID:v12];

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_10006924C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100069390(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100084CD4();
    }
  }

id sub_100069418(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_hasEssentialAssetPromises:", *(void *)(a1 + 32));
}

uint64_t sub_100069424(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100069568(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100084D5C();
    }
  }

id sub_1000695F0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getUserDataRestoreShouldBegin:", *(void *)(a1 + 32));
}

uint64_t sub_1000695FC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100069740(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100084DE4();
    }
  }

id sub_1000697C8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_hasAppAssetPromise:", *(void *)(a1 + 32));
}

uint64_t sub_1000697D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100069918(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100084E6C();
    }
  }

id sub_1000699A0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_hasInitialODRAssetPromises:", *(void *)(a1 + 32));
}

uint64_t sub_1000699AC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100069AF0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100084EF4();
    }
  }

id sub_100069B78(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_hasInstallOptions:", *(void *)(a1 + 32));
}

uint64_t sub_100069B84(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100069CC8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100084F7C();
    }
  }

id sub_100069D50(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getInstallOptions:", *(void *)(a1 + 32));
}

uint64_t sub_100069D5C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100069EA0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100085004();
    }
  }

id sub_100069F28(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_hasPlaceholderPromise:", *(void *)(a1 + 32));
}

uint64_t sub_100069F34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006A078(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_10008508C();
    }
  }

id sub_10006A100(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_hasUserDataPromise:", *(void *)(a1 + 32));
}

uint64_t sub_10006A10C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006A260(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100085114();
    }
  }

id sub_10006A2E8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setImportance:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_10006A2F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006A430(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_10008519C();
    }
  }

id sub_10006A4B8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_importanceWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10006A4C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006A61C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100085224();
    }
  }

void sub_10006A6A4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 xpcConnection]);
  objc_msgSend( v5,  "_remote_conveyPriorityReplacingExisting:forConnection:withCompletion:",  v3,  v6,  *(void *)(a1 + 40));
}

uint64_t sub_10006A70C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006A848(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_1000852AC();
    }
  }

id sub_10006A8D0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_prioritizeWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10006A8DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006AA28(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100085334();
    }
  }

id sub_10006AAB0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setAppAssetPromiseDRI:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_10006AABC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006AC24(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_1000853BC();
    }
  }

void sub_10006ACAC(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 xpcConnection]);
  objc_msgSend(v5, "_remote_setAppAssetPromiseUUID:fromConnection:completion:", v3, v6, a1[6]);
}

uint64_t sub_10006AD10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006AE78(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100085444();
    }
  }

id sub_10006AF00(uint64_t a1, void *a2)
{
  return objc_msgSend( a2,  "_remote_setInitialODRAssetPromiseUUIDs:completion:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
}

uint64_t sub_10006AF0C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006B074(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_1000854CC();
    }
  }

void sub_10006B0FC(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 xpcConnection]);
  objc_msgSend(v5, "_remote_setInstallOptionsPromiseUUID:forConnection:completion:", v3, v6, a1[6]);
}

uint64_t sub_10006B160(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006B2AC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100085554();
    }
  }

id sub_10006B334(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setIsPaused:completion:", *(unsigned __int8 *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_10006B344(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006B4AC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_1000855DC();
    }
  }

id sub_10006B534(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setPlaceholderPromiseUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_10006B540(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006B6A8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100085664();
    }
  }

id sub_10006B730(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setPreparationPromiseUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_10006B73C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006B8A4(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_1000856EC();
    }
  }

id sub_10006B92C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setUserDataPromiseUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_10006B938(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006BAA0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100085774();
    }
  }

id sub_10006BB28(uint64_t a1, void *a2)
{
  return objc_msgSend( a2,  "_remote_setDeviceSecurityPromiseUUID:completion:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
}

uint64_t sub_10006BB34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006BC70(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_1000857FC();
    }
  }

id sub_10006BCF8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getCoordinatorScopeWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10006BD04(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006BE48(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100085884();
    }
  }

id sub_10006BED0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_convertToGloballyScopedWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10006BEDC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006C0F0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100085990();
    }
  }

id sub_10006C178(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setPlaceholderDisposition:completion:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_10006C184(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006C2C0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100085A18();
    }
  }

id sub_10006C348(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getPlaceholderDispositionWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10006C354(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006C4C4(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100085AA0();
    }
  }

id sub_10006C54C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setProgressHint:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_10006C558(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006C694(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100085B28();
    }
  }

id sub_10006C71C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getProgressHintWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10006C728(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006C880(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100085BB0();
    }
  }

id sub_10006C908(void *a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setRemovability:byClient:completion:", a1[5], a1[6], a1[4]);
}

uint64_t sub_10006C918(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006CA54(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) interestedCoordinatorUUIDs]);
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100085C38();
    }
  }

id sub_10006CADC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_removabilityWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10006CAE8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006CDCC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getPercentComplete:", *(void *)(a1 + 32));
}

uint64_t sub_10006CDD8(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16LL))(0.0);
}

id sub_10006CE48(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setPercentComplete:", *(double *)(a1 + 32));
}

id sub_10006CF20(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getIsComplete:", *(void *)(a1 + 32));
}

uint64_t sub_10006CF2C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void *sub_10006D010(void *result, void *a2)
{
  if (*((_BYTE *)result + 40)) {
    return objc_msgSend(a2, "_remote_setIsComplete:", result[4]);
  }
  return result;
}

uint64_t sub_10006D028(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006D130(void *a1, void *a2)
{
  return objc_msgSend(a2, "_remote_cancelForReason:client:completion:", a1[4], a1[6], a1[5]);
}

uint64_t sub_10006D140(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006D214(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_resetWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10006D220(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006D2F4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getErrorInfo:", *(void *)(a1 + 32));
}

uint64_t sub_10006D300(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006D3DC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_preflightWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10006D3E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006D694(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setStagedPath:", *(void *)(a1 + 32));
}

id sub_10006D76C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getStagedPath:", *(void *)(a1 + 32));
}

uint64_t sub_10006D778(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006D878(uint64_t a1, void *a2)
{
  return objc_msgSend( a2,  "_remote_setTargetLastPathComponent:withCompletion:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
}

uint64_t sub_10006D884(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006D958(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getTargetLastPathComponent:", *(void *)(a1 + 32));
}

uint64_t sub_10006D964(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006DC6C(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 xpcConnection]);
  objc_msgSend(v5, "_remote_setMetadataPromiseUUID:fromConnection:completion:", v3, v6, a1[6]);
}

uint64_t sub_10006DCD0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006DDA4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getMetadataWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10006DDB0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006DEB0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setSinfPromiseUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_10006DEBC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006DF90(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getSinfDataWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10006DF9C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006E080(uint64_t a1, void *a2)
{
  return objc_msgSend( a2,  "_remote_setLaunchProhibited:completion:",  *(unsigned __int8 *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t sub_10006E090(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006E164(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getLaunchProhibitedWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10006E170(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006E270(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setAttributes:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_10006E27C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006E350(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getAttributesWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10006E35C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006E45C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setIconPromiseUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_10006E468(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006E53C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_hasIconPromise:", *(void *)(a1 + 32));
}

uint64_t sub_10006E548(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006E628(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006E69C;
  v4[3] = &unk_1000CEAC8;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "_remote_getIconPromise:", v4);
}

void sub_10006E69C(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
    [v6 addInterestedPromiseUUID:v7];
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_10006E724(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006E84C(void *a1, void *a2)
{
  return objc_msgSend( a2,  "_remote_setIconResourcesPromiseUUID:infoPlistIconContentPromiseUUID:completion:",  a1[4],  a1[5],  a1[6]);
}

uint64_t sub_10006E85C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006E930(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_hasIconResourcesPromise:", *(void *)(a1 + 32));
}

uint64_t sub_10006E93C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006EA18(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getIconResourcesPromiseAndInfoPlistContent:", *(void *)(a1 + 32));
}

uint64_t sub_10006EA24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006EB28(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setLocalizationPromiseUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_10006EB34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006EC08(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_getLocalizationDictionary:", *(void *)(a1 + 32));
}

uint64_t sub_10006EC14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006ED14(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setEntitlementsPromiseUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_10006ED20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006EDF4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_hasEntitlementsPromise:", *(void *)(a1 + 32));
}

uint64_t sub_10006EE00(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006EEE0(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006EF54;
  v4[3] = &unk_1000CEAC8;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "_remote_getEntitlementsPromise:", v4);
}

void sub_10006EF54(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
    [v6 addInterestedPromiseUUID:v7];
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_10006EFDC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006F0DC(uint64_t a1, void *a2)
{
  return objc_msgSend( a2,  "_remote_setInfoPlistLoctablePromiseUUID:completion:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
}

uint64_t sub_10006F0E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006F1BC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_hasInfoPlistLoctablePromise:", *(void *)(a1 + 32));
}

uint64_t sub_10006F1C8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006F2A8(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006F31C;
  v4[3] = &unk_1000CEAC8;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "_remote_getInfoPlistLoctablePromise:", v4);
}

void sub_10006F31C(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
    [v6 addInterestedPromiseUUID:v7];
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_10006F3A4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006F4A4(uint64_t a1, void *a2)
{
  return objc_msgSend( a2,  "_remote_setAppExtensionPlaceholderPromiseUUIDs:completion:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
}

uint64_t sub_10006F4B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006F584(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_hasAppExtensionPlaceholderPromises:", *(void *)(a1 + 32));
}

uint64_t sub_10006F590(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006F670(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006F6E4;
  v4[3] = &unk_1000CEAF0;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "_remote_getAppExtensionPlaceholderPromises:", v4);
}

void sub_10006F6E4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        int v11 = *(void **)(a1 + 32);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) uniqueIdentifier]);
        [v11 addInterestedPromiseUUID:v12];

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_10006F820(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006F8FC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setConfigurationCompleteWithCompletion:", *(void *)(a1 + 32));
}

uint64_t sub_10006F908(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10006FBB4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setTransferPath:", *(void *)(a1 + 32));
}

id sub_10006FC24(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setShouldCopy:", *(unsigned __int8 *)(a1 + 32));
}

id sub_10006FC94(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setTryDeltaCopy:", *(unsigned __int8 *)(a1 + 32));
}

id sub_10006FF0C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setArchiveBytesConsumed:", *(void *)(a1 + 32));
}

id sub_100070184(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_remote_setArchiveBytesConsumed:", *(void *)(a1 + 32));
}

void sub_100070368(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientName]);
    int v7 = 136315650;
    id v8 = "-[IXSClientConnection _client_coordinatorDidRegisterForObservationWithUUID:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to message client %@ : %@",  (uint8_t *)&v7,  0x20u);
  }
}

void sub_10007062C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientName]);
    int v7 = 136315650;
    id v8 = "-[IXSClientConnection _client_coordinatorShouldPrioritizeWithUUID:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to message client %@ : %@",  (uint8_t *)&v7,  0x20u);
  }
}

void sub_1000708F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientName]);
    int v7 = 136315650;
    id v8 = "-[IXSClientConnection _client_coordinatorShouldResumeWithUUID:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to message client %@ : %@",  (uint8_t *)&v7,  0x20u);
  }
}

void sub_100070BB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientName]);
    int v7 = 136315650;
    id v8 = "-[IXSClientConnection _client_coordinatorShouldPauseWithUUID:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to message client %@ : %@",  (uint8_t *)&v7,  0x20u);
  }
}

void sub_100070E88(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientName]);
    int v7 = 136315650;
    id v8 = "-[IXSClientConnection _client_coordinatorWithUUID:configuredPromiseDidBeginFulfillment:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to message client %@ : %@",  (uint8_t *)&v7,  0x20u);
  }
}

void sub_10007114C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientName]);
    int v7 = 136315650;
    id v8 = "-[IXSClientConnection _client_coordinatorShouldBeginRestoringUserDataWithUUID:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to message client %@ : %@",  (uint8_t *)&v7,  0x20u);
  }
}

void sub_10007142C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientName]);
    int v7 = 136315650;
    id v8 = "-[IXSClientConnection _client_coordinatorShouldBeginPostProcessingWithUUID:forRecordPromise:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to message client %@ : %@",  (uint8_t *)&v7,  0x20u);
  }
}

void sub_10007170C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientName]);
    int v7 = 136315650;
    id v8 = "-[IXSClientConnection _client_coordinatorDidInstallPlaceholderWithUUID:forRecordPromise:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to message client %@ : %@",  (uint8_t *)&v7,  0x20u);
  }
}

void sub_1000719EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientName]);
    int v7 = 136315650;
    id v8 = "-[IXSClientConnection _client_coordinatorDidCompleteSuccessfullyWithUUID:forRecordPromise:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to message client %@ : %@",  (uint8_t *)&v7,  0x20u);
  }
}

void sub_100071CD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientName]);
    int v7 = 136315650;
    id v8 = "-[IXSClientConnection _client_coordinatorWithUUID:didCancelWithReason:client:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to message client %@ : %@",  (uint8_t *)&v7,  0x20u);
  }
}

void sub_100071FC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientName]);
    int v7 = 136315650;
    id v8 = "-[IXSClientConnection _client_coordinatorWithUUID:didUpdateProgress:forPhase:overallProgress:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to message client %@ : %@",  (uint8_t *)&v7,  0x20u);
  }
}

void sub_100072284(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientName]);
    int v7 = 136315650;
    id v8 = "-[IXSClientConnection _client_promiseDidCompleteSuccessfullyWithUUID:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to message client %@ : %@",  (uint8_t *)&v7,  0x20u);
  }
}

void sub_10007256C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientName]);
    int v7 = 136315650;
    id v8 = "-[IXSClientConnection _client_promiseWithUUID:didCancelWithReason:client:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to message client %@ : %@",  (uint8_t *)&v7,  0x20u);
  }
}

void sub_100072758( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

id sub_1000727A8()
{
  return [v0 creatorIdentifier];
}

  ;
}

  ;
}

void sub_1000727E8(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

uint64_t sub_100072834@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = result;
  *(_WORD *)(a2 + 22) = 2112;
  *(void *)(a2 + 24) = 0LL;
  return result;
}

  ;
}

id sub_100072868(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v1, v2) & 1) != 0) {
      id v3 = v1;
    }
    else {
      id v3 = (id)objc_claimAutoreleasedReturnValue([v1 description]);
    }
    uint64_t v4 = v3;
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return v4;
}

uint64_t sub_1000728D0(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    uint64_t v5 = sub_100072930(v3, a2);
  }
  else {
    uint64_t v5 = 0LL;
  }

  return v5;
}

uint64_t sub_100072930(void *a1, uint64_t a2)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = a1;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      int v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ((objc_opt_isKindOfClass(*(void *)(*((void *)&v10 + 1) + 8LL * (void)v7), a2) & 1) == 0)
        {
          uint64_t v8 = 0LL;
          goto LABEL_11;
        }

        int v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  uint64_t v8 = 1LL;
LABEL_11:

  return v8;
}

uint64_t sub_100072A38(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSSet);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    uint64_t v5 = sub_100072930(v3, a2);
  }
  else {
    uint64_t v5 = 0LL;
  }

  return v5;
}

uint64_t sub_100072A98(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9 = a1;
  uint64_t v13 = 0LL;
  __int128 v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 1;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100072BB8;
  v12[3] = &unk_1000CEF60;
  v12[4] = &v13;
  v12[5] = a2;
  v12[6] = a3;
  v12[7] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v12[8] = a4;
  v12[9] = a5;
  v12[10] = objc_opt_class(&OBJC_CLASS___NSArray);
  v12[11] = objc_opt_class(&OBJC_CLASS___NSSet);
  [v9 enumerateKeysAndObjectsUsingBlock:v12];
  uint64_t v10 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v10;
}

void sub_100072B98( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_100072BB8(void *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v9 = a3;
  if ((objc_opt_isKindOfClass(a2, a1[5]) & 1) != 0 && (objc_opt_isKindOfClass(v9, a1[6]) & 1) != 0)
  {
    uint64_t v7 = a1[6];
    if (v7 == a1[7])
    {
      char v8 = sub_100072A98(v9, a1[8], a1[9], 0LL, 0LL);
    }

    else if (v7 == a1[10])
    {
      char v8 = sub_1000728D0(v9, a1[8]);
    }

    else
    {
      if (v7 != a1[11]) {
        goto LABEL_11;
      }
      char v8 = sub_100072A38(v9, a1[8]);
    }

    *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = v8;
  }

  else
  {
    *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 0;
  }

uint64_t sub_100072CA4(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100072A98(a1, a2, a3, 0LL, 0LL);
}

BOOL sub_100072CB0(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  BOOL v3 = (objc_opt_isKindOfClass(v1, v2) & 1) != 0 && CFPropertyListIsValid(v1, kCFPropertyListBinaryFormat_v1_0) == 1;

  return v3;
}

id sub_100072D10(void *a1, id a2)
{
  id v3 = a1;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    a2 = [v3 BOOLValue];
  }

  return a2;
}

id sub_100072D64(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (!v3) {
    goto LABEL_11;
  }
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    if (sub_1000728D0(v3, a2))
    {
      id v5 = v3;
LABEL_7:
      id v6 = v5;
      goto LABEL_12;
    }

    goto LABEL_11;
  }

  if ((objc_opt_isKindOfClass(v3, a2) & 1) != 0)
  {
    id v10 = v3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    goto LABEL_7;
  }

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSSet);
  if ((objc_opt_isKindOfClass(v3, v7) & 1) == 0)
  {
LABEL_11:
    id v6 = 0LL;
    goto LABEL_12;
  }

  char v8 = (void *)objc_claimAutoreleasedReturnValue([v3 allObjects]);
  else {
    id v6 = 0LL;
  }

LABEL_12:
  return v6;
}

id sub_100072E88(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
          if ((objc_opt_isKindOfClass(v11, a2) & 1) != 0) {
            objc_msgSend(v5, "addObject:", v11, (void)v14);
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v8);
    }

    id v12 = [v5 copy];
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

id sub_100072FE8(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 0LL;
  }
  id v5 = a1;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000730B0;
  v9[3] = &unk_1000CEF88;
  uint64_t v11 = a2;
  uint64_t v12 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v5 count]));
  id v6 = v10;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = [v6 copy];
  return v7;
}

void sub_1000730B0(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    int v7 = objc_opt_isKindOfClass(v10, v6) ^ 1;
  }
  else {
    int v7 = 0;
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    int v9 = objc_opt_isKindOfClass(v5, v8) ^ 1;
  }
  else {
    int v9 = 0;
  }
  if (((v7 | v9) & 1) == 0) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v10];
  }
}

void sub_1000731BC(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  uint64_t v2 = (void *)qword_1000E8FD8;
  qword_1000E8FD8 = (uint64_t)v1;
}

void sub_100073320(uint64_t a1)
{
  if (!*(void *)(a1 + 40) || *(_BYTE *)(a1 + 48))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v11 = 0LL;
    unsigned __int8 v3 = objc_msgSend(v2, "_onQueue_writeRemovabilityWithError:", &v11);
    id v4 = v11;
    int v5 = *(unsigned __int8 *)(a1 + 48);
    if ((v3 & 1) != 0)
    {
      if (*(_BYTE *)(a1 + 48))
      {
        uint64_t v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
        int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v13 = "-[IXSAppRemovabilityManager init]_block_invoke";
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Successfully migrated legacy removability plist to the new format with change clock",  buf,  0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "_onQueue_removeLegacyRemovabilityFiles");
      }
    }

    else
    {
      uint64_t v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
      int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      if (v5)
      {
        if (v10) {
          sub_100085D2C();
        }
      }

      else if (v10)
      {
        sub_100085CC0();
      }
    }
  }

void sub_100073800( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100073818(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100073828(uint64_t a1)
{
}

void sub_100073830(uint64_t a1)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allAppRemovability]);
  uint64_t v2 = sub_10002EDF4(v6, *(void *)(a1 + 40), 1LL, 1LL);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8LL);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10007396C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100073984(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allAppRemovability]);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = sub_10002EE94( v2,  *(void *)(a1 + 40),  (id)1,  *(void *)(a1 + 56));
}

void sub_100073CB0(_Unwind_Exception *a1)
{
}

void sub_100073CDC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allAppRemovability]);
  id v3 = sub_10002EE94(v2, *(void *)(a1 + 40), (id)1, *(void *)(a1 + 64));

  if (*(id *)(a1 + 72) == v3)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allAppRemovability]);
    int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:*(void *)(a1 + 40)]);

    if (v5)
    {
      [v5 updateRemovability:*(void *)(a1 + 72) forClient:*(void *)(a1 + 64)];
      if ([v5 isEmpty])
      {

        int v5 = 0LL;
      }

      id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allAppRemovability]);
      [v6 setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];
    }

    int v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id obj = *(id *)(v8 + 40);
    unsigned __int8 v9 = objc_msgSend(v7, "_onQueue_writeRemovabilityWithError:", &obj);
    objc_storeStrong((id *)(v8 + 40), obj);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v9;
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
      objc_msgSend( *(id *)(a1 + 32),  "_onQueue_handleStateChangeForIdentity:updatedRemovability:",  *(void *)(a1 + 40),  *(void *)(a1 + 72));
    }
  }

void sub_100073E10(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allAppRemovability]);
  id v3 = sub_10002EE94(v2, *(void *)(a1 + 40), 0LL, *(void *)(a1 + 64));

  if (*(id *)(a1 + 72) == v3)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allAppRemovability]);
    int v5 = (IXAppRemovabilityMetadataList *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:*(void *)(a1 + 40)]);

    if (v5)
    {
      -[IXAppRemovabilityMetadataList updateRemovability:forClient:]( v5,  "updateRemovability:forClient:",  *(void *)(a1 + 72),  *(void *)(a1 + 64));
    }

    else
    {
      int v5 = -[IXAppRemovabilityMetadataList initWithInitialRemovability:client:]( objc_alloc(&OBJC_CLASS___IXAppRemovabilityMetadataList),  "initWithInitialRemovability:client:",  *(void *)(a1 + 72),  *(void *)(a1 + 64));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allAppRemovability]);
      [v6 setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];
    }

    int v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id obj = *(id *)(v8 + 40);
    unsigned __int8 v9 = objc_msgSend(v7, "_onQueue_writeRemovabilityWithError:", &obj);
    objc_storeStrong((id *)(v8 + 40), obj);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v9;
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
      objc_msgSend( *(id *)(a1 + 32),  "_onQueue_handleStateChangeForIdentity:updatedRemovability:",  *(void *)(a1 + 40),  *(void *)(a1 + 72));
    }
  }

void sub_1000743D4(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allAppRemovability]);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100074454;
  v3[3] = &unk_1000CF028;
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t sub_100074454(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  *a4 = result ^ 1;
  return result;
}

uint64_t sub_100074514(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 description]);
  int v7 = *(void **)(a1 + 32);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);

  [v7 setObject:v6 forKeyedSubscript:v8];
  return 1LL;
}

void sub_1000746F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10007470C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allAppRemovability]);
  id v3 = [v2 copy];

  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleID]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleID]);
        unsigned int v13 = [v11 isEqualToString:v12];

        if (v13)
        {
          -[NSMutableArray addObject:](v4, "addObject:", v10);
          goto LABEL_11;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

void sub_10007491C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = a2;
  id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    id v11 = "-[IXSAppRemovabilityManager clearRemovabilityStateForIdentity:error:]_block_invoke_2";
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: Clearing removability for identity %@",  (uint8_t *)&v10,  0x16u);
  }

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allAppRemovability]);
  [v9 removeObjectForKey:v6];

  *a4 = 0;
}

id sub_100074A14(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_handleStateChangeForIdentity:updatedRemovability:", a2, 1);
  *a4 = 0;
  return result;
}

void sub_100074B58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100074B7C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) removabilityChangeClock]);
  id v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v9 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allAppRemovability]);
  id v6 = [v9 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void sub_100074E78(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 10LL) = 1;
  *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = 1;
}

id sub_1000750B0(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) percentComplete];
  *(void *)(*(void *)(a1 + 32) + 72LL) = v3;
  *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = 1;
  return result;
}

id sub_100075530(uint64_t a1)
{
  return [*(id *)(a1 + 32) promiseDidReset:*(void *)(a1 + 40)];
}

id sub_1000758D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) promise:*(void *)(a1 + 40) didCancelForReason:*(void *)(a1 + 48) client:*(void *)(a1 + 56)];
}

void sub_1000758E0(void *a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[IXSAppInstallObserverManager sharedInstance]( &OBJC_CLASS___IXSAppInstallObserverManager,  "sharedInstance"));
  [v2 promise:a1[4] canceledWithReason:a1[5] client:a1[6]];
}

void sub_100075BF8( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v11 = objc_begin_catch(a1);
      __int16 v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315394;
        *(void *)((char *)&buf + 4) = "-[IXSDataPromise saveState]";
        WORD6(buf) = 2112;
        *(void *)((char *)&buf + 14) = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to encode object: %@",  (uint8_t *)&buf,  0x16u);
      }

      objc_end_catch();
      JUMPOUT(0x100075BC4LL);
    }

    objc_begin_catch(a1);
    objc_exception_rethrow();
    __break(1u);
    JUMPOUT(0x100075CB4LL);
  }

  _Unwind_Resume(a1);
}

id sub_10007627C(uint64_t a1)
{
  return [*(id *)(a1 + 32) promiseDidComplete:*(void *)(a1 + 40)];
}

void sub_100076288(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[IXSAppInstallObserverManager sharedInstance]( &OBJC_CLASS___IXSAppInstallObserverManager,  "sharedInstance"));
  [v2 promiseDidCompleteSuccessfully:*(void *)(a1 + 32)];
}

id sub_1000765DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) promiseDidBegin:*(void *)(a1 + 40)];
}

id sub_1000765E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) promise:*(void *)(a1 + 40) didUpdateProgress:*(double *)(a1 + 48)];
}

id sub_1000768E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) promiseDidBegin:*(void *)(a1 + 40)];
}

id sub_1000768F0(uint64_t a1)
{
  return [*(id *)(a1 + 32) promise:*(void *)(a1 + 40) didUpdateProgress:*(double *)(a1 + 48)];
}

id sub_100076900(uint64_t a1)
{
  return [*(id *)(a1 + 32) promiseDidComplete:*(void *)(a1 + 40)];
}

void sub_100076D1C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100076D34(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) percentComplete];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3;
  return result;
}

id sub_100076DF8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPercentComplete:*(double *)(a1 + 40)];
}

void sub_100076EDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100076EF4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isComplete];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

void sub_100077058( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100077070(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100077080(uint64_t a1)
{
}

void sub_100077088(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL)) {
    [*(id *)(a1 + 32) setComplete:1];
  }
}

void sub_100077210( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100077228(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[7];
  id v8 = 0LL;
  unsigned __int8 v5 = [v2 cancelForReason:v3 client:v4 error:&v8];
  id v6 = v8;
  id v7 = v8;
  if ((v5 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), v6);
  }
}

void sub_1000774E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_100077514(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id result = [*(id *)(a1 + 32) isComplete];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = (_BYTE)result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL)
    && !*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    return [*(id *)(a1 + 32) reset];
  }

  return result;
}

void sub_1000776BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_1000776E0(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id result = [*(id *)(a1 + 32) errorSourceIdentifier];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
  return result;
}

LABEL_4:
    v4[2](v4, 0LL);
    goto LABEL_32;
  }

  __int128 v79 = @"CACHE_DELETE_VOLUME";
  __int128 v80 = v10;
  id v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v80,  &v79,  1LL));
  uint64_t v24 = (void *)CacheDeleteCopyPurgeableSpaceWithInfo();
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:@"CACHE_DELETE_ERROR"]);
  uint64_t v48 = v24;

  if (v25)
  {
    id v26 = sub_1000047B4((uint64_t)off_1000E8CA0);
    __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = (IXSDataPromise *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:@"CACHE_DELETE_ERROR"]);
      *(_DWORD *)buf = 136315394;
      uint64_t v66 = "-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]";
      __int128 v67 = 2112;
      id v68 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to get purgable space from Cache Delete: %@",  buf,  0x16u);
    }

    __int16 v29 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v66 = "-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]";
      __int128 v67 = 2112;
      id v68 = self;
      __int16 v69 = 2048;
      __int128 v70 = v19;
      __int128 v71 = 2048;
      __int128 v72 = (char *)v16;
      __int128 v73 = 2048;
      id v74 = (char *)v16;
      __int128 v75 = 2112;
      __int128 v76 = 0LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%s: Not enough space for promise %@: %llu bytes needed, %llu bytes available (%llu free, purgable unavailable). : %@",  buf,  0x3Eu);
    }

    uint64_t v32 = sub_10003556C( (uint64_t)"-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]",  729LL,  @"IXUserPresentableErrorDomain",  0xBuLL,  0LL,  0LL,  @"Not enough space for promise %@: %llu bytes needed, %llu bytes available (%llu free, purgable unavailable).",  v31,  (uint64_t)self);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    ((void (**)(id, void *))v4)[2](v4, v33);
  }

  else
  {
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);
    uint64_t v46 = (char *)[v35 unsignedLongLongValue];

    if (&v46[v16] >= v19)
    {
      v63[1] = @"CACHE_DELETE_AMOUNT";
      v64[0] = v10;
      v63[0] = @"CACHE_DELETE_VOLUME";
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  &v19[-v16]));
      v64[1] = v41;
      uint64_t v45 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v64,  v63,  2LL));

      __int16 v42 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v66 = "-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]";
        __int128 v67 = 2112;
        id v68 = self;
        __int16 v69 = 2048;
        __int128 v70 = v19;
        __int128 v71 = 2048;
        __int128 v72 = (char *)v16;
        __int128 v73 = 2048;
        id v74 = v46;
        __int128 v75 = 2048;
        __int128 v76 = &v19[-v16];
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "%s: Promise %@: %llu bytes needed, %llu bytes available.  %llu bytes can be purged, requesting %llu bytes be purged.",  buf,  0x3Eu);
      }

      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472LL;
      v49[2] = sub_100077FCC;
      v49[3] = &unk_1000CF0E0;
      uint64_t v51 = &v19[-v16];
      void v49[4] = self;
      id v50 = v4;
      uint64_t v52 = v19;
      id v53 = v16;
      __int16 v44 = (const void *)CacheDeletePurgeSpaceWithInfo(v45, v49);
      if (v44) {
        CFRelease(v44);
      }

      id v47 = (void *)v45;
    }

    else
    {
      __int128 v36 = sub_1000047B4((uint64_t)off_1000E8CA0);
      __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v66 = "-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]";
        __int128 v67 = 2112;
        id v68 = self;
        __int16 v69 = 2048;
        __int128 v70 = v19;
        __int128 v71 = 2048;
        __int128 v72 = &v46[v16];
        __int128 v73 = 2048;
        id v74 = (char *)v16;
        __int128 v75 = 2048;
        __int128 v76 = v46;
        id v77 = 2112;
        id v78 = 0LL;
        _os_log_error_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "%s: Not enough space for promise %@: %llu bytes needed, %llu bytes available (%llu free, %llu purgable). : %@",  buf,  0x48u);
      }

      uint64_t v39 = sub_10003556C( (uint64_t)"-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]",  737LL,  @"IXUserPresentableErrorDomain",  0xBuLL,  0LL,  0LL,  @"Not enough space for promise %@: %llu bytes needed, %llu bytes available (%llu free, %llu purgable).",  v38,  (uint64_t)self);
      __int16 v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      ((void (**)(id, void *))v4)[2](v4, v40);
    }
  }

LABEL_32:
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
}

void sub_100077F10( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39)
{
}

id sub_100077F88(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) totalBytesNeededOnDisk];
  id result = [*(id *)(a1 + 32) bytesConsumedOnDisk];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
  return result;
}

void sub_100077FCC(void *a1, void *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);
  id v5 = [v4 unsignedLongLongValue];

  unint64_t v6 = a1[6];
  id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if ((unint64_t)v5 >= v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = a1[4];
      *(_DWORD *)buf = 136315650;
      __int128 v15 = "-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]_block_invoke";
      __int16 v16 = 2048;
      id v17 = v5;
      __int16 v18 = 2112;
      uint64_t v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: %llu bytes purged, enough for promise %@.",  buf,  0x20u);
    }

    (*(void (**)(void))(a1[5] + 16LL))();
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10008629C(a1, (uint64_t)v5, v9);
    }

    id v11 = sub_10003556C( (uint64_t)"-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]_block_invoke",  758LL,  @"IXUserPresentableErrorDomain",  0xBuLL,  0LL,  0LL,  @"Not enough space for promise %@: %llu bytes needed, %llu bytes available (%llu bytes were purged).",  v10,  a1[4]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    (*(void (**)(void))(a1[5] + 16LL))();
  }
}

id sub_10007817C(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  Unique = (__CFBundle *)_CFBundleCreateUnique(kCFAllocatorDefault, v5);
  if (Unique)
  {
    id v8 = Unique;
    id v18 = 0LL;
    id v9 = sub_1000782C8(Unique, v6, &v18);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = v18;
    CFRelease(v8);
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

  uint64_t v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_100086358(v5, v13);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
  id v16 = sub_10003556C( (uint64_t)"LoadInfoPlistFromBundleAtURL",  24LL,  @"IXErrorDomain",  0xAuLL,  0LL,  0LL,  @"Failed to create CFBundle from %@",  v15,  (uint64_t)v14);
  id v11 = (id)objc_claimAutoreleasedReturnValue(v16);

  uint64_t v10 = 0LL;
  if (a3)
  {
LABEL_7:
    if (!v10) {
      *a3 = v11;
    }
  }

id sub_1000782C8(__CFBundle *a1, void *a2, void *a3)
{
  id v5 = a2;
  if (!v5)
  {
    CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(a1);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(InfoDictionary);
    FilteredInfoPlist = v10;
    if (v10)
    {
      id v11 = [v10 mutableCopy];
      id v8 = v11;
      if (v11) {
        [v11 removeObjectForKey:@"CFBundleInfoPlistURL"];
      }
      goto LABEL_8;
    }

    __int128 v23 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1000863E8();
    }

    id v16 = sub_10003556C( (uint64_t)"LoadInfoPlistFromBundle",  72LL,  @"IXErrorDomain",  0xFuLL,  0LL,  0LL,  @"CFBundleGetInfoDictionary returned NULL for bundle %@",  v25,  (uint64_t)a1);
    goto LABEL_18;
  }

  FilteredInfoPlist = (void *)_CFBundleCreateFilteredInfoPlist(a1, v5, 1LL);
  if (!FilteredInfoPlist)
  {
    uint64_t v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10008645C((uint64_t)v5, (uint64_t)a1, v14);
    }

    id v16 = sub_10003556C( (uint64_t)"LoadInfoPlistFromBundle",  55LL,  @"IXErrorDomain",  0xFuLL,  0LL,  0LL,  @"Failed to get filtered Info.plist with keys %@ from bundle %@",  v15,  (uint64_t)v5);
LABEL_18:
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v16);
LABEL_19:
    id v8 = 0LL;
    goto LABEL_20;
  }

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(FilteredInfoPlist, v7) & 1) == 0)
  {
    id v17 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000864EC((uint64_t)a1, (uint64_t)FilteredInfoPlist, v18);
    }

    uint64_t v19 = (objc_class *)objc_opt_class(FilteredInfoPlist);
    __int128 v20 = NSStringFromClass(v19);
    __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(v20);
    id v22 = sub_10003556C( (uint64_t)"LoadInfoPlistFromBundle",  60LL,  @"IXErrorDomain",  0x10uLL,  0LL,  0LL,  @"Object returned from _CFBundleCreateFilteredInfoPlist for %@ was not a dictionary, was type %@",  v21,  (uint64_t)a1);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v22);

    goto LABEL_19;
  }

  id v8 = [FilteredInfoPlist mutableCopy];
LABEL_8:
  uint64_t v12 = 0LL;
LABEL_20:

  if (a3 && !v8) {
    *a3 = v12;
  }

  return v8;
}

id sub_100078524(void *a1, void *a2)
{
  id v3 = a1;
  id v29 = 0LL;
  id v4 = IXUrlsForItemsInDirectoryAtURL(v3, 1, &v29);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v29;
  if (!v5)
  {
LABEL_16:
    if (a2)
    {
      id v6 = v6;
      id v15 = 0LL;
      *a2 = v6;
    }

    else
    {
      id v15 = 0LL;
    }

    goto LABEL_19;
  }

  __int128 v23 = a2;
  uint64_t v24 = v3;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (!v8)
  {
LABEL_10:

LABEL_13:
    id v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    id v3 = v24;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000865B0(v24, v17);
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v24 path]);
    id v20 = sub_10003556C( (uint64_t)"AppURLFromExtractedPayloadDir",  112LL,  @"IXErrorDomain",  0xAuLL,  0LL,  0LL,  @"Failed to find a .app inside the extracted contents at %@",  v19,  (uint64_t)v18);
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);

    id v6 = (id)v21;
    a2 = v23;
    goto LABEL_16;
  }

  id v9 = v8;
  uint64_t v10 = *(void *)v26;
LABEL_4:
  uint64_t v11 = 0LL;
  while (1)
  {
    if (*(void *)v26 != v10) {
      objc_enumerationMutation(v7);
    }
    uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pathExtension]);
    unsigned __int8 v14 = [v13 isEqualToString:@"app"];

    if ((v14 & 1) != 0) {
      break;
    }
    if (v9 == (id)++v11)
    {
      id v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v9) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  id v15 = v12;

  if (!v15) {
    goto LABEL_13;
  }
  id v3 = v24;
LABEL_19:

  return v15;
}

void sub_10007882C(_Unwind_Exception *a1)
{
}

void sub_100078D84(_Unwind_Exception *a1)
{
}

void sub_100078E4C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[IXSErrorPresenter presentErrorForIdentities:code:underlyingError:errorSource:]";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: Identities array was empty; ignoring request to present alert.",
    (uint8_t *)&v1,
    0xCu);
  sub_10000455C();
}

void sub_100078EC8(void *a1)
{
  int v1 = (void *)objc_claimAutoreleasedReturnValue([a1 objectAtIndexedSubscript:0]);
  sub_100004564();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Attempted to present error for code %lu for identity %@ but no app with that bundle ID is installed.",  v4,  v5,  v6,  v7,  2u);
}

void sub_100078F70(void *a1)
{
}

void sub_100078FFC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100079074( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000790F0(void *a1, _OWORD *a2)
{
  int v4 = *__error();
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  strerror(v4);
  uint64_t v6 = _os_log_send_and_compose_impl(v5, a1, a2, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  _os_crash_msg(*a1, v6);
  __break(1u);
}

void sub_1000791BC()
{
  int v2 = 136315650;
  sub_1000066B0();
  sub_1000066CC((void *)&_mh_execute_header, v0, v1, "%s: Failed to serialize state : %@ (Error : %@)", v2);
}

void sub_10007922C(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "_CreateOSStateDiagnosticsForDataWithTitle";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s: Too much data to include in state dump : %@",  (uint8_t *)&v2,  0x16u);
}

void sub_1000792B4()
{
  int v2 = 136315650;
  sub_1000066B0();
  sub_1000066CC((void *)&_mh_execute_header, v0, v1, "%s: Failed to enumerate promise staging directory at %@ : %@", v2);
}

void sub_100079324(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 136315650;
  __int16 v4 = "-[IXSPowerAssertion initWithAssertionName:details:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: IOPMAssertionCreateWithDescription for name %@ returned %d",  (uint8_t *)&v3,  0x1Cu);
}

void sub_1000793BC()
{
  v1[0] = 136315394;
  sub_1000072BC();
  _os_log_fault_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_FAULT,  "%s: Attempting to set the same termination assertion for %@",  (uint8_t *)v1,  0x16u);
}

void sub_100079438(uint64_t *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v3 = *a1;
  int v4 = 136315650;
  __int16 v5 = "-[IXSRevertManager _revertAppWithIdentity:forClientWithName:completion:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  sub_1000072B0( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "%s: Failed to revert application with identity %@ : %@",  (uint8_t *)&v4);
}

void sub_1000794C8()
{
  v3[0] = 136315650;
  sub_1000072BC();
  __int16 v4 = v0;
  uint64_t v5 = 0LL;
  sub_1000072B0( (void *)&_mh_execute_header,  v1,  v2,  "%s: Failed to revert app because a coordinator %@ already existed : %@",  (uint8_t *)v3);
}

void sub_100079544()
{
}

void sub_1000795B4()
{
}

void sub_100079624()
{
}

void sub_100079694()
{
}

void sub_100079704()
{
}

void sub_100079774(void *a1, _OWORD *a2)
{
  int v4 = *__error();
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_100009D80()) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  strerror(v4);
  uint64_t v7 = sub_100009D70(v5, (uint64_t)a1, (uint64_t)a2, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100079820(void *a1, _OWORD *a2)
{
  int v4 = *__error();
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_100009D80()) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  strerror(v4);
  uint64_t v7 = sub_100009D70(v5, (uint64_t)a1, (uint64_t)a2, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_1000798E0(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100009D34(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009DA8(v6);
  __break(1u);
}

void sub_100079948(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100009D34(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009DA8(v6);
  __break(1u);
}

void sub_1000799B0(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100009D34(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009DA8(v6);
  __break(1u);
}

void sub_100079A18(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100009D34(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009DA8(v6);
  __break(1u);
}

void sub_100079A80(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 136315650;
  uint64_t v4 = "-[IXGlobalConfiguration _dataStorageHomeURLWithError:]";
  __int16 v5 = 2048;
  uint64_t v6 = v2;
  __int16 v7 = 2112;
  uint64_t v8 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s: Failed to get group container path for group 'systemgroup.com.apple.installcoordinationd'; container_system_grou"
    "p_path_for_identifier returned %llu : %@",
    (uint8_t *)&v3,
    0x20u);
}

void sub_100079B18(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100009D34(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009DA8(v6);
  __break(1u);
}

void sub_100079B80(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_100009D34(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009DA8(v6);
  __break(1u);
}

void sub_100079BE8(int a1, uint64_t a2, os_log_s *a3)
{
  int v5 = 136315650;
  uint64_t v6 = "-[IXSAppDeletionEligibilityManager _eligibilityAnswerForDomain:]";
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  __int16 v9 = 2080;
  uint64_t v10 = strerror(a1);
  sub_1000072B0( (void *)&_mh_execute_header,  a3,  v4,  "%s: Unable to query eligibility deletion for domain %llu : %s",  (uint8_t *)&v5);
}

void sub_100079C8C(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v3 = 136315650;
  uint64_t v4 = "-[IXSAppDeletionEligibilityManager _onQueue_setAppRemovabilityForSystemAppPlaceholder:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  sub_1000072B0( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "%s: Failed to resolve persona for %@ : %@. Skipping without setting conditional removability",  (uint8_t *)&v3);
}

void sub_100079D18( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000C24C( (void *)&_mh_execute_header,  a1,  a3,  "%s: UserManagement returned nil for the current thread's persona",  a5,  a6,  a7,  a8,  2u);
  sub_10000455C();
}

void sub_100079D88(uint64_t a1, void *a2, os_log_s *a3)
{
  v6[0] = 136315650;
  sub_10000C25C();
  uint64_t v7 = a1;
  __int16 v8 = 2048;
  uint64_t v9 = v5;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_FAULT,  "%s: Failed to parse the plist key: %@ as there are unexpected components: %lu",  (uint8_t *)v6,  0x20u);
}

void sub_100079E30( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100079EA0(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 bundleID]);
  v9[0] = 136315650;
  sub_10000C25C();
  uint64_t v10 = v6;
  __int16 v11 = v7;
  uint64_t v12 = a2;
  sub_1000072B0((void *)&_mh_execute_header, a3, v8, "%s: Client provided invalid persona for %@ : %@", (uint8_t *)v9);
}

void sub_100079F4C()
{
  sub_10000454C( (void *)&_mh_execute_header,  v0,  v1,  "%s: SecTaskCreateFromSelf returned NULL when attempting to fetch UM entitlement : %@",  v2,  v3,  v4,  v5,  2u);
  sub_10000455C();
}

void sub_100079FBC(void **a1)
{
  uint64_t v1 = *a1;
  sub_10000C25C();
  sub_10000454C( (void *)&_mh_execute_header,  v2,  v3,  "%s: SecTaskCopyValueForEntitlement returned NULL when attempting to fetch the value for the entitlement com.apple. usermanagerd.persona.fetch in the current process. : %@",  v4,  v5,  v6,  v7,  2u);
}

void sub_10007A040()
{
}

void sub_10007A0B0(uint64_t a1, int __errnum, os_log_s *a3)
{
  int v4 = 136315906;
  uint64_t v5 = "_ClientProcessLookupMachPortName";
  __int16 v6 = 2080;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  uint64_t v9 = strerror(__errnum);
  __int16 v10 = 2112;
  uint64_t v11 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%s: sandbox_check returned an error when checking if this process can mach-lookup %s : %s : %@",  (uint8_t *)&v4,  0x2Au);
}

void sub_10007A168(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 136315650;
  int v4 = "_ClientProcessLookupMachPortName";
  __int16 v5 = 2080;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = 0LL;
  sub_1000072B0( (void *)&_mh_execute_header,  a2,  a3,  "%s: This process does not have sandbox access to mach-lookup %s : %@",  (uint8_t *)&v3);
}

void sub_10007A1F4(void *a1, uint64_t a2, os_log_s *a3)
{
  id v5 = sub_10000C330(a1);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  int v7 = 136316162;
  uint64_t v8 = "IXValidateMobileInstallationSPIEntitlement";
  __int16 v9 = 2112;
  __int16 v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = @"com.apple.private.mobileinstall.allowedSPI";
  __int16 v13 = 2112;
  uint64_t v14 = a2;
  __int16 v15 = 2112;
  uint64_t v16 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%s: Process %@ is required to have an entitlement named %@ with an array containing %@ to call this SPI. : %@",  (uint8_t *)&v7,  0x34u);
}

void sub_10007A2C8(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  int v3 = "-[IXSCoordinatorProgress _notifyDelegateAndUpdateProgressWithPhaseCompleted:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%s: Invoking delegate for progress update: %@",  (uint8_t *)&v2,  0x16u);
}

void sub_10007A350( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10007A3C0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10007A430()
{
}

void sub_10007A49C()
{
}

void sub_10007A508(uint64_t a1, void *a2)
{
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a2 descString]);
  sub_100011B60((void *)&_mh_execute_header, v2, v3, "%s: Running work for %@: %@", v4, v5, v6, v7, 2u);

  sub_100011B74();
}

void sub_10007A5AC()
{
}

void sub_10007A618()
{
}

void sub_10007A684(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 activeIdentities]);
  [v2 count];
  [a1 width];
  sub_100011B60( (void *)&_mh_execute_header,  v3,  v4,  "%s: %lu operations already active and %lu allowed; not dequeueing more work.",
    v5,
    v6,
    v7,
    v8,
    2u);

  sub_100011B74();
}

void sub_10007A734(uint64_t a1)
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) descString]);
  sub_100011B60((void *)&_mh_execute_header, v1, v2, "%s: Finished work for %@: %@", v3, v4, v5, v6, 2u);

  sub_100011B74();
}

void sub_10007A7D4()
{
  v3[0] = 136315650;
  sub_1000072BC();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "%s: Enqueueing operation for %@ : %@",  (uint8_t *)v3,  0x20u);
}

void sub_10007A85C()
{
  int v2 = 136315650;
  sub_1000066B0();
  sub_1000066CC( (void *)&_mh_execute_header,  v0,  v1,  "%s: Failed to send LSApplicationNotificationTypeUninstallDidFail notification for %@ : %@",  v2);
}

void sub_10007A8CC()
{
  int v2 = 136315650;
  sub_1000066B0();
  sub_1000066CC( (void *)&_mh_execute_header,  v0,  v1,  "%s: Failed to send LSApplicationNotificationTypeApplicationWillBeUninstalled notification for %@ : %@",  v2);
}

void sub_10007A93C(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "IXReportIncidentUsingAutoBugCapture";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s: Failed to report using ABC with signature: %@",  (uint8_t *)&v2,  0x16u);
}

void sub_10007A9C4()
{
  v1[0] = 136315650;
  sub_1000066B0();
  _os_log_error_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_ERROR,  "%s: Could not get LSApplicationRecord for app with identity %@ : %@",  (uint8_t *)v1,  0x20u);
}

void sub_10007AA44()
{
  v2[0] = 136315906;
  sub_1000066B0();
  __int16 v3 = v0;
  uint64_t v4 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "%s: Predicate %@ did not match for LSApplicationRecord %@ : %@",  (uint8_t *)v2,  0x2Au);
}

void sub_10007AACC()
{
}

void sub_10007AB40()
{
}

void sub_10007ABB4()
{
  v1[0] = 136315650;
  sub_1000066B0();
  _os_log_fault_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_FAULT,  "%s: Failed to invalidate app reference %@ : %@",  (uint8_t *)v1,  0x20u);
}

void sub_10007AC34()
{
  int v2 = 136315650;
  sub_1000066B0();
  sub_100013700( (void *)&_mh_execute_header,  v0,  v1,  "%s: Failed to look up LSApplicationRecord from fallback bundle ID %@ : %@",  v2);
}

void sub_10007ACA4()
{
  int v2 = 136315650;
  sub_1000066B0();
  sub_100013700((void *)&_mh_execute_header, v0, v1, "%s: Failed to fulfill record promise %@ : %@", v2);
}

void sub_10007AD14(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v6 = (objc_class *)objc_opt_class(a2);
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  int v9 = 136315906;
  __int16 v10 = "_FulfillLSRecordPromise";
  __int16 v11 = 2112;
  uint64_t v12 = a1;
  __int16 v13 = 2112;
  uint64_t v14 = v8;
  __int16 v15 = 2112;
  uint64_t v16 = a2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_FAULT,  "%s: Expected LSApplicationRecord instance from fulfilling LSRecord promise %@ but got instance with class %@ instead (%@)",  (uint8_t *)&v9,  0x2Au);
}

void sub_10007ADE4(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315650;
  *(void *)(buf + 4) = "IXApplicationRecordForIdentityInDomain";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2112;
  *((void *)buf + 3) = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: Unexpected value for installation domain: %@ : %@",  buf,  0x20u);
}

void sub_10007AE54(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315650;
  uint64_t v4 = "-[IXSAppUninstaller _acquireTerminationAssertionForIdentity:withError:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: Failed to query linked children for app with identity: %@ : %@",  (uint8_t *)&v3,  0x20u);
  sub_1000176BC();
}

void sub_10007AEE4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000176AC( (void *)&_mh_execute_header,  a2,  a3,  "%s: -[LSApplicationWorkspace uninstallApplication:] for %@ returned NO but did not set an error. : %@",  a5,  a6,  a7,  a8,  2u);
  sub_1000176BC();
}

void sub_10007AF68()
{
}

void sub_10007AFD4(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[IXSAppUninstaller _promptForUnlockOfAppRecord:identity:clientName:flags:completion:removability:]";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: _promptForUnlockOfAppRecord not implemnented, should not have been called",  (uint8_t *)&v1,  0xCu);
}

void sub_10007B054()
{
}

void sub_10007B0C0()
{
}

void sub_10007B12C()
{
}

void sub_10007B198()
{
    v2,
    v3,
    v4,
    v5,
    2u);
  sub_10000455C();
}

void sub_10007B208()
{
    v2,
    v3,
    v4,
    v5,
    2u);
  sub_10000455C();
}

void sub_10007B278()
{
  _DWORD *v2 = 136315906;
  sub_1000242D8(v3, v4, (uint64_t)v2);
  sub_100024310( (void *)&_mh_execute_header,  "%s: IXSPlaceholderPromise with UUID %@ was complete but found nothing at %@ : %@",  v5,  v6);

  sub_100024340();
}

void sub_10007B2C4()
{
  _DWORD *v2 = 136315906;
  sub_1000242D8(v3, v4, (uint64_t)v2);
  sub_100024310( (void *)&_mh_execute_header,  "%s: %@: Failed to locate localization dictionary promise with UUID %@ : %@",  v5,  v6);

  sub_100024340();
}

void sub_10007B310()
{
  _DWORD *v2 = 136315906;
  sub_1000242D8(v3, v4, (uint64_t)v2);
  sub_100024310((void *)&_mh_execute_header, "%s: %@: Failed to locate metadata promise with UUID %@ : %@", v5, v6);

  sub_100024340();
}

void sub_10007B35C()
{
  _DWORD *v2 = 136315906;
  sub_1000242D8(v3, v4, (uint64_t)v2);
  sub_100024310((void *)&_mh_execute_header, "%s: %@: Failed to locate loctable promise with UUID %@ : %@", v5, v6);

  sub_100024340();
}

void sub_10007B3A8()
{
  _DWORD *v2 = 136315906;
  sub_1000242D8(v3, v4, (uint64_t)v2);
  sub_100024310((void *)&_mh_execute_header, "%s: %@: Failed to locate entitlements promise with UUID %@ : %@", v5, v6);

  sub_100024340();
}

void sub_10007B3F4()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: %@: Found info plist icon content promise but not icon resources promise : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_10007B464()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: %@: Found icon resources promise but not info plist icon content promise : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_10007B4D4()
{
  _DWORD *v2 = 136315906;
  sub_1000242D8(v3, v4, (uint64_t)v2);
  sub_100024310( (void *)&_mh_execute_header,  "%s: %@: Failed to locate icon resources promise with UUID %@ : %@",  v5,  v6);

  sub_100024340();
}

void sub_10007B520()
{
  _DWORD *v2 = 136315906;
  sub_1000242D8(v3, v4, (uint64_t)v2);
  sub_100024310((void *)&_mh_execute_header, "%s: %@: Failed to locate icon promise with UUID %@ : %@", v5, v6);

  sub_100024340();
}

void sub_10007B56C(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = "+[IXSPlaceholder _metadataFromPromise:]";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: No data on the metadata promise %@",  buf,  0x16u);

  sub_100024340();
}

void sub_10007B5D0(void *a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_100024380((uint64_t)a1, a2, (uint64_t)a3);
  sub_1000072B0( (void *)&_mh_execute_header,  v6,  v4,  "%s: Failed to create unarchiver for metadata from promise %@: %@",  v5);

  sub_100024340();
}

void sub_10007B624()
{
  _DWORD *v2 = 136315650;
  sub_100024380(v3, v4, (uint64_t)v2);
  sub_1000072B0((void *)&_mh_execute_header, v7, v5, "%s: Failed to decode metadata from promise %@: %@", v6);

  sub_100024340();
}

void sub_10007B674(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 name]);
  sub_1000072BC();
  sub_10002432C( (void *)&_mh_execute_header,  v2,  v3,  "%s: %@: Not materializing because client has not set configuration complete",  v4,  v5,  v6,  v7,  2u);

  sub_1000176BC();
}

void sub_10007B700(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 name]);
  sub_1000072BC();
  sub_10002432C( (void *)&_mh_execute_header,  v2,  v3,  "%s: %@: Not materializing because an error has occurred.",  v4,  v5,  v6,  v7,  2u);

  sub_1000176BC();
}

void sub_10007B78C(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
  sub_1000072BC();
  sub_10002432C( (void *)&_mh_execute_header,  v2,  v3,  "%s: %@: Not materializing because icon promise is not complete or an error occurred.",  v4,  v5,  v6,  v7,  2u);

  sub_1000176BC();
}

void sub_10007B818(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
  sub_1000072BC();
  sub_10002432C( (void *)&_mh_execute_header,  v2,  v3,  "%s: %@: Not materializing because icon resources promise is not complete or an error occurred.",  v4,  v5,  v6,  v7,  2u);

  sub_1000176BC();
}

void sub_10007B8A4(id *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*a1 name]);
  sub_1000072BC();
  sub_10002432C( (void *)&_mh_execute_header,  v2,  v3,  "%s: %@: Not materializing because entitlements promise is not complete.",  v4,  v5,  v6,  v7,  2u);

  sub_1000176BC();
}

void sub_10007B930(id *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*a1 name]);
  sub_1000072BC();
  sub_10002432C( (void *)&_mh_execute_header,  v2,  v3,  "%s: %@: Not materializing because loctable promise is not complete.",  v4,  v5,  v6,  v7,  2u);

  sub_1000176BC();
}

void sub_10007B9BC()
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v2 + 40) name]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*v1 name]);
  int v5 = 136315650;
  uint64_t v6 = "-[IXSPlaceholder _isReadyToMaterialize]_block_invoke";
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  __int16 v9 = 2112;
  __int16 v10 = v4;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEBUG,  "%s: %@: Not materializing because app extension promise %@ is not complete.",  (uint8_t *)&v5,  0x20u);

  sub_100011B74();
}

void sub_10007BA80()
{
}

void sub_10007BAF0()
{
}

void sub_10007BB60(void *a1, os_log_s *a2)
{
  uint64_t v3 = IXStringForClientID((unint64_t)[a1 creatorIdentifier]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  int v6 = 136315906;
  __int16 v7 = "-[IXSPlaceholder _validateClientEntitlements:]";
  __int16 v8 = 2112;
  __int16 v9 = v4;
  __int16 v10 = 2112;
  __int16 v11 = @"com.apple.private.appinstall.install-webkit-push-placeholder";
  __int16 v12 = 2112;
  uint64_t v13 = 0LL;
  sub_100024320( (void *)&_mh_execute_header,  a2,  v5,  "%s: The creator of placeholder %@ is missing the entitlement %@ = TRUE which is required to create a web notific ation placeholder. : %@",  (uint8_t *)&v6);
}

void sub_10007BC1C(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  v6[0] = 136315650;
  sub_100024364();
  sub_1000072B0((void *)&_mh_execute_header, a3, v5, "%s: Failed to write bundle Info.plist to %@ : %@", (uint8_t *)v6);

  sub_100011B74();
}

void sub_10007BCB4(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  v6[0] = 136315650;
  sub_100024364();
  sub_1000072B0((void *)&_mh_execute_header, a3, v5, "%s: Failed to create bundle directory at %@ : %@", (uint8_t *)v6);

  sub_100011B74();
}

void sub_10007BD4C()
{
  v1[0] = 136315650;
  sub_1000072BC();
  __int16 v2 = 1024;
  int v3 = 255;
  _os_log_error_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_ERROR,  "%s: Sanitized bundle name %@ is >= %d, truncating it and attempting to proceed",  (uint8_t *)v1,  0x1Cu);
  sub_1000176BC();
}

void sub_10007BDD4()
{
}

void sub_10007BE40()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 path]);
  v4[0] = 136315650;
  sub_100024348();
  sub_1000072B0((void *)&_mh_execute_header, v0, v3, "%s: Failed to write %@ : %@", (uint8_t *)v4);

  sub_100011B74();
}

void sub_10007BED0()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 path]);
  v4[0] = 136315650;
  sub_100024348();
  sub_1000072B0((void *)&_mh_execute_header, v0, v3, "%s: Failed to create lproj directory at %@ : %@", (uint8_t *)v4);

  sub_100011B74();
}

void sub_10007BF60(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 136315650;
  uint64_t v4 = "-[IXSPlaceholder _materialize]_block_invoke_2";
  __int16 v5 = 2048;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = 0LL;
  sub_1000072B0( (void *)&_mh_execute_header,  a2,  a3,  "%s: Placeholder type of %lu in list of app extension placeholders is not supported : %@",  (uint8_t *)&v3);
  sub_1000176BC();
}

void sub_10007BFE8()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Could not find metadata promise with UUID %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_10007C058()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Client attempted to set metadata promise that was not complete: %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_10007C0C8()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Metadata promise %@ did not contain a decodeable MIStoreMetadata instance. : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_10007C138()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0((void *)&_mh_execute_header, v0, v1, "%s: Could not find sinf promise with UUID %@ : %@", (uint8_t *)v2);
  sub_1000176BC();
}

void sub_10007C1A8()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0((void *)&_mh_execute_header, v0, v1, "%s: Could not find icon promise with UUID %@ : %@", (uint8_t *)v2);
  sub_1000176BC();
}

void sub_10007C218()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Could not find icon resources promise with UUID %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_10007C288()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Could not find Info.plist icon content promise with UUID %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_10007C2F8()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Could not find localization dictionary promise with UUID %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_10007C368()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Could not find entitlements promise with UUID %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_10007C3D8()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Could not find loctable promise with UUID %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_10007C448()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Could not find placeholder promise with UUID %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_10007C4B8(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 bundleID]);
  v5[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  a2,  v4,  "%s: App extension placeholders array has multiple placeholders with the same bundleID of %@ : %@",  (uint8_t *)v5);
}

void sub_10007C54C()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 bundleID]);
  v5[0] = 136315906;
  sub_100024348();
  __int16 v6 = v3;
  uint64_t v7 = 0LL;
  sub_100024320( (void *)&_mh_execute_header,  v0,  v4,  "%s: Cannot complete attempt to set app extension placeholder with bundle ID %@ because it does not have the parent p laceholder's required bundle ID prefix of %@ : %@",  (uint8_t *)v5);
}

void sub_10007C5F0(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 saveURL]);
  sub_1000072BC();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Failed to create unarchiver from save data %@: %@",  v4,  v5,  v6,  v7,  2u);

  sub_100011B74();
}

void sub_10007C684(void *a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 saveURL]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 error]);
  sub_100028648();
  sub_100004538( (void *)&_mh_execute_header,  v5,  v6,  "%s: Failed to decode observer service name map %@: %@",  v7,  v8,  v9,  v10,  2u);

  sub_100011B74();
}

void sub_10007C724(void *a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 saveURL]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 error]);
  sub_100028648();
  sub_100004538((void *)&_mh_execute_header, v5, v6, "%s: Failed to decode service %@: %@", v7, v8, v9, v10, 2u);

  sub_100011B74();
}

void sub_10007C7C4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
  sub_10000455C();
}

void sub_10007C834( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
  sub_10000455C();
}

void sub_10007C8A4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
  sub_10000455C();
}

void sub_10007C914( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
  sub_10000455C();
}

void sub_10007C984()
{
  v1[0] = 136315394;
  sub_1000072BC();
  _os_log_error_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_ERROR,  "%s: Failed to encode observer map: %@",  (uint8_t *)v1,  0x16u);
  sub_10000455C();
}

void sub_10007C9FC(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 136315394;
  uint64_t v4 = "-[IXSAppInstallObserverManager _onQueue_connectionForObserverEndpoint:]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%s: Connection invalidated to %@",  (uint8_t *)&v3,  0x16u);
  sub_10000455C();
}

void sub_10007CA84(uint64_t a1)
{
  id v1 = sub_100024FC0(*(void *)(a1 + 40));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100028610();
  sub_100028634( (void *)&_mh_execute_header,  v3,  v4,  "%s: Failed to send notification %@ to service %@ : %@",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_10007CB1C(uint64_t a1)
{
  id v1 = sub_100024FC0(*(void *)(a1 + 40));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100028610();
  sub_100028634( (void *)&_mh_execute_header,  v3,  v4,  "%s: Failed to send notification %@ to endpoint %@ : %@",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_10007CBB4()
{
}

void sub_10007CC20()
{
}

void sub_10007CC8C()
{
}

void sub_10007CCF8()
{
}

void sub_10007CD6C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 stagedPath]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
  v6[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  a2,  v5,  "%s: The item that this promise is representing does not exist at staged path %@. : %@",  (uint8_t *)v6);
}

void sub_10007CE18(id *a1, id *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*a1 path]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*a2 seed]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stagingBaseDir]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
  v11[0] = 136315906;
  sub_10000C25C();
  __int16 v12 = v5;
  __int16 v13 = v9;
  uint64_t v14 = v10;
  __int16 v15 = v9;
  uint64_t v16 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%s: Attempt to set the stagedPath to %@ which does not start with the staged item prefix %@ : %@",  (uint8_t *)v11,  0x2Au);
}

void sub_10007CF14()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Failed to set target last path component to %@ because it contains slash(es) : %@",  (uint8_t *)v2);
}

void sub_10007CF88(void *a1, void *a2, os_log_s *a3)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 name]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 uniqueIdentifier]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a2 path]);
  v11[0] = 136316162;
  sub_10000C25C();
  __int16 v12 = v6;
  __int16 v13 = v9;
  uint64_t v14 = v7;
  __int16 v15 = v9;
  uint64_t v16 = v10;
  __int16 v17 = v9;
  uint64_t v18 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%s: IXSOwnedDataPromise (%@) with UUID %@ was complete but found nothing at %@ : %@",  (uint8_t *)v11,  0x34u);
}

void sub_10007D078()
{
  v1[0] = 136315394;
  sub_1000072BC();
  _os_log_fault_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_FAULT,  "%s: Attempting to set the same termination assertion for %@",  (uint8_t *)v1,  0x16u);
}

void sub_10007D0F4()
{
  v2[0] = 136315650;
  sub_10002ACD4();
  uint64_t v3 = 0LL;
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Failed to create termination assertion for predicate %@ : %@",  (uint8_t *)v2);
}

void sub_10007D16C(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315650;
  uint64_t v4 = "-[IXSTerminationAssertion initForBundleIDs:description:terminationResistance:error:]";
  __int16 v5 = 2080;
  uint64_t v6 = "-[IXSTerminationAssertion initForBundleIDs:description:terminationResistance:error:]";
  __int16 v7 = 2112;
  uint64_t v8 = 0LL;
  sub_1000072B0((void *)&_mh_execute_header, a1, a3, "%s: %s failed in init : %@", (uint8_t *)&v3);
}

void sub_10007D1FC(void *a1, uint64_t a2, os_log_s *a3)
{
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue([a1 termAssertion]);
  v7[0] = 136315650;
  sub_10002ACD4();
  uint64_t v8 = a2;
  sub_1000072B0( (void *)&_mh_execute_header,  a3,  v6,  "%s: Failed to acquire termination assertion %@ : %@",  (uint8_t *)v7);
}

void sub_10007D2A0()
{
  v1[0] = 136315394;
  sub_1000072BC();
  _os_log_debug_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEBUG,  "%s: RBS termination assertion observer called for %@",  (uint8_t *)v1,  0x16u);
}

void sub_10007D31C()
{
}

void sub_10007D38C()
{
  v2[0] = 136315650;
  sub_1000072BC();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "%s: Underlying error was nil when constructing OS version error for app name %@ and number of apps %lu",  (uint8_t *)v2,  0x20u);
}

void sub_10007D418()
{
}

void sub_10007D488(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 bundleIdentifier]);
  int v4 = 136315394;
  uint64_t v5 = "-[IXSAppUninstallAlert otherButtonActionWithCompletion:]";
  __int16 v6 = 2112;
  __int16 v7 = v3;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "%s: Got other button press but action unclear for app %@",  (uint8_t *)&v4,  0x16u);
}

void sub_10007D530(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  uint64_t v6 = *(void *)(*(void *)(*(void *)a2 + 8LL) + 40LL);
  int v7 = 136315650;
  uint64_t v8 = "-[IXSPromisedInMemoryDictionary initWithSeed:dictionary:error:]_block_invoke";
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%s: Could not write dictionary promise dictionary to disk at %@ : %@",  (uint8_t *)&v7,  0x20u);
}

void sub_10007D5F8()
{
}

void sub_10007D664()
{
}

void sub_10007D6D0()
{
}

void sub_10007D73C()
{
}

void sub_10007D7A8()
{
}

void sub_10007D814()
{
}

void sub_10007D880()
{
}

void sub_10007D8EC()
{
}

void sub_10007D958()
{
  v2[0] = 136315650;
  sub_10000C25C();
  sub_10002FF6C();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Deserialized removability plist is missing key %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_10007D9D4()
{
}

void sub_10007DA40()
{
  v2[0] = 136315650;
  sub_10000C25C();
  sub_10002FF6C();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Deserialized removability plist is missing key %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_10007DABC()
{
}

void sub_10007DB28()
{
}

void sub_10007DB94()
{
}

void sub_10007DC00()
{
  v1[0] = 136315650;
  sub_1000066B0();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "%s: Received non dictionary object for requested keys %@ : %@",  (uint8_t *)v1);
  sub_1000176BC();
}

void sub_10007DC74()
{
  v3[0] = 136315650;
  sub_10000C25C();
  uint64_t v4 = @"RemovabilityEntries";
  __int16 v5 = v0;
  uint64_t v6 = 0LL;
  sub_1000072B0( (void *)&_mh_execute_header,  v1,  v2,  "%s: Deserialized removability plist is missing key %@ : %@",  (uint8_t *)v3);
  sub_1000176BC();
}

void sub_10007DCFC()
{
  v2[0] = 136315650;
  sub_10000C25C();
  sub_10002FF6C();
  sub_1000072B0((void *)&_mh_execute_header, v0, v1, "%s: Received non dictionary object for %@ : %@", (uint8_t *)v2);
  sub_1000176BC();
}

void sub_10007DD78()
{
}

void sub_10007DDE4()
{
}

void sub_10007DE60()
{
  v2[0] = 136315650;
  sub_10000C25C();
  sub_10002FF6C();
  sub_1000072B0((void *)&_mh_execute_header, v0, v1, "%s: Received non dictionary object for %@ : %@", (uint8_t *)v2);
  sub_1000176BC();
}

void sub_10007DEDC()
{
  v1[0] = 136315650;
  sub_1000066B0();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "%s: Failed to fetch removability for %@ : %@",  (uint8_t *)v1);
  sub_1000176BC();
}

void sub_10007DF50()
{
  v1[0] = 136315650;
  sub_1000066B0();
  _os_log_fault_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_FAULT,  "%s: Failed to read removability data because the persona for %@ couldn't be resolved. This defeats a daemon launch a voidance optimization: %@",  (uint8_t *)v1,  0x20u);
  sub_1000176BC();
}

void sub_10007DFCC()
{
}

void sub_10007E038(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "IXGetUncachedRemovabilityDataStore";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: Deserialized removability plist is not dictionary",  (uint8_t *)&v1,  0xCu);
  sub_10000455C();
}

void sub_10007E0B4(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "_CopyRemovabilityDataFromURL";
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "%s: removabilityURL was nil, so returning nil.",  (uint8_t *)&v1,  0xCu);
  sub_10000455C();
}

void sub_10007E130(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  v4[0] = 136315394;
  sub_1000072BC();
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "%s: Failed to read removability data from %@ because it wasn't accessible due to sandboxing restrictions on this pro cess. This defeats a daemon launch avoidance optimization.",  (uint8_t *)v4,  0x16u);

  sub_1000176BC();
}

void sub_10007E1C8(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  int v7 = 136315650;
  uint64_t v8 = "_CopyRemovabilityDataFromURL";
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  sub_1000072B0( (void *)&_mh_execute_header,  a3,  v6,  "%s: Failed to read removability data from %@ : %@",  (uint8_t *)&v7);
}

void sub_10007E27C()
{
  v1[0] = 136315650;
  sub_1000066B0();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "%s: Deserialized key for removability entry is not string %@ : %@",  (uint8_t *)v1);
  sub_1000176BC();
}

void sub_10007E2F0()
{
}

void sub_10007E35C()
{
}

void sub_10007E3C8()
{
  v2[0] = 136315650;
  sub_1000072BC();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  sub_1000072B0( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "%s: Failed to deserialize removability metadata for identity %@, version %lu",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_10007E448()
{
  v1[0] = 136315650;
  sub_1000066B0();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "%s: Deserialized key for removability entry is not string %@ : %@",  (uint8_t *)v1);
  sub_1000176BC();
}

void sub_10007E4BC()
{
}

void sub_10007E528()
{
}

void sub_10007E594(os_log_t log)
{
  int v1 = 136315650;
  uint64_t v2 = "-[IXApplicationIdentity(IXUtilities) resolvePersonaUsingModuleSpecificLogicWithError:]";
  __int16 v3 = 2080;
  uint64_t v4 = "-[IXApplicationIdentity(IXUtilities) resolvePersonaUsingModuleSpecificLogicWithError:]";
  __int16 v5 = 2112;
  uint64_t v6 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: %s is not enabled : %@",  (uint8_t *)&v1,  0x20u);
}

void sub_10007E62C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "IXCreateUserPresentableError";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: Client attempted to create IXUserPresentableError with invalid code (kIXUserPresentableUnknownError)",  (uint8_t *)&v1,  0xCu);
}

void sub_10007E6AC()
{
  int v1 = (void *)objc_claimAutoreleasedReturnValue([v0 path]);
  sub_100024348();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Failed to deserialize serialized data at %@ : %@",  v4,  v5,  v6,  v7,  2u);

  sub_100011B74();
}

void sub_10007E734(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315650;
  uint64_t v4 = "-[IXSPendingOperationsTracker _deserializeKeyedArchiveFromData:atURL:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: Failed to unarchive identities from pending work sentinel file at %@ : %@",  (uint8_t *)&v3,  0x20u);
}

void sub_10007E7C8()
{
  int v1 = (void *)objc_claimAutoreleasedReturnValue([v0 path]);
  sub_100024348();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Failed to read pending work sentinel file from %@ : %@",  v4,  v5,  v6,  v7,  2u);

  sub_100011B74();
}

void sub_10007E850()
{
  int v1 = (void *)objc_claimAutoreleasedReturnValue([v0 path]);
  sub_100024348();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Failed to remove pending work sentinel file at %@ : %@",  v4,  v5,  v6,  v7,  2u);

  sub_100011B74();
}

void sub_10007E8D8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10007E950()
{
  int v1 = (void *)objc_claimAutoreleasedReturnValue([v0 path]);
  sub_100024348();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Failed to write pending work sentinel file to %@ : %@",  v4,  v5,  v6,  v7,  2u);

  sub_100011B74();
}

void sub_10007E9D8()
{
}

void sub_10007EA48()
{
}

void sub_10007EAB8()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v0 path]);
  sub_100024348();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Failed to remove pending state at %@ : %@",  v4,  v5,  v6,  v7,  2u);

  sub_100011B74();
}

void sub_10007EB40(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  id v5 = [*(id *)(a1 + 32) fileSystemRepresentation];
  int v6 = 136315650;
  uint64_t v7 = "IXUrlsForItemsInDirectoryAtURL_block_invoke";
  __int16 v8 = 2080;
  id v9 = v5;
  __int16 v10 = 2080;
  uint64_t v11 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "%s: Ignoring symlink at %s/%s",  (uint8_t *)&v6,  0x20u);
}

void sub_10007EBF0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315906;
  uint64_t v4 = "IXEncodeRootObject";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  __int16 v9 = 2112;
  uint64_t v10 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: Got exception while trying to encode object %@ : %@ : %@",  (uint8_t *)&v3,  0x2Au);
}

void sub_10007EC8C(void *a1, uint64_t a2, os_log_s *a3)
{
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  int v6 = 136315650;
  __int16 v7 = "-[IXFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]";
  __int16 v8 = 2112;
  __int16 v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%s: Failed to remove move source after copy at %@ : %@",  (uint8_t *)&v6,  0x20u);

  sub_100011B74();
}

void sub_10007ED3C(void *a1)
{
  unint64_t v2 = *sub_100038C64();
  int v3 = __error();
  uint64_t v4 = sub_100038C6C(v3);
  id v6 = sub_10003556C( (uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]",  257LL,  a1,  v2,  0LL,  0LL,  @"acl_init() failed: %s",  v5,  (uint64_t)v4);
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_100038C14((void *)&_mh_execute_header, v7, v8, "%s: Failed to remove ACL : %@", v9, v10, v11, v12, v13, v14, 2u);

  sub_100011B74();
}

void sub_10007EE04()
{
  uint64_t v1 = sub_100038C74();
  uint64_t v19 = sub_100038C6C(v1);
  sub_100038C40();
  id v10 = sub_10003556C(v2, v3, v4, v5, v6, v7, v8, v9, v0);
  int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  sub_100038C28();
  sub_100038C14( (void *)&_mh_execute_header,  v12,  v13,  "%s: Failed to remove ACL : %@",  v14,  v15,  v16,  v17,  v18,  (uint64_t)v19,  v20);

  sub_100011B74();
}

void sub_10007EEA8()
{
  uint64_t v1 = sub_100038C74();
  uint64_t v19 = sub_100038C6C(v1);
  sub_100038C40();
  id v10 = sub_10003556C(v2, v3, v4, v5, v6, v7, v8, v9, v0);
  int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  sub_100038C28();
  sub_100038C14( (void *)&_mh_execute_header,  v12,  v13,  "%s: Failed to remove ACL : %@",  v14,  v15,  v16,  v17,  v18,  (uint64_t)v19,  v20);

  sub_100011B74();
}

void sub_10007EF4C()
{
  uint64_t v1 = sub_100038C74();
  uint64_t v19 = sub_100038C6C(v1);
  sub_100038C40();
  id v10 = sub_10003556C(v2, v3, v4, v5, v6, v7, v8, v9, v0);
  int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  sub_100038C28();
  sub_100038C14( (void *)&_mh_execute_header,  v12,  v13,  "%s: Failed to remove ACL : %@",  v14,  v15,  v16,  v17,  v18,  (uint64_t)v19,  v20);

  sub_100011B74();
}

void sub_10007EFF0()
{
  uint64_t v1 = sub_100038C74();
  uint64_t v19 = sub_100038C6C(v1);
  sub_100038C40();
  id v10 = sub_10003556C(v2, v3, v4, v5, v6, v7, v8, v9, v0);
  int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  sub_100038C28();
  sub_100038C14( (void *)&_mh_execute_header,  v12,  v13,  "%s: Failed to remove ACL : %@",  v14,  v15,  v16,  v17,  v18,  (uint64_t)v19,  v20);

  sub_100011B74();
}

void sub_10007F094()
{
  uint64_t v1 = sub_100038C74();
  uint64_t v19 = sub_100038C6C(v1);
  sub_100038C40();
  id v10 = sub_10003556C(v2, v3, v4, v5, v6, v7, v8, v9, v0);
  int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  sub_100038C28();
  sub_100038C14( (void *)&_mh_execute_header,  v12,  v13,  "%s: Failed to remove ACL : %@",  v14,  v15,  v16,  v17,  v18,  (uint64_t)v19,  v20);

  sub_100011B74();
}

void sub_10007F138(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[IXFileManager copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:]_block_invoke";
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: Writing ACL to %s", (uint8_t *)&v2, 0x16u);
}

void sub_10007F1C0(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 bundleIdentifier]);
  v5[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  a2,  v4,  "%s: App with bundle ID %@ cannot be uninstalled : %@",  (uint8_t *)v5);
}

void sub_10007F254()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Invalid response received from CFUserNotification: %@ : %@",  (uint8_t *)v2);
}

void sub_10007F2C8()
{
  v2[0] = 136315906;
  sub_1000066B0();
  __int16 v3 = v0;
  uint64_t v4 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "%s: Invalid response received for %@ key: %@ : %@",  (uint8_t *)v2,  0x2Au);
}

void sub_10007F350(void *a1, uint64_t a2, os_log_s *a3)
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 typeDescription]);
  int v7 = (void *)objc_claimAutoreleasedReturnValue([a1 bundleIdentifier]);
  int v8 = 136316162;
  uint64_t v9 = "-[IXSUninstallAlert _processUserNotification:withConfiguration:response:completion:]";
  __int16 v10 = 2048;
  uint64_t v11 = a2;
  __int16 v12 = 2112;
  int v13 = v6;
  __int16 v14 = 2112;
  int v15 = v7;
  __int16 v16 = 2112;
  uint64_t v17 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%s: Received unknown response %lx from the %@ uninstall alert for app with bundleID %@ : %@",  (uint8_t *)&v8,  0x34u);

  sub_100028664();
}

void sub_10007F42C(void *a1)
{
  int v8 = (void *)objc_claimAutoreleasedReturnValue([a1 typeDescription]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a1 bundleIdentifier]);
  sub_10003AC60( (void *)&_mh_execute_header,  v2,  v3,  "%s: Failed to create %@ uninstall alert for app with bundle ID %@, error code %d : %@",  v4,  v5,  v6,  v7,  2u);

  sub_100028664();
}

void sub_10007F4FC(void *a1)
{
  int v8 = (void *)objc_claimAutoreleasedReturnValue([a1 typeDescription]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a1 bundleIdentifier]);
  sub_10003AC60( (void *)&_mh_execute_header,  v2,  v3,  "%s: Failed to recieve notification response for %@ uninstall alert for app with bundle ID %@, Response: %d : %@",  v4,  v5,  v6,  v7,  2u);

  sub_100028664();
}

void sub_10007F5C8()
{
  v1[0] = 136315650;
  sub_1000066B0();
  sub_1000072B0((void *)&_mh_execute_header, v0, (uint64_t)v0, "%s: Failed to open URL %@ : %@", (uint8_t *)v1);
}

void sub_10007F640(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  uint64_t v6 = *(void *)(*(void *)(*(void *)a2 + 8LL) + 40LL);
  int v7 = 136315650;
  int v8 = "-[IXSPromisedInMemoryData initWithSeed:data:error:]_block_invoke";
  __int16 v9 = 2112;
  __int16 v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%s: Could not write data promise data to disk at %@ : %@",  (uint8_t *)&v7,  0x20u);
}

void sub_10007F708(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 uniqueIdentifier]);
  v6[0] = 136315650;
  sub_10002ACD4();
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%s: Failed to submit background update request for %@ : %@",  (uint8_t *)v6,  0x20u);
}

void sub_10007F7B4()
{
  v2[0] = 136315650;
  sub_10002ACD4();
  uint64_t v3 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "%s: Not re-submitting already scheduled task %@ : %@",  (uint8_t *)v2,  0x20u);
}

void sub_10007F838( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10007F8B8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10007F934(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[IXSCoordinatedAppInstall initWithCoder:]";
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "%s: Failed to deserialize IXAppInstallCoordinatorSeed",  (uint8_t *)&v1,  0xCu);
  sub_10000455C();
}

void sub_10007F9B0()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "identity");
  objc_claimAutoreleasedReturnValue(v2);
  id v3 = [(id)sub_100058528() deviceSecurityPromiseUUID];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100058474();
  sub_100028634( (void *)&_mh_execute_header,  v5,  v6,  "%s: %@: Failed to locate device security promise with UUID %@ after deserialization : %@",  v7,  v8,  v9,  v10,  2u);

  sub_100028664();
}

void sub_10007FA48()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "identity");
  objc_claimAutoreleasedReturnValue(v2);
  id v3 = [(id)sub_100058528() installOptionsPromiseUUID];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100058474();
  sub_100028634( (void *)&_mh_execute_header,  v5,  v6,  "%s: %@: Failed to locate install options promise with UUID %@ after deserialization : %@",  v7,  v8,  v9,  v10,  2u);

  sub_100028664();
}

void sub_10007FAE0()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "identity");
  objc_claimAutoreleasedReturnValue(v2);
  id v3 = [(id)sub_100058528() preparationPromiseUUID];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100058474();
  sub_100028634( (void *)&_mh_execute_header,  v5,  v6,  "%s: %@: Failed to locate preparation promise with UUID %@ after deserialization : %@",  v7,  v8,  v9,  v10,  2u);

  sub_100028664();
}

void sub_10007FB78()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "identity");
  objc_claimAutoreleasedReturnValue(v2);
  id v3 = [(id)sub_100058528() userDataPromiseUUID];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100058474();
  sub_100028634( (void *)&_mh_execute_header,  v5,  v6,  "%s: %@: Failed to locate user data promise with UUID %@ after deserialization : %@",  v7,  v8,  v9,  v10,  2u);

  sub_100028664();
}

void sub_10007FC10()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "identity");
  objc_claimAutoreleasedReturnValue(v2);
  id v3 = [(id)sub_100058528() appAssetPromiseUUID];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100058474();
  sub_100028634( (void *)&_mh_execute_header,  v5,  v6,  "%s: %@: Failed to locate app asset promise with UUID %@ after deserialization : %@",  v7,  v8,  v9,  v10,  2u);

  sub_100028664();
}

void sub_10007FCA8()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "identity");
  objc_claimAutoreleasedReturnValue(v2);
  id v3 = [(id)sub_100058528() placeholderPromiseUUID];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100058474();
  sub_100028634( (void *)&_mh_execute_header,  v5,  v6,  "%s: %@: Failed to locate IXSPlaceholder instance with UUID %@ after deserialization : %@",  v7,  v8,  v9,  v10,  2u);

  sub_100028664();
}

void sub_10007FD40()
{
  v1[0] = 136315394;
  sub_1000072BC();
  _os_log_fault_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_FAULT,  "%s: Attempting to set the same termination assertion for %@",  (uint8_t *)v1,  0x16u);
  sub_10000455C();
}

void sub_10007FDB8(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 identity]);
  sub_1000072BC();
  sub_10002432C( (void *)&_mh_execute_header,  v2,  v3,  "%s: Coordinator for %@ waiting for first unlock.",  v4,  v5,  v6,  v7,  2u);

  sub_1000176BC();
}

void sub_10007FE44()
{
}

void sub_10007FEB8()
{
}

void sub_10007FF2C()
{
}

void sub_10007FFA0()
{
  v1[0] = 136315650;
  sub_1000584CC();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "%s: Failed to register placeholder for %@; attempting to continue...(Error: %@)",
    (uint8_t *)v1);
  sub_1000176BC();
}

void sub_100080018(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[IXSCoordinatedAppInstall _eligibleToScheduleUpdate]";
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%s: Update scheduling is not supported",  (uint8_t *)&v1,  0xCu);
  sub_10000455C();
}

void sub_100080094()
{
  v2[0] = 136315394;
  sub_1000072BC();
  sub_100058498( (void *)&_mh_execute_header,  v0,  v1,  "%s: Failed to schedule update activity: %@. Executing it right away.",  (uint8_t *)v2);
  sub_10000455C();
}

void sub_100080104()
{
}

void sub_100080170()
{
  v1[0] = 136315650;
  sub_1000066B0();
  sub_1000584F0( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "%s: %@: Failed to take out a new termination assertion to allow post-processing extensions to run. Dropping existing termination assertion: %@",  (uint8_t *)v1);
  sub_1000176BC();
}

void sub_1000801E4()
{
  v1[0] = 136315650;
  sub_1000066B0();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "%s: Cancelling %@ because we failed to acquire a termination assertion even after retrying : %@",  (uint8_t *)v1);
  sub_1000176BC();
}

void sub_100080258()
{
  v1[0] = 136315650;
  sub_1000066B0();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "%s: Cancelling %@ because we failed to acquire a termination assertion : %@",  (uint8_t *)v1);
  sub_1000176BC();
}

void sub_1000802CC()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 path]);
  v4[0] = 136315650;
  sub_100024348();
  sub_1000072B0((void *)&_mh_execute_header, v0, v3, "%s: Failed to remove target bundle %@ : %@", (uint8_t *)v4);

  sub_100011B74();
}

void sub_10008035C()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*v1 identity]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleID]);
  v5[0] = 136315650;
  sub_100024348();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v4,  "%s: Failed to send LSApplicationNotificationTypeApplicationWillBeUpdated notification for %@ : %@",  (uint8_t *)v5);

  sub_100011B74();
}

void sub_100080400()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*v1 identity]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleID]);
  v5[0] = 136315650;
  sub_100024348();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v4,  "%s: Failed to send LSApplicationNotificationTypeApplicationWillBeDowngraded notification for %@ : %@",  (uint8_t *)v5);

  sub_100011B74();
}

void sub_1000804A4(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 identity]);
  v5[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  a2,  v4,  "%s: Placeholder installation failed but we received a nil error object when installing %@ : %@",  (uint8_t *)v5);

  sub_10005851C();
}

void sub_100080530(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 136315650;
  uint64_t v4 = "-[IXSCoordinatedAppInstall _finishPlaceholderInstallAtURL:result:recordPromise:error:]";
  __int16 v5 = 2048;
  uint64_t v6 = 15LL;
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  sub_1000584F0( (void *)&_mh_execute_header,  a2,  a3,  "%s: Timed out after waiting %lld seconds for CacheDelete to purge data containers when demoting %@",  (uint8_t *)&v3);
  sub_1000176BC();
}

void sub_1000805BC()
{
}

void sub_100080634()
{
  v1[0] = 136315650;
  sub_1000066B0();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "%s: No LSApplicationRecord found for %@ during demotion : %@",  (uint8_t *)v1);
  sub_1000176BC();
}

void sub_1000806A8()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Cannot demote app with identity %@ because it is a placeholder : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_100080718()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: LSApplicationRecord for %@ did not contain a bundleContainerURL during demotion : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_100080788()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Placeholder was nil when we went to install it for %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_1000807F8()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Placeholder promise was not complete when we went to install it for %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_100080868()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Placeholder promise was nil when we went to install it for %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_1000808D8()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Canceling placeholder installation for %@ because IXGizmoInstallingAppInstallCoordinator is not supported on this device. : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_100080948(void *a1, os_log_s *a2)
{
  v4[0] = 136315650;
  sub_1000584FC();
  sub_1000072B0( (void *)&_mh_execute_header,  a2,  v3,  "%s: Expected to have not yet begun placeholder install or waiting/pending assertion acquisition but state was %lu : %@",  (uint8_t *)v4);
  sub_10005851C();
}

void sub_1000809C8()
{
  sub_10000454C( (void *)&_mh_execute_header,  v0,  v1,  "%s: Install options promise unexpectedly returned nil staged path. : %@",  v2,  v3,  v4,  v5,  2u);
  sub_10000455C();
}

void sub_100080A38(void *a1, uint64_t a2, uint64_t a3, os_log_s *a4)
{
  *(_DWORD *)a3 = 136315650;
  *(void *)(a3 + 4) = "+[IXSCoordinatedAppInstall _fetchInstallOptionsFromPromise:error:]";
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a1;
  *(_WORD *)(a3 + 22) = 2112;
  *(void *)(a3 + 24) = a2;
  sub_1000072B0( (void *)&_mh_execute_header,  a4,  a3,  "%s: Unable to read install options serialized data from %@ : %@",  (uint8_t *)a3);

  sub_100024340();
}

void sub_100080AA0()
{
}

void sub_100080B0C(void *a1, _DWORD *a2)
{
  *a2 = 136315394;
  sub_100058558((uint64_t)a1, (uint64_t)a2, (uint64_t)"+[IXSCoordinatedAppInstall _fetchInstallOptionsFromPromise:error:]");
  _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s: Failed to unarchive install options data : %@",  v4,  0x16u);

  sub_100024340();
}

void sub_100080B64()
{
}

void sub_100080BD4()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: App asset was nil when we went to install it for %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_100080C44()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Canceling installation for %@ because IXGizmoInstallingAppInstallCoordinator is not supported on non-iOS devices. : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_100080CB4()
{
  v1[0] = 136315650;
  sub_1000584CC();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "%s: Failed to get app LSRecordPromise for %@: %@",  (uint8_t *)v1);
  sub_1000176BC();
}

void sub_100080D28(void *a1, os_log_s *a2)
{
  v4[0] = 136315650;
  sub_1000584FC();
  sub_1000072B0( (void *)&_mh_execute_header,  a2,  v3,  "%s: Expected to have not yet begun app install or waiting/pending assertion acquisition but state was %lu : %@",  (uint8_t *)v4);
  sub_10005851C();
}

void sub_100080DA8()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v0 bundleID]);
  sub_100024348();
  sub_100028634( (void *)&_mh_execute_header,  v2,  v3,  "%s: Ignoring attempt to set a placeholder promise with bundle ID %@ on coordinator with different bundle id %@ : %@",  v4,  v5,  v6,  v7,  2u);

  sub_100028664();
}

void sub_100080E38()
{
  v1[0] = 136315650;
  sub_1000584CC();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "%s: Failed to get LSRecordPromise for %@: %@",  (uint8_t *)v1);
  sub_1000176BC();
}

void sub_100080EAC()
{
  v2[0] = 136315394;
  sub_1000072BC();
  sub_100058498((void *)&_mh_execute_header, v0, v1, "%s: Failed to create a LS record: %@", (uint8_t *)v2);
  sub_10000455C();
}

void sub_100080F1C()
{
}

void sub_100080F8C(uint64_t a1, unint64_t *a2, os_log_s *a3)
{
  uint64_t v4 = sub_10004F530(*a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v7[0] = 136315650;
  sub_100028648();
  sub_1000584F0( (void *)&_mh_execute_header,  a3,  v6,  "%s: Attempting to fetch progress for %@ during a phase that does not support progress: %@",  (uint8_t *)v7);

  sub_100011B74();
}

void sub_100081024()
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString NSStringFromLSInstallPhase:](&OBJC_CLASS___NSString, "NSStringFromLSInstallPhase:", v2));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v1 identity]);
  v6[0] = 136315650;
  sub_100028648();
  sub_1000072B0((void *)&_mh_execute_header, v0, v5, "%s: Failed to get %@ progress for %@", (uint8_t *)v6);

  sub_100011B74();
}

void sub_1000810D4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 identity]);
  sub_1000072BC();
  sub_10002432C( (void *)&_mh_execute_header,  v2,  v3,  "%s: LS didn't return a placeholder/parallel placeholder for %@; no loading progress is available",
    v4,
    v5,
    v6,
    v7,
    2u);

  sub_1000176BC();
}

void sub_10008115C()
{
  int v2 = 136315394;
  uint64_t v3 = "-[IXSCoordinatedAppInstall _onQueue_updateLoadingProgress]";
  sub_1000584A4();
  sub_100058498( (void *)&_mh_execute_header,  v0,  v1,  "%s: Found no promises with total bytes set; faking for %llu promises",
    (uint8_t *)&v2);
  sub_10000455C();
}

void sub_1000811D4(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 identity]);
  v6[0] = 136315650;
  sub_1000072BC();
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "%s: %@: Found %llu promises missing total bytes",  (uint8_t *)v6,  0x20u);

  sub_100011B74();
}

void sub_100081280(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
  sub_1000072BC();
  sub_10002432C( (void *)&_mh_execute_header,  v2,  v3,  "%s: Not updating progress because %@ has no current progress",  v4,  v5,  v6,  v7,  2u);

  sub_1000176BC();
}

void sub_10008130C(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 identity]);
  sub_1000072BC();
  sub_10002432C( (void *)&_mh_execute_header,  v2,  v3,  "%s: LS didn't return a placeholder/parallel placeholder for %@ so installing progress is not available",  v4,  v5,  v6,  v7,  2u);

  sub_1000176BC();
}

void sub_100081394(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 identity]);
  sub_1000072BC();
  sub_10002432C( (void *)&_mh_execute_header,  v2,  v3,  "%s: LS didn't return a placeholder/parallel placeholder for %@ so post processing progress is not available",  v4,  v5,  v6,  v7,  2u);

  sub_1000176BC();
}

void sub_10008141C(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
  sub_1000072BC();
  sub_10002432C( (void *)&_mh_execute_header,  v2,  v3,  "%s: Not updating progress because %@ has no current progress",  v4,  v5,  v6,  v7,  2u);

  sub_1000176BC();
}

void sub_1000814A8()
{
  int v3 = 136315650;
  uint64_t v4 = "-[IXSCoordinatedAppInstall assertionTargetProcessDidExit:]_block_invoke";
  __int16 v5 = 2080;
  uint64_t v6 = "-[IXSCoordinatedAppInstall assertionTargetProcessDidExit:]_block_invoke";
  __int16 v7 = 2112;
  uint64_t v8 = v0;
  sub_1000584F0((void *)&_mh_execute_header, v1, v2, "%s: %s called unexpectedly for %@", (uint8_t *)&v3);
  sub_1000176BC();
}

void sub_100081530()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Failed to locate placeholder data promise with UUID %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_1000815A0()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 bundleID]);
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v0 identity]);
  sub_100058474();
  sub_100028634( (void *)&_mh_execute_header,  v4,  v5,  "%s: Attempted to set placeholder promise with bundle ID %@ that does not match coordinator's identity %@ : %@",  v6,  v7,  v8,  v9,  2u);

  sub_100028664();
}

void sub_10008163C()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Failed to locate app asset data promise with UUID %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_1000816AC()
{
  v2[0] = 136315906;
  sub_1000066B0();
  __int16 v3 = v0;
  uint64_t v4 = 0LL;
  sub_100024320( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "%s: Client attempted to set an app reference with identity %@ that did not match the coordinator's identity, %@ : %@",  (uint8_t *)v2);
}

void sub_10008172C()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Failed to locate install options promise with UUID %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_10008179C()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Client attempted to set install options promise that was not complete: %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_10008180C()
{
  v1[0] = 136315650;
  sub_1000066B0();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "%s: Failed to decode MIInstallOptions from promise %@ : %@",  (uint8_t *)v1);
  sub_1000176BC();
}

void sub_100081880(void *a1, _DWORD *a2)
{
  *a2 = 136315650;
  sub_100058558( (uint64_t)a1,  (uint64_t)a2,  (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setInstallOptionsPromiseUUID:forConnection:completion:]");
  *(_WORD *)(v3 + 22) = v4;
  *(void *)(v3 + 24) = 0LL;
  sub_1000072B0( (void *)&_mh_execute_header,  v5,  (uint64_t)v5,  "%s: Client %@ attempted to set MIInstallOptions with the installationRequestorAuditToken property set, but did not h ave the required entitlement. : %@",  v6);

  sub_100024340();
}

void sub_1000818D8(unint64_t a1, os_log_s *a2)
{
  __int16 v4 = IXStringForCoordinatorImportance(4uLL);
  id v6 = (id)objc_claimAutoreleasedReturnValue(v4);
  if (a1 < 8 && ((0xFBu >> a1) & 1) != 0) {
    uint64_t v7 = *(&off_1000CE770 + a1);
  }
  else {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown intent value %lu",  a1));
  }
  int v8 = 136315906;
  uint64_t v9 = "-[IXSCoordinatedAppInstall(IPCMethods) _remote_setImportance:completion:]";
  __int16 v10 = 2112;
  id v11 = v6;
  __int16 v12 = 2112;
  int v13 = v7;
  __int16 v14 = 2112;
  uint64_t v15 = 0LL;
  sub_100024320( (void *)&_mh_execute_header,  a2,  v5,  "%s: Importance %@ isn't applicable to this coordinator with intent %@ : %@",  (uint8_t *)&v8);
}

void sub_1000819E8()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0((void *)&_mh_execute_header, v0, v1, "%s: Could not find ODR promise with UUID %@ : %@", (uint8_t *)v2);
  sub_1000176BC();
}

void sub_100081A58()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Failed to locate user data promise with UUID %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_100081AC8()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Failed to locate preparation promise with UUID %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_100081B38()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Failed to locate device security promise with UUID %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_100081BA8(void *a1, os_log_s *a2)
{
  id v3 = [a1 effectiveIntent];
  if ((unint64_t)v3 > 7) {
    __int16 v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown intent value %lu",  v3));
  }
  else {
    __int16 v4 = *(&off_1000CE7B0 + (void)v3);
  }
  v6[0] = 136315650;
  sub_1000584B0();
  sub_1000072B0( (void *)&_mh_execute_header,  a2,  v5,  "%s: Coordinator with intent %@ does not support post processing. : %@",  (uint8_t *)v6);

  sub_1000584E8();
}

void sub_100081C6C(void *a1, os_log_s *a2)
{
  id v3 = [a1 effectiveIntent];
  if ((unint64_t)v3 > 7) {
    __int16 v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown intent value %lu",  v3));
  }
  else {
    __int16 v4 = *(&off_1000CE7B0 + (void)v3);
  }
  v6[0] = 136315650;
  sub_1000584B0();
  sub_1000072B0( (void *)&_mh_execute_header,  a2,  v5,  "%s: Coordinator with intent %@ does not support post processing. : %@",  (uint8_t *)v6);

  sub_1000584E8();
}

void sub_100081D34()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Coordinator %@ does not have post processing enabled. : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_100081DA4()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Could not find essential asset promise with UUID %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_100081E14()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Coordinator %@ does not support post processing. : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_100081E84()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Coordinator %@ does not have post processing enabled. : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_100081EF4()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Coordinator %@ does not support post processing. : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_100081F64()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Coordinator %@ does not have post processing enabled. : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_100081FD4()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Coordinator %@ does not support post processing. : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_100082044(unint64_t a1, os_log_s *a2)
{
  if (a1 > 7) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown intent value %lu",  a1));
  }
  else {
    id v3 = *(&off_1000CE7B0 + a1);
  }
  v5[0] = 136315650;
  sub_1000584B0();
  sub_1000072B0( (void *)&_mh_execute_header,  a2,  v4,  "%s: Placeholder disposition is not applicable to coordinator type %@. : %@",  (uint8_t *)v5);

  sub_1000584E8();
}

void sub_100082104()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Failed to create termination assertion for identifier %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_100082174(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v3 = 136315650;
  uint64_t v4 = "-[IXSContainerRefreshManager _onQueue_refreshContainerTypes:forAppWithIdentity:error:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  sub_1000072B0( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "%s: Failed to fetch application record for %@ : %@",  (uint8_t *)&v3);
  sub_1000176BC();
}

void sub_1000821FC()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0((void *)&_mh_execute_header, v0, v1, "%s: Failed to create container query for %@ : %@", (uint8_t *)v2);
  sub_1000176BC();
}

void sub_10008226C()
{
  int v2 = 136315906;
  sub_1000072BC();
  sub_100059224();
  sub_100059210( (void *)&_mh_execute_header,  v0,  v1,  "%s: Failed to fetch container for identity %@ of class %llu : %@",  v2);
  sub_100059238();
}

void sub_1000822E0(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v3 = 136315650;
  uint64_t v4 = "_ClearContainer";
  __int16 v5 = 2080;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  sub_1000072B0( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "%s: container_query_get_single_result failed : %s : %@",  (uint8_t *)&v3);
  sub_1000176BC();
}

void sub_10008236C()
{
  int v2 = 136315906;
  sub_1000072BC();
  sub_100059224();
  sub_100059210((void *)&_mh_execute_header, v0, v1, "%s: Failed to wipe container for identifier %@ : %s : %@", v2);
  sub_100059238();
}

void sub_1000823E0(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)int v3 = 136315906;
  *(void *)&void v3[4] = "-[IXSContainerRefreshManager refreshContainerTypes:forAppWithIdentity:reason:completion:]_block_invoke";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *a1;
  *(_WORD *)&v3[22] = 2112;
  __int16 v4 = 0;
  sub_100059210( (void *)&_mh_execute_header,  a2,  a3,  "%s: Failed to refresh container %@ because a coordinator already existed: %@ : %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16],  a2,  2112LL,  v4);
  sub_100059238();
}

void sub_10008246C(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  int v3 = "-[IXAppInstallCoordinatorSeed initWithCoder:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "%s: Both identity and bundleID were nil for %@",  (uint8_t *)&v2,  0x16u);
}

void sub_1000824F4(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3 = *a2;
  int v4 = 136315650;
  uint64_t v5 = "-[IXAppInstallCoordinatorSeed initWithCoder:]";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "%s: Identity was nil when deserializing IXAppInstallCoordinatorSeed for bundle ID %@ with unique identifier %@",  (uint8_t *)&v4,  0x20u);
}

void sub_10008258C(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "+[IXSHealthKitDataUninstallAlert openHealthKitClasses]_block_invoke";
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "%s: Failed to open HealthKit framework: %s",  (uint8_t *)&v2,  0x16u);
}

void sub_100082614(os_log_t log)
{
  int v1 = 136315906;
  int v2 = "+[IXSHealthKitDataUninstallAlert openHealthKitClasses]_block_invoke";
  __int16 v3 = 2048;
  uint64_t v4 = qword_1000E8FA0;
  __int16 v5 = 2048;
  uint64_t v6 = qword_1000E8FA8;
  __int16 v7 = 2048;
  uint64_t v8 = qword_1000E8FB0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "%s: Failed to load expected classes from HealthKit.framework: HKHealthStore : %p, HKSourceStore : %p, _HKBehavior : %p",  (uint8_t *)&v1,  0x2Au);
}

void sub_1000826C0(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 136315650;
  __int16 v5 = "+[IXSHealthKitDataUninstallAlert healthKitDataPresentForAppWithBundleID:completion:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: Failed to determine if HealthKit data was present for app with bundle ID %@: %@",  (uint8_t *)&v4,  0x20u);
}

void sub_100082758(void *a1, uint64_t a2, os_log_s *a3)
{
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue([a1 name]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 bundleName]);
  __int16 v8 = IXStringForClientID((unint64_t)[a1 creatorIdentifier]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v13[0] = 136316162;
  sub_100072850();
  __int16 v14 = v7;
  __int16 v15 = v10;
  uint64_t v16 = v11;
  __int16 v17 = v10;
  uint64_t v18 = a2;
  sub_1000727E8( (void *)&_mh_execute_header,  a3,  v12,  "%s: Failed to create placeholder data promise with name: %@ bundleName: %@ client: %@ : %@",  (uint8_t *)v13);

  sub_100072820();
}

void sub_100082838(void *a1, uint64_t a2, os_log_s *a3)
{
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue([a1 name]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 transferPath]);
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
  uint64_t v9 = IXStringForClientID((unint64_t)[a1 creatorIdentifier]);
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v14[0] = 136316162;
  sub_100072850();
  __int16 v15 = v8;
  __int16 v16 = v11;
  uint64_t v17 = v12;
  __int16 v18 = v11;
  uint64_t v19 = a2;
  sub_1000727E8( (void *)&_mh_execute_header,  a3,  v13,  "%s: Failed to create promised transfer to path data promise with name: %@ path: %@ client: %@ : %@",  (uint8_t *)v14);

  sub_100072820();
}

void sub_100082928()
{
  id v2 = sub_1000727A8();
  uint64_t v3 = IXStringForClientID((unint64_t)v2);
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100072778();
  sub_100028634( (void *)&_mh_execute_header,  v5,  v6,  "%s: Failed to create streaming zip transfer data promise with name: %@ client: %@ : %@",  v7,  v8,  v9,  v10,  2u);

  sub_100028664();
}

void sub_1000829C4()
{
  id v2 = sub_1000727A8();
  uint64_t v3 = IXStringForClientID((unint64_t)v2);
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100072778();
  sub_100028634( (void *)&_mh_execute_header,  v5,  v6,  "%s: Failed to create in memory data promise with name: %@ client: %@ : %@",  v7,  v8,  v9,  v10,  2u);

  sub_100028664();
}

void sub_100082A60()
{
  id v2 = sub_1000727A8();
  uint64_t v3 = IXStringForClientID((unint64_t)v2);
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100072778();
  sub_100028634( (void *)&_mh_execute_header,  v5,  v6,  "%s: Failed to create in memory dictionary promise with name: %@ client: %@ : %@",  v7,  v8,  v9,  v10,  2u);

  sub_100028664();
}

void sub_100082AFC()
{
  id v2 = sub_1000727A8();
  uint64_t v3 = IXStringForClientID((unint64_t)v2);
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100072778();
  sub_100028634( (void *)&_mh_execute_header,  v5,  v6,  "%s: Failed to create out of band transfer promise with name: %@ client: %@ : %@",  v7,  v8,  v9,  v10,  2u);

  sub_100028664();
}

void sub_100082B98()
{
  id v2 = sub_1000727A8();
  uint64_t v3 = IXStringForClientID((unint64_t)v2);
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100072778();
  sub_100028634( (void *)&_mh_execute_header,  v5,  v6,  "%s: Failed to create out of band streaming zip transfer promise with name: %@ client: %@ : %@",  v7,  v8,  v9,  v10,  2u);

  sub_100028664();
}

void sub_100082C34()
{
  id v1 = v0;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v0 name]);
  uint64_t v3 = IXStringForClientID((unint64_t)[v1 creatorIdentifier]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100028634( (void *)&_mh_execute_header,  v4,  v5,  "%s: Failed to create promised app reference with name: %@ client: %@ : %@",  v6,  v7,  v8,  v9,  2u);

  sub_100028664();
}

void sub_100082CF4(void *a1, _DWORD *a2)
{
  *a2 = 136315650;
  sub_100072834( (uint64_t)a1,  (uint64_t)a2,  (uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIntent :scopeRequirement:completion:]");
  sub_1000072B0( (void *)&_mh_execute_header,  v3,  (uint64_t)v3,  "%s: Expected a non-nil identity from client: %@ : %@",  v4);
}

void sub_100082D48(void *a1, _DWORD *a2)
{
  *a2 = 136315650;
  sub_100072834( (uint64_t)a1,  (uint64_t)a2,  (uint64_t)"-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIntent :scopeRequirement:completion:]");
  sub_1000072B0( (void *)&_mh_execute_header,  v3,  (uint64_t)v3,  "%s: Expected a non-nil bundleID from client: %@ : %@",  v4);
}

void sub_100082D9C()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Bundle identifier %@ contains /, which is not allowed : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_100082E0C()
{
}

void sub_100082E80(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 136315650;
  uint64_t v4 = "-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIntent:scope"
       "Requirement:completion:]";
  __int16 v5 = 2048;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = 0LL;
  sub_1000072B0( (void *)&_mh_execute_header,  a2,  a3,  "%s: Installation domain in seed was not a known value: %lu : %@",  (uint8_t *)&v3);
  sub_1000176BC();
}

void sub_100082F08(unsigned __int8 a1, os_log_s *a2, _DWORD *a3)
{
  *a3 = a1;
  int v3 = 136315650;
  uint64_t v4 = "-[IXSClientConnection _remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIntent:scope"
       "Requirement:completion:]";
  __int16 v5 = 1024;
  int v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s: Scope requirement parameter value was not a known value: %hhu : %@",  (uint8_t *)&v3,  0x1Cu);
  sub_1000176BC();
}

void sub_100082FA0()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Coordinator did not exist for bundle ID %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_100083010()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Coordinator did not exist for bundle ID %@ : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_100083080()
{
  v1[0] = 136315650;
  sub_1000066B0();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "%s: Failed to get a placeholder app record for %@; it does not appear to be installed. : %@",
    (uint8_t *)v1);
  sub_1000176BC();
}

void sub_1000830F4()
{
  v1[0] = 136315650;
  sub_1000066B0();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "%s: Failed to get bundle metadata for %@ : %@",  (uint8_t *)v1);
  sub_1000176BC();
}

void sub_100083168(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  sub_100017690();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Client %@ is missing test runner entitlement. : %@",  v4,  v5,  v6,  v7,  2u);

  sub_10005851C();
}

void sub_1000831EC(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  sub_100017690();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Client %@ is missing test runner entitlement. : %@",  v4,  v5,  v6,  v7,  2u);

  sub_10005851C();
}

void sub_100083270(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  sub_100017690();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Client %@ is missing test runner entitlement. : %@",  v4,  v5,  v6,  v7,  2u);

  sub_10005851C();
}

void sub_1000832F4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  sub_100017690();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Client %@ is missing test runner entitlement. : %@",  v4,  v5,  v6,  v7,  2u);

  sub_10005851C();
}

void sub_100083378(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  sub_100017690();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Client %@ is missing test runner entitlement. : %@",  v4,  v5,  v6,  v7,  2u);

  sub_10005851C();
}

void sub_1000833FC(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  sub_100017690();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Client %@ is missing test runner entitlement. : %@",  v4,  v5,  v6,  v7,  2u);

  sub_10005851C();
}

void sub_100083480(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  sub_100017690();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Client %@ is missing test runner entitlement. : %@",  v4,  v5,  v6,  v7,  2u);

  sub_10005851C();
}

void sub_100083504(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  sub_100017690();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Client %@ has passed non-nil options. : %@",  v4,  v5,  v6,  v7,  2u);

  sub_10005851C();
}

void sub_100083588(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  sub_100017690();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Client %@ is missing disk image (client registration/unregistration) operation entitlement. : %@",  v4,  v5,  v6,  v7,  2u);

  sub_10005851C();
}

void sub_10008360C()
{
  v1[0] = 136315650;
  sub_1000066B0();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "%s: Failed to unregister contents at %@ : %@",  (uint8_t *)v1);
  sub_1000176BC();
}

void sub_100083680(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  sub_100017690();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Client %@ has passed non-nil options. : %@",  v4,  v5,  v6,  v7,  2u);

  sub_10005851C();
}

void sub_100083704(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  sub_100017690();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Client %@ is missing disk image (contents registration/unregistration) operation entitlement. : %@",  v4,  v5,  v6,  v7,  2u);

  sub_10005851C();
}

void sub_100083788(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  sub_100017690();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Client %@ is missing persona based multi user (associating bundleIDs with persona) operation entitlement. : %@",  v4,  v5,  v6,  v7,  2u);

  sub_10005851C();
}

void sub_10008380C(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  sub_100017690();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Client %@ is missing persona based multi user (associating bundleIDs with persona) operation entitlement. : %@",  v4,  v5,  v6,  v7,  2u);

  sub_10005851C();
}

void sub_100083890(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  sub_100017690();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Client %@ is missing persona based multi user (associating bundleIDs with persona) operation entitlement. : %@",  v4,  v5,  v6,  v7,  2u);

  sub_10005851C();
}

void sub_100083914()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: -[IXSAppRemovabilityManager setRemovability:] for %@ returned NO but did not set an error. : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_100083984(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  sub_10002ACD4();
  sub_1000727F4();
  sub_100028634( (void *)&_mh_execute_header,  v2,  v3,  "%s: Client %@ is missing %@ entitlement, rejecting attempt to set app removability. : %@",  v4,  v5,  v6,  v7,  2u);

  sub_10007279C();
}

void sub_100083A14()
{
}

void sub_100083A88(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  int v4 = 136315394;
  uint64_t v5 = "-[IXSClientConnection _remote_removabilityDataWithCompletion:]";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%s: Querying removability data for client %@",  (uint8_t *)&v4,  0x16u);

  sub_1000176BC();
}

void sub_100083B2C(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  sub_10002ACD4();
  sub_1000727F4();
  sub_100028634( (void *)&_mh_execute_header,  v2,  v3,  "%s: Client %@ is missing %@ entitlement, rejecting attempt to read app removability data. : %@",  v4,  v5,  v6,  v7,  2u);

  sub_10007279C();
}

void sub_100083BBC(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  sub_100017690();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Client %@ is missing ignore app protection operation entitlement. : %@",  v4,  v5,  v6,  v7,  2u);

  sub_10005851C();
}

void sub_100083C40(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  sub_100017690();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Client %@ is missing ignore restrictions operation entitlement. : %@",  v4,  v5,  v6,  v7,  2u);

  sub_10005851C();
}

void sub_100083CC4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  sub_100017690();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Client %@ is missing ignore removability operation entitlement. : %@",  v4,  v5,  v6,  v7,  2u);

  sub_10005851C();
}

void sub_100083D48(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  v6[0] = 136316162;
  sub_10002ACD4();
  uint64_t v7 = @"com.apple.private.InstallCoordination.uninstall";
  __int16 v8 = v4;
  uint64_t v9 = @"UninstallForLaunchServices";
  __int16 v10 = v4;
  __int16 v11 = @"com.apple.private.mobileinstall.allowedSPI";
  sub_1000727E8( (void *)&_mh_execute_header,  a2,  v5,  "%s: %@ should be updated to use the entitlement %@ = TRUE (BOOLean) instead of %@ in the value of the %@ entitlement",  (uint8_t *)v6);

  sub_10007279C();
}

void sub_100083E00(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  sub_10002ACD4();
  sub_1000727F4();
  sub_100028634( (void *)&_mh_execute_header,  v2,  v3,  "%s: Client %@ is missing entitlement %@ : TRUE (BOOLean) to uninstall applications : %@",  v4,  v5,  v6,  v7,  2u);

  sub_10007279C();
}

void sub_100083E90(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315650;
  uint64_t v4 = "-[IXSClientConnection _remote_refreshContainerTypes:forAppWithIdentity:reason:completion:]";
  __int16 v5 = 2080;
  uint64_t v6 = "-[IXSClientConnection _remote_refreshContainerTypes:forAppWithIdentity:reason:completion:]";
  __int16 v7 = 2112;
  uint64_t v8 = 0LL;
  sub_1000072B0((void *)&_mh_execute_header, a1, a3, "%s: Reason passed to %s was nil! : %@", (uint8_t *)&v3);
  sub_1000176BC();
}

void sub_100083F1C(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  v6[0] = 136316162;
  sub_10002ACD4();
  __int16 v7 = @"com.apple.private.InstallCoordination.refreshContainerTypes";
  __int16 v8 = v4;
  uint64_t v9 = @"UninstallForLaunchServices";
  __int16 v10 = v4;
  __int16 v11 = @"com.apple.private.mobileinstall.allowedSPI";
  sub_1000727E8( (void *)&_mh_execute_header,  a2,  v5,  "%s: %@ should be updated to use the entitlement %@ = TRUE (BOOLean) instead of %@ in the value of the %@ entitlement",  (uint8_t *)v6);

  sub_10007279C();
}

void sub_100083FD4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  sub_10002ACD4();
  sub_1000727F4();
  sub_100028634( (void *)&_mh_execute_header,  v2,  v3,  "%s: Client %@ is missing entitlement %@ = TRUE (BOOLean) to refresh containers : %@",  v4,  v5,  v6,  v7,  2u);

  sub_10007279C();
}

void sub_100084064()
{
  v2[0] = 136315650;
  sub_100072804();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Updating SINF for %@ returned NO but did not set an error. : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_1000840D4()
{
  v1[0] = 136315906;
  sub_1000727C4();
  sub_100024320( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "%s: Failed to update the SINF for %@ because a coordinator already existed: %@ : %@",  (uint8_t *)v1);
}

void sub_10008414C()
{
  v2[0] = 136315650;
  sub_100072804();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: Updating iTunesMetadata for %@ returned NO but did not set an error. : %@",  (uint8_t *)v2);
  sub_1000176BC();
}

void sub_1000841BC()
{
  v1[0] = 136315906;
  sub_1000727C4();
  sub_100024320( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "%s: Failed to update the iTunesMetadata for %@ because a coordinator already existed: %@ : %@",  (uint8_t *)v1);
}

void sub_100084234()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_1000842BC()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100084344()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_1000843CC()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100084454()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_1000844DC()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100084564()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_1000845EC()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100084674()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_1000846FC()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100084784()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_10008480C()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100084894()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_10008491C()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_1000849A4()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100084A2C()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100084AB4()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100084B3C()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100084BC4()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100084C4C()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100084CD4()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100084D5C()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100084DE4()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100084E6C()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100084EF4()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100084F7C()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100085004()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_10008508C()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100085114()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_10008519C()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100085224()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_1000852AC()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100085334()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_1000853BC()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100085444()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_1000854CC()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100085554()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_1000855DC()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100085664()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_1000856EC()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100085774()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_1000857FC()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100085884()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_10008590C(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 clientName]);
  sub_100017690();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Client %@ is missing entitlement to set placeholder disposition. : %@",  v4,  v5,  v6,  v7,  2u);

  sub_10005851C();
}

void sub_100085990()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100085A18()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100085AA0()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100085B28()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100085BB0()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100085C38()
{
  id v2 = objc_msgSend((id)sub_100058534(v1, __stack_chk_guard), "clientName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_10007276C();
  sub_100072730();
  sub_100072758( (void *)&_mh_execute_header,  v3,  v4,  "%s: Client %@ attempted operation %s on coordinator UUID %@ without being registered as interested",  v5,  v6,  v7,  v8,  2u);

  sub_100028664();
}

void sub_100085CC0()
{
}

void sub_100085D2C()
{
}

void sub_100085D98(uint64_t a1, uint64_t a2)
{
}

void sub_100085DB0(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 136315650;
  uint64_t v4 = "-[IXSAppRemovabilityManager setRemovability:forAppWithIdentity:byClient:error:]";
  __int16 v5 = 2048;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = 0LL;
  sub_1000072B0( (void *)&_mh_execute_header,  a2,  a3,  "%s: Setting app removability to an unrecognized value (%lu) is not allowed : %@",  (uint8_t *)&v3);
}

void sub_100085E3C()
{
}

void sub_100085EAC()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v0 path]);
  sub_100024348();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Failed to remove legacy removability plist at URL path %@. Error: %@",  v4,  v5,  v6,  v7,  2u);

  sub_100011B74();
}

void sub_100085F34()
{
}

void sub_100085FA4()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v0 removabilityURL]);
  sub_100024348();
  sub_100004538( (void *)&_mh_execute_header,  v2,  v3,  "%s: Failed to write app removability data to URL %@ : %@",  v4,  v5,  v6,  v7,  2u);

  sub_100011B74();
}

void sub_10008602C(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 136315650;
  uint64_t v4 = "-[IXSAppRemovabilityManager clearRemovabilityStateForIdentity:error:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = 0LL;
  sub_1000072B0( (void *)&_mh_execute_header,  a2,  a3,  "%s: Failed to find removability entry for %@ : %@",  (uint8_t *)&v3);
}

void sub_1000860B4()
{
}

void sub_100086124()
{
}

void sub_100086194()
{
}

void sub_100086204(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 40LL);
  int v3 = 136315650;
  uint64_t v4 = "-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_resetWithCompletion:]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  __int16 v7 = 2112;
  uint64_t v8 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s: Attempt made to reset a canceled promise (promise canceled with error %@) : %@",  (uint8_t *)&v3,  0x20u);
}

void sub_10008629C(void *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[7];
  uint64_t v5 = a1[8] + a2;
  int v6 = 136316418;
  __int16 v7 = "-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]_block_invoke";
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  __int16 v10 = 2048;
  uint64_t v11 = v4;
  __int16 v12 = 2048;
  uint64_t v13 = v5;
  __int16 v14 = 2048;
  uint64_t v15 = a2;
  __int16 v16 = 2112;
  uint64_t v17 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: Not enough space for promise %@: %llu bytes needed, %llu bytes available (%llu bytes were purged). : %@",  (uint8_t *)&v6,  0x3Eu);
}

void sub_100086358(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  v5[0] = 136315650;
  sub_100017690();
  sub_1000072B0((void *)&_mh_execute_header, a2, v4, "%s: Failed to create CFBundle from %@ : %@", (uint8_t *)v5);

  sub_100059238();
}

void sub_1000863E8()
{
  v2[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  v0,  v1,  "%s: CFBundleGetInfoDictionary returned NULL for bundle %@ : %@",  (uint8_t *)v2);
}

void sub_10008645C(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v3 = 136315906;
  uint64_t v4 = "LoadInfoPlistFromBundle";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  __int16 v9 = 2112;
  uint64_t v10 = 0LL;
  sub_100024320( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "%s: Failed to get filtered Info.plist with keys %@ from bundle %@ : %@",  (uint8_t *)&v3);
  sub_100059238();
}

void sub_1000864EC(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  __int16 v5 = (objc_class *)objc_opt_class(a2);
  uint64_t v6 = NSStringFromClass(v5);
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  int v9 = 136315906;
  uint64_t v10 = "LoadInfoPlistFromBundle";
  __int16 v11 = 2112;
  uint64_t v12 = a1;
  __int16 v13 = 2112;
  __int16 v14 = v7;
  __int16 v15 = 2112;
  uint64_t v16 = 0LL;
  sub_100024320( (void *)&_mh_execute_header,  a3,  v8,  "%s: Object returned from _CFBundleCreateFilteredInfoPlist for %@ was not a dictionary, was type %@ : %@",  (uint8_t *)&v9);
}

void sub_1000865B0(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  v5[0] = 136315650;
  sub_100017690();
  sub_1000072B0( (void *)&_mh_execute_header,  a2,  v4,  "%s: Failed to find a .app inside the extracted contents at %@ : %@",  (uint8_t *)v5);

  sub_100059238();
}

id objc_msgSend__asyncUpdatePlaceholderMetadataWithInstallType_reason_underlyingError_client_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_asyncUpdatePlaceholderMetadataWithInstallType:reason:underlyingError:client:");
}

id objc_msgSend__fetchIXSCoordinatedAppInstallForUUID_method_andRunWithCoordinator_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchIXSCoordinatedAppInstallForUUID:method:andRunWithCoordinator:error:");
}

id objc_msgSend__fetchPromisedOutOfBandStreamingZipTransferForUUID_method_andRunWithPromise_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchPromisedOutOfBandStreamingZipTransferForUUID:method:andRunWithPromise:error:");
}

id objc_msgSend__fetchPromisedStreamingZipTransferForUUID_method_andRunWithPromise_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchPromisedStreamingZipTransferForUUID:method:andRunWithPromise:error:");
}

id objc_msgSend__limitedConcurrency_doRetryingInstallOperationForPlaceholder_installTargetURL_retries_error_installAttemptBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_limitedConcurrency_doRetryingInstallOperationForPlaceholder:installTargetURL:retries:error:installAttemptBlock:");
}

id objc_msgSend__limitedConcurrency_installApplication_isPlaceholder_options_retries_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_limitedConcurrency_installApplication:isPlaceholder:options:retries:error:");
}

id objc_msgSend__onQueue_acquireTerminationAssertionWithPredicate_description_terminationResistance_allowLaunchPredicate_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_onQueue_acquireTerminationAssertionWithPredicate:description:terminationResistance:allowLaunchPredicate:error:");
}

id objc_msgSend__onQueue_callRemoteObjectProxyForServiceEndpoint_errorHandler_callHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_callRemoteObjectProxyForServiceEndpoint:errorHandler:callHandler:");
}

id objc_msgSend__performUninstallOfAppWithIdentity_clientName_withFlags_record_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performUninstallOfAppWithIdentity:clientName:withFlags:record:completion:");
}

id objc_msgSend__presentErrorHighlightingLocalizedAppName_withHighlightedAppRecord_bundleIDs_code_errorSource_underlyingError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_presentErrorHighlightingLocalizedAppName:withHighlightedAppRecord:bundleIDs:code:errorSource:underlyingError:");
}

id objc_msgSend__promptForDeletionWithRecord_identity_clientName_flags_completion_removability_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_promptForDeletionWithRecord:identity:clientName:flags:completion:removability:");
}

id objc_msgSend__promptForMoveOrDeleteAppRecord_identity_clientName_flags_completion_removability_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_promptForMoveOrDeleteAppRecord:identity:clientName:flags:completion:removability:");
}

id objc_msgSend__promptForRelatedDataAndUninstallAppWithRecord_identity_clientName_flags_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_promptForRelatedDataAndUninstallAppWithRecord:identity:clientName:flags:completion:");
}

id objc_msgSend__promptForUnlockOfAppRecord_identity_clientName_flags_completion_removability_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_promptForUnlockOfAppRecord:identity:clientName:flags:completion:removability:");
}

id objc_msgSend__promptToOverrideManagedSettingsOfAppWithRecord_identity_clientName_flags_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_promptToOverrideManagedSettingsOfAppWithRecord:identity:clientName:flags:completion:");
}

id objc_msgSend__terminationAssertionForBundleIDs_description_terminationResistance_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_terminationAssertionForBundleIDs:description:terminationResistance:error:");
}

id objc_msgSend__uninstallAppWithRecord_identity_clientName_flags_removability_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_uninstallAppWithRecord:identity:clientName:flags:removability:completion:");
}

id objc_msgSend_initForCoordinatorWithIdentity_totalUnits_progressHint_needsPostProcessing_delegate_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForCoordinatorWithIdentity:totalUnits:progressHint:needsPostProcessing:delegate:");
}

id objc_msgSend_initWithAppRecord_bundleIdentifier_removability_isManagedByManagedSettings_deletionIsRestricted_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithAppRecord:bundleIdentifier:removability:isManagedByManagedSettings:deletionIsRestricted:");
}

id objc_msgSend_sendNotificationOfType_forApplicationWithBundleIdentifier_requestContext_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendNotificationOfType:forApplicationWithBundleIdentifier:requestContext:error:");
}

id objc_msgSend_setPhaseProportionsForLoadingPhase_installingPhase_postProcessingPhase_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:");
}

id objc_msgSend_setProgressProportionsByPhase_forInstallOfApplicationWithIdentifier_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgressProportionsByPhase:forInstallOfApplicationWithIdentifier:error:");
}

id objc_msgSend_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:");
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}