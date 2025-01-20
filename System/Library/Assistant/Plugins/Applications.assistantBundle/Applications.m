void sub_5568(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  os_log_s *v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  v4 = *(void *)(a1 + 40);
  v5 = (os_log_s *)AFSiriLogContextPlugin;
  v6 = os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      v7 = objc_opt_class(*(void *)(a1 + 32));
      v8 = *(void *)(a1 + 32);
      v11 = 136315906;
      v12 = "-[AAPCommandLaunch performWithCompletion:serviceHelper:executionInfo:]_block_invoke";
      v13 = 2114;
      v14 = v7;
      v15 = 2048;
      v16 = v8;
      v17 = 2112;
      v18 = a2;
      _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_INFO,  "%s com.apple.siri.applications: <%{public}@:%p> sending response = %@",  (uint8_t *)&v11,  0x2Au);
      v4 = *(void *)(a1 + 40);
    }

    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  }

  else if (v6)
  {
    v9 = objc_opt_class(*(void *)(a1 + 32));
    v10 = *(void *)(a1 + 32);
    v11 = 136315906;
    v12 = "-[AAPCommandLaunch performWithCompletion:serviceHelper:executionInfo:]_block_invoke";
    v13 = 2114;
    v14 = v9;
    v15 = 2048;
    v16 = v10;
    v17 = 2112;
    v18 = a2;
    _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_INFO,  "%s com.apple.siri.applications: <%{public}@:%p> no completion block - dropping response = %@",  (uint8_t *)&v11,  0x2Au);
  }
}

  ;
}

void sub_56DC(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    id v5 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKey:", NSUnderlyingErrorKey);
    if (v5) {
      [v5 code];
    }
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_10CF4(a1, a3);
    }
    v6 = (Class *)&OBJC_CLASS___SACommandFailed_ptr;
  }

  else
  {
    v7 = (os_log_s *)AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = objc_opt_class(*(void *)(a1 + 32));
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      int v12 = 136315906;
      v13 = "-[AAPCommandLaunch performWithCompletion:serviceHelper:executionInfo:]_block_invoke";
      __int16 v14 = 2114;
      uint64_t v15 = v8;
      __int16 v16 = 2048;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_INFO,  "%s com.apple.siri.applications: <%{public}@:%p> launched app (%@)",  (uint8_t *)&v12,  0x2Au);
    }

    v6 = (Class *)&OBJC_CLASS___SACommandSucceeded_ptr;
  }

  id v11 = objc_alloc_init(*v6);
  (*(void (**)(void, id))(*(void *)(a1 + 56) + 16))( *(void *)(a1 + 56),  [v11 dictionary]);
}

  ;
}

  ;
}

void sub_61D0(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc_init(&OBJC_CLASS___SAAppsAppSearchResponse);
  [v4 setFoundApps:a2];
  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))( *(void *)(a1 + 32),  [v4 dictionary]);
}

void sub_6230(uint64_t a1, void *a2)
{
  id v4 = [a2 localizedName];
  id v5 = *(void **)(a1 + 32);
  uint64_t v11 = 0LL;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  id v6 = [v4 stringByReplacingOccurrencesOfString:@" " withString:@" "];
  if ([v6 localizedStandardContainsString:v5]
    && (id v7 = [v5 length], v7 == objc_msgSend(v6, "length")))
  {
    *((_BYTE *)v12 + 24) = 1;
    _Block_object_dispose(&v11, 8);
  }

  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_63D8;
    v10[3] = &unk_1C6C8;
    v10[4] = v5;
    v10[5] = &v11;
    objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, objc_msgSend(v6, "length"), 3, v10);
    int v8 = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);
    if (!v8) {
      return;
    }
  }

  id v9 = objc_alloc_init(&OBJC_CLASS___SASyncNamedAppIdentifyingInfo);
  objc_msgSend(v9, "setBundleId:", objc_msgSend(a2, "bundleIdentifier"));
  [v9 setLocalizedBundleDisplayName:v4];
  objc_msgSend(v9, "setVersion:", objc_msgSend(a2, "shortVersionString"));
  objc_msgSend(v9, "setBuildNumber:", objc_msgSend(a2, "bundleVersion"));
  [*(id *)(a1 + 40) addObject:v9];
}

void sub_63C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_63D8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  id result = [a2 localizedStandardContainsString:*(void *)(a1 + 32)];
  if ((_DWORD)result)
  {
    id v11 = [*(id *)(a1 + 32) length];
    id result = [a2 length];
    if (v11 == result)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      *a7 = 1;
    }
  }

  return result;
}

id sub_681C(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(a2, "bundleIdentifier"));
}

void sub_68FC(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init(&OBJC_CLASS___AAPSyncStatePersistence);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = a1 + 32;
  *(void *)(v5 + 16) = v3;
  id v6 = [*(id *)(*(void *)v4 + 16) load];
  id v7 = (os_log_s *)AFSiriLogContextPlugin;
  if (v6)
  {
    int v8 = v6;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_10E68(v8, v7);
    }
  }

  else if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG))
  {
    sub_10DF0(v4);
  }

  objc_autoreleasePoolPop(v2);
}

LABEL_42:
    int v12 = 0LL;
    v60 = 1LL;
    goto LABEL_43;
  }

  v28 = (os_log_s *)AFSiriLogContextPlugin;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
    sub_110B8(v28, v29, v30, v31, v32, v33, v34, v35);
  }
  v36 = (int *)[a6 version];
  v37 = (os_log_s *)AFSiriLogContextPlugin;
  v38 = os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG);
  if (v36 != &dword_4)
  {
    if (v38) {
      sub_11018(a6, v37);
    }
    goto LABEL_42;
  }

  if (v38) {
    sub_10FA8(v37, v39, v40, v41, v42, v43, v44, v45);
  }
  v46 = [a6 keyAnchor];
  v47 = [v46 isNewerThanAnchor:v25];
  if (!v25 || (v47 & 1) != 0)
  {
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
      sub_10F34();
    }
    goto LABEL_42;
  }

  v48 = [a6 startAnchor];
  v49 = [v12 isOlderThanAnchor:v48];
  v50 = [v12 isNewerThanAnchor:v25];
  v51 = v50;
  if (v12) {
    v52 = v50;
  }
  else {
    v52 = 0;
  }
  if (v48) {
    v53 = 1;
  }
  else {
    v53 = v52;
  }
  v54 = (os_log_s *)AFSiriLogContextPlugin;
  v55 = os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG);
  if (v53 == 1 && ((v49 | v51) & 1) != 0)
  {
    if (v55)
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = "+[AAPSyncHandler _checkIfResetIsNeededForKey:withStartAnchorString:validity:lastState:completion:]";
      v65 = 2114;
      v66 = v48;
      v67 = 2114;
      v68 = v12;
      v69 = 2114;
      v70 = v46;
      v71 = 2114;
      v72 = v25;
      v56 = "%s com.apple.siri.applications: startAnchor check failed: lastStart=%{public}@ start=%{public}@ lastKey=%{pu"
            "blic}@ key=%{public}@";
      v57 = v54;
      v58 = 52;
LABEL_47:
      _os_log_debug_impl(&dword_0, v57, OS_LOG_TYPE_DEBUG, v56, buf, v58);
      goto LABEL_42;
    }

    goto LABEL_42;
  }

  if (v55)
  {
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = "+[AAPSyncHandler _checkIfResetIsNeededForKey:withStartAnchorString:validity:lastState:completion:]";
    v65 = 2114;
    v66 = v48;
    v67 = 2114;
    v68 = v12;
    v69 = 2114;
    v70 = v46;
    v71 = 2114;
    v72 = v25;
    _os_log_debug_impl( &dword_0,  v54,  OS_LOG_TYPE_DEBUG,  "%s com.apple.siri.applications: startAnchor checks out:  lastStart=%{public}@ start=%{public}@ lastKey=%{public}@ key=%{public}@",  buf,  0x34u);
  }

  v60 = 0LL;
LABEL_43:
  (*((void (**)(id, uint64_t, id, id, id))a7 + 2))(a7, v60, v12, v25, v16);
}

void sub_6F74( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_6F8C(uint64_t a1, uint64_t a2)
{
}

void sub_6F9C(uint64_t a1)
{
}

id sub_6FA8(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) state];
  v3 = (void *)objc_opt_class(*(void *)(a1 + 32));
  id v4 = objc_msgSend(objc_msgSend(v2, "startAnchor"), "stringRepresentation");
  id v5 = [v2 validity];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_706C;
  v8[3] = &unk_1C748;
  uint64_t v6 = *(void *)(a1 + 40);
  v8[4] = v2;
  v8[5] = v6;
  return [v3 _checkIfResetIsNeededForKey:@"com.apple.siri.applications" withStartAnchorString:v4 validity:v5 lastState:v2 completion:v8];
}

void *sub_706C(void *result, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    id v5 = result;
    if (a2) {
      id v6 = +[AAPSyncMetaDataSource projectedStateForKeyAnchor:withValidity:]( &OBJC_CLASS___AAPSyncMetaDataSource,  "projectedStateForKeyAnchor:withValidity:",  a4,  a5);
    }
    else {
      id v6 = (id)result[4];
    }
    *(void *)(*(void *)(v5[5] + 8LL) + 40LL) = objc_alloc_init(&OBJC_CLASS___AFSyncSnapshot);
    [*(id *)(*(void *)(v5[5] + 8) + 40) setKey:@"com.apple.siri.applications"];
    objc_msgSend( *(id *)(*(void *)(v5[5] + 8) + 40),  "setAnchor:",  objc_msgSend(objc_msgSend(v6, "stopAnchor"), "stringRepresentation"));
    objc_msgSend(*(id *)(*(void *)(v5[5] + 8) + 40), "setValidity:", objc_msgSend(v6, "validity"));
    return _objc_msgSend( *(id *)(*(void *)(v5[5] + 8) + 40),  "setCount:",  objc_msgSend(objc_msgSend(v6, "apps"), "count"));
  }

  return result;
}

id sub_71B4(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) state];
  v3 = (void *)objc_opt_class(*(void *)(a1 + 32));
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_7240;
  v8[3] = &unk_1C798;
  uint64_t v6 = *(void *)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  __int128 v9 = *(_OWORD *)(a1 + 64);
  id v10 = v2;
  return [v3 _checkIfResetIsNeededForKey:v6 withStartAnchorString:v4 validity:v5 lastState:v2 completion:v8];
}

void sub_7240(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  uint64_t v7 = a1 + 32;
  *(void *)(*(void *)(a1 + 32) + 24LL) = 0LL;
  if (!a4 || !a5)
  {
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_11364();
    }
    goto LABEL_18;
  }

  if (a2)
  {
    __int128 v9 = (os_log_s *)AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v27 = 136315650;
      *(void *)&v27[4] = "-[AAPSyncHandler beginSyncWithAnchor:validity:count:forKey:beginInfo:configuration:]_block_invoke_2";
      *(_WORD *)&v27[12] = 2114;
      *(void *)&v27[14] = a4;
      *(_WORD *)&v27[22] = 2114;
      id v28 = a5;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_INFO,  "%s com.apple.siri.applications: resetting for new key = %{public}@ with validity = '%{public}@'",  v27,  0x20u);
    }

    [*(id *)(a1 + 40) resetWithValidity:a5];
    id v10 = objc_alloc(&OBJC_CLASS___AAPSyncMetaDataSource);
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = 0LL;
    char v14 = 0LL;
    goto LABEL_17;
  }

  if (!objc_msgSend(a4, "isEqualToAnchor:", objc_msgSend(*(id *)(a1 + 56), "keyAnchor")))
  {
    __int16 v18 = (os_log_s *)AFSiriLogContextPlugin;
    if (!os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
    {
LABEL_16:
      id v10 = objc_alloc(&OBJC_CLASS___AAPSyncMetaDataSource);
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v12 = *(void *)(a1 + 32);
      char v14 = a3;
LABEL_17:
      *(void *)(*(void *)(a1 + 32) + 24LL) = -[AAPSyncMetaDataSource initWithLastState:startAnchor:keyAnchor:validity:configuration:observer:]( v10,  "initWithLastState:startAnchor:keyAnchor:validity:configuration:observer:",  v13,  v14,  a4,  a5,  v11,  v12,  *(_OWORD *)v27,  *(void *)&v27[16],  v28,  *(_OWORD *)v29,  *(void *)&v29[16]);
LABEL_18:
      v21 = *(void **)(*(void *)v7 + 32LL);
      if (v21)
      {
        v22 = (os_log_s *)AFSiriLogContextPlugin;
        if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v27 = 136315394;
          *(void *)&v27[4] = "-[AAPSyncHandler beginSyncWithAnchor:validity:count:forKey:beginInfo:configuration:]_block_invoke";
          *(_WORD *)&v27[12] = 2048;
          *(void *)&v27[14] = v21;
          _os_log_debug_impl( &dword_0,  v22,  OS_LOG_TYPE_DEBUG,  "%s com.apple.siri.applications: releasing old processor -> %p",  v27,  0x16u);
          v21 = *(void **)(*(void *)v7 + 32LL);
        }
      }

      goto LABEL_22;
    }

    id v19 = [*(id *)(a1 + 56) keyAnchor];
    *(_DWORD *)v27 = 136316162;
    *(void *)&v27[4] = "-[AAPSyncHandler beginSyncWithAnchor:validity:count:forKey:beginInfo:configuration:]_block_invoke";
    *(_WORD *)&v27[12] = 2114;
    *(void *)&v27[14] = a5;
    *(_WORD *)&v27[22] = 2114;
    id v28 = a3;
    *(_WORD *)v29 = 2114;
    *(void *)&v29[2] = v19;
    *(_WORD *)&v29[10] = 2114;
    *(void *)&v29[12] = a4;
    v20 = "%s com.apple.siri.applications: reconciling changes with validity = '%{public}@' : start=%{public}@ lastKey=%{"
          "public}@ key=%{public}@";
LABEL_15:
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, v20, v27, 0x34u);
    goto LABEL_16;
  }

  if (!*(void *)(*(void *)v7 + 32LL))
  {
    unsigned int v23 = objc_msgSend(a3, "isEqualToAnchor:", objc_msgSend(*(id *)(a1 + 56), "stopAnchor"));
    __int16 v18 = (os_log_s *)AFSiriLogContextPlugin;
    BOOL v24 = os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO);
    if (v23)
    {
      if (v24)
      {
        id v25 = [*(id *)(a1 + 56) stopAnchor];
        *(_DWORD *)v27 = 136315906;
        *(void *)&v27[4] = "-[AAPSyncHandler beginSyncWithAnchor:validity:count:forKey:beginInfo:configuration:]_block_invoke";
        *(_WORD *)&v27[12] = 2114;
        *(void *)&v27[14] = a4;
        *(_WORD *)&v27[22] = 2114;
        id v28 = v25;
        *(_WORD *)v29 = 2114;
        *(void *)&v29[2] = a5;
        _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_INFO,  "%s com.apple.siri.applications: up-to-date for key = %{public}@ (%{public}@) with validity = '%{public}@'",  v27,  0x2Au);
      }

      goto LABEL_18;
    }

    if (!v24) {
      goto LABEL_16;
    }
    id v26 = [*(id *)(a1 + 56) keyAnchor];
    *(_DWORD *)v27 = 136316162;
    *(void *)&v27[4] = "-[AAPSyncHandler beginSyncWithAnchor:validity:count:forKey:beginInfo:configuration:]_block_invoke";
    *(_WORD *)&v27[12] = 2114;
    *(void *)&v27[14] = a5;
    *(_WORD *)&v27[22] = 2114;
    id v28 = a3;
    *(_WORD *)v29 = 2114;
    *(void *)&v29[2] = v26;
    *(_WORD *)&v29[10] = 2114;
    *(void *)&v29[12] = a4;
    v20 = "%s com.apple.siri.applications: looking up changes not in saved state with validity = '%{public}@' : start=%{p"
          "ublic}@ lastKey=%{public}@ key=%{public}@";
    goto LABEL_15;
  }

  __int16 v16 = (os_log_s *)AFSiriLogContextPlugin;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
  {
    id v17 = [*(id *)(a1 + 56) stopAnchor];
    *(_DWORD *)v27 = 136315906;
    *(void *)&v27[4] = "-[AAPSyncHandler beginSyncWithAnchor:validity:count:forKey:beginInfo:configuration:]_block_invoke";
    *(_WORD *)&v27[12] = 2114;
    *(void *)&v27[14] = a4;
    *(_WORD *)&v27[22] = 2114;
    id v28 = v17;
    *(_WORD *)v29 = 2114;
    *(void *)&v29[2] = a5;
    _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "%s com.apple.siri.applications: reusing previous processor for key = %{public}@ (%{public}@) with validity = '%{public}@'",  v27,  0x2Au);
  }

LABEL_22:
  if (*(void *)(*(void *)v7 + 24LL))
  {
    *(void *)(*(void *)v7 + 32LL) = -[AAPSyncMetaDataProcessor initWithSource:]( objc_alloc(&OBJC_CLASS___AAPSyncMetaDataProcessor),  "initWithSource:",  *(void *)(*(void *)v7 + 24LL));
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
      sub_112DC();
    }
  }

void sub_78D8(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  uint64_t v1 = *(void *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v3 == *(void **)(v1 + 24))
  {
    id v12 = [v3 state];
    if (v12
      && (id v13 = v12,
          (objc_msgSend(v12, "isEqual:", objc_msgSend(*(id *)(*(void *)v2 + 16), "state")) & 1) == 0))
    {
      id v22 = [*(id *)(*(void *)v2 + 16) save:v13];
      unsigned int v23 = (os_log_s *)AFSiriLogContextPlugin;
      if (v22)
      {
        uint64_t v24 = (uint64_t)v22;
        if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
          sub_115A4(v24, v23, v25, v26, v27, v28, v29, v30);
        }
      }

      else if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG))
      {
        sub_1152C(v2);
      }
    }

    else
    {
      char v14 = (os_log_s *)AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
        sub_114BC(v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
  }

  else
  {
    uint64_t v4 = (os_log_s *)AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
      sub_1161C(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }

void sub_79EC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_7A04( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_7A30(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_7A3C( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_7A6C(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

id sub_7A78(uint64_t a1)
{
  return [*(id *)(*(void *)a1 + 16) state];
}

void sub_7A88( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_7B40(id *a1)
{
  uint64_t v1 = a1;
  [a1[4] waitUntilReady];
  id v2 = objc_msgSend(objc_msgSend(v1[4], "metaData"), "copy");
  v3 = v1[5];
  v1 += 5;
  v3[2] = v2;
  *((void *)*v1 + 3) = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(*v1, "_queue_updateCache");
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
    sub_1168C();
  }
}

id sub_7C74(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_queue_processNextChange:afterAnchor:withInitialAnchor:",  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 48));
}

LABEL_23:
  v53 = (os_log_s *)AFSiriLogContextPlugin;
  v54 = os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG);
  if (a4 == a5)
  {
    if (v54) {
      sub_11700((uint64_t)a4, v53, v55, v56, v57, v58, v59, v60);
    }
  }

  else if (v54)
  {
    sub_11778();
  }

  [a3 setObject:0];
  objc_msgSend(a3, "setPostAnchor:", objc_msgSend(a4, "stringRepresentation"));
LABEL_42:
  -[NSAutoreleasePool drain](v9, "drain");
}

id sub_819C(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v3 = [*(id *)(a1 + 32) scrapeAppInfo];
  [*(id *)(*(void *)(a1 + 40) + 56) lock];
  uint64_t v4 = *(void *)(a1 + 40);
  unint64_t v5 = *(void *)(a1 + 56);
  if (*(void *)(v4 + 40) > v5 || v5 >= *(void *)(v4 + 48))
  {
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
      sub_11B30();
    }
  }

  else
  {
    uint64_t v6 = (os_log_s *)AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      int v9 = 136315394;
      uint64_t v10 = "-[AAPSyncMetaDataProcessor _queue_updateCache]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_debug_impl( &dword_0,  v6,  OS_LOG_TYPE_DEBUG,  "%s com.apple.siri.applications: finished cache update for appId='%@'",  (uint8_t *)&v9,  0x16u);
      uint64_t v4 = *(void *)(a1 + 40);
    }

    [*(id *)(v4 + 32) setObject:v3 forKey:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 40) + 56) signal];
  }

  [*(id *)(*(void *)(a1 + 40) + 56) unlock];
  return -[NSAutoreleasePool drain](v2, "drain");
}

void sub_8314( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

id sub_860C(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  *(void *)(*(void *)(a1 + 32) + 16) = [(id)objc_opt_class(*(void *)(a1 + 32)) _createSourceInfoForLastState:*(void *)(a1 + 40) startAnchor:*(void *)(a1 + 48) keyAnchor:*(void *)(a1 + 56) validity:*(void *)(a1 + 64) configuration:*(void *)(a1 + 72)];
  *(void *)(*(void *)(a1 + 32) + 8LL) = v3;
  [*(id *)(a1 + 80) sourceIsReady:*(void *)(a1 + 32)];
  uint64_t v4 = (os_log_s *)AFSiriLogContextPlugin;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
    sub_11BA0(v4);
  }
  return -[NSAutoreleasePool drain](v2, "drain");
}

void sub_8EFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_8F74(uint64_t a1, uint64_t a2)
{
}

void sub_8F84(uint64_t a1)
{
}

void sub_8F90(uint64_t a1, void *a2)
{
  id v4 = [a2 bundleIdentifier];
  id v5 = +[AAPSyncPrimitiveAnchor anchorFromIndex:]( AAPSyncPrimitiveAnchor,  "anchorFromIndex:",  [a2 sequenceNumber]);
  [*(id *)(a1 + 32) removeObject:v4];
  [*(id *)(a1 + 40) addObject:v4];
  uint64_t v6 = -[AAPSyncMetaDataItemUpdate initWithAppId:appProxy:anchor:configuration:]( objc_alloc(&OBJC_CLASS___AAPSyncMetaDataItemUpdate),  "initWithAppId:appProxy:anchor:configuration:",  v4,  a2,  v5,  *(void *)(a1 + 48));
  [*(id *)(a1 + 56) addObject:v6];

  unsigned int v7 = [v5 isNewerThanAnchor:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  uint64_t v8 = (os_log_s *)AFSiriLogContextPlugin;
  if (v7)
  {
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
      int v10 = 136315650;
      __int16 v11 = "+[AAPSyncMetaDataSource _createSourceInfoForLastState:startAnchor:keyAnchor:validity:configuration:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v6;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_INFO,  "%s com.apple.siri.applications: gathered metaDataItem=%@ - adjusting for an anchor newer than the key (%{public}@)",  (uint8_t *)&v10,  0x20u);
    }

    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = v5;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 1;
  }

  else if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG))
  {
    sub_11D6C();
  }

int64_t sub_9140(id a1, id a2, id a3)
{
  return (int64_t)objc_msgSend(objc_msgSend(a2, "anchor"), "compare:", objc_msgSend(a3, "anchor"));
}

NSURL *AAPSyncInfoIdentifierForAppId(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___NSURLComponents);
  -[NSURLComponents setScheme:](v2, "setScheme:", @"x-apple-siri-app");
  -[NSURLComponents setHost:](v2, "setHost:", a1);
  uint64_t v3 = -[NSURLComponents URL](v2, "URL");

  return v3;
}

id AAPSyncInfoIsValidForItem(void *a1, void *a2)
{
  id v4 = [a1 identifier];
  if (!v4) {
    return 0LL;
  }
  id v5 = v4;
  if (!objc_msgSend(objc_msgSend(v4, "scheme"), "isEqualToString:", @"x-apple-siri-app")
    || !objc_msgSend(objc_msgSend(v5, "host"), "length"))
  {
    return 0LL;
  }

  if ([a2 isMetaDataItemUpdate])
  {
    id v6 = objc_msgSend(objc_msgSend(a1, "appIdentifyingInfo"), "bundleId");
    if (v6)
    {
      unsigned int v7 = v6;
      if ([v6 length])
      {
      }
    }

    return 0LL;
  }

  return [a2 isMetaDataItemDelete];
}

id _AAPSyncInfoHasSomeName(void *a1)
{
  if (objc_msgSend(objc_msgSend(a1, "displayAppName"), "length")) {
    return &dword_0 + 1;
  }
  if (objc_msgSend(objc_msgSend(a1, "appName"), "length")) {
    return &dword_0 + 1;
  }
  if (objc_msgSend(objc_msgSend(a1, "spotlightName"), "length")) {
    return &dword_0 + 1;
  }
  id v2 = [a1 displayAppNameMap];
  id v3 = [a1 appNameMap];
  id v5 = [a1 spotlightNameMap];
  return sub_9330((uint64_t)v5, v5);
}

id sub_9330(uint64_t a1, void *a2)
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = objc_msgSend(a2, "allValues", 0);
  id result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    id v4 = result;
    uint64_t v5 = *(void *)v8;
    while (2)
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) length]) {
          return &dword_0 + 1;
        }
        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      id v4 = result;
      if (result) {
        continue;
      }
      break;
    }
  }

  return result;
}

LABEL_16:
  _Block_object_dispose(&v27, 8);
  return v10;
}

void sub_A078( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

void sub_A0A8(uint64_t a1, uint64_t a2)
{
}

void sub_A0B8(uint64_t a1)
{
}

void sub_A0C4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2)
  {
    __int128 v10 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  a2,  &a9);
    __int16 v11 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    if (!v11)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  1LL);
      __int16 v11 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    }

    [v11 addObject:v10];
  }

uint64_t sub_A1D8(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 48);
  uint64_t result = v3[3];
  if (result) {
    return ((uint64_t (*)(id, void, uint64_t))v3[3])( [*(id *)(a1 + 32) objectForKey:*v3],  *(void *)(a1 + 40),  a2);
  }
  return result;
}

NSString *sub_A238(uint64_t a1)
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"key=%@",  **(void **)(a1 + 32));
}

LABEL_28:
        CFRelease(v25);
        goto LABEL_29;
      }

      uint64_t v24 = (os_log_s *)AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v30 = self->_appId;
        v31 = (const __CFString *)[v39 domain];
        v32 = [v39 code];
        *(_DWORD *)buf = 136316418;
        v41 = "-[AAPSyncMetaDataItemUpdate valuesForEntries:inPlistAtURL:]";
        v42 = 2112;
        v43 = a4;
        v44 = 2112;
        v45 = v30;
        v46 = 2114;
        v47 = v31;
        v48 = 2048;
        v49 = (CFIndex)v32;
        v50 = 2112;
        v51 = (CFErrorRef)v39;
        _os_log_debug_impl( &dword_0,  v24,  OS_LOG_TYPE_DEBUG,  "%s com.apple.siri.applications: could not load plist file at url='%@' (%@) -> {%{public}@:%li}%@",  buf,  0x3Eu);
      }
    }

    __int16 v14 = 0LL;
LABEL_30:

    return v14;
  }

  uint64_t v17 = (os_log_s *)AFSiriLogContextPlugin;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
    sub_11F34((uint64_t)self, v17, v18, v19, v20, v21, v22, v23);
  }
  __int16 v14 = 0LL;
  return v14;
}

    __int128 v9 = (objc_class **)&OBJC_CLASS___SACommandFailed_ptr;
LABEL_29:
    __int16 v11 = *v9;
    goto LABEL_30;
  }

  __int128 v10 = (os_log_s *)AFSiriLogContextPlugin;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
    sub_12440((uint64_t)self, v10);
  }
  __int16 v11 = &OBJC_CLASS___SACommandFailed;
LABEL_30:
  v35 = objc_alloc_init(v11);
  v36 = [v35 dictionary];
  v39((uint64_t)v38, (uint64_t)v36);
}

void sub_B320(id a1, SAAppInfo *a2, SEL a3, id a4)
{
  if (a4)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSObject);
    if ((objc_opt_isKindOfClass(a4, v7) & 1) == 0) {
      -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[AAPSyncMetaDataItemUpdate scrapeAppInfo]_block_invoke"),  @"AAPSyncMetaDataItemUpdate.m",  351LL,  @"v is not an object");
    }
    objc_msgSend(a2, a3, a4);
  }

void sub_B3C4(id a1, SAAppInfo *a2, SEL a3, NSNumber *a4)
{
  if (a4)
  {
    if ((objc_opt_respondsToSelector(a4, "BOOLValue") & 1) == 0) {
      -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[AAPSyncMetaDataItemUpdate scrapeAppInfo]_block_invoke"),  @"AAPSyncMetaDataItemUpdate.m",  357LL,  @"v does not respond to BOOLValue");
    }
    objc_msgSend(a2, a3, -[NSNumber BOOLValue](a4, "BOOLValue"));
  }

id sub_B468(uint64_t a1)
{
  return _objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "lastPathComponent"), "stringByDeletingPathExtension");
}

void *sub_B480(uint64_t a1)
{
  else {
    return 0LL;
  }
}

id sub_B4AC(uint64_t a1)
{
  return +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  objc_msgSend( -[INAppInfo supportedIntents]( +[INAppInfo appInfoWithAppProxy:]( INAppInfo,  "appInfoWithAppProxy:",  *(void *)(*(void *)(a1 + 32) + 16)),  "supportedIntents"),  "count") != 0);
}

uint64_t sub_B4F8(void *a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(void, void, void, void, void, uint64_t))(a1[8] + 16LL);
  if (v2) {
    return v2(a1[4], a1[5], a1[6], a1[7], a1[9], a2);
  }
  else {
    return 0LL;
  }
}

NSString *sub_B524(uint64_t a1)
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"aggregateSetter=%s",  sel_getName(**(SEL **)(a1 + 32)));
}

void sub_B5F4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void *AAPPlistBoolParser(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (!a1) {
      return 0LL;
    }
  }

  else
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSNumber *AAPPlistBoolParser(id, NSDictionary *, AAPParserErrorLogger)"),  @"AAPParser.m",  31LL,  @"Invalid parameter not satisfying: %@",  @"errorLogger");
    if (!a1) {
      return 0LL;
    }
  }

  if ((objc_opt_respondsToSelector(a1, "BOOLValue") & 1) == 0)
  {
    (*(void (**)(uint64_t, const __CFString *))(a3 + 16))( a3,  @"input does not respond to BOOLValue -> %@");
    return 0LL;
  }

  else {
    return &__kCFBooleanFalse;
  }
}

uint64_t AAPPlistStringParser(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1;
  if (a3)
  {
    if (!a1) {
      return v4;
    }
  }

  else
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *AAPPlistStringParser(id, NSDictionary *, AAPParserErrorLogger)"),  @"AAPParser.m",  63LL,  @"Invalid parameter not satisfying: %@",  @"errorLogger");
    if (!v4) {
      return v4;
    }
  }

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"input is not a NSString -> %@");
    return 0LL;
  }

  return v4;
}

id AAPPlistStringFromNumberParser(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (!a1) {
      return _[a1 stringValue];
    }
  }

  else
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *AAPPlistStringFromNumberParser(id, NSDictionary *, AAPParserErrorLogger)"),  @"AAPParser.m",  77LL,  @"Invalid parameter not satisfying: %@",  @"errorLogger");
    if (!a1) {
      return _[a1 stringValue];
    }
  }

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(a1, v5) & 1) != 0) {
    return _[a1 stringValue];
  }
  (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"input is not a NSNumber -> %@");
  return 0LL;
}

NSMutableArray *AAPAlternativeAppNamesParser(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSArray<SASpeakablePhrase *> *AAPAlternativeAppNamesParser(id, NSDictionary *, AAPParserErrorLogger)"),  @"AAPParser.m",  94LL,  @"Invalid parameter not satisfying: %@",  @"errorLogger");
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(a1, v5) & 1) == 0)
  {
    if (a1) {
      (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"altNameInfos is not a NSArray -> %@");
    }
    goto LABEL_26;
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v6 = [a1 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v6)
  {
LABEL_26:
    __int128 v8 = 0LL;
    return v8;
  }

  id v7 = v6;
  __int128 v8 = 0LL;
  uint64_t v9 = *(void *)v24;
  uint64_t v10 = _INAlternativeAppNameKey;
  uint64_t v21 = _INAlternativeAppNamePronunciationHintKey;
  do
  {
    for (i = 0LL; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v24 != v9) {
        objc_enumerationMutation(a1);
      }
      __int16 v12 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
      {
        id v14 = [v12 objectForKey:v10];
        uint64_t v16 = (void *)AAPPlistStringParser((uint64_t)v14, v15, a3);
        if ([v16 length])
        {
          id v22 = objc_alloc_init(&OBJC_CLASS___SASpeakablePhrase);
          [v22 setPhrase:v16];
          id v17 = [v12 objectForKey:v21];
          uint64_t v19 = (void *)AAPPlistStringParser((uint64_t)v17, v18, a3);
          if ([v19 length])
          {
            [v22 setPronunciation:v19];
          }

          else if (v19)
          {
            (*(void (**)(uint64_t, const __CFString *))(a3 + 16))( a3,  @"pronunciation of altNameInfo in list was not a valid string -> %@");
          }

          if (v8) {
            -[NSMutableArray addObject:](v8, "addObject:", v22);
          }
          else {
            __int128 v8 = -[NSMutableArray initWithObjects:count:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithObjects:count:",  &v22,  1LL);
          }
        }

        else
        {
          (*(void (**)(uint64_t, const __CFString *))(a3 + 16))( a3,  @"phrase of altNameInfo in list was not a valid string -> %@");
        }
      }

      else
      {
        (*(void (**)(uint64_t, const __CFString *))(a3 + 16))( a3,  @"altNameInfo in list is not a NSDictionary -> %@");
      }
    }

    id v7 = [a1 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }

  while (v7);
  return v8;
}

NSMutableArray *AAPPlistURLTypesSchemesParser(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSArray<NSString *> *AAPPlistURLTypesSchemesParser(id, NSDictionary *, AAPParserErrorLogger)"),  @"AAPParser.m",  139LL,  @"Invalid parameter not satisfying: %@",  @"errorLogger");
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(a1, v5) & 1) == 0)
  {
    if (a1) {
      (*(void (**)(uint64_t, const __CFString *))(a3 + 16))(a3, @"urlTypes is not a NSArray -> %@");
    }
    goto LABEL_32;
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v22 = [a1 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (!v22)
  {
LABEL_32:
    id v6 = 0LL;
    return v6;
  }

  id v6 = 0LL;
  uint64_t v21 = *(void *)v29;
  uint64_t v20 = _kCFBundleURLSchemesKey;
  do
  {
    uint64_t v7 = 0LL;
    do
    {
      if (*(void *)v29 != v21) {
        objc_enumerationMutation(a1);
      }
      __int128 v8 = *(void **)(*((void *)&v28 + 1) + 8 * v7);
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      uint64_t v23 = v7;
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        id v10 = [v8 objectForKey:v20];
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSArray);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          id v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v25;
            do
            {
              for (i = 0LL; i != v13; i = (char *)i + 1)
              {
                if (*(void *)v25 != v14) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v16 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
                uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
                if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
                {
                  if (!v6) {
                    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
                  }
                  -[NSMutableArray addObject:](v6, "addObject:", v16, v19);
                }

                else
                {
                  id v19 = v16;
                  (*(void (**)(uint64_t, const __CFString *))(a3 + 16))( a3,  @"scheme of urlType in list encountered a non-string entry during parsing -> %@");
                }
              }

              id v13 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }

            while (v13);
          }
        }

        else if (v10)
        {
          id v19 = v10;
          (*(void (**)(uint64_t, const __CFString *))(a3 + 16))( a3,  @"schemes of urlType in list is not a NSArray -> %@");
        }
      }

      else
      {
        id v19 = v8;
        (*(void (**)(uint64_t, const __CFString *))(a3 + 16))( a3,  @"urlType in list is not a NSDictionary -> %@");
      }

      uint64_t v7 = v23 + 1;
    }

    while ((id)(v23 + 1) != v22);
    id v22 = [a1 countByEnumeratingWithState:&v28 objects:v33 count:16];
  }

  while (v22);
  return v6;
}

id AAPAggregateSyncIdentityParser(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a6) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "SASyncAppIdentifyingInfo *AAPAggregateSyncIdentityParser(NSDictionary *, NSDictionary *, NSDictionary *, NSDicti onary *, CFBundleRef, AAPParserErrorLogger)"),  @"AAPParser.m",  385LL,  @"Invalid parameter not satisfying: %@",  @"errorLogger");
  }
  id v8 = [a1 objectForKey:kCFBundleIdentifierKey];
  uint64_t v10 = AAPPlistStringParser((uint64_t)v8, v9, a6);
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = objc_alloc_init(&OBJC_CLASS___SASyncAppIdentifyingInfo);
    [v12 setBundleId:v11];
    id v13 = [a1 objectForKey:_kCFBundleShortVersionStringKey];
    objc_msgSend(v12, "setVersion:", AAPPlistStringParser((uint64_t)v13, v14, a6));
    id v15 = [a1 objectForKey:kCFBundleVersionKey];
    objc_msgSend(v12, "setBuildNumber:", AAPPlistStringParser((uint64_t)v15, v16, a6));
    [v12 setClientIdentifier:AFApplicationClientIdentifierForApp(v11)];
  }

  else
  {
    (*(void (**)(uint64_t, const __CFString *))(a6 + 16))(a6, @"bundleIdentifier not found");
    id v12 = 0LL;
  }

  return v12;
}

void *AAPUniversalSearchParser(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v7 = [a4 valueForKey:@"com.apple.smoot.subscriptionservice"];
  return AAPPlistBoolParser(v7, v8, a6);
}

id AAPAlternativeAppNamesMapParser(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, __CFBundle *a5, uint64_t a6)
{
  if (!a6) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSDictionary<NSString *,NSArray<SASpeakablePhrase *> *> *AAPAlternativeAppNamesMapParser(NSDictionary *, NSDicti onary *, NSDictionary *, NSDictionary *, CFBundleRef, AAPParserErrorLogger)"),  @"AAPParser.m",  460LL,  @"Invalid parameter not satisfying: %@",  @"errorLogger");
  }
  id v8 = [a1 objectForKey:_INAlternativeAppNamesKey];
  id result = [v8 count];
  id v47 = result;
  if (!result) {
    return result;
  }
  CanonicalLocaleIdentifierFromString = (__CFString *)CFLocaleCreateCanonicalLocaleIdentifierFromString( 0LL,  @"Base");
  if (!CanonicalLocaleIdentifierFromString) {
    CanonicalLocaleIdentifierFromString = @"Base";
  }
  uint64_t v11 = &_s2os6LoggerV9logObjectSo03OS_a1_C0Cvg_ptr;
  v45 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  CFArrayRef v12 = CFBundleCopyBundleLocalizations(a5);
  if (v12)
  {
    CFArrayRef v13 = v12;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    id v14 = -[__CFArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v58,  v64,  16LL);
    if (v14)
    {
      id v15 = v14;
      v44 = 0LL;
      uint64_t v16 = *(void *)v59;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v59 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(__CFString **)(*((void *)&v58 + 1) + 8LL * (void)i);
          id v19 = (__CFString *)CFLocaleCreateCanonicalLocaleIdentifierFromString(0LL, v18);
          if (!v19) {
            id v19 = v18;
          }
          if (-[__CFString isEqualToString:]( v19,  "isEqualToString:",  CanonicalLocaleIdentifierFromString))
          {
            if (v44) {
              (*(void (**)(uint64_t, const __CFString *))(a6 + 16))( a6,  @"more than one localization matching %@ : first=%@ new=%@");
            }
            else {
              v44 = v18;
            }
          }

          else
          {
            -[NSMutableDictionary setObject:forKey:](v45, "setObject:forKey:", v19, v18);
          }
        }

        id v15 = -[__CFArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v58,  v64,  16LL);
      }

      while (v15);
      CFRelease(v13);
      uint64_t v11 = &_s2os6LoggerV9logObjectSo03OS_a1_C0Cvg_ptr;
      if (v44)
      {
        uint64_t v20 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v47);
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        id v21 = [v8 countByEnumeratingWithState:&v54 objects:v63 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = CanonicalLocaleIdentifierFromString;
          uint64_t v24 = *(void *)v55;
          do
          {
            for (j = 0LL; j != v22; j = (char *)j + 1)
            {
              if (*(void *)v55 != v24) {
                objc_enumerationMutation(v8);
              }
              __int128 v26 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)j);
              id v27 = sub_D068((uint64_t)a5, v26, 0LL, (uint64_t)v44);
              __int128 v28 = v27;
              if (v27) {
                id v29 = v27;
              }
              else {
                id v29 = v26;
              }
              -[NSMutableArray addObject:](v20, "addObject:", v29);
            }

            id v22 = [v8 countByEnumeratingWithState:&v54 objects:v63 count:16];
          }

          while (v22);
          CanonicalLocaleIdentifierFromString = v23;
          uint64_t v11 = &_s2os6LoggerV9logObjectSo03OS_a1_C0Cvg_ptr;
        }

        goto LABEL_35;
      }
    }

    else
    {
      CFRelease(v13);
    }
  }

  uint64_t v20 = (NSMutableArray *)[v8 copy];
  v44 = 0LL;
LABEL_35:
  if (v47 != -[NSMutableArray count](v20, "count")) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSDictionary<NSString *,NSArray<SASpeakablePhrase *> *> *AAPAlternativeAppNamesMapParser(NSDictionary *, NSDicti onary *, NSDictionary *, NSDictionary *, CFBundleRef, AAPParserErrorLogger)"),  @"AAPParser.m",  498LL,  @"definitions and baseLocalizations must match : definitions=%@ baseLocalizations=%@",  v8,  v20);
  }
  v41 = CanonicalLocaleIdentifierFromString;
  id v42 = objc_msgSend(objc_alloc((Class)v11[54]), "initWithCapacity:", -[NSMutableDictionary count](v45, "count"));
  [v42 setObject:v20 forKey:CanonicalLocaleIdentifierFromString];
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id obj = -[NSMutableDictionary allKeys](v45, "allKeys");
  id v48 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
  if (v48)
  {
    else {
      uint64_t v30 = (uint64_t)v47;
    }
    uint64_t v46 = *(void *)v51;
    do
    {
      for (k = 0LL; k != v48; k = (char *)k + 1)
      {
        if (*(void *)v51 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = *(void *)(*((void *)&v50 + 1) + 8LL * (void)k);
        v33 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v47);
        uint64_t v34 = 0LL;
        char v35 = 0;
        do
        {
          while (1)
          {
            id v36 = [v8 objectAtIndex:v34];
            id v37 = -[NSMutableArray objectAtIndex:](v20, "objectAtIndex:", v34);
            id v38 = sub_D068((uint64_t)a5, v36, v37, v32);
            if (!v38) {
              break;
            }
            v39 = v38;
            -[NSMutableArray addObject:](v33, "addObject:", v38);

            char v35 = 1;
            if (v30 - 1 == v34++) {
              goto LABEL_53;
            }
          }

          -[NSMutableArray addObject:](v33, "addObject:", v37);
          ++v34;
        }

        while (v30 != v34);
        if ((v35 & 1) == 0) {
          goto LABEL_54;
        }
LABEL_53:
        objc_msgSend(v42, "setObject:forKey:", v33, -[NSMutableDictionary objectForKey:](v45, "objectForKey:", v32));
LABEL_54:
      }

      id v48 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
    }

    while (v48);
  }

  return v42;
}

id sub_D068(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  if (a1)
  {
    if (a2) {
      goto LABEL_3;
    }
LABEL_22:
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "SASpeakablePhrase *_createLocalizedAltName(CFBundleRef, SASpeakablePhrase *, SASpeakablePhrase *, NSString *, AA PParserErrorLogger)"),  @"AAPParser.m",  420LL,  @"Invalid parameter not satisfying: %@",  @"definition");
    if (a4) {
      goto LABEL_4;
    }
    goto LABEL_23;
  }

  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "SASpeakablePhrase *_createLocalizedAltName(CFBundleRef, SASpeakablePhrase *, SASpeakablePhrase *, NSString *, AAPP arserErrorLogger)"),  @"AAPParser.m",  419LL,  @"Invalid parameter not satisfying: %@",  @"bundle");
  if (!a2) {
    goto LABEL_22;
  }
LABEL_3:
  if (a4) {
    goto LABEL_4;
  }
LABEL_23:
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "SASpeakablePhrase *_createLocalizedAltName(CFBundleRef, SASpeakablePhrase *, SASpeakablePhrase *, NSString *, AAPP arserErrorLogger)"),  @"AAPParser.m",  421LL,  @"Invalid parameter not satisfying: %@",  @"localization");
LABEL_4:
  id v8 = [a2 phrase];
  id v9 = [a3 phrase];
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = v8;
  }
  if (v8) {
    id v11 = (id)CFBundleCopyLocalizedStringForLocalization(a1, v8, v10, @"InfoPlist", a4);
  }
  else {
    id v11 = v10;
  }
  CFArrayRef v12 = v11;
  id v13 = [a2 pronunciation];
  id v14 = [a3 pronunciation];
  if (v14) {
    id v15 = v14;
  }
  else {
    id v15 = v13;
  }
  if (v13) {
    id v16 = (id)CFBundleCopyLocalizedStringForLocalization(a1, v13, v15, @"InfoPlist", a4);
  }
  else {
    id v16 = v15;
  }
  uint64_t v17 = v16;
  if (BSEqualStrings(v12, v10) && (BSEqualStrings(v17, v15) & 1) != 0)
  {
    id v18 = 0LL;
  }

  else
  {
    id v18 = objc_alloc_init(&OBJC_CLASS___SASpeakablePhrase);
    [v18 setPhrase:v12];
    [v18 setPronunciation:v17];
  }

  return v18;
}

void sub_ECEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = (os_log_s *)AFSiriLogContextPlugin;
  BOOL v6 = os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = objc_opt_class(*(void *)(a1 + 32));
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 136315906;
      CFArrayRef v12 = "-[AAPCommandCheckRestriction performWithCompletion:]_block_invoke";
      __int16 v13 = 2114;
      uint64_t v14 = v7;
      __int16 v15 = 2048;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = a2;
      _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_INFO,  "%s com.apple.siri.applications: <%{public}@:%p> sending response = %@",  (uint8_t *)&v11,  0x2Au);
      uint64_t v4 = *(void *)(a1 + 40);
    }

    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  }

  else if (v6)
  {
    uint64_t v9 = objc_opt_class(*(void *)(a1 + 32));
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 136315906;
    CFArrayRef v12 = "-[AAPCommandCheckRestriction performWithCompletion:]_block_invoke";
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    __int16 v15 = 2048;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = a2;
    _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_INFO,  "%s com.apple.siri.applications: <%{public}@:%p> no completion block - dropping response = %@",  (uint8_t *)&v11,  0x2Au);
  }

LABEL_4:
  uint64_t v8 = 0LL;
  __int16 v15 = v7;
LABEL_5:

  self->_state = (AAPSyncState *)v8;
  return v15;
}

void sub_F7B4()
{
}

uint64_t sub_FD70()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD00000000000001BLL,  0x80000000000191F0LL,  0x6E6967756C50LL,  0xE600000000000000LL);
  qword_253E0 = result;
  return result;
}

uint64_t *sub_FDC8()
{
  if (qword_253D0 != -1) {
    swift_once(&qword_253D0, sub_FD70);
  }
  return &qword_253E0;
}

uint64_t sub_FE08()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100AC(v0, qword_253E8);
  sub_FED0(v0, (uint64_t)qword_253E8);
  if (qword_253D0 != -1) {
    swift_once(&qword_253D0, sub_FD70);
  }
  return Logger.init(_:)((id)qword_253E0);
}

uint64_t sub_FE88()
{
  if (qword_253D8 != -1) {
    swift_once(&qword_253D8, sub_FE08);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  return sub_FED0(v0, (uint64_t)qword_253E8);
}

uint64_t sub_FED0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_FEE8@<X0>(uint64_t a1@<X8>)
{
  if (qword_253D8 != -1) {
    swift_once(&qword_253D8, sub_FE08);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_FED0(v2, (uint64_t)qword_253E8);
  swift_beginAccess(v3, v5, 0LL, 0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
}

uint64_t sub_FF80(uint64_t a1)
{
  if (qword_253D8 != -1) {
    swift_once(&qword_253D8, sub_FE08);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_FED0(v2, (uint64_t)qword_253E8);
  swift_beginAccess(v3, v6, 33LL, 0LL);
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess(v6);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*sub_10030(uint64_t a1))(void)
{
  if (qword_253D8 != -1) {
    swift_once(&qword_253D8, sub_FE08);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_FED0(v2, (uint64_t)qword_253E8);
  swift_beginAccess(v3, a1, 33LL, 0LL);
  return j__swift_endAccess;
}

uint64_t *sub_100AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    uint64_t v4 = swift_slowAlloc(*(void *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }

  return a2;
}

unint64_t sub_100EC()
{
  unint64_t result = qword_25390;
  if (!qword_25390)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_25390);
  }

  return result;
}

id AAPCommandSearchMarketplaceWrapper.__allocating_init(marketplace:keyword:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (char *)objc_allocWithZone(v4);
  uint64_t v10 = &v9[OBJC_IVAR____TtC12Applications34AAPCommandSearchMarketplaceWrapper_marketplace];
  *(void *)uint64_t v10 = a1;
  *((void *)v10 + 1) = a2;
  int v11 = &v9[OBJC_IVAR____TtC12Applications34AAPCommandSearchMarketplaceWrapper_keyword];
  *(void *)int v11 = a3;
  *((void *)v11 + 1) = a4;
  v13.receiver = v9;
  v13.super_class = v4;
  return objc_msgSendSuper2(&v13, "init");
}

id AAPCommandSearchMarketplaceWrapper.init(marketplace:keyword:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = &v4[OBJC_IVAR____TtC12Applications34AAPCommandSearchMarketplaceWrapper_marketplace];
  *(void *)uint64_t v5 = a1;
  *((void *)v5 + 1) = a2;
  BOOL v6 = &v4[OBJC_IVAR____TtC12Applications34AAPCommandSearchMarketplaceWrapper_keyword];
  *(void *)BOOL v6 = a3;
  *((void *)v6 + 1) = a4;
  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for AAPCommandSearchMarketplaceWrapper();
  return objc_msgSendSuper2(&v8, "init");
}

uint64_t type metadata accessor for AAPCommandSearchMarketplaceWrapper()
{
  return objc_opt_self(&OBJC_CLASS____TtC12Applications34AAPCommandSearchMarketplaceWrapper);
}

void sub_10378(uint64_t a1, uint64_t a2)
{
  if (a1) {
    v3.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  }
  else {
    v3.super.Class isa = 0LL;
  }
  Class isa = v3.super.isa;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

id AAPCommandSearchMarketplaceWrapper.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

void AAPCommandSearchMarketplaceWrapper.init()()
{
}

id AAPCommandSearchMarketplaceWrapper.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AAPCommandSearchMarketplaceWrapper();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void _s12Applications34AAPCommandSearchMarketplaceWrapperC7perform10completion13serviceHelper13executionInfoyySDys11AnyHashableVypGSgcSg_So09AFServiceI0_pSgSo018AFCommandExecutionK0CSgtF_0( void (*a1)(uint64_t), uint64_t a2)
{
  uint64_t v60 = a2;
  v62 = a1;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  BOOL v6 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v58 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  CFArrayRef v12 = (char *)&v58 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v58 - v13;
  uint64_t v15 = sub_FE88();
  swift_beginAccess(v15, v65, 0LL, 0LL);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16);
  uint64_t v17 = v16(v14, v15, v2);
  uint64_t v18 = (os_log_s *)Logger.logObject.getter(v17);
  os_log_type_t v19 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    __int128 v59 = v6;
    id v21 = v16;
    uint64_t v22 = v2;
    uint64_t v23 = v12;
    uint64_t v24 = v9;
    __int128 v25 = v20;
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_0, v18, v19, "AAPCommandSearchMarketplace executing...", v20, 2u);
    __int128 v26 = v25;
    uint64_t v9 = v24;
    CFArrayRef v12 = v23;
    uint64_t v2 = v22;
    uint64_t v16 = v21;
    BOOL v6 = v59;
    swift_slowDealloc(v26, -1LL, -1LL);
  }

  id v27 = *(void (**)(char *, uint64_t))(v3 + 8);
  v27(v14, v2);
  unint64_t v28 = *(void *)(v61 + OBJC_IVAR____TtC12Applications34AAPCommandSearchMarketplaceWrapper_marketplace + 8);
  if (!v28
    || ((v28 & 0x2000000000000000LL) != 0
      ? (uint64_t v29 = HIBYTE(v28) & 0xF)
      : (uint64_t v29 = *(void *)(v61 + OBJC_IVAR____TtC12Applications34AAPCommandSearchMarketplaceWrapper_marketplace) & 0xFFFFFFFFFFFFLL),
        !v29))
  {
    swift_beginAccess(v15, v64, 0LL, 0LL);
    uint64_t v40 = v16(v6, v15, v2);
    v41 = (os_log_s *)Logger.logObject.getter(v40);
    os_log_type_t v42 = static os_log_type_t.error.getter();
    BOOL v43 = os_log_type_enabled(v41, v42);
    __int128 v31 = v62;
    if (v43)
    {
      v44 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_0, v41, v42, "AAPCommandSearchMarketplace: failure - missing marketplace data", v44, 2u);
      swift_slowDealloc(v44, -1LL, -1LL);
    }

    v27(v6, v2);
    if (v31)
    {
      id v45 = objc_allocWithZone(&OBJC_CLASS___SACommandFailed);
      NSString v46 = String._bridgeToObjectiveC()();
      id v39 = [v45 initWithReason:v46];

      if (v39) {
        goto LABEL_27;
      }
    }

    else
    {
      __break(1u);
    }

    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }

  unint64_t v30 = *(void *)(v61 + OBJC_IVAR____TtC12Applications34AAPCommandSearchMarketplaceWrapper_keyword + 8);
  __int128 v31 = v62;
  if (v30)
  {
    if ((v30 & 0x2000000000000000LL) != 0
       ? HIBYTE(v30) & 0xF
       : *(void *)(v61 + OBJC_IVAR____TtC12Applications34AAPCommandSearchMarketplaceWrapper_keyword) & 0xFFFFFFFFFFFFLL)
    {
      swift_beginAccess(v15, v64, 0LL, 0LL);
      uint64_t v33 = v16(v12, v15, v2);
      uint64_t v34 = (os_log_s *)Logger.logObject.getter(v33);
      os_log_type_t v35 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v34, v35))
      {
        id v36 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)id v36 = 0;
        _os_log_impl( &dword_0,  v34,  v35,  "AAPCommandSearchMarketplace: attempted to execute on incompatible device",  v36,  2u);
        swift_slowDealloc(v36, -1LL, -1LL);
      }

      v27(v12, v2);
      if (v31)
      {
        id v37 = objc_allocWithZone(&OBJC_CLASS___SACommandFailed);
        NSString v38 = String._bridgeToObjectiveC()();
        id v39 = [v37 initWithReason:v38];

        if (v39) {
          goto LABEL_27;
        }
LABEL_36:
        __break(1u);
        return;
      }

LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
  }

  swift_beginAccess(v15, v64, 0LL, 0LL);
  uint64_t v47 = v16(v9, v15, v2);
  id v48 = (os_log_s *)Logger.logObject.getter(v47);
  os_log_type_t v49 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v48, v49))
  {
    __int128 v50 = v9;
    __int128 v51 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)__int128 v51 = 0;
    _os_log_impl(&dword_0, v48, v49, "AAPCommandSearchMarketplace: failure - missing search string data", v51, 2u);
    __int128 v52 = v51;
    uint64_t v9 = v50;
    swift_slowDealloc(v52, -1LL, -1LL);
  }

  v27(v9, v2);
  if (!v31) {
    goto LABEL_33;
  }
  id v53 = objc_allocWithZone(&OBJC_CLASS___SACommandFailed);
  NSString v54 = String._bridgeToObjectiveC()();
  id v39 = [v53 initWithReason:v54];

  if (!v39)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }

LABEL_27:
  id v55 = [v39 dictionary];
  if (v55)
  {
    uint64_t v63 = 0LL;
    static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)( v55,  &v63,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);

    uint64_t v56 = v63;
  }

  else
  {
    uint64_t v56 = 0LL;
  }

  v31(v56);
  swift_bridgeObjectRelease(v56, v57);
}

uint64_t sub_10A78(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_release(a2);
  }
  return result;
}

uint64_t sub_10A88()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_10AAC(uint64_t a1)
{
}

void sub_10AB4(uint64_t a1)
{
}

void sub_10B4C(uint64_t a1)
{
}

void sub_10BF8(os_log_t log)
{
  int v1 = 136315138;
  os_log_t v2 = "_EmitUufrReadyEvent";
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%s Missing turnId for UUFR event", (uint8_t *)&v1, 0xCu);
}

void sub_10C78()
{
  v1[0] = 136315394;
  sub_5858();
  _os_log_debug_impl( &dword_0,  v0,  OS_LOG_TYPE_DEBUG,  "%s Logging UUFR ready for AppLaunch with turnId=%@",  (uint8_t *)v1,  0x16u);
}

void sub_10CF4(uint64_t a1, void *a2)
{
}

void sub_10DF0(uint64_t a1)
{
}

void sub_10E68(void *a1, os_log_s *a2)
{
  int v4 = 136315906;
  uint64_t v5 = "-[AAPSyncHandler init]_block_invoke";
  __int16 v6 = 2114;
  id v7 = [a1 domain];
  __int16 v8 = 2048;
  id v9 = [a1 code];
  __int16 v10 = 2112;
  uint64_t v11 = a1;
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "%s com.apple.siri.applications: Error: persistence load error {%{public}@:%li}(%@)",  (uint8_t *)&v4,  0x2Au);
}

void sub_10F34()
{
  v1[0] = 136315650;
  sub_7A50();
  sub_7A30( &dword_0,  v0,  (uint64_t)v0,  "%s com.apple.siri.applications: keyAnchor check failed: lastKey=%{public}@ key=%{public}@",  (uint8_t *)v1);
  sub_7A28();
}

void sub_10FA8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11018(void *a1, os_log_s *a2)
{
  int v4 = 136315650;
  uint64_t v5 = "+[AAPSyncHandler _checkIfResetIsNeededForKey:withStartAnchorString:validity:lastState:completion:]";
  __int16 v6 = 2048;
  id v7 = [a1 version];
  __int16 v8 = 2048;
  uint64_t v9 = 4LL;
  sub_7A30( &dword_0,  a2,  v3,  "%s com.apple.siri.applications: version check failed: last=%li current=%li",  (uint8_t *)&v4);
}

void sub_110B8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11128()
{
  sub_79EC( &dword_0,  v0,  v1,  "%s com.apple.siri.applications: Error: startAnchorString decode failed - resetting -> error=%{public}@",  v2,  v3,  v4,  v5,  2u);
  sub_79FC();
}

void sub_11194( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_7A88(&dword_0, a1, a3, "%s com.apple.siri.applications: Error: LS didn't return a workspace", a5, a6, a7, a8, 2u);
  sub_79FC();
}

void sub_11204()
{
  sub_79EC( &dword_0,  v0,  v1,  "%s com.apple.siri.applications: Error: LS didn't return a sequenceNumber -> %{public}@",  v2,  v3,  v4,  v5,  2u);
  sub_79FC();
}

void sub_11270()
{
  sub_79EC( &dword_0,  v0,  v1,  "%s com.apple.siri.applications: Error: LS didn't return a knowledge UUID -> %{public}@",  v2,  v3,  v4,  v5,  2u);
  sub_79FC();
}

void sub_112DC()
{
  uint64_t v2 = v0 + 24;
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v1 = *(void *)(v2 + 8);
  int v6 = 136315650;
  id v7 = "-[AAPSyncHandler beginSyncWithAnchor:validity:count:forKey:beginInfo:configuration:]_block_invoke";
  __int16 v8 = 2048;
  uint64_t v9 = v1;
  __int16 v10 = 2048;
  uint64_t v11 = v3;
  sub_7A30( &dword_0,  v4,  v5,  "%s com.apple.siri.applications: created processor for source -> processor=%p source=%p",  (uint8_t *)&v6);
  sub_7A28();
}

void sub_11364()
{
  v1[0] = 136315650;
  sub_7A50();
  _os_log_error_impl( &dword_0,  v0,  OS_LOG_TYPE_ERROR,  "%s com.apple.siri.applications: Error: MI state is bad -> validity = '%{public}@' , anchor = %{public}@",  (uint8_t *)v1,  0x20u);
  sub_7A28();
}

void sub_113E0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11450()
{
  sub_79EC( &dword_0,  v0,  v1,  "%s com.apple.siri.applications: Error: preAnchorString decode failed - terminating sync -> error=%{public}@",  v2,  v3,  v4,  v5,  2u);
  sub_79FC();
}

void sub_114BC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1152C(uint64_t a1)
{
}

void sub_115A4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1161C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1168C()
{
  sub_8314( &dword_0,  v0,  v1,  "%s com.apple.siri.applications: processor is ready to begin -> metaData = %@",  v2,  v3,  v4,  v5,  2u);
  sub_79FC();
}

void sub_11700( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_8314( &dword_0,  a2,  a3,  "%s com.apple.siri.applications: no next item after anchor=%{public}@ - ending sync",  a5,  a6,  a7,  a8,  2u);
  sub_79FC();
}

void sub_11778()
{
  int v1 = 136315650;
  uint64_t v2 = "-[AAPSyncMetaDataProcessor _queue_processNextChange:afterAnchor:withInitialAnchor:]";
  sub_8324();
  _os_log_debug_impl( &dword_0,  v0,  OS_LOG_TYPE_DEBUG,  "%s com.apple.siri.applications: no next item after anchor=%{public}@ - updating anchor=%{public}@",  (uint8_t *)&v1,  0x20u);
}

void sub_11800( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11878()
{
  int v1 = 136315650;
  uint64_t v2 = "-[AAPSyncMetaDataProcessor _queue_processNextChange:afterAnchor:withInitialAnchor:]";
  sub_8324();
  _os_log_error_impl( &dword_0,  v0,  OS_LOG_TYPE_ERROR,  "%s com.apple.siri.applications: skipping invalid item -> %@ : info -> %@",  (uint8_t *)&v1,  0x20u);
}

void sub_11900( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11970( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_119E0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11A50( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11AC0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11B30()
{
  sub_8314( &dword_0,  v0,  v1,  "%s com.apple.siri.applications: finished cache update for appId='%@' -> already invalidated so tossing",  v2,  v3,  v4,  v5,  2u);
  sub_79FC();
}

void sub_11BA0(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[AAPSyncMetaDataSource initWithLastState:startAnchor:keyAnchor:validity:configuration:observer:]_block_invoke";
  _os_log_debug_impl( &dword_0,  log,  OS_LOG_TYPE_DEBUG,  "%s com.apple.siri.applications: source is ready",  (uint8_t *)&v1,  0xCu);
  sub_79FC();
}

void sub_11C1C()
{
}

void sub_11C88()
{
}

void sub_11CF4()
{
  v1[0] = 136315394;
  sub_5858();
  _os_log_error_impl( &dword_0,  v0,  OS_LOG_TYPE_ERROR,  "%s com.apple.siri.applications: Error: failed constraint - if we don't think we need to reconcile then we shouldn't have any new deletes -> %@",  (uint8_t *)v1,  0x16u);
  sub_79FC();
}

void sub_11D6C()
{
  sub_8314(&dword_0, v0, v1, "%s com.apple.siri.applications: gathered metaDataItem=%@", v2, v3, v4, v5, 2u);
  sub_79FC();
}

void sub_11DD8(uint64_t a1, uint64_t a2, uint64_t a3, os_log_s *a4)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(_DWORD *)a3 = 136315650;
  *(void *)(a3 + 4) = "-[AAPSyncMetaDataItemUpdate valueForGenericParser:withDefaultGenerator:withErrorKeyDescriptor:]";
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a1;
  *(_WORD *)(a3 + 22) = 2112;
  *(void *)(a3 + 24) = v4;
  sub_7A30( &dword_0,  a4,  a3,  "%s com.apple.siri.applications: tried falling back to defaultGenerator value for %{public}@ (%@) but the generator p roduced no value",  (uint8_t *)a3);
}

void sub_11E3C()
{
  sub_79EC( &dword_0,  v0,  v1,  "%s com.apple.siri.applications: Error: could not load info file for metaDataItem=%@",  v2,  v3,  v4,  v5,  2u);
  sub_79FC();
}

void sub_11EA8(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v3 = 136315650;
  uint64_t v4 = "-[AAPSyncMetaDataItemUpdate valuesForInfoPlistEntries:inBundle:withEntitlements:forLocalization:ignoringDefaultValues:]";
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  sub_7A30( &dword_0,  a3,  (uint64_t)a3,  "%s com.apple.siri.applications: could not load %{public}@ info file for metaDataItem=%@",  (uint8_t *)&v3);
  sub_7A28();
}

void sub_11F34( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11FB0(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)int v3 = 136315650;
  *(void *)&v3[4] = "-[AAPSyncMetaDataItemUpdate valuesForEntries:inPlistAtURL:]";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  sub_B5F4( &dword_0,  a2,  a3,  "%s com.apple.siri.applications: Error: could not parse plist file at url='%@' (%@) -> unknown",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16],  *(void *)(a2 + 8));
  sub_7A28();
}

void sub_12034()
{
  sub_79EC( &dword_0,  v0,  v1,  "%s com.apple.siri.applications: Error: could not get the bundle for metaDataItem=%@",  v2,  v3,  v4,  v5,  2u);
  sub_79FC();
}

void sub_120A0()
{
  sub_79EC( &dword_0,  v0,  v1,  "%s com.apple.siri.applications: Error: no Info.plist identifier for metaDataItem=%@",  v2,  v3,  v4,  v5,  2u);
  sub_79FC();
}

void sub_1210C()
{
  int v2 = 136315650;
  sub_5858();
  sub_B5F4( &dword_0,  v0,  v1,  "%s com.apple.siri.applications: Error: the Info.plist identifier (%@) did not agree with metaDataItem=%@",  v2);
  sub_7A28();
}

void sub_12180()
{
  sub_8314( &dword_0,  v0,  v1,  "%s com.apple.siri.applications: Error: no entitlements found for metaDataItem=%@",  v2,  v3,  v4,  v5,  2u);
  sub_79FC();
}

void sub_121EC(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[AAPIntentsInfoSyncHandler beginSyncWithAnchor:validity:count:forKey:beginInfo:]";
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "%s com.apple.siri.applications: ERROR: no app id?!",  (uint8_t *)&v1,  0xCu);
}

void sub_1226C(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  int v4 = 136315650;
  uint64_t v5 = "-[AAPIntentsInfoSyncHandler getChangeAfterAnchor:changeInfo:]";
  __int16 v6 = 2112;
  uint64_t v7 = v2;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "%s com.apple.siri.applications: The %@ app does not support any intents, available extensions: %@",  (uint8_t *)&v4,  0x20u);
  sub_7A28();
}

void sub_122FC()
{
  int v2 = 136315650;
  sub_E788();
  sub_B5F4(&dword_0, v0, v1, "%s com.apple.siri.applications: Value for key %{public}@ is not a BOOL: %@", v2);
  sub_7A28();
}

void sub_12368()
{
  int v2 = 136315650;
  sub_E788();
  sub_B5F4(&dword_0, v0, v1, "%s com.apple.siri.applications: Value for key %{public}@ is not a string: %@", v2);
  sub_7A28();
}

void sub_123D4()
{
  int v2 = 136315650;
  sub_E788();
  sub_B5F4(&dword_0, v0, v1, "%s com.apple.siri.applications: Value for key %{public}@ is not an array: %@", v2);
  sub_7A28();
}

void sub_12440(uint64_t a1, os_log_s *a2)
{
  v4[0] = 136315650;
  sub_EE60();
  uint64_t v5 = a1;
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "%s com.apple.siri.applications: <%{public}@:%p> command contained no launchId",  (uint8_t *)v4,  0x20u);
}

void sub_124D8(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  v6[0] = 136315906;
  sub_EE60();
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl( &dword_0,  a3,  OS_LOG_TYPE_ERROR,  "%s com.apple.siri.applications: <%{public}@:%p> Error: failed to talk to systemService for app (%@)",  (uint8_t *)v6,  0x2Au);
}

void sub_12588(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v6 = 136315906;
  uint64_t v7 = "-[AAPCommandFilterNonRestricted performWithCompletion:]";
  __int16 v8 = 2114;
  uint64_t v9 = objc_opt_class(a1);
  __int16 v10 = 2048;
  uint64_t v11 = a1;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_error_impl( &dword_0,  a3,  OS_LOG_TYPE_ERROR,  "%s com.apple.siri.applications: <%{public}@:%p> Error: failed to talk to systemService for apps (%@)",  (uint8_t *)&v6,  0x2Au);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForDirectory:inDomain:appropriateForURL:create:error:");
}

id objc_msgSend_URLForResource_withExtension_subdirectory_localization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForResource:withExtension:subdirectory:localization:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__checkIfResetIsNeededForKey_withStartAnchorString_validity_lastState_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkIfResetIsNeededForKey:withStartAnchorString:validity:lastState:completion:");
}

id objc_msgSend__closeApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_closeApp:");
}

id objc_msgSend__createSourceInfoForLastState_startAnchor_keyAnchor_validity_configuration_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createSourceInfoForLastState:startAnchor:keyAnchor:validity:configuration:");
}

id objc_msgSend__errWithCode_desc_err_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_errWithCode:desc:err:");
}

id objc_msgSend__fileManager(void *a1, const char *a2, ...)
{
  return _[a1 _fileManager];
}

id objc_msgSend__generateURLIfNeededWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateURLIfNeededWithError:");
}

id objc_msgSend__initWithMainIndex_subIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithMainIndex:subIndex:");
}

id objc_msgSend__pbLocalizedProjectsForVocabularyInfoDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pbLocalizedProjectsForVocabularyInfoDictionary:");
}

id objc_msgSend__queue_processNextChange_afterAnchor_withInitialAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_processNextChange:afterAnchor:withInitialAnchor:");
}

id objc_msgSend__queue_updateCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_updateCache");
}

id objc_msgSend__selfReferencingCommandFailedWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_selfReferencingCommandFailedWithReason:");
}

id objc_msgSend__validate(void *a1, const char *a2, ...)
{
  return _[a1 _validate];
}

id objc_msgSend_aap_BOOLValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aap_BOOLValueForKey:");
}

id objc_msgSend_aap_arrayValueForKey_expectedContainingObjectsType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aap_arrayValueForKey:expectedContainingObjectsType:");
}

id objc_msgSend_aap_stringValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aap_stringValueForKey:");
}

id objc_msgSend_aceId(void *a1, const char *a2, ...)
{
  return _[a1 aceId];
}

id objc_msgSend_actionsRestrictedWhileLocked(void *a1, const char *a2, ...)
{
  return _[a1 actionsRestrictedWhileLocked];
}

id objc_msgSend_addExamples_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addExamples:");
}

id objc_msgSend_addIntentSlotNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIntentSlotNames:");
}

id objc_msgSend_addIntentSlotVocabularyConcepts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIntentSlotVocabularyConcepts:");
}

id objc_msgSend_addIntentSlotVocabularyPolicies_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIntentSlotVocabularyPolicies:");
}

id objc_msgSend_addIntentSupport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIntentSupport:");
}

id objc_msgSend_addIntentTypePhrases_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIntentTypePhrases:");
}

id objc_msgSend_addIntentVocabularyExamples_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIntentVocabularyExamples:");
}

id objc_msgSend_addIntentsRestrictedWhileLocked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIntentsRestrictedWhileLocked:");
}

id objc_msgSend_addIntentsSupported_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIntentsSupported:");
}

id objc_msgSend_addLocalizedProjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLocalizedProjects:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSupportedMediaCategories_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSupportedMediaCategories:");
}

id objc_msgSend_addSynonyms_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSynonyms:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_anchor(void *a1, const char *a2, ...)
{
  return _[a1 anchor];
}

id objc_msgSend_anchorByIncrementingSubIndex(void *a1, const char *a2, ...)
{
  return _[a1 anchorByIncrementingSubIndex];
}

id objc_msgSend_anchorFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anchorFromIndex:");
}

id objc_msgSend_anchorFromStringRepresentation_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anchorFromStringRepresentation:error:");
}

id objc_msgSend_appId(void *a1, const char *a2, ...)
{
  return _[a1 appId];
}

id objc_msgSend_appIdentifyingInfo(void *a1, const char *a2, ...)
{
  return _[a1 appIdentifyingInfo];
}

id objc_msgSend_appIds(void *a1, const char *a2, ...)
{
  return _[a1 appIds];
}

id objc_msgSend_appInfoWithAppProxy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appInfoWithAppProxy:");
}

id objc_msgSend_appMetadata(void *a1, const char *a2, ...)
{
  return _[a1 appMetadata];
}

id objc_msgSend_appName(void *a1, const char *a2, ...)
{
  return _[a1 appName];
}

id objc_msgSend_appNameMap(void *a1, const char *a2, ...)
{
  return _[a1 appNameMap];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_applicationName(void *a1, const char *a2, ...)
{
  return _[a1 applicationName];
}

id objc_msgSend_applicationProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationProxyForIdentifier:");
}

id objc_msgSend_applicationType(void *a1, const char *a2, ...)
{
  return _[a1 applicationType];
}

id objc_msgSend_apps(void *a1, const char *a2, ...)
{
  return _[a1 apps];
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleContainerURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleContainerURL];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return _[a1 bundleId];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return _[a1 bundleVersion];
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithURL:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_canOpenApplication_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canOpenApplication:reason:");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_characterIsMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterIsMember:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_containingBundle(void *a1, const char *a2, ...)
{
  return _[a1 containingBundle];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return _[a1 currentState];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_dealloc(void *a1, const char *a2, ...)
{
  return _[a1 dealloc];
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 decimalDigitCharacterSet];
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_deletes(void *a1, const char *a2, ...)
{
  return _[a1 deletes];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_displayAppName(void *a1, const char *a2, ...)
{
  return _[a1 displayAppName];
}

id objc_msgSend_displayAppNameMap(void *a1, const char *a2, ...)
{
  return _[a1 displayAppNameMap];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_drain(void *a1, const char *a2, ...)
{
  return _[a1 drain];
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return _[a1 entitlements];
}

id objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_execute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "execute:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_getKnowledgeUUID_andSequenceNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getKnowledgeUUID:andSequenceNumber:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleForPredicate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleForPredicate:error:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_initWithAppId_anchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppId:anchor:");
}

id objc_msgSend_initWithAppId_appProxy_anchor_configuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppId:appProxy:anchor:configuration:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:");
}

id objc_msgSend_initWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:options:error:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithExplanation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExplanation:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithLastState_startAnchor_keyAnchor_validity_configuration_observer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLastState:startAnchor:keyAnchor:validity:configuration:observer:");
}

id objc_msgSend_initWithMarketplace_keyword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMarketplace:keyword:");
}

id objc_msgSend_initWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:count:");
}

id objc_msgSend_initWithPredicate_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPredicate:context:");
}

id objc_msgSend_initWithSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSet:");
}

id objc_msgSend_initWithSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSource:");
}

id objc_msgSend_initWithValidity_version_keyAnchor_startAnchor_stopAnchor_apps_deletes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValidity:version:keyAnchor:startAnchor:stopAnchor:apps:deletes:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isBetaApp(void *a1, const char *a2, ...)
{
  return _[a1 isBetaApp];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToAnchor:");
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isMetaDataItemDelete(void *a1, const char *a2, ...)
{
  return _[a1 isMetaDataItemDelete];
}

id objc_msgSend_isMetaDataItemUpdate(void *a1, const char *a2, ...)
{
  return _[a1 isMetaDataItemUpdate];
}

id objc_msgSend_isNewerThanAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNewerThanAnchor:");
}

id objc_msgSend_isOlderThanAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOlderThanAnchor:");
}

id objc_msgSend_isPrimitiveAnchor(void *a1, const char *a2, ...)
{
  return _[a1 isPrimitiveAnchor];
}

id objc_msgSend_isRestricted(void *a1, const char *a2, ...)
{
  return _[a1 isRestricted];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return _[a1 isRunning];
}

id objc_msgSend_isValidStringRepresentation_withMainIndex_subIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidStringRepresentation:withMainIndex:subIndex:");
}

id objc_msgSend_keyAnchor(void *a1, const char *a2, ...)
{
  return _[a1 keyAnchor];
}

id objc_msgSend_keyword(void *a1, const char *a2, ...)
{
  return _[a1 keyword];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_launchId(void *a1, const char *a2, ...)
{
  return _[a1 launchId];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return _[a1 load];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return _[a1 localizations];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedStandardContainsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStandardContainsString:");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_logInstrumentation_machAbsoluteTime_turnIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logInstrumentation:machAbsoluteTime:turnIdentifier:");
}

id objc_msgSend_marketplace(void *a1, const char *a2, ...)
{
  return _[a1 marketplace];
}

id objc_msgSend_metaData(void *a1, const char *a2, ...)
{
  return _[a1 metaData];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openApplication:withOptions:completion:");
}

id objc_msgSend_optionsWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionsWithDictionary:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_performWithCompletion_serviceHelper_executionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWithCompletion:serviceHelper:executionInfo:");
}

id objc_msgSend_phrase(void *a1, const char *a2, ...)
{
  return _[a1 phrase];
}

id objc_msgSend_plugInKitPlugins(void *a1, const char *a2, ...)
{
  return _[a1 plugInKitPlugins];
}

id objc_msgSend_predicateMatchingBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingBundleIdentifier:");
}

id objc_msgSend_predicateMatchingBundleIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingBundleIdentifiers:");
}

id objc_msgSend_primitiveAnchor(void *a1, const char *a2, ...)
{
  return _[a1 primitiveAnchor];
}

id objc_msgSend_processNextChange_afterAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processNextChange:afterAnchor:");
}

id objc_msgSend_projectedStateForKeyAnchor_withValidity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "projectedStateForKeyAnchor:withValidity:");
}

id objc_msgSend_pronunciation(void *a1, const char *a2, ...)
{
  return _[a1 pronunciation];
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return _[a1 protocol];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_resetWithValidity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetWithValidity:");
}

id objc_msgSend_save_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "save:");
}

id objc_msgSend_sceneId(void *a1, const char *a2, ...)
{
  return _[a1 sceneId];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_scrapeAppInfo(void *a1, const char *a2, ...)
{
  return _[a1 scrapeAppInfo];
}

id objc_msgSend_sequenceNumber(void *a1, const char *a2, ...)
{
  return _[a1 sequenceNumber];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_setAceAppBundleInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAceAppBundleInfo:");
}

id objc_msgSend_setAceId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAceId:");
}

id objc_msgSend_setAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnchor:");
}

id objc_msgSend_setAppId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppId:");
}

id objc_msgSend_setAppToItsRestrictionsMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppToItsRestrictionsMap:");
}

id objc_msgSend_setBuildNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBuildNumber:");
}

id objc_msgSend_setBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleId:");
}

id objc_msgSend_setClientIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientIdentifier:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setData:");
}

id objc_msgSend_setFoundApps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFoundApps:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIntentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntentType:");
}

id objc_msgSend_setIntentVocabulary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntentVocabulary:");
}

id objc_msgSend_setIsDelete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsDelete:");
}

id objc_msgSend_setKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKey:");
}

id objc_msgSend_setLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLanguage:");
}

id objc_msgSend_setLaunchId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLaunchId:");
}

id objc_msgSend_setLocalizedBundleDisplayName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedBundleDisplayName:");
}

id objc_msgSend_setObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setPhrase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhrase:");
}

id objc_msgSend_setPostAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPostAnchor:");
}

id objc_msgSend_setPronunciation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPronunciation:");
}

id objc_msgSend_setReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReason:");
}

id objc_msgSend_setRefId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRefId:");
}

id objc_msgSend_setRequiresUserIdentification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresUserIdentification:");
}

id objc_msgSend_setRestrictedApps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRestrictedApps:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTag:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setTypeName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTypeName:");
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURL:");
}

id objc_msgSend_setValidity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValidity:");
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVersion:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 sharedAnalytics];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_shortVersionString(void *a1, const char *a2, ...)
{
  return _[a1 shortVersionString];
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return _[a1 signal];
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_sourceIsReady_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceIsReady:");
}

id objc_msgSend_spotlightName(void *a1, const char *a2, ...)
{
  return _[a1 spotlightName];
}

id objc_msgSend_spotlightNameMap(void *a1, const char *a2, ...)
{
  return _[a1 spotlightNameMap];
}

id objc_msgSend_startAnchor(void *a1, const char *a2, ...)
{
  return _[a1 startAnchor];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stopAnchor(void *a1, const char *a2, ...)
{
  return _[a1 stopAnchor];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 stringRepresentation];
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_supportedIntents(void *a1, const char *a2, ...)
{
  return _[a1 supportedIntents];
}

id objc_msgSend_supportedMediaCategories(void *a1, const char *a2, ...)
{
  return _[a1 supportedMediaCategories];
}

id objc_msgSend_turnId(void *a1, const char *a2, ...)
{
  return _[a1 turnId];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_validity(void *a1, const char *a2, ...)
{
  return _[a1 validity];
}

id objc_msgSend_valueForGenericParser_withDefaultGenerator_withErrorKeyDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForGenericParser:withDefaultGenerator:withErrorKeyDescriptor:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForPlistEntry_inBundle_withInfo_entitlements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForPlistEntry:inBundle:withInfo:entitlements:");
}

id objc_msgSend_valuesForEntries_inPlistAtURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valuesForEntries:inPlistAtURL:");
}

id objc_msgSend_valuesForInfoPlistEntries_inBundle_withEntitlements_forLocalization_ignoringDefaultValues_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valuesForInfoPlistEntries:inBundle:withEntitlements:forLocalization:ignoringDefaultValues:");
}

id objc_msgSend_valuesForLocalInfoPlistEntries_inBundle_withEntitlements_ignoringDefaultValues_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valuesForLocalInfoPlistEntries:inBundle:withEntitlements:ignoringDefaultValues:");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return _[a1 version];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return _[a1 wait];
}

id objc_msgSend_waitUntilReady(void *a1, const char *a2, ...)
{
  return _[a1 waitUntilReady];
}

id objc_msgSend_wakeSystemForReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wakeSystemForReason:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:options:error:");
}