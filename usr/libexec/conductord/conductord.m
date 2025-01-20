id *sub_100002D3C(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *v10;
  dispatch_queue_attr_t v11;
  dispatch_queue_attr_s *v12;
  dispatch_queue_t v13;
  id v14;
  dispatch_queue_attr_t v15;
  dispatch_queue_attr_s *v16;
  dispatch_queue_t v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  id *v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  COStateManager *v29;
  id v30;
  id v31;
  id v32;
  os_log_s *v33;
  id v34;
  dispatch_queue_s *v35;
  void block[4];
  id *v38;
  objc_super v39;
  uint8_t buf[4];
  id *v41;
  __int16 v42;
  id v43;
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v39.receiver = a1;
    v39.super_class = (Class)&OBJC_CLASS___DACRoleCoordinator;
    v10 = (id *)objc_msgSendSuper2(&v39, "init");
    a1 = v10;
    if (v10)
    {
      objc_storeWeak(v10 + 3, v7);
      objc_storeStrong(a1 + 2, a4);
      v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
      v13 = dispatch_queue_create("com.apple.conductord.DACRoleCoordinator", v12);
      v14 = a1[4];
      a1[4] = v13;

      v15 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);
      v17 = dispatch_queue_create("com.apple.conductord.DACRoleCoordinator.delegate", v16);
      v18 = a1[5];
      a1[5] = v17;

      v19 = objc_claimAutoreleasedReturnValue(+[DACDeviceRole unknownRole](&OBJC_CLASS___DACDeviceRole, "unknownRole"));
      v20 = a1[6];
      a1[6] = (id)v19;

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      v22 = objc_claimAutoreleasedReturnValue([v21 UUIDString]);
      v23 = a1[7];
      a1[7] = (id)v22;

      v24 = sub_10000CB74((id *)objc_alloc(&OBJC_CLASS___DACRoleCoordinatorScorecard), v8, a1[7]);
      v25 = a1[8];
      a1[8] = v24;

      *((_BYTE *)a1 + 8) = 0;
      v26 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
      v27 = a1[9];
      a1[9] = (id)v26;

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", a1[2]));
      v29 = -[COStateManager initWithSuiteName:clusters:]( objc_alloc(&OBJC_CLASS___COStateManager),  "initWithSuiteName:clusters:",  @"com.apple.DeviceActivityConductor.Role",  v28);
      v30 = a1[10];
      a1[10] = v29;

      v31 = a1[11];
      a1[11] = 0LL;

      v32 = sub_100014610(5);
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = a1[7];
        *(_DWORD *)buf = 134218242;
        v41 = a1;
        v42 = 2114;
        v43 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%p Role Coordinator started with ID %{public}@",  buf,  0x16u);
      }

      v35 = (dispatch_queue_s *)a1[4];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100003004;
      block[3] = &unk_10001C3C0;
      a1 = a1;
      v38 = a1;
      dispatch_async(v35, block);
    }
  }

  return a1;
}

void sub_100003004(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 32));
    sub_1000033DC(v1);
    objc_initWeak(&location, (id)v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF BEGINSWITH %@",  @"Scorecards"));
    id v3 = *(id *)(v1 + 80);
    id v4 = *(id *)(v1 + 32);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100003684;
    v7[3] = &unk_10001C410;
    objc_copyWeak(&v8, &location);
    v7[4] = v1;
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 addObserverForKeyPathUsingPredicate:v2 queue:v4 usingBlock:v7]);
    v6 = *(void **)(v1 + 88);
    *(void *)(v1 + 88) = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void sub_10000311C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100003140(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 88);
    if (v2)
    {
      id v3 = *(id *)(a1 + 80);
      [v3 removeObserver:v2];

      id v4 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = 0LL;
    }
  }

void sub_1000031A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(dispatch_queue_s **)(a1 + 32);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10000322C;
    v6[3] = &unk_10001C3E8;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void sub_10000322C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = *(id *)(v2 + 64);
    id v4 = v3;
    if (v3)
    {
      uint64_t v5 = (void *)*((void *)v3 + 3);
      goto LABEL_4;
    }
  }

  else
  {
    id v4 = 0LL;
  }

  uint64_t v5 = 0LL;
LABEL_4:
  id v6 = v5;

  id v7 = [v6 compare:*(void *)(a1 + 40)];
  id v8 = sub_100014610(5);
  v9 = (id *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT);
  if (v7 == (id)-1LL)
  {
    if (v10)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      int v20 = 134218242;
      uint64_t v21 = v13;
      __int16 v22 = 2114;
      uint64_t v23 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "%p request for leader %{public}@",  (uint8_t *)&v20,  0x16u);
    }

    v15 = objc_alloc(&OBJC_CLASS___DACRoleCoordinatorScorecard);
    uint64_t v16 = *(void *)(a1 + 32);
    if (v16) {
      v17 = *(void **)(v16 + 56);
    }
    else {
      v17 = 0LL;
    }
    v9 = sub_10000CB74((id *)&v15->super.isa, *(void **)(a1 + 40), v17);
    uint64_t v18 = *(void *)(a1 + 32);
    if (v18)
    {
      objc_storeStrong((id *)(v18 + 64), v9);
      uint64_t v19 = *(void *)(a1 + 32);
    }

    else
    {
      uint64_t v19 = 0LL;
    }

    sub_1000033DC(v19);
  }

  else if (v10)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    int v20 = 134218498;
    uint64_t v21 = v11;
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    __int16 v24 = 2114;
    id v25 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "%p disregarding leader date update %{public}@ (have %{public}@)",  (uint8_t *)&v20,  0x20u);
  }
}

void sub_1000033DC(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v2 = sub_10000CE1C(*(void *)(a1 + 64));
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v3 = (id)objc_claimAutoreleasedReturnValue(v2);
    id v4 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v18 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
          id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"Scorecards",  *(void *)(a1 + 56),  v7,  0LL));
          id v9 = [[COKeyPath alloc] initWithComponents:v8];
          BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v7]);
          [v14 setObject:v10 forKey:v9];
        }

        id v4 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }

      while (v4);
    }

    id v11 = sub_100014610(5);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v22 = a1;
      __int16 v23 = 2114;
      __int16 v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%p will publish %{public}@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, (id)a1);
    id v13 = *(id *)(a1 + 80);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100003F40;
    v15[3] = &unk_10001C438;
    objc_copyWeak(&v16, (id *)buf);
    [v13 setDictionary:v14 clusters:0 completionHandler:v15];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }

void sub_100003660( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, id location)
{
}

void sub_100003684(uint64_t a1, void *a2)
{
  id v84 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = v84;
    if (v4)
    {
      id v79 = WeakRetained;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v4 + 32));
      id v6 = sub_100014610(5);
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v114 = v4;
        __int16 v115 = 2114;
        id v116 = v5;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%p processing changes %{public}@",  buf,  0x16u);
      }

      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      uint64_t v82 = v4;
      id location = (id *)(v4 + 72);
      id v9 = *(id *)(v4 + 72);
      __int128 v105 = 0u;
      __int128 v106 = 0u;
      __int128 v107 = 0u;
      __int128 v108 = 0u;
      id v10 = [v9 countByEnumeratingWithState:&v105 objects:buf count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v106;
        do
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v106 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v105 + 1) + 8LL * (void)i);
            v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v14]);
            id v16 = sub_10000CE1C((uint64_t)v15);
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
            [v8 setObject:v17 forKey:v14];
          }

          id v11 = [v9 countByEnumeratingWithState:&v105 objects:buf count:16];
        }

        while (v11);
      }

      id v18 = [v8 mutableCopy];
      v83 = v5;
      __int128 v96 = 0u;
      __int128 v97 = 0u;
      __int128 v98 = 0u;
      __int128 v99 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:COStateManagerChangesUpdatedKeyPaths]);
      id v89 = [obj countByEnumeratingWithState:&v96 objects:&v105 count:16];
      if (v89)
      {
        __int128 v19 = 0LL;
        __int128 v20 = 0LL;
        uint64_t v21 = 0LL;
        uint64_t v22 = 0LL;
        __int16 v23 = 0LL;
        uint64_t v85 = *(void *)v97;
        v87 = v18;
        do
        {
          __int16 v24 = 0LL;
          id v25 = v20;
          v26 = v21;
          v27 = v22;
          v28 = v23;
          do
          {
            if (*(void *)v97 != v85) {
              objc_enumerationMutation(obj);
            }
            v29 = *(void **)(*((void *)&v96 + 1) + 8LL * (void)v24);
            __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v29 components]);

            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndex:1]);
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndex:2]);

            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKey:v29]);
            v30 = (void *)objc_claimAutoreleasedReturnValue([v87 objectForKey:v22]);
            id v31 = [v30 mutableCopy];

            __int128 v19 = v31;
            if (!v31) {
              __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
            }
            [v19 setObject:v20 forKey:v21];
            [v87 setObject:v19 forKey:v22];
            __int16 v24 = (char *)v24 + 1;
            id v25 = v20;
            v26 = v21;
            v27 = v22;
            v28 = v23;
          }

          while (v89 != v24);
          id v89 = [obj countByEnumeratingWithState:&v96 objects:&v105 count:16];
        }

        while (v89);

        v32 = v23;
        id v18 = v87;
      }

      else
      {
        uint64_t v22 = 0LL;
        v32 = 0LL;
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue([v83 objectForKeyedSubscript:COStateManagerChangesRemovedKeyPaths]);
      __int128 v92 = 0u;
      __int128 v93 = 0u;
      __int128 v94 = 0u;
      __int128 v95 = 0u;
      id v34 = [v33 countByEnumeratingWithState:&v92 objects:v104 count:16];
      if (v34)
      {
        id v35 = v34;
        uint64_t v36 = *(void *)v93;
        do
        {
          v37 = 0LL;
          v38 = v22;
          v39 = v32;
          do
          {
            if (*(void *)v93 != v36) {
              objc_enumerationMutation(v33);
            }

            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v32 objectAtIndex:1]);
            [v18 removeObjectForKey:v22];
            v37 = (char *)v37 + 1;
            v38 = v22;
            v39 = v32;
          }

          while (v35 != v37);
          id v35 = [v33 countByEnumeratingWithState:&v92 objects:v104 count:16];
        }

        while (v35);
      }

      v90 = v32;
      v40 = v33;
      id v41 = v18;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      __int128 v100 = 0u;
      __int128 v101 = 0u;
      __int128 v102 = 0u;
      __int128 v103 = 0u;
      id v43 = v41;
      id v44 = [v43 countByEnumeratingWithState:&v100 objects:buf count:16];
      if (v44)
      {
        id v45 = v44;
        uint64_t v46 = *(void *)v101;
        do
        {
          for (j = 0LL; j != v45; j = (char *)j + 1)
          {
            if (*(void *)v101 != v46) {
              objc_enumerationMutation(v43);
            }
            v48 = *(void **)(*((void *)&v100 + 1) + 8LL * (void)j);
            v49 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKey:v48]);
            v50 = sub_10000CC98((id *)objc_alloc(&OBJC_CLASS___DACRoleCoordinatorScorecard), v49, v48);
            [v42 setObject:v50 forKey:v48];
          }

          id v45 = [v43 countByEnumeratingWithState:&v100 objects:buf count:16];
        }

        while (v45);
      }

      objc_storeStrong(location, v42);
      id v51 = sub_100014610(5);
      v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v109 = 134218242;
        uint64_t v110 = v82;
        __int16 v111 = 2112;
        v112 = v42;
        _os_log_debug_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "%p scorecards updated %@", v109, 0x16u);
      }

      v53 = v90;
      v54 = v40;
      if (*(_BYTE *)(v82 + 8))
      {
        id v55 = sub_100014610(5);
        v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v114 = v82;
          _os_log_error_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_ERROR,  "%p publishing scorecard due to past failure",  buf,  0xCu);
        }

        sub_1000033DC(v82);
      }

      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v82 + 32));
      uint64_t v57 = *(void *)(v82 + 56);
      id v58 = *(id *)(v82 + 72);
      v59 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKey:v57]);

      if (v59)
      {
        v60 = (id *)*(id *)(v82 + 56);
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v82 + 32));
        objc_opt_self(&OBJC_CLASS___DACRoleCoordinatorScorecard);
        v61 = &stru_10001C670;
        v62 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v82 + 72) keysSortedByValueUsingComparator:&stru_10001C670]);
        v63 = (void *)objc_claimAutoreleasedReturnValue([v62 lastObject]);
        id v64 = sub_100014610(5);
        v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          id v86 = *(id *)(v82 + 72);
          id v76 = [v86 count];
          id v77 = *(id *)(v82 + 72);
          locationa = v60;
          v66 = (void *)objc_claimAutoreleasedReturnValue([v77 objectForKey:v63]);
          id v67 = *(id *)(v82 + 56);
          v88 = v54;
          v78 = v62;
          v68 = *(void **)(v82 + 72);
          id v69 = *(id *)(v82 + 56);
          id v70 = v68;
          v71 = (void *)objc_claimAutoreleasedReturnValue([v70 objectForKey:v69]);
          *(_DWORD *)buf = 134219266;
          uint64_t v114 = v82;
          __int16 v115 = 2048;
          id v116 = v76;
          __int16 v117 = 2114;
          v118 = v63;
          __int16 v119 = 2114;
          v120 = v66;
          __int16 v121 = 2114;
          id v122 = v67;
          __int16 v123 = 2114;
          v124 = v71;
          _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "%p [sc cnt %lu] leader is %{public}@/%{public}@, local %{public}@/%{public}@",  buf,  0x3Eu);

          v53 = v90;
          v62 = v78;
          v54 = v88;

          v60 = locationa;
        }

        unsigned int v72 = [v60 isEqual:v63];
        if (v72) {
          uint64_t v73 = 1LL;
        }
        else {
          uint64_t v73 = 2LL;
        }
        id v74 = -[DACDeviceRole _initWithRoleFlags:](objc_alloc(&OBJC_CLASS___DACDeviceRole), "_initWithRoleFlags:", v73);
      }

      else
      {
        id v74 = (id)objc_claimAutoreleasedReturnValue(+[DACDeviceRole unknownRole](&OBJC_CLASS___DACDeviceRole, "unknownRole"));
      }

      v75 = v74;
      id WeakRetained = v79;
      sub_100004128(v82, v74);

      id v5 = v83;
    }
  }
}

void sub_100003F40(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (dispatch_queue_s **)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[4];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100003FD8;
    v7[3] = &unk_10001C3E8;
    id v8 = v3;
    id v9 = v5;
    dispatch_async(v6, v7);
  }
}

void sub_100003FD8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = sub_100014610(5);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v12 = 134217984;
      uint64_t v13 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%p publish failed : setting device role to unknown",  (uint8_t *)&v12,  0xCu);
    }

    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[DACDeviceRole unknownRole](&OBJC_CLASS___DACDeviceRole, "unknownRole"));
    sub_100004128(v6, v7);

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      char v9 = 1;
LABEL_10:
      *(_BYTE *)(v8 + 8) = v9;
    }
  }

  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 134217984;
      uint64_t v13 = v11;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%p publish succeeded",  (uint8_t *)&v12,  0xCu);
    }

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      char v9 = 0;
      goto LABEL_10;
    }
  }

void sub_100004128(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    id v5 = *(id *)(a1 + 48);
    unsigned __int8 v6 = [v5 isEqual:v4];
    id v7 = sub_100014610(5);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    char v9 = v8;
    if ((v6 & 1) != 0)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v15 = 134218242;
        *(void *)&void v15[4] = a1;
        *(_WORD *)&v15[12] = 2114;
        *(void *)&v15[14] = v5;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%p no change in role (still %{public}@)",  v15,  0x16u);
      }
    }

    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v15 = 134218498;
        *(void *)&void v15[4] = a1;
        *(_WORD *)&v15[12] = 2114;
        *(void *)&v15[14] = v4;
        *(_WORD *)&v15[22] = 2114;
        id v16 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%p role changing to %{public}@ (was %{public}@)",  v15,  0x20u);
      }

      objc_storeStrong((id *)(a1 + 48), a2);
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
      id v10 = *(id *)(a1 + 48);
      uint64_t v11 = (dispatch_queue_s *)*(id *)(a1 + 40);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      *(void *)v15 = _NSConcreteStackBlock;
      *(void *)&v15[8] = 3221225472LL;
      *(void *)&v15[16] = sub_100004338;
      id v16 = &unk_10001C460;
      id v17 = WeakRetained;
      uint64_t v18 = a1;
      id v19 = v10;
      id v13 = v10;
      id v14 = WeakRetained;
      dispatch_async(v11, v15);
    }
  }
}

id sub_100004338(uint64_t a1)
{
  return [*(id *)(a1 + 32) coordinator:*(void *)(a1 + 40) roleChanged:*(void *)(a1 + 48)];
}

void sub_1000047E8(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v14 = 0LL;
    v15 = &v14;
    uint64_t v16 = 0x2020000000LL;
    uint64_t v17 = 0LL;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100004974;
    v10[3] = &unk_10001C488;
    v10[4] = a1;
    id v11 = v4;
    id v6 = v5;
    id v12 = v6;
    id v13 = &v14;
    [a1 _withLock:v10];
    id v7 = sub_100014610(4);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = v15[3];
      *(_DWORD *)buf = 134218240;
      id v19 = a1;
      __int16 v20 = 2048;
      uint64_t v21 = v9;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%p now %lu registered Activities in DB after register",  buf,  0x16u);
    }

    _Block_object_dispose(&v14, 8);
  }
}

void sub_100004954( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100004974(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) registeredActivities]);
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];

  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) registeredActivities]);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v3 count];
}

void sub_1000049D8(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v12 = 0LL;
    id v13 = &v12;
    uint64_t v14 = 0x2020000000LL;
    uint64_t v15 = 0LL;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100004B50;
    v9[3] = &unk_10001C4B0;
    v9[4] = a1;
    id v5 = (id)objc_claimAutoreleasedReturnValue([v3 identifier]);
    id v10 = v5;
    id v11 = &v12;
    [a1 _withLock:v9];
    id v6 = sub_100014610(4);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = v13[3];
      *(_DWORD *)buf = 134218240;
      uint64_t v17 = a1;
      __int16 v18 = 2048;
      uint64_t v19 = v8;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%p now %lu registered Activities in DB after unregister",  buf,  0x16u);
    }

    _Block_object_dispose(&v12, 8);
  }
}

void sub_100004B30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100004B50(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) registeredActivities]);
  [v2 removeObjectForKey:*(void *)(a1 + 40)];

  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) registeredActivities]);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 count];
}

id sub_100004BB4(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  id v5 = 0LL;
  if (a1 && v3)
  {
    uint64_t v17 = 0LL;
    __int16 v18 = &v17;
    uint64_t v19 = 0x3032000000LL;
    __int16 v20 = sub_100004DD8;
    uint64_t v21 = sub_100004DE8;
    id v22 = 0LL;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100004DF0;
    v14[3] = &unk_10001C4D8;
    uint64_t v16 = &v17;
    v14[4] = a1;
    id v6 = (id)objc_claimAutoreleasedReturnValue([v3 identifier]);
    id v15 = v6;
    [a1 _withLock:v14];
    uint64_t v7 = v18[5];
    id v8 = sub_100014610(4);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v10)
      {
        id v13 = (void *)v18[5];
        *(_DWORD *)buf = 134218498;
        __int16 v24 = a1;
        __int16 v25 = 2114;
        v26 = v13;
        __int16 v27 = 2114;
        v28 = v4;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%p using registered %{public}@ from DB for %{public}@",  buf,  0x20u);
      }

      id v11 = (void *)v18[5];
    }

    else
    {
      if (v10)
      {
        *(_DWORD *)buf = 134218242;
        __int16 v24 = a1;
        __int16 v25 = 2114;
        v26 = v4;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%p using provided activity %{public}@ (not in DB)",  buf,  0x16u);
      }

      id v11 = v4;
    }

    id v5 = v11;

    _Block_object_dispose(&v17, 8);
  }

  return v5;
}

void sub_100004DB8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100004DD8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100004DE8(uint64_t a1)
{
}

void sub_100004DF0(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) registeredActivities]);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v5 objectForKey:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

BOOL sub_100004E48(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v15 = 0LL;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000LL;
    __int16 v18 = sub_100004DD8;
    uint64_t v19 = sub_100004DE8;
    id v20 = 0LL;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100005018;
    v12[3] = &unk_10001C4D8;
    uint64_t v14 = &v15;
    v12[4] = a1;
    id v5 = (id)objc_claimAutoreleasedReturnValue([v3 identifier]);
    id v13 = v5;
    [a1 _withLock:v12];
    uint64_t v6 = v16[5];
    BOOL v7 = v6 != 0;
    id v8 = sub_100014610(4);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      if (v6) {
        int v11 = 89;
      }
      else {
        int v11 = 78;
      }
      id v22 = a1;
      __int16 v23 = 1024;
      int v24 = v11;
      __int16 v25 = 2114;
      v26 = v4;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%p record %c in DB for activity %{public}@",  buf,  0x1Cu);
    }

    _Block_object_dispose(&v15, 8);
  }

  else
  {
    BOOL v7 = 0LL;
  }

  return v7;
}

void sub_100004FF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100005018(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) registeredActivities]);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v5 objectForKey:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void start()
{
  v0 = objc_autoreleasePoolPush();
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___DACRoleService);
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___DACLifecycleService);
  objc_autoreleasePoolPop(v0);
  dispatch_main();
}

id sub_1000050FC()
{
  if (qword_100022E88 != -1) {
    dispatch_once(&qword_100022E88, &stru_10001C518);
  }
  return (id)qword_100022E80;
}

void sub_10000513C(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[MGRoom predicateForCurrentDevice](&OBJC_CLASS___MGRoom, "predicateForCurrentDevice"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](&OBJC_CLASS___NSPredicate, "predicateWithValue:", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](&OBJC_CLASS___NSPredicate, "predicateWithValue:", 1LL));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MGMediaSystem predicateForCurrentDevice](&OBJC_CLASS___MGMediaSystem, "predicateForCurrentDevice"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"($CURRENT_MEDIA_SYSTEM == nil)"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MGGroup predicateForCurrentDevice](&OBJC_CLASS___MGGroup, "predicateForCurrentDevice"));
  v19[0] = v3;
  v19[1] = v15;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v6));

  v18[0] = v3;
  v18[1] = v4;
  v18[2] = v5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 3LL));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v8));

  v17[0] = v1;
  v17[1] = v2;
  v17[2] = v7;
  v17[3] = v9;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 4LL));
  int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate orPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "orPredicateWithSubpredicates:",  v10));

  id v16 = (id)objc_claimAutoreleasedReturnValue(+[COClusterRealm realmWithPredicate:](&OBJC_CLASS___COClusterRealm, "realmWithPredicate:", v11));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[COClusterConfiguration configurationWithDomain:requiredServices:options:realm:]( &OBJC_CLASS___COClusterConfiguration,  "configurationWithDomain:requiredServices:options:realm:",  @"com.apple.DeviceActivityConductor",  15LL,  1LL,  v16));
  uint64_t v13 = objc_claimAutoreleasedReturnValue(+[COCluster clusterWithConfiguration:](&OBJC_CLASS___COCluster, "clusterWithConfiguration:", v12));
  uint64_t v14 = (void *)qword_100022E80;
  qword_100022E80 = v13;
}

void sub_1000058B0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1000058DC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _clientForConnection:v2]);
    if (v3) {
      [WeakRetained _lostClient:v3];
    }
  }
}

LABEL_11:
  return v7;
}

LABEL_12:
  int v11 = 0LL;
LABEL_13:

  if (v11)
  {
    sub_1000031A0((uint64_t)v11, v4);
    goto LABEL_18;
  }

id sub_100005F90(uint64_t a1)
{
  return [*(id *)(a1 + 32) _serviceReady];
}

void sub_100006054(void *a1)
{
  id v2 = (void *)a1[4];
  if (v2) {
    id v2 = (void *)v2[2];
  }
  uint64_t v3 = v2;
  id v5 = (void *)a1[4];
  id v4 = (void *)a1[5];
  if (v4) {
    id v4 = (void *)v4[7];
  }
  uint64_t v6 = v4;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v3]);
  unsigned __int8 v8 = [v5 isEqual:v7];

  if ((v8 & 1) != 0)
  {
    uint64_t v9 = a1[5];
    if (v9) {
      BOOL v10 = *(void **)(v9 + 64);
    }
    else {
      BOOL v10 = 0LL;
    }
    [v10 setObject:a1[6] forKey:v3];
    id v11 = sub_100014610(5);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v29 = (id *)a1[5];
      uint64_t v30 = a1[6];
      *(_DWORD *)buf = 134218242;
      v39 = v29;
      __int16 v40 = 2112;
      uint64_t v41 = v30;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%p updated Role %@", buf, 0x16u);
    }

    uint64_t v13 = (id *)a1[5];
    uint64_t v14 = v3;
    if (v13)
    {
      uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v13 queue]);
      dispatch_assert_queue_V2(v15);

      v33 = (void *)objc_claimAutoreleasedReturnValue([v13[8] objectForKey:v14]);
      if (v33)
      {
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 clients]);
        id v17 = [v16 countByEnumeratingWithState:&v34 objects:buf count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v35;
          do
          {
            id v20 = 0LL;
            do
            {
              if (*(void *)v35 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)v20);
              if (v21) {
                id v22 = (void *)v21[3];
              }
              else {
                id v22 = 0LL;
              }
              id v23 = v22;
              unsigned int v24 = [v14 isEqual:v23];

              if (v24) {
                sub_1000065E8(v13, v21, v33);
              }
              id v20 = (char *)v20 + 1;
            }

            while (v18 != v20);
            id v25 = [v16 countByEnumeratingWithState:&v34 objects:buf count:16];
            id v18 = v25;
          }

          while (v25);
        }
      }

      else
      {
        id v28 = sub_100014610(5);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v39 = v13;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_ERROR, "%p no Role", buf, 0xCu);
        }
      }
    }
  }

  else
  {
    id v26 = sub_100014610(5);
    __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = a1[4];
      id v31 = (id *)a1[5];
      *(_DWORD *)buf = 134218240;
      v39 = v31;
      __int16 v40 = 2048;
      uint64_t v41 = v32;
      _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%p discarding delegate call from stale Coordinator %p",  buf,  0x16u);
    }
  }
}

LABEL_12:
}
}

  return a1;
}

void sub_1000065E8(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    BOOL v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 queue]);
    dispatch_assert_queue_V2(v7);

    id v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472LL;
    id v18 = sub_100006A18;
    uint64_t v19 = &unk_10001C568;
    id v20 = a1;
    id v8 = v5;
    id v21 = v8;
    uint64_t v9 = &v16;
    id v10 = v8;
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "queue", v16, v17, v18, v19, v20));
    dispatch_assert_queue_V2(v11);

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 connection]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 remoteObjectProxyWithErrorHandler:v9]);

    id v14 = sub_100014610(5);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      id v23 = a1;
      __int16 v24 = 2114;
      id v25 = v10;
      __int16 v26 = 2114;
      id v27 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%p notifying %{public}@ of %{public}@",  buf,  0x20u);
    }

    [v13 roleChanged:v6];
  }
}

LABEL_15:
  uint64_t v19 = sub_100014610(5);
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    id v21 = 134217984;
    id v22 = self;
    _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%p ignoring leader request, no Coordinator",  (uint8_t *)&v21,  0xCu);
  }

  id v11 = 0LL;
LABEL_18:
}

void sub_100006A18(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100014610(5);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 134218498;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%p remote %@ notify failed: %@",  (uint8_t *)&v8,  0x20u);
  }
}

LABEL_19:
}
}

id sub_100007440(uint64_t a1)
{
  return [*(id *)(a1 + 32) _serviceReady];
}

uint64_t sub_100007D18(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activity]);
  if ([v3 state])
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 changeMarker]);
    sub_1000083C8(v5, v4, v6, *(void **)(a1 + 40), 1);
  }

  else
  {
    id v31 = v3;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clients]);
    id v7 = [obj countByEnumeratingWithState:&v41 objects:v54 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v42;
      __int16 v10 = &selRef_decodeIntegerForKey_;
      uint64_t v32 = *(void *)v42;
      do
      {
        uint64_t v11 = 0LL;
        id v33 = v8;
        do
        {
          if (*(void *)v42 != v9) {
            objc_enumerationMutation(obj);
          }
          __int16 v12 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)v11);
          id v13 = *(void **)(a1 + 40);
          if (v12) {
            id v14 = *(void **)((char *)v12 + *((int *)v10 + 345));
          }
          else {
            id v14 = 0LL;
          }
          id v15 = v14;
          unsigned int v16 = [v13 isEqual:v15];

          if (v16)
          {
            __int128 v36 = v11;
            if (v12) {
              uint64_t v17 = (void *)v12[5];
            }
            else {
              uint64_t v17 = 0LL;
            }
            id v18 = v17;
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v4]);

            __int128 v39 = 0u;
            __int128 v40 = 0u;
            __int128 v37 = 0u;
            __int128 v38 = 0u;
            __int128 v35 = v19;
            id v20 = [v19 copy];
            id v21 = [v20 countByEnumeratingWithState:&v37 objects:v53 count:16];
            if (v21)
            {
              id v22 = v21;
              uint64_t v23 = *(void *)v38;
              do
              {
                for (i = 0LL; i != v22; i = (char *)i + 1)
                {
                  if (*(void *)v38 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  id v25 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
                  if ([v25 state] == (id)1)
                  {
                    id v26 = sub_100014610(2);
                    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v28 = *(void *)(a1 + 32);
                      *(_DWORD *)buf = 134218754;
                      uint64_t v46 = v28;
                      __int16 v47 = 2048;
                      v48 = v25;
                      __int16 v49 = 2114;
                      v50 = v4;
                      __int16 v51 = 2114;
                      v52 = v12;
                      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%p invalidating %p due to deactivation of %{public}@ held by %{public}@",  buf,  0x2Au);
                    }

                    [v25 setState:2];
                    sub_100008054(*(void **)(a1 + 32), v25, v4, v12);
                  }
                }

                id v22 = [v20 countByEnumeratingWithState:&v37 objects:v53 count:16];
              }

              while (v22);
            }

            uint64_t v9 = v32;
            id v8 = v33;
            __int16 v10 = &selRef_decodeIntegerForKey_;
            uint64_t v11 = v36;
          }

          uint64_t v11 = (char *)v11 + 1;
        }

        while (v11 != v8);
        id v29 = [obj countByEnumeratingWithState:&v41 objects:v54 count:16];
        id v8 = v29;
      }

      while (v29);
    }

    id v3 = v31;
  }

  return 1LL;
}

void sub_100008054(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = a4;
  if (a1)
  {
    __int16 v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 queue]);
    dispatch_assert_queue_V2(v10);

    if (v9) {
      uint64_t v11 = (void *)v9[5];
    }
    else {
      uint64_t v11 = 0LL;
    }
    id v12 = v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v8]);

    id v14 = [v13 indexOfObject:v7];
    id v15 = sub_100014610(2);
    unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    uint64_t v17 = v16;
    if (v14 == (void *)0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v30 = 134218754;
        id v31 = a1;
        __int16 v32 = 2048;
        id v33 = v7;
        __int16 v34 = 2114;
        __int128 v35 = v8;
        __int16 v36 = 2114;
        __int128 v37 = v9;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%p unable to remove missing assertion %p for %{public}@ held by %{public}@",  (uint8_t *)&v30,  0x2Au);
      }
    }

    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int v30 = 134219010;
        id v31 = a1;
        __int16 v32 = 2048;
        id v33 = v7;
        __int16 v34 = 2048;
        __int128 v35 = v14;
        __int16 v36 = 2114;
        __int128 v37 = v8;
        __int16 v38 = 2114;
        __int128 v39 = v9;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%p removing assertion %p at %lu for %{public}@ held by %{public}@",  (uint8_t *)&v30,  0x34u);
      }

      [v13 removeObjectAtIndex:v14];
    }

    if ([v13 count])
    {
      id v18 = sub_100014610(2);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [v13 count];
        if (v9) {
          id v21 = (void *)v9[5];
        }
        else {
          id v21 = 0LL;
        }
        id v22 = v21;
        uint64_t v23 = [v22 count];
        int v30 = 134219010;
        id v31 = a1;
        __int16 v32 = 2048;
        id v33 = v20;
        __int16 v34 = 2114;
        __int128 v35 = v9;
        __int16 v36 = 2114;
        __int128 v37 = v8;
        __int16 v38 = 2048;
        __int128 v39 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%p now %lu assertions remain held by %{public}@ for %{public}@ (%lu unique)",  (uint8_t *)&v30,  0x34u);
      }
    }

    else
    {
      if (v9) {
        __int16 v24 = (void *)v9[5];
      }
      else {
        __int16 v24 = 0LL;
      }
      id v25 = v24;
      [v25 removeObjectForKey:v8];

      id v26 = sub_100014610(2);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        if (v9) {
          id v27 = (void *)v9[5];
        }
        else {
          id v27 = 0LL;
        }
        id v28 = v27;
        id v29 = [v28 count];
        int v30 = 134218754;
        id v31 = a1;
        __int16 v32 = 2048;
        id v33 = v29;
        __int16 v34 = 2114;
        __int128 v35 = v9;
        __int16 v36 = 2114;
        __int128 v37 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%p now %lu unique assertions held by %{public}@ after last assertion removal for %{public}@",  (uint8_t *)&v30,  0x2Au);
      }
    }
  }
}

void sub_1000083C8(void *a1, void *a2, void *a3, void *a4, int a5)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 queue]);
    dispatch_assert_queue_V2(v11);

    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([a1 clients]);
    id v13 = -[os_log_s countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v62,  v67,  16LL);
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v63;
      id v55 = v12;
      id v56 = v10;
      uint64_t v51 = *(void *)v63;
      uint64_t v57 = v8;
      v54 = a1;
      do
      {
        unsigned int v16 = 0LL;
        id v52 = v14;
        do
        {
          if (*(void *)v63 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)v16);
          if (v17) {
            id v18 = (void *)v17[4];
          }
          else {
            id v18 = 0LL;
          }
          id v19 = v18;
          unsigned int v20 = [v10 isEqual:v19];

          if (v20)
          {
            if (v17) {
              id v21 = (void *)v17[5];
            }
            else {
              id v21 = 0LL;
            }
            id v22 = v21;
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:v8]);

            __int128 v60 = 0u;
            __int128 v61 = 0u;
            __int128 v58 = 0u;
            __int128 v59 = 0u;
            id v24 = v23;
            id v25 = [v24 countByEnumeratingWithState:&v58 objects:v66 count:16];
            if (v25)
            {
              id v26 = v25;
              uint64_t v27 = *(void *)v59;
              while (2)
              {
                for (i = 0LL; i != v26; i = (char *)i + 1)
                {
                  if (*(void *)v59 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  id v29 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)i);
                  int v30 = (void *)objc_claimAutoreleasedReturnValue([v29 changeMarker]);
                  unsigned int v31 = [v9 isEqual:v30];

                  if (v31)
                  {
                    id v35 = [v29 state];
                    id v36 = sub_100014610(2);
                    __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
                    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
                    if (v35)
                    {
                      id v8 = v57;
                      __int16 v34 = v55;
                      if (v38)
                      {
                        id v39 = [v29 state];
                        *(_DWORD *)buf = 134219010;
                        *(void *)&uint8_t buf[4] = v54;
                        *(_WORD *)&buf[12] = 2114;
                        *(void *)&buf[14] = v29;
                        *(_WORD *)&buf[22] = 2048;
                        id v77 = v39;
                        *(_WORD *)v78 = 2114;
                        *(void *)&v78[2] = v57;
                        *(_WORD *)&v78[10] = 2114;
                        *(void *)&v78[12] = v17;
                        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%p not activating assertion %{public}@ in invalid state %lu for %{public}@ held by %{public}@",  buf,  0x34u);
                      }
                    }

                    else
                    {
                      id v8 = v57;
                      __int16 v34 = v55;
                      if (v38)
                      {
                        *(_DWORD *)buf = 134218754;
                        *(void *)&uint8_t buf[4] = v54;
                        *(_WORD *)&buf[12] = 2114;
                        *(void *)&buf[14] = v29;
                        *(_WORD *)&buf[22] = 2114;
                        id v77 = v57;
                        *(_WORD *)v78 = 2114;
                        *(void *)&v78[2] = v17;
                        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%p activating assertion %{public}@ for %{public}@ held by %{public}@",  buf,  0x2Au);
                      }

                      [v29 setState:1];
                      if (a5)
                      {
                        __int128 v40 = v17;
                        id v41 = v57;
                        id v42 = v9;
                        __int128 v43 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v54 queue]);
                        dispatch_assert_queue_V2(v43);

                        *(void *)buf = _NSConcreteStackBlock;
                        *(void *)&buf[8] = 3221225472LL;
                        *(void *)&buf[16] = sub_10000AF5C;
                        id v77 = &unk_10001C5B8;
                        *(void *)v78 = v54;
                        __int128 v44 = v40;
                        *(void *)&v78[8] = v44;
                        id v45 = v41;
                        *(void *)&v78[16] = v45;
                        id v46 = v42;
                        id v79 = v46;
                        id v47 = sub_10000AED8(v54, v44, buf);
                        v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
                        id v49 = sub_100014610(2);
                        v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
                        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v68 = 134218754;
                          id v69 = v54;
                          __int16 v70 = 2114;
                          id v71 = v44;
                          __int16 v72 = 2114;
                          id v73 = v46;
                          __int16 v74 = 2114;
                          id v75 = v45;
                          _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "%p notifying %{public}@ of assertion activation with %{public}@ for %{public}@",  v68,  0x2Au);
                        }

                        [v48 activatedAssertionForActivity:v45 withChangeMarker:v46];
                        id v8 = v57;
                      }
                    }

                    id v10 = v56;
                    goto LABEL_39;
                  }
                }

                id v26 = [v24 countByEnumeratingWithState:&v58 objects:v66 count:16];
                if (v26) {
                  continue;
                }
                break;
              }
            }

            id v10 = v56;
            id v8 = v57;
            id v12 = v55;
            uint64_t v15 = v51;
            id v14 = v52;
          }

          unsigned int v16 = (char *)v16 + 1;
        }

        while (v16 != v14);
        id v32 = -[os_log_s countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v62,  v67,  16LL);
        id v14 = v32;
        a1 = v54;
      }

      while (v32);
    }

    id v33 = sub_100014610(2);
    __int16 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2114;
      id v77 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "%p no assertion for %{public}@ with %{public}@",  buf,  0x20u);
    }

LABEL_39:
  }
}

void sub_1000092EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_100009314(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100009324(uint64_t a1)
{
}

void sub_10000932C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) isEqual:a3])
  {
    *a4 = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  }
}

LABEL_16:
    goto LABEL_17;
  }

  v4[2](v4);
LABEL_17:
}

  return v12;
}

void sub_100009CE4(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v26 = a3;
  id v8 = a4;
  if (a1)
  {
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 queue]);
    dispatch_assert_queue_V2(v9);

    if (v8) {
      id v10 = (void *)v8[4];
    }
    else {
      id v10 = 0LL;
    }
    id v11 = v10;
    objc_initWeak(&location, a1);
    id v12 = objc_alloc(&OBJC_CLASS___DACActivityAssertion);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10000B2F0;
    v27[3] = &unk_10001C5E0;
    objc_copyWeak(&v30, &location);
    id v28 = v26;
    id v13 = v11;
    id v29 = v13;
    id v14 = [v12 _initWithActivity:v7 requester:0 changeMarker:v28 relinquishHandler:v27];
    if (v8) {
      uint64_t v15 = (void *)v8[5];
    }
    else {
      uint64_t v15 = 0LL;
    }
    id v16 = v15;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v7]);

    if (!v17)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      if (v8) {
        id v18 = (void *)v8[5];
      }
      else {
        id v18 = 0LL;
      }
      id v19 = v18;
      [v19 setObject:v17 forKey:v7];
    }

    [v17 addObject:v14];
    id v20 = sub_100014610(2);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [v17 count];
      if (v8) {
        uint64_t v23 = (void *)v8[5];
      }
      else {
        uint64_t v23 = 0LL;
      }
      id v24 = v23;
      id v25 = [v24 count];
      *(_DWORD *)buf = 134219266;
      id v33 = a1;
      __int16 v34 = 2114;
      id v35 = v14;
      __int16 v36 = 2114;
      id v37 = v7;
      __int16 v38 = 2114;
      id v39 = v8;
      __int16 v40 = 2048;
      id v41 = v22;
      __int16 v42 = 2048;
      id v43 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%p taking assertion %{public}@ for %{public}@ held by %{public}@ (%lu now, %lu unique)",  buf,  0x3Eu);
    }

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
}

void sub_100009FBC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_100009FFC(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 queue]);
    dispatch_assert_queue_V2(v7);

    id v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472LL;
    uint64_t v15 = sub_10000B048;
    id v16 = &unk_10001C568;
    uint64_t v17 = a1;
    id v8 = v5;
    id v18 = v8;
    id v9 = sub_10000AED8(a1, v8, &v13);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = sub_100014610(0);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      id v20 = a1;
      __int16 v21 = 2114;
      id v22 = v8;
      __int16 v23 = 2114;
      id v24 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%p notifying %{public}@ of role %{public}@",  buf,  0x20u);
    }

    objc_msgSend(v10, "roleChanged:", v6, v13, v14, v15, v16, v17);
  }
}

void sub_10000A168(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 queue]);
    dispatch_assert_queue_V2(v7);

    id v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472LL;
    uint64_t v15 = sub_10000AE00;
    id v16 = &unk_10001C568;
    uint64_t v17 = a1;
    id v8 = v5;
    id v18 = v8;
    id v9 = sub_10000AED8(a1, v8, &v13);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = sub_100014610(0);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      id v20 = a1;
      __int16 v21 = 2114;
      id v22 = v8;
      __int16 v23 = 2114;
      id v24 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%p notifying %{public}@ of %{public}@",  buf,  0x20u);
    }

    objc_msgSend(v10, "activityListChanged:", v6, v13, v14, v15, v16, v17);
  }
}

id sub_10000A3D8(id *a1)
{
  if (!a1) {
    return 0LL;
  }
  id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 queue]);
  dispatch_assert_queue_V2(v2);

  uint64_t v3 = objc_claimAutoreleasedReturnValue([a1 _currentClient]);
  id v4 = (void *)v3;
  if (!v3)
  {
    id v8 = sub_100014610(0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v16 = 134217984;
      uint64_t v17 = a1;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%p no current ActivityDB, no client",  (uint8_t *)&v16,  0xCu);
    }

    goto LABEL_12;
  }

  id v5 = (os_log_s *)*(id *)(v3 + 32);
  if (!v5)
  {
    id v9 = sub_100014610(0);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

LABEL_12:
      id v7 = 0LL;
      goto LABEL_13;
    }

    int v16 = 134218242;
    uint64_t v17 = a1;
    __int16 v18 = 2114;
    id v19 = v4;
    id v11 = "%p no current ActivityDB, no subscription from %{public}@";
    id v12 = (os_log_s *)v10;
    uint32_t v13 = 22;
LABEL_16:
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v16, v13);
    goto LABEL_11;
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue([a1[10] objectForKey:v5]);
  if (!v6)
  {
    id v14 = sub_100014610(0);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v16 = 134217984;
    uint64_t v17 = a1;
    id v11 = "%p no current ActivityDB";
    id v12 = (os_log_s *)v10;
    uint32_t v13 = 12;
    goto LABEL_16;
  }

  id v7 = (void *)v6;
LABEL_13:

  return v7;
}

id sub_10000A80C(id *a1)
{
  if (!a1) {
    return 0LL;
  }
  id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 queue]);
  dispatch_assert_queue_V2(v2);

  uint64_t v3 = objc_claimAutoreleasedReturnValue([a1 _currentClient]);
  id v4 = (void *)v3;
  if (!v3)
  {
    id v8 = sub_100014610(0);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v16 = 134217984;
      uint64_t v17 = a1;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%p no current Coordinator, no client",  (uint8_t *)&v16,  0xCu);
    }

    goto LABEL_12;
  }

  id v5 = (os_log_s *)*(id *)(v3 + 32);
  if (!v5)
  {
    id v9 = sub_100014610(0);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

LABEL_12:
      id v7 = 0LL;
      goto LABEL_13;
    }

    int v16 = 134218242;
    uint64_t v17 = a1;
    __int16 v18 = 2114;
    id v19 = v4;
    id v11 = "%p no current Coordinator, no subscription from %{public}@";
    id v12 = (os_log_s *)v10;
    uint32_t v13 = 22;
LABEL_16:
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v16, v13);
    goto LABEL_11;
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue([a1[9] objectForKey:v5]);
  if (!v6)
  {
    id v14 = sub_100014610(0);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v16 = 134217984;
    uint64_t v17 = a1;
    id v11 = "%p no current Coordinator";
    id v12 = (os_log_s *)v10;
    uint32_t v13 = 12;
    goto LABEL_16;
  }

  id v7 = (void *)v6;
LABEL_13:

  return v7;
}

void sub_10000AE00(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100014610(0);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 134218498;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%p remote %{public}@ notify failed: %@",  (uint8_t *)&v8,  0x20u);
  }
}

id sub_10000AED8(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 queue]);
  dispatch_assert_queue_V2(v7);

  int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 connection]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 remoteObjectProxyWithErrorHandler:v5]);

  return v9;
}

void sub_10000AF5C(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100014610(0);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    uint64_t v8 = a1[6];
    uint64_t v9 = a1[7];
    int v10 = 134219010;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%p remote %{public}@ assertion activation (%{public}@/%{public}@) failed: %@",  (uint8_t *)&v10,  0x34u);
  }
}

void sub_10000B048(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100014610(0);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 134218498;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%p remote %{public}@ notify role failed: %@",  (uint8_t *)&v8,  0x20u);
  }
}

void sub_10000B2F0(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  int v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained queue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000B3EC;
    block[3] = &unk_10001C608;
    block[4] = v8;
    id v11 = v5;
    id v12 = v6;
    id v13 = a1[4];
    id v14 = a1[5];
    dispatch_async(v9, block);
  }
}

void sub_10000B3EC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 48);
  id v3 = *(void **)(a1 + 56);
  id v4 = *(void **)(a1 + 64);
  id v29 = *(id *)(a1 + 40);
  id v5 = v2;
  id v6 = v3;
  id v7 = v4;
  if (v1)
  {
    id v28 = v5;
    int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v1 queue]);
    dispatch_assert_queue_V2(v8);

    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    uint64_t v27 = (id *)v1;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v1 clients]);
    id v10 = [v9 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v31;
      while (2)
      {
        id v13 = 0LL;
        do
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)v13);
          if (v14) {
            uint64_t v15 = *(void **)(v14 + 32);
          }
          else {
            uint64_t v15 = 0LL;
          }
          id v16 = v15;
          unsigned int v17 = [v7 isEqual:v16];

          if (v17)
          {
            __int16 v18 = v14 ? *(void **)(v14 + 40) : 0LL;
            id v19 = v18;
            id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:v29]);

            id v21 = [v20 count];
            if (v21)
            {

              id v26 = sub_100014610(2);
              id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134218242;
                id v35 = v27;
                __int16 v36 = 2114;
                id v37 = v29;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "%p relinquished assertion with remaining for %{public}@",  buf,  0x16u);
              }

              id v5 = v28;
              goto LABEL_24;
            }
          }

          id v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v22 = [v9 countByEnumeratingWithState:&v30 objects:v38 count:16];
        id v11 = v22;
        if (v22) {
          continue;
        }
        break;
      }
    }

    id v23 = sub_100014610(2);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v35 = v27;
      __int16 v36 = 2114;
      id v37 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%p relinquished assertion with none remaining for %{public}@",  buf,  0x16u);
    }

    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27[9] objectForKey:v7]);
    id v5 = v28;
    sub_10000E72C((uint64_t)v25, v29, v28, v6);
LABEL_24:
  }
}

LABEL_13:
  return v14;
}

        break;
    }
  }

LABEL_26:
          goto LABEL_27;
        }
      }

      else
      {
        LOBYTE(self) = 0;
        if (!v12) {
          goto LABEL_23;
        }
      }

          goto LABEL_27;
        }
      }

      else
      {
        LOBYTE(self) = 0;
        if (!v12) {
          goto LABEL_23;
        }
      }

LABEL_22:
      goto LABEL_23;
    }
  }

  LOBYTE(self) = 0;
LABEL_30:

  return (char)self;
}

      goto LABEL_23;
    }
  }

  LOBYTE(self) = 0;
LABEL_30:

  return (char)self;
}

id *sub_10000CB74(id *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_CLASS___DACRoleCoordinatorScorecard;
    int v8 = (id *)objc_msgSendSuper2(&v10, "init");
    a1 = v8;
    if (v8)
    {
      v8[1] = (id)1;
      objc_storeStrong(v8 + 3, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

id *sub_10000CC98(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"version"]);
    uint64_t v8 = (uint64_t)[v7 integerValue];
    if (v8 < 1)
    {
      id v13 = sub_100014610(5);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int16 v18 = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed to decode Role Scorecard, invalid version",  v18,  2u);
      }

      uint64_t v12 = 0LL;
      objc_super v10 = a1;
    }

    else
    {
      uint64_t v9 = (void *)v8;
      objc_super v10 = (id *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"leaderDate"]);
      if (v10)
      {
        id v11 = sub_10000CB74(a1, v10, v6);
        uint64_t v12 = v11;
        if (v11) {
          v11[1] = v9;
        }
      }

      else
      {
        id v15 = sub_100014610(5);
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Failed to decode Role Scorecard, missing leader date",  buf,  2u);
        }

        uint64_t v12 = 0LL;
      }
    }

    a1 = v12;
  }

  return a1;
}

id sub_10000CE1C(uint64_t a1)
{
  if (a1)
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)(a1 + 8)));
    [v2 setObject:v3 forKey:@"version"];

    [v2 setObject:*(void *)(a1 + 24) forKey:@"leaderDate"];
  }

  else
  {
    id v2 = 0LL;
  }

  return v2;
}

int64_t sub_10000CEA8(id a1, DACRoleCoordinatorScorecard *a2, DACRoleCoordinatorScorecard *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v4)
  {
    int64_t version = v4->_version;
    if (v5)
    {
LABEL_3:
      int64_t v8 = v5->_version;
      goto LABEL_4;
    }
  }

  else
  {
    int64_t version = 0LL;
    if (v5) {
      goto LABEL_3;
    }
  }

  int64_t v8 = 0LL;
LABEL_4:
  if (version != v8)
  {
    if (version > v8) {
      int64_t v12 = 1LL;
    }
    else {
      int64_t v12 = -1LL;
    }
    goto LABEL_16;
  }

  if (v4)
  {
    leaderDate = v4->_leaderDate;
    if (v5)
    {
LABEL_7:
      objc_super v10 = v5->_leaderDate;
      goto LABEL_8;
    }
  }

  else
  {
    leaderDate = 0LL;
    if (v5) {
      goto LABEL_7;
    }
  }

  objc_super v10 = 0LL;
LABEL_8:
  id v11 = leaderDate;
  int64_t v12 = -[NSDate compare:](v11, "compare:", v10);

  if (!v12)
  {
    if (v4)
    {
      uniqueID = v4->_uniqueID;
      if (v6)
      {
LABEL_11:
        uint64_t v14 = v6->_uniqueID;
LABEL_12:
        id v15 = uniqueID;
        int64_t v12 = -[NSString compare:](v15, "compare:", v14);

        goto LABEL_16;
      }
    }

    else
    {
      uniqueID = 0LL;
      if (v6) {
        goto LABEL_11;
      }
    }

    uint64_t v14 = 0LL;
    goto LABEL_12;
  }

id *sub_10000CFC0(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)&OBJC_CLASS___DACClusterMonitor;
    objc_super v10 = (id *)objc_msgSendSuper2(&v21, "init");
    a1 = v10;
    if (v10)
    {
      objc_storeWeak(v10 + 3, v7);
      objc_storeStrong(a1 + 4, a3);
      objc_storeStrong(a1 + 2, a4);
      *((_BYTE *)a1 + _Block_object_dispose(va, 8) = 0;
      id v11 = -[COClusterRoleMonitor initWithCluster:]( objc_alloc(&OBJC_CLASS___COClusterRoleMonitor),  "initWithCluster:",  a1[2]);
      id v12 = a1[5];
      a1[5] = v11;

      objc_initWeak(&location, a1);
      id v14 = a1[4];
      id v13 = a1[5];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10000D138;
      void v18[3] = &unk_10001C698;
      objc_copyWeak(&v19, &location);
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v13 addObserverForSnapshotsToDispatchQueue:v14 block:v18]);
      id v16 = a1[6];
      a1[6] = (id)v15;

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

void sub_10000D11C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10000D138(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleSnapshotUpdate:v5];
  }
}

id *sub_10000D458(id *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a1)
  {
    v52.receiver = a1;
    v52.super_class = (Class)&OBJC_CLASS___DACLifecycleCoordinator;
    id v16 = (id *)objc_msgSendSuper2(&v52, "init");
    a1 = v16;
    if (v16)
    {
      objc_storeWeak(v16 + 3, v11);
      objc_storeStrong(a1 + 7, a4);
      objc_storeStrong(a1 + 2, a6);
      dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      __int16 v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);
      dispatch_queue_t v19 = dispatch_queue_create("com.apple.conductord.DACLifecycleCoordinator", v18);
      id v20 = a1[4];
      a1[4] = v19;

      objc_storeStrong(a1 + 5, a3);
      a1[6] = 0LL;
      id v21 = [v14 copy];
      id v22 = a1[11];
      a1[11] = v21;

      id v23 = a1[11];
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472LL;
      v50[2] = sub_10000D754;
      v50[3] = &unk_10001C6C0;
      id v24 = a1;
      uint64_t v51 = v24;
      [v23 splitLocalOnly:v50];
      id v25 = objc_alloc_init(&OBJC_CLASS___DACActivityList);
      id v26 = v24[9];
      v24[9] = v25;

      id v27 = v24[12];
      v24[12] = 0LL;

      id v28 = -[COClusterRoleMonitor initWithCluster:]( objc_alloc(&OBJC_CLASS___COClusterRoleMonitor),  "initWithCluster:",  a1[2]);
      id v29 = v24[13];
      v24[13] = v28;

      id v30 = v24[14];
      v24[14] = 0LL;

      uint64_t v31 = objc_claimAutoreleasedReturnValue(+[COClusterRole roleForUnknown](&OBJC_CLASS___COClusterRole, "roleForUnknown"));
      id v32 = v24[15];
      v24[15] = (id)v31;

      __int128 v33 = objc_alloc_init(&OBJC_CLASS___COCapabilityManager);
      id v34 = v24[16];
      v24[16] = v33;

      id v35 = v24[17];
      v24[17] = 0LL;

      __int16 v36 = -[COMessageChannel initWithTopic:cluster:]( objc_alloc(&OBJC_CLASS___COMessageChannel),  "initWithTopic:cluster:",  @"com.apple.conductord.LifecycleCoordinator",  a1[2]);
      id v37 = v24[18];
      v24[18] = v36;

      *((_BYTE *)v24 + _Block_object_dispose(va, 8) = 0;
      uint64_t v38 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
      id v39 = v24[19];
      v24[19] = (id)v38;

      uint64_t v40 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      id v41 = v24[20];
      v24[20] = (id)v40;

      id v42 = v24[21];
      v24[21] = 0LL;

      *((_BYTE *)v24 + 9) = 0;
      uint64_t v43 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      id v44 = v24[22];
      v24[22] = (id)v43;

      id v45 = v24[23];
      v24[23] = 0LL;

      id v46 = (dispatch_queue_s *)a1[4];
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472LL;
      v48[2] = sub_10000D7C0;
      v48[3] = &unk_10001C3C0;
      a1 = v24;
      id v49 = a1;
      dispatch_async(v46, v48);
    }
  }

  return a1;
}

void sub_10000D754(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 64);
  *(void *)(v7 + 64) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(a1 + 32);
  objc_super v10 = *(void **)(v9 + 80);
  *(void *)(v9 + 80) = v6;
}

void sub_10000D7C0(uint64_t a1)
{
}

void sub_10000D7C8(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    uint64_t v2 = *(void *)(a1 + 48);
    id v3 = sub_100014610(3);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v2;
      *(_WORD *)&buf[22] = 2048;
      dispatch_queue_t v19 = (void *)(v2 + 1);
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%p advancing from state %lu to %lu",  buf,  0x20u);
    }

    *(void *)(a1 + 4_Block_object_dispose(va, 8) = v2 + 1;
    switch(v2)
    {
      case 0LL:
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
        objc_initWeak(&location, (id)a1);
        id v5 = *(id *)(a1 + 104);
        id v6 = *(id *)(a1 + 32);
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472LL;
        *(void *)&uint8_t buf[16] = sub_10000EB24;
        dispatch_queue_t v19 = &unk_10001C710;
        objc_copyWeak(v21, &location);
        uint64_t v20 = a1;
        uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 addObserverForSnapshotsToDispatchQueue:v6 block:buf]);
        id v8 = *(void **)(a1 + 112);
        *(void *)(a1 + 112) = v7;

        objc_destroyWeak(v21);
        objc_destroyWeak(&location);
        break;
      case 1LL:
        sub_1000102D8(a1);
        break;
      case 2LL:
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
        objc_initWeak(&location, (id)a1);
        id v9 = *(id *)(a1 + 128);
        id v10 = *(id *)(a1 + 16);
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472LL;
        *(void *)&uint8_t buf[16] = sub_10000FE04;
        dispatch_queue_t v19 = &unk_10001C788;
        objc_copyWeak((id *)&v20, &location);
        uint64_t v11 = objc_claimAutoreleasedReturnValue( [v9 addObserverForCapability:@"com.apple.conductord.LifecycleCoordinator" inCluster:v10 usingBlock:buf]);
        id v12 = *(void **)(a1 + 136);
        *(void *)(a1 + 136) = v11;

        id v13 = *(id *)(a1 + 128);
        [v13 registerCapability:@"com.apple.conductord.LifecycleCoordinator"];

        objc_destroyWeak((id *)&v20);
        objc_destroyWeak(&location);
        break;
      case 3LL:
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
        id v14 = sub_100014610(3);
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = a1;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%p bootstrapping complete",  buf,  0xCu);
        }

        goto LABEL_13;
      default:
        id v16 = sub_100014610(3);
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&uint8_t buf[4] = a1;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v2 + 1;
          _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%p advanced to unexpected state %lu",  buf,  0x16u);
        }

void sub_10000DB10( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_10000DB50(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 112);
    if (v2)
    {
      id v3 = *(id *)(a1 + 104);
      [v3 removeObserverForSnapshots:v2];

      id v4 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = 0LL;
    }

    uint64_t v5 = *(void *)(a1 + 136);
    if (v5)
    {
      id v6 = *(id *)(a1 + 128);
      [v6 removeObserver:v5];

      uint64_t v7 = *(void **)(a1 + 136);
      *(void *)(a1 + 136) = 0LL;
    }
  }

void sub_10000DCD8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = *(dispatch_queue_s **)(a1 + 32);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10000DDAC;
    v11[3] = &unk_10001C6E8;
    v11[4] = a1;
    id v12 = v7;
    id v13 = v9;
    id v14 = v8;
    dispatch_async(v10, v11);
  }
}

void sub_10000DDAC(uint64_t a1)
{
  id v2 = sub_100014610(3);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v21 = 134218498;
    uint64_t v22 = v4;
    __int16 v23 = 2114;
    uint64_t v24 = v5;
    __int16 v25 = 2114;
    uint64_t v26 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%p request to activate %{public}@ with %{public}@",  (uint8_t *)&v21,  0x20u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    id v8 = *(void **)(v7 + 56);
  }
  else {
    id v8 = 0LL;
  }
  id v9 = sub_100004BB4(v8, *(void **)(a1 + 40));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    id v12 = *(void **)(v11 + 56);
  }
  else {
    id v12 = 0LL;
  }
  id v13 = sub_100004BB4(v12, *(void **)(a1 + 56));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  unsigned int v15 = [v10 isLocalOnly];
  uint64_t v16 = *(void *)(a1 + 32);
  if (v15)
  {
    if (v16) {
      dispatch_queue_attr_t v17 = *(void **)(v16 + 64);
    }
    else {
      dispatch_queue_attr_t v17 = 0LL;
    }
LABEL_15:
    sub_10000E1AC(*(void *)(a1 + 32));
    goto LABEL_16;
  }

  if (v16) {
    __int16 v18 = *(void **)(v16 + 72);
  }
  else {
    __int16 v18 = 0LL;
  }
  unsigned int v19 = [v18 addActivity:v10 requester:v14 changeMarker:*(void *)(a1 + 48)];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[DACLifecycleCoordinatorChangeRequestMessage activationMessageWithActivity:requester:changeMarker:]( &OBJC_CLASS___DACLifecycleCoordinatorChangeRequestMessage,  "activationMessageWithActivity:requester:changeMarker:",  v10,  v14,  *(void *)(a1 + 48)));
  sub_10000DF64(*(void *)(a1 + 32), v20);

  if (v19) {
    goto LABEL_15;
  }
LABEL_16:
}

void sub_10000DF64(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, (id)a1);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000132B4;
    v12[3] = &unk_10001C9E0;
    objc_copyWeak(&v14, &location);
    id v4 = v3;
    id v13 = v4;
    uint64_t v5 = objc_retainBlock(v12);
    uint64_t v6 = v5;
    if (*(_BYTE *)(a1 + 8))
    {
      if (*(_BYTE *)(a1 + 9))
      {
        ((void (*)(void *))v5[2])(v5);
LABEL_11:

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
        goto LABEL_12;
      }

      id v9 = sub_100014610(3);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v17 = a1;
        __int16 v18 = 2114;
        id v19 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%p deferring sending change %{public}@, cluster not processing changes",  buf,  0x16u);
      }
    }

    else
    {
      id v7 = sub_100014610(3);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v17 = a1;
        __int16 v18 = 2114;
        id v19 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%p deferring sending change %{public}@, messaging not available",  buf,  0x16u);
      }
    }

    id v10 = *(id *)(a1 + 176);
    id v11 = objc_retainBlock(v6);
    [v10 addObject:v11];

    goto LABEL_11;
  }

void sub_10000E188( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10000E1AC(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    id v2 = [*(id *)(a1 + 80) copy];
    id v3 = *(void **)(a1 + 80);
    id v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472LL;
    int v21 = sub_1000139C8;
    uint64_t v22 = &unk_10001C630;
    uint64_t v23 = a1;
    id v4 = v2;
    id v24 = v4;
    [v3 enumerate:&v19];
    id v5 = *(id *)(a1 + 88);
    id v6 = *(id *)(a1 + 72);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "listWithMerge:", v6, v19, v20, v21, v22, v23));
    id v8 = *(id *)(a1 + 64);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([(id)v7 listWithMerge:v8]);

    LOBYTE(v7) = [v9 isEqualIgnoringLastModified:v5];
    id v10 = sub_100014610(3);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = v11;
    if ((v7 & 1) != 0)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = a1;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%p no change to effective Activity List",  buf,  0xCu);
      }
    }

    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%p effective Activity List changed %{public}@",  buf,  0x16u);
      }

      objc_storeStrong((id *)(a1 + 88), v9);
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
      id v13 = *(void **)(a1 + 88);
      id v14 = (dispatch_queue_s *)*(id *)(a1 + 40);
      id v15 = [v13 copy];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&uint8_t buf[16] = sub_100014014;
      uint64_t v26 = &unk_10001C460;
      id v27 = WeakRetained;
      uint64_t v28 = a1;
      id v29 = v15;
      id v17 = v15;
      id v18 = WeakRetained;
      dispatch_async(v14, buf);
    }
  }

void sub_10000E44C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = *(dispatch_queue_s **)(a1 + 32);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10000E520;
    v11[3] = &unk_10001C6E8;
    v11[4] = a1;
    id v12 = v7;
    id v13 = v9;
    id v14 = v8;
    dispatch_async(v10, v11);
  }
}

void sub_10000E520(uint64_t a1)
{
  id v2 = sub_100014610(3);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v24 = 134218498;
    uint64_t v25 = v4;
    __int16 v26 = 2114;
    id v27 = v5;
    __int16 v28 = 2114;
    uint64_t v29 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%p request to deactivate %{public}@ with %{public}@",  (uint8_t *)&v24,  0x20u);
  }

  id v7 = *(void **)(a1 + 32);
  if (v7) {
    id v7 = (void *)v7[7];
  }
  id v8 = *(void **)(a1 + 40);
  id v9 = v7;
  id v10 = sub_100004BB4(v9, v8);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    id v13 = *(void **)(v12 + 56);
  }
  else {
    id v13 = 0LL;
  }
  id v14 = sub_100004BB4(v13, *(void **)(a1 + 56));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  unsigned int v16 = [v11 isLocalOnly];
  uint64_t v17 = *(void *)(a1 + 32);
  if (v16)
  {
    if (v17) {
      id v18 = *(void **)(v17 + 64);
    }
    else {
      id v18 = 0LL;
    }
  }

  else
  {
    if (v17) {
      id v19 = *(void **)(v17 + 72);
    }
    else {
      id v19 = 0LL;
    }
    if ([v19 stateOfActivity:v11])
    {
      id v20 = sub_100014610(3);
      int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = *(void *)(a1 + 32);
        int v24 = 134218242;
        uint64_t v25 = v22;
        __int16 v26 = 2114;
        id v27 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%p not removing %{public}@ from pending for deactivation",  (uint8_t *)&v24,  0x16u);
      }
    }

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[DACLifecycleCoordinatorChangeRequestMessage deactivationMessageWithActivity:requester:changeMarker:]( &OBJC_CLASS___DACLifecycleCoordinatorChangeRequestMessage,  "deactivationMessageWithActivity:requester:changeMarker:",  v11,  v15,  *(void *)(a1 + 48)));
    sub_10000DF64(*(void *)(a1 + 32), v23);
  }
}

void sub_10000E72C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = *(dispatch_queue_s **)(a1 + 32);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10000E800;
    v11[3] = &unk_10001C6E8;
    v11[4] = a1;
    id v12 = v7;
    id v13 = v9;
    id v14 = v8;
    dispatch_async(v10, v11);
  }
}

void sub_10000E800(uint64_t a1)
{
  id v2 = sub_100014610(3);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    *(_DWORD *)id v39 = 134218498;
    *(void *)&v39[4] = v4;
    *(_WORD *)&v39[12] = 2114;
    *(void *)&v39[14] = v5;
    *(_WORD *)&v39[22] = 2114;
    uint64_t v40 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%p request to relinquish %{public}@ with %{public}@",  v39,  0x20u);
  }

  id v7 = *(void **)(a1 + 32);
  if (v7) {
    id v7 = (void *)v7[7];
  }
  id v8 = *(void **)(a1 + 40);
  id v9 = v7;
  id v10 = sub_100004BB4(v9, v8);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    id v13 = *(void **)(v12 + 56);
  }
  else {
    id v13 = 0LL;
  }
  id v14 = sub_100004BB4(v13, *(void **)(a1 + 56));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (![v11 isLocalOnly])
  {
    uint64_t v22 = *(void *)(a1 + 32);
    if (v22) {
      uint64_t v23 = *(void **)(v22 + 72);
    }
    else {
      uint64_t v23 = 0LL;
    }
    if (![v23 stateOfActivity:v11]) {
      goto LABEL_26;
    }
    int v24 = *(void **)(a1 + 32);
    if (v24) {
      int v24 = (void *)v24[9];
    }
    uint64_t v25 = v24;
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 changeMarkerForActivity:v11]);

    unsigned int v27 = [*(id *)(a1 + 48) isEqual:v26];
    id v28 = sub_100014610(3);
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    if (v27)
    {
      if (v30)
      {
        uint64_t v31 = *(void *)(a1 + 32);
        uint64_t v32 = *(void *)(a1 + 48);
        *(_DWORD *)id v39 = 134218498;
        *(void *)&v39[4] = v31;
        *(_WORD *)&v39[12] = 2114;
        *(void *)&v39[14] = v11;
        *(_WORD *)&v39[22] = 2114;
        uint64_t v40 = v32;
        __int128 v33 = "%p not removing %{public}@ from pending for relinquish with %{public}@";
        id v34 = v29;
        uint32_t v35 = 32;
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v33, v39, v35);
      }
    }

    else if (v30)
    {
      uint64_t v36 = *(void *)(a1 + 32);
      uint64_t v37 = *(void *)(a1 + 48);
      *(_DWORD *)id v39 = 134218754;
      *(void *)&v39[4] = v36;
      *(_WORD *)&v39[12] = 2114;
      *(void *)&v39[14] = v11;
      *(_WORD *)&v39[22] = 2114;
      uint64_t v40 = v37;
      LOWORD(v41) = 2114;
      *(void *)((char *)&v41 + 2) = v26;
      __int128 v33 = "%p not removing %{public}@ from pending for relinquish (got %{public}@, expected %{public}@)";
      id v34 = v29;
      uint32_t v35 = 42;
      goto LABEL_24;
    }

LABEL_26:
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[DACLifecycleCoordinatorChangeRequestMessage relinquishMessageWithActivity:requester:changeMarker:]( &OBJC_CLASS___DACLifecycleCoordinatorChangeRequestMessage,  "relinquishMessageWithActivity:requester:changeMarker:",  v11,  v15,  *(void *)(a1 + 48),  *(_OWORD *)v39,  *(void *)&v39[16],  v40,  v41));
    sub_10000DF64(*(void *)(a1 + 32), v38);

    goto LABEL_27;
  }

  id v16 = sub_100014610(3);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 40);
    *(_DWORD *)id v39 = 134218242;
    *(void *)&v39[4] = v18;
    *(_WORD *)&v39[12] = 2114;
    *(void *)&v39[14] = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%p relinquish deactivating local-only %{public}@",  v39,  0x16u);
  }

  uint64_t v20 = *(void *)(a1 + 32);
  if (v20) {
    int v21 = *(void **)(v20 + 64);
  }
  else {
    int v21 = 0LL;
  }
LABEL_27:
}

void sub_10000EB24(uint64_t a1, void *a2)
{
  id v61 = a2;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[6] == (dispatch_queue_t)1 && [v61 count]) {
      sub_10000D7C8(*(void *)(a1 + 32));
    }
    id v5 = v61;
    uint64_t v62 = (uint64_t)v4;
    dispatch_assert_queue_V2(v4[4]);
    uint64_t v84 = 0LL;
    uint64_t v85 = &v84;
    uint64_t v86 = 0x3032000000LL;
    v87 = sub_10000F4D0;
    v88 = sub_10000F4E0;
    id v89 = 0LL;
    uint64_t v78 = 0LL;
    id v79 = &v78;
    uint64_t v80 = 0x3032000000LL;
    v81 = sub_10000F4D0;
    uint64_t v82 = sub_10000F4E0;
    id v83 = 0LL;
    uint64_t v72 = 0LL;
    id v73 = &v72;
    uint64_t v74 = 0x3032000000LL;
    id v75 = sub_10000F4D0;
    id v76 = sub_10000F4E0;
    id v77 = 0LL;
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472LL;
    id v67 = sub_10000F4E8;
    v68 = &unk_10001C738;
    id v69 = &v84;
    __int16 v70 = &v78;
    id v71 = &v72;
    id v6 = v5;
    __int128 v59 = v66;
    __int128 v64 = (void *)objc_claimAutoreleasedReturnValue(+[COClusterMember memberForCurrentDevice](&OBJC_CLASS___COClusterMember, "memberForCurrentDevice"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[COClusterRole roleForCoordinator](&OBJC_CLASS___COClusterRole, "roleForCoordinator"));
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v92 = 0u;
    __int128 v93 = 0u;
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    id obj = v6;
    id v9 = 0LL;
    id v10 = 0LL;
    id v11 = [obj countByEnumeratingWithState:&v90 objects:buf count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v91;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v91 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v90 + 1) + 8LL * (void)i);
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 member]);
          unsigned int v16 = [v15 isSameDeviceAsMember:v64];

          if (v16)
          {
            uint64_t v17 = objc_claimAutoreleasedReturnValue([v14 role]);

            id v10 = (void *)v17;
          }

          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 role]);
          unsigned int v19 = [v18 satisfiesRole:v7];

          if (v19)
          {
            uint64_t v20 = objc_claimAutoreleasedReturnValue([v14 member]);

            id v9 = (void *)v20;
          }

          int v21 = (void *)objc_claimAutoreleasedReturnValue([v14 member]);
          -[NSMutableSet addObject:](v8, "addObject:", v21);
        }

        id v11 = [obj countByEnumeratingWithState:&v90 objects:buf count:16];
      }

      while (v11);
    }

    v67(v59, v10, v9, v8);
    uint64_t v22 = v85;
    if (v85[5])
    {
      if (v79[5])
      {
        id v23 = *(id *)(v62 + 120);
        unsigned int v24 = [v23 isEqual:v22[5]];
        int v25 = sub_10000F590(v62);
        objc_storeStrong((id *)(v62 + 120), (id)v85[5]);
        int v26 = sub_10000F590(v62);
        id v65 = *(id *)(v62 + 168);
        objc_storeStrong((id *)(v62 + 168), (id)v79[5]);
        if (v65) {
          unsigned int v27 = objc_msgSend((id)v79[5], "isSameDeviceAsMember:") ^ 1;
        }
        else {
          unsigned int v27 = 1;
        }
        id v60 = *(id *)(v62 + 152);
        objc_storeStrong((id *)(v62 + 152), (id)v73[5]);
        unsigned int v31 = [(id)v73[5] isSubsetOfSet:v60];
        id v32 = sub_100014610(3);
        __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          if (v24) {
            int v34 = 78;
          }
          else {
            int v34 = 89;
          }
          *(_DWORD *)buf = 134218752;
          uint64_t v99 = v62;
          if (v27) {
            int v35 = 89;
          }
          else {
            int v35 = 78;
          }
          *(_DWORD *)__int128 v101 = v34;
          __int16 v100 = 1024;
          if (v31) {
            int v36 = 78;
          }
          else {
            int v36 = 89;
          }
          *(_WORD *)&v101[4] = 1024;
          *(_DWORD *)&v101[6] = v35;
          __int16 v102 = 1024;
          int v103 = v36;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%p snapshot update, role(%c) coordinator(%c) members(%c)",  buf,  0x1Eu);
        }

        if ((v24 & 1) == 0)
        {
          id v37 = sub_100014610(3);
          uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v39 = v85[5];
            *(_DWORD *)buf = 134218242;
            uint64_t v99 = v62;
            __int16 v100 = 2114;
            *(void *)__int128 v101 = v39;
            _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "%p role changed %{public}@",  buf,  0x16u);
          }
        }

        if ((v27 | v31 ^ 1) == 1) {
          *(_BYTE *)(v62 + 9) = 0;
        }
        if (((v25 ^ 1 | v26) & 1) == 0)
        {
          id v51 = sub_100014610(3);
          objc_super v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v99 = v62;
            _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "%p no longer Coordinator, flushing specific state",  buf,  0xCu);
          }

          sub_10000F620(v62, 0LL);
          objc_storeStrong((id *)(v62 + 184), 0LL);
          id v53 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
          id v44 = *(id *)(v62 + 160);
          id v58 = v53;
          *(void *)(v62 + 160) = v53;
          goto LABEL_60;
        }

        if (!v26)
        {
LABEL_68:

          goto LABEL_69;
        }

        if ((v25 & 1) != 0)
        {
          uint64_t v40 = v62;
          if ((v31 & 1) != 0)
          {
            id v41 = *(id *)(v62 + 160);
            id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 allKeys]);
            id v58 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v42));

            id v43 = [v58 mutableCopy];
            [v43 minusSet:v73[5]];
            __int128 v92 = 0u;
            __int128 v93 = 0u;
            __int128 v90 = 0u;
            __int128 v91 = 0u;
            id v44 = v43;
            id v45 = [v44 countByEnumeratingWithState:&v90 objects:buf count:16];
            if (v45)
            {
              uint64_t v46 = *(void *)v91;
              do
              {
                for (j = 0LL; j != v45; j = (char *)j + 1)
                {
                  if (*(void *)v91 != v46) {
                    objc_enumerationMutation(v44);
                  }
                  v48 = *(void **)(*((void *)&v90 + 1) + 8LL * (void)j);
                  id v49 = sub_100014610(3);
                  v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)__int128 v94 = 134218242;
                    uint64_t v95 = v62;
                    __int16 v96 = 2112;
                    __int128 v97 = v48;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "%p lost member %@, dropping all assertions",  v94,  0x16u);
                  }

                  sub_10000FB24(v62, 0LL, 0LL, v48);
                }

                id v45 = [v44 countByEnumeratingWithState:&v90 objects:buf count:16];
              }

              while (v45);
            }

LABEL_60:
            goto LABEL_68;
          }
        }

        else
        {
          id v54 = sub_100014610(3);
          id v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v99 = v62;
            _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "%p became the Coordinator, need to gather",  buf,  0xCu);
          }

          uint64_t v40 = v62;
          if ((v31 & 1) != 0) {
            goto LABEL_67;
          }
        }

        id v56 = sub_100014610(3);
        uint64_t v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v99 = v40;
          _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "%p snapshots have new members, need to gather",  buf,  0xCu);
        }

        uint64_t v40 = v62;
LABEL_67:
        sub_10000F620(v40, 0LL);
        objc_storeStrong((id *)(v62 + 184), 0LL);
        sub_10000F754(v62);
        goto LABEL_68;
      }

      id v30 = sub_100014610(3);
      id v23 = (id)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v99 = v62;
        __int16 v100 = 2112;
        *(void *)__int128 v101 = obj;
        uint64_t v29 = "%p no Coordinator member in role snapshots %@";
        goto LABEL_24;
      }
    }

    else
    {
      id v28 = sub_100014610(3);
      id v23 = (id)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v99 = v62;
        __int16 v100 = 2112;
        *(void *)__int128 v101 = obj;
        uint64_t v29 = "%p local device missing from role snapshots %@";
LABEL_24:
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_ERROR, v29, buf, 0x16u);
      }
    }

LABEL_69:
    _Block_object_dispose(&v72, 8);
    _Block_object_dispose(&v78, 8);

    _Block_object_dispose(&v84, 8);
    uint64_t v4 = (dispatch_queue_t *)v62;
  }
}

void sub_10000F464( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

uint64_t sub_10000F4D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000F4E0(uint64_t a1)
{
}

void sub_10000F4E8(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1[4] + 8LL);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v17 = v7;

  uint64_t v12 = *(void *)(a1[5] + 8LL);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  uint64_t v15 = *(void *)(a1[6] + 8LL);
  unsigned int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
}

uint64_t sub_10000F590(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    id v2 = *(id *)(v1 + 120);
    if ([v2 isUnknown])
    {
      uint64_t v1 = 1LL;
    }

    else
    {
      id v3 = *(id *)(v1 + 120);
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[COClusterRole roleForCoordinator](&OBJC_CLASS___COClusterRole, "roleForCoordinator"));
      uint64_t v1 = (uint64_t)[v3 satisfiesRole:v4];
    }
  }

  return v1;
}

void sub_10000F620(uint64_t a1, void *a2)
{
  unint64_t v4 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  unint64_t v5 = (unint64_t)*(id *)(a1 + 96);
  id v6 = (void *)v5;
  if (v4 | v5 && ([(id)v5 isEqual:v4] & 1) == 0)
  {
    objc_storeStrong((id *)(a1 + 96), a2);
    id v7 = sub_100014610(3);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 96);
      int v10 = 134218242;
      uint64_t v11 = a1;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%p Coordinator Activity List changed %{public}@",  (uint8_t *)&v10,  0x16u);
    }
  }
}

void sub_10000F754(uint64_t a1)
{
  id v2 = *(void **)(a1 + 184);
  *(void *)(a1 + 184) = 0LL;

  if (*(_BYTE *)(a1 + 8))
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___DACChangeMarker);
    objc_storeStrong((id *)(a1 + 184), v3);
    id v4 = sub_100014610(3);
    unint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%p initiating gather %{public}@", buf, 0x16u);
    }

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000LL;
    id v32 = sub_10000F4D0;
    __int128 v33 = sub_10000F4E0;
    int v34 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v30[0] = 0LL;
    v30[1] = v30;
    v30[2] = 0x2020000000LL;
    v30[3] = 0LL;
    v29[0] = 0LL;
    v29[1] = v29;
    v29[2] = 0x2020000000LL;
    v29[3] = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v8 = objc_alloc_init(&OBJC_CLASS___DACLifecycleCoordinatorGatherRequestMessage);
    objc_initWeak(&location, (id)a1);
    id v9 = *(id *)(a1 + 144);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100011D44;
    v23[3] = &unk_10001C8F0;
    objc_copyWeak(&v27, &location);
    int v25 = v30;
    int v26 = buf;
    int v10 = v3;
    unsigned int v24 = v10;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100011F28;
    v15[3] = &unk_10001C940;
    objc_copyWeak(&v22, &location);
    unsigned int v19 = v29;
    id v11 = v7;
    id v16 = v11;
    id v12 = v6;
    id v17 = v12;
    uint64_t v13 = v10;
    uint64_t v18 = v13;
    uint64_t v20 = v30;
    int v21 = buf;
    [v9 broadcastRequest:v8 recipientsCallback:v23 responseCompletionHandler:v15];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v30, 8);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    id v14 = sub_100014610(3);
    uint64_t v13 = (DACChangeMarker *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = a1;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%p deferring gather, messaging unavailable",  buf,  0xCu);
    }
  }
}

void sub_10000FAC4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, id location, char a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

uint64_t sub_10000FB24(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  uint64_t v27 = a1;
  id v10 = *(id *)(a1 + 160);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id obj = v10;
  id v30 = [v10 countByEnumeratingWithState:&v37 objects:v50 count:16];
  id v11 = 0LL;
  uint64_t v12 = 0LL;
  if (v30)
  {
    id v28 = v9;
    uint64_t v29 = *(void *)v38;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v38 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)v13);
        if (!v9
          || [v9 isSameDeviceAsMember:*(void *)(*((void *)&v37 + 1) + 8 * (void)v13)])
        {
          id v32 = v13;
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKey:", v14, v27));

          __int128 v35 = 0u;
          __int128 v36 = 0u;
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          id v16 = [v15 copy];
          id v17 = [v16 countByEnumeratingWithState:&v33 objects:v49 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v34;
            do
            {
              uint64_t v20 = 0LL;
              do
              {
                if (*(void *)v34 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)v20);
                if (!v7
                  || [v7 isEqual:*(void *)(*((void *)&v33 + 1) + 8 * (void)v20)])
                {
                  id v22 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v21]);
                  id v23 = v22;
                  if (v22)
                  {
                    [v22 setOrigin:v8];
                    [v15 removeObjectForKey:v21];
                    ++v12;
                  }
                }

                uint64_t v20 = (char *)v20 + 1;
              }

              while (v18 != v20);
              id v18 = [v16 countByEnumeratingWithState:&v33 objects:v49 count:16];
            }

            while (v18);
          }

          id v11 = v15;
          id v9 = v28;
          uint64_t v13 = v32;
        }

        uint64_t v13 = (char *)v13 + 1;
      }

      while (v13 != v30);
      id v30 = [obj countByEnumeratingWithState:&v37 objects:v50 count:16];
    }

    while (v30);
  }

  id v24 = sub_100014610(3);
  int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v42 = v27;
    __int16 v43 = 2048;
    uint64_t v44 = v12;
    __int16 v45 = 2114;
    id v46 = v7;
    __int16 v47 = 2112;
    id v48 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%p dropped %lu assertions of %{public}@ for %@",  buf,  0x2Au);
  }

  return v12;
}

void sub_10000FE04(uint64_t a1, char a2)
{
  id WeakRetained = (dispatch_queue_s **)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v5 = WeakRetained[4];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10000FE7C;
    v6[3] = &unk_10001C760;
    v6[4] = v4;
    char v7 = a2;
    dispatch_async(v5, v6);
  }
}

void sub_10000FE7C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if (*(void *)(v1 + 48) != 3LL || (sub_10000D7C8(*(void *)(a1 + 32)), (uint64_t v1 = *(void *)(a1 + 32)) != 0))
    {
      int v3 = *(unsigned __int8 *)(a1 + 40);
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 32));
      id v4 = sub_100014610(3);
      unint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        if (v3) {
          int v6 = 89;
        }
        else {
          int v6 = 78;
        }
        int v13 = 134218240;
        uint64_t v14 = v1;
        __int16 v15 = 1024;
        int v16 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%p messaging Capability changed: %c",  (uint8_t *)&v13,  0x12u);
      }

      *(_BYTE *)(v1 + _Block_object_dispose((const void *)(v35 - 160), 8) = v3;
      int v7 = sub_10000F590(v1);
      if (v3)
      {
        if (v7 && !*(void *)(v1 + 96))
        {
          id v8 = sub_100014610(3);
          id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            int v13 = 134217984;
            uint64_t v14 = v1;
            _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%p will gather since messaging is now available",  (uint8_t *)&v13,  0xCu);
          }

          sub_10000F754(v1);
        }

        sub_100010068(v1);
      }

      else if (v7)
      {
        id v10 = sub_100014610(3);
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 134217984;
          uint64_t v14 = v1;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%p will need to gather since messaging is unavailable",  (uint8_t *)&v13,  0xCu);
        }

        sub_10000F620(v1, 0LL);
        uint64_t v12 = *(void **)(v1 + 184);
        *(void *)(v1 + 184) = 0LL;
      }
    }
  }

void sub_100010068(uint64_t a1)
{
  if ([*(id *)(a1 + 176) count])
  {
    if (*(_BYTE *)(a1 + 8) && *(_BYTE *)(a1 + 9))
    {
      id v2 = sub_100014610(3);
      int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        id v4 = [*(id *)(a1 + 176) count];
        *(_DWORD *)buf = 134218240;
        uint64_t v20 = a1;
        __int16 v21 = 2048;
        *(void *)id v22 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%p triggering queued changes (%lu)",  buf,  0x16u);
      }

      id v5 = [*(id *)(a1 + 176) copy];
      [*(id *)(a1 + 176) removeAllObjects];
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      id v6 = v5;
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v16;
        do
        {
          id v10 = 0LL;
          do
          {
            if (*(void *)v16 != v9) {
              objc_enumerationMutation(v6);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8LL * (void)v10) + 16LL))(*(void *)(*((void *)&v15 + 1) + 8LL * (void)v10));
            id v10 = (char *)v10 + 1;
          }

          while (v8 != v10);
          id v8 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
        }

        while (v8);
      }
    }

    else
    {
      id v11 = sub_100014610(3);
      id v6 = (id)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
      {
        if (*(_BYTE *)(a1 + 8)) {
          int v12 = 89;
        }
        else {
          int v12 = 78;
        }
        if (*(_BYTE *)(a1 + 9)) {
          int v13 = 89;
        }
        else {
          int v13 = 78;
        }
        *(_DWORD *)buf = 134218496;
        uint64_t v20 = a1;
        __int16 v21 = 1024;
        *(_DWORD *)id v22 = v12;
        *(_WORD *)&v22[4] = 1024;
        *(_DWORD *)&v22[6] = v13;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_DEFAULT,  "%p cannot trigger queued changes, messaging(%c) process(%c)",  buf,  0x18u);
      }
    }
  }

  else
  {
    id v14 = sub_100014610(3);
    id v6 = (id)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = a1;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_DEBUG,  "%p no queued changes to trigger",  buf,  0xCu);
    }
  }
}

void sub_1000102D8(uint64_t a1)
{
  id v2 = sub_100014610(3);
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(id *)(a1 + 144);
    *(_DWORD *)buf = 134218242;
    uint64_t v28 = a1;
    __int16 v29 = 2112;
    id v30 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%p activating message channel %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, (id)a1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  105LL,  0LL));
  id v6 = *(id *)(a1 + 144);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10001062C;
  v24[3] = &unk_10001C800;
  objc_copyWeak(&v26, (id *)buf);
  id v7 = v5;
  id v25 = v7;
  objc_msgSend( v6,  "registerHandler:forRequestClass:",  v24,  objc_opt_class(DACLifecycleCoordinatorGatherRequestMessage, v8));

  id v9 = *(id *)(a1 + 144);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  id v21[2] = sub_100010878;
  v21[3] = &unk_10001C800;
  objc_copyWeak(&v23, (id *)buf);
  id v10 = v7;
  id v22 = v10;
  objc_msgSend( v9,  "registerHandler:forRequestClass:",  v21,  objc_opt_class(DACLifecycleCoordinatorPublishRequestMessage, v11));

  id v12 = *(id *)(a1 + 144);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100010D64;
  void v18[3] = &unk_10001C800;
  objc_copyWeak(&v20, (id *)buf);
  id v13 = v10;
  id v19 = v13;
  objc_msgSend( v12,  "registerHandler:forRequestClass:",  v18,  objc_opt_class(DACLifecycleCoordinatorChangeRequestMessage, v14));

  id v15 = *(id *)(a1 + 144);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000114E8;
  v16[3] = &unk_10001C438;
  objc_copyWeak(&v17, (id *)buf);
  [v15 activateWithCompletion:v16];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v26);

  objc_destroyWeak((id *)buf);
}

void sub_1000105C8(_Unwind_Exception *a1)
{
}

void sub_10001062C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = (dispatch_queue_s **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v11 = WeakRetained;
  if (WeakRetained)
  {
    id v12 = WeakRetained[4];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100010728;
    v13[3] = &unk_10001C7D8;
    v13[4] = WeakRetained;
    id v14 = v7;
    id v15 = v8;
    id v16 = v9;
    dispatch_async(v12, v13);
  }

  else
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, *(void *)(a1 + 32));
  }
}

void sub_100010728(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001086C;
  v8[3] = &unk_10001C7B0;
  id v9 = *(id *)(a1 + 56);
  id v2 = v8;
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 32));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100011854;
    v10[3] = &unk_10001C8C8;
    v10[4] = v1;
    uint64_t v11 = v2;
    int v3 = v10;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 32));
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 24));
    uint64_t v5 = *(dispatch_queue_s **)(v1 + 40);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100014034;
    block[3] = &unk_10001CA80;
    id v13 = WeakRetained;
    uint64_t v14 = v1;
    id v6 = v3;
    id v15 = v6;
    id v7 = WeakRetained;
    dispatch_async(v5, block);
  }
}

uint64_t sub_10001086C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100010878(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = (dispatch_queue_s **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v11 = WeakRetained;
  if (WeakRetained)
  {
    id v12 = WeakRetained[4];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100010974;
    v13[3] = &unk_10001C7D8;
    v13[4] = WeakRetained;
    id v14 = v7;
    id v15 = v8;
    id v16 = v9;
    dispatch_async(v12, v13);
  }

  else
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, *(void *)(a1 + 32));
  }
}

void sub_100010974(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  id v23 = sub_100010D58;
  id v24 = &unk_10001C828;
  int v3 = *(void **)(a1 + 48);
  id v25 = *(id *)(a1 + 56);
  id v4 = v1;
  id v5 = v3;
  id v6 = v22;
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 32));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 role]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[COClusterRole roleForCoordinator](&OBJC_CLASS___COClusterRole, "roleForCoordinator"));
    if ([v7 satisfiesRole:v8])
    {

LABEL_4:
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 activityList]);
      id v10 = sub_100014610(3);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        *(void *)&uint8_t buf[4] = v2;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v4;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v27 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%p received publish request %{public}@ from %@",  buf,  0x20u);
      }

      id v12 = v9;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 32));
      objc_storeStrong((id *)(v2 + 80), v9);
      id v13 = sub_100014610(3);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = v2;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v12;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%p Cluster Activity List changed %{public}@",  buf,  0x16u);
      }

      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&uint8_t buf[16] = sub_100013948;
      uint64_t v27 = &unk_10001CA08;
      uint64_t v28 = v2;
      [v12 enumerate:buf];
      sub_10000E1AC(v2);

      id v15 = -[DACLifecycleCoordinatorPublishResponseMessage initWithResult:]( objc_alloc(&OBJC_CLASS___DACLifecycleCoordinatorPublishResponseMessage),  "initWithResult:",  0LL);
      ((void (*)(void *, DACLifecycleCoordinatorPublishResponseMessage *, void))v23)(v6, v15, 0LL);
      if (!*(_BYTE *)(v2 + 9))
      {
        id v16 = sub_100014610(3);
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v2;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%p cluster can now process changes",  buf,  0xCu);
        }

        *(_BYTE *)(v2 + 9) = 1;
        sub_100010068(v2);
      }

LABEL_20:
      goto LABEL_21;
    }

    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v5 member]);
    if ([v18 memberType] == (id)1)
    {
      int v19 = sub_10000F590(v2);

      if (v19) {
        goto LABEL_4;
      }
    }

    else
    {
    }

    id v20 = sub_100014610(3);
    __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v2;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v4;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v27 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%p disregarding publish request %{public}@ from %@, not from Coordinator",  buf,  0x20u);
    }

    id v15 = -[DACLifecycleCoordinatorPublishResponseMessage initWithResult:]( objc_alloc(&OBJC_CLASS___DACLifecycleCoordinatorPublishResponseMessage),  "initWithResult:",  1LL);
    ((void (*)(void *, DACLifecycleCoordinatorPublishResponseMessage *, void))v23)(v6, v15, 0LL);
    goto LABEL_20;
  }

LABEL_21:
}

uint64_t sub_100010D58(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100010D64(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = (dispatch_queue_s **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v11 = WeakRetained;
  if (WeakRetained)
  {
    id v12 = WeakRetained[4];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100010E60;
    v13[3] = &unk_10001C7D8;
    v13[4] = WeakRetained;
    id v14 = v7;
    id v15 = v8;
    id v16 = v9;
    dispatch_async(v12, v13);
  }

  else
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, *(void *)(a1 + 32));
  }
}

void sub_100010E60(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  id v58 = sub_1000114DC;
  __int128 v59 = &unk_10001C850;
  int v3 = *(void **)(a1 + 48);
  id v60 = *(id *)(a1 + 56);
  id v4 = v1;
  id v5 = v3;
  if (v2)
  {
    id v6 = *(dispatch_queue_s **)(v2 + 32);
    id v7 = v57;
    dispatch_assert_queue_V2(v6);
    id v8 = [*(id *)(v2 + 96) copy];
    if (sub_10000F590(v2))
    {
      id v9 = sub_100014610(3);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = v10;
      if (v8)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          uint64_t v74 = v2;
          __int16 v75 = 2114;
          id v76 = v4;
          __int16 v77 = 2112;
          uint64_t v78 = (uint64_t)v5;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%p processing change request %{public}@ from %@",  buf,  0x20u);
        }

        id v12 = [v4 messageType];
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 activity]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 origin]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 changeMarker]);
        id v15 = sub_100004BB4(*(void **)(v2 + 56), v11);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        id v17 = sub_100004BB4(*(void **)(v2 + 56), v13);
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        id v54 = v14;
        id v55 = v5;
        if (v12 == (id)3)
        {
          id v24 = v18;
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v5 member]);
          id v26 = v16;
          uint64_t v27 = sub_10000FB24(v2, v16, v24, v25);

          __int128 v18 = v24;
          unsigned int v21 = 0;
          unsigned int v20 = v27 != 0;
        }

        else if (v12 == (id)2)
        {
          __int16 v47 = v13;
          id v53 = v18;
          uint64_t v28 = objc_claimAutoreleasedReturnValue([v8 changeMarkerForActivity:v16]);
          if (([v14 isEqual:v28] & 1) == 0)
          {
            id v29 = sub_100014610(3);
            id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 134219010;
              uint64_t v74 = v2;
              __int16 v75 = 2114;
              id v76 = v14;
              __int16 v77 = 2114;
              uint64_t v78 = v28;
              __int16 v79 = 2114;
              id v80 = v4;
              __int16 v81 = 2112;
              id v82 = v5;
              _os_log_fault_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_FAULT,  "%p stale deactivation (got %{public}@, expected %{public}@) request %{public}@ from %@",  buf,  0x34u);
            }
          }

          __int16 v45 = (void *)v28;
          id v46 = v16;
          id v48 = v11;
          id v49 = v7;
          v50 = v8;
          id v51 = v4;
          id v31 = v16;
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 32));
          uint64_t v56 = v2;
          id v32 = *(id *)(v2 + 160);
          __int128 v61 = 0u;
          __int128 v62 = 0u;
          __int128 v63 = 0u;
          __int128 v64 = 0u;
          id v33 = [v32 countByEnumeratingWithState:&v61 objects:buf count:16];
          if (v33)
          {
            id v34 = v33;
            __int128 v35 = 0LL;
            __int128 v36 = 0LL;
            uint64_t v37 = *(void *)v62;
            do
            {
              __int128 v38 = 0LL;
              __int128 v39 = v35;
              __int128 v40 = v36;
              do
              {
                if (*(void *)v62 != v37) {
                  objc_enumerationMutation(v32);
                }
                uint64_t v41 = *(void *)(*((void *)&v61 + 1) + 8LL * (void)v38);
                __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKey:", v41, v45));

                __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKey:v31]);
                if (v35)
                {
                  id v42 = sub_100014610(3);
                  __int16 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)id v65 = 134218754;
                    uint64_t v66 = v56;
                    __int16 v67 = 2048;
                    v68 = v35;
                    __int16 v69 = 2114;
                    id v70 = v31;
                    __int16 v71 = 2112;
                    uint64_t v72 = v41;
                    _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "%p invalidating assertion %p of %{public}@ for %@ due to deactivation",  v65,  0x2Au);
                  }

                  [v35 setState:2];
                  [v36 removeObjectForKey:v31];
                }

                __int128 v38 = (char *)v38 + 1;
                __int128 v39 = v35;
                __int128 v40 = v36;
              }

              while (v34 != v38);
              id v34 = [v32 countByEnumeratingWithState:&v61 objects:buf count:16];
            }

            while (v34);
          }

          else
          {
            __int128 v35 = 0LL;
            __int128 v36 = 0LL;
          }

          id v8 = v50;
          unsigned int v20 = [v50 removeActivity:v31 requester:v53];

          __int128 v18 = v53;
          unsigned int v21 = v20;
          uint64_t v2 = v56;
          id v4 = v51;
          uint64_t v11 = v48;
          id v7 = v49;
          id v26 = v46;
          id v13 = v47;
        }

        else
        {
          if (v12 == (id)1)
          {
            objc_super v52 = v18;
            int v19 = (void *)objc_claimAutoreleasedReturnValue([v5 member]);
            sub_1000118D4(v2, v16, v14, v19);

            unsigned int v20 = [v8 addActivity:v16 requester:v52 changeMarker:v14];
            __int128 v18 = v52;
            unsigned int v21 = v20;
          }

          else
          {
            unsigned int v20 = 0;
            unsigned int v21 = 0;
          }

          id v26 = v16;
        }

        uint64_t v23 = v20 ^ 1;

        id v5 = v55;
      }

      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218498;
          uint64_t v74 = v2;
          __int16 v75 = 2114;
          id v76 = v4;
          __int16 v77 = 2112;
          uint64_t v78 = (uint64_t)v5;
          _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%p not ready to process change request %{public}@ from %@",  buf,  0x20u);
        }

        unsigned int v21 = 0;
        uint64_t v23 = 3LL;
      }
    }

    else
    {
      id v22 = sub_100014610(3);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v74 = v2;
        __int16 v75 = 2114;
        id v76 = v4;
        __int16 v77 = 2112;
        uint64_t v78 = (uint64_t)v5;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%p not Coordinator, disregarding change request %{public}@ from %@",  buf,  0x20u);
      }

      unsigned int v21 = 0;
      uint64_t v23 = 2LL;
    }

    uint64_t v44 = -[DACLifecycleCoordinatorChangeResponseMessage initWithResult:]( objc_alloc(&OBJC_CLASS___DACLifecycleCoordinatorChangeResponseMessage),  "initWithResult:",  v23);
    ((void (*)(void *, DACLifecycleCoordinatorChangeResponseMessage *, void))v58)(v7, v44, 0LL);

    if (v21) {
      sub_10000F620(v2, v8);
    }
  }
}

uint64_t sub_1000114DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000114E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = (void *)*((void *)WeakRetained + 4);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000115B8;
    block[3] = &unk_10001C8A0;
    void block[4] = WeakRetained;
    id v10 = v3;
    id v8 = v7;
    objc_copyWeak(&v11, v4);
    dispatch_async(v8, block);

    objc_destroyWeak(&v11);
  }
}

void sub_1000115B8(uint64_t a1)
{
  id v2 = sub_100014610(3);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      id v5 = *(void **)(v4 + 144);
    }
    else {
      id v5 = 0LL;
    }
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218498;
    uint64_t v20 = v4;
    __int16 v21 = 2048;
    id v22 = v6;
    __int16 v23 = 2112;
    uint64_t v24 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%p activated message channel %p with error %@",  buf,  0x20u);
  }

  id v8 = *(void **)(a1 + 40);
  if (v8)
  {
    if ([v8 code] == (id)-1100)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) domain]);
      unsigned int v10 = [v9 isEqualToString:COMessageChannelErrorDomain];

      if (v10)
      {
        id v11 = sub_100014610(3);
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 134217984;
          uint64_t v20 = v16;
          _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%p will retry activation due to conflicting handler",  buf,  0xCu);
        }

        dispatch_time_t v13 = dispatch_time(0LL, 1000000000LL);
        id v14 = *(void **)(a1 + 32);
        if (v14) {
          id v14 = (void *)v14[4];
        }
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000117D0;
        block[3] = &unk_10001C878;
        id v15 = v14;
        objc_copyWeak(&v18, (id *)(a1 + 48));
        dispatch_after(v13, v15, block);

        objc_destroyWeak(&v18);
      }
    }
  }

  else
  {
    sub_10000D7C8(*(void *)(a1 + 32));
  }

void sub_1000117D0(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = objc_alloc(&OBJC_CLASS___COMessageChannel);
    id v2 = WeakRetained[2];
    id v3 = -[COMessageChannel initWithTopic:cluster:]( v1,  "initWithTopic:cluster:",  @"com.apple.conductord.LifecycleCoordinator",  v2);
    id v4 = WeakRetained[18];
    WeakRetained[18] = v3;

    sub_1000102D8(WeakRetained);
  }
}

void sub_100011854(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(&OBJC_CLASS___DACLifecycleCoordinatorGatherResponseMessage);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    uint64_t v6 = *(void *)(v5 + 80);
  }
  else {
    uint64_t v6 = 0LL;
  }
  uint64_t v7 = -[DACLifecycleCoordinatorGatherResponseMessage initWithActivityList:assertedActivities:]( v4,  "initWithActivityList:assertedActivities:",  v6,  v3);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_1000118D4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  id v10 = *(id *)(a1 + 160);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v9]);
  if (!v11)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v10 setObject:v11 forKey:v9];
  }

  id v12 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKey:v7]);
  if (v12)
  {
    id v13 = sub_100014610(2);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id location = 134218754;
      *(void *)&location[4] = a1;
      __int16 v19 = 2048;
      id v20 = v12;
      __int16 v21 = 2114;
      id v22 = v7;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%p already have assertion %p for %{public}@ held by %@",  location,  0x2Au);
    }
  }

  else
  {
    objc_initWeak((id *)location, (id)a1);
    id v15 = objc_alloc(&OBJC_CLASS___DACActivityAssertion);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100013B00;
    v16[3] = &unk_10001CA30;
    objc_copyWeak(&v17, (id *)location);
    id v12 = [v15 _initWithActivity:v7 requester:0 changeMarker:v8 relinquishHandler:v16];
    [v11 setObject:v12 forKey:v7];
    [v12 setState:1];
    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)location);
  }
}

void sub_100011AFC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

id sub_100011B38(id a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)a1 + 4));
    id v7 = *((id *)a1 + 9);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 changeMarkerForActivity:v5]);

    if (v8)
    {
      unsigned int v9 = [v8 isEqual:v6];
      id v10 = sub_100014610(3);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      id v12 = v11;
      if (v9)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 134218498;
          id v19 = a1;
          __int16 v20 = 2114;
          id v21 = v5;
          __int16 v22 = 2114;
          id v23 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%p pruning %{public}@ from pending with %{public}@",  (uint8_t *)&v18,  0x20u);
        }

        a1 = [*((id *)a1 + 9) removeActivity:v5 requester:v5];
        goto LABEL_11;
      }

      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
LABEL_10:

        a1 = 0LL;
LABEL_11:

        goto LABEL_12;
      }

      int v18 = 134218754;
      id v19 = a1;
      __int16 v20 = 2114;
      id v21 = v5;
      __int16 v22 = 2114;
      id v23 = v6;
      __int16 v24 = 2114;
      id v25 = v8;
      id v14 = "%p not pruning %{public}@ due to mismatch (got %{public}@, expected %{public}@)";
      id v15 = v12;
      uint32_t v16 = 42;
    }

    else
    {
      id v13 = sub_100014610(3);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_10;
      }
      int v18 = 134218242;
      id v19 = a1;
      __int16 v20 = 2114;
      id v21 = v5;
      id v14 = "%p no pruning needed for %{public}@";
      id v15 = v12;
      uint32_t v16 = 22;
    }

    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, v14, (uint8_t *)&v18, v16);
    goto LABEL_10;
  }

void sub_100011D44(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 count];
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        id v12 = 0LL;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
          id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v12), "member", (void)v19));
          [v13 addObject:v14];

          id v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v31 count:16];
      }

      while (v10);
    }

    id v15 = sub_100014610(3);
    uint32_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      *(_DWORD *)buf = 134218754;
      id v24 = WeakRetained;
      __int16 v25 = 2114;
      uint64_t v26 = v17;
      __int16 v27 = 2048;
      uint64_t v28 = v18;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%p gathering (%{public}@) from %lu, error %@",  buf,  0x2Au);
    }
  }
}

void sub_100011F28(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
    if (v8)
    {
      id v11 = v8;
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 assertedActivities]);
      id v14 = [v13 countByEnumeratingWithState:&v41 objects:v59 count:16];
      if (v14)
      {
        id v15 = v14;
        id v33 = v9;
        id v34 = v8;
        id v35 = v7;
        uint32_t v16 = 0LL;
        uint64_t v17 = *(void *)v42;
        do
        {
          uint64_t v18 = 0LL;
          __int128 v19 = v16;
          do
          {
            if (*(void *)v42 != v17) {
              objc_enumerationMutation(v13);
            }
            id v20 = sub_100004BB4(*((void **)WeakRetained + 7), *(void **)(*((void *)&v41 + 1) + 8LL * (void)v18));
            uint32_t v16 = (void *)objc_claimAutoreleasedReturnValue(v20);

            [v12 addObject:v16];
            uint64_t v18 = (char *)v18 + 1;
            __int128 v19 = v16;
          }

          while (v15 != v18);
          id v15 = [v13 countByEnumeratingWithState:&v41 objects:v59 count:16];
        }

        while (v15);

        id v8 = v34;
        id v7 = v35;
        id v9 = v33;
      }

      __int128 v21 = *(void **)(a1 + 32);
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v7 member]);
      [v21 setObject:v12 forKey:v22];

      id v23 = *(void **)(a1 + 40);
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v11 activityList]);
      [v23 addObject:v24];
    }

    id v25 = sub_100014610(3);
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v30 = *(void *)(a1 + 48);
      uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
      uint64_t v32 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
      *(_DWORD *)buf = 134219522;
      id v46 = WeakRetained;
      __int16 v47 = 2114;
      uint64_t v48 = v30;
      __int16 v49 = 2048;
      uint64_t v50 = v31;
      __int16 v51 = 2048;
      uint64_t v52 = v32;
      __int16 v53 = 2112;
      id v54 = v7;
      __int16 v55 = 2114;
      id v56 = v8;
      __int16 v57 = 2112;
      id v58 = v9;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "%p gather (%{public}@) reply (%lu of %lu) from %@ with response %{public}@ and error %@",  buf,  0x48u);
    }

    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) == *(void *)(*(void *)(*(void *)(a1 + 64)
                                                                                              + 8LL)
                                                                                  + 24LL))
    {
      __int16 v27 = (dispatch_queue_s *)*((void *)WeakRetained + 4);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10001227C;
      block[3] = &unk_10001C918;
      void block[4] = WeakRetained;
      id v37 = *(id *)(a1 + 40);
      id v28 = *(id *)(a1 + 32);
      uint64_t v29 = *(void *)(a1 + 72);
      id v38 = v28;
      uint64_t v40 = v29;
      id v39 = *(id *)(a1 + 48);
      dispatch_async(v27, block);
    }
  }
}

void sub_10001227C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 56);
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  id v4 = *(void **)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  id v6 = v4;
  id v7 = v5;
  id v68 = v6;
  id v8 = v3;
  id v9 = v2;
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 32));
    id v69 = v9;
    if ([v9 isEqual:*(void *)(v1 + 184)])
    {
      id v10 = *(void **)(v1 + 184);
      *(void *)(v1 + 184) = 0LL;

      uint64_t v77 = v1;
      if ((sub_10000F590(v1) & 1) != 0)
      {
        if ([v7 count] && objc_msgSend(v68, "count"))
        {
          id v67 = v8;
          unsigned __int8 v11 = [*(id *)(v1 + 152) isEqual:v8];
          id v12 = sub_100014610(3);
          id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          id v14 = v13;
          if ((v11 & 1) != 0)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              uint64_t v106 = v1;
              __int16 v107 = 2114;
              id v108 = v9;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%p completing gather %{public}@",  buf,  0x16u);
            }

            uint64_t v66 = v7;
            id v15 = v7;
            dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 32));
            id v16 = sub_100014610(3);
            uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218242;
              uint64_t v106 = v1;
              __int16 v107 = 2114;
              id v108 = v15;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%p selecting from gathered responses %{public}@",  buf,  0x16u);
            }

            __int128 v103 = 0u;
            __int128 v104 = 0u;
            __int128 v101 = 0u;
            __int128 v102 = 0u;
            id v18 = v15;
            id v19 = [v18 countByEnumeratingWithState:&v101 objects:buf count:16];
            if (v19)
            {
              id v20 = v19;
              __int128 v21 = 0LL;
              uint64_t v22 = *(void *)v102;
              do
              {
                for (i = 0LL; i != v20; i = (char *)i + 1)
                {
                  if (*(void *)v102 != v22) {
                    objc_enumerationMutation(v18);
                  }
                  id v24 = *(void **)(*((void *)&v101 + 1) + 8LL * (void)i);
                  if (v21)
                  {
                    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v21 lastModified]);
                    id v27 = [v25 compare:v26];

                    if (v27 != (id)1) {
                      continue;
                    }
                  }

                  id v28 = v24;

                  __int128 v21 = v28;
                }

                id v20 = [v18 countByEnumeratingWithState:&v101 objects:buf count:16];
              }

              while (v20);
            }

            else
            {
              __int128 v21 = 0LL;
            }

            id v35 = sub_100014610(3);
            __int128 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 v97 = 134218242;
              uint64_t v98 = v1;
              __int16 v99 = 2114;
              __int16 v100 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%p selecting %{public}@ from gathered responses",  v97,  0x16u);
            }

            id v37 = v68;
            id v38 = v21;
            dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 32));
            __int128 v94 = 0u;
            __int128 v95 = 0u;
            __int128 v92 = 0u;
            __int128 v93 = 0u;
            id obj = v37;
            id v39 = [obj countByEnumeratingWithState:&v92 objects:buf count:16];
            if (v39)
            {
              id v40 = v39;
              id v41 = 0LL;
              uint64_t v42 = *(void *)v93;
              do
              {
                for (j = 0LL; j != v40; j = (char *)j + 1)
                {
                  if (*(void *)v93 != v42) {
                    objc_enumerationMutation(obj);
                  }
                  __int128 v44 = *(void **)(*((void *)&v92 + 1) + 8LL * (void)j);
                  __int16 v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKey:", v44, v66));

                  __int128 v90 = 0u;
                  __int128 v91 = 0u;
                  __int128 v88 = 0u;
                  __int128 v89 = 0u;
                  id v41 = v45;
                  id v46 = [v41 countByEnumeratingWithState:&v88 objects:&v101 count:16];
                  if (v46)
                  {
                    id v47 = v46;
                    uint64_t v48 = *(void *)v89;
                    do
                    {
                      for (k = 0LL; k != v47; k = (char *)k + 1)
                      {
                        if (*(void *)v89 != v48) {
                          objc_enumerationMutation(v41);
                        }
                        uint64_t v50 = *(void **)(*((void *)&v88 + 1) + 8LL * (void)k);
                        if ([v38 stateOfActivity:v50]) {
                          sub_1000118D4(v77, v50, 0LL, v44);
                        }
                      }

                      id v47 = [v41 countByEnumeratingWithState:&v88 objects:&v101 count:16];
                    }

                    while (v47);
                  }
                }

                id v40 = [obj countByEnumeratingWithState:&v92 objects:buf count:16];
              }

              while (v40);
            }

            else
            {
              id v41 = 0LL;
            }

            id v51 = *(id *)(v77 + 160);
            __int128 v84 = 0u;
            __int128 v85 = 0u;
            __int128 v86 = 0u;
            __int128 v87 = 0u;
            id v74 = v51;
            id v70 = [v51 copy];
            id v72 = [v70 countByEnumeratingWithState:&v84 objects:v97 count:16];
            uint64_t v52 = 0LL;
            __int16 v53 = 0LL;
            if (v72)
            {
              uint64_t v71 = *(void *)v85;
              do
              {
                uint64_t v54 = 0LL;
                __int16 v55 = v52;
                id v56 = v41;
                do
                {
                  if (*(void *)v85 != v71) {
                    objc_enumerationMutation(v70);
                  }
                  uint64_t v75 = v54;
                  uint64_t v57 = *(void *)(*((void *)&v84 + 1) + 8 * v54);
                  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "objectForKey:", v57, v66));

                  uint64_t v73 = v57;
                  id v41 = (id)objc_claimAutoreleasedReturnValue([obj objectForKey:v57]);

                  __int128 v82 = 0u;
                  __int128 v83 = 0u;
                  __int128 v80 = 0u;
                  __int128 v81 = 0u;
                  id v58 = [v52 copy];
                  id v59 = [v58 countByEnumeratingWithState:&v80 objects:v96 count:16];
                  if (v59)
                  {
                    id v60 = v59;
                    uint64_t v61 = *(void *)v81;
                    do
                    {
                      for (m = 0LL; m != v60; m = (char *)m + 1)
                      {
                        if (*(void *)v81 != v61) {
                          objc_enumerationMutation(v58);
                        }
                        uint64_t v63 = *(void *)(*((void *)&v80 + 1) + 8LL * (void)m);
                        if (([v41 containsObject:v63] & 1) == 0)
                        {
                          __int128 v64 = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKey:v63]);

                          [v64 setState:2];
                          [v52 removeObjectForKey:v63];
                          __int16 v53 = v64;
                        }
                      }

                      id v60 = [v58 countByEnumeratingWithState:&v80 objects:v96 count:16];
                    }

                    while (v60);
                  }

                  if (!v41) {
                    [v74 removeObjectForKey:v73];
                  }
                  uint64_t v54 = v75 + 1;
                  __int16 v55 = v52;
                  id v56 = v41;
                }

                while ((id)(v75 + 1) != v72);
                id v72 = [v70 countByEnumeratingWithState:&v84 objects:v97 count:16];
              }

              while (v72);
            }

            id v65 = [v38 copy];
            v78[0] = _NSConcreteStackBlock;
            v78[1] = 3221225472LL;
            v78[2] = sub_100013DB4;
            v78[3] = &unk_10001C630;
            v78[4] = v77;
            id v14 = (os_log_s *)v38;
            __int16 v79 = v14;
            [v65 enumerate:v78];

            sub_10000F620(v77, v14);
            id v7 = v66;
            goto LABEL_72;
          }

          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
LABEL_72:
            id v8 = v67;
            goto LABEL_73;
          }

          id v31 = *(id *)(v1 + 152);
          *(_DWORD *)buf = 134218498;
          uint64_t v106 = v1;
          __int16 v107 = 2112;
          id v30 = v67;
          id v108 = v67;
          __int16 v109 = 2112;
          id v110 = v31;
          _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%p discarding gather responses, members have changed from %@ to %@",  buf,  0x20u);
          goto LABEL_24;
        }

        id v34 = sub_100014610(3);
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_73;
        }
        *(_DWORD *)buf = 134217984;
        uint64_t v106 = v1;
        id v33 = "%p no gather responses, so not changing Cluster Activity List";
      }

      else
      {
        id v32 = sub_100014610(3);
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_73;
        }
        *(_DWORD *)buf = 134217984;
        uint64_t v106 = v1;
        id v33 = "%p discarding gather responses, not Coordinator";
      }

      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v33, buf, 0xCu);
      goto LABEL_73;
    }

    id v29 = sub_100014610(3);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
LABEL_73:

      id v9 = v69;
      goto LABEL_74;
    }

    id v30 = v8;
    id v31 = *(id *)(v1 + 184);
    *(_DWORD *)buf = 134218498;
    uint64_t v106 = v1;
    __int16 v107 = 2114;
    id v108 = v69;
    __int16 v109 = 2114;
    id v110 = v31;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%p discarding gather (%{public}@) responses, not current (%{public}@)",  buf,  0x20u);
LABEL_24:

    id v8 = v30;
    goto LABEL_73;
  }

LABEL_74:
}

void sub_100012B50(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (*(_BYTE *)(a1 + 8))
    {
      if ((sub_10000F590(a1) & 1) != 0)
      {
        id v2 = *(id *)(a1 + 96);
        id v3 = sub_100014610(3);
        id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = a1;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v2;
          _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%p initiating publish of %{public}@",  buf,  0x16u);
        }

        id v5 = -[DACLifecycleCoordinatorPublishRequestMessage initWithActivityList:]( objc_alloc(&OBJC_CLASS___DACLifecycleCoordinatorPublishRequestMessage),  "initWithActivityList:",  v2);
        objc_initWeak(&location, (id)a1);
        *(void *)buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x2020000000LL;
        uint64_t v19 = 0LL;
        v16[0] = 0LL;
        v16[1] = v16;
        v16[2] = 0x2020000000LL;
        v16[3] = 0LL;
        v14[0] = 0LL;
        v14[1] = v14;
        v14[2] = 0x2020000000LL;
        char v15 = 0;
        id v6 = *(id *)(a1 + 144);
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472LL;
        v12[2] = sub_100012E84;
        v12[3] = &unk_10001C968;
        objc_copyWeak(&v13, &location);
        void v12[4] = buf;
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472LL;
        v10[2] = sub_100012F9C;
        v10[3] = &unk_10001C990;
        objc_copyWeak(&v11, &location);
        v10[6] = v14;
        v10[7] = buf;
        v10[4] = a1;
        void v10[5] = v16;
        [v6 broadcastRequest:v5 recipientsCallback:v12 responseCompletionHandler:v10];

        objc_destroyWeak(&v11);
        objc_destroyWeak(&v13);
        _Block_object_dispose(v14, 8);
        _Block_object_dispose(v16, 8);
        _Block_object_dispose(buf, 8);
        objc_destroyWeak(&location);

        goto LABEL_10;
      }

      id v9 = sub_100014610(3);
      id v2 = (id)objc_claimAutoreleasedReturnValue(v9);
      if (!os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
      {
LABEL_10:

        return;
      }

      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = a1;
      id v8 = "%p not publishing, not Coordinator";
    }

    else
    {
      id v7 = sub_100014610(3);
      id v2 = (id)objc_claimAutoreleasedReturnValue(v7);
      if (!os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = a1;
      id v8 = "%p not publishing, messaging unavailable";
    }

    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v2, OS_LOG_TYPE_ERROR, v8, buf, 0xCu);
    goto LABEL_10;
  }

void sub_100012E34( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28)
{
}

void sub_100012E84(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = sub_100014610(3);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218498;
      id v11 = WeakRetained;
      __int16 v12 = 2048;
      id v13 = [v5 count];
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%p publishing to %lu, error %@",  (uint8_t *)&v10,  0x20u);
    }

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v5 count];
  }
}

void sub_100012F9C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    id v11 = sub_100014610(3);
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      __int128 v21 = WeakRetained;
      __int16 v22 = 2114;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v7;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%p received publish response %{public}@ from %@, error %@",  buf,  0x2Au);
    }

    if (v8)
    {
      id v13 = v8;
      if ([v13 result] == (id)1)
      {
        id v14 = sub_100014610(3);
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218754;
          __int128 v21 = WeakRetained;
          __int16 v22 = 2112;
          id v23 = v13;
          __int16 v24 = 2112;
          id v25 = v7;
          __int16 v26 = 2112;
          id v27 = v9;
          _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%p received rejected publish response %@ from %@, error %@",  buf,  0x2Au);
        }

        *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
      }
    }

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) == *(void *)(*(void *)(*(void *)(a1 + 56)
                                                                                              + 8LL)
                                                                                  + 24LL))
    {
      id v16 = (dispatch_queue_s *)WeakRetained[4];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000131D8;
      block[3] = &unk_10001C4D8;
      uint64_t v17 = *(void *)(a1 + 48);
      uint64_t v18 = *(void *)(a1 + 32);
      void block[4] = WeakRetained;
      void block[5] = v18;
      block[6] = v17;
      dispatch_async(v16, block);
    }
  }
}

uint64_t sub_1000131D8(uint64_t result)
{
  if (*(_BYTE *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    result = sub_10000F590(*(void *)(result + 32));
    if ((_DWORD)result)
    {
      uint64_t v2 = *(void *)(v1 + 40);
      if (v2)
      {
        if (*(void *)(v2 + 96))
        {
          id v3 = sub_100014610(3);
          id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v5 = *(void *)(v1 + 32);
            int v6 = 134217984;
            uint64_t v7 = v5;
            _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%p retrying publish",  (uint8_t *)&v6,  0xCu);
          }

          return sub_100012B50(*(void *)(v1 + 32));
        }
      }
    }
  }

  return result;
}

void sub_1000132B4(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = sub_100014610(3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      id v13 = WeakRetained;
      __int16 v14 = 2114;
      uint64_t v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%p sending change %{public}@", buf, 0x16u);
    }

    id v7 = WeakRetained[18];
    uint64_t v8 = *(void *)(a1 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10001342C;
    v9[3] = &unk_10001C9B8;
    objc_copyWeak(&v11, v2);
    id v10 = *(id *)(a1 + 32);
    [v7 sendRequest:v8 withCompletionHandler:v9];

    objc_destroyWeak(&v11);
  }
}

void sub_100013410(_Unwind_Exception *a1)
{
}

void sub_10001342C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = (dispatch_queue_s **)objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    __int16 v12 = WeakRetained[4];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100013524;
    block[3] = &unk_10001C608;
    void block[4] = WeakRetained;
    id v14 = v8;
    id v15 = *(id *)(a1 + 32);
    id v16 = v7;
    id v17 = v9;
    dispatch_async(v12, block);
  }
}

void sub_100013524(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 48);
  id v3 = *(void **)(a1 + 56);
  id v4 = *(void **)(a1 + 64);
  id v5 = *(id *)(a1 + 40);
  id v6 = v2;
  id v7 = v3;
  id v8 = v4;
  if (!v1) {
    goto LABEL_24;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 32));
  id v9 = sub_100014610(3);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = v10;
  if (v5 && v7 && !v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id v29 = 134219010;
      *(void *)&void v29[4] = v1;
      *(_WORD *)&v29[12] = 2114;
      *(void *)&v29[14] = v5;
      *(_WORD *)&v29[22] = 2112;
      uint64_t v30 = v7;
      strcpy(v31, "@\b");
      v31[3] = 0;
      *(_WORD *)&v31[4] = 0;
      *(_DWORD *)&v31[6] = 0;
      *(_WORD *)&v31[10] = 2114;
      *(void *)&v31[12] = v6;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%p change reply %{public}@ from %@ error %@ for %{public}@",  v29,  0x34u);
    }

LABEL_11:
    unint64_t v12 = (unint64_t)[v5 result];
    unint64_t v13 = v12;
    if ((v12 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      id v14 = sub_100014610(3);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id v29 = 134218754;
        *(void *)&void v29[4] = v1;
        *(_WORD *)&v29[12] = 2048;
        *(void *)&v29[14] = v13;
        *(_WORD *)&v29[22] = 2112;
        uint64_t v30 = v7;
        *(_WORD *)id v31 = 2114;
        *(void *)&v31[2] = v6;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%p change not processed with result %lu by %@ resending %{public}@",  v29,  0x2Au);
      }

      sub_10000DF64(v1, v6);
    }

    else if (v12 == 1 && [v6 messageType] == (id)1)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 activity]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 changeMarker]);
      id v18 = sub_100014610(3);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v29 = 134218498;
        *(void *)&void v29[4] = v1;
        *(_WORD *)&v29[12] = 2114;
        *(void *)&v29[14] = v16;
        *(_WORD *)&v29[22] = 2114;
        uint64_t v30 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%p no change from activation request for %{public}@ will activate assertion with %{public}@",  v29,  0x20u);
      }

      id v20 = v16;
      id v21 = v17;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 32));
      id WeakRetained = objc_loadWeakRetained((id *)(v1 + 24));
      id v23 = *(dispatch_queue_s **)(v1 + 40);
      *(void *)id v29 = _NSConcreteStackBlock;
      *(void *)&v29[8] = 3221225472LL;
      *(void *)&v29[16] = sub_100014024;
      uint64_t v30 = &unk_10001C6E8;
      *(void *)id v31 = WeakRetained;
      *(void *)&v31[8] = v1;
      id v24 = v20;
      *(void *)&v31[16] = v24;
      id v25 = v21;
      id v32 = v25;
      id v26 = WeakRetained;
      dispatch_async(v23, v29);

      if (sub_100011B38((id)v1, v24, v25))
      {
        id v27 = sub_100014610(3);
        id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v29 = 134217984;
          *(void *)&void v29[4] = v1;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%p no change from activation request pruned pending",  v29,  0xCu);
        }

        sub_10000E1AC(v1);
      }
    }

    goto LABEL_24;
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)id v29 = 134219010;
    *(void *)&void v29[4] = v1;
    *(_WORD *)&v29[12] = 2114;
    *(void *)&v29[14] = v5;
    *(_WORD *)&v29[22] = 2112;
    uint64_t v30 = v7;
    *(_WORD *)id v31 = 2112;
    *(void *)&v31[2] = v8;
    *(_WORD *)&v31[10] = 2114;
    *(void *)&v31[12] = v6;
    _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%p unexpected change reply %{public}@ from %@ error %@ for %{public}@",  v29,  0x34u);
  }

  if (v5) {
    goto LABEL_11;
  }
LABEL_24:
}

uint64_t sub_100013948(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activity]);
  id v5 = [v3 state];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 changeMarker]);

  if (v5) {
    sub_100011B38(*(id *)(a1 + 32), v4, v6);
  }

  return 1LL;
}

uint64_t sub_1000139C8(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 activity]);
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id v4 = (void *)v4[7];
  }
  id v5 = v4;
  if (sub_100004E48(v5, v3))
  {
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 policy]);
    id v7 = [v6 options];

    if (!v7)
    {
      id v8 = sub_100014610(3);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v12 = 134218242;
        uint64_t v13 = v10;
        __int16 v14 = 2114;
        id v15 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%p per policy, ignoring unknown activity %{public}@ from cluster list",  (uint8_t *)&v12,  0x16u);
      }

      [*(id *)(a1 + 40) removeActivity:v3 requester:0];
    }
  }

  return 1LL;
}

void sub_100013B00(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (dispatch_queue_s **)objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained[4];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100013BBC;
    block[3] = &unk_10001C460;
    void block[4] = WeakRetained;
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

void sub_100013BBC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  if (v1)
  {
    if ((sub_10000F590(v1) & 1) != 0)
    {
      uint64_t v5 = sub_100013EA8(v1, v3);
      if (!v5)
      {
        id v13 = sub_100014610(3);
        __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 134218242;
          uint64_t v16 = v1;
          __int16 v17 = 2114;
          uint64_t v18 = (uint64_t)v3;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%p relinquished assertion with none remaining triggering deactivation for %{public}@",  (uint8_t *)&v15,  0x16u);
        }

        id v8 = [*(id *)(v1 + 96) copy];
        goto LABEL_7;
      }

      uint64_t v6 = v5;
      id v7 = sub_100014610(2);
      id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 134218498;
        uint64_t v16 = v1;
        __int16 v17 = 2048;
        uint64_t v18 = v6;
        __int16 v19 = 2114;
        id v20 = v3;
        id v9 = "%p relinquished assertion with %lu remaining for %{public}@";
        uint64_t v10 = (os_log_s *)v8;
        uint32_t v11 = 32;
LABEL_14:
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v15, v11);
      }
    }

    else
    {
      id v12 = sub_100014610(3);
      id v8 = (id)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 134218242;
        uint64_t v16 = v1;
        __int16 v17 = 2114;
        uint64_t v18 = (uint64_t)v3;
        id v9 = "%p ignoring relinquish of %{public}@, not Coordinator";
        uint64_t v10 = (os_log_s *)v8;
        uint32_t v11 = 22;
        goto LABEL_14;
      }
    }

LABEL_7:
  }
}

uint64_t sub_100013DB4(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 activity]);
  if (!sub_100013EA8(*(void *)(a1 + 32), v3))
  {
    id v4 = sub_100014610(3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 134218242;
      uint64_t v9 = v6;
      __int16 v10 = 2114;
      uint32_t v11 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%p no assertion following reconciliation triggering deactivation for %{public}@",  (uint8_t *)&v8,  0x16u);
    }

    [*(id *)(a1 + 40) removeActivity:v3 requester:0];
  }

  return 1LL;
}

uint64_t sub_100013EA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    id v4 = *(id *)(a1 + 160);
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = 0LL;
      int v8 = 0LL;
      uint64_t v9 = *(void *)v15;
      do
      {
        __int16 v10 = 0LL;
        uint32_t v11 = v8;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v4);
          }
          int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * (void)v10)]);

          id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v3]);
          if (v12) {
            ++v7;
          }
          __int16 v10 = (char *)v10 + 1;
          uint32_t v11 = v8;
        }

        while (v6 != v10);
        id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v6);
    }

    else
    {
      uint64_t v7 = 0LL;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

id sub_100014014(uint64_t a1)
{
  return [*(id *)(a1 + 32) coordinator:*(void *)(a1 + 40) activityListChanged:*(void *)(a1 + 48)];
}

id sub_100014024(uint64_t a1)
{
  return [*(id *)(a1 + 32) coordinator:*(void *)(a1 + 40) activatedAssertionForActivity:*(void *)(a1 + 48) withChangeMarker:*(void *)(a1 + 56)];
}

void sub_100014034(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000140AC;
  v3[3] = &unk_10001C8C8;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 48);
  [v1 coordinator:v2 queryAssertions:v3];
}

void sub_1000140AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(dispatch_queue_s **)(v4 + 32);
  }
  else {
    id v5 = 0LL;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100014154;
  v8[3] = &unk_10001CA58;
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

uint64_t sub_100014154(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_100014588(void *a1)
{
  if (a1)
  {
    id v1 = (id)objc_claimAutoreleasedReturnValue([a1 connection]);
    [v1 invalidate];
  }

id sub_100014610(int a1)
{
  if (qword_100022EC0 != -1) {
    dispatch_once(&qword_100022EC0, &stru_10001CAD0);
  }
  return (id)qword_100022E90[a1];
}

void sub_100014660(id a1)
{
  for (uint64_t i = 0LL; i != 6; ++i)
  {
    os_log_t v2 = os_log_create("com.apple.DeviceActivityConductor", (&off_10001CAA0)[i]);
    id v3 = (void *)qword_100022E90[i];
    qword_100022E90[i] = (uint64_t)v2;
  }

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}