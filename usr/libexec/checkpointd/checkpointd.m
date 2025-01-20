void start()
{
  uint64_t v0;
  v0 = MOXPCTransportOpen("com.apple.mobilecheckpoint.checkpointd", 1LL);
  MOXPCTransportSetMessageHandler(v0, &_dispatch_main_q, &stru_100058220);
  MOXPCTransportResume(v0);
  dispatch_main();
}

void sub_100004808(id a1, OS_xpc_object *a2, __CFDictionary *a3)
{
  v4 = a2;
  v5 = objc_autoreleasePoolPush();
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", @"command"));
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
  {
    v144 = v7;
    uint64_t v10 = 0xFFFFFFFFLL;
LABEL_8:
    v26 = objc_autoreleasePoolPush();
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 lastPathComponent]);

    id v29 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%d: unknown command %d", v28, 437LL, v10));
    syslog(5, "%s", (const char *)[v29 UTF8String]);

    v30 = v26;
LABEL_9:
    objc_autoreleasePoolPop(v30);
    v7 = v144;
LABEL_10:
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    goto LABEL_11;
  }

  id v9 = [v7 intValue];
  if ((_DWORD)v9 == 1)
  {
    v32 = objc_autoreleasePoolPush();
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"));
    v34 = (void *)objc_claimAutoreleasedReturnValue([v33 lastPathComponent]);

    id v35 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%d: shutting down...", v34, 427LL));
    syslog(5, "%s", (const char *)[v35 UTF8String]);

    objc_autoreleasePoolPop(v32);
    dispatch_time_t v36 = dispatch_time(0LL, 2000000000LL);
    dispatch_after(v36, &_dispatch_main_q, &stru_100058260);
    goto LABEL_10;
  }

  uint64_t v10 = (uint64_t)v9;
  v144 = v7;
  if ((_DWORD)v9) {
    goto LABEL_8;
  }
  v11 = objc_autoreleasePoolPush();
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);

  id v14 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%d: rebuilding checkpoint", v13, 401LL));
  syslog(5, "%s", (const char *)[v14 UTF8String]);

  objc_autoreleasePoolPop(v11);
  v15 = objc_autoreleasePoolPush();
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  @"/System/Library/CoreServices/Checkpoint.xml"));
  v18 = objc_autoreleasePoolPush();
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 lastPathComponent]);

  if (!v17)
  {
    id v37 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%d: failed to create dictionary from %s", v20, 339LL, "/System/Library/CoreServices/Checkpoint.xml"));
    syslog(5, "%s", (const char *)[v37 UTF8String]);

    objc_autoreleasePoolPop(v18);
    v30 = v15;
    goto LABEL_9;
  }

  id v21 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%d: no checkpoint info from EmbeddedMedia", v20, 348LL));
  syslog(5, "%s", (const char *)[v21 UTF8String]);

  objc_autoreleasePoolPop(v18);
  obuint64_t j = v16;
  [v17 setObject:v16 forKeyedSubscript:@"__removals__"];
  id v22 = v17;
  v23 = (void *)MGCopyAnswer(@"DeviceClassNumber", 0LL);
  v24 = v23;
  if (v23) {
    unsigned int v25 = [v23 intValue];
  }
  else {
    unsigned int v25 = -1;
  }

  __int128 v160 = 0u;
  __int128 v161 = 0u;
  LOBYTE(v160) = v25 == 5;
  BYTE1(v160) = v25 == 3;
  BYTE2(v160) = v25 == 1;
  v38 = (void *)MGCopyAnswer(@"HasBaseband", 0LL);
  v39 = v38;
  if (v38) {
    BOOL v40 = [v38 intValue] != 0;
  }
  else {
    BOOL v40 = 0;
  }

  BYTE6(v160) = v40;
  v41 = (void *)MGCopyAnswer(@"main-screen-scale", 0LL);
  v42 = v41;
  if (v41) {
    BOOL v43 = (int)[v41 intValue] > 1;
  }
  else {
    BOOL v43 = 0;
  }

  BYTE7(v160) = v43;
  v44 = (void *)MGCopyAnswer(@"jMiqevikb6QWeHOhvLsw6A", 0LL);
  v45 = v44;
  if (v44) {
    BOOL v46 = [v44 intValue] != 0;
  }
  else {
    BOOL v46 = 0;
  }

  BYTE8(v160) = v46;
  if (v25 == 1)
  {
    BOOL v47 = 1;
  }

  else
  {
    v48 = (void *)MGCopyAnswer(@"5MSZn7w3nnJp22VbpqaxLQ", 0LL);
    v49 = v48;
    if (v48) {
      BOOL v47 = [v48 intValue] != 0;
    }
    else {
      BOOL v47 = 0;
    }
  }

  BYTE9(v160) = v47;
  v50 = (void *)MGCopyAnswer(@"iTunesFamilyID", 0LL);
  v51 = v50;
  if (v50) {
    unsigned int v52 = [v50 intValue];
  }
  else {
    unsigned int v52 = 0;
  }

  HIDWORD(v160) = v52;
  v53 = (void *)MGCopyAnswer(@"main-screen-class", 0LL);
  v54 = v53;
  if (v53) {
    unsigned int v55 = [v53 intValue];
  }
  else {
    unsigned int v55 = -1;
  }

  LODWORD(v161) = v55;
  BYTE3(v160) = v55 == 5;
  BYTE4(v160) = v55 == 8;
  BYTE5(v160) = v55 == 9;
  v56 = (const __CFString *)MGCopyAnswer(@"MinimumSupportediTunesVersion", 0LL);
  if (v56)
  {
    v57 = v56;
    v162.length = CFStringGetLength(v56);
    v162.location = 0LL;
    CFStringGetBytes(v57, v162, 0x600u, 0, 0, (UInt8 *)&v161 + 4, 10LL, 0LL);
    CFRelease(v57);
    if (BYTE4(v161))
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  (char *)&v161 + 4,  1LL));
      [v22 setObject:v58 forKeyedSubscript:@"MinITunesVersion"];
    }
  }

  if (BYTE6(v160)) {
    [v22 setObject:&__kCFBooleanTrue forKeyedSubscript:@"SupportsCarrierBundleInstall"];
  }
  context = v15;
  if (!(_BYTE)v160)
  {
    sub_10001A250((uint64_t)&v152, (uint64_t)&v151);
    if ((_DWORD)v59)
    {
      uint64_t v60 = v59;
      v61 = objc_autoreleasePoolPush();
      v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"));
      id v63 = v22;
      v64 = (void *)objc_claimAutoreleasedReturnValue([v62 lastPathComponent]);

      id v65 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%d: Can't get stuff: %d", v64, 120LL, v60));
      syslog(5, "%s", (const char *)[v65 UTF8String]);

      id v22 = v63;
      objc_autoreleasePoolPop(v61);
    }

    else
    {
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v152));
      [v22 setObject:v66 forKeyedSubscript:@"FairPlayDeviceType"];

      v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v151));
      [v22 setObject:v67 forKeyedSubscript:@"KeyTypeSupportVersion"];
    }

    sub_10002D41C();
    if ((_DWORD)v68)
    {
      uint64_t v69 = v68;
      v70 = objc_autoreleasePoolPush();
      v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"));
      id v72 = v22;
      v73 = (void *)objc_claimAutoreleasedReturnValue([v71 lastPathComponent]);

      id v74 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%d: Can't get CB stuff: %d", v73, 127LL, v69));
      syslog(5, "%s", (const char *)[v74 UTF8String]);

      id v22 = v72;
      objc_autoreleasePoolPop(v70);
    }

    else
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v150));
      [v22 setObject:v75 forKeyedSubscript:@"FairPlayCBMinVersion"];

      v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v149));
      [v22 setObject:v76 forKeyedSubscript:@"FairPlayCBMaxVersion"];
    }
  }

  if (HIDWORD(v160))
  {
    v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
    [v22 setObject:v77 forKeyedSubscript:@"FamilyID"];
  }

  uint64_t v78 = MGCopyAnswer(@"main-screen-width", 0LL);
  if (v78)
  {
    v79 = (void *)v78;
    [v22 setObject:v78 forKeyedSubscript:@"ScreenWidth"];
  }

  uint64_t v80 = MGCopyAnswer(@"main-screen-height", 0LL);
  if (v80)
  {
    v81 = (void *)v80;
    [v22 setObject:v80 forKeyedSubscript:@"ScreenHeight"];
  }

  uint64_t v82 = MGCopyAnswer(@"main-screen-scale", 0LL);
  if (v82)
  {
    v83 = (void *)v82;
    [v22 setObject:v82 forKeyedSubscript:@"ScreenScaleFactor"];
  }

  if (BYTE1(v160))
  {
    [v22 setObject:&off_10005D520 forKeyedSubscript:@"HomeScreenIconWidth"];
    [v22 setObject:&off_10005D520 forKeyedSubscript:@"HomeScreenIconHeight"];
    v84 = &off_10005D4F0;
  }

  else
  {
    [v22 setObject:&off_10005D4C0 forKeyedSubscript:@"HomeScreenIconWidth"];
    [v22 setObject:&off_10005D4C0 forKeyedSubscript:@"HomeScreenIconHeight"];
    v84 = &off_10005D508;
    if (!BYTE3(v160))
    {
      if (BYTE4(v160) | BYTE5(v160)) {
        v85 = &off_10005D4F0;
      }
      else {
        v85 = &off_10005D508;
      }
      goto LABEL_60;
    }
  }

  v85 = &off_10005D4D8;
LABEL_60:
  [v22 setObject:v85 forKeyedSubscript:@"HomeScreenIconRows"];
  [v22 setObject:&off_10005D508 forKeyedSubscript:@"HomeScreenIconColumns"];
  [v22 setObject:v84 forKeyedSubscript:@"HomeScreenIconDockMaxCount"];
  v86 = v22;
  if (BYTE1(v160))
  {
    sub_100005B20(v22, @"AlbumArt", @"3001");
    v87 = @"3002";
    v88 = v22;
    v89 = @"AlbumArt";
  }

  else
  {
    sub_100005B20(v22, @"AlbumArt", @"3013");
    sub_100005B20(v22, @"AlbumArt", @"3018");
    sub_100005B20(v22, @"AlbumArt", @"3019");
    sub_100005B20(v22, @"AlbumArt", @"3020");
    sub_100005B20(v22, @"AlbumArt", @"3021");
    v89 = @"ChapterImageSpecs";
    v88 = v22;
    v87 = @"3013";
  }

  sub_100005B20(v88, v89, v87);
  if (BYTE7(v160)) {
    v90 = @"3001";
  }
  else {
    v90 = @"3101";
  }
  if (BYTE7(v160)) {
    v91 = @"3002";
  }
  else {
    v91 = @"3102";
  }
  if (BYTE7(v160)) {
    v92 = @"3005";
  }
  else {
    v92 = @"3105";
  }
  if (BYTE7(v160)) {
    v93 = @"3006";
  }
  else {
    v93 = @"3106";
  }
  if (BYTE7(v160)) {
    v94 = @"3007";
  }
  else {
    v94 = @"3107";
  }
  if (BYTE7(v160)) {
    v95 = @"3012";
  }
  else {
    v95 = @"3112";
  }
  sub_100005B20(v86, @"AlbumArt", v90);
  sub_100005B20(v86, @"AlbumArt", v91);
  sub_100005B20(v86, @"AlbumArt", v92);
  sub_100005B20(v86, @"AlbumArt", v93);
  sub_100005B20(v86, @"AlbumArt", v94);
  sub_100005B20(v86, @"ChapterImageSpecs", v95);
  sub_100005B20(v86, @"ChapterImageSpecs", v92);
  v142 = v5;
  v143 = v4;
  v141 = v6;
  v96 = v86;
  if (BYTE7(v160))
  {
    v97 = @"4040";
    v98 = @"4032";
    v99 = @"3041";
    v100 = @"3034";
    v101 = @"4036";
    if (BYTE1(v160))
    {
      v102 = @"4035";
      goto LABEL_93;
    }

    v102 = @"4140";
    v103 = @"4132";
    v104 = @"4037";
    goto LABEL_91;
  }

  if (!BYTE1(v160))
  {
    sub_100005B20(v86, @"ImageSpecifications", @"4040");
    v97 = @"4140";
    v98 = @"4132";
    v99 = @"4131";
    v100 = @"3141";
    v101 = @"3143";
    v102 = @"4037";
    v103 = @"4035";
    v104 = @"4032";
LABEL_91:
    sub_100005B20(v86, @"ImageSpecifications", v104);
    goto LABEL_92;
  }

  v97 = @"4140";
  v98 = @"4132";
  v99 = @"4131";
  v100 = @"3141";
  v101 = @"3143";
  v102 = @"4037";
  v103 = @"4036";
LABEL_92:
  sub_100005B20(v86, @"ImageSpecifications", v103);
LABEL_93:
  sub_100005B20(v86, @"ImageSpecifications", v102);
  sub_100005B20(v86, @"ImageSpecifications", v101);
  sub_100005B20(v86, @"ImageSpecifications", v100);
  sub_100005B20(v86, @"ImageSpecifications", v99);
  sub_100005B20(v86, @"ImageSpecifications", v98);
  sub_100005B20(v86, @"ImageSpecifications", v97);
  if (!BYTE8(v160))
  {
    v105 = (void *)objc_claimAutoreleasedReturnValue([v86 objectForKeyedSubscript:@"ImageSpecifications"]);
    v106 = v105;
    if (v105)
    {
      v107 = (char *)[v105 count];
      if (v107)
      {
        v108 = v107;
        v109 = 0LL;
        v110 = 0LL;
        do
        {
          v111 = v110;
          v110 = (void *)objc_claimAutoreleasedReturnValue([v106 objectAtIndex:v109]);

          uint64_t v112 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v110, v112) & 1) != 0) {
            [v110 removeObjectForKey:@"PreserveSourceColorSpace"];
          }
          ++v109;
        }

        while (v108 != v109);

        v96 = v86;
      }

      [v96 setObject:v106 forKeyedSubscript:@"ImageSpecifications"];
    }
  }

  if (BYTE9(v160)) {
    [v96 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Ringtones"];
  }
  v113 = dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 1);
  if (!v113)
  {
    v117 = objc_autoreleasePoolPush();
    v118 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"));
    v119 = (void *)objc_claimAutoreleasedReturnValue([v118 lastPathComponent]);

    v120 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%d: couldn't dlopen UIKit",  v119,  322LL);
LABEL_111:
    id v122 = objc_claimAutoreleasedReturnValue(v120);
    syslog(5, "%s", (const char *)[v122 UTF8String]);

    objc_autoreleasePoolPop(v117);
    goto LABEL_114;
  }

  v114 = (uint64_t (*)(void))dlsym(v113, "UIKeyboardGetSupportedInputModes");
  if (!v114)
  {
    v117 = objc_autoreleasePoolPush();
    v121 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"));
    v119 = (void *)objc_claimAutoreleasedReturnValue([v121 lastPathComponent]);

    v120 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%d: couldn't look up UIKeyboardGetSupportedInputModes",  v119,  319LL);
    goto LABEL_111;
  }

  uint64_t v115 = v114();
  v116 = (void *)objc_claimAutoreleasedReturnValue(v115);
  if (v116)
  {
    [v96 setObject:v116 forKeyedSubscript:@"SupportedKeyboards"];
  }

  else
  {
    v123 = objc_autoreleasePoolPush();
    v124 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"));
    v125 = (void *)objc_claimAutoreleasedReturnValue([v124 lastPathComponent]);

    id v126 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%d: UIKeyboardGetSupportedInputModes returned NULL", v125, 316LL));
    syslog(5, "%s", (const char *)[v126 UTF8String]);

    objc_autoreleasePoolPop(v123);
  }

LABEL_114:
  __int128 v158 = 0u;
  __int128 v159 = 0u;
  timeval v156 = (timeval)0;
  __int128 v157 = 0u;
  id obja = obj;
  id v146 = [obja countByEnumeratingWithState:&v156 objects:&v155 count:16];
  if (v146)
  {
    uint64_t v145 = *(void *)v157;
    do
    {
      for (i = 0LL; i != v146; i = (char *)i + 1)
      {
        if (*(void *)v157 != v145) {
          objc_enumerationMutation(obja);
        }
        uint64_t v128 = *(void *)(*(void *)&v156.tv_usec + 8LL * (void)i);
        v129 = (void *)objc_claimAutoreleasedReturnValue([obja objectForKeyedSubscript:v128]);
        v130 = v96;
        v131 = (void *)objc_claimAutoreleasedReturnValue([v96 objectForKeyedSubscript:v128]);
        v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        uint64_t v133 = (uint64_t)[v131 count];
        if (v133 >= 1)
        {
          uint64_t v134 = v133;
          for (uint64_t j = 0LL; j < v134; j += 2LL)
          {
            v136 = (void *)objc_claimAutoreleasedReturnValue([v131 objectAtIndex:j]);
            if (([v129 containsObject:v136] & 1) == 0)
            {
              [v132 addObject:v136];
              v137 = (void *)objc_claimAutoreleasedReturnValue([v131 objectAtIndex:j + 1]);
              [v132 addObject:v137];
            }
          }
        }

        v96 = v130;
        [v130 setObject:v132 forKey:v128];
      }

      id v146 = [obja countByEnumeratingWithState:&v156 objects:&v155 count:16];
    }

    while (v146);
  }

  [v96 removeObjectForKey:@"__removals__"];
  id v138 = v96;

  objc_autoreleasePoolPop(context);
  v139 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v138,  200LL,  0LL,  0LL));
  v5 = v142;
  v4 = v143;
  v6 = v141;
  if ([v139 writeToFile:@"/var/mobile/Library/Caches/Checkpoint.plist.tmp" atomically:1])
  {
    if (!stat("/System/Library/CoreServices/Checkpoint.xml", &v155))
    {
      v156.tv_sec = v155.st_mtimespec.tv_sec;
      *(&v156.tv_usec + 1) = 0;
      v156.tv_usec = SLODWORD(v155.st_mtimespec.tv_nsec) / 1000;
      *(void *)&__int128 v157 = v155.st_mtimespec.tv_sec;
      *((void *)&v157 + 1) = (SLODWORD(v155.st_mtimespec.tv_nsec) / 1000);
    }
  }

  v153 = @"checkpoint";
  id v154 = v138;
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v154,  &v153,  1LL));

  v7 = v144;
  if (!v31) {
    goto LABEL_10;
  }
LABEL_11:
  MOXPCTransportSendMessageOnConnection(v4, v31);

  objc_autoreleasePoolPop(v5);
}

void sub_100005A84(id a1)
{
  v1 = objc_autoreleasePoolPush();
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 lastPathComponent]);

  id v4 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%d: done", v3, 430LL));
  syslog(5, "%s", (const char *)[v4 UTF8String]);

  objc_autoreleasePoolPop(v1);
  exit(0);
}

void sub_100005B20(void *a1, void *a2, void *a3)
{
  id v10 = a1;
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"__removals__"]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v5]);

  if (!v8)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"__removals__"]);
    [v9 setObject:v8 forKeyedSubscript:v5];
  }

  [v8 addObject:v6];
}

void *sub_100005BF0(void *result)
{
  *result = ++qword_100060350;
  return result;
}

uint64_t sub_100005C0C( mach_port_t a1, int a2, int *a3, uint64_t a4, int a5, _OWORD *a6, void *a7, _DWORD *a8, _DWORD *a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  int v30 = 1;
  uint64_t v31 = a4;
  int v32 = 16777472;
  int v33 = a5;
  NDR_record_t v34 = NDR_record;
  int v17 = *a3;
  int v35 = a2;
  int v36 = v17;
  int v37 = a5;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x4B000000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v19 = mach_msg(&msg, 3, 0x40u, 0xDCu, reply_port, 0, 0);
  uint64_t v20 = v19;
  if ((v19 - 268435458) <= 0xE && ((1 << (v19 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v19)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v20 = 4294966988LL;
      }

      else if (msg.msgh_id == 1300)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v20 = 4294966996LL;
          if (v30 == 2
            && msg.msgh_size == 212
            && !msg.msgh_remote_port
            && HIBYTE(v32) == 1
            && HIWORD(v35) << 16 == 1114112)
          {
            int v21 = v33;
            if (v33 == v47)
            {
              uint64_t v20 = 0LL;
              int v22 = *(_DWORD *)&v34.mig_vers;
              *a3 = v38;
              __int128 v23 = v46;
              a6[6] = v45;
              a6[7] = v23;
              __int128 v24 = v44;
              a6[4] = v43;
              a6[5] = v24;
              __int128 v25 = v40;
              *a6 = v39;
              a6[1] = v25;
              __int128 v26 = v42;
              a6[2] = v41;
              a6[3] = v26;
              *a7 = v31;
              *a8 = v21;
              int v27 = v49;
              *a9 = v48;
              *a10 = v27;
              *a11 = v50;
              *a12 = v22;
              return v20;
            }
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v20 = 4294966996LL;
          if (HIDWORD(v31))
          {
            if (msg.msgh_remote_port) {
              uint64_t v20 = 4294966996LL;
            }
            else {
              uint64_t v20 = HIDWORD(v31);
            }
          }
        }

        else
        {
          uint64_t v20 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v20 = 4294966995LL;
      }

      mach_msg_destroy(&msg);
      return v20;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v20;
}

uint64_t sub_100005E64(mach_port_t a1, unsigned int a2, __int128 *a3)
{
  __int128 v4 = a3[5];
  __int128 v19 = a3[4];
  __int128 v20 = v4;
  __int128 v5 = a3[7];
  __int128 v21 = a3[6];
  __int128 v22 = v5;
  __int128 v6 = a3[1];
  __int128 v15 = *a3;
  __int128 v16 = v6;
  __int128 v7 = a3[3];
  __int128 v17 = a3[2];
  NDR_record_t v13 = NDR_record;
  unsigned int v14 = a2;
  __int128 v18 = v7;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x4B100000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 3, 0xA4u, 0x2Cu, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v10;
  }

  if ((_DWORD)v9)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v10;
  }

  if (msg.msgh_id == 71)
  {
    uint64_t v10 = 4294966988LL;
LABEL_17:
    mach_msg_destroy(&msg);
    return v10;
  }

  if (msg.msgh_id != 1301)
  {
    uint64_t v10 = 4294966995LL;
    goto LABEL_17;
  }

  uint64_t v10 = 4294966996LL;
  if ((msg.msgh_bits & 0x80000000) != 0) {
    goto LABEL_17;
  }
  if (msg.msgh_size != 36) {
    goto LABEL_17;
  }
  if (msg.msgh_remote_port) {
    goto LABEL_17;
  }
  uint64_t v10 = v14;
  if (v14) {
    goto LABEL_17;
  }
  return v10;
}

uint64_t sub_100005FF0( mach_port_t a1, int a2, int a3, int a4, _OWORD *a5, uint64_t a6, int a7, _OWORD *a8, void *a9, _DWORD *a10)
{
  int v18 = 1;
  uint64_t v19 = a6;
  int v20 = 16777472;
  int v21 = a7;
  NDR_record_t v22 = NDR_record;
  *(_DWORD *)__int128 v23 = a2;
  *(_DWORD *)&v23[4] = a3;
  *(_DWORD *)&v23[8] = a4;
  *(_OWORD *)&v23[12] = *a5;
  int v24 = a7;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x4B200000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v13 = mach_msg(&msg, 3, 0x54u, 0x50u, reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v13)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v14 = 4294966988LL;
      }

      else if (msg.msgh_id == 1302)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v14 = 4294966996LL;
          if (v18 == 1 && msg.msgh_size == 72 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
          {
            int v15 = v21;
            if (v21 == *(_DWORD *)&v23[16])
            {
              uint64_t v14 = 0LL;
              *a8 = *(_OWORD *)v23;
              *a9 = v19;
              *a10 = v15;
              return v14;
            }
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v14 = 4294966996LL;
          if (HIDWORD(v19))
          {
            if (msg.msgh_remote_port) {
              uint64_t v14 = 4294966996LL;
            }
            else {
              uint64_t v14 = HIDWORD(v19);
            }
          }
        }

        else
        {
          uint64_t v14 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v14 = 4294966995LL;
      }

      mach_msg_destroy(&msg);
      return v14;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v14;
}

uint64_t sub_1000061DC(mach_port_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x4B300000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v11 = mach_msg(&msg, 3, 0x18u, 0x3Cu, reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v11)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v12;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v12 = 4294966988LL;
    }

    else if (msg.msgh_id == 1303)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 52)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v12 = v18;
            if (!v18)
            {
              int v15 = v20;
              *a2 = v19;
              *a3 = v15;
              int v16 = v22;
              *a4 = v21;
              *a5 = v16;
              return v12;
            }

            goto LABEL_23;
          }
        }

        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v13 = 1;
          }
          else {
            BOOL v13 = v18 == 0;
          }
          if (v13) {
            uint64_t v12 = 4294966996LL;
          }
          else {
            uint64_t v12 = v18;
          }
          goto LABEL_23;
        }
      }

      uint64_t v12 = 4294966996LL;
    }

    else
    {
      uint64_t v12 = 4294966995LL;
    }

LABEL_23:
    mach_msg_destroy(&msg);
    return v12;
  }

  mig_put_reply_port(msg.msgh_local_port);
  return v12;
}

void sub_100006354(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 ^ (1178560073 * ((-2 - ((a1 | 0x5930FF1B) + (~(_DWORD)a1 | 0xA6CF00E4))) ^ 0x1C5B7886));
  uint64_t v3 = *(void *)(a1 + 8);
  v2[0] = v1
  sub_100019B50((uint64_t)v2);
  __asm { BR              X9 }
}

uint64_t sub_100006488@<X0>(uint64_t a1@<X8>)
{
  unsigned int v5 = (((v4 - v3) >> 4) & 0x7E0FDFE ^ 0x2405970)
  BOOL v7 = v5 > (v2 ^ 0x427F84DBu) && v5 < v1 + 1115652291;
  return (*(uint64_t (**)(void))(a1 + 8LL * ((59 * v7) ^ (v2 - 721))))();
}

uint64_t sub_100006504@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * (v2 ^ (217 * ((v1 & 0x1F) != 0x1C)))) - 4LL))();
}

uint64_t sub_100006530@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
                                        * ((v2 - 2038575945) & 0x798235F8 | (539
}

uint64_t sub_1000065A4@<X0>(int a1@<W1>, uint64_t a2@<X8>)
{
  int v8 = (a1 - 525760423) & 0x1F5676BF;
  int v9 = v3 + 560728282 + v8;
  uint64_t v10 = (void *)(v7 - 0x621D43C813E5057ALL);
  BOOL v11 = v9 < -1518629387;
  unsigned int v12 = ((2 * (*(_DWORD *)(*v10 + 4LL * (v2 + 68124930)) ^ v5)) << (v4 ^ 0x1F)) | ((*(_DWORD *)(*v10
                                                                                              + 4LL * (v2 + 68124929)) ^ v5) >> v4);
  *(_DWORD *)(*v10 + 4LL * (v8 - 1049)) = v12 + v5 - (v6 & (2 * v12));
  if (v9 >= -1518629387) {
    BOOL v11 = v9 > 628854262;
  }
  return ((uint64_t (*)(uint64_t))(*(void *)(a2 + 8LL * (v11 | (32 * v11) | (v8 + 231))) - 8LL))(2776337909LL);
}

void sub_100006698()
{
}

void sub_1000066A0()
{
  _DWORD *v0 = 2086149949;
}

uint64_t sub_100006898(uint64_t a1)
{
  int v1 = 1755732067 * ((650609490 - (a1 | 0x26C78352) + (a1 | 0xD9387CAD)) ^ 0x7FEC176);
  int v2 = *(_DWORD *)(a1 + 8) - v1;
  unsigned int v3 = v1 + *(_DWORD *)(a1 + 12) - 819587708;
  unsigned int v4 = (*(_DWORD *)(*(void *)a1 - 0x5934B92A3842FAB0LL) ^ 0x5CD0AD78) + v3;
  unsigned int v5 = v4 - ((2 * v4) & 0xB9A15AF0) + 1557179768;
  *(_DWORD *)(*(void *)a1 - 0x5934B92A3842FAB0LL) = v5;
}

void sub_100006968(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - 0x5934B92A3842FAB4LL) = (*(_DWORD *)(a1 - 0x5934B92A3842FAB4LL) ^ 0x442521B7)
                                         + 1143284151
                                         - ((2 * (*(_DWORD *)(a1 - 0x5934B92A3842FAB4LL) ^ 0x442521B7) + 2) & 0x884A436E)
                                         + 1;
}

void sub_1000069B0(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 12) + 1759421093 * (((a1 | 0x9EBEB665) - a1 + (a1 & 0x6141499A)) ^ 0x2DC30631);
  uint64_t v2 = *(void *)a1;
  v3[0] = v1
  uint64_t v4 = v2;
  sub_100019B50((uint64_t)v3);
  __asm { BR              X8 }

void sub_100006AAC()
{
  else {
    int v3 = v1 + 2;
  }
  *(_DWORD *)(v0 + 8) = v3;
}

void sub_100006B18(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 16) - 0x621D43C813E5057ELL) - 561472648;
  int v3 = *(_DWORD *)(*(void *)a1 - 0x621D43C813E5057ELL) - 561472648;
  int v4 = (v2 < -622806347) ^ (v3 < -622806347);
  BOOL v5 = v2 > v3;
  if (v4) {
    BOOL v5 = v2 < -622806347;
  }
  int v1 = *(_DWORD *)(a1 + 8) - 3804331 * (a1 ^ 0x8FA51BC6);
  __asm { BR              X10 }

uint64_t sub_100006BE4()
{
  int v4 = v1 - 546419520;
  BOOL v5 = v4 < ((53 * (v3 ^ 0x415) - 607754097) ^ v3 ^ 0x675);
  BOOL v6 = v2 - 546419520 < v4;
  if (v2 - 546419520 < -607753219 != v5) {
    BOOL v6 = v5;
  }
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((67 * !v6) | v3)) - 12LL))();
}

uint64_t sub_100006C64(uint64_t a1)
{
  int v5 = v4 - 431;
  int v6 = ((v4 - 431) ^ 0xF8B03ECC) - v3;
  if (v3 + 61333699 >= 0) {
    int v3 = v6;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1
                                                                       + 8LL
                                                                       * (((v3 - 2086149950 <= (int)((v5 - 166824679) & 0x9F18B39 ^ 0xFFFFFEF6))
                                                                         * (((v5 ^ 0xB3) * v2) ^ 0xB6)) ^ v5)))( a1,  166824761LL,  2208817346LL,  4294967030LL);
}

uint64_t sub_100006D18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  return (*(uint64_t (**)(void))(v7
                              + 8LL
                              * ((((((v11 - 249) | a6) ^ (v10 + 550) ^ *(_DWORD *)(*v9 + 4LL * v12)) <= (*(_DWORD *)(*v8 + 4LL * v12) ^ v10))
                                * a7) ^ v11)))();
}

uint64_t sub_100006D60( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v8 + 8LL * (((a8 - 483) * (v9 >= v10)) ^ a8)))();
}

void sub_100006D7C()
{
}

uint64_t sub_100006D88(uint64_t result)
{
  *(_DWORD *)(result + 12) = -1487321812 - v1;
  return result;
}

void sub_100006DA4(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) + 1224239923 * (((a1 | 0x8E383864) - (a1 & 0x8E383864)) ^ 0x7C8BC5B3);
  __asm { BR              X14 }

uint64_t sub_100006E5C(uint64_t a1)
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL * ((53 * (*(_DWORD *)(*(void *)(a1 + 8) + v4) != v2)) ^ (v1 | 0x210)))
                            - ((((v1 | 0x210) + 1292855668) & 0xB2F095FF)
}

uint64_t sub_100006EB4()
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
}

uint64_t sub_100006EF0@<X0>(uint64_t a1@<X8>)
{
  unsigned int v7 = v3
  uint64_t v5 = a1;
  uint64_t v6 = v2;
  uint64_t v8 = v2;
  return ((uint64_t (*)(uint64_t *))(*(void *)(v1 + 8LL * (v3 ^ 0x58C)) - 4LL))(&v5);
}

uint64_t sub_100007050(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(void))((char *)*(&off_100058280
                                      + ((8 * (*(_DWORD *)(a2 + 4) == 1782897116)) | (32
                                                                                    * (*(_DWORD *)(a2 + 4) == 1782897116)) | 0x441u))
                            - 8))();
}

uint64_t sub_10000708C(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 16) = (**(unsigned __int8 **)(a2 + 8) ^ 0xEFD9EE9F)
                       + 2109209079
                       + ((2 * **(unsigned __int8 **)(a2 + 8)) & 0xFF3F);
  return 0LL;
}

uint64_t sub_1000070C4()
{
  return 4294925278LL;
}

void sub_1000070CC(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) + 3804331 * ((((2 * a1) | 0x83BDF70C) - a1 + 1042351226) ^ 0x4E7BE040);
  uint64_t v2 = *(void *)a1;
  if (*(_DWORD *)(*(void *)a1 - 0x621D43C813E5057ELL) - 2086149949 >= 0) {
    unsigned int v4 = *(_DWORD *)(*(void *)a1 - 0x621D43C813E5057ELL) - 2086149949;
  }
  else {
    unsigned int v4 = 2086149949 - *(_DWORD *)(*(void *)a1 - 0x621D43C813E5057ELL);
  }
  uint64_t v3 = *(void *)(a1 + 24);
  if (*(_DWORD *)(v3 - 0x621D43C813E5057ELL) - 2086149949 >= 0) {
    unsigned int v5 = *(_DWORD *)(v3 - 0x621D43C813E5057ELL) - 2086149949;
  }
  else {
    unsigned int v5 = 2086149949 - *(_DWORD *)(v3 - 0x621D43C813E5057ELL);
  }
  unsigned int v8 = v1
     - 1759421093
  uint64_t v7 = v2;
  sub_1000069B0((uint64_t)&v7);
  if (v4 >= v5) {
    unsigned int v6 = v5;
  }
  else {
    unsigned int v6 = v4;
  }
  __asm { BR              X15 }

uint64_t sub_100007274@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  int v11 = v4 - 1718482197;
  uint64_t v12 = 4LL * (v7 + v5);
  int v13 = v9
      + 888005103
      + (*(_DWORD *)(*(void *)(v10 - 0x621D43C813E5057ALL) + v12) ^ v6)
      - (*(_DWORD *)(*(void *)(a2 - 0x621D43C813E5057ALL) + v12) ^ v6);
  *(_DWORD *)(*(void *)(a1 - 0x621D43C813E5057ALL) + v12) = v6 + v3 + 1112 + v13 - (v8 & (2 * v13)) - 1728;
  BOOL v15 = v7 + 2118080817 < 429001451 && v7 + 2118080817 >= v11;
  return ((uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(*(void *)(v2 + 8LL * ((v15 | (2 * v15)) ^ v3))
                                                                                       - 12LL))( 0x7C7FFFFFBFEDFDEFLL,  0x17FDBFBDELL,  0xA3FB7FE774FFE3FFLL,  2118080817LL,  429001451LL);
}

uint64_t sub_100007370()
{
  BOOL v5 = v2 - 591781016 > 2014106914 || v2 - 591781016 < v3 - 133376733;
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((466 * v5) ^ v1)) - ((2 * v1) ^ 0xD84LL)))();
}

uint64_t sub_1000073D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v13 = 4LL * (v7 + v9 + ((v5 - 1314091442) & 0x4E537467) - 1124);
  int v14 = v2 + v11 + (*(_DWORD *)(*(void *)(v12 - 0x621D43C813E5057ALL) + v13) ^ v8);
  *(_DWORD *)(*(void *)(a1 - 0x621D43C813E5057ALL) + v13) = v14 + v8 - (v10 & (2 * v14));
  int v15 = v9 + 1 + v3;
  BOOL v17 = v15 <= v4 && v15 >= v6;
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * ((1902 * v17) ^ v5)) - 4LL))();
}

uint64_t sub_10000749C()
{
  BOOL v5 = v2 + 1954567001 > ((v1 - 205) ^ 0xFD30684) || v2 + 1954567001 < v3 - 1881996012;
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((207 * v5) ^ v1)) - 4LL))();
}

uint64_t sub_1000074F0@<X0>(int a1@<W6>, uint64_t a2@<X8>, uint64_t a3)
{
  uint64_t v12 = 4LL * (v10 + v8);
  int v13 = v4 - 888005102 + (*(_DWORD *)(*(void *)(a3 - 0x621D43C813E5057ALL) + v12) ^ 0x40D643F3);
  *(_DWORD *)(*(void *)(a2 - 0x621D43C813E5057ALL) + v12) = v13 + ((v6 + 821) ^ (v9 - 332)) - (v11 & (2 * v13));
  int v14 = v10 + 1 + v5;
  BOOL v16 = v14 <= a1 + 308 && v14 >= v7;
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * ((2035 * v16) ^ v6)) - 4LL))();
}

uint64_t sub_1000075C8()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
}

uint64_t sub_100007604()
{
}

uint64_t sub_1000076A4@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((575
                                          * (*(_DWORD *)(*(void *)(a1 - 0x621D43C813E5057ALL)
}

uint64_t sub_10000770C()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
                                        * ((((v1 - 418202865) & 0x18ED427F ^ 0x3C2)
}

uint64_t sub_100007758()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
}

void sub_1000077A8(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - 0x621D43C813E5057ELL) = (((v3 + v2) * (v1 - 227848401)) ^ 0xFCF8DF3D)
                                         + 2136948736
                                         + ((2 * (v3 + v2) * (v1 - 227848401)) & 0xF9F1BE7A);
}

void sub_10000790C(uint64_t a1)
{
  int v1 = 1374699841 * (a1 ^ 0x6DF41809);
  int v2 = *(_DWORD *)a1 + v1;
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 16);
  unsigned int v6 = 1225351577 * ((1667340836 - (&v8 | 0x63619A24) + (&v8 | 0x9C9E65DB)) ^ 0xE261FFE9);
  unsigned int v7 = *(_DWORD *)(a1 + 4) - v1 - v6;
  int v12 = v6 ^ (*(_DWORD *)(a1 + 56) - v1 - 8785805);
  uint64_t v13 = v5;
  uint64_t v15 = v5;
  int v9 = v6 ^ (v2 + 368399762);
  unsigned int v10 = v7 + 757479434;
  uint64_t v8 = v3;
  uint64_t v11 = v4;
  sub_100045F44((uint64_t)&v8);
  __asm { BR              X8 }

uint64_t sub_100007A4C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unint64_t *a12, char a13, unsigned int a14, uint64_t a15, int a16)
{
  unsigned int v24 = 1759421093 * ((&a11 - 2 * (&a11 & 0xDE579572) - 564685454) ^ 0x6D2A2526);
  a13 = (((((v20 + 97) | 0xAA) - 26) ^ (*(_BYTE *)(v16 + 24) + v23))
       + ((2 * (*(_BYTE *)(v16 + 24) + v23)) & 0xAE ^ 0x8E)
       + 110) ^ (-91 * ((&a11 - 2 * (&a11 & 0x72) + 114) ^ 0x26));
  a16 = v20 - v24 + 1301;
  a12 = &STACK[0x3F156345BCC4FA4];
  a15 = v22;
  a14 = v21 + 43261628 + v24;
  uint64_t v25 = ((uint64_t (*)(int *))(*(void *)(v17 + 8LL * (v20 - 285)) - 12LL))(&a11);
  return ((uint64_t (*)(uint64_t))(*(void *)(v19 + 8LL * ((1221 * (a11 == v18)) ^ v20)) - 12LL))(v25);
}

uint64_t sub_100007B38()
{
  BOOL v3 = (((v2 - 795) | 0x10) ^ 0xF0F1B592) + v1 > 0xFFFFFFFD;
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * (((2 * v3) | (4 * v3)) ^ v2)) - 4LL))();
}

void sub_100007B74(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - 0x5843A1C5952764FBLL) = v2 + 1;
  *(_DWORD *)(v1 + 8) = 777158354;
}

void sub_100007D0C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }

uint64_t sub_100007D94@<X0>(uint64_t a1@<X1>, unsigned int a2@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((611 * (**(_BYTE **)(a1 + 8) == 0)) ^ a2)) - 4LL))();
}

uint64_t sub_100007DBC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, int a44)
{
  *(void *)(*(void *)(a16 + 96) + 504LL) = v44 + 1;
  *(_DWORD *)(*(void *)(a16 + 96) + 496LL) = a18 - 1;
  int v47 = 235795823 * ((((v46 - 152) | 0x14C5FA4E) - (v46 - 152) + ((v46 - 152) & 0xEB3A05B0)) ^ 0x8068B317);
  *(void *)(v46 - 136) = &STACK[0x5934B92A3842FBC0];
  *(_DWORD *)(v46 - 148) = v47 - 1970643562;
  *(_DWORD *)(v46 - 144) = 1172345435 - v47;
  sub_100022668(v46 - 152);
  BOOL v48 = a18 - 1036306678 + ((2 * a44) & 0x34 ^ 0x30) + (a44 & 0x3F ^ 0xD37FEEE2) < 0xFFFFFFC0;
  return (*(uint64_t (**)(uint64_t))(v45 + 8LL * (v48 | (8 * v48) | 0x190u)))(4166318518LL);
}

uint64_t sub_100007FAC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, char a8)
{
  unsigned int v13 = v8 + 1137;
  unsigned __int8 v14 = v8 + 113 - a8 - 95;
  unsigned int v15 = v9 + 746590503;
  if (v15 <= 0x40) {
    unsigned int v15 = 64;
  }
  return ((uint64_t (*)(void))(*(void *)(v12 + 8LL * ((250 * (((a6 - v10 - v11 + v15 < 0xF) ^ v14) & 1)) ^ v13)) - 12LL))();
}

uint64_t sub_10000802C(int a1, int a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  int v11 = v7 + v6;
  int v12 = v11 + v8;
  return ((uint64_t (*)(void))(*(void *)(v10
                                        + 8LL
                                        * ((((((v9 - 749) ^ (a6 - v11 < (a2 + v12))) & 1) == 0)
                                          * ((a5 + v9 - 1151) ^ (a5 + 170))) ^ v9))
                            - 12LL))();
}

uint64_t sub_100008080( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, int a34, char a35)
{
  return ((uint64_t (*)(void))(*(void *)(v38
                                        + 8LL
                                        * ((594
                                          * ((unint64_t)(&a35
                                                              + (a18 ^ 0xFFFFFFFF46A585A6LL ^ (v37 - 1174503865) & 0xFF5BFA7F)
}

uint64_t sub_1000080E0@<X0>(uint64_t a1@<X8>)
{
  v7.i64[0] = 0xD4D4D4D4D4D4D4D4LL;
  v7.i64[1] = 0xD4D4D4D4D4D4D4D4LL;
  v8.i64[0] = 0x6B6B6B6B6B6B6B6BLL;
  v8.i64[1] = 0x6B6B6B6B6B6B6B6BLL;
  *(int8x16_t *)(v2 + ((((v4 - 398) | 0x180u) ^ 0xFFFFFE7BLL) & (v3 + a1))) = vaddq_s8( vaddq_s8(*v5, v8),  vmvnq_s8(vandq_s8(vaddq_s8(*v5, *v5), v7)));
  return (*(uint64_t (**)(void))(v6
                              + 8LL
                              * ((((((v4 + 500) ^ 0x1FFFFFC76LL) & (v1 + 1)) != 16) | (8 * ((((v4 + 500) ^ 0x1FFFFFC76LL) & (v1 + 1)) != 16))) ^ (v4 + 500))))();
}

void sub_100008164()
{
}

uint64_t sub_10000816C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  return ((uint64_t (*)(void))(a7
                            + *(void *)(v10 + 8LL * ((22 * (((v7 == v9) ^ (v8 + 91)) & 1)) ^ v8))
}

uint64_t sub_1000081C8@<X0>( int a1@<W3>, char a2@<W4>, int a3@<W7>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, int a30, char a31)
{
  *(&a31 + (v33 + a4)) = *(_BYTE *)(v31 + v34 - 128648778)
                                     + ((v32 - a2 + 87) ^ 0x3C)
                                     + (~(2 * *(_BYTE *)(v31 + v34 - 128648778)) | 0x2B);
  return ((uint64_t (*)(void))(*(void *)(v35 + 8LL
}

uint64_t sub_10000823C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, int32x4_t a47, int32x4_t a48, int32x4_t a49, int32x4_t a50)
{
  uint64_t v113 = v51;
  v58 = *(uint64_t (**)(__n128, __n128, __n128, __n128, __n128))(v55 + 8LL * v50);
  __n128 v59 = (__n128)vdupq_n_s32(0x2E527EDFu);
  __n128 v60 = (__n128)vdupq_n_s32(0x2E527ED2u);
  v61.n128_u64[0] = 0x6A6A6A6A6A6A6A6ALL;
  v61.n128_u64[1] = 0x6A6A6A6A6A6A6A6ALL;
  HIDWORD(a20) = -1183088775;
  v62.n128_u64[0] = 0xD4D4D4D4D4D4D4D4LL;
  v62.n128_u64[1] = 0xD4D4D4D4D4D4D4D4LL;
  __n128 v63 = (__n128)vdupq_n_s32(0x2E527EDBu);
  LODWORD(v114) = -1185252775;
  uint64_t v64 = HIDWORD(a43);
  uint64_t v65 = a44;
  LODWORD(a27) = HIDWORD(a44);
  HIDWORD(v114) = BYTE4(a46) ^ 0xFFFFFFE1;
  int v66 = BYTE4(a46) ^ 0xE1;
  if (v66 == 2)
  {
    HIDWORD(v115) = HIDWORD(a43);
    unint64_t v116 = __PAIR64__(a45, a44);
    int8x16x4_t v118 = vld4q_s8((const char *)&a34 + 4);
    HIDWORD(a22) = HIDWORD(a45);
    uint8x16_t v91 = (uint8x16_t)veorq_s8(v118.val[0], (int8x16_t)v61);
    uint16x8_t v92 = vmovl_u8(*(uint8x8_t *)v91.i8);
    uint16x8_t v93 = vmovl_high_u8(v91);
    uint8x16_t v94 = (uint8x16_t)veorq_s8(v118.val[1], (int8x16_t)v61);
    _Q22 = vmovl_u8(*(uint8x8_t *)v94.i8);
    _Q21 = vmovl_high_u8(v94);
    __asm
    {
      SHLL2           V23.4S, V21.8H, #0x10
      SHLL2           V24.4S, V22.8H, #0x10
    }

    uint8x16_t v99 = (uint8x16_t)veorq_s8(v118.val[2], (int8x16_t)v61);
    uint16x8_t v100 = vmovl_high_u8(v99);
    uint16x8_t v101 = vmovl_u8(*(uint8x8_t *)v99.i8);
    v118.val[0] = veorq_s8(v118.val[3], (int8x16_t)v61);
    v118.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v118.val[0]);
    v118.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v118.val[1]);
    v118.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v118.val[1].i8);
    v118.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v118.val[0].i8);
    v118.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v118.val[0]);
    v118.val[0] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v118.val[0].i8);
    int32x4_t v102 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8( (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL),  (int8x16_t)vshll_n_u16(*(uint16x4_t *)v101.i8, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v92.i8), 0x18uLL)),  v118.val[0]);
    int32x4_t v103 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8(_Q24, (int8x16_t)vshll_high_n_u16(v101, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v92), 0x18uLL)),  v118.val[3]);
    int32x4_t v104 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8( (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL),  (int8x16_t)vshll_n_u16(*(uint16x4_t *)v100.i8, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v93.i8), 0x18uLL)),  v118.val[1]);
    int32x4_t v105 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8(_Q23, (int8x16_t)vshll_high_n_u16(v100, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v93), 0x18uLL)),  v118.val[2]);
    v118.val[0] = veorq_s8( vandq_s8((int8x16_t)v102, (int8x16_t)v59),  (int8x16_t)(*(_OWORD *)v118.val & __PAIR128__(0xFFFFFF0DFFFFFF0DLL, 0xFFFFFF0DFFFFFF0DLL)));
    v118.val[3] = veorq_s8( vandq_s8((int8x16_t)v103, (int8x16_t)v59),  (int8x16_t)(*(_OWORD *)&v118.val[3] & __PAIR128__(0xFFFFFF0DFFFFFF0DLL, 0xFFFFFF0DFFFFFF0DLL)));
    v118.val[1] = veorq_s8( vandq_s8((int8x16_t)v104, (int8x16_t)v59),  (int8x16_t)(*(_OWORD *)&v118.val[1] & __PAIR128__(0xFFFFFF0DFFFFFF0DLL, 0xFFFFFF0DFFFFFF0DLL)));
    v118.val[2] = veorq_s8( vandq_s8((int8x16_t)v105, (int8x16_t)v59),  (int8x16_t)(*(_OWORD *)&v118.val[2] & __PAIR128__(0xFFFFFF0DFFFFFF0DLL, 0xFFFFFF0DFFFFFF0DLL)));
    a49 = vaddq_s32(vsubq_s32(v104, vaddq_s32((int32x4_t)v118.val[1], (int32x4_t)v118.val[1])), (int32x4_t)v60);
    a50 = vaddq_s32(vsubq_s32(v105, vaddq_s32((int32x4_t)v118.val[2], (int32x4_t)v118.val[2])), (int32x4_t)v60);
    a47 = vaddq_s32(vsubq_s32(v102, vaddq_s32((int32x4_t)v118.val[0], (int32x4_t)v118.val[0])), (int32x4_t)v60);
    a48 = vaddq_s32(vsubq_s32(v103, vaddq_s32((int32x4_t)v118.val[3], (int32x4_t)v118.val[3])), (int32x4_t)v60);
    v106 = (_DWORD *)&a47 + v53 + 341657160;
    int v107 = *(v106 - 8) ^ *((_DWORD *)&a47 + v53 + (a8 + a5 + 66) + 341656803);
    int v108 = *(v106 - 16) ^ *(v106 - 14) ^ (v52 + v107 - ((2 * v107) & 0x5CA4FDA4));
    HIDWORD(v110) = v108 ^ v52;
    LODWORD(v110) = v108;
    int v109 = v110 >> 31;
    uint64_t v111 = (2 * v109) & 0x5CA4FDA4;
    _DWORD *v106 = v109 + v52 - v111;
    uint64_t v112 = (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t (*)(__n128, __n128, __n128, __n128, __n128), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v55 + 8LL * ((580 * (v56 != 341657097)) ^ ((int)a8 + a5 + 126))) - 12LL);
    LODWORD(v115) = HIDWORD(a17) - 784714927;
    return v112( v112,  v65,  v56 - 16,  v111,  106644893LL,  v64,  1554316708LL,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  v113,  a20,  a5 + ((v50 + 233) | 0x4A4u) - 1508,  a22,  v114,  v115,  v116,  v58,  a27,  v56 - 16,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46);
  }

  else if (v66 == 1)
  {
    int8x16x4_t v117 = vld4q_s8((const char *)&a34 + 4);
    uint8x16_t v67 = (uint8x16_t)veorq_s8(v117.val[0], (int8x16_t)v61);
    uint16x8_t v68 = vmovl_u8(*(uint8x8_t *)v67.i8);
    int8x16_t v69 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v68.i8);
    int8x16_t v70 = (int8x16_t)vmovl_high_u16(v68);
    uint16x8_t v71 = vmovl_high_u8(v67);
    int8x16_t v72 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v71.i8);
    int8x16_t v73 = (int8x16_t)vmovl_high_u16(v71);
    uint8x16_t v74 = (uint8x16_t)veorq_s8(v117.val[1], (int8x16_t)v61);
    uint16x8_t v75 = vmovl_high_u8(v74);
    uint16x8_t v76 = vmovl_u8(*(uint8x8_t *)v74.i8);
    uint8x16_t v77 = (uint8x16_t)veorq_s8(v117.val[2], (int8x16_t)v61);
    _Q26 = (int8x16_t)vmovl_high_u8(v77);
    _Q25 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v77.i8);
    int8x16_t v80 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q25.i8, 0x10uLL);
    __asm { SHLL2           V25.4S, V25.8H, #0x10 }

    int8x16_t v85 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q26.i8, 0x10uLL);
    __asm { SHLL2           V26.4S, V26.8H, #0x10 }

    v117.val[0] = veorq_s8(v117.val[3], (int8x16_t)v61);
    v117.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v117.val[0]);
    v117.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v117.val[1]);
    v117.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v117.val[0].i8);
    v117.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v117.val[0]);
    v117.val[0] = vorrq_s8( vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v117.val[0].i8), 0x18uLL), v80),  vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v76.i8, 8uLL), v69));
    v117.val[3] = vorrq_s8( vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v117.val[3], 0x18uLL), _Q25),  vorrq_s8((int8x16_t)vshll_high_n_u16(v76, 8uLL), v70));
    v117.val[1] = vorrq_s8( vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v117.val[1].i8), 0x18uLL), v85),  vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v75.i8, 8uLL), v72));
    v117.val[2] = vorrq_s8( vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v117.val[2], 0x18uLL), _Q26),  vorrq_s8((int8x16_t)vshll_high_n_u16(v75, 8uLL), v73));
    int32x4_t v86 = (int32x4_t)veorq_s8( vandq_s8(v117.val[0], (int8x16_t)v63),  (int8x16_t)(*(_OWORD *)&v69 & __PAIR128__(0xFFFFFF09FFFFFF09LL, 0xFFFFFF09FFFFFF09LL)));
    int32x4_t v87 = (int32x4_t)veorq_s8( vandq_s8(v117.val[3], (int8x16_t)v63),  (int8x16_t)(*(_OWORD *)&v70 & __PAIR128__(0xFFFFFF09FFFFFF09LL, 0xFFFFFF09FFFFFF09LL)));
    int32x4_t v88 = (int32x4_t)veorq_s8( vandq_s8(v117.val[1], (int8x16_t)v63),  (int8x16_t)(*(_OWORD *)&v72 & __PAIR128__(0xFFFFFF09FFFFFF09LL, 0xFFFFFF09FFFFFF09LL)));
    int32x4_t v89 = (int32x4_t)veorq_s8( vandq_s8(v117.val[2], (int8x16_t)v63),  (int8x16_t)(*(_OWORD *)&v73 & __PAIR128__(0xFFFFFF09FFFFFF09LL, 0xFFFFFF09FFFFFF09LL)));
    a49 = vaddq_s32(vsubq_s32((int32x4_t)v117.val[1], vaddq_s32(v88, v88)), (int32x4_t)v60);
    a50 = vaddq_s32(vsubq_s32((int32x4_t)v117.val[2], vaddq_s32(v89, v89)), (int32x4_t)v60);
    a47 = vaddq_s32(vsubq_s32((int32x4_t)v117.val[0], vaddq_s32(v86, v86)), (int32x4_t)v60);
    a48 = vaddq_s32(vsubq_s32((int32x4_t)v117.val[3], vaddq_s32(v87, v87)), (int32x4_t)v60);
    return ((uint64_t (*)(uint64_t, __n128))(*(void *)(v55 + 8LL * (a5 ^ (a5 + 204))) - 8LL))( 341657160LL,  v59);
  }

  else
  {
    HIDWORD(a43) = 2 * (HIDWORD(a43) ^ v57) + v57 - (v54 & (4 * (HIDWORD(a43) ^ v57)));
    LODWORD(a44) = 2 * (a44 ^ v57) + v57 - (v54 & (4 * (a44 ^ v57)));
    HIDWORD(a44) = 2 * (HIDWORD(a44) ^ v57) + v57 - (v54 & (4 * (HIDWORD(a44) ^ v57)));
    LODWORD(a45) = 2 * (a45 ^ v57) + v57 - (v54 & (4 * (a45 ^ v57)));
    return v58(v59, v60, v61, v62, v63);
  }

uint64_t sub_100008E1C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, unsigned int a24)
{
  if (a24 < v24 != a19 + 869533475 < v24) {
    BOOL v26 = a19 + 869533475 < v24;
  }
  else {
    BOOL v26 = a19 + 869533475 > a24;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8LL * ((1462 * !v26) ^ (a8 + a5 + 112))))( 4166318518LL,  212LL);
}

uint64_t sub_100008E98( int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, int a8)
{
  int v10 = v8 + a1 + 63 >= (v8 + a1);
}

uint64_t sub_100008ED8( uint64_t a1, uint64_t a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20, unsigned __int8 a21, uint64_t a22)
{
  return ((uint64_t (*)(void))(*(void *)(v24
                                        + 8LL
                                        * ((((((unint64_t)(a7 + v22 - a18 - a22 - v23 + 7) < 0x10) ^ a21) & 1)
                                          * (a4 ^ (a5 - 16))) ^ a3))
                            - 8LL))();
}

uint64_t sub_100008F34( int a1, double a2, double a3, int8x16_t a4, int8x16_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12)
{
  int8x16_t *v12 = vaddq_s8( vsubq_s8( *(int8x16_t *)(v14 + (v13 + a1)),  vandq_s8( vaddq_s8(*(int8x16_t *)(v14 + (v13 + a1)), *(int8x16_t *)(v14 + (v13 + a1))),  a5)),  a4);
  return ((uint64_t (*)(void))(*(void *)(v15 + 8LL * (((a12 + a8 != 336LL) * v16) ^ (a12 + a8 + 976))) - 8LL))();
}

uint64_t sub_100008F90@<X0>(int a1@<W0>, char a2@<W1>, char a3@<W4>, int a4@<W7>, int a5@<W8>)
{
  *(_BYTE *)(v6 + v7) = v5
                      - a3
                      + 52
                      + *(_BYTE *)(v9 + (v8 + a1))
  return ((uint64_t (*)(void))(*(void *)(v10 + 8LL * (((v7 == 63) * a5) ^ (a4 + v5 + 770))) - 8LL))();
}

uint64_t sub_100008FE4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  unsigned int v21 = ((v20 + 489) ^ 0x41D34E8E) + a18;
  BOOL v22 = v18 - 1536352633 < v21;
  return (*(uint64_t (**)(void))(v19 + 8LL * ((82 * !v22) ^ v20)))();
}

uint64_t sub_10000904C( uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, int a35, char a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, char a45)
{
  int v51 = (a3 - 730) | 0x14;
  int v47 = 1755732067 * ((((2 * (v46 - 152)) | 0x581E1344) - (v46 - 152) - 739183010) ^ 0xF2C9B479);
  *(void *)(v46 - 152) = a14;
  *(_DWORD *)(v46 - 144) = v47 + a3 - 736;
  *(_DWORD *)(v46 - 140) = a18 - v47 - 963309408;
  uint64_t v48 = sub_100006898(v46 - 152);
  uint64_t v49 = a45 & 0x3F ^ 0x38LL;
  *(&a36 + v49) = -22;
}

uint64_t sub_100009150(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
}

uint64_t sub_1000091B8@<X0>( int a1@<W7>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, int a28, char a29)
{
  *(&a29 + v29 + v30) = 106;
  return ((uint64_t (*)(void))(*(void *)(v31
                                        + 8LL
                                        * ((1069
}

void sub_100009208()
{
}

uint64_t sub_100009210@<X0>( int a1@<W0>, int a2@<W1>, unsigned int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, int a29, char a30)
{
  BOOL v37 = a3 < v33;
  *(&a30 + (v31 - 53200410)) = *(_BYTE *)(v34 + (v32 + a1))
  unsigned int v38 = a2 + v32 + 1;
  int v39 = v37 ^ (v38 < v33);
  BOOL v40 = v38 < a3;
  if (!v39) {
    BOOL v37 = v40;
  }
  return (*(uint64_t (**)(void))(v35 + 8LL * ((!v37 * v30) ^ v36)))();
}

uint64_t sub_100009288( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v9
                                                                        + 8LL
                                                                        * ((((v8 - 1482172160) < 0x38)
                                                                          * ((a8 + v10 + 464) ^ 0x6F6)) ^ (a8 + v10 + 448)))
                                                            - 12LL))( a1,  a2,  -1482172160LL);
}

uint64_t sub_1000092CC()
{
  unint64_t v3 = (((v0 + 805963608) | 0x89507011) ^ 0xFFFFFFFF1EFDA358LL) + v1;
  if (v3 <= 0x38) {
    unint64_t v3 = 56LL;
  }
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((1273 * (((v0 - 1073808119) & 0xF95B7A5F ^ 0xE1025D59LL) - v1 + v3 > 7)) ^ v0))
                            - 12LL))();
}

uint64_t sub_100009350@<X0>( uint64_t a1@<X2>, int a2@<W7>, uint64_t a3@<X8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, int a29, char a30)
{
  *(void *)(&a30 + a3 + a1) = 0x6A6A6A6A6A6A6A6ALL;
  return ((uint64_t (*)(void))(*(void *)(v32
                                        + 8LL
                                        * ((275
                                          * (((v30 - 334318186) & 0x5A92D2F0 ^ 0x2E8LL) == (v31 & 0xFFFFFFFFFFFFFFF8LL))) ^ (a2 + v30 + 473)))
                            - 8LL))();
}

void sub_1000093C0()
{
}

uint64_t sub_1000093CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  return ((uint64_t (*)(void))(a7
                            + *(void *)(v10
                                        + 8LL * (int)((((v9 - 1109754721) & 0xFB7FFAD9 ^ (a5 - 16)) * (v7 != v8)) ^ v9))
                            - ((v9 + 286791473) | 0xA8426048)
                            - 4))();
}

void sub_10000942C()
{
}

uint64_t sub_1000098AC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, int a34, char a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, int a47)
{
  unsigned int v52 = *(_DWORD *)(&a35 + ((v50 + v47) & 0xFFFFFFFC) + 72);
  *(_BYTE *)(a2 + (v50 + v47)) = ((v52 >> ((a5 + v49 - 67) ^ (a5 - 24))) ^ 0x26)
                                             + (~(2 * ((v52 >> ((a5 + v49 - 67) ^ (a5 - 24))) ^ 0x26)) | 0x2B)
                                             + 107;
  *(_BYTE *)(a2 + (v50 + v47 + 1)) = (BYTE2(v52) ^ 0x5B) - ((2 * (BYTE2(v52) ^ 0x5B)) & 0xD4) + 106;
  *(_BYTE *)(a2 + (v50 + v47 + 2)) = (BYTE1(v52) ^ 0x45) - ((2 * (BYTE1(v52) ^ 0x45)) & 0xD4) + 106;
  *(_BYTE *)(a2 + (v50 + v47 + 3)) = v52 ^ 0xF7;
  BOOL v53 = v50 - 91533362 < (a47 + 1377107252);
  if (v50 - 91533362 < v48 != a47 + 1377107252 < v48) {
    BOOL v53 = a47 + 1377107252 < v48;
  }
  return ((uint64_t (*)(void))(*(void *)(v51 + 8LL * ((14 * v53) ^ v49)) - 4LL))();
}

void sub_100009A38()
{
}

uint64_t sub_100009A40( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, char a47)
{
  *(_DWORD *)(&a47 + a33) = 1891857106;
  return ((uint64_t (*)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v48 + 8LL * ((((a5 + 5 * (v47 ^ 0x62) + 1) ^ 1) & 1 | (4 * (((a5 + 5 * (v47 ^ 0x62) + 1) ^ 1) & 1))) ^ (5 * (v47 ^ 0x462)))) - 8LL))( 820911359LL,  &a47 + a33,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24);
}

uint64_t sub_100009AE4(int a1)
{
  return (*(uint64_t (**)(void))(v3 + 8LL * (((((v2 == a1) ^ (v1 + 125)) & 1) * (v1 ^ 0x26E)) ^ v1)))();
}

uint64_t sub_100009B30( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, int a32, int a33)
{
  BOOL v36 = a33 + 303786580 < (v35 - 1070930023);
  if (a33 + 303786580 < ((53 * (v33 & 0xFFFAFBDF ^ (a5 + 1))) ^ 0x2A6FC1EB) != v35 - 1070930023 < (((v33 & 0xFFFAFBDF) + a8) | 4)
                                                                                                 + 711966800)
    BOOL v36 = v35 - 1070930023 < (((v33 & 0xFFFAFBDF) + a8) | 4) + 711966800;
  return ((uint64_t (*)(void))(*(void *)(v34 + 8LL * (int)((53 * v36) ^ ((v33 & 0xFFFAFBDF) + a8 + 565))) - 8LL))();
}

uint64_t sub_100009D80( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27)
{
  int v33 = v29 ^ (a5 + 292);
  int v34 = 628203409 * ((8872314 - ((v32 - 152) | 0x87617A) + ((v32 - 152) | 0xFF789E85)) ^ 0x7DF092B6);
  *(void *)(v32 - 152) = a11;
  *(void *)(v32 - 144) = a9;
  *(void *)(v32 - 128) = a12;
  *(_DWORD *)(v32 - 136) = v29 - v34 + 273;
  *(_DWORD *)(v32 - 132) = v31 - v34 + 38469403;
  *(void *)(v32 - 112) = v27;
  *(void *)(v32 - 104) = a10;
  ((void (*)(uint64_t))*(&off_10005BF10 + v29 - 247))(v32 - 152);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v30
                                                                        + 8LL
                                                                        * (((*(_DWORD *)(v32 - 120) == v28)
                                                                          * ((v33 + 1185252849) ^ v29 ^ 0x3C3)) ^ v29))
                                                            - 4LL))( 820911359LL,  a27,  a3);
}

uint64_t sub_100009E90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * ((486
                                          * (*(_DWORD *)(a3 + 48LL * ((((v6 - 595) | 0x28) ^ (v3 + 188)) + v4)) == (v6 ^ 0x22FB6582))) ^ v6))
                            - 12LL))();
}

uint64_t sub_100009EE8@<X0>(int a1@<W7>, int a2@<W8>)
{
  if ((a2 - 1272700869) <= 0x10 && ((1 << (a2 + 59)) & 0x10125) != 0)
  {
    BOOL v5 = (v2 & 0xFFFFFFFFFFFFFFFLL) != ((4 * (((a1 - 1185252775) | 4) ^ 0x10Bu)) ^ 0xBCLL);
    __asm { BR              X10 }
  }

  return v3 ^ 0xD1AD250C;
}

uint64_t sub_10000A394(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(void))*(&off_100058280 + ((1204 * (*(_DWORD *)(a2 + 4) == 1782897116)) ^ 0x20Eu)))();
}

uint64_t sub_10000A3CC(uint64_t a1, uint64_t a2)
{
  if (**(_BYTE **)(a2 + 8)) {
    char v2 = 117;
  }
  else {
    char v2 = 116;
  }
  *(_BYTE *)(a1 + 88) = v2;
  return 0LL;
}

uint64_t sub_10000A3F0()
{
  return 4294925278LL;
}

uint64_t sub_10000A3F8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) ^ (1755732067 * ((a1 + 127962867 - 2 * (a1 & 0x7A08EF3)) ^ 0xD9663328));
  return ((uint64_t (*)(void))(*((void *)*(&off_10005BF10 + (v1 ^ 0x31))
                              + ((1134 * (*(void *)(a1 + 8) != 0x3C9E4FFE00180D53LL)) ^ v1))
                            - 8LL))();
}

uint64_t sub_10000A47C@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL
                                             * ((828 * (*(_DWORD *)(v2 - 0x3C9E4FFE00180D3BLL) == 777158354)) ^ v1))
                            - ((v1 + 893931291) & 0xCAB7B5DE)
                            + 1494LL))();
}

uint64_t sub_10000A4D8@<X0>(uint64_t a1@<X8>)
{
  unsigned int v3 = (((v2 - 1398) | 0x511) ^ 0xC9078812) + *(_DWORD *)(v1 - 0x3C9E4FFE00180D43LL);
  unsigned int v4 = *(_DWORD *)(v1 - 0x3C9E4FFE00180D47LL) - 340082159;
  BOOL v5 = v3 < 0x410AFCDF;
  BOOL v6 = v3 > v4;
  if (v4 < 0x410AFCDF != v5) {
    BOOL v6 = v5;
  }
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * ((39 * v6) ^ v2)) - 8LL))();
}

uint64_t sub_10000A570@<X0>(uint64_t a1@<X8>)
{
  uint64_t v5 = *(void *)(v3 - 0x3C9E4FFE00180D53LL);
  int v6 = *(unsigned __int8 *)(v5 + (v2 - 2013491065)) ^ 0x6A;
  int v7 = ((*(unsigned __int8 *)(v5 + (v2 - 2013491067)) ^ 0x6A) << ((19 * (v4 ^ 0x75)) ^ 0xF4)) | ((*(unsigned __int8 *)(v5 + (v2 - 2013491068)) ^ 0x6A) << 24) | ((*(unsigned __int8 *)(v5 + (v2 - 2013491066)) ^ 0x6A) << 8) | v6;
  return (*(uint64_t (**)(void))(a1
                              + 8LL
                              * ((221 * (((v7 + v1 - 2 * (v7 & (v1 + 13) ^ v6 & 0xD)) & 0xFFFFFF) == 11102090)) ^ v4)))();
}

uint64_t sub_10000A628@<X0>(int a1@<W2>, uint64_t a2@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a2
                                        + 8LL
                                        * ((37 * ((((((v2 ^ 0x6BC) - 237751530) & 0xE2BCB75) + 1073741231) & a1) != 0)) ^ v2 ^ 0x6BC))
                            - ((((v2 ^ 0x6BC) - 964) | 0x480u) ^ 0x48DLL)))();
}

uint64_t sub_10000A704@<X0>(int a1@<W2>, int a2@<W3>, uint64_t a3@<X8>)
{
}

void sub_10000A740()
{
  _DWORD *v0 = -777181721;
}

uint64_t sub_10000A7F8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(*a1 - 0x28638DD0D74C695FLL) = 0LL;
  return ((uint64_t (*)(void))(*(void *)(a2 + 8LL * ((959 * (*v2 == v3)) ^ v4)) - 8LL))();
}

uint64_t sub_10000A838@<X0>(void *a1@<X0>, int a2@<W2>, uint64_t a3@<X8>)
{
  *(void *)(*a1 - 0x28638DD0D74C695FLL) = v5 + v6 + ((a2 + 925) ^ 0x489LL);
  return ((uint64_t (*)(void))(*(void *)(a3 + 8LL * ((959 * (*v3 == v4)) ^ (a2 + 925) ^ 0x465)) - 8LL))();
}

void sub_10000A89C(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 24) - 0x690A6A41B9AF297ALL) = v3;
  _DWORD *v1 = v2;
  JUMPOUT(0x10000A7F4LL);
}

void sub_10000A8BC()
{
  unint64_t v0 = (unint64_t)&v2[qword_100060138 + qword_100060108];
  qword_100060138 = (45734839 * v0) ^ 0x95387C5A7726064LL;
  qword_100060108 = 45734839 * (v0 ^ 0x95387C5A7726064LL);
  *(_DWORD *)*(&off_10005BF10
  uint64_t v1 = ((uint64_t (*)(uint64_t))*(&off_10005BF10
                                         + ((-73
  *(void *)*(&off_10005BF10
  __asm { BR              X8 }

void sub_10000AA60()
{
  _DWORD *v1 = v0;
}

void sub_1000119F8(uint64_t a1)
{
  int v1 = (*(_DWORD *)(a1 + 4) + 1755732067 * ((a1 - 1759316641 - 2 * (a1 & 0x9722F55F)) ^ 0x49E44884) - 1263945362) & 0x4B5642ED;
  int v2 = *(_DWORD *)(*(void *)(a1 + 8) - 0x621D43C813E5057ELL);
  int v4 = v2 - 2086149949;
  BOOL v3 = v2 - 2086149949 < 0;
  int v5 = 2086149949 - v2;
  if (!v3) {
    int v5 = v4;
  }
  BOOL v6 = (v5 ^ 0xBFDD9D33) + (v1 ^ 0x7EABFC17) + ((2 * v5) & 0x7FBB3A66) - 1049205779 < ((v1 + 1776684215) & 0x9619F6A3 ^ 0x7FFFF9DC);
  __asm { BR              X5 }

uint64_t sub_100011B4C@<X0>( int a1@<W1>, unsigned int a2@<W2>, int a3@<W4>, int a4@<W6>, unsigned int a5@<W7>, int a6@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v8 + 8LL * (((*(_DWORD *)(*v7 + 4LL * a5) == a6) * a3) ^ a4))
                            - ((a4 + a1 + v6) | a2)
                            + 1067LL))();
}

void sub_100011B80()
{
}

_DWORD *sub_100011B94(_DWORD *result)
{
  *result = 1806732479;
  return result;
}

void sub_100011C14(unint64_t a1)
{
  unsigned int v2 = 1224239923 * ((2 * ((a1 ^ 0x6CFE4100) & 0x6997F88A) - (a1 ^ 0x6CFE4100) - 1771567243) ^ 0x825BBA2);
  int v3 = *(_DWORD *)(a1 + 44);
  signed int v4 = *(_DWORD *)(a1 + 40) - v2;
  unsigned int v34 = *(_DWORD *)(a1 + 12) + v2;
  unint64_t v23 = 1224239923
      * ((2 * ((a1 ^ 0xDCF66856CFE4100LL) & 0x712F41ED6997F88ALL) - (a1 ^ 0xDCF66856CFE4100LL) - 0x712F41ED6997F88BLL) ^ 0xAB456DFE0825BBA2LL);
  int v5 = v3 - v2;
  unsigned int v6 = 235795823
     * (((v43 ^ 0x46C05FDF | 0xC9B2DC24)
  unsigned int v44 = v6 - 1970643562;
  int v45 = v4 - v6 + 1172345350;
  int v29 = &STACK[0x5934B92A3842FD78];
  uint64_t v46 = &STACK[0x5934B92A3842FD78];
  sub_100022668((uint64_t)v43);
  int v7 = (_DWORD *)a1;
  uint64_t v8 = (uint64_t)*(&off_10005BF10 + v4 + 128);
  uint64_t v31 = *(void *)(v8 + 8LL * v4) - 8LL;
  int v20 = v5 - 748830328;
  int v19 = ((v4 + 941) | 4) - 406770615;
  int v22 = v5 - 334417494;
  int v15 = v5 + 2036802175;
  int v14 = v5 + 477526965;
  v13[1] = &v13[-135931262];
  v13[0] = &STACK[0x40D130F9];
  int v18 = -406769585;
  int v16 = (v4 - 103524982) & 0x62BAE6F;
  int v17 = v16 ^ 0x306;
  int v9 = (v4 - 1947539830) & 0x74151D7F;
  int v36 = v9 ^ 0x451;
  int v37 = v9;
  int v10 = v9 ^ 0x45A;
  unsigned int v11 = v34;
  int v35 = v10;
  int v24 = v4 ^ 0x504;
  uint64_t v32 = v4 ^ 0x504u;
  uint64_t v21 = v32;
  uint64_t v25 = v7;
  signed int v33 = v4;
  int32x4_t v27 = vdupq_n_s32(0x2E527ED2u);
  int32x4_t v28 = vdupq_n_s32(0x2E527EDFu);
  int32x4_t v26 = vdupq_n_s32(0x2E527EDBu);
  uint64_t v30 = *((void *)v7 + 3);
  unsigned int v12 = v11 - ((2 * v11 + 81678816) & 0x1B278836) - 2147291893;
  char v38 = ((v12 >> ((((v4 - 83) | 4) ^ 0x6B) - 85)) ^ (((v4 - 83) | 4) - 121))
      + (~(2 * ((v12 >> ((((v4 - 83) | 4) ^ 0x6B) - 85)) ^ (((v4 + 941) | 4) - 377))) | 0x2B)
      + 107;
  char v39 = (BYTE2(v12) ^ 0x93) - ((2 * (BYTE2(v12) ^ 0x93)) & 0xD4) + 106;
  char v40 = (BYTE1(v12) ^ 0xC4) - 2 * ((BYTE1(v12) ^ 0xC4) & 0x6B ^ BYTE1(v12) & 1) + 106;
  char v41 = (v11 - ((2 * v11 - 32) & 0x36) + 11) ^ 0x71;
  __asm { BR              X15 }

uint64_t sub_100012074( int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, int a37, char a38)
{
  unsigned int v43 = v39 + a3;
  if (v43 <= 0x40) {
    unsigned int v43 = 64;
  }
  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v42 + 8LL * (int)(((a1 - v40 - v41 + ((v38 - 525) | 0x200) + v43 < 0xF) * ((v38 + 1009276032) & 0xC3D7ADB7 ^ 0x4B9)) ^ v38)) - 8LL))( &a38,  a2,  3342550824LL,  a4,  -393663415LL,  a6,  a7,  3624502389LL);
}

uint64_t sub_100012104( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, int a37, char a38)
{
  int v44 = v39 + v38;
  unsigned int v45 = v39 + v38 + 1178207750;
  if (v45 <= 0x40) {
    unsigned int v45 = 64;
  }
  BOOL v46 = !__CFADD__(v44 + (((v40 - 1093) | 0x200) ^ 0x463A0465), v42 + v41 + ((82 * (v40 ^ 0x4AC)) ^ 0xB9C5FB18) + v45);
  return ((uint64_t (*)(char *))(*(void *)(v43 + 8LL * ((109 * v46) ^ v40)) - 12LL))(&a38);
}

uint64_t sub_10001218C@<X0>(_OWORD *a1@<X0>, int a2@<W1>, uint64_t a3@<X5>, int a4@<W8>)
{
  *(_OWORD *)(a3 + (a4 + a2)) = *a1;
  return ((uint64_t (*)(void))(*(void *)(v6
                                        + 8LL
                                        * ((508 * ((((v4 - 738) | 0x262u) ^ 0x272LL) == ((v5 + 1) & 0x1FFFFFFF0LL))) ^ v4))
                            - 12LL))();
}

uint64_t sub_1000121F4@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X5>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, int a33, char a34, char a35)
{
  int v39 = (v37 - 516) | 0xC0;
  *(_BYTE *)(a3 + (v36 + v39 - 707)) = v35;
  *(_BYTE *)(a3 + (a4 - 952416472)) = a35;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v38
                                                                        + 8LL
                                                                        * (v39 | (4
                                                                                * (((v39 + 1393100821) & 0xACF6F7EE ^ 0x2C2) <= 2))))
                                                            - 8LL))( a1,  a2,  3342550824LL);
}

uint64_t sub_1000133CC@<X0>(int a1@<W2>, uint64_t a2@<X5>, int a3@<W8>)
{
  *(_BYTE *)(a2 + a1 + a3 + 17 * (v5 ^ 0x2C3u) - 84) = *(_BYTE *)(v6 + (v4 - 393663363));
  return ((uint64_t (*)(void))(*(void *)(v7 + 8LL * (v5 ^ (1172 * ((v3 + 88) < 4)))) - 8LL))();
}

uint64_t sub_100013420@<X0>( uint64_t a1@<X5>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t (*a23)(uint64_t))
{
  *(_BYTE *)(a1 + (a2 + 2)) = *(_BYTE *)(v25 + (v23 - 393663447 + v24 - 625));
  int v27 = 1755732067 * ((~((v26 - 168) | 0xBF7F5A4B) + ((v26 - 168) & 0xBF7F5A4B)) ^ 0x9E46186F);
  *(void *)(v26 - 168) = a21;
  *(_DWORD *)(v26 - 160) = v27 + v24 - 625 + 326;
  *(_DWORD *)(v26 - 156) = 819587712 - v27;
  uint64_t v28 = sub_100006898(v26 - 168);
  return a23(v28);
}

uint64_t sub_1000134B0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned int a12)
{
  BOOL v15 = a12 < 0x8DCA9146;
  return ((uint64_t (*)(void))(*(void *)(v14 + 8LL * ((488 * (((v13 - 1) ^ v15) & 1)) ^ v13)) - 8LL))();
}

uint64_t sub_100013530@<X0>( int a1@<W0>, unsigned int a2@<W1>, int a3@<W2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, int a8@<W8>)
{
  BOOL v14 = a2 < v12;
  *(_BYTE *)(a6 + (a8 + v11)) = *(_BYTE *)(a5 + (v8 + v10))
  unsigned int v15 = v8 + 1 + a1;
  int v16 = v14 ^ (v15 < v12);
  BOOL v17 = v15 < a2;
  if (!v16) {
    BOOL v14 = v17;
  }
  return ((uint64_t (*)(void))(*(void *)(v13 + 8LL * ((!v14 * a3) ^ v9)) - 8LL))();
}

uint64_t sub_1000135A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, unsigned int a34)
{
  int v37 = 1755732067 * ((((v36 - 168) | 0xD7972D6F) - ((v36 - 168) & 0xD7972D6F)) ^ 0x95190B4);
  *(_DWORD *)(v36 - 160) = v37 + v34 + 383;
  *(_DWORD *)(v36 - 156) = a12 - v37;
  *(void *)(v36 - 168) = a28;
  uint64_t v38 = sub_100006898(v36 - 168);
  uint64_t v39 = STACK[0x2C8] & 0x3F;
  *((_BYTE *)&STACK[0x284] + (v39 ^ 0x38)) = -22;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void))(*(void *)(v35
                                                                                + 8LL
                                                                                * ((1035
                                                                                  * ((v39 ^ 0x38) > ((v34 + 57) ^ 0x62u))) ^ v34))
                                                                    - (v34 + 1370)
                                                                    + 1394LL))( v38,  3901303846LL,  3342550824LL,  a34);
}

uint64_t sub_10001369C@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(uint64_t))(v2
                                            + 8LL
                                            * ((174
}

uint64_t sub_100013708()
{
  return (*(uint64_t (**)(void))(v2
                              + 8LL
                              * (((((5 * (v0 & 0xDE4FFFF ^ 0x6EC) - 20) | 0x14) ^ 0x18E) * ((v1 ^ 7u) < 8)) ^ v0 & 0xDE4FFFF)))();
}

uint64_t sub_10001375C@<X0>(unsigned int a1@<W8>, uint64_t a2)
{
  *(void *)(a2 + a1 + (((v3 - 83) | 0x605u) ^ 0xFFFFFFFFBF2ED78BLL)) = v5;
  return ((uint64_t (*)(uint64_t))(*(void *)(v4 + 8LL * ((475 * ((v2 & 0x38) == 8LL)) ^ (v3 + 149))) - 8LL))(1541LL);
}

void sub_1000137B4()
{
}

uint64_t sub_1000137C0()
{
}

uint64_t sub_10001381C@<X0>(int a1@<W8>)
{
  uint64_t v4 = v1;
  uint64_t v5 = v2 + v1;
  else {
    uint64_t v6 = 56LL;
  }
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * (int)(((262 * ((a1 + 1897631726) & 0x8EE46DD7 ^ 0x57) - 483)
}

uint64_t sub_100013898( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  *(void *)(a10 + v12) = v14;
  BOOL v15 = (v11 & 0xFFFFFFFFFFFFFFF8LL) - (v10 + 130) == -646LL;
  return ((uint64_t (*)(void))(*(void *)(v13 + 8LL * ((v15 | (32 * v15)) ^ v10)) - 4LL))();
}

uint64_t sub_1000138E0()
{
  *(void *)(v2 + v3) = v5;
  return ((uint64_t (*)(void))(*(void *)(v4 + 8LL * (((v1 == v3) | (32 * (v1 == v3))) ^ v0)) - 4LL))();
}

uint64_t sub_100013904()
{
}

uint64_t sub_10001395C@<X0>(uint64_t a1@<X5>, uint64_t a2@<X8>)
{
  *(_BYTE *)(a1 + a2 + v3) = v4;
}

void sub_10001398C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, char a7)
{
  int v7 = LOBYTE(STACK[0x2E4]) ^ 0xE1;
  if (v7 == 1)
  {
    unsigned int v18 = STACK[0x2C8];
    unsigned int v19 = STACK[0x2C4];
    int v20 = (LODWORD(STACK[0x2C8]) >> 5) ^ 0x6B;
    LOBYTE(STACK[0x2BC]) = ((8 * LOBYTE(STACK[0x2C8])) ^ 0xC0)
                         + ~((a4 + 123) & (2 * ((8 * LOBYTE(STACK[0x2C8])) ^ 0xC0)))
                         + 107;
    char v17 = -44;
    char v12 = a4 - 52;
    LOBYTE(STACK[0x2BD]) = v20 - ((2 * v20) & 0xD4) + 106;
    LOBYTE(STACK[0x2BE]) = ((v18 >> 13) ^ 0x85) - ((v18 >> 12) & 0xD4) + 106;
    LOBYTE(STACK[0x2BF]) = ((v18 >> 21) ^ 0xE6) - ((2 * ((v18 >> 21) ^ 0xE6)) & 0xD4) + 106;
    HIDWORD(v21) = v19 ^ 0x17;
    LODWORD(v21) = v18 ^ 0x40000000;
    LOBYTE(STACK[0x2C0]) = (v21 >> 29) - ((2 * (v21 >> 29)) & 0xD4) + 106;
    LOBYTE(STACK[0x2C1]) = ((v19 >> 5) ^ 0xD) - ((2 * ((v19 >> 5) ^ 0xD)) & 0xD4) + 106;
    LOBYTE(STACK[0x2C2]) = ((v19 >> 13) ^ 0x29) - 2 * (((v19 >> 13) ^ 0x29) & 0xEE ^ (v19 >> 13) & 4) + 106;
    unsigned int v16 = (v19 >> 21) ^ 0x21;
  }

  else
  {
    if (v7 != 2) {
      goto LABEL_6;
    }
    unsigned int v8 = STACK[0x2C4];
    unsigned int v16 = STACK[0x2C8];
    int v9 = LODWORD(STACK[0x2C4]) >> 21;
    char v10 = v9 ^ 0x21;
    char v11 = (v9 ^ 0x21) & 0x6E ^ v9 & 4;
    char v12 = a4 - 52;
    char v13 = v10 + ((a4 - 52) ^ (2 * v11) ^ 0xDE);
    int v14 = (LODWORD(STACK[0x2C4]) >> 13) ^ 0x29;
    LOBYTE(STACK[0x2BC]) = v13 + 107;
    LOBYTE(STACK[0x2BD]) = v14 - (a7 & (2 * v14)) + 106;
    LOBYTE(STACK[0x2BE]) = ((v8 >> 5) ^ 0xD) - (a7 & (2 * ((v8 >> 5) ^ 0xD))) + 106;
    HIDWORD(v15) = v8 ^ 0x17;
    LODWORD(v15) = v16 ^ 0x40000000;
    LOBYTE(STACK[0x2BF]) = (v15 >> 29) - (a7 & (2 * (v15 >> 29))) + 106;
    LOBYTE(STACK[0x2C0]) = ((v16 >> 21) ^ 0xE6) - 2 * (((v16 >> 21) ^ 0xE6) & 0x6B ^ ((v16 & 0x200000) != 0)) + 106;
    LOBYTE(STACK[0x2C1]) = ((v16 >> 13) ^ 0x85) - (a7 & (v16 >> 12)) + 106;
    LOBYTE(STACK[0x2C2]) = ((v16 >> 5) ^ 0x6B) - (a7 & (2 * ((v16 >> 5) ^ 0x6B))) + 106;
    LOBYTE(v16) = (8 * v16) ^ 0xC0;
    char v17 = -48;
  }

  LOBYTE(STACK[0x2C3]) = v16 + v12 + 52 - (v17 & (2 * v16)) + 21;
LABEL_6:
  JUMPOUT(0x1000125E0LL);
}

uint64_t sub_100013BB0()
{
  return ((uint64_t (*)(uint64_t))(*(void *)(v3 + 8LL * (v2 ^ (37 * (v1 == v0))))
                                          - 17 * (v2 ^ 0x602u)
                                          - (((v2 ^ 0x602u) + 23) ^ 0xFFFFFFFFFFFFFFB3LL)))(266LL);
}

uint64_t sub_100013C0C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(_BYTE *)(a6 + v7 + v8) = v11;
  return (*(uint64_t (**)(void))(v12
                              + 8LL
                              * (((((v6 + v10) & v9 ^ (unint64_t)(v8 + 5)) + v7 > 0x3F) * a1) ^ (v6 + 1063))))();
}

void sub_100013C48()
{
}

uint64_t sub_100013C7C( uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, int a33, char a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39)
{
  if (a34 == 2) {
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v39
  }
                                                                          + 8LL
                                                                          * ((22
                                                                            * (LODWORD(STACK[0x2E0]) != a4 + 151310952)) ^ (a4 + 174)))
                                                              - 8LL))( a1,  a15,  235795823LL);
  if (a34 == 1) {
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v39
  }
                                                                          + 8LL
                                                                          * ((1997
                                                                            * (LODWORD(STACK[0x2E0]) != 37 * (a4 ^ 0x52) + 151310778)) ^ (a4 + 174)))
                                                              - 8LL))( a1,  a2,  235795823LL);
  int v41 = (2 * a4) ^ 0x124;
  unint64_t v42 = ((unint64_t)&a39 ^ 0xF7BBBEC3FE47DF6ELL)
      + 0x1DEF7BFF29FF6F2DLL
      + (((void)&a39 << (((2 * a4) ^ 0x24u) + 115)) & 0xEF777D87FC8FBED0LL);
  LOBYTE(STACK[0x2DF]) = (v42 + ((v41 - 30) | 6)) * ((v42 + 101) ^ 0xBA);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 + 8LL * v41) - 12LL))(a1, a2, 235795823LL);
}

void sub_100013FC8()
{
}

uint64_t sub_100013FD0(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v8 = *v3;
  unsigned int v9 = (void *)(v7 - 200);
  memset((void *)(v7 - 200), 106, 16);
  int v10 = ((((2 * (v7 - 168)) | 0xFBA80D6A) - (v7 - 168) + 36436299) ^ 0x69794FEC) * a3;
  v9[9] = v9;
  *(_DWORD *)(v7 - 160) = v10 + 1462279853;
  *(_DWORD *)(v7 - 132) = (v4 + 1694) ^ v10;
  v9[6] = &STACK[0x270];
  v9[7] = v8;
  v9[4] = v7 - 184;
  uint64_t v11 = ((uint64_t (*)(uint64_t))((char *)*(&off_10005BF10 + (v4 ^ 0x29)) - 4))(v7 - 168);
  return ((uint64_t (*)(uint64_t))(*(void *)(v5
                                                      + 8LL
                                                      * ((673
                                                        * (*(_DWORD *)(v7 - 136) == (((v4 ^ 0x67) + 172) ^ (v6 - 18))
                                                                                  + 5 * (v4 ^ 0x67))) ^ v4))
                                          - 4LL))(v11);
}

uint64_t sub_1000140D4()
{
  uint64_t v7 = v0 + 1;
  BOOL v9 = (v6 ^ 0x6EFEFEBF) - 1711277578 + ((v6 << (v4 ^ 0xBC)) & 0xDDFDFD7E) != 150927541 || v7 == v2 + 16;
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * (v4 ^ (2 * v9))) - 8LL))();
}

uint64_t sub_100014158@<X0>(uint64_t a1@<X8>)
{
  unint64_t v4 = 1759421093
     * ((((v3 - 168) | 0x60E2BDCEF914AA9ELL) - (v3 - 168) + ((v3 - 168) & 0x9F1D423106EB5560LL)) ^ 0x4E5C7C9E4A691ACALL);
  uint64_t v5 = v3 - 200;
  *(void *)(v5 + 40) = v4 + 150927541;
  *(void *)(v5 + 56) = a1 - v4;
  *(_DWORD *)(v3 - 136) = v4 ^ ((v2 ^ 0xE8) + 2072422627) ^ 0x76;
  *(_DWORD *)(v3 - 168) = v4 + (v2 ^ 0xE8) + 2021363692;
  *(_DWORD *)(v3 - 164) = (v2 ^ 0xE8) + 2072422627 - v4;
  *(_DWORD *)(v3 - 152) = ((v2 ^ 0xE8) + 2072422629) ^ v4;
  *(_DWORD *)(v3 - 148) = v4;
  uint64_t v6 = ((uint64_t (*)(uint64_t))((char *)*(&off_10005BF10 + (v2 ^ 0xE8) + 73) - 8))(v3 - 168);
  return ((uint64_t (*)(uint64_t))(*(void *)(v1 + 8LL * *(int *)(v3 - 132)) - 4LL))(v6);
}

void sub_100014250()
{
  *(_DWORD *)(v0 + 8) = 777158354;
}

void sub_10001429C(_DWORD *a1)
{
  unsigned int v1 = *a1 ^ (1374699841 * ((-2 - ((a1 | 0xA88133EE) + (~(_DWORD)a1 | 0x577ECC11))) ^ 0x3A8AD418));
  __asm { BR              X9 }

uint64_t sub_100014354@<X0>(int a1@<W8>)
{
  unsigned int v3 = a1 & 0xA4E60EC1;
  BOOL v4 = (*(uint64_t (**)(uint64_t))(v1 + 8LL * (int)((a1 & 0xA4E60EC1) - 287)))(200LL) != 0;
  return (*(uint64_t (**)(void))(v2 + 8LL * (int)((v4 * ((877 * (v3 ^ 0x203)) ^ 0x16B)) ^ v3)))();
}

uint64_t sub_1000143A8(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, void))(v4 + 8LL * ((v6 ^ 0x4DB) - 1629)))(a1, 0LL);
  if ((_DWORD)result == 16)
  {
    int v5 = 1518303119;
    goto LABEL_7;
  }

  if ((_DWORD)result == 12)
  {
LABEL_7:
    uint64_t result = (*(uint64_t (**)(uint64_t))(v4 + 8LL * (int)(v2 & 0xF218D13B)))(a1);
    goto LABEL_8;
  }

  if ((_DWORD)result)
  {
    int v5 = -476759292;
    goto LABEL_7;
  }

  void *v3 = a1;
  int v5 = 1349855230;
LABEL_8:
  *(_DWORD *)(v1 + 4) = 22498083 * v5 + 401743430;
  return result;
}

void sub_100014448(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 - 628203409 * ((a1 & 0x7EE22050 | ~(a1 | 0x7EE22050)) ^ 0x395D39C);
  uint64_t v2 = *(void *)(a1 + 8);
  ((void (*)(char *, void (*)()))*(&off_10005BF10 + (v1 ^ 0xBF)))( (char *)*(&off_10005BF10 + (v1 ^ 0x9C)) - 8,  sub_10004687C);
  __asm { BR              X10 }

uint64_t sub_100014510()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
                                        * (((*(void *)(*(void *)(v1 + 8LL * (v2 ^ 0x8E)) - 4LL) == 0LL) * (v2 + 300)) ^ v2))
                            - 4LL))();
}

  ;
}

uint64_t sub_100014554@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(uint64_t))(v2 + 8LL * (a1 - 321)))(v1);
}

void sub_100014570(uint64_t a1)
{
  int v2 = 1224239923 * (((a1 ^ 0x7838128A) & 0xFC78B2CE | (a1 ^ 0x820410) & 0x3874D31) ^ 0x8A09EB4D);
  int v3 = *(_DWORD *)(a1 + 8) ^ v2;
  v4[1] = (235795823
         * (((v4 | 0xFA820D6C) - v4 + (v4 & 0x57DF290)) ^ 0x6E2F4435)) ^ (v3 - 231789269);
  nullsub_1(v4);
  __asm { BR              X0 }

uint64_t sub_100014704()
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * (((((v0 + 1) & 0x7FFFFFFC) == ((v5 - 141) | v1) + v4) * v2) ^ (v5 - 102)))
                            - 12LL))();
}

void sub_10001473C()
{
}

uint64_t sub_100014754@<X0>(uint64_t a1@<X8>)
{
  BOOL v5 = (*(uint64_t (**)(void))(a1 + 8LL * (v4 - 151)))(*(_DWORD *)(v3 + 24 * v2 + 16) + (v4 ^ 0xA6u) - 1782897594) != 0;
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * ((240 * v5) ^ v4)) - 12LL))();
}

uint64_t sub_1000147B0(uint64_t a1)
{
  int v4 = v2 - ((2 * v2 + 729173066) & 0x27AD1A2C) - 1450069189;
  return ((uint64_t (*)(uint64_t, void))(*(void *)(v1
                                                              + 8LL
                                                              * (v3 ^ (114
                                                                     * (((v4 << (((v3 + 114) | 0x62) ^ 0x66)) & 0x7EDFAE6E ^ 0x268D0A2C)
                                                                      + (v4 ^ 0x2CB95A21)
                                                                      - 671351043 != 392943156))))
                                                  - 12LL))( a1,  (v3 - 250));
}

uint64_t sub_100014854()
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * ((247
                                          * (v1 + v0 + v2 - 1064294159 - 655 < ((v2 + 783125734) & 0xD15271BF ^ 0x105))) ^ v2))
                            - 4LL))();
}

uint64_t sub_1000148C0(uint64_t a1, int a2)
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * ((((((unint64_t)(v2 - a1) < 0x20) ^ (a2 + 95)) & 1)
                                          * (((a2 - 655) | 0x10C) ^ 0x50C)) | a2))
                            - 4LL))();
}

uint64_t sub_10001490C(uint64_t a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(void))(v4
                              + 8LL
                              * (((v3 < (((a3 & 0x31EA25F1) - 1026) ^ 0x1FFu)) * (2 * (a3 & 0x31EA25F1 ^ 0x46C) - 787)) ^ a3 & 0x31EA25F1)))();
}

uint64_t sub_10001494C(uint64_t a1, uint64_t a2, int a3)
{
  unsigned int v9 = v6 + v5 + v7;
  uint64_t v10 = v3 + v9;
  __int128 v11 = *(_OWORD *)(v10 - 31);
  uint64_t v12 = a1 + v9;
  *(_OWORD *)(v12 - 15) = *(_OWORD *)(v10 - 15);
  *(_OWORD *)(v12 - 31) = v11;
}

void sub_1000149BC()
{
}

uint64_t sub_1000149C8()
{
  return (*(uint64_t (**)(void))(v3 + 8LL * ((((v2 + 46) ^ (v2 - 512) ^ 0x65A) * (v0 == v1)) | v2)))();
}

uint64_t sub_1000149F4(uint64_t a1, uint64_t a2, int a3)
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * (((((v3 & 0x18) == 0) ^ (a3 + 70)) & 1 | (8 * ((((v3 & 0x18) == 0) ^ (a3 + 70)) & 1))) ^ a3))
                            - 397 * (a3 ^ 0x5C5u)
                            + 782LL))();
}

uint64_t sub_100014A34(uint64_t a1, int a2)
{
  *(void *)(a1 - 7 + (v5 + v4 + v6 - v7)) = *(void *)(v2 - 7 + (v5 + v4 + v6 - v7));
}

void sub_100014AA4()
{
}

uint64_t sub_100014AB0(uint64_t a1, uint64_t a2, int a3)
{
}

uint64_t sub_100014AFC@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  *(_BYTE *)(a1 + (v3 - 392943157)) = *(_BYTE *)(v2 + (v3 - 392943157));
}

uint64_t sub_100014B50(uint64_t a1, int a2)
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * (((*v2 == 0x5F95BF1661E6ED22LL) * (((a2 + 1500936268) ^ 0x59767A9C) - 317)) ^ a2))
                            - ((a2 + 1500936268) & 0xA68987BF ^ 0x3A9LL)))();
}

uint64_t sub_100014BAC(uint64_t result)
{
  uint64_t v3 = *(void *)(v1 + 32);
  *(void *)(*(void *)(v1 + 16) - 0x5CF514050BE6E867LL) = result;
  *(_DWORD *)(v3 - 0x5523B707D71B701FLL) = v2;
  *(_DWORD *)(v1 + 12) = 777158354;
  return result;
}

void sub_100014C40(void *a1)
{
  unsigned int v1 = 235795823
     * ((-2 - ((a1 ^ 0x29040430 | 0x96E8ABCB) + (a1 ^ 0x10C0A082 | 0x69175434))) ^ 0x52961214);
  BOOL v2 = a1[2] > *a1;
  __asm { BR              X11 }

uint64_t sub_100014D74()
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * (v0 ^ (480 * (v1 == 0x12BEB4AF)))) - 8LL))();
}

uint64_t sub_100014DC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v9 = (v6 - 846620352);
  *(_BYTE *)(a1 + v9) = *(_BYTE *)(v1 + v9) ^ (97 * ((v6 + 64) & 0xF)) ^ *(_BYTE *)(*(void *)(v7 + 8LL * (v2 ^ 0x4B6))
                                                                                  + (v9 & 0xF)) ^ *(_BYTE *)(*(void *)(v7 + 8LL * (v2 - 1191)) + (v9 & 0xF) - 12) ^ *(_BYTE *)(*(void *)(v7 + 8LL * (v2 - 965)) + (v9 & 0xF) - 12) ^ 0x6A;
  unsigned int v10 = v6 - 1238828216;
  int v11 = (v4 > 0x17609DF8) ^ (v10 < v3);
  BOOL v12 = v10 < v5;
  if (v11) {
    BOOL v12 = v4 > 0x17609DF8;
  }
  return ((uint64_t (*)(void))(*(void *)(v8 + 8LL * ((480 * !v12) ^ v2)) - 8LL))();
}

uint64_t sub_100014E94()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * (v1 ^ (838
                                               * (((v0 << ((v1 - 97) ^ 0xED)) & 0xF7DCFF7C ^ 0x255C695C)
                                                + (v0 ^ 0xE950CB11)
                                                + 507369660 != 439113850))))
                            - 8LL))();
}

uint64_t sub_100014F0C(int a1, int a2)
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * (((((v2 ^ ((a2 + a1 + 68255810) < 8)) & 1) == 0)
                                          * (((v2 - 1060) | 0x23) ^ 0xE8)) ^ v2))
                            - 12LL))();
}

uint64_t sub_100014F90(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int a6)
{
  return ((uint64_t (*)(void))(*(void *)(v6
                                        + 8LL
                                        * ((((a5 ^ 0x7FF) - 1807) * ((a3 + a6 - 16) > 0xFFFFFFEF)) ^ a5))
                            - ((a5 - 2081420272) & 0x7C0FF3C4)
                            + 188LL))();
}

uint64_t sub_100014FDC@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v10 = (a2 + a1 + a3);
  uint64_t v11 = v10 + a4;
  uint64_t v12 = (177 * (v5 ^ 0xC3) - 516) & v10;
  uint64_t v13 = v8 - v11;
  uint64_t v14 = ((v5 + 1533300349) & 0xA49BB7D6 ^ 0x715LL) - v11;
  uint64_t v15 = (v12 | v6) - v11;
  BOOL v16 = (unint64_t)(v4 - a4) > 0xF && (unint64_t)(v13 + v12) > 0xF;
  unint64_t v17 = v14 + (v12 | v7);
  int v20 = v16 && v17 > 0xF && (unint64_t)(v15 + 1) > 0xF;
  return (*(uint64_t (**)(void))(v9 + 8LL * ((449 * v20) ^ v5)))();
}

uint64_t sub_100015074(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)(v6
                                                                                         + 8LL
                                                                                         * (v4 ^ (4
                                                                                                * (v5 >= (((v4 + 243) | 0x70) ^ 0x366u)))))
                                                                             - 4LL))( a1,  a2,  a3,  a4,  0LL);
}

uint64_t sub_1000150A4@<X0>(int a1@<W3>, int a2@<W5>, uint64_t a3@<X8>)
{
  v17.val[1].i64[0] = ((_BYTE)a1 + 13) & 0xF;
  v17.val[1].i64[1] = ((_BYTE)a1 + 12) & 0xF;
  v17.val[2].i64[0] = ((_BYTE)a1 + 11) & 0xF;
  v17.val[2].i64[1] = ((_BYTE)a1 + 10) & 0xF;
  v17.val[3].i64[0] = ((_BYTE)a1 + 9) & 0xF;
  v17.val[3].i64[1] = ((_BYTE)a1 + 8) & 0xF;
  v18.val[0].i64[0] = ((_BYTE)a1 + 7) & 0xF;
  v18.val[0].i64[1] = ((_BYTE)a1 + 6) & 0xF;
  v18.val[1].i64[0] = (a1 + 5) & 0xF;
  v18.val[1].i64[1] = (a1 + 4) & 0xF;
  v18.val[2].i64[0] = (a1 + 3) & 0xF;
  v18.val[2].i64[1] = ((_BYTE)a1 + 2) & 0xF;
  v18.val[3].i64[0] = ((_BYTE)a1 + 1) & 0xF;
  v18.val[3].i64[1] = a1 & 0xF;
  v10.i64[0] = 0xC1C1C1C1C1C1C1C1LL;
  v10.i64[1] = 0xC1C1C1C1C1C1C1C1LL;
  v11.i64[0] = 0x6A6A6A6A6A6A6A6ALL;
  v11.i64[1] = 0x6A6A6A6A6A6A6A6ALL;
  uint64_t v12 = a1 + ((a2 - 289) ^ (v4 + 427));
  v17.val[0].i64[0] = ((_BYTE)a1 + ((a2 - 33) ^ (v4 - 85))) & 0xF;
  v17.val[0].i64[1] = ((_BYTE)a1 + 14) & 0xF;
  v13.i64[0] = vqtbl4q_s8(v17, (int8x16_t)xmmword_100047760).u64[0];
  v13.i64[1] = vqtbl4q_s8(v18, (int8x16_t)xmmword_100047760).u64[0];
  int8x16_t v14 = vrev64q_s8( veorq_s8( veorq_s8(*(int8x16_t *)(v3 - 15 + v12), *(int8x16_t *)(v7 + (v12 & 0xF) - 15)),  veorq_s8(*(int8x16_t *)(v6 + (v12 & 0xF) + 1 - 15), *(int8x16_t *)(v5 + (v12 & 0xF) + 1 - 15))));
  int8x16_t v15 = vrev64q_s8(veorq_s8(veorq_s8(vextq_s8(v14, v14, 8uLL), v11), vmulq_s8(v13, v10)));
  *(int8x16_t *)(a3 - 15 + v12) = vextq_s8(v15, v15, 8uLL);
  return ((uint64_t (*)(void))(*(void *)(v9 + 8LL * ((1489 * ((v8 & 0xFFFFFFF0) == 16)) ^ a2)) - 8LL))();
}

void sub_10001520C()
{
}

uint64_t sub_100015218( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, int a8)
{
  return ((uint64_t (*)(void))(*(void *)(v9 + 8LL * (((((a8 + 684) ^ 0x5EA) + 15) * (v8 == a5)) ^ a8)) - 12LL))();
}

uint64_t sub_100015250()
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * (int)((((v0 ^ 0x7FF) - 1052) * ((v1 >> 3) & 1)) ^ v0)) - 4LL))();
}

uint64_t sub_100015278@<X0>( int a1@<W0>, int a2@<W1>, int a3@<W2>, int a4@<W4>, uint64_t a5@<X8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39)
{
  *(_DWORD *)(v46 - 152) = v45;
  *(void *)(v46 - 128) = a5 - 7;
  *(void *)(v46 - 120) = v39 - 7;
  *(_DWORD *)(v46 - 160) = v45 & 0xFFFFFFF8;
  *(_DWORD *)(v46 - 136) = -(v45 & 0xFFFFFFF8);
  int v47 = -8 - a4;
  int v48 = a2 + a1 + v44;
  *(_DWORD *)(v46 - 144) = v48 + 686;
  uint64_t v49 = (a2 + a1 + a3 + v47 + 8);
  v51.val[0].i64[0] = ((_BYTE)a2 + (_BYTE)a1 + (_BYTE)a3 + (_BYTE)v47 + 8) & 0xF;
  v51.val[0].i64[1] = ((_BYTE)v48 - 76 + (_BYTE)v47 + 8) & 0xF;
  v51.val[1].i64[0] = ((_BYTE)v48 - 77 + (_BYTE)v47 + 8) & 0xF;
  v51.val[1].i64[1] = ((_BYTE)v48 - 78 + (_BYTE)v47 + 8) & 0xF;
  v51.val[2].i64[0] = ((_BYTE)v48 - 79 + (_BYTE)v47 + 8) & 0xF;
  v51.val[2].i64[1] = ((_BYTE)v48 - 80 + (_BYTE)v47 + 8) & 0xF;
  v51.val[3].i64[0] = ((_BYTE)v48 + (_BYTE)v47 + ((v43 + 51) | 0xA5) + 8) & 0xF;
  v51.val[3].i64[1] = (*(_DWORD *)(v46 - 144) + (_BYTE)v47 + 8) & 0xF;
  *(int8x8_t *)(*(void *)(v46 - 128) + v49) = vrev64_s8( veor_s8( veor_s8( vrev64_s8( veor_s8( veor_s8( *(int8x8_t *)(*(void *)(v46 - 120) + v49),  *(int8x8_t *)(v42 + (v49 & 0xF) - 7)),  veor_s8( *(int8x8_t *)(v41 + (v49 & 0xF) + 1 - 7),  *(int8x8_t *)(v40 + (v49 & 0xF) + 1 - 7)))),  (int8x8_t)0x6A6A6A6A6A6A6A6ALL),  vmul_s8( (int8x8_t)*(_OWORD *)&vqtbl4q_s8( v51,  (int8x16_t)xmmword_100047770),  (int8x8_t)0xC1C1C1C1C1C1C1C1LL)));
  return ((uint64_t (*)(__n128))(*(void *)(a39 + 8LL * ((54 * (*(_DWORD *)(v46 - 136) == v47)) ^ v43)) - 4LL))((__n128)xmmword_100047770);
}

void sub_1000153FC()
{
}

uint64_t sub_100015404(uint64_t a1, uint64_t a2, int a3)
{
}

uint64_t sub_10001544C@<X0>(int a1@<W6>, int a2@<W7>, uint64_t a3@<X8>)
{
  uint64_t v10 = (a2 + v5);
  *(_BYTE *)(a3 + v10) = *(_BYTE *)(v3 + v10) ^ *(_BYTE *)(v8 + (v10 & 0xF)) ^ *(_BYTE *)(v7 + (v10 & 0xF) + 1) ^ *(_BYTE *)(v6 + (v10 & 0xF) + 1) ^ ((v10 & 0xF) * ((a1 + 121) & 0x73 ^ 0xC0)) ^ 0x6A;
  return ((uint64_t (*)(void))(*(void *)(v9 + 8LL * ((1911 * (a2 - 1 == v4)) ^ (a1 - 1537))) - 4LL))();
}

uint64_t sub_1000154CC@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34)
{
  int v37 = *(int8x16_t **)(v34 + 40);
  uint64_t v38 = *(void *)(v34 + 24);
  *(_DWORD *)(v35 - 256) = (a6 - 1140) | 0x10;
  *(int8x16_t *)(v35 - 112) = veorq_s8(*v37, (int8x16_t)xmmword_100047780);
  if (a9) {
    BOOL v39 = v38 == 0x2ED20AF3326140A0LL;
  }
  else {
    BOOL v39 = 1;
  }
  int v40 = !v39;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v36 + 8LL * (int)((81 * v40) ^ a6)) - 4LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34);
}

uint64_t sub_100015534( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33)
{
  int v35 = HIDWORD(a11) - (((*(_DWORD *)(v33 - 256) ^ 0x51AEC25B) + 2 * HIDWORD(a11)) & 0x52B40C28) + 1378969463;
  *(_DWORD *)(v33 - 256) = (a6 - 1140) | 0x10;
  BOOL v37 = ((((a6 + 118) ^ 0xC) + (_BYTE)a6 - 116 + (v35 ^ 0xFC)) & 0xF) != 0
     || ((v35 << ((a6 + 118) ^ 0x76)) & 0x75DBFFD0 ^ 0x50900C00) + (v35 ^ 0x13B7F9FC) == -1158807576;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v34 + 8LL * ((195 * v37) ^ ((int)a6 + 118))) - 12LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33);
}

uint64_t sub_1000155EC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, uint64_t a11, int a12, int a13)
{
  return ((uint64_t (*)(void))(*(void *)(v14
                                        + 8LL
                                        * (*(_DWORD *)(v13 - 256) ^ (1289
                                                                   * (((2 * (a13 - ((2 * a10) & 0x8D8DD8EE) + 1872645594)) & 0xF7FD9FF4 ^ 0x858D98E4)
                                                                    + ((a13 - ((2 * a10) & 0x8D8DD8EE) + 1872645594) ^ 0xBD38238D)
                                                                    - 1619299490 != 460997464))))
                            - 4LL))();
}

uint64_t sub_1000156B8()
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
}

uint64_t sub_100015720(int a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
}

uint64_t sub_100015760@<X0>(int a1@<W0>, int a2@<W2>, unint64_t a3@<X8>)
{
  int v9 = a2 ^ 0xC03;
  uint64_t v10 = (v7 + v6 + a1);
  unint64_t v11 = v10 + a3 + 1;
  uint64_t v12 = ((_BYTE)v7 + (_BYTE)v6 + (_BYTE)a1) & 0xF;
  uint64_t v13 = v12 - v10;
  unint64_t v14 = v3 + v12 - v10;
  unint64_t v15 = v12 + v3 + 1;
  unint64_t v16 = v12 + v5 - v10 + 2;
  unint64_t v17 = v12 + v5 + 3;
  unint64_t v18 = v13 + ((v9 - 593) ^ 0x4F6u) + v4 - 1808;
  unint64_t v19 = v12 + v4 + 5;
  BOOL v21 = v17 > a3 && v16 < v11;
  if (v15 > a3 && v14 < v11) {
    BOOL v21 = 1;
  }
  if (v19 > a3 && v18 < v11) {
    BOOL v21 = 1;
  }
  return (*(uint64_t (**)(void))(v8 + 8LL * ((99 * v21) ^ v9)))();
}

uint64_t sub_1000157F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return ((uint64_t (*)(uint64_t, uint64_t, void))(*(void *)(v8
                                                                       + 8LL
                                                                       * (((a7 + 254 + ((a7 - 542) | 1) - 1691)
                                                                         * (v7 < 0x10)) ^ a7))
                                                           - 12LL))( a1,  a2,  0LL);
}

uint64_t sub_10001582C@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W3>, uint64_t a4@<X8>)
{
  v16.val[1].i64[0] = ((_BYTE)a2 + 5) & 0xF;
  v16.val[1].i64[1] = ((_BYTE)a2 + 4) & 0xF;
  v16.val[2].i64[0] = ((_BYTE)a2 + 3) & 0xF;
  v16.val[2].i64[1] = ((_BYTE)a2 + 2) & 0xF;
  v16.val[3].i64[0] = ((_BYTE)a2 + 1) & 0xF;
  v16.val[3].i64[1] = a2 & 0xF;
  unsigned int v11 = v9 + v8 + a1;
  v12.i64[0] = 0x7777777777777777LL;
  v12.i64[1] = 0x7777777777777777LL;
  v16.val[0].i64[0] = v11 & 0xF;
  v16.val[0].i64[1] = ((_BYTE)a2 + 6) & 0xF;
  v13.i64[0] = vqtbl4q_s8(v16, (int8x16_t)xmmword_100047760).u64[0];
  v17.val[0].i64[1] = ((_BYTE)a2 + 14) & 0xF;
  v17.val[1].i64[1] = ((_BYTE)a2 + 12) & 0xF;
  v17.val[2].i64[1] = (a2 + 10) & 0xF;
  v17.val[3].i64[1] = ((_BYTE)a2 + 8) & 0xF;
  v17.val[0].i64[0] = ((_BYTE)a2 - 1) & 0xF;
  v17.val[1].i64[0] = ((_BYTE)a2 + 13) & 0xF;
  v17.val[2].i64[0] = ((_BYTE)a2 + 11) & 0xF;
  v17.val[3].i64[0] = (a2 + 9) & 0xF;
  v13.i64[1] = vqtbl4q_s8(v17, (int8x16_t)xmmword_100047760).u64[0];
  int8x16_t v14 = vrev64q_s8(vmulq_s8(v13, v12));
  *(int8x16_t *)(a4 - 15 + v11) = veorq_s8( veorq_s8( veorq_s8( *(int8x16_t *)(v4 + v16.val[0].i64[0] - 15),  *(int8x16_t *)(a4 - 15 + v11)),  veorq_s8( *(int8x16_t *)((a3 - 296) + v16.val[0].i64[0] + v6 - 170),  *(int8x16_t *)(v16.val[0].i64[0] + v5 - 11))),  vextq_s8(v14, v14, 8uLL));
  return ((uint64_t (*)(void))(*(void *)(v10 + 8LL * ((1078 * ((v7 & 0xFFFFFFF0) == 16)) ^ a3)) - 8LL))();
}

void sub_100015980()
{
}

uint64_t sub_10001598C@<X0>( unsigned __int8 *a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35)
{
  int v41 = v35 ^ 0x69A;
  uint64_t v42 = *(unsigned __int8 *)(v37 - 0x2ED20AF33261409FLL);
  *(_DWORD *)(v40 - 128) = v38;
  uint64_t v43 = *(void *)(v39 + 8LL * (v35 ^ 0x57D));
  LODWORD(v42) = *(unsigned __int8 *)(v43 + (v42 ^ 0x85));
  unsigned int v44 = ((v35 ^ 0x69A) + 785075153) & 0xD134B755;
  HIDWORD(v45) = v42 ^ 0x31;
  LODWORD(v45) = ((v44 - 21) ^ v42) << 24;
  int v46 = ((v45 >> 30) ^ 0x9F) << 16;
  uint64_t v47 = *(void *)(v39 + 8LL * ((v35 ^ 0x69A) - 820)) - 4LL;
  int v48 = *(unsigned __int8 *)(v47 + (*(unsigned __int8 *)(v37 - 0x2ED20AF332614095LL) ^ 0xBFLL));
  HIDWORD(v45) = v48 ^ 2;
  LODWORD(v45) = v48 << 24;
  LOBYTE(v42) = v45 >> 28;
  int v49 = *(unsigned __int8 *)(v43 + (*(unsigned __int8 *)(v37 - 0x2ED20AF33261409BLL) ^ 0x6FLL));
  HIDWORD(v45) = v49 ^ 0x31;
  LODWORD(v45) = ~v49 << 24;
  uint64_t v50 = *(void *)(v39 + 8LL * (v41 - 856));
  int v51 = v42 | ((*(unsigned __int8 *)(v50 + (*(unsigned __int8 *)(v37 - 0x2ED20AF332614096LL) ^ 0xB7LL)) ^ 0x14) << 8);
  uint64_t v52 = *(void *)(v39 + 8LL * (v41 - 916)) - 12LL;
  unsigned __int8 v53 = *(_BYTE *)(v52 + (*(unsigned __int8 *)(v37 - 0x2ED20AF332614094LL) ^ 0xD8LL));
  unint64_t v54 = ((*(unsigned __int8 *)(v50 + (*(unsigned __int8 *)(v37 - 0x2ED20AF332614092LL) ^ 0xC7LL)) ^ 0xF4LL) << 8) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)(v53 ^ 0x10u) << 24);
  LODWORD(v42) = (((v45 >> 30) ^ 0x68) << 16) | ((*(unsigned __int8 *)(v50
                                                                                      + (*(unsigned __int8 *)(v37 - 0x2ED20AF33261409ALL) ^ 0xDFLL)) ^ 0x35) << 8);
  int v55 = *(unsigned __int8 *)(v47 + (*(unsigned __int8 *)(v37 - 0x2ED20AF332614091LL) ^ 0xBCLL));
  HIDWORD(v45) = v55 ^ 2;
  LODWORD(v45) = v55 << 24;
  unsigned __int8 v56 = v45 >> 28;
  int v57 = *(unsigned __int8 *)(v47 + (*(unsigned __int8 *)(v37 - 0x2ED20AF332614099LL) ^ 0x98LL));
  HIDWORD(v45) = v57 ^ 2;
  LODWORD(v45) = v57 << 24;
  unsigned __int8 v58 = v45 >> 28;
  int v59 = v42 | ((*(unsigned __int8 *)(v52 + (*(unsigned __int8 *)(v37 - 0x2ED20AF33261409CLL) ^ 0xAFLL)) ^ 0xC0) << 24);
  LODWORD(v42) = *(unsigned __int8 *)(v47 + (*(unsigned __int8 *)(v37 - 0x2ED20AF33261409DLL) ^ 0xD0LL));
  HIDWORD(v45) = v42 ^ 2;
  LODWORD(v45) = (_DWORD)v42 << 24;
  int v60 = v46 | ((*(unsigned __int8 *)(v50 + (*(unsigned __int8 *)(v37 - 0x2ED20AF33261409ELL) ^ 0x49LL)) ^ 0xBF) << 8) | ((*(unsigned __int8 *)(v52 + (*v36 ^ 0xFELL)) ^ 0x19) << 24);
  LODWORD(v50) = *(unsigned __int8 *)(v43 + (*(unsigned __int8 *)(v37 - 0x2ED20AF332614093LL) ^ 0xB6LL));
  LOBYTE(v42) = (v45 >> 28) ^ 0x3C;
  HIDWORD(v45) = v50 ^ 0x31;
  LODWORD(v45) = ~(_DWORD)v50 << 24;
  unsigned int v61 = v60 & 0xFFFFFF00 | v42;
  uint64_t v62 = (v45 >> 30) ^ 0x21LL;
  LODWORD(v43) = *(unsigned __int8 *)(v43 + (*(unsigned __int8 *)(v37 - 0x2ED20AF332614097LL) ^ 0xC8LL));
  HIDWORD(v45) = v43 ^ 0x31;
  LODWORD(v45) = ~(_DWORD)v43 << 24;
  unsigned int v63 = (v54 & 0xFFFFFF00 | ((_DWORD)v62 << 16) | v56 ^ 0x68) ^ 0xB3F2B95A;
  uint64_t v64 = *(void *)(v39 + 8LL * (v41 - 926)) - 8LL;
  unsigned int v65 = v51 & 0xFF00FFFF | (((v45 >> 30) ^ 0x37) << 16) | ((*(unsigned __int8 *)(v52
                                                                                                + (*(unsigned __int8 *)(v37 - 0x2ED20AF332614098LL) ^ 0x18LL)) ^ 0x5F) << 24);
  int v66 = ((BYTE1(v54) ^ 0x9E) - ((2 * (((v54 | (v62 << 16)) >> 8) ^ 0x75F49E)) & 0x1C4) + 2054054114) ^ *(_DWORD *)(v64 + 4 * (BYTE1(v54) ^ 0x6BLL));
  uint64_t v67 = *(void *)(v39 + 8LL * (v41 - 919)) - 8LL;
  int v68 = *(_DWORD *)(v67 + 4LL * (v53 ^ 0xFu));
  HIDWORD(v45) = v68 ^ 1;
  LODWORD(v45) = v68 ^ 0xCD739308;
  uint64_t v69 = *(void *)(v39 + 8LL * (v41 ^ 0x365)) - 8LL;
  LODWORD(v62) = (v45 >> 2) ^ *(_DWORD *)(v69 + 4LL * (v62 ^ 0xDD)) ^ (v66
                                                                                   - ((2 * v66) & 0x922AF084)
                                                                                   - 921339838);
  uint64_t v70 = v56 ^ 0xD9u;
  uint64_t v71 = *(void *)(v39 + 8LL * (v41 - 938)) - 4LL;
  int v72 = v61 ^ *(_DWORD *)(v71 + 4 * v70) ^ 0xE6B6CF70 ^ (v62 - 991656982 + (~(2 * v62) | 0x7636F82B) + 1);
  unsigned int v244 = v61;
  unint64_t v245 = v59 & 0xFFFFFF00 | (unint64_t)v58;
  LODWORD(v62) = (v59 & 0xFFFFFF00 | v58) - 2 * ((v59 & 0x66B6CF00 | v58 & 0x77) ^ v58 & 7) - 424226960;
  unsigned int v242 = v65;
  unsigned int v243 = v63;
  int v241 = v62 ^ 0x2789BBD4 ^ v72;
  int v73 = v65 ^ 0x542A9C65 ^ v241;
  int v74 = *(_DWORD *)(v67 + 4LL * (((v73 ^ v63) >> 24) ^ 0xB3));
  HIDWORD(v45) = v74 ^ 1;
  LODWORD(v45) = v74 ^ 0xCD739308;
  int v75 = ((v45 >> 2) - ((2 * (v45 >> 2)) & 0x89C907D4) - 991656982) ^ *(_DWORD *)(v71
                                                                               + 4LL
                                                                               * ((v73 ^ v63) ^ 0xF3u));
  unsigned int v76 = (v73 ^ v63) >> 8;
  LODWORD(v70) = *(_DWORD *)(v64 + 4LL * (v76 ^ 0xA5u)) ^ *(_DWORD *)(v69
                                                                                     + 4LL
                                                                                     * ((BYTE2(v73) ^ BYTE2(v63)) ^ 0xA3u)) ^ ((v76 ^ 0x50) - 2 * ((v76 ^ 0xD98A50) & 0xEB ^ v76 & 9) + 2054054114) ^ (v75 - ((2 * v75) & 0x922AF084) - 921339838);
  int v77 = v70 - ((2 * v70) & 0xCD6D9EE0) - 424226960;
  LODWORD(v50) = v62 ^ 0x6BD7F604 ^ v77;
  int v239 = v73 ^ v63 ^ 0x5BE82BD3;
  int v240 = v73;
  int v78 = v50 ^ v73;
  LODWORD(v62) = *(_DWORD *)(v67 + 4LL * (((v78 ^ v239) >> 24) ^ 0x22));
  HIDWORD(v45) = v62 ^ 1;
  LODWORD(v45) = v62 ^ 0xCD739308;
  unsigned int v79 = v78 ^ v239 ^ 0x489B225D;
  LODWORD(v62) = *(_DWORD *)(v64 + 4LL * (BYTE1(v79) ^ 0xF5u)) ^ *(_DWORD *)(v69
                                                                           + 4LL
                                                                           * (((v78 ^ v239) >> 16) ^ 0xB2u)) ^ (BYTE1(v79) - ((v79 >> 7) & 0x1C4) + 2054054114) ^ ((v45 >> 2) - ((2 * (v45 >> 2)) & 0x922AF084) - 921339838);
  int v235 = v77 ^ v72;
  int v236 = v78 ^ v239;
  int v80 = v77 ^ v72 ^ *(_DWORD *)(v71 + 4LL * ((v78 ^ v239) ^ 0x18u)) ^ (v62
                                                                                      - ((2 * v62) & 0x89C907D4)
                                                                                      - 991656982);
  int v237 = v78;
  int v238 = v50;
  int v233 = ((v80 ^ 0x516EF336) - ((2 * (v80 ^ 0x516EF336)) & 0x3A617DCC) + 489733862) ^ v50;
  LODWORD(v50) = v233 ^ 0x8EDEEA78 ^ v78;
  int v81 = *(_DWORD *)(v67 + 4LL * (((v50 ^ v79) >> 24) ^ 0x2E));
  HIDWORD(v45) = v81 ^ 1;
  LODWORD(v45) = v81 ^ 0xCD739308;
  int v82 = (v45 >> 2) ^ *(_DWORD *)(v64 + 4LL * (((unsigned __int16)(v50 ^ v79) >> 8) ^ 0xB5u)) ^ ((((unsigned __int16)(v50 ^ v79) >> 8) ^ 0x40) - ((2 * (((v50 ^ v79) >> 8) ^ 0x449140)) & 0x1C4) + 2054054114);
  unsigned int v83 = (v82 - ((2 * v82) & 0x89C907D4) - 991656982) ^ *(_DWORD *)(v71 + 4LL * ((v50 ^ v79) ^ 0x84u));
  int v234 = v80;
  unsigned int v84 = v80 ^ *(_DWORD *)(v69 + 4LL * (((v50 ^ v79) >> 16) ^ 0xB8u)) ^ (v83 - ((2 * v83) & 0x922AF084) - 921339838);
  LODWORD(v231) = v84 ^ 0x4BE18321;
  HIDWORD(v231) = v50 ^ v79;
  int v232 = v50;
  HIDWORD(v230) = v84 ^ 0x4BE18321 ^ ((v233 ^ 0x8EDEEA78) - ((2 * (v233 ^ 0x8EDEEA78)) & 0x351EE02E) + 445607959);
  LODWORD(v230) = HIDWORD(v230) ^ 0x307C325C ^ v50 ^ 0x17EB9852;
  int v85 = *(_DWORD *)(v67 + 4LL * (((v230 ^ v50 ^ v79) >> 24) ^ 0xED));
  HIDWORD(v45) = v85 ^ 1;
  LODWORD(v45) = v85 ^ 0xCD739308;
  int v86 = ((v45 >> 2) - ((2 * (v45 >> 2)) & 0x89C907D4) - 991656982) ^ *(_DWORD *)(v71
                                                                               + 4LL
                                                                               * ((v230 ^ v50 ^ v79) ^ 0x7Du));
  HIDWORD(v229) = v230 ^ v50 ^ v79;
  unsigned int v87 = *(_DWORD *)(v64 + 4LL * (((unsigned __int16)(WORD2(v229) ^ 0x5938) >> 8) ^ 0xF5u)) ^ *(_DWORD *)(v69 + 4LL * (BYTE6(v229) ^ 0xD0u)) ^ v84 ^ (((unsigned __int16)(WORD2(v229) ^ 0x5938) >> 8) - (((HIDWORD(v229) ^ 0x87F95938) >> 7) & 0x1C4) + 2054054114) ^ (v86 - ((2 * v86) & 0x922AF084) - 921339838);
  int v88 = v87 ^ 0x6560CD8E;
  unsigned int v89 = v87 ^ v50 ^ 0x17EB9852;
  unsigned int v90 = v89 ^ HIDWORD(v229) ^ 0x87F95938;
  LODWORD(v50) = *(_DWORD *)(v67 + 4LL * (HIBYTE(v90) ^ 0x21));
  HIDWORD(v45) = v50 ^ 1;
  LODWORD(v45) = v50 ^ 0xCD739308;
  LODWORD(v50) = ((v45 >> 2) - ((2 * (v45 >> 2)) & 0x922AF084) - 921339838) ^ *(_DWORD *)(v69
                                                                                        + 4LL * (BYTE2(v90) ^ 0xCEu));
  LODWORD(v50) = (v50 - ((2 * v50) & 0x89C907D4) - 991656982) ^ *(_DWORD *)(v71
                                                                          + 4LL
                                                                          * ((v89 ^ BYTE4(v229) ^ 0x38) ^ 0xA7u));
  int v91 = ((unsigned __int16)(v90 ^ 0x48E2) >> 8);
  LODWORD(v50) = (v50 - ((2 * v50) & 0xF4DCC1C4) + 2054054114) ^ *(_DWORD *)(v64 + 4LL * (v91 ^ 0xF5u));
  LODWORD(v50) = v88 ^ v91 ^ (v50 - ((2 * v50) & 0x681C7D70) + 873348792);
  LODWORD(v229) = v88;
  int v92 = v88 ^ ((HIDWORD(v230) ^ 0x307C325C) - ((2 * (HIDWORD(v230) ^ 0x307C325C)) & 0x681C7D70) + 873348792);
  HIDWORD(v227) = v92;
  unint64_t v228 = __PAIR64__(v89, v90);
  LODWORD(v227) = v50 ^ 0xFE0643CE;
  unsigned int v93 = v50 ^ 0xFE0643CE ^ (v92 - ((2 * v92) & 0xFC0C879C) - 33143858);
  unsigned int v94 = v93 ^ 0xE6F58988 ^ v89;
  unsigned int v95 = v94 ^ v90 ^ 0x4BE748E2;
  LODWORD(v62) = *(_DWORD *)(v67 + 4LL * (HIBYTE(v95) ^ 0x12));
  HIDWORD(v45) = v62 ^ 1;
  LODWORD(v45) = v62 ^ 0xCD739308;
  unint64_t v226 = __PAIR64__(v93, v95);
  LODWORD(v62) = *(_DWORD *)(v64 + 4LL * (((unsigned __int16)(v95 ^ 0x8988) >> 8) ^ 0xF5u)) ^ *(_DWORD *)(v69 + 4LL * (BYTE2(v95) ^ 0xDCu)) ^ (((unsigned __int16)(v95 ^ 0x8988) >> 8) - (((v95 ^ 0x78F58988) >> 7) & 0x1C4) + 2054054114) ^ ((v45 >> 2) - ((2 * (v45 >> 2)) & 0x922AF084) - 921339838);
  int v96 = *(_DWORD *)(v71 + 4LL * ((v94 ^ v90 ^ 0xE2) ^ 0xCDu)) ^ v50 ^ 0xC07D8EAF ^ (v62 - ((2 * v62) & 0x89C907D4) - 991656982);
  HIDWORD(v224) = v96 ^ ((v93 ^ 0xE6F58988) - 2 * ((v93 ^ 0xE6F58988) & 0x407D8EBF ^ v93 & 0x10) - 1065513297);
  HIDWORD(v225) = v94 ^ 0x4B6DA635;
  int v97 = ((HIDWORD(v224) ^ 0x5BF36347) - ((2 * (HIDWORD(v224) ^ 0x5BF36347)) & 0x3406AA06) + 436425987) ^ v94 ^ 0x4B6DA635;
  unsigned int v98 = v97 ^ v95 ^ 0x78F58988;
  LODWORD(v62) = ((((unsigned __int16)(v97 ^ v95 ^ 0x8988) >> 8) ^ 0xBB)
                - ((2 * ((v98 >> 8) ^ 0x1A89BB)) & 0x1C4)
                + 2054054114) ^ *(_DWORD *)(v64
                                          + 4LL
                                          * (((unsigned __int16)(v97 ^ v95 ^ 0x8988) >> 8) ^ 0x4Eu));
  LODWORD(v62) = (v62 - ((2 * v62) & 0x89C907D4) - 991656982) ^ *(_DWORD *)(v71
                                                                          + 4LL
                                                                          * ((v97 ^ v95 ^ 0x88) ^ 0x91u));
  int v99 = *(_DWORD *)(v67 + 4LL * (HIBYTE(v98) ^ 0x70));
  HIDWORD(v45) = v99 ^ 1;
  LODWORD(v45) = v99 ^ 0xCD739308;
  LODWORD(v62) = (v45 >> 2) ^ *(_DWORD *)(v69 + 4LL * (BYTE2(v98) ^ 0xA0u)) ^ (v62 - ((2 * v62) & 0x922AF084) - 921339838);
  LODWORD(v225) = v96;
  LODWORD(v223) = (v62 - ((2 * v62) & 0x80FB1D5E) - 1065513297) ^ v96;
  HIDWORD(v223) = v98;
  HIDWORD(v222) = v223 ^ 0x930000ED ^ HIDWORD(v224) ^ 0x5BF36347;
  unsigned int v100 = 2 * (HIDWORD(v222) ^ 0x8D06EA22);
  LODWORD(v222) = v97 ^ 0x8EEEB96E ^ ((HIDWORD(v222) ^ 0x8D06EA22) - (v100 & 0x5356D322) - 1448384111);
  unsigned int v101 = v222 ^ v98;
  int v102 = *(_DWORD *)(v67 + 4LL * (HIBYTE(v101) ^ 0x23));
  HIDWORD(v45) = v102 ^ 1;
  LODWORD(v45) = v102 ^ 0xCD739308;
  int v103 = ((unsigned __int16)(v101 ^ 0x1195) >> 8);
  int v104 = *(_DWORD *)(v71 + 4LL * (v101 ^ 0xD0u)) ^ *(_DWORD *)(v64 + 4LL * (v103 ^ 0xF5u)) ^ 0xBE8AE308 ^ (v45 >> 2);
  HIDWORD(v221) = v101;
  int v105 = (v104 - ((2 * v104) & 0x922AF084) - 921339838) ^ *(_DWORD *)(v69 + 4LL * (BYTE2(v101) ^ 0x7Eu)) ^ v223 ^ 0x930000ED ^ v103;
  LODWORD(v50) = (HIDWORD(v222) ^ 0x8D06EA22) - (v100 & 0xA3473AA4);
  LODWORD(v224) = v97;
  unsigned int v106 = v105 ^ v97 ^ v101 ^ 0x49571195;
  LODWORD(v221) = v106 ^ 0x2C134D0E;
  LODWORD(v67) = *(_DWORD *)(v67 + 4LL * (HIBYTE(v106) ^ 0x63));
  HIDWORD(v45) = v67 ^ 1;
  LODWORD(v45) = v67 ^ 0xCD739308;
  LODWORD(v64) = *(_DWORD *)(v64 + 4LL * (((unsigned __int16)(v106 ^ 0xD0FF) >> 8) ^ 0xFDu)) ^ *(_DWORD *)(v71 + 4LL * (~(_BYTE)v106 ^ 0xC4u)) ^ ((((unsigned __int16)(v106 ^ 0xD0FF) >> 8) ^ 8) - (((v106 ^ 0x2745D0FF) >> 7) & 0x1C4) + 2054054114) ^ ((v45 >> 2) - ((2 * (v45 >> 2)) & 0x89C907D4) - 991656982);
  LODWORD(v64) = (v64 - ((2 * v64) & 0x922AF084) - 921339838) ^ *(_DWORD *)(v69
                                                                          + 4LL
                                                                          * (((v106 ^ 0x2745D0FF) >> 16) ^ 0x16u));
  LODWORD(v64) = v64 - ((2 * v64) & 0xA3473AA4);
  LODWORD(v69) = v105 ^ v97 ^ 0x452FF2BF;
  int v107 = (char *)*(&off_10005BF10 + (v41 ^ 0x3A3)) - 12;
  int v108 = (char *)*(&off_10005BF10 + (v41 ^ 0x332)) - 12;
  int v109 = v108[*(unsigned __int8 *)(v40 - 109) ^ 0xA5LL];
  HIDWORD(v45) = v109 ^ 0x19;
  LODWORD(v45) = (v109 ^ 0x40) << 24;
  unint64_t v110 = (char *)*(&off_10005BF10 + v41 - 787) - 8;
  uint64_t v111 = (char *)*(&off_10005BF10 + (v41 ^ 0x3C9)) - 4;
  v219 = v108;
  v220 = v107;
  v218 = v111;
  unsigned int v112 = (((((v45 >> 30) ^ 0xDB) >> 2) | (((v45 >> 30) ^ 0xDB) << 6)) | ((v110[*(unsigned __int8 *)(v40 - 111) ^ 0x7ALL] ^ 0x5F) << 16) | ((v111[*(unsigned __int8 *)(v40 - 112) ^ 0x78LL] ^ 0xB7) << 24) | (((v107[*(unsigned __int8 *)(v40 - 110) ^ 0x5DLL] + (*(_BYTE *)(v40 - 110) ^ 0x52) - 98) ^ 0x5D) << 8)) ^ 0x9284BBFE;
  unsigned int v113 = ((v108[*(unsigned __int8 *)(v40 - 101) ^ 0x60LL] ^ 0x92) & 0xFFFF00FF | ((v110[*(unsigned __int8 *)(v40 - 103) ^ 5LL] ^ 0xE) << 16) | (((v107[*(unsigned __int8 *)(v40 - 102) ^ 4LL] + (*(_BYTE *)(v40 - 102) ^ 0xB) - 98) ^ 0x33) << 8) | ((v111[*(unsigned __int8 *)(v40 - 104) ^ 0x1CLL] ^ 0x42) << 24)) ^ 0x6E5B0C4C;
  unsigned int v114 = ((v108[*(unsigned __int8 *)(v40 - 105) ^ 0x28LL] ^ 0x53) & 0xFFFF00FF | ((((*(_BYTE *)(v40 - 106) ^ 0xAC) + v107[*(unsigned __int8 *)(v40 - 106) ^ 0xA3LL] - 98) ^ 0xF6) << 8) | ((v111[*(unsigned __int8 *)(v40 - 108) ^ 0xB2LL] ^ 0xB5) << 24) | ((v110[*(unsigned __int8 *)(v40 - 107) ^ 0x27LL] ^ 0x6A) << 16)) ^ 0x204702B5;
  unsigned int v115 = ((v108[*(unsigned __int8 *)(v40 - 97) ^ 0x7BLL] ^ 0x26) & 0xFFFF00FF | ((((*(_BYTE *)(v40 - 98) ^ 0xD0) + v107[*(unsigned __int8 *)(v40 - 98) ^ 0xDFLL] - 98) ^ 0xE4) << 8) | ((v110[*(unsigned __int8 *)(v40 - 99) ^ 0xAALL] ^ 0x3C) << 16) | ((v111[*(unsigned __int8 *)(v40 - 100) ^ 0x45LL] ^ 0x8D) << 24)) ^ 0xCF0750B1;
  HIDWORD(v217) = *(_DWORD *)(v40 - 128) + 1158807576;
  LODWORD(v216) = v44 ^ 0x72A;
  HIDWORD(v215) = v44 ^ 0x707;
  LODWORD(v215) = v105 ^ 0x51A39D52 ^ (v50 + 1369677138);
  LODWORD(v217) = v105 ^ 0x51A39D52;
  LODWORD(v214) = (v64 + 1369677138) ^ v105 ^ 0x51A39D52;
  HIDWORD(v214) = v44 ^ 0x79E;
  *(_DWORD *)(v40 - 120) = v44;
  HIDWORD(v213) = v44 ^ 0x7B3;
  HIDWORD(a15) = v69;
  HIDWORD(v216) = (v50 + 1369677138) ^ 0x3DC8BA5D ^ (v64 + 1369677138);
  LODWORD(v213) = HIDWORD(v216) ^ v69;
  int v116 = *(_DWORD *)(v40 - 120);
  *(void *)(v40 - 200) = 7LL;
  uint64_t v117 = a1[7];
  *(void *)(v40 - 152) = 12LL;
  LODWORD(v62) = v108[v117 ^ 0x41];
  LOBYTE(v117) = a1[12];
  *(_DWORD *)(v40 - 256) = v116 ^ 0x789;
  *(void *)(v40 - 160) = 8LL;
  LODWORD(v117) = v111[(v117 ^ ((v116 ^ 0x89) - 61))];
  *(void *)(v40 - 128) = 1LL;
  LODWORD(v70) = v117 ^ 0x36;
  int v118 = v111[a1[8] ^ 0xC1LL] ^ 0x82;
  LODWORD(v117) = v110[a1[1] ^ 0x66LL] ^ 0xB3;
  *(void *)(v40 - 136) = 15LL;
  LODWORD(v71) = (_DWORD)v117 << 16;
  uint64_t v119 = a1[15] ^ 0xE9LL;
  *(void *)(v40 - 168) = 11LL;
  LODWORD(v119) = v108[v119] ^ 0x84;
  int v120 = v108[a1[11] ^ 0xC3LL];
  *(void *)(v40 - 176) = 0LL;
  int v121 = v71 | ((v111[*a1 ^ 0x30LL] ^ 6) << 24);
  v120 ^= 0x4Eu;
  int v122 = v120 | (v118 << 24);
  *(void *)(v40 - 144) = 2LL;
  unsigned int v123 = v121 & 0xFFFF00FF | (((v220[a1[2] ^ 0xC0LL] + (a1[2] ^ 0xCF) - 98) ^ 0xF9) << 8);
  *(void *)(v40 - 208) = 4LL;
  int v124 = v62 ^ 0x54 | ((v111[a1[4] ^ 0xFCLL] ^ 0xB8) << 24);
  *(void *)(v40 - 216) = 9LL;
  int v125 = (v110[a1[9] ^ 0x5DLL] ^ 0x60) << 16;
  *(void *)(v40 - 192) = 10LL;
  unsigned int v126 = v125 & 0xFFFF00FF | (((v220[a1[10] ^ 0xD5LL] + (a1[10] ^ 0xDA) - 98) ^ 0xCF) << 8) | v122;
  *(void *)(v40 - 184) = 14LL;
  int v127 = (v220[a1[14] ^ 0xE4LL] + (a1[14] ^ 0xEB) + 30) << 8;
  *(void *)(v40 - 240) = 13LL;
  LODWORD(v50) = v127 | ((v110[a1[13] ^ 0x92LL] ^ 0x5D) << 16);
  int v128 = v108[a1[3] ^ 0xDCLL];
  *(void *)(v40 - 232) = 5LL;
  *(void *)(v40 - 224) = 3LL;
  *(void *)(v40 - 248) = 6LL;
  unsigned int v129 = v126 - 2 * (v126 & 0x57E2B5FF ^ v120 & 0xA);
  int v130 = ((v110[a1[5] ^ 0xA9LL] ^ 0x8E) << 16) | (((v220[a1[6] ^ 0x4FLL]
                                                                                    + (a1[6] ^ 0x40)
                                                                                    - 98) ^ 0xB7) << 8) | v124;
  unsigned int v131 = v112 ^ v244 ^ ((v128 ^ 0x90 | v123) + 725418695 - 2
                                                         * ((v128 ^ 0x90 | v123) & 0x2B3D02D7 ^ (v128 ^ 0x90) & 0x10));
  unsigned int v132 = v114 ^ v245 ^ (v130 - 2 * (v130 & 0x19FEBB2C ^ (v62 ^ 0x54) & 0x20) - 1711359220);
  LODWORD(v119) = ((v50 | v119 | ((_DWORD)v70 << 24))
                 + 1992222984
                 - 2 * ((v50 | v119 | ((_DWORD)v70 << 24)) & 0x76BEE91B ^ v119 & 0x13)) ^ v115;
  unsigned int v133 = (v119 - ((2 * v119) & 0x8C0C4F5C) - 972675154) ^ v243;
  unsigned int v134 = v113 ^ v242 ^ (v129 - 673008139);
  LODWORD(v50) = (v112 ^ v244 ^ ((v128 ^ 0x90 | v123)
                                                - 57
                                                - 2 * ((v128 ^ 0x90 | v123) & 0xD7 ^ (v128 ^ 0x90) & 0x10)));
  v135 = (char *)*(&off_10005BF10 + (int)(v44 ^ 0x72A)) - 12;
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v134) ^ 0x3F)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  v136 = (char *)*(&off_10005BF10 + v116 - 1664) - 8;
  LODWORD(v62) = (v45 >> 1) ^ ((BYTE2(v133) ^ 0x68) + 1253999516 - ((2 * (HIWORD(v133) ^ 0xB768)) & 0x138)) ^ *(_DWORD *)&v136[4 * (BYTE2(v133) ^ 0x34)];
  v137 = (char *)*(&off_10005BF10 + v116 - 1765) - 12;
  LODWORD(v71) = *(_DWORD *)&v137[4 * (v134 ^ 0xC6)] ^ ((BYTE2(v131) ^ 0xD5)
                                                                       + 1253999516
                                                                       - 2
                                                                       * ((HIWORD(v131) ^ 0x6CD5) & 0xBC ^ HIWORD(v131) & 0x20)) ^ *(_DWORD *)&v136[4 * (BYTE2(v131) ^ 0x89)] ^ ((v134 ^ 0xAB) + 1579265309 + ((2 * (v134 ^ 0xAB) + 254) & 0x13A ^ 0xFDFA7BFF));
  unsigned int v138 = *(_DWORD *)&v136[4 * (BYTE2(v132) ^ 0x8C)] ^ ((BYTE2(v132) ^ 0xD0)
                                                     + 1253999516
                                                     - 2 * ((HIWORD(v132) ^ 0xC8D0) & 0x9F ^ HIWORD(v132) & 3)) ^ *(_DWORD *)&v137[4 * (v133 ^ 0xB6)] ^ ((v133 ^ 0xDB) + 1579265309 + ((2 * (v133 ^ 0xDB) + 254) & 0x13A ^ 0xFDFA7BFF));
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v132) ^ 0xC8)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  int v139 = v71 + 414903272 - ((2 * v71) & 0x3175D7D0);
  v140 = (char *)*(&off_10005BF10 + (int)(v44 ^ 0x707)) - 12;
  int v141 = v139 ^ *(_DWORD *)&v140[4 * (BYTE1(v132) ^ 0x2F)];
  LODWORD(v50) = ((BYTE2(v134) ^ 0xAD) + 1253999516 - ((2 * (HIWORD(v134) ^ 0x3FAD)) & 0x138)) ^ *(_DWORD *)&v137[4 * (v50 ^ 0x1C)] ^ ((v50 ^ 0x71) + 1579265309 + ((2 * (v50 ^ 0x71) + 254) & 0x13A ^ 0xFDFA7BFF)) ^ (v45 >> 1);
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v131) ^ 0x6C)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  LODWORD(v50) = v50 ^ *(_DWORD *)&v136[4 * (BYTE2(v134) ^ 0xF1)];
  LODWORD(v70) = (v45 >> 1) ^ *(_DWORD *)&v140[4 * (BYTE1(v134) ^ 0x29)] ^ (v138 + 414903272 - ((2 * v138) & 0x3175D7D0));
  int v142 = v132;
  unsigned int v143 = (v132 ^ 0x10) + 1579265309 + ((2 * (v132 ^ 0x10) + 254) & 0x13A ^ 0xFDFA7BFF);
  int v144 = *(_DWORD *)&v140[4 * (BYTE1(v131) ^ 0xDE)];
  int v145 = *(_DWORD *)&v140[4 * (BYTE1(v133) ^ 0x66)];
  LODWORD(v62) = *(_DWORD *)&v137[4 * (v142 ^ 0x7D)] ^ v144 ^ v143 ^ (v62 + 414903272 - ((2 * v62) & 0x3175D7D0));
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v133) ^ 0xB7)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  LODWORD(v62) = v62 + 1412078693 + (~(2 * v62) | 0x57AAC6F9) + 31;
  unsigned int v146 = v62 ^ v240;
  int v147 = (v141 ^ (v45 >> 1)) - ((2 * (v141 ^ (v45 >> 1))) & 0x4C4F6CA);
  unsigned int v148 = v145 ^ v241 ^ (v50 + 414903272 - ((2 * v50) & 0x3175D7D0));
  HIDWORD(v45) = *(_DWORD *)&v135[4 * ((v62 ^ ~v240) >> 24)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  int v149 = v45 >> 1;
  LODWORD(v50) = (v70 - 424226960 - ((2 * v70) & 0xCD6D9EE0)) ^ v72;
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (BYTE3(v50) ^ 0x91)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  LODWORD(v70) = v45 >> 1;
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v148) ^ 0xA3)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  LODWORD(v70) = v70 ^ *(_DWORD *)&v136[4 * (BYTE2(v148) ^ 0xF0)] ^ ((BYTE2(v148) ^ 0xAC)
                                                                   + 1253999516
                                                                   - ((2 * (HIWORD(v148) ^ 0xA3AC)) & 0x138));
  LODWORD(v64) = (v45 >> 1) ^ *(_DWORD *)&v137[4 * (v50 ^ 0x7B)] ^ ((BYTE2(v146) ^ 0x49)
                                                                                   + 1253999516
                                                                                   - ((2 * (HIWORD(v146) ^ 0xFF49)) & 0x138)) ^ ((v50 ^ 0x16) + 1579265309 + ((2 * (v50 ^ 0x16) + 254) & 0x13A ^ 0xFDFA7BFF)) ^ *(_DWORD *)&v136[4 * (BYTE2(v146) ^ 0x15)];
  unsigned int v150 = (v147 - 2107475099) ^ v239;
  int v151 = (v64 + 414903272 - ((2 * v64) & 0x3175D7D0)) ^ *(_DWORD *)&v140[4
                                                                       * (((unsigned __int16)((v147 + 31589) ^ v239) >> 8) ^ 0x70)];
  LODWORD(v70) = (v70 + 414903272 - ((2 * v70) & 0x3175D7D0)) ^ *(_DWORD *)&v140[4
                                                                               * (((unsigned __int16)(v62 ^ v240) >> 8) ^ 0x2C)];
  LODWORD(v62) = v149 ^ *(_DWORD *)&v137[4 * (v148 ^ 3)] ^ ((v148 ^ 0x6E)
                                                                           + 1579265308
  LODWORD(v64) = ((BYTE2(v50) ^ 0x72) + 1253999516 - ((2 * (WORD1(v50) ^ 0x9172)) & 0x138)) ^ *(_DWORD *)&v136[4 * (BYTE2(v50) ^ 0x2E)];
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v150) ^ 0x25)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  int v152 = *(_DWORD *)&v140[4 * (BYTE1(v50) ^ 0x57)];
  LODWORD(v64) = ((v146 ^ 0xFC)
                + 1579265308
                - ((2 * (v146 ^ 0xFC) + 37586174) & 0x205853A)) ^ *(_DWORD *)&v140[4 * (BYTE1(v148) ^ 0xBD)] ^ *(_DWORD *)&v137[4 * (v146 ^ 0x91)] ^ (v45 >> 1) ^ (v64 + 414903272 - ((2 * v64) & 0x3175D7D0));
  LODWORD(v50) = ((v150 ^ 0xD6) - 1726037377) ^ v235 ^ *(_DWORD *)&v137[4
                                                                                       * (v150 ^ 0xBB)] ^ (v70 - 989664611 - ((2 * v70) & 0x8A05D53A));
  unsigned int v153 = v152 ^ v237 ^ (v62 + 414903272 - ((2 * v62) & 0x3175D7D0));
  unsigned int v154 = (v64 - ((2 * v64) & 0x96F0B200) - 881305344) ^ v236;
  unsigned int v155 = (v151 + 489733862 - ((2 * v151) & 0x3A617DCC)) ^ v238;
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v154) ^ 0xA6)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  LODWORD(v70) = ((v151 - 26 - ((2 * v151) & 0xCC)) ^ v238);
  LODWORD(v70) = ((v70 ^ 0xA1) + 1579265309 + ((2 * (v70 ^ 0xA1) + 254) & 0x13A ^ 0xFDFA7BFF)) ^ *(_DWORD *)&v137[4 * (v70 ^ 0xCC)];
  LODWORD(v62) = *(_DWORD *)&v136[4 * (BYTE2(v50) ^ 0xDB)] ^ ((BYTE2(v50) ^ 0x87)
                                                            + 1253999516
                                                            - ((2 * (WORD1(v50) ^ 0x3A87)) & 0x138)) ^ (v45 >> 1);
  LODWORD(v70) = (v70 + 414903272 - ((2 * v70) & 0x3175D7D0)) ^ *(_DWORD *)&v140[4 * (BYTE1(v50) ^ 0xDE)];
  LODWORD(v64) = ((v50 ^ 0x9E)
                + 1579265309
                + ((2 * (v50 ^ 0x9E) + 254) & 0x13A ^ 0xFDFA7BFF)) ^ *(_DWORD *)&v137[4 * (v50 ^ 0xF3)];
  int v156 = v64 + 414903272 - ((2 * v64) & 0x3175D7D0);
  LODWORD(v62) = (v62 + 414903272 - ((2 * v62) & 0x3175D7D0)) ^ *(_DWORD *)&v140[4 * (BYTE1(v155) ^ 0x57)];
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v153) ^ 0x7E)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  LODWORD(v64) = *(_DWORD *)&v136[4 * (BYTE2(v154) ^ 0x20)] ^ BYTE2(v154) ^ (v45 >> 1);
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (BYTE3(v50) ^ 0x3A)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  LODWORD(v50) = *(_DWORD *)&v136[4 * (BYTE2(v155) ^ 0xF6)] ^ *(_DWORD *)&v140[4 * (BYTE1(v153) ^ 0x9E)] ^ BYTE2(v155) ^ (v45 >> 1);
  unsigned int v157 = ((v154 ^ 0x8B) - 1726037377) ^ v234 ^ *(_DWORD *)&v137[4 * (v154 ^ 0xE6)] ^ ((v50 ^ 0x520468DE) - 989664611 + ((2 * ((v50 ^ 0x520468DE) & 0x4502EA9F ^ v50 & 2)) ^ 0xFFFFFFFB) + 1);
  LODWORD(v50) = *(_DWORD *)&v137[4 * (v153 ^ 0x32)] ^ ((v153 ^ 0x5F) - 1726037377) ^ (v62 - 989664611 - ((2 * v62) & 0x8A05D53A));
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v155) ^ 0x7C)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  LODWORD(v70) = v64 ^ (v70 + 1253999516 - ((2 * v70) & 0x957D0738)) ^ 0x7C;
  LODWORD(v64) = *(_DWORD *)&v140[4 * (BYTE1(v154) ^ 0xB)];
  unsigned int v158 = (v50 - ((2 * v50) & 0x593A9A36) + 748506395) ^ HIDWORD(v231);
  unsigned int v159 = (v70 - ((2 * v70) & 0x783AB08E) + 1008556103) ^ v232;
  unsigned int v160 = v64 ^ v233 ^ ((BYTE2(v153) ^ 0x16) + 1253999516 - ((2 * (HIWORD(v153) ^ 0x3D16)) & 0x138)) ^ *(_DWORD *)&v136[4 * (BYTE2(v153) ^ 0x4A)] ^ v156 ^ (v45 >> 1);
  LODWORD(v62) = ((v70 - ((2 * v70) & 0x8E) + 71) ^ v232);
  LODWORD(v62) = ((v62 ^ 0xE1) + 1579265309 + ((2 * (v62 ^ 0xE1) + 254) & 0x13A ^ 0xFDFA7BFF)) ^ *(_DWORD *)&v137[4 * (v62 ^ 0x8C)];
  LODWORD(v50) = v62 + 414903272 - ((2 * v62) & 0x3175D7D0);
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v157) ^ 0x2D)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  LODWORD(v62) = (v45 >> 1) ^ ((v158 ^ 0xC)
                             + 1579265308
                             - ((2 * (v158 ^ 0xC) + 37586174) & 0x205853A)) ^ *(_DWORD *)&v137[4 * (v158 ^ 0x61)];
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v158) ^ 0x4D)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  int v161 = v45 >> 1;
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v159) ^ 0xCC)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  LODWORD(v70) = v45 >> 1;
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v160) ^ 0xB4)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  LODWORD(v70) = v70 ^ *(_DWORD *)&v137[4 * (v160 ^ 0x8B)] ^ ((v160 ^ 0xE6)
                                                                             + 1579265308
  LODWORD(v62) = ((BYTE2(v160) ^ 0x59) + 1253999516 - ((2 * (HIWORD(v160) ^ 0xB459)) & 0x138)) ^ *(_DWORD *)&v136[4 * (BYTE2(v160) ^ 5)] ^ *(_DWORD *)&v140[4 * (BYTE1(v159) ^ 0xDF)] ^ (v62 + 414903272 - ((2 * v62) & 0x3175D7D0));
  unsigned int v162 = ((BYTE2(v158) ^ 0x93) + 1253999516 - ((2 * (HIWORD(v158) ^ 0x4D93)) & 0x138)) ^ v230 ^ *(_DWORD *)&v140[4 * (BYTE1(v157) ^ 0x57)] ^ *(_DWORD *)&v136[4 * (BYTE2(v158) ^ 0xCF)] ^ (v70 + 414903272 - ((2 * v70) & 0x3175D7D0));
  int v163 = *(_DWORD *)&v140[4 * (BYTE1(v160) ^ 0x34)];
  unsigned int v164 = *(_DWORD *)&v140[4 * (BYTE1(v158) ^ 0x7D)] ^ HIDWORD(v230) ^ ((v45 >> 1)
                                                                     + 414903272
                                                                     - ((2 * (v45 >> 1)) & 0x3175D7D0)) ^ *(_DWORD *)&v137[4 * (v157 ^ 0x7B)] ^ *(_DWORD *)&v136[4 * (BYTE2(v159) ^ 0x3F)] ^ ((v157 ^ 0x16) + 1579265309 + ((2 * (v157 ^ 0x16) + 254) & 0x13A ^ 0xFDFA7BFF)) ^ ((BYTE2(v159) ^ 0x63) + 1253999516 - ((v159 >> 15) & 0x138));
  unsigned int v165 = (v62 + 445607959 - ((2 * v62) & 0x351EE02E)) ^ v231;
  unsigned int v166 = v163 ^ HIDWORD(v229) ^ *(_DWORD *)&v136[4 * (BYTE2(v157) ^ 0x2E)] ^ ((BYTE2(v157) ^ 0x72)
                                                                            + 1253999516
                                                                            - ((2 * (HIWORD(v157) ^ 0x2D72)) & 0x138)) ^ v161 ^ v50;
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v166) ^ 0xA2)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  *(_DWORD *)(v40 - 252) = 414903273;
  int v167 = (v45 >> 1) + 414903273 + ~((2 * (v45 >> 1)) & 0x3175D7D0);
  LODWORD(v62) = ((BYTE2(v164) ^ 0x81) + 1253999516 - ((2 * (HIWORD(v164) ^ 0x1481)) & 0x138)) ^ *(_DWORD *)&v136[4 * (BYTE2(v164) ^ 0xDD)];
  int v168 = ((v164 ^ 0x51) + 1579265308 - ((2 * (v164 ^ 0x51) + 37586174) & 0x205853A)) ^ *(_DWORD *)&v137[4 * (v164 ^ 0x3C)];
  int v169 = *(_DWORD *)&v136[4 * (BYTE2(v162) ^ 0xDB)] ^ ((BYTE2(v162) ^ 0x87)
                                                     + 1253999516
                                                     - ((2 * (HIWORD(v162) ^ 0x7787)) & 0x138));
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v164) ^ 0x14)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  LODWORD(v69) = v45 >> 1;
  LODWORD(v70) = ((v166 ^ 0xE166CBEE) >> 16) ^ *(_DWORD *)&v136[4
                                                                               * (((v166 ^ 0xE166CBEE) >> 16) ^ 0x5C)] ^ (v168 + 1253999516 - ((2 * v168) & 0x957D0738));
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v165) ^ 0x9A)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  LODWORD(v62) = *(_DWORD *)&v137[4 * (v166 ^ 0x83)] ^ *(_DWORD *)&v140[4 * (BYTE1(v162) ^ 0xDE)] ^ (v62 + 414903272 - ((2 * v62) & 0x3175D7D0)) ^ ((v166 ^ 0xEE) + 1579265309 + ((2 * (v166 ^ 0xE166CBEE) + 254) & 0x13A ^ 0xFDFA7BFF)) ^ (v45 >> 1);
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v162) ^ 0x77)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  LODWORD(v70) = (v45 >> 1) ^ *(_DWORD *)&v140[4 * (BYTE1(v165) ^ 0x2D)] ^ (v70 + 414903272 - ((2 * v70) & 0x3175D7D0));
  unsigned int v170 = *(_DWORD *)&v140[4 * (BYTE1(v164) ^ 0x34)] ^ v228 ^ *(_DWORD *)&v136[4 * (BYTE2(v165) ^ 0xB5)] ^ v167 ^ ((v162 ^ 0x9E) + 1579265309 + ((2 * (v162 ^ 0x9E) + 254) & 0x13A ^ 0xFDFA7BFF)) ^ ((BYTE2(v165) ^ 0xE9) + 1253999516 - ((2 * (HIWORD(v165) ^ 0x9AE9)) & 0x138)) ^ *(_DWORD *)&v137[4 * (v162 ^ 0xF3)];
  unsigned int v171 = *(_DWORD *)&v140[4 * (BYTE1(v166) ^ 0x29)] ^ HIDWORD(v227) ^ ((v165 ^ 0xA8)
                                                                     + 1579265308
                                                                     - ((2 * (v165 ^ 0xA8) + 37586174) & 0x205853A)) ^ v69 ^ *(_DWORD *)&v137[4 * (v165 ^ 0xC5)] ^ (v169 + 414903272 - ((2 * v169) & 0x3175D7D0));
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v171) ^ 0x6D)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  int v172 = v45 >> 1;
  LODWORD(v50) = (v62 + 873348792 - ((2 * v62) & 0x681C7D70)) ^ v88;
  unsigned int v173 = *(_DWORD *)&v135[4 * (BYTE3(v50) ^ 0xFD)];
  LODWORD(v62) = *(_DWORD *)&v136[4 * (BYTE2(v171) ^ 0x52)] ^ (v173 << 31) ^ (v173 >> 1) ^ ((BYTE2(v171) ^ 0xE)
                                                                                          + 1253999516
                                                                                          - 2
                                                                                          * ((HIWORD(v171) ^ 0x2E0E) & 0x9D ^ HIWORD(v171) & 1));
  LODWORD(v64) = ((v171 ^ 0x4A)
                + 1579265308
                - ((2 * (v171 ^ 0x4A) + 37586174) & 0x205853A)) ^ *(_DWORD *)&v137[4 * (v171 ^ 0x27)];
  LODWORD(v70) = (v70 - ((2 * v70) & 0x975A2B64) - 877849166) ^ HIDWORD(v228);
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (BYTE3(v70) ^ 0x34)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  LODWORD(v64) = (v45 >> 1) ^ *(_DWORD *)&v140[4 * (BYTE1(v50) ^ 0xA4)] ^ (v64 + 414903272 - ((2 * v64) & 0x3175D7D0));
  int v174 = *(_DWORD *)&v136[4 * (BYTE2(v170) ^ 0x24)] ^ BYTE2(v170) ^ (v64 + 1253999516 - ((2 * v64) & 0x957D0738));
  LODWORD(v64) = *(_DWORD *)&v136[4 * (BYTE2(v70) ^ 0xF9)] ^ v172 ^ *(_DWORD *)&v137[4 * (v50 ^ 0x4D)] ^ ((v50 ^ 0x20) + 1579265309 + ((2 * (v50 ^ 0x20) + 254) & 0x13A ^ 0xFDFA7BFF)) ^ ((BYTE2(v70) ^ 0xA5) + 1253999516 - ((2 * (WORD1(v70) ^ 0x34A5)) & 0x138));
  int v175 = v64 + 414903272 - ((2 * v64) & 0x3175D7D0);
  LODWORD(v62) = ((v170 ^ 0x34)
                + 1579265308
                - ((2 * (v170 ^ 0x34) + 37586174) & 0x205853A)) ^ *(_DWORD *)&v137[4 * (v170 ^ 0x59)] ^ *(_DWORD *)&v140[4 * (BYTE1(v70) ^ 0x9A)] ^ ((v62 ^ 0x7DC97C7A) + 414903272 - 2 * ((v62 ^ 0x7DC97C7A) & 0x18BAEBED ^ v62 & 5));
  LODWORD(v70) = v70;
  LODWORD(v64) = ((v70 ^ 0x37) - 1311134104 + ((2 * (v70 ^ 0x37) + 254) & 0x3D0 ^ 0xCFCA7BFF)) ^ *(_DWORD *)&v140[4 * (BYTE1(v171) ^ 0x65)];
  LODWORD(v70) = (v64 - 989664611 - ((2 * v64) & 0x8A05D53A)) ^ *(_DWORD *)&v137[4 * (v70 ^ 0x5A)];
  LODWORD(v50) = *(_DWORD *)&v136[4 * (BYTE2(v50) ^ 0x40)] ^ ((BYTE2(v50) ^ 0x1C)
                                                            + 1253999516
                                                            - 2 * ((WORD1(v50) ^ 0xFD1C) & 0x9E ^ WORD1(v50) & 2));
  LODWORD(v64) = v50 ^ 0x8DA9005A ^ (v70 - 827053943 - ((2 * v70) & 0x9D685112));
  LODWORD(v70) = v70 ^ 0x6500C283;
  LODWORD(v64) = (v70 + v64 + 1) ^ ((v50 ^ 0x261DEA50) + 1);
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v170) ^ 0x6E)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  unsigned int v176 = ((v174 ^ 0x78) + 436425987 - ((2 * v174) & 0x3406AA06)) ^ HIDWORD(v225);
  LODWORD(v50) = ((v50 ^ 0x17563D26 ^ (v64 - 827053943 - ((2 * v64) & 0x9D685112))) + v70) ^ (v45 >> 1);
  int v177 = v50 - ((2 * v50) & 0x343F30D4);
  unsigned int v178 = *(_DWORD *)&v140[4 * (BYTE1(v170) ^ 0x38)] ^ HIDWORD(v226) ^ v175;
  unsigned int v179 = (v62 - 33143858 - ((2 * v62) & 0xFC0C879C)) ^ v227;
  LODWORD(v50) = ((BYTE2(v179) ^ 0xE9) + 1253999516 - 2 * ((HIWORD(v179) ^ 0xB8E9) & 0x9E ^ HIWORD(v179) & 2)) ^ *(_DWORD *)&v136[4 * (BYTE2(v179) ^ 0xB5)];
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v176) ^ 0x9D)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  LODWORD(v69) = v45 >> 1;
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v178) ^ 0x61)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  LODWORD(v62) = *(_DWORD *)&v137[4 * (v179 ^ 0xC5)] ^ *(_DWORD *)&v136[4 * (BYTE2(v176) ^ 0x28)] ^ (v45 >> 1) ^ ((v179 ^ 0xA8) + 1579265309 + ((2 * (v179 ^ 0xA8) + 254) & 0x13A ^ 0xFDFA7BFF)) ^ ((BYTE2(v176) ^ 0x74) + 1253999516 - 2 * ((HIWORD(v176) ^ 0x9D74) & 0x9D ^ HIWORD(v176) & 1));
  LODWORD(v70) = (v177 - 1709205398) ^ v226;
  LODWORD(v64) = v69 ^ ((BYTE2(v70) ^ 0x97) + 1253999516 - ((2 * (WORD1(v70) ^ 0x7B97)) & 0x138)) ^ *(_DWORD *)&v136[4 * (BYTE2(v70) ^ 0xCB)];
  LODWORD(v69) = ((v177 + 106) ^ v226);
  int v180 = (v69 ^ 0x18) + 1579265309 + ((2 * (v69 ^ 0x18) + 254) & 0x13A ^ 0xFDFA7BFF);
  LODWORD(v108) = (v178 ^ 0x85)
                + 1579265308
                - ((2 * (v178 ^ 0x85) + 37586174) & 0x205853A);
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v179) ^ 0xB8)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  int v181 = *(_DWORD *)&v137[4 * (v69 ^ 0x75)] ^ *(_DWORD *)&v136[4 * (BYTE2(v178) ^ 0x54)] ^ ((BYTE2(v178) ^ 8) + 1253999516 - 2 * ((HIWORD(v178) ^ 0x6108) & 0x9F ^ HIWORD(v178) & 3)) ^ (v45 >> 1);
  unsigned int v182 = *(_DWORD *)&v140[4 * (BYTE1(v70) ^ 0xB6)] ^ HIDWORD(v224) ^ (v62 + 414903272 - ((2 * v62) & 0x3175D7D0));
  LODWORD(v62) = ((v181 ^ v180) + 414903272 - ((2 * (v181 ^ v180)) & 0x3175D7D0)) ^ *(_DWORD *)&v140[4 * (BYTE1(v176) ^ 0xBD)];
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (BYTE3(v70) ^ 0x7B)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  LODWORD(v50) = *(_DWORD *)&v137[4 * (v176 ^ 0xB4)] ^ *(_DWORD *)&v140[4 * (BYTE1(v178) ^ 0x8F)] ^ ((v176 ^ 0xD9) + 1579265308 - ((2 * (v176 ^ 0xD9) + 37586174) & 0x205853A)) ^ (v50 + 414903272 - ((2 * v50) & 0x3175D7D0)) ^ (v45 >> 1);
  int v183 = *(_DWORD *)&v137[4 * (v178 ^ 0xE8)];
  unsigned int v184 = (v50 - ((2 * v50) & 0x26B9652C) - 1822641514) ^ HIDWORD(v223);
  LODWORD(v50) = *(_DWORD *)&v140[4 * (BYTE1(v179) ^ 0x2D)] ^ v224 ^ v108 ^ v183 ^ (v64
                                                                                                + 414903272
                                                                                                - ((2 * v64) & 0x3175D7D0));
  unsigned int v185 = (v62 - 1065513297 - ((2 * v62) & 0x80FB1D5E)) ^ v225;
  LODWORD(v62) = ((BYTE2(v50) ^ 0x66) + 1253999516 - 2 * ((WORD1(v50) ^ 0xAE66) & 0x9D ^ WORD1(v50) & 1)) ^ *(_DWORD *)&v136[4 * (BYTE2(v50) ^ 0x3A)];
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v184) ^ 0xAC)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  LODWORD(v70) = (v45 >> 1) + 1253999516 - ((2 * (v45 >> 1)) & 0x957D0738);
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v185) ^ 0xEF)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  LODWORD(v70) = v70 ^ *(_DWORD *)&v136[4 * (BYTE2(v185) ^ 0x40)];
  LODWORD(v64) = (v45 >> 1) ^ *(_DWORD *)&v137[4 * (v184 ^ 0xF9)] ^ ((v184 ^ 0x94)
                                                                                    + 1579265308
                                                                                    - ((2
  unsigned int v186 = ((v182 ^ 0x4A) + 1579265309 + ((2 * (v182 ^ 0x4A) + 254) & 0x13A ^ 0xFDFA7BFF)) ^ *(_DWORD *)&v137[4 * (v182 ^ 0x27)];
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (BYTE3(v50) ^ 0xAE)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  int v187 = (v45 >> 1) ^ *(_DWORD *)&v136[4 * (BYTE2(v184) ^ 0x16)] ^ (v186 + 1253999516 - ((2 * v186) & 0x957D0738));
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v182) ^ 0xDC)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  unsigned int v188 = ((BYTE2(v182) ^ 0xE) + 1253999516 - ((2 * (HIWORD(v182) ^ 0xDC0E)) & 0x138)) ^ v223 ^ *(_DWORD *)&v136[4 * (BYTE2(v182) ^ 0x52)] ^ *(_DWORD *)&v140[4 * (BYTE1(v50) ^ 0x7C)] ^ (v64 + 414903272 - ((2 * v64) & 0x3175D7D0));
  unsigned int v189 = *(_DWORD *)&v140[4 * (BYTE1(v184) ^ 0x79)] ^ HIDWORD(v222) ^ *(_DWORD *)&v137[4
                                                                                     * (v185 ^ 0x4D)] ^ (v45 >> 1) ^ ((v185 ^ 0x20) + 1579265308 - ((2 * (v185 ^ 0x20) + 37586174) & 0x205853A)) ^ (v62 + *(_DWORD *)(v40 - 252) + ~((2 * v62) & 0x3175D7D0));
  unsigned int v190 = (v70 + 414903272 - ((2 * v70) & 0x3175D7D0)) ^ HIDWORD(v221) ^ *(_DWORD *)&v140[4 * (BYTE1(v182) ^ 0x65)] ^ *(_DWORD *)&v137[4 * (v50 ^ 0xDE)] ^ ((v50 ^ 0xB3) + 1579265308 - ((2 * (v50 ^ 0xB3) + 37586174) & 0x205853A));
  LODWORD(v50) = *(_DWORD *)&v140[4 * (BYTE1(v185) ^ 0xA4)] ^ v222 ^ (v187 + 414903272 - ((2 * v187) & 0x3175D7D0));
  LODWORD(v70) = (v140[4 * (BYTE1(v185) ^ 0xA4)] ^ v222 ^ (v187 - 24 - ((2 * v187) & 0xD0)) ^ BYTE2(v184));
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v190) ^ 0x6C)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  int v191 = v45 >> 1;
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v188) ^ 0xF7)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  LODWORD(v62) = v45 >> 1;
  LODWORD(v69) = ((BYTE2(v190) ^ 0xC8) + 1253999516 - 2 * ((HIWORD(v190) ^ 0x6CC8) & 0x9D ^ HIWORD(v190) & 1)) ^ *(_DWORD *)&v136[4 * (BYTE2(v190) ^ 0x94)];
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (BYTE3(v50) ^ 0xE7)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  int v192 = v45 >> 1;
  LODWORD(v70) = v191 ^ *(_DWORD *)&v137[4 * (v70 ^ 1)] ^ ((BYTE2(v188) ^ 0xE9)
                                                                       + 1253999516
                                                                       - ((2 * (HIWORD(v188) ^ 0xF7E9)) & 0x138)) ^ *(_DWORD *)&v136[4 * (BYTE2(v188) ^ 0xB5)] ^ ((v70 ^ 0x6C) + 1579265308 - ((2 * (v70 ^ 0x6C) + 37586174) & 0x205853A));
  LODWORD(v70) = (v70 + 414903272 - ((2 * v70) & 0x3175D7D0)) ^ *(_DWORD *)&v140[4 * (BYTE1(v189) ^ 0xEC)];
  LODWORD(v62) = v62 ^ *(_DWORD *)&v136[4 * (BYTE2(v189) ^ 0xA7)] ^ *(_DWORD *)&v137[4
                                                                                   * ((v190 ^ BYTE2(v185)) ^ 0x32)] ^ (((v190 ^ BYTE2(v185)) ^ 0x5F) + 1579265309 + ((2 * ((v190 ^ BYTE2(v185)) ^ 0x5F) + 254) & 0x13A ^ 0xFDFA7BFF)) ^ ((BYTE2(v189) ^ 0xFB) + 1253999516 - ((2 * (HIWORD(v189) ^ 0x57FB)) & 0x138));
  HIDWORD(v45) = *(_DWORD *)&v135[4 * (HIBYTE(v189) ^ 0x57)];
  LODWORD(v45) = HIDWORD(v45) ^ 0xFB92F8F4;
  LODWORD(v62) = (v62 + 414903272 - ((2 * v62) & 0x3175D7D0)) ^ *(_DWORD *)&v140[4 * (BYTE1(v50) ^ 0x6D)];
  LODWORD(v50) = WORD1(v50) ^ 0xE731;
  LODWORD(v136) = *(_DWORD *)&v136[4 * (v50 ^ 0x5C)];
  LODWORD(v50) = (v50 + 1253999516 - ((2 * v50) & 0x138)) ^ *(_DWORD *)&v137[4
                                                                                            * (v188 ^ 0xC5)];
  LODWORD(v136) = ((v188 ^ 0xA8)
                 + 1579265309
                 + ((2 * (v188 ^ 0xA8) + 254) & 0x13A ^ 0xFDFA7BFF)) ^ v136;
  LODWORD(v135) = *(_DWORD *)&v137[4 * (v189 ^ 0x42)];
  unsigned int v193 = v215 ^ *(_DWORD *)&v140[4 * (BYTE1(v190) ^ 0x61)] ^ ((v50 ^ v136 ^ (v45 >> 1))
                                                            + 414903272
                                                            - ((2 * (v50 ^ v136 ^ (v45 >> 1))) & 0x3175D7D0));
  LODWORD(v137) = v193 ^ 0xADE748E2;
  LODWORD(v136) = (v62 + 1369677138 - ((2 * v62) & 0xA3473AA4)) ^ v217;
  LODWORD(v50) = (v70 + 627676528 - ((2 * v70) & 0x4AD32AE0)) ^ v221;
  LODWORD(v135) = *(_DWORD *)&v140[4 * (BYTE1(v188) ^ 0x2D)] ^ HIDWORD(a15) ^ v192 ^ v135 ^ ((v189 ^ 0x2F) + 1579265308 - ((2 * (v189 ^ 0x2F) + 37586174) & 0x205853A)) ^ (v69 + 414903272 - ((2 * v69) & 0x3175D7D0));
  LODWORD(v62) = HIBYTE(v193) ^ 0x89;
  uint64_t v194 = *(unsigned int *)(v40 - 120);
  uint64_t v195 = (uint64_t)*(&off_10005BF10 + (int)v194 - 1722);
  v196 = (char *)*(&off_10005BF10 + (int)v194 - 1677) - 8;
  LODWORD(v108) = *(_DWORD *)(v195 + 4LL * (v136 ^ 0xA2u));
  uint64_t v197 = (uint64_t)*(&off_10005BF10 + (int)v194 - 1787);
  LODWORD(v70) = (*(_DWORD *)(v197 + 4LL * (BYTE2(v136) ^ 0x9Eu)) - 1570018779) ^ (*(_DWORD *)(v195
                                                                                             + 4LL
  int v198 = *(_DWORD *)(v195 + 4LL * (v193 ^ 0xC8u));
  uint64_t v199 = v198 - ((2 * v198 - 1528767740) & 0x815EBA9E);
  int v200 = *(_DWORD *)(v195 + 4LL * (v50 ^ 0xB9u));
  int v201 = *(_DWORD *)&v196[4 * ((v136 >> 24) ^ 0xE7)];
  LODWORD(v195) = *(_DWORD *)&v196[4 * ((v135 >> 24) ^ 0xB8)];
  int v202 = *(_DWORD *)&v196[4 * (BYTE3(v50) ^ 0x65)];
  LODWORD(v62) = (*(_DWORD *)(v197 + 4LL * (BYTE2(v135) ^ 0x38u)) - 1570018779) ^ (*(_DWORD *)&v196[4 * v62]
                                                                                 - 376009300) ^ ((_DWORD)v108
                                                                                               + 1383099778);
  v203 = (char *)*(&off_10005BF10 + SHIDWORD(v214)) - 4;
  LODWORD(v108) = *(_DWORD *)&v203[4 * (BYTE1(v136) ^ 0xA0)];
  LODWORD(v140) = *(_DWORD *)&v203[4 * (BYTE1(v135) ^ 0xE9)];
  LODWORD(v136) = (v70 - 1062249137 - ((2 * v70) & 0x815EBA9E)) ^ *(_DWORD *)&v203[4 * (BYTE1(v137) ^ 0x29)] ^ (v202 - 376009300);
  int v204 = *(_DWORD *)(v197 + 4LL * (BYTE2(v137) ^ 0x6Bu));
  LODWORD(v137) = *(_DWORD *)&v203[4 * (BYTE1(v50) ^ 0x74)] ^ HIDWORD(v216) ^ (v62
                                                                             - 1062249137
                                                                             - ((2 * v62) & 0x815EBA9E));
  LODWORD(v136) = v213 ^ v221 ^ ((_DWORD)v136 + 627676528 - ((2 * (_DWORD)v136) & 0x4AD32AE0));
  LODWORD(v62) = v108 ^ v213 ^ (v199 + 320850641) ^ (v195 - 376009300);
  v205 = (char *)*(&off_10005BF10 + (int)v194 - 1709) - 8;
  LODWORD(v195) = *(_DWORD *)(v197 + 4LL * (BYTE2(v50) ^ 0x1Du)) - 1570018779;
  uint64_t v206 = *(void *)(v40 - 240);
  a1[*(void *)(v40 - 248)] = v205[BYTE1(v137) ^ 0x99LL] ^ 0x2D;
  v207 = (char *)*(&off_10005BF10 + (int)v194 - 1753) - 4;
  a1[v206] = (v207[BYTE2(v136) ^ 0xADLL] + 35) ^ 0xC5;
  v208 = (char *)*(&off_10005BF10 + (int)v194 - 1653) - 4;
  LODWORD(v70) = v62 ^ v195;
  a1[*(void *)(v40 - 200)] = v208[v137 ^ 0xFCLL] ^ 0x17;
  a1[*(void *)(v40 - 216)] = (v207[((v62 ^ v195) >> 16) ^ 0x8CLL] + 35) ^ 0x47;
  uint64_t v209 = (uint64_t)*(&off_10005BF10 + SHIDWORD(v213));
  a1[*(void *)(v40 - 208)] = (*(_BYTE *)(v209 + ((v137 >> 24) ^ 0xDELL)) + 3) ^ 0x1B;
  a1[*(void *)(v40 - 232)] = ((v207[BYTE2(v137) ^ 0x15LL] + ((v207[BYTE2(v137) ^ 0x15LL] + 35) ^ 0xDA) + 36) ^ 0xFE)
                             + v207[BYTE2(v137) ^ 0x15LL]
                             + 35;
  unsigned int v210 = v214 ^ v140 ^ (v204 - 1570018779) ^ (v200 + 1383099778) ^ (v201
                                                                                - ((2 * v201 - 752018600) & 0x815EBA9E)
                                                                                - 1438258437);
  a1[*(void *)(v40 - 224)] = v208[v210 ^ 5LL] ^ 0xE5;
  a1[*(void *)(v40 - 152)] = (*(_BYTE *)(v209 + ((v136 >> 24) ^ 0x4ELL)) + 3) ^ 0xE6;
  a1[*(void *)(v40 - 160)] = (*(_BYTE *)(v209 + (BYTE3(v70) ^ 0x9CLL)) + 3) ^ 0xB8;
  uint64_t v211 = *(void *)(v40 - 176);
  a1[v211] = (*(_BYTE *)(v209 + (HIBYTE(v210) ^ 0x67LL)) + 3) ^ 0x91;
  a1[*(void *)(v40 - 168)] = v208[v70 ^ 0xF2LL] ^ 0xEF;
  a1[*(void *)(v40 - 192)] = v205[BYTE1(v70) ^ 0x1ELL] ^ 0x8E;
  a1[*(void *)(v40 - 144)] = v205[BYTE1(v210) ^ 0x33LL] ^ 0x97;
  a1[*(void *)(v40 - 184)] = v205[BYTE1(v136) ^ 0xBCLL] ^ 0x59;
  a1[*(void *)(v40 - 136)] = v208[v136 ^ 0x9FLL] ^ 0x17;
  a1[*(void *)(v40 - 128)] = (v207[BYTE2(v210) ^ 0xDLL] + 35) ^ 0x8E;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned __int8 *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, char *, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a35 + 8LL * ((44 * ((((_DWORD)v211 + 1132308871 - ((2 * (_DWORD)v211 + 32) & 0x86FB530E) + 16) ^ 0x437DA987) < HIDWORD(v217))) | ((int)v194 - 531))) - 4LL))( 1132308871LL,  142LL,  23LL,  v197,  (_DWORD)v211 + 1132308871 - ((2 * (_DWORD)v211 + 32) & 0x86FB530E) + 16,  184LL,  v194,  v199,  a2,  a3,  a4,  a1,  v213,  v214,  v215,  v216,  v217,  v218,  v110,  v219,  v220,  a15,  v221,  v222,  v223,  v224,  v225,  v226,  v227,  v228,  v229,  v230,  v231);
}

void sub_100018CC4()
{
}

uint64_t sub_100018CF8( uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return ((uint64_t (*)(void))(*(void *)(v9 + 8LL * (a8 ^ (452 * (v8 != a3)))) - (((a8 + 867) | 0x314u) ^ 0x710LL)))();
}

uint64_t sub_100018D2C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void))(*(void *)(v9
                                                                                + 8LL
                                                                                * ((991
                                                                                  * (((((48 * ((a8 + 313) ^ 0x1CC)) ^ 0x3F4)
                                                                                     - 1804) & v8) != 0)) ^ (a8 + 313)))
                                                                    - 4LL))( a1,  a2,  a3,  (a2 - a3));
}

uint64_t sub_100018D70@<X0>( int a1@<W0>, int a2@<W2>, int a3@<W4>, uint64_t a4@<X8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38)
{
  *(_DWORD *)(v46 - 120) = v45;
  *(_DWORD *)(v46 - 128) = v41;
  *(_DWORD *)(v46 - 136) = v41 & 0xFFFFFFF8;
  char v47 = v44 + v43 + v42;
  unsigned int v48 = v44 + v43 + a1 - a2;
  *(_DWORD *)(v46 - 144) = a3 - 1091;
  v50.val[0].i64[0] = v48 & 0xF;
  v50.val[0].i64[1] = (v47 + (_BYTE)a3 - (_BYTE)a2 + 38) & 0xF;
  v50.val[1].i64[0] = (v47 - (_BYTE)a2 + 5) & 0xF;
  v50.val[1].i64[1] = (v47 - (_BYTE)a2 + 4) & 0xF;
  v50.val[2].i64[0] = (v47 - (_BYTE)a2 + 3) & 0xF;
  v50.val[2].i64[1] = (v47 - (_BYTE)a2 + 2) & 0xF;
  v50.val[3].i64[0] = (v47 - (_BYTE)a2 + 1) & 0xF;
  v50.val[3].i64[1] = (v47 - (_BYTE)a2) & 0xF;
  *(int8x8_t *)(a4 - 7 + v48) = veor_s8( veor_s8( veor_s8(*(int8x8_t *)(v38 + v50.val[0].i64[0] - 7), *(int8x8_t *)(a4 - 7 + v48)),  veor_s8( *(int8x8_t *)(v50.val[0].i64[0] + v40 - 5),  *(int8x8_t *)(v50.val[0].i64[0] + v39 - 3))),  vrev64_s8( vmul_s8( (int8x8_t)*(_OWORD *)&vqtbl4q_s8(v50, (int8x16_t)xmmword_100047770),  (int8x8_t)0x7777777777777777LL)));
  return ((uint64_t (*)(__n128))(*(void *)(a38 + 8LL * ((486 * (a2 - (v41 & 0xFFFFFFF8) == -8)) ^ a3)) - 12LL))((__n128)xmmword_100047770);
}

void sub_100018EA8()
{
}

uint64_t sub_100018EB0()
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((331
}

uint64_t sub_100018EF4@<X0>(int a1@<W3>, int a2@<W5>, uint64_t a3@<X8>)
{
  uint64_t v8 = (a1 - 460997465);
  *(_BYTE *)(a3 + v8) ^= *(_BYTE *)(v4 + (v8 & 0xF)) ^ *(_BYTE *)((v8 & 0xF) + v6 + 2) ^ *(_BYTE *)((v8 & 0xF) + v5 + 4) ^ (119 * (v8 & 0xF));
  return ((uint64_t (*)(void))(*(void *)(v7 + 8LL * ((15 * (a1 - 1 == v3)) ^ (a2 - 1666))) - 4LL))();
}

void sub_100018F60()
{
  if (v0 == 1081321699) {
    int v1 = 777158354;
  }
  else {
    int v1 = -777181942;
  }
  *(_DWORD *)(v2 + 32) = v1;
}

void sub_100018FC4(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32) ^ (535753261 * (((a1 | 0x3F53CC1) - (a1 & 0x3F53CC1)) ^ 0x90132EE));
  uint64_t v3 = *(void *)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(*(void *)a1 - 0x163576876B51155BLL);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = v5;
  uint64_t v8 = &STACK[0x621D43C813E505B2];
  uint64_t v9 = v2;
  uint64_t v10 = v3;
  unsigned int v11 = v1 + 235795823 * ((&v6 - 1802953736 - 2 * (&v6 & 0x94891BF8)) ^ 0x2452A1) + 280;
  ((void (*)(uint64_t *))*(&off_10005BF10 + v1 + 7))(&v6);
  uint64_t v6 = *(void *)(v3 - 0x163576876B511563LL);
  uint64_t v8 = &STACK[0x621D43C813E505A2];
  LODWORD(v7) = v1
  sub_100027864((uint64_t)&v6);
  HIDWORD(v6) = v1
  uint64_t v7 = v4;
  sub_1000119F8((uint64_t)&v6);
  __asm { BR              X8 }

uint64_t sub_1000191F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t), uint64_t a11)
{
  *(_DWORD *)(v18 - 104) = v12
                         + 235795823 * ((2 * ((v18 - 144) & 0x56DD6590) - (v18 - 144) - 1457350033) ^ 0x3D8FD336)
                         - 928;
  *(void *)(v18 - 136) = v14;
  *(void *)(v18 - 128) = v14;
  *(void *)(v18 - 120) = a11;
  *(void *)(v18 - 112) = v16;
  *(void *)(v18 - 144) = v15;
  uint64_t v19 = a10(v18 - 144);
  return (*(uint64_t (**)(uint64_t))(v11
                                            + 8LL
                                            * ((41
                                              * (v17 - 1806732480 + ((v13 - 2100209931) & 0x7D2EADAFu) - 1322 > 0x7FFFFFFE)) ^ v13)))(v19);
}

uint64_t sub_1000192A8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  *(_DWORD *)(v18 - 112) = v17
                         + 1225351577
                         * ((54402917 - ((v18 - 144) | 0x33E1F65) + ((v18 - 144) | 0xFCC1E09A)) ^ 0x823E7AA8)
                         - 592;
  *(void *)(v18 - 144) = v13;
  *(void *)(v18 - 136) = v13;
  *(void *)(v18 - 128) = v15;
  *(void *)(v18 - 120) = v14;
  ((void (*)(uint64_t))((char *)*(&off_10005BF10 + (v17 ^ 0x568)) - 12))(v18 - 144);
  int v19 = 535753261 * ((~((v18 - 144) | 0x71B4EA7E) + ((v18 - 144) & 0x71B4EA7E)) ^ 0x84BF1BAE);
  *(_DWORD *)(v18 - 144) = -1806732480 - v19 + v16;
  *(_DWORD *)(v18 - 140) = v17 - v19 + 457;
  *(void *)(v18 - 136) = a12;
  uint64_t v20 = sub_100026F04(v18 - 144);
  return ((uint64_t (*)(uint64_t))(*(void *)(v12
                                                      + 8LL * ((21 * (*(_DWORD *)(v18 - 128) == -2035976494)) ^ v17))
                                          - 12LL))(v20);
}

uint64_t sub_1000193C4()
{
  return (*(uint64_t (**)(void))(v0
                              + 8LL
                              * ((41 * (v2 - 1806732480 + ((v1 - 2100209931) & 0x7D2EADAFu) - 1322 > 0x7FFFFFFE)) ^ v1)))();
}

uint64_t sub_100019414()
{
  uint64_t v5 = *(void *)(v8 + 24);
  int v6 = 108757529 * ((((v4 - 144) | 0xDBA6EF8F) + (~(v4 - 144) | 0x24591070)) ^ 0x3B3A8DA5);
  *(void *)(v4 - 136) = v10;
  *(_DWORD *)(v4 - 144) = (v0 + 215) ^ v6;
  *(_DWORD *)(v4 - 140) = v6 ^ 0x48F8494B;
  sub_100045898((_DWORD *)(v4 - 144));
  *(void *)(v4 - 120) = v10;
  *(void *)(v4 - 112) = v3;
  *(_DWORD *)(v4 - 104) = v0
                        + 235795823 * ((2 * ((v4 - 144) & 0x7A33CFE0) - (v4 - 144) - 2050215910) ^ 0x11617943)
                        + 280;
  *(void *)(v4 - 144) = v2;
  *(void *)(v4 - 136) = v1;
  *(void *)(v4 - 128) = v1;
  v9(v4 - 144);
  *(void *)(v4 - 144) = v1;
  *(_DWORD *)(v4 - 136) = v0
                        + 3804331 * ((((v4 - 144) | 0xF76D89FF) - (v4 - 144) + ((v4 - 144) & 0x8927600)) ^ 0x78C89239)
                        + 1285;
  *(void *)(v4 - 128) = v5;
  return sub_100027864(v4 - 144);
}

uint64_t sub_100019560(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(uint64_t))((char *)*(&off_100058280
                                                    + ((90 * (*(_DWORD *)(a2 + 4) == 1782897128)) ^ 0x50Eu))
                                          - 4))(4294925278LL);
}

uint64_t sub_1000195A4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(_BYTE *)(*(void *)(a2 + 96) + 468LL) = *(_BYTE *)(*(void *)(a1 + 8) + 12LL);
  return ((uint64_t (*)(void))(*(void *)(v2 + 11480) - 4LL))(0LL);
}

uint64_t sub_100019600@<X0>(uint64_t a1@<X8>)
{
  *(_BYTE *)(a1 + (v7 + v5)) = *(_BYTE *)(v4 + (v7 + v5));
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * (((v3 + v7 - 1295 != v2) * v6) ^ v3)) - 4LL))(0LL);
}

void sub_10001963C(uint64_t a1)
{
  int v1 = 628203409 * (((a1 | 0x89B748DF) - a1 + (a1 & 0x7648B720)) ^ 0xB3F44EC);
  unsigned int v2 = *(_DWORD *)(*(void *)(a1 + 24) - 0x77B914E8D9BF3929LL) - 381806455;
  unsigned int v3 = *(_DWORD *)(a1 + 20) + v1 - 1794992462;
  BOOL v4 = v2 < 0x1926FA8;
  BOOL v5 = v2 > v3;
  if (v3 < 0x1926FA8 != v4) {
    BOOL v5 = v4;
  }
  __asm { BR              X10 }

uint64_t sub_10001973C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(v1
                              + 8LL
                              * (((((*(unsigned __int8 *)(*(void *)(a1 + 40) + (v2 - 408180512))
                                   - ((2 * *(unsigned __int8 *)(*(void *)(a1 + 40) + (v2 - 408180512))) & 0x1B2)
                                   + 1272700889) & 0x1F) != 6)
                                * ((v3 - 1235697687) & 0x49A73BFD ^ 0x20D)) ^ v3)))();
}

uint64_t sub_1000197A4(uint64_t a1, int a2)
{
  BOOL v5 = v4 + 2139655708 > (v2 + 726469700);
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * (a2 ^ (1798 * !v5))) - ((a2 - 320) ^ 0xFDLL)))();
}

uint64_t sub_100019818(uint64_t a1)
{
  unsigned int v5 = *(unsigned __int8 *)(v1 + (v3 + 1));
  uint64_t v6 = (((v4 + 320) ^ 0x38B) & (2 * v5)) + (v5 ^ 0xFF65DFDF);
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v2 + 8LL * (int)((435 * ((v5 >> 7) ^ 1)) ^ v4)))( a1,  v6,  (v4 + 1792997639 + v6));
}

uint64_t sub_100019878(uint64_t a1, uint64_t a2, int a3)
{
  unsigned int v7 = a3 + v6 + 1562275773;
  unsigned int v8 = v3 + 1871461705;
  int v9 = (v8 < 0xDC1C163F) ^ (v7 < 0xDC1C163F);
  BOOL v10 = v7 > v8;
  if (v9) {
    BOOL v10 = v7 < 0xDC1C163F;
  }
  return ((uint64_t (*)(void))(*(void *)(v4 + 8LL * ((488 * !v10) ^ v5)) - 8LL))();
}

uint64_t *sub_1000198E4@<X0>(uint64_t *result@<X0>, int a2@<W2>, _DWORD *a3@<X8>)
{
  uint64_t v7 = result[6];
  uint64_t v9 = *result;
  uint64_t v8 = result[1];
  *a3 = v4 - 1722371938;
  *(_DWORD *)(v9 - 0x6F25EF995E5110BLL) = v5;
  *(_DWORD *)(v7 - 0x65D83369D885CF2LL) = a2;
  *(void *)(v8 - 0x2C843C8B7CE89A2ELL) = v3 + (v6 - 347655335);
  *((_DWORD *)result + 8) = 777158354;
  return result;
}

uint64_t sub_100019B50(uint64_t a1)
{
  int v1 = *(_DWORD *)(*(void *)(a1 + 8) - 0x621D43C813E5057ELL);
  int v4 = v1 - 2086149949;
  BOOL v3 = v1 - 2086149949 < 0;
  int v5 = 2086149949 - v1;
  if (v3) {
    int v4 = v5;
  }
  int v2 = (*(_DWORD *)a1 + 108757529 * ((2 * (a1 & 0x5EAB9BD4) - a1 - 1588304853) ^ 0x41C80600) - 227) | 0x422;
  return (*((uint64_t (**)(void))*(&off_10005BF10 + v2 - 870)
          + ((677
            * ((v4 ^ 0xFBF76DDB) + 2088737792 + ((v2 - 135342213) & (2 * v4)) + (((v2 - 1047) | 0xD8) ^ 0x8788F6D8) < ((v2 - 831) ^ 0x7FFFFF03u))) ^ v2)))();
}

uint64_t sub_100019C7C(uint64_t a1, int a2, int a3, unsigned int a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8LL * (((*(_DWORD *)(*v5 + 4LL * a4) != a2) * ((a3 ^ 0xFF) * v6 + 140)) ^ a3)))();
}

void sub_100019CB0()
{
}

uint64_t sub_100019CB8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  *(_DWORD *)(result + 4) = a6;
  return result;
}

uint64_t sub_100019CC0(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) + 1755732067 * ((a1 - 903090360 - 2 * (a1 & 0xCA2BEF48)) ^ 0x14ED5293);
  return ((uint64_t (*)(void))(*((void *)*(&off_10005BF10 + v1 - 678)
                              + ((1397 * (*(void *)(a1 + 8) != 0x3C9E4FFE00180D53LL)) ^ v1))
                            - 8LL))();
}

uint64_t sub_100019D48()
{
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL
                                             * ((216 * (*(_DWORD *)(v2 - 0x3C9E4FFE00180D3BLL) == 777158354)) ^ v0))
                            - 8LL))();
}

uint64_t sub_100019D88()
{
  unsigned int v3 = *(_DWORD *)(v2 - 0x3C9E4FFE00180D43LL) - 1336965919;
  unsigned int v4 = *(_DWORD *)(v2 - 0x3C9E4FFE00180D47LL) - 754796145;
  BOOL v5 = v4 < 0x2852F45D;
  BOOL v6 = v3 < v4;
  if (v3 < 0x2852F45D != v5) {
    BOOL v6 = v5;
  }
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * ((1496 * v6) ^ v0)) - 8LL))();
}

_DWORD *sub_100019E14@<X0>(_DWORD *result@<X0>, int a2@<W8>)
{
  _DWORD *v2 = a2;
  *uint64_t result = -777181721;
  return result;
}

uint64_t sub_100019E28(_DWORD *a1)
{
  unsigned int v1 = 3804331 * ((((2 * (_DWORD)a1) | 0xB15C7908) - (_DWORD)a1 - 1487813764) ^ 0xD70B2742);
  unsigned int v2 = a1[1] + v1;
  return (*((uint64_t (**)(void))*(&off_10005BF10 + (v2 & 0x135D78F7))
}

uint64_t sub_100019EC8()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
}

uint64_t sub_100019F04@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  *(_DWORD *)(*(void *)(result + 8) - 0x34E7A15D1F153284LL) = v3;
  return result;
}

uint64_t sub_100019F90(uint64_t a1)
{
  int v1 = 460628867 * (((a1 | 0x7391008F) - a1 + (a1 & 0x8C6EFF70)) ^ 0x3F0782F2);
  int v2 = *(_DWORD *)(a1 + 8) + v1;
  int v3 = *(_DWORD *)(a1 + 24) + v1;
  int v4 = *(_DWORD *)(*(void *)(a1 + 16) - 0x621D43C813E5057ELL);
  unsigned int v6 = v4 - 2086149949;
  BOOL v5 = v4 - 2086149949 < 0;
  unsigned int v7 = 2086149949 - v4;
  if (!v5) {
    unsigned int v7 = v6;
  }
}

uint64_t sub_10001A064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5
                                                                                          + 8LL
                                                                                          * (((((v6 ^ (v4 == 763955140)) & 1) == 0)
                                                                                            * (5 * (v6 ^ 0xDD) + 329)) ^ v6))
                                                                              - 8LL))( a1,  a2,  a3,  a4,  990272143LL);
}

uint64_t sub_10001A0AC(uint64_t a1)
{
  return ((uint64_t (*)(uint64_t, void, void, uint64_t, uint64_t))(*(void *)(v2
                                                                                        + 8LL
                                                                                        * (int)((v3 + 961) ^ (v3 + 740)))
                                                                            - 12LL))( a1,  v3 + 740,  v3,  3207183372LL,  v1);
}

uint64_t sub_10001A118@<X0>(void *a1@<X0>, int a2@<W2>, int a3@<W3>, int a4@<W4>, int a5@<W8>)
{
  *(_BYTE *)(*a1 + (a4 + a5)) = (a3 ^ v7) >> v8;
  return ((uint64_t (*)(void))(*(void *)(v5 + 8LL * (a2 ^ ((a4 - 1 == v6) | (32 * (a4 - 1 == v6)))))
}

uint64_t sub_10001A15C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return ((uint64_t (*)(uint64_t, uint64_t, void, uint64_t, uint64_t))(*(void *)(v5
                                                                                         + 8LL
                                                                                         * (int)(((v6
                                                                                                 + ((784 * (a3 ^ 0xD5)) ^ 0x628) == 32)
                                                                                                * (a2 + 221)) ^ a2))
                                                                             - 12LL))( a1,  a2,  (a2 - 740),  a4,  v4);
}

uint64_t sub_10001A1A0(uint64_t a1, int a2)
{
  BOOL v6 = v2 > 0x73DD04B0;
  if (v6 == v5 - 438731130 < 43 * (a2 ^ 0x3BE) - 1943864712) {
    BOOL v6 = v5 - 438731130 < v4;
  }
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * ((1697 * v6) ^ a2)) - 12LL))();
}

uint64_t sub_10001A21C@<X0>(void *a1@<X0>, int a2@<W1>, int a3@<W8>)
{
  return sub_10001A118(a1, a2 - 740, *(_DWORD *)(*v4 + 4LL * (v5 - 642350496 + a2 - 740)), v3, a3);
}

uint64_t sub_10001A248(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(_DWORD *)(result + 28) = a5;
  return result;
}

void sub_10001A250(uint64_t a1, uint64_t a2)
{
  if (a1) {
    BOOL v2 = a2 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  int v3 = !v2;
  __asm { BR              X8 }

uint64_t sub_10001A2C4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned int a16, int a17)
{
  a16 = (1178560073 * ((2 * (&a16 & 0x52392F10) - &a16 + 768004332) ^ 0x9752A88E)) ^ 0x650810FC;
  uint64_t v20 = sub_100045AE8(&a16);
  return ((uint64_t (*)(uint64_t))(*(void *)(v18
                                                      + 8LL
}

uint64_t sub_10001A360( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unint64_t *a16, int a17, unsigned int a18)
{
  a18 = 1513
      - 460628867
      * (((&a16 | 0xDBE923A9) - &a16 + (&a16 & 0x2416DC50)) ^ 0x977FA1D4);
  a16 = &STACK[0x72D239406EDD8F48];
  sub_100024FE0((uint64_t)&a16);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 + 8LL * ((625 * (a17 == v18)) ^ 0x137u)) - ((v20 + 1023) ^ 0x8FA30AB4LL)))( v21,  v22,  v23,  v24,  v25,  v26,  v27,  v28,  a9);
}

uint64_t sub_10001A400( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, uint64_t a18, unint64_t *a19, int a20, int a21)
{
  int v22 = 1755732067 * ((&a16 + 1504961492 - 2 * ((unint64_t)&a16 & 0x59B3E3D4)) ^ 0x87755E0F);
  a17 = v22 ^ 0x23B2D16E;
  a20 = v22 ^ 0x7F7DFDA0;
  a21 = v22 ^ 0x71C2A63F;
  a18 = a13;
  a19 = &STACK[0x4A65459BC62410F7];
  uint64_t v23 = sub_1000459CC((uint64_t)&a16);
  return ((uint64_t (*)(uint64_t))(*(void *)(v21 + 8LL * ((4 * (a16 != 777158354)) | 0xD1u)) - 8LL))(v23);
}

uint64_t sub_10001A4F4()
{
  uint64_t v7 = v5;
  v6[1] = 535753261
        * (((v6 | 0x5A0877C7) - v6 + (v6 & 0xA5F78838)) ^ 0x50FC79E8)
        + 1885141588
        + v3;
  v0(v6);
  return v2 ^ v1;
}

void sub_10001A82C(uint64_t a1)
{
  int v2 = 108757529 * (a1 ^ 0xE09C622B);
  int v3 = *(_DWORD *)(a1 + 24) ^ v2;
  int v37 = *(_DWORD *)(a1 + 20) ^ v2;
  uint64_t v35 = (v3 - 1857280050) & 0x6EB3DBF9;
  unsigned int v4 = 235795823 * ((1211322473 - (v46 | 0x48335069) + (v46 | 0xB7CCAF96)) ^ 0x2361E6CF);
  int v5 = *(_DWORD *)(a1 + 8);
  unint64_t v18 = 108757529 * (a1 ^ 0xE75B6218E09C622BLL);
  int v6 = v5 + v2;
  unsigned int v47 = v4 - 1970643562;
  int v48 = v3 - v4 + 1172345386;
  uint64_t v25 = &STACK[0x5934B92A3842FD9C];
  int v49 = &STACK[0x5934B92A3842FD9C];
  sub_100022668((uint64_t)v46);
  uint64_t v7 = (uint64_t)*(&off_10005BF10 + v3 + 164);
  uint64_t v21 = *(void *)(v7 + 8LL * v3) - 8LL;
  int v34 = v6 + 472091382;
  int v33 = -2036287577;
  int v17 = v6 - 1081878736;
  int v8 = v6 + 1364747065;
  int v19 = v6 - 967000629;
  int v9 = v3;
  int v10 = (v3 - 1857280050) & 0x6EB3DBF9;
  uint64_t v27 = &v44;
  v12[1] = (char *)&v12[-250673734] + 5;
  int v32 = v9 + 1621651614;
  int v26 = 2 * (v9 ^ 0xDE);
  int v16 = v9 - 592980024;
  int v15 = 29 * (v9 ^ 0x36);
  int v14 = v9 + 1999959374;
  int v13 = v9 - 942328266;
  int v39 = v9 ^ 0x569;
  uint64_t v38 = v9 ^ 0x1EFu;
  uint64_t v36 = v38;
  uint64_t v28 = v38;
  int v29 = v9;
  int v30 = v35 ^ 0xBBD58C13;
  int v31 = v8;
  uint64_t v20 = a1;
  int32x4_t v23 = vdupq_n_s32(0x2E527ED2u);
  int32x4_t v24 = vdupq_n_s32(0x2E527EDFu);
  int32x4_t v22 = vdupq_n_s32(0x2E527EDBu);
  uint64_t v35 = *(void *)a1;
  unsigned int v11 = v37 - ((2 * v37 + 151132322) & 0x1B278836) + 1377095788;
  char v40 = ((v10 - 10) & 0x7E ^ HIBYTE(v11) ^ 0xE3)
  char v41 = (BYTE2(v11) ^ 0x93) - ((2 * (BYTE2(v11) ^ 0x93)) & 0xD4) + 106;
  char v42 = (BYTE1(v11) ^ 0xC4) - 2 * ((BYTE1(v11) ^ 0xC4) & 0x6B ^ BYTE1(v11) & 1) + 106;
  char v43 = (v37 - ((2 * v37 - 94) & 0x36) + 108) ^ 0x71;
  __asm { BR              X13 }

uint64_t sub_10001ACC0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27)
{
  unsigned int v32 = v30 + (((v27 ^ 0x199) - 350) ^ (a5 + 2143));
  if (v32 <= 0x40) {
    unsigned int v32 = 64;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 8LL * ((247 * ((_DWORD)a1 - v28 - v29 + v32 + 1527 < 0xF)) ^ v27)))( a1,  3995751326LL,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27);
}

uint64_t sub_10001AD34( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27)
{
  int v33 = v28 + v27 + a5;
  int v34 = v33 + 968;
  BOOL v35 = !__CFADD__(v33 + (v29 ^ 0x564) + 458, v30 + a1 + v31 + 3 * (v29 ^ 0x564) + v34);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 8LL * ((486 * v35) ^ v29)))( a1,  a2,  a3,  a4,  64LL,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27);
}

uint64_t sub_10001AD98@<X0>( uint64_t a1@<X3>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, arg34_10001AD98 a34)
{
  *(_OWORD *)(a1 + ((((v34 - 1172698602) & 0x45E5F6BB) + 4294966118LL) & (a2 + v36))) = *(_OWORD *)&a34.arr[4];
}

void sub_10001AE0C()
{
}

uint64_t sub_10001AE18@<X0>( uint64_t a1@<X3>, int a2@<W4>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, int a35, char a36, char a37)
{
  int v40 = v37 + 65;
  *(_BYTE *)(a1 + (v40 ^ (a2 + 1740)) + v38) = a36;
  *(_BYTE *)(a1 + (v40 - 1236 + a3 - 299215970)) = a37;
  return (*(uint64_t (**)(void))(v39 + 8LL * (v40 ^ 0x3EE)))();
}

uint64_t sub_10001AEA8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, int a40, char a41)
{
  *(_BYTE *)(a4 + (v44 + 50)) = *(&a41 + (v42 ^ 0xDFC26CAC) + v43);
  return (*(uint64_t (**)(void))(v45 + 8LL * (v42 ^ (15 * ((v41 + 3) < 4)))))();
}

uint64_t sub_10001AEF0@<X0>( uint64_t a1@<X3>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t (*a12)(uint64_t), uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, int a34, char a35)
{
  *(_BYTE *)(a1 + (v36 ^ (v37 + 66)) + a2) = *(&a35 + (v35 - 540907094));
  int v39 = 1755732067 * ((((v38 - 160) | 0x5AEABF65) - (v38 - 160) + ((v38 - 160) & 0xA5154098)) ^ 0x842C02BE);
  *(_DWORD *)(v38 - 152) = v39 + v36 + 362;
  *(_DWORD *)(v38 - 148) = 819587712 - v39;
  *(void *)(v38 - 160) = a20;
  uint64_t v40 = sub_100006898(v38 - 160);
  return a12(v40);
}

uint64_t sub_10001AF88( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, int a14, int a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, unsigned int a33, unsigned int a34)
{
  int v36 = a15 + ((2 * (STACK[0x2EC] & 0x1F)) ^ 0x30) + (a13 ^ STACK[0x2EC] & 0x3F ^ 0xD5FEFB2C) < 0xFFFFFFC0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t *, uint64_t, void, void, uint64_t))(v35 + 8LL * ((v36 | (v36 << 6)) ^ (v34 + 120))))( 3841410703LL,  2697778809LL,  3151335402LL,  &STACK[0x2A8],  -453556599LL,  a34,  a33,  43LL);
}

uint64_t sub_10001B040()
{
  unsigned int v5 = v3 + 704709666;
  if (v5 <= 0x40) {
    unsigned int v5 = 64;
  }
  return (*(uint64_t (**)(void))(v4
                              + 8LL
}

uint64_t sub_10001B0C8()
{
  int v5 = v0 + 243;
  int v6 = (v0 - 827) | 0x332;
  unsigned int v7 = v2 + v1 + 704709666;
  if (v7 <= 0x40) {
    int v8 = 64;
  }
  else {
    int v8 = v7;
  }
  BOOL v9 = v3 + (v5 ^ 0x487u) + v8 + 129 <= ((v6 - 955) ^ (v7 - 1));
  return ((uint64_t (*)(void))(*(void *)(v4 + 8LL * (v9 | (8 * v9) | v5)) - 12LL))();
}

uint64_t sub_10001B138@<X0>( uint64_t a1@<X3>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, int8x16_t *a28)
{
  *(int8x16_t *)(a1 + (a2 - 1174337675)) = vaddq_s8( vaddq_s8(*a28, v32),  vmvnq_s8(vandq_s8(vaddq_s8(*a28, *a28), v31)));
  return ((uint64_t (*)(void))(*(void *)(v30
                                        + 8LL
                                        * ((13 * (((3 * (v28 ^ 0x287u) - 364) ^ 0x25BLL) != ((v29 + 1) & 0x1FFFFFFF0LL))) ^ (3 * (v28 ^ 0x287))))
                            - 12LL))();
}

uint64_t sub_10001B1CC()
{
  return (*(uint64_t (**)(void))(v3 + 8LL * ((((v2 ^ 0x49C) + 1522 + 6 * (v2 ^ 0x49C) - 791) * (v0 == v1)) ^ v2)))();
}

uint64_t sub_10001B204( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, unint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, int a38, char a39)
{
  unsigned __int8 v58 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t *))(v42 + 8LL * v39);
  int v45 = STACK[0x2F4];
  int v46 = STACK[0x2F4];
  int v47 = STACK[0x2F8];
  int v48 = STACK[0x2FC];
  int v49 = STACK[0x2F8];
  int v50 = STACK[0x2FC];
  int v51 = LOBYTE(STACK[0x308]) ^ 0xE1;
  if (v51 == 2)
  {
    BOOL v57 = (unint64_t)&STACK[0x2A8] < a28 && v44 < (unint64_t)&STACK[0x2E8];
    return ((uint64_t (*)(uint64_t))(*(void *)(v42
                                                        + 8LL
  }

  else if (v51 == 1)
  {
    BOOL v53 = (unint64_t)&STACK[0x2A8] >= a28 || v44 >= (unint64_t)&STACK[0x2E8];
    unint64_t v54 = (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, unint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(*(void *)(v42 + 8LL * ((35 * v53) ^ (v40 + 801))) - (a37 ^ 0x1D6));
    return v54( v54,  2697778809LL,  a3,  a4,  &STACK[0x2A8],  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28);
  }

  else
  {
    LODWORD(STACK[0x2F0]) = 2 * (LODWORD(STACK[0x2F0]) ^ v41) + v41 - (v43 & (4 * (LODWORD(STACK[0x2F0]) ^ v41)));
    LODWORD(STACK[0x2F4]) = (v46 ^ v41) + (v45 ^ v41) + v41 - (v43 & (2 * ((v46 ^ v41) + (v45 ^ v41))));
    LODWORD(STACK[0x2F8]) = (v49 ^ v41) + (v47 ^ v41) + v41 - (v43 & (2 * ((v49 ^ v41) + (v47 ^ v41))));
    LODWORD(STACK[0x2FC]) = (v50 ^ v41) + (v48 ^ v41) + v41 - (v43 & (2 * ((v50 ^ v41) + (v48 ^ v41))));
    return v58(3841410703LL, 2697778809LL, a3, a4, &STACK[0x2A8]);
  }

uint64_t sub_10001C030( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, int a29, uint64_t a30, uint64_t a31, int a32, unsigned int a33, unsigned int a34)
{
  if (a34 < a33 != a29 + 1805123190 < (a32 & 0x9F578FFB) - 2036287780) {
    BOOL v36 = a29 + 1805123190 < (a32 & 0x9F578FFB) - 2036287780;
  }
  else {
    BOOL v36 = a29 + 1805123190 > a34;
  }
  return (*(uint64_t (**)(void))(v35 + 8LL * ((521 * !v36) ^ (v34 + 120))))();
}

uint64_t sub_10001C0B4(int a1)
{
  BOOL v4 = v1 + a1 + 63 >= (v1 + a1);
  return (*(uint64_t (**)(void))(v3 + 8LL * ((v4 | (32 * v4)) ^ (v2 + 174))))();
}

uint64_t sub_10001C0EC(int a1, uint64_t a2, uint64_t a3, int8x16_t *a4)
{
  *a4 = vaddq_s8( vaddq_s8(*(int8x16_t *)(v7 + (v4 + a1)), v11),  vmvnq_s8( vandq_s8( vaddq_s8(*(int8x16_t *)(v7 + (v4 + a1)), *(int8x16_t *)(v7 + (v4 + a1))),  v10)));
  return (*(uint64_t (**)(void))(v8
                              + 8LL * (((((((v5 - 223) | 0x31u) - 20) ^ v9) == 16) * v6) ^ (((v5 - 223) | 0x31) + 1226))))();
}

uint64_t sub_10001C150( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  char v15 = *(_BYTE *)(v13 + a1 + v8 + (v9 ^ v11) - 29);
  *(_BYTE *)(a4 + v10) = v15 + (a8 | ~(2 * v15)) + 107;
  return (*(uint64_t (**)(void))(v14 + 8LL * (((v10 == 63) * v12) ^ v9)))();
}

uint64_t sub_10001C198( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, int a35)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v36
                                                              + 8LL
                                                              * ((38
                                                                * ((((a35 - 540907038) < 0xFFFFFFFB) ^ (((v35 - 44) ^ 0x21) + 1)) & 1)) ^ (v35 + 556))))( a1,  a2,  a3);
}

void sub_10001C1FC()
{
}

uint64_t sub_10001C224( uint64_t a1, int a2, unsigned int a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7)
{
  BOOL v10 = a6 < a7;
  if (v10 == v7 + a2 < a3) {
    BOOL v10 = v7 + a2 < a6;
  }
  return ((uint64_t (*)(void))(*(void *)(v9 + 8LL * ((45 * !v10) ^ v8)) - (((v8 - 199) | 0x12u) ^ 0x1ELL)))();
}

uint64_t sub_10001C28C@<X0>( int a1@<W0>, int a2@<W1>, unsigned int a3@<W2>, uint64_t a4@<X3>, unsigned int a5@<W5>, unsigned int a6@<W6>, uint64_t a7@<X7>, int a8@<W8>)
{
  BOOL v14 = a5 < a6;
  *(_BYTE *)(a4 + (a8 + v10)) = *(_BYTE *)(a7 + (v8 + a1))
  unsigned int v15 = v8 + 1 + a2;
  int v16 = v14 ^ (v15 < a3);
  BOOL v17 = v15 < a5;
  if (!v16) {
    BOOL v14 = v17;
  }
  return ((uint64_t (*)(void))(*(void *)(v13 + 8LL * ((!v14 * v12) ^ v9)) - 8LL))();
}

uint64_t sub_10001C2FC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27)
{
  int v30 = 1755732067 * ((-1664490172 - ((v29 - 160) | 0x9CC9E544) + ((v29 - 160) | 0x63361ABB)) ^ 0xBDF0A760);
  *(void *)(v29 - 160) = a27;
  *(_DWORD *)(v29 - 152) = v30 + v27 + 389;
  *(_DWORD *)(v29 - 148) = a16 - v30;
  sub_100006898(v29 - 160);
  uint64_t v31 = STACK[0x2EC] & 0x3F;
  *((_BYTE *)&STACK[0x2A8] + (v31 ^ 0x38)) = -22;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v28
                                                                        + 8LL
                                                                        * ((1696 * ((v31 ^ 0x38) > 0x37)) ^ v27))
                                                            - 4LL))( 3841410703LL,  2697778809LL,  3151335402LL);
}

uint64_t sub_10001C404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6
                                                                                + 8LL
                                                                                * (((((v5 - 1732782610) & 0x674827F7)
                                                                                   - 1145)
                                                                                  * (v4 != 63)) ^ v5)))( a1,  a2,  a3,  a4,  39LL);
}

uint64_t sub_10001C454@<X0>(int a1@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((460 * ((a1 ^ 0x329 ^ v1 ^ 0x79F) >= (v1 ^ 0x4B9))) ^ v1)) - 4LL))();
}

uint64_t sub_10001C49C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  *(void *)(a10 + v11 + v12) = v15;
  return ((uint64_t (*)(void))(*(void *)(v13 + 8LL * ((((v10 & 0x38) == 8LL) * v14) ^ v12)) - 12LL))();
}

uint64_t sub_10001C4D8()
{
  void *v1 = v5;
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * (((v2 == 0) * v4) ^ v0)) - 12LL))();
}

uint64_t sub_10001C4FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  return ((uint64_t (*)(void))(*(void *)(v8
                                        + 8LL
}

uint64_t sub_10001C534@<X0>(uint64_t a1@<X3>, unsigned int a2@<W4>, uint64_t a3@<X8>)
{
  *(_BYTE *)(a1 + a3 + v5) = v6;
  return ((uint64_t (*)(void))(*(void *)(v7
                                        + 8LL
}

void sub_10001C56C()
{
}

uint64_t sub_10001C598()
{
  return (*(uint64_t (**)(void))(v1 + 8LL * ((646 * (v0 - 2005389733 < ((v2 + 1016) ^ 0x411u))) ^ (v2 + 985))))();
}

uint64_t sub_10001C5DC()
{
  uint64_t v4 = v1;
  uint64_t v5 = v2 + v1;
  else {
    uint64_t v6 = 56LL;
  }
  return (*(uint64_t (**)(void))(v3
                              + 8LL
                              * ((31
                                * (v6 - v4 + (unint64_t)(v0 ^ 0x418u) + 2005389684 < ((587 * (v0 ^ 0x42Bu)) ^ 0x49EuLL))) ^ v0)))();
}

uint64_t sub_10001C648@<X0>(uint64_t a1@<X3>, int a2@<W8>)
{
  *(void *)(a1 + v3 + v4) = v6;
  return (*(uint64_t (**)(void))(v5
                              + 8LL * ((((a2 - 1360571879) & 0x5118AD5A) - 1026LL == (v2 & 0xFFFFFFFFFFFFFFF8LL)) | a2)))();
}

uint64_t sub_10001C690@<X0>(uint64_t a1@<X3>, int a2@<W8>)
{
  *(void *)(a1 + v2 + v5) = v7;
  return (*(uint64_t (**)(void))(v6 + 8LL * ((v5 + v4 - 1026 == v3) | a2)))();
}

uint64_t sub_10001C6B4()
{
  return (*(uint64_t (**)(void))(v3 + 8LL * ((60 * (v0 != v1)) ^ v2)))();
}

uint64_t sub_10001C6DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)(a4 + v4 + v6) = v7;
  return (*(uint64_t (**)(void))(v8 + 8LL * ((14 * ((unint64_t)(v4 + 1 + v6) > 0x37)) ^ (v5 + 979))))();
}

void sub_10001C70C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, char a11, __int16 a12, char a13)
{
  int v13 = LOBYTE(STACK[0x308]) ^ 0xE1;
  if (v13 == 1)
  {
    unsigned int v21 = STACK[0x2EC];
    unsigned int v22 = STACK[0x2E8];
    int v23 = (LODWORD(STACK[0x2EC]) >> 5) ^ 0x6B;
    LOBYTE(STACK[0x2E0]) = ((8 * LOBYTE(STACK[0x2EC])) ^ 0xC0)
                         - ((((8 * LODWORD(STACK[0x2EC])) ^ 0xFFFFFFC0) << ((a13 ^ 0x7E) & 0xE7)) & 0xD0)
                         + 106;
    LOBYTE(STACK[0x2E1]) = v23 + (a8 | ~(2 * v23)) + 107;
    char v20 = -44;
    LOBYTE(STACK[0x2E2]) = ((v21 >> 13) ^ 0x85) - ((v21 >> 12) & 0xD4) + 106;
    char v18 = a13 & 0xE7;
    LOBYTE(STACK[0x2E3]) = ((v21 >> 21) ^ 0xE6) - 2 * (((v21 >> 21) ^ 0xE6) & 0x6B ^ ((v21 & 0x200000) != 0)) + 106;
    HIDWORD(v24) = v22 ^ 0x17;
    LODWORD(v24) = v21 ^ 0x40000000;
    LOBYTE(STACK[0x2E4]) = (v24 >> 29) - ((2 * (v24 >> 29)) & 0xD4) + 106;
    LOBYTE(STACK[0x2E5]) = ((v22 >> 5) ^ 0xD) - ((2 * ((v22 >> 5) ^ 0xD)) & 0xD4) + 106;
    LOBYTE(STACK[0x2E6]) = ((v22 >> 13) ^ 0x29) - ((2 * ((v22 >> 13) ^ 0x29)) & 0xD4) + 106;
    int v19 = (v22 >> 21) ^ 0x21;
  }

  else
  {
    if (v13 != 2) {
      goto LABEL_6;
    }
    unsigned int v14 = STACK[0x2EC];
    char v15 = ((LODWORD(STACK[0x2E8]) >> 13) ^ 0x29)
        - 2 * (((LODWORD(STACK[0x2E8]) >> 13) ^ 0x29) & 0xEE ^ (LODWORD(STACK[0x2E8]) >> 13) & 4);
    HIDWORD(v16) = LODWORD(STACK[0x2E8]) ^ 0x17;
    LODWORD(v16) = LODWORD(STACK[0x2EC]) ^ 0x40000000;
    int v17 = (LODWORD(STACK[0x2E8]) >> 5) ^ 0xD;
    LOBYTE(STACK[0x2E0]) = ((LODWORD(STACK[0x2E8]) >> 21) ^ 0x21)
                         + (a11 ^ 0xC)
                         + ~(2 * (((LODWORD(STACK[0x2E8]) >> 21) ^ 0x21) & 0xEE ^ (LODWORD(STACK[0x2E8]) >> 21) & 4));
    LOBYTE(STACK[0x2E1]) = v15 + 106;
    char v18 = a11;
    LOBYTE(STACK[0x2E2]) = v17 - ((2 * v17) & 0xD4) + 106;
    LOBYTE(STACK[0x2E3]) = (v16 >> 29) - ((2 * (v16 >> 29)) & 0xD4) + 106;
    LOBYTE(STACK[0x2E4]) = ((v14 >> 21) ^ 0xE6) + (a8 | ~(2 * ((v14 >> 21) ^ 0xE6))) + 107;
    LOBYTE(STACK[0x2E5]) = ((v14 >> 13) ^ 0x85) - ((v14 >> 12) & 0xD4) + 106;
    LOBYTE(STACK[0x2E6]) = ((v14 >> 5) ^ 0x6B) - ((2 * ((v14 >> 5) ^ 0x6B)) & 0xD4) + 106;
    LOBYTE(v19) = (8 * v14) ^ 0xC0;
    char v20 = -48;
  }

  LOBYTE(STACK[0x2E7]) = (v18 ^ 0xD) + v19 - (v20 & (2 * v19));
LABEL_6:
  JUMPOUT(0x10001B33CLL);
}

uint64_t sub_10001C94C()
{
  return (*(uint64_t (**)(void))(v3 + 8LL * (((((v1 - 65) ^ 0x4F5) + 464) * ((v0 + v2) < 4)) ^ v1)))();
}

uint64_t sub_10001C978@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, int a33, char a34)
{
  LOBYTE(STACK[0x2A8]) = *(&a34 + v35);
  return (*(uint64_t (**)(void))(v36
                              + 8LL
                              * ((449 * ((((v34 & 0xFFFFFFFC) == 540907096) ^ ((a1 ^ 0xC1) + 44)) & 1)) ^ a1)))();
}

void sub_10001C9BC()
{
}

uint64_t sub_10001C9CC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, int a33, char a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, char a40)
{
  if (a34 == 2) {
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v41
  }
                                                                          + 8LL
                                                                          * (((2 * (LODWORD(STACK[0x304]) != 151311037)) | (4 * (LODWORD(STACK[0x304]) != 151311037))) ^ (v40 + 330)))
                                                              - ((v40 + 330) ^ 0x177LL)))( a1,  235795823LL,  a17);
  if (a34 == 1) {
    return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v41
  }
                                                                 + 8LL
                                                                 * (((2 * (LODWORD(STACK[0x304]) != 151311037)) | ((LODWORD(STACK[0x304]) != 151311037) << 7)) ^ (v40 + 330)))
                                                     - ((v40 + 330) ^ 0x177LL)))( a17,  235795823LL);
  LOBYTE(STACK[0x303]) = (((v40 ^ 0xB1) - 79) ^ (((unint64_t)&a40 ^ 0x7B99AFAFEC3F37FFLL)
                                               + 1
                                               + (((v40 ^ 0xB1) + 112) & (2LL * (void)&a40))) ^ 0x8B)
                       * (((unint64_t)&a40 ^ 0x7B99AFAFEC3F37FFLL)
                        + 1
                        + (((v40 ^ 0xB1) + 112) & (2LL * (void)&a40))
                        + 17);
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v41 + 8LL * (v40 ^ 0x4B1)) - 4LL))(a17, 235795823LL);
}

void sub_10001CCF8()
{
}

uint64_t sub_10001CD00@<X0>(int a1@<W1>, int a2@<W8>)
{
  uint64_t v3 = *(void *)(v7 + 32);
  uint64_t v4 = *(void *)(v7 + 40);
  memset(v8, 106, sizeof(v8));
  int v5 = (((v2 - 160) & 0xA46671A9 | ~((v2 - 160) | 0xA46671A9)) ^ 0xCF34C70F) * a1;
  *(void *)(v2 - 160) = v3;
  *(void *)(v2 - 120) = v8;
  *(_DWORD *)(v2 - 124) = (a2 + 1763) ^ v5;
  *(void *)(v2 - 144) = v2 - 180;
  *(void *)(v2 - 136) = v4;
  *(_DWORD *)(v2 - 152) = v5 + 1462279853;
  uint64_t result = ((uint64_t (*)(uint64_t))((char *)*(&off_10005BF10 + a2 + 46) - 4))(v2 - 160);
  *(_DWORD *)(v7 + 16) = *(_DWORD *)(v2 - 128);
  return result;
}

void sub_10001CDE8()
{
  v0[0] = (1178560073 * ((((2 * v0) | 0xAAB34380) - v0 - 1431937472) ^ 0xEFCDD9A2)) ^ 0x650810FC;
  sub_100045AE8(v0);
  __asm { BR              X8 }

uint64_t sub_10001CEB0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, unint64_t *a18, int a19, unsigned int a20)
{
  a18 = &STACK[0x72D239406EDD8F50];
  a20 = 1513
      - 460628867
      * ((-1402127699 - (&a18 ^ 0xA1613669 | 0xAC6D3AAD) + (&a18 ^ 0xA1613669 | 0x5392C552)) ^ 0xBE657146);
  sub_100024FE0((uint64_t)&a18);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 8LL * ((33 * (a19 != v20)) | 0x5D0)))( v22,  v23,  v24,  v25,  v26,  v27,  v28,  v29,  a9,  a10,  a11);
}

uint64_t sub_10001CF60( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19, uint64_t a20, int a21)
{
  unsigned int v24 = 1225351577 * (((&a18 | 0x7B9B81A3) + (~&a18 | 0x84647E5C)) ^ 0x5641B90);
  a18 = 1096030945 * v21 - v24 + 2084388636;
  a19 = v24 ^ 0x330;
  a20 = a14;
  uint64_t v25 = ((uint64_t (*)(int *))(*(void *)(v22 + 224) - 8LL))(&a18);
  return ((uint64_t (*)(uint64_t))(*(void *)(v23 + 8LL * ((91 * (a21 == 777158354)) ^ 0x625u)) - 4LL))(v25);
}

uint64_t sub_10001D03C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19, uint64_t a20, unint64_t *a21, int a22, int a23)
{
  unsigned int v26 = 1755732067 * (&a18 ^ 0xDEC6BDDB);
  a22 = (v23 + 2138961787) ^ v26;
  a23 = v26 ^ 0x5E0B20B2;
  a19 = v26 ^ 0x23B2D16E;
  a20 = a14;
  a21 = &STACK[0x4A65459BC62410FF];
  uint64_t v27 = sub_1000459CC((uint64_t)&a18);
  return ((uint64_t (*)(uint64_t))(*(void *)(v25
                                                      + 8LL
                                                      * (((a18 == v24)
                                                        * ((v23 - 877) ^ 0x5FF64166 ^ ((v23 + 237386463) | 0x51D00221))) ^ v23))
                                          - 4LL))(v27);
}

uint64_t sub_10001D100( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, unint64_t *a15, uint64_t a16, uint64_t a17, unsigned int a18, unint64_t *a19, unint64_t *a20)
{
  a18 = (v23 - 225) ^ (1374699841
                     * ((2 * (&a18 & 0x54F9DA60) - &a18 - 1425660514) ^ 0xC6F23D97));
  a19 = &STACK[0x5843A1C59527653B];
  a20 = a15;
  int v24 = (void (*)(unsigned int *))(*(void *)(v21 + 8LL * (v23 - 592)) - 12LL);
  v24(&a18);
  a18 = (v23 - 225) ^ (1374699841
                     * (((&a18 | 0xA4701DEF) + (~&a18 | 0x5B8FE210)) ^ 0xC98405E7));
  a19 = &STACK[0x5843A1C59527653F];
  a20 = a15;
  v24(&a18);
  a18 = (v23 - 225) ^ (1374699841
                     * (((&a18 | 0x724CF555) - (&a18 & 0x724CF555)) ^ 0x1FB8ED5C));
  a20 = a15;
  a19 = &STACK[0x5843A1C595276533];
  v24(&a18);
  a18 = (v23 - 225) ^ (1374699841
                     * ((((2 * &a18) | 0xE28A525E) - &a18 + 247125713) ^ 0x9CB13126));
  a19 = &STACK[0x5843A1C595276537];
  a20 = a15;
  v24(&a18);
  LODWORD(a20) = v23
  a19 = a15;
  uint64_t v25 = sub_100019CC0((uint64_t)&a18);
  return ((uint64_t (*)(uint64_t))(*(void *)(v22 + 8LL * ((119 * (a18 != v20)) ^ v23))
                                          - ((v23 - 111) | 0x86u)
                                          + 711LL))(v25);
}

uint64_t sub_10001D32C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17)
{
  return ((uint64_t (*)(void))(*(void *)(v18 + 8LL * ((1473 * (a17 == (v17 ^ 0x5FF641EA) - 832816211)) ^ v17)) - 8LL))();
}

uint64_t sub_10001D36C()
{
  int v5 = v0 + 1609973846;
  int *v2 = v11 ^ v4;
  int *v1 = v12 ^ v4;
  int *v7 = (v0 + 1609973846) ^ v10 ^ 0x71A43DF7;
  uint64_t v15 = v9;
  unsigned int v14 = 535753261 * ((-863361720 - (v13 | 0xCC8A2548) + (v13 | 0x3375DAB7)) ^ 0x3981D498)
      - 1609973269
      + v0
      + 1609973846;
  v3(v13);
  unsigned int v14 = 535753261
      * (((v13 | 0x27283D55) - v13 + (v13 & 0xD8D7C2A8)) ^ 0x2DDC337A)
      - 1609973269
      + v5;
  uint64_t v15 = v8;
  v3(v13);
  return v4 ^ 0x2E527ED2u;
}

void sub_10001D4B4(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

uint64_t sub_10001D4FC()
{
  return 4294925278LL;
}

void sub_10001D61C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X12 }

uint64_t sub_10001D664(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((619 * (**(_BYTE **)(a2 + 8) == 0)) ^ v3)) - 12LL))();
}

uint64_t sub_10001D690()
{
  unsigned int v2 = v1 - ((2 * v1 + 729173064) & 0x8AF98474) - 617093026;
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
                                        * ((50
                                          * (((2 * v2) & 0xB55C5A70 ^ 0x80580070) + (v2 ^ 0x9FD2EF02) + 1979177952 != 1353058584)) ^ 0x11Bu))
                            - 4LL))();
}

uint64_t sub_10001D73C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  return ((uint64_t (*)(void))(*(void *)(v5 + 8LL * ((1219 * (v7 + v6 + (a5 ^ 0x7D6) + 626118033 + 36 > 7)) ^ a5)) - 4LL))();
}

uint64_t sub_10001D790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  return ((uint64_t (*)(void))(*(void *)(v7
                                        + 8LL
                                        * (a5 ^ (1797 * ((unint64_t)(a3 - a7 - 1167) > 0x1F))))
                            - ((a5 + 157789394) & 0x157B)
                            + 1295LL))();
}

uint64_t sub_10001D7D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return ((uint64_t (*)(uint64_t, uint64_t, void))(*(void *)(v5
                                                                       + 8LL
                                                                       * (a5 ^ 0x41 ^ (30 * (v6 < 0x20))))
                                                           - (a5 ^ 0x7222C032 ^ ((a5 ^ 0x41u) - 97) ^ 0x7222C0D0LL)))( a1,  a2,  0LL);
}

uint64_t sub_10001D820(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v11 = v8 + v7 + v9 + ((a4 - 1914880481) | 0x420u);
  __int128 v12 = *(_OWORD *)(v5 + v11 - 15);
  __int128 v13 = *(_OWORD *)(v5 + v11 - 31);
  uint64_t v14 = v6 + v11;
  *(_OWORD *)(v14 - 15) = v12;
  *(_OWORD *)(v14 - 31) = v13;
  return ((uint64_t (*)(void))(*(void *)(v4 + 8LL * ((95 * ((v10 & 0xFFFFFFE0) != 32)) ^ (a4 - 1914880061))) - 4LL))();
}

void sub_10001D884()
{
}

uint64_t sub_10001D890(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(a1 + 96) + 1424LL) = v3 + 902 + v2 - 1637306330;
  *(void *)(*(void *)(a1 + 96) + 520LL) = *(void *)(a2 + 8) + 1LL;
  return 0LL;
}

void sub_10001DAB4(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 28) + 108757529 * (((a1 | 0xFA9FB8B3) - (a1 & 0xFA9FB8B3)) ^ 0x1A03DA98);
  __asm { BR              X9 }

uint64_t sub_10001DB70@<X0>(uint64_t a1@<X8>, unsigned int a2, int a3, uint64_t a4, int a5)
{
  int v10 = *(_DWORD *)(v5 - 0x3C9E4FFE00180D43LL);
  unsigned int v11 = 1178560073 * (((&a2 | 0xB78A9F27) + (~&a2 | 0x487560D8)) ^ 0xD1EE744);
  a2 = v11 + 1216758198;
  a3 = v11 - 1430065503 + v10;
  a5 = (v9 + 1333) ^ v11;
  a4 = v5;
  uint64_t v12 = ((uint64_t (*)(unsigned int *))(*(void *)(a1 + 8LL * (v9 ^ 0x1FC)) - 8LL))(&a2);
  return ((uint64_t (*)(uint64_t))(*(void *)(v8 + 8LL * ((1306 * (*v7 == v6)) ^ v9)) - 4LL))(v12);
}

uint64_t sub_10001DC28()
{
  return (*(uint64_t (**)(void))(v1
                              + 8LL
                              * (((*v0 != 0x43C85E0409B7388DLL) * (v2 + 1326 + ((v2 - 1072588661) & 0x3FEE6756) - 1977)) ^ (v2 + 1326))))();
}

uint64_t sub_10001DC78()
{
  *(void *)(v1 - 0x43C85E0409B7388DLL) = (*v3 - 2013491068)
                                         + *(void *)(v2 - 0x3C9E4FFE00180D53LL)
                                         + 8LL;
  BOOL v7 = *v5 != ((v0 + 30) ^ (v4 + 224));
  return ((uint64_t (*)(void))(*(void *)(v6 + 8LL * (((2 * v7) | (32 * v7)) ^ v0)) - 2 * (v0 ^ 0x1F2) + 348LL))();
}

void sub_10001DCF8(int a1@<W8>)
{
  uint64_t v6 = *(void *)(v3 + v2);
  unsigned int v7 = *v4 + v1;
  *(_BYTE *)(v6 + v7) = 106;
  *(_BYTE *)(v6 + v7 + 1) = -111;
  *(_BYTE *)(v6 + v7 + 2) = 115;
  *(_BYTE *)(v6 + v7 + 3) = 50;
  uint64_t v8 = *(void *)(v3 + v2);
  unsigned int v9 = ((2 * (v1 + *v4 + 4)) & 0xFFEAD796) + ((v1 + *v4 + 4) ^ 0xFFF56BCB) + 693301;
  *(_BYTE *)(v8 + v9) = 106;
  *(_BYTE *)(v8 + v9 + 1) = 106;
  *(_BYTE *)(v8 + v9 + 2) = 106;
  *(_BYTE *)(v8 + v9 + 3) = 110;
  _DWORD *v4 = a1 + v5 - 1666;
}

void sub_10001DDD8(uint64_t a1)
{
  __asm { BR              X8 }

uint64_t sub_10001DE18(uint64_t a1)
{
  int v3 = (*(uint64_t (**)(void))(v1 + 1352))();
  if (v3 == 16) {
    unsigned int v4 = -42029;
  }
  else {
    unsigned int v4 = -42030;
  }
  if (v3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0LL;
  }
  (*(void (**)(uint64_t))(v1 + 208))(a1);
  return v5;
}

void sub_10001DE70(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }

uint64_t sub_10001DEE0@<X0>(int a1@<W8>)
{
  BOOL v2 = ((a1 - 1782897115) ^ 0x4FC1FC7FABF7EE4ELL)
     - 0x4FC1FC7EB6547BF7LL
     + ((2LL * (a1 - 1782897115)) & 0x157EFDC9CLL) != 4121129559LL;
  return (*(uint64_t (**)(void))(v1 + 8LL * ((4 * v2) | (16 * v2) | 0x4A8u)))();
}

uint64_t sub_10001DF90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  int v13 = *(unsigned __int8 *)(v10 + v11 - 0x19CE9C47BAED03F5LL) - *(unsigned __int8 *)(v9 + v11 - 0x19CE9C47BAED03F5LL);
  return (*(uint64_t (**)(uint64_t))(v12
                                            + 8LL
                                            * ((1021
                                              * (((v13 << (a7 + ((v8 - 4) & 0xF7) - 59)) & 0x2E7FFDEE) + (v13 ^ v7) != v7)) ^ v8)))(4294925278LL);
}

uint64_t sub_10001E008()
{
  BOOL v7 = v3 < v4;
  int v8 = v1 + v2 - 314 + 58;
  if (v7 == v5 - 0x19CE9C46C549919DLL < (v8 & 0x1A36DE9F ^ v0)) {
    BOOL v7 = v5 - 0x19CE9C46C549919DLL < v3;
  }
  return (*(uint64_t (**)(void))(v6 + 8LL * ((v7 * (v8 ^ v1 ^ 0x5F6)) ^ (v2 - 314))))();
}

uint64_t sub_10001E07C@<X0>(unsigned int a1@<W0>, int a2@<W8>)
{
  return (*(uint64_t (**)(uint64_t))(v2
                                            + 8LL * (((a2 == (((a1 - 1547) | 0x3AA) ^ 0x6A44DA5A)) * (a1 ^ 0x64A)) ^ a1)))(4294925278LL);
}

uint64_t sub_10001E0BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5
                                                                                 + 8LL
                                                                                 * (((((2 * (*v4 - 42)) & 0xAFFAFFF6)
                                                                                    + ((*v4 - 42) ^ 0x57FD7FFB) == 1476231163)
                                                                                   * (((v3 ^ 0x2CA) + 570) ^ 0x5B2)) ^ v3))
                                                                     - 12LL))( a1,  a2,  a3,  1029560022LL);
}

uint64_t sub_10001E124()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v2 + 1) - 134)))
                                           + ((*(unsigned __int8 *)(v2 + 1) - 134) ^ v0) != v0)
                                          * (479 * (((v3 - 590) | 0x14) ^ 0x176) - 942)) ^ v3))
                            - 12LL))();
}

uint64_t sub_10001E178()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1477
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 2) - 72)))
}

uint64_t sub_10001E1BC()
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v3 + 3) - 134)))
                                           + ((*(unsigned __int8 *)(v3 + 3) - 134) ^ v0) == v0)
                                          * (v2 ^ 0x7F1)) ^ v4))
                            - 12LL))();
}

uint64_t sub_10001E1F8()
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * ((1505
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 4) - 247)))
}

uint64_t sub_10001E238()
{
  return ((uint64_t (*)(void))(*(void *)(v6
                                        + 8LL
                                        * ((1629
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 5) - 13)))
}

uint64_t sub_10001E274()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((2035
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 6) - 1)))
}

uint64_t sub_10001E2C4()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1740
                                          * (((v1 + 62 * (v3 ^ 0x3B8) - 372) & (2 * (*(unsigned __int8 *)(v2 + 7) - 1)))
}

uint64_t sub_10001E314()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1507
                                          * (((((v3 - 606) | 0x14) ^ (v1 - 372)) & (2
                                                                                  * (*(unsigned __int8 *)(v2 + 8) - 4)))
}

uint64_t sub_10001E360(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(v4 + 96) + 1428LL) = 1310458979;
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * (((*(_DWORD *)(a2 + 4) == ((88 * ((v3 - 76) ^ 0x361)) ^ v2))
                                          * ((62 * ((v3 - 76) ^ 0x374)) ^ 0x1B8)) ^ (v3 - 76)))
                            - 12LL))();
}

uint64_t sub_10001E3CC(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * ((2023
                                          * ((((**(unsigned __int8 **)(a2 + 8) - 42) << ((v4 - 78) ^ 0x27)) & v3)
}

uint64_t sub_10001E414()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1912
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 1) - 134)))
}

uint64_t sub_10001E460()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((968
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 2) - 72)))
}

uint64_t sub_10001E4AC()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1904
                                          * (((v1 + 3 * (v2 ^ 0x116) - 294) & (2 * (*(unsigned __int8 *)(v3 + 3) - 134)))
}

uint64_t sub_10001E500()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((88
                                          * ((((*(unsigned __int8 *)(v2 + 4) - 247) << ((v3 + 72) ^ 0x75)) & v1)
}

uint64_t sub_10001E550()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1969
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 5) - 13)))
}

uint64_t sub_10001E594()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1108
                                          * ((((v2 + 729775563) & 0xD48081E6 ^ (v1 - 294)) & (2
                                                                                            * (*(unsigned __int8 *)(v3 + 6)
                                                                                             - 1)))
}

uint64_t sub_10001E5E8()
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * ((1970
                                          * ((((*(unsigned __int8 *)(v3 + 7) - 1) << (v4 ^ 0x27)) & v1)
}

uint64_t sub_10001E62C()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((594
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 8) - 5)))
}

uint64_t sub_10001E670(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(v4 + 96) + 1428LL) = 1310458983;
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * (((*(_DWORD *)(a2 + 4) != ((v3 + 1300) ^ v2)) * (((v3 - 338) | 0x104) + 224)) ^ v3))
                            - 12LL))();
}

uint64_t sub_10001E6C8(uint64_t a1, uint64_t a2)
{
  unsigned int v6 = **(unsigned __int8 **)(a2 + 8) + (((v4 - 294) | 0x372) ^ 0xFFFFFCA4);
  return ((uint64_t (*)(void))(*(void *)(v5 + 8LL * ((1957 * ((v3 & (2 * v6)) + (v6 ^ v2) == v2)) ^ v4)) - 8LL))();
}

uint64_t sub_10001E714()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((630
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 1) - 134)))
                                           + ((v3 - 1671760308) & 0x63A50BFF ^ (v0 - 882) ^ (*(unsigned __int8 *)(v2 + 1)
                                                                                           - 134)) == v0)) ^ v3))
                            - 8LL))();
}

uint64_t sub_10001E768()
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * ((123
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 2) - 72)))
}

uint64_t sub_10001E7A4()
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * ((749
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 3) - 134)))
}

uint64_t sub_10001E7E0()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v2 + 4) - 247)))
                                           + ((*(unsigned __int8 *)(v2 + 4) - 247) ^ v0) == v0)
                                          * ((v3 + 588) ^ 0x647)) ^ v3))
                            - 8LL))();
}

uint64_t sub_10001E81C()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((981
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 5) - 13)))
                                           + ((*(unsigned __int8 *)(v2 + 5) - 13) ^ v0) == v0
                                                                                         + ((v3 + 1120151737) & 0xBD3BD6F6)
                                                                                         - 214)) ^ v3))
                            - 8LL))();
}

uint64_t sub_10001E870()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((496
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 6) - 1)))
                                           + ((*(unsigned __int8 *)(v2 + 6) - 1) ^ v0) != v0)) ^ v3))
                            - 42 * (v3 ^ 0xD1u)
                            + 286LL))();
}

uint64_t sub_10001E8C0()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * (int)((811
                                               * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 7) - 1)))
}

uint64_t sub_10001E904()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1018
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 8) - 11)))
                                           + ((*(unsigned __int8 *)(v2 + 8) - 11) ^ v0) == v0)) ^ v3))
                            - 14 * (((v3 - 198) | 0x312) ^ 0x34Du)
                            + 874LL))();
}

void sub_10001E958()
{
  unsigned int v4 = (v0 + 166452008) & 0xF61427ED;
  *(_DWORD *)(*(void *)(v1 + 96) + 1428LL) = 1310458995;
  int v5 = 235795823 * ((v3 - 2123568225 - 2 * ((v3 - 120) & 0x816CEC17)) ^ 0x15C1A54E);
  *(_DWORD *)(v3 - 116) = v5 + 1108854010 + (((((2 * v4) ^ 0xFEA) - 690) | 0x303) ^ 0x48729BD6);
  *(_DWORD *)(v3 - 112) = v4 - v5 + 1172343763;
  *(void *)(v3 - 104) = v3 + 0x5934B92A3842FA18LL;
  sub_100022668(v3 - 120);
  __asm { BR              X10 }

uint64_t sub_10001EBA8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, int a21)
{
  unsigned int v25 = v23 - 2125332344;
  if (v25 <= 0x40) {
    unsigned int v25 = 64;
  }
  return (*(uint64_t (**)(void))(v24
                              + 8LL
                              * ((164 * (a8 - v21 - v22 + v25 >= ((a21 - a7 - 783) ^ (a5 + 3)))) ^ a21)))();
}

uint64_t sub_10001EC1C(int a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v14 = v9 + v8;
  int v15 = v14 + v10;
  return (*(uint64_t (**)(void))(v13
                              + 8LL
                              * ((44 * (((a8 - v14 < (a1 + v15)) ^ (v11 - 14)) & 1)) ^ a4)))();
}

uint64_t sub_10001EC5C( uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return (*(uint64_t (**)(void))(v15
                              + 8LL
                              * (((a7 + a4 + 719 + a5 + a4 - 843 + 305)
                                * (a13 + v16 - 220 + (unint64_t)(v14 + v13 - 1) > 0xF)) ^ a4)))();
}

uint64_t sub_10001ECA4@<X0>(uint64_t a1@<X8>)
{
  v7.i64[0] = 0xD4D4D4D4D4D4D4D4LL;
  v7.i64[1] = 0xD4D4D4D4D4D4D4D4LL;
  v8.i64[0] = 0x6A6A6A6A6A6A6A6ALL;
  v8.i64[1] = 0x6A6A6A6A6A6A6A6ALL;
  *(int8x16_t *)(v3 + (((v2 ^ 0x7B3u) + 4294966870LL) & (a1 + v1))) = vaddq_s8( vsubq_s8(*v5, vandq_s8(vaddq_s8(*v5, *v5), v7)),  v8);
  return (*(uint64_t (**)(void))(v6 + 8LL * ((37 * (((v4 + 1) & 0x1FFFFFFF0LL) == 16)) ^ v2)))();
}

void sub_10001ED10()
{
}

uint64_t sub_10001ED1C@<X0>(int a1@<W4>, int a2@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v4 + 8LL * (a2 ^ (104 * (v2 == v3))))
                            + 1029559802LL
}

uint64_t sub_10001ED5C@<X0>(int a1@<W5>, int a2@<W6>, int a3@<W8>)
{
  *(_BYTE *)(v8 - 220 + (a3 + v3)) = *(_BYTE *)(v4 + v6 - 1907374239)
                                                 - ((2 * *(_BYTE *)(v4 + v6 - 1907374239)) & 0xD4)
                                                 + 106;
}

uint64_t sub_10001EDC4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unint64_t a17, unint64_t a18, uint64_t (*a19)(__n128, __n128, __n128, __n128, __n128), uint64_t a20, uint64_t a21, uint64_t a22, int32x4_t a23, int32x4_t a24, int32x4_t a25, int32x4_t a26)
{
  uint64_t v95 = v27;
  HIDWORD(a16) = HIDWORD(a12) + 1956918515;
  LODWORD(a16) = -1311699269;
  uint64_t v36 = (const char *)(v34 - 220);
  __n128 v37 = (__n128)vdupq_n_s32(0x2E527EDFu);
  __n128 v38 = (__n128)vdupq_n_s32(0x2E527ED2u);
  v39.n128_u64[0] = 0x6A6A6A6A6A6A6A6ALL;
  v39.n128_u64[1] = 0x6A6A6A6A6A6A6A6ALL;
  HIDWORD(a20) = (a5 - 1907603738) & 0x3455E2FB;
  a21 = v33 - 16;
  v40.n128_u64[0] = 0xD4D4D4D4D4D4D4D4LL;
  v40.n128_u64[1] = 0xD4D4D4D4D4D4D4D4LL;
  __n128 v41 = (__n128)vdupq_n_s32(0x2E527EDBu);
  LODWORD(a20) = 164;
  unsigned int v42 = *(_DWORD *)(v34 - 148);
  unsigned int v43 = *(_DWORD *)(v34 - 144);
  unsigned int v45 = *(_DWORD *)(v34 - 140);
  unsigned int v44 = *(_DWORD *)(v34 - 136);
  uint64_t v46 = v44;
  int v47 = *(_BYTE *)(v34 - 124) ^ 0xE1;
  HIDWORD(a15) = *(unsigned __int8 *)(v34 - 124) ^ 0xFFFFFFE1;
  if (v47 == 2)
  {
    a17 = __PAIR64__(v43, v42);
    a18 = __PAIR64__(v44, v45);
    a19 = v35;
    int8x16x4_t v97 = vld4q_s8(v36);
    uint64_t v72 = *(unsigned int *)(v34 - 132);
    uint8x16_t v73 = (uint8x16_t)veorq_s8(v97.val[0], (int8x16_t)v39);
    uint16x8_t v74 = vmovl_u8(*(uint8x8_t *)v73.i8);
    uint16x8_t v75 = vmovl_high_u8(v73);
    uint8x16_t v76 = (uint8x16_t)veorq_s8(v97.val[1], (int8x16_t)v39);
    _Q22 = vmovl_u8(*(uint8x8_t *)v76.i8);
    _Q21 = vmovl_high_u8(v76);
    __asm
    {
      SHLL2           V23.4S, V21.8H, #0x10
      SHLL2           V24.4S, V22.8H, #0x10
    }

    uint8x16_t v81 = (uint8x16_t)veorq_s8(v97.val[2], (int8x16_t)v39);
    uint16x8_t v82 = vmovl_high_u8(v81);
    uint16x8_t v83 = vmovl_u8(*(uint8x8_t *)v81.i8);
    v97.val[0] = veorq_s8(v97.val[3], (int8x16_t)v39);
    v97.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v97.val[0]);
    v97.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v97.val[1]);
    v97.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v97.val[1].i8);
    v97.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v97.val[0].i8);
    v97.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v97.val[0]);
    v97.val[0] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v97.val[0].i8);
    int32x4_t v84 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8( (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL),  (int8x16_t)vshll_n_u16(*(uint16x4_t *)v83.i8, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v74.i8), 0x18uLL)),  v97.val[0]);
    int32x4_t v85 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8(_Q24, (int8x16_t)vshll_high_n_u16(v83, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v74), 0x18uLL)),  v97.val[3]);
    int32x4_t v86 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8( (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL),  (int8x16_t)vshll_n_u16(*(uint16x4_t *)v82.i8, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v75.i8), 0x18uLL)),  v97.val[1]);
    int32x4_t v87 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8(_Q23, (int8x16_t)vshll_high_n_u16(v82, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v75), 0x18uLL)),  v97.val[2]);
    v97.val[0] = veorq_s8( vandq_s8((int8x16_t)v84, (int8x16_t)v37),  (int8x16_t)(*(_OWORD *)v97.val & __PAIR128__(0xFFFFFF0DFFFFFF0DLL, 0xFFFFFF0DFFFFFF0DLL)));
    v97.val[3] = veorq_s8( vandq_s8((int8x16_t)v85, (int8x16_t)v37),  (int8x16_t)(*(_OWORD *)&v97.val[3] & __PAIR128__(0xFFFFFF0DFFFFFF0DLL, 0xFFFFFF0DFFFFFF0DLL)));
    v97.val[1] = veorq_s8( vandq_s8((int8x16_t)v86, (int8x16_t)v37),  (int8x16_t)(*(_OWORD *)&v97.val[1] & __PAIR128__(0xFFFFFF0DFFFFFF0DLL, 0xFFFFFF0DFFFFFF0DLL)));
    v97.val[2] = veorq_s8( vandq_s8((int8x16_t)v87, (int8x16_t)v37),  (int8x16_t)(*(_OWORD *)&v97.val[2] & __PAIR128__(0xFFFFFF0DFFFFFF0DLL, 0xFFFFFF0DFFFFFF0DLL)));
    a25 = vaddq_s32(vsubq_s32(v86, vaddq_s32((int32x4_t)v97.val[1], (int32x4_t)v97.val[1])), (int32x4_t)v38);
    a26 = vaddq_s32(vsubq_s32(v87, vaddq_s32((int32x4_t)v97.val[2], (int32x4_t)v97.val[2])), (int32x4_t)v38);
    a23 = vaddq_s32(vsubq_s32(v84, vaddq_s32((int32x4_t)v97.val[0], (int32x4_t)v97.val[0])), (int32x4_t)v38);
    a24 = vaddq_s32(vsubq_s32(v85, vaddq_s32((int32x4_t)v97.val[3], (int32x4_t)v97.val[3])), (int32x4_t)v38);
    int v88 = (_DWORD *)&a23 + v31 + 440434045;
    int v89 = *(v88 - 8) ^ *(v88 - 3);
    uint64_t v90 = *(v88 - 16);
    int v91 = v90 ^ *(v88 - 14) ^ (v89 + v32 - ((((HIDWORD(a20) - 174) | 0x170) + 1554316330) & (2 * v89)));
    HIDWORD(v93) = v91 ^ v32;
    LODWORD(v93) = v91;
    int v92 = v93 >> 31;
    uint64_t v94 = (2 * v92) & 0x5CA4FDA4;
    _DWORD *v88 = v92 + v32 - v94;
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t (*)(__n128, __n128, __n128, __n128, __n128), uint64_t, uint64_t, uint64_t))(*(void *)(v28 + 8LL * ((1093 * (v33 == 440433982)) | HIDWORD(a20))) - 4LL))( 502LL,  v94,  1554316330LL,  v72,  v90,  v46,  a7,  v45,  a9,  a10,  a11,  a12,  a13,  v95,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22);
  }

  else if (v47 == 1)
  {
    a17 = __PAIR64__(v43, v42);
    a18 = __PAIR64__(v44, v45);
    a19 = v35;
    int8x16x4_t v96 = vld4q_s8(v36);
    uint8x16_t v48 = (uint8x16_t)veorq_s8(v96.val[0], (int8x16_t)v39);
    uint16x8_t v49 = vmovl_u8(*(uint8x8_t *)v48.i8);
    int8x16_t v50 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v49.i8);
    int8x16_t v51 = (int8x16_t)vmovl_high_u16(v49);
    uint16x8_t v52 = vmovl_high_u8(v48);
    int8x16_t v53 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v52.i8);
    int8x16_t v54 = (int8x16_t)vmovl_high_u16(v52);
    uint8x16_t v55 = (uint8x16_t)veorq_s8(v96.val[1], (int8x16_t)v39);
    uint16x8_t v56 = vmovl_high_u8(v55);
    uint16x8_t v57 = vmovl_u8(*(uint8x8_t *)v55.i8);
    uint8x16_t v58 = (uint8x16_t)veorq_s8(v96.val[2], (int8x16_t)v39);
    _Q26 = (int8x16_t)vmovl_high_u8(v58);
    _Q25 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v58.i8);
    int8x16_t v61 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q25.i8, 0x10uLL);
    __asm { SHLL2           V25.4S, V25.8H, #0x10 }

    int8x16_t v66 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q26.i8, 0x10uLL);
    __asm { SHLL2           V26.4S, V26.8H, #0x10 }

    v96.val[0] = veorq_s8(v96.val[3], (int8x16_t)v39);
    v96.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v96.val[0]);
    v96.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v96.val[1]);
    v96.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v96.val[0].i8);
    v96.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v96.val[0]);
    v96.val[0] = vorrq_s8( vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v96.val[0].i8), 0x18uLL), v61),  vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v57.i8, 8uLL), v50));
    v96.val[3] = vorrq_s8( vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v96.val[3], 0x18uLL), _Q25),  vorrq_s8((int8x16_t)vshll_high_n_u16(v57, 8uLL), v51));
    v96.val[1] = vorrq_s8( vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v96.val[1].i8), 0x18uLL), v66),  vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v56.i8, 8uLL), v53));
    v96.val[2] = vorrq_s8( vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v96.val[2], 0x18uLL), _Q26),  vorrq_s8((int8x16_t)vshll_high_n_u16(v56, 8uLL), v54));
    int32x4_t v67 = (int32x4_t)veorq_s8( vandq_s8(v96.val[0], (int8x16_t)v41),  (int8x16_t)(*(_OWORD *)&v50 & __PAIR128__(0xFFFFFF09FFFFFF09LL, 0xFFFFFF09FFFFFF09LL)));
    int32x4_t v68 = (int32x4_t)veorq_s8( vandq_s8(v96.val[3], (int8x16_t)v41),  (int8x16_t)(*(_OWORD *)&v51 & __PAIR128__(0xFFFFFF09FFFFFF09LL, 0xFFFFFF09FFFFFF09LL)));
    int32x4_t v69 = (int32x4_t)veorq_s8( vandq_s8(v96.val[1], (int8x16_t)v41),  (int8x16_t)(*(_OWORD *)&v53 & __PAIR128__(0xFFFFFF09FFFFFF09LL, 0xFFFFFF09FFFFFF09LL)));
    int32x4_t v70 = (int32x4_t)veorq_s8( vandq_s8(v96.val[2], (int8x16_t)v41),  (int8x16_t)(*(_OWORD *)&v54 & __PAIR128__(0xFFFFFF09FFFFFF09LL, 0xFFFFFF09FFFFFF09LL)));
    a25 = vaddq_s32(vsubq_s32((int32x4_t)v96.val[1], vaddq_s32(v69, v69)), (int32x4_t)v38);
    a26 = vaddq_s32(vsubq_s32((int32x4_t)v96.val[2], vaddq_s32(v70, v70)), (int32x4_t)v38);
    a23 = vaddq_s32(vsubq_s32((int32x4_t)v96.val[0], vaddq_s32(v67, v67)), (int32x4_t)v38);
    a24 = vaddq_s32(vsubq_s32((int32x4_t)v96.val[3], vaddq_s32(v68, v68)), (int32x4_t)v38);
    return ((uint64_t (*)(__n128))(*(void *)(v28 + 8LL * ((1283 * (a21 + 1 != v33)) ^ 0x1F6u)) - 8LL))(v37);
  }

  else
  {
    *(_DWORD *)(v34 - 148) = 2 * (v42 ^ v29) + v29 - (v30 & (4 * (v42 ^ v29)));
    *(_DWORD *)(v34 - 144) = 2 * (v43 ^ v29) + v29 - (v30 & (4 * (v43 ^ v29)));
    *(_DWORD *)(v34 - 140) = 2 * (v45 ^ v29) + v29 - (v30 & (4 * (v45 ^ v29)));
    *(_DWORD *)(v34 - 136) = 2 * (v44 ^ v29) + v29 - (v30 & (4 * (v44 ^ v29)));
    return v35(v37, v38, v39, v40, v41);
  }

void sub_10001EE88()
{
}

void sub_10001F100()
{
}

uint64_t sub_10001F114(unsigned int a1, uint64_t a2)
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((1014 * (a2 + 1 == v3 + 16)) ^ a1)) - 8LL))();
}

uint64_t sub_10001F1EC()
{
  return (*(uint64_t (**)(void))(v2 + 8LL * (((8 * (v1 + 1 == v3 + 32)) | (32 * (v1 + 1 == v3 + 32))) ^ v0)))();
}

uint64_t sub_10001F2B4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(v3 + 8LL * ((43 * (a2 + 1 != v4 + 48)) ^ v2)))();
}

void sub_10001F38C()
{
}

uint64_t sub_10001F578()
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * (((v0 + 1 == v3 + 4) | (4 * (v0 + 1 == v3 + 4))) ^ v1)) - 12LL))();
}

uint64_t sub_10001F650(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return ((uint64_t (*)(void))(*(void *)(v5 + 8LL * ((22 * (a2 + 1 == v6 + 24)) ^ a5)) - 4LL))();
}

uint64_t sub_10001F70C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return ((uint64_t (*)(void))(*(void *)(v8 + 8LL * ((1128 * (v7 + 1 == v9 + 44)) ^ a7)) - 4LL))();
}

uint64_t sub_10001F7E8()
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((900 * (v0 + 1 == v3 + 64)) ^ v1)) - 4LL))();
}

void sub_10001F8A8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  *(_DWORD *)(v8 - 132) = (a5 ^ v6)
                        + (a4 ^ v6)
                        - (v7 & (2 * ((a5 ^ v6) + (a4 ^ v6))))
                        + ((v5 + 1029559820) ^ 0x1B06934B);
  JUMPOUT(0x10001F8FCLL);
}

uint64_t sub_10001F97C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, uint64_t a15, unsigned int a16, unsigned int a17)
{
  unsigned int v18 = (((a7 + a5 + 678) | 0x18) ^ 0x4020D4A6) + a14;
  BOOL v19 = v18 < 5 * (a5 ^ (a5 + 248)) - 1311700669;
  BOOL v20 = v18 > a17;
  if (a17 < a16 != v19) {
    BOOL v21 = v19;
  }
  else {
    BOOL v21 = v20;
  }
  return ((uint64_t (*)(void))(*(void *)(v17 + 8LL * ((231 * v21) ^ (a7 + a5 + 1587))) - 12LL))();
}

uint64_t sub_10001FA14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v8
                                                               + 8LL
                                                               * (((((v6 + 268701514) | 0x2D59C214) ^ (a5 - 4))
                                                                 * (v5 + v7 + 63 < (v5 + v7))) | v6))
                                                   - ((v6 - 394638716) & 0x1785B57F ^ 0x574LL)))( a1,  61LL);
}

uint64_t sub_10001FA88( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return ((uint64_t (*)(void))(*(void *)(v16
                                        + 8LL
                                        * (((a13
                                           + v14
                                           - (unint64_t)((((v15 + 671923846) | 0x155112D4) ^ 0xB31211B7) + v13) > 0xF)
                                          * (v15 - 404)) ^ v15))
                            - 8LL))();
}

uint64_t sub_10001FAE0( double a1, double a2, int8x16_t a3, int8x16_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, int a11, int a12)
{
  int8x16_t v18 = *(int8x16_t *)(v16 + v15 + v12 + 4 * ((v14 - a11 - 1344) ^ (a9 + 3)) - 60);
  int8x16_t *v13 = vaddq_s8(vsubq_s8(v18, vandq_s8(vaddq_s8(v18, v18), a4)), a3);
  return ((uint64_t (*)(void))(*(void *)(v17 + 8LL * (a12 ^ (v14 - 1134))) - 4LL))();
}

uint64_t sub_10001FB50@<X0>(char a1@<W1>, char a2@<W5>, int a3@<W6>, uint64_t a4@<X8>)
{
  *(_BYTE *)(v6 + a4) = *(_BYTE *)(v8 + (v4 + v7))
  return ((uint64_t (*)(void))(*(void *)(v9 + 8LL * ((a4 != 63) | (v5 + a3 + 210))) - 4LL))();
}

uint64_t sub_10001FB9C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  BOOL v16 = v13 - 1271666358 < (a13 - 390641631);
  return ((uint64_t (*)(void))(*(void *)(v14 + 8LL * ((v16 * ((v15 - 714) ^ 0x1D3)) ^ v15)) - 4LL))();
}

uint64_t sub_10001FC04( int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  int v15 = a5 + (a1 ^ 0x1FD) - 461;
  int v16 = 1755732067 * ((((v14 - 120) | 0xE413AAA9) + (~(v14 - 120) | 0x1BEC5556)) ^ 0x3AD51773);
  *(void *)(v14 - 120) = a10;
  *(_DWORD *)(v14 - 112) = v16 + a1 + 363;
  *(_DWORD *)(v14 - 108) = a13 - v16 + 3 * (a1 ^ 0x1FD) - 206763187;
  uint64_t v17 = sub_100006898(v14 - 120);
  unsigned int v18 = v15 ^ 0x3D5DD6EE ^ *(_DWORD *)(v14 - 152) & 0x3F;
  *(_BYTE *)(v14 - 220 + v18) = -22;
  return ((uint64_t (*)(uint64_t))(*(void *)(v13 + 8LL * ((1542 * (v18 > 0x37)) ^ a1)) - 4LL))(v17);
}

uint64_t sub_10001FD10( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20, int a21)
{
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v22
                                                               + 8LL * (a21 ^ ((2 * (v21 != 63)) | (8 * (v21 != 63)))))
                                                   - ((a21 - 583) ^ 0x3D5DD5FALL ^ ((a21 + 559726761) | 0x1C0110C6u))))( a1,  -1725582777LL);
}

uint64_t sub_10001FD68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  return (*(uint64_t (**)(void))(v9 + 8LL * ((7 * (((a7 + a5 + (v8 ^ 0x74F) - 1135 - 53) ^ v7) > 7)) ^ v8)))();
}

uint64_t sub_10001FDA0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)(v5 - 220 + a2 + a1) = 0x6A6A6A6A6A6A6A6ALL;
}

uint64_t sub_10001FDF4@<X0>(int a1@<W8>)
{
  *(_BYTE *)(v9 - 220 + (a1 - 1854466921)) = *(_BYTE *)(v6 + (v1 + v4))
  unsigned int v10 = v1 + 1 + v3;
  int v11 = (v2 < v5) ^ (v10 < v5);
  BOOL v12 = v10 < v2;
  if (v11) {
    BOOL v12 = v2 < v5;
  }
  return ((uint64_t (*)(void))(*(void *)(v7 + 8LL * ((483 * v12) ^ v8)) - 4LL))();
}

uint64_t sub_10001FE78@<X0>(int a1@<W4>, int a2@<W6>, int a3@<W8>)
{
  return ((uint64_t (*)(uint64_t))(*(void *)(v3
                                                      + 8LL
}

uint64_t sub_10001FEBC@<X0>(uint64_t a1@<X0>, int a2@<W4>, int a3@<W6>, unsigned int a4@<W8>)
{
  int v6 = v4 + 1353;
  int v7 = v4 + 1353 - a3 - 1293;
  uint64_t v8 = (v4 + 645);
  uint64_t v9 = a4;
  uint64_t v10 = a1 + a4;
  else {
    uint64_t v11 = 56LL;
  }
  return (*(uint64_t (**)(void))(v5
                              + 8LL
                              * (((v11 - v9 + 1725582777 >= (unint64_t)(v8 - 637)) * (v7 ^ (a2 - 163))) ^ v6)))();
}

uint64_t sub_10001FF1C(uint64_t a1)
{
  *(void *)(v5 - 220 + v3 + ((v1 + 683) ^ (unint64_t)(a1 + 1328))) = 0x6A6A6A6A6A6A6A6ALL;
  return ((uint64_t (*)(void))(*(void *)(v4 + 8LL * ((1759 * ((v2 & 0xFFFFFFFFFFFFFFF8LL) == 8)) ^ v1)) - 8LL))();
}

uint64_t sub_10001FF68(double a1)
{
  *(double *)(v6 + (v3 ^ v2)) = a1;
  return ((uint64_t (*)(void))(*(void *)(v7 + 8LL * (((v5 == 0) * v4) ^ v1)) - 8LL))();
}

uint64_t sub_10001FF94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(void))(v8 + 8LL * (((v7 ^ (a5 - 752) ^ (a5 - 39)) * (v5 != v6)) ^ v7)))();
}

void sub_10001FFBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, char a7)
{
  int v8 = *(unsigned __int8 *)(v7 - 124) ^ 0xE1;
  if (v8 == 1)
  {
    unsigned int v15 = *(_DWORD *)(v7 - 156);
    unsigned int v14 = *(_DWORD *)(v7 - 152);
    *(_BYTE *)(v7 - 164) = ((8 * v14) ^ 0xC0) - ((2 * ((8 * v14) ^ 0xC0)) & 0xDF) + 106;
    *(_BYTE *)(v7 - 163) = ((v14 >> 5) ^ 0x6B) + (~(2 * ((v14 >> 5) ^ 0x6B)) | 0x2B) + 107;
    char v13 = -44;
    *(_BYTE *)(v7 - 162) = ((v14 >> 13) ^ 0x85) - ((v14 >> 12) & 0xD4) + 106;
    *(_BYTE *)(v7 - 161) = ((v14 >> 21) ^ 0xE6) - ((2 * ((v14 >> 21) ^ 0xE6)) & 0xD4) + 106;
    HIDWORD(v16) = v15 ^ 0x17;
    LODWORD(v16) = v14 ^ 0x40000000;
    *(_BYTE *)(v7 - 160) = (v16 >> 29) - ((2 * (v16 >> 29)) & 0xD4) + 106;
    *(_BYTE *)(v7 - 159) = ((v15 >> 5) ^ 0xD) - ((2 * ((v15 >> 5) ^ 0xD)) & 0xD4) + 106;
    *(_BYTE *)(v7 - 158) = ((v15 >> 13) ^ 0x29) - ((2 * ((v15 >> 13) ^ 0x29)) & 0xD4) + 106;
    char v10 = 100;
    unsigned int v12 = (v15 >> 21) ^ 0x21;
  }

  else
  {
    if (v8 != 2) {
      goto LABEL_6;
    }
    unsigned int v12 = *(_DWORD *)(v7 - 156);
    unsigned int v9 = *(_DWORD *)(v7 - 152);
    char v10 = a7 + a5 + 40;
    *(_BYTE *)(v7 - 164) = ((v12 >> 21) ^ 0x21) - ((v10 ^ 0xB0) & (2 * ((v12 >> 21) ^ 0x21))) + 106;
    *(_BYTE *)(v7 - 163) = ((v12 >> 13) ^ 0x29) - ((2 * ((v12 >> 13) ^ 0x29)) & 0xD4) + 106;
    *(_BYTE *)(v7 - 162) = ((v12 >> 5) ^ 0xD) - ((2 * ((v12 >> 5) ^ 0xD)) & 0xD4) + 106;
    HIDWORD(v11) = v12 ^ 0x17;
    LODWORD(v11) = v9 ^ 0x40000000;
    *(_BYTE *)(v7 - 161) = (v11 >> 29) - ((2 * (v11 >> 29)) & 0xD4) + 106;
    *(_BYTE *)(v7 - 160) = ((v9 >> 21) ^ 0xE6) - ((2 * ((v9 >> 21) ^ 0xE6)) & 0xD4) + 106;
    *(_BYTE *)(v7 - 159) = ((v9 >> 13) ^ 0x85) - ((v9 >> 12) & 0xD4) + 106;
    *(_BYTE *)(v7 - 158) = ((v9 >> 5) ^ 0x6B) - ((2 * ((v9 >> 5) ^ 0x6B)) & 0xD4) + 106;
    LOBYTE(v12) = (8 * v9) ^ 0xC0;
    char v13 = -48;
  }

  *(_BYTE *)(v7 - 157) = v12 - (((_BYTE)v12 << (((v10 - 82) | 0xC4) + 43)) & v13) + 106;
LABEL_6:
  JUMPOUT(0x10001EEA0LL);
}

uint64_t sub_100020364()
{
  return (*(uint64_t (**)(void))(v3
                              + 8LL
}

void sub_1000203BC()
{
}

uint64_t sub_1000203CC@<X0>(uint64_t a1@<X1>, int a2@<W6>, uint64_t a3@<X8>)
{
  *(_BYTE *)(v5 - 220 + a3 + a1) = 106;
  return (*(uint64_t (**)(void))(v4 + 8LL * ((69 * ((unint64_t)(a3 + 1 + a1) > 0x3F)) ^ (a2 + v3 + 720))))();
}

uint64_t sub_100020474(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  int v11 = *(_DWORD *)(v10 - 220 + 4LL * ((v8 + v5) >> (((v7 - 58) | 0x42) ^ (a5 - 2))) + 72);
  *(_BYTE *)(a3 + (v8 + v5 + 1)) = (BYTE2(v11) ^ 0x5B) - ((2 * (BYTE2(v11) ^ 0x5B)) & 0xD4) + 106;
  *(_BYTE *)(a3 + (v8 + v5)) = (HIBYTE(v11) ^ 0x26) + (~(2 * (HIBYTE(v11) ^ 0x26)) | 0x2B) + 107;
  *(_BYTE *)(a3 + (v8 + v5 + 3)) = v11 ^ 0xF7;
  *(_BYTE *)(a3 + (v8 + v5 + 2)) = (BYTE1(v11) ^ 0x45) - ((2 * (BYTE1(v11) ^ 0x45)) & 0xD4) + 106;
  unsigned int v12 = *(_DWORD *)(v10 - 128) - 2103623270;
  if (v8 + 1936486151 < v6 != v12 < v6) {
    BOOL v13 = v12 < v6;
  }
  else {
    BOOL v13 = v8 + 1936486151 < v12;
  }
  return ((uint64_t (*)(void))(*(void *)(v9 + 8LL * ((31 * !v13) ^ v7)) - 8LL))();
}

void sub_100020620()
{
}

void sub_100020628(uint64_t a1)
{
  int v1 = 1178560073 * ((2 * (a1 & 0x78F6F35) - a1 + 2020643018) ^ 0xC2E4E8A8);
  unsigned int v2 = *(_DWORD *)(*(void *)(a1 + 8) - 0x3C9E4FFE00180D47LL) + 1578108251;
  unsigned int v3 = *(_DWORD *)(a1 + 4) - v1 - 1868963304;
  int v4 = (v3 < 0xB3604029) ^ (v2 < 0xB3604029);
  BOOL v5 = v2 < v3;
  if (v4) {
    BOOL v5 = v3 < 0xB3604029;
  }
  __asm { BR              X11 }

uint64_t sub_10002073C()
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
}

uint64_t sub_10002077C@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8LL
                              * ((89
                                * (*(_DWORD *)(v1 - 0x3C9E4FFE00180D43LL) == ((a1 - 6) ^ 0x78036C97 ^ (a1 + 593185123) & 0xDCA4B57F))) ^ a1)))();
}

uint64_t sub_1000207D8()
{
  *(_BYTE *)(*(void *)(v3 - 0x3C9E4FFE00180D53LL) + ((v0 - 243) ^ 0x3F764A46u) + v5 + v2) = *(_BYTE *)(*(void *)(v3 - 0x3C9E4FFE00180D53LL) + (v2 - 2013491069));
}

uint64_t sub_10002084C@<X0>(int a1@<W8>)
{
  *(_BYTE *)(*v1 + (v2 + v6)) = *(_BYTE *)(*v1 + (v6 + v5));
  return ((uint64_t (*)(void))(*(void *)(v8 + 8LL * (((v3 + v6 != v4) * v7) ^ a1)) - 4LL))();
}

uint64_t sub_100020880()
{
  BOOL v3 = ((((v0 - 140) | 0x200) ^ 0x215) & *(_DWORD *)(v1 - 0x3C9E4FFE00180D3FLL)) == 0;
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((((v0 + 27) ^ v3) & 1 | (2
}

void sub_1000208DC()
{
  *(_DWORD *)(v0 - 0x3C9E4FFE00180D3BLL) = -777181946;
}

void sub_100020E34(uint64_t a1)
{
  __asm { BR              X8 }

void sub_100020F70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  BOOL v12 = ((**(unsigned __int8 **)(a7 + 80) - (*(unsigned __int8 *)(*(void *)(v7 + 1320) - 1LL) ^ 0x6A)) ^ (-652340608 - v10))
      + ((2 * (**(unsigned __int8 **)(a7 + 80) - (*(unsigned __int8 *)(*(void *)(v7 + 1320) - 1LL) ^ 0x6A))) & 0xAFFAFFF6)
      - 1095238240 != v8
     || a2 == 473844422;
  __asm { BR              X15 }

uint64_t sub_100021FF8@<X0>(int a1@<W1>, int a2@<W2>, uint64_t a3@<X8>)
{
  *(_BYTE *)(v3 + (a1 + v5)) = *(_BYTE *)(a3 + (a1 + v5));
  return ((uint64_t (*)(void))(*(void *)(v6 + 8LL * ((1017 * (a1 - 1 == v4)) ^ (v7 + a2 - 255))) - 8LL))();
}

void sub_100022038(uint64_t a1)
{
  int v1 = 1225351577 * ((-2 - ((a1 | 0x69BC7507) + (~(_DWORD)a1 | 0x96438AF8))) ^ 0xE8BC10CA);
  __asm { BR              X9 }

uint64_t sub_1000220D8(uint64_t result)
{
  *(_DWORD *)(result + 16) = 528081046;
  return result;
}

void sub_10002244C(uint64_t a1)
{
  int v1 = 235795823 * (((a1 | 0xA666D7F8) - a1 + (a1 & 0x59992807)) ^ 0x32CB9EA1);
  __asm { BR              X12 }

uint64_t sub_100022508@<X0>(uint64_t a1@<X8>)
{
  unsigned int v4 = 3804331 * ((((&v6 | 0x251A88C) ^ 0xFFFFFFFE) - (~&v6 | 0xFDAE5773)) ^ 0x720B4CB5);
  unsigned int v6 = 671747982 - (v4 + v3) - (((698 * (v2 ^ 0x5D7)) ^ 0xC346E796) & (-1932706758 - 2 * v3));
  uint64_t v7 = v1;
  int v8 = (v2 - 1153) ^ v4;
  return ((uint64_t (*)(unsigned int *))(*(void *)(a1 + 8LL * (v2 - 1422)) - 12LL))(&v6);
}

uint64_t sub_100022668(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  __int16 v2 = *(_DWORD *)(result + 4) - -2705 * (((result | 0x865F) - result + (result & 0x79A0)) ^ 0xCF06);
  *(_DWORD *)(v1 - 0x5934B92A3842FA94LL) = v2 & 0x1FF ^ 0x27C74875;
  *(void *)(v1 - 0x5934B92A3842FAB4LL) = 0x5CD0AD78442521B7LL;
  *(_DWORD *)(v1 - 0x5934B92A3842FA98LL) = 151311037;
  int v3 = v2 ^ 0x94;
  if (v3 == 1)
  {
    int v4 = 151311053;
    goto LABEL_5;
  }

  if (v3 == 2)
  {
    *(_DWORD *)(v1 - 0x5934B92A3842FA9CLL) = -443964307;
    int v4 = 151311057;
LABEL_5:
    *(void *)(v1 - 0x5934B92A3842FAACLL) = 0xC996EE14411E669CLL;
    *(void *)(v1 - 0x5934B92A3842FAA4LL) = 0x366911EBBEE19963LL;
    *(_DWORD *)(v1 - 0x5934B92A3842FA98LL) = v4;
  }

  *(_DWORD *)uint64_t result = 1020765426;
  return result;
}

void sub_1000227B0(_DWORD *a1)
{
  unsigned int v1 = (*a1 - 535753261
            * (((a1 | 0xB4CC401E) - (_DWORD)a1 + (a1 & 0x4B33BFE1)) ^ 0xBE384E31)) ^ 0x65D;
  __asm { BR              X5 }

uint64_t sub_100022938(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, int a5)
{
  return ((uint64_t (*)(void))(*(void *)(v9 + 8LL * ((v6 + v7) & v8 ^ ((v5 == 31) * a5)))
                            - (((((v6 + v7) & v8) - 1080) | a4)
}

void sub_100022998()
{
}

uint64_t sub_1000229A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  *(_DWORD *)(a10 - 0x163576876B511553LL) = 346618606 - v14;
  int v21 = 108757529
      * ((((v20 - 136) ^ 0x1E543FEE | 0xD1B85227)
        - ((v20 - 136) ^ 0x1E543FEE)
        + (((v20 - 136) ^ 0x1E543FEE) & 0x2E47ADD8)) ^ 0x2F700FE2);
  *(void *)(v20 - 128) = v15;
  *(_DWORD *)(v20 - 136) = (v19 - 289) ^ v21;
  *(_DWORD *)(v20 - 132) = v21 ^ 0x48F8494B;
  sub_100045898((_DWORD *)(v20 - 136));
  int v22 = 535753261 * ((((2 * (v20 - 136)) | 0xEBB3BF32) - (v20 - 136) + 170270823) ^ 0xFF2DD1B6);
  *(void *)(v20 - 136) = v15;
  *(_DWORD *)(v20 - 128) = v22
                         + ((v16 << 6) & 0x77EDE1C0)
                         + ((v16 << ((v19 - 13) & 0xBB ^ 0x2E)) ^ 0x3BF6F0FA)
                         - 1052824;
  *(_DWORD *)(v20 - 124) = (v19 - 459) ^ v22;
  sub_100044694(v20 - 136);
  *(void *)(v20 - 136) = a14;
  *(_DWORD *)(v20 - 128) = v19
                         + 3804331 * (((~(v20 - 136) & 0xCD5261FC) - (~(v20 - 136) | 0xCD5261FD)) ^ 0x42F77A3B)
                         + 781;
  *(void *)(v20 - 120) = &STACK[0x621D43C813E505B2];
  sub_100027864(v20 - 136);
  *(void *)(v20 - 136) = a14;
  *(void *)(v20 - 120) = v15;
  *(_DWORD *)(v20 - 128) = v19 + 3804331 * ((v20 - 933916987 - 2 * ((v20 - 136) & 0xC8558F4D)) ^ 0x47F0948B) - 371;
  uint64_t v23 = ((uint64_t (*)(uint64_t))(*(void *)(v18 + 8LL * (v19 - 625)) - 8LL))(v20 - 136);
  BOOL v24 = *(_DWORD *)(v20 - 124) - 1403822742 >= ((v19 - 229) ^ 0xB8B3C03D);
  return ((uint64_t (*)(uint64_t))(*(void *)(v17 + 8LL * (v24 | (2 * v24) | v19)) - 8LL))(v23);
}

uint64_t sub_100022BF8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  *(void *)(v18 - 120) = a14;
  *(void *)(v18 - 136) = v15;
  *(_DWORD *)(v18 - 128) = v17 + ((v18 - 136) ^ 0x8FA51BC6) * v14 + 1010;
  uint64_t v19 = sub_100027864(v18 - 136);
  return (*(uint64_t (**)(uint64_t))(v16 + 8LL * ((((v17 + 977) ^ 0x52A) * (a10 < 1)) ^ v17)))(v19);
}

uint64_t sub_100022C64( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  *(void *)(v18 - 120) = v14;
  *(_DWORD *)(v18 - 128) = v17 + 3804331 * ((((v18 - 136) | 0x59E99CB8) - ((v18 - 136) & 0x59E99CB8)) ^ 0xD64C877E) + 33;
  *(void *)(v18 - 136) = a14;
  sub_100027864(v18 - 136);
  int v19 = 535753261 * (((v18 - 136) & 0x153AF112 | ~((v18 - 136) | 0x153AF112)) ^ 0xE03100C2);
  *(void *)(v18 - 136) = a13;
  *(_DWORD *)(v18 - 128) = v19 + 1004986467;
  *(_DWORD *)(v18 - 124) = (v17 - 1207) ^ v19;
  sub_100044694(v18 - 136);
  *(void *)(v18 - 136) = a14;
  *(_DWORD *)(v18 - 128) = v17
                         + 3804331
                         * ((((v18 - 136) ^ 0x6A781FD2) & 0x2F4F9D48 | ~((v18 - 136) ^ 0x6A781FD2 | 0x2F4F9D48)) ^ 0x356D66A3)
                         - 1119;
  *(void *)(v18 - 120) = a13;
  uint64_t v20 = v15(v18 - 136);
  return (*(uint64_t (**)(uint64_t))(v16
                                            + 8LL
                                            * (((*(_DWORD *)(v18 - 124) <= ((v17 - 110099819) & 0x68FFDB7 ^ 0x53ACA720u))
                                              * ((35 * (v17 ^ 0x563)) ^ 0x190)) ^ (v17 - 1121))))(v20);
}

uint64_t sub_100022E34( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11)
{
  return ((uint64_t (*)(void))(*(void *)(v12
                                        + 8LL
                                        * (((((2 * a11) & 0xFCFDFFF8)
                                           + (((v11 ^ 0x4E9) + 2122250900) ^ a11)
                                           - 38936192
                                           - 2083316094 < 0x7FFFFFFE)
                                          * ((v11 + 1218) ^ 0x612)) ^ v11))
                            - 4LL))();
}

  ;
}

uint64_t sub_100023A7C(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(uint64_t))*(&off_100058280
                                           + ((16 * (*(_DWORD *)(a2 + 4) == 1782897128)) | ((*(_DWORD *)(a2 + 4) == 1782897128) << 9) | 0x104u)))(4294925278LL);
}

uint64_t sub_100023ABC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(_BYTE *)(*(void *)(a2 + 96) + 448LL) = *(_BYTE *)(*(void *)(a1 + 8) + 12LL);
  return (*(uint64_t (**)(void))(v2 + 2312))(0LL);
}

void sub_100023B24()
{
}

uint64_t sub_100023B30(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)a1 - 0x621D43C813E5057ELL);
  if (v2 - 2086149949 < 0) {
    unsigned int v3 = 2086149949 - v2;
  }
  else {
    unsigned int v3 = v2 - 2086149949;
  }
  unsigned int v1 = 1374699841 * ((315119540 - (a1 | 0x12C857B4) + (a1 | 0xED37A84B)) ^ 0x80C3B042);
  return ((uint64_t (*)(void))(*((void *)*(&off_10005BF10 + (int)((*(_DWORD *)(a1 + 16) - v1) ^ 0x231))
                              + (int)((((*(_DWORD *)(a1 + 20) ^ v1) - 1731540555 >= 4 * (unint64_t)v3)
                                     * ((*(_DWORD *)(a1 + 16) - v1) ^ 0x587)) ^ (*(_DWORD *)(a1 + 16) - v1)))
                            - 4LL))();
}

uint64_t sub_100023C00(uint64_t a1)
{
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v1
                                                               + 8LL
                                                               * ((((v3 ^ 0x270) - 40) * (v2 == 1731540555)) ^ v3 ^ 0x6C))
                                                   - ((5 * (v3 ^ 0x270u)) ^ 0x2E0LL)))( a1,  634240628LL);
}

uint64_t sub_100023C4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 24) = a2;
  return result;
}

uint64_t sub_100023C54(uint64_t a1)
{
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v1
                                                                                + 8LL
                                                                                * ((395 * (v3 == 148)) ^ (v3 + 49)))
                                                                    - 8LL))( a1,  (v3 + 592),  3207183372LL,  v2);
}

uint64_t sub_100023CC8@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, int a5@<W8>)
{
  *(_BYTE *)(*(void *)(a1 + 8) + (a4 + a5 + a2 - 543)) = ((a3 ^ v7) >> v8)
                                                                       - ((2 * ((a3 ^ v7) >> v8)) & 0xD4)
                                                                       + 106;
  return ((uint64_t (*)(void))(*(void *)(v5 + 8LL * (a2 ^ (1262 * (a4 - 1 != v6)))) - 4LL))();
}

uint64_t sub_100023D20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v3
                                                                                + 8LL
                                                                                * ((395 * (v5 + 8 == v6 - 165)) ^ v6))
                                                                    - 8LL))( a1,  (v6 + 543),  a3,  v4);
}

uint64_t sub_100023D50(uint64_t a1)
{
  BOOL v7 = v4 - 1888069834 > 781349223 || v4 - 1888069834 < v3;
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v1 + 8LL * (v5 ^ (455 * v7)))
                                                                    - ((v5 + 1120306727) & 0xBD397BF7 ^ 0x2ECLL)))( a1,  (v5 + 1120306727) & 0xBD397BF7,  3207183372LL,  v2);
}

uint64_t sub_100023DB8@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  return sub_100023CC8(a1, v5 + 543, *(_DWORD *)(*v3 + 4LL * (v4 - 521935410)), v2, a2);
}

void sub_100023DE8(uint64_t a1)
{
  int v1 = 535753261 * (((a1 | 0xC65CACBE) - (a1 & 0xC65CACBE)) ^ 0xCCA8A291);
  int v2 = *(_DWORD *)(a1 + 72) - v1;
  BOOL v4 = *(_OWORD *)(a1 + 48) != 0LL && *(_DWORD *)(a1 + 8) - v1 != 644357898;
  __asm { BR              X8 }

uint64_t sub_100023F50()
{
  BOOL v4 = v1[8] == 0x773DA5904F56F3CBLL || (*v1 | v1[4]) == 0LL;
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((v4 * (((v0 - 282) | 0x120) - 278)) ^ v0)) - 4LL))();
}

uint64_t sub_100023FA8@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v18 = *(void *)(v16 + 16);
  *(_DWORD *)(a9 - 0x773DA5904F56F3CBLL) = 0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 + 8LL * (((v18 == 0x621D43C813E50582LL) * (v14 ^ 0x116)) ^ (v14 + 38))) - 8LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a10,  a11,  a12,  v15,  a14);
}

uint64_t sub_10002406C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, char a24)
{
  int v29 = &a24 + v24;
  int v30 = v25 ^ 0x66;
  int v31 = 108757529 * ((((v28 - 144) | 0x1284A53F) - (v28 - 144) + ((v28 - 144) & 0xED7B5AC0)) ^ 0xF218C714);
  *(void *)(v28 - 136) = v29;
  *(_DWORD *)(v28 - 144) = ((v25 ^ 0x66) + 43) ^ v31;
  *(_DWORD *)(v28 - 140) = v31 ^ 0x48F9494B;
  uint64_t v33 = sub_100045898((_DWORD *)(v28 - 144));
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v27
                                                               + 8LL
                                                               * ((((v30 - 1344469585) & 0x5022FFF3 ^ 0x68F) * (v26 == 0)) ^ (v30 + 116)))
                                                   - 4LL))( v33,  a2);
}

uint64_t sub_100024144( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  int v28 = (v20 - 2074005222) & 0x7B9ECEBE;
  int v29 = ((v27 - 144) ^ 0x4C96827D) * v21;
  *(void *)(v27 - 120) = v23;
  *(_DWORD *)(v27 - 140) = v29 + v20 - 1109;
  *(void *)(v27 - 136) = v25;
  *(_DWORD *)(v27 - 128) = ((v28 ^ 0x22B59508) + v22) ^ v29;
  BOOL v32 = a2 == 0;
  ((void (*)(uint64_t))((char *)*(&off_10005BF10 + v20 - 1569) - 12))(v27 - 144);
  *(_DWORD *)(v27 - 144) = v28
                         + 535753261 * ((((2 * (v27 - 144)) | 0x9FFC68C8) - (v27 - 144) + 805424028) ^ 0xC50A3A4B)
                         - 324;
  *(void *)(v27 - 136) = a19;
  *(void *)(v27 - 128) = v24;
  ((void (*)(uint64_t))((char *)*(&off_10005BF10 + (int)(v28 & 0xF6D968D3)) - 8))(v27 - 144);
  *(void *)(v27 - 104) = v24;
  *(void *)(v27 - 128) = a18;
  *(void *)(v27 - 120) = a20;
  *(void *)(v27 - 144) = a19;
  *(void *)(v27 - 136) = a14;
  *(_DWORD *)(v27 - 112) = (v28 - 1576) ^ (535753261
                                         * ((-892046159 - ((v27 - 144) | 0xCAD474B1) + ((v27 - 144) | 0x352B8B4E)) ^ 0x3FDF8561));
  uint64_t v30 = ((uint64_t (*)(uint64_t))*(&off_10005BF10 + v28 - 1526))(v27 - 144);
  return ((uint64_t (*)(uint64_t))(*(void *)(v26 + 8LL * ((30 * ((((v28 - 1464) ^ v32) & 1) == 0)) ^ v28))
}

uint64_t sub_1000243A8()
{
  int v6 = 1374699841 * (((v5 - 144) & 0x443FF3BF | ~((v5 - 144) | 0x443FF3BF)) ^ 0xD6341449);
  *(void *)(v5 - 144) = v2;
  *(void *)(v5 - 136) = v8;
  *(_DWORD *)(v5 - 128) = v6 + v3 + 496;
  *(_DWORD *)(v5 - 124) = (v1 + 1087182353 + ((v3 - 196) | 0x100)) ^ v6;
  uint64_t result = (*(uint64_t (**)(uint64_t))(v4 + 8LL * (v3 - 90)))(v5 - 144);
  *int v10 = v9;
  *(_DWORD *)(v0 + 40) = 777158354;
  return result;
}

void sub_1000244F8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) + 1178560073 * ((-2 - ((a1 | 0xA6FD25DC) + (~(_DWORD)a1 | 0x5902DA23))) ^ 0xE396A241);
  __asm { BR              X14 }

uint64_t sub_100024630( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  BOOL v12 = v8 + 1876059628 > 1291759869 || v8 + 1876059628 < a8 - 855723778;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 + 8LL * (v12 | v9))
                                                            - ((v9 + 149) ^ 0x377LL)))( (v9 + 149) ^ 0x377LL,  3207183372LL,  0x621D43C813E50582LL);
}

uint64_t sub_100024698@<X0>( int a1@<W1>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  *(_DWORD *)(a10 + 4LL * (((v11 - 1936030443) & 0x73657B7F ^ (a2 + 675)) + v10)) = a1;
  int v16 = v10 + 1 + v12;
  BOOL v18 = v16 > v13 || v16 < v14;
  return ((uint64_t (*)(void))(*(void *)(v15 + 8LL * (v18 | v11)) - 8LL))();
}

uint64_t sub_1000246E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7
                                                                                          + 8LL
                                                                                          * ((1335
                                                                                            * (((v5 == 0) ^ ((v6 ^ 0xE3) + 1)) & 1)) ^ v6))
                                                                              - (v6 ^ 0x7EEu)
                                                                              + 1157LL))( a1,  a2,  a3,  a4,  a5);
}

uint64_t sub_100024730@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _DWORD *a10)
{
  int v12 = a1 - 29;
  unsigned int v13 = (*(_DWORD *)(*(void *)(a6 + 24) - 0x163576876B511553LL) - 305393430) * (*a10 ^ 0xBF29BC0C);
  int v14 = 1224239923 * (((((v11 - 128) | 0xD5326E8A) ^ 0xFFFFFFFE) - (~(v11 - 128) | 0x2ACD9175)) ^ 0xD87E6CA2);
  *(_DWORD *)(v11 - 104) = v12 - v14 + 425;
  *(_DWORD *)(v11 - 100) = v14 ^ 0x7C581F3D;
  *(void *)(v11 - 112) = a8;
  *(_DWORD *)(v11 - 120) = (v13 ^ 0x7F8B6FF7) - v14 + ((v13 << ((v12 + 18) ^ 0x90)) & 0xFF16DFEE) - 1753230804;
  *(void *)(v11 - 128) = a7;
  uint64_t v15 = ((uint64_t (*)(uint64_t))((char *)*(&off_10005BF10 + (int)(v12 & 0xBAFCA838)) - 4))(v11 - 128);
}

void sub_1000248A0()
{
}

uint64_t sub_1000248A8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _DWORD *a10, int a11, int a12, uint64_t a13, uint64_t a14)
{
  int v17 = 235795823 * ((v16 + 1373711073 - 2 * ((v16 - 128) & 0x51E12B61)) ^ 0xC54C6238);
  *(_DWORD *)(v16 - 112) = v17 + v15 + 227;
  *(void *)(v16 - 120) = a14;
  *(_DWORD *)(v16 - 128) = v17 + ((a12 << 6) & 0xBCDF7FC0) + ((32 * a12) ^ 0xDE6FBFFD) + 1744231968;
  sub_10002244C(v16 - 128);
  return ((uint64_t (*)(void))(*(void *)(v14
                                        + 8LL
                                        * ((((*a10 - 2086149950) < 0x7FFFFFFF)
                                          * (((v15 - 742) | 0x440) - 1504)) ^ v15))
                            - 8LL))();
}

uint64_t sub_10002497C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  *(void *)(v17 - 128) = a14;
  *(void *)(v17 - 112) = &STACK[0x621D43C813E505C2];
  *(_DWORD *)(v17 - 120) = v16
                         + 3804331 * ((((v17 - 128) | 0xFE067FB4) - ((v17 - 128) & 0xFE067FB4)) ^ 0x71A36472)
                         + 248;
  sub_100027864(v17 - 128);
  *(_DWORD *)(v17 - 120) = v16
                         + 3804331 * ((((v17 - 128) | 0x5611C0B8) - ((v17 - 128) & 0x5611C0B8)) ^ 0xD9B4DB7E)
                         - 904;
  *(void *)(v17 - 128) = a14;
  *(void *)(v17 - 112) = v15;
  uint64_t v18 = ((uint64_t (*)(uint64_t))((char *)*(&off_10005BF10 + v16 - 1158) - 8))(v17 - 128);
  return ((uint64_t (*)(uint64_t))(*(void *)(v14
                                                      + 8LL
                                                      * ((330
                                                        * (*(_DWORD *)(v17 - 116) > 81 * (v16 ^ 0x497u) + 1403822255)) | v16))
                                          - 8LL))(v18);
}

uint64_t sub_100024A9C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16)
{
  int v18 = (v16 - 1387) | 0x160;
  int v19 = (v18 ^ 0x83A7E123) + a16;
  if (v19 < 0) {
    int v19 = -v19;
  }
  return (*(uint64_t (**)(void))(v17
                              + 8LL
}

uint64_t sub_100024B34()
{
  return (*(uint64_t (**)(void))(v4 + 8LL * ((1035 * (*(_DWORD *)(v1 + 4LL * v2) == v3 + (v0 ^ 0x491) - 1393)) ^ v0)))();
}

uint64_t sub_100024B64()
{
  return (*(uint64_t (**)(void))(v2 + 8LL * (((v1 - 1 >= 0) * ((v0 + 913) ^ 0x572)) | v0)))();
}

uint64_t sub_100024B94()
{
  uint64_t v4 = *(void *)(v6 + 16);
  *(void *)(v3 - 128) = v2;
  *(void *)(v3 - 112) = v4;
  *(_DWORD *)(v3 - 120) = v0 + ((((v3 - 128) | 0xC9F0C769) - ((v3 - 128) & 0xC9F0C769)) ^ 0x4655DCAF) * v1 + 24;
  return sub_100027864(v3 - 128);
}

void sub_100024FE0(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 12) + 460628867 * ((a1 & 0x73B15F3F | ~(a1 | 0x73B15F3F)) ^ 0xC0D822BD);
  uint64_t v2 = *((void *)*(&off_10005BF10 + (v1 ^ 0x53C))
  __asm { BR              X8 }

uint64_t sub_100025070(uint64_t result)
{
  uint64_t v2 = *v1;
  *(void *)uint64_t result = 0LL;
  *(void *)(result + 8) = 0x55503ACE55503ACELL;
  *(void *)(result + 16) = 0x802D389E78036F7CLL;
  *(_DWORD *)(result + 24) = 777158354;
  *(void *)(v2 - 0x72D239406EDD8F28LL) = result + 0x3C9E4FFE00180D53LL;
  *((_DWORD *)v1 + 2) = 777158354;
  return result;
}

void sub_1000250F0(uint64_t a1)
{
  __asm { BR              X8 }

uint64_t sub_10002517C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t, unint64_t *))(v66 + 13312))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  3609674529LL,  a9,  &a66,  a11,  &STACK[0x2C843C8B7CE89A7E]);
}

uint64_t sub_1000252C4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
}

uint64_t sub_100025328( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17)
{
}

uint64_t sub_100025368@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8LL * (((a1 != v1 + 2065489043) * (v3 + ((v1 + 319) ^ (v4 + 952)) - 568)) ^ (v1 + 319))))();
}

uint64_t sub_1000253B0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19)
{
  unsigned __int8 v24 = (v19 ^ (v23 + 95)) - 2;
  int v25 = v21 + v19 - 362;
  BOOL v26 = a19 - 424394800 < (v22 - 1799111403);
  return (*(uint64_t (**)(void))(v20 + 8LL * (v25 | (32 * ((v24 ^ v26) & 1)))))();
}

uint64_t sub_100025524()
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * (((*(_DWORD *)(v1 + 48LL * (v2 - 915836949) + 36) == v2)
                                          * (((v0 ^ 0x2B0) - v4 + 1225) ^ (v5 - 32))) ^ v0))
                            - 4LL))();
}

uint64_t sub_100025578( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t a12, unint64_t a13, unint64_t a14, unint64_t a15, uint64_t a16, unint64_t a17)
{
  int v22 = 628203409 * ((~((v21 - 160) | 0x5F9A5A08) + ((v21 - 160) & 0x5F9A5A08)) ^ 0x22EDA9C4);
  STACK[0x2B8] = a17;
  STACK[0x2A8] = a15;
  STACK[0x2C0] = a13;
  STACK[0x298] = a12;
  *(_DWORD *)(v21 - 144) = v17 - v22 + 148;
  *(_DWORD *)(v21 - 140) = v20 - v22 + 38469403;
  STACK[0x290] = a14;
  uint64_t v23 = (*(uint64_t (**)(uint64_t))(a7 + 8LL * (v17 - 372)))(v21 - 160);
  return ((uint64_t (*)(uint64_t))(*(void *)(v18
                                                      + 8LL
                                                      * (int)(((*(_DWORD *)(v21 - 128) == 777158354)
                                                             * ((v17 - v19 + 1111) ^ 0xD727434D)) ^ v17))
                                          - ((5 * (v17 ^ 0x158u)) ^ 0x4D9LL)))(v23);
}

uint64_t sub_100025674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10
                                                                                                  + 8LL * (((*(_DWORD *)(v7 + 48LL * (v9 - 915836949)) == 1338792378) * ((((v8 - 1165) | 0x5A8) - v11) ^ (v12 - 19))) ^ v8)))( a1,  a2,  a3,  a4,  a5,  a6,  v6);
}

uint64_t sub_1000256CC@<X0>(int a1@<W5>, int a2@<W8>)
{
  if ((v2 - 1272700869) <= 0x10 && ((1 << (v2 + 59)) & 0x10125) != 0)
  {
    uint64_t v8 = a2 & 0xFFFFFFFFFFFFFFFLL;
    if (v8)
    {
      if (v8 == 3)
      {
        int v9 = (*(uint64_t (**)())(v3 + 48LL * a2 + 8))();
        __asm { BR              X8 }
      }

      __asm { BR              X1 }
    }

    __asm { BR              X9 }
  }

  return a1 ^ 0xD1AD250C;
}

void sub_100025CF4(uint64_t a1)
{
  int v1 = 1759421093 * (a1 ^ 0xB37DB054);
  if (*(void *)(a1 + 24)) {
    BOOL v2 = *(_DWORD *)(a1 + 20) - v1 == 1431321294;
  }
  else {
    BOOL v2 = 1;
  }
  int v3 = v2;
  __asm { BR              X8 }

uint64_t sub_100025D8C()
{
  BOOL v3 = (*(uint64_t (**)(uint64_t))(v0 + 8LL * (v2 ^ 0x9E)))(32LL) == 0;
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
}

uint64_t sub_100025DE4()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * (((v3 ^ (v0 == v1)) & 1 | (8
                                                                                    * ((v3 ^ (v0 == v1)) & 1))) ^ v3))
                            - (v3 ^ 0x751u)
                            + 1708LL))();
}

uint64_t sub_100025E2C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  unsigned int v11 = v2 - 1431321295;
  int v12 = v2 - 1;
  int v13 = *(unsigned __int8 *)(v5 + v11);
  if (v13 == 106) {
    __asm { BR              X11 }
  }

  if (v13 == 234)
  {
    int v14 = 777158354;
    uint64_t v15 = *(void *)(v3 + 8);
    int v16 = *(unsigned __int8 *)(v3 + 16) ^ v4;
    *(void *)uint64_t result = v5;
    *(_DWORD *)(result + 8) = v6;
    *(_DWORD *)(result + 12) = v12;
    if (v16 == 69) {
      int v17 = -2144520035;
    }
    else {
      int v17 = -2144520036;
    }
    *(_DWORD *)(result + 16) = 2013491068;
    *(_DWORD *)(result + 20) = v17;
    *(_DWORD *)(result + 24) = 777158354;
    *(void *)(v15 - 0x3F156345BCC4F9CLL) = a2;
  }

  else
  {
    uint64_t result = (*(uint64_t (**)(void))(v9 + 8LL * (v8 - 1690)))();
    int v14 = -777181941;
  }

  *(_DWORD *)uint64_t v3 = v14;
  return result;
}

void sub_100025F08(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40) - 235795823 * ((a1 + 1866794728 - 2 * (a1 & 0x6F4506E8)) ^ 0xFBE84FB1);
  __asm { BR              X9 }

void sub_100026018(uint64_t a1@<X8>)
{
  *(_DWORD *)(v1 + a1) = 2086149949;
}

uint64_t sub_100026F04(uint64_t a1)
{
  int v1 = 535753261 * ((a1 & 0x20D467A0 | ~(a1 | 0x20D467A0)) ^ 0xD5DF9670);
  int v2 = *(_DWORD *)(a1 + 4) + v1;
  int v3 = *(_DWORD *)a1 + v1;
  if (v3 < 0) {
    int v3 = -v3;
  }
  int v4 = *(_DWORD *)(*(void *)(a1 + 8) - 0x621D43C813E5057ELL);
  unsigned int v6 = v4 - 2086149949;
  BOOL v5 = v4 - 2086149949 < 0;
  unsigned int v7 = 2086149949 - v4;
  if (!v5) {
    unsigned int v7 = v6;
  }
  return ((uint64_t (*)(void))(*((void *)*(&off_10005BF10 + (v2 ^ 0x627))
}

uint64_t sub_100026FCC(uint64_t result)
{
  *(_DWORD *)(result + 16) = -2035976494;
  return result;
}

uint64_t sub_100026FDC@<X0>(uint64_t result@<X0>, char a2@<W8>)
{
  unsigned int v5 = ((*(_DWORD *)(*(void *)(v2 - 0x621D43C813E5057ALL) + 4LL * v3) ^ 0xBF29BC0C) >> a2) ^ 0xE7E05220;
  unsigned int v6 = (v5 & 0xA1413 ^ 0x44000443) + ((889 * (v4 ^ 0x6FC)) ^ 0xFFFFF90D) + (v5 & 0xAAC1C320 ^ 0x9A408A85);
  *(_DWORD *)(result + 16) = (((2 * (v5 & 0xAACBD732 ^ 0x7C80DCE7 ^ v6)) & 0xEA7299EE)
                            - (v5 & 0xAACBD732 ^ 0x7C80DCE7 ^ v6)
                            + 180794120) ^ 0x2EA397FA;
  return result;
}

void sub_1000270AC(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) + 1178560073 * (((a1 | 0xD9A9EA42) - a1 + (a1 & 0x265615BD)) ^ 0x633D9220);
  __asm { BR              X9 }

uint64_t sub_100027160(void *a1)
{
  return (*(uint64_t (**)(void))(v2
                              + 8LL * (((*(_DWORD *)(*a1 + v4) == v1) * (((v3 - 1820165658) & 0x6C7D82DF) - 625)) ^ v3)))();
}

uint64_t sub_10002719C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = a1;
  int v5 = v2 + 3804331 * ((&v4 - 174634352 - 2 * ((unint64_t)&v4 & 0xF5974A90)) ^ 0x7A325156) + 748;
  uint64_t v6 = v1;
  return sub_100027864((uint64_t)&v4);
}

void sub_100027324(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 24) + 1224239923 * ((((2 * a1) | 0x6988450E) - a1 + 1262214521) ^ 0x4677DF50);
  __asm { BR              X14 }

uint64_t sub_100027420()
{
  int v4 = v3 - 791;
  uint64_t v5 = v2 + 1623333111;
  BOOL v6 = v0 - 462816838 < (int)v5;
  if (v2 > 0x1F3DE708 != v0 - 462816838 < -524150537) {
    BOOL v6 = v2 > 0x1F3DE708;
  }
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v1 + 8LL * (((4 * !v6) | (32 * !v6)) ^ v4)) - 4LL))( v5,  298LL);
}

uint64_t sub_100027568@<X0>( int a1@<W1>, unsigned int a2@<W2>, int a3@<W3>, int a4@<W5>, void *a5@<X7>, uint64_t a6@<X8>)
{
  unsigned int v16 = v11 + v13 + (v9 ^ 0xBF29BC0C) + v12 * (*(_DWORD *)(*a5 + 4LL * a3) ^ v9);
  *(_DWORD *)(a6 + 4 * v10) = v16 + v9 - ((((v8 - 791) ^ v15) + 2119397899) & (2 * v16));
  BOOL v17 = a3 + 574241253 < a4;
  if (a2 > v14 != a3 + 574241253 < v6) {
    BOOL v17 = a2 > v14;
  }
  return (*(uint64_t (**)(void))(v7 + 8LL * (v8 ^ (!v17 * a1))))();
}

uint64_t sub_10002761C()
{
  return (*(uint64_t (**)(void))(v0 + 8LL * (((((v1 - 1204) | 0x80) - 442) * (v2 == 0x124ABADA3A084355LL)) ^ v1)))();
}

uint64_t sub_100027658()
{
  int v4 = v0 + 44 * (v2 ^ 0x1C7) - 1473681589;
  int v5 = *v3 + 264 * (v2 ^ 0x1DC) - 1473681589;
  BOOL v6 = v4 < -1535013968;
  BOOL v7 = v4 > v5;
  if (v6 != v5 < -1535013968) {
    BOOL v7 = v6;
  }
  return (*(uint64_t (**)(void))(v1 + 8LL * (v2 | (4 * v7))))();
}

void sub_1000276C4()
{
  _DWORD *v1 = v0;
}

uint64_t sub_1000276E8()
{
  int v4 = ((v3 + 1718669094) & 0x998F2FE9 ^ 0xFF9B5D33) + v0;
  int v5 = (v2 > v3 + 67928335) ^ (v4 < -67928809);
  BOOL v6 = v4 < (int)(v2 + 2079554839);
  if (v5) {
    BOOL v7 = v2 > v3 + 67928335;
  }
  else {
    BOOL v7 = v6;
  }
  return (*(uint64_t (**)(void))(v1 + 8LL * ((124 * v7) ^ (v3 + 726))))();
}

uint64_t sub_1000277CC@<X0>(int a1@<W6>, char a2@<W7>, uint64_t a3@<X8>)
{
  unint64_t v13 = v6 - 0x124ABADA3A084355LL + (*(_DWORD *)(a3 + 4 * v4) ^ v5);
  *(_DWORD *)(a3 + 4 * v4) = v13 + v5 - ((2 * v13) & 0x7E537818);
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * (((((v13 >> ((((v8 ^ a1) - 66) | a2) + 113)) ^ v7)
                                           + v10
                                           + ((2
                                             * (v13 >> ((((v8 ^ a1) - 66) | a2) + 113))) & v9) == v12)
                                          * v11) ^ v8 ^ a1))
                            - 8LL))();
}

uint64_t sub_100027864(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) - 3804331 * (a1 ^ 0x8FA51BC6);
}

uint64_t sub_1000278C0@<X0>(uint64_t a1@<X8>)
{
  int v4 = *(_DWORD *)(v2 - 0x621D43C813E5057ELL);
  int v5 = v4 - 2086149949;
  if (v4 - 2086149949 < 0) {
    int v5 = 2086149949 - v4;
  }
  *(_DWORD *)(v1 - 0x621D43C813E5057ELL) = v4;
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
                                        * (v3 ^ (16
                                               * ((v5 ^ (((v3 - 517) | 0x409) + 2076109261))
                                                + ((2 * v5) & 0xF77DDEAC)
                                                - 1342832900 != ((v3 + 220) ^ 0x2BB4EA33)))))
                            - 4LL))();
}

uint64_t sub_100027954@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(v1 - 0x621D43C813E5057ALL) + 4LL * (v5 - 733277779)) = *(_DWORD *)(*(void *)(v2 - 0x621D43C813E5057ALL)
                                                                                           + 4LL * (v5 - 733277779));
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * (((v5 - 1 != v3 + 1055) * (v4 + 899)) ^ (v4 - 220))) - 4LL))();
}

uint64_t sub_1000279B8@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*v1 + 4LL * (v6 + v5)) = *(_DWORD *)(*v2 + 4LL * (v6 + v5));
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * (((v6 - 1 != v3) * v7) ^ v4)) - 4LL))();
}

void sub_1000279F4(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

uint64_t sub_100027A3C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(_DWORD *)(*(void *)(a2 + 96) + 24LL) = v3;
  int v4 = *(_DWORD *)(a1 + 4) - ((2 * *(_DWORD *)(a1 + 4) - 881439670) & 0x14A31028) + 537701945;
  return (*(uint64_t (**)(void))(v2
                                           + 8LL
                                           * ((60
                                             * (((2 * v4) & 0xEFB78FDE ^ 0x4A30008) + (v4 ^ 0x7D8A4FFB) + 2087713721 == 1951122344)) ^ 0x119u)))(0LL);
}

uint64_t sub_100027AD0()
{
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v0
                                                               + 8LL
                                                               * ((107 * ((v2 + v1 + 136591377) < 8)) ^ 0x539u))
                                                   - 4LL))( 1362LL,  v3);
}

uint64_t sub_100027B34(unsigned int a1)
{
  return ((uint64_t (*)(void))(*(void *)(v1
}

uint64_t sub_100027B74(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v4
                              + 8LL
                              * ((1124
                                * (v5 >= ((a4 - 1946083171) ^ 0x8C0122AA) + 830003540 + ((a4 - 1946083171) | 0x42860200))) ^ a4)))();
}

uint64_t sub_100027BC4@<X0>(int a1@<W1>, int a2@<W2>, uint64_t a3@<X8>)
{
  __int128 v7 = *(_OWORD *)(v4 + (v6 - 1951122345) - 31);
  uint64_t v8 = a3 + (v6 - 1951122345);
  *(_OWORD *)(v8 - 15) = *(_OWORD *)(v4 + (v6 - 1951122345) - 15);
  *(_OWORD *)(v8 - 31) = v7;
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * ((1322 * (((a1 + a2 + 1174) ^ 0x105) == (v5 & 0xFFFFFFE0))) ^ (a1 + a2 + 1200)))
                            - 12LL))();
}

uint64_t sub_100027C30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(void))(v5
                                           + 8LL * (((((v6 == v7) ^ (a5 + 98)) & 1) * (a5 - 264)) ^ a5)))(0LL);
}

uint64_t sub_100027C5C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v4
                              + 8LL
                              * ((25 * ((((v5 & 0x18) == ((a4 + 778) ^ 0x391)) ^ (a4 + 52)) & 1)) ^ a4)))();
}

uint64_t sub_100027CAC@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  *(void *)(a2 - 7 + (v6 + v5 + v7 - v8)) = *(void *)(v3 - 7 + (v6 + v5 + v7 - v8));
  return (*(uint64_t (**)(void))(v2 + 8LL * (((v8 - (v4 & 0xFFFFFFF8) == -8) * (((a1 - 913) | 0x87) - 86)) ^ a1)))();
}

uint64_t sub_100027D04(int a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + v6) = *(void *)(v5 + v6);
  return (*(uint64_t (**)(void))(v3 + 8LL * (((v7 == 0) * v4) ^ a1)))();
}

uint64_t sub_100027D30(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v4
                                           + 8LL
                                           * (int)((((v6 - 830004556) ^ ((v6 + 378) | 0x1AA) ^ 0xCE872132) * (v5 == a4)) ^ v6)))(0LL);
}

uint64_t sub_100027D70@<X0>(int a1@<W1>, int a2@<W2>, uint64_t a3@<X8>)
{
  int v6 = (a2 - 39) | 0x10;
  *(_BYTE *)(a3 + (v6 ^ 0x8BB43FC3) + a1) = *(_BYTE *)(v5 + (v6 ^ 0x8BB43FC3) + a1);
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * ((63 * (a1 - 1 != v4)) ^ v6)) - 8LL))(0LL);
}

uint64_t sub_100027DBC@<X0>(uint64_t a1@<X8>)
{
  *(_BYTE *)(a1 + (v5 + v6)) = *(_BYTE *)(v3 + (v5 + v6));
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * ((63 * (v6 - 1 != v2)) ^ v4)) - 8LL))(0LL);
}

  ;
}

void sub_100027DF8(uint64_t a1)
{
  int v1 = 1374699841 * ((~(_DWORD)a1 & 0x2CB30A96 | a1 & 0xD34CF569) ^ 0x4147129F);
  __asm { BR              X12 }

uint64_t sub_100027EA8@<X0>(int a1@<W8>)
{
}

uint64_t sub_100027F00()
{
  return (*(uint64_t (**)(void))(v2 + 8LL * ((1173 * (*v1 != 0)) ^ v0)))();
}

uint64_t sub_100027F20()
{
  int v5 = v0 + 162;
  uint64_t v6 = v3(*v4);
  return (*(uint64_t (**)(uint64_t))(v2 + 8LL * ((1173 * (*v1 != 0)) ^ v5)))(v6);
}

uint64_t sub_100027F4C()
{
  uint64_t result = v2(*v3);
  _DWORD *v1 = 0;
  *(_DWORD *)uint64_t v0 = 0;
  *(void *)(v0 + 344) = 0LL;
  *(void *)(v0 + 352) = 0LL;
  *(_DWORD *)(v0 + 360) = 1420467332;
  *(_DWORD *)(v0 + 56) = 857162589;
  return result;
}

void sub_100027F8C(uint64_t a1)
{
  BOOL v3 = *(void *)(a1 + 8) == 0x7CB6CAFECA3CCDDLL
    || (unsigned __int16)(*(_WORD *)a1 - 2705 * ((a1 - 2 * (a1 & 0x65A) + 1626) ^ 0x4F03)) == 20800;
  int v1 = *(_DWORD *)(a1 + 20) + 235795823 * ((a1 - 2 * (a1 & 0x9028065A) - 1876425126) ^ 0x4854F03);
  __asm { BR              X8 }

uint64_t sub_100028068( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, int a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50)
{
  uint64_t v57 = (v53 + 1053);
  HIDWORD(a10) = (v52 + 1822397723) & 0x93606F7F;
  LODWORD(v60) = (v52 + 1328983705) ^ 0xA;
  HIDWORD(v60) = v52 + 1328983705;
  HIDWORD(a26) = (v52 + 1328983705) ^ 0x88;
  HIDWORD(v59) = v52 + 1309463361;
  LODWORD(v59) = v52 & 0x3EDAF526;
  HIDWORD(a21) = v52 - 2135244677;
  HIDWORD(a14) = v53;
  return ((uint64_t (*)(uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *, unint64_t, uint64_t, uint64_t, unint64_t, unint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))(*(void *)(v54 + 8LL * (int)(((((v53 + 29) ^ 0x2E) & 1) * (5 * (v57 ^ 0x480) - 82)) ^ v57)) - 4LL))( a1,  a2,  (unsigned __int16)(v51 - 20800),  1071LL,  1152LL,  1188LL,  42LL,  -1593772764LL,  a9,  a10,  &a50,  (unint64_t)&a33 % 0x25 + v57 - 1174,  v50 - 0x7CB6CAFECA3CCDDLL,  a14,  (1178560073 * (((~(v56 - 152) | 0x176F98EB730DDAFELL) + ((v56 - 152) | 0xE89067148CF22501LL)) ^ 0xF36C37FC36665D62LL)) ^ 0x13FF,  1178560073 * (((~(v56 - 152) | 0x176F98EB730DDAFELL) + ((v56 - 152) | 0xE89067148CF22501LL)) ^ 0xF36C37FC36665D62LL),  ((~(v56 - 152) | 0x89D588405E525F14LL) + ((v56 - 152) | 0x762A77BFA1ADA0EBLL)) ^ 0x83C82AD2AB59AEC5LL,  a18,  a19,  a20,  a21,  v59,  *(void *)(v55 + 8LL * ((int)v57 - 983)),  *(void *)(v55 + 8LL * ((int)v57 - 1064)),  (v56 - 152) | 0x20FB41B3298343A0LL,  a26,  v60,  (v56 - 152) | 0x538819AE0AA33BE7LL,  a29,  &a48);
}

uint64_t sub_1000282A4@<X0>( int a1@<W2>, int a2@<W5>, char a3@<W6>, unint64_t a4@<X7>, unsigned int a5@<W8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int *a20, void *a21)
{
  int v29 = (_BYTE *)(v26 + (a1 - 1));
  unsigned int v30 = 1639678635 * ((*(_DWORD *)(*a21 + (*a20 & a4)) ^ v29) & 0x7FFFFFFF);
  unint64_t v31 = 1639678635 * ((v30 >> (((v22 + 11) | a3) + 82)) ^ v30);
  LOBYTE(v31) = *(_BYTE *)(*(void *)(v27 + 8LL * (v22 + 39)) + (v31 >> 24)) ^ (a5 >> v21) ^ *(_BYTE *)(*(void *)(v27 + 8LL * (v22 | v23)) + (v31 >> 24) - 8) ^ *(_BYTE *)(*(void *)(v27 + 8LL * (v22 ^ 0xC)) + (((v22 - 135) | a2) ^ v24) + (v31 >> 24) - 12) ^ v31 ^ (((1639678635 * ((v30 >> (((v22 + 11) | a3) + 82)) ^ v30)) >> 24) * v28);
  *int v29 = v31;
  return ((uint64_t (*)(void))(*(void *)(v25 + 8LL * ((55 * (a1 == (v31 != 0))) ^ v22)) - 4LL))();
}

void sub_100028CB8()
{
}

void sub_100028CC0()
{
  *(_DWORD *)(v1 + 16) = v0;
}

void sub_100028D04(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) + 1374699841 * (((a1 | 0x3B067EF8) - (a1 & 0x3B067EF8)) ^ 0x56F266F1);
  uint64_t v2 = *(void *)a1;
  ((void (*)(char *, void (*)()))*(&off_10005BF10 + v1 - 887))( (char *)*(&off_10005BF10 + (v1 ^ 0x494)) - 8,  sub_10004687C);
  __asm { BR              X11 }

uint64_t sub_100028DAC@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8LL
}

uint64_t sub_100028DDC@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(uint64_t))(v2 + 8LL * (a1 ^ 0x149)))(v1);
}

  ;
}

void sub_100028E0C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }

uint64_t sub_100028E6C()
{
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((v1 != 1782897115) | (4 * (v1 != 1782897115)) | 0x202u)) - 4LL))();
}

uint64_t sub_100028E9C@<X0>(uint64_t a1@<X8>)
{
  int v4 = v1 - (**(_BYTE **)(v3 + 8) == 0);
  *(_DWORD *)(*(void *)(v2 + 96) + 528LL) = 925165539;
  *(_DWORD *)(*(void *)(v2 + 96) + 532LL) = 2086149949;
  *(void *)(*(void *)(v2 + 96) + 536LL) = *(void *)(v2 + 96) + 544LL;
  uint64_t v5 = *(void *)(v2 + 96) + 0x621D43C813E50792LL;
  uint64_t v6 = *(void *)(v3 + 8) + (*(_DWORD *)(v3 + 4) - v4);
  unsigned int v7 = 460628867 * ((2 * (v10 & 0x5C0DDCB0) - v10 + 603071310) ^ 0x6F64A133);
  int v12 = (v4 - 556214061) ^ v7;
  v10[1] = v7 + 638;
  uint64_t v11 = v5;
  uint64_t v13 = v6;
  ((void (*)(_DWORD *))(*(void *)(a1 + 1424) - 12LL))(v10);
  int v8 = v10[0];
  *(void *)(*(void *)(v2 + 96) + 512LL) = *(void *)(v3 + 8) + (*(_DWORD *)(v3 + 4) - v4);
  return (v8 - 886405590);
}

void sub_100028FF8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) + 1225351577 * ((2 * (a1 & 0x54E14326) - a1 - 1424048935) ^ 0xD5E126EB);
  __asm { BR              X13 }

uint64_t sub_100029164()
{
  *(_DWORD *)(v4 + v2) = v0;
  *(_DWORD *)(v6 - 136) = 242 * ((v1 - 499) ^ 0x2C2)
                        + ((((2 * (v6 - 144)) | 0xC393DF78) - (v6 - 144) + 506859588) ^ 0x6E6CF47A) * v3
                        + 207;
  *(void *)(v6 - 128) = v4;
  *(void *)(v6 - 144) = v5;
  return sub_100027864(v6 - 144);
}

void sub_10002A39C(uint64_t a1)
{
  unint64_t v2 = (unint64_t)&v7 ^ qword_100060348 ^ qword_100060108;
  uint64_t v3 = 45734839 * v2 - 0x36FEF50E04838C84LL;
  uint64_t v4 = 45734839 * (v2 ^ 0x95387C5A7726064LL);
  int v5 = byte_10004F110[(-73 * (v3 ^ 0x64 ^ v4))];
  qword_100060348 = v3;
  char v6 = byte_100053D20[v5 ^ 8];
  qword_100060108 = v4;
  ((void (*)(char *, void (*)()))*(&off_10005BF10
                                            + ((-73 * (v3 ^ 0x64 ^ v4)) ^ v6)
                                            + 71))( (char *)*(&off_10005BF10 + ((-73 * (v3 ^ 0x64 ^ v4)) ^ byte_100053D20[v5 ^ 0xE3])
            + 118)
  - 8,
    sub_10004687C);
  __asm { BR              X11 }

uint64_t sub_10002A498()
{
}

  ;
}

uint64_t sub_10002A4D0@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(uint64_t))(v2 + 8LL * (a1 ^ 0x476u)))(v1);
}

void sub_10002A4F0(uint64_t a1)
{
  int v1 = 460628867 * ((a1 + 617932952 - 2 * (a1 & 0x24D4E898)) ^ 0x68426AE5);
  __asm { BR              X9 }

_DWORD *sub_10002A580(_DWORD *result)
{
  *uint64_t result = 886363572;
  return result;
}

void sub_10002A8EC(uint64_t a1, uint64_t a2)
{
  **(_DWORD **)(a1 + 96) = *(_DWORD *)(a2 + 16);
  unsigned int v3 = 235795823 * (((v5 | 0x6937D69) - v5 + (v5 & 0xF96C8290)) ^ 0x923E3430);
  int v8 = &STACK[0x5934B92A3842FD28];
  unsigned int v6 = v3 - 1970643562;
  unsigned int v7 = 1172345435 - v3;
  sub_100022668((uint64_t)v5);
  __asm { BR              X8 }

uint64_t sub_10002AA94( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  unsigned int v16 = v14 - 135 + v13 - 1985862310;
  int v17 = ((a13 - 1026051176) < 0x48D60) ^ (v16 < 0x48D60);
  BOOL v18 = v16 < a13 - 1026051176;
  if (v17) {
    BOOL v18 = (a13 - 1026051176) < 0x48D60;
  }
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v15 + 8LL * ((29 * !v18) ^ v14)) - 4LL))( a1,  2309104986LL);
}

uint64_t sub_10002AB00( uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  int v15 = 1755732067 * ((738867677 - ((v14 - 120) | 0x2C0A39DD) + ((v14 - 120) | 0xD3F5C622)) ^ 0xD337BF9);
  *(void *)(v14 - 120) = a10;
  *(_DWORD *)(v14 - 112) = v15 + a4 + 340;
  *(_DWORD *)(v14 - 108) = a13 - v15 - 206761804;
  uint64_t v16 = sub_100006898(v14 - 120);
  uint64_t v17 = *(_DWORD *)(v14 - 152) & 0x3F;
  *(_BYTE *)(v14 - 220 + (v17 ^ 0x38)) = -22;
}

uint64_t sub_10002AC18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v9
                                                               + 8LL
                                                               * ((785
                                                                 * (v7 != ((v8 + 7) ^ (a7 - 1866)) + (v8 ^ (v10 + 1045)))) ^ v8))
                                                   - 4LL))( a1,  -1251020603LL);
}

uint64_t sub_10002AC60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  BOOL v11 = (v7 ^ 7u) >= ((v8 - a7 - 183) ^ (v10 - 745)) - 791;
  return ((uint64_t (*)(void))(*(void *)(v9 + 8LL * ((v11 | (2 * v11)) ^ v8)) - 4LL))();
}

uint64_t sub_10002AC94(uint64_t a1, uint64_t a2)
{
  *(void *)(v6 - 220 + v3 + a2) = 0x6A6A6A6A6A6A6A6ALL;
}

uint64_t sub_10002ACF0@<X0>(int a1@<W1>, unsigned int a2@<W2>, int a3@<W7>, unsigned int a4@<W8>)
{
  BOOL v11 = a4 < a2;
  *(_BYTE *)(v10 - 220 + (v5 - 1686612119)) = *(_BYTE *)(v9 + (v6 + a3))
  unsigned int v12 = a1 + v6 + 72;
  int v13 = v11 ^ (v12 < a2);
  BOOL v14 = v12 < a4;
  if (!v13) {
    BOOL v11 = v14;
  }
  return ((uint64_t (*)(void))(*(void *)(v8 + 8LL * ((!v11 * v4) ^ v7)) - 4LL))();
}

uint64_t sub_10002AD78@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * (v2 ^ (57 * (a1 != v1))))
                            - (v2 ^ (v4 + 1045))
}

uint64_t sub_10002ADB4@<X0>( int a1@<W6>, uint64_t a2@<X7>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, int32x4_t a24, int32x4_t a25, int32x4_t a26, int32x4_t a27)
{
  unsigned int v35 = (uint64_t (*)(__n128, __n128, __n128, __n128, __n128))(*(void *)(v28 + 8LL * (a1 + a3 - 806)) - 8LL);
  uint64_t v36 = (const char *)(v34 - 220);
  __n128 v37 = (__n128)vdupq_n_s32(0x2E527EDFu);
  __n128 v38 = (__n128)vdupq_n_s32(0x2E527ED2u);
  a16 = v33 - 16;
  v39.n128_u64[0] = 0x6A6A6A6A6A6A6A6ALL;
  v39.n128_u64[1] = 0x6A6A6A6A6A6A6A6ALL;
  v40.n128_u64[0] = 0xD4D4D4D4D4D4D4D4LL;
  v40.n128_u64[1] = 0xD4D4D4D4D4D4D4D4LL;
  __n128 v41 = (__n128)vdupq_n_s32(0x2E527EDBu);
  HIDWORD(v95) = 5;
  uint64_t v42 = *(unsigned int *)(v34 - 148);
  int v43 = *(_DWORD *)(v34 - 144);
  LODWORD(v94) = *(_DWORD *)(v34 - 148);
  HIDWORD(v94) = v43;
  int v44 = *(_DWORD *)(v34 - 136);
  uint64_t v45 = *(unsigned int *)(v34 - 140);
  int v46 = *(_BYTE *)(v34 - 124) ^ 0xE1;
  HIDWORD(a11) = *(unsigned __int8 *)(v34 - 124) ^ 0xFFFFFFE1;
  LODWORD(v95) = *(_DWORD *)(v34 - 140);
  if (v46 == 2)
  {
    HIDWORD(v93) = *(_DWORD *)(v34 - 136);
    int8x16x4_t v97 = vld4q_s8(v36);
    uint64_t v71 = (a1 + v31 - 3);
    uint64_t v72 = *(unsigned int *)(v34 - 132);
    HIDWORD(a9) = *(_DWORD *)(v34 - 132);
    uint8x16_t v73 = (uint8x16_t)veorq_s8(v97.val[0], (int8x16_t)v39);
    uint16x8_t v74 = vmovl_u8(*(uint8x8_t *)v73.i8);
    uint16x8_t v75 = vmovl_high_u8(v73);
    uint8x16_t v76 = (uint8x16_t)veorq_s8(v97.val[1], (int8x16_t)v39);
    _Q22 = vmovl_u8(*(uint8x8_t *)v76.i8);
    _Q21 = vmovl_high_u8(v76);
    __asm
    {
      SHLL2           V23.4S, V21.8H, #0x10
      SHLL2           V24.4S, V22.8H, #0x10
    }

    uint8x16_t v81 = (uint8x16_t)veorq_s8(v97.val[2], (int8x16_t)v39);
    uint16x8_t v82 = vmovl_high_u8(v81);
    uint16x8_t v83 = vmovl_u8(*(uint8x8_t *)v81.i8);
    v97.val[0] = veorq_s8(v97.val[3], (int8x16_t)v39);
    v97.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v97.val[0]);
    v97.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v97.val[1]);
    v97.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v97.val[1].i8);
    v97.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v97.val[0].i8);
    v97.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v97.val[0]);
    v97.val[0] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v97.val[0].i8);
    int32x4_t v84 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8( (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL),  (int8x16_t)vshll_n_u16(*(uint16x4_t *)v83.i8, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v74.i8), 0x18uLL)),  v97.val[0]);
    int32x4_t v85 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8(_Q24, (int8x16_t)vshll_high_n_u16(v83, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v74), 0x18uLL)),  v97.val[3]);
    int32x4_t v86 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8( (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL),  (int8x16_t)vshll_n_u16(*(uint16x4_t *)v82.i8, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v75.i8), 0x18uLL)),  v97.val[1]);
    int32x4_t v87 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8(_Q23, (int8x16_t)vshll_high_n_u16(v82, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v75), 0x18uLL)),  v97.val[2]);
    v97.val[0] = veorq_s8( vandq_s8((int8x16_t)v84, (int8x16_t)v37),  (int8x16_t)(*(_OWORD *)v97.val & __PAIR128__(0xFFFFFF0DFFFFFF0DLL, 0xFFFFFF0DFFFFFF0DLL)));
    v97.val[3] = veorq_s8( vandq_s8((int8x16_t)v85, (int8x16_t)v37),  (int8x16_t)(*(_OWORD *)&v97.val[3] & __PAIR128__(0xFFFFFF0DFFFFFF0DLL, 0xFFFFFF0DFFFFFF0DLL)));
    v97.val[1] = veorq_s8( vandq_s8((int8x16_t)v86, (int8x16_t)v37),  (int8x16_t)(*(_OWORD *)&v97.val[1] & __PAIR128__(0xFFFFFF0DFFFFFF0DLL, 0xFFFFFF0DFFFFFF0DLL)));
    v97.val[2] = veorq_s8( vandq_s8((int8x16_t)v87, (int8x16_t)v37),  (int8x16_t)(*(_OWORD *)&v97.val[2] & __PAIR128__(0xFFFFFF0DFFFFFF0DLL, 0xFFFFFF0DFFFFFF0DLL)));
    a26 = vaddq_s32(vsubq_s32(v86, vaddq_s32((int32x4_t)v97.val[1], (int32x4_t)v97.val[1])), (int32x4_t)v38);
    a27 = vaddq_s32(vsubq_s32(v87, vaddq_s32((int32x4_t)v97.val[2], (int32x4_t)v97.val[2])), (int32x4_t)v38);
    a24 = vaddq_s32(vsubq_s32(v84, vaddq_s32((int32x4_t)v97.val[0], (int32x4_t)v97.val[0])), (int32x4_t)v38);
    a25 = vaddq_s32(vsubq_s32(v85, vaddq_s32((int32x4_t)v97.val[3], (int32x4_t)v97.val[3])), (int32x4_t)v38);
    int v88 = (_DWORD *)&a24 + v32 + 848194228;
    int v89 = *(v88 - 8) ^ *(v88 - 3);
    uint64_t v90 = *(v88 - 16);
    int v91 = v90 ^ *(v88 - 14) ^ (v89 + v29 - ((2 * v89) & 0x5CA4FDA4));
    HIDWORD(v92) = v91 ^ v29;
    LODWORD(v92) = v91;
    _DWORD *v88 = (v92 >> 31) + v29 - ((2 * (v92 >> 31)) & 0x5CA4FDA4);
    LODWORD(v93) = HIDWORD(a7) + 1522025483;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (*)(__n128, __n128, __n128, __n128, __n128), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 8LL * (int)((199 * (v33 != 848194165)) ^ v71)))( v90,  v45,  106644893LL,  52LL,  v42,  v71,  v72,  a2,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  v93,  v35,  v94,  v95,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23);
  }

  else if (v46 == 1)
  {
    int8x16x4_t v96 = vld4q_s8(v36);
    uint8x16_t v47 = (uint8x16_t)veorq_s8(v96.val[0], (int8x16_t)v39);
    uint16x8_t v48 = vmovl_u8(*(uint8x8_t *)v47.i8);
    int8x16_t v49 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v48.i8);
    int8x16_t v50 = (int8x16_t)vmovl_high_u16(v48);
    uint16x8_t v51 = vmovl_high_u8(v47);
    int8x16_t v52 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v51.i8);
    int8x16_t v53 = (int8x16_t)vmovl_high_u16(v51);
    uint8x16_t v54 = (uint8x16_t)veorq_s8(v96.val[1], (int8x16_t)v39);
    uint16x8_t v55 = vmovl_high_u8(v54);
    uint16x8_t v56 = vmovl_u8(*(uint8x8_t *)v54.i8);
    uint8x16_t v57 = (uint8x16_t)veorq_s8(v96.val[2], (int8x16_t)v39);
    _Q26 = (int8x16_t)vmovl_high_u8(v57);
    _Q25 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v57.i8);
    int8x16_t v60 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q25.i8, 0x10uLL);
    __asm { SHLL2           V25.4S, V25.8H, #0x10 }

    int8x16_t v65 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q26.i8, 0x10uLL);
    __asm { SHLL2           V26.4S, V26.8H, #0x10 }

    v96.val[0] = veorq_s8(v96.val[3], (int8x16_t)v39);
    v96.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v96.val[0]);
    v96.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v96.val[1]);
    v96.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v96.val[0].i8);
    v96.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v96.val[0]);
    v96.val[0] = vorrq_s8( vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v96.val[0].i8), 0x18uLL), v60),  vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v56.i8, 8uLL), v49));
    v96.val[3] = vorrq_s8( vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v96.val[3], 0x18uLL), _Q25),  vorrq_s8((int8x16_t)vshll_high_n_u16(v56, 8uLL), v50));
    v96.val[1] = vorrq_s8( vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v96.val[1].i8), 0x18uLL), v65),  vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v55.i8, 8uLL), v52));
    v96.val[2] = vorrq_s8( vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v96.val[2], 0x18uLL), _Q26),  vorrq_s8((int8x16_t)vshll_high_n_u16(v55, 8uLL), v53));
    int32x4_t v66 = (int32x4_t)veorq_s8( vandq_s8(v96.val[0], (int8x16_t)v41),  (int8x16_t)(*(_OWORD *)&v49 & __PAIR128__(0xFFFFFF09FFFFFF09LL, 0xFFFFFF09FFFFFF09LL)));
    int32x4_t v67 = (int32x4_t)veorq_s8( vandq_s8(v96.val[3], (int8x16_t)v41),  (int8x16_t)(*(_OWORD *)&v50 & __PAIR128__(0xFFFFFF09FFFFFF09LL, 0xFFFFFF09FFFFFF09LL)));
    int32x4_t v68 = (int32x4_t)veorq_s8( vandq_s8(v96.val[1], (int8x16_t)v41),  (int8x16_t)(*(_OWORD *)&v52 & __PAIR128__(0xFFFFFF09FFFFFF09LL, 0xFFFFFF09FFFFFF09LL)));
    int32x4_t v69 = (int32x4_t)veorq_s8( vandq_s8(v96.val[2], (int8x16_t)v41),  (int8x16_t)(*(_OWORD *)&v53 & __PAIR128__(0xFFFFFF09FFFFFF09LL, 0xFFFFFF09FFFFFF09LL)));
    a26 = vaddq_s32(vsubq_s32((int32x4_t)v96.val[1], vaddq_s32(v68, v68)), (int32x4_t)v38);
    a27 = vaddq_s32(vsubq_s32((int32x4_t)v96.val[2], vaddq_s32(v69, v69)), (int32x4_t)v38);
    a24 = vaddq_s32(vsubq_s32((int32x4_t)v96.val[0], vaddq_s32(v66, v66)), (int32x4_t)v38);
    a25 = vaddq_s32(vsubq_s32((int32x4_t)v96.val[3], vaddq_s32(v67, v67)), (int32x4_t)v38);
    return ((uint64_t (*)(__n128))(*(void *)(v28 + 8LL * ((38 * (a16 + 1 != v33)) ^ 0x509u)) - 12LL))(v37);
  }

  else
  {
    *(_DWORD *)(v34 - 148) = (v42 ^ v30) + (v94 ^ v30) + v30 - (v27 & (2 * ((v42 ^ v30) + (v94 ^ v30))));
    *(_DWORD *)(v34 - 144) = 2 * (v43 ^ v30) + v30 - (v27 & (4 * (v43 ^ v30)));
    *(_DWORD *)(v34 - 140) = (v45 ^ v30) + (v95 ^ v30) + v30 - (v27 & (2 * ((v45 ^ v30) + (v95 ^ v30))));
    *(_DWORD *)(v34 - 136) = 2 * (v44 ^ v30) + v30 - (v27 & (4 * (v44 ^ v30)));
    return v35(v37, v38, v39, v40, v41);
  }

uint64_t sub_10002BC14( uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, uint64_t a16, unsigned int a17)
{
  unsigned int v19 = (((v18 ^ (v18 - 58)) + 562213292) ^ a3) + a15;
  BOOL v20 = v19 < 0x97E51DD3;
  BOOL v21 = v19 > a17;
  if (a17 < 0x97E51DD3 != v20) {
    BOOL v22 = v20;
  }
  else {
    BOOL v22 = v21;
  }
  return ((uint64_t (*)(void))(*(void *)(v17 + 8LL * ((961 * !v22) ^ (a7 + v18 + 489))) - 12LL))();
}

uint64_t sub_10002BCAC( uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  return ((uint64_t (*)(void))(*(void *)(v9 + 8LL * (((a3 ^ 0x466) * (v8 + a8 + 63 < (v8 + a8))) ^ a3))
                            + a6
                            - (a3
                             - a7
                             - 193)))();
}

uint64_t sub_10002BCE8( uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return ((uint64_t (*)(void))(*(void *)(v15
                                        + 8LL
                                        * ((500
}

uint64_t sub_10002BD48( double a1, double a2, int8x16_t a3, int8x16_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12)
{
  int8x16_t *v12 = vaddq_s8( vsubq_s8( *(int8x16_t *)(v16 + (v13 + a12)),  vandq_s8( vaddq_s8( *(int8x16_t *)(v16 + (v13 + a12)),  *(int8x16_t *)(v16 + (v13 + a12))),  a4)),  a3);
  return ((uint64_t (*)(void))(*(void *)(v15
                                        + 8LL * ((a11 + v14 - 234) ^ (4 * (((a11 + v14 - 861) & 0xFFFFFFDA) != 64LL))))
                            - 4LL))();
}

uint64_t sub_10002BDA8@<X0>(int a1@<W1>, char a2@<W3>, int a3@<W6>, int a4@<W7>, uint64_t a5@<X8>)
{
  *(_BYTE *)(v6 + a5) = *(_BYTE *)(v10 + (v7 + a4))
  return ((uint64_t (*)(void))(*(void *)(v8 + 8LL * (((a5 != 63) * a1) ^ (a3 + v5 - 234))) - 4LL))();
}

uint64_t sub_10002BE00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return (*(uint64_t (**)(void))(v8
                              + 8LL * ((((v7 - 1251020603) > 0x37) * (a7 + v9 - 873)) ^ (a7 + v9 - 348))))();
}

uint64_t sub_10002BE40@<X0>(int a1@<W8>)
{
  int v4 = a1 + 15;
  unint64_t v5 = ((a1 + 1145172042) & 0xBBBE0DEA ^ (unint64_t)(v2 + 159)) + v1;
  if (v5 <= 0x38) {
    unint64_t v5 = 56LL;
  }
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * ((177 * (v5 - v1 + 1251020603 < 8)) ^ v4)) - 12LL))();
}

uint64_t sub_10002BEAC()
{
  *(void *)(v5 - 220 + v2 + v3) = 0x6A6A6A6A6A6A6A6ALL;
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((((v0 & 0xFFFFFFFFFFFFFFF8LL) == 8) * ((v1 + 81) ^ 0x55D)) ^ (v1 - 355)))
                            - 8LL))();
}

uint64_t sub_10002BEF8(double a1)
{
  double *v2 = a1;
  return ((uint64_t (*)(void))(*(void *)(v5 + 8LL * (((v4 == 0) * v3) ^ v1)) - 8LL))();
}

uint64_t sub_10002BF1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return ((uint64_t (*)(void))(*(void *)(v10
                                        + 8LL
}

void sub_10002BF68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  int v9 = *(unsigned __int8 *)(v8 - 124) ^ 0xE1;
  if (v9 == 1)
  {
    unsigned int v16 = *(_DWORD *)(v8 - 156);
    unsigned int v15 = *(_DWORD *)(v8 - 152);
    *(_BYTE *)(v8 - 164) = ((8 * v15) ^ 0xC0) - ((2 * ((8 * v15) ^ 0xC0)) & 0xDF) + 106;
    char v14 = -44;
    *(_BYTE *)(v8 - 163) = ((v15 >> 5) ^ 0x6B) - ((2 * ((v15 >> 5) ^ 0x6B)) & 0xD4) + 106;
    *(_BYTE *)(v8 - 162) = ((v15 >> 13) ^ 0x85) - ((v15 >> 12) & 0xD4) + 106;
    *(_BYTE *)(v8 - 161) = ((v15 >> 21) ^ 0xE6) - ((2 * ((v15 >> 21) ^ 0xE6)) & 0xD4) + 106;
    HIDWORD(v17) = v16 ^ 0x17;
    LODWORD(v17) = v15 ^ 0x40000000;
    *(_BYTE *)(v8 - 160) = (v17 >> 29) - ((2 * (v17 >> 29)) & 0xD4) + 106;
    *(_BYTE *)(v8 - 159) = ((v16 >> 5) ^ 0xD) + (~(2 * ((v16 >> 5) ^ 0xD)) | 0x2B) + 107;
    *(_BYTE *)(v8 - 158) = ((v16 >> 13) ^ 0x29) - ((2 * ((v16 >> 13) ^ 0x29)) & 0xD4) + 106;
    char v10 = 11;
    unsigned int v13 = (v16 >> 21) ^ 0x21;
  }

  else
  {
    if (v9 != 2) {
      goto LABEL_6;
    }
    char v10 = a7 + v7 - 98;
    unsigned int v13 = *(_DWORD *)(v8 - 156);
    unsigned int v11 = *(_DWORD *)(v8 - 152);
    *(_BYTE *)(v8 - 164) = ((v13 >> 21) ^ 0x21) - ((2 * ((v13 >> 21) ^ 0x21)) & 0xD4) + 106;
    *(_BYTE *)(v8 - 163) = ((v13 >> (v10 ^ 6)) ^ 0x29) - ((2 * ((v13 >> (v10 ^ 6)) ^ 0x29)) & 0xD4) + 106;
    *(_BYTE *)(v8 - 162) = ((v13 >> 5) ^ 0xD) - ((2 * ((v13 >> 5) ^ 0xD)) & 0xD4) + 106;
    HIDWORD(v12) = v13 ^ 0x17;
    LODWORD(v12) = v11 ^ 0x40000000;
    *(_BYTE *)(v8 - 161) = (v12 >> 29) - ((2 * (v12 >> 29)) & 0xD4) + 106;
    *(_BYTE *)(v8 - 160) = ((v11 >> 21) ^ 0xE6) - ((2 * ((v11 >> 21) ^ 0xE6)) & 0xD4) + 106;
    *(_BYTE *)(v8 - 159) = ((v11 >> 13) ^ 0x85) - ((v11 >> 12) & 0xD4) + 106;
    *(_BYTE *)(v8 - 158) = ((v11 >> 5) ^ 0x6B) - ((2 * ((v11 >> 5) ^ 0x6B)) & 0xD4) + 106;
    LOBYTE(v13) = (8 * v11) ^ 0xC0;
    char v14 = -48;
  }

  *(_BYTE *)(v8 - 157) = v13 - (v14 & (2 * v13)) + ((v10 + 121) ^ 0xEE);
LABEL_6:
  JUMPOUT(0x10002B05CLL);
}

uint64_t sub_10002C338@<X0>(uint64_t a1@<X2>, char a2@<W6>, unsigned int a3@<W8>)
{
  int v9 = *(_DWORD *)(v8 - 220 + 4LL * ((v6 + v3) >> (a2 + ((v4 - 109) | 0x84) - 107)) + 72);
  *(_BYTE *)(a1 + (v6 + v3 + 1)) = (BYTE2(v9) ^ 0x5B) - ((2 * (BYTE2(v9) ^ 0x5B)) & 0xD4) + 106;
  *(_BYTE *)(a1 + (v6 + v3)) = (HIBYTE(v9) ^ 0x26) + (~(2 * (HIBYTE(v9) ^ 0x26)) | 0x2B) + 107;
  *(_BYTE *)(a1 + (v6 + v3 + 2)) = (BYTE1(v9) ^ 0x45) - ((2 * (BYTE1(v9) ^ 0x45)) & 0xD4) + 106;
  *(_BYTE *)(a1 + (v6 + v3 + 3)) = v9 ^ 0xF7;
  unsigned int v10 = *(_DWORD *)(v8 - 128) - 1765286898;
  BOOL v11 = v10 < a3;
  BOOL v12 = v6 + 897398466 < v10;
  if (v6 + 897398466 < a3 != v11) {
    BOOL v12 = v11;
  }
  return (*(uint64_t (**)(void))(v7 + 8LL * ((v12 * v5) ^ v4)))();
}

uint64_t sub_10002C424( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, char a22)
{
  *(_BYTE *)(v24 - 129) = ((((unint64_t)&a22 ^ 0xFFB9DFF136D3F11BLL) - 27 + ((v23 - 83) & (2LL * (void)&a22))) ^ 0xBA)
                        * (((unint64_t)&a22 ^ 0xFFB9DFF136D3F11BLL)
                         - 27
                         + ((v23 - 83) & (2LL * (void)&a22))
                         + 17);
}

void sub_10002C4E8()
{
}

uint64_t sub_10002C4F0()
{
  return 0LL;
}

void sub_10002C530(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) ^ (3804331 * ((a1 & 0x8EFFDE1B | ~(a1 | 0x8EFFDE1B)) ^ 0xFEA53A22));
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = *(_DWORD *)(v2 - 0x621D43C813E5057ELL);
  unsigned int v5 = v1 - 1759421093 * ((2 * (&v4 & 0x11D00BC0) - &v4 + 1848636475) ^ 0xDD52446F) + 300;
  uint64_t v4 = v2;
  sub_1000069B0((uint64_t)&v4);
  __asm { BR              X9 }

uint64_t sub_10002C664@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
                                        * ((((((v1 - 1257) | 0xDB) + 148) ^ (v1 - 1105)) * (((v3 + v2) & 0x1F) != 0x11)) ^ v1))
                            - 8LL))();
}

uint64_t sub_10002C6D4@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1
                              + 8LL
                              * ((44
                                * ((int)((v3 ^ 0xBDFEFFFD)
                                       + 1983749384
                                       + (v1 & 0x7BFDFFFA)
                                       + ((v2 + 93) | 0x84)
                                       - 876388034) >= 0)) ^ v2)))();
}

uint64_t sub_10002C768@<X0>(int a1@<W2>, int a2@<W4>, uint64_t a3@<X8>)
{
  int v10 = a1 - 225;
  unsigned int v11 = *(_DWORD *)(*(void *)(v9 - 0x621D43C813E5057ALL) + 4LL * (v8 + v7 + 444)) ^ v5;
  *(_DWORD *)(*(void *)(v9 - 0x621D43C813E5057ALL) + 4LL * (v3 + v4)) = ((v11 >> (32 - v6)) | a2 ^ v5)
                                                                        + v5
                                                                        - ((v10 + 2119399229) & (2
                                                                                               * ((v11 >> (32 - v6)) | a2 ^ v5)));
  return (*(uint64_t (**)(void))(a3 + 8LL * ((359 * (v8 + v7 + 443 >= 0)) ^ v10)))();
}

void sub_10002C808()
{
}

uint64_t sub_10002C810@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1
                              + 8LL
                              * ((((v3 ^ 0xDC7F7BEF) + 1744687040 + (v1 & 0xB8FEF7DE) - 1149062064 < (((v2 + 626) | 0x50) ^ 0x7FFFFCA5u))
                                * ((v2 + 416) ^ 0x242)) ^ v2)))();
}

uint64_t sub_10002C88C@<X0>(unsigned int a1@<W0>, uint64_t a2@<X8>)
{
  int v6 = (v3 - 432) | 0x10;
  *(_DWORD *)(*(void *)(v5 - 0x621D43C813E5057ALL) + 4LL * ((v6 ^ 0x4BE595A7) + v2 + v4)) = *(_DWORD *)(*(void *)(v5 - 0x621D43C813E5057ALL) + 4LL * a1);
  return (*(uint64_t (**)(void))(a2 + 8LL * ((672 * (a1 - 1 < 0x7FFFFFFF)) ^ v6)))();
}

uint64_t sub_10002C8F8@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  *(_DWORD *)(*v6 + 4LL * (v7 + a2)) = *(_DWORD *)(*v6 + 4LL * (a2 + v3));
  return (*(uint64_t (**)(uint64_t, void))(a3 + 8LL * (((a2 + v3 - 1 < v8) * (int)a1) ^ v5)))( a1,  (v4 + a2 - 859));
}

uint64_t sub_10002C934@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
                                        * (((((v2 + 469781125) & 0xE3FFB374 ^ 0x9062E1BA) + v1 < 0x7FFFFFFF)
                                          * (((v2 + 168) | 0x80) + 313)) ^ v2))
                            - 4LL))();
}

uint64_t sub_10002C998@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(v5 - 0x621D43C813E5057ALL) + 4LL * (v2 + v3 + 1)) = -1087783924;
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
                                        * (((v2 + v3 >= ((v4 + 1840690835) & 0x92494C9A) + v1) | ((v2 + v3 >= ((v4 + 1840690835) & 0x92494C9A) + v1) << 6)) ^ (v4 + 455)))
                            - 4LL))();
}

uint64_t sub_10002CA04@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*v4 + 4LL * (v6 + v2 + 1)) = v3;
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * (((v6 + v2 >= v1) | ((v6 + v2 >= v1) << 6)) ^ v5)) - 4LL))();
}

void sub_10002CA34()
{
  int v5 = -1103545054 - v0;
  if (*v4 + 61333699 >= ((4 * (v3 ^ 0x4D7)) ^ 0x154)) {
    int v6 = v5;
  }
  else {
    int v6 = v1;
  }
  *v4 += v2 + v6 + 2;
}

void sub_10002CB8C(uint64_t a1)
{
  unint64_t v2 = (unint64_t)&v7[qword_100060108 ^ qword_100060110];
  uint64_t v3 = 45734839 * v2 - 0x95387C5A7726064LL;
  uint64_t v4 = 45734839 * (v2 ^ 0x95387C5A7726064LL);
  qword_100060110 = v3;
  uint64_t v5 = (-73 * (v3 ^ 0x64 ^ v4));
  unsigned __int8 v6 = byte_100057900[byte_100053C20[v5] ^ 0x9A];
  qword_100060108 = v4;
  ((void (*)(char *, void (*)()))*(&off_10005BF10
                                            + ((-73 * (v3 ^ 0x64 ^ v4)) ^ v6)
                                            + 116))( (char *)*(&off_10005BF10 + ((-73 * (v3 ^ 0x64 ^ v4)) ^ byte_10004BEE0[byte_100057A00[v5] ^ 0xF3])
            + 73)
  - 8,
    sub_10004687C);
  __asm { BR              X9 }

uint64_t sub_10002CC9C@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL * ((497 * (*(void *)(*(void *)(v1 + 1672) - 4LL) != 0LL)) ^ 0x258u))
                            - 4LL))();
}

uint64_t sub_10002CCC8()
{
  return (*(uint64_t (**)(uint64_t))(v1 + 1608))(v0);
}

  ;
}

void sub_10002CCF0(uint64_t a1)
{
  int v1 = 535753261 * ((-2 - ((a1 | 0x6D3F96EA) + (~(_DWORD)a1 | 0x92C06915))) ^ 0x9834673A);
  int v2 = *(_DWORD *)(a1 + 8) ^ v1;
  int v3 = *(_DWORD *)(a1 + 4) + v1;
  BOOL v5 = (v3 & 0x30000000) == 0 || (v3 & 0x3F000000) == 754974720;
  __asm { BR              X12 }

uint64_t sub_10002CDBC@<X0>( uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t *a6, int a7, int a8, unint64_t *a9, unsigned int a10, unint64_t *a11, char a12, uint64_t a13)
{
  int v17 = v14 - 9;
  uint64_t v18 = *(void *)(v15 + 32);
  unsigned int v19 = 1224239923
      * (((&a6 | 0xB684D67) - &a6 + (&a6 & 0xF497B298)) ^ 0xF9DBB0B0);
  a12 = 58 - 51 * (((&a6 | 0x67) - &a6 + (&a6 & 0x98)) ^ 0xB0);
  a7 = (v17 - 415) ^ v19;
  a13 = v18;
  a9 = &STACK[0x5CF514050BE6E877];
  a11 = &STACK[0x5523B707D71B703B];
  a6 = &STACK[0x5F95BF1661E6ED31];
  a10 = (((v17 - 756225106) ^ v13) - 1486956544 + ((v13 << (v17 - 125)) & 0xFDEFFFE2 ^ 0x582621A2)) ^ v19;
  uint64_t v20 = ((uint64_t (*)(unint64_t **))(*(void *)(a1 + 8LL * (v17 ^ 0x30A)) - 12LL))(&a6);
  return ((uint64_t (*)(uint64_t))(*(void *)(v16 + 8LL * ((249 * (a8 != 777158354)) ^ v17)) - 12LL))(v20);
}

uint64_t sub_10002CEFC()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
                                        * (((((v2 - 894) | 0x100) ^ 0x7A1 ^ (140 * ((v2 - 576) ^ 0x13C)))
                                          * (v1 == 754974720)) ^ (v2 - 576)))
                            - 8LL))();
}

uint64_t sub_10002CF44( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unint64_t a11)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12
                                                                       + 8LL
                                                                       * (int)(((a11 + 4 >= a11)
                                                                              * (((v11 - 989366681) ^ 0xC5077641) - 265)) ^ v11)))( a1,  a2,  a3,  a4);
}

uint64_t sub_10002CFC4()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((252 * ((v1 ^ 0xFEE0DE95) != ((v0 + 663469215) & 0x58744322) - 256)) ^ v0))
                            - 8LL))();
}

uint64_t sub_10002D020@<X0>(uint64_t a1@<X8>)
{
  BOOL v8 = v4 > 0xF78C502;
  *(_BYTE *)(a1 + (v6 - 1456151510)) = *(_BYTE *)(v1 + (v6 - 1456151510));
  if (v8 == v6 - 1715724504 < v3) {
    BOOL v8 = v6 - 1715724504 < v5;
  }
  return ((uint64_t (*)(void))(*(void *)(v7 + 8LL * ((v8 * ((v2 - 62) ^ 0x1FC)) ^ v2)) - 8LL))();
}

uint64_t sub_10002D08C()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((1450
                                          * (((v0 - 1) ^ ((v1 ^ ((v0 - 174) | 0x56C) ^ 0xFB153616)
                                                                         - 83886148
                                                                         + ((2 * v1) & 0xBEBDAFE ^ 0x9C1982A) == 16117051)) & 1)) ^ v0))
                            - 8LL))();
}

uint64_t sub_10002D108()
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                                     + 8LL
                                                     * ((1003
                                                       * (v1 + v2 - 100003199 >= ((v0 - 1583070213) & 0x5E5BB7F9u) - 485)) ^ v0))
                                         - 4LL))(((v0 - 1583070213) & 0x5E5BB7F9u) + 406);
}

uint64_t sub_10002D168()
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * ((14 * ((((43 * (v2 ^ 0x1E4)) ^ 0xFFFFFC7B) & (v0 - (v1 & 3))) > v0 + 3)) ^ v2))
                            - 8LL))();
}

uint64_t sub_10002D1B8@<X0>(int a1@<W2>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 - 3 + (v4 + v3)) = *(_DWORD *)(v2 - 3 + (v4 + v3));
  return ((uint64_t (*)(void))(*(void *)(v6 + 8LL * ((1710 * (((a1 - 585) ^ 0x13A) == v5)) ^ (a1 - 317))) - 8LL))();
}

uint64_t sub_10002D20C@<X0>(unsigned int a1@<W1>, uint64_t a2@<X8>, uint8x8_t a3@<D0>)
{
  a3.i32[0] = *(_DWORD *)(a2 + (v6 ^ 0x1F0LL) + a1);
  *(_DWORD *)(a2 - 3 + (v4 + v3)) = vmovn_s16((int16x8_t)vmovl_u8(a3)).u32[0];
  BOOL v8 = ((2 * (v6 ^ 0x16E)) ^ 0x13A) != v5;
  return ((uint64_t (*)(void))(*(void *)(v7 + 8LL * ((2 * v8) | (16 * v8) | v6 ^ 0x515)) - 8LL))();
}

uint64_t sub_10002D284()
{
}

uint64_t sub_10002D2C0@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  *(_BYTE *)(a2 + (v5 + v4)) = *(_BYTE *)(v2 + (v5 + v4));
  return ((uint64_t (*)(void))(*(void *)(v6 + 8LL * ((a1 + 838) | (32 * ((a1 ^ 0x287) + v5 - 257 != v3)))) - 12LL))();
}

uint64_t sub_10002D2FC()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((586
}

uint64_t sub_10002D33C@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  *(_DWORD *)(v6 - 0x540B97786E06359ELL) = a6;
}

void sub_10002D390()
{
  *(void *)(v0 - 0x4757C87602801F33LL) = v3;
  _DWORD *v2 = v1;
}

void sub_10002D41C()
{
  v0[0] = (1178560073 * (((v0 | 0x945DDB82) - (v0 & 0x945DDB82)) ^ 0x2EC9A3E0)) ^ 0x650810FC;
  sub_100045AE8(v0);
  __asm { BR              X8 }

uint64_t sub_10002D4E0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, unint64_t *a18, int a19, unsigned int a20)
{
  a18 = &STACK[0x72D239406EDD8F50];
  a20 = 1513 - 460628867 * (((&a18 | 0x8BB0E6D) - (&a18 & 0x8BB0E6D)) ^ 0x442D8C10);
  sub_100024FE0((uint64_t)&a18);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 + 8LL * ((46 * (a19 != v20)) ^ 0x299)) - 4LL))( v22,  v23,  v24,  v25,  v26,  v27,  v28,  v29,  a9,  a10,  a11);
}

uint64_t sub_10002D584( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19, uint64_t a20, unint64_t *a21, int a22, int a23)
{
  unsigned int v26 = 1755732067
      * ((2 * ((&a18 ^ 0x4D536147) & 0x46C3A983) - (&a18 ^ 0x4D536147) + 960255612) ^ 0xAAA98AE0);
  a20 = a14;
  a21 = &STACK[0x4A65459BC62410FF];
  a22 = (v25 + 2138962319) ^ v26;
  a23 = v26 ^ 0x3ABCEA0E;
  a19 = v26 ^ 0x23B2D16E;
  uint64_t v27 = sub_1000459CC((uint64_t)&a18);
  return ((uint64_t (*)(uint64_t))(*(void *)(v24
                                                      + 8LL
                                                      * ((47
                                                        * (a18 == ((v25 - 346) ^ (v23 - 189) ^ (48 * (v25 ^ 0x41C))))) ^ v25))
                                          - 8LL))(v27);
}

uint64_t sub_10002D680( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, unint64_t *a15, uint64_t a16, uint64_t a17, unsigned int a18, unint64_t *a19, unint64_t *a20)
{
  a19 = &STACK[0x5843A1C59527653F];
  a20 = a15;
  a18 = (v23 - 153) ^ (1374699841
                     * ((2 * (&a18 & 0x3E37FD38) - &a18 - 1043856698) ^ 0xAC3C1ACF));
  uint64_t v24 = (void (*)(unsigned int *))(*(void *)(v21 + 8LL * (v23 - 520)) - 12LL);
  v24(&a18);
  a18 = (v23 - 153) ^ (1374699841 * (((&a18 | 0x3811F97) - (&a18 & 0x3811F97)) ^ 0x6E75079E));
  a19 = &STACK[0x5843A1C595276537];
  a20 = a15;
  v24(&a18);
  a18 = (v23 - 153) ^ (1374699841
                     * (((&a18 | 0x7695AD7B) + (~&a18 | 0x896A5284)) ^ 0x1B61B573));
  a19 = &STACK[0x5843A1C59527653B];
  a20 = a15;
  v24(&a18);
  LODWORD(a20) = v23
               - 1755732067
  a19 = a15;
  uint64_t v25 = sub_100019CC0((uint64_t)&a18);
}

uint64_t sub_10002D838( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17)
{
}

uint64_t sub_10002D86C@<X0>(int a1@<W8>)
{
  int *v3 = v1 ^ 0x6DF ^ a1 ^ v11;
  int *v2 = v10 ^ v4;
  int v5 = 5 * (v1 ^ 0x245);
  uint64_t v14 = v9;
  unsigned int v13 = (v1 ^ 0x6DF)
  v7(v12);
  uint64_t v14 = v8;
  unsigned int v13 = v5
      + 535753261
  v7(v12);
  return v4 ^ 0x2E527ED2u;
}

void sub_10002D988(uint64_t a1)
{
  BOOL v2 = *(_DWORD *)(*(void *)(a1 + 8) - 0x621D43C813E5057ELL) == 2086149949
    || *(_DWORD *)(*(void *)(a1 + 16) - 0x621D43C813E5057ELL) == 2086149949;
  __asm { BR              X14 }

uint64_t sub_10002DA74@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v1
                              + 8LL
                              * ((31 * (((v2 - 1081916327) & 0x407CBDEF ^ 0xFFFFFAD4) + a1 + v3 >= (v2 ^ 0x7FFFFC1Bu))) ^ v2)))();
}

uint64_t sub_10002DAC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3
                                                                        + 8LL
                                                                        * ((67
                                                                          * (v5 <= ((2 * (v4 ^ 0x3E8)) ^ 0x776) - 1642)) ^ v4 ^ 0x3E8))
                                                            - 8LL))( a1,  a2,  a3);
}

uint64_t sub_10002DB24( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  *(_DWORD *)(a14 + 4LL * (v18 - 722663087)) = v15;
  int v19 = v18 - 713744107;
  BOOL v21 = v19 < -2138564669 || v19 >= v17;
  return ((uint64_t (*)(void))(*(void *)(v14 + 8LL * ((367 * v21) ^ v16)) - 8LL))();
}

uint64_t sub_10002DB80()
{
}

uint64_t sub_10002DBB4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10)
{
  return ((uint64_t (*)(void))(*(void *)(v10
                                        + 8LL * (int)((((v11 + 271146128) & 0xEFD6A3E6 ^ 0x283) * (a10 > a9)) ^ v11))
}

uint64_t sub_10002DC1C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return ((uint64_t (*)(void))(*(void *)(v14
                                        + 8LL
                                        * ((1500
}

uint64_t sub_10002DC6C()
{
}

uint64_t sub_10002DCB4@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((1500
}

uint64_t sub_10002DD00()
{
  *(_DWORD *)(v2 - 108) = v1 - 230 - 1759421093 * ((v2 - 120) ^ 0xB37DB054);
  *(void *)(v2 - 120) = v4;
  sub_1000069B0(v2 - 120);
  *(_DWORD *)(v2 - 108) = v1
                        - 230
                        - 1759421093 * ((((2 * (v2 - 120)) | 0x1F4924FA) - (v2 - 120) - 262443645) ^ 0xBCD92229);
  *(void *)(v2 - 120) = v5;
  sub_1000069B0(v2 - 120);
  *(void *)(v2 - 120) = v0;
  *(_DWORD *)(v2 - 112) = v1 + 3804331 * ((((v2 - 120) | 0x8F66C20F) + (~(v2 - 120) | 0x70993DF0)) ^ 0xC3D9C8) + 547;
  *(void *)(v2 - 104) = v5;
  return sub_100027864(v2 - 120);
}

void sub_10002E114(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    BOOL v2 = *(void *)a1 == 0x4A65459BC62410CFLL;
  }
  else {
    BOOL v2 = 1;
  }
  int v3 = v2;
  int v1 = *(_DWORD *)(a1 + 12) - 235795823 * (a1 ^ 0x94AD4959);
  __asm { BR              X8 }

uint64_t sub_10002E224(uint64_t result)
{
  *(_DWORD *)(result + 8) = v1 | 4;
  return result;
}

uint64_t sub_10002F8FC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = (v8 - 1951191260) & 0x744CD465;
  LODWORD(STACK[0x40C]) = STACK[0x2E0];
  LODWORD(STACK[0x43C]) = STACK[0x2E8];
  STACK[0x348] = STACK[0x2C8];
  STACK[0x570] = STACK[0x2D0];
  STACK[0x398] = STACK[0x2D8];
  unint64_t v12 = STACK[0x200];
  *(_DWORD *)(v12 + 52) = *(_DWORD *)(STACK[0x200] + 52) + 1;
  LODWORD(STACK[0x318]) = *(_DWORD *)(v12 + 360);
  STACK[0x468] = (v11 ^ 0xDC5) + v9 - 2432;
  LODWORD(STACK[0x4C4]) = v10;
  LODWORD(STACK[0x2E8]) = STACK[0x43C];
  LODWORD(STACK[0x2E0]) = STACK[0x40C];
  return ((uint64_t (*)(void))(*(void *)(a8 + 8LL * (int)(v11 | (16 * (STACK[0x488] == 0))))
                            - (((_DWORD)v11 - 1090) | 0x1A8u)
                            + 419LL))();
}

void sub_10002F960()
{
  LODWORD(STACK[0x40C]) = STACK[0x2E0];
  LODWORD(STACK[0x43C]) = STACK[0x2E8];
  STACK[0x348] = STACK[0x2C8];
  STACK[0x570] = STACK[0x2D0];
  STACK[0x398] = STACK[0x2D8];
  LODWORD(STACK[0x42C]) = v0;
  STACK[0x468] = v2 + ((v1 - 216) | 0x8Au) + 2294 + ((v1 - 216) | 0x8Au) + 985 - 3555;
  LODWORD(STACK[0x4C4]) = v0;
  LODWORD(STACK[0x2E8]) = STACK[0x43C];
  LODWORD(STACK[0x2E0]) = STACK[0x40C];
  JUMPOUT(0x10003B08CLL);
}

void sub_10002F9BC()
{
  LODWORD(STACK[0x330]) = 1170807497;
  JUMPOUT(0x10002F9DCLL);
}

void sub_10002FCA8()
{
  LODWORD(STACK[0x290]) = v0;
  JUMPOUT(0x10002FCB0LL);
}

uint64_t sub_10002FD14()
{
  LODWORD(STACK[0x18F8]) = v1;
  LODWORD(STACK[0x18FC]) = 1110857919;
  uint64_t v5 = *(_DWORD **)(v3 + 8LL * (v0 - 1116));
  STACK[0x260] = (unint64_t)v5;
  uint64_t v6 = *(unsigned int **)(v3 + 8LL * (v0 - 1038));
  LODWORD(STACK[0x4F4]) = *v5;
  STACK[0x288] = (unint64_t)v6;
  uint64_t v7 = *v6;
  unint64_t v8 = 535753261 * ((0xC7B6EE4BCF22DF88LL - (v2 | 0xC7B6EE4BCF22DF88LL) + STACK[0x248]) ^ 0xCDAB4CD93A292E58LL);
  *(void *)(v4 - 184) = -535753261LL
                        * ((0xC7B6EE4BCF22DF88LL - (v2 | 0xC7B6EE4BCF22DF88LL) + STACK[0x248]) ^ 0xCDAB4CD93A292E58LL);
  *(void *)(v4 - 168) = v7 ^ v8;
  *(_DWORD *)(v4 - 196) = -(int)v8;
  *(_DWORD *)(v4 - 192) = v8 + v0 + 2104631267;
  *(_DWORD *)(v4 - 160) = ((v0 + 1389292777) ^ 0x60) + v8;
  *(_DWORD *)(v4 - 156) = (v0 + 1389292777) ^ v8;
  *(_DWORD *)(v4 - 200) = (v0 + 1389292825) ^ v8;
  uint64_t v9 = ((uint64_t (*)(uint64_t))STACK[0x250])(v4 - 200);
  return ((uint64_t (*)(uint64_t))(*(void *)(STACK[0x300] + 8LL * *(int *)(v4 - 176)) - 12LL))(v9);
}

uint64_t sub_10002FE0C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  STACK[0x2F0] = v68(a68);
  unsigned int v72 = (*(uint64_t (**)(void))(v70 + 8LL * a67))();
  unint64_t v73 = STACK[0x300];
  *int32x4_t v69 = v72;
  v69[1] = 1812433253 * (v72 ^ (v72 >> 30)) + 1;
  return (*(uint64_t (**)(void))(v73 + 8LL * ((v71 - 606) | 0x38)))();
}

uint64_t sub_10002FE8C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v14 = STACK[0x290];
  int v15 = (_BYTE *)(v11 + (LODWORD(STACK[0x290]) - 1195770259));
  unsigned int v16 = 1639678635
      * ((*(_DWORD *)(*(void *)STACK[0x2D0]
                    + (*(unsigned int *)STACK[0x2C8] & (((v10 - 186) | 0x224LL) ^ 0x32CCA29C))) ^ v15) & 0x7FFFFFFF);
  unint64_t v17 = (v16 ^ HIWORD(v16)) * (((v10 + 761) | 0x20) + 1639677512);
  LOBYTE(v17) = *(_BYTE *)(*(void *)(v13 + 8LL * (v10 - 218)) + (v17 >> 24)) ^ ((v9 ^ v12) >> v8) ^ *(_BYTE *)(*(void *)(v13 + 8LL * (v10 - 101)) + (v17 >> 24) - 4) ^ *(_BYTE *)((v17 >> 24) + *(void *)(v13 + 8LL * (v10 ^ 0x199)) + 1) ^ v17 ^ (-123 * (((v16 ^ HIWORD(v16)) * (((v10 + 761) | 0x20) + 1639677512)) >> 24));
  _BYTE *v15 = v17;
}

uint64_t sub_100030A88( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t (*a51)(void))
{
  STACK[0x538] = v51;
  STACK[0x530] = STACK[0x2F0];
  return a51();
}

uint64_t sub_100030A9C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  STACK[0x258] = v68;
  uint64_t v70 = (v69 - 1407700205) & 0x53E7CACD;
  unint64_t v71 = STACK[0x490];
  STACK[0x588] = *(void *)(a8 + 8LL * (v69 - 1064));
  a68 = ((2LL * (void)&STACK[0x440]) & 0x67FBBF7F6ECB6EB0LL)
  a67 = (char *)&a9 - 0x3BD6CCCDCA60711LL;
  LODWORD(STACK[0x290]) = v69 ^ 0x57;
  LODWORD(STACK[0x220]) = v69 ^ 0x4A5;
  uint64_t v72 = a64;
  STACK[0x468] = a65 + 112;
  STACK[0x3E0] = v71;
  if (v71) {
    BOOL v73 = v72 == 0;
  }
  else {
    BOOL v73 = 1;
  }
  char v74 = v73;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __n128))(a8
                                                                      + 8LL
                                                                      * (int)((1837
                                                                             * (((((v69 + 19) & 0xCD)
                                                                                                 + 31) ^ v74) & 1)) ^ v70)))( a1,  3609197534LL,  1430LL,  (__n128)0LL);
}

uint64_t sub_100030BAC( __n128 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v13 = (v9 + 871);
  int v14 = (char *)&STACK[0x600] + v12 + v11 + v13 - 1451;
  *(_DWORD *)int v14 = 1026349512;
  *((void *)v14 + 1) = 0LL;
  *((_DWORD *)v14 + 4) = 1838278806;
  *((_DWORD *)v14 + 6) = 1782897115;
  *(_DWORD *)((char *)&STACK[0x600] + v12 + v11 + v13 - 1411) = 1782897115;
  *((void *)v14 + 4) = 0LL;
  STACK[0x320] = (unint64_t)&STACK[0x600] + v12 + v11 + v13 - 1411;
  *(unint64_t *)((char *)&STACK[0x600] + v12 + v11 + v13 - 1403) = 0LL;
  STACK[0x540] = (unint64_t)&STACK[0x600] + v12 + v11 + v13 - 1403;
  *(_DWORD *)((char *)&STACK[0x600] + v12 + v11 + v13 - 1395) = 1782897115;
  *(unint64_t *)((char *)&STACK[0x600] + v12 + v11 + v13 - 1387) = 0LL;
  STACK[0x410] = (unint64_t)&STACK[0x600] + v12 + v11 + v13 - 1395;
  STACK[0x590] = (unint64_t)&STACK[0x600] + v12 + v11 + v13 - 1387;
  *(_DWORD *)((char *)&STACK[0x600] + v12 + v11 + v13 - 1379) = 1782897115;
  STACK[0x3A8] = (unint64_t)&STACK[0x600] + v12 + v11 + v13 - 1379;
  *(unint64_t *)((char *)&STACK[0x600] + v12 + v11 + v13 - 1371) = 0LL;
  STACK[0x4A8] = (unint64_t)&STACK[0x600] + v12 + v11 + v13 - 1371;
  v14[88] = 116;
  *(_DWORD *)uint64_t v10 = 1026349512;
  *(__n128 *)(v10 + 4) = a1;
  *(_DWORD *)(v10 + 20) = 0;
  *(_DWORD *)(v10 + 24) = 1782897115;
  *(_DWORD *)(v10 + 28) = 218834563;
  STACK[0x288] = v10 + 28;
  *(__n128 *)(v10 + 436) = a1;
  *(__n128 *)(v10 + 452) = a1;
  *(void *)(v10 + 468) = 0LL;
  *(_DWORD *)(v10 + 232) = 218834563;
  STACK[0x260] = v10 + 232;
  strcpy((char *)(v10 + 1128), "jjjjjjjjjjjjjjjjjjjj");
  *(_BYTE *)(v10 + 1149) = 0;
  *(_WORD *)(v10 + 1150) = 0;
  *(__n128 *)(v10 + 1152) = a1;
  *(__n128 *)(v10 + 1168) = a1;
  *(__n128 *)(v10 + 1184) = a1;
  return ((uint64_t (*)(void))(*(void *)(a9 + 8LL * (int)v13) - 89 * (v13 ^ 0x5A0) + 971LL))();
}

void sub_100030CF4()
{
}

uint64_t sub_100030CFC@<X0>(uint64_t (*a1)(void)@<X8>)
{
  STACK[0x2B0] = v2;
  STACK[0x468] = v2 - 112;
  STACK[0x2F8] = *(void *)(v3 + 8LL * (v1 ^ 0x41A));
  return a1();
}

uint64_t sub_100030D24( __n128 a1, uint64_t a2, int a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(_DWORD *)(v10 + 1424) = 145591971;
  *(_DWORD *)(v10 + 1428) = 1310458963;
  *(void *)(v10 + 1432) = v11;
  *(void *)(v10 + 1440) = v11;
  *(_DWORD *)(v10 + 1448) = v12;
  *(__n128 *)(v10 + 1452) = a1;
  return ((uint64_t (*)(void))(*(void *)(a9 + 8LL * v9) - (v9 ^ a3 ^ a4 ^ v13)))();
}

void sub_100030D80()
{
}

uint64_t sub_100030D88( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61)
{
  STACK[0x210] = v66;
  *(void *)(v62 + 1516) = v63;
  *(void *)(v62 + 1524) = v63;
  *(_DWORD *)(v62 + 1532) = v65;
  *(void *)(v67 + 96) = v62;
  *(_DWORD *)(v62 + 476) = 1451802870;
  STACK[0x2E8] = STACK[0x3E0];
  STACK[0x2E0] = *(void *)(a8 + 8 * v61) - 8LL;
  unint64_t v69 = STACK[0x468];
  uint64_t v70 = (char *)&STACK[0x600] + v68 + STACK[0x468];
  STACK[0x2B0] = STACK[0x468];
  STACK[0x2A0] = (v61 + 904) + v69 - 563;
  STACK[0x2F0] = (unint64_t)v70;
  STACK[0x230] = (unint64_t)(v70 + 392);
  STACK[0x2C0] = v67;
  int v71 = (v61 + 653252224) & 0xD9102B6C;
  STACK[0x468] = STACK[0x2A0];
  LODWORD(STACK[0x49C]) = 1272700889;
  LODWORD(STACK[0x404]) = 1782897115;
  STACK[0x4E8] = 0LL;
  LODWORD(STACK[0x554]) = 408180512;
  *(_DWORD *)STACK[0x2F0] = a7;
  LODWORD(STACK[0x2D8]) = 1525428709;
  LODWORD(STACK[0x2F8]) = (v71 ^ 0x5DDA835D) + 37386513;
  LODWORD(STACK[0x2C8]) = 1113231362;
  uint64_t v72 = *(void *)(a8 + 8LL * (((v71 ^ 0x62B) + 144) ^ v71));
  LODWORD(STACK[0x2D0]) = -219623756;
  LODWORD(STACK[0x298]) = v64;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v72 - 8))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61);
}

uint64_t sub_100030F08( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8
                              + 8LL
                              * ((122
                                * (((v9 + 30) ^ (v8 == a6 + ((v9 - 1809095243) & 0x6BD49DBF) - 1298)) & 1)) ^ v9)))();
}

uint64_t sub_100030F6C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8
                              + 8LL
                              * ((37
                                * ((v9 & 0xFFFFFFFC) - LODWORD(STACK[0x298]) != ((v8 - 186978675) & 0xB250E7D ^ (v8 - 1842)))) ^ v8)))();
}

uint64_t sub_100030FB4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  BOOL v12 = v9 != a7 && LODWORD(STACK[0x554]) - v10 == -1374716603;
  return (*(uint64_t (**)(void))(a8 + 8LL * ((v12 * (v8 + 681)) ^ (v8 - 757))))();
}

uint64_t sub_100030FF0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 8LL * ((1979 * (v9 != ((v8 - 54) ^ (a7 + 91)))) ^ v8)))();
}

uint64_t sub_10003101C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8)
{
  BOOL v12 = (_DWORD *)STACK[0x2F0];
  _DWORD *v12 = v9 + v8 - 54 - 488;
  unint64_t v13 = &v12[6 * (v9 - 1687264479)];
  int v14 = v13[2];
  STACK[0x2E8] = *((void *)v13 + 2);
  LODWORD(STACK[0x554]) = v13[6];
  return (*(uint64_t (**)(void))(a8
                              + 8LL
}

uint64_t sub_1000310CC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v10 = LODWORD(STACK[0x554]) - 412058969;
  unsigned int v11 = v9 + ((v8 + 183) ^ 0x957FF5A4);
  int v12 = (v11 < 0xFFC4D1C7) ^ (v10 < 0xFFC4D1C7);
  BOOL v13 = v10 < v11;
  if (v12) {
    BOOL v13 = v11 < 0xFFC4D1C7;
  }
  return ((uint64_t (*)(void))(*(void *)(a8 + 8LL * ((41 * !v13) ^ v8)) - ((v8 + 605) ^ 0x3E2LL)))();
}

uint64_t sub_100031144@<X0>(int a1@<W4>, uint64_t a2@<X7>, int a3@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(a2
                                        + 8LL
                                        * ((1625
                                          * (*(_DWORD *)(v5 + (a1 + v3 + (v4 ^ 0x1A6) - 584) * (uint64_t)v6 + 36) != a3)) ^ v4))
}

uint64_t sub_1000311A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8)
{
  BOOL v13 = v8 == v11 && v10 != a6;
}

uint64_t sub_100031200( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(void))(*(void *)(a8
                                        + 8LL
                                        * ((803
}

uint64_t sub_100031248@<X0>(int a1@<W5>, uint64_t a2@<X7>, int a3@<W8>)
{
  int v6 = *(_DWORD *)(v4 + v3 * (uint64_t)v5 + 36);
  BOOL v8 = v6 - 500541738 > -535496181 && v6 - 500541738 < SLODWORD(STACK[0x2F8]);
  int v9 = !v8;
  if (v6 == a1) {
    int v9 = 1;
  }
  return (*(uint64_t (**)(void))(a2 + 8LL * ((479 * v9) ^ a3)))();
}

uint64_t sub_10003129C@<X0>(int a1@<W3>, uint64_t a2@<X7>, int a3@<W8>)
{
  if (v3) {
    int v5 = v4;
  }
  else {
    int v5 = a1 + 1;
  }
}

uint64_t sub_100031B64( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, uint64_t a8)
{
  BOOL v12 = *(_DWORD *)STACK[0x2F0] != ((v8 - 171) ^ (a7 + 101)) || v9 != a6;
  return ((uint64_t (*)(void))(*(void *)(a8 + 8LL * ((v12 * ((v8 ^ v10) + 144)) ^ v8)) - 8LL))();
}

uint64_t sub_100031BB4()
{
  STACK[0x468] = STACK[0x2B0];
  return ((uint64_t (*)(void))STACK[0x2E0])();
}

uint64_t sub_100031BC8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(void))(*(void *)(a8
}

void sub_100031BF8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = (unint64_t *)STACK[0x540];
  STACK[0x2C0] = STACK[0x288];
  STACK[0x2E8] = *v9;
  STACK[0x2E0] = *(void *)(a8 + 8LL * v8);
  JUMPOUT(0x100030E10LL);
}

uint64_t sub_100031C88( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  *(void *)(a64 + 1560) = *(void *)STACK[0x4A8];
  *(_DWORD *)(a64 + 1552) = *(_DWORD *)STACK[0x3A8];
  *(void *)(*(void *)(a69 + 96) + 488LL) = *(void *)(a69 + 8);
  *(_DWORD *)(*(void *)(a69 + 96) + 480LL) = *(_DWORD *)a69;
  *(_BYTE *)(a67 + a65 + STACK[0x210]) = ((a68 - 95) ^ 0xBA) * (a68 - 78);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a8 + 8LL * ((v69 - 1115) | 0xC0)) - 4LL))( 186LL,  3609197534LL,  1430LL);
}

void sub_100031D5C()
{
}

uint64_t sub_100031D64@<X0>(uint64_t a1@<X8>)
{
  STACK[0x440] = a1 + 104;
  int v4 = (uint64_t (*)(void))STACK[0x588];
  STACK[0x468] = v2 - 112;
  STACK[0x2F8] = *(void *)(v3 + 8LL * ((v1 + 543) ^ 0x41A));
  return v4();
}

uint64_t sub_100031D90( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a8 + 8LL * (((LODWORD(STACK[0x220]) + 532) * (v57 == v59)) ^ (v58 - 903))) - 4LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57);
}

uint64_t sub_100031DC0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = STACK[0x220];
  int v9 = (LODWORD(STACK[0x220]) + 827) | 0x62;
  unint64_t v10 = STACK[0x360];
  STACK[0x458] = STACK[0x360];
  STACK[0x508] = 0LL;
  LODWORD(STACK[0x31C]) = 1782897115;
  STACK[0x478] = 0LL;
  LODWORD(STACK[0x334]) = 1782897115;
  STACK[0x568] = 0LL;
  return ((uint64_t (*)(void))(*(void *)(a8 + 8LL * (((v10 == 0) * (v9 - 1097)) ^ v8))
}

uint64_t sub_100031E24@<X0>(uint64_t a1@<X7>, uint64_t a2@<X8>)
{
  return ((uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 8LL * ((((v2 + 112 + *(_BYTE *)(a2 + 32) - **(_BYTE **)(v3 + 8LL * (v2 ^ 0x453))) != 252) * (((v2 - 575) | 0xD1) - 294)) ^ (v2 - 384))) - 4LL))( 209LL,  0xECBFAF166CE7AB6FLL,  141LL,  223LL,  294LL,  1088LL,  38LL);
}

uint64_t sub_100031EB8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, int a7, uint64_t a8)
{
  return ((uint64_t (*)(void))(*(void *)(a8 + 8LL * (v8 ^ ((v9 == 82) * a7))) - ((v8 - 688) | a6) + 1119LL))();
}

void sub_100031EE0()
{
}

uint64_t sub_100031EEC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_100031F30( int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v11 = (*(unsigned __int8 *)(STACK[0x568] + 1516) ^ a1) - (*(_BYTE *)STACK[0x3D0] - 94);
}

uint64_t sub_100031F90@<X0>(int a1@<W2>, uint64_t a2@<X7>, uint64_t a3@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a2 + 8LL * (((a3 + 1 == (v3 ^ 0x78u) - 1103LL) * (v3 ^ a1)) ^ v3)) - 4LL))();
}

void sub_100031FBC()
{
}

uint64_t sub_100031FC4@<X0>(uint64_t a1@<X1>, int a2@<W2>, int a3@<W3>, uint64_t a4@<X7>, uint64_t a5@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a4
                                        + 8LL
                                        * ((((*(_BYTE *)(a5 + a1)
                                                             - *(_BYTE *)(*(void *)(v6
                                                                                    + 8LL
                                                                                    * (((v5 - 2068980750) & 0x7B52257B)
                                                                                     - 942))
                                                                        - 12LL)) != 41)
                                          * (((((v5 - 2068980750) & 0x7B52257B) - 1057) | a2) ^ a3)) ^ (((v5 - 2068980750) & 0x7B52257B) - 256)))
                            - 8LL))();
}

uint64_t sub_100032094( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(void))(*(void *)(a8 + 8LL * (int)(((((v9 == 82) ^ v8) & 1) * a5) ^ (v8 - 916)))
                            - v8
                            + 1115LL))();
}

void sub_1000320C4()
{
}

uint64_t sub_1000320D0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X7>, uint64_t a3@<X8>)
{
  BOOL v5 = (*(_BYTE *)(a3 + a1) - *(_BYTE *)(*(void *)(v4 + 8LL * (v3 ^ 0xAF)) - 12LL) - 106) != (((v3 ^ 0xAC) - 62) ^ 0x9A);
  return ((uint64_t (*)(uint64_t))(*(void *)(a2 + 8LL * ((v5 | (4 * v5)) ^ ((v3 ^ 0x4AC) + 53)))
                                          - (((v3 ^ 0x4AC) - 1118) | 0x420u)
                                          + 1057LL))(154LL);
}

uint64_t sub_100032194( uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(void))(*(void *)(a8
                                        + 8LL
}

void sub_1000321C8()
{
}

uint64_t sub_1000321D4()
{
  int v1 = v0 - 841;
  uint64_t v2 = ((v0 - 841) ^ 0x9Fu) + 1056;
  uint64_t v3 = 8 * ((v0 - 841) ^ 0x9Fu);
  uint64_t v4 = ((uint64_t (*)(uint64_t))STACK[0x258])(1576LL);
  STACK[0x568] = v4;
  return ((uint64_t (*)(void))(*(void *)(STACK[0x300] + 8LL * ((1986 * (v4 != 0)) ^ v1))
                            - (v3
                             + (v2 ^ 0xFFFFFFFFFFFFF98FLL))))();
}

uint64_t sub_100032290( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56)
{
  uint64_t v57 = ((uint64_t (*)(uint64_t))STACK[0x258])(1576LL);
  unint64_t v58 = STACK[0x300];
  STACK[0x3B0] = v57;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v58 + 8LL * ((57 * (v57 != 0)) ^ v56)) - ((v56 - 470) | 0x421u) - ((v56 - 1720309289) & 0x6689D755) + 1956LL))( v57,  v59,  v60,  v61,  v62,  v63,  v64,  v58,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56);
}

uint64_t sub_1000322FC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_100032350( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v74 = 535753261 * ((((v73 - 200) | 0xCB336D8B) - ((v73 - 200) & 0xCB336D8B)) ^ 0xC1C763A4);
  *(_DWORD *)(v73 - 196) = -1390735138 - v74;
  *(_DWORD *)(v73 - 192) = (v72 + 396) ^ v74;
  *(void *)(v73 - 176) = a57;
  *(void *)(v73 - 168) = 0x691B66AE440C6379LL;
  *(void *)(v73 - 184) = a56;
  uint64_t v75 = a72(v73 - 200);
  return (*(uint64_t (**)(uint64_t))(STACK[0x300]
                                            + 8LL
                                            * ((748 * (*(_DWORD *)(v73 - 200) == (((v72 - 494) | 0x32) ^ 0x2E527EED))) ^ v72)))(v75);
}

uint64_t sub_100032420@<X0>(uint64_t a1@<X7>, int a2@<W8>)
{
}

uint64_t sub_100032464@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v67 = a1 - 513;
  int v68 = 9 * ((a1 - 513) ^ 0x1FC);
  unsigned int v69 = (a1 + 1368302915) & 0xAE7156FF;
  unsigned int v70 = 535753261 * (((v65 | 0xC8F0DEF3) - v65 + (v65 & 0x370F2108)) ^ 0xC204D0DC);
  *(void *)(v66 - 176) = a50;
  *(void *)(v66 - 168) = 0x691B66AE440C6379LL;
  *(void *)(v66 - 184) = a49;
  *(_DWORD *)(v66 - 196) = -1390735140 - v70;
  *(_DWORD *)(v66 - 192) = (a1 - 117) ^ v70;
  uint64_t v71 = a65(v66 - 200);
  return (*(uint64_t (**)(uint64_t))(STACK[0x300]
                                            + 8LL
                                            * (int)(((*(_DWORD *)(v66 - 200) == (v68 ^ 0x2E527EED)) * (v69 + 685)) ^ v67)))(v71);
}

uint64_t sub_100032558( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 8LL * ((((v10 ^ 0x1C4) - 57) * (v9 == v8)) ^ v10)))();
}

uint64_t sub_1000325A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unsigned int v78 = ((2 * ((v72 ^ 0xF9551F6D) & 0x10143999) - (v72 ^ 0xF9551F6D) - 269760924) ^ 0x1C4AD726) * v75;
  *(_DWORD *)(v77 - 196) = -1390735138 - v78;
  *(_DWORD *)(v77 - 192) = (v74 + 396) ^ v78;
  *(void *)(v77 - 176) = a57;
  *(void *)(v77 - 168) = v76;
  *(void *)(v77 - 184) = a56;
  uint64_t v79 = a72(v77 - 200);
  return (*(uint64_t (**)(uint64_t))(STACK[0x300]
                                            + 8LL
                                            * ((748
                                              * (*(_DWORD *)(v77 - 200) == v73
                                                                         + v74
                                                                         - 444
                                                                         + ((v74 - 36232828) & 0x228DCBF)
                                                                         - 126)) ^ v74)))(v79);
}

uint64_t sub_100032668@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48)
{
  int v56 = (((v48 | 0x1EA818B6) - (v48 & 0x1EA818B6)) ^ 0x145C1699) * v52;
  *(void *)(v55 - 176) = a48;
  *(void *)(v55 - 168) = v53;
  *(void *)(v55 - 184) = a47;
  *(_DWORD *)(v55 - 196) = a1 - v56;
  *(_DWORD *)(v55 - 192) = (v50 + 840) ^ v56;
  uint64_t v57 = v54(v55 - 200);
  unint64_t v58 = STACK[0x300];
  int v59 = *(_DWORD *)(v55 - 200);
  STACK[0x3D0] = v49;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, __n128))(*(void *)(v58 + 8LL * (((v59 == v51) * (((v50 - 1056657600) & 0x3EFB54E3) + 415)) ^ v50)) - 12LL))( v57,  3609197534LL,  1430LL,  3517785355LL,  2182438090LL,  2112529205LL,  1687264478LL,  (__n128)0);
}

void sub_100032758()
{
}

uint64_t sub_100032794( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  STACK[0x3D0] = v8;
}

uint64_t sub_100033204()
{
  return ((uint64_t (*)(void))(*(void *)(STACK[0x300] + 8LL * ((1022 * (STACK[0x508] == 0)) ^ (v0 + 412))) - 12LL))();
}

uint64_t sub_10003323C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_100033264( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_10003328C()
{
  uint64_t v2 = ((uint64_t (*)(void))STACK[0x208])();
  return ((uint64_t (*)(uint64_t))(*(void *)(STACK[0x300]
                                                      + 8LL * ((1234 * (v0 == ((v1 - 903) ^ 0x2E527E0E))) ^ (v1 - 903)))
                                          - 4LL))(v2);
}

uint64_t sub_1000332CC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(void))(*(void *)(a8 + 8LL * ((1022 * (STACK[0x508] == 0)) ^ (v8 + 412))) - 12LL))();
}

uint64_t sub_1000332F8()
{
  return ((uint64_t (*)(void))(*(void *)(STACK[0x300] + 8LL * ((107 * (STACK[0x568] != 0)) ^ (v0 + 219))) - 12LL))();
}

uint64_t sub_10003332C()
{
  return ((uint64_t (*)(void))(*(void *)(STACK[0x300] + 8LL * ((27 * (STACK[0x3B0] == 0)) ^ (v0 - 962))) - 12LL))();
}

uint64_t sub_100033360( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(void))(*(void *)(a8 + 8LL * ((1234 * (v8 == ((v9 - 903) ^ 0x2E527E0E))) ^ (v9 - 903))) - 4LL))();
}

uint64_t sub_100033394( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46)
{
  LODWORD(STACK[0x4B4]) = 2100798125;
  LODWORD(STACK[0x550]) = 128;
  unint64_t v48 = STACK[0x360] + 0x621D43C813E50792LL;
  unint64_t v49 = STACK[0x340];
  unint64_t v50 = STACK[0x3C0];
  int v51 = (((2 * (v47 - 200)) | 0x7B43AD7C) - (v47 - 200) + 1113467202) ^ 0xB755D891;
  *(void *)(v47 - 184) = STACK[0x360] + 0x621D43C813E508A2LL;
  *(void *)(v47 - 176) = v48;
  *(_DWORD *)(v47 - 128) = 535753261 * v51 + v46 + 84;
  *(void *)(v47 - 200) = v50;
  *(void *)(v47 - 144) = v49;
  *(void *)(v47 - 136) = a46;
  *(_DWORD *)(v47 - 192) = 535753261 * v51 + 644358026;
  *(void *)(v47 - 152) = 0LL;
  *(void *)(v47 - 168) = 0LL;
  uint64_t v52 = ((uint64_t (*)(uint64_t))STACK[0x2F8])(v47 - 200);
  return ((uint64_t (*)(uint64_t))(*(void *)(STACK[0x300]
                                                      + 8LL
                                                      * ((852
                                                        * (*(_DWORD *)(v47 - 160) == (((v46 + 871) | 0x20) ^ 0x2E527AB1))) ^ v46))
                                          - (v46 ^ 0x2Du)
                                          + 237LL))(v52);
}

uint64_t sub_1000334AC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v10 = v8 - STACK[0x420] < ((v9 + 7) ^ 0xD8uLL);
  return ((uint64_t (*)(void))(*(void *)(a8 + 8LL * ((v10 | (8 * v10)) ^ v9)) - 8LL))();
}

uint64_t sub_1000334F0@<X0>(uint64_t a1@<X7>, uint64_t a2@<X8>)
{
  *(_BYTE *)(a2 + v3 - 2100956484) = *(_BYTE *)(v5 + v3 - 2100956484)
                                   - ((2 * *(_BYTE *)(v5 + v3 - 2100956484)) & 0xD4)
                                   + 106;
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
}

uint64_t sub_100033544@<X0>(uint64_t a1@<X7>, uint64_t a2@<X8>)
{
  uint64_t v5 = v3 + 127 - v2;
  int8x16_t v6 = vrev64q_s8(*(int8x16_t *)(v5 - 15));
  int8x16_t v7 = vextq_s8(v6, v6, 8uLL);
  int8x16_t v8 = vrev64q_s8(*(int8x16_t *)(v5 - 31));
  int8x16_t v9 = vextq_s8(v8, v8, 8uLL);
  uint64_t v10 = a2 + 127 - v2;
  v11.i64[0] = 0xD4D4D4D4D4D4D4D4LL;
  v11.i64[1] = 0xD4D4D4D4D4D4D4D4LL;
  v12.i64[0] = 0x6A6A6A6A6A6A6A6ALL;
  v12.i64[1] = 0x6A6A6A6A6A6A6A6ALL;
  int8x16_t v13 = vrev64q_s8(vaddq_s8(vsubq_s8(v7, vandq_s8(vaddq_s8(v7, v7), v11)), v12));
  *(int8x16_t *)(v10 - 15) = vextq_s8(v13, v13, 8uLL);
  int8x16_t v14 = vrev64q_s8(vaddq_s8(vsubq_s8(v9, vandq_s8(vaddq_s8(v9, v9), v11)), v12));
  *(int8x16_t *)(v10 - 31) = vextq_s8(v14, v14, 8uLL);
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * ((1287 * (v2 == 96)) ^ v4)) - (v4 ^ 0x2A7u) + 590LL))();
}

uint64_t sub_1000335DC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  LODWORD(STACK[0x42C]) = v9;
  return (*(uint64_t (**)(void))(a8
                              + 8LL
}

uint64_t sub_100033634@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50)
{
  uint64_t v57 = (*(uint64_t (**)(void, void, unint64_t))(v53 + 8LL * (v50 ^ 0x277)))( LODWORD(STACK[0x418]),  (v51 + a1 + v50 - 596),  STACK[0x570]);
  unint64_t v64 = STACK[0x300];
  int v65 = (v57 ^ 0xC5E93EE9) + 2145377248 + ((2 * v57) & 0x8BD27DD2);
  if (v65 == 1170807497)
  {
    int v67 = (char *)&STACK[0x600] + v52 + (v55 ^ 0xDBu ^ (unint64_t)(v54 - 648));
    STACK[0x3F8] = (unint64_t)v67;
    LODWORD(STACK[0x408]) = 679938573;
    STACK[0x468] = v52 - 192;
    STACK[0x528] = 0LL;
    uint64_t v68 = *(void *)(v64
                    + 8LL
                    * ((2020 * ((((v55 ^ 0x15) + 1) ^ (v67 == (char *)-248LL)) & 1)) ^ (v55 - 119)));
    LODWORD(STACK[0x584]) = 1782897115;
    STACK[0x2D8] = STACK[0x398];
    STACK[0x2E8] = (unint64_t)(v67 + 228);
    STACK[0x2F0] = (unint64_t)v67;
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v68 - 4))( v57,  v58,  v59,  v60,  v61,  v62,  v63,  v64,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,
             a43,
             a44,
             a45,
             a46,
             a47,
             a48,
             a49,
             a50);
  }

  else if (v65 == 1439242956)
  {
    LODWORD(STACK[0x42C]) = -777181718;
    return (*(uint64_t (**)(void))(v64
                                + 8LL
  }

  else
  {
    int v69 = 3804331 * ((((v56 - 200) | 0x81BE4809) - ((v56 - 200) & 0x81BE4809)) ^ 0xE1B53CF);
    *(void *)(v56 - 192) = a23;
    *(_DWORD *)(v56 - 200) = (v65 - ((2 * v65 + 1953352302) & 0x5CA4FDA4) - 393649143) ^ v69;
    *(_DWORD *)(v56 - 196) = v55 - v69 + 626;
    uint64_t v70 = sub_100019E28((_DWORD *)(v56 - 200));
    return (*(uint64_t (**)(uint64_t))(STACK[0x300]
                                              + 8LL
  }

uint64_t sub_100033D6C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t v66 = ((uint64_t (*)(uint64_t))STACK[0x208])(a64);
  unint64_t v67 = STACK[0x300];
  STACK[0x468] = STACK[0x2B0] - 1824;
  LODWORD(STACK[0x42C]) = v64;
  return (*(uint64_t (**)(uint64_t))(v67
                                            + 8LL
}

uint64_t sub_100033DEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X7>, int a5@<W8>)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4
                                                                                 + 8LL
                                                                                 * ((99
                                                                                   * (LODWORD(STACK[0x42C]) != ((a5 + 906) ^ (v5 - 1205) ^ (a5 + 109087536) & 0xF97F749E))) ^ a5))
                                                                     - 8LL))( a1,  a2,  a3,  3517785355LL);
}

uint64_t sub_100033EA0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, int a50,int a51,uint64_t a52,uint64_t a53,uint64_t a54)
{
  int v57 = v54 - 955;
  int v58 = v54;
  int v59 = 3804331 * ((-1740393391 - ((v56 - 200) | 0x9843B451) + ((v56 - 200) | 0x67BC4BAE)) ^ 0xE8195068);
  int v60 = v59 + LODWORD(STACK[0x318]) - 1022337101;
  *(void *)(v56 - 184) = a49;
  *(_DWORD *)(v56 - 172) = v60;
  *(_DWORD *)(v56 - 168) = v59 + a51 + 421112624;
  *(_DWORD *)(v56 - 176) = v59 + v57 + 392;
  *(void *)(v56 - 200) = a48;
  *(void *)(v56 - 192) = a54;
  uint64_t v61 = ((uint64_t (*)(uint64_t))(*(void *)(v55 + 8LL * (v57 ^ 0x53)) - 4LL))(v56 - 200);
  unint64_t v62 = STACK[0x300];
  int v63 = *(_DWORD *)(v56 - 164);
  LODWORD(STACK[0x4C4]) = v63;
  return ((uint64_t (*)(uint64_t))(*(void *)(v62
                                                      + 8LL
                                                      * ((458 * (v63 == v58 + 777158354 + (v57 ^ 0x4E9) - 2216)) ^ v57))
                                          - 8LL))(v61);
}

uint64_t sub_100033FA8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  STACK[0x548] = STACK[0x488];
  LODWORD(STACK[0x3A0]) = STACK[0x524];
  return ((uint64_t (*)(void))(*(void *)(a8
                                        + 8LL
                                        * ((109
                                          * (LODWORD(STACK[0x318]) - 1420467333 >= ((61 * (v8 ^ 0x442)) ^ 0x123 ^ (61 * (v8 ^ 0x442) + 1902148660) & 0x8E9F82AA))) ^ (61 * (v8 ^ 0x442))))
                            - 12LL))();
}

void sub_10003402C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  LODWORD(STACK[0x4C4]) = a4 + 50;
  STACK[0x2C8] = (unint64_t)&STACK[0x600] + v5 + v4 + 2048;
  STACK[0x2D0] = (unint64_t)&STACK[0x600] + v5 + v4 + 2176;
  STACK[0x2F8] = (unint64_t)&STACK[0x600] + v5 + v4;
  STACK[0x2D8] = (unint64_t)&STACK[0x600] + v5 + v4 + 2304;
  JUMPOUT(0x10002F010LL);
}

uint64_t sub_100034038@<X0>( uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52)
{
  unint64_t v55 = STACK[0x548];
  unsigned int v56 = (((v53 - 106) | 0x443) ^ 0x5C368CBE) + LODWORD(STACK[0x524]) - ((2 * LODWORD(STACK[0x524])) & 0xB86D11BA);
  int v57 = 1374699841 * ((v54 - 200) ^ 0x6DF41809);
  *(_DWORD *)(v54 - 200) = v53 - v57 - 2024873221;
  *(void *)(v54 - 192) = a51;
  *(void *)(v54 - 184) = a52;
  *(_DWORD *)(v54 - 160) = v56 ^ v57;
  *(_DWORD *)(v54 - 156) = v57 + v52 - ((2 * v52 + 380290808) & 0x1F5BF242) - 1157407587;
  *(void *)(v54 - 176) = v55;
  *(void *)(v54 - 168) = a1;
  uint64_t v58 = sub_100046190(v54 - 200);
  unint64_t v59 = STACK[0x300];
  int v60 = *(_DWORD *)(v54 - 152);
  LODWORD(STACK[0x4C4]) = v60;
  return ((uint64_t (*)(uint64_t))(*(void *)(v59 + 8LL * ((1764 * (v60 == 777158354)) ^ v53)) - 8LL))(v58);
}

uint64_t sub_10003412C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, int a43, int a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53)
{
  int v57 = STACK[0x3A0];
  int v58 = *(_DWORD *)(STACK[0x200] + 52) + 953433166;
  int v59 = 108757529 * ((v56 - 200) ^ 0xE09C622B);
  *(void *)(v56 - 200) = v53;
  *(_DWORD *)(v56 - 192) = (v57 ^ 0x6B7F3EB9) - v59 + ((2 * v57) & 0xD6FE7D72) - 16912904;
  *(_DWORD *)(v56 - 188) = v58 ^ v59;
  *(void *)(v56 - 168) = &STACK[0x1930];
  *(void *)(v56 - 160) = a53;
  *(_DWORD *)(v56 - 180) = (((2 * a44) & 0xF7FFF7DE ^ 0xE7D65590)
                          + 1065285568
                          + ((((v54 + 918) | 0x43) - 1944793916) ^ a44)) ^ v59;
  *(_DWORD *)(v56 - 176) = (v54 - 89) ^ v59;
  uint64_t v60 = (*(uint64_t (**)(uint64_t))(v55 + 8LL * (v54 + 59)))(v56 - 200);
  unint64_t v61 = STACK[0x300];
  int v62 = *(_DWORD *)(v56 - 184);
  LODWORD(STACK[0x4C4]) = v62;
  return ((uint64_t (*)(uint64_t))(*(void *)(v61 + 8LL * ((1572 * (v62 == 777158354)) | v54)) - 8LL))(v60);
}

uint64_t sub_100034254( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v10 = v8 - 1420467334 < ((v9 + 510601600) & 0xE190D67F) - 1125;
  return ((uint64_t (*)(void))(*(void *)(a8 + 8LL * (((4 * v10) | (8 * v10)) ^ (v9 - 545))) - 8LL))();
}

uint64_t sub_1000342A0@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t (*a24)(void, void, void, void, unint64_t *, uint64_t, uint64_t, unint64_t *), uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, int a36, int a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,unsigned int *a56,void (*a57)(void, uint64_t, uint64_t, uint64_t))
{
  uint64_t v67 = a24( *(unsigned int *)STACK[0x200],  ((a1 + 545) ^ (v57 + 933)) + v58,  a37 ^ 0x77EB2AC8u,  (*(_DWORD *)(STACK[0x200] + 52) - 44742497),  &STACK[0x1930],  v59,  v60,  &STACK[0x1900]);
  unint64_t v69 = STACK[0x300];
  int v70 = (v67 ^ 0x3FD39EF5) - 16780853 + ((2 * v67) & 0x7FA73DEA);
  if (v70 == 1322488003)
  {
    LODWORD(STACK[0x2E8]) = 1322488003;
    return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v69
                                                                 + 8LL
                                                                 * ((2019
                                                                   * (((((v65 + 95521691) & 0xFA4E76D3) - 2107234886) ^ (v65 - 757560457) & 0x2D2770AF)
                                                                    + LODWORD(STACK[0x2E0]) > 2)) ^ (v65 - 133)))
                                                     - 4LL))( v67,  v68);
  }

  else
  {
    if (v70 != 1054052544)
    {
      LODWORD(STACK[0x2E8]) = v70;
      int v71 = 3804331 * ((2 * ((v66 - 200) & 0x3D4A22D8) - (v66 - 200) + 1119214880) ^ 0xCD10C6E6);
      *(_DWORD *)(v66 - 200) = (v70 - 2 * ((v70 + 19689280) & 0x2E527EDE ^ v70 & 0xC) - 276894190) ^ v71;
      *(_DWORD *)(v66 - 196) = v65 - v71 + 626;
      *(void *)(v66 - 192) = a22;
      sub_100019E28((_DWORD *)(v66 - 200));
      STACK[0x2C8] = (unint64_t)&STACK[0x600] + v64 + v62 + 2048;
      STACK[0x2D0] = (unint64_t)&STACK[0x600] + v64 + v62 + 2176;
      STACK[0x2F8] = (unint64_t)&STACK[0x600] + v64 + v62;
      STACK[0x2D8] = (unint64_t)&STACK[0x600] + v64 + v62 + 2304;
      JUMPOUT(0x10002F010LL);
    }

    a57(*a56, v59, v60, 3517785355LL);
    STACK[0x548] = 0LL;
    LODWORD(STACK[0x3A0]) = 0;
    unint64_t v73 = STACK[0x310];
    int v74 = *(_DWORD *)(STACK[0x200] + 52) + 182853551;
    int v75 = 1224239923 * ((-1065362320 - ((v66 - 200) | 0xC07FDC70) + ((v66 - 200) | 0x3F80238F)) ^ 0xCD33DE58);
    int v76 = v75 + (v65 ^ 0x35EFEB9C ^ LODWORD(STACK[0x474])) + ((2 * LODWORD(STACK[0x474])) & 0x6BDFDFFE) - 562856248;
    *(_DWORD *)(v66 - 160) = v75 + v65 - 1038;
    *(_DWORD *)(v66 - 156) = v76;
    *(void *)(v66 - 200) = a46;
    *(_DWORD *)(v66 - 188) = (a37 & 0x7FFFFFFF ^ 0x5A57FD35) - v75 + (v61 & 0x5B79AFFA ^ 0x4B500590) + 1607728915;
    *(_DWORD *)(v66 - 184) = v74 ^ v75;
    *(void *)(v66 - 176) = v73;
    *(void *)(v66 - 168) = &STACK[0x1900];
    uint64_t v77 = ((uint64_t (*)(uint64_t))(*(void *)(v63 + 8LL * (v65 ^ 0x4FE)) - 12LL))(v66 - 200);
    int v78 = *(_DWORD *)(v66 - 192);
    LODWORD(STACK[0x4C4]) = v78;
    return ((uint64_t (*)(uint64_t))(*(void *)(STACK[0x300]
                                                        + 8LL * ((1619 * (v78 == 777158354)) ^ (v65 - 176)))
                                            - 4LL))(v77);
  }

uint64_t sub_100037778()
{
  BOOL v3 = ((v2 - 428) ^ 0xAB556718) + v1 >= (v2 ^ 0x60Du);
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * (((4 * v3) | (16 * v3)) ^ v2)) - 4LL))();
}

uint64_t sub_1000377B8(uint64_t a1)
{
  LODWORD(STACK[0x4C4]) = v3 + 50;
  unint64_t v4 = STACK[0x310];
  BOOL v5 = LODWORD(STACK[0x474]) != 0;
  STACK[0x448] = LODWORD(STACK[0x474]);
  return ((uint64_t (*)(uint64_t, unint64_t))(*(void *)(v2
                                                                        + 8LL
                                                                        * ((v5 * (((v1 - 176) ^ 0x6DD) - 103)) ^ (v1 - 260)))
                                                            - 8LL))( a1,  v4);
}

uint64_t sub_1000377FC@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  unint64_t v4 = ((unint64_t)&STACK[0x448] ^ 0x5FDDEB5E35BACBB5LL)
     - 0x3194150059047B5LL
     + ((2LL * (void)&STACK[0x448]) & 0xBFBBD6BC6B759760LL);
  unint64_t v5 = v2 - 1;
  STACK[0x448] = v5;
  *(_BYTE *)(a1 + v5) = (v4 ^ 0xBA) * (v4 + 17);
  return ((uint64_t (*)(void))(*(void *)(v3
}

void sub_10003788C()
{
}

uint64_t sub_100037894( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t (*a27)(uint64_t), uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59)
{
  unint64_t v62 = STACK[0x310];
  unsigned int v63 = LODWORD(STACK[0x474]) ^ 0xDFFDBD9F;
  unsigned int v64 = (2 * LODWORD(STACK[0x474])) & 0xBFFB7B3E;
  *(void *)(v61 - 136) = a45;
  int v65 = 1374699841 * ((((v61 - 200) | 0xA6087EC5) - ((v61 - 200) & 0xA6087EC5)) ^ 0xCBFC66CC);
  *(void *)(v61 - 184) = v62;
  *(void *)(v61 - 168) = a58;
  LOBYTE(STACK[0x1A10]) = 70 - 65 * ((((v61 + 56) | 0xC5) - ((v61 + 56) & 0xC5)) ^ 0xCC);
  *(void *)(v61 - 160) = a28;
  *(void *)(v61 - 152) = a59;
  *(_DWORD *)(v61 - 144) = v65 + v59 - 1167872147;
  *(_DWORD *)(v61 - 200) = (v60 ^ 0x3D) - v65 - 1171;
  *(_DWORD *)(v61 - 196) = v65 + v63 + v64 + 1925078643;
  uint64_t v66 = a27(v61 - 200);
  unint64_t v67 = STACK[0x300];
  int v68 = *(_DWORD *)(v61 - 192);
  LODWORD(STACK[0x4C4]) = v68;
  return ((uint64_t (*)(uint64_t))(*(void *)(v67
                                                      + 8LL
                                                      * ((14
}

uint64_t sub_1000379A8(uint64_t a1)
{
  unint64_t v3 = STACK[0x310];
  BOOL v4 = LODWORD(STACK[0x474]) != 0;
  STACK[0x448] = LODWORD(STACK[0x474]);
  return ((uint64_t (*)(uint64_t, unint64_t))(*(void *)(v1
                                                                        + 8LL
                                                                        * ((v4 * (((v2 - 176) ^ 0x6DD) - 103)) ^ (v2 - 260)))
                                                            - 8LL))( a1,  v3);
}

uint64_t sub_1000379EC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,unsigned int *a62,void (*a63)(void, uint64_t, void))
{
  int v67 = v63 ^ 0x7D0;
  a63(*a62, a2, 0LL);
  unint64_t v68 = (((v64 | 0x5D107D8CBBA72603LL) - (v64 | 0xA2EF82734458D9FCLL) - 0x5D107D8CBBA72604LL) ^ 0xA8F220E1B153282CLL)
      * v65;
  unint64_t v69 = LODWORD(STACK[0x4C4]) ^ v68;
  *(void *)(v66 - 184) = 3517785352u - v68;
  *(void *)(v66 - 168) = v69;
  *(_DWORD *)(v66 - 196) = -((((v64 | 0xBBA72603) - (v64 | 0x4458D9FC) + 1146673660) ^ 0xB153282C) * v65);
  *(_DWORD *)(v66 - 192) = (((v64 | 0xBBA72603) - (v64 | 0x4458D9FC) + 1146673660) ^ 0xB153282C) * v65
                         + v67
                         + 2104631267;
  *(_DWORD *)(v66 - 200) = (v67 + 1819275663) ^ ((((v64 | 0xBBA72603) - (v64 | 0x4458D9FC) + 1146673660) ^ 0xB153282C)
                                               * v65);
  *(_DWORD *)(v66 - 160) = (((v64 | 0xBBA72603) - (v64 | 0x4458D9FC) + 1146673660) ^ 0xB153282C) * v65
                         + v67
                         + 1819275507
                         + 40;
  *(_DWORD *)(v66 - 156) = (v67 + 1819275507) ^ ((((v64 | 0xBBA72603) - (v64 | 0x4458D9FC) + 1146673660) ^ 0xB153282C)
                                               * v65);
  uint64_t v70 = ((uint64_t (*)(uint64_t))STACK[0x250])(v66 - 200);
  return ((uint64_t (*)(uint64_t))(*(void *)(STACK[0x300] + 8LL * *(int *)(v66 - 176)) - 8LL))(v70);
}

uint64_t sub_100037AE8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = *(_DWORD *)(STACK[0x200] + 56);
  *(_DWORD *)(STACK[0x200] + 56) = v9 + 1;
  return ((uint64_t (*)(void))(*(void *)(a8
                                        + 8LL
                                        * ((548 * (((v8 + 1336866938) & 0xB05103AE ^ 0xCCE8BC12) + v9 < 0xFFFFFFFA)) ^ (v8 - 983)))
                            - 8LL))();
}

void sub_100037B44( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, void (*a44)(uint64_t))
{
  *(_DWORD *)(v46 - 200) = 1224239923
                         * ((-932950423 - ((v46 - 200) | 0xC8644E69) + ((v46 - 200) | 0x379BB196)) ^ 0xC5284C41)
                         + 426521894
                         + v44
                         + 983;
  sub_1000463B8((_DWORD *)(v46 - 200));
  LOBYTE(STACK[0x1A14]) = (-103 * ((v46 + 56) ^ 0x32)) ^ 0x1F;
  *(_DWORD *)(v46 - 176) = (v44 + 1441) ^ (1225351577 * ((v46 - 200) ^ 0x7EFF9A32));
  *(void *)(v46 - 184) = a25;
  *(void *)(v46 - 200) = v45;
  a44(v46 - 200);
  JUMPOUT(0x10002F80CLL);
}

uint64_t sub_100037C00( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, int a50,int a51)
{
  return ((uint64_t (*)(void))(*(void *)(v52
                                        + 8LL
                                        * ((1494
                                          * ((LODWORD(STACK[0x564]) ^ v51) != (((v53 ^ 0x7D0) - 230007488) ^ ((v53 ^ 0x7D0) + 176))
                                                                            + a51)) ^ v53 ^ 0x7D0))
                            - 4LL))();
}

void sub_100037C54()
{
  LODWORD(STACK[0x4C4]) = v0 - 127;
  JUMPOUT(0x100037A1CLL);
}

uint64_t sub_100037C60@<X0>(int a1@<W8>)
{
}

uint64_t sub_100037CA0@<X0>(char a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2 + 8LL * ((168 * ((a1 & 0x18) == (((v1 ^ 0x708) + 243) ^ 0x463))) ^ v1)))();
}

uint64_t sub_100037CD8@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  *(void *)(a1 - 7 + (v2 - 1246918993 - v3)) = *(void *)(v5 - 7 + (v2 - 1246918993 - v3));
  int v7 = ((v4 - 532) ^ 0x154) + v3 == (a2 & 0xFFFFFFF8);
  return ((uint64_t (*)(void))(*(void *)(v6 + 8LL * (((8 * v7) | (v7 << 7)) ^ v4)) - 8LL))();
}

uint64_t sub_100037D30()
{
  *(void *)(v4 + (v5 - v0)) = *(void *)(v1 + (v5 - v0));
  return ((uint64_t (*)(void))(*(void *)(v7 + 8LL * (((8 * (v6 + v0 == v3)) | ((v6 + v0 == v3) << 7)) ^ v2)) - 8LL))();
}

uint64_t sub_100037D60@<X0>(int a1@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * (((((v1 ^ 0x53F) - 991) ^ (v1 + 380)) * (a1 == v2)) ^ v1)) - 4LL))();
}

void sub_100037D98(unint64_t a1)
{
  STACK[0x528] = a1;
  LODWORD(STACK[0x584]) = v1;
  JUMPOUT(0x100037DACLL);
}

uint64_t sub_100037DB4@<X0>(int a1@<W8>)
{
  unint64_t v2 = STACK[0x4B8];
  unint64_t v3 = ((unint64_t)&STACK[0x558] ^ 0x7AFB5DF67F7CF97ALL)
     - 0x82041300448007ALL
     + (((void)&STACK[0x558] << (a1 + 108)) & 0xF5F6BBECFEF9F2F0LL);
  STACK[0x558] = 335LL;
  *(_BYTE *)(v2 + 335) = (v3 ^ 0xBA) * (v3 + 17);
  return (*(uint64_t (**)(void))(v1 + 8LL * ((13 * (STACK[0x558] == ((a1 - 458154935) & 0x1B4EE2F3) - 210LL)) ^ a1)))();
}

void sub_100037E70()
{
}

uint64_t sub_100037E78()
{
  uint64_t v2 = ((uint64_t (*)(void))STACK[0x208])();
  unint64_t v3 = STACK[0x300];
  LODWORD(STACK[0x5C0]) = v1;
  return ((uint64_t (*)(uint64_t))(*(void *)(v3
                                                      + 8LL
                                                      * ((1629 * (v1 == (((v0 ^ 0x4B1) + 777156174) ^ (v0 + 913)))) ^ v0))
                                          - 4LL))(v2);
}

uint64_t sub_100037EC8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unint64_t v70 = STACK[0x308];
  unint64_t v71 = STACK[0x2F0];
  int v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a8
                                                                                                 + 8LL * (v69 - 1110))
                                                                                     - 8LL);
  unint64_t v73 = STACK[0x2D8];
  STACK[0x298] = STACK[0x2D8] + 49;
  STACK[0x290] = v71 + 49;
  STACK[0x288] = v73 + 29;
  STACK[0x260] = v71 + 29;
  STACK[0x258] = v73 + 9;
  STACK[0x248] = v71 + 9;
  STACK[0x2E0] = (unint64_t)&a9 - 0x3BD6CCCDCA6018DLL;
  STACK[0x2C0] = ((unint64_t)&STACK[0x430] ^ 0x4CFD6F5DEF3EEF3ELL)
               - 0x4082B118210633ELL
               + ((2LL * (void)&STACK[0x430]) & 0x99FADEBBDE7DDE70LL);
  LODWORD(STACK[0x2D0]) = v70 - 738;
  STACK[0x230] = 47 * (v70 ^ 0x474);
  LODWORD(STACK[0x220]) = v70 + 1163991318;
  LODWORD(STACK[0x210]) = v70 - 170450404;
  a69 = 23 * (v70 ^ 0x44C);
  a68 = v70 + 1048947228;
  *(int32x4_t *)&STACK[0x2A0] = vdupq_n_s32(0x2E527ED2u);
  *(int32x4_t *)&STACK[0x2B0] = vdupq_n_s32(0x2E527EDBu);
  LODWORD(STACK[0x2C8]) = v70 ^ 0x46B;
  a67 = (int)v70;
  return v72(a1, a2, a3, a4, 3517785355LL, 1122LL);
}

uint64_t sub_100037EF0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 8LL * ((115 * (STACK[0x4D8] != 0)) ^ (v8 + 85))))();
}

uint64_t sub_100037F20(uint64_t a1)
{
  *(_BYTE *)(a1 + (v1 - 1246918993 + v2 - 395 - 728)) = *(_BYTE *)(v3
                                                                               + (v1
                                                                                              - 1246918993
                                                                                              + v2
                                                                                              - 395
                                                                                              - 728));
  return ((uint64_t (*)(void))(*(void *)(v4 + 8LL * ((154 * (v1 == 1246918993)) ^ (v2 - 24))) - 12LL))();
}

uint64_t sub_100037F74( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 8LL * (((((v9 - 944) | 0x4C) ^ 0xDE) * ((v8 & 1) == 0)) | (v9 - 847))))();
}

uint64_t sub_100037FA4@<X0>(uint64_t a1@<X7>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(a1 + 8LL * ((((v2 ^ v3) < (a2 ^ 0x2FEu)) * (((a2 - 222) | 0x442) ^ 0x156)) ^ a2)))();
}

uint64_t sub_100037FE8@<X0>(uint64_t a1@<X7>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(a1
                              + 8LL * (((((a2 ^ 6u) - 244) * v3 + 4LL != v2 - 1782897115) * ((a2 ^ 6) - 243)) ^ a2 ^ 6)))();
}

uint64_t sub_10003802C@<X0>(int a1@<W8>)
{
  int v7 = a1 + 6;
  int v8 = v7 ^ 0x49C;
  v1[31] = 0x7C581F3D3724E7E3LL;
  v1[32] = v1 + 33;
  v1[65] = 0x7C581F3D3724E7E3LL;
  v1[66] = v1 + 67;
  STACK[0x2A0] = (unint64_t)v1 + 0x621D43C813E5078ALL;
  v1[99] = 0x7C581F3D3724E7E3LL;
  v1[100] = v1 + 101;
  STACK[0x2B0] = (unint64_t)v1 + 0x621D43C813E5089ALL;
  v1[133] = 0x7C581F3D3724E7E3LL;
  v1[134] = v1 + 135;
  STACK[0x2C0] = (unint64_t)v1 + 0x621D43C813E509AALL;
  v1[167] = 0x7C581F3D3724E7E3LL;
  v1[168] = v1 + 169;
  STACK[0x2C8] = (unint64_t)v1 + 0x621D43C813E50ABALL;
  unint64_t v9 = STACK[0x528] + 4;
  LODWORD(STACK[0x2E0]) = 2 * v5;
  LODWORD(STACK[0x2F8]) = v7 + 645;
  int v10 = 1225351577 * ((v6 + 562447963 - 2 * ((v6 - 200) & 0x21864723)) ^ 0x5F79DD11);
  *(_DWORD *)(v6 - 180) = v7 + 645 - v10;
  *(void *)(v6 - 192) = v9;
  *(_DWORD *)(v6 - 200) = (((2 * v5) & 0xBFF8AFDE ^ 0x1CA0AD84) + (v5 ^ v7 ^ 0xF1AE29C2) + 2111307392) ^ v10;
  *(void *)(v6 - 176) = (char *)v1 + 0x621D43C813E5067ALL;
  int8x16_t v11 = (void (*)(uint64_t))(*(void *)(v4 + 8LL * (v7 & 0x3FC6FBC)) - 12LL);
  STACK[0x2D0] = (unint64_t)v11;
  v11(v6 - 200);
  uint64_t v12 = v9 + v3;
  STACK[0x298] = v9 + v3;
  LODWORD(v9) = STACK[0x2E0];
  int v13 = 1225351577 * ((((v6 - 200) | 0x155097C1) + (~(v6 - 200) | 0xEAAF683E)) ^ 0x6BAF0DF2);
  *(void *)(v6 - 176) = STACK[0x2A0];
  int v14 = STACK[0x2F8];
  *(_DWORD *)(v6 - 180) = LODWORD(STACK[0x2F8]) - v13;
  *(void *)(v6 - 192) = v12;
  *(_DWORD *)(v6 - 200) = ((v5 ^ 0x73A5213D) - 2296192 + (v9 & 0xBBEEBFDE ^ 0x18A4BD84)) ^ v13;
  ((void (*)(uint64_t))STACK[0x2D0])(v6 - 200);
  unint64_t v15 = STACK[0x298] + v3;
  STACK[0x2A0] = v15;
  int v16 = 1225351577 * ((896332480 - ((v6 - 200) | 0x356CF2C0) + ((v6 - 200) | 0xCA930D3F)) ^ 0xB46C970D);
  *(_DWORD *)(v6 - 200) = ((v5 ^ 0x51AF802D) - 573155472 + (v9 & 0xFFFBFDFE ^ 0x5CA0FDA4)) ^ v16;
  *(void *)(v6 - 192) = v15;
  *(_DWORD *)(v6 - 180) = v14 - v16;
  *(void *)(v6 - 176) = STACK[0x2B0];
  unint64_t v17 = (void (*)(uint64_t))STACK[0x2D0];
  ((void (*)(uint64_t))STACK[0x2D0])(v6 - 200);
  uint64_t v18 = STACK[0x2A0] + v3;
  unsigned int v19 = (v5 ^ 0xD18C802D) + 1576359792 + (STACK[0x2E0] & 0xFFBDFDFE ^ 0x5CA4FDA4);
  int v20 = 1225351577 * ((((v6 - 200) | 0xC99D9FFD) - (v6 - 200) + ((v6 - 200) & 0x36626000)) ^ 0xB76205CF);
  *(void *)(v6 - 176) = STACK[0x2C0];
  *(_DWORD *)(v6 - 200) = v19 ^ v20;
  *(_DWORD *)(v6 - 180) = LODWORD(STACK[0x2F8]) - v20;
  *(void *)(v6 - 192) = v18;
  v17(v6 - 200);
  unsigned int v21 = (v5 ^ 0xD3AD20BD) + 1607792640 + (STACK[0x2E0] & 0xFBFEBCDE ^ 0x58A4BC84);
  int v22 = 1225351577
      * ((-2 - (((v6 - 200) ^ 0x90B48304 | 0x67434C63) + ((v6 - 200) ^ 0x42030042 | 0x98BCB39C))) ^ 0x53B7E68B);
  *(_DWORD *)(v6 - 180) = LODWORD(STACK[0x2F8]) - v22;
  *(void *)(v6 - 176) = STACK[0x2C8];
  *(_DWORD *)(v6 - 200) = v21 ^ v22;
  *(void *)(v6 - 192) = v18 + v3;
  v17(v6 - 200);
  unint64_t v23 = STACK[0x300];
  unint64_t v24 = STACK[0x528];
  STACK[0x358] = (v2 - 1782897115);
}

uint64_t sub_1000384E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X7>, uint64_t a3@<X8>)
{
  uint64_t v4 = (v3 - 658) | 0x50u;
  unint64_t v5 = ((unint64_t)&STACK[0x358] ^ 0x55BFFFEDFE9B5FD3LL)
     - 0x4B02D49080B0050LL
     + ((v4 - 0x5480002402C940B4LL) & (2LL * (void)&STACK[0x358]));
  unint64_t v6 = a3 - 1;
  STACK[0x358] = v6;
  *(_BYTE *)(a1 + v6) = ((v5 + 125) ^ 0xBA) * (v5 - 114);
  return ((uint64_t (*)(void))(*(void *)(a2
                                        + 8LL
}

void sub_100038588()
{
}

uint64_t sub_100038590()
{
  return (*(uint64_t (**)(void))(STACK[0x300] + 8LL * ((115 * (STACK[0x4D8] != 0)) ^ (v0 + 85))))();
}

uint64_t sub_1000385D0()
{
  int v2 = v0;
  uint64_t v3 = ((uint64_t (*)(void))STACK[0x208])();
  unint64_t v4 = STACK[0x300];
  STACK[0x468] -= 16LL;
}

uint64_t sub_10003862C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v69 = 460628867 * ((~((v68 - 200) | 0x2AD1F1AF) + ((v68 - 200) & 0x2AD1F1AF)) ^ 0x99B88C2D);
  *(void *)(v68 - 192) = 0LL;
  *(void *)(v68 - 184) = v66;
  *(_DWORD *)(v68 - 160) = v67 - v69 + 672;
  *(void *)(v68 - 152) = a47;
  *(void *)(v68 - 144) = 0LL;
  *(void *)(v68 - 176) = a64;
  *(void *)(v68 - 168) = a65;
  *(_DWORD *)(v68 - 136) = v69 ^ 0x28870A0D;
  uint64_t v70 = ((uint64_t (*)(uint64_t))((char *)*(&off_10005BF10 + v67 - 1019) - 8))(v68 - 200);
  unint64_t v71 = STACK[0x300];
  int v72 = *(_DWORD *)(v68 - 200);
  LODWORD(STACK[0x5C4]) = v72;
  return ((uint64_t (*)(uint64_t))(*(void *)(v71 + 8LL * ((734 * (v72 == (((v67 - 86) | 0x43) ^ a66))) ^ v67))
                                          - (v67 ^ 0x15u)
                                          + 1115LL))(v70);
}

void sub_100038714()
{
}

void sub_100038884()
{
}

uint64_t sub_100038930( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  STACK[0x2F8] = v8;
  int v11 = LODWORD(STACK[0x2D0]) | 0x400;
  int v12 = STACK[0x384];
  *(_DWORD *)(STACK[0x5E8] + ((LODWORD(STACK[0x384]) + v9) & 0xFFFFFFFC)) = v10;
  int v13 = v12 + v11 - 1405;
  LODWORD(STACK[0x384]) = v13;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a8 + 8LL * ((((v13 + v9) < 0x40) * (v11 - 1399)) | v11))
                                                                                                - 4LL))( a1,  a2,  a3,  889516850LL,  a5,  106644893LL,  2162016054LL);
}

uint64_t sub_100039FE0@<X0>(uint64_t a1@<X7>, uint64_t a2@<X8>)
{
  int v9 = *(_DWORD *)(a2 + 4LL * (v7 + v4 - 8)) ^ *(_DWORD *)(a2 + 4LL * (v7 + v4 - 3));
  int v10 = *(_DWORD *)(a2 + 4LL * (v4 + ((v2 - 175) ^ (v7 + 1086)))) ^ *(_DWORD *)(a2
                                                                                            + 4LL
                                                                                            * (v7 + v4 - 14)) ^ (v9 + v8 - (v6 & (2 * v9)));
  HIDWORD(v11) = v10 ^ v8;
  LODWORD(v11) = v10;
  *(_DWORD *)(a2 + 4LL * (v3 + v7)) = (v11 >> 31) + v8 - (v6 & (2 * (v11 >> 31)));
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * ((((v3 + 1 + v7) > 0x4F) * v5) ^ v2)) - 4LL))();
}

uint64_t sub_10003A06C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 8LL * v8))();
}

void sub_10003A120()
{
}

uint64_t sub_10003A138( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8
                                           + 8LL * ((169 * ((v9 + 21 + v10) < 0x28)) ^ (5 * (v8 ^ 0xD2)))))((v9 + 40));
}

void sub_10003A204()
{
}

uint64_t sub_10003A21C( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(void))(*(void *)(a8 + 8LL * ((1197 * ((a1 + 1 + v9) < 0x3C)) ^ v8)) - 4LL))();
}

uint64_t sub_10003A2E8( uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(void))(*(void *)(a8
                                        + 8LL
}

void sub_10003A3A8(int a1)
{
  LODWORD(STACK[0x4E4]) = v1;
  LODWORD(STACK[0x464]) = v5;
  LODWORD(STACK[0x438]) = v2;
  LODWORD(STACK[0x3CC]) = v4;
  LODWORD(STACK[0x428]) = v3;
  unint64_t v9 = STACK[0x5D8];
  int v10 = *(_DWORD *)(STACK[0x5D8] - 0x5934B92A3842FA9CLL);
  LODWORD(STACK[0x384]) = v6 + 80;
  *(_DWORD *)(v9 - 0x5934B92A3842FA9CLL) = (v10 ^ v8)
                                         + (v3 ^ (v8 - 927) ^ (a1 + 770))
                                         + v8
                                         - (v7 & (2 * ((v10 ^ v8) + (v3 ^ (v8 - 927) ^ (a1 + 770)))));
  JUMPOUT(0x10003A410LL);
}

uint64_t sub_10003A4FC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9 = STACK[0x450];
  int v10 = *(unsigned __int8 *)(STACK[0x450] - 0x5934B92A3842FA94LL) ^ 0xE1;
  if (v10 == 2) {
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(*(void *)(a8 + 8LL * (((*(_DWORD *)(v9 - 0x5934B92A3842FA98LL) != 151311037) * (((v8 + 31) | 0x31) ^ 0x27D)) ^ (v8 - 358))) - 12LL))( a1,  2419779468LL,  1757648334LL,  2603489835LL,  a5,  642271986LL,  STACK[0x2E8]);
  }
  unint64_t v11 = STACK[0x2E8];
  if (v10 == 1) {
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(*(void *)(a8 + 8LL * (((*(_DWORD *)(v9 - 0x5934B92A3842FA98LL) == 151311037) * ((v8 - 779) ^ 0x10E)) ^ (v8 + 461))) - 8LL))( a1,  a2,  2636770069LL,  2603489835LL,  a5,  528974319LL,  v11);
  }
  unint64_t v13 = STACK[0x2C0];
  STACK[0x430] = 91LL;
  *(_BYTE *)(v9 - 0x5934B92A3842FA99LL) = (v13 ^ (v8 + 87)) * (v13 + 17);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(a8 + 8LL * ((442 * (STACK[0x430] == 0)) ^ (v8 + 94))))( a1,  a2,  2636770069LL,  2603489835LL,  17LL,  1122LL,  v11);
}

void sub_10003AE2C()
{
}

uint64_t sub_10003AE34()
{
  return ((uint64_t (*)(void))STACK[0x350])();
}

uint64_t sub_10003AE70( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_DWORD *)(STACK[0x200] + 52) = ((((LODWORD(STACK[0x5BC]) ^ v10) + (v8 ^ v10)) % 0x2710) ^ 0x3BAAFF7D)
                                 - 956319772
                                 + (((((LODWORD(STACK[0x5BC]) ^ v10) + (v8 ^ v10)) % 0x2710) << (v9 - 98)) & 0x7EFA);
  int v11 = STACK[0x5C4];
  STACK[0x468] -= 1616LL;
  LODWORD(STACK[0x42C]) = v11;
  return ((uint64_t (*)(void))(*(void *)(a8 + 8LL * ((1684 * (v11 == v10)) ^ (v9 - 267))) - 4LL))();
}

uint64_t sub_10003AF04@<X0>(uint64_t a1@<X7>, int a2@<W8>)
{
  _DWORD *v2 = STACK[0x418];
  v2[85] = STACK[0x4B4];
  v2[86] = STACK[0x4D4];
  v2[87] = STACK[0x394];
  v2[88] = STACK[0x514];
  return (*(uint64_t (**)(void))(a1
                              + 8LL
}

uint64_t sub_10003AF80( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  STACK[0x468] -= 1616LL;
  LODWORD(STACK[0x42C]) = a5 + 218;
  return (*(uint64_t (**)(void))(a8
                              + 8LL
}

uint64_t sub_10003AFF0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,unsigned int *a62,uint64_t (*a63)(void, uint64_t, void))
{
  int v64 = v63 - 685;
  uint64_t v65 = a63(*a62, a2, LODWORD(STACK[0x500]));
  return ((uint64_t (*)(uint64_t))(*(void *)(STACK[0x300]
                                                      + 8LL
                                                      * ((99
                                                        * (LODWORD(STACK[0x42C]) != ((v64 + 906) ^ 0x2E527A1D ^ (v64 + 109087536) & 0xF97F749E))) ^ v64))
                                          - 8LL))(v65);
}

uint64_t sub_10003B0C8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8
                              + 8LL
}

void sub_10003B118(uint64_t a1)
{
  int v1 = 460628867 * (a1 ^ 0x4C96827D);
  int v2 = *(_DWORD *)a1 + v1;
  unsigned int v3 = (*(_DWORD *)(a1 + 44) ^ v1 ^ 0x93EB5713) + ((2 * (*(_DWORD *)(a1 + 44) ^ v1)) & 0xEFF7FE7E ^ 0xC8215058);
  unsigned int v4 = 3804331 * ((2 * (v6 & 0x347AC888) - v6 - 880461965) ^ 0x44202CB5);
  int v5 = 1754511773 * (*(_DWORD *)(a1 + 24) ^ v1) + 173468773;
  v6[1] = *(void *)(a1 + 56);
  _DWORD v6[2] = &STACK[0x19B8B1B6E0B6AAAB];
  unsigned int v9 = (v5 ^ 0xB6CF5EF8) + v4 + ((2 * v5) & 0x6D9EBDF0) + 1879041960;
  int v7 = v2 + v4 + 14;
  unsigned int v8 = v3 + v4 - 1614873352;
  v6[0] = &STACK[0x1C1CCD5E0596F1C1];
  ((void (*)(void *))((char *)*(&off_10005BF10 + v2 - 299) - 4))(v6);
  __asm { BR              X9 }

uint64_t sub_10003B2D4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unsigned int a17, unsigned int a18, int a19)
{
  uint64_t v24 = *(void *)(v19 + 32);
  uint64_t v25 = *(void *)(v19 + 16);
  unsigned int v26 = 1374699841 * (&a12 ^ 0x6DF41809);
  a15 = a9;
  a16 = a9;
  a13 = v24;
  a14 = v25;
  a12 = v22 - v26 - 2024874726;
  a17 = (a11 - ((2 * a11) & 0xB86D11BA) + 1547077853) ^ v26;
  a18 = (v21 ^ 0xEBBD5309 ^ (v22 - 1159887927) & 0x452277CF) + v26;
  uint64_t v27 = sub_100046190((uint64_t)&a12);
  return ((uint64_t (*)(uint64_t))(*(void *)(v23 + 8LL * ((162 * (a19 == v20)) ^ v22)) - 12LL))(v27);
}

void sub_10003B398()
{
  uint64_t v3 = *(void *)(v0 + 48);
  *(void *)(*(void *)(v0 + 8) - 0x6A921752E4DC5BDLL) = v2;
  *(_DWORD *)(v3 - 0xAD445910E4CF20LL) = v4;
  *(_DWORD *)(v0 + 40) = v1;
}

void sub_10003B440(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 44) - 1224239923 * (((a1 | 0x1FD8AEE4) - a1 + (a1 & 0xE027511B)) ^ 0xED6B5333);
  __asm { BR              X16 }

uint64_t sub_10003B568()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL * (((((v0 - 1520314845) & 0x5A9E29F3) + 309) * (v1 != 0x319307E6)) ^ v0))
                            - 12LL))();
}

uint64_t sub_10003B5C0@<X0>(uint64_t a1@<X8>)
{
  BOOL v11 = v7 > 0x4956A557;
  *(_BYTE *)(a1 + (v9 - 666020259)) = *(_BYTE *)(v4 + ((v9 - 666020259) & 0xFLL)) ^ *(_BYTE *)(v1 + (v9 - 666020259)) ^ *(_BYTE *)(v2 + (((_BYTE)v9 + 93) & 0xF)) ^ *(_BYTE *)((((_BYTE)v9 + 93) & 0xF) + v3 + 1) ^ (((v9 + 93) & 0xF) * (v5 - 117));
  if (v11 == v9 - 1896435450 < v6) {
    BOOL v11 = v9 - 1896435450 < v8;
  }
  return ((uint64_t (*)(void))(*(void *)(v10 + 8LL * ((728 * v11) ^ v5)) - 12LL))();
}

uint64_t sub_10003B658()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((104
                                          * (((2 * v1) & 0x34EAFEF6 ^ 0x20220EC4) + (v1 ^ 0x2BE6789D) - 38797369 != ((((v0 - 1196531838) & 0x47519BEF) + 457) ^ 0x18257C2E))) ^ v0))
                            - 8LL))();
}

uint64_t sub_10003B6D4(int a1, int a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  return (*(uint64_t (**)(void))(v5
                              + 8LL
                              * ((1336 * (a2 + a1 + ((383 * (((a5 + 188) | 0x10) ^ 0x43B)) ^ 0xE58A84F8) > 7)) ^ a5)))();
}

uint64_t sub_10003B72C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v8
                                                               + 8LL
                                                               * (((a7 - 69 + (a7 ^ 0x72E) - 1708)
                                                                 * ((a8 + a3) > 0xFFFFFFEF)) ^ a7))
                                                   - 8LL))( a1,  a2);
}

uint64_t sub_10003B764@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v10 = (a3 + a2 + a1 + 16);
  uint64_t v11 = v10 + a5;
  uint64_t v12 = v10 & 0xF;
  unint64_t v13 = v12 + v8 - v11;
  unint64_t v14 = (v12 | v6) - v11;
  uint64_t v15 = (v12 | v7) - v11;
  BOOL v17 = (unint64_t)(v5 - a5) >= 0x10
     && v13 >= (unint64_t)(((a4 + 798516197) & 0xD0679CFF) + 590) - 1654
     && v14 >= 0x10;
  unint64_t v18 = v15 + 1;
  int v20 = !v17 || v18 < 0x10;
  return (*(uint64_t (**)(void))(v9 + 8LL * ((63 * v20) ^ a4)))();
}

uint64_t sub_10003B7E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return ((uint64_t (*)(uint64_t, uint64_t, void, void))(*(void *)(v8
                                                                               + 8LL
                                                                               * ((((a7 ^ 0x520) - 898) * (v7 < 0x10)) ^ a7))
                                                                   - 4LL))( a1,  a2,  0LL,  (a7 ^ 0x520u) - 495);
}

uint64_t sub_10003B818@<X0>( int a1@<W7>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51)
{
  v63.val[1].i64[0] = ((_BYTE)v56 + 11) & 0xF;
  v63.val[1].i64[1] = ((_BYTE)v56 + 10) & 0xF;
  v63.val[2].i64[0] = ((_BYTE)v56 + 9) & 0xF;
  v63.val[2].i64[1] = ((_BYTE)v56 + 8) & 0xF;
  v63.val[3].i64[0] = ((_BYTE)v56 + 7) & 0xF;
  v63.val[3].i64[1] = ((_BYTE)v56 + 6) & 0xF;
  v64.val[0].i64[0] = ((_BYTE)v56 + 5) & 0xF;
  v64.val[0].i64[1] = ((_BYTE)v56 + 4) & 0xF;
  v64.val[1].i64[0] = ((_BYTE)v56 + 3) & 0xF;
  v64.val[1].i64[1] = ((_BYTE)v56 + 2) & 0xF;
  v64.val[2].i64[0] = ((_BYTE)v56 + 1) & 0xF;
  v64.val[2].i64[1] = v56 & 0xF;
  v64.val[3].i64[0] = (v56 - 1) & 0xF;
  v64.val[3].i64[1] = ((_BYTE)v56 + 14) & 0xF;
  v58.i64[0] = 0x1717171717171717LL;
  v58.i64[1] = 0x1717171717171717LL;
  uint64_t v59 = (v56 + v55);
  v63.val[0].i64[0] = ((_BYTE)v56 + (_BYTE)v55) & 0xF;
  v63.val[0].i64[1] = ((a1 ^ 0xAA) + (_BYTE)v56) & 0xF;
  v60.i64[0] = vqtbl4q_s8(v63, (int8x16_t)xmmword_100047760).u64[0];
  v60.i64[1] = vqtbl4q_s8(v64, (int8x16_t)xmmword_100047760).u64[0];
  int8x16_t v61 = vrev64q_s8(vmulq_s8(v60, v58));
  *(int8x16_t *)(a2 - 15 + v59) = veorq_s8( veorq_s8( veorq_s8(*(int8x16_t *)(v54 + (v59 & 0xF) - 15), *(int8x16_t *)(v51 - 15 + v59)),  veorq_s8( *(int8x16_t *)(v52 + (v59 & 0xF) - 15),  *(int8x16_t *)((v59 & 0xF) + v53 - 14))),  vextq_s8(v61, v61, 8uLL));
  return ((uint64_t (*)(void))(*(void *)(a51
                                        + 8LL
                                        * ((45 * (((4 * (a1 ^ 0x2D)) ^ 0xFA0) - 380 != (v57 & 0xFFFFFFF0))) ^ a1 ^ 0x2D))
                            - 4LL))();
}

uint64_t sub_10003B980(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return ((uint64_t (*)(void))(*(void *)(v8
                                        + 8LL
                                        * (((((v7 == a3) ^ (a7 + 23)) & 1)
                                          * (((a7 + 648) | 0x69) - 1125)) ^ a7))
                            - 12LL))();
}

uint64_t sub_10003B9BC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v9 + 8LL * (int)(a8 ^ (477 * ((v8 >> 3) & 1))))
                                                   - ((((a8 - 888) | 0xB2u) + 633LL) ^ (a8 - 1876282558) & 0x6FD5CC78)))( a1,  a2);
}

uint64_t sub_10003BA10@<X0>( int a1@<W0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54)
{
  *(void *)(v62 - 128) = a5 - 7;
  *(void *)(v62 - 120) = v54 - 7;
  *(_DWORD *)(v62 - 144) = v61 & 0xFFFFFFF8;
  *(_DWORD *)(v62 - 140) = v61;
  *(_DWORD *)(v62 - 132) = 8 - (v61 & 0xFFFFFFF8);
  int v63 = -a3;
  int v64 = v60 + a2 + a1;
  *(_DWORD *)(v62 - 136) = v64 + 6;
  uint64_t v65 = v59 + v63 + ((a4 + 710) ^ (v58 + 1027));
  v67.val[0].i64[0] = ((_BYTE)v59 + (_BYTE)v63 + ((a4 - 58) ^ (v58 + 3))) & 0xF;
  v67.val[0].i64[1] = ((_BYTE)v64 + 12 + (_BYTE)v63) & 0xF;
  v67.val[1].i64[0] = ((_BYTE)v64 + 11 + (_BYTE)v63) & 0xF;
  v67.val[1].i64[1] = ((_BYTE)v64 + 10 + (_BYTE)v63) & 0xF;
  v67.val[2].i64[0] = ((_BYTE)v64 + 9 + (_BYTE)v63) & 0xF;
  v67.val[2].i64[1] = ((_BYTE)v64 + 8 + (_BYTE)v63) & 0xF;
  v67.val[3].i64[0] = ((_BYTE)v64 + 7 + (_BYTE)v63) & 0xF;
  v67.val[3].i64[1] = (*(_DWORD *)(v62 - 136) + (_BYTE)v63) & 0xF;
  *(int8x8_t *)(*(void *)(v62 - 128) + v65) = veor_s8( veor_s8( veor_s8( *(int8x8_t *)(v57 + (v65 & 0xF) - 7),  *(int8x8_t *)(*(void *)(v62 - 120) + v65)),  veor_s8( *(int8x8_t *)(v55 + (v65 & 0xF) - 7),  *(int8x8_t *)((v65 & 0xF) + v56 - 6))),  vrev64_s8( vmul_s8( (int8x8_t)*(_OWORD *)&vqtbl4q_s8( v67,  (int8x16_t)xmmword_100047770),  (int8x8_t)0x1717171717171717LL)));
  return ((uint64_t (*)(__n128))(*(void *)(a54 + 8LL * ((1523 * (*(_DWORD *)(v62 - 132) == v63)) ^ a4)) - 4LL))((__n128)xmmword_100047770);
}

void sub_10003BB58()
{
}

uint64_t sub_10003BB60()
{
}

uint64_t sub_10003BB98@<X0>(int a1@<W4>, int a2@<W5>, uint64_t a3@<X8>)
{
  uint64_t v10 = (a1 + v8);
  *(_BYTE *)(a3 + v10) = *(_BYTE *)(v6 + (v10 & 0xF)) ^ *(_BYTE *)(v3 + v10) ^ *(_BYTE *)(v4 + (v10 & 0xF)) ^ *(_BYTE *)((v10 & 0xF) + v5 + 1) ^ (23 * (v10 & 0xF));
  return ((uint64_t (*)(void))(*(void *)(v9 + 8LL * ((a2 + 456) ^ (8 * (a1 - 1 != ((a2 - 661) ^ (v7 + 691)))))) - 4LL))();
}

uint64_t sub_10003BBFC@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49)
{
  uint64_t v52 = *(void *)(v49 + 24);
  *(int8x16_t *)(v51 - 112) = veorq_s8(*(int8x16_t *)*(void *)(v49 + 16), (int8x16_t)xmmword_1000477B0);
  if (a9) {
    BOOL v53 = v52 == 0x2ED20AF3326140A0LL;
  }
  else {
    BOOL v53 = 1;
  }
  int v54 = !v53;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v50 + 8LL * (int)((1174 * v54) ^ a4)) - 12LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49);
}

uint64_t sub_10003BC58( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48)
{
  int v49 = a27 - ((2 * a27 + 2046641284) & 0xC35F67DE) - 1632741839;
  int v50 = ((a4 - 547631781) & (2 * v49) ^ 0xC35B46DE) + (v49 ^ 0x8E025490);
  int v52 = (((((_DWORD)a4 - 243) | 2) - 163) & (v50 + 1)) == (((_DWORD)a4 - 2102849972) & 0x7D56F59F ^ 0x58F)
     && v50 != 1873667967;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v48 + 8LL * (int)(((16 * v52) | (v52 << 6)) ^ a4)) - 12LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48);
}

uint64_t sub_10003BD18@<X0>( uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50)
{
  uint64_t v55 = (char *)*(&off_10005BF10 + (v53 ^ 0x8E)) - 8;
  int v56 = (v55[*(unsigned __int8 *)(v50 - 0x2ED20AF33261409ELL) ^ 0xD7LL] ^ 0x65) << 8;
  uint64_t v57 = (char *)*(&off_10005BF10 + v53 - 154) - 12;
  int v58 = v57[(*v51 ^ (v53 - 1))] ^ 0x3A;
  uint64_t v59 = *(unsigned __int8 *)(v50 - 0x2ED20AF332614093LL);
  *(_DWORD *)(v54 - 240) = v52;
  int v60 = (char *)*(&off_10005BF10 + (v53 ^ 0xA)) - 4;
  HIDWORD(v61) = v60[v59 ^ 0x49];
  LODWORD(v61) = (HIDWORD(v61) ^ 0xFFFFFFC7) << 24;
  LOBYTE(v59) = v61 >> 26;
  int v62 = v56 | (v58 << 24);
  int v63 = (char *)*(&off_10005BF10 + v53 - 94) - 4;
  int v64 = v57[*(unsigned __int8 *)(v50 - 0x2ED20AF332614094LL) ^ 0xB8LL];
  HIDWORD(v61) = v60[*(unsigned __int8 *)(v50 - 0x2ED20AF332614097LL) ^ 0x6BLL];
  LODWORD(v61) = (HIDWORD(v61) ^ 0xFFFFFFC7) << 24;
  int v65 = ((v61 >> 26) ^ 0x53) << 16;
  LOBYTE(v58) = v55[*(unsigned __int8 *)(v50 - 0x2ED20AF332614092LL) ^ 0x2ELL];
  HIDWORD(v61) = v60[*(unsigned __int8 *)(v50 - 0x2ED20AF33261409FLL) ^ 0x47LL];
  LODWORD(v61) = (HIDWORD(v61) ^ 0xFFFFFFC7) << 24;
  unsigned int v66 = v62 & 0xFF00FF00 | ((v63[*(unsigned __int8 *)(v50 - 0x2ED20AF33261409DLL) ^ 0xECLL] ^ 9) + 64) | (((v61 >> 26) ^ 0x1E) << 16);
  int v67 = v65 | ((v55[*(unsigned __int8 *)(v50 - 0x2ED20AF332614096LL) ^ 0x77LL] ^ 0xAA) << 8);
  LOBYTE(v65) = v63[*(unsigned __int8 *)(v50 - 0x2ED20AF332614091LL) ^ 0x36LL] + 64;
  HIDWORD(v61) = v60[*(unsigned __int8 *)(v50 - 0x2ED20AF33261409BLL) ^ 0xCBLL];
  LODWORD(v61) = (HIDWORD(v61) ^ 0xFFFFFFC7) << 24;
  int v68 = v65 ^ 0x2A | ((v58 ^ 0xA0) << 8) | ((v59 ^ 0xFB) << 16) | ((v64 ^ 0x82) << 24);
  LODWORD(v55) = ((v63[*(unsigned __int8 *)(v50 - 0x2ED20AF332614099LL) ^ 0xA9LL] + 64) | ((v55[*(unsigned __int8 *)(v50 - 0x2ED20AF33261409ALL) ^ 0x30LL] ^ 0x50) << 8)) & 0xFF00FFFF | (((v61 >> 26) ^ 0xBA) << 16);
  LOBYTE(v63) = v63[*(unsigned __int8 *)(v50 - 0x2ED20AF332614095LL) ^ 0xB5LL];
  unsigned int v69 = v55 | ((v57[*(unsigned __int8 *)(v50 - 0x2ED20AF33261409CLL) ^ 0x35LL] ^ 0xF5) << 24);
  int v70 = v67 | ((v57[*(unsigned __int8 *)(v50 - 0x2ED20AF332614098LL) ^ 0xBFLL] ^ 0xEC) << 24);
  unint64_t v71 = (char *)*(&off_10005BF10 + v53 - 160) - 4;
  int v72 = (char *)*(&off_10005BF10 + (v53 ^ 0x60)) - 4;
  LODWORD(v57) = *(_DWORD *)&v71[4 * (v65 ^ 0xFD)] ^ 0xEF9D1DF4 ^ *(_DWORD *)&v72[4
                                                                                                 * (v59 ^ 0x61)];
  *(_DWORD *)(v54 - 148) = v53;
  uint64_t v73 = (uint64_t)*(&off_10005BF10 + (v53 ^ 0xBE));
  LODWORD(v57) = ((_DWORD)v57 - ((2 * (_DWORD)v57) & 0x2BC8C8B0) - 1780194216) ^ *(_DWORD *)(v73
                                                                                           + 4LL
                                                                                           * (v64 ^ 0x17u));
  unsigned int v74 = (_DWORD)v57 - ((2 * (_DWORD)v57) & 0x95BE0D72);
  int v75 = (char *)*(&off_10005BF10 + v53 - 44) - 12;
  unsigned int v571 = v66;
  LODWORD(v59) = *(_DWORD *)&v75[4 * (v58 ^ 0x98)] ^ v66 ^ (v74 + 1256130233);
  HIDWORD(v570) = v68;
  unsigned int v76 = v68 - ((2 * v68) & 0x8F8714F4) - 943486342;
  LOBYTE(v68) = ((_BYTE)v63 + 64) ^ 0xA8;
  unsigned int v77 = v70 & 0xFFFFFF00 | v68;
  LODWORD(v570) = v69;
  int v78 = v59 ^ v69;
  int v79 = v59;
  int v449 = v59;
  LODWORD(v59) = v59 ^ v69 ^ 0x4D;
  *(_DWORD *)(v54 - 128) = v59 ^ v77;
  unsigned __int8 v447 = v59;
  LODWORD(v63) = v59 ^ v77 ^ v76;
  int v494 = BYTE1(v63);
  int v481 = BYTE2(v63);
  int v80 = v72;
  int v81 = *(_DWORD *)&v75[4 * (BYTE1(v63) ^ 0x70)] ^ *(_DWORD *)&v72[4 * (BYTE2(v63) ^ 0x7D)] ^ 0x48B496B9;
  int v489 = (v59 ^ v77 ^ v76);
  unsigned int v82 = (v81 - ((2 * v81) & 0xDBED1BE8) - 302608908) ^ *(_DWORD *)&v71[4 * (v489 ^ 0x53)];
  unsigned int v483 = (v63 ^ 0x7D34A7D3) >> 24;
  int v83 = v79 ^ *(_DWORD *)(v73 + 4LL * (v483 ^ 0x65)) ^ (v82 - ((2 * v82) & 0x2BC8C8B0) - 1780194216);
  *(_DWORD *)(v54 - 184) = v78;
  HIDWORD(v569) = v77;
  *(_DWORD *)(v54 - 168) = v83;
  int v84 = v83 ^ 0x6D6051AC ^ (v77 - 2 * (v77 & 0x6D6051BF ^ v68 & 0x13) + 1835028908);
  unsigned int v85 = v84 ^ v63 ^ 0x7D34A7D3;
  int v86 = v84;
  *(_DWORD *)(v54 - 192) = v84;
  int v505 = BYTE2(v85);
  int v509 = BYTE1(v85);
  int v87 = *(_DWORD *)&v72[4 * (BYTE2(v85) ^ 0x2E)] ^ *(_DWORD *)&v75[4 * (BYTE1(v85) ^ 0x9B)] ^ 0x48B496B9;
  int v563 = v85;
  unsigned int v88 = (v87 - ((2 * v87) & 0xDBED1BE8) - 302608908) ^ *(_DWORD *)&v71[4 * (v85 ^ 0xD2)];
  *(_DWORD *)(v54 - 248) = HIBYTE(v85);
  int v89 = (v88 - ((2 * v88) & 0x2BC8C8B0) - 1780194216) ^ *(_DWORD *)(v73 + 4LL * (HIBYTE(v85) ^ 0x69));
  LODWORD(v59) = v89 ^ v59;
  *(_DWORD *)(v54 - 144) = v59;
  int v90 = v59 ^ 0x9C71AE53 ^ v86;
  int v531 = v90;
  unsigned int v91 = ((v90 ^ 0x6F7A3B9) - ((2 * (v90 ^ 0x6F7A3B9)) & 0x87632E4C) + 1135712038) ^ v85 ^ 0x3716366F ^ 0x9547167F;
  int v538 = BYTE2(v91);
  int v572 = ((unsigned __int16)(((v59 ^ 0xAE53 ^ v86 ^ 0xA3B9)
                                             - ((2 * (v59 ^ 0xAE53 ^ v86 ^ 0xA3B9)) & 0x2E4C)
                                             - 26842) ^ v85 ^ 0x366F ^ 0x167F) >> 8);
  int v92 = *(_DWORD *)&v72[4 * (BYTE2(v91) ^ 0x89)] ^ *(_DWORD *)&v75[4 * (v572 ^ 0x3A)] ^ 0x48B496B9;
  int v547 = (((v59 ^ 0x53 ^ v86 ^ 0xB9) - ((2 * (v59 ^ 0x53 ^ v86 ^ 0xB9)) & 0x4C) + 38) ^ v85 ^ 0x6F);
  unsigned int v93 = (v92 - ((2 * v92) & 0xDBED1BE8) - 302608908) ^ *(_DWORD *)&v71[4 * (v547 ^ 0xE4)];
  v91 >>= 24;
  *(_DWORD *)(v54 - 256) = v91;
  int v94 = (v93 - ((2 * v93) & 0x2BC8C8B0) - 1780194216) ^ *(_DWORD *)(v73 + 4LL * (v91 ^ 0x1D));
  unsigned int v515 = v89 ^ v83;
  unsigned int v583 = (v94 - ((2 * v94) & 0xD228BFB8) + 1762942940) ^ v89 ^ v83;
  unsigned int v95 = v583 ^ 0x69145FDC ^ v59;
  unsigned int v575 = v95;
  unsigned int v96 = ((v95 ^ 0xFE25CD6D) - ((2 * (v95 ^ 0xFE25CD6D)) & 0x87632E4C) + 1135712038) ^ v85 ^ 0x3716366F;
  int v590 = ((unsigned __int16)(((v95 ^ 0xCD6D) - ((2 * (v95 ^ 0xCD6D)) & 0x2E4C) - 26842) ^ v85 ^ 0x366F) >> 8);
  int v588 = BYTE2(v96);
  LODWORD(v72) = (v78 ^ 0xBAF72DE4) - 2 * ((v78 ^ 0xBAF72DE4) & 0x6D6051BC ^ v78 & 0x10);
  int v97 = *(_DWORD *)&v75[4 * (v590 ^ 0x6F)] ^ *(_DWORD *)&v80[4 * (BYTE2(v96) ^ 0xA8)] ^ 0x48B496B9;
  unsigned int v557 = HIBYTE(v96);
  int v98 = (v97 - ((2 * v97) & 0x2BC8C8B0) - 1780194216) ^ *(_DWORD *)(v73 + 4LL * (HIBYTE(v96) ^ 0x85));
  int v559 = (((v95 ^ 0x6D) - ((2 * (v95 ^ 0x6D)) & 0x4C) + 38) ^ v85 ^ 0x6F);
  unsigned int v99 = (v98 - ((2 * v98) & 0xDBED1BE8) - 302608908) ^ *(_DWORD *)&v71[4 * (v559 ^ 0x25)];
  int v100 = (v99 - ((2 * v99) & 0x4D0D07F4) + 646349818) ^ v59 ^ 0x9C71AE53;
  unsigned int v566 = v95 ^ v90;
  int v101 = v100 ^ v95 ^ v90;
  *(_DWORD *)(v54 - 200) = v100;
  __int16 v451 = v101 ^ 0x1286;
  int v102 = v101;
  *(_DWORD *)(v54 - 136) = v101;
  int v103 = v96 ^ v101 ^ 0x4F7F1286;
  unsigned int v577 = v96;
  unsigned int v469 = (v103 ^ 0x5EFC063Cu) >> 24;
  int v456 = (((v103 ^ 0x5EFC063Cu) >> 16) - (((v103 ^ 0x5EFC063Cu) >> 15) & 0x86) - 61);
  int v104 = *(_DWORD *)&v80[4 * (v456 ^ 0x4A)] ^ *(_DWORD *)(v73 + 4LL * (v469 ^ 0x1D));
  int v580 = ((unsigned __int16)(v103 ^ 0x63C) >> 8);
  unsigned int v105 = ((v104 ^ 0x978FF458) - 2 * ((v104 ^ 0x978FF458) & 0x4ADF06BB ^ v104 & 2) + 1256130233) ^ *(_DWORD *)&v75[4 * (v580 ^ 0x3A)];
  *(_DWORD *)(v54 - 216) = v583 ^ 0x69145FDC ^ v99;
  int v554 = v103;
  unsigned int v106 = v583 ^ 0x69145FDC ^ v99 ^ *(_DWORD *)&v71[4 * (v103 ^ 0xA7)] ^ (v105
                                                                                        - ((2 * v105) & 0xDBED1BE8)
                                                                                        - 302608908);
  int v460 = v100 ^ 0x7C166C11;
  int v552 = v106 ^ v460;
  unsigned int v107 = v106;
  unsigned int v533 = v106;
  unsigned int v108 = v106 ^ v460 ^ 0xBD0D95AF;
  unsigned int v586 = (v108 ^ v96) >> 24;
  int v109 = *(_DWORD *)(v73 + 4LL * (v586 ^ 0x26));
  int v110 = (_DWORD)v72 + 1835028908;
  int v544 = (v108 ^ v96);
  LODWORD(v72) = *(_DWORD *)&v71[4 * (v544 ^ 0x9E)];
  *(_DWORD *)(v54 - 208) = v83 ^ 0x6D6051AC ^ v110;
  int v522 = ((unsigned __int16)(v108 ^ v96) >> 8);
  unsigned int v111 = ((v109 ^ v72 ^ 0x7812E9AC)
  int v528 = ((v108 ^ v96) >> 16);
  unsigned int v511 = v108 ^ v96;
  int v112 = (v111 - ((2 * v111) & 0x4D72000) + 40603648) ^ *(_DWORD *)&v80[4 * (v528 ^ 7)];
  unsigned int v113 = (v112 - ((2 * v112) & 0xF8354BC0) - 65362464) ^ v107;
  *(_DWORD *)(v54 - 140) = v113;
  *(_DWORD *)(v54 - 160) = v108 ^ v102 ^ 0x824381EA;
  int v114 = v113 ^ 0x694AA39 ^ v108;
  int v471 = v114;
  unsigned int v115 = v113 ^ 0x694AA39 ^ v102 ^ 0x824381EA;
  *(_DWORD *)(v54 - 176) = v115;
  unsigned int v116 = v108 ^ v96 ^ 0xCAD12E99;
  LOBYTE(v68) = v115 ^ 0xB3;
  LODWORD(v72) = v115 ^ 0x7F7724B3 ^ v116;
  int v561 = BYTE1(v72);
  int v475 = v115 ^ 0xB3 ^ v116;
  unsigned int v117 = *(_DWORD *)&v75[4 * (BYTE1(v72) ^ 0x29)] ^ *(_DWORD *)&v71[4 * (v475 ^ 0xE8)] ^ 0xA7298B4D;
  int v486 = BYTE2(v72);
  int v118 = v80;
  int v119 = (v117 - ((2 * v117) & 0x4D72000) + 40603648) ^ *(_DWORD *)&v80[4 * (BYTE2(v72) ^ 0x2B)];
  *(_DWORD *)(v54 - 232) = v113 ^ 0x1993F4A;
  unsigned int v492 = v72 >> 24;
  int v120 = (v119 - ((2 * v119) & 0x2BC8C8B0) - 1780194216) ^ *(_DWORD *)(v73 + 4LL * ((v72 >> 24) ^ 0x59)) ^ v113 ^ 0x1993F4A;
  int v121 = v114 ^ v120;
  LODWORD(v80) = v114 ^ v120 ^ 0x763F9A1E;
  LODWORD(v55) = v80 ^ v116;
  unsigned int v122 = (v80 ^ v116) >> 24;
  int v123 = BYTE1(v55);
  unsigned int v124 = *(_DWORD *)(v73 + 4LL * (v122 ^ 0x9E)) ^ *(_DWORD *)&v75[4 * (BYTE1(v55) ^ 0x58)] ^ 0xDF3B62E1;
  int v125 = v55;
  int v126 = (v124 - 302608907 + (~(2 * v124) | 0x2412E417)) ^ *(_DWORD *)&v71[4 * (v55 ^ 0xAE)];
  int v127 = v126 - ((2 * v126) & 0x4D72000);
  unsigned int v128 = BYTE2(v55);
  int v129 = v120 ^ *(_DWORD *)&v118[4 * (BYTE2(v55) ^ 0xC)] ^ (v127 + 40603648);
  *(_DWORD *)(v54 - 224) = v129;
  int v130 = v129 ^ 0x156D2456 ^ v115 ^ 0x7F7724B3;
  unsigned int v131 = v130 ^ v55;
  int v132 = v130;
  *(_DWORD *)(v54 - 132) = v130;
  int v454 = ((unsigned __int16)(v130 ^ (unsigned __int16)v55) >> 8);
  unsigned int v133 = v80 ^ v115 ^ 0x7F7724B3;
  unsigned int v443 = v129 ^ 0x156D2456 ^ v80;
  int v134 = *(_DWORD *)&v75[4 * (v454 ^ 0xD)] ^ *(_DWORD *)(v73 + 4LL * (HIBYTE(v131) ^ 0xBC));
  unsigned int v135 = ((v134 ^ 0xDF3B62E1) - 302608907 + (~(2 * (v134 ^ 0xDF3B62E1)) | 0x2412E417)) ^ *(_DWORD *)&v71[4 * (v131 ^ 0xD6)];
  int v136 = (v135 - ((2 * v135) & 0x4D72000) + 40603648) ^ *(_DWORD *)&v118[4 * (BYTE2(v131) ^ 0xFA)];
  LODWORD(v569) = v129 ^ 0x6A31474F ^ (v136 - ((2 * v136) & 0xD58CD5CC) - 356095258);
  HIDWORD(v568) = (v569 - ((2 * v569) & 0xFBE0E300) - 34573952) ^ v443;
  LODWORD(v568) = v132 ^ 0x6494F71E ^ HIDWORD(v568);
  HIDWORD(a44) = (v568 - ((2 * v568) & 0x73660336) - 1179450981) ^ v131;
  LODWORD(v63) = *(_DWORD *)(v54 - 148);
  uint64_t v137 = (uint64_t)*(&off_10005BF10 + (int)(v63 ^ 0x3D));
  unsigned int v138 = (((v120 ^ 0x1B9155BDu) >> 16)
        - 140599921
        + ((2 * ((v120 ^ 0x1B9155BDu) >> 16) + 88) & 0x2C4 ^ 0xFE7F7BFF)) ^ *(_DWORD *)(v137 + 4LL * (((v120 ^ 0x1B9155BDu) >> 16) ^ 0x2Du));
  LODWORD(v75) = ((v128 ^ 0x2D) - 140599921 + ((2 * (v128 ^ 0x2D) + 88) & 0x2C4 ^ 0xFE7F7BFF)) ^ *(_DWORD *)(v137 + 4LL * v128);
  uint64_t v139 = (uint64_t)*(&off_10005BF10 + (int)v63 - 80);
  LODWORD(v118) = (v138 - ((2 * v138) & 0x27550EEE) + 329942903) ^ *(_DWORD *)(v139 + 4LL * (BYTE1(v120) ^ 0x47u));
  unsigned int v140 = (_DWORD)v75 - ((2 * (_DWORD)v75) & 0xFCE72778);
  int v141 = (char *)*(&off_10005BF10 + (int)(v63 ^ 0x2A)) - 12;
  int v142 = *(_DWORD *)&v141[4 * (v122 ^ 0x57)];
  uint64_t v143 = (uint64_t)*(&off_10005BF10 + (int)(v63 ^ 0xBA));
  int v144 = *(_DWORD *)(v143 + 4LL * ((v80 ^ v68) ^ 0x4Fu));
  int v145 = (v140 - 25979972) ^ v142;
  int v146 = *(_DWORD *)&v141[4 * (HIBYTE(v133) ^ 0x87)];
  *(void *)(v54 - 120) = a1;
  int v147 = *(unsigned __int8 **)(v54 - 120);
  unsigned int v148 = *(_DWORD *)(v137 + 4LL * (BYTE2(v133) ^ 0x6Du)) ^ v146 ^ ((BYTE2(v133) ^ 0x40)
                                                                 - 140599921
                                                                 + ((2 * (BYTE2(v133) ^ 0x40) + 88) & 0x2C4 ^ 0xFE7F7BFF)) ^ (181304767 * v144 - 2 * ((181304767 * v144 + 518150896) & 0x7E7393BD ^ (181304767 * v144) & 1) + 492170924);
  int v149 = 181304767 * *(_DWORD *)(v143 + 4LL * (v121 ^ 0xA8u));
  unsigned int v549 = v121;
  int v150 = (v149 - 2 * ((v149 + 518150896) & 0x13AA877F ^ v149 & 8) + 848093799) ^ *(_DWORD *)(v139
                                                                                           + 4LL * (BYTE1(v121) ^ 0x5Au));
  int v465 = v150 - 25979972 + (~(2 * v150) | 0x318D887);
  int v526 = BYTE2(v121);
  unsigned int v463 = (BYTE2(v121) ^ 0x4C) - 140599921 + ((2 * (BYTE2(v121) ^ 0x4C) + 88) & 0x2C4 ^ 0xFE7F7BFF);
  unsigned int v518 = BYTE1(v133) ^ 0x4E;
  int v542 = v145 - ((2 * v145) & 0x27550EEE);
  unsigned int v477 = v125 ^ 0xEB;
  unsigned int v536 = v148 - ((2 * v148) & 0x27550EEE);
  unsigned int v574 = ((_DWORD)v118 - ((2 * (_DWORD)v118) & 0xFCE72778) - 25979972) ^ *(_DWORD *)&v141[4
                                                                                        * ((v120 ^ 0x1B9155BDu) >> 24)] ^ (181304767 * *(_DWORD *)(v143 + 4LL * (v120 ^ 0x7Du)) + 518150896);
  int v151 = *(_DWORD *)(v54 - 208);
  LODWORD(v80) = *(_DWORD *)(v137 + 4LL * (((v151 ^ 0xE9B45E6C) >> 16) ^ 0xF5u)) ^ ((((v151 ^ 0xE9B45E6C) >> 16) ^ 0xD8) - 140599921 + ((2 * (((v151 ^ 0xE9B45E6C) >> 16) ^ 0xD8) + 88) & 0x2C4 ^ 0xFE7F7BFF));
  unsigned int v152 = *(_DWORD *)(v54 - 192) ^ 0x31676F78;
  unsigned int v153 = *(_DWORD *)(v137 + 4LL * (BYTE2(v152) ^ 0x7Bu)) ^ ((BYTE2(v152) ^ 0x56)
                                                          - 140599921
                                                          + ((2 * (BYTE2(v152) ^ 0x56) + 88) & 0x2C4 ^ 0xFE7F7BFF));
  unsigned int v154 = (v153 - ((2 * v153) & 0xFCE72778) - 25979972) ^ *(_DWORD *)&v141[4 * HIBYTE(v152)];
  unsigned int v155 = *(_DWORD *)(v137 + 4LL * (v505 ^ 0x34u)) ^ ((v505 ^ 0x19)
                                                   - 140599921
                                                   + ((2 * (v505 ^ 0x19) + 88) & 0x2C4 ^ 0xFE7F7BFF));
  int v156 = (v155 - ((2 * v155) & 0x27550EEE) + 329942903) ^ *(_DWORD *)(v139 + 4LL * (v509 ^ 5u));
  unsigned int v506 = v154 - ((2 * v154) & 0x27550EEE);
  unsigned int v510 = v156 - ((2 * v156) & 0xFCE72778);
  int v157 = *(_DWORD *)(v143 + 4LL * (*(_DWORD *)(v54 - 168) ^ 0xDFu));
  unsigned int v158 = *(_DWORD *)(v54 - 168) ^ 0x5A18571F;
  unsigned int v159 = *(_DWORD *)&v141[4 * HIBYTE(v158)] ^ ((BYTE2(v158) ^ 0xC1)
                                             - 140599921
                                             + ((2 * (BYTE2(v158) ^ 0xC1) + 88) & 0x2C4 ^ 0xFE7F7BFF)) ^ *(_DWORD *)(v137 + 4LL * (BYTE2(v158) ^ 0xECu)) ^ (181304767 * v157 - ((362609534 * v157 + 1036301792) & 0xFCE72778) + 492170924);
  unsigned int v503 = v159 - ((2 * v159) & 0x27550EEE);
  unsigned int v160 = *(_DWORD *)&v141[4 * ((v151 ^ 0xE9B45E6C) >> 24)] ^ ((_DWORD)v80 - ((2 * (_DWORD)v80) & 0xFCE72778) - 25979972);
  unsigned int v498 = BYTE1(v151) ^ 0xB4;
  unsigned int v500 = v160 - ((2 * v160) & 0x27550EEE);
  unsigned __int8 v468 = BYTE1(v471) ^ 0x8E;
  int v161 = *(_DWORD *)(v54 - 176);
  int v162 = *(_DWORD *)(v137 + 4LL * (v486 ^ 0x7Cu)) ^ ((v486 ^ 0x51)
                                                   - 140599921
                                                   + ~((2 * (v486 ^ 0x51) + 25990232) & 0x18086C4));
  unsigned int v163 = *(_DWORD *)(v137 + 4LL * (((v471 ^ 0x8FC48C09) >> 16) ^ 0xFEu)) ^ ((((v471 ^ 0x8FC48C09) >> 16) ^ 0xD3)
                                                                                           - 140599921
                                                                                           + ((2
  int v164 = *(_DWORD *)(v143 + 4LL * (v161 ^ 0xA8u));
  unsigned int v165 = (v162 - ((2 * v162) & 0xFCE72778) - 25979972) ^ *(_DWORD *)&v141[4 * (v492 ^ 0x72)];
  int v166 = BYTE2(*(_DWORD *)(v54 - 140));
  unsigned int v167 = *(_DWORD *)(v137 + 4LL * (v166 ^ 0xB5u)) ^ ((v166 ^ 0x98)
                                                   - 140599921
                                                   + ((2 * (v166 ^ 0x98) + 88) & 0x2C4 ^ 0xFE7F7BFF));
  LODWORD(v80) = (v167 - ((2 * v167) & 0x27550EEE) + 329942903) ^ *(_DWORD *)(v139
                                                                            + 4LL
                                                                            * (BYTE1(*(_DWORD *)(v54 - 232)) ^ 0x8Bu));
  unsigned int v487 = v165 - ((2 * v165) & 0x27550EEE);
  unsigned int v493 = (_DWORD)v80 - ((2 * (_DWORD)v80) & 0xFCE72778);
  LODWORD(v80) = *(_DWORD *)(v139 + 4LL * (BYTE1(v161) ^ 0x86u)) ^ ((BYTE2(v161) ^ 0xC7)
                                                                  - 140599921
                                                                  + ((2 * (BYTE2(v161) ^ 0xC7) + 88) & 0x2C4 ^ 0xFE7F7BFF)) ^ *(_DWORD *)(v137 + 4LL * (BYTE2(v161) ^ 0xEAu)) ^ (181304767 * v164 - ((362609534 * v164 + 1036301792) & 0x27550EEE) + 848093799);
  unsigned int v168 = (v163 - ((2 * v163) & 0xFCE72778) - 25979972) ^ *(_DWORD *)&v141[4 * ((v471 ^ 0x8FC48C09) >> 24)] ^ (181304767 * *(_DWORD *)(v143 + 4LL * (v471 ^ 0xE1u)) + 518150896);
  unsigned int v472 = v168 - ((2 * v168) & 0x27550EEE);
  unsigned int v439 = v475 ^ 0xB2;
  unsigned int v476 = (_DWORD)v80 - ((2 * (_DWORD)v80) & 0xFCE72778);
  int v169 = *(_DWORD *)(v54 - 128);
  unsigned int v445 = BYTE1(v169) ^ 0xF5;
  unsigned int v453 = v449 ^ 0x2BEAE26B;
  unsigned int v170 = *(_DWORD *)(v137 + 4LL * (((v449 ^ 0x2BEAE26Bu) >> 16) ^ 0xECu)) ^ ((((v449 ^ 0x2BEAE26Bu) >> 16) ^ 0xC1)
                                                                                            - 140599921
                                                                                            + ((2
  LODWORD(v80) = (v170 - ((2 * v170) & 0x27550EEE) + 329942903) ^ *(_DWORD *)(v139 + 4LL * (BYTE1(v449) ^ 8u));
  unsigned int v171 = *(_DWORD *)(v137 + 4LL * (v481 ^ 0xE3u)) ^ ((v481 ^ 0xCE)
                                                   - 140599921
                                                   + ((2 * (v481 ^ 0xCE) + 88) & 0x2C4 ^ 0xFE7F7BFF));
  int v172 = 181304767 * *(_DWORD *)(v143 + 4LL * (v447 ^ 0x55u));
  LODWORD(v450) = (_DWORD)v80 - ((2 * (_DWORD)v80) & 0xFCE72778);
  int v441 = BYTE2(v169);
  unsigned int v482 = (BYTE2(v169) ^ 0xA7) - 140599921 + ((2 * (BYTE2(v169) ^ 0xA7) + 88) & 0x2C4 ^ 0xFE7F7BFF);
  LODWORD(v80) = (v171 - ((2 * v171) & 0x27550EEE) + 329942903) ^ *(_DWORD *)(v139 + 4LL * (v494 ^ 0x1Au)) ^ (181304767 * *(_DWORD *)(v143 + 4LL * (v489 ^ 0x20u)) + 518150896);
  unsigned int v495 = (_DWORD)v80 - ((2 * (_DWORD)v80) & 0xFCE72778);
  unsigned int v173 = *(_DWORD *)(v54 - 184);
  LODWORD(v80) = (v172 - 2 * ((v172 + 518150896) & 0x7E7393BE ^ v172 & 2) + 492170924) ^ ((BYTE2(v173) ^ 0xBA)
                                                                                        - 140599921
                                                                                        + ((2 * (BYTE2(v173) ^ 0xBA) + 88) & 0x2C4 ^ 0xFE7F7BFF)) ^ *(_DWORD *)&v141[4 * (HIBYTE(v173) ^ 0x2F)] ^ *(_DWORD *)(v137 + 4LL * (BYTE2(v173) ^ 0x97u));
  int v448 = (_DWORD)v80 - ((2 * (_DWORD)v80) & 0x27550EEE);
  LODWORD(v80) = BYTE2(*(_DWORD *)(v54 - 136));
  LODWORD(v80) = *(_DWORD *)(v137 + 4LL * (v80 ^ 0x74)) ^ ((v80 ^ 0x59)
                                                                       - 140599921
                                                                       + ((2 * (v80 ^ 0x59) + 88) & 0x2C4 ^ 0xFE7F7BFF));
  unsigned int v174 = *(_DWORD *)(v137 + 4LL * (BYTE2(*(_DWORD *)(v54 - 216)) ^ 0x56u)) ^ ((BYTE2(*(_DWORD *)(v54 - 216)) ^ 0x7B)
                                                                            - 140599921
                                                                            + ((2
  LODWORD(v80) = ((_DWORD)v80 - ((2 * (_DWORD)v80) & 0x27550EEE) + 329942903) ^ *(_DWORD *)(v139
                                                                                          + 4LL * (HIBYTE(v451) ^ 0x46u)) ^ (181304767 * *(_DWORD *)(v143 + 4LL * (v451 ^ 0x4Fu)) + 518150896);
  int v175 = 181304767 * *(_DWORD *)(v143 + 4LL * (*(_DWORD *)(v54 - 200) ^ 0xFBu));
  int v176 = (v175 - 2 * ((v175 + 518150896) & 0x13AA877F ^ v175 & 8) + 848093799) ^ *(_DWORD *)(v139
                                                                                           + 4LL
                                                                                           * (BYTE1(*(_DWORD *)(v54 - 200)) ^ 0xEFu));
  LODWORD(v452) = (_DWORD)v80 - ((2 * (_DWORD)v80) & 0xFCE72778);
  HIDWORD(v440) = v176 - ((2 * v176) & 0xFCE72778);
  unsigned int v177 = (v174 - ((2 * v174) & 0xFCE72778) - 25979972) ^ *(_DWORD *)&v141[4 * (HIBYTE(*(_DWORD *)(v54 - 216)) ^ 0xD9)] ^ (181304767 * *(_DWORD *)(v143 + 4LL * (*(_DWORD *)(v54 - 216) ^ 0x79u)) + 518150896);
  unsigned int v178 = *(_DWORD *)(v137 + 4LL * (v456 ^ 0x45u)) ^ ((v456 ^ 0x68)
                                                   - 140599921
                                                   + ((2 * (v456 ^ 0x68) + 88) & 0x2C4 ^ 0xFE7F7BFF));
  unsigned int v179 = (v178 - ((2 * v178) & 0xFCE72778) - 25979972) ^ *(_DWORD *)&v141[4 * v469];
  unsigned int v457 = v179 - ((2 * v179) & 0x27550EEE);
  unsigned int v438 = v177 - ((2 * v177) & 0x27550EEE);
  int v461 = BYTE2(v460);
  unsigned int v490 = (v461 ^ 0x65) - 140599921 + ((2 * (v461 ^ 0x65) + 88) & 0x2C4 ^ 0xFE7F7BFF);
  unsigned int v180 = *(_DWORD *)(v137 + 4LL * (BYTE2(v131) ^ 0xBAu)) ^ ((BYTE2(v131) ^ 0x97)
                                                          - 140599921
                                                          + ((2 * (BYTE2(v131) ^ 0x97) + 88) & 0x2C4 ^ 0xFE7F7BFF));
  int v435 = BYTE2(*(_DWORD *)(v54 - 132));
  unsigned int v470 = (v435 ^ 0x1A) - 140599921 + ((2 * (v435 ^ 0x1A) + 88) & 0x2C4 ^ 0xFE7F7BFF);
  LODWORD(v63) = *(_DWORD *)(v54 - 224);
  unsigned int v181 = *(_DWORD *)(v137 + 4LL * (BYTE2(v63) ^ 0xE8u)) ^ ((BYTE2(v63) ^ 0xC5)
                                                         - 140599921
                                                         + ((2 * (BYTE2(v63) ^ 0xC5) + 88) & 0x2C4 ^ 0xFE7F7BFF));
  unsigned int v182 = (181304767 * *(_DWORD *)(v143 + 4LL * (v63 ^ 0xCAu)) + 518150896) ^ *(_DWORD *)&v141[4 * ((v63 >> 24) ^ 0x8E)] ^ (v181 - ((2 * v181) & 0xFCE72778) - 25979972);
  unsigned int v436 = v443 ^ 0x9D51243E;
  unsigned int v183 = (181304767 * *(_DWORD *)(v143 + 4LL * (v443 ^ 0x4Fu)) + 518150896) ^ (((v443 ^ 0x9D51243E) >> 16)
                                                                                              - 140599921
                                                                                              + ((2
  unsigned int v433 = v182 - ((2 * v182) & 0x27550EEE);
  int v184 = (v183 - ((2 * v183) & 0x27550EEE) + 329942903) ^ *(_DWORD *)(v139 + 4LL * (BYTE1(v443) ^ 0x7Eu));
  unsigned int v185 = *(_DWORD *)&v141[4 * (HIBYTE(v131) ^ 0xD9)] ^ (181304767
  HIDWORD(v452) = v184 - ((2 * v184) & 0xFCE72778);
  HIDWORD(v450) = v454 ^ 0xF7;
  unsigned int v455 = v185 - ((2 * v185) & 0x27550EEE);
  int v186 = 181304767 * *(_DWORD *)(v143 + 4LL * (v515 ^ 0xECu));
  int v187 = v186 - 2 * ((v186 + 518150896) & 0x7E7393BE ^ v186 & 2);
  unsigned int v188 = *(_DWORD *)(v137 + 4LL * (v538 ^ 0x32u)) ^ ((v538 ^ 0x1F)
                                                   - 140599921
                                                   + ((2 * (v538 ^ 0x1F) + 88) & 0x2C4 ^ 0xFE7F7BFF));
  int v189 = 181304767 * *(_DWORD *)(v143 + 4LL * (*(_DWORD *)(v54 - 144) ^ 0xE6u));
  int v190 = *(_DWORD *)&v141[4 * (HIBYTE(v515) ^ 0xCA)] ^ *(_DWORD *)(v137 + 4LL * (BYTE2(v515) ^ 2u)) ^ ((BYTE2(v515) ^ 0x2F) - 140599921 + ((2 * (((BYTE2(v515) ^ 0x2F) + 44) & 0x163 ^ (HIWORD(v515) ^ 0x45E5 | 0x7FFFFFFE))) ^ 0x1808403)) ^ (v187 + 492170924);
  LODWORD(v80) = (v188 - ((2 * v188) & 0x27550EEE) + 329942903) ^ *(_DWORD *)(v139 + 4LL * (v572 ^ 0x8Cu)) ^ (181304767 * *(_DWORD *)(v143 + 4LL * (v547 ^ 0xD9u)) + 518150896);
  unsigned int v191 = *(_DWORD *)(v54 - 144) ^ 0x49A657C7;
  unsigned int v192 = *(_DWORD *)&v141[4 * HIBYTE(v191)] ^ ((BYTE2(v191) ^ 0x35)
                                             - 140599921
                                             + ((2 * (BYTE2(v191) ^ 0x35) + 88) & 0x2C4 ^ 0xFE7F7BFF)) ^ *(_DWORD *)(v137 + 4LL * (BYTE2(v191) ^ 0x18u)) ^ (v189 - 2 * ((v189 + 518150896) & 0x7E7393BD ^ v189 & 1) + 492170924);
  unsigned int v193 = *(_DWORD *)(v137 + 4LL * (((v531 ^ 0x380AB5C6u) >> 16) ^ 0x2Du)) ^ (((v531 ^ 0x380AB5C6u) >> 16)
                                                                                            - 140599921
                                                                                            + ((2
  int v573 = (v190 - ((2 * v190) & 0x27550EEE) + 329942903) ^ *(_DWORD *)(v139 + 4LL * (BYTE1(v515) ^ 0x2Eu));
  unsigned int v548 = (_DWORD)v80 - ((2 * (_DWORD)v80) & 0xFCE72778);
  LODWORD(v80) = (v193 - ((2 * v193) & 0xFCE72778) - 25979972) ^ *(_DWORD *)&v141[4 * ((v531 ^ 0x380AB5C6u) >> 24)] ^ (181304767 * *(_DWORD *)(v143 + 4LL * (v531 ^ 0x56u)) + 518150896);
  unsigned int v444 = BYTE1(v531) ^ 0x35;
  unsigned int v539 = v192 - ((2 * v192) & 0x27550EEE);
  int v516 = (_DWORD)v80 - ((2 * (_DWORD)v80) & 0x27550EEE);
  int v194 = *(_DWORD *)(v137 + 4LL * (v528 ^ 0xCCu)) ^ ((v528 ^ 0xE1)
                                                   - 140599921
                                                   + ((2 * (((v528 ^ 0xE1) + 44) & 0x163 ^ (v528 ^ 0xE1 | 0x7FFFFFFE))) ^ 0x1808403));
  unsigned int v195 = *(_DWORD *)(v54 - 160);
  LODWORD(v80) = (v194 - ((2 * v194) & 0x27550EEE) + 329942903) ^ *(_DWORD *)(v139
                                                                            + 4LL
                                                                            * (((v522 ^ 0xF)
                                                                              + ((v511 >> 7) & 0x166 ^ 0xFFFFFFF9)
                                                                              + 180) ^ 0x54)) ^ (181304767
                                                                                               * *(_DWORD *)(v143 + 4LL * (v544 ^ 0x4Du))
                                                                                               + 518150896);
  unsigned int v432 = BYTE1(v533) ^ 0x77;
  int v196 = 181304767 * *(_DWORD *)(v143 + 4LL * (v195 ^ 0xB1u));
  int v197 = (v196 - 2 * ((v196 + 518150896) & 0x7E7393BF ^ v196 & 3) + 492170924) ^ *(_DWORD *)&v141[4
                                                                                                * (HIBYTE(v195) ^ 0x7D)];
  unsigned int v545 = (_DWORD)v80 - ((2 * (_DWORD)v80) & 0xFCE72778);
  int v512 = v197 - ((2 * v197) & 0x27550EEE);
  unsigned int v523 = v552 ^ 0xEEA2BFA8;
  LODWORD(v80) = *(_DWORD *)(v137 + 4LL * (((v552 ^ 0xEEA2BFA8) >> 16) ^ 0x86u)) ^ ((((v552 ^ 0xEEA2BFA8) >> 16) ^ 0xAB) - 140599921 + ((2 * (((v552 ^ 0xEEA2BFA8) >> 16) ^ 0xAB) + 88) & 0x2C4 ^ 0xFE7F7BFF));
  int v198 = (181304767 * *(_DWORD *)(v143 + 4LL * (v552 ^ 0x68u)) + 518150896) ^ *(_DWORD *)(v139 + 4LL * (BYTE1(v552) ^ 0x55u)) ^ ((_DWORD)v80 - ((2 * (_DWORD)v80) & 0x27550EEE) + 329942903);
  unsigned int v553 = v533 ^ 0x231B9DB5;
  int v199 = ((v533 ^ 0x231B9DB5) >> 16);
  unsigned int v532 = (v199 ^ 0xC1) - 140599921 + ((2 * (v199 ^ 0xC1) + 88) & 0x2C4 ^ 0xFE7F7BFF);
  int v430 = *(_DWORD *)(v143 + 4LL * v477);
  int v478 = *(_DWORD *)(v143 + 4LL * (v563 ^ 0xFBu));
  unsigned int v564 = v198 - ((2 * v198) & 0xFCE72778);
  int v200 = *(_DWORD *)(v54 - 192);
  int v429 = *(_DWORD *)(v143 + 4LL * (v200 ^ 0xB8u));
  unsigned int v529 = (BYTE2(v195) ^ 0x89) - 140599921 + ((2 * (BYTE2(v195) ^ 0x89) + 88) & 0x2C4 ^ 0xFE7F7BFF);
  int v201 = *(_DWORD *)(v143 + 4LL * (*(_DWORD *)(v54 - 208) ^ 0xACu));
  int v202 = *(_DWORD *)(v143 + 4LL * (*(_DWORD *)(v54 - 232) ^ 0xA3u));
  LODWORD(v71) = *(_DWORD *)(v143 + 4LL * v439);
  int v203 = *(_DWORD *)(v143 + 4LL * (*(_DWORD *)(v54 - 128) ^ 0x57u));
  int v204 = *(_DWORD *)(v143 + 4LL * (v554 ^ 1u));
  int v205 = *(_DWORD *)(v143 + 4LL * (v559 ^ 0x74u));
  int v206 = *(_DWORD *)(v143 + 4LL * (*(_DWORD *)(v54 - 132) ^ 0xF0u));
  LODWORD(v80) = *(_DWORD *)(v143 + 4LL * (v533 ^ 0x75u));
  LODWORD(v118) = *(_DWORD *)(v143 + 4LL * (v566 ^ 0xFBu));
  int v207 = *(_DWORD *)(v143 + 4LL * (v575 ^ 0x2Au));
  int v208 = *(_DWORD *)(v143 + 4LL * (v583 ^ 0xF1u));
  *(_DWORD *)(v54 - 208) = 181304767 * v430 + 518150896;
  int v479 = 181304767 * v478 + 518150896;
  LODWORD(v431) = 181304767 * v429 + 518150896;
  LODWORD(v440) = 181304767 * v201 + 518150896;
  HIDWORD(v427) = 181304767 * v202 + 518150896;
  LODWORD(v427) = 181304767 * (_DWORD)v71 + 518150896;
  *(_DWORD *)(v54 - 232) = 181304767 * v203 + 518150896;
  HIDWORD(v428) = 181304767 * v204 + 518150896;
  int v555 = 181304767 * v206 + 518150896;
  int v534 = 181304767 * (_DWORD)v80 + 518150896;
  LODWORD(v428) = 181304767 * v208 + 518150896;
  unsigned int v209 = (181304767 * v205 - ((362609534 * v205 + 1036301792) & 0xFCE72778) + 492170924) ^ *(_DWORD *)&v141[4 * (v557 ^ 0x7B)];
  LODWORD(v143) = *(_DWORD *)(v137 + 4LL * (BYTE2(v566) ^ 0x2Au)) ^ ((BYTE2(v566) ^ 7)
                                                                   - 140599921
                                                                   + ((2 * (BYTE2(v566) ^ 7) + 88) & 0x2C4 ^ 0xFE7F7BFF)) ^ (181304767 * (_DWORD)v118 + 518150896);
  LODWORD(v143) = (v143 - ((2 * v143) & 0x27550EEE) + 329942903) ^ *(_DWORD *)(v139 + 4LL * (BYTE1(v566) ^ 7u));
  unsigned int v210 = *(_DWORD *)(v137 + 4LL * (BYTE2(v583) ^ 0x8Au)) ^ ((BYTE2(v583) ^ 0xA7)
                                                          - 140599921
                                                          + ((2 * (BYTE2(v583) ^ 0xA7) + 88) & 0x2C4 ^ 0xFE7F7BFF));
  unsigned int v211 = v435 ^ 0x37;
  LODWORD(v80) = (181304767 * v207 + 518150896) ^ ((BYTE2(v575) ^ 0x37)
                                                 - 140599921
                                                 + ((2 * (BYTE2(v575) ^ 0x37) + 88) & 0x2C4 ^ 0xFE7F7BFF)) ^ *(_DWORD *)(v137 + 4LL * (BYTE2(v575) ^ 0x1Au));
  unsigned int v212 = v209 - ((2 * v209) & 0x27550EEE);
  LODWORD(v80) = ((_DWORD)v80 - ((2 * (_DWORD)v80) & 0xFCE72778) - 25979972) ^ *(_DWORD *)&v141[4
                                                                                              * (HIBYTE(v575) ^ 0xF9)];
  HIDWORD(v434) = *(_DWORD *)(v137 + 4LL * (v526 ^ 0x61u));
  LODWORD(v442) = *(_DWORD *)(v137 + 4LL * (v441 ^ 0x8Au));
  int v462 = *(_DWORD *)(v137 + 4LL * (v461 ^ 0x48u));
  int v213 = v588 ^ 0x4C64A1B;
  LODWORD(v425) = *(_DWORD *)(v137 + 4LL * v211);
  int v527 = *(_DWORD *)(v137 + 4LL * (v199 ^ 0xECu));
  HIDWORD(v425) = *(_DWORD *)(v137 + 4LL * (BYTE2(v195) ^ 0xA4u));
  HIDWORD(v426) = *(_DWORD *)(v137 + 4LL * (v588 ^ 0x1Au));
  int v589 = *(_DWORD *)(v139 + 4LL * (v123 ^ 0x87u));
  int v521 = *(_DWORD *)(v139 + 4LL * v518);
  LODWORD(v137) = ((v577 >> 15) & 0x58 ^ 0x48) + v213;
  *(_DWORD *)(v54 - 192) = *(_DWORD *)(v139 + 4LL * (BYTE1(v200) ^ 0x85u));
  LODWORD(v426) = *(_DWORD *)(v139 + 4LL * (BYTE1(*(_DWORD *)(v54 - 168)) ^ 0xBDu));
  int v578 = *(_DWORD *)(v139 + 4LL * v498);
  int v519 = *(_DWORD *)(v139 + 4LL * (v561 ^ 9u));
  HIDWORD(v424) = *(_DWORD *)(v139 + 4LL * (v468 ^ 0x14u));
  int v466 = *(_DWORD *)(v139 + 4LL * v445);
  *(_DWORD *)(v54 - 184) = *(_DWORD *)(v139 + 4LL * (BYTE1(*(_DWORD *)(v54 - 184)) ^ 0xD6u));
  int v581 = *(_DWORD *)(v139 + 4LL * (v580 ^ 0xEEu));
  int v499 = *(_DWORD *)(v139 + 4LL * (BYTE1(*(_DWORD *)(v54 - 216)) ^ 0xD7u));
  unsigned int v214 = *(_DWORD *)(v54 - 132);
  LODWORD(v446) = *(_DWORD *)(v139 + 4LL * (BYTE1(v214) ^ 8u));
  int v215 = *(_DWORD *)(v139 + 4LL * (BYTE1(*(_DWORD *)(v54 - 224)) ^ 0x16u));
  int v558 = *(_DWORD *)(v139 + 4LL * HIDWORD(v450));
  *(_DWORD *)(v54 - 216) = *(_DWORD *)(v139 + 4LL * (BYTE1(*(_DWORD *)(v54 - 144)) ^ 0xB9u));
  HIDWORD(v450) = v137 - 220703901 + ((2 * v137) & 0x2C4 ^ 0xFE7F7BFF);
  *(_DWORD *)(v54 - 224) = *(_DWORD *)(v139 + 4LL * v444);
  HIDWORD(v431) = *(_DWORD *)(v139 + 4LL * v432);
  LODWORD(v424) = *(_DWORD *)(v139 + 4LL * (BYTE1(*(_DWORD *)(v54 - 160)) ^ 0xD7u));
  int v591 = *(_DWORD *)(v139 + 4LL * (v590 ^ 0x84u));
  int v576 = *(_DWORD *)(v139 + 4LL * (BYTE1(v575) ^ 0x2Eu));
  int v216 = *(_DWORD *)(v139 + 4LL * (BYTE1(v583) ^ 0x97u));
  *(_DWORD *)(v54 - 160) = *(_DWORD *)&v141[4 * (HIBYTE(v549) ^ 8)];
  *(_DWORD *)(v54 - 168) = v542 + 329942903;
  *(_DWORD *)(v54 - 248) = *(_DWORD *)&v141[4 * (*(_DWORD *)(v54 - 248) ^ 7)];
  unsigned int v550 = v536 + 329942903;
  unsigned int v585 = v506 + 329942903;
  HIDWORD(v423) = v503 + 329942903;
  HIDWORD(v442) = v500 + 329942903;
  int v543 = *(_DWORD *)&v141[4 * (HIBYTE(*(_DWORD *)(v54 - 140)) ^ 0xED)];
  LODWORD(v423) = v487 + 329942903;
  HIDWORD(v422) = v472 + 329942903;
  int v537 = *(_DWORD *)&v141[4 * (HIBYTE(*(_DWORD *)(v54 - 176)) ^ 0x1F)];
  *(_DWORD *)(v54 - 176) = *(_DWORD *)&v141[4 * (HIBYTE(*(_DWORD *)(v54 - 128)) ^ 0xB8)];
  *(_DWORD *)(v54 - 128) = *(_DWORD *)&v141[4 * HIBYTE(v453)];
  int v473 = v448 + 329942903;
  unsigned int v507 = v457 + 329942903;
  LODWORD(a18) = v438 + 329942903;
  unsigned int v217 = v433 + 329942903;
  HIDWORD(v446) = v455 + 329942903;
  unsigned int v501 = v539 + 329942903;
  int v488 = v516 + 329942903;
  int v517 = v512 + 329942903;
  unsigned int v504 = v212 + 329942903;
  int v513 = (_DWORD)v80 - ((2 * (_DWORD)v80) & 0x27550EEE) + 329942903;
  int v458 = *(_DWORD *)&v141[4 * (v483 ^ 0x4B)];
  int v484 = *(_DWORD *)&v141[4 * (HIBYTE(*(_DWORD *)(v54 - 136)) ^ 0x5E)];
  HIDWORD(a20) = *(_DWORD *)&v141[4 * (HIBYTE(*(_DWORD *)(v54 - 200)) ^ 0xE8)];
  int v218 = *(_DWORD *)&v141[4 * (HIBYTE(v214) ^ 0xC6)];
  int v540 = *(_DWORD *)&v141[4 * HIBYTE(v436)];
  *(_DWORD *)(v54 - 200) = *(_DWORD *)&v141[4 * (*(_DWORD *)(v54 - 256) ^ 0xAA)];
  LODWORD(v80) = HIBYTE(v523);
  LODWORD(v422) = *(_DWORD *)&v141[4 * HIBYTE(v553)];
  int v524 = *(_DWORD *)&v141[4 * (v586 ^ 0x85)];
  LODWORD(v437) = *(_DWORD *)&v141[4 * v80];
  LODWORD(v434) = *(_DWORD *)&v141[4 * (HIBYTE(v566) ^ 0xAC)];
  HIDWORD(v437) = *(_DWORD *)&v141[4 * (HIBYTE(v583) ^ 0xF8)];
  unsigned int v584 = v510 - 25979972;
  *(_DWORD *)(v54 - 256) = v450 - 25979972;
  unsigned int v587 = v495 - 25979972;
  unsigned int v496 = v548 - 25979972;
  unsigned int v219 = v545 - 25979972;
  unsigned int v220 = v564 - 25979972;
  int v221 = v143 - ((2 * v143) & 0xFCE72778) - 25979972;
  unsigned int v222 = (v216 ^ (v210 - ((2 * v210) & 0x27550EEE) + 329942903))
       - ((2 * (v216 ^ (v210 - ((2 * v210) & 0x27550EEE) + 329942903))) & 0xFCE72778)
       - 25979972;
  int v223 = v574 ^ v573 ^ 0x6285F181;
  LODWORD(v139) = v217 ^ v215 ^ v223;
  int v224 = *(_DWORD *)(v54 - 148);
  uint64_t v225 = (char *)*(&off_10005BF10 + v224 - 134) - 8;
  unint64_t v226 = (char *)*(&off_10005BF10 + v224 + 30) - 12;
  uint64_t v227 = (char *)*(&off_10005BF10 + v224 + 5) - 12;
  uint64_t v228 = (uint64_t)*(&off_10005BF10 + (v224 ^ 0xA6));
  unsigned int v229 = (*(unsigned __int8 *)(v228 + (*(unsigned __int8 *)(v54 - 105) ^ 0xE4LL)) ^ 0x57) & 0xFF00FFFF | ((v225[*(unsigned __int8 *)(v54 - 108) ^ 0x3ELL] ^ (*(unsigned __int8 *)(v54 - 108) - ((2 * *(unsigned __int8 *)(v54 - 108)) & 0xE8) + 116) ^ 0xFFFFFFE1) << 24) | (((v227[*(unsigned __int8 *)(v54 - 107) ^ 0x27LL] + 111) ^ 0x96) << 16);
  int v230 = ((v225[*(unsigned __int8 *)(v54 - 104) ^ 0xD3LL] ^ (*(unsigned __int8 *)(v54 - 104)
  unsigned int v231 = (*(unsigned __int8 *)(v228 + (*(unsigned __int8 *)(v54 - 109) ^ 0x41LL)) ^ 0x61) & 0xFF00FFFF | (((v227[*(unsigned __int8 *)(v54 - 111) ^ 0x40LL] + 111) ^ 0x5A) << 16) | ((v226[*(unsigned __int8 *)(v54 - 110) ^ 0xBBLL] ^ 0x88) << 8) | ((v225[*(unsigned __int8 *)(v54 - 112) ^ 0x1ELL] ^ (*(unsigned __int8 *)(v54 - 112) - ((2 * *(unsigned __int8 *)(v54 - 112)) & 0xE8) + 116) ^ 0x84) << 24);
  v565 = v226;
  v567 = v225;
  uint64_t v560 = v228;
  v562 = v227;
  int v232 = *(unsigned __int8 *)(v228 + (*(unsigned __int8 *)(v54 - 97) ^ 0x74LL)) ^ 0xC6 | (((v227[*(unsigned __int8 *)(v54 - 99) ^ 0xF3LL] + 111) ^ 2) << 16) | ((v226[*(unsigned __int8 *)(v54 - 98) ^ 0x20LL] ^ 0x62) << 8) | ((v225[*(unsigned __int8 *)(v54 - 100) ^ 0xF3LL] ^ (*(unsigned __int8 *)(v54 - 100) + (~(2 * *(unsigned __int8 *)(v54 - 100)) | 0x17) + 117) ^ 0x85) << 24);
  int v233 = v229 | ((v226[*(unsigned __int8 *)(v54 - 106) ^ 9LL] ^ 0x8D) << 8);
  unsigned int v234 = (*(unsigned __int8 *)(v228 + (*(unsigned __int8 *)(v54 - 101) ^ 0xF2LL)) ^ 0xEE | v230) & 0xFF00FFFF | (((v227[*(unsigned __int8 *)(v54 - 103) ^ 0xE9LL] + 111) ^ 0x8A) << 16);
  int v235 = v139 ^ 0x2497E332;
  if ((v139 & 0x80) != 0) {
    int v236 = -128;
  }
  else {
    int v236 = 128;
  }
  *(_DWORD *)(v54 - 132) = v232 ^ 0xFB2F1E7;
  *(_DWORD *)(v54 - 136) = v231 ^ 0xC1F21E7C;
  *(_DWORD *)(v54 - 140) = v233 ^ 0xE59CD28;
  *(_DWORD *)(v54 - 144) = v234 ^ 0x39A20D88;
  HIDWORD(v556) = HIDWORD(v446) ^ v558;
  LODWORD(v556) = v218 ^ v470 ^ v446 ^ v425 ^ v555;
  HIDWORD(v551) = (HIDWORD(v452) - 25979972) ^ v540;
  LODWORD(v551) = v550 ^ v521;
  HIDWORD(v546) = HIDWORD(v422) ^ HIDWORD(v424);
  LODWORD(v546) = v423 ^ v519 ^ v427;
  HIDWORD(v541) = (v493 - 25979972) ^ v543 ^ HIDWORD(v427);
  LODWORD(v541) = (v476 - 25979972) ^ v537;
  HIDWORD(v535) = HIDWORD(v431) ^ v422 ^ v532 ^ v527 ^ v534;
  LODWORD(v535) = v424 ^ v529 ^ HIDWORD(v425) ^ v517;
  HIDWORD(v530) = v220 ^ v437;
  LODWORD(v530) = v219 ^ v524;
  HIDWORD(v525) = a18 ^ v499;
  LODWORD(v525) = HIDWORD(a20) ^ v490 ^ v462 ^ (HIDWORD(v440) - 25979972);
  HIDWORD(v520) = (v452 - 25979972) ^ v484;
  LODWORD(v520) = HIDWORD(v428) ^ v581 ^ v507;
  HIDWORD(v514) = v428 ^ HIDWORD(v437) ^ v222;
  LODWORD(v514) = v513 ^ v576;
  HIDWORD(v508) = v221 ^ v434;
  LODWORD(v508) = v591 ^ HIDWORD(v450) ^ HIDWORD(v426) ^ v504;
  HIDWORD(v502) = v496 ^ *(_DWORD *)(v54 - 200);
  LODWORD(v502) = v501 ^ *(_DWORD *)(v54 - 216);
  HIDWORD(v497) = v488 ^ *(_DWORD *)(v54 - 224);
  LODWORD(v497) = HIDWORD(v423) ^ v426;
  HIDWORD(v491) = v585 ^ *(_DWORD *)(v54 - 192) ^ v431;
  LODWORD(v491) = v440 ^ v578 ^ HIDWORD(v442);
  HIDWORD(v485) = v479 ^ *(_DWORD *)(v54 - 248) ^ v584;
  LODWORD(v485) = v473 ^ *(_DWORD *)(v54 - 184);
  HIDWORD(v480) = v466 ^ v482 ^ *(_DWORD *)(v54 - 176) ^ v442 ^ *(_DWORD *)(v54 - 232);
  LODWORD(v480) = v587 ^ v458;
  HIDWORD(v474) = *(_DWORD *)(v54 - 256) ^ *(_DWORD *)(v54 - 128);
  LODWORD(v474) = *(_DWORD *)(v54 - 240) - 1873667967;
  HIDWORD(v467) = (v236 + v235) ^ v223;
  LODWORD(v467) = *(_DWORD *)(v54 - 168) ^ v589 ^ *(_DWORD *)(v54 - 208);
  HIDWORD(v464) = *(_DWORD *)(v54 - 160) ^ v463 ^ HIDWORD(v434) ^ (v465 + 1);
  LODWORD(v464) = (v224 + 902) ^ 0x457;
  HIDWORD(v459) = (v224 + 902) ^ 0x4B9;
  LODWORD(v459) = (v224 + 902) ^ 0x4E5;
  *(_DWORD *)(v54 - 128) = v224 + 902;
  HIDWORD(a20) = (v224 + 902) ^ 0x4E3;
  *(void *)(v54 - 184) = 13LL;
  unsigned __int8 v237 = v227[v147[13] ^ 0xF3LL] + 111;
  int v238 = *(_DWORD *)(v54 - 128);
  *(_DWORD *)(v54 - 148) = 278292705;
  uint64_t v239 = (v238 - 1082) & 0x109668E0 ^ 0x109668E1u;
  *(void *)(v54 - 160) = v239;
  int v240 = (v237 ^ 2) << 16;
  uint64_t v241 = v147[v239] ^ 0x57LL;
  *(void *)(v54 - 168) = 10LL;
  uint64_t v242 = v147[10] ^ 0xB6LL;
  int v243 = ((v227[v241] + 111) ^ 0xF6) << 16;
  *(void *)(v54 - 192) = 4LL;
  LODWORD(v242) = (v226[v242] ^ 7) << 8;
  uint64_t v244 = v147[4];
  int v245 = v567[v244 ^ 0x9A];
  *(void *)(v54 - 232) = 7LL;
  LODWORD(v244) = v245 ^ (v244 - ((2 * v244) & 0xE8) + 116) ^ 0xFFFFFFCF;
  int v246 = *(unsigned __int8 *)(v560 + (v147[7] ^ 0xD6LL));
  *(void *)(v54 - 224) = 2LL;
  int v247 = v226[v147[2]];
  LODWORD(v244) = v246 ^ 4 | ((_DWORD)v244 << 24);
  *(void *)(v54 - 200) = 3LL;
  int v248 = *(unsigned __int8 *)(v560 + (v147[3] ^ 0x74LL));
  *(void *)(v54 - 176) = 12LL;
  int v249 = v243 | ((v247 ^ 0x15) << 8) | v248 ^ 0xC6;
  int v250 = v567[v147[12] ^ 0x6ELL] ^ (v147[12] - ((2 * v147[12]) & 0xE8) + 116) ^ 0x51;
  *(void *)(v54 - 216) = 0LL;
  int v251 = v249 | ((v567[*v147 ^ 0x15LL] ^ (*v147 + (~(2 * *v147) | 0x17) + 117) ^ 0xAE) << 24);
  LODWORD(v242) = v242 | ((v567[v147[8] ^ 0x46LL] ^ (v147[8] - ((2 * v147[8]) & 0xE8) + 116) ^ 0xFFFFFFE7) << 24);
  *(void *)(v54 - 208) = 14LL;
  int v252 = v565[v147[14] ^ 0xD5LL] ^ 0x9D;
  unsigned int v253 = (v252 << 8) - 294330608 - ((v252 << 9) & 0xFFFFBFFF);
  unsigned int v254 = ((v240 | (v250 << 24)) ^ 0x7A845FBD) - 2055495613 + ((2 * (v240 | (v250 << 24))) & 0xF5080000);
  unsigned int v255 = (v254 - (v253 ^ 0xEE74DF10 | v254)) ^ ((v253 ^ 0x118B20EF) + 1);
  unsigned int v256 = ((v255 - 294330608 - ((2 * v255) & 0xDCE9BE20)) ^ v253) + v254;
  *(void *)(v54 - 256) = 11LL;
  *(void *)(v54 - 248) = 5LL;
  LODWORD(v244) = v244 & 0xFF00FFFF | (((v227[v147[5] ^ 0x9DLL] + 111) ^ 0xF7) << 16);
  uint64_t v257 = v147[6] ^ 0xA4LL;
  int v258 = (*(unsigned __int8 *)(v560 + (v147[11] ^ 0xC2LL)) ^ 0xE3 | v242) & 0xFF00FFFF | (((v227[v147[9] ^ 0x3ELL] + 111) ^ 0xDF) << 16);
  *(void *)(v54 - 240) = 15LL;
  unsigned int v582 = v244 | ((v565[v257] ^ 0xCD) << 8);
  v259 = (char *)*(&off_10005BF10 + (int)v464) - 12;
  int v260 = *(_DWORD *)&v259[4 * (((unsigned __int16)(v582 ^ WORD2(v568)) >> 8) ^ 0x21)];
  LODWORD(v244) = (2 * (((v582 ^ HIDWORD(v568)) >> 8) ^ 0xB71C4C)) & 0xAC;
  v261 = (char *)*(&off_10005BF10 + v238 - 884) - 8;
  unsigned int v262 = v251 ^ v569;
  LODWORD(v244) = ((v260 ^ ((((unsigned __int16)(v582 ^ WORD2(v568)) >> 8) ^ 0x4C) - 1879546794 - v244))
                 + 77802409
                 - ((2
                   * (v260 ^ ((((unsigned __int16)(v582 ^ WORD2(v568)) >> 8) ^ 0x4C) - 1879546794 - v244))) & 0x9465752)) ^ *(_DWORD *)&v261[4 * ((v251 ^ v569) ^ 0xAA)];
  int v579 = *(unsigned __int8 *)(v560 + (v147[15] ^ 0x47LL)) ^ 0xC6 ^ v256;
  unsigned int v263 = ((((unsigned __int16)(WORD2(a44) ^ v579) >> 8) ^ 0x29)
        - 1879546794
        - (((HIDWORD(a44) ^ v579) >> 7) & 0xAC)) ^ *(_DWORD *)&v259[4
                                                                                * (((unsigned __int16)(WORD2(a44) ^ v579) >> 8) ^ 0x44)];
  int v264 = v263 + 28449248 - ((2 * v263) & 0x36433C0);
  int v265 = v244 + 28449248 - ((2 * v244) & 0x36433C0);
  __int16 v266 = v258 ^ v568;
  v267 = (char *)*(&off_10005BF10 + v238 - 889) - 8;
  int v268 = *(_DWORD *)&v267[4 * (((v258 ^ v568) >> 16) ^ 0x68)];
  HIDWORD(v270) = v268 ^ 0x27B;
  LODWORD(v270) = v268 ^ 0x26EDC000;
  int v269 = v270 >> 12;
  int v271 = *(_DWORD *)&v267[4 * ((v251 ^ v569) >> 16)];
  HIDWORD(v270) = v271 ^ 0x27B;
  LODWORD(v270) = v271 ^ 0x26EDC000;
  v272 = (char *)*(&off_10005BF10 + v238 - 1014) - 4;
  int v273 = v264 ^ *(_DWORD *)&v272[4 * (((v582 ^ HIDWORD(v568)) >> 24) ^ 0xB7)] ^ (v270 >> 12);
  int v274 = *(_DWORD *)&v267[4 * (((HIDWORD(a44) ^ v579) >> 16) ^ 0x72)];
  HIDWORD(v270) = v274 ^ 0x27B;
  LODWORD(v270) = v274 ^ 0x26EDC000;
  int v275 = *(_DWORD *)&v261[4 * ((v582 ^ BYTE4(v568)) ^ 0xFB)] ^ HIBYTE(v266) ^ *(_DWORD *)&v259[4 * (HIBYTE(v266) ^ 0x23)] ^ 0x8B5B4FB1 ^ (v270 >> 12);
  int v276 = *(_DWORD *)&v267[4 * (((v582 ^ HIDWORD(v568)) >> 16) ^ 0x1C)];
  HIDWORD(v270) = v276 ^ 0x27B;
  LODWORD(v270) = v276 ^ 0x26EDC000;
  int v277 = *(_DWORD *)&v272[4 * (((v258 ^ v568) >> 24) ^ 0xF6)] ^ ((BYTE1(v262) ^ 0x32)
                                                                             - 1879546794
                                                                             - 2
                                                                             * (((v262 >> 8) ^ 0x730032) & 0x5E ^ (v262 >> 8) & 8)) ^ *(_DWORD *)&v259[4 * (BYTE1(v262) ^ 0x5F)] ^ ((v270 >> 12) + 28449248 - ((2 * (v270 >> 12)) & 0x36433C0));
  int v278 = v273 + 77802409 - ((2 * v273) & 0x9465752);
  unsigned int v279 = HIDWORD(v556) ^ v269 ^ v265 ^ *(_DWORD *)&v272[4 * (((HIDWORD(a44) ^ v579) >> 24) ^ 0x14)];
  int v280 = *(_DWORD *)&v261[4 * (v266 ^ 0x5F)];
  unsigned int v281 = v556 ^ (v277 + 77802409 - ((2 * v277) & 0x9465752)) ^ *(_DWORD *)&v261[4
                                                                              * ((BYTE4(a44) ^ v579) ^ 0xD7)];
  unsigned int v282 = HIDWORD(v551) ^ v280 ^ v278;
  unsigned int v283 = HIDWORD(v467) ^ *(_DWORD *)&v272[4 * (((v251 ^ v569) >> 24) ^ 0x73)] ^ (v275
                                                                                             + 28449248
                                                                                             - ((2 * v275) & 0x36433C0));
  LODWORD(v257) = *(_DWORD *)&v267[4 * (BYTE2(v279) ^ 0x38)];
  HIDWORD(v270) = v257 ^ 0x27B;
  LODWORD(v270) = v257 ^ 0x26EDC000;
  LODWORD(v257) = v270 >> 12;
  int v284 = *(_DWORD *)&v267[4 * (BYTE2(v281) ^ 0xA1)];
  HIDWORD(v270) = v284 ^ 0x27B;
  LODWORD(v270) = v284 ^ 0x26EDC000;
  int v285 = v270 >> 12;
  int v286 = *(_DWORD *)&v267[4 * (BYTE2(v282) ^ 0x66)];
  HIDWORD(v270) = v286 ^ 0x27B;
  LODWORD(v270) = v286 ^ 0x26EDC000;
  int v287 = (v270 >> 12) ^ *(_DWORD *)&v259[4 * (BYTE1(v283) ^ 5)] ^ ((BYTE1(v283) ^ 0x68)
                                                                 - 1879546794
                                                                 - ((2 * ((v283 >> 8) ^ 0x42BD68)) & 0xAC));
  int v288 = (v257 + 77802409 - ((2 * v257) & 0x9465752)) ^ *(_DWORD *)&v261[4 * (v282 ^ 0xB6)];
  int v289 = (v287 + 77802409 - ((2 * v287) & 0x9465752)) ^ *(_DWORD *)&v261[4 * (v279 ^ 0x61)];
  unsigned int v290 = ((BYTE1(v279) ^ 0x8C) - 1879546794 - ((2 * ((v279 >> 8) ^ 0xF9388C)) & 0xAC)) ^ 0xD678EAEF ^ *(_DWORD *)&v259[4 * (BYTE1(v279) ^ 0xE1)];
  unsigned int v291 = *(_DWORD *)&v272[4 * (HIBYTE(v282) ^ 0x43)] ^ 0xA3A8425E;
  unsigned int v292 = v290 + v291;
  int v293 = v290 & v291;
  int v294 = *(_DWORD *)&v267[4 * (BYTE2(v283) ^ 0xBD)];
  HIDWORD(v270) = v294 ^ 0x27B;
  LODWORD(v270) = v294 ^ 0x26EDC000;
  int v295 = (v292 - 2 * v293) ^ (v270 >> 12);
  int v296 = *(_DWORD *)&v272[4 * (HIBYTE(v279) ^ 0xF9)] ^ (v285 + 28449248 - ((2 * v285) & 0x36433C0));
  int v297 = (v296 + 77802409 - ((2 * v296) & 0x9465752)) ^ *(_DWORD *)&v261[4 * (v283 ^ 0xAB)];
  int v298 = v289 + 28449248 - ((2 * v289) & 0x36433C0);
  unsigned int v299 = *(_DWORD *)&v272[4 * (HIBYTE(v283) ^ 0x42)] ^ v574 ^ *(_DWORD *)&v259[4 * (BYTE1(v281) ^ 0xE2)] ^ ((BYTE1(v281) ^ 0x8F) - 1879546794 - ((2 * ((v281 >> 8) ^ 0x38A18F)) & 0xAC)) ^ (v288 + 28449248 - ((2 * v288) & 0x36433C0));
  LOBYTE(v278) = BYTE1(v282) ^ 0x54;
  unsigned int v300 = v467 ^ *(_DWORD *)&v259[4 * (BYTE1(v282) ^ 0x39)] ^ (v297 - 1879546794 - ((2 * v297) & 0x1FF0C8AC));
  unsigned int v301 = v551 ^ *(_DWORD *)&v272[4 * (HIBYTE(v281) ^ 0x38)] ^ v298;
  unsigned int v302 = HIDWORD(v464) ^ *(_DWORD *)&v261[4 * (v281 ^ 0xA3)] ^ (v295
                                                                               + 77802409
                                                                               - ((2 * v295) & 0x9465752));
  LODWORD(v257) = *(_DWORD *)&v267[4 * (BYTE2(v302) ^ 0x79)];
  HIDWORD(v270) = v257 ^ 0x27B;
  LODWORD(v270) = v257 ^ 0x26EDC000;
  LODWORD(v257) = ((v270 >> 12) + 28449248 - ((2 * (v270 >> 12)) & 0x36433C0)) ^ *(_DWORD *)&v272[4
                                                                                                * (HIBYTE(v301) ^ 0x22)];
  int v303 = ((BYTE1(v302) ^ 0xD0) - 1879546794 - 2 * (((v302 >> 8) ^ 0x679D0) & 0x5F ^ (v302 >> 8) & 9)) ^ *(_DWORD *)&v259[4 * (BYTE1(v302) ^ 0xBD)];
  int v304 = (v303 + 77802409 - ((2 * v303) & 0x9465752)) ^ *(_DWORD *)&v261[4 * (v299 ^ 0x76)];
  int v305 = ((BYTE1(v300) ^ 0xEC) - 1879546794 - 2 * (((v300 >> 8) ^ 0xE5FEC) & 0x57 ^ (v300 >> 8) & 1)) ^ *(_DWORD *)&v259[4 * (BYTE1(v300) ^ 0x81)];
  int v306 = *(_DWORD *)&v267[4 * (BYTE2(v300) ^ 0x5F)];
  HIDWORD(v270) = v306 ^ 0x27B;
  LODWORD(v270) = v306 ^ 0x26EDC000;
  int v307 = v270 >> 12;
  HIDWORD(v270) = *(_DWORD *)&v261[4 * (v301 ^ 0x5E)] ^ 0xEDB40C21;
  LODWORD(v270) = HIDWORD(v270);
  int v308 = (v270 >> 28) ^ __ROR4__( *(_DWORD *)&v272[4 * (HIBYTE(v302) ^ 6)] ^ 0x7462B151 ^ (v305 + 28449248 - ((2 * v305) & 0x36433C0)),  28);
  int v309 = (v307 + 28449248 - ((2 * v307) & 0x36433C0)) ^ *(_DWORD *)&v272[4 * (HIBYTE(v299) ^ 0xD2)];
  int v310 = (v309 + 77802409 - ((2 * v309) & 0x9465752)) ^ *(_DWORD *)&v261[4 * (v302 ^ 0x4C)];
  int v311 = *(_DWORD *)&v267[4 * (BYTE2(v301) ^ 0x1B)];
  HIDWORD(v270) = v311 ^ 0x27B;
  LODWORD(v270) = v311 ^ 0x26EDC000;
  int v312 = v270 >> 12;
  int v313 = v257 + 77802409 - ((2 * v257) & 0x9465752);
  int v314 = BYTE1(v299) ^ 0xC0;
  int v315 = v314 - 1879546794 - 2 * (((v299 >> 8) ^ 0xD2CCC0) & 0x5E ^ (v299 >> 8) & 8);
  LODWORD(v257) = *(_DWORD *)&v267[4 * (BYTE2(v299) ^ 0xCC)];
  HIDWORD(v270) = v257 ^ 0x27B;
  LODWORD(v270) = v257 ^ 0x26EDC000;
  unsigned int v316 = HIDWORD(v422) ^ HIDWORD(v424) ^ (v270 >> 12) ^ __ROR4__(v308 ^ 0x78071371, 4);
  LOBYTE(v308) = v300 ^ v278;
  LODWORD(v257) = v546 ^ *(_DWORD *)&v272[4 * (HIBYTE(v300) ^ 0xE)] ^ v312 ^ (v304 + 28449248 - ((2 * v304) & 0x36433C0));
  unsigned int v317 = HIDWORD(v541) ^ *(_DWORD *)&v259[4 * (BYTE1(v301) ^ 5)] ^ (v310 - 1879546794 - ((2 * v310) & 0x1FF0C8AC));
  unsigned int v318 = v541 ^ v315 ^ *(_DWORD *)&v261[4 * (v308 ^ 0xCA)] ^ *(_DWORD *)&v259[4 * (v314 ^ 0x6D)] ^ v313;
  int v319 = *(_DWORD *)&v267[4 * (BYTE2(v317) ^ 0x52)];
  HIDWORD(v270) = v319 ^ 0x27B;
  LODWORD(v270) = v319 ^ 0x26EDC000;
  int v320 = v270 >> 12;
  int v321 = *(_DWORD *)&v267[4 * (BYTE2(v316) ^ 0xFE)];
  HIDWORD(v270) = v321 ^ 0x27B;
  LODWORD(v270) = v321 ^ 0x26EDC000;
  int v322 = BYTE1(v257);
  unsigned int v323 = (BYTE1(v257) ^ 0x29) - 1879546794 - ((v257 >> 7) & 0xAC);
  int v324 = ((BYTE1(v317) ^ 0x95) - 1879546794 - ((2 * ((v317 >> 8) ^ 0x455295)) & 0xAC)) ^ *(_DWORD *)&v261[4 * (v257 ^ 0x72)] ^ *(_DWORD *)&v259[4 * (BYTE1(v317) ^ 0xF8)] ^ ((v270 >> 12) + 77802409 - ((2 * (v270 >> 12)) & 0x9465752));
  int v325 = *(_DWORD *)&v267[4 * (BYTE2(v318) ^ 2)];
  HIDWORD(v270) = v325 ^ 0x27B;
  LODWORD(v270) = v325 ^ 0x26EDC000;
  int v326 = *(_DWORD *)&v261[4 * ((v317 ^ BYTE1(v301)) ^ 0x54)] ^ *(_DWORD *)&v272[4
                                                                                               * (BYTE3(v257) ^ 0xA7)];
  LODWORD(v257) = *(_DWORD *)&v267[4 * (BYTE2(v257) ^ 0x3B)];
  int v327 = v326 ^ (v270 >> 12) ^ 0x5113249;
  HIDWORD(v270) = v257 ^ 0x27B;
  LODWORD(v270) = v257 ^ 0x26EDC000;
  unsigned int v328 = HIDWORD(v535) ^ ((BYTE1(v318) ^ 0xD9) - 1879546794 - ((2 * ((v318 >> 8) ^ 0x9802D9)) & 0xAC)) ^ *(_DWORD *)&v261[4 * (v316 ^ 0x1E)] ^ *(_DWORD *)&v272[4 * (HIBYTE(v317) ^ 0x61)] ^ *(_DWORD *)&v259[4 * (BYTE1(v318) ^ 0xB4)] ^ (v270 >> 12);
  unsigned int v329 = v535 ^ *(_DWORD *)&v272[4 * (HIBYTE(v318) ^ 0x98)] ^ (v324 + 28449248 - ((2 * v324) & 0x36433C0));
  unsigned int v330 = HIDWORD(v530) ^ *(_DWORD *)&v261[4 * (v318 ^ 0x3D)] ^ *(_DWORD *)&v272[4
                                                                                               * (HIBYTE(v316) ^ 0x99)] ^ v323 ^ *(_DWORD *)&v259[4 * (v322 ^ 0x44)] ^ v320;
  unsigned int v331 = v530 ^ *(_DWORD *)&v259[4 * (BYTE1(v316) ^ 0x8A)] ^ (v327 - 1879546794 - ((2 * v327) & 0x1FF0C8AC));
  int v332 = *(_DWORD *)&v267[4 * (BYTE2(v328) ^ 0x2E)];
  HIDWORD(v270) = v332 ^ 0x27B;
  LODWORD(v270) = v332 ^ 0x26EDC000;
  int v333 = v270 >> 12;
  LODWORD(v257) = *(_DWORD *)&v267[4 * (BYTE2(v330) ^ 0xF9)];
  HIDWORD(v270) = v257 ^ 0x27B;
  LODWORD(v270) = v257 ^ 0x26EDC000;
  LODWORD(v257) = BYTE1(v330) ^ 0xCD;
  int v334 = v257 - 1879546794 - ((2 * ((v330 >> 8) ^ 0xD0F9CD)) & 0xAC);
  int v335 = ((BYTE1(v328) ^ 0xBE) - 1879546794 - 2 * (((v328 >> 8) ^ 0x7E54BE) & 0x57 ^ (v328 >> 8) & 1)) ^ *(_DWORD *)&v259[4 * (BYTE1(v328) ^ 0xD3)] ^ *(_DWORD *)&v261[4 * ((v530 ^ v259[4 * (BYTE1(v316) ^ 0x8A)] ^ (v327 + 86 - ((2 * v327) & 0xAC)) ^ BYTE1(v316)) ^ 0xA6)] ^ ((v270 >> 12) + 77802409 - ((2 * (v270 >> 12)) & 0x9465752));
  int v336 = *(_DWORD *)&v267[4 * (BYTE2(v331) ^ 0x81)];
  HIDWORD(v270) = v336 ^ 0x27B;
  LODWORD(v270) = v336 ^ 0x26EDC000;
  int v337 = ((v270 >> 12) + 28449248 - ((2 * (v270 >> 12)) & 0x36433C0)) ^ *(_DWORD *)&v272[4 * (HIBYTE(v328) ^ 0x7E)];
  int v338 = (v337 + 77802409 - ((2 * v337) & 0x9465752)) ^ *(_DWORD *)&v261[4 * (v330 ^ 0x4C)];
  unsigned int v339 = *(_DWORD *)&v267[4 * (BYTE2(v329) ^ 0xC6)];
  int v340 = ((BYTE1(v331) ^ 0xA0) - 1879546794 - ((v331 >> 7) & 0xAC)) ^ (v333 + 77802409 - ((2 * v333) & 0x9465752)) ^ *(_DWORD *)&v261[4 * (v329 ^ 0xFC)] ^ *(_DWORD *)&v259[4 * (BYTE1(v331) ^ 0xCD)];
  LODWORD(v270) = __ROR4__((v339 >> 12) ^ 0x26FB3FE, 17) ^ 0xEE910136;
  HIDWORD(v270) = v270;
  unsigned int v341 = HIDWORD(v525) ^ *(_DWORD *)&v259[4 * (BYTE1(v329) ^ 0x75)] ^ (v338 - 1879546794 - ((2 * v338) & 0x1FF0C8AC));
  unsigned int v342 = v525 ^ *(_DWORD *)&v272[4 * (HIBYTE(v330) ^ 0xD0)] ^ (v340 + 28449248 - ((2 * v340) & 0x36433C0));
  unsigned int v343 = HIDWORD(v520) ^ *(_DWORD *)&v272[4 * (HIBYTE(v329) ^ 0x5A)] ^ (v335 + 28449248 - ((2 * v335) & 0x36433C0));
  unsigned int v344 = v520 ^ v334 ^ *(_DWORD *)&v261[4 * (v328 ^ 0x22)] ^ *(_DWORD *)&v259[4
                                                                                             * (v257 ^ 0x6D)] ^ *(_DWORD *)&v272[4 * (HIBYTE(v331) ^ 0x68)] ^ ((v270 >> 15) + (v339 << 20));
  int v345 = ((BYTE1(v341) ^ 0x9D) - 1879546794 - ((2 * ((v341 >> 8) ^ 0xC2489D)) & 0xAC)) ^ *(_DWORD *)&v259[4 * (BYTE1(v341) ^ 0xF0)];
  unsigned int v346 = *(_DWORD *)&v267[4 * (BYTE2(v342) ^ 0x8F)];
  int v347 = *(_DWORD *)&v261[4 * (v344 ^ 0xC3)] ^ (v346 << 20) ^ (v346 >> 12) ^ 0x27B26EDC ^ (v345 + 77802409 - ((2 * v345) & 0x9465752));
  LODWORD(v257) = *(_DWORD *)&v267[4 * (BYTE2(v343) ^ 0xB8)];
  HIDWORD(v270) = v257 ^ 0x27B;
  LODWORD(v270) = v257 ^ 0x26EDC000;
  LODWORD(v257) = ((v270 >> 12) + 77802409 - ((2 * (v270 >> 12)) & 0x9465752)) ^ *(_DWORD *)&v261[4
                                                                                                * ((v341 ^ BYTE1(v329)) ^ 0x3F)];
  int v348 = *(_DWORD *)&v267[4 * (BYTE2(v341) ^ 0x48)];
  HIDWORD(v270) = v348 ^ 0x27B;
  LODWORD(v270) = v348 ^ 0x26EDC000;
  int v349 = ((BYTE1(v344) ^ 0x52) - 1879546794 - ((2 * ((v344 >> 8) ^ 0x42A52)) & 0xAC)) ^ *(_DWORD *)&v261[4 * (v343 ^ 0xCC)] ^ *(_DWORD *)&v259[4 * (BYTE1(v344) ^ 0x3F)] ^ ((v270 >> 12) + 77802409 - ((2 * (v270 >> 12)) & 0x9465752));
  int v350 = *(_DWORD *)&v267[4 * (BYTE2(v344) ^ 0x2A)];
  HIDWORD(v270) = v350 ^ 0x27B;
  LODWORD(v270) = v350 ^ 0x26EDC000;
  unsigned int v351 = HIDWORD(v514) ^ ((BYTE1(v343) ^ 0xD7) - 1879546794 - ((2 * ((v343 >> 8) ^ 0xCFB8D7)) & 0xAC)) ^ *(_DWORD *)&v261[4 * (v342 ^ 0x50)] ^ *(_DWORD *)&v259[4 * (BYTE1(v343) ^ 0xBA)] ^ (v270 >> 12) ^ *(_DWORD *)&v272[4 * (HIBYTE(v341) ^ 0xC2)];
  unsigned int v352 = v514 ^ *(_DWORD *)&v272[4 * (HIBYTE(v342) ^ 0xC7)] ^ (v349 + 28449248 - ((2 * v349) & 0x36433C0));
  unsigned int v353 = HIDWORD(v508) ^ *(_DWORD *)&v272[4 * (HIBYTE(v343) ^ 0xCF)] ^ (v347 + 28449248 - ((2 * v347) & 0x36433C0));
  unsigned int v354 = v508 ^ ((BYTE1(v342) ^ 0xD9) - 1879546794 - ((2 * ((v342 >> 8) ^ 0xC78FD9)) & 0xAC)) ^ *(_DWORD *)&v259[4 * (BYTE1(v342) ^ 0xB4)] ^ *(_DWORD *)&v272[4 * (HIBYTE(v344) ^ 4)] ^ (v257 + 28449248 - ((2 * v257) & 0x36433C0));
  int v355 = *(_DWORD *)&v267[4 * (BYTE2(v352) ^ 0xE6)];
  HIDWORD(v270) = v355 ^ 0x27B;
  LODWORD(v270) = v355 ^ 0x26EDC000;
  int v356 = v270 >> 12;
  int v357 = ((BYTE1(v354) ^ 0xCC) - 1879546794 - 2 * (((v354 >> 8) ^ 0x33C8CC) & 0x57 ^ (v354 >> 8) & 1)) ^ *(_DWORD *)&v259[4 * (BYTE1(v354) ^ 0xA1)];
  int v358 = *(_DWORD *)&v267[4 * (BYTE2(v353) ^ 0x1C)];
  HIDWORD(v270) = v358 ^ 0x27B;
  LODWORD(v270) = v358 ^ 0x26EDC000;
  int v359 = (v270 >> 12) ^ *(_DWORD *)&v259[4 * (BYTE1(v352) ^ 0xD9)] ^ ((BYTE1(v352) ^ 0xB4)
                                                                    - 1879546794
                                                                    - ((2 * ((v352 >> 8) ^ 0x4FE6B4)) & 0xAC));
  int v360 = (v359 + 77802409 - ((2 * v359) & 0x9465752)) ^ *(_DWORD *)&v261[4 * (v351 ^ 0xA3)];
  LODWORD(v257) = (v357 + 77802409 - ((2 * v357) & 0x9465752)) ^ *(_DWORD *)&v261[4 * (v353 ^ 0x3A)];
  HIDWORD(v270) = *(_DWORD *)&v261[4 * (v352 ^ 0x96)] ^ 0x4A32BA9;
  LODWORD(v270) = *(_DWORD *)&v261[4 * (v352 ^ 0x96)];
  int v361 = *(_DWORD *)&v261[4 * (v354 ^ 0xA2)] ^ ((BYTE1(v351) ^ 0x26)
                                                               - 1879546794
                                                               - ((2 * ((v351 >> 8) ^ 0x1C2226)) & 0xAC)) ^ *(_DWORD *)&v259[4 * (BYTE1(v351) ^ 0x4B)] ^ (v356 + 77802409 - ((2 * v356) & 0x9465752));
  HIDWORD(v270) = (v270 >> 29) ^ 0x6615DA09;
  LODWORD(v270) = HIDWORD(v270);
  int v362 = (v270 >> 3) - 1879546794 - ((2 * (v270 >> 3)) & 0x1FF0C8AC);
  int v363 = *(_DWORD *)&v267[4 * (BYTE2(v351) ^ 0x22)];
  HIDWORD(v270) = v363 ^ 0x27B;
  LODWORD(v270) = v363 ^ 0x26EDC000;
  int v364 = v270 >> 12;
  int v365 = *(_DWORD *)&v267[4 * (BYTE2(v354) ^ 0xC8)];
  HIDWORD(v270) = v365 ^ 0x27B;
  LODWORD(v270) = v365 ^ 0x26EDC000;
  unsigned int v366 = HIDWORD(v502) ^ *(_DWORD *)&v272[4 * (HIBYTE(v354) ^ 0x17)] ^ (v360 + 28449248 - ((2 * v360) & 0x36433C0));
  int v367 = v362 ^ *(_DWORD *)&v259[4 * (BYTE1(v353) ^ 0xD1)] ^ (v270 >> 12);
  unsigned int v368 = v502 ^ *(_DWORD *)&v272[4 * (HIBYTE(v352) ^ 0x4F)] ^ v364 ^ (v257 + 28449248 - ((2 * v257) & 0x36433C0));
  unsigned int v369 = HIDWORD(v497) ^ *(_DWORD *)&v272[4 * (HIBYTE(v353) ^ 0x1B)] ^ (v361 + 28449248 - ((2 * v361) & 0x36433C0));
  LODWORD(v257) = *(_DWORD *)&v267[4 * (BYTE2(v369) ^ 0x7E)];
  HIDWORD(v270) = v257 ^ 0x27B;
  LODWORD(v270) = v257 ^ 0x26EDC000;
  int v370 = v270 >> 12;
  LODWORD(v257) = *(_DWORD *)&v267[4 * (BYTE2(v368) ^ 1)];
  HIDWORD(v270) = v257 ^ 0x27B;
  LODWORD(v270) = v257 ^ 0x26EDC000;
  LODWORD(v257) = *(_DWORD *)&v272[4 * (HIBYTE(v351) ^ 0x38)] ^ v573 ^ (v367 + 28449248 - ((2 * v367) & 0x36433C0));
  int v371 = ((v270 >> 12) + 77802409 - ((2 * (v270 >> 12)) & 0x9465752)) ^ *(_DWORD *)&v261[4
                                                                                       * (v366 ^ 0xC6)];
  int v372 = ((BYTE1(v366) ^ 0x71) - 1879546794 - ((2 * ((v366 >> 8) ^ 0xF25B71)) & 0xAC)) ^ *(_DWORD *)&v259[4 * (BYTE1(v366) ^ 0x1C)];
  int v373 = (v372 + 28449248 - ((2 * v372) & 0x36433C0)) ^ *(_DWORD *)&v272[4 * (HIBYTE(v368) ^ 0x1F)];
  int v374 = *(_DWORD *)&v267[4 * (BYTE2(v366) ^ 0x5B)];
  HIDWORD(v270) = v374 ^ 0x27B;
  LODWORD(v270) = v374 ^ 0x26EDC000;
  int v375 = v270 >> 12;
  int v376 = *(_DWORD *)&v267[4 * (BYTE2(v257) ^ 0xF4)];
  HIDWORD(v270) = v376 ^ 0x27B;
  LODWORD(v270) = v376 ^ 0x26EDC000;
  int v377 = v270 >> 12;
  HIDWORD(v270) = v370 ^ ((BYTE1(v368) ^ 0x81) - 1879546794 - ((v368 >> 7) & 0xAC)) ^ 0xD678EAEF ^ *(_DWORD *)&v259[4 * (BYTE1(v368) ^ 0xEC)];
  LODWORD(v270) = HIDWORD(v270);
  LODWORD(v270) = (v270 >> 11) ^ __ROR4__(*(_DWORD *)&v272[4 * (HIBYTE(v366) ^ 0xF2)] ^ 0xA3A8425E, 11) ^ 0xD490839A;
  HIDWORD(v270) = v270;
  unsigned int v378 = HIDWORD(v423) ^ v426 ^ *(_DWORD *)&v261[4 * (v368 ^ 0xB8)] ^ ((BYTE1(v369) ^ 0xAA)
                                                                                      - 1879546794
                                                                                      - ((2 * ((v369 >> 8) ^ 0x967EAA)) & 0xAC)) ^ *(_DWORD *)&v272[4 * (BYTE3(v257) ^ 0x57)] ^ *(_DWORD *)&v259[4 * (BYTE1(v369) ^ 0xC7)] ^ v375;
  LOBYTE(v375) = v257 ^ BYTE1(v353);
  unsigned int v379 = HIDWORD(v491) ^ *(_DWORD *)&v272[4 * (HIBYTE(v369) ^ 0x96)] ^ ((BYTE1(v257) ^ 0xE0)
                                                                      - 1879546794
                                                                      - 2
                                                                      * (((v257 >> 8) ^ 0x73F4E0) & 0x57 ^ (v257 >> 8) & 1)) ^ *(_DWORD *)&v259[4 * (BYTE1(v257) ^ 0x8D)] ^ (v371 + 28449248 - ((2 * v371) & 0x36433C0));
  unsigned int v380 = v491 ^ *(_DWORD *)&v261[4 * (v369 ^ 0x88)] ^ v377 ^ (v373 + 77802409 - ((2 * v373) & 0x9465752));
  LODWORD(v257) = HIDWORD(v485) ^ *(_DWORD *)&v261[4 * (v375 ^ 0xAF)] ^ ((v270 >> 21)
                                                                                        + 77802409
                                                                                        - ((2 * (v270 >> 21)) & 0x9465752));
  int v381 = *(_DWORD *)&v267[4 * (BYTE2(v378) ^ 0xFA)];
  HIDWORD(v270) = v381 ^ 0x27B;
  LODWORD(v270) = v381 ^ 0x26EDC000;
  int v382 = v270 >> 12;
  int v383 = *(_DWORD *)&v259[4 * (BYTE1(v379) ^ 0x96)] ^ ((BYTE1(v379) ^ 0xFB)
                                                     - 1879546794
                                                     - ((2 * ((v379 >> 8) ^ 0x3EA2FB)) & 0xAC));
  int v384 = (v383 + 77802409 - ((2 * v383) & 0x9465752)) ^ *(_DWORD *)&v261[4 * (v380 ^ 0x75)];
  int v385 = *(_DWORD *)&v267[4 * (BYTE2(v379) ^ 0xA2)];
  HIDWORD(v270) = v385 ^ 0x27B;
  LODWORD(v270) = v385 ^ 0x26EDC000;
  int v386 = ((BYTE1(v380) ^ 0xF0) - 1879546794 - 2 * (((v380 >> 8) ^ 0xB54AF0) & 0x5E ^ (v380 >> 8) & 8)) ^ (v270 >> 12) ^ *(_DWORD *)&v259[4 * (BYTE1(v380) ^ 0x9D)];
  int v387 = (v386 + 28449248 - ((2 * v386) & 0x36433C0)) ^ *(_DWORD *)&v272[4 * (BYTE3(v257) ^ 0xED)];
  int v388 = *(_DWORD *)&v272[4 * (HIBYTE(v380) ^ 0x91)];
  int v389 = *(_DWORD *)&v272[4 * (HIBYTE(v379) ^ 0x3E)];
  LODWORD(v272) = *(_DWORD *)&v272[4 * (HIBYTE(v378) ^ 0xC2)];
  int v390 = BYTE1(v257) ^ 0x1D;
  unsigned int v391 = v390 - 1879546794 - ((2 * ((v257 >> 8) ^ 0xC9AF1D)) & 0xAC);
  int v392 = *(_DWORD *)&v261[4 * (v257 ^ 0x8F)];
  int v393 = *(_DWORD *)&v261[4 * (v378 ^ 0x26)];
  LODWORD(v257) = *(_DWORD *)&v267[4 * (BYTE2(v257) ^ 0xAF)];
  LODWORD(v267) = *(_DWORD *)&v267[4 * (BYTE2(v380) ^ 0x4A)];
  HIDWORD(v270) = v267 ^ 0x27B;
  LODWORD(v270) = v267 ^ 0x26EDC000;
  int v394 = *(_DWORD *)&v259[4 * (BYTE1(v378) ^ 0x9F)];
  LODWORD(v259) = v485 ^ *(_DWORD *)&v261[4 * (v379 ^ 0x9A)] ^ v382 ^ v388 ^ v391 ^ *(_DWORD *)&v259[4 * (v390 ^ 0x6D)];
  LODWORD(v261) = HIDWORD(v480) ^ ((BYTE1(v378) ^ 0xF2)
                                 - 1879546794
                                 - 2 * (((v378 >> 8) ^ 0xC2FAF2) & 0x57 ^ (v378 >> 8) & 1)) ^ v389 ^ v394 ^ v392 ^ (v270 >> 12);
  unsigned int v395 = v480 ^ v393 ^ (v387 + 77802409 - ((2 * v387) & 0x9465752));
  unsigned int v396 = HIDWORD(v474) ^ v272 ^ (v257 >> 12) ^ ((_DWORD)v257 << 20) ^ (v384
                                                                                                 + 28449248
                                                                                                 - ((2 * v384) & 0x36433C0));
  int v397 = *(_DWORD *)(v54 - 128);
  uint64_t v398 = (uint64_t)*(&off_10005BF10 + v397 - 890);
  uint64_t v399 = (uint64_t)*(&off_10005BF10 + SHIDWORD(v459));
  LODWORD(v267) = *(_DWORD *)(v399 + 4LL * ((v480 ^ v393 ^ (v387 - 87 - ((2 * v387) & 0x52))) ^ 7u)) ^ *(_DWORD *)(v398 + 4LL * (BYTE1(v396) ^ 0x4Du)) ^ 0x9AE7ACDF;
  int v400 = (_DWORD)v267 + 159488450 - ((2 * (_DWORD)v267) & 0x13033384);
  LODWORD(v267) = *(_DWORD *)(v398 + 4LL * (BYTE1(v259) ^ 0x43u));
  int v401 = *(_DWORD *)(v398 + 4LL * ((unsigned __int16)(v395 ^ 0x6F07) >> 8));
  int v402 = *(_DWORD *)(v398 + 4LL * (BYTE1(v261) ^ 0x63u));
  uint64_t v403 = (uint64_t)*(&off_10005BF10 + v397 - 930);
  LODWORD(v398) = *(_DWORD *)(v403 + 4LL * (HIBYTE(v395) ^ 0xEF));
  int v404 = *(_DWORD *)(v403 + 4LL * (HIBYTE(v396) ^ 0xBA));
  int v405 = *(_DWORD *)(v403 + 4LL * ((v261 >> 24) ^ 0x16)) ^ v400;
  LODWORD(v403) = *(_DWORD *)(v403 + 4LL * ((v259 >> 24) ^ 0x34));
  uint64_t v406 = (uint64_t)*(&off_10005BF10 + (int)v459);
  LODWORD(v272) = *(_DWORD *)(v406 + 4LL * (BYTE2(v396) ^ 0xEu));
  int v407 = *(_DWORD *)(v406 + 4LL * (BYTE2(v395) ^ 0x2Au));
  uint64_t v408 = *(unsigned int *)(v406 + 4LL * (BYTE2(v261) ^ 0x42u));
  int v409 = *(_DWORD *)(v406 + 4LL * (BYTE2(v259) ^ 0x9Au)) ^ (v405 - 1712652442 - ((2 * v405) & 0x33D5FECC));
  int v410 = *(_DWORD *)(v399 + 4LL * (v259 ^ 0x95u));
  LODWORD(v261) = *(_DWORD *)(v399 + 4LL * (v261 ^ 0xA5u));
  int v411 = *(_DWORD *)(v399 + 4LL * (v396 ^ 7u));
  uint64_t v412 = *(_DWORD *)(v54 - 144) ^ HIDWORD(v569) ^ (v409 - ((2 * v409) & 0x76411E14u) - 1155494134);
  v413 = (char *)*(&off_10005BF10 + v397 - 910) - 12;
  *(_BYTE *)(*(void *)(v54 - 120) + 8LL) = v413[BYTE3(v412) ^ 0xD7LL] ^ 8;
  LODWORD(v403) = ((v272 ^ 0x87FA384C ^ v401)
                 + 159488450
                 - ((2 * (v272 ^ 0x87FA384C ^ v401)) & 0x13033384)) ^ v403;
  LODWORD(v403) = (v403 - 2064159755 - ((2 * v403) & 0x9EED7EA)) ^ v261;
  LODWORD(v403) = *(_DWORD *)(v54 - 140) ^ v570 ^ (v403 - ((2 * v403) & 0x19B69F54) - 1931784278);
  v414 = (char *)*(&off_10005BF10 + v397 - 901) - 8;
  *(_BYTE *)(*(void *)(v54 - 120) + *(void *)(v54 - 232)) = (v414[v403 ^ 0xC7LL] - 80) ^ 0x5F;
  v415 = (char *)*(&off_10005BF10 + SHIDWORD(a20)) - 8;
  LODWORD(v399) = v415[BYTE1(v403) ^ 0x13LL];
  HIDWORD(v270) = v399 ^ 0x30;
  LODWORD(v270) = ~(_DWORD)v399 << 24;
  *(_BYTE *)(*(void *)(v54 - 120) + 6LL) = (v270 >> 30) ^ 0x40;
  LODWORD(v399) = ((v407 ^ v410 ^ 0x1D1D9493)
                 + 159488450
                 - 2 * ((v407 ^ v410 ^ 0x1D1D9493) & 0x98199C6 ^ (v407 ^ v410) & 4)) ^ v404;
  LODWORD(v399) = (v399 - ((2 * v399) & 0x3C218E54) + 504416042) ^ v402;
  uint64_t v416 = *(_DWORD *)(v54 - 136) ^ v571 ^ ((_DWORD)v399 - ((2 * (_DWORD)v399) & 0x86E139FC) + 1131453694);
  LODWORD(v399) = v415[(unsigned __int16)(*(_WORD *)(v54 - 136) ^ v571 ^ (v399
                                                                                         - ((2 * v399) & 0x39FC)
                                                                                         - 25346)) >> 8];
  HIDWORD(v270) = v399 ^ 0x30;
  LODWORD(v270) = ~(_DWORD)v399 << 24;
  *(_BYTE *)(*(void *)(v54 - 120) + *(void *)(v54 - 224)) = (v270 >> 30) ^ 0x7E;
  uint64_t v417 = (uint64_t)*(&off_10005BF10 + v397 - 999);
  *(_BYTE *)(*(void *)(v54 - 120) + 9LL) = *(_BYTE *)(v417 + (BYTE2(v412) ^ 0xFBLL)) ^ 0x3B;
  LODWORD(v267) = ((v267 ^ 0x17915EE8 ^ v398)
                 - 1712652442
                 - ((2 * (v267 ^ 0x17915EE8 ^ v398)) & 0x33D5FECC)) ^ v408;
  LODWORD(v267) = v411 ^ ((_DWORD)v267 - 2064159755 - ((2 * (_DWORD)v267) & 0x9EED7EA));
  LODWORD(v267) = *(_DWORD *)(v54 - 132) ^ HIDWORD(v570) ^ ((_DWORD)v267 - ((2 * (_DWORD)v267) & 0x1A60E78C) - 1926204474);
  *(_BYTE *)(*(void *)(v54 - 120) + *(void *)(v54 - 184)) = *(_BYTE *)(v417 + (BYTE2(v267) ^ 0xB8LL)) ^ 0xE8;
  *(_BYTE *)(*(void *)(v54 - 120) + *(void *)(v54 - 256)) = (v414[v412 ^ 0x1BLL] - 80) ^ 0x7D;
  *(_BYTE *)(*(void *)(v54 - 120) + *(void *)(v54 - 248)) = *(_BYTE *)(v417 + (BYTE2(v403) ^ 3LL)) ^ 0x96;
  uint64_t v418 = *(void *)(v54 - 120);
  *(_BYTE *)(v418 + *(void *)(v54 - 192)) = v413[BYTE3(v403) ^ 0x6DLL] ^ 0xF0;
  LODWORD(v398) = v415[BYTE1(v412) ^ 0x92LL];
  HIDWORD(v270) = v398 ^ 0x30;
  LODWORD(v270) = ~(_DWORD)v398 << 24;
  *(_BYTE *)(v418 + *(void *)(v54 - 168)) = (v270 >> 30) ^ 0xD2;
  uint64_t v419 = *(void *)(v54 - 216);
  *(_BYTE *)(v418 + v419) = v413[BYTE3(v416) ^ 0x53LL] ^ 0x1C;
  *(_BYTE *)(v418 + *(void *)(v54 - 200)) = (v414[v416 ^ 0x95LL] - 80) ^ 0xAF;
  *(_BYTE *)(v418 + *(void *)(v54 - 240)) = (v414[v267 ^ 0x64LL] - 80) ^ 0x27;
  *(_BYTE *)(v418 + *(void *)(v54 - 176)) = v413[(v267 >> 24) ^ 0x6ELL] ^ 0x8A;
  LODWORD(v267) = v415[BYTE1(v267) ^ 0x1FLL];
  HIDWORD(v270) = v267 ^ 0x30;
  LODWORD(v270) = ~(_DWORD)v267 << 24;
  *(_BYTE *)(v418 + *(void *)(v54 - 208)) = (v270 >> 30) ^ 0x58;
  *(_BYTE *)(v418 + *(void *)(v54 - 160)) = *(_BYTE *)(v417 + (BYTE2(v416) ^ 0xC8LL)) ^ 0xB9;
  uint64_t v420 = (_DWORD)v419 + 278292720 - 2 * ((v419 + 16) & *(_DWORD *)(v54 - 148));
  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t (**)(int, int, int, int, int, int, int, int, uint64_t, uint64_t), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a50 + 8LL * ((1261 * ((v420 ^ 0x109668E0) < v474)) ^ (v397 - 661))) - 12LL))( v415,  v408,  v420,  v416,  v412,  v414,  &off_10005BF10,  159488450LL,  a2,  v422,  v423,  v424,  v425,  v426,  v427,  v428,  v431,  v434,  v437,  v440,  v442,  v446,  v450,  v452,  a18,  a19,  a20,  v459,  v464,  v467,  v474,  v480,  v485,  v491,  v497,  v502,  v508,  v514,  v520,  v525,  v530,  v535,  v541,  v546,  v551,  v556,  v560,  v562,  v565,
           v567,
           a44,
           v568,
           v569,
           v570);
}

void sub_1000404E0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,int a58,int a59,int a60,int a61)
{
  *(_DWORD *)(v61 - 132) = a58 ^ 0x560228EA;
  *(_DWORD *)(v61 - 144) = a60 ^ 0x79EEA5;
  *(_DWORD *)(v61 - 136) = a61 ^ 0x37665506;
  *(_DWORD *)(v61 - 140) = a59 ^ 0x7587D0B6;
  JUMPOUT(0x10003E740LL);
}

uint64_t sub_100040534( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, int a25, int a26, uint64_t a27, int a28)
{
  return ((uint64_t (*)(void))(*(void *)(v29
                                        + 8LL
                                        * (v28 ^ (30
                                                * (((2 * (a28 - ((2 * a26) & 0x4EF67CDA) + 1685708975)) & 0xFDFBEFDC ^ 0x4CF26CD8)
                                                 + ((a28 - ((2 * a26) & 0x4EF67CDA) + 1685708975) ^ 0x5986C983)
                                                 + 1469233748 != 1452323394))))
                            - 12LL))();
}

uint64_t sub_1000405FC(int a1)
{
  return (*(uint64_t (**)(void))(v3
                              + 8LL
                              * ((1837 * (a1 + v2 + ((9 * ((v1 + 1025134038) & 0xC2E5B2FF ^ 0x248)) ^ 0x1020C2A) > 7)) ^ v1)))();
}

uint64_t sub_100040688(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  BOOL v8 = a2 + (a5 ^ 0x30Au) + a7 + 958 >= (((a5 + 488) | 0x20) ^ 0xFFFFFBC8);
  return ((uint64_t (*)(void))(*(void *)(v7 + 8LL * ((v8 | (8 * v8)) ^ a5)) - 12LL))();
}

uint64_t sub_1000406CC@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, unint64_t a4@<X8>)
{
  uint64_t v9 = a1 + v7 + (((a3 + 710) | 0x108) ^ (a2 + 2576));
  unint64_t v10 = v9 + a4 + 1;
  uint64_t v11 = ((_BYTE)a1 + (_BYTE)v7 + (((a3 - 58) | 8) ^ (a2 + 16))) & 0xF;
  uint64_t v12 = v11 - v9;
  unint64_t v13 = v4 + v12;
  ++v11;
  unint64_t v14 = v4 + v11;
  unint64_t v15 = v6 + v12;
  unint64_t v16 = v6 + v11;
  unint64_t v17 = v5 + v12;
  unint64_t v18 = v5 + v11;
  BOOL v20 = v14 > a4 && v13 < v10;
  if (v16 > a4 && v15 < v10) {
    BOOL v20 = 1;
  }
  int v23 = v18 > a4 && v17 < v10 || v20;
  return (*(uint64_t (**)(void))(v8 + 8LL * (((32 * v23) | (v23 << 6)) ^ a3)))();
}

uint64_t sub_100040754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return ((uint64_t (*)(uint64_t, uint64_t, void))(*(void *)(v6
                                                                       + 8LL
                                                                       * (int)(((((a5 + 485815903) & 0xE30B06DB) - 533)
                                                                              * (v5 > 0xF)) ^ a5))
                                                           - 8LL))( a1,  a2,  0LL);
}

uint64_t sub_100040790@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W4>, uint64_t a4@<X8>)
{
  int v11 = a3 - 275;
  v19.val[1].i64[0] = ((_BYTE)v7 - 1) & 0xF;
  v19.val[1].i64[1] = ((_BYTE)v7 + 14) & 0xF;
  v19.val[2].i64[0] = ((_BYTE)v7 + 13) & 0xF;
  v19.val[2].i64[1] = ((_BYTE)v7 + 12) & 0xF;
  v19.val[3].i64[0] = ((_BYTE)v7 + 11) & 0xF;
  v19.val[3].i64[1] = ((_BYTE)v7 + 10) & 0xF;
  v20.val[0].i64[0] = ((_BYTE)v7 + 9) & 0xF;
  v20.val[0].i64[1] = ((_BYTE)v7 + 8) & 0xF;
  v20.val[1].i64[0] = ((_BYTE)v7 + 7) & 0xF;
  v20.val[1].i64[1] = (v7 + 6) & 0xF;
  v20.val[2].i64[0] = (v7 + 5) & 0xF;
  v20.val[2].i64[1] = (v7 + 4) & 0xF;
  v20.val[3].i64[0] = ((_BYTE)v7 + 3) & 0xF;
  v20.val[3].i64[1] = ((_BYTE)v7 + 2) & 0xF;
  unsigned int v12 = a1 + v9 + a3 + a2;
  v13.i64[0] = 0x505050505050505LL;
  v13.i64[1] = 0x505050505050505LL;
  v14.i64[0] = 0x6A6A6A6A6A6A6A6ALL;
  v14.i64[1] = 0x6A6A6A6A6A6A6A6ALL;
  v19.val[0].i64[0] = v12 & 0xF;
  v19.val[0].i64[1] = v7 & 0xF;
  v15.i64[0] = vqtbl4q_s8(v19, (int8x16_t)xmmword_100047760).u64[0];
  v15.i64[1] = vqtbl4q_s8(v20, (int8x16_t)xmmword_100047760).u64[0];
  int8x16_t v16 = vrev64q_s8( veorq_s8( veorq_s8(*(int8x16_t *)(a4 - 15 + v12), *(int8x16_t *)(v4 + v19.val[0].i64[0] - 15)),  veorq_s8(*(int8x16_t *)(v6 + v19.val[0].i64[0] - 15), *(int8x16_t *)(v5 + v19.val[0].i64[0] - 15))));
  int8x16_t v17 = vrev64q_s8(veorq_s8(veorq_s8(vextq_s8(v16, v16, 8uLL), v14), vmulq_s8(v15, v13)));
  *(int8x16_t *)(a4 - 15 + v12) = vextq_s8(v17, v17, 8uLL);
  return ((uint64_t (*)(void))(*(void *)(v10 + 8LL * ((1689 * ((v8 & 0xFFFFFFF0) == 16)) ^ v11)) - 8LL))();
}

void sub_1000408EC()
{
}

uint64_t sub_1000408F8(uint64_t a1, uint64_t a2, int a3, int a4)
{
  return ((uint64_t (*)(void))(*(void *)(v5 + 8LL * ((((2 * (a4 + 288)) ^ 0xA14) * (v4 == a3)) ^ (a4 + 288))) - 4LL))();
}

uint64_t sub_100040924(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void))(*(void *)(v6
                                                                                + 8LL
                                                                                * ((265
                                                                                  * ((a4 ^ 0x69 ^ (((((a4 ^ 0x81A) + 520) ^ 0x430) & v5) == 0)) & 1)) ^ a4 ^ 0x81A))
                                                                    - 12LL))( a1,  a2,  a3,  (v4 - a3));
}

uint64_t sub_10004096C@<X0>( int a1@<W0>, int a2@<W1>, int a3@<W2>, int a4@<W6>, uint64_t a5@<X8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54)
{
  *(_DWORD *)(v61 - 120) = v62;
  int v63 = (a4 - 587) & v58;
  int v64 = -a3;
  *(_DWORD *)(v61 - 132) = v63;
  *(_DWORD *)(v61 - 128) = v58;
  char v65 = a1 + v60 + v59;
  uint64_t v66 = (v64 + a2 + a1 + v60 + 1288);
  v68.val[0].i64[0] = ((_BYTE)v64 + (_BYTE)a2 + (_BYTE)a1 + (_BYTE)v60 + 8) & 0xF;
  v68.val[0].i64[1] = ((_BYTE)v64 + v57) & 0xF;
  v68.val[1].i64[0] = ((_BYTE)v64 + v65 + 91) & 0xF;
  v68.val[1].i64[1] = ((_BYTE)v64 + v65 + (((_BYTE)a4 - 104) & 0x7E)) & 0xF;
  v68.val[2].i64[0] = ((_BYTE)v64 + v65 + 89) & 0xF;
  v68.val[2].i64[1] = ((_BYTE)v64 + v65 + 88) & 0xF;
  v68.val[3].i64[0] = ((_BYTE)v64 + v65 + 87) & 0xF;
  v68.val[3].i64[1] = ((_BYTE)v64 + v65 + 86) & 0xF;
  *(int8x8_t *)(a5 - 7 + v66) = vrev64_s8( veor_s8( veor_s8( vrev64_s8( veor_s8( veor_s8(*(int8x8_t *)(a5 - 7 + v66), *(int8x8_t *)(v54 + (v66 & 0xF) - 7)),  veor_s8( *(int8x8_t *)(v56 + (v66 & 0xF) - 7),  *(int8x8_t *)(v55 + (v66 & 0xF) - 7)))),  (int8x8_t)0x6A6A6A6A6A6A6A6ALL),  vmul_s8( (int8x8_t)*(_OWORD *)&vqtbl4q_s8(v68, (int8x16_t)xmmword_100047770),  (int8x8_t)0x505050505050505LL)));
  return ((uint64_t (*)(__n128))(*(void *)(a54 + 8LL * ((951 * (v64 != 8 - v63)) ^ (a4 - 79))) - 12LL))((__n128)xmmword_100047770);
}

void sub_100040AB8()
{
}

uint64_t sub_100040AE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v6
                                                                                        + 8LL
                                                                                        * (((v5 ^ 0x231)
                                                                                          * (*(_DWORD *)(v7 - 128) == *(_DWORD *)(v7 - 132))) ^ v5)))( a1,  a2,  a3,  a4,  a5,  v5 ^ 0x562u);
}

uint64_t sub_100040B10@<X0>(int a1@<W3>, int a2@<W5>, uint64_t a3@<X8>)
{
  uint64_t v8 = (a1 - 1452323727);
  *(_BYTE *)(a3 + v8) ^= *(_BYTE *)(v4 + (v8 & 0xF)) ^ *(_BYTE *)(v6 + (v8 & 0xF)) ^ *(_BYTE *)(v5 + (v8 & 0xF)) ^ (5 * (v8 & 0xF)) ^ 0x6A;
  return (*(uint64_t (**)(void))(v7 + 8LL * ((981 * (a1 - 1 == v3)) ^ (a2 - 596))))();
}

void sub_100040B74()
{
  if (v0 == 760636964) {
    int v1 = 777158354;
  }
  else {
    int v1 = -777181942;
  }
  *(_DWORD *)(v2 + 40) = v1;
}

void sub_100040BD8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) - 628203409 * ((a1 - 1763701788 - 2 * (a1 & 0x96E00BE4)) ^ 0x146807D7);
  uint64_t v2 = *(void *)(a1 + 24);
  if (*(_DWORD *)(v2 - 0x621D43C813E5057ELL) - 2086149949 >= 0) {
    unsigned int v4 = *(_DWORD *)(v2 - 0x621D43C813E5057ELL) - 2086149949;
  }
  else {
    unsigned int v4 = 2086149949 - *(_DWORD *)(v2 - 0x621D43C813E5057ELL);
  }
  uint64_t v3 = *(void *)a1;
  if (*(_DWORD *)(*(void *)a1 - 0x621D43C813E5057ELL) - 2086149949 >= 0) {
    unsigned int v5 = *(_DWORD *)(v3 - 0x621D43C813E5057ELL) - 2086149949;
  }
  else {
    unsigned int v5 = 2086149949 - *(_DWORD *)(v3 - 0x621D43C813E5057ELL);
  }
  unsigned int v8 = v1 - 1759421093 * ((2 * (&v7 & 0x1EE2A9C8) - &v7 + 1629312561) ^ 0xD260E665) + 491;
  uint64_t v7 = v2;
  sub_1000069B0((uint64_t)&v7);
  if (v4 >= v5) {
    unsigned int v6 = v5;
  }
  else {
    unsigned int v6 = v4;
  }
  __asm { BR              X13 }

uint64_t sub_100040D64@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  int v11 = v3 - 1465885175;
  uint64_t v12 = 4LL * (v9 + v4);
  int v13 = v7
      + 1712105611
      + (*(_DWORD *)(*(void *)(v6 - 0x621D43C813E5057ALL) + v12) ^ v8)
      + (*(_DWORD *)(*(void *)(a2 - 0x621D43C813E5057ALL) + v12) ^ v8);
  *(_DWORD *)(*(void *)(a1 - 0x621D43C813E5057ALL) + v12) = v13
                                                            + v8
                                                            - ((v13 << ((((((v10 + 113) | 0xB0) - 23) & 0xF5) + 32) ^ 0xB4)) & v5);
  BOOL v15 = v9 + 1430082688 > 681598472 || v9 + 1430082688 < v11;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(*(void *)(v2 + 8LL * (int)((803 * v15) ^ (((v10 + 369) | 0x1B0) + 1744912617) & 0x97FEBBF5))
                                                                                                - 4LL))( 1204LL,  0x6DB2DF7FFEFDA9ABLL,  0x1FDFB5356LL,  0xF26F76DA670EFEE0LL,  1430082688LL,  681598472LL);
}

uint64_t sub_100040E90()
{
  BOOL v4 = v2 + 224233905 < (int)(v3 + 1623233339);
  if (v2 + 224233905 < -524250309 != v3 > (((v1 - 1076) | 0x14) ^ 0x1F3F6C51u)) {
    BOOL v4 = v3 > (((v1 - 1076) | 0x14) ^ 0x1F3F6C51u);
  }
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((v4 * (((v1 - 434) | 0x80) ^ 0x291)) ^ v1)) - 12LL))();
}

uint64_t sub_100040F10@<X0>(unsigned int a1@<W0>, uint64_t a2@<X8>)
{
  BOOL v15 = v14 > a1;
  uint64_t v16 = 4LL * (v13 + v8);
  int v17 = v3 + v11 + (v6 ^ 0x316 ^ (v12 + 899) ^ *(_DWORD *)(*(void *)(v10 - 0x621D43C813E5057ALL) + v16));
  *(_DWORD *)(*(void *)(a2 - 0x621D43C813E5057ALL) + v16) = v17 + v12 - (v9 & (2 * v17));
  int v18 = v13 + 1 + v5;
  LODWORD(v16) = v15 ^ (v18 < v4);
  BOOL v19 = v18 < v7;
  if (!(_DWORD)v16) {
    BOOL v15 = v19;
  }
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((1224 * !v15) ^ (v6 - 24))) - 12LL))();
}

uint64_t sub_100040FF0()
{
  int v4 = (v1 ^ 0x249) + v2 - 1851438879;
  BOOL v6 = v4 <= 1695044660 && v4 >= (int)((v1 ^ 0xE50857B6) + v3);
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((43 * v6) ^ v1)) - 8LL))();
}

uint64_t sub_100041044()
{
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * (((v1 != 0x6022565A660CA88BLL) * (v2 + 134)) ^ v2)) - 12LL))();
}

void sub_100041074(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(a1 - 0x621D43C813E5057ALL) + 4LL * ((v3 ^ (v4 + 326)) + v6)) = v2
                                                                                       - ((2 * v2 + 870756074) & v5)
                                                                                       + 1495077761;
  *(_DWORD *)(a1 - 0x621D43C813E5057ELL) = (((v6 + 1 + v4) * (v1 - 227848401)) ^ 0x7F5A3FBD)
                                         - 50471040
                                         + ((2 * (v6 + 1 + v4) * (v1 - 227848401)) & 0xFEB47F7A);
}

void sub_10004121C(uint64_t a1)
{
  int v1 = 1225351577 * (((a1 | 0x24F55ED3) - a1 + (a1 & 0xDB0AA12C)) ^ 0x5A0AC4E1);
  int v2 = *(_DWORD *)(a1 + 24) ^ v1;
  int v3 = (*(_BYTE *)(a1 + 28) ^ v1);
  ((void (*)(void, void (*)()))*(&off_10005BF10 + v2 - 1357))(*(&off_10005BF10 + v2 - 1426), sub_100045BB0);
  uint64_t v4 = *(void *)((char *)*(&off_10005BF10 + (v2 ^ 0x676)) - 4);
  int v6 = v2
  uint64_t v5 = v4;
  sub_100028D04((uint64_t)&v5);
  __asm { BR              X8 }

uint64_t sub_100041344( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned int a16, char a17)
{
  a16 = (v18 - 860) ^ ((((&a16 ^ 0xD379E85A | 0xE551A89D)
                       - (&a16 ^ 0xD379E85A)
  a17 = (((&a16 ^ 0x5A | 0x9D)
        - (&a16 ^ 0x5A)
        + ((&a16 ^ 0x5A) & 0x62)) ^ 0xCE)
      * v17
      + 116;
  sub_100027DF8((uint64_t)&a16);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 + 8LL * ((1998 * (**(_DWORD **)(v20 + 8LL * (v18 ^ 0x622)) == 0)) ^ v18 ^ 0x473))
                                                                                                - (((((v18 ^ 0x473) - 466) | 0x200u)
                                                                                                  + 925LL) ^ (((v18 ^ 0x473) - 54) | 0x405u))))( v21,  v22,  v23,  v24,  v25,  v26,  v27);
}

uint64_t sub_10004140C@<X0>(int a1@<W8>)
{
  int v9 = *(unsigned int **)(v7 + 8LL * (a1 - 1549));
  uint64_t v10 = *v9;
  int v11 = *(void **)(v7 + 8LL * (a1 - 1538));
  int v12 = (_BYTE *)*v11;
  v23[0] = *(_BYTE *)*v11 - 57;
  v23[1] = v12[1] - 57;
  v23[2] = v12[2] - 57;
  v23[3] = v12[3] - 57;
  v23[4] = v12[4] - 57;
  v23[5] = v12[5] - 57;
  v23[6] = v12[6] - 57;
  v23[7] = v12[7] - 57;
  v23[8] = v12[8] - 57;
  v23[9] = v12[9] - 57;
  v23[10] = v12[10] - 57;
  v23[11] = v12[11] - 57;
  v23[12] = v12[12] - 57;
  v23[13] = v12[13] - 57;
  v23[14] = v12[14] - 57;
  v23[15] = v12[15] - 57;
  v23[16] = v12[16] - 57;
  v23[17] = v12[17] - 57;
  v23[18] = v12[18] - 57;
  v23[19] = v12[19] - 57;
  v23[20] = v12[20] - 57;
  v23[21] = v12[21] - 57;
  int v13 = (_BYTE *)*v11;
  v23[22] = v13[22] - 57;
  v23[23] = v13[23] - 57;
  v23[24] = v13[24] - 57;
  v23[25] = v13[25] - 57;
  v23[26] = v13[26] - 57;
  v23[27] = v13[27] - 57;
  _BYTE v23[28] = v13[28] - 57;
  v23[29] = v13[29] - 57;
  unsigned int v14 = *(uint64_t (**)(uint64_t, _BYTE *, _DWORD *))(v7 + 8LL * (a1 ^ 0x6E1));
  int v15 = v14(v10, v23, v2);
  unsigned int v16 = ((2 * v15) & 0xFE8F7CFA) + (v15 ^ 0x7F47BE7D);
  if (v16 != 2135408253)
  {
    if (v16 == 2135409355)
    {
      uint64_t v17 = *v9;
      int v18 = *(_BYTE **)(*(void *)(v7 + 8LL * (v4 - 1462)) - 4LL);
      v24[0] = *v18 - 119;
      v24[1] = v18[1] - 119;
      v24[2] = v18[2] - 119;
      v24[3] = v18[3] - 119;
      v24[4] = v18[4] - 119;
      v24[5] = v18[5] - 119;
      v24[6] = v18[6] - 119;
      v24[7] = v18[7] - 119;
      v24[8] = v18[8] - 119;
      v24[9] = v18[9] - 119;
      v24[10] = v18[10] - 119;
      v24[11] = v18[11] - 119;
      v24[12] = v18[12] - 119;
      v24[13] = v18[13] - 119;
      v24[14] = v18[14] - 119;
      v24[15] = v18[15] - 119;
      v24[16] = v18[16] - 119;
      v24[17] = v18[17] - 119;
      v24[18] = v18[18] - 119;
      v24[19] = v18[19] - 119;
      int v19 = v14(v17, v24, v2);
      int v20 = (2 * v19) & 0x7ACC7E52;
      unsigned int v16 = (v19 ^ 0xBD663F29) + 2145124096;
    }

    else
    {
      int v20 = -1107656788;
    }

    __asm { BR              X8 }
  }

  *(_DWORD *)(v8 + 344) |= (v4 - 929) ^ 0x286;
  *(_DWORD *)(v8 + 44) = 857162589;
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, _DWORD *))(v7 + 8LL * (v4 - 1474)))( *v2,  v8 + 332,  v8 + 336,  v8 + 340,  v3);
  uint64_t v22 = *v1;
  *(_DWORD *)(v1[2] - 0x4AFE057ACA1B3713LL) = *v2;
  *(_DWORD *)(v22 - 0x499AF07A641F7E25LL) = *v3 - (((3 * ((v4 - 929) ^ 0x83)) ^ 0xB90E5EA3) & (2 * *v3)) + 1552362567;
  *((_DWORD *)v1 + 2) = 777158354;
  return result;
}

void sub_100041854(uint64_t a1)
{
  BOOL v4 = *(void *)(a1 + 8) != 0x3C9E4FFE00180D53LL
    && *(void *)(a1 + 16) != 0x19B8B1B6E0B6AAABLL
    && *(void *)a1 != 0x1C1CCD5E0596F1B5LL;
  int v1 = *(_DWORD *)(a1 + 24) - 3804331 * (((a1 | 0xF1219854) - (a1 & 0xF1219854)) ^ 0x7E848392);
  __asm { BR              X9 }

uint64_t sub_100041950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 + 8LL * (((*(_DWORD *)(a6 - 0x3C9E4FFE00180D3BLL) == 777158354) * ((v8 + 634) ^ 0x23A)) ^ v8)) - 12LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  777158354LL);
}

uint64_t sub_10004199C@<X0>( uint64_t a1@<X5>, int a2@<W8>, __n128 a3@<Q0>, __n128 a4@<Q1>, __n128 a5@<Q2>, __n128 a6@<Q3>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  int v18 = 34 * (v15 ^ 0x4A7);
  unsigned int v23 = *(_DWORD *)(a1 - 0x3C9E4FFE00180D43LL) + (v18 ^ 0xD264B09B);
  *(_DWORD *)(v17 - 140) = *(_DWORD *)(a15 + 32)
                         - a2
                         - ((2 * (*(_DWORD *)(a15 + 32) - a2) + 308376256) & 0x1B278836)
                         + 1724153211;
  v19.n128_u64[0] = 0xD4D4D4D4D4D4D4D4LL;
  v19.n128_u64[1] = 0xD4D4D4D4D4D4D4D4LL;
  v20.n128_u64[0] = 0x6A6A6A6A6A6A6A6ALL;
  v20.n128_u64[1] = 0x6A6A6A6A6A6A6A6ALL;
  BOOL v21 = v23 < 0x4A6824A9;
  if (v23 >= 0x4A6824A9) {
    BOOL v21 = v23 > 0x4A6824A9;
  }
  return ((uint64_t (*)(__n128, __n128, __n128, __n128, __n128, __n128))(*(void *)(v16
                                                                                             + 8LL
                                                                                             * ((v21
                                                                                               * (((v18 ^ 0x7A4) - 527) ^ 0x5A)) ^ v18))
                                                                                 - 12LL))( a3,  a4,  a5,  a6,  v19,  v20);
}

uint64_t sub_100041BC4()
{
  return (*(uint64_t (**)(void))(v1 + 8LL * v0))();
}

uint64_t sub_1000428B0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, unsigned int a14)
{
  *(_BYTE *)(*v17 + (v14 + a7)) = -22;
  BOOL v18 = v14 + 535996386 < a14 + 1786550889 + ((v15 - 1267) | 0x202) - 530;
  return ((uint64_t (*)(void))(*(void *)(v16 + 8LL * ((15 * !v18) ^ v15)) - 12LL))();
}

uint64_t sub_100042938@<X0>(unsigned int a1@<W1>, int a2@<W6>, unsigned int a3@<W8>)
{
  BOOL v10 = a1 > v7;
  *(_BYTE *)(*v9 + (a2 + v3 + 1)) = 106;
  unsigned int v11 = v4 + v3 + 1;
  int v12 = v10 ^ (v11 < a3);
  BOOL v13 = v11 < v6;
  if (!v12) {
    BOOL v10 = v13;
  }
  return ((uint64_t (*)(void))(*(void *)(v8 + 8LL * ((15 * !v10) ^ v5)) - 12LL))();
}

void sub_1000429AC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v8 - 0x19B8B1B6E0B6AAABLL) = *v6;
  *(_DWORD *)(v9 - 0x1C1CCD5E0596F1B5LL) = a2;
  void *v6 = 0LL;
  *(void *)(a6 - 0x3C9E4FFE00180D4BLL) = 0x55503ACE55503ACELL;
  _DWORD *v7 = 2013491068;
  *(_DWORD *)(a6 - 0x3C9E4FFE00180D3FLL) = (((2 * (*(_DWORD *)(a6 - 0x3C9E4FFE00180D3FLL) & 0xFFFFFFFE ^ 0xC22DBC9A)) & 0xF0D79600)
                                          - (*(_DWORD *)(a6 - 0x3C9E4FFE00180D3FLL) & 0xFFFFFFFE ^ 0xC22DBC9A)
                                          - 2020330241) ^ 0x45B98864;
  *(_DWORD *)(v11 + 36) = *v10;
}

void sub_100042AB8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32) - 1225351577 * ((2 * (a1 & 0x3AE15D2F) - a1 + 1159635664) ^ 0x3BE138E2);
  __asm { BR              X15 }

uint64_t sub_100042BC8@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int v15 = (((v13 - 103) | 0xD1) ^ (a9 + 343)) + v12;
  if (v15 >= 0) {
    unsigned int v16 = v15;
  }
  else {
    unsigned int v16 = -v15;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 8LL * ((26 * (v16 > ((v13 - 494) | 0x258u) - 599)) ^ v13)))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a10,  a11,  a12);
}

uint64_t sub_100042C14( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23)
{
  *(_DWORD *)(a23 + 4LL * (int)(((v23 + 758018270) & 0xD2D18FC9) - 897)) = -1087783924;
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v24
                                                               + 8LL
                                                               * ((208 * (v25 - 1472347250 >= -1472347249)) ^ (v23 - 378)))
                                                   - 4LL))( a1,  675136397LL);
}

void sub_100042CDC()
{
  *(_DWORD *)(v1 + v2) = v0;
}

void sub_100043990(_DWORD *a1)
{
  unsigned int v1 = *a1 ^ (1374699841 * ((((2 * (_DWORD)a1) | 0x97E9331C) - (_DWORD)a1 + 873162354) ^ 0xA6008187));
  __asm { BR              X10 }

uint64_t sub_100043A70@<X0>( uint64_t a1@<X8>, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, int a6, unint64_t *a7, int a8)
{
  unsigned int v12 = 1755732067 * (((&a4 | 0x545E70D) + (~&a4 | 0xFABA18F2)) ^ 0xDB835AD7);
  a7 = &STACK[0x690A6A41B9AF2986];
  a4 = &STACK[0x28638DD0D74C695F];
  a5 = v11;
  a6 = (v10 - 282) ^ v12;
  a8 = v12 ^ 0x56136A6F;
  uint64_t v13 = ((uint64_t (*)(unint64_t **))(*(void *)(a1 + 8LL * (v10 - 321)) - 12LL))(&a4);
  return ((uint64_t (*)(uint64_t))(*(void *)(v9
                                                      + 8LL
                                                      * (((*(_DWORD *)(v11 - 0x3C9E4FFE00180D3BLL) == v8)
                                                        * (3 * (v10 ^ 0x163) + 66)) ^ v10))
                                          - 12LL))(v13);
}

uint64_t sub_100043B54( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
}

void sub_100043BA8(_DWORD *a1@<X8>)
{
  int v5 = v7[3] ^ 0x6A;
  int v6 = ((*v7 ^ 0x6A) << 24) | ((v7[1] ^ 0x6A) << 16) | ((v7[2] ^ 0x6A) << 8) | v5;
  *(_DWORD *)(*(void *)(v3 + 8) - 0x5843A1C5952764FBLL) = v6 + v4 - 2 * (v6 & (v2 ^ v1 ^ (v4 + 79)) ^ v5 & 0xD);
  *(_DWORD *)(v3 + 4) = *a1;
}

uint64_t sub_100043C6C(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = (qword_100060108 + qword_100060140) ^ (unint64_t)&v8;
  qword_100060140 = 45734839 * v2 + 0x95387C5A7726064LL;
  qword_100060108 = 45734839 * (v2 ^ 0x95387C5A7726064LL);
  int v3 = *(_DWORD *)(a2 + 4);
  unsigned __int8 v4 = -73 * ((qword_100060108 - (-73 * v2 + 100)) ^ 0x64);
  uint64_t v5 = (uint64_t)*(&off_10005BF10 + (v4 ^ byte_10004BEE0[byte_100057A00[v4] ^ 0x2E]) - 30);
  if (v3 == 1782897118) {
    __asm { BR              X17 }
  }

  if (v3 == 1782897125)
  {
    int v6 = **(unsigned __int8 **)(a2 + 8) - 9;
    __asm { BR              X1 }
  }

  return 4294925278LL;
}

void sub_10004434C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 4) - 535753261 * (a1 ^ 0xAF40E2F);
  __asm { BR              X9 }

void sub_1000443D8()
{
  _DWORD *v0 = 1370815489;
}

void sub_100044694(uint64_t a1)
{
  int v1 = 535753261 * (((a1 | 0xD816FE13) - (a1 & 0xD816FE13)) ^ 0xD2E2F03C);
  __asm { BR              X14 }

uint64_t sub_100044758@<X0>(uint64_t a1@<X8>)
{
  unsigned int v5 = 3804331 * (((&v7 | 0x8C3F22A4) - (&v7 & 0x8C3F22A4)) ^ 0x39A3962);
  uint64_t v8 = v2;
  unsigned int v7 = v1 - ((v3 - 2009972932) & 0xC346E2E2) - v5 + ((59 * ((v4 + 140) ^ 0x13E)) ^ 0xA5BC91BE);
  int v9 = (v4 + 163) ^ v5;
  return ((uint64_t (*)(unsigned int *))(*(void *)(a1 + 8LL * ((v4 + 140) ^ 0x17A)) - 12LL))(&v7);
}

void sub_10004489C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40) + 460628867 * (((a1 | 0x4A5B5FFB) - (a1 & 0x4A5B5FFB)) ^ 0x6CDDD86);
  __asm { BR              X10 }

uint64_t sub_1000449C0()
{
  BOOL v5 = (*(_DWORD *)(v2 + 64) ^ v0) == (((v1 ^ 0x3CC) + 1467) ^ 0x28870E9B)
    || (*(void *)(v2 + 24) | *(void *)(v2 + 8)) == 0LL;
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * ((v5 * ((2 * (v1 ^ 0x3CC)) ^ 0x297)) ^ v1)) - 12LL))();
}

uint64_t sub_100044A20()
{
  BOOL v4 = v1[6] != 0x1B2054D000D9709DLL && (v1[7] | v1[2]) != 0LL;
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((v4 * (((v0 + 350) | 0x302) - 630)) ^ v0)) - 12LL))();
}

uint64_t sub_100044A74(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 + 8LL * ((v3 + 276) ^ (30 * (v2 != 0))))
                                                            - ((3 * ((v3 + 276) ^ 0x35Fu)) ^ 0x1B3LL)))( a1,  a2,  1225351577LL);
}

uint64_t sub_100044B8C@<X0>( int a1@<W2>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21)
{
  int v31 = v23 - 104;
  int v32 = ((v30 - 144) ^ 0x7EFF9A32) * a1;
  *(void *)(v30 - 136) = v21;
  *(_DWORD *)(v30 - 124) = v23 - v32 + 453;
  *(void *)(v30 - 120) = v28;
  *(_DWORD *)(v30 - 144) = (v24 + 894258059 + v23 - 104) ^ v32;
  uint64_t v49 = a2 + v22;
  ((void (*)(uint64_t))(*(void *)(v25 + 8LL * (v23 - 259)) - 12LL))(v30 - 144);
  HIDWORD(v48) = (v31 + 955) | 0x204;
  LODWORD(v48) = v31 + 1471;
  LODWORD(v47) = v31 + 1041;
  *(void *)(v30 - 136) = a18;
  *(void *)(v30 - 128) = a17;
  *(_DWORD *)(v30 - 144) = v31
                         + 1041
                         + 535753261
                         * ((((v30 - 144) | 0x90371EFA) - (v30 - 144) + ((v30 - 144) & 0x6FC8E100)) ^ 0x9AC310D5);
  uint64_t v46 = (void (*)(uint64_t))(*(void *)(v25 + 8LL * (v31 ^ 0x1D7)) - 8LL);
  v46(v30 - 144);
  HIDWORD(a6) = v31 + 1050;
  HIDWORD(v47) = 2 * (v30 - 144);
  *(void *)(v30 - 144) = a17;
  *(void *)(v30 - 128) = a19;
  *(void *)(v30 - 120) = a18;
  *(void *)(v30 - 112) = v28;
  *(_DWORD *)(v30 - 136) = v31
                         + 1050
                         - 1178560073 * (((HIDWORD(v47) | 0x34657936) - (v30 - 144) + 1707950949) ^ 0x20A6C4F9);
  uint64_t v45 = (void (*)(uint64_t))(*(void *)(v25 + 8LL * (v31 ^ 0x172)) - 8LL);
  v45(v30 - 144);
  HIDWORD(v44) = v31 + 69;
  *(_DWORD *)(v30 - 104) = v31
                         + 69
                         + 235795823
                         * ((((v30 - 144) ^ 0xFB8C79AA) - 1432301377 - 2 * (((v30 - 144) ^ 0xFB8C79AA) & 0xAAA0D0BF)) ^ 0xC581E04C);
  *(void *)(v30 - 144) = a17;
  *(void *)(v30 - 136) = v26;
  *(void *)(v30 - 120) = a19;
  *(void *)(v30 - 112) = a18;
  *(void *)(v30 - 128) = a19;
  uint64_t v33 = *(void (**)(uint64_t))(v25 + 8LL * (v31 - 204));
  v33(v30 - 144);
  LODWORD(v44) = v31 + 867;
  *(_DWORD *)(v30 - 128) = v31
                         + 867
                         - 1225351577 * ((((v30 - 144) | 0x47DE7FEB) - ((v30 - 144) & 0x47DE7FEB)) ^ 0x3921E5D9);
  *(void *)(v30 - 112) = a18;
  *(void *)(v30 - 104) = a19;
  *(void *)(v30 - 144) = a17;
  *(void *)(v30 - 136) = a10;
  *(void *)(v30 - 120) = a19;
  uint64_t v34 = (void (*)(uint64_t))*(&off_10005BF10 + v31 - 198);
  v34(v30 - 144);
  *(void *)(v30 - 136) = a18;
  *(void *)(v30 - 128) = a13;
  *(_DWORD *)(v30 - 144) = v31
                         + 1041
                         + 535753261
                         * ((-803403039 - ((v30 - 144) | 0xD01D0AE1) + ((v30 - 144) | 0x2FE2F51E)) ^ 0x2516FB31);
  v46(v30 - 144);
  *(void *)(v30 - 144) = a13;
  *(_DWORD *)(v30 - 136) = v31
                         + 1050
                         - 1178560073 * (((v30 - 144) & 0x3A81D27D | ~((v30 - 144) | 0x3A81D27D)) ^ 0x7FEA55E0);
  *(void *)(v30 - 128) = v29;
  *(void *)(v30 - 120) = a18;
  *(void *)(v30 - 112) = v28;
  v45(v30 - 144);
  *(_DWORD *)(v30 - 104) = v31
                         + 69
                         + 235795823 * (((HIDWORD(v47) | 0x58B860E0) - (v30 - 144) + 1403244432) ^ 0x38F17929);
  *(void *)(v30 - 120) = v29;
  *(void *)(v30 - 112) = a18;
  *(void *)(v30 - 136) = v26;
  *(void *)(v30 - 128) = v29;
  *(void *)(v30 - 144) = a13;
  v33(v30 - 144);
  *(_DWORD *)(v30 - 128) = v31 + 867 - 1225351577 * ((v30 - 144) ^ 0x7EFF9A32);
  *(void *)(v30 - 112) = a18;
  *(void *)(v30 - 104) = v29;
  *(void *)(v30 - 120) = v29;
  *(void *)(v30 - 144) = a13;
  *(void *)(v30 - 136) = a11;
  v34(v30 - 144);
  *(void *)(v30 - 144) = a19;
  *(void *)(v30 - 136) = v29;
  *(_DWORD *)(v30 - 128) = v31
                         - 1224239923 * ((((v30 - 144) | 0xB3BC8C3B) + (~(v30 - 144) | 0x4C4373C4)) ^ 0x410F71ED)
                         + 1070;
  ((void (*)(uint64_t))((char *)*(&off_10005BF10 + v31 - 291) - 8))(v30 - 144);
  *(void *)(v30 - 144) = v29;
  *(_DWORD *)(v30 - 132) = v31
                         - 1759421093 * (((HIDWORD(v47) | 0xD101A53A) - (v30 - 144) - 1753272989) ^ 0xDBFD62C9)
                         + 297;
  sub_1000069B0(v30 - 144);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(uint64_t), uint64_t, void (*)(uint64_t), uint64_t, uint64_t, void (*)(uint64_t), char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 8LL * (((*(_DWORD *)(v30 - 136) == 227848400) * (v31 + 1471 + HIDWORD(v48) - 2311)) ^ v31)))( v35,  v36,  v37,  v38,  v39,  v40,  v41,  v42,  a3,  v44,  v45,  a6,  v46,  v47,  v48,  v33,  (char *)*(&off_10005BF10 + v31 - 289) - 8,  v49,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21);
}

uint64_t sub_100045064( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void (*a16)(uint64_t), void (*a17)(uint64_t), uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35)
{
  *(_DWORD *)(v40 - 128) = v36
                         - 1178560073
                         * ((((v40 - 144) ^ 0x55FC345A) & 0x28D6E822 | ~((v40 - 144) ^ 0x55FC345A | 0x28D6E822)) ^ 0x38415BE5)
                         - 1145;
  *(void *)(v40 - 144) = v39;
  *(void *)(v40 - 136) = v37;
  v35(v40 - 144);
  *(_DWORD *)(v40 - 104) = v36 - 1402 + 235795823 * ((v40 - 323564042 - 2 * ((v40 - 144) & 0xECB6CE86)) ^ 0x781B87DF);
  *(void *)(v40 - 120) = v39;
  *(void *)(v40 - 112) = a24;
  *(void *)(v40 - 144) = v37;
  *(void *)(v40 - 136) = a35;
  *(void *)(v40 - 128) = v39;
  a16(v40 - 144);
  *(_DWORD *)(v40 - 104) = v36
                         - 1402
                         + 235795823 * ((((2 * (v40 - 144)) | 0xED55BEB4) - (v40 - 144) - 1990909786) ^ 0xE2079603);
  *(void *)(v40 - 144) = v37;
  *(void *)(v40 - 136) = v39;
  *(void *)(v40 - 128) = v39;
  *(void *)(v40 - 120) = a18;
  *(void *)(v40 - 112) = a24;
  a16(v40 - 144);
  *(void *)(v40 - 128) = v39;
  *(_DWORD *)(v40 - 136) = v36
                         + 1755732067 * (((v40 - 144) & 0x3CE12F49 | ~((v40 - 144) | 0x3CE12F49)) ^ 0x1DD86D6D)
                         - 1882359278;
  *(void *)(v40 - 144) = a23;
  sub_100046080(v40 - 144);
  *(_DWORD *)(v40 - 128) = v36
                         - 1178560073
                         * ((1697882597 - ((v40 - 144) | 0x6533A1E5) + ((v40 - 144) | 0x9ACC5E1A)) ^ 0x20582678)
                         - 1145;
  *(void *)(v40 - 144) = v39;
  *(void *)(v40 - 136) = a25;
  a17(v40 - 144);
  *(_DWORD *)(v40 - 136) = v36
                         + 3804331 * (((~(v40 - 144) & 0x8D35EC0E) - (~(v40 - 144) | 0x8D35EC0F)) ^ 0x290F7C9)
                         - 397;
  *(void *)(v40 - 144) = v39;
  *(void *)(v40 - 128) = a25;
  uint64_t v41 = sub_100027864(v40 - 144);
  return (*(uint64_t (**)(uint64_t))(v38
                                            + 8LL
                                            * (((((a22 == 0) ^ (v36 - 1)) & 1) * ((v36 - 1030) ^ 0x326)) ^ (v36 - 187))))(v41);
}

uint64_t sub_1000452B8()
{
  int v4 = 1374699841 * ((((v3 - 144) | 0xD577BC6C) - (v3 - 144) + ((v3 - 144) & 0x2A884390)) ^ 0xB883A465);
  *(void *)(v3 - 144) = v2;
  *(void *)(v3 - 136) = v8;
  *(_DWORD *)(v3 - 128) = v4 + v0 - 44;
  *(_DWORD *)(v3 - 124) = (v7 + 347 * (v0 ^ 0x312) + 1051601416) ^ v4;
  uint64_t result = ((uint64_t (*)(uint64_t))*(&off_10005BF10 + v0 - 630))(v3 - 144);
  *(_DWORD *)(v6 - 0x1B2054D000D9709DLL) = v7;
  _DWORD *v1 = 777158354;
  return result;
}

void sub_100045418(uint64_t a1, uint64_t a2)
{
  BOOL v2 = (*(_DWORD *)(a2 + 4) - 1782897115) < 5;
  __asm { BR              X10 }

uint64_t sub_100045474()
{
  return (*(uint64_t (**)(void))(v0 + 8LL * ((2 * (v1 == 1782897115)) | 0x6A4u)))();
}

uint64_t sub_100045494@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_DWORD *)(*(void *)(a1 + 96) + 800LL) = 925165539;
  *(_DWORD *)(*(void *)(a1 + 96) + 804LL) = 2086149949;
  *(void *)(*(void *)(a1 + 96) + 808LL) = *(void *)(a1 + 96) + 816LL;
  uint64_t v4 = *(void *)(a1 + 96) + 0x621D43C813E508A2LL;
  int v5 = 460628867 * ((v7 + 1137917537 - 2 * ((unint64_t)v7 & 0x43D33E61)) ^ 0xF45BC1C);
  uint64_t v10 = *(void *)(a2 + 8) + (*(_DWORD *)(a2 + 4) - v3);
  int v9 = (v3 - 556214061) ^ v5;
  uint64_t v8 = v4;
  v7[1] = v5 + 638;
  ((void (*)(_DWORD *))(*(void *)(a3 + 1424) - 12LL))(v7);
  return (v7[0] - 886405590);
}

void sub_1000455E0(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 4) ^ (1225351577 * ((-2 - ((~(_DWORD)a1 | 0x83317A5F) + (a1 | 0x7CCE85A0))) ^ 0xFDCEE06D));
  __asm { BR              X10 }

uint64_t sub_1000456C0@<X0>( uint64_t a1@<X8>, uint64_t a2, unint64_t *a3, unsigned int a4, uint64_t a5, unsigned int a6, int a7)
{
  unsigned int v10 = 108757529 * ((293386251 - (&a3 | 0x117CB80B) + (&a3 | 0xEE8347F4)) ^ 0xE1F25DF);
  a4 = v10 ^ 0xF5C4786A;
  a6 = 639729545 - v10;
  a7 = v7 - v10 - 482;
  a3 = &STACK[0x43C85E0409B7388D];
  a5 = v8;
  uint64_t v11 = (*(uint64_t (**)(unint64_t **))(a1 + 8LL * (v7 - 735)))(&a3);
  return (*(uint64_t (**)(uint64_t))(v9
                                            + 8LL
                                            * ((151 * (*(_DWORD *)(v8 - 0x3C9E4FFE00180D3BLL) == v7 + 777157520)) ^ v7)))(v11);
}

void sub_10004579C(_DWORD *a1@<X8>)
{
  unsigned int v4 = ((3 * (v3 ^ 0x252)) ^ 0xE66D264F) - 710235871 * (*v1 + v2) - ((190140994 * (*v1 + v2) + 296927944) & 0x1B278836);
  _BYTE *v5 = (HIBYTE(v4) ^ 0x8D) + (~(2 * (HIBYTE(v4) ^ 0x8D)) | 0x2B) + 107;
  v5[1] = (BYTE2(v4) ^ 0x93) - ((2 * (BYTE2(v4) ^ 0x93)) & 0xD4) + 106;
  v5[2] = (BYTE1(v4) ^ 0xC4) - 2 * ((BYTE1(v4) ^ 0xC4) & 0x6B ^ BYTE1(v4) & 1) + 106;
  v5[3] = v4 ^ 0x71;
  v1[4] = *a1;
}

uint64_t sub_100045898(_DWORD *a1)
{
  unsigned int v1 = 108757529 * ((-1057227633 - (a1 | 0xC0FBFC8F) + (a1 | 0x3F040370)) ^ 0xDF98615B);
  int v2 = *a1 ^ v1;
  int v3 = a1[1] ^ v1;
  unsigned int v5 = v3 - 1224231242;
  BOOL v4 = v3 - 1224231242 < 0;
  LODWORD(v6) = 1224231242 - v3;
  if (v4) {
    uint64_t v6 = v6;
  }
  else {
    uint64_t v6 = v5;
  }
  return ((uint64_t (*)(void))(*((void *)*(&off_10005BF10 + v2 - 134)
                              + ((60 * (v6 == ((2 * (_DWORD)v6) & 0x169AB846))) ^ v2))
                            - (v2 ^ 0x3Cu)
                            + 347LL))();
}

void sub_100045954(int a1@<W8>)
{
  *(_DWORD *)(v1 - 0x621D43C813E5057ELL) = a1;
}

uint64_t sub_1000459CC(uint64_t a1)
{
  int v2 = 1755732067 * (a1 ^ 0xDEC6BDDB);
  int v3 = *(_DWORD *)(a1 + 24) ^ v2;
  int v4 = *(_DWORD *)(a1 + 4) ^ v2;
  uint64_t v5 = *(void *)(a1 + 16);
  int v6 = v2 ^ *(_DWORD *)(a1 + 28) ^ 0x5F147703;
  unsigned int v7 = 235795823
     * (((&v9 | 0x9DCFE726) - &v9 + (&v9 & 0x623018D8)) ^ 0x962AE7F);
  v3 -= 2138963358;
  uint64_t v14 = *(void *)(a1 + 8);
  uint64_t v9 = v5;
  int v11 = v3 + v7 + 1121;
  unsigned int v12 = v6 - v7;
  int v13 = v4 - v7 - 368915965;
  uint64_t result = ((uint64_t (*)(uint64_t *))*(&off_10005BF10 + v3))(&v9);
  *(_DWORD *)a1 = v10;
  return result;
}

uint64_t sub_100045AE8(_DWORD *a1)
{
  unsigned int v2 = *a1 ^ (1178560073 * (((a1 | 0x9834C8C3) - (a1 & 0x9834C8C3)) ^ 0x22A0B0A1));
  uint64_t result = ((uint64_t (*)(char *, char *))*(&off_10005BF10 + (v2 & 0x2F5CBE1)))( (char *)*(&off_10005BF10 + (int)(v2 - 1695027369)) - 4,  (char *)*(&off_10005BF10 + (int)(v2 ^ 0x650810CD)) - 8);
  int v4 = *(_DWORD *)*(&off_10005BF10 + (int)(v2 ^ 0x650810B6));
  if ((_DWORD)result) {
    int v4 = -777182100;
  }
  a1[1] = v4;
  return result;
}

void sub_100045BB0()
{
  qword_100060118 = 45734839 * (qword_100060118 ^ (unint64_t)&v1 ^ qword_100060108 ^ 0x95387C5A7726064LL);
  qword_100060108 = qword_100060118;
  unsigned int v2 = (1374699841 * ((2 * (&v2 & 0x19DD0CF8) - &v2 - 433917178) ^ 0x8BD6EB0F)) ^ 0x6DA;
  int v4 = (char *)&unk_1000603A0;
  sub_10001429C(&v2);
  unsigned int v2 = (1374699841 * (&v2 ^ 0x6DF41809)) ^ 0x6DA;
  int v4 = (char *)*(&off_10005BF10
               + ((-73 * (qword_100060118 ^ 0x64 ^ qword_100060108)) ^ byte_100053D20[byte_10004F110[(-73 * (qword_100060118 ^ 0x64 ^ qword_100060108))] ^ 0x9A])
               - 211)
     - 4;
  sub_10001429C(&v2);
  unsigned int v0 = 1374699841 * ((2 * (&v2 & 0x1CF1FAC8) - &v2 + 1661863223) ^ 0xEFA1D3E);
  unsigned int v2 = v0 ^ 0x2D1;
  char v3 = v0 + 115;
  sub_100027DF8((uint64_t)&v2);
}

uint64_t sub_100045D9C(uint64_t a1)
{
  uint64_t v3 = a1;
  v2[0] = (1374699841 * ((2 * (v2 & 0x72D60108) - v2 - 1926627593) ^ 0xE0DDE6FE)) ^ 0x6DA;
  sub_10001429C(v2);
  return v2[1];
}

uint64_t sub_100045E38(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 64) = *(void *)(a2 + 8);
  return 0LL;
}

_BYTE *sub_100045E50(_BYTE *result, char a2, unint64_t a3)
{
  unint64_t v3 = -(int)result & 7;
  if (v3 > a3) {
    LODWORD(v3) = a3;
  }
  switch((int)v3)
  {
    case 1:
      goto LABEL_10;
    case 2:
      goto LABEL_9;
    case 3:
      goto LABEL_8;
    case 4:
      goto LABEL_7;
    case 5:
      goto LABEL_6;
    case 6:
      goto LABEL_5;
    case 7:
      *result++ = a2;
LABEL_5:
      *result++ = a2;
LABEL_6:
      *result++ = a2;
LABEL_7:
      *result++ = a2;
LABEL_8:
      *result++ = a2;
LABEL_9:
      *result++ = a2;
LABEL_10:
      *result++ = a2;
      break;
    default:
      break;
  }

  unint64_t v4 = a3 - v3;
  unint64_t v6 = v4;
  unint64_t v5 = v4 & 7;
  switch(v6)
  {
    case 0uLL:
      return result;
    case 1uLL:
      goto LABEL_20;
    case 2uLL:
      goto LABEL_19;
    case 3uLL:
      goto LABEL_18;
    case 4uLL:
      goto LABEL_17;
    case 5uLL:
      goto LABEL_16;
    case 6uLL:
      goto LABEL_15;
    case 7uLL:
      *result++ = a2;
LABEL_15:
      *result++ = a2;
LABEL_16:
      *result++ = a2;
LABEL_17:
      *result++ = a2;
LABEL_18:
      *result++ = a2;
LABEL_19:
      *result++ = a2;
LABEL_20:
      *uint64_t result = a2;
      break;
    default:
      uint64_t result = (_BYTE *)((uint64_t (*)(void))((char *)&loc_100045EE0 + 4 * byte_10004BFE7[(v5 >> 3) & 7]))();
      break;
  }

  return result;
}

uint64_t sub_100045F44(uint64_t a1)
{
  int v2 = 1225351577 * ((a1 & 0x45F4E8E1 | ~(a1 | 0x45F4E8E1)) ^ 0xC4F48D2C);
  int v3 = *(_DWORD *)(a1 + 12);
  int v4 = *(_DWORD *)(a1 + 8) ^ v2;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  unsigned int v8 = 1224239923 * ((2 * (&v10 & 0x296E5BF0) - &v10 + 1452385292) ^ 0xA42259DB);
  uint64_t v13 = *(void *)a1;
  uint64_t v14 = v6;
  uint64_t v10 = v7;
  uint64_t v12 = v5;
  unsigned int v16 = v4 - 368399097 + v8;
  int v11 = v2 + v3 - v8 - 1021376094;
  uint64_t result = ((uint64_t (*)(uint64_t *))((char *)*(&off_10005BF10 + (v4 ^ 0x15F557EF)) - 12))(&v10);
  *(_DWORD *)(a1 + 40) = v15;
  return result;
}

uint64_t sub_100046080(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) - 1755732067 * ((a1 & 0xE52700F6 | ~(a1 | 0xE52700F6)) ^ 0xC41E42D2);
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 16);
  unsigned int v5 = v1
     - 1178560073
  uint64_t v6 = v2;
  uint64_t v7 = v3;
  return ((uint64_t (*)(unsigned int *))((char *)*(&off_10005BF10 + (int)(v1 ^ 0x8FCD8184)) - 8))(&v5);
}

uint64_t sub_100046178(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 32) = *(void *)(a2 + 8);
  return 0LL;
}

uint64_t sub_100046190(uint64_t a1)
{
  int v2 = 1374699841 * ((2 * (a1 & 0x2C1640CD) - a1 + 1407827762) ^ 0x3E1DA73B);
  int v3 = *(_DWORD *)a1 + v2;
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v6 = *(void *)(a1 + 32);
  int v8 = *(_DWORD *)(a1 + 40) ^ v2;
  unsigned int v9 = 235795823 * ((&v11 & 0xF4A3154B | ~(&v11 | 0xF4A3154B)) ^ 0x9FF1A3ED);
  int v16 = v9 ^ (v3 + 2024874895);
  uint64_t v17 = v5;
  uint64_t v13 = v6;
  uint64_t v14 = v4;
  uint64_t v11 = v7;
  unsigned int v12 = v9 + (v8 ^ 0x31A7742) - 134504706 + ((2 * v8) & 0xBE59FF3E ^ 0xB849113A);
  uint64_t result = ((uint64_t (*)(uint64_t *))((char *)*(&off_10005BF10 + (int)(v3 ^ 0x874EE3DA)) - 4))(&v11);
  *(_DWORD *)(a1 + 48) = v15;
  return result;
}

uint64_t sub_1000462F0(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a1 + 88) = 116;
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 80) = *(void *)(a2 + 8);
  return 0LL;
}

uint64_t sub_100046310(uint64_t result)
{
  unint64_t v1 = 1759421093
     * ((-2LL - ((~result | 0xA799CC8FED74AA68LL) + (result | 0x58663370128B5597LL))) ^ 0x89270DDF5E091A3CLL);
  int v2 = *(_DWORD *)(result + 20) ^ v1;
  unint64_t v3 = *(void *)(result + 24) + v1;
  int v4 = *(_DWORD *)(result + 4) + v1;
  int v5 = *(_DWORD *)(result + 32) ^ v1;
  unint64_t v6 = *(void *)(result + 8) - v1;
  int v7 = *(_DWORD *)(result + 16) ^ v1;
  BOOL v8 = v3 >= v6;
  BOOL v9 = v3 != v6;
  if ((v2 & 1) != 0) {
    BOOL v10 = v8;
  }
  else {
    BOOL v10 = v9;
  }
  if (v10) {
    int v7 = v4;
  }
  *(_DWORD *)(result + 36) = v5 ^ v7;
  return result;
}

void sub_1000463B8(_DWORD *a1)
{
  signed int v1 = *a1 - 1224239923 * ((a1 & 0x3B94B05C | ~(a1 | 0x3B94B05C)) ^ 0x36D8B274) - 426522926;
  uint64_t v3 = *(void *)((char *)*(&off_10005BF10 + v1) - 4);
  unsigned int v2 = v1 + 628203409 * ((2 * (&v2 & 0x6DC59F68) - &v2 - 1841667952) ^ 0x10B26CA3) + 4;
  sub_100014448((uint64_t)&v2);
}

uint64_t sub_1000464A0(unsigned int a1)
{
  return byte_100057900[byte_100053C20[a1] ^ 0x9A] ^ a1;
}

uint64_t sub_1000464CC(unsigned int a1)
{
  return byte_100053D20[byte_10004F110[a1] ^ 8] ^ a1;
}

uint64_t sub_1000464F4(unsigned int a1)
{
  return byte_10004F210[byte_10004BDE0[a1] ^ 0xC2] ^ a1;
}

uint64_t sub_100046520(unsigned int a1)
{
  return byte_10004BEE0[byte_100057A00[a1] ^ 0x2E] ^ a1;
}

uint64_t sub_10004654C(unsigned int a1)
{
  return byte_100057B00[byte_100053E20[a1] ^ 0xA3] ^ a1;
}

uint64_t sub_100046578(unsigned int a1)
{
  return byte_10004BEE0[byte_100057A00[a1] ^ 0xF3] ^ a1;
}

uint64_t sub_1000465A4(unsigned int a1)
{
  return byte_100053D20[byte_10004F110[a1] ^ 0x9A] ^ a1;
}

void sub_1000465D0(uint64_t a1)
{
  unsigned int v1 = 628203409 * (((&v1 | 0xB375491A) - (&v1 & 0xB375491A)) ^ 0x31FD4529) + 95;
  uint64_t v2 = a1;
  sub_100014448((uint64_t)&v1);
}

uint64_t sub_100046660(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 24);
  return 0LL;
}

uint64_t sub_100046678(uint64_t result)
{
  unint64_t v1 = 1178560073 * ((result - 2 * (result & 0x88D88836770F0327LL) - 0x772777C988F0FCD9LL) ^ 0x9324D8DECD9B7B45LL);
  int v2 = *(_DWORD *)(result + 20) ^ (1178560073 * ((result - 2 * (result & 0x770F0327) + 1997472551) ^ 0xCD9B7B45));
  unint64_t v3 = *(void *)(result + 8) ^ v1;
  unint64_t v4 = *(void *)(result + 32) ^ v1;
  BOOL v5 = v3 < v4;
  BOOL v6 = (uint64_t)v3 < (uint64_t)v4;
  if (((*(_DWORD *)(result + 44) + 1178560073
                                  * (((_DWORD)result - 2 * (result & 0x770F0327) + 1997472551) ^ 0xCD9B7B45)) & 1) != 0)
    BOOL v5 = v6;
  if (!v5) {
    int v2 = *(_DWORD *)(result + 40) - 1178560073 * ((result - 2 * (result & 0x770F0327) + 1997472551) ^ 0xCD9B7B45);
  }
  *(_DWORD *)(result + 16) = v2 ^ (*(_DWORD *)(result + 24)
                                 - 1178560073 * ((result - 2 * (result & 0x770F0327) + 1997472551) ^ 0xCD9B7B45));
  return result;
}

uint64_t sub_100046704(uint64_t result)
{
  unint64_t v1 = 1374699841
     * (((result ^ 0x1C901A3C001822A1LL) & 0x1FB61EFE8E9BEAE7LL | (result ^ 0xE008E10020040010LL) & 0xE049E10171641518LL) ^ 0xF29465304DE83AB8LL);
  int v2 = *(_DWORD *)(result + 36) + v1;
  int v3 = *(_DWORD *)result ^ v1;
  uint64_t v4 = *(void *)(result + 8);
  unint64_t v5 = v4 - v1;
  int v6 = *(_DWORD *)(result + 32) - v1;
  uint64_t v7 = *(void *)(result + 24);
  unint64_t v8 = v7 - v1;
  int v9 = *(_DWORD *)(result + 4) + v1;
  if ((v3 & 1) != 0) {
    BOOL v10 = v8 > v5;
  }
  else {
    BOOL v10 = v7 == v4;
  }
  if (v10) {
    int v2 = v6;
  }
  *(_DWORD *)(result + 16) = v2 ^ v9;
  return result;
}

uint64_t sub_1000467BC(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 48) = *(void *)(a2 + 8);
  return 0LL;
}

uint64_t sub_1000467D4(uint64_t result)
{
  unint64_t v1 = 535753261
     * ((-2LL - ((~result | 0xCE9083717906D1D1LL) + (result | 0x316F7C8E86F92E2ELL))) ^ 0x3B72DE1C73F2DFFELL);
  unint64_t v2 = *(void *)(result + 32) ^ v1;
  unint64_t v3 = *(void *)(result + 16) + v1;
  BOOL v4 = v2 > v3;
  BOOL v5 = v2 == v3;
  int v6 = v4;
  if (((*(_DWORD *)(result + 4) + (_DWORD)v1) & 1) != 0) {
    int v7 = v6;
  }
  else {
    int v7 = v5;
  }
  if (v7) {
    unint64_t v8 = (_DWORD *)(result + 44);
  }
  else {
    unint64_t v8 = (_DWORD *)result;
  }
  *(_DWORD *)(result + 24) = *v8 ^ v1 ^ (*(_DWORD *)(result + 40) - v1);
  return result;
}

void sub_10004687C()
{
  unint64_t v0 = 45734839 * ((unint64_t)&v1[qword_100060108 ^ qword_1000602F8] ^ 0x95387C5A7726064LL);
  qword_1000602F8 = 45734839LL * (void)&v1[(qword_100060108 ^ qword_1000602F8) - 0x95387C5A7726064LL];
  qword_100060108 = v0;
  int v2 = (1374699841 * ((&v2 - 685824170 - 2 * ((unint64_t)&v2 & 0xD71F2756)) ^ 0xBAEB3F5F)) ^ 0x6DA;
  unint64_t v3 = (char *)*(&off_10005BF10
               + ((-73 * ((v0 + qword_1000602F8) ^ 0x64)) ^ byte_10004F210[byte_10004BDE0[(-73 * ((v0 + qword_1000602F8) ^ 0x64))] ^ 0xC2])
               + 11)
     - 4;
  sub_10001429C(&v2);
}

void sub_1000469A8(uint64_t a1)
{
  uint64_t v1 = a1;
  unsigned int v2 = 1111
     - 1374699841 * ((1444875314 - (&v1 | 0x561F0C32) + (&v1 | 0xA9E0F3CD)) ^ 0xC414EBC4);
  sub_100028D04((uint64_t)&v1);
}

uint64_t sub_100046A44(char a1, unsigned int a2)
{
  return byte_100057800[(byte_100053B20[a2] ^ a1)] ^ a2;
}

uint64_t sub_100046A70(unsigned int a1)
{
  return byte_100057800[byte_100053B20[a1] ^ 0x97] ^ a1;
}

uint64_t sub_100046A9C(char a1, unsigned int a2)
{
  return byte_100057900[(byte_100053C20[a2] ^ a1)] ^ a2;
}

uint64_t sub_100046AC8(char a1, unsigned int a2)
{
  return byte_100053D20[(byte_10004F110[a2] ^ a1)] ^ a2;
}

uint64_t sub_100046AF4(char a1, unsigned int a2)
{
  return byte_10004F210[(byte_10004BDE0[a2] ^ a1)] ^ a2;
}

uint64_t sub_100046B20(char a1, unsigned int a2)
{
  return byte_10004BEE0[(byte_100057A00[a2] ^ a1)] ^ a2;
}

uint64_t sub_100046B4C(char a1, unsigned int a2)
{
  return byte_100057B00[(byte_100053E20[a2] ^ a1)] ^ a2;
}

uint64_t sub_100046B78(unsigned int a1)
{
  return byte_100053D20[byte_10004F110[a1] ^ 0xE3] ^ a1;
}

uint64_t sub_100046BA4(unsigned int a1)
{
  return byte_100053D20[byte_10004F110[a1] ^ 0xA3] ^ a1;
}

uint64_t sub_100046BD0(unsigned int a1)
{
  return byte_100057800[byte_100053B20[a1] ^ 0xEA] ^ a1;
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}