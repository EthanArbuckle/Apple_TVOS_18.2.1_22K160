uint64_t sub_100004B60()
{
  const char *v0;
  int v2;
  const char *v3;
  if (qword_100010398 != -1) {
    dispatch_once(&qword_100010398, &stru_10000C420);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (byte_100010390) {
      v0 = "launchd";
    }
    else {
      v0 = "shell";
    }
    v2 = 136315138;
    v3 = v0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "started by %s",  (uint8_t *)&v2,  0xCu);
  }

  return byte_100010390;
}

void sub_100004C44(id a1)
{
  uint64_t v1 = 0LL;
  vproc_swap_integer(0LL, 5LL, 0LL, &v1);
  byte_100010390 = v1 != 0;
}

uint64_t sub_100004C88()
{
  if (qword_1000103A8 != -1) {
    dispatch_once(&qword_1000103A8, &stru_10000C440);
  }
  return byte_1000103A0;
}

void sub_100004CC8(id a1)
{
  else {
    char has_internal_content = os_variant_has_internal_content("com.apple.sysdiagnose");
  }
  byte_1000103A0 = has_internal_content;
  BOOL v3 = 0;
  if (sub_100004E54(@"customer-mode", @"com.apple.sysdiagnose", &v3) && v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Customer-mode enabled. Forcing external behavior.",  buf,  2u);
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "To disable, run: 'sudo defaults write com.apple.sysdiagnose customer-mode -BOOL false; sudo pkill -9 sysdiagnose'",
        buf,
        2u);
    }

    byte_1000103A0 = 0;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (byte_1000103A0) {
      v2 = "YES";
    }
    else {
      v2 = "NO";
    }
    *(_DWORD *)buf = 136315138;
    v5 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Apple Internal: %s",  buf,  0xCu);
  }
}

BOOL sub_100004E54(void *a1, void *a2, BOOL *a3)
{
  v5 = a1;
  v6 = a2;
  v7 = (__CFString *)v6;
  if (v5 && v6 && a3)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(v5, v6, &keyExistsAndHasValidFormat);
    int v9 = keyExistsAndHasValidFormat;
    if (keyExistsAndHasValidFormat) {
      *a3 = AppBooleanValue != 0;
    }
    BOOL v10 = v9 != 0;
  }

  else
  {
    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v11) {
      sub_100007E1C(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    BOOL v10 = 0LL;
  }

  return v10;
}

BOOL sub_100004F00(const char *a1, const char *a2)
{
  size_t v4 = strlen(a1);
  size_t v5 = strlen(a2);
  size_t v6 = v5;
  if (v5 >= v4) {
    size_t v7 = v4;
  }
  else {
    size_t v7 = v5;
  }
  if (!strncasecmp(a2, a1, v7)) {
    return 1LL;
  }
  if (v6 <= v4) {
    v8 = a1;
  }
  else {
    v8 = a2;
  }
  if (v6 <= v4) {
    int v9 = a2;
  }
  else {
    int v9 = a1;
  }
  return strcasestr(v8, v9) != 0LL;
}

BOOL sub_100004F74(void *a1, void *a2)
{
  id v3 = a2;
  if (proc_pidpath((int)[a1 intValue], buffer, 0x1000u) < 1)
  {
    BOOL v5 = 0LL;
  }

  else
  {
    id v4 = objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString, "stringWithUTF8String:", buffer));
    BOOL v5 = sub_100004F00( (const char *)[v4 fileSystemRepresentation], (const char *)[v3 fileSystemRepresentation]);
  }

  return v5;
}

NSString *sub_10000505C()
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"sysdiagnose version %d.%d",  3LL,  0LL);
}

void sub_100005090( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t start(int a1, char *const *a2)
{
  context = objc_autoreleasePoolPush();
  if (sub_100004B60())
  {
    BOOL v134 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v134) {
      sub_100007E90(v134, v135, v136, v137, v138, v139, v140, v141);
    }
LABEL_159:
    exit(1);
  }

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  size_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  size_t v7 = &CFPreferencesGetAppBooleanValue_ptr;
  int v148 = a1 - 1;
  if (a1 >= 1)
  {
    uint64_t v8 = a1;
    int v9 = a2;
    do
    {
      uint64_t v10 = (uint64_t)*v9++;
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s ", v10));
      -[NSMutableString appendString:](v6, "appendString:", v11);

      size_t v7 = &CFPreferencesGetAppBooleanValue_ptr;
      --v8;
    }

    while (v8);
  }

  v149 = v6;
  [v5 setObject:v6 forKeyedSubscript:@"commandLineArgs"];
  opterr = 0;
  __int128 v172 = off_10000C548;
  __int128 v173 = unk_10000C558;
  __int128 v174 = xmmword_10000C568;
  __int128 v175 = unk_10000C578;
  __int128 v168 = off_10000C508;
  __int128 v169 = unk_10000C518;
  __int128 v170 = off_10000C528;
  __int128 v171 = unk_10000C538;
  __int128 v164 = off_10000C4C8;
  __int128 v165 = unk_10000C4D8;
  __int128 v166 = off_10000C4E8;
  __int128 v167 = unk_10000C4F8;
  option v161 = off_10000C488;
  __int128 v162 = off_10000C4A8;
  __int128 v163 = unk_10000C4B8;
  v150 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v12 = &optarg;
  while (2)
  {
    while (1)
    {
      int v13 = getopt_long(a1, a2, "vhHcsbf:V:lqQnA:pPdDkFgGLXe:urRSC:x:", &v161, 0LL);
      if (v13 <= 15212) {
        break;
      }
      if (v13 != 15213)
      {
        if (v13 == 18213)
        {
          v127 = __stderrp;
          v128 = "Platform does not support --collectWifiDextCoreFiles flag.";
          size_t v129 = 58LL;
        }

        else
        {
          if (v13 != 20213)
          {
LABEL_142:
            fwrite("Unexpected option or insufficient arguments.", 0x2CuLL, 1uLL, __stderrp);
            fputc(10, __stderrp);
            sub_1000066B8();
            int v130 = 64;
            goto LABEL_152;
          }

          v127 = __stderrp;
          v128 = "Platform does not support --collectAllTrusted flag";
          size_t v129 = 50LL;
        }

LABEL_150:
        fwrite(v128, v129, 1uLL, v127);
        fputc(10, __stderrp);
        goto LABEL_151;
      }

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7[20] stringWithUTF8String:*v12]);
      uint64_t v17 = v5;
      uint64_t v18 = v16;
      v19 = @"onlyRunContainersWithNames";
LABEL_53:
      [v17 setObject:v18 forKeyedSubscript:v19];
LABEL_54:
    }

    switch(v13)
    {
      case 'A':
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7[20] stringWithUTF8String:*v12]);
        v19 = @"archiveName";
        goto LABEL_29;
      case 'B':
      case 'E':
      case 'I':
      case 'J':
      case 'K':
      case 'M':
      case 'N':
      case 'O':
      case 'T':
      case 'U':
      case 'W':
      case 'Y':
      case 'Z':
      case '[':
      case '\\':
      case ']':
      case '^':
      case '_':
      case 'a':
      case 'e':
      case 'i':
      case 'j':
      case 'm':
      case 'o':
      case 's':
      case 't':
      case 'w':
        goto LABEL_142;
      case 'C':
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7[20] stringWithUTF8String:*v12]);
        if ([@"yaa" isEqualToString:v16])
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Compression type: yaa",  buf,  2u);
          }

          uint64_t v18 = &__kCFBooleanTrue;
          v19 = @"useParallelCompression";
LABEL_52:
          uint64_t v17 = v5;
          goto LABEL_53;
        }

        if ([@"tar" isEqualToString:v16])
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_54;
          }
          *(_WORD *)buf = 0;
          v35 = "Compression type: tar";
          goto LABEL_58;
        }

        if ([@"no-compression" isEqualToString:v16])
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "--compression=no-compression (functions the same as -n flag)",  buf,  2u);
          }

          uint64_t v18 = &__kCFBooleanFalse;
          v19 = @"shouldCreateTarBall";
          goto LABEL_52;
        }

        if (![@"default" isEqualToString:v16])
        {
          v132 = __stderrp;
          id v133 = v16;
          fprintf(v132, "Error: compression type '%s' not found", (const char *)[v133 UTF8String]);
          fputc(10, __stderrp);

LABEL_151:
          int v130 = 69;
LABEL_152:

          exit(v130);
        }

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v35 = "Default compression requested. Using tar";
LABEL_58:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v35, buf, 2u);
          goto LABEL_54;
        }

        goto LABEL_54;
      case 'D':
        uint64_t v14 = &__kCFBooleanFalse;
        uint64_t v15 = @"shouldRunLogCopyTasks";
        goto LABEL_44;
      case 'F':
        uint64_t v14 = &__kCFBooleanTrue;
        uint64_t v15 = @"shouldGetFeedbackData";
        goto LABEL_44;
      case 'G':
        uint64_t v14 = &__kCFBooleanFalse;
        uint64_t v15 = @"shouldRunLogGenerationTasks";
        goto LABEL_44;
      case 'H':
        id v131 = objc_claimAutoreleasedReturnValue( +[SDCacheEnumerator sysdiagnoseDirectory]( &OBJC_CLASS___SDCacheEnumerator, "sysdiagnoseDirectory"));
        printf("Sysdiagnoses can be found at '%s'\n", (const char *)[v131 UTF8String]);

        goto LABEL_148;
      case 'L':
        uint64_t v14 = &__kCFBooleanTrue;
        uint64_t v15 = @"capOverrideFullLogarchive";
        goto LABEL_44;
      case 'P':
        uint64_t v14 = &__kCFBooleanFalse;
        uint64_t v15 = @"shouldRunTimeSensitiveTasks";
        goto LABEL_44;
      case 'Q':
      case 'q':
        uint64_t v14 = &__kCFBooleanTrue;
        uint64_t v15 = @"quickMode";
        goto LABEL_44;
      case 'R':
        uint64_t v14 = &__kCFBooleanFalse;
        goto LABEL_43;
      case 'S':
        uint64_t v14 = &__kCFBooleanTrue;
        uint64_t v15 = @"disableStreamTar";
        goto LABEL_44;
      case 'V':
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7[20] stringWithUTF8String:*v12]);
        v19 = @"rootPath";
LABEL_29:
        uint64_t v17 = v5;
        uint64_t v18 = v16;
        goto LABEL_53;
      case 'X':
        uint64_t v14 = &__kCFBooleanTrue;
        uint64_t v15 = @"setNoTimeOut";
        goto LABEL_44;
      case 'b':
        goto LABEL_14;
      case 'c':
        v127 = __stderrp;
        v128 = "Platform does not support -c flag.";
        goto LABEL_146;
      case 'd':
        [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:@"shouldRunTimeSensitiveTasks"];
        [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:@"shouldRunLogGenerationTasks"];
        v23 = &__kCFBooleanTrue;
        v22 = v5;
        goto LABEL_37;
      case 'f':
        v24 = (void *)objc_claimAutoreleasedReturnValue([v7[20] stringWithUTF8String:*v12]);
        if (([v24 hasPrefix:@"."] & 1) != 0
          || ([v24 hasPrefix:@"/"] & 1) == 0)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          v26 = (void *)objc_claimAutoreleasedReturnValue([v25 currentDirectoryPath]);
          id v27 = v5;
          uint64_t v28 = v2;
          v29 = a2;
          v30 = v12;
          uint64_t v31 = objc_claimAutoreleasedReturnValue([v26 stringByAppendingPathComponent:v24]);

          v24 = (void *)v31;
          uint64_t v12 = v30;
          a2 = v29;
          uint64_t v2 = v28;
          id v5 = v27;
        }

        v32 = (void *)objc_claimAutoreleasedReturnValue([v24 stringByResolvingSymlinksInPath]);
        id v33 = sub_100007144(v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        [v5 setObject:v34 forKeyedSubscript:@"baseDirectory"];

        size_t v7 = &CFPreferencesGetAppBooleanValue_ptr;
        continue;
      case 'g':
        [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:@"shouldRunTimeSensitiveTasks"];
        v20 = &__kCFBooleanTrue;
        v21 = v5;
        goto LABEL_32;
      case 'h':
        sub_1000066B8();
LABEL_148:
        exit(0);
      case 'k':
        uint64_t v14 = &__kCFBooleanFalse;
        uint64_t v15 = @"shouldRemoveTemporaryDirectory";
        goto LABEL_44;
      case 'l':
        byte_1000103B0 = 1;
        continue;
      case 'n':
        uint64_t v14 = &__kCFBooleanFalse;
        uint64_t v15 = @"shouldCreateTarBall";
        goto LABEL_44;
      case 'p':
        [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"shouldRunTimeSensitiveTasks"];
        v21 = v5;
        v20 = &__kCFBooleanFalse;
LABEL_32:
        [v21 setObject:v20 forKeyedSubscript:@"shouldRunLogGenerationTasks"];
        v22 = v5;
        v23 = &__kCFBooleanFalse;
LABEL_37:
        [v22 setObject:v23 forKeyedSubscript:@"shouldRunLogCopyTasks"];
        [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:@"shouldRunOSLogArchive"];
        continue;
      case 'r':
        [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:@"shouldRunTimeSensitiveTasks"];
        [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:@"shouldRunLogGenerationTasks"];
        [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:@"shouldRunLogCopyTasks"];
        uint64_t v14 = &__kCFBooleanTrue;
LABEL_43:
        uint64_t v15 = @"shouldRunOSLogArchive";
        goto LABEL_44;
      case 'u':
        [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"disableUIFeedback"];
        byte_1000103B0 = 1;
LABEL_14:
        uint64_t v14 = &__kCFBooleanFalse;
        uint64_t v15 = @"shouldDisplayTarBall";
        goto LABEL_44;
      case 'v':
        uint64_t v14 = &__kCFBooleanTrue;
        uint64_t v15 = @"verbose";
LABEL_44:
        [v5 setObject:v14 forKeyedSubscript:v15];
        continue;
      case 'x':
        v127 = __stderrp;
        v128 = "Platform does not support -x flag.";
LABEL_146:
        size_t v129 = 34LL;
        goto LABEL_150;
      default:
        if (v13 != -1) {
          goto LABEL_142;
        }
        v36 = v150;
        id v37 = -[NSMutableSet copy](v150, "copy");
        if (![v37 count])
        {
          id v56 = v37;
          v57 = v149;
          goto LABEL_104;
        }

        v179[0] = @"CLI_REQUEST_TYPE";
        v179[1] = @"REQUEST_DATA";
        v180[0] = @"validateRemoteUUIDs";
        v180[1] = v37;
        v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v180,  v179,  2LL));
        v39 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
        id v160 = 0LL;
        BOOL v40 = sub_100006798(0xCu, v38, &v160);
        id v41 = v160;
        v146 = v41;
        if (v40 && v41)
        {
          v151 = v39;
          v145 = v38;
          v42 = v7[20];
          id v43 = v41;
          uint64_t v44 = objc_opt_class(v42);
          uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
          uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          uint64_t v47 = objc_opt_class(&OBJC_CLASS___NSNumber);
          v48 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v44,  v45,  v46,  v47,  objc_opt_class(&OBJC_CLASS___NSNull),  0LL);
          v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
          *(void *)buf = 0LL;
          data = xpc_dictionary_get_data(v43, "RESPONSE_DATA", (size_t *)buf);

          id v144 = v37;
          if (!data)
          {
            BOOL v66 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v66) {
              sub_100007F80(v66, v67, v68, v69, v70, v71, v72, v73);
            }

            size_t v7 = &CFPreferencesGetAppBooleanValue_ptr;
            v38 = v145;
            v39 = v151;
LABEL_100:
            fwrite("Malformed daemon response. Assuming provided remoteUUIDs invalid", 0x40uLL, 1uLL, __stderrp);
            fputc(10, __stderrp);
            BOOL v101 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v101) {
              sub_100007F4C(v101, v102, v103, v104, v105, v106, v107, v108);
            }
            id v56 = -[NSMutableSet copy](v39, "copy");
            v57 = v149;
            v36 = v150;
            id v37 = v144;
            goto LABEL_103;
          }

          v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  data,  *(void *)buf));
          if (!v51)
          {
            BOOL v74 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            v38 = v145;
            v39 = v151;
            if (v74) {
              sub_100008044(v74, v75, v76, v77, v78, v79, v80, v81);
            }
            id v55 = 0LL;
LABEL_84:
            size_t v7 = &CFPreferencesGetAppBooleanValue_ptr;

            if (v55)
            {
              __int128 v158 = 0u;
              __int128 v159 = 0u;
              __int128 v156 = 0u;
              __int128 v157 = 0u;
              id obj = (id)objc_claimAutoreleasedReturnValue([v55 allKeys]);
              id v90 = [obj countByEnumeratingWithState:&v156 objects:buf count:16];
              if (v90)
              {
                id v91 = v90;
                uint64_t v92 = *(void *)v157;
                do
                {
                  for (i = 0LL; i != v91; i = (char *)i + 1)
                  {
                    if (*(void *)v157 != v92) {
                      objc_enumerationMutation(obj);
                    }
                    v94 = *(void **)(*((void *)&v156 + 1) + 8LL * (void)i);
                    v95 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKey:v94]);
                    v96 = v95;
                    if (v95)
                    {
                      if ([v95 BOOLValue])
                      {
                        -[NSMutableSet addObject:](v151, "addObject:", v94);
                      }

                      else
                      {
                        v99 = __stderrp;
                        id v100 = v94;
                        fprintf(v99, "Remote UUID '%s' not found", (const char *)[v100 UTF8String]);
                        fputc(10, __stderrp);
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                          sub_100007FFC((int)&v176, v100);
                        }
                      }
                    }

                    else
                    {
                      v97 = __stderrp;
                      id v98 = v94;
                      fprintf( v97,  "Malformed daemon response. Remote UUID '%s' not found",  (const char *)[v98 UTF8String]);
                      fputc(10, __stderrp);
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                        sub_100007FB4((int)&v177, v98);
                      }
                    }
                  }

                  id v91 = [obj countByEnumeratingWithState:&v156 objects:buf count:16];
                }

                while (v91);
              }

              v39 = v151;
              id v56 = -[NSMutableSet copy](v151, "copy");

              v57 = v149;
              v36 = v150;
              size_t v7 = &CFPreferencesGetAppBooleanValue_ptr;
              id v37 = v144;
              v38 = v145;
              goto LABEL_103;
            }

            goto LABEL_100;
          }

          *(void *)&__int128 v156 = 0LL;
          v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v49,  v51,  &v156));
          id v53 = (id)v156;
          v38 = v145;
          v39 = v151;
          if (v52)
          {
            uint64_t v54 = objc_opt_class(&OBJC_CLASS___NSDictionary);
            if ((objc_opt_isKindOfClass(v52, v54) & 1) != 0)
            {
              id v55 = v52;
LABEL_83:

              goto LABEL_84;
            }

            BOOL v82 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v82) {
              sub_1000080F8(v82, v83, v84, v85, v86, v87, v88, v89);
            }
          }

          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_100008078(v53);
          }

          id v55 = 0LL;
          goto LABEL_83;
        }

        fwrite("Malformed daemon response. Assuming provided remoteUUIDs invalid", 0x40uLL, 1uLL, __stderrp);
        fputc(10, __stderrp);
        BOOL v58 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v58) {
          sub_100007F4C(v58, v59, v60, v61, v62, v63, v64, v65);
        }
        id v56 = -[NSMutableSet copy](v39, "copy");
        v57 = v149;
LABEL_103:

LABEL_104:
        if ([v56 count]) {
          [v5 setObject:v56 forKeyedSubscript:@"remoteUUIDs"];
        }
        if (optind == v148)
        {
          v109 = (void *)objc_claimAutoreleasedReturnValue([v7[20] stringWithCString:a2[optind] encoding:4]);
          [v5 setObject:v109 forKeyedSubscript:@"pidOrProcess"];
        }

        if (geteuid())
        {
          fwrite("sysdiagnose must be run as root", 0x1FuLL, 1uLL, __stderrp);
          fputc(10, __stderrp);
          goto LABEL_159;
        }

        if (qword_1000103C8 != -1) {
          dispatch_once(&qword_1000103C8, &stru_10000C5E8);
        }
        [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"SDRequestSourceShell"];
        if (!isatty(1)) {
          [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"verbose"];
        }
        if ((byte_1000103B0 & 1) != 0) {
          goto LABEL_131;
        }
        id v110 = [v5 copy];
        int v111 = sub_100004C88();
        v112 = &off_100010368;
        if (!v111) {
          v112 = &off_100010360;
        }
        printf("%s", *v112);
        putchar(10);
        v113 = (void *)objc_claimAutoreleasedReturnValue([v110 objectForKeyedSubscript:@"pidOrProcess"]);
        if ((sub_100007064(v113, @"/Applications/Mail.app/Contents/MacOS/Mail") & 1) != 0)
        {
          v114 = &off_100010370;
        }

        else
        {
          v114 = &off_100010378;
        }

        printf("%s", *v114);
        putchar(10);
LABEL_121:
        v115 = (void *)objc_claimAutoreleasedReturnValue([v110 objectForKey:@"setNoTimeOut"]);
        v116 = v115;
        if (v115 && [v115 BOOLValue])
        {
          printf("%s", off_100010380);
          putchar(10);
        }

        printf("Press 'Enter' to continue. Ctrl+\\ to cancel.");
        putchar(10);
        if (!isatty(1))
        {
          fwrite( "Triggering sysdiagnose programmatically from CLI with incorrect arguments. Exiting.",  0x53uLL,  1uLL,  __stderrp);
          fputc(10, __stderrp);
          exit(64);
        }

        do
          int v117 = fgetc(__stdinp) << 24;
        while (v117 != 218103808 && v117 != 167772160);

LABEL_131:
        v119 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"verbose"]);

        if (v119)
        {
          v120 = 0LL;
        }

        else
        {
          v154[0] = _NSConcreteStackBlock;
          v154[1] = 3221225472LL;
          v154[2] = sub_1000063E4;
          v154[3] = &unk_10000C468;
          id v155 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"shouldCreateTarBall"]);
          id v121 = v155;
          v120 = objc_retainBlock(v154);
        }

        id v153 = 0LL;
        v122 = (void *)objc_claimAutoreleasedReturnValue( +[Libsysdiagnose sysdiagnoseWithMetadata:withError:withProgressHandler:]( &OBJC_CLASS___Libsysdiagnose,  "sysdiagnoseWithMetadata:withError:withProgressHandler:",  v5,  &v153,  v120));
        id v123 = v153;
        if (v122)
        {
          id v124 = v122;
          printf("\nOutput available at '%s'.", (const char *)[v124 UTF8String]);
          putchar(10);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v125 = (const char *)[v124 UTF8String];
            LODWORD(v161.name) = 136315138;
            *(const char **)((char *)&v161.name + 4) = v125;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "\nOutput available at '%s'.",  (uint8_t *)&v161,  0xCu);
          }
        }

        if (v123)
        {
          v142 = __stderrp;
          id v143 = objc_claimAutoreleasedReturnValue([v123 localizedDescription]);
          fprintf(v142, "sysdiagnose error: %s", (const char *)[v143 UTF8String]);

          fputc(10, __stderrp);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100007EC4(v123);
          }
          goto LABEL_159;
        }

        objc_autoreleasePoolPop(context);
        return 0LL;
    }
  }

size_t sub_1000063E4(uint64_t a1, void *a2)
{
  uint64_t v3 = sdProgressPercent;
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v3]);
  [v5 doubleValue];
  double v7 = v6;

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:sdProgressPhase]);
  id v9 = [v8 unsignedLongLongValue];

  switch((unint64_t)v9)
  {
    case 0uLL:
      uint64_t v10 = __stdoutp;
      BOOL v11 = "\nInvalid Sysdiagnose state. Aborting.\n";
      size_t v12 = 38LL;
      return fwrite(v11, v12, 1uLL, v10);
    case 1uLL:
      int v13 = __stdoutp;
      uint64_t v14 = "Progress:\n";
      size_t v15 = 10LL;
      goto LABEL_6;
    case 3uLL:
      return fputc(10, __stdoutp);
    case 4uLL:
      int v13 = __stdoutp;
      uint64_t v14 = "\nCo-sysdiagnose transfer progress:\n";
      size_t v15 = 35LL;
LABEL_6:
      fwrite(v14, v15, 1uLL, v13);
      goto LABEL_7;
    case 6uLL:
      uint64_t v10 = __stdoutp;
      BOOL v11 = "\nCo-sysdiagnose Transfer Timed out\n";
      size_t v12 = 35LL;
      return fwrite(v11, v12, 1uLL, v10);
    default:
LABEL_7:
      char v30 = 0;
      uint64_t v17 = *(void *)(a1 + 32);
      *(void *)&__int128 v18 = 0x5F5F5F5F5F5F5F5FLL;
      *((void *)&v18 + 1) = 0x5F5F5F5F5F5F5F5FLL;
      *(_OWORD *)__s = v18;
      __int128 v27 = v18;
      __int128 v28 = v18;
      *(_OWORD *)v29 = v18;
      *(_OWORD *)&v29[14] = v18;
      char v25 = 0;
      *(_DWORD *)__str = 0;
      int v19 = strlen(__s);
      size_t v20 = (int)(v7 * (double)v19 / 100.0);
      snprintf(__str, 5uLL, "%02d%%", (int)v7);
      if (v19 >= 0x2D)
      {
        size_t v21 = strlen(__str);
        if (v21 >= 4) {
          uint64_t v22 = 4LL;
        }
        else {
          uint64_t v22 = v21;
        }
        __memcpy_chk((char *)&v28 + 7, __str, v22, 40LL);
      }

      fprintf(__stdoutp, "\x1B[J\x1B[2K[%s]\r", __s);
      if (v7 > 99.9 && v17 != 0) {
        fwrite("\nCompressing final diagnostics\n", 0x1FuLL, 1uLL, __stdoutp);
      }
      return fflush(__stdoutp);
  }

uint64_t sub_1000066B8()
{
  v0 = getprogname();
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 arguments]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectAtIndex:0]);
  id v4 = objc_claimAutoreleasedReturnValue([v3 lastPathComponent]);
  id v5 = (const char *)[v4 UTF8String];

  else {
    double v6 = "";
  }
  double v7 = sub_10000505C();
  id v8 = objc_claimAutoreleasedReturnValue(v7);
  printf( "%s\n USAGE: %s [args] [process_name | pid]\n -h                      Display this help.\n -H                      Print the path to the default sysdiagnose output directory.\n -v                      Enable verbose mode to display the container information as it executes.\n -f results_directory    Specify the directory where results will be stored.\n -A archive_name         Specify the name of the archive created in the results directory.\n -V volume_path          Specify the root volume for sysdiagnose to run on.\n -C, --compression type  Specify the compression type. It is an error to use this with the -n flag. Valid o ptions are:\n yaa: use parallel compression\n tar: use tar compression\n no-compression: don't compress the output. Identical to -n\n default: will use the system default. Currently defaults to tar\n -n                      Do not tar the resulting sysdiagnose directory.\n -k                      Do not remove the temporary directory.\n -F                      Get feedback data.\n -S                      Disable streaming to tarball.\n -u                      Disable UI feedback.\n -Q,                     Skip footprint.\n -q,                     Same as -Q\n -b                      Do not show a Finder window upon completion.\n -p                      Only run time-sensitive collections; disregards previous -d or -r flags.\n"
    "          -P                      Do not run time-sensitive collections.\n"
    "          -g                      Only run log generation collections; disregards previous -p or -r flags.\n"
    "          -G                      Do not run log generation collections.\n"
    "          -d                      Only run log copying collections; disregards previous -p or -r flags.\n"
    "          -D                      Do not run log copying collections.\n"
    "          -r                      Collect only log archive; disregards previous -p or -d flags.\n"
    "          -R                      Do not collect log archive.\n"
    "          [process_name | pid]    If a single process appears to be slowing down the system,\n"
    "                                  passing in the process name or ID as the argument gathers\n"
    "                                  additional process-specific diagnostic data; Specify only ONE process\n"
    "                                  at a time -- specifying multiple processes is not supported.\n"
    "%s\n"
    "DESCRIPTION:\n"
    "  %s gathers system diagnostic information helpful in investigating system performance issues.\n"
    "  A great deal of information is harvested, spanning system state and configuration. The data is stored /var/tmp dir"
    "ectory.\n"
    "  sysdiagnose needs to be run as root. To cancel an in-flight sysdiagnose triggered via command line interface, pres"
    "s Ctrl-\\.\n"
    "  %s is automatically triggered when the following key chord is pressed: Control-Option-Command-Shift-Period.\n"
    "WHAT %s COLLECTS:\n"
    "  - A spindump of the system\n"
    "  - Several seconds of top output\n"
    "  - Data about kernel zones\n"
    "  - Status of loaded kernel extensions\n"
    "  - Resident memory usage of user processes\n"
    "  - Recent system logs\n"
    "  - A System Profiler report\n"
    "  - Recent crash reports\n"
    "  - Disk usage information\n"
    "  - I/O Kit registry information\n"
    "  - Network status\n"
    "  - If a specific process is supplied as an argument, will collect:\n"
    "      - A list of malloc-allocated buffers in the process's heap\n"
    "      - Data about unreferenced malloc buffers in the process's memory\n"
    "      - Data about the virtual memory regions allocated in the process\n",
    (const char *)[v8 UTF8String],
    v5,
    v6,
    v0,
    v0,
    v0);

  return putchar(10);
}

BOOL sub_100006798(unsigned int a1, void *a2, void *a3)
{
  id v5 = a2;
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v6, "REQUEST_TYPE", a1);
  if (v5)
  {
    v42 = a3;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
    id v8 = [v7 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v45;
      id v43 = v7;
      BOOL v11 = &CFPreferencesGetAppBooleanValue_ptr;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v45 != v10) {
            objc_enumerationMutation(v7);
          }
          int v13 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v13]);
          uint64_t v15 = objc_opt_class(v11[17]);
          if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
          {
            xpc_dictionary_set_BOOL( v6, (const char *)[v13 UTF8String], (BOOL)[v14 BOOLValue]);
          }

          else
          {
            uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0)
            {
              xpc_dictionary_set_string( v6, (const char *)[v13 UTF8String], (const char *)[v14 UTF8String]);
            }

            else
            {
              uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDictionary);
              if ((objc_opt_isKindOfClass(v14, v17) & 1) != 0)
              {
                __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v14,  1LL,  0LL));
                if (v18)
                {
                  int v19 = (const char *)[v13 UTF8String];
                  id v20 = v18;
                  id v21 = [v20 bytes];
                  uint64_t v22 = v20;
                  double v7 = v43;
                  id v23 = [v22 length];
                  v24 = v21;
                  BOOL v11 = &CFPreferencesGetAppBooleanValue_ptr;
                  xpc_dictionary_set_data(v6, v19, v24, (size_t)v23);
                }
              }

              else
              {
                uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSSet);
                if ((objc_opt_isKindOfClass(v14, v25) & 1) != 0)
                {
                  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v14,  1LL,  0LL));
                  if (v26)
                  {
                    __int128 v27 = (const char *)[v13 UTF8String];
                    id v28 = v26;
                    id v29 = [v28 bytes];
                    char v30 = v28;
                    BOOL v11 = &CFPreferencesGetAppBooleanValue_ptr;
                    xpc_dictionary_set_data(v6, v27, v29, (size_t)[v30 length]);
                  }

                  double v7 = v43;
                }

                else
                {
                  uint64_t v31 = __stderrp;
                  id v32 = v13;
                  fprintf( v31,  "Undefined type in the metadata for key '%s': not including in request",  (const char *)[v32 UTF8String]);
                  BOOL v11 = &CFPreferencesGetAppBooleanValue_ptr;
                  fputc(10, __stderrp);
                  double v7 = v43;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    sub_1000081A0((int)&v48, v32);
                  }
                }
              }
            }
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }

      while (v9);
    }

    a3 = v42;
  }

  if (qword_1000103C0 != -1) {
    dispatch_once(&qword_1000103C0, &stru_10000C588);
  }
  id v33 = (_xpc_connection_s *)(id)qword_1000103B8;
  xpc_object_t v34 = xpc_connection_send_message_with_reply_sync(v33, v6);
  if (xpc_get_type(v34) == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t uint64 = (unsigned __int16)xpc_dictionary_get_uint64(v34, "RESPONSE_TYPE");
    uint64_t v39 = xpc_dictionary_get_uint64(v34, "FAILURE_REASON");
    BOOL v37 = uint64 == 1 || v39 == 7;
    if (a3 && v37)
    {
      *a3 = v34;
      BOOL v37 = 1LL;
    }
  }

  else
  {
    v35 = __stderrp;
    string = xpc_dictionary_get_string(v34, _xpc_error_key_description);
    fprintf(v35, "Received error from the daemon: %s", string);
    fputc(10, __stderrp);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000812C(v34, _xpc_error_key_description);
    }
    BOOL v37 = 0LL;
  }

  return v37;
}

void sub_100006C44(id a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  mach_service = xpc_connection_create_mach_service("com.apple.sysdiagnose.service.xpc", v5, 2uLL);
  xpc_connection_set_event_handler(mach_service, &stru_10000C5C8);
  uint64_t v3 = (void *)qword_1000103B8;
  qword_1000103B8 = (uint64_t)mach_service;
  id v4 = mach_service;

  xpc_connection_resume((xpc_connection_t)qword_1000103B8);
}

void sub_100006CCC(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error)
  {
    uint64_t v3 = __stderrp;
    string = xpc_dictionary_get_string(v2, _xpc_error_key_description);
    fprintf(v3, "XPC connection to daemon '%s' received error: %s.", "com.apple.sysdiagnose.service.xpc", string);
    fputc(10, __stderrp);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000081E8(v2, _xpc_error_key_description);
    }
  }
}

void sub_100006D84(id a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  queue = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  signal(2, (void (__cdecl *)(int))1);
  dispatch_source_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 2uLL, 0LL, queue);
  uint64_t v3 = (void *)qword_1000103D0;
  qword_1000103D0 = (uint64_t)v2;

  dispatch_source_set_event_handler((dispatch_source_t)qword_1000103D0, &stru_10000C608);
  dispatch_resume((dispatch_object_t)qword_1000103D0);
  signal(15, (void (__cdecl *)(int))1);
  signal(3, (void (__cdecl *)(int))1);
  signal(18, (void (__cdecl *)(int))1);
  dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, queue);
  id v5 = (void *)qword_1000103E0;
  qword_1000103E0 = (uint64_t)v4;

  dispatch_source_set_event_handler((dispatch_source_t)qword_1000103E0, &stru_10000C628);
  dispatch_resume((dispatch_object_t)qword_1000103E0);
  dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x12uLL, 0LL, queue);
  double v7 = (void *)qword_1000103D8;
  qword_1000103D8 = (uint64_t)v6;

  dispatch_source_set_event_handler((dispatch_source_t)qword_1000103D8, &stru_10000C628);
  dispatch_resume((dispatch_object_t)qword_1000103D8);
  dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 3uLL, 0LL, queue);
  id v9 = (void *)qword_1000103E8;
  qword_1000103E8 = (uint64_t)v8;

  dispatch_source_set_event_handler((dispatch_source_t)qword_1000103E8, &stru_10000C628);
  dispatch_resume((dispatch_object_t)qword_1000103E8);
}

void sub_100006EE8(id a1)
{
  if (!sub_100006798(6u, 0LL, 0LL))
  {
    fwrite("Sysdiagnose request to daemon for user interrupt failed", 0x37uLL, 1uLL, __stderrp);
    fputc(10, __stderrp);
    BOOL v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v1) {
      sub_10000827C(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }

void sub_100006F5C(id a1)
{
  if (sub_100006798(4u, 0LL, 0LL))
  {
    printf("Sysdiagnose cancelled successfully.");
    putchar(10);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Sysdiagnose cancelled successfully.",  buf,  2u);
    }

    exit(0);
  }

  fwrite("Encountered error during user-initiated cancellation.", 0x35uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)BOOL v1 = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Encountered error during user-initiated cancellation.",  v1,  2u);
  }

  exit(1);
}

id sub_100007064(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v3 intValue];
  if ((_DWORD)v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
    id v7 = (id)sub_100004F74(v6, v4);
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
    id v7 = [v3 isEqualToString:v6];
  }

  id v8 = v7;

  return v8;
}

void sub_1000070F8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id sub_100007108(int a1, id a2)
{
  return a2;
}

  ;
}

void sub_100007120(void *a1, os_log_s *a2, uint64_t a3, const char *a4)
{
}

  ;
}

  ;
}

id sub_100007144(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"/var",  @"/tmp",  @"/etc",  0LL));
  id v3 = v1;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = [v2 countByEnumeratingWithState:&v12 objects:v17 count:16];
  id v5 = v3;
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v13;
    id v5 = v3;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v2);
        }
        if ([v3 hasPrefix:*(void *)(*((void *)&v12 + 1) + 8 * (void)v8)])
        {
          v16[0] = @"/private";
          v16[1] = v3;
          id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
          uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v9));

          id v5 = (void *)v10;
        }

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v2 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }

    while (v6);
  }

  return v5;
}

void sub_10000738C(id a1)
{
  id v1 = (void *)qword_1000103F0;
  qword_1000103F0 = (uint64_t)&off_10000CCD8;
}

id sub_10000760C()
{
  if (qword_100010400 != -1) {
    dispatch_once(&qword_100010400, &stru_10000C6A8);
  }
  return (id)qword_100010408;
}

BOOL sub_10000764C(id a1, NSURL *a2, NSError *a3)
{
  id v3 = a3;
  id v4 = sub_10000760C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000082B0(v3, v5);
  }

  return 1;
}

LABEL_11:
  return (char)v5;
}

LABEL_20:
  return v14;
}

LABEL_14:
  return v10;
}

void sub_100007DEC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.sysdiagnose.CacheDelete", "enumerator");
  uint64_t v2 = (void *)qword_100010408;
  qword_100010408 = (uint64_t)v1;
}

void sub_100007E1C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100007E90( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100007EC4(void *a1)
{
  id v1 = objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  [v1 UTF8String];
  sub_100005090( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "sysdiagnose error: %s",  v3,  v4,  v5,  v6,  2u);

  sub_100007130();
}

void sub_100007F4C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100007F80( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000070F8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "xpc_dictionary_get_data returned nothing for 'RESPONSE_DATA' from daemon response for UUID dict",  a5,  a6,  a7,  a8,  0);
  sub_100007118();
}

void sub_100007FB4(int a1, void *a2)
{
  id v4 = [sub_100007108(a1, a2) UTF8String];
  *uint64_t v3 = 136315138;
  void *v2 = v4;
  sub_100007120( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v5,  "Malformed daemon response. Remote UUID '%s' not found");
  sub_10000713C();
}

void sub_100007FFC(int a1, void *a2)
{
  id v4 = [sub_100007108(a1, a2) UTF8String];
  *uint64_t v3 = 136315138;
  void *v2 = v4;
  sub_100007120((void *)&_mh_execute_header, (os_log_s *)&_os_log_default, v5, "Remote UUID '%s' not found");
  sub_10000713C();
}

void sub_100008044( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100008078(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100005090( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "Failed to deserialize xpc data for UUID dict: %@",  v3,  v4,  v5,  v6,  2u);

  sub_100007130();
}

void sub_1000080F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000812C(void *a1, const char *a2)
{
}

void sub_1000081A0(int a1, void *a2)
{
  id v4 = [sub_100007108(a1, a2) UTF8String];
  *uint64_t v3 = 136315138;
  void *v2 = v4;
  sub_100007120( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v5,  "Undefined type in the metadata for key '%s': not including in request");
  sub_10000713C();
}

void sub_1000081E8(void *a1, const char *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "com.apple.sysdiagnose.service.xpc";
  __int16 v4 = 2080;
  string = xpc_dictionary_get_string(a1, a2);
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "XPC connection to daemon '%s' received error: %s.",  (uint8_t *)&v2,  0x16u);
}

void sub_10000827C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000082B0(void *a1, os_log_s *a2)
{
  id v3 = objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  int v4 = 136446210;
  id v5 = [v3 UTF8String];
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "CacheEnumerator error: %{public}s",  (uint8_t *)&v4,  0xCu);
}

id objc_msgSend_validFileSubstrings(void *a1, const char *a2, ...)
{
  return [a1 validFileSubstrings];
}