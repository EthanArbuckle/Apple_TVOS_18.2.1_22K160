uint64_t start(int a1, char **a2)
{
  int v4;
  int *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  while (1)
  {
    v4 = getopt_long(a1, a2, "dv", (const option *)&off_100004138, &v10);
    v5 = &dword_100008088;
    if (v4 == 100) {
      goto LABEL_2;
    }
    if (v4 != 118) {
      break;
    }
    v5 = &dword_10000808C;
LABEL_2:
    ++*v5;
  }

  if (v4 != -1)
  {
    fwrite("Usage: \tpkreporter [-d|--debug] [-v|--verbose]\n", 0x2FuLL, 1uLL, __stderrp);
    exit(2);
  }

  v6 = objc_autoreleasePoolPush();
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PKHost defaultHost](&OBJC_CLASS___PKHost, "defaultHost"));
  [v7 discoverPlugInsForAttributes:&__NSDictionary0__struct flags:512 found:&stru_100004198];

  objc_autoreleasePoolPop(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v8 run];

  return 0LL;
}

void sub_100002F88(id a1, NSSet *a2, NSError *a3)
{
  v4 = a2;
  v5 = a3;
  if (v5)
  {
    v13 = v5;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v13, "localizedDescription"));
      *(_DWORD *)buf = 138543362;
      *(void *)v78 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Discovery of plugins fails: %{public}@",  buf,  0xCu);
    }

    exit(1);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  v7 = v4;
  id v8 = -[NSSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v70,  v76,  16LL);
  if (v8)
  {
    uint64_t v15 = *(void *)v71;
    uint64_t v16 = PKProtocolAttribute;
    do
    {
      uint64_t v17 = 0LL;
      else {
        uint64_t v18 = (uint64_t)v8;
      }
      do
      {
        if (*(void *)v71 != v15) {
          objc_enumerationMutation(v7);
        }
        v19 = *(void **)(*((void *)&v70 + 1) + 8 * v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 attributes]);
        uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v16]);

        if (v21) {
          v22 = (__CFString *)v21;
        }
        else {
          v22 = @"*Unknown*";
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v22]);
        if (!v23)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
          [v6 setObject:v23 forKeyedSubscript:v22];
        }

        [v23 addObject:v19];

        ++v17;
      }

      while (v18 != v17);
      id v8 = -[NSSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v70,  v76,  16LL);
    }

    while (v8);
  }

  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v66 objects:v75 count:16];
  v10 = 0LL;
  if (!v9)
  {
LABEL_4:

    id v11 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      if (v10) {
        uint64_t v12 = 1 << (flsl((uint64_t)v10) - 1);
      }
      else {
        uint64_t v12 = 0LL;
      }
      *(_DWORD *)buf = 134218240;
      *(void *)v78 = v10;
      *(_WORD *)&v78[8] = 2048;
      *(void *)&v78[10] = v12;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Total number of plugins: %ld (%ld)",  buf,  0x16u);
    }

    if (v10) {
      uint64_t v53 = 1 << (flsl((uint64_t)v10) - 1);
    }
    else {
      uint64_t v53 = 0LL;
    }
    ADClientSetValueForScalarKey(@"com.apple.pluginkit.extensionsinstalled", v53);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      uid_t v54 = geteuid();
      id v55 = [obj count];
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v78 = v54;
      *(_WORD *)&v78[4] = 2048;
      *(void *)&v78[6] = v55;
      *(_WORD *)&v78[14] = 2048;
      *(void *)&v78[16] = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "(UID %d) Found %lu plugin types, %ld plugins",  buf,  0x1Cu);
    }

    exit(0);
  }

  uint64_t v56 = *(void *)v67;
LABEL_25:
  uint64_t v24 = 0LL;
  else {
    uint64_t v25 = (uint64_t)v9;
  }
  uint64_t v57 = v25;
  while (1)
  {
    if (*(void *)v67 != v56) {
      objc_enumerationMutation(obj);
    }
    uint64_t v60 = v24;
    v26 = *(void **)(*((void *)&v66 + 1) + 8 * v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKeyedSubscript:", v26, v56));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v78 = v26;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    v61 = v10;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    id v28 = v27;
    id v29 = [v28 countByEnumeratingWithState:&v62 objects:v74 count:16];
    v59 = v26;
    uint64_t v30 = 0LL;
    uint64_t v31 = 0LL;
    if (v29)
    {
      uint64_t v32 = *(void *)v63;
      do
      {
        uint64_t v33 = 0LL;
        else {
          uint64_t v34 = (uint64_t)v29;
        }
        do
        {
          if (*(void *)v63 != v32) {
            objc_enumerationMutation(v28);
          }
          v35 = *(void **)(*((void *)&v62 + 1) + 8 * v33);
          if ([v35 userElection] == (id)1)
          {
            ++v31;
            v36 = (void *)objc_claimAutoreleasedReturnValue([v35 identifier]);
            unsigned int v37 = [v36 hasPrefix:@"com.apple."];

            v30 += v37 ^ 1;
          }

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue([v35 identifier]);
            id v39 = [v35 userElection];
            *(_DWORD *)buf = 138412546;
            *(void *)v78 = v38;
            *(_WORD *)&v78[8] = 2048;
            *(void *)&v78[10] = v39;
            _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "\t%@ - election: %ld",  buf,  0x16u);
          }

          ++v33;
        }

        while (v34 != v33);
        id v29 = [v28 countByEnumeratingWithState:&v62 objects:v74 count:16];
      }

      while (v29);
    }

    uint64_t v40 = (uint64_t)[v28 count];
    id v41 = [v28 count];
    id v42 = v59;
    id v43 = &_os_log_default;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_48;
    }
    if (v40)
    {
      uint64_t v47 = 1 << (flsl(v40) - 1);
      if (v31)
      {
LABEL_58:
        uint64_t v48 = 1 << (flsl(v31) - 1);
        if (!v30) {
          goto LABEL_62;
        }
        goto LABEL_59;
      }
    }

    else
    {
      uint64_t v47 = 0LL;
      if (v31) {
        goto LABEL_58;
      }
    }

    uint64_t v48 = 0LL;
    if (!v30)
    {
LABEL_62:
      uint64_t v49 = 0LL;
      goto LABEL_63;
    }

LABEL_59:
    uint64_t v49 = 1 << (flsl(v30) - 1);
LABEL_63:
    uint64_t v50 = (uint64_t)v41 - v31;
    if (v41 == (id)v31)
    {
      uint64_t v51 = 0LL;
    }

    else
    {
      char v52 = flsl(v50);
      uint64_t v50 = (uint64_t)v41 - v31;
      uint64_t v51 = 1 << (v52 - 1);
    }

    *(_DWORD *)buf = 138414338;
    *(void *)v78 = v42;
    *(_WORD *)&v78[8] = 2048;
    *(void *)&v78[10] = v40;
    *(_WORD *)&v78[18] = 2048;
    *(void *)&v78[20] = v47;
    __int16 v79 = 2048;
    uint64_t v80 = v31;
    __int16 v81 = 2048;
    uint64_t v82 = v48;
    __int16 v83 = 2048;
    uint64_t v84 = v30;
    __int16 v85 = 2048;
    uint64_t v86 = v49;
    __int16 v87 = 2048;
    uint64_t v88 = v50;
    __int16 v89 = 2048;
    uint64_t v90 = v51;
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "plugin type: %@: %ld (%ld) plugins; %ld (%ld) enabled; %ld (%ld) enabled 3rd party; %ld (%ld) disabled",
      buf,
      0x5Cu);
LABEL_48:

    if (v40) {
      uint64_t v40 = 1 << (flsl(v40) - 1);
    }
    if (v31) {
      uint64_t v31 = 1 << (flsl(v31) - 1);
    }
    id v44 = v42;
    if (qword_100008090 != -1) {
      dispatch_once(&qword_100008090, &stru_1000041D8);
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100008098 objectForKeyedSubscript:v44]);
    v46 = v45;
    if (v45)
    {
      ADClientSetValueForScalarKey([v45 stringByAppendingString:@".extensionsinstalled"], v40);
      ADClientSetValueForScalarKey([v46 stringByAppendingString:@".enabled"], v31);
    }

    v10 = &v61[(void)[v28 count]];
    uint64_t v24 = v60 + 1;
    if (v60 + 1 == v57)
    {
      id v9 = [obj countByEnumeratingWithState:&v66 objects:v75 count:16];
      if (!v9) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
}

void sub_10000374C(id a1)
{
  v1 = (void *)qword_100008098;
  qword_100008098 = (uint64_t)&off_100004520;
}

id objc_msgSend_userElection(void *a1, const char *a2, ...)
{
  return [a1 userElection];
}