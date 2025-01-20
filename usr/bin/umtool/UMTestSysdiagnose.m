@interface UMTestSysdiagnose
+ (BOOL)executeWithOutError:(id *)a3;
+ (id)description;
+ (id)examples;
+ (id)name;
+ (id)stringForUserType:(unint64_t)a3;
@end

@implementation UMTestSysdiagnose

+ (id)name
{
  return @"sysdiagnose";
}

+ (id)description
{
  return @"Dump sysdiagnose information";
}

+ (id)examples
{
  return &off_10000D830;
}

+ (BOOL)executeWithOutError:(id *)a3
{
  uint32_t multiuser_flags = 0;
  mach_port_t v3 = mach_host_self();
  uint64_t multiuser_config_flags = host_get_multiuser_config_flags(v3, &multiuser_flags);
  if ((_DWORD)multiuser_config_flags)
  {
    +[UMTestPrint println:]( &OBJC_CLASS___UMTestPrint,  "println:",  @"Failed to get host config: %d\n",  multiuser_config_flags);
  }

  else
  {
    +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", @"Host Config: 0x%08x", multiuser_flags);
    +[UMTestPrint println:]( &OBJC_CLASS___UMTestPrint,  "println:",  @"Foreground UID: %u",  multiuser_flags & 0x3FFFFFFF);
    if ((multiuser_flags & 0x80000000) != 0) {
      v5 = "Y";
    }
    else {
      v5 = "N";
    }
    +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", @"Shared iPad: %s", v5);
    if ((multiuser_flags & 0x40000000) != 0) {
      v6 = "Y";
    }
    else {
      v6 = "N";
    }
    +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", @"Secondary Users: %s", v6);
    +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", &stru_10000C850);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](&OBJC_CLASS___UMUserManager, "sharedManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allUsersUnfiltered]);

  v70 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  id obj = v8;
  v71 = (__CFString *)[obj countByEnumeratingWithState:&v96 objects:v118 count:16];
  if (v71)
  {
    v68 = *(__CFString **)v97;
    do
    {
      for (i = 0LL; i != v71; i = (__CFString *)((char *)i + 1))
      {
        if (*(__CFString **)v97 != v68) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v96 + 1) + 8LL * (void)i);
        v116[0] = @"UID";
        v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%u",  [v10 uid]));
        v117[0] = v11;
        v116[1] = @"UUID";
        v12 = (void *)objc_claimAutoreleasedReturnValue([v10 alternateDSID]);
        if (v12)
        {
          v76 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 alternateDSID]);
          v13 = v76;
        }

        else
        {
          v13 = &stru_10000C850;
        }

        v117[1] = v13;
        v116[2] = @"GID";
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%u",  [v10 gid]));
        v117[2] = v14;
        v116[3] = @"Type";
        v15 = (void *)objc_claimAutoreleasedReturnValue([a1 stringForUserType:[v10 userType]]);
        v117[3] = v15;
        v117[4] = @"(private)";
        v116[4] = @"Username";
        v116[5] = @"Display Name";
        v117[5] = @"(private)";
        v116[6] = @"Home Directory";
        v16 = (void *)objc_claimAutoreleasedReturnValue([v10 homeDirectoryURL]);
        if (v16)
        {
          v74 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 homeDirectoryURL]);
          v73 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString path](v74, "path"));
          v17 = v73;
        }

        else
        {
          v17 = &stru_10000C850;
        }

        v117[6] = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v117,  v116,  7LL));
        v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v18));

        if (v16)
        {
        }

        if (v12) {
        -[__CFString addObject:](v70, "addObject:", v19);
        }
        if (os_variant_has_internal_diagnostics("com.apple.umtest"))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue([v10 username]);
          if (v20)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue([v10 username]);
            [v19 setObject:v21 forKeyedSubscript:@"Username"];
          }

          else
          {
            [v19 setObject:&stru_10000C850 forKeyedSubscript:@"Username"];
          }

          v22 = (void *)objc_claimAutoreleasedReturnValue([v10 displayName]);
          if (v22)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue([v10 displayName]);
            [v19 setObject:v23 forKeyedSubscript:@"Display Name"];
          }

          else
          {
            [v19 setObject:&stru_10000C850 forKeyedSubscript:@"Display Name"];
          }
        }
      }

      v71 = (__CFString *)[obj countByEnumeratingWithState:&v96 objects:v118 count:16];
    }

    while (v71);
  }

  +[UMTestPrint printTable:withColumns:rows:]( &OBJC_CLASS___UMTestPrint,  "printTable:withColumns:rows:",  @"Users",  &off_10000D848,  v70);
  uint64_t v90 = 0LL;
  v91 = &v90;
  uint64_t v92 = 0x3032000000LL;
  v93 = sub_100006FB4;
  v94 = sub_100006FC4;
  id v95 = 0LL;
  dispatch_semaphore_t v24 = dispatch_semaphore_create(0LL);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](&OBJC_CLASS___UMUserManager, "sharedManager"));
  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472LL;
  v87[2] = sub_100006FCC;
  v87[3] = &unk_10000C2A8;
  v89 = &v90;
  dispatch_semaphore_t dsema = v24;
  dispatch_semaphore_t v88 = dsema;
  [v25 fetchAllPersonasForAllUsersWithCompletionHandler:v87];

  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));

  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  id v61 = (id)v91[5];
  id v26 = [v61 countByEnumeratingWithState:&v83 objects:v115 count:16];
  if (v26)
  {
    uint64_t v64 = *(void *)v84;
    do
    {
      for (j = 0LL; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v84 != v64) {
          objc_enumerationMutation(v61);
        }
        v27 = *(void **)(*((void *)&v83 + 1) + 8LL * (void)j);
        v113[0] = @"User UUID";
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"UserPersonaUserODUUID"]);
        if (v28)
        {
          v74 = (__CFString *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"UserPersonaUserODUUID"]);
          v29 = v74;
        }

        else
        {
          v29 = &stru_10000C850;
        }

        v114[0] = v29;
        v113[1] = @"Type";
        v30 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"UserPersonaType"]);
        if (v30)
        {
          v73 = (__CFString *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"UserPersonaType"]);
          v71 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v73));
          v31 = v71;
        }

        else
        {
          v31 = &stru_10000C850;
        }

        v114[1] = v31;
        v113[2] = @"UUID";
        v32 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"UserPersonaUniqueString"]);
        if (v32)
        {
          v70 = (__CFString *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"UserPersonaUniqueString"]);
          v33 = v70;
        }

        else
        {
          v33 = &stru_10000C850;
        }

        v114[2] = v33;
        v113[3] = @"ID";
        v34 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"UserPersonaID"]);
        if (v34)
        {
          a1 = (id)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"UserPersonaID"]);
          v68 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  a1));
          v35 = v68;
        }

        else
        {
          v35 = &stru_10000C850;
        }

        v114[3] = v35;
        v114[4] = @"(private)";
        v113[4] = @"Nickname";
        v113[5] = @"Volume UUID";
        v36 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"MKBUserSessionVolumeUUID"]);
        if (v36)
        {
          v67 = (__CFString *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"MKBUserSessionVolumeUUID"]);
          v37 = v67;
        }

        else
        {
          v37 = &stru_10000C850;
        }

        v114[5] = v37;
        v113[6] = @"Home Dir";
        v38 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"MKBUserSessionHomeDir"]);
        if (v38)
        {
          v66 = (__CFString *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"MKBUserSessionHomeDir"]);
          v39 = v66;
        }

        else
        {
          v39 = &stru_10000C850;
        }

        v114[6] = v39;
        v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v114,  v113,  7LL));
        v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v40));

        if (v38) {
        if (v36)
        }

        if (v34)
        {
        }

        if (v32) {
        if (v30)
        }
        {
        }

        if (v28) {
        [v65 addObject:v41];
        }
        if (os_variant_has_internal_diagnostics("com.apple.umtest"))
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"UserPersonaNickName"]);
          if (v42)
          {
            v63 = (__CFString *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"UserPersonaNickName"]);
            v43 = v63;
          }

          else
          {
            v43 = &stru_10000C850;
          }

          [v41 setObject:v43 forKeyedSubscript:@"Nickname"];
          if (v42) {
        }
          }
      }

      id v26 = [v61 countByEnumeratingWithState:&v83 objects:v115 count:16];
    }

    while (v26);
  }

  +[UMTestPrint printTable:withColumns:rows:]( &OBJC_CLASS___UMTestPrint,  "printTable:withColumns:rows:",  @"Personas",  &off_10000D860,  v65);
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v45 = 1LL;
  do
  {
    v101[0] = 0LL;
    if ((kpersona_find_by_type(v45, 0LL, v101) & 0x80000000) == 0)
    {
      v46 = (unsigned int *)malloc(4LL * v101[0]);
      if ((kpersona_find_by_type(v45, v46, v101) & 0x80000000) == 0 && v101[0])
      {
        unint64_t v47 = 0LL;
        do
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v46[v47]));
          [v44 addObject:v48];

          ++v47;
        }

        while (v101[0] > v47);
      }

      free(v46);
    }

    uint64_t v45 = (v45 + 1);
  }

  while ((_DWORD)v45 != 8);
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));

  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  id v72 = v44;
  id v49 = [v72 countByEnumeratingWithState:&v79 objects:v112 count:16];
  if (v49)
  {
    uint64_t v78 = *(void *)v80;
    do
    {
      for (k = 0LL; k != v49; k = (char *)k + 1)
      {
        if (*(void *)v80 != v78) {
          objc_enumerationMutation(v72);
        }
        v51 = *(void **)(*((void *)&v79 + 1) + 8LL * (void)k);
        uint64_t v111 = 0LL;
        memset(v110, 0, sizeof(v110));
        __int128 v108 = 0u;
        __int128 v109 = 0u;
        __int128 v106 = 0u;
        __int128 v107 = 0u;
        __int128 v105 = 0u;
        int v104 = 2;
        if ((kpersona_info([v51 unsignedIntValue], &v104) & 0x80000000) == 0)
        {
          if (HIDWORD(v111) == -101)
          {
            v52 = @"-101";
          }

          else if (HIDWORD(v111) == -1)
          {
            v52 = @"-1";
          }

          else
          {
            v52 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u",  HIDWORD(v111)));
          }

          v103[0] = v52;
          v102[0] = @"UID";
          v102[1] = @"ID";
          v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u",  v105));
          v103[1] = v53;
          v102[2] = @"Type";
          v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u",  DWORD1(v105)));
          v103[2] = v54;
          v102[3] = @"Name";
          v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", &v110[4]));
          v103[3] = v55;
          v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v103,  v102,  4LL));
          v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v56));

          [v75 addObject:v57];
          bzero(v101, 0x400uLL);
          if (!kpersona_getpath([v51 unsignedIntValue], v101))
          {
            v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v101));
            [v57 setObject:v58 forKeyedSubscript:@"Path"];
          }
        }
      }

      id v49 = [v72 countByEnumeratingWithState:&v79 objects:v112 count:16];
    }

    while (v49);
  }

  +[UMTestPrint printTable:withColumns:rows:]( &OBJC_CLASS___UMTestPrint,  "printTable:withColumns:rows:",  @"Kernel Personas",  &off_10000D878,  v75);
  _Block_object_dispose(&v90, 8);

  return 1;
}

+ (id)stringForUserType:(unint64_t)a3
{
  if (a3 == 1) {
    return @"E";
  }
  else {
    return @"P";
  }
}

@end