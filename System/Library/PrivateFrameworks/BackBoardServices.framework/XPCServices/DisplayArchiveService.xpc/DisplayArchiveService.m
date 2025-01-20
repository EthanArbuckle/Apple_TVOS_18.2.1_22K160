int main(int argc, const char **argv, const char **envp)
{
  id v3;
  void *v4;
  int result;
  void v6[5];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000021F0;
  v6[3] = &unk_100010388;
  v6[4] = objc_opt_new(&OBJC_CLASS___DASListenerDelegate);
  objc_msgSend( (id)objc_claimAutoreleasedReturnValue( +[BSServiceConnectionListener listenerWithConfigurator:]( BSServiceConnectionListener,  "listenerWithConfigurator:",  v6)),  "activate");
  v3 = +[BSServicesConfiguration activateXPCService](&OBJC_CLASS___BSServicesConfiguration, "activateXPCService");
  sub_1000021F0((uint64_t)v3, v4);
  return result;
}

void sub_1000021F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDomain:@"XPCService"];
  [v3 setService:@"DisplayArchive"];
  [v3 setDelegate:*(void *)(a1 + 32)];
}

NSString *__cdecl sub_100002414(id a1, DASContextInfo *a2)
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%x",  -[DASContextInfo identifier](a2, "identifier"));
}

uint64_t sub_10000274C(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 32) + 8LL);
}

uint64_t sub_100002758(uint64_t a1)
{
  return *(int *)(*(void *)(a1 + 32) + 12LL);
}

void sub_100002CE0(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100002DDC;
  v10[3] = &unk_100010468;
  id v4 = v2;
  id v11 = v4;
  objc_msgSend(v3, "bs_each:", v10);
  v5 = *(void **)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100002E94;
  v7[3] = &unk_1000104B0;
  id v8 = v4;
  id v9 = v5;
  id v6 = v4;
  [v9 appendBodySectionWithName:@"contextsByPID" multilinePrefix:0 block:v7];
}

void sub_100002DDC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a3 pid]));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKey:"));
  if (v6)
  {
    v7 = v6;
    [v6 addObject:v5];
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v5));

    [*(id *)(a1 + 32) setObject:v7 forKey:v8];
  }
}

void sub_100002E94(uint64_t a1)
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allKeys]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sortedArrayUsingSelector:"));

  id obj = v3;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v16 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v16) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v8 = *(void **)(a1 + 40);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:v7]);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allObjects]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 sortedArrayUsingSelector:"compare:"]);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bs_map:", &stru_100010488));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsJoinedByString:", @", "));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
        [v8 appendString:v13 withName:v14];
      }

      id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v5);
  }
}

NSString *__cdecl sub_100003050(id a1, NSNumber *a2)
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%x",  -[NSNumber unsignedIntValue](a2, "unsignedIntValue"));
}

void sub_100003094(uint64_t a1, void *a2, void *a3)
{
  id v30 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v30])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"duplicate entry for %@ in %@",  v30,  *(void *)(a1 + 40)));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v10 = NSStringFromSelector(*(SEL *)(a1 + 72));
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (objc_class *)objc_opt_class(*(void *)(a1 + 48));
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      uint64_t v15 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544642;
      v32 = v11;
      __int16 v33 = 2114;
      v34 = v14;
      __int16 v35 = 2048;
      uint64_t v36 = v15;
      __int16 v37 = 2114;
      v38 = @"DASParsing.m";
      __int16 v39 = 1024;
      int v40 = 157;
      __int16 v41 = 2114;
      v42 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v9 UTF8String]);
    __break(0);
    JUMPOUT(0x100003298LL);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v30 identifier]));
  v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) objectForKey:v6]);

  if (v7)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"duplicate entry for contextIDNumber %@ in %@",  v6,  *(void *)(a1 + 40)));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      __int128 v17 = NSStringFromSelector(*(SEL *)(a1 + 72));
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      __int128 v19 = (objc_class *)objc_opt_class(*(void *)(a1 + 48));
      __int128 v20 = NSStringFromClass(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      uint64_t v22 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544642;
      v32 = v18;
      __int16 v33 = 2114;
      v34 = v21;
      __int16 v35 = 2048;
      uint64_t v36 = v22;
      __int16 v37 = 2114;
      v38 = @"DASParsing.m";
      __int16 v39 = 1024;
      int v40 = 160;
      __int16 v41 = 2114;
      v42 = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v16 UTF8String]);
    __break(0);
    JUMPOUT(0x100003390LL);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:v6]);

  if (v8)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"duplicate entry for contextIDNumber %@ in %@",  v6,  *(void *)(a1 + 40)));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v24 = NSStringFromSelector(*(SEL *)(a1 + 72));
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v26 = (objc_class *)objc_opt_class(*(void *)(a1 + 48));
      v27 = NSStringFromClass(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      uint64_t v29 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544642;
      v32 = v25;
      __int16 v33 = 2114;
      v34 = v28;
      __int16 v35 = 2048;
      uint64_t v36 = v29;
      __int16 v37 = 2114;
      v38 = @"DASParsing.m";
      __int16 v39 = 1024;
      int v40 = 161;
      __int16 v41 = 2114;
      v42 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v23 UTF8String]);
    __break(0);
    JUMPOUT(0x100003488LL);
  }

  [*(id *)(a1 + 56) setObject:v30 forKey:v6];
  [*(id *)(a1 + 64) setObject:v5 forKey:v6];
  [*(id *)(a1 + 32) addObject:v30];
}

void sub_100003CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
}

void sub_100004848( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

uint64_t sub_100004920(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100004930(uint64_t a1)
{
}

void sub_100004938(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  if (v2)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL))
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKey:"));

      if (v3)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"cannot be more than one %@ group",  *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL)));
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          id v8 = NSStringFromSelector(*(SEL *)(a1 + 80));
          id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
          v10 = (objc_class *)objc_opt_class(*(void *)(a1 + 40));
          id v11 = NSStringFromClass(v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          uint64_t v13 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138544642;
          v23 = v9;
          __int16 v24 = 2114;
          v25 = v12;
          __int16 v26 = 2048;
          uint64_t v27 = v13;
          __int16 v28 = 2114;
          uint64_t v29 = @"DASParsing.m";
          __int16 v30 = 1024;
          int v31 = 406;
          __int16 v32 = 2114;
          __int16 v33 = v7;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
        }

        _bs_set_crash_log_message([v7 UTF8String]);
        __break(0);
        JUMPOUT(0x100004B60LL);
      }

      [*(id *)(a1 + 48) addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
      id v4 = *(void **)(a1 + 32);
      id v21 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) copy];
      objc_msgSend(v4, "setObject:forKey:");
    }

    else
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"cannot be more than one unattached group"));
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          uint64_t v15 = NSStringFromSelector(*(SEL *)(a1 + 80));
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          __int128 v17 = (objc_class *)objc_opt_class(*(void *)(a1 + 40));
          __int128 v18 = NSStringFromClass(v17);
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          uint64_t v20 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138544642;
          v23 = v16;
          __int16 v24 = 2114;
          v25 = v19;
          __int16 v26 = 2048;
          uint64_t v27 = v20;
          __int16 v28 = 2114;
          uint64_t v29 = @"DASParsing.m";
          __int16 v30 = 1024;
          int v31 = 410;
          __int16 v32 = 2114;
          __int16 v33 = v14;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
        }

        _bs_set_crash_log_message([v14 UTF8String]);
        __break(0);
        JUMPOUT(0x100004C50LL);
      }

      id v5 = [v2 copy];
      uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8LL);
      id v21 = *(id *)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
  }
}

void sub_100004C58(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 32),  "matchesInString:options:range:",  v3,  0,  0,  objc_msgSend(v3, "length")));
  if ((unint64_t)[v4 count] >= 2)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"we can't match more than one display entry per line"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v44 = NSStringFromSelector(*(SEL *)(a1 + 104));
      v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
      v46 = (objc_class *)objc_opt_class(*(void *)(a1 + 40));
      v47 = NSStringFromClass(v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
      uint64_t v49 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544642;
      *(void *)v99 = v45;
      *(_WORD *)&v99[8] = 2114;
      *(void *)v100 = v48;
      *(_WORD *)&v100[8] = 2048;
      *(void *)v101 = v49;
      *(_WORD *)&v101[8] = 2114;
      *(void *)&v101[10] = @"DASParsing.m";
      __int16 v102 = 1024;
      int v103 = 417;
      __int16 v104 = 2114;
      v105 = v43;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v43 UTF8String]);
    __break(0);
    JUMPOUT(0x10000525CLL);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16LL))();
    id v6 = [v5 rangeWithName:@"displayName"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v6, v7));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByReplacingOccurrencesOfString:@" " withString:@"_"]);

    id v10 = sub_10000661C();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v99 = v9;
      *(_WORD *)&v99[8] = 2112;
      *(void *)v100 = v3;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "matched display '%@' in '%@'",  buf,  0x16u);
    }

    if (![v9 length])
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"must have a valid displayName"));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v58 = NSStringFromSelector(*(SEL *)(a1 + 104));
        v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
        v60 = (objc_class *)objc_opt_class(*(void *)(a1 + 40));
        v61 = NSStringFromClass(v60);
        v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
        uint64_t v63 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138544642;
        *(void *)v99 = v59;
        *(_WORD *)&v99[8] = 2114;
        *(void *)v100 = v62;
        *(_WORD *)&v100[8] = 2048;
        *(void *)v101 = v63;
        *(_WORD *)&v101[8] = 2114;
        *(void *)&v101[10] = @"DASParsing.m";
        __int16 v102 = 1024;
        int v103 = 425;
        __int16 v104 = 2114;
        v105 = v57;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
      }

      _bs_set_crash_log_message([v57 UTF8String]);
      __break(0);
      JUMPOUT(0x10000543CLL);
    }

    unsigned int v12 = [v9 isEqualToString:@"Unattached"];
    uint64_t v13 = (id *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL);
    if (v12)
    {
      id v14 = *v13;
      id *v13 = 0LL;
    }

    else
    {
      objc_storeStrong(v13, v9);
      [*(id *)(a1 + 48) setObject:v3 forKey:v9];
    }

    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
    uint64_t v16 = *(void *)(*(void *)(a1 + 96) + 8LL);
    __int128 v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 56),  "matchesInString:options:range:",  v3,  0,  0,  objc_msgSend(v3, "length")));
  if ((unint64_t)[v18 count] >= 2)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"we can't match more than one contextMatches entry per line"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v51 = NSStringFromSelector(*(SEL *)(a1 + 104));
      v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
      v53 = (objc_class *)objc_opt_class(*(void *)(a1 + 40));
      v54 = NSStringFromClass(v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
      uint64_t v56 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544642;
      *(void *)v99 = v52;
      *(_WORD *)&v99[8] = 2114;
      *(void *)v100 = v55;
      *(_WORD *)&v100[8] = 2048;
      *(void *)v101 = v56;
      *(_WORD *)&v101[8] = 2114;
      *(void *)&v101[10] = @"DASParsing.m";
      __int16 v102 = 1024;
      int v103 = 436;
      __int16 v104 = 2114;
      v105 = v50;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v50 UTF8String]);
    __break(0);
    JUMPOUT(0x10000534CLL);
  }

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 firstObject]);
  uint64_t v20 = v19;
  if (v19)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL))
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"context matches must be preceeded by a display match :\n%@",  *(void *)(*(void *)(a1 + 40) + 48LL)));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v65 = NSStringFromSelector(*(SEL *)(a1 + 104));
        v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
        v67 = (objc_class *)objc_opt_class(*(void *)(a1 + 40));
        v68 = NSStringFromClass(v67);
        v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
        uint64_t v70 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138544642;
        *(void *)v99 = v66;
        *(_WORD *)&v99[8] = 2114;
        *(void *)v100 = v69;
        *(_WORD *)&v100[8] = 2048;
        *(void *)v101 = v70;
        *(_WORD *)&v101[8] = 2114;
        *(void *)&v101[10] = @"DASParsing.m";
        __int16 v102 = 1024;
        int v103 = 439;
        __int16 v104 = 2114;
        v105 = v64;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
      }

      _bs_set_crash_log_message([v64 UTF8String]);
      __break(0);
      JUMPOUT(0x100005538LL);
    }

    id v21 = [v19 rangeWithName:@"contextID"];
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v21, v22));
    if (![v23 length])
    {
      v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"must have a valid contextID : %@ from '%@'",  v23,  v3));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v72 = NSStringFromSelector(*(SEL *)(a1 + 104));
        v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
        v74 = (objc_class *)objc_opt_class(*(void *)(a1 + 40));
        v75 = NSStringFromClass(v74);
        v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
        uint64_t v77 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138544642;
        *(void *)v99 = v73;
        *(_WORD *)&v99[8] = 2114;
        *(void *)v100 = v76;
        *(_WORD *)&v100[8] = 2048;
        *(void *)v101 = v77;
        *(_WORD *)&v101[8] = 2114;
        *(void *)&v101[10] = @"DASParsing.m";
        __int16 v102 = 1024;
        int v103 = 442;
        __int16 v104 = 2114;
        v105 = v71;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
      }

      _bs_set_crash_log_message([v71 UTF8String]);
      __break(0);
      JUMPOUT(0x10000562CLL);
    }

    id v24 = v23;
    if (![v24 length])
    {
      v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"must have a valid hex string -> %@",  v24));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSNumber * _Nonnull uint32NumberFromHexString(NSString *__strong _Nonnull)"));
        *(_DWORD *)buf = 138544130;
        *(void *)v99 = v79;
        *(_WORD *)&v99[8] = 2114;
        *(void *)v100 = @"DASParsing.m";
        *(_WORD *)&v100[8] = 1024;
        *(_DWORD *)v101 = 340;
        *(_WORD *)&v101[4] = 2114;
        *(void *)&v101[6] = v78;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ (%{public}@:%i) : %{public}@",  buf,  0x26u);
      }

      _bs_set_crash_log_message([v78 UTF8String]);
      __break(0);
      JUMPOUT(0x1000056F8LL);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 lowercaseString]);
    uint64_t v26 = 0LL;
    if ([v25 length])
    {
      unint64_t v27 = 0LL;
      do
      {
        id v28 = [v25 characterAtIndex:v27];
        if (((_DWORD)v28 - 48) >= 0xA)
        {
          if (((_DWORD)v28 - 97) >= 6)
          {
            v96 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"unknown character %c",  v28));
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              v97 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSNumber * _Nonnull uint32NumberFromHexString(NSString *__strong _Nonnull)"));
              *(_DWORD *)buf = 138544130;
              *(void *)v99 = v97;
              *(_WORD *)&v99[8] = 2114;
              *(void *)v100 = @"DASParsing.m";
              *(_WORD *)&v100[8] = 1024;
              *(_DWORD *)v101 = 351;
              *(_WORD *)&v101[4] = 2114;
              *(void *)&v101[6] = v96;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ (%{public}@:%i) : %{public}@",  buf,  0x26u);
            }

            _bs_set_crash_log_message([v96 UTF8String]);
            __break(0);
            JUMPOUT(0x100005A7CLL);
          }

          int v29 = -87;
        }

        else
        {
          int v29 = -48;
        }

        uint64_t v26 = (v29 + (_DWORD)v28 + 16 * v26);
        ++v27;
      }

      while (v27 < (unint64_t)[v25 length]);
    }

    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v26));
    int v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%x",  [v30 unsignedIntValue]));
    if (([v31 isEqualToString:v24] & 1) == 0)
    {
      v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"parsed is not equivalent to original : parsed=%@ original=%@",  v31,  v24));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSNumber * _Nonnull uint32NumberFromHexString(NSString *__strong _Nonnull)"));
        *(_DWORD *)buf = 138544130;
        *(void *)v99 = v81;
        *(_WORD *)&v99[8] = 2114;
        *(void *)v100 = @"DASParsing.m";
        *(_WORD *)&v100[8] = 1024;
        *(_DWORD *)v101 = 356;
        *(_WORD *)&v101[4] = 2114;
        *(void *)&v101[6] = v80;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ (%{public}@:%i) : %{public}@",  buf,  0x26u);
      }

      _bs_set_crash_log_message([v80 UTF8String]);
      __break(0);
      JUMPOUT(0x1000057C4LL);
    }

    if (!v30)
    {
      v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to parse contextID %@ from '%@'",  v24,  v3));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v83 = NSStringFromSelector(*(SEL *)(a1 + 104));
        v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
        v85 = (objc_class *)objc_opt_class(*(void *)(a1 + 40));
        v86 = NSStringFromClass(v85);
        v87 = (void *)objc_claimAutoreleasedReturnValue(v86);
        uint64_t v88 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138544642;
        *(void *)v99 = v84;
        *(_WORD *)&v99[8] = 2114;
        *(void *)v100 = v87;
        *(_WORD *)&v100[8] = 2048;
        *(void *)v101 = v88;
        *(_WORD *)&v101[8] = 2114;
        *(void *)&v101[10] = @"DASParsing.m";
        __int16 v102 = 1024;
        int v103 = 444;
        __int16 v104 = 2114;
        v105 = v82;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
      }

      _bs_set_crash_log_message([v82 UTF8String]);
      __break(0);
      JUMPOUT(0x1000058B8LL);
    }

    id v32 = [v20 rangeWithName:@"pid"];
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v32, v33));
    id v35 = [v34 intValue];

    if ((int)v35 <= 0)
    {
      v89 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"must have a valid pid : %i from '%@'",  v35,  v3));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v90 = NSStringFromSelector(*(SEL *)(a1 + 104));
        v91 = (void *)objc_claimAutoreleasedReturnValue(v90);
        v92 = (objc_class *)objc_opt_class(*(void *)(a1 + 40));
        v93 = NSStringFromClass(v92);
        v94 = (void *)objc_claimAutoreleasedReturnValue(v93);
        uint64_t v95 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138544642;
        *(void *)v99 = v91;
        *(_WORD *)&v99[8] = 2114;
        *(void *)v100 = v94;
        *(_WORD *)&v100[8] = 2048;
        *(void *)v101 = v95;
        *(_WORD *)&v101[8] = 2114;
        *(void *)&v101[10] = @"DASParsing.m";
        __int16 v102 = 1024;
        int v103 = 448;
        __int16 v104 = 2114;
        v105 = v89;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
      }

      _bs_set_crash_log_message([v89 UTF8String]);
      __break(0);
      JUMPOUT(0x1000059ACLL);
    }

    id v36 = sub_10000661C();
    __int16 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v42 = [v30 unsignedIntValue];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v99 = v42;
      *(_WORD *)&v99[4] = 1024;
      *(_DWORD *)&v99[6] = (_DWORD)v35;
      *(_WORD *)v100 = 2112;
      *(void *)&v100[2] = v3;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEBUG,  "matched context %x for pid %i from '%@'",  buf,  0x18u);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) addObject:v30];
    id v38 = -[DASContextInfo _initWithIdentifier:pid:raw:]( [DASContextInfo alloc],  "_initWithIdentifier:pid:raw:",  [v30 unsignedIntValue],  v35,  v3);
    [*(id *)(a1 + 64) setObject:v38 forKey:v30];

LABEL_28:
    goto LABEL_30;
  }

  if (!v5 && [v3 length])
  {
    id v39 = sub_10000661C();
    int v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v99 = v3;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEBUG,  "failed to find any match in '%@'",  buf,  0xCu);
    }

    __int16 v41 = *(void **)(a1 + 72);
    id v24 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to find any match in '%@'",  v3));
    [v41 addObject:v24];
    goto LABEL_28;
  }

LABEL_30:
}

void sub_100005A84(int8x16_t *a1)
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100005BEC;
  v13[3] = &unk_1000104B0;
  int8x16_t v7 = a1[2];
  int8x16_t v14 = vextq_s8(v7, v7, 8uLL);
  [(id)v7.i64[0] appendBodySectionWithName:@"displays" multilinePrefix:0 block:v13];
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v3 = *(void **)(a1[2].i64[1] + 24);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100005D68;
  v11[3] = &unk_100010468;
  id v4 = v2;
  id v12 = v4;
  objc_msgSend(v3, "bs_each:", v11);
  id v5 = (void *)a1[2].i64[0];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100005E20;
  v8[3] = &unk_1000104B0;
  id v9 = v4;
  id v10 = v5;
  id v6 = v4;
  [v10 appendBodySectionWithName:@"contextsByPID" multilinePrefix:0 block:v8];
  [(id)a1[2].i64[0] appendArraySection:*(void *)(a1[2].i64[1] + 40) withName:@"parseErrors" skipIfEmpty:1];
}

void sub_100005BEC(uint64_t a1)
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 16LL);
  id v2 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        int8x16_t v7 = *(void **)(a1 + 40);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 attachedContexts]);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 array]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bs_map:", &stru_1000104D0));
        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsJoinedByString:", @", "));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
        [v7 appendString:v11 withName:v12];
      }

      id v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v3);
  }
}

void sub_100005D68(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a3 pid]));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKey:"));
  if (v6)
  {
    int8x16_t v7 = v6;
    [v6 addObject:v5];
  }

  else
  {
    int8x16_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v5));

    [*(id *)(a1 + 32) setObject:v7 forKey:v8];
  }
}

void sub_100005E20(uint64_t a1)
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allKeys]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sortedArrayUsingSelector:"));

  id obj = v3;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v16 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v16) {
          objc_enumerationMutation(obj);
        }
        int8x16_t v7 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v8 = *(void **)(a1 + 40);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:v7]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allObjects]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 sortedArrayUsingSelector:"compare:"]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bs_map:", &stru_1000104F0));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsJoinedByString:", @", "));
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
        [v8 appendString:v13 withName:v14];
      }

      id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v5);
  }
}

NSString *__cdecl sub_100005FDC(id a1, NSNumber *a2)
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%x",  -[NSNumber unsignedIntValue](a2, "unsignedIntValue"));
}

NSString *__cdecl sub_100006020(id a1, DASContextInfo *a2)
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%x",  -[DASContextInfo identifier](a2, "identifier"));
}

void *sub_100006064()
{
  id v4 = 0LL;
  if (!qword_1000153D0)
  {
    __int128 v5 = off_100010560;
    uint64_t v6 = 0LL;
    qword_1000153D0 = _sl_dlopen(&v5, &v4);
  }

  v0 = (void *)qword_1000153D0;
  if (!qword_1000153D0)
  {
    v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *QuartzCoreLibrary(void)"));
    objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"DASParsing.m",  24,  @"%s",  v4);

    __break(1u);
    goto LABEL_7;
  }

  v1 = v4;
  if (v4) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_100006168(uint64_t a1)
{
  id v2 = sub_100006064();
  off_100015290 = (uint64_t (*)())dlsym(v2, "CARenderClientGetArchivedLayerTree");
  return ((uint64_t (*)(uint64_t))off_100015290)(a1);
}

void sub_1000065FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

id sub_10000661C()
{
  if (qword_1000153F0 != -1) {
    dispatch_once(&qword_1000153F0, &stru_100010578);
  }
  return (id)qword_1000153E8;
}

void sub_10000665C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.BackBoard", "DisplayArchive");
  id v2 = (void *)qword_1000153E8;
  qword_1000153E8 = (uint64_t)v1;
}

void sub_1000066B4(id a1)
{
  v2[0] = *(objc_property_attribute_t *)off_1000105D8;
  v2[1] = *(objc_property_attribute_t *)&off_1000105E8;
  os_log_t v1 = (objc_class *)sub_10000672C();
  class_addProperty(v1, "UICALayerRenderID", v2, 2u);
}

id sub_10000672C()
{
  uint64_t v4 = 0LL;
  __int128 v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  v0 = (void *)qword_100015408;
  uint64_t v7 = qword_100015408;
  if (!qword_100015408)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_1000067E0;
    v3[3] = &unk_100010908;
    v3[4] = &v4;
    sub_1000067E0((uint64_t)v3);
    v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1000067C8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000067E0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("CALayer");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_100015408 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getCALayerClass(void)_block_invoke"));
    objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"DASProcessor.m",  26,  @"Unable to find class %s",  "CALayer");

    __break(1u);
  }

void *sub_1000068A4()
{
  uint64_t v4 = 0LL;
  if (!qword_100015400)
  {
    __int128 v5 = off_1000108E8;
    uint64_t v6 = 0LL;
    qword_100015400 = _sl_dlopen(&v5, &v4);
  }

  v0 = (void *)qword_100015400;
  if (!qword_100015400)
  {
    v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *QuartzCoreLibrary(void)"));
    objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"DASProcessor.m",  24,  @"%s",  v4);

    __break(1u);
    goto LABEL_7;
  }

  id v1 = v4;
  if (v4) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_100007820(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 attachedContexts]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100007914;
  v8[3] = &unk_100010710;
  id v6 = a1[4];
  id v9 = a1[5];
  id v10 = v3;
  id v11 = a1[4];
  id v12 = a1[6];
  id v7 = v3;
  sub_1000081B4(v4, v5, v6, 0LL, v8);
}

void sub_100007914(uint64_t a1, void *a2, void *a3)
{
  id v68 = a2;
  id v4 = a3;
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v85 objects:v98 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v86;
    id v73 = v4;
    do
    {
      id v8 = 0LL;
      id v75 = v6;
      do
      {
        if (*(void *)v86 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v85 + 1) + 8LL * (void)v8);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v9]);
        if ((unint64_t)[v10 count] >= 2)
        {
          id v11 = [v10 count];
          id v12 = sub_10000661C();
          uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
          if (v11 == (id)2)
          {
            if (v14)
            {
              unsigned int v15 = [v9 unsignedIntValue];
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v90 = v15;
              _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "skipped context %x because it was already processed",  buf,  8u);
            }

            uint64_t v16 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"skipped context %x because it was already processed",  [v9 unsignedIntValue],  v67);
          }

          else
          {
            if (v14)
            {
              unsigned int v17 = [v9 unsignedIntValue];
              __int128 v18 = (char *)[v10 count];
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v90 = v17;
              *(_WORD *)&v90[4] = 2048;
              *(void *)&v90[6] = v18 - 1;
              _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "skipped context %x because it was already processed (%lux)",  buf,  0x12u);
            }

            uint64_t v16 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"skipped context %x because it was already processed (%lux)",  [v9 unsignedIntValue],  (char *)objc_msgSend(v10, "count") - 1);
          }

          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v16);
          [*(id *)(a1 + 32) addObject:v19];
          id v20 = sub_10000661C();
          id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);

          if (v22)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:0]);
            id v24 = sub_100009F10(v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
            sub_100009FF4(v25, &stru_100010800);

            if ((unint64_t)[v10 count] >= 2)
            {
              unint64_t v26 = 1LL;
              do
              {
                unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:v26]);
                id v28 = sub_100009F10(v27);
                int v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
                v84[0] = _NSConcreteStackBlock;
                v84[1] = 3221225472LL;
                v84[2] = sub_10000A1A0;
                v84[3] = &unk_100010660;
                v84[4] = v26;
                sub_100009FF4(v29, v84);

                ++v26;
              }

              while (v26 < (unint64_t)[v10 count]);
            }
          }

          id v4 = v73;
          id v6 = v75;
        }

        id v8 = (char *)v8 + 1;
      }

      while (v8 != v6);
      id v6 = [v4 countByEnumeratingWithState:&v85 objects:v98 count:16];
    }

    while (v6);
  }

  id v30 = sub_10000661C();
  int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG);

  if (v32)
  {
    id v33 = sub_10000661C();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
      *(_DWORD *)buf = 138412290;
      *(void *)v90 = v65;
      _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "final layer tree for %@", buf, 0xCu);
    }

    sub_10000A268(v68, &stru_100010820);
  }

  [sub_100008724() begin];
  id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) contexts]);
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472LL;
  v81[2] = sub_10000A474;
  v81[3] = &unk_1000106A8;
  id v69 = v4;
  id v82 = v69;
  id v37 = v35;
  id v83 = v37;
  objc_msgSend(v36, "bs_each:", v81);

  v74 = v37;
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 allKeys]);
  id v39 = (void *)objc_claimAutoreleasedReturnValue([v38 sortedArrayUsingSelector:"compare:"]);

  id obj = v39;
  id v40 = [v39 countByEnumeratingWithState:&v77 objects:v97 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v78;
    do
    {
      for (i = 0LL; i != v41; i = (char *)i + 1)
      {
        if (*(void *)v78 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = *(void *)(*((void *)&v77 + 1) + 8LL * (void)i);
        v95[0] = @"pid";
        v95[1] = @"contextIDs";
        v96[0] = v44;
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKey:"));
        v46 = (void *)objc_claimAutoreleasedReturnValue([v45 allObjects]);
        v47 = (void *)objc_claimAutoreleasedReturnValue([v46 sortedArrayUsingSelector:"compare:"]);
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "bs_map:", &stru_100010840));
        v96[1] = v48;
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v96,  v95,  2LL));
        [v76 addObject:v49];
      }

      id v41 = [obj countByEnumeratingWithState:&v77 objects:v97 count:16];
    }

    while (v41);
  }

  v93[0] = @"Display";
  v91[0] = @"name";
  obja = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
  v91[1] = @"attachedContexts";
  v92[0] = obja;
  v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) attachedContexts]);
  v51 = (void *)objc_claimAutoreleasedReturnValue([v50 array]);
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "bs_map:", &stru_100010880));
  v53 = (void *)objc_claimAutoreleasedReturnValue([v52 sortedArrayUsingSelector:"compare:"]);
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "bs_map:", &stru_1000108A0));
  v92[1] = v54;
  v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v92,  v91,  2LL));
  v94[0] = v55;
  v93[1] = @"ContextIDsByPID";
  id v56 = [v76 copy];
  v94[1] = v56;
  v93[2] = @"ParseErrors";
  id v57 = [*(id *)(a1 + 32) copy];
  v94[2] = v57;
  v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v94,  v93,  3LL));

  off_100015360(1LL);
  off_100015368(1LL);
  v59 = (void *)off_100015358(v68, v58);
  id v60 = sub_10000661C();
  v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
  v62 = v61;
  if (v59)
  {
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
      *(_DWORD *)buf = 138412546;
      *(void *)v90 = v64;
      *(_WORD *)&v90[8] = 2112;
      *(void *)&v90[10] = v58;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEBUG,  "archived display '%@' with info:\n%@",  buf,  0x16u);
    }

    uint64_t v63 = *(void **)(a1 + 56);
    v62 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
    [v63 setObject:v59 forKey:v62];
  }

  else if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
    *(_DWORD *)buf = 138412290;
    *(void *)v90 = v66;
    _os_log_error_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_ERROR,  "failed to create archive of display '%@'",  buf,  0xCu);
  }

  [sub_100008724() commit];
}

void sub_1000081B4(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v41 = a1;
  id v9 = a2;
  id v42 = a3;
  id v43 = a4;
  id v40 = a5;
  if (!v9)
  {
    id v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void processRootContexts(NSString *__strong, NSOrderedSet<DASContextInfo *> *__strong, __strong id <DASContextArchiveProvider>, __strong DASContextLayerProcessor, void (^__strong)(CALayer *__strong , NSMapTable<NSNumber *,NSMutableArray<CALayer *> *> *__strong))"));
    [v36 handleFailureInFunction:v37, @"DASProcessor.m", 206, @"Invalid parameter not satisfying: %@", @"rootContexts" file lineNumber description];
  }

  [sub_100008724() begin];
  context = objc_autoreleasePoolPush();
  id v10 = [sub_10000672C() layer];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  *(void *)buf = 0LL;
  *(void *)&__int128 v61 = buf;
  *((void *)&v61 + 1) = 0x2050000000LL;
  id v12 = (void *)qword_100015420;
  uint64_t v62 = qword_100015420;
  if (!qword_100015420)
  {
    uint64_t v49 = _NSConcreteStackBlock;
    uint64_t v50 = 3221225472LL;
    uint64_t v51 = (uint64_t)sub_1000087D8;
    v52 = (id (*)(uint64_t, uint64_t))&unk_100010908;
    v53 = buf;
    sub_1000087D8((uint64_t)&v49);
    id v12 = *(void **)(v61 + 24);
  }

  id v13 = v12;
  _Block_object_dispose(buf, 8);
  id v39 = (void *)objc_claimAutoreleasedReturnValue([v13 localContext]);
  [v39 setLayer:v11];
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id obj = v9;
  id v15 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  if (v15)
  {
    uint64_t v18 = *(void *)v56;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v56 != v18) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
        id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v20 identifier]));
        BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v21]);

        if (v22)
        {
          [v22 addObject:v11];
        }

        else
        {
          BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v11));
          v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v20 identifier]));
          [v14 setObject:v22 forKey:v23];

          uint64_t v49 = 0LL;
          uint64_t v50 = (uint64_t)&v49;
          uint64_t v51 = 0x3032000000LL;
          v52 = sub_10000889C;
          v53 = (uint8_t *)sub_1000088C4;
          id v54 = 0LL;
          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472LL;
          v45[2] = sub_1000088CC;
          v45[3] = &unk_100010930;
          id v46 = v14;
          id v24 = v43;
          id v47 = v24;
          v48 = &v49;
          v25 = objc_retainBlock(v45);
          unint64_t v26 = objc_retainBlock(v25);
          unint64_t v27 = *(void **)(v50 + 40);
          *(void *)(v50 + 40) = v26;

          id v28 = sub_100009438(v20, v42, v24, *(void **)(v50 + 40));
          int v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
          id v30 = *(void **)(v50 + 40);
          *(void *)(v50 + 40) = 0LL;

          if (v29)
          {
            [v11 addSublayer:v29];
            [v29 frame];
            if (width < v31) {
              double width = v31;
            }
            if (height < v32) {
              double height = v32;
            }
          }

          else
          {
            id v33 = sub_10000661C();
            v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              unsigned int v35 = [v20 identifier];
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&uint8_t buf[4] = v35;
              LOWORD(v61) = 2112;
              *(void *)((char *)&v61 + 2) = v41;
              _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "no root layer found in context %x while processing for %@",  buf,  0x12u);
            }
          }

          _Block_object_dispose(&v49, 8);
        }
      }

      id v15 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
    }

    while (v15);
  }

  objc_msgSend(v11, "setFrame:", CGRectZero.origin.x, CGRectZero.origin.y, width, height);
  if (v40) {
    v40[2](v40, v11, v14);
  }

  objc_autoreleasePoolPop(context);
  [sub_100008724() commit];
}

void sub_1000086F0(_Unwind_Exception *a1)
{
}

id sub_100008724()
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  v0 = (void *)qword_100015418;
  uint64_t v7 = qword_100015418;
  if (!qword_100015418)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100009E4C;
    v3[3] = &unk_100010908;
    v3[4] = &v4;
    sub_100009E4C((uint64_t)v3);
    v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1000087C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000087D8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("CAContext");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_100015420 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getCAContextClass(void)_block_invoke"));
    objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"DASProcessor.m",  25,  @"Unable to find class %s",  "CAContext");

    __break(1u);
  }

id sub_10000889C(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_1000088C4(uint64_t a1)
{
}

void sub_1000088CC(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v95 = v4;
  v92 = v5;
  if (v4)
  {
    if (v5) {
      goto LABEL_3;
    }
  }

  else
  {
    __int128 v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    __int128 v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void processRootContexts(NSString *__strong, NSOrderedSet<DASContextInfo *> *__strong, __strong id <DASContextArchiveProvider>, __strong DASContextLayerProcessor, void (^__strong)(CALayer *__strong , NSMapTable<NSNumber *,NSMutableArray<CALayer *> *> *__strong))_block_invoke"));
    [v85 handleFailureInFunction:v86, @"DASProcessor.m", 228, @"Invalid parameter not satisfying: %@", @"layer" file lineNumber description];

    if (v92) {
      goto LABEL_3;
    }
  }

  __int128 v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  __int128 v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void processRootContexts(NSString *__strong, NSOrderedSet<DASContextInfo *> *__strong, __strong id<D ASContextArchiveProvider>, __strong DASContextLayerProcessor, void (^__strong)(CALayer *__strong, NS MapTable<NSNumber *,NSMutableArray<CALayer *> *> *__strong))_block_invoke"));
  [v87 handleFailureInFunction:v88, @"DASProcessor.m", 229, @"Invalid parameter not satisfying: %@", @"contextArchiveProvider" file lineNumber description];

LABEL_3:
  uint64_t v116 = 0LL;
  v117 = &v116;
  uint64_t v118 = 0x2050000000LL;
  uint64_t v6 = (void *)qword_100015428;
  uint64_t v119 = qword_100015428;
  if (!qword_100015428)
  {
    *(void *)buf = _NSConcreteStackBlock;
    uint64_t v126 = 3221225472LL;
    v127 = sub_1000099E8;
    v128 = &unk_100010908;
    v129 = &v116;
    sub_1000099E8((uint64_t)buf);
    uint64_t v6 = (void *)v117[3];
  }

  id v7 = v6;
  _Block_object_dispose(&v116, 8);
  uint64_t v8 = objc_opt_class(v7);
  if ((objc_opt_isKindOfClass(v4, v8) & 1) != 0)
  {
    id v9 = [v4 contextId];
    id v10 = *(void **)(a1 + 32);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v9));
    id obj = (id)objc_claimAutoreleasedReturnValue([v10 objectForKey:v11]);

    if (obj)
    {
      [obj addObject:v4];
    }

    else
    {
      id obj = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v4));
      __int128 v61 = *(void **)(a1 + 32);
      uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v9));
      [v61 setObject:obj forKey:v62];

      uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "contextWithIdentifier:", objc_msgSend(v4, "contextId")));
      v64 = v63;
      if (v63)
      {
        id v65 = sub_100009438(v63, v92, *(void **)(a1 + 40), *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
        v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
        if (v66)
        {
          [v4 addSublayer:v66];
        }

        else
        {
          id v83 = sub_10000661C();
          v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = (_DWORD)v9;
            _os_log_error_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_ERROR,  "no hosted layers found for %x",  buf,  8u);
          }

          v66 = 0LL;
        }
      }

      else
      {
        id v82 = sub_10000661C();
        v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = (_DWORD)v9;
          _os_log_error_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_ERROR,  "server didn't know about hosted layers for %x",  buf,  8u);
        }
      }
    }

    goto LABEL_88;
  }

  uint64_t v116 = 0LL;
  v117 = &v116;
  uint64_t v118 = 0x2050000000LL;
  id v12 = (void *)qword_100015440;
  uint64_t v119 = qword_100015440;
  if (!qword_100015440)
  {
    *(void *)buf = _NSConcreteStackBlock;
    uint64_t v126 = 3221225472LL;
    v127 = sub_100009AAC;
    v128 = &unk_100010908;
    v129 = &v116;
    sub_100009AAC((uint64_t)buf);
    id v12 = (void *)v117[3];
  }

  id v13 = v12;
  _Block_object_dispose(&v116, 8);
  uint64_t v14 = objc_opt_class(v13);
  if ((objc_opt_isKindOfClass(v4, v14) & 1) != 0)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 sourceLayer]);
    BOOL v16 = v15 == 0LL;

    if (v16)
    {
      id v67 = [v95 sourceContextId];
      id v68 = [v95 sourceLayerRenderId];
      if ((_DWORD)v67)
      {
        id v69 = v68;
        if (v68)
        {
          uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue([v95 context]);
          BOOL v71 = (_DWORD)v67 == [v70 contextId];

          if (!v71)
          {
            v72 = (void *)objc_claimAutoreleasedReturnValue([v92 contextWithIdentifier:v67]);
            if (v72)
            {
              id v73 = *(void **)(a1 + 32);
              v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v67));
              id v75 = (void *)objc_claimAutoreleasedReturnValue([v73 objectForKey:v74]);

              __int128 v114 = 0u;
              __int128 v115 = 0u;
              __int128 v112 = 0u;
              __int128 v113 = 0u;
              id v76 = v75;
              id v77 = [v76 countByEnumeratingWithState:&v112 objects:v124 count:16];
              __int128 v78 = v76;
              if (v77)
              {
                uint64_t v79 = *(void *)v113;
                while (2)
                {
                  for (i = 0LL; i != v77; i = (char *)i + 1)
                  {
                    if (*(void *)v113 != v79) {
                      objc_enumerationMutation(v76);
                    }
                    id v81 = sub_100009B70(*(void **)(*((void *)&v112 + 1) + 8LL * (void)i), v69);
                    __int128 v78 = (void *)objc_claimAutoreleasedReturnValue(v81);
                    if (v78)
                    {

                      [v95 setSourceLayer:v78];
                      goto LABEL_90;
                    }
                  }

                  id v77 = [v76 countByEnumeratingWithState:&v112 objects:v124 count:16];
                  if (v77) {
                    continue;
                  }
                  break;
                }

                __int128 v78 = v76;
              }

LABEL_90:
            }
          }
        }
      }
    }
  }

  __int128 v110 = 0u;
  __int128 v111 = 0u;
  __int128 v108 = 0u;
  __int128 v109 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v95 animationKeys]);
  id v94 = [obj countByEnumeratingWithState:&v108 objects:v123 count:16];
  if (v94)
  {
    uint64_t v93 = *(void *)v109;
    do
    {
      for (j = 0LL; j != v94; j = (char *)j + 1)
      {
        if (*(void *)v109 != v93) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v108 + 1) + 8LL * (void)j);
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v95 animationForKey:v18]);
        uint64_t v116 = 0LL;
        v117 = &v116;
        uint64_t v118 = 0x2050000000LL;
        id v20 = (void *)qword_100015448;
        uint64_t v119 = qword_100015448;
        if (!qword_100015448)
        {
          *(void *)buf = _NSConcreteStackBlock;
          uint64_t v126 = 3221225472LL;
          v127 = sub_100009CC4;
          v128 = &unk_100010908;
          v129 = &v116;
          sub_100009CC4((uint64_t)buf);
          id v20 = (void *)v117[3];
        }

        id v21 = v20;
        _Block_object_dispose(&v116, 8);
        if ((objc_opt_isKindOfClass(v19, v21) & 1) != 0)
        {
          id v22 = v19;
          v23 = (void *)objc_claimAutoreleasedReturnValue([v22 sourceLayer]);
          BOOL v24 = v23 == 0LL;

          if (!v24) {
            goto LABEL_54;
          }
          id v25 = [v22 sourceContextId];
          id v26 = [v22 sourceLayerRenderId];
          if (!(_DWORD)v25) {
            goto LABEL_54;
          }
          unint64_t v27 = v26;
          if (!v26) {
            goto LABEL_54;
          }
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v95 context]);
          BOOL v29 = (_DWORD)v25 == [v28 contextId];

          if (v29) {
            goto LABEL_54;
          }
          uint64_t v89 = objc_claimAutoreleasedReturnValue([v92 contextWithIdentifier:v25]);
          id v30 = (void *)v89;
          if (!v89) {
            goto LABEL_53;
          }
          double v31 = *(void **)(a1 + 32);
          double v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v25));
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKey:v32]);

          __int128 v106 = 0u;
          __int128 v107 = 0u;
          __int128 v104 = 0u;
          __int128 v105 = 0u;
          id v34 = v33;
          id v35 = [v34 countByEnumeratingWithState:&v104 objects:v122 count:16];
          if (v35)
          {
            uint64_t v36 = *(void *)v105;
LABEL_27:
            uint64_t v37 = 0LL;
            while (1)
            {
              if (*(void *)v105 != v36) {
                objc_enumerationMutation(v34);
              }
              id v38 = sub_100009B70(*(void **)(*((void *)&v104 + 1) + 8 * v37), v27);
              id v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
              if (v39) {
                goto LABEL_51;
              }
              if (v35 == (id)++v37)
              {
                id v35 = [v34 countByEnumeratingWithState:&v104 objects:v122 count:16];
                if (v35) {
                  goto LABEL_27;
                }
                goto LABEL_50;
              }
            }
          }

          goto LABEL_50;
        }

        uint64_t v116 = 0LL;
        v117 = &v116;
        uint64_t v118 = 0x2050000000LL;
        id v40 = (void *)qword_100015450;
        uint64_t v119 = qword_100015450;
        if (!qword_100015450)
        {
          *(void *)buf = _NSConcreteStackBlock;
          uint64_t v126 = 3221225472LL;
          v127 = sub_100009D88;
          v128 = &unk_100010908;
          v129 = &v116;
          sub_100009D88((uint64_t)buf);
          id v40 = (void *)v117[3];
        }

        id v41 = v40;
        _Block_object_dispose(&v116, 8);
        if ((objc_opt_isKindOfClass(v19, v41) & 1) != 0)
        {
          id v22 = v19;
          id v42 = (void *)objc_claimAutoreleasedReturnValue([v22 sourceLayer]);
          BOOL v43 = v42 == 0LL;

          if (!v43) {
            goto LABEL_54;
          }
          id v44 = [v22 sourceContextId];
          id v45 = [v22 sourceLayerRenderId];
          if (!(_DWORD)v44) {
            goto LABEL_54;
          }
          id v46 = v45;
          if (!v45) {
            goto LABEL_54;
          }
          id v47 = (void *)objc_claimAutoreleasedReturnValue([v95 context]);
          BOOL v48 = (_DWORD)v44 == [v47 contextId];

          if (v48) {
            goto LABEL_54;
          }
          uint64_t v89 = objc_claimAutoreleasedReturnValue([v92 contextWithIdentifier:v44]);
          id v30 = (void *)v89;
          if (!v89) {
            goto LABEL_53;
          }
          uint64_t v49 = *(void **)(a1 + 32);
          uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v44));
          uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v49 objectForKey:v50]);

          __int128 v102 = 0u;
          __int128 v103 = 0u;
          __int128 v100 = 0u;
          __int128 v101 = 0u;
          id v34 = v51;
          id v52 = [v34 countByEnumeratingWithState:&v100 objects:v121 count:16];
          if (v52)
          {
            uint64_t v53 = *(void *)v101;
LABEL_44:
            uint64_t v54 = 0LL;
            while (1)
            {
              if (*(void *)v101 != v53) {
                objc_enumerationMutation(v34);
              }
              id v55 = sub_100009B70(*(void **)(*((void *)&v100 + 1) + 8 * v54), v46);
              id v39 = (void *)objc_claimAutoreleasedReturnValue(v55);
              if (v39) {
                break;
              }
              if (v52 == (id)++v54)
              {
                id v52 = [v34 countByEnumeratingWithState:&v100 objects:v121 count:16];
                if (v52) {
                  goto LABEL_44;
                }
                goto LABEL_50;
              }
            }

LABEL_51:
            id v56 = [v22 copy];
            [v56 setSourceLayer:v39];
            [v95 addAnimation:v56 forKey:v18];
LABEL_52:

            id v22 = v56;
            id v30 = (void *)v89;
LABEL_53:

LABEL_54:
            goto LABEL_55;
          }

LABEL_50:
          id v39 = v34;
          id v56 = v22;
          goto LABEL_52;
        }

LABEL_55:
      }

      id v94 = [obj countByEnumeratingWithState:&v108 objects:v123 count:16];
    }

    while (v94);
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
  {
    __int128 v98 = 0u;
    __int128 v99 = 0u;
    __int128 v96 = 0u;
    __int128 v97 = 0u;
    __int128 v57 = (void *)objc_claimAutoreleasedReturnValue([v95 sublayers]);
    __int128 v58 = (char *)[v57 countByEnumeratingWithState:&v96 objects:v120 count:16];
    if (v58)
    {
      uint64_t v59 = *(void *)v97;
      do
      {
        for (k = 0LL; k != v58; ++k)
        {
          if (*(void *)v97 != v59) {
            objc_enumerationMutation(v57);
          }
          (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) + 16LL))();
        }

        __int128 v58 = (char *)[v57 countByEnumeratingWithState:&v96 objects:v120 count:16];
      }

      while (v58);
    }
  }

LABEL_88:
}

void sub_10000940C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

id sub_100009438(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }

  else
  {
    id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    double v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "CALayer *layersForContextUsingArchiveProvider(DASContextInfo *__strong, __strong id<DASContextArch iveProvider>, __strong DASContextLayerProcessor, __strong DASLayerWalker)"));
    [v30 handleFailureInFunction:v31, @"DASProcessor.m", 163, @"Invalid parameter not satisfying: %@", @"contextInfo" file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }

  double v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "CALayer *layersForContextUsingArchiveProvider(DASContextInfo *__strong, __strong id<DASContextArchiv eProvider>, __strong DASContextLayerProcessor, __strong DASLayerWalker)"));
  [v32 handleFailureInFunction:v33, @"DASProcessor.m", 164, @"Invalid parameter not satisfying: %@", @"contextArchiveProvider" file lineNumber description];

LABEL_3:
  context = objc_autoreleasePoolPush();
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 archiveOfContext:v7]);
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
    id v14 = v7;
    if (!v7)
    {
      id v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "CALayer *layersFromArchiveOfContextInfo(NSData *__strong, DASContextInfo *__strong)"));
      [v34 handleFailureInFunction:v35, @"DASProcessor.m", 150, @"Invalid parameter not satisfying: %@", @"contextInfo" file lineNumber description];
    }

    id v39 = 0LL;
    id v40 = &v39;
    uint64_t v41 = 0x2050000000LL;
    id v15 = (id)qword_100015430;
    uint64_t v42 = qword_100015430;
    if (!qword_100015430)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&__int128 v44 = 3221225472LL;
      *((void *)&v44 + 1) = sub_100009924;
      id v45 = &unk_100010908;
      id v46 = &v39;
      sub_100009924((uint64_t)buf);
      id v15 = v40[3];
    }

    id v16 = v15;
    _Block_object_dispose(&v39, 8);
    *(void *)buf = 0LL;
    *(void *)&__int128 v44 = buf;
    *((void *)&v44 + 1) = 0x2020000000LL;
    unsigned int v17 = (void **)qword_100015438;
    id v45 = (void *)qword_100015438;
    if (!qword_100015438)
    {
      uint64_t v18 = sub_1000068A4();
      unsigned int v17 = (void **)dlsym(v18, "kCAPackageTypeArchive");
      *(void *)(v44 + 24) = v17;
      qword_100015438 = (uint64_t)v17;
    }

    _Block_object_dispose(buf, 8);
    if (!v17)
    {
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "CAPackageType getkCAPackageTypeArchive(void)"));
      objc_msgSend( v36,  "handleFailureInFunction:file:lineNumber:description:",  v37,  @"DASProcessor.m",  34,  @"%s",  dlerror());

      __break(1u);
    }

    __int128 v19 = *v17;
    id v39 = 0LL;
    id v20 = v19;
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v16 packageWithData:v13 type:v20 options:0 error:&v39]);
    id v22 = v39;

    if (v22)
    {
      id v23 = sub_10000661C();
      BOOL v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        unsigned int v29 = [v14 identifier];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v29;
        LOWORD(v44) = 2112;
        *(void *)((char *)&v44 + 2) = v22;
        _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "failed to create package from context %x with error=%@",  buf,  0x12u);
      }
    }

    id v25 = (void *)objc_claimAutoreleasedReturnValue([v21 rootLayer]);

    if (v25)
    {
      if (v9) {
        v9[2](v9, v14, v25);
      }
      if (v10) {
        v10[2](v10, v25, v8);
      }
    }
  }

  else
  {
    id v26 = sub_10000661C();
    unint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = [v7 identifier];
      _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "could not retrieve archive of context %x",  buf,  8u);
    }

    id v25 = 0LL;
  }

  objc_autoreleasePoolPop(context);
  return v25;
}

void sub_1000098F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void sub_100009924(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("CAPackage");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_100015430 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getCAPackageClass(void)_block_invoke"));
    objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"DASProcessor.m",  30,  @"Unable to find class %s",  "CAPackage");

    __break(1u);
  }

void sub_1000099E8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("CALayerHost");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_100015428 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getCALayerHostClass(void)_block_invoke"));
    objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"DASProcessor.m",  27,  @"Unable to find class %s",  "CALayerHost");

    __break(1u);
  }

void sub_100009AAC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("CAPortalLayer");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_100015440 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getCAPortalLayerClass(void)_block_invoke"));
    objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"DASProcessor.m",  31,  @"Unable to find class %s",  "CAPortalLayer");

    __break(1u);
  }

id sub_100009B70(void *a1, id a2)
{
  id v3 = a1;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"UICALayerRenderID"]);
  id v5 = [v4 unsignedLongValue];

  if (v5 == a2)
  {
    id v6 = v3;
  }

  else
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sublayers", 0));
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        id v11 = 0LL;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = sub_100009B70(*(void *)(*((void *)&v15 + 1) + 8LL * (void)v11), a2);
          uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
          if (v13)
          {
            id v6 = (id)v13;
            goto LABEL_13;
          }

          id v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v6 = 0LL;
LABEL_13:
  }

  return v6;
}

void sub_100009CC4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("CAMatchMoveAnimation");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_100015448 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getCAMatchMoveAnimationClass(void)_block_invoke"));
    objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"DASProcessor.m",  28,  @"Unable to find class %s",  "CAMatchMoveAnimation");

    __break(1u);
  }

void sub_100009D88(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("CAMatchPropertyAnimation");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_100015450 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getCAMatchPropertyAnimationClass(void)_block_invoke"));
    objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"DASProcessor.m",  29,  @"Unable to find class %s",  "CAMatchPropertyAnimation");

    __break(1u);
  }

void sub_100009E4C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("CATransaction");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_100015418 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getCATransactionClass(void)_block_invoke"));
    objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"DASProcessor.m",  32,  @"Unable to find class %s",  "CATransaction");

    __break(1u);
  }

id sub_100009F10(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSMutableArray<CALayer *> *ancestoryOfLayer(CALayer *__strong, BOOL)"));
    [v5 handleFailureInFunction:v6, @"DASProcessor.m", 135, @"Invalid parameter not satisfying: %@", @"layer" file lineNumber description];
  }

  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (v1)
  {
    do
    {
      [v2 insertObject:v1 atIndex:0];
      uint64_t v3 = objc_claimAutoreleasedReturnValue([v1 superlayer]);

      id v1 = (id)v3;
    }

    while (v3);
  }

  return v2;
}

void sub_100009FF4(void *a1, void *a2)
{
  id v13 = a1;
  uint64_t v3 = a2;
  id v4 = v13;
  if (v13)
  {
    if (v3) {
      goto LABEL_3;
    }
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void layerPathDescription(NSArray<CALayer *> *__strong, __strong DASLoggerBlock)"));
    [v9 handleFailureInFunction:v10, @"DASProcessor.m", 118, @"Invalid parameter not satisfying: %@", @"path" file lineNumber description];

    id v4 = 0LL;
    if (v3) {
      goto LABEL_3;
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void layerPathDescription(NSArray<CALayer *> *__strong, __strong DASLoggerBlock)"));
  [v11 handleFailureInFunction:v12, @"DASProcessor.m", 119, @"Invalid parameter not satisfying: %@", @"logger" file lineNumber description];

  id v4 = v13;
LABEL_3:
  if ([v4 count])
  {
    unint64_t v5 = 0LL;
    do
    {
      id v6 = objc_autoreleasePoolPush();
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndex:v5]);
      sub_10000A888(v8, v7, v5);

      v3[2](v3, v7);
      objc_autoreleasePoolPop(v6);
      ++v5;
    }

    while ((unint64_t)[v13 count] > v5);
  }
}

void sub_10000A1A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000661C();
  unint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 134218242;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "skp%lu: %@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_10000A268(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unint64_t v5 = v4;
  if (!v3)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void recursiveLayerDescription(CALayer *__strong, __strong DASLoggerBlock)"));
    [v12 handleFailureInFunction:v13, @"DASProcessor.m", 95, @"Invalid parameter not satisfying: %@", @"layer" file lineNumber description];

    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void recursiveLayerDescription(CALayer *__strong, __strong DASLoggerBlock)"));
    [v14 handleFailureInFunction:v15, @"DASProcessor.m", 96, @"Invalid parameter not satisfying: %@", @"logger" file lineNumber description];

    goto LABEL_3;
  }

  if (!v4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = objc_autoreleasePoolPush();
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_10000889C;
  id v23 = sub_1000088C4;
  id v24 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10000A720;
  v16[3] = &unk_100010958;
  id v7 = v5;
  id v17 = v7;
  __int128 v18 = &v19;
  uint64_t v8 = objc_retainBlock(v16);
  __int16 v9 = objc_retainBlock(v8);
  id v10 = (void *)v20[5];
  v20[5] = (uint64_t)v9;

  ((void (*)(void *, id, void))v8[2])(v8, v3, 0LL);
  id v11 = (void *)v20[5];
  v20[5] = 0LL;

  _Block_object_dispose(&v19, 8);
  objc_autoreleasePoolPop(v6);
}

void sub_10000A45C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000A474(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v8 identifier]));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:v3]);

  if (v4)
  {
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v8 pid]));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:v5]);
    if (v6)
    {
      id v7 = v6;
      [v6 addObject:v3];
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v3));
      [*(id *)(a1 + 40) setObject:v7 forKey:v5];
    }
  }
}

_BYTE *sub_10000A560(char a1)
{
  id v2 = sub_1000068A4();
  id result = dlsym(v2, "CAEncodeBackingStores");
  qword_100015458 = (uint64_t)result;
  off_100015360 = sub_10000A5A8;
  *id result = a1;
  return result;
}

uint64_t sub_10000A5A8(uint64_t result)
{
  *(_BYTE *)qword_100015458 = result;
  return result;
}

_BYTE *sub_10000A5B8(char a1)
{
  id v2 = sub_1000068A4();
  id result = dlsym(v2, "CALayerEncodeAllAnimations");
  qword_100015460 = (uint64_t)result;
  off_100015368 = sub_10000A600;
  *id result = a1;
  return result;
}

uint64_t sub_10000A600(uint64_t result)
{
  *(_BYTE *)qword_100015460 = result;
  return result;
}

uint64_t sub_10000A610(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = sub_1000068A4();
  off_100015358 = (uint64_t (*)(void, void))dlsym(v4, "CAEncodeLayerTreeWithInfo");
  uint64_t v5 = off_100015358(v3, a2);

  return v5;
}

NSString *__cdecl sub_10000A668(id a1, NSNumber *a2)
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%x",  -[NSNumber unsignedIntValue](a2, "unsignedIntValue"));
}

NSNumber *__cdecl sub_10000A6AC(id a1, DASContextInfo *a2)
{
  return +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[DASContextInfo identifier](a2, "identifier"));
}

NSString *__cdecl sub_10000A6DC(id a1, NSNumber *a2)
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%x",  -[NSNumber unsignedIntValue](a2, "unsignedIntValue"));
}

void sub_10000A720(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = objc_autoreleasePoolPush();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  sub_10000A888(v5, v7, a3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();

  objc_autoreleasePoolPop(v6);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sublayers", 0));
  __int16 v9 = (char *)[v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) + 16LL))();
      }

      id v10 = (char *)[v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v10);
  }
}

void sub_10000A888(void *a1, void *a2, int a3)
{
  id v14 = a1;
  id v5 = a2;
  if (v14)
  {
    if (v5) {
      goto LABEL_3;
    }
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void appendLevelDescription(CALayer *__strong, NSMutableString *__strong, int)"));
    [v10 handleFailureInFunction:v11, @"DASProcessor.m", 79, @"Invalid parameter not satisfying: %@", @"layer" file lineNumber description];

    if (v5) {
      goto LABEL_3;
    }
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void appendLevelDescription(CALayer *__strong, NSMutableString *__strong, int)"));
  [v12 handleFailureInFunction:v13, @"DASProcessor.m", 80, @"Invalid parameter not satisfying: %@", @"info" file lineNumber description];

LABEL_3:
  if ([v5 length]) {
    [v5 appendString:@"\n"];
  }
  if (a3)
  {
    unint64_t v6 = 1LL;
    do
    {
      [v5 appendString:@"\t| "];
      ++v6;
    }

    while (v6 <= a3);
  }

  uint64_t v7 = objc_claimAutoreleasedReturnValue([v14 debugDescription]);
  id v8 = (void *)v7;
  if (v7) {
    __int16 v9 = (const __CFString *)v7;
  }
  else {
    __int16 v9 = @"-desc was nil!-";
  }
  [v5 appendString:v9];
}

void sub_10000AA20(id a1, NSString *a2)
{
  id v2 = a2;
  id v3 = sub_10000661C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    unint64_t v6 = v2;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "final: %@", (uint8_t *)&v5, 0xCu);
  }
}

void sub_10000AACC(id a1, NSString *a2)
{
  id v2 = a2;
  id v3 = sub_10000661C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    unint64_t v6 = v2;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "prsd: %@", (uint8_t *)&v5, 0xCu);
  }
}

void sub_10000AB78(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a2 pid]));
  [v2 addObject:v3];
}

void sub_10000ABD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(&OBJC_CLASS___RBSAssertion);
  int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DumpDisplay: naming %@",  v3));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[RBSTarget targetWithPid:]( RBSTarget,  "targetWithPid:",  [v3 unsignedIntValue]));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.displayarchive",  @"RenderClientProcessing"));
  __int128 v16 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  __int16 v9 = -[RBSAssertion initWithExplanation:target:attributes:](v4, "initWithExplanation:target:attributes:", v5, v6, v8);

  id v13 = 0LL;
  -[RBSAssertion acquireWithError:](v9, "acquireWithError:", &v13);
  id v10 = v13;
  if (v10)
  {
    id v11 = sub_10000661C();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "error acquiring assertion to name pid %@",  buf,  0xCu);
    }
  }

  [*(id *)(a1 + 32) addObject:v9];
}

void sub_10000AD8C(id a1, RBSAssertion *a2)
{
}

void sub_10000AD94(id a1, NSNumber *a2)
{
  id v2 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"NameLayerTree-%i", -[NSNumber unsignedIntValue](a2, "unsignedIntValue")));
  notify_post((const char *)[v2 UTF8String]);
}

id sub_10000ADF0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

id sub_10000ADFC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_10000AE08(uint64_t a1, void *a2, void *a3)
{
  id v65 = a2;
  id v4 = a3;
  id v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v82 objects:v95 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v83;
    uint64_t v70 = *(void *)v83;
    do
    {
      __int16 v9 = 0LL;
      id v72 = v7;
      do
      {
        if (*(void *)v83 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v82 + 1) + 8LL * (void)v9);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v10]);
        if ((unint64_t)[v11 count] >= 2)
        {
          id v12 = [v11 count];
          id v13 = sub_10000661C();
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
          if (v12 == (id)2)
          {
            if (v15)
            {
              unsigned int v16 = [v10 unsignedIntValue];
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)__int128 v87 = v16;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "skipped context %x because it was already processed",  buf,  8u);
            }

            id v17 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"skipped context %x because it was already processed",  [v10 unsignedIntValue],  v64);
          }

          else
          {
            if (v15)
            {
              unsigned int v18 = [v10 unsignedIntValue];
              uint64_t v19 = (char *)[v11 count];
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)__int128 v87 = v18;
              *(_WORD *)&v87[4] = 2048;
              *(void *)&v87[6] = v19 - 1;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "skipped context %x because it was already processed (%lux)",  buf,  0x12u);
            }

            id v17 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"skipped context %x because it was already processed (%lux)",  [v10 unsignedIntValue],  (char *)objc_msgSend(v11, "count") - 1);
          }

          id v20 = (void *)objc_claimAutoreleasedReturnValue(v17);
          [v68 addObject:v20];
          id v21 = sub_10000661C();
          id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);

          if (v23)
          {
            id v24 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:0]);
            id v25 = sub_100009F10(v24);
            id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
            sub_100009FF4(v26, &stru_100010640);

            if ((unint64_t)[v11 count] >= 2)
            {
              unint64_t v27 = 1LL;
              do
              {
                id v28 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:v27]);
                id v29 = sub_100009F10(v28);
                id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
                v81[0] = _NSConcreteStackBlock;
                v81[1] = 3221225472LL;
                v81[2] = sub_10000B650;
                v81[3] = &unk_100010660;
                void v81[4] = v27;
                sub_100009FF4(v30, v81);

                ++v27;
              }

              while (v27 < (unint64_t)[v11 count]);
            }
          }

          uint64_t v8 = v70;
          id v7 = v72;
        }

        __int16 v9 = (char *)v9 + 1;
      }

      while (v9 != v7);
      id v7 = [v5 countByEnumeratingWithState:&v82 objects:v95 count:16];
    }

    while (v7);
  }

  id v31 = sub_10000661C();
  double v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG);

  if (v33)
  {
    id v34 = sub_10000661C();
    id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v62 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(void *)__int128 v87 = v62;
      _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "final layer tree for %@", buf, 0xCu);
    }

    sub_10000A268(v65, &stru_100010680);
  }

  [sub_100008724() begin];
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) contexts]);
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472LL;
  v78[2] = sub_10000B718;
  v78[3] = &unk_1000106A8;
  id v67 = v5;
  id v79 = v67;
  id v38 = v36;
  id v80 = v38;
  objc_msgSend(v37, "bs_each:", v78);

  BOOL v71 = v38;
  id v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  id v39 = (void *)objc_claimAutoreleasedReturnValue([v38 allKeys]);
  id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 sortedArrayUsingSelector:"compare:"]);

  id obj = v40;
  id v41 = [v40 countByEnumeratingWithState:&v74 objects:v94 count:16];
  if (v41)
  {
    id v42 = v41;
    uint64_t v43 = *(void *)v75;
    do
    {
      for (i = 0LL; i != v42; i = (char *)i + 1)
      {
        if (*(void *)v75 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v45 = *(void *)(*((void *)&v74 + 1) + 8LL * (void)i);
        v92[0] = @"pid";
        v92[1] = @"contextIDs";
        v93[0] = v45;
        id v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKey:"));
        id v47 = (void *)objc_claimAutoreleasedReturnValue([v46 allObjects]);
        BOOL v48 = (void *)objc_claimAutoreleasedReturnValue([v47 sortedArrayUsingSelector:"compare:"]);
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "bs_map:", &stru_1000106E8));
        v93[1] = v49;
        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v93,  v92,  2LL));
        [v73 addObject:v50];
      }

      id v42 = [obj countByEnumeratingWithState:&v74 objects:v94 count:16];
    }

    while (v42);
  }

  v90[0] = @"Root";
  v88[0] = @"pid";
  uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [*(id *)(a1 + 32) pid]));
  v88[1] = @"contextID";
  v89[0] = v51;
  id v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [*(id *)(a1 + 32) identifier]));
  v89[1] = v52;
  uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v89,  v88,  2LL));
  v91[0] = v53;
  v90[1] = @"ContextIDsByPID";
  id v54 = [v73 copy];
  v91[1] = v54;
  v90[2] = @"ParseErrors";
  id v55 = [v68 copy];
  void v91[2] = v55;
  id v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v91,  v90,  3LL));

  off_100015360(1LL);
  off_100015368(1LL);
  __int128 v57 = (void *)off_100015358(v65, v56);
  id v58 = sub_10000661C();
  uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
  id v60 = v59;
  if (v57)
  {
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v61 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      *(void *)__int128 v87 = v61;
      *(_WORD *)&v87[8] = 2112;
      *(void *)&v87[10] = v56;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEBUG,  "archived '%@' with info:\n%@",  buf,  0x16u);
    }

    [*(id *)(a1 + 48) setObject:v57 forKey:*(void *)(a1 + 56)];
  }

  else
  {
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      uint64_t v63 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(void *)__int128 v87 = v63;
      _os_log_error_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_ERROR,  "failed to create archive of '%@'",  buf,  0xCu);
    }
  }

  [sub_100008724() commit];
}

void sub_10000B650(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000661C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 134218242;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "skp%lu: %@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_10000B718(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v8 identifier]));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:v3]);

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v8 pid]));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:v5]);
    if (v6)
    {
      int v7 = v6;
      [v6 addObject:v3];
    }

    else
    {
      int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v3));
      [*(id *)(a1 + 40) setObject:v7 forKey:v5];
    }
  }
}

NSString *__cdecl sub_10000B804(id a1, NSNumber *a2)
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%x",  -[NSNumber unsignedIntValue](a2, "unsignedIntValue"));
}

void sub_10000B848(id a1, NSString *a2)
{
  id v2 = a2;
  id v3 = sub_10000661C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    uint64_t v6 = v2;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "final: %@", (uint8_t *)&v5, 0xCu);
  }
}

void sub_10000B8F4(id a1, NSString *a2)
{
  id v2 = a2;
  id v3 = sub_10000661C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    uint64_t v6 = v2;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "prsd: %@", (uint8_t *)&v5, 0xCu);
  }
}

void sub_10000B9A0()
{
  uint64_t v4 = 0LL;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  v0 = off_100015410;
  int v7 = off_100015410;
  if (!off_100015410)
  {
    id v1 = sub_1000068A4();
    v0 = dlsym(v1, "CARenderServerGetServerPort");
    v5[3] = (uint64_t)v0;
    off_100015410 = v0;
  }

  _Block_object_dispose(&v4, 8);
  if (v0)
  {
    ((void (*)(void))v0)(0LL);
  }

  else
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "mach_port_t soft_CARenderServerGetServerPort(const char *)"));
    objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"DASProcessor.m",  33,  @"%s",  dlerror());

    __break(1u);
  }

void sub_10000BA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}