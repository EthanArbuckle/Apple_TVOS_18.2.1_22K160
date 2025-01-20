LABEL_87:
    v22 = v77;
    goto LABEL_88;
  }

  v50 = _ATLogCategorySyncBundle(v48, v49);
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v137 = v8;
    _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "coordinator for %{public}@ has a placeholder promise", buf, 0xCu);
  }

  v28 = 0LL;
  LOBYTE(v51) = 0;
  v52 = 1LL;
LABEL_51:
  v27 = v22;
LABEL_52:
  v53 = v122;
LABEL_95:

  v22 = v27;
  v7 = v123;
LABEL_96:
  v107 = _ATLogCategorySyncBundle(v19, v20);
  v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);
  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v137 = v8;
    v138 = 1024;
    *(_DWORD *)v139 = v52;
    *(_WORD *)&v139[4] = 2114;
    *(void *)&v139[6] = v22;
    _os_log_impl( &dword_0,  v108,  OS_LOG_TYPE_DEFAULT,  "processing app install for bundle %{public}@ finished with status %d error %{public}@",  buf,  0x1Cu);
  }

  +[AITransactionLog logStep:byParty:phase:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:description:",  1LL,  1LL,  2LL,  v52,  v8,  @"Install app");
  if (!v52)
  {
    v109 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ATError",  1LL,  0LL));
    v111 = v109;
    if (v28) {
      v112 = (char)v51;
    }
    else {
      v112 = 1;
    }
    if ((v112 & 1) == 0)
    {
      v113 = _ATLogCategorySyncBundle(v109, v110);
      v114 = (os_log_s *)objc_claimAutoreleasedReturnValue(v113);
      if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v137 = v8;
        _os_log_impl( &dword_0,  v114,  OS_LOG_TYPE_DEFAULT,  "Cancelling placeholder for appBundleIdentifier:%{public}@",  buf,  0xCu);
      }

      v109 = [v28 cancelForReason:v111 client:3 error:0];
    }

    if (v21)
    {
      v115 = _ATLogCategorySyncBundle(v109, v110);
      v116 = (os_log_s *)objc_claimAutoreleasedReturnValue(v115);
      if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v137 = v8;
        _os_log_impl( &dword_0,  v116,  OS_LOG_TYPE_DEFAULT,  "Cancelling coordinator for appBundleIdentifier:%{public}@",  buf,  0xCu);
      }

      [v21 cancelForReason:v111 client:3 error:0];
    }
  }

  return v52;
}

void sub_6218(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = _ATLogCategorySyncBundle(v3, v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "Uninstall of %{public}@ with install coordinator succeeded with error %{public}@.",  (uint8_t *)&v8,  0x16u);
  }

  +[AITransactionLog logStep:byParty:phase:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:description:",  7LL,  1LL,  2LL,  v3 == 0LL,  *(void *)(a1 + 32),  @"Uninstall app");
}

LABEL_21:
  v41 = objc_msgSend(v22, "hasPlaceholderPromise", v64, v13);
  if ((v41 & 1) != 0)
  {
    v43 = _ATLogCategorySyncBundle(v41, v42);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v73 = v12;
      _os_log_impl( &dword_0,  v29,  OS_LOG_TYPE_DEFAULT,  "Coordinator for %{public}@ has a valid placeholder promise",  buf,  0xCu);
    }

    v32 = 0LL;
    v33 = 0;
    v34 = 1LL;
LABEL_25:
    v21 = v23;
    goto LABEL_26;
  }

  v44 = objc_claimAutoreleasedReturnValue( -[AppsClient _placeHolderForBundleIdentifier:withiTunesMetadata:sinfData:iconData:demotionStatus:]( v64,  "_placeHolderForBundleIdentifier:withiTunesMetadata:sinfData:iconData:demotionStatus:",  v12,  v18,  v13,  v66,  a7));
  v32 = (void *)v44;
  if (v44)
  {
    v67 = v23;
    v57 = [v22 setPlaceholderPromise:v44 error:&v67];
    v21 = v67;

    if ((v57 & 1) != 0)
    {
      v60 = -[AppsClient dataMigratorSetPlaceHolderPromiseForRestoreAppBundle:]( v64,  "dataMigratorSetPlaceHolderPromiseForRestoreAppBundle:",  v12);
      v62 = _ATLogCategorySyncBundle(v60, v61);
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v73 = v12;
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "added placeholder promise for %{public}@", buf, 0xCu);
      }

      v33 = 1;
      v34 = 1LL;
      goto LABEL_26;
    }

    v63 = _ATLogCategorySyncBundle(v58, v59);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v73 = v21;
      v74 = 2114;
      v75[0] = v12;
      _os_log_impl( &dword_0,  v29,  OS_LOG_TYPE_ERROR,  "Error %{public}@ setting placeholder promise for '%{public}@'",  buf,  0x16u);
    }

    goto LABEL_13;
  }

  v33 = 0;
  v34 = 0LL;
LABEL_27:
  v46 = _ATLogCategorySyncBundle(v44, v45);
  v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v73 = v12;
    v74 = 1024;
    LODWORD(v75[0]) = v34;
    WORD2(v75[0]) = 2114;
    *(void *)((char *)v75 + 6) = v23;
    _os_log_impl( &dword_0,  v47,  OS_LOG_TYPE_DEFAULT,  "processing app restore for demoted app %{public}@ finished with status %d error %{public}@",  buf,  0x1Cu);
  }

  +[AITransactionLog logStep:byParty:phase:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:description:",  2LL,  1LL,  2LL,  v34,  v12,  @"Restore demoted app");
  if (!v34)
  {
    v48 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ATError",  29LL,  0LL));
    v50 = v48;
    if (v22)
    {
      v51 = _ATLogCategorySyncBundle(v48, v49);
      v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v73 = v12;
        _os_log_impl( &dword_0,  v52,  OS_LOG_TYPE_DEFAULT,  "Cancelling coordinator for appBundleIdentifier:%{public}@",  buf,  0xCu);
      }

      v48 = [v22 cancelForReason:v50 client:3 error:0];
    }

    if (v32) {
      v53 = v33;
    }
    else {
      v53 = 1;
    }
    if ((v53 & 1) == 0)
    {
      v54 = _ATLogCategorySyncBundle(v48, v49);
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v73 = v12;
        _os_log_impl( &dword_0,  v55,  OS_LOG_TYPE_DEFAULT,  "Cancelling placeholder for appBundleIdentifier:%{public}@",  buf,  0xCu);
      }

      [v32 cancelForReason:v50 client:3 error:0];
    }

    -[AppsClient dataMigratorCancelledCoordinatorForRestoreAppBundle:]( v64,  "dataMigratorCancelledCoordinatorForRestoreAppBundle:",  v12,  v64);
  }

  return v34;
}

LABEL_12:
  v33 = 0LL;
  v34 = 1;
LABEL_16:

  v22 = v20;
LABEL_17:
  v38 = _ATLogCategorySyncBundle(v36, v37);
  v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v84 = v10;
    v85 = 1024;
    LODWORD(v86[0]) = v33;
    WORD2(v86[0]) = 2114;
    *(void *)((char *)v86 + 6) = v22;
    _os_log_impl( &dword_0,  v39,  OS_LOG_TYPE_DEFAULT,  "processing app restore for %{public}@ finished with status %d error %{public}@",  buf,  0x1Cu);
  }

  v28 = 1;
  +[AITransactionLog logStep:byParty:phase:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:description:",  2LL,  1LL,  2LL,  v33,  v10,  @"Restore app");
  if ((v33 & 1) != 0)
  {
    id v11 = v75;
  }

  else
  {
    v40 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ATError",  29LL,  0LL));
    v42 = v40;
    if (v21)
    {
      v43 = _ATLogCategorySyncBundle(v40, v41);
      v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v84 = v10;
        _os_log_impl( &dword_0,  v44,  OS_LOG_TYPE_DEFAULT,  "Cancelling coordinator for appBundleIdentifier:%{public}@",  buf,  0xCu);
      }

      v40 = [v21 cancelForReason:v42 client:3 error:0];
    }

    v45 = v34 ^ 1;
    if (!v29) {
      v45 = 1;
    }
    id v11 = v75;
    if ((v45 & 1) == 0)
    {
      v46 = _ATLogCategorySyncBundle(v40, v41);
      v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v84 = v10;
        _os_log_impl( &dword_0,  v47,  OS_LOG_TYPE_DEFAULT,  "Cancelling placeholder for appBundleIdentifier:%{public}@",  buf,  0xCu);
      }

      [v29 cancelForReason:v42 client:3 error:0];
    }

    -[AppsClient dataMigratorCancelledCoordinatorForRestoreAppBundle:]( v74,  "dataMigratorCancelledCoordinatorForRestoreAppBundle:",  v10);

    v28 = 0;
  }

  objc_autoreleasePoolPop(v4);
}

LABEL_32:
  return v28;
}

LABEL_40:
  v50 = v49;
  return v50;
}

LABEL_49:
          v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        uint64_t v9 = [a3 countByEnumeratingWithState:&v43 objects:v55 count:16];
        id v11 = v9;
        if (!v9) {
          goto LABEL_54;
        }
      }
    }

    v39 = (os_log_s *)_ATLogCategorySyncBundle(0LL, v8);
    uint64_t v9 = (id)os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, "No assets currently in progress.", buf, 2u);
    }

LABEL_54:
    v40 = (os_log_s *)_ATLogCategorySyncBundle(v9, v10);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v40, OS_LOG_TYPE_DEFAULT, "signaling semaphore", buf, 2u);
    }

    dispatch_semaphore_signal((dispatch_semaphore_t)v6->_waitForInitialObservationData);
  }
}

void _handleATCStartupCompletedNotification(uint64_t a1, void *a2)
{
  if (a2) {
    [a2 setupInstallCoordinatorObserver];
  }
}

void sub_9788(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (os_log_s *)_ATLogCategorySyncBundle(a1, a2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "Prioritize %{public}@ finished with error %{public}@",  (uint8_t *)&v6,  0x16u);
  }

void sub_9A54( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

id sub_9A78(void *a1)
{
  *(_BYTE *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 80) containsObject:a1[5]];
  return [*(id *)(a1[4] + 80) addObject:a1[5]];
}

void sub_9AB4(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 88) containsObject:*(void *)(a1 + 40)])
  {
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24LL));
    --*(void *)(*(void *)(a1 + 32) + 128LL);
    id v2 = [*(id *)(*(void *)(a1 + 32) + 88) removeObject:*(void *)(a1 + 40)];
    uint64_t v4 = (os_log_s *)_ATLogCategorySyncBundle(v2, v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 128LL);
      int v7 = 138543618;
      uint64_t v8 = v5;
      __int16 v9 = 2048;
      uint64_t v10 = v6;
      _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "IC cancelled coordinator for restoring app bundle %{public}@ _restoringPlaceholderCount %lld",  (uint8_t *)&v7,  0x16u);
    }
  }

LABEL_46:
    v49 = 1;
    goto LABEL_47;
  }

  v16 = -[NSFileManager moveItemAtPath:toPath:error:]( v9,  "moveItemAtPath:toPath:error:",  @"/var/mobile/Media/PublicStaging/ApplicationSync",  @"/var/mobile/Library/ApplicationSync/iTunesStuff",  a6);
  if (v16)
  {
    v18 = -[AppsClient _appRemovalAllowed](self, "_appRemovalAllowed");
    p_type = &stru_1CFF0.type;
    v20 = +[AppsClient _loadPlist:withError:]( &OBJC_CLASS___AppsClient,  "_loadPlist:withError:",  @"/var/mobile/Library/ApplicationSync/iTunesStuff/ApplicationsSync.plist",  a6);
    v22 = v20;
    if (v20)
    {
      if ((v18 & 1) != 0)
      {
        v23 = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 8LL);
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v24 = v22;
        v25 = [v22 countByEnumeratingWithState:&v59 objects:v64 count:16];
        if (v25)
        {
          v26 = v25;
          v27 = *(void *)v60;
          do
          {
            for (i = 0LL; i != v26; i = (char *)i + 1)
            {
              if (*(void *)v60 != v27) {
                objc_enumerationMutation(v24);
              }
              v29 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
              v30 = [v29 objectForKey:@"identifier"];
              if (sub_A874((BOOL)v30))
              {
                v31 = objc_msgSend( objc_msgSend(v29, "objectForKey:", @"operation"),  "isEqualToString:",  @"remove");
                if ((_DWORD)v31)
                {
                  v33 = (os_log_s *)_ATLogCategorySyncBundle(v31, v32);
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    v66 = v30;
                    _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ targeted for termination", buf, 0xCu);
                  }

                  -[NSMutableArray addObject:](v23, "addObject:", v30);
                }
              }
            }

            v26 = [v24 countByEnumeratingWithState:&v59 objects:v64 count:16];
          }

          while (v26);
        }

        v34 = -[NSMutableArray count](v23, "count");
        v22 = v24;
        p_type = (char **)(&stru_1CFF0 + 16);
        if (v34)
        {
          v36 = (os_log_s *)_ATLogCategorySyncBundle(v34, v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            v37 = -[NSMutableArray count](v23, "count");
            *(_DWORD *)buf = 134217984;
            v66 = v37;
            _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "performing %llu deletions", buf, 0xCu);
          }

          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v55,  v63,  16LL);
          if (v38)
          {
            v39 = v38;
            v40 = *(void *)v56;
            do
            {
              for (j = 0LL; j != v39; j = (char *)j + 1)
              {
                if (*(void *)v56 != v40) {
                  objc_enumerationMutation(v23);
                }
                -[AppsClient uninstallAppUsingCoordination:]( self,  "uninstallAppUsingCoordination:",  *(void *)(*((void *)&v55 + 1) + 8LL * (void)j));
              }

              v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v55,  v63,  16LL);
            }

            while (v39);
          }
        }

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);
}

LABEL_36:
        [p_type + 283 _notifySpringBoard:1];
        v44 = +[NSData dataWithContentsOfFile:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/SpringboardIconState.plist",  @"/var/mobile/Library/ApplicationSync/iTunesStuff"));
        v45 = -[NSData length](v44, "length");
        if (v45)
        {
          v47 = (os_log_s *)_ATLogCategorySyncBundle(v45, v46);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v47, OS_LOG_TYPE_DEFAULT, "Sending iconlayout to SB", buf, 2u);
          }

          v48 = SBSSpringBoardBlockableServerPort();
          v45 = SBSetIconState(v48, -[NSData bytes](v44, "bytes"), -[NSData length](v44, "length"));
        }

        if (v22)
        {
          v49 = 1;
          v45 = -[NSData writeToFile:atomically:]( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v22,  200LL,  0LL,  0LL),  "writeToFile:atomically:",  @"/var/mobile/Library/ApplicationSync/iTunesStuff/ApplicationsSync.plist-debug.plist",  1LL);
          goto LABEL_47;
        }

        goto LABEL_46;
      }

      v42 = (os_log_s *)_ATLogCategorySyncBundle(v20, v21);
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      *(_WORD *)buf = 0;
      v43 = "Not processing deletes because app removal is restricted";
    }

    else
    {
      v42 = (os_log_s *)_ATLogCategorySyncBundle(0LL, v21);
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      *(_WORD *)buf = 0;
      v43 = "Nothing to do from iTunes";
    }

    _os_log_impl(&dword_0, v42, OS_LOG_TYPE_DEFAULT, v43, buf, 2u);
    goto LABEL_36;
  }

  v50 = (os_log_s *)_ATLogCategorySyncBundle(v16, v17);
  v45 = os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
  v49 = 0;
  if ((_DWORD)v45)
  {
    *(_WORD *)buf = 0;
    v51 = "Can't move staging area";
LABEL_52:
    _os_log_impl(&dword_0, v50, OS_LOG_TYPE_DEFAULT, v51, buf, 2u);
    v49 = 0;
  }

LABEL_47:
  v53 = (os_log_s *)_ATLogCategorySyncBundle(v45, v46);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v53, OS_LOG_TYPE_DEFAULT, "finished reconcile sync", buf, 2u);
  }

  return v49;
}

BOOL sub_A874(BOOL result)
{
  if (result)
  {
    v1 = (void *)result;
    objc_opt_class(&OBJC_CLASS___NSString);
    return (objc_opt_isKindOfClass(v1) & 1) != 0
        && [v1 rangeOfString:@"/.."] == (id)0x7FFFFFFFFFFFFFFFLL;
  }

  return result;
}

uint64_t sub_ACD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (os_log_s *)_ATLogCategorySyncBundle(a1, a2);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      int v10 = 138543362;
      uint64_t v11 = a2;
      uint64_t v6 = "refreshReceiptsWithCompletionBlock failed: %{public}@";
      int v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, v8);
    }
  }

  else if (v5)
  {
    LOWORD(v10) = 0;
    uint64_t v6 = "refreshReceiptsWithCompletionBlock succeeded";
    int v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_ADAC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
}

void sub_B3F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_B468(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend( *(id *)(*(void *)(a1 + 32) + 72),  "containsObject:",  objc_msgSend( *(id *)(a1 + 40),  "identifier"));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend( *(id *)(*(void *)(a1 + 32) + 80),  "containsObject:",  objc_msgSend( *(id *)(a1 + 40),  "identifier"));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "identifier"));
  return objc_msgSend( *(id *)(*(void *)(a1 + 32) + 80),  "removeObject:",  objc_msgSend(*(id *)(a1 + 40), "identifier"));
}

LABEL_80:
              if (!v56) {
                v56 = (NSMutableDictionary *)[v51 objectForKey:@"NameFromItunes"];
              }
              if (v56) {
                v84 = v56;
              }
              else {
                v84 = v130;
              }
              v85 = v55;
              if (!+[AppsClient _makeIconFromBundlePath:saveTo:]( &OBJC_CLASS___AppsClient,  "_makeIconFromBundlePath:saveTo:",  v55,  v54)) {
                v54 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@/iTunesArtwork",  [v51 objectForKey:@"Container"]);
              }
              v86 = +[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v54, 0LL);
              v119 = v84;
              v87 = +[ATAsset downloadAssetWithIdentifier:dataclass:prettyName:]( &OBJC_CLASS___ATAsset,  "downloadAssetWithIdentifier:dataclass:prettyName:",  v130,  @"Application",  v84);
              [v87 setIcon:v86];
              [v87 setIsRestore:0];
              v88 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
              v89 = -[AppsClient _restoreStatePropertyForKey:identifier:version:]( v122,  "_restoreStatePropertyForKey:identifier:version:",  @"path",  v130,  v129);
              if (v89)
              {
                v90 = v89;
                v91 = -[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  v89);
                v92 = v91;
                v94 = (os_log_s *)_ATLogCategorySyncBundle(v91, v93);
                v95 = os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT);
                if (v92)
                {
                  if (v95)
                  {
                    *(_DWORD *)buf = 138543618;
                    v146 = v130;
                    v147 = 2114;
                    *(void *)v148 = v90;
                    _os_log_impl( &dword_0,  v94,  OS_LOG_TYPE_DEFAULT,  "Recovered download path for %{public}@ at %{public}@",  buf,  0x16u);
                  }

                  v96 = [v87 isRestore];
                  v97 = &off_19620;
                  if ((v96 & 1) != 0) {
                    goto LABEL_101;
                  }
                  goto LABEL_98;
                }

                if (v95)
                {
                  *(_DWORD *)buf = 138543618;
                  v146 = v130;
                  v147 = 2114;
                  *(void *)v148 = v90;
                  _os_log_impl( &dword_0,  v94,  OS_LOG_TYPE_DEFAULT,  "Download path recovered for %{public}@ but the file is missing: %{public}@",  buf,  0x16u);
                }
              }

              [v87 isRestore];
LABEL_98:
              else {
                v97 = &off_19650;
              }
LABEL_101:
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v88,  "setObject:forKeyedSubscript:",  v97,  @"AssetParts");
              if (v129) {
                -[NSMutableDictionary setObject:forKeyedSubscript:]( v88,  "setObject:forKeyedSubscript:",  v129,  @"Version");
              }
              if (-[NSMutableDictionary count](v88, "count")) {
                [v87 setVariantOptions:v88];
              }

              [v87 setStorePlist:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@/iTunesMetadata.plist", objc_msgSend(v51, "objectForKey:", @"Container"))];
              [v87 setInfoPlist:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/Info.plist", v85)];
              v98 = [v87 setAssetType:@"Application"];
              v100 = (os_log_s *)_ATLogCategorySyncBundle(v98, v99);
              if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
              {
                v101 = [v87 storePlist];
                v102 = [v87 infoPlist];
                v103 = [v87 storePID];
                v104 = [v87 isRestore];
                *(_DWORD *)buf = 138545410;
                if (v104) {
                  v105 = 121;
                }
                else {
                  v105 = 110;
                }
                v146 = v130;
                v147 = 2114;
                *(void *)v148 = v119;
                *(_WORD *)&v148[8] = 2114;
                v149 = v129;
                v150 = 2114;
                v151 = v86;
                v152 = 2114;
                v153 = v85;
                v154 = 2114;
                v155 = v101;
                v156 = 2114;
                v157 = v102;
                v158 = 2048;
                v159 = v103;
                v160 = 1024;
                v161 = v105;
                _os_log_impl( &dword_0,  v100,  OS_LOG_TYPE_DEFAULT,  "Asset %{public}@ (pretty=%{public}@, version=%{public}@) prepped with icon %{public}@, at %{public}@, meta at %{public}@, info at %{public}@, storePid=%lld, isRestore=%c",  buf,  0x58u);
              }

              v106 = +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  v130,  0LL);
              v107 = v106;
              if (v106)
              {
                v108 = v122;
                if ([v106 isInstalled]
                  && (v109 = [v107 isPlaceholder], (v109 & 1) == 0))
                {
                  v111 = (os_log_s *)_ATLogCategorySyncBundle(v109, v110);
                  if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    v146 = v130;
                    _os_log_impl( &dword_0,  v111,  OS_LOG_TYPE_DEFAULT,  "App %{public}@ is already installed and will be updated.",  buf,  0xCu);
                  }

                  v107 = &dword_0 + 1;
                }

                else
                {
                  v107 = 0LL;
                }
              }

              else
              {
                v108 = v122;
              }

              v112 = -[AppsClient prepareAppForInstallUsingCoordination:existingApp:]( v108,  "prepareAppForInstallUsingCoordination:existingApp:",  v87,  v107);
              if (v112)
              {
                -[NSMutableArray addObject:](v118, "addObject:", v87);
                accessQueue = (dispatch_queue_s *)v108->_accessQueue;
                block[0] = _NSConcreteStackBlock;
                block[1] = 3221225472LL;
                block[2] = sub_C9B0;
                block[3] = &unk_18550;
                v132 = (char)v107;
                block[4] = v108;
                block[5] = v130;
                dispatch_sync(accessQueue, block);
              }

              else
              {
                v115 = (os_log_s *)_ATLogCategorySyncBundle(v112, v113);
                if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v146 = v130;
                  _os_log_impl(&dword_0, v115, OS_LOG_TYPE_ERROR, "Not requesting app asset for %{public}@", buf, 0xCu);
                }

                -[AppsClient changeAssetID:toDo:](v108, "changeAssetID:toDo:", v130, @"FAILED");
              }

              goto LABEL_66;
            }

            if (v83)
            {
              *(_DWORD *)buf = 138543874;
              v146 = v130;
              v147 = 1024;
              *(_DWORD *)v148 = v60;
              *(_WORD *)&v148[4] = 1024;
              *(_DWORD *)&v148[6] = v62;
              v71 = v82;
              v72 = "%{public}@ is currenlty demoted (manual:%d, auto:%d) - skipping";
              v74 = 24;
              goto LABEL_65;
            }
          }
        }

LABEL_66:
        v50 = (char *)v50 + 1;
      }

      while (v127 != v50);
      v116 = [obj countByEnumeratingWithState:&v133 objects:v162 count:16];
      v127 = v116;
    }

    while (v116);
  }

  return v118;
}

id sub_C7E8(uint64_t a1, void *a2)
{
  uint64_t v4 = +[NSMutableDictionary dictionaryWithCapacity:](&OBJC_CLASS___NSMutableDictionary, "dictionaryWithCapacity:", 0LL);
  id v5 = [a2 bundleVersion];
  if (v5) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v5, kCFBundleVersionKey);
  }
  id v6 = [a2 bundleIdentifier];
  if (v6) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, kCFBundleIdentifierKey);
  }
  id v7 = objc_msgSend(objc_msgSend(a2, "bundleContainerURL"), "path");
  if (v7) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v7, @"Container");
  }
  uint32_t v8 = +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [a2 installType] == (char *)&dword_0 + 2);
  if (v8) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v8, @"IsRestore");
  }
  __int16 v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a2 installType] == &dword_8);
  if (v9) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v9,  @"intentional_demoted_app");
  }
  int v10 = +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [a2 installType] == (char *)&dword_4 + 3);
  if (v10) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v10,  @"auto_demoted_app");
  }
  uint64_t v11 = +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  objc_msgSend(objc_msgSend(a2, "applicationType"), "isEqualToString:", @"System"));
  if (v11) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v11, @"system_app");
  }
  id v12 = objc_msgSend(objc_msgSend(a2, "bundleURL"), "path");
  if (v12) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, @"Path");
  }
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v4, objc_msgSend(a2, "applicationIdentifier"));
}

void *sub_C9B0(void *result)
{
  if (*((_BYTE *)result + 48)) {
    return [*(id *)(result[4] + 72) addObject:result[5]];
  }
  return result;
}

void sub_CCFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_CD24(uint64_t a1, void *a2)
{
  id result = objc_msgSend(objc_msgSend(a2, "applicationType"), "isEqualToString:", @"User");
  if ((_DWORD)result)
  {
    id result = objc_msgSend(objc_msgSend(objc_msgSend(a2, "diskUsage"), "staticUsage"), "unsignedLongLongValue");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) += result;
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  }

  return result;
}

void sub_CEC0(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_autoreleasePoolPush();
  id v5 = objc_msgSend( objc_msgSend(objc_msgSend(a2, "bundleContainerURL"), "path"),  "stringByAppendingPathComponent:",  @"iTunesMetadata.plist");
  id v6 = +[NSDictionary dictionaryWithContentsOfFile:](&OBJC_CLASS___NSDictionary, "dictionaryWithContentsOfFile:", v5);
  id v7 = -[NSDictionary objectForKey:](v6, "objectForKey:", @"appleId");
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
  __int16 v9 = (void *)sub_D160((uint64_t)v7, v8, (uint64_t)@"appleID");
  id v10 = -[NSDictionary objectForKey:](v6, "objectForKey:", @"com.apple.iTunesStore.downloadInfo");
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  id v12 = objc_msgSend( (id)sub_D160((uint64_t)v10, v11, (uint64_t)@"downloadInfo"),  "objectForKey:",  @"accountInfo");
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  id v14 = objc_msgSend((id)sub_D160((uint64_t)v12, v13, (uint64_t)@"accountInfo"), "objectForKey:", @"AppleID");
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v16 = (void *)sub_D160((uint64_t)v14, v15, (uint64_t)@"AppleID");
  if ([v9 length] && objc_msgSend(v16, "length"))
  {
    id v17 = [v9 isEqual:v16];
    if ((v17 & 1) == 0)
    {
      v19 = (os_log_s *)_ATLogCategorySyncBundle(v17, v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138543874;
        id v25 = [a2 applicationIdentifier];
        __int16 v26 = 2114;
        id v27 = v9;
        __int16 v28 = 2114;
        v29 = v16;
        _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_DEFAULT,  "mismatched AppleID keys for %{public}@: %{public}@ vs %{public}@",  (uint8_t *)&v24,  0x20u);
      }
    }

    [*(id *)(a1 + 32) addObject:v9];
    goto LABEL_10;
  }

  if ([v9 length])
  {
    v20 = *(void **)(a1 + 32);
    v21 = v9;
LABEL_11:
    [v20 addObject:v21];
    goto LABEL_12;
  }

  if ([v16 length])
  {
LABEL_10:
    v20 = *(void **)(a1 + 32);
    v21 = v16;
    goto LABEL_11;
  }

  v23 = (os_log_s *)_ATLogCategorySyncBundle(0LL, v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138543618;
    id v25 = [a2 applicationIdentifier];
    __int16 v26 = 2114;
    id v27 = v5;
    _os_log_impl( &dword_0,  v23,  OS_LOG_TYPE_DEFAULT,  "unknown AppleID for %{public}@ (plist at %{public}@)",  (uint8_t *)&v24,  0x16u);
  }

uint64_t sub_D160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a1;
  if (a1)
  {
    uint64_t isKindOfClass = objc_opt_isKindOfClass(a1);
    if ((isKindOfClass & 1) == 0)
    {
      id v7 = (os_log_s *)_ATLogCategorySyncBundle(isKindOfClass, v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138543362;
        uint64_t v10 = a3;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "unexpected type for %{public}@", (uint8_t *)&v9, 0xCu);
      }

      return 0LL;
    }
  }

  return v3;
}

void sub_D354(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_autoreleasePoolPush();
  id v5 = +[NSDictionary dictionaryWithContentsOfFile:]( NSDictionary,  "dictionaryWithContentsOfFile:",  objc_msgSend( objc_msgSend(objc_msgSend(a2, "bundleContainerURL"), "path"),  "stringByAppendingPathComponent:",  @"iTunesMetadata.plist"));
  id v6 = -[NSDictionary objectForKey:](v5, "objectForKey:", @"com.apple.iTunesStore.downloadInfo");
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  id v8 = objc_msgSend( (id)sub_D160((uint64_t)v6, v7, (uint64_t)@"downloadInfo"),  "objectForKey:",  @"accountInfo");
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v10 = (void *)sub_D160((uint64_t)v8, v9, (uint64_t)@"accountInfo");
  id v11 = [v10 objectForKey:@"AppleID"];
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v13 = sub_D160((uint64_t)v11, v12, (uint64_t)@"AppleID");
  if (v13
    || (id v14 = -[NSDictionary objectForKey:](v5, "objectForKey:", @"appleId"),
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString),
        (uint64_t v13 = sub_D160((uint64_t)v14, v15, (uint64_t)@"appleID")) != 0))
  {
    if (([*(id *)(a1 + 32) containsObject:v13] & 1) == 0)
    {
      id v16 = [v10 objectForKey:@"DSPersonID"];
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNumber);
      uint64_t v18 = sub_D160((uint64_t)v16, v17, (uint64_t)@"DSPersonID");
      id v19 = [v10 objectForKey:@"AltDSID"];
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString);
      uint64_t v21 = sub_D160((uint64_t)v19, v20, (uint64_t)@"AltDSID");
      id v22 = objc_alloc_init(&OBJC_CLASS___ATMutableAccountInfo);
      [v22 setDSID:v18];
      [v22 setAppleID:v13];
      [v22 setAltDSID:v21];
      [*(id *)(a1 + 40) addObject:v22];
      [*(id *)(a1 + 32) addObject:v13];
    }
  }

  objc_autoreleasePoolPop(v4);
}

void sub_D6AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

id sub_D6C4(uint64_t a1)
{
  id result = objc_msgSend( *(id *)(*(void *)(a1 + 32) + 72),  "containsObject:",  objc_msgSend(*(id *)(a1 + 40), "identifier"));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

void sub_D810(id a1, LSBundleProxy *a2, BOOL *a3)
{
  uint64_t v4 = objc_autoreleasePoolPush();
  id v5 = objc_msgSend( objc_msgSend(-[LSBundleProxy bundleContainerURL](a2, "bundleContainerURL"), "path"),  "stringByAppendingPathComponent:",  @"iTunesMetadata.plist");
  id v6 = +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v5);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = -[NSMutableDictionary objectForKey:](v6, "objectForKey:", @"DeviceBasedVPP");
    unsigned int v9 = -[LSBundleProxy hasMIDBasedSINF](a2, "hasMIDBasedSINF");
    if (v8) {
      int v10 = 1;
    }
    else {
      int v10 = v9;
    }
    if (v10 == 1)
    {
      unsigned int v11 = v9;
      uint64_t v12 = v9 ? &__kCFBooleanTrue : &__kCFBooleanFalse;
      id v13 = -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v12, @"DeviceBasedVPP");
      uint64_t v15 = (os_log_s *)_ATLogCategorySyncBundle(v13, v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138543618;
        id v22 = -[LSBundleProxy bundleIdentifier](a2, "bundleIdentifier");
        __int16 v23 = 1024;
        unsigned int v24 = v11;
        _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_DEFAULT,  "Updated DeviceBasedVPP state for : %{public}@ to %d",  (uint8_t *)&v21,  0x12u);
      }
    }

    id v16 = -[NSMutableDictionary objectForKey:](v7, "objectForKey:", @"is-auto-download");
    if (v16 && [v16 BOOLValue])
    {
      id v17 = -[NSMutableDictionary removeObjectForKey:](v7, "removeObjectForKey:", @"is-auto-download");
      id v19 = (os_log_s *)_ATLogCategorySyncBundle(v17, v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = -[LSBundleProxy bundleIdentifier](a2, "bundleIdentifier");
        int v21 = 138543362;
        id v22 = v20;
        _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_DEFAULT,  "clearing is-auto-download value for %{public}@",  (uint8_t *)&v21,  0xCu);
      }

      goto LABEL_16;
    }

    if (v10) {
LABEL_16:
    }
      -[NSMutableDictionary writeToFile:atomically:](v7, "writeToFile:atomically:", v5, 1LL);
  }

  objc_autoreleasePoolPop(v4);
}

LABEL_27:
    id v22 = 0;
    id v19 = 0LL;
    goto LABEL_8;
  }

  id v17 = CGImageDestinationCreateWithData(v8, @"public.png", 1uLL, 0LL);
  if (!v17)
  {
    v29 = (os_log_s *)_ATLogCategorySyncBundle(0LL, v18);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v36) = 0;
      v30 = "couldn't create image";
      goto LABEL_26;
    }

    goto LABEL_27;
  }

  id v19 = v17;
  CGImageDestinationAddImage(v17, v16, 0LL);
  id v20 = CGImageDestinationFinalize(v19);
  if (!v20)
  {
    v31 = (os_log_s *)_ATLogCategorySyncBundle(v20, v21);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v36) = 0;
      v32 = "Couldn't finalize image";
      v33 = v31;
      v34 = 2;
LABEL_32:
      _os_log_impl(&dword_0, v33, OS_LOG_TYPE_ERROR, v32, (uint8_t *)&v36, v34);
    }

LABEL_33:
    id v22 = 0;
    goto LABEL_8;
  }

  id v22 = 1;
  __int16 v23 = -[__CFData writeToFile:atomically:](v8, "writeToFile:atomically:", a4, 1LL);
  if ((v23 & 1) == 0)
  {
    v35 = (os_log_s *)_ATLogCategorySyncBundle(v23, v24);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = 138543362;
      v37 = a4;
      v32 = "Couldn't save image file to %{public}@";
      v33 = v35;
      v34 = 12;
      goto LABEL_32;
    }

    goto LABEL_33;
  }

LABEL_8:
  CFRelease(v11);
  CFRelease(v14);
  if (v16) {
    CFRelease(v16);
  }
  if (v19) {
    CFRelease(v19);
  }
  return v22;
}

void sub_E838(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 88) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24LL));
    ++*(void *)(*(void *)(a1 + 32) + 128LL);
    id v2 = [*(id *)(*(void *)(a1 + 32) + 88) addObject:*(void *)(a1 + 40)];
    uint64_t v4 = (os_log_s *)_ATLogCategorySyncBundle(v2, v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 128LL);
      int v7 = 138543618;
      uint64_t v8 = v5;
      __int16 v9 = 2048;
      uint64_t v10 = v6;
      _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "DataMigrator will wait for IC to install placeholder for %{public}@, _restoringPlaceholderCount %lld",  (uint8_t *)&v7,  0x16u);
    }
  }

void sub_E974(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 88) containsObject:*(void *)(a1 + 40)])
  {
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24LL));
    --*(void *)(*(void *)(a1 + 32) + 128LL);
    id v2 = [*(id *)(*(void *)(a1 + 32) + 88) removeObject:*(void *)(a1 + 40)];
    uint64_t v4 = (os_log_s *)_ATLogCategorySyncBundle(v2, v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 128LL);
      int v7 = 138543618;
      uint64_t v8 = v5;
      __int16 v9 = 2048;
      uint64_t v10 = v6;
      _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "DataMigrator cancelled coordinator for restoring app bundle %{public}@ _restoringPlaceholderCount %lld",  (uint8_t *)&v7,  0x16u);
    }
  }

void sub_EAB0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 96))
  {
    id v3 = [*(id *)(v1 + 88) containsObject:*(void *)(a1 + 40)];
    if ((_DWORD)v3)
    {
      dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24LL));
      --*(void *)(*(void *)(a1 + 32) + 128LL);
      id v5 = [*(id *)(*(void *)(a1 + 32) + 88) removeObject:*(void *)(a1 + 40)];
      int v7 = (os_log_s *)_ATLogCategorySyncBundle(v5, v6);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 128LL);
      int v16 = 138543618;
      uint64_t v17 = v8;
      __int16 v18 = 2048;
      uint64_t v19 = v9;
      uint64_t v10 = "IC finished installing placeholder for %{public}@, _restoringPlaceholderCount %lld";
      unsigned int v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      uint32_t v13 = 22;
    }

    else
    {
      uint64_t v14 = (os_log_s *)_ATLogCategorySyncBundle(v3, v4);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        return;
      }
      uint64_t v15 = *(void *)(a1 + 40);
      int v16 = 138543362;
      uint64_t v17 = v15;
      uint64_t v10 = "Ignoring notification from IC about installing placeholder for %{public}@";
      unsigned int v11 = v14;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 12;
    }

    _os_log_impl(&dword_0, v11, v12, v10, (uint8_t *)&v16, v13);
  }

LABEL_41:
    uint64_t v17 = 0;
    goto LABEL_46;
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "processing itunes restore info", buf, 2u);
  }

  v52 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v6,  0LL,  0LL,  &v59);
  if (!v52)
  {
    uint64_t v9 = (os_log_s *)_ATLogCategorySyncBundle(0LL, v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v61 = v59;
      v39 = "failed to parse itunes app restore info. err=%{public}@";
      goto LABEL_40;
    }

    goto LABEL_41;
  }

  v49 = v3;
  unsigned int v11 = +[AppsClient _loadDemotedAppsPlist:withError:]( &OBJC_CLASS___AppsClient,  "_loadDemotedAppsPlist:withError:",  @"/var/mobile/Library/Preferences/com.apple.MobileBackup.DemotedApps.plist",  0LL);
  os_log_type_t v12 = [v11 objectForKey:@"AutomaticDowngrades"];
  v51 = [v11 objectForKey:@"IntentionalDowngrades"];
  uint64_t v14 = (os_log_s *)_ATLogCategorySyncBundle_Oversize(v51, v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v61 = (uint64_t)v11;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Demoted Apps: %{public}@", buf, 0xCu);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = [v52 allKeys];
  uint64_t v15 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (!v15)
  {
    uint64_t v17 = 0;
    goto LABEL_43;
  }

  int v16 = v15;
  uint64_t v17 = 0;
  __int16 v18 = *(void *)v56;
  v50 = *(void *)v56;
  do
  {
    for (i = 0LL; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v56 != v18) {
        objc_enumerationMutation(obj);
      }
      id v20 = *(void *)(*((void *)&v55 + 1) + 8LL * (void)i);
      int v21 = [v12 containsObject:v20];
      if ((v21 & 1) != 0)
      {
        __int16 v23 = 2LL;
      }

      else
      {
        int v21 = [v51 containsObject:v20];
        __int16 v23 = v21;
      }

      unsigned int v24 = (os_log_s *)_ATLogCategorySyncBundle(v21, v22);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v61 = v20;
        v62 = 2048;
        v63 = v23;
        _os_log_impl( &dword_0,  v24,  OS_LOG_TYPE_DEFAULT,  "processing itunes restore info for '%{public}@' demotionStatus :%lu",  buf,  0x16u);
      }

      id v25 = -[AppsClient _placeholderExistsForApplication:](self, "_placeholderExistsForApplication:", v20);
      if (v25)
      {
        id v27 = (os_log_s *)_ATLogCategorySyncBundle(v25, v26);
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
          continue;
        }
        *(_DWORD *)buf = 138543362;
        v61 = v20;
        __int16 v28 = v27;
        v29 = "placeholder already exists for '%{public}@' - skiping'";
LABEL_26:
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);
        continue;
      }

      v30 = [v52 objectForKey:v20];
      if (!v30)
      {
        v35 = (os_log_s *)_ATLogCategorySyncBundle(0LL, v31);
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
          continue;
        }
        *(_DWORD *)buf = 138543362;
        v61 = v20;
        __int16 v28 = v35;
        v29 = "no itunes restore info for '%{public}@' - skipping";
        goto LABEL_26;
      }

      v32 = v30;
      v33 = [v30 objectForKey:@"iTunesMetadata"];
      if (v33)
      {
        uint64_t v17 = -[AppsClient prepareAppForRestoreUsingCoordination:iTunesMetadata:sinfData:iconData:demotionStatus:]( self,  "prepareAppForRestoreUsingCoordination:iTunesMetadata:sinfData:iconData:demotionStatus:",  v20,  v33,  [v32 objectForKey:@"ApplicationSINF"],  objc_msgSend(v32, "objectForKey:", @"PlaceholderIcon"),  v23);
      }

      else
      {
        v36 = (os_log_s *)_ATLogCategorySyncBundle(0LL, v34);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v61 = v20;
          _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "no iTunesMetadata for '%{public}@' - ignoring", buf, 0xCu);
        }
      }

      __int16 v18 = v50;
    }

    int v16 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
  }

  while (v16);
LABEL_43:
  restoringPlaceholderCount = self->_restoringPlaceholderCount;
  v41 = dispatch_time(0LL, 5000000000LL * restoringPlaceholderCount);
  v43 = (os_log_s *)_ATLogCategorySyncBundle(v41, v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = self->_restoringPlaceholderCount;
    *(_DWORD *)buf = 134218240;
    v61 = 5 * restoringPlaceholderCount;
    v62 = 2048;
    v63 = v44;
    _os_log_impl( &dword_0,  v43,  OS_LOG_TYPE_DEFAULT,  "Will wait for %lld seconds for %lld placeholders to install",  buf,  0x16u);
  }

  dispatch_group_wait((dispatch_group_t)self->_restorePlaceHoldersWaitGroup, v41);
  restoreQueue = self->_restoreQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_F518;
  block[3] = &unk_184D8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)restoreQueue, block);
  id v3 = v49;
LABEL_46:
  -[NSFileManager removeItemAtPath:error:]( v3,  "removeItemAtPath:error:",  @"/var/mobile/Library/Logs/MediaServices/RestoreApplications.plist",  0LL);
  v46 = -[NSFileManager moveItemAtPath:toPath:error:]( v3,  "moveItemAtPath:toPath:error:",  @"/var/mobile/Media/iTunesRestore/RestoreApplications.plist",  @"/var/mobile/Library/Logs/MediaServices/RestoreApplications.plist",  &v59);
  if (!v46)
  {
    v48 = (os_log_s *)_ATLogCategorySyncBundle(v46, v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v61 = v59;
      _os_log_impl(&dword_0, v48, OS_LOG_TYPE_ERROR, "failed to copy itunes metadata. err=%{public}@", buf, 0xCu);
    }
  }

  return v17 & 1;
}

void sub_F518(uint64_t a1, uint64_t a2)
{
  id v3 = (os_log_s *)_ATLogCategorySyncBundle(a1, a2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Finished waiting for placeholder installs", v4, 2u);
  }

  *(_BYTE *)(*(void *)(a1 + 32) + 96LL) = 1;
}

uint64_t sub_F9B0(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_isKindOfClass(a2);
  if ((result & 1) != 0)
  {
    uint64_t result = (uint64_t)objc_msgSend(objc_msgSend(a2, "appState"), "isPlaceholder");
    if ((_DWORD)result) {
      return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
    }
  }

  return result;
}

void sub_FB64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_FB88(uint64_t a1, uint64_t a2)
{
}

void sub_FB98(uint64_t a1)
{
}

uint64_t sub_FBA4(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_isKindOfClass(a2);
  if ((result & 1) != 0)
  {
    uint64_t result = (uint64_t)objc_msgSend(objc_msgSend(a2, "appState"), "isPlaceholder");
    if ((_DWORD)result) {
      return (uint64_t)objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40),  "addObject:",  objc_msgSend(a2, "bundleIdentifier"));
    }
  }

  return result;
}

id objc_msgSend__createAppAssetPromiseForBundleIdentifier_atPath_andAddToCoordinatinator_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createAppAssetPromiseForBundleIdentifier:atPath:andAddToCoordinatinator:");
}

id objc_msgSend__createIconPromiseForBundleIdentifier_transferPath_diskSpaceNeeded_andAddToPlaceHolder_forAppInstall_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_createIconPromiseForBundleIdentifier:transferPath:diskSpaceNeeded:andAddToPlaceHolder:forAppInstall:");
}

id objc_msgSend__initiatingOrUpdatingAppInstallCoordinatorForBundleIdentifier_existingApp_createIfNotExisting_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_initiatingOrUpdatingAppInstallCoordinatorForBundleIdentifier:existingApp:createIfNotExisting:error:");
}

id objc_msgSend__placeHolderForBundleIdentifier_withiTunesMetadata_sinfData_iconData_demotionStatus_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_placeHolderForBundleIdentifier:withiTunesMetadata:sinfData:iconData:demotionStatus:");
}

id objc_msgSend_coordinatorForAppWithBundleID_withClientID_createIfNotExisting_created_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:");
}

id objc_msgSend_prepareAppForRestoreUsingCoordination_iTunesMetadata_sinfData_iconData_demotionStatus_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareAppForRestoreUsingCoordination:iTunesMetadata:sinfData:iconData:demotionStatus:");
}

id objc_msgSend_writeIconData_atPath_returningFileSize_forBundleIdentifier_withAttributes_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeIconData:atPath:returningFileSize:forBundleIdentifier:withAttributes:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}