DYGTMTLDeviceProfile *newProfileWithMTLDevice(void *a1)
{
  id v1;
  DYGTMTLDeviceProfile *v2;
  void *v3;
  void *v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  size_t v10;
  char *v11;
  NSMutableArray *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  id v23;
  DYGTMTLDeviceProfile *v25;
  v1 = a1;
  v2 = objc_alloc_init(&OBJC_CLASS___DYGTMTLDeviceProfile);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v1 name]);
  -[DYGTMTLDeviceProfile setName:](v2, "setName:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 6LL));
  for (i = 0LL; i != 48; i += 8LL)
  {
    v6 = *(void *)&a0u[i];
    if ([v1 supportsFeatureSet:v6])
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v6));
      [v4 addObject:v7];
    }
  }

  v8 = [v4 copy];
  v25 = v2;
  -[DYGTMTLDeviceProfile setSupportedFeatureSets:](v2, "setSupportedFeatureSets:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ([v1 areProgrammableSamplePositionsSupported]
    && [v1 maxCustomSamplePositions])
  {
    v10 = 1LL;
    do
    {
      if ([v1 supportsTextureSampleCount:v10])
      {
        v11 = (char *)calloc(v10, 8uLL);
        [v1 getDefaultSamplePositions:v11 count:v10];
        v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        v13 = 0LL;
        do
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithPoint:]( &OBJC_CLASS___NSValue,  "valueWithPoint:",  vcvtq_f64_f32(*(float32x2_t *)&v11[8 * v13])));
          -[NSMutableArray addObject:](v12, "addObject:", v14);

          ++v13;
        }

        while (v10 != v13);
        free(v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v12));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v10));
        [v9 setObject:v15 forKey:v16];
      }
    }

    while ((unint64_t)[v1 maxCustomSamplePositions] > v10++);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v9));
  -[DYGTMTLDeviceProfile setDefaultSamplePositions:](v25, "setDefaultSamplePositions:", v18);

  if ((objc_opt_respondsToSelector(v1, "supportsFamily:") & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 12LL));
    for (j = 0LL; j != 12; ++j)
    {
      v21 = qword_1000279B0[j];
      if ([v1 supportsFamily:v21])
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v21));
        [v19 addObject:v22];
      }
    }

    v23 = [v19 copy];
    -[DYGTMTLDeviceProfile setSupportedGPUFamilies:](v25, "setSupportedGPUFamilies:", v23);
  }

  return v25;
}

id DaemonDeviceCapabilities(void *a1)
{
  id v1 = a1;
  id v2 = MTLCreateSystemDefaultDevice();
  v3 = newProfileWithMTLDevice(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue( [v1 stringByAppendingPathComponent:@"/System/Library/Frameworks/Metal.framework"]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v5));

  if (v6)
  {
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 objectForInfoDictionaryKey:kCFBundleVersionKey]);
  }

  else
  {
    v7 = &stru_100031028;
  }

  *(_OWORD *)values = *(_OWORD *)off_100030840;
  __int128 v17 = *(_OWORD *)off_100030850;
  v18 = @"main-screen-scale";
  CFArrayRef v8 = CFArrayCreate(0LL, (const void **)values, 5LL, &kCFTypeArrayCallBacks);
  v9 = (void *)MGCopyMultipleAnswers(v8, 0LL);
  CFRelease(v8);
  v13 = v4;
  v14[0] = @"gputools.contexts-info";
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  v15[0] = v10;
  v15[1] = v9;
  v14[1] = @"screen-dimensions";
  v14[2] = @"metal_version";
  v14[3] = @"nativePointerSize";
  v15[2] = v7;
  v15[3] = &off_1000334E8;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  4LL));

  return v11;
}

_UNKNOWN **GPUToolsVersionQuery()
{
  return &off_100033560;
}

id modifyReplayerEnvironment(void *a1)
{
  id v1 = [a1 mutableCopy];
  [v1 removeObjectsForKeys:&off_100033588];
  [v1 removeObjectForKey:@"METAL_DEVICE_WRAPPER_TYPE"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dictionaryForKey:@"GPUDebugger.ReplayerEnvironment"]);

  if (v3) {
    [v1 addEntriesFromDictionary:v3];
  }
  id v4 = [v1 copy];

  return v4;
}

id DaemonCreateGuestAppTransport(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1) {
    goto LABEL_29;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"environment"]);
  if (v3)
  {
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
    {
LABEL_28:

LABEL_29:
      v23 = 0LL;
      goto LABEL_30;
    }

    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v52;
LABEL_6:
      uint64_t v9 = 0LL;
      while (1)
      {
        if (*(void *)v52 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v51 + 1) + 8 * v9);
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0) {
          goto LABEL_27;
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v10]);
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
        char isKindOfClass = objc_opt_isKindOfClass(v12, v13);

        if ((isKindOfClass & 1) == 0) {
          goto LABEL_27;
        }
        if (v7 == (id)++v9)
        {
          id v7 = [v5 countByEnumeratingWithState:&v51 objects:v55 count:16];
          if (v7) {
            goto LABEL_6;
          }
          break;
        }
      }
    }
  }

  id v5 = (id)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"platformPrefix"]);
  if (v5)
  {
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v5, v15) & 1) == 0)
    {
LABEL_27:

      goto LABEL_28;
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"shouldLoadCapture"]);
  if (v16)
  {
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
    {
LABEL_26:

      goto LABEL_27;
    }
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"shouldLoadReplayer"]);
  if (v18)
  {
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0)
    {
LABEL_25:

      goto LABEL_26;
    }
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"shouldLoadDiagnostics"]);
  if (v20)
  {
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) == 0)
    {

      goto LABEL_25;
    }
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"environment"]);
  v23 = v22;
  if (v22) {
    v24 = (NSMutableDictionary *)[v22 mutableCopy];
  }
  else {
    v24 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  2LL);
  }
  v26 = v24;
  v27 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"DYLD_INSERT_LIBRARIES"]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 componentsSeparatedByString:@":"]);
  v29 = v28;
  if (v28) {
    v30 = (NSMutableArray *)[v28 mutableCopy];
  }
  else {
    v30 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 2LL);
  }
  v31 = v30;
  v32 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"platformPrefix"]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"GPUTOOLS_EXTRA_PLUGIN_PATHS"]);
  uint64_t v34 = objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"shouldLoadReplayer"]);
  if (!v34) {
    goto LABEL_37;
  }
  v35 = (void *)v34;
  v50 = v31;
  v36 = v29;
  v37 = v26;
  v38 = v27;
  v39 = v33;
  v40 = v32;
  v41 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"shouldLoadCapture"]);
  unsigned int v42 = [v41 BOOLValue];

  v32 = v40;
  v33 = v39;
  v27 = v38;
  v26 = v37;
  v29 = v36;
  v31 = v50;

  if (v42)
  {
LABEL_37:
    v43 = (void *)objc_claimAutoreleasedReturnValue( [@"/System/Library/PrivateFrameworks/" stringByAppendingPathComponent:@"GPUToolsCapture.framework/GPUToolsCapture"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v26,  "setObject:forKeyedSubscript:",  v43,  @"DYMTL_TOOLS_DYLIB_PATH");
  }

  v44 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"shouldLoadDiagnostics"]);
  unsigned int v45 = [v44 BOOLValue];

  if (v45)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue( [@"/System/Library/PrivateFrameworks/" stringByAppendingPathComponent:@"GPUToolsDiagnostics.framework/GPUToolsDiagnostics"]);
  }

  id v47 = [v29 count];
  if (v47 != -[NSMutableArray count](v31, "count"))
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v31, "componentsJoinedByString:", @":"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v26,  "setObject:forKeyedSubscript:",  v48,  @"DYLD_INSERT_LIBRARIES");

    id v49 = -[NSMutableDictionary copy](v26, "copy");
    v23 = v49;
  }

LABEL_30:
  return v23;
}

__CFString *GTTransportArchiveDirectory()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  unsigned __int8 v1 = [v0 isiOSAppOnMac];

  if ((v1 & 1) != 0)
  {
    id v2 = @"/tmp/com.apple.GPUToolsAgent";
  }

  else
  {
    v3 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", getpwnam("mobile")->pw_dir);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    id v2 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"Library/GPUTools"]);
  }

  return v2;
}

void sub_1000031D4(os_log_t log)
{
  *(_WORD *)unsigned __int8 v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Malformed message: missing selector", v1, 2u);
}

uint64_t GTTransportEnvironment_init()
{
  GT_TRANSPORT_ENV = sub_100003278("MTLTRANSPORT_REPLAY_MAX_RECORD_REQUEST", 64LL);
  qword_10003DCE8 = qword_10003DCE8 & 0xFFFFFFFFFFFFFFFELL | sub_100003278("MTLTRANSPORT_REPLAY_RECORD_REQUEST", 1LL) & 1;
  uint64_t result = sub_100003278("MTLTRANSPORT_LAUNCH_TIMEOUT", 30LL);
  qword_10003DCE0 = result;
  return result;
}

uint64_t sub_100003278(const char *a1, uint64_t a2)
{
  v3 = getenv(a1);
  if (v3) {
    return strtol(v3, 0LL, 0);
  }
  else {
    return a2;
  }
}

LABEL_24:
  if (!v11) {
    uint64_t v11 = @"To enable capturing, disable calls to unsupported APIs and relaunch your application.";
  }
  -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v11, NSLocalizedRecoverySuggestionErrorKey);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.capture",  1000LL,  v13));

  return v21;
}

      v22 = v63;
      objc_autoreleasePoolPop(v26);
      if (!v35) {
        goto LABEL_28;
      }
      v23 = (char *)v23 + 1;
      v24 = v22;
    }

    while (v21 != v23);
    uint64_t v21 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
  }

  while (v21);
  v35 = 1;
LABEL_28:
  v12 = v55;
  uint64_t v11 = v56;
  uint64_t v15 = v54;
LABEL_30:

  uint64_t v13 = v58;
  if (v57) {
    *v57 = v22;
  }

  if (v35) {
LABEL_33:
  }
    __int128 v52 = v15;
  else {
    __int128 v52 = 0LL;
  }

  return v52;
}

    goto LABEL_25;
  }

  uint64_t v10 = self->_log;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Invalid message", buf, 2u);
  }

void DeleteAllArchives(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v22 = v1;
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v1));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v21 = (void *)v3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 enumeratorAtURL:v3 includingPropertiesForKeys:&__NSArray0__struct options:0 errorHandler:0]);

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pathExtension]);
        id v13 = [v12 caseInsensitiveCompare:@"gputrace"];

        if (!v13) {
          -[NSMutableArray addObject:](v2, "addObject:", v11);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v8);
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  v14 = v2;
  id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v23,  v31,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (j = 0LL; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)j);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        [v20 removeItemAtURL:v19 error:0];
      }

      id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v23,  v31,  16LL);
    }

    while (v16);
  }
}

void sub_10000783C(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3) {
    [*(id *)(a1[4] + 16) setObject:v3 forKeyedSubscript:a1[5]];
  }
  (*(void (**)(void))(a1[6] + 16LL))();
}

void sub_100007894(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 scheme]);
    unsigned int v8 = [v7 isEqualToString:@"gtsandboxid"];

    if (v8)
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 16) objectForKeyedSubscript:v5]);
    }

    else
    {
      id v11 = sub_100007990(v5);
      uint64_t v9 = objc_claimAutoreleasedReturnValue(v11);
    }

    v12 = (void *)v9;
    [*(id *)(a1[4] + 16) setObject:v9 forKeyedSubscript:a1[5]];
    (*(void (**)(void))(a1[6] + 16LL))();
  }

  else
  {
    uint64_t v10 = *(void **)(a1[4] + 8LL);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      sub_10000EB70(v10, v6);
    }
    (*(void (**)(void))(a1[6] + 16LL))();
  }
}

id sub_100007990(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc(&OBJC_CLASS___NSURL);
  id v3 = GTTransportArchiveDirectory();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = -[NSURL initFileURLWithPath:isDirectory:](v2, "initFileURLWithPath:isDirectory:", v4, 1LL);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v5, "path"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v1 path]);

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v7]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v8, 1LL));

  return v9;
}

void sub_100007A60(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = sub_100007990(v3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    [*(id *)(a1[4] + 16) setObject:v6 forKeyedSubscript:a1[5]];
    (*(void (**)(void))(a1[6] + 16LL))();
  }

  else
  {
    id v7 = *(os_log_s **)(a1[4] + 8LL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000EC10(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    (*(void (**)(void))(a1[6] + 16LL))();
  }
}

uint64_t sub_100007C88(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_100008428(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = allServicesForDeviceUDID(a1, a2);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = filteredArrayByService(v7, (Protocol *)&OBJC_PROTOCOL___GTFileWriterService);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ([v9 count] == (id)1)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  }

  else
  {
    id v11 = filteredArrayByPID(v9, (int)[v5 currentRemoteRelayPid]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
  }

  return v10;
}

uint64_t sub_1000084E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_1000084F0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  a2);
}

void sub_100008890(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (xdict)
  {
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSURL);
    nsobject = xpc_dictionary_get_nsobject(xdict, "url", v3);
    id v5 = nsobject;
    if (nsobject
      && (id v6 = (void *)objc_claimAutoreleasedReturnValue([nsobject path]),
          id v7 = [v6 length],
          v6,
          v7))
    {
      string = xpc_dictionary_get_string(xdict, "sandboxExtension");
      if (string)
      {
        uint64_t v9 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", string, strlen(string) + 1);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        _CFURLAttachSecurityScopeToFileURL(v5, v10);
      }

      id v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
    }

    else
    {
      id v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
    }

    v11();
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void sub_100008C08(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSURL);
    nsobject = xpc_dictionary_get_nsobject(v5, "url", v3);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void sub_100008DA4(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSURL);
    nsobject = xpc_dictionary_get_nsobject(v6, "url", v3);
    nserror = (void *)xpc_dictionary_get_nserror(v6, "error");
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void sub_100009194(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 startAccessingSecurityScopedResource];
    xpc_dictionary_set_nsobject(*(void **)(a1 + 40), "url", (uint64_t)v4);
    uint64_t v6 = APP_SANDBOX_READ;
    id v7 = v4;
    id v8 = [v7 fileSystemRepresentation];
    __int128 v9 = *(_OWORD *)(a1 + 64);
    v12[0] = *(_OWORD *)(a1 + 48);
    v12[1] = v9;
    uint64_t v10 = (const char *)sandbox_extension_issue_file_to_process(v6, v8, SANDBOX_EXTENSION_DEFAULT, v12);
    if (v10)
    {
      id v11 = (char *)v10;
      xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 40), "sandboxExtension", v10);
      free(v11);
    }

    if (v5) {
      [v7 stopAccessingSecurityScopedResource];
    }
  }

  [*(id *)(a1 + 32) sendMessage:*(void *)(a1 + 40)];
}

id sub_100009518(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) sendMessage:*(void *)(a1 + 32)];
}

id sub_100009768(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v5 = *(void **)(a1 + 32);
  id v6 = a3;
  xpc_dictionary_set_nsobject(v5, "url", a2);
  xpc_dictionary_set_nserror(*(void *)(a1 + 32), "error", v6);

  return [*(id *)(a1 + 40) sendMessage:*(void *)(a1 + 32)];
}

LABEL_8:
    uint64_t v12 = -1;
    goto LABEL_9;
  }

  uint64_t v12 = v11;
LABEL_9:

  return v12;
}

        id v11 = self->_log;
        error = 0LL;
        uint64_t v12 = SecTaskCopySigningIdentifier(v6, &error);
        if (v12)
        {
          uint64_t v13 = (CFErrorRef)v12;
          if (CFEqual(v12, @"com.apple.gputoolstransportd"))
          {
            uint64_t v14 = ~SecTaskGetCodeSignStatus(v6) & 0x24000001;
            CFRelease(v13);

            if (v14) {
              goto LABEL_23;
            }
            goto LABEL_17;
          }
        }

        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            token.val[0] = 138412290;
            *(void *)&token.val[1] = error;
            _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to retrieve signing identifier, %@",  (uint8_t *)&token,  0xCu);
          }

          uint64_t v13 = error;
          if (!error) {
            goto LABEL_22;
          }
        }

        CFRelease(v13);
LABEL_22:

LABEL_23:
        CFRelease(v6);
        goto LABEL_24;
      }

      uint64_t v10 = (CFErrorRef)v16;
    }

    CFRelease(v10);
LABEL_7:

    goto LABEL_8;
  }

  id v15 = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
  if (v15)
  {
    LOWORD(token.val[0]) = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to create task from audit token",  (uint8_t *)&token,  2u);
LABEL_24:
    LOBYTE(v15) = 0;
  }

  return v15;
}

uint64_t sub_10000A94C( compression_stream *a1, const uint8_t *a2, size_t a3, uint8_t *a4, size_t a5, uint64_t a6, void *a7)
{
  uint64_t v13 = a7;
  a1->src_ptr = a2;
  a1->src_size = a3;
  if (a3)
  {
    while (compression_stream_process(a1, 0) != COMPRESSION_STATUS_ERROR)
    {
      if (!a1->dst_size)
      {
        if (!v13[2](v13, a4, a5, a6)) {
          goto LABEL_10;
        }
        a1->dst_ptr = a4;
        a1->dst_size = a5;
      }

      if (!a1->src_size) {
        goto LABEL_7;
      }
    }

    if (!a6) {
      goto LABEL_11;
    }
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Compression failed: %@",  @"Failed to process compression stream",  NSLocalizedDescriptionKey));
    v18 = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    *(void *)a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.filestreamer",  0LL,  v15));

LABEL_10:
    a6 = 0LL;
  }

  else
  {
LABEL_7:
    a6 = 1LL;
  }

LABEL_11:
  return a6;
}

    uint64_t v13 = 0LL;
    goto LABEL_12;
  }

  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    if (a2)
    {
      uint64_t v19 = NSLocalizedDescriptionKey;
      __int128 v9 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", xpc_error_string(v4));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Encountered an XPC error: %@",  v10));
      v20 = v11;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
      *a2 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.transport",  7LL,  v12));
    }

    goto LABEL_11;
  }

  if (xpc_get_type(v4) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (a2)
    {
      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Encountered an XPC error: %@",  @"Unexpected XPC object type",  NSLocalizedDescriptionKey));
      v18 = v5;
      id v6 = &v18;
      id v7 = (NSErrorUserInfoKey *)&v17;
LABEL_8:
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v7,  1LL));
      *a2 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.transport",  7LL,  v8));

      goto LABEL_11;
    }

    goto LABEL_11;
  }

  nserror = (void *)xpc_dictionary_get_nserror(v4, "_error");
  id v16 = nserror;
  uint64_t v13 = nserror == 0LL;
  if (a2 && nserror) {
    *a2 = nserror;
  }

LABEL_12:
  return v13;
}

id sub_10000AAC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) _writeUncompressedFileData:a2 length:a3 error:a4];
}

uint64_t sub_10000ABD0(compression_stream *a1, uint8_t *a2, size_t a3, uint64_t a4, void *a5)
{
  __int128 v9 = a5;
  while (1)
  {
    compression_status v10 = compression_stream_process(a1, 1);
    if (v10) {
      break;
    }
    if (!v9[2](v9, a2, a3, a4)) {
      goto LABEL_10;
    }
    a1->dst_ptr = a2;
    a1->dst_size = a3;
  }

  if (v10 == COMPRESSION_STATUS_ERROR)
  {
    if (!a4) {
      goto LABEL_11;
    }
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Compression failed: %@",  @"Failed to finalize compression stream",  NSLocalizedDescriptionKey));
    id v15 = v11;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    *(void *)a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.filestreamer",  0LL,  v12));
  }

  else if (v9[2](v9, a2, a3 - a1->dst_size, a4))
  {
    a1->dst_ptr = a2;
    a1->dst_size = a3;
    a4 = 1LL;
    goto LABEL_11;
  }

LABEL_10:
  a4 = 0LL;
LABEL_11:

  return a4;
}

id sub_10000AD4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) _writeUncompressedFileData:a2 length:a3 error:a4];
}

uint64_t GTFileWriterTransferFileEntries(void *a1, void *a2, void *a3, NSString **a4, void *a5)
{
  id v8 = a1;
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  v88 = (uint8_t *)malloc((size_t)[v10 chunkSize]);
  id v75 = v9;
  id v76 = v8;
  id v74 = v10;
  v72 = v11;
  if ([v10 compressionAlgorithm])
  {
    id v12 = v8;
    id v84 = v9;
    id v13 = v10;
    id v82 = v11;
    id v73 = v12;
    if ([v12 count])
    {
      unint64_t v14 = (unint64_t)[v13 compressionAlgorithm] - 1;
      if (v14 > 4) {
        compression_algorithm v15 = 0;
      }
      else {
        compression_algorithm v15 = dword_100027A60[v14];
      }
      v90 = v13;
      if (compression_stream_init(&stream, COMPRESSION_STREAM_ENCODE, v15) == COMPRESSION_STATUS_OK)
      {
        contexta = (uint8_t *)malloc((size_t)[v13 chunkSize]);
        stream.src_size = 0LL;
        stream.dst_ptr = v88;
        stream.dst_size = (size_t)[v13 chunkSize];
        __int128 v97 = 0u;
        __int128 v98 = 0u;
        __int128 v99 = 0u;
        __int128 v100 = 0u;
        id v71 = v12;
        id v81 = [v71 countByEnumeratingWithState:&v97 objects:v96 count:16];
        if (v81)
        {
          uint64_t v79 = *(void *)v98;
          while (2)
          {
            v43 = 0LL;
            do
            {
              if (*(void *)v98 != v79) {
                objc_enumerationMutation(v71);
              }
              v44 = *(void **)(*((void *)&v97 + 1) + 8LL * (void)v43);
              unsigned int v45 = objc_autoreleasePoolPush();
              v46 = objc_alloc(&OBJC_CLASS___NSURL);
              id v47 = (void *)objc_claimAutoreleasedReturnValue([v44 path]);
              v48 = -[NSURL initFileURLWithPath:isDirectory:relativeToURL:]( v46,  "initFileURLWithPath:isDirectory:relativeToURL:",  v47,  0LL,  v84);

              id v49 = v48;
              int v50 = open(-[NSURL fileSystemRepresentation](v49, "fileSystemRepresentation"), 0);
              if (v50 < 0)
              {
                uint64_t v66 = *__error();
                v94 = (const __CFString *)NSLocalizedDescriptionKey;
                v95 = @"Failed to open file for reading";
                v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v95,  &v94,  1LL));
                id v41 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v66,  v67));

                objc_autoreleasePoolPop(v45);
                id v9 = v75;
                id v8 = v76;
                id v10 = v74;
                if (!v41) {
                  goto LABEL_77;
                }
                goto LABEL_79;
              }

              int v51 = v50;
              unint64_t v52 = 0LL;
              __int128 v53 = 0LL;
              while (2)
              {
                if (v52 >= (unint64_t)[v44 fileSize])
                {
                  id v41 = v53;
                }

                else
                {
                  size_t v54 = (size_t)[v44 fileSize] - v52;
                  v55 = contexta;
                  v56 = &contexta[v54];
                  while (v55 < v56)
                  {
                    ssize_t v57 = read(v51, v55, v56 - v55);
                    v55 += v57;
                    if (v57 < 0) {
                      goto LABEL_57;
                    }
                  }

                  if ((v54 & 0x8000000000000000LL) != 0)
                  {
LABEL_57:
                    uint64_t v60 = *__error();
                    NSErrorUserInfoKey v92 = NSLocalizedDescriptionKey;
                    v93 = @"Failed to read from file";
                    v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v93,  &v92,  1LL));
                    id v41 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v60,  v61));

                    break;
                  }

                  v52 += v54;
                  id v58 = [v90 chunkSize];
                  id v91 = v53;
                  char v59 = sub_10000A94C(&stream, contexta, v54, v88, (size_t)v58, (uint64_t)&v91, v82);
                  id v41 = v91;

                  __int128 v53 = v41;
                  if ((v59 & 1) != 0) {
                    continue;
                  }
                }

                break;
              }

              close(v51);

              objc_autoreleasePoolPop(v45);
              if (v41)
              {

                id v9 = v75;
                id v8 = v76;
                id v10 = v74;
LABEL_79:
                if (a4)
                {
                  id v41 = v41;
                  uint64_t v40 = 0LL;
                  *a4 = (NSString *)v41;
                }

                else
                {
                  uint64_t v40 = 0LL;
                }

                goto LABEL_82;
              }

              v43 = (char *)v43 + 1;
              id v9 = v75;
              id v8 = v76;
              id v10 = v74;
            }

            while (v43 != v81);
            id v62 = [v71 countByEnumeratingWithState:&v97 objects:v96 count:16];
            id v81 = v62;
            if (v62) {
              continue;
            }
            break;
          }
        }

LABEL_77:
        uint64_t v40 = sub_10000ABD0(&stream, v88, (size_t)[v90 chunkSize], (uint64_t)a4, v82);
        id v41 = 0LL;
LABEL_82:
        free(contexta);
        compression_stream_destroy(&stream);
        goto LABEL_83;
      }

      if (a4)
      {
        *(void *)&__int128 v97 = NSLocalizedDescriptionKey;
        id v41 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Compression failed: %@",  @"Failed to initialize compression stream"));
        v96[0] = v41;
        unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v96,  &v97,  1LL));
        *a4 = (NSString *)(id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.filestreamer",  0LL,  v42));

        uint64_t v40 = 0LL;
LABEL_83:

        id v13 = v90;
        goto LABEL_84;
      }

      uint64_t v40 = 0LL;
    }

    else
    {
      uint64_t v40 = 1LL;
    }

LABEL_84:
    v65 = v73;
    goto LABEL_85;
  }

  id v16 = v11;
  id v17 = v8;
  id v83 = v9;
  id v85 = v10;
  v70 = v16;
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  id obj = v17;
  id v80 = [obj countByEnumeratingWithState:&v97 objects:v96 count:16];
  if (v80)
  {
    uint64_t v89 = 0LL;
    uint64_t v78 = *(void *)v98;
LABEL_7:
    uint64_t v18 = 0LL;
    while (1)
    {
      if (*(void *)v98 != v78) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void **)(*((void *)&v97 + 1) + 8 * v18);
      v20 = objc_autoreleasePoolPush();
      uint64_t v21 = objc_alloc(&OBJC_CLASS___NSURL);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v19 path]);
      __int128 v23 = -[NSURL initFileURLWithPath:isDirectory:relativeToURL:]( v21,  "initFileURLWithPath:isDirectory:relativeToURL:",  v22,  0LL,  v83);

      __int128 v24 = v23;
      int v25 = open(-[NSURL fileSystemRepresentation](v24, "fileSystemRepresentation"), 0);
      if (v25 < 0)
      {
        uint64_t v63 = *__error();
        v95 = (const __CFString *)NSLocalizedDescriptionKey;
        stream.dst_ptr = (uint8_t *)@"Failed to open file for reading";
        v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &stream,  &v95,  1LL));
        v36 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v63,  v64));

        objc_autoreleasePoolPop(v20);
        id v9 = v75;
        id v8 = v76;
        id v10 = v74;
        if (!v36) {
          goto LABEL_67;
        }
        goto LABEL_70;
      }

      int v26 = v25;
      context = v20;
      if (![v19 fileSize])
      {
        v36 = 0LL;
        goto LABEL_29;
      }

      __int128 v27 = 0LL;
      unint64_t v28 = 0LL;
      while (2)
      {
        __int128 v29 = (char *)[v19 fileSize] - v28;
        __int128 v30 = (char *)[v85 chunkSize];
        if (v29 >= &v30[-v89]) {
          unint64_t v31 = (unint64_t)&v30[-v89];
        }
        else {
          unint64_t v31 = (unint64_t)v29;
        }
        v32 = &v88[v89];
        v33 = &v88[v89 + v31];
        while (v32 < v33)
        {
          ssize_t v34 = read(v26, v32, v33 - v32);
          v32 += v34;
          if (v34 < 0) {
            goto LABEL_27;
          }
        }

        if ((v31 & 0x8000000000000000LL) != 0)
        {
LABEL_27:
          uint64_t v37 = *__error();
          v93 = (const __CFString *)NSLocalizedDescriptionKey;
          v94 = @"Failed to read from file";
          v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v94,  &v93,  1LL));
          v36 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v37,  v38));

          break;
        }

        if ((id)(v31 + v89) == [v85 chunkSize])
        {
          NSErrorUserInfoKey v92 = v27;
          int v35 = v70[2](v70, v88, v31 + v89, &v92);
          v36 = v92;

          if (!v35)
          {
            v89 += v31;
            break;
          }

          uint64_t v89 = 0LL;
          __int128 v27 = v36;
        }

        else
        {
          v89 += v31;
          v36 = v27;
        }

        v28 += v31;
        break;
      }

LABEL_29:
      close(v26);
      objc_autoreleasePoolPop(context);
      if (v36)
      {

        id v9 = v75;
        id v8 = v76;
        id v10 = v74;
LABEL_70:
        if (a4)
        {
          v36 = v36;
          uint64_t v40 = 0LL;
          *a4 = v36;
        }

        else
        {
          uint64_t v40 = 0LL;
        }

        goto LABEL_75;
      }

      if ((id)++v18 == v80)
      {
        id v39 = [obj countByEnumeratingWithState:&v97 objects:v96 count:16];
        id v9 = v75;
        id v8 = v76;
        id v10 = v74;
        id v80 = v39;
        if (v39) {
          goto LABEL_7;
        }
        goto LABEL_65;
      }
    }
  }

  uint64_t v89 = 0LL;
LABEL_65:

LABEL_67:
  if (v89)
  {
    uint64_t v40 = v70[2](v70, v88, v89, a4);
    v36 = 0LL;
  }

  else
  {
    v36 = 0LL;
    uint64_t v40 = 1LL;
  }

LABEL_75:
  v65 = obj;
LABEL_85:

  free(v88);
  return v40;
}

void sub_10000BFF4(void *a1, uint64_t a2)
{
  if (a2)
  {
    (*(void (**)(void))(a1[6] + 16LL))();
  }

  else
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 56) makeURL:a1[5]]);
    (*(void (**)(void))(a1[6] + 16LL))();
  }
}

BOOL sub_10000C598(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  BOOL v3 = v1 && [v1 chunkSize] && (unint64_t)objc_msgSend(v2, "compressionAlgorithm") < 6;

  return v3;
}

void sub_10000C5E8(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[6];
  unsigned int v5 = (void *)a1[4];
  id v17 = 0LL;
  unsigned __int8 v6 = [v5 _finishSession:v4 error:&v17];
  id v7 = v17;
  id v8 = *(os_log_s **)(a1[4] + 8LL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v9) {
      sub_10000EE9C((uint64_t)(a1 + 6), v8, v3);
    }
    id v16 = *(void (**)(void))(a1[5] + 16LL);
  }

  else if ((v6 & 1) != 0)
  {
    if (v9) {
      sub_10000EE34((uint64_t)(a1 + 6), v8, v10, v11, v12, v13, v14, v15);
    }
    id v16 = *(void (**)(void))(a1[5] + 16LL);
  }

  else
  {
    if (v9) {
      sub_10000EE9C((uint64_t)(a1 + 6), v8, v7);
    }
    id v16 = *(void (**)(void))(a1[5] + 16LL);
  }

  v16();
}

void sub_10000CBA8(uint64_t a1)
{
  uint64_t v22 = 0LL;
  __int128 v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  int v25 = sub_10000CE14;
  int v26 = sub_10000CE24;
  id v27 = 0LL;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v21 = 0LL;
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  uint64_t v15 = sub_10000CE2C;
  id v16 = &unk_100030A80;
  uint64_t v4 = *(void **)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 88);
  uint64_t v19 = &v22;
  uint64_t v20 = v6;
  id v18 = v5;
  LOBYTE(v3) = GTFileWriterTransferFileEntries(v2, v3, v4, &v21, &v13);
  id v7 = v21;
  dispatch_time_t v8 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 2000000000LL);
  if (!dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 56) + 64LL), v8))
  {
    if (!v23[5])
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 56) + 64LL));
      [*(id *)(a1 + 72) stopAccessingSecurityScopedResource];
      uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 80) + 16LL);
      goto LABEL_5;
    }

LABEL_4:
    [*(id *)(a1 + 72) stopAccessingSecurityScopedResource];
    uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 80) + 16LL);
LABEL_5:
    v12();
    goto LABEL_6;
  }

  NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ hit a timeout: %@",  @"GTFileWriterService",  @"beginTransferSessionWithFileEntires timed out waiting for final write to complete",  v13,  v14,  v15,  v16,  v17));
  __int128 v29 = v9;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.transport",  6LL,  v10));

  [*(id *)(a1 + 72) stopAccessingSecurityScopedResource];
  (*(void (**)(void))(*(void *)(a1 + 80) + 16LL))();

LABEL_6:
  _Block_object_dispose(&v22, 8);
}

uint64_t sub_10000CE14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000CE24(uint64_t a1)
{
}

BOOL sub_10000CE2C(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  a2,  a3,  0LL));
  dispatch_time_t v7 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 2000000000LL);
  uint64_t v8 = dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1[4] + 64LL), v7);
  if (v8)
  {
    if (a4)
    {
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ hit a timeout: %@",  @"GTFileWriterService",  @"beginTransferSessionWithFileEntires timed out waiting for transfer to complete"));
      id v18 = v9;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.transport",  6LL,  v10));
    }
  }

  else
  {
    uint64_t v11 = objc_autoreleasePoolPush();
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000CFEC;
    v16[3] = &unk_100030A58;
    uint64_t v13 = a1[6];
    uint64_t v12 = a1[7];
    uint64_t v14 = (void *)a1[5];
    v16[4] = a1[4];
    v16[5] = v13;
    [v14 writeFileData:v6 sessionID:v12 completionHandler:v16];
    objc_autoreleasePoolPop(v11);
  }

  return v8 == 0;
}

void sub_10000CFEC(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v6 = *(void *)(v4 + 40);
  id v5 = (id *)(v4 + 40);
  if (!v6) {
    objc_storeStrong(v5, a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 64LL));
}

void sub_10000D51C(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (a2)
  {
    uint64_t nserror = xpc_dictionary_get_nserror(a2, "error");

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    uint64_t v6 = (void *)nserror;
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    uint64_t v6 = v7;
  }
}

void sub_10000D71C(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSURL);
    nsobject = xpc_dictionary_get_nsobject(v6, "url", v3);
    uint64_t nserror = (void *)xpc_dictionary_get_nserror(v6, "error");
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void sub_10000D968(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id nserror = (id)xpc_dictionary_get_nserror(a2, "error");
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, nserror);
  }

  else
  {
    (*(void (**)(void, uint64_t))(v3 + 16))(*(void *)(a1 + 32), a3);
  }

void sub_10000DAD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id nserror = (id)xpc_dictionary_get_nserror(a2, "error");
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, nserror);
  }

  else
  {
    (*(void (**)(void, uint64_t))(v3 + 16))(*(void *)(a1 + 32), a3);
  }

id sub_10000DF50(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) sendMessage:*(void *)(a1 + 32)];
}

id sub_10000E2C4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  xpc_dictionary_set_nsobject(v5, "url", a2);
  xpc_dictionary_set_nserror(*(void *)(a1 + 32), "error", v6);

  return [*(id *)(a1 + 40) sendMessage:*(void *)(a1 + 32)];
}

id sub_10000E680(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) sendMessage:*(void *)(a1 + 32)];
}

id sub_10000E7B0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) sendMessage:*(void *)(a1 + 32)];
}

BOOL sub_10000E7F8(id a1, NSURL *a2, NSError *a3)
{
  return 1;
}

id sub_10000E800(void *a1, void *a2)
{
  id v11 = 0LL;
  id v3 = a2;
  [a1 getResourceValue:&v11 forKey:NSURLCanonicalPathKey error:0];
  id v4 = v11;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pathComponents]);
  id v10 = 0LL;
  [v3 getResourceValue:&v10 forKey:NSURLCanonicalPathKey error:0];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v10 pathComponents]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "subarrayWithRange:",  objc_msgSend(v6, "count"),  (_BYTE *)objc_msgSend(v5, "count") - (_BYTE *)objc_msgSend(v6, "count")));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v7));
  return v8;
}

void sub_10000E904( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000E91C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000E938( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000E948(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

id sub_10000E984(uint64_t a1, void *a2)
{
  return a2;
}

void sub_10000E990( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000E9C0()
{
}

void sub_10000EA20( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000EA50()
{
}

void sub_10000EAB0()
{
}

void sub_10000EB10()
{
}

void sub_10000EB70(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_10000E92C();
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to transfer archive, %@", v5, 0xCu);
}

void sub_10000EC10( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000EC40()
{
}

void sub_10000ECA0()
{
}

void sub_10000ED00()
{
}

void sub_10000ED60()
{
}

void sub_10000EDC0()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  sub_10000E948((void *)&_mh_execute_header, v1, (uint64_t)v1, "transferIdentifier %@ to device %@", v2);
  sub_10000E914();
}

void sub_10000EE34( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000EE9C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (os_log_s *)sub_10000E984(a1, a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a3 localizedDescription]);
  sub_10000E964();
  sub_10000E948((void *)&_mh_execute_header, v4, v6, "Transfer session %llu failed with error %@", v7);

  sub_10000E954();
}

void sub_10000F51C(uint64_t a1, void *a2)
{
  if (a2)
  {
    nsdata = xpc_dictionary_get_nsdata(a2, "signature");
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

void sub_10000F660(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id nserror = (void *)xpc_dictionary_get_nserror(v3, "error");
    if (nserror)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    }

    else
    {
      xpc_object_t dictionary = xpc_dictionary_get_dictionary(v4, "processState");
      id v7 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
      if (v7)
      {
        uint64_t v8 = objc_alloc_init(&OBJC_CLASS___GTProcessState);
        -[GTProcessState setIsSuspended:](v8, "setIsSuspended:", xpc_dictionary_get_BOOL(v7, "isSuspended"));
      }

      else
      {
        BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Deserialization failed for %@",  @"processState",  NSLocalizedDescriptionKey));
        uint64_t v12 = v9;
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
        uint64_t v8 = (GTProcessState *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.transport",  10LL,  v10));
      }

      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    }
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

LABEL_18:
  __int128 v23 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(NSString) forKey:@"arguments"];
  uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
  arguments = v5->_arguments;
  v5->_arguments = (NSArray *)v24;

  int v26 = v5->_arguments;
  if (v26)
  {
    id v27 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
    {
      __int128 v53 = 0u;
      size_t v54 = 0u;
      int v51 = 0u;
      unint64_t v52 = 0u;
      int v26 = v5->_arguments;
      NSErrorUserInfoKey v28 = -[NSArray countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v51,  v60,  16LL);
      if (v28)
      {
        __int128 v29 = v28;
        __int128 v30 = *(void *)v52;
        while (2)
        {
          for (j = 0LL; j != v29; j = (char *)j + 1)
          {
            if (*(void *)v52 != v30) {
              objc_enumerationMutation(v26);
            }
            v32 = *(void *)(*((void *)&v51 + 1) + 8LL * (void)j);
            v33 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v32, v33) & 1) == 0)
            {
              ssize_t v34 = v5->_arguments;
              v5->_arguments = (NSArray *)&__NSArray0__struct;

              goto LABEL_32;
            }
          }

          __int128 v29 = -[NSArray countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v51,  v60,  16LL);
          if (v29) {
            continue;
          }
          break;
        }
      }

      goto LABEL_32;
    }

    int v26 = v5->_arguments;
  }

  v5->_arguments = (NSArray *)&__NSArray0__struct;
LABEL_32:

  int v35 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"deviceUDID"];
  v36 = objc_claimAutoreleasedReturnValue(v35);
  deviceUDID = v5->_deviceUDID;
  v5->_deviceUDID = (NSString *)v36;

  v38 = v5->_deviceUDID;
  if (!v38 || (id v39 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v38, v39) & 1) == 0))
  {
    uint64_t v40 = objc_claimAutoreleasedReturnValue(+[GTDeviceProperties uniqueDeviceID](&OBJC_CLASS___GTDeviceProperties, "uniqueDeviceID", (void)v51));
    id v41 = v5->_deviceUDID;
    v5->_deviceUDID = (NSString *)v40;
  }

  unsigned int v42 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"sessionUUID"];
  v43 = objc_claimAutoreleasedReturnValue(v42);
  sessionUUID = v5->_sessionUUID;
  v5->_sessionUUID = (NSUUID *)v43;

  unsigned int v45 = v5->_sessionUUID;
  if (!v45 || (v46 = objc_opt_class(&OBJC_CLASS___NSUUID), (objc_opt_isKindOfClass(v45, v46) & 1) == 0))
  {
    id v47 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID", (void)v51));
    v48 = v5->_sessionUUID;
    v5->_sessionUUID = (NSUUID *)v47;
  }

  id v49 = v5;
LABEL_39:

  return v5;
}

          id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9));
          -[GTDeviceProperties setBuildVersion:](v2, "setBuildVersion:", v10);

          free(v9);
          goto LABEL_19;
        }
    }

    int v25 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"deviceUDID"];
    int v26 = objc_claimAutoreleasedReturnValue(v25);
    deviceUDID = v5->_deviceUDID;
    v5->_deviceUDID = (NSString *)v26;

    NSErrorUserInfoKey v28 = v5->_deviceUDID;
    if (v28)
    {
      __int128 v29 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v28, v29) & 1) == 0)
      {
        __int128 v30 = v5->_deviceUDID;
        v5->_deviceUDID = 0LL;
      }
    }

    v5->_servicePort = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", @"servicePort", (void)v32);
    v5->_platform = [v4 decodeInt64ForKey:@"platform"];
    v5->_version = (unint64_t)[v4 decodeInt64ForKey:@"version"];
  }

  return v5;
}
    }

    int v25 = objc_opt_class(&OBJC_CLASS___NSString);
    int v26 = [v4 decodeDictionaryWithKeysOfClass:v25 objectsOfClass:objc_opt_class(NSString) forKey:@"environment"];
    id v27 = objc_claimAutoreleasedReturnValue(v26);
    environment = v5->_environment;
    v5->_environment = (NSDictionary *)v27;

    __int128 v29 = v5->_environment;
    if (v29)
    {
      __int128 v30 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
      {
        unint64_t v52 = 0u;
        __int128 v53 = 0u;
        int v50 = 0u;
        int v51 = 0u;
        unint64_t v31 = v5->_environment;
        v32 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v50,  v59,  16LL);
        if (v32)
        {
          v33 = v32;
          ssize_t v34 = *(void *)v51;
          while (2)
          {
            for (j = 0LL; j != v33; j = (char *)j + 1)
            {
              if (*(void *)v51 != v34) {
                objc_enumerationMutation(v31);
              }
              v36 = *(void *)(*((void *)&v50 + 1) + 8LL * (void)j);
              uint64_t v37 = objc_opt_class(&OBJC_CLASS___NSString);
              char isKindOfClass = objc_opt_isKindOfClass(v36, v37);
              id v39 = v5->_environment;
              if ((isKindOfClass & 1) == 0) {
                goto LABEL_33;
              }
              uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v39,  "objectForKeyedSubscript:",  v36,  (void)v50));
              id v41 = objc_opt_class(&OBJC_CLASS___NSString);
              unsigned int v42 = objc_opt_isKindOfClass(v40, v41);

              if ((v42 & 1) == 0)
              {
                id v39 = v5->_environment;
LABEL_33:
                v5->_environment = 0LL;

                goto LABEL_34;
              }
            }

            v33 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v50,  v59,  16LL);
            if (v33) {
              continue;
            }
            break;
          }
        }
      }

      else
      {
        unint64_t v31 = v5->_environment;
        v5->_environment = 0LL;
      }

BOOL IsServicePort(unint64_t a1)
{
  return a1 >> 30 == 0;
}

void MessagePathPush(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = xpc_uint64_create(a2);
  xpc_dictionary_array_push(v3, "_pathHistory", v4);
}

uint64_t MessagePathPop(void *a1)
{
  id v1 = xpc_dictionary_array_pop(a1, "_replyPath");
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = v2;
  if (v2) {
    uint64_t value = xpc_uint64_get_value(v2);
  }
  else {
    uint64_t value = 0LL;
  }

  return value;
}

uint64_t MessagePathEndsWith(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (!v4 || !xpc_array_get_count(v4))
  {
LABEL_12:
    uint64_t v7 = 1LL;
    goto LABEL_13;
  }

  if (v3)
  {
    size_t count = xpc_array_get_count(v5);
    if (count <= xpc_array_get_count(v3))
    {
      if (xpc_array_get_count(v3))
      {
        size_t v8 = 0LL;
        uint64_t v9 = -1LL;
        while (v8 < xpc_array_get_count(v5))
        {
          size_t v10 = xpc_array_get_count(v3) + v9;
          size_t v11 = xpc_array_get_count(v5) + v9;
          uint64_t uint64 = xpc_array_get_uint64(v3, v10);
          ++v8;
          --v9;
          uint64_t v7 = 1LL;
          if (v8 >= xpc_array_get_count(v3)) {
            goto LABEL_13;
          }
        }
      }

      goto LABEL_12;
    }
  }

LABEL_5:
  uint64_t v7 = 0LL;
LABEL_13:

  return v7;
}

  if (apr_pool_create_ex(&newpool, 0LL, 0LL, 0LL)) {
    return 20002;
  }
  id v1 = 0;
  *((void *)newpool + 10) = "apr_initialize";
  return v1;
}

BOOL MessageIsStreamReply(void *a1)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, "_replyPath");
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(value);
  BOOL v3 = v2 != 0LL;

  return v3;
}

BOOL MessageHasReply(void *a1)
{
  id v1 = a1;
  BOOL v2 = (xpc_dictionary_get_flag(v1, "_flags", 0) & 1) != 0 || xpc_dictionary_get_BOOL(v1, "_reply");

  return v2;
}

void MessageSetHasReply(void *a1)
{
  xpc_object_t xdict = a1;
  xpc_dictionary_set_flag(xdict, "_flags", 0);
  xpc_dictionary_set_BOOL(xdict, "_reply", 1);
}

BOOL MessageRecordsPathHistory(void *a1)
{
  id v1 = a1;
  if ((xpc_dictionary_get_flag(v1, "_flags", 2) & 1) != 0)
  {
    BOOL v2 = 1LL;
  }

  else
  {
    xpc_object_t value = xpc_dictionary_get_value(v1, "_replyStreamId");
    id v4 = (void *)objc_claimAutoreleasedReturnValue(value);
    BOOL v2 = v4 != 0LL;
  }

  return v2;
}

BOOL MessageIsValid(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = v3;
  if (!v3)
  {
    if (a2)
    {
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Encountered an XPC error: %@",  @"Message is nil"));
      uint64_t v22 = v5;
      uint64_t v6 = &v22;
      uint64_t v7 = &v21;
      goto LABEL_8;
    }

BOOL MessageVisit(void *a1, const char *a2)
{
  id v3 = a1;
  BOOL v4 = xpc_dictionary_string_array_contains(v3, "_visited", (uint64_t)a2);
  if (!v4)
  {
    xpc_object_t v5 = xpc_string_create(a2);
    xpc_dictionary_array_push(v3, "_visited", v5);
  }

  return !v4;
}

uint64_t sub_100010914(void *a1)
{
  if (a1[7])
  {
    unint64_t v2 = 0LL;
    do
    {
      (*(void (**)(void))(a1[5] + 16LL))();
      ++v2;
    }

    while (v2 < a1[7]);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16LL))();
}

void sub_100010E08(uint64_t a1, void *a2)
{
  if (a2)
  {
    id nsdictionary_any = xpc_dictionary_get_nsdictionary_any(a2, "data");
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

void sub_1000110D8(uint64_t a1, void *a2)
{
  if (a2)
  {
    id nsdictionary_any = xpc_dictionary_get_nsdictionary_any(a2, "result");
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    objc_msgSend( *(id *)(*(void *)(a1 + 32) + 8),  "deregisterDispatcher:",  objc_msgSend(*(id *)(a1 + 40), "dispatcherId"));
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

id sub_1000113C4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) sendMessage:*(void *)(a1 + 32)];
}

void sub_100011544(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t xdict = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(xdict, "_port", *(void *)(a1 + 56));
  xpc_dictionary_set_value(xdict, "_replyPath", *(xpc_object_t *)(a1 + 32));
  xpc_dictionary_set_nsobject(xdict, "data", (uint64_t)v3);

  if (++*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) == *(void *)(a1 + 64)) {
    xpc_dictionary_set_BOOL(xdict, "_endOfStream", 1);
  }
  [*(id *)(a1 + 40) sendMessage:xdict];
}

void sub_100011788(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t xdict = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(xdict, "_port", *(void *)(a1 + 48));
  xpc_dictionary_set_value(xdict, "_replyPath", *(xpc_object_t *)(a1 + 32));
  xpc_dictionary_set_nsobject(xdict, "data", (uint64_t)v3);

  MessageSetHasReply(xdict);
  id v4 = [*(id *)(a1 + 40) sendMessageWithReplySync:xdict error:0];
}

id sub_10001181C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  xpc_dictionary_set_BOOL(v3, "_endOfStream", 1);
  xpc_dictionary_set_nsobject(*(void **)(a1 + 32), "result", (uint64_t)v4);

  return [*(id *)(a1 + 40) sendMessage:*(void *)(a1 + 32)];
}

LABEL_15:
}

uint64_t sub_1000120C8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000120D8(uint64_t a1)
{
}

void sub_1000120E0(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100012444(uint64_t a1, void *a2)
{
  return [a2 notifyServiceListChanged:*(void *)(a1 + 32)];
}

void sub_100012B0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id nserror = (id)xpc_dictionary_get_nserror(a2, "error");
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, nserror);
  }

  else
  {
    (*(void (**)(void, uint64_t))(v3 + 16))(*(void *)(a1 + 32), a3);
  }

id sub_1000135FC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) sendMessage:*(void *)(a1 + 32)];
}

id sub_100013730(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) sendMessage:*(void *)(a1 + 32)];
}

void sub_1000139D4(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Invalid remote properties - unable to locate remote service",  v1,  2u);
}

id allServicesForDeviceUDID(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "_cmd", "allServices");
  if (v4) {
    xpc_dictionary_set_string( empty, "_device_dest", (const char *)[v4 UTF8String]);
  }
  MessageSetHasReply(empty);
  uint64_t v10 = 0LL;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 sendMessageWithReplySync:empty error:&v10]);
  if (v6)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___GTProcessService);
    nsarray = (void *)xpc_dictionary_get_nsarray(v6, "returnValue", v7);
  }

  else
  {
    [v3 setError:0];
    nsarray = 0LL;
  }

  return nsarray;
}

id filteredArrayByService(void *a1, Protocol *a2)
{
  id v3 = a1;
  id v4 = NSStringFromProtocol(a2);
  xpc_object_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "serviceProperties", (void)v18));
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 protocolName]);
        unsigned int v15 = [v14 isEqualToString:v5];

        if (v15) {
          -[NSMutableArray addObject:](v6, "addObject:", v12);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v9);
  }

  id v16 = -[NSMutableArray copy](v6, "copy");
  return v16;
}

id filteredArrayByPID(void *a1, int a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        size_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "processInfo", (void)v14));
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  id v12 = -[NSMutableArray copy](v4, "copy");
  return v12;
}

id filteredArrayByPort(void *a1, id a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        size_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serviceProperties", (void)v14));
        if ([v11 servicePort] == a2) {
          -[NSMutableArray addObject:](v4, "addObject:", v10);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  id v12 = -[NSMutableArray copy](v4, "copy");
  return v12;
}

LABEL_22:
        _os_assumes_log(0LL);
        if (!v9) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
    }

    id v9 = 0LL;
    goto LABEL_22;
  }

LABEL_20:
  return v2;
}

id newSetWithArrayMinusArray(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = -[NSMutableSet initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithArray:", v4);

  id v6 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v3);
  -[NSMutableSet minusSet:](v5, "minusSet:", v6);

  id v7 = -[NSMutableSet copy](v5, "copy");
  return v7;
}

void xpc_dictionary_set_nsobject(void *a1, const char *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v7 = 0LL;
    id v5 = a1;
    id v6 = objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1LL, &v7));
    xpc_dictionary_set_data(v5, a2, [v6 bytes], (size_t)objc_msgSend(v6, "length"));
  }

void xpc_dictionary_set_nsdata(void *a1, const char *a2, id a3)
{
  if (a3)
  {
    id v5 = a3;
    xpc_object_t xdict = a1;
    id v6 = [v5 bytes];
    id v7 = [v5 length];

    xpc_dictionary_set_data(xdict, a2, v6, (size_t)v7);
  }

NSData *xpc_dictionary_get_nsdata(void *a1, const char *a2)
{
  uint64_t result = (NSData *)xpc_dictionary_get_data(a1, a2, &length);
  if (result)
  {
    id v3 = result;
    id v4 = objc_alloc(&OBJC_CLASS___NSData);
    return -[NSData initWithBytes:length:](v4, "initWithBytes:length:", v3, length);
  }

  return result;
}

NSData *xpc_dictionary_get_nsdata_nocopy(void *a1, const char *a2)
{
  uint64_t result = (NSData *)xpc_dictionary_get_data(a1, a2, &length);
  if (result)
  {
    id v3 = result;
    id v4 = objc_alloc(&OBJC_CLASS___NSData);
    return -[NSData initWithBytesNoCopy:length:freeWhenDone:]( v4,  "initWithBytesNoCopy:length:freeWhenDone:",  v3,  length,  0LL);
  }

  return result;
}

void *xpc_dictionary_get_nsobject(void *a1, const char *a2, uint64_t a3)
{
  nsdata_nocopy = xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (!nsdata_nocopy) {
    goto LABEL_5;
  }
  uint64_t v8 = 0LL;
  uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  a3,  nsdata_nocopy,  &v8));
  id v6 = (void *)v5;
  if (v5 && (objc_opt_isKindOfClass(v5, a3) & 1) == 0)
  {

LABEL_5:
    id v6 = 0LL;
  }

  return v6;
}

uint64_t sub_100015370(void *a1, const char *a2)
{
  id v2 = a1;
  id v3 = objc_alloc(&OBJC_CLASS___NSSet);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSError);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNull);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSSet);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
  id v12 = -[NSSet initWithObjects:]( v3,  "initWithObjects:",  v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  objc_opt_class(&OBJC_CLASS___NSUUID),  0LL);
  uint64_t nsobject_classes = xpc_dictionary_get_nsobject_classes(v2, a2, v12);

  return nsobject_classes;
}

uint64_t xpc_dictionary_get_nsarray(void *a1, const char *a2, uint64_t a3)
{
  nsdata_nocopy = xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    uint64_t v7 = 0LL;
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedArrayOfObjectsOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedArrayOfObjectsOfClass:fromData:error:",  a3,  nsdata_nocopy,  &v7));
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

uint64_t xpc_dictionary_get_nsdictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  nsdata_nocopy = xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    uint64_t v9 = 0LL;
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:",  a3,  a4,  nsdata_nocopy,  &v9));
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

uint64_t xpc_dictionary_get_nsobject_classes(void *a1, const char *a2, void *a3)
{
  id v5 = a3;
  nsdata_nocopy = xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    uint64_t v9 = 0LL;
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v5,  nsdata_nocopy,  &v9));
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

id xpc_dictionary_get_nsdictionary_any(void *a1, const char *a2)
{
  id v2 = (void *)sub_100015370(a1, a2);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0) {
    uint64_t v4 = v2;
  }
  else {
    uint64_t v4 = 0LL;
  }
  id v5 = v4;

  return v5;
}

const char *xpc_error_string(void *a1)
{
  uint64_t result = xpc_dictionary_get_string(a1, _xpc_error_key_description);
  if (!result) {
    return "Unknown";
  }
  return result;
}

void xpc_dictionary_set_flag(void *a1, const char *a2, char a3)
{
  xpc_object_t xdict = a1;
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, a2);
  xpc_dictionary_set_uint64(xdict, a2, uint64 | (1LL << a3));
}

uint64_t xpc_dictionary_get_flag(void *a1, const char *a2, char a3)
{
  return (xpc_dictionary_get_uint64(a1, a2) >> a3) & 1;
}

id xpc_array_pop(void *a1)
{
  id v1 = a1;
  size_t count = xpc_array_get_count(v1);
  if (count)
  {
    size_t v3 = count - 1;
    while (1)
    {
      xpc_object_t value = xpc_array_get_value(v1, v3);
      id v5 = (void *)objc_claimAutoreleasedReturnValue(value);
      if (xpc_get_type(v5) != (xpc_type_t)&_xpc_type_null) {
        break;
      }

      if (--v3 == -1LL) {
        goto LABEL_5;
      }
    }

    xpc_object_t v6 = xpc_null_create();
    xpc_array_set_value(v1, v3, v6);
  }

  else
  {
LABEL_5:
    id v5 = 0LL;
  }

  return v5;
}

void xpc_dictionary_array_push(void *a1, const char *a2, void *a3)
{
  xpc_object_t value = a3;
  id v5 = a1;
  xpc_object_t array = xpc_dictionary_get_array(v5, a2);
  xpc_object_t empty = (xpc_object_t)objc_claimAutoreleasedReturnValue(array);
  if (!empty) {
    xpc_object_t empty = xpc_array_create_empty();
  }
  xpc_array_append_value(empty, value);
  xpc_dictionary_set_value(v5, a2, empty);
}

id xpc_dictionary_array_pop(void *a1, const char *a2)
{
  id v3 = a1;
  xpc_object_t array = xpc_dictionary_get_array(v3, a2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(array);
  xpc_object_t v6 = v5;
  if (v5)
  {
    id v7 = xpc_array_pop(v5);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    xpc_dictionary_set_value(v3, a2, v6);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

BOOL xpc_dictionary_string_array_contains(void *a1, const char *a2, uint64_t a3)
{
  xpc_object_t array = xpc_dictionary_get_array(a1, a2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(array);
  xpc_object_t v6 = v5;
  if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_array)
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000LL;
    char v13 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100015950;
    v9[3] = &unk_100030CB0;
    v9[4] = &v10;
    v9[5] = a3;
    xpc_array_apply(v6, v9);
    BOOL v7 = *((_BYTE *)v11 + 24) != 0;
    _Block_object_dispose(&v10, 8);
  }

  else
  {
    BOOL v7 = 0LL;
  }

  return v7;
}

uint64_t sub_100015950(uint64_t a1, int a2, xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  if (!string_ptr) {
    return 1LL;
  }
  int v5 = strcmp(*(const char **)(a1 + 40), string_ptr);
  uint64_t result = 1LL;
  if (!v5)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    return 0LL;
  }

  return result;
}

xpc_object_t gt_xpc_dictionary_create_reply(void *a1)
{
  return xpc_dictionary_create_reply(a1);
}

void sub_100015BB8(void *a1)
{
  id v1 = *(void **)(a1[4] + 32LL);
  if (v1)
  {
    uint64_t v2 = a1[5];
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a1[6]));
    [v1 setObject:v2 forKeyedSubscript:v3];
  }

void sub_100015CC8(void *a1)
{
  id v1 = *(void **)(a1[4] + 32LL);
  if (v1)
  {
    uint64_t v2 = a1[5];
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a1[6]));
    [v1 setObject:v2 forKeyedSubscript:v3];
  }

void sub_100015D8C(uint64_t a1)
{
  id v1 = *(void **)(*(void *)(a1 + 32) + 32LL);
  if (v1)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(a1 + 40)));
    [v1 removeObjectForKey:v2];
  }

void sub_100015E9C(uint64_t a1)
{
  if (xpc_dictionary_get_flag(*(void **)(a1 + 32), "_flags", 1))
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 40) + 32LL);
    id v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v14 != v5) {
            objc_enumerationMutation(v2);
          }
          BOOL v7 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          if (IsServicePort((unint64_t)[v7 unsignedLongLongValue]))
          {
            uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 32) objectForKeyedSubscript:v7]);
            [v8 dispatchMessage:*(void *)(a1 + 32) replyConnection:*(void *)(a1 + 48)];
          }
        }

        id v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v4);
    }
  }

  else
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "_port");
    uint64_t v10 = *(void **)(*(void *)(a1 + 40) + 32LL);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  uint64));
    id v12 = (id)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);

    [v12 dispatchMessage:*(void *)(a1 + 32) replyConnection:*(void *)(a1 + 48)];
  }

void sub_100016130(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = 0LL;
  BOOL IsValid = MessageIsValid(v3, &v6);
  id v5 = v6;
  if (!IsValid)
  {

    id v3 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000162B4(uint64_t a1)
{
}

void sub_1000163A4(id *a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (dispatch_queue_s **)objc_loadWeakRetained(a1 + 6);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[3];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100016474;
    v7[3] = &unk_100030DA0;
    id v8 = v3;
    uint64_t v9 = v5;
    id v10 = a1[4];
    id v11 = a1[5];
    dispatch_async(v6, v7);
  }
}

void *sub_100016474(uint64_t a1)
{
  if (xpc_get_type(*(xpc_object_t *)(a1 + 32)) == (xpc_type_t)&_xpc_type_error)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 40LL), *(id *)(a1 + 32));
    id v2 = (void *)(a1 + 48);
  }

  else
  {
    id v2 = (void *)(a1 + 56);
  }

  return (*(void *(**)(void *__return_ptr))(*v2 + 16LL))(v2);
}

void sub_100016534(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0LL;
}

LABEL_34:
    }

    v43 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"bundleIdentifier"];
    v44 = objc_claimAutoreleasedReturnValue(v43);
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v44;

    v46 = v5->_bundleIdentifier;
    if (v46)
    {
      id v47 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v46, v47) & 1) == 0)
      {
        v48 = v5->_bundleIdentifier;
        v5->_bundleIdentifier = 0LL;
      }
    }

    v5->_processIdentifier = objc_msgSend( v4,  "decodeInt32ForKey:",  @"processIdentifier",  (void)v50);
    v5->_ppid = [v4 decodeInt32ForKey:@"ppid"];
  }

  return v5;
}

uint64_t start()
{
  size_t v6 = 8LL;
  uint64_t v7 = 0LL;
  if (sysctlbyname("security.mac.amfi.developer_mode_status", &v7, &v6, 0LL, 0LL))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    int v3 = *__error();
    *(_DWORD *)buf = 67109120;
    int v9 = v3;
    id v4 = "Failed to read developer mode status: %{darwin.errno}d";
    uint32_t v5 = 8;
    goto LABEL_8;
  }

  if (v7 != 1)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    id v4 = "Service prohibited from running (developer mode not enabled)";
    uint32_t v5 = 2;
LABEL_8:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v4, buf, v5);
LABEL_9:
    exit(1);
  }

  MTLSetReportFailureBlock(&stru_100030E28);
  uint64_t v0 = objc_autoreleasePoolPush();
  GTTransportEnvironment_init();
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___GTServiceDaemon);
  -[GTServiceDaemon enterRunLoop](v1, "enterRunLoop");

  objc_autoreleasePoolPop(v0);
  return 0LL;
}

void sub_100017EEC(id a1, unint64_t a2, const char *a3, unsigned int a4, NSString *a5)
{
  int v8 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109890;
    v9[1] = v8;
    __int16 v10 = 2080;
    id v11 = a3;
    __int16 v12 = 1024;
    unsigned int v13 = a4;
    __int16 v14 = 2080;
    __int128 v15 = -[NSString UTF8String](a5, "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Metal Validation Error found: ! %d, %s, %d, %s",  (uint8_t *)v9,  0x22u);
  }

LABEL_26:
}

LABEL_6:
}

id sub_100019F94(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472LL;
    applier[2] = sub_10001A028;
    applier[3] = &unk_100030EA0;
    id v7 = *(id *)(a1 + 32);
    xpc_dictionary_apply(a2, applier);
  }

  else
  {
    xpc_dictionary_set_nserror(*(void *)(a1 + 32), "_error", a3);
  }

  return [*(id *)(a1 + 40) updateAndRelayMessage:*(void *)(a1 + 32) fromConnection:*(void *)(a1 + 48) toConnection:*(void *)(a1 + 56)];
}

uint64_t sub_10001A028(uint64_t a1, const char *a2, void *a3)
{
  return 1LL;
}

char *sub_10001A044(void *a1)
{
  string = (char *)xpc_dictionary_get_string(a1, "_device_dest");
  if (string) {
    string = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
  }
  return string;
}

void sub_10001A078(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [*(id *)(a1 + 32) handleMessage:v4 fromConnection:WeakRetained];
  }
}

void sub_10001A0CC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [*(id *)(a1 + 32) handleDisconnection:WeakRetained];
    id WeakRetained = v3;
  }
}

void sub_10001A114(uint64_t a1, void *a2)
{
  xpc_object_t object = a2;
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_connection)
  {
    [*(id *)(a1 + 32) handleConnection:object];
  }

  else
  {
    id v3 = xpc_copy_description(object);

    id v4 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Listener: received object:%s", buf, 0xCu);
    }

    free(v3);
  }

uint64_t sub_10001BBBC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_10001BBC8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001BBD8(uint64_t a1)
{
}

void sub_10001BBE0(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001BC3C(void *a1, char a2, void *a3)
{
  id v6 = a3;
  *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = a2;
  if ((a2 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8LL) + 40LL), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8LL) + 40LL));
}

void sub_10001BCB0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    int v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
  }

  else
  {
    if (v6)
    {
      int v9 = *(void **)(*(void *)(a1 + 32) + 8LL);
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
      {
        __int16 v10 = v9;
        id v11 = objc_claimAutoreleasedReturnValue([v7 description]);
        int v12 = 136315138;
        id v13 = [v11 UTF8String];
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Cannot bring app to foreground: error = %s",  (uint8_t *)&v12,  0xCu);
      }
    }

    int v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
  }

  v8();
}

void sub_10001BDD4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = *(void **)(*(void *)(a1 + 32) + 8LL);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = v7;
      __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
      int v11 = 138412290;
      int v12 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Error Launching Replayer: %@",  (uint8_t *)&v11,  0xCu);
    }

    int v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
  }

  else
  {
    int v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
  }

  v8();
}

void sub_10001BEEC(uint64_t a1)
{
  uint64_t v2 = CSSymbolicatorCreateWithPid(*(unsigned int *)(a1 + 40));
  uint64_t v4 = v3;
  if ((CSIsNull() & 1) != 0)
  {
    id Signature = 0LL;
  }

  else
  {
    id Signature = (id)CSSymbolicatorCreateSignature(v2, v4, 0LL);
    CSRelease(v2, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10001C428(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  if (a2)
  {
    id v5 = a2;
    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "processState", empty);
    unsigned __int8 v7 = [v5 isSuspended];

    xpc_dictionary_set_BOOL(empty, "isSuspended", v7);
  }

  xpc_dictionary_set_nserror(*(void *)(a1 + 32), "error", v8);
  [*(id *)(a1 + 40) sendMessage:*(void *)(a1 + 32)];
}

id sub_10001C4D0(uint64_t a1, id a2)
{
  return [*(id *)(a1 + 40) sendMessage:*(void *)(a1 + 32)];
}

id sub_10001C8FC(const uint8_t *a1)
{
  uint64_t v10 = 2049LL;
  uint64_t v9 = 49680LL;
  uint64_t v2 = (uint8_t *)calloc(1uLL, 0xC210uLL);
  size_t v3 = compression_encode_buffer(v2, 0xC210uLL, a1, 0xC210uLL, 0LL, COMPRESSION_LZFSE);
  int v7 = 1;
  int v8 = 1;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", &v8, 4LL);
  -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", &v7, 4LL);
  -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", &v10, 8LL);
  -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", &v9, 8LL);
  -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", v2, v3);
  free(v2);
  id v5 = -[NSMutableData copy](v4, "copy");

  return v5;
}

uint8_t *sub_10001C9E4(const uint8_t *a1, size_t a2, uint64_t a3, size_t a4, size_t a5, uint64_t a6)
{
  if (a4 <= a5) {
    unint64_t v10 = a5;
  }
  else {
    unint64_t v10 = a4;
  }
  uint64_t result = (uint8_t *)sub_10001F078(a6, v10);
  if (result)
  {
    int v12 = result;
    bzero(result, v10);
    if (a3)
    {
      size_t v13 = compression_decode_buffer(v12, a4, a1, a2, 0LL, (compression_algorithm)a3);
      uint64_t result = 0LL;
      if (v13 != a4) {
        return result;
      }
    }

    else
    {
      if (a2 < a4) {
        return 0LL;
      }
      memcpy(v12, a1, a4);
    }

    return v12;
  }

  return result;
}

uint64_t sub_10001CA98(void *a1, uint64_t a2, _BYTE *a3)
{
  v14[0] = 0LL;
  v14[1] = 0LL;
  if (a3) {
    *a3 = 0;
  }
  id v5 = a1;
  unint64_t v6 = (unint64_t)[v5 length];
  id v7 = v5;
  id v8 = [v7 bytes];

  if (v6 <= 3
    || (int v9 = *(_DWORD *)v8, *(_DWORD *)v8 >= 2u)
    || (v6 & 0xFFFFFFFFFFFFFFFCLL) == 4
    || (v6 & 0xFFFFFFFFFFFFFFF8LL) == 8
    || (v6 & 0xFFFFFFFFFFFFFFF0LL) == 0x10)
  {
LABEL_8:
    if (a3)
    {
      uint64_t result = 0LL;
      *a3 = 1;
      return result;
    }

    return 0LL;
  }

  uint64_t v11 = *((void *)v8 + 2);
  if (v11)
  {
    unint64_t v12 = *((void *)v8 + 3);
    size_t v13 = (char *)sub_10001C9E4((const uint8_t *)v8 + 32, v6 - 32, *((void *)v8 + 1), v12 * v11, v12 * v11, a2);
    if (v13)
    {
      sub_10001CBB4(v13, (uint64_t)v14, v12, v11, v9, a3, a2);
      return v14[0];
    }

    goto LABEL_8;
  }

  return 0LL;
}

char *sub_10001CBB4( char *result, uint64_t a2, unint64_t a3, uint64_t a4, int a5, _BYTE *a6, uint64_t a7)
{
  if (a5 == 1 && (uint64_t v11 = result, v12 = 24 * a4, (result = (char *)sub_10001F078(a7, 24 * a4)) != 0LL))
  {
    size_t v13 = result;
    bzero(result, v12);
    if (a3 >= 0x18) {
      size_t v14 = 24LL;
    }
    else {
      size_t v14 = a3;
    }
    __int128 v15 = v13;
    uint64_t v16 = a4;
    do
    {
      uint64_t result = (char *)memcpy(v15, v11, v14);
      v15 += 24;
      v11 += a3;
      --v16;
    }

    while (v16);
    *(void *)a2 = v13;
    *(_DWORD *)(a2 + 8) = a4;
  }

  else if (a6)
  {
    *a6 = 1;
  }

  return result;
}

uint64_t sub_10001CC70(void *a1, uint64_t a2, _BYTE *a3)
{
  v15[0] = 0LL;
  v15[1] = 0LL;
  if (a3) {
    *a3 = 0;
  }
  id v5 = a1;
  unint64_t v6 = (unint64_t)[v5 length];
  id v7 = v5;
  id v8 = (unsigned int *)[v7 bytes];

  if (v6 <= 3
    || (uint64_t v9 = *v8, v9 >= 2)
    || (v6 & 0xFFFFFFFFFFFFFFFCLL) == 4
    || (v6 & 0xFFFFFFFFFFFFFFF8LL) == 8
    || v6 - 16 <= 0x17)
  {
LABEL_8:
    if (a3)
    {
      uint64_t result = 0LL;
      *a3 = 1;
      return result;
    }

    return 0LL;
  }

  unint64_t v11 = *((void *)v8 + 2);
  if (v11)
  {
    unint64_t v12 = *((void *)v8 + 3);
    uint64_t v13 = *((void *)v8 + 4);
    size_t v14 = (char *)sub_10001C9E4( (const uint8_t *)v8 + 40,  v6 - 40,  *((void *)v8 + 1),  (v13 + v12) * v11,  (v13 + v12) * v11,  a2);
    if (v14)
    {
      sub_10001CD94(v14, (uint64_t)v15, v12, v13, v11, v9, a3, a2);
      return v15[0];
    }

    goto LABEL_8;
  }

  return 0LL;
}

void sub_10001CD94( char *a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, _BYTE *a7, uint64_t a8)
{
  if (a6 != 1 || (v14 = 24 * a5, (__int128 v15 = (void *)sub_10001F078(a8, 24 * a5)) == 0LL))
  {
    BOOL v21 = 0;
    if (!a7) {
      return;
    }
    goto LABEL_35;
  }

  uint64_t v16 = v15;
  uint64_t v38 = a2;
  id v39 = a7;
  bzero(v15, v14);
  if (a3 >= 0x10) {
    size_t v17 = 16LL;
  }
  else {
    size_t v17 = a3;
  }
  uint64_t v18 = 1LL;
  __int128 v19 = a1;
  unint64_t v20 = a5;
  do
  {
    memcpy(&v16[v18], v19, v17);
    v18 += 3LL;
    v19 += a3;
    --v20;
  }

  while (v20);
  BOOL v21 = 0;
  unint64_t v22 = 0LL;
  uint64_t v40 = &a1[a5 * a3];
  while (1)
  {
    uint64_t v23 = 0LL;
    unint64_t v24 = 0LL;
    uint64_t v56 = 0LL;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    uint64_t v43 = 0LL;
    __int128 v45 = 0u;
    memset(v42, 0, sizeof(v42));
    uint64_t v44 = 56LL;
    do
    {
      v24 += (*(void *)((char *)v42 + v23) + 7LL) & 0xFFFFFFFFFFFFFFF8LL;
      v23 += 8LL;
    }

    while (v23 != 424);
    int v25 = (char *)sub_10001F078(a8, v24);
    if (!v25) {
      break;
    }
    int v26 = v25;
    id v27 = &v40[v22 * a4];
    bzero(v25, v24);
    uint64_t v28 = 0LL;
    __int128 v29 = v26;
    do
    {
      else {
        __int128 v30 = 0LL;
      }
      v29 += (*(void *)((char *)v42 + v28) + 7LL) & 0xFFFFFFFFFFFFFFF8LL;
      *(void *)((char *)v42 + v28) = v30;
      v28 += 8LL;
    }

    while (v28 != 424);
    uint64_t v31 = v44;
    v44 += 56LL;
    *(void *)(v31 + 48) = 512LL;
    *(_OWORD *)uint64_t v31 = xmmword_100027AF8;
    *(_OWORD *)(v31 + 16) = unk_100027B08;
    *(_OWORD *)(v31 + 32) = xmmword_100027B18;
    unsigned int v32 = *(_DWORD *)v27;
    *(_BYTE *)(v31 + 49) = *((void *)v27 + 1);
    *(_WORD *)(v31 + 34) = *((void *)v27 + 2);
    *(_DWORD *)(v31 + 24) = *((void *)v27 + 3);
    *(_WORD *)(v31 + 32) = *((void *)v27 + 4);
    *(_WORD *)(v31 + 30) = *((void *)v27 + 5);
    *(_BYTE *)(v31 + 45) = *((void *)v27 + 6);
    *(_BYTE *)(v31 + 47) = *((void *)v27 + 7);
    *(_WORD *)(v31 + 28) = *((void *)v27 + 8);
    uint64_t v33 = 72LL;
    if (v32 < 3) {
      uint64_t v33 = 80LL;
    }
    ssize_t v34 = &v27[v33];
    *(_BYTE *)(v31 + 43) = *(void *)v34;
    *(_BYTE *)(v31 + 44) = *((void *)v34 + 1);
    if (v32)
    {
      *(_DWORD *)(v31 + 20) = *((void *)v34 + 2);
      if (v32 <= 3)
      {
        if (v32 == 3) {
          *(_WORD *)(v31 + 36) = *((_WORD *)v34 + 16) | (16 * *((_WORD *)v34 + 12));
        }
      }

      else
      {
        int v35 = v34[24];
        *(_BYTE *)(v31 + 46) = v35;
        int v36 = *((_DWORD *)v34 + 10);
        int v37 = v36 | (16 * *((_DWORD *)v34 + 8));
        *(_WORD *)(v31 + 36) = v36 | (16 * *((_WORD *)v34 + 16));
        if (v32 >= 0x15)
        {
          *(_BYTE *)(v31 + 38) = *((void *)v34 + 6);
          *(_BYTE *)(v31 + 40) = *((void *)v34 + 7);
          if (v32 != 21)
          {
            *(void *)(v31 + 8) = *((void *)v34 + 8);
            *(_BYTE *)(v31 + 42) = *((void *)v34 + 9);
            if (v32 >= 0x23)
            {
              *(_DWORD *)(v31 + 16) = v34[80] | (unsigned __int16)(*((_DWORD *)v34 + 22) << 8) | (*((_DWORD *)v34 + 24) << 16) | (*((_DWORD *)v34 + 26) << 24);
              if (v32 >= 0x27)
              {
                *(_DWORD *)(v31 + 16) = *((void *)v34 + 14);
                if (v32 >= 0x2A)
                {
                  *(_WORD *)(v31 + 36) = v37 | (*((_WORD *)v34 + 60) << 8);
                  *(void *)uint64_t v31 = *((void *)v34 + 16);
                  *(_BYTE *)(v31 + 48) = *((void *)v34 + 17);
                  *(_BYTE *)(v31 + 50) = *((void *)v34 + 18);
                  if (v32 >= 0x31)
                  {
                    *(_BYTE *)(v31 + 41) = *((void *)v34 + 19);
                    *(_BYTE *)(v31 + 39) = *((void *)v34 + 20);
                  }
                }
              }
            }
          }
        }

        if (v35 == 255) {
          *(_BYTE *)(v31 + 46) = 0;
        }
      }
    }

    v16[3 * v22++] = v26;
    BOOL v21 = v22 >= a5;
    if (v22 == a5)
    {
      *(void *)uint64_t v38 = v16;
      *(_DWORD *)(v38 + 8) = a5;
      return;
    }
  }

  a7 = v39;
  if (v39)
  {
LABEL_35:
    if (!v21) {
      *a7 = 1;
    }
  }

char *sub_10001D108(void *a1, uint64_t a2)
{
  kern_return_t v122;
  __int128 outputStruct;
  uint64_t v124;
  unsigned __int8 v125;
  size_t outputStructCnt;
  io_connect_t connect;
  id v3 = a1;
  uint64_t v4 = (char *)sub_10001F078(a2, 0xC210uLL);
  id v5 = v4;
  unint64_t v6 = v4 + 49408;
  if (v4) {
    bzero(v4, 0xC210uLL);
  }
  id v7 = v3;
  id v8 = v7;
  if (v7)
  {
    id v9 = objc_claimAutoreleasedReturnValue([v7 name]);
    snprintf(v5 + 49152, 0x100uLL, "%s", (const char *)[v9 UTF8String]);

    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 targetDeviceArchitecture]);
    *(_DWORD *)unint64_t v6 = [v10 cpuType];
    *((_DWORD *)v6 + 1) = [v10 subType];
    *((_WORD *)v6 + 4) = (unsigned __int16)[v10 version];
    v6[10] = [v10 version] >> 16;
    v6[11] = [v10 version] >> 24;
    *((_DWORD *)v6 + 3) = [v10 versionCombined];
    *((void *)v6 + 2) = [v10 driverVersion];

    if (*(_DWORD *)v6 == 16777235)
    {
      *((_OWORD *)v5 + 3090) = 0u;
      unint64_t v11 = IOServiceMatching("AGXAccelerator");
      io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v11);
      if (MatchingService && !IOServiceOpen(MatchingService, mach_task_self_, 1u, &connect))
      {
        outputStructCnt = 16LL;
        v122 = IOConnectCallStructMethod(connect, 0x10Au, 0LL, 0LL, &outputStruct, &outputStructCnt);
        BOOL v13 = v122 == 0;
        if (!v122) {
          *((_OWORD *)v5 + 3090) = outputStruct;
        }
      }

      else
      {
        BOOL v13 = 0;
      }

      v6[268] = v13;
    }

    if ((objc_opt_respondsToSelector(v8, "supportsFamily:") & 1) != 0)
    {
      for (uint64_t i = 0LL; i != 9; ++i)
        v5[i + 49497] = [v8 supportsFamily:i + 1001];
      v6[98] = [v8 supportsFamily:2002];
      uint64_t v15 = 0LL;
      v6[99] = [v8 supportsFamily:2003];
      do
      {
        v5[v15 + 49508] = [v8 supportsFamily:v15 + 3001];
        ++v15;
      }

      while (v15 != 3);
      v6[103] = [v8 supportsFamily:5001];
    }

    *((void *)v6 + 3) = -1LL;
    if ((objc_opt_respondsToSelector(v8, "maxThreadgroupMemoryLength") & 1) != 0) {
      *((void *)v6 + 6) = [v8 maxThreadgroupMemoryLength];
    }
    if ((objc_opt_respondsToSelector(v8, "maxThreadsPerThreadgroup") & 1) != 0)
    {
      [v8 maxThreadsPerThreadgroup];
      uint64_t v16 = v124;
      *(_OWORD *)(v6 + 56) = outputStruct;
      *((void *)v6 + 9) = v16;
    }

    if ((objc_opt_respondsToSelector(v8, "maxBufferLength") & 1) != 0) {
      *((void *)v6 + 10) = [v8 maxBufferLength];
    }
    if ((objc_opt_respondsToSelector(v8, "supportsLateEvalEvent") & 1) != 0) {
      unsigned __int8 v17 = [v8 supportsLateEvalEvent];
    }
    else {
      unsigned __int8 v17 = 0;
    }
    v6[213] = v17;
    if ((objc_opt_respondsToSelector(v8, "supportsRaytracing") & 1) != 0) {
      unsigned __int8 v18 = [v8 supportsRaytracing];
    }
    else {
      unsigned __int8 v18 = 0;
    }
    v6[215] = v18;
    if ((objc_opt_respondsToSelector(v8, "supportsTileShaders") & 1) != 0) {
      unsigned __int8 v19 = [v8 supportsTileShaders];
    }
    else {
      unsigned __int8 v19 = 0;
    }
    v6[214] = v19;
    if ((objc_opt_respondsToSelector(v8, "supportsMeshShaders") & 1) != 0) {
      unsigned __int8 v20 = [v8 supportsMeshShaders];
    }
    else {
      unsigned __int8 v20 = 0;
    }
    v6[216] = v20;
    if ((objc_opt_respondsToSelector(v8, "isMsaa32bSupported") & 1) != 0) {
      unsigned __int8 v21 = [v8 isMsaa32bSupported];
    }
    else {
      unsigned __int8 v21 = 0;
    }
    v6[142] = v21;
    if ((objc_opt_respondsToSelector(v8, "supportsBufferWithIOSurface") & 1) != 0) {
      unsigned __int8 v22 = [v8 supportsBufferWithIOSurface];
    }
    else {
      unsigned __int8 v22 = 0;
    }
    v6[219] = v22;
    if ((objc_opt_respondsToSelector(v8, "supportsBGR10A2") & 1) != 0) {
      unsigned __int8 v23 = [v8 supportsBGR10A2];
    }
    else {
      unsigned __int8 v23 = 0;
    }
    v6[155] = v23;
    if ((objc_opt_respondsToSelector(v8, "supportsSparseHeaps") & 1) != 0) {
      unsigned __int8 v24 = [v8 supportsSparseHeaps];
    }
    else {
      unsigned __int8 v24 = 0;
    }
    v6[223] = v24;
    if ((objc_opt_respondsToSelector(v8, "supportsSparseTextures") & 1) != 0) {
      unsigned __int8 v25 = [v8 supportsSparseTextures];
    }
    else {
      unsigned __int8 v25 = 0;
    }
    v6[224] = v25;
    if ((objc_opt_respondsToSelector(v8, "supportsPlacementHeaps") & 1) != 0) {
      unsigned __int8 v26 = [v8 supportsPlacementHeaps];
    }
    else {
      unsigned __int8 v26 = 0;
    }
    v6[222] = v26;
    if ((objc_opt_respondsToSelector(v8, "supportsComputeMemoryBarrier") & 1) != 0) {
      unsigned __int8 v27 = [v8 supportsComputeMemoryBarrier];
    }
    else {
      unsigned __int8 v27 = 0;
    }
    v6[206] = v27;
    if ((objc_opt_respondsToSelector(v8, "supportsRenderMemoryBarrier") & 1) != 0) {
      unsigned __int8 v28 = [v8 supportsRenderMemoryBarrier];
    }
    else {
      unsigned __int8 v28 = 0;
    }
    v6[207] = v28;
    if ((objc_opt_respondsToSelector(v8, "supportsPartialRenderMemoryBarrier") & 1) != 0) {
      unsigned __int8 v29 = [v8 supportsPartialRenderMemoryBarrier];
    }
    else {
      unsigned __int8 v29 = 0;
    }
    v6[208] = v29;
    if ((objc_opt_respondsToSelector(v8, "supportsVertexAmplificationCount:") & 1) != 0)
    {
      for (uint64_t j = 0LL; j != 16; ++j)
        v5[j + 49593] = [v8 supportsVertexAmplificationCount:j];
    }

    if ((objc_opt_respondsToSelector(v8, "supportsTextureSampleCount:") & 1) != 0)
    {
      for (uint64_t k = 0LL; k != 32; ++k)
        v5[k + 49512] = [v8 supportsTextureSampleCount:k];
    }

    if ((objc_opt_respondsToSelector(v8, "supportsRasterizationRateMapWithLayerCount:") & 1) != 0)
    {
      for (uint64_t m = 0LL; m != 16; ++m)
        v5[m + 49577] = [v8 supportsRasterizationRateMapWithLayerCount:m];
    }

    if ((objc_opt_respondsToSelector(v8, "supportsProgrammableSamplePositions") & 1) != 0) {
      unsigned __int8 v33 = [v8 supportsProgrammableSamplePositions];
    }
    else {
      unsigned __int8 v33 = 0;
    }
    v6[168] = v33;
    if ((objc_opt_respondsToSelector(v8, "supportsGFXIndirectCommandBuffers") & 1) != 0) {
      unsigned __int8 v34 = [v8 supportsGFXIndirectCommandBuffers];
    }
    else {
      unsigned __int8 v34 = 0;
    }
    v6[209] = v34;
    if ((objc_opt_respondsToSelector(v8, "supportsCMPIndirectCommandBuffers") & 1) != 0) {
      unsigned __int8 v35 = [v8 supportsCMPIndirectCommandBuffers];
    }
    else {
      unsigned __int8 v35 = 0;
    }
    v6[210] = v35;
    if ((objc_opt_respondsToSelector(v8, "supportsIndirectDrawAndDispatch") & 1) != 0) {
      unsigned __int8 v36 = [v8 supportsIndirectDrawAndDispatch];
    }
    else {
      unsigned __int8 v36 = 0;
    }
    v6[212] = v36;
    if ((objc_opt_respondsToSelector(v8, "supportsMeshShadersInICB") & 1) != 0) {
      unsigned __int8 v37 = [v8 supportsMeshShadersInICB];
    }
    else {
      unsigned __int8 v37 = 0;
    }
    v6[211] = v37;
    if ((objc_opt_respondsToSelector(v8, "supportsMemorylessRenderTargets") & 1) != 0) {
      unsigned __int8 v38 = [v8 supportsMemorylessRenderTargets];
    }
    else {
      unsigned __int8 v38 = 0;
    }
    v6[137] = v38;
    if ((objc_opt_respondsToSelector(v8, "supportsRenderTargetTextureRotation") & 1) != 0) {
      unsigned __int8 v39 = [v8 supportsRenderTargetTextureRotation];
    }
    else {
      unsigned __int8 v39 = 0;
    }
    v6[140] = v39;
    if ((objc_opt_respondsToSelector(v8, "supportsNonUniformThreadgroupSize") & 1) != 0) {
      unsigned __int8 v40 = [v8 supportsNonUniformThreadgroupSize];
    }
    else {
      unsigned __int8 v40 = 0;
    }
    v6[217] = v40;
    if ((objc_opt_respondsToSelector(v8, "supportsArgumentBuffersTier2") & 1) != 0) {
      unsigned __int8 v41 = [v8 supportsArgumentBuffersTier2];
    }
    else {
      unsigned __int8 v41 = 0;
    }
    v6[136] = v41;
    if ((objc_opt_respondsToSelector(v8, "supportsConcurrentComputeDispatch") & 1) != 0) {
      unsigned __int8 v42 = [v8 supportsConcurrentComputeDispatch];
    }
    else {
      unsigned __int8 v42 = 0;
    }
    v6[218] = v42;
    if ((objc_opt_respondsToSelector(v8, "supportsSharedStorageHeapResources") & 1) != 0) {
      unsigned __int8 v43 = [v8 supportsSharedStorageHeapResources];
    }
    else {
      unsigned __int8 v43 = 0;
    }
    v6[221] = v43;
    if ((objc_opt_respondsToSelector(v8, "supportsSharedStorageTextures") & 1) != 0) {
      unsigned __int8 v44 = [v8 supportsSharedStorageTextures];
    }
    else {
      unsigned __int8 v44 = 0;
    }
    v6[138] = v44;
    if ((objc_opt_respondsToSelector(v8, "supportsSharedTextureHandles") & 1) != 0) {
      unsigned __int8 v45 = [v8 supportsSharedTextureHandles];
    }
    else {
      unsigned __int8 v45 = 0;
    }
    v6[139] = v45;
    if ((objc_opt_respondsToSelector(v8, "supportsDynamicAttributeStride") & 1) != 0) {
      unsigned __int8 v46 = [v8 supportsDynamicAttributeStride];
    }
    else {
      unsigned __int8 v46 = 0;
    }
    v6[227] = v46;
    if ((objc_opt_respondsToSelector(v8, "supportsNonSquareTileShaders") & 1) != 0) {
      unsigned __int8 v47 = [v8 supportsNonSquareTileShaders];
    }
    else {
      unsigned __int8 v47 = 0;
    }
    v6[228] = v47;
    if ((objc_opt_respondsToSelector(v8, "supportsLayeredRendering") & 1) != 0) {
      unsigned __int8 v48 = [v8 supportsLayeredRendering];
    }
    else {
      unsigned __int8 v48 = 0;
    }
    v6[229] = v48;
    if ((objc_opt_respondsToSelector(v8, "supportsViewportAndScissorArray") & 1) != 0) {
      unsigned __int8 v49 = [v8 supportsViewportAndScissorArray];
    }
    else {
      unsigned __int8 v49 = 0;
    }
    v6[230] = v49;
    if ((objc_opt_respondsToSelector(v8, "supportsLinearTextureFromSharedBuffer") & 1) != 0) {
      unsigned __int8 v50 = [v8 supportsLinearTextureFromSharedBuffer];
    }
    else {
      unsigned __int8 v50 = 0;
    }
    v6[143] = v50;
    if ((objc_opt_respondsToSelector(v8, "supportsNonPrivateDepthStencilTextures") & 1) != 0) {
      unsigned __int8 v51 = [v8 supportsNonPrivateDepthStencilTextures];
    }
    else {
      unsigned __int8 v51 = 0;
    }
    v6[144] = v51;
    if ((objc_opt_respondsToSelector(v8, "supportsRenderToLinearTextures") & 1) != 0) {
      unsigned __int8 v52 = [v8 supportsRenderToLinearTextures];
    }
    else {
      unsigned __int8 v52 = 0;
    }
    v6[145] = v52;
    if ((objc_opt_respondsToSelector(v8, "supportsSeparateDepthStencil") & 1) != 0) {
      unsigned __int8 v53 = [v8 supportsSeparateDepthStencil];
    }
    else {
      unsigned __int8 v53 = 0;
    }
    v6[147] = v53;
    if ((objc_opt_respondsToSelector(v8, "supportsRelaxedTextureViewRequirements") & 1) != 0) {
      unsigned __int8 v54 = [v8 supportsRelaxedTextureViewRequirements];
    }
    else {
      unsigned __int8 v54 = 0;
    }
    v6[148] = v54;
    if ((objc_opt_respondsToSelector(v8, "supportsVariableRateRasterization") & 1) != 0) {
      unsigned __int8 v55 = [v8 supportsVariableRateRasterization];
    }
    else {
      unsigned __int8 v55 = 0;
    }
    v6[238] = v55;
    if ((objc_opt_respondsToSelector(v8, "supportsExtendedVertexFormats") & 1) != 0) {
      unsigned __int8 v56 = [v8 supportsExtendedVertexFormats];
    }
    else {
      unsigned __int8 v56 = 0;
    }
    v6[231] = v56;
    else {
      unsigned __int8 v57 = 0;
    }
    v6[203] = v57;
    else {
      unsigned __int8 v58 = 0;
    }
    v6[204] = v58;
    else {
      unsigned __int8 v59 = 0;
    }
    v6[205] = v59;
    if ((objc_opt_respondsToSelector(v8, "supportsDynamicLibraries") & 1) != 0) {
      unsigned __int8 v60 = [v8 supportsDynamicLibraries];
    }
    else {
      unsigned __int8 v60 = 0;
    }
    v6[201] = v60;
    if ((objc_opt_respondsToSelector(v8, "supportsRenderDynamicLibraries") & 1) != 0) {
      unsigned __int8 v61 = [v8 supportsRenderDynamicLibraries];
    }
    else {
      unsigned __int8 v61 = 0;
    }
    v6[202] = v61;
    if ((objc_opt_respondsToSelector(v8, "supportsDepthClipMode") & 1) != 0) {
      unsigned __int8 v62 = [v8 supportsDepthClipMode];
    }
    else {
      unsigned __int8 v62 = 0;
    }
    v6[239] = v62;
    if ((objc_opt_respondsToSelector(v8, "supportsDepthClipModeClampExtended") & 1) != 0) {
      unsigned __int8 v63 = [v8 supportsDepthClipModeClampExtended];
    }
    else {
      unsigned __int8 v63 = 0;
    }
    v6[240] = v63;
    if ((objc_opt_respondsToSelector(v8, "supportsSparseDepthAttachments") & 1) != 0) {
      unsigned __int8 v64 = [v8 supportsSparseDepthAttachments];
    }
    else {
      unsigned __int8 v64 = 0;
    }
    v6[225] = v64;
    if ((objc_opt_respondsToSelector(v8, "supportsLossyCompression") & 1) != 0) {
      unsigned __int8 v65 = [v8 supportsLossyCompression];
    }
    else {
      unsigned __int8 v65 = 0;
    }
    v6[146] = v65;
    if ((objc_opt_respondsToSelector(v8, "supportsTextureSwizzle") & 1) != 0) {
      unsigned __int8 v66 = [v8 supportsTextureSwizzle];
    }
    else {
      unsigned __int8 v66 = 0;
    }
    v6[149] = v66;
    if ((objc_opt_respondsToSelector(v8, "supportsTextureCubeArray") & 1) != 0) {
      unsigned __int8 v67 = [v8 supportsTextureCubeArray];
    }
    else {
      unsigned __int8 v67 = 0;
    }
    v6[150] = v67;
    if ((objc_opt_respondsToSelector(v8, "supportsTexture2DMultisampleArray") & 1) != 0) {
      unsigned __int8 v68 = [v8 supportsTexture2DMultisampleArray];
    }
    else {
      unsigned __int8 v68 = 0;
    }
    v6[151] = v68;
    if ((objc_opt_respondsToSelector(v8, "supportsLinearTexture2DArray") & 1) != 0) {
      unsigned __int8 v69 = [v8 supportsLinearTexture2DArray];
    }
    else {
      unsigned __int8 v69 = 0;
    }
    v6[152] = v69;
    if ((objc_opt_respondsToSelector(v8, "supports2DLinearTexArraySPI") & 1) != 0) {
      unsigned __int8 v70 = [v8 supports2DLinearTexArraySPI];
    }
    else {
      unsigned __int8 v70 = 0;
    }
    v6[153] = v70;
    if ((objc_opt_respondsToSelector(v8, "supportsRGBA10A2Gamma") & 1) != 0) {
      unsigned __int8 v71 = [v8 supportsRGBA10A2Gamma];
    }
    else {
      unsigned __int8 v71 = 0;
    }
    v6[154] = v71;
    if ((objc_opt_respondsToSelector(v8, "supportsBGR10A2") & 1) != 0) {
      unsigned __int8 v72 = [v8 supportsBGR10A2];
    }
    else {
      unsigned __int8 v72 = 0;
    }
    v6[155] = v72;
    if ((objc_opt_respondsToSelector(v8, "supportsSRGBwrites") & 1) != 0) {
      unsigned __int8 v73 = [v8 supportsSRGBwrites];
    }
    else {
      unsigned __int8 v73 = 0;
    }
    v6[156] = v73;
    else {
      unsigned __int8 v74 = 0;
    }
    v6[157] = v74;
    if ((objc_opt_respondsToSelector(v8, "supportsSamplerAddressModeClampToHalfBorder") & 1) != 0) {
      unsigned __int8 v75 = [v8 supportsSamplerAddressModeClampToHalfBorder];
    }
    else {
      unsigned __int8 v75 = 0;
    }
    v6[233] = v75;
    if ((objc_opt_respondsToSelector(v8, "supportsCustomBorderColor") & 1) != 0) {
      unsigned __int8 v76 = [v8 supportsCustomBorderColor];
    }
    else {
      unsigned __int8 v76 = 0;
    }
    v6[234] = v76;
    if ((objc_opt_respondsToSelector(v8, "supportsSamplerCompareFunction") & 1) != 0) {
      unsigned __int8 v77 = [v8 supportsSamplerCompareFunction];
    }
    else {
      unsigned __int8 v77 = 0;
    }
    v6[235] = v77;
    if ((objc_opt_respondsToSelector(v8, "supportsBlackOrWhiteSamplerBorderColors") & 1) != 0) {
      unsigned __int8 v78 = [v8 supportsBlackOrWhiteSamplerBorderColors];
    }
    else {
      unsigned __int8 v78 = 0;
    }
    v6[236] = v78;
    if ((objc_opt_respondsToSelector(v8, "supportsMirrorClampToEdgeSamplerMode") & 1) != 0) {
      unsigned __int8 v79 = [v8 supportsMirrorClampToEdgeSamplerMode];
    }
    else {
      unsigned __int8 v79 = 0;
    }
    v6[237] = v79;
    if ((objc_opt_respondsToSelector(v8, "supportsPrimitiveMotionBlur") & 1) != 0) {
      unsigned __int8 v80 = [v8 supportsPrimitiveMotionBlur];
    }
    else {
      unsigned __int8 v80 = 0;
    }
    v6[158] = v80;
    if ((objc_opt_respondsToSelector(v8, "supportsRayTracingICBs") & 1) != 0) {
      unsigned __int8 v81 = [v8 supportsRayTracingICBs];
    }
    else {
      unsigned __int8 v81 = 0;
    }
    v6[159] = v81;
    if ((objc_opt_respondsToSelector(v8, "supportsRayTracingExtendedVertexFormats") & 1) != 0) {
      unsigned __int8 v82 = [v8 supportsRayTracingExtendedVertexFormats];
    }
    else {
      unsigned __int8 v82 = 0;
    }
    v6[160] = v82;
    if ((objc_opt_respondsToSelector(v8, "supportsHeapAccelerationStructureAllocation") & 1) != 0) {
      unsigned __int8 v83 = [v8 supportsHeapAccelerationStructureAllocation];
    }
    else {
      unsigned __int8 v83 = 0;
    }
    v6[226] = v83;
    if ((objc_opt_respondsToSelector(v8, "supportsRayTracingPerPrimitiveData") & 1) != 0) {
      unsigned __int8 v84 = [v8 supportsRayTracingPerPrimitiveData];
    }
    else {
      unsigned __int8 v84 = 0;
    }
    v6[161] = v84;
    if ((objc_opt_respondsToSelector(v8, "supportsRayTracingBuffersFromTables") & 1) != 0) {
      unsigned __int8 v85 = [v8 supportsRayTracingBuffersFromTables];
    }
    else {
      unsigned __int8 v85 = 0;
    }
    v6[162] = v85;
    if ((objc_opt_respondsToSelector(v8, "supportsRayTracingAccelerationStructureCPUDeserialization") & 1) != 0) {
      unsigned __int8 v86 = [v8 supportsRayTracingAccelerationStructureCPUDeserialization];
    }
    else {
      unsigned __int8 v86 = 0;
    }
    v6[163] = v86;
    if ((objc_opt_respondsToSelector(v8, "supportsRayTracingMultiLevelInstancing") & 1) != 0) {
      unsigned __int8 v87 = [v8 supportsRayTracingMultiLevelInstancing];
    }
    else {
      unsigned __int8 v87 = 0;
    }
    v6[164] = v87;
    if ((objc_opt_respondsToSelector(v8, "supportsRayTracingIndirectInstanceAccelerationStructureBuild") & 1) != 0) {
      unsigned __int8 v88 = [v8 supportsRayTracingIndirectInstanceAccelerationStructureBuild];
    }
    else {
      unsigned __int8 v88 = 0;
    }
    v6[165] = v88;
    if ((objc_opt_respondsToSelector(v8, "supportsRayTracingGPUTableUpdateBuffers") & 1) != 0) {
      unsigned __int8 v89 = [v8 supportsRayTracingGPUTableUpdateBuffers];
    }
    else {
      unsigned __int8 v89 = 0;
    }
    v6[166] = v89;
    if ((objc_opt_respondsToSelector(v8, "supportsRayTracingCurves") & 1) != 0) {
      unsigned __int8 v90 = [v8 supportsRayTracingCurves];
    }
    else {
      unsigned __int8 v90 = 0;
    }
    v6[167] = v90;
    if ((objc_opt_respondsToSelector(v8, "supportsBCTextureCompression") & 1) != 0) {
      unsigned __int8 v91 = [v8 supportsBCTextureCompression];
    }
    else {
      unsigned __int8 v91 = 0;
    }
    v6[241] = v91;
    if ((objc_opt_respondsToSelector(v8, "supports3DBCTextures") & 1) != 0) {
      unsigned __int8 v92 = [v8 supports3DBCTextures];
    }
    else {
      unsigned __int8 v92 = 0;
    }
    v6[242] = v92;
    if ((objc_opt_respondsToSelector(v8, "supportsMSAADepthResolve") & 1) != 0) {
      unsigned __int8 v93 = [v8 supportsMSAADepthResolve];
    }
    else {
      unsigned __int8 v93 = 0;
    }
    v6[243] = v93;
    if ((objc_opt_respondsToSelector(v8, "supportsMSAAStencilResolve") & 1) != 0) {
      unsigned __int8 v94 = [v8 supportsMSAAStencilResolve];
    }
    else {
      unsigned __int8 v94 = 0;
    }
    v6[244] = v94;
    if ((objc_opt_respondsToSelector(v8, "supportsMSAADepthResolveFilter") & 1) != 0) {
      unsigned __int8 v95 = [v8 supportsMSAADepthResolveFilter];
    }
    else {
      unsigned __int8 v95 = 0;
    }
    v6[245] = v95;
    if ((objc_opt_respondsToSelector(v8, "supports32bpcMSAATextures") & 1) != 0) {
      unsigned __int8 v96 = [v8 supports32bpcMSAATextures];
    }
    else {
      unsigned __int8 v96 = 0;
    }
    v6[246] = v96;
    if ((objc_opt_respondsToSelector(v8, "supports32BitMSAA") & 1) != 0) {
      unsigned __int8 v97 = [v8 supports32BitMSAA];
    }
    else {
      unsigned __int8 v97 = 0;
    }
    v6[247] = v97;
    if ((objc_opt_respondsToSelector(v8, "supportsNonPrivateMSAATextures") & 1) != 0) {
      unsigned __int8 v98 = [v8 supportsNonPrivateMSAATextures];
    }
    else {
      unsigned __int8 v98 = 0;
    }
    v6[248] = v98;
    if ((objc_opt_respondsToSelector(v8, "supportsCombinedMSAAStoreAndResolveAction") & 1) != 0) {
      unsigned __int8 v99 = [v8 supportsCombinedMSAAStoreAndResolveAction];
    }
    else {
      unsigned __int8 v99 = 0;
    }
    v6[249] = v99;
    if ((objc_opt_respondsToSelector(v8, "supportsMSAAStencilResolveFilter") & 1) != 0) {
      unsigned __int8 v100 = [v8 supportsMSAAStencilResolveFilter];
    }
    else {
      unsigned __int8 v100 = 0;
    }
    v6[250] = v100;
    if ((objc_opt_respondsToSelector(v8, "supportsASTCTextureCompression") & 1) != 0) {
      unsigned __int8 v101 = [v8 supportsASTCTextureCompression];
    }
    else {
      unsigned __int8 v101 = 0;
    }
    v6[251] = v101;
    if ((objc_opt_respondsToSelector(v8, "supports3DASTCTextures") & 1) != 0) {
      unsigned __int8 v102 = [v8 supports3DASTCTextures];
    }
    else {
      unsigned __int8 v102 = 0;
    }
    v6[252] = v102;
    if ((objc_opt_respondsToSelector(v8, "supportsASTCHDRTextureCompression") & 1) != 0) {
      unsigned __int8 v103 = [v8 supportsASTCHDRTextureCompression];
    }
    else {
      unsigned __int8 v103 = 0;
    }
    v6[253] = v103;
    if ((objc_opt_respondsToSelector(v8, "supportsLimitedYUVFormats") & 1) != 0) {
      unsigned __int8 v104 = [v8 supportsLimitedYUVFormats];
    }
    else {
      unsigned __int8 v104 = 0;
    }
    v6[254] = v104;
    if ((objc_opt_respondsToSelector(v8, "supportsExtendedYUVFormats") & 1) != 0) {
      unsigned __int8 v105 = [v8 supportsExtendedYUVFormats];
    }
    else {
      unsigned __int8 v105 = 0;
    }
    v6[255] = v105;
    if ((objc_opt_respondsToSelector(v8, "supportsAlphaYUVFormats") & 1) != 0) {
      unsigned __int8 v106 = [v8 supportsAlphaYUVFormats];
    }
    else {
      unsigned __int8 v106 = 0;
    }
    v6[256] = v106;
    if ((objc_opt_respondsToSelector(v8, "supportsYCBCRFormats") & 1) != 0) {
      unsigned __int8 v107 = [v8 supportsYCBCRFormats];
    }
    else {
      unsigned __int8 v107 = 0;
    }
    v6[257] = v107;
    if ((objc_opt_respondsToSelector(v8, "supportsYCBCRFormatsPQ") & 1) != 0) {
      unsigned __int8 v108 = [v8 supportsYCBCRFormatsPQ];
    }
    else {
      unsigned __int8 v108 = 0;
    }
    v6[258] = v108;
    if ((objc_opt_respondsToSelector(v8, "supportsYCBCRFormats12") & 1) != 0) {
      unsigned __int8 v109 = [v8 supportsYCBCRFormats12];
    }
    else {
      unsigned __int8 v109 = 0;
    }
    v6[259] = v109;
    if ((objc_opt_respondsToSelector(v8, "supportsYCBCRFormatsXR") & 1) != 0) {
      unsigned __int8 v110 = [v8 supportsYCBCRFormatsXR];
    }
    else {
      unsigned __int8 v110 = 0;
    }
    v6[260] = v110;
    if ((objc_opt_respondsToSelector(v8, "supportsYCBCRPackedFormatsPQ") & 1) != 0) {
      unsigned __int8 v111 = [v8 supportsYCBCRPackedFormatsPQ];
    }
    else {
      unsigned __int8 v111 = 0;
    }
    v6[261] = v111;
    if ((objc_opt_respondsToSelector(v8, "supportsYCBCRPackedFormats12") & 1) != 0) {
      unsigned __int8 v112 = [v8 supportsYCBCRPackedFormats12];
    }
    else {
      unsigned __int8 v112 = 0;
    }
    v6[262] = v112;
    if ((objc_opt_respondsToSelector(v8, "supportsYCBCRPackedFormatsXR") & 1) != 0) {
      unsigned __int8 v113 = [v8 supportsYCBCRPackedFormatsXR];
    }
    else {
      unsigned __int8 v113 = 0;
    }
    v6[263] = v113;
    if ((objc_opt_respondsToSelector(v8, "supportsPublicXR10Formats") & 1) != 0) {
      unsigned __int8 v114 = [v8 supportsPublicXR10Formats];
    }
    else {
      unsigned __int8 v114 = 0;
    }
    v6[264] = v114;
    if ((objc_opt_respondsToSelector(v8, "supportsExtendedXR10Formats") & 1) != 0) {
      unsigned __int8 v115 = [v8 supportsExtendedXR10Formats];
    }
    else {
      unsigned __int8 v115 = 0;
    }
    uint64_t v116 = 0LL;
    v6[265] = v115;
    do
    {
      uint64_t v117 = (unsigned __int16)word_100027B30[v116];
      MTLPixelFormatGetInfoForDevice(&outputStruct, v8, v117);
      __int16 v118 = WORD4(outputStruct);
      v119 = &v5[12 * v117];
      *(_DWORD *)v119 = DWORD2(outputStruct);
      *((_WORD *)v119 + 2) = v117;
      if ((v118 & 0x400) == 0) {
        *(_WORD *)&v5[12 * v117 + 6] = v125;
      }
      if ((v118 & 0x461) == 1)
      {
        v120 = &v5[12 * v117];
        *((_WORD *)v120 + 4) = (unsigned __int16)[v8 minimumLinearTextureAlignmentForPixelFormat:v117];
        *((_WORD *)v120 + 5) = (unsigned __int16)[v8 minimumTextureBufferAlignmentForPixelFormat:v117];
      }

      ++v116;
    }

    while (v116 != 275);
  }

  else
  {
    v6[88] = 1;
  }

  return v5;
}

uint64_t sub_10001E42C(uint64_t *a1, uint64_t a2, void *a3)
{
  id v22 = a3;
  unint64_t v5 = *((unsigned int *)a1 + 2);
  if ((_DWORD)v5)
  {
    uint64_t v6 = 0LL;
    unint64_t v7 = 0LL;
    char v8 = 1;
    do
    {
      uint64_t v9 = *a1;
      uint64_t v10 = *(void *)(*a1 + v6);
      if ((*(_BYTE *)(a2 + 12LL * *(unsigned __int16 *)(v10 + 34)) & 1) != 0)
      {
        id v11 = v22;
        unint64_t v12 = objc_alloc_init(&OBJC_CLASS___MTLTextureDescriptor);
        -[MTLTextureDescriptor setTextureType:](v12, "setTextureType:", *(unsigned __int8 *)(v10 + 49));
        -[MTLTextureDescriptor setPixelFormat:](v12, "setPixelFormat:", *(unsigned __int16 *)(v10 + 34));
        -[MTLTextureDescriptor setWidth:](v12, "setWidth:", *(unsigned int *)(v10 + 24));
        -[MTLTextureDescriptor setHeight:](v12, "setHeight:", *(unsigned __int16 *)(v10 + 32));
        -[MTLTextureDescriptor setDepth:](v12, "setDepth:", *(unsigned __int16 *)(v10 + 30));
        -[MTLTextureDescriptor setMipmapLevelCount:](v12, "setMipmapLevelCount:", *(unsigned __int8 *)(v10 + 45));
        -[MTLTextureDescriptor setSampleCount:](v12, "setSampleCount:", *(unsigned __int8 *)(v10 + 47));
        -[MTLTextureDescriptor setArrayLength:](v12, "setArrayLength:", *(unsigned __int16 *)(v10 + 28));
        -[MTLTextureDescriptor setUsage:](v12, "setUsage:", *(unsigned int *)(v10 + 20));
        -[MTLTextureDescriptor setResourceOptions:](v12, "setResourceOptions:", *(unsigned __int16 *)(v10 + 36));
        if ((objc_opt_respondsToSelector(v12, "swizzleKey") & 1) != 0) {
          -[MTLTextureDescriptor setSwizzleKey:](v12, "setSwizzleKey:", *(unsigned int *)(v10 + 16));
        }
        if ((objc_opt_respondsToSelector(v12, "rotation") & 1) != 0) {
          -[MTLTextureDescriptor setRotation:](v12, "setRotation:", *(unsigned __int8 *)(v10 + 46));
        }
        if ((objc_opt_respondsToSelector(v12, "allowGPUOptimizedContents") & 1) != 0) {
          -[MTLTextureDescriptor setAllowGPUOptimizedContents:]( v12,  "setAllowGPUOptimizedContents:",  *(_BYTE *)(v10 + 38) != 0);
        }
        if ((objc_opt_respondsToSelector(v12, "sparseSurfaceDefaultValue") & 1) != 0) {
          -[MTLTextureDescriptor setSparseSurfaceDefaultValue:]( v12,  "setSparseSurfaceDefaultValue:",  *(unsigned __int8 *)(v10 + 48));
        }
        if ((objc_opt_respondsToSelector(v12, "writeSwizzleEnabled") & 1) != 0) {
          -[MTLTextureDescriptor setWriteSwizzleEnabled:](v12, "setWriteSwizzleEnabled:", *(_BYTE *)(v10 + 50) != 0);
        }
        if ((objc_opt_respondsToSelector(v12, "compressionType") & 1) != 0)
        {
          -[MTLTextureDescriptor setCompressionType:](v12, "setCompressionType:", *(unsigned __int8 *)(v10 + 41));
        }

        else if ((objc_opt_respondsToSelector(v12, "lossyCompressionMode") & 1) != 0)
        {
          -[MTLTextureDescriptor setLossyCompressionMode:]( v12,  "setLossyCompressionMode:",  *(unsigned __int8 *)(v10 + 41));
        }

        if ((objc_opt_respondsToSelector(v12, "compressionFootprint") & 1) != 0) {
          -[MTLTextureDescriptor setCompressionFootprint:]( v12,  "setCompressionFootprint:",  *(unsigned __int8 *)(v10 + 39));
        }
        if ((objc_opt_respondsToSelector(v12, "compressionMode") & 1) != 0) {
          -[MTLTextureDescriptor setCompressionMode:](v12, "setCompressionMode:", *(unsigned __int8 *)(v10 + 40));
        }
        -[MTLTextureDescriptor setAllowGPUOptimizedContents:]( v12,  "setAllowGPUOptimizedContents:",  *(_BYTE *)(v10 + 38) != 0);
        -[MTLTextureDescriptor setFramebufferOnly:](v12, "setFramebufferOnly:", *(_BYTE *)(v10 + 43) != 0);
        -[MTLTextureDescriptor setIsDrawable:](v12, "setIsDrawable:", *(_BYTE *)(v10 + 44) != 0);
        id v13 = [v11 heapTextureSizeAndAlignWithDescriptor:v12];
        unint64_t v15 = v14;

        uint64_t v16 = v9 + v6;
        unint64_t v17 = *(void *)(v9 + v6 + 8);
        unint64_t v18 = *(void *)(v16 + 16);

        BOOL v20 = v17 >= v15 && v18 <= (unint64_t)v13;
        v8 &= v20;
        unint64_t v5 = *((unsigned int *)a1 + 2);
      }

      ++v7;
      v6 += 24LL;
    }

    while (v7 < v5);
  }

  else
  {
    char v8 = 1;
  }

  return v8 & 1;
}

uint64_t sub_10001E74C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (*(_BYTE *)(a2 + 49623) && *(_DWORD *)(a1 + 8))
  {
    uint64_t v6 = 0LL;
    unint64_t v7 = 0LL;
    int v8 = 1;
    do
    {
      uint64_t v9 = (void *)(*(void *)a1 + v6);
      else {
        int v11 = v8;
      }
      if (v9[1] >= v10) {
        int v8 = v11;
      }
      else {
        int v8 = 0;
      }
      ++v7;
      v6 += 24LL;
    }

    while (v7 < *(unsigned int *)(a1 + 8));
    uint64_t v12 = v8 & 1;
  }

  else
  {
    uint64_t v12 = 1LL;
  }

  return v12;
}

vm_address_t sub_10001E7FC(memory_object_size_t a1)
{
  kern_return_t memory_entry_64;
  mach_error_t v3;
  char *v4;
  const char *v5;
  kern_return_t v6;
  mach_error_t v7;
  char *v9;
  memory_object_size_t size;
  mach_port_t object_handle;
  vm_address_t address;
  uint8_t buf[4];
  mach_error_t v14;
  __int16 v15;
  char *v16;
  address = 0LL;
  size = a1;
  memory_entry_64 = mach_make_memory_entry_64(mach_task_self_, &size, 0LL, 139267, &object_handle, 0);
  if (memory_entry_64)
  {
    id v3 = memory_entry_64;
    sub_10001F500();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = mach_error_string(v3);
      *(_DWORD *)buf = 67109378;
      unint64_t v14 = v3;
      unint64_t v15 = 2080;
      uint64_t v16 = v4;
      id v5 = "warning: failed to create memory entry error 0x%x (%s)";
LABEL_10:
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v5, buf, 0x12u);
    }
  }

  else
  {
    uint64_t v6 = vm_map(mach_task_self_, &address, a1, 0LL, 1, object_handle, 0LL, 0, 3, 3, 1u);
    if (!v6)
    {
      mach_port_deallocate(mach_task_self_, object_handle);
      return address;
    }

    unint64_t v7 = v6;
    sub_10001F500();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = mach_error_string(v7);
      *(_DWORD *)buf = 67109378;
      unint64_t v14 = v7;
      unint64_t v15 = 2080;
      uint64_t v16 = v9;
      id v5 = "warning: failed to map memory error 0x%x (%s)";
      goto LABEL_10;
    }
  }

  return 0LL;
}

uint64_t sub_10001E9A0(uint64_t a1)
{
  if (qword_10003DCF8 == a1) {
    qword_10003DCF8 = 0LL;
  }
  return 0LL;
}

void apr_pool_destroy(apr_pool_t *p)
{
  for (uint64_t i = *((void *)p + 14); i; uint64_t i = *((void *)p + 14))
  {
    *((void *)p + 14) = *(void *)i;
    (*(void (**)(void))(i + 16))(*(void *)(i + 8));
  }

  *((void *)p + 14) = 0LL;
  while (1)
  {
    id v3 = (apr_pool_t *)*((void *)p + 1);
    if (!v3) {
      break;
    }
    apr_pool_destroy(v3);
  }

  while (1)
  {
    uint64_t v4 = *((void *)p + 4);
    if (!v4) {
      break;
    }
    *((void *)p + 4) = *(void *)v4;
    (*(void (**)(void))(v4 + 16))(*(void *)(v4 + 8));
  }

  uint64_t v5 = *((void *)p + 7);
  if (!v5) {
    goto LABEL_42;
  }
  uint64_t v6 = *((void *)p + 7);
  do
  {
    uint64_t v6 = *(void *)(v6 + 16);
  }

  while (v6);
  uint64_t v7 = v5;
  do
  {
    int v8 = *(_DWORD *)(v7 + 8);
    if (v8 == 1)
    {
      sub_10001F44C(**(_DWORD **)v7, 9);
    }

    else
    {
      BOOL v9 = v8 == 4 || v8 == 2;
    }

    uint64_t v7 = *(void *)(v7 + 16);
  }

  while (v7);
  uint64_t v10 = v5;
  if (!(_DWORD)v6) {
    goto LABEL_36;
  }
  unint64_t v11 = 46875LL;
  v32.tv_usec = 46875;
  v32.tv_sec = 0LL;
  select(0, 0LL, 0LL, 0LL, &v32);
  while (2)
  {
    uint64_t v12 = 0LL;
    uint64_t v13 = v5;
    do
    {
      uint64_t v14 = v12;
      if (*(_DWORD *)(v13 + 8) == 2)
      {
        uint64_t v12 = 1LL;
        *(_DWORD *)(v13 + 8) = 0;
      }

      uint64_t v12 = v14;
LABEL_31:
      uint64_t v13 = *(void *)(v13 + 16);
    }

    while (v13);
    if ((_DWORD)v12 && v11 <= 0x2DC6BF)
    {
      v32.tv_usec = v11 % 0xF4240;
      v32.tv_sec = v11 / 0xF4240;
      select(0, 0LL, 0LL, 0LL, &v32);
      v11 *= 2LL;
      continue;
    }

    break;
  }

  uint64_t v10 = v5;
  do
  {
LABEL_36:
    if (*(_DWORD *)(v10 + 8) == 2) {
      sub_10001F44C(**(_DWORD **)v10, 9);
    }
    uint64_t v10 = *(void *)(v10 + 16);
  }

  while (v10);
  do
  {
    if (*(_DWORD *)(v5 + 8)) {
      sub_10001F20C(*(pid_t **)v5, 0);
    }
    uint64_t v5 = *(void *)(v5 + 16);
  }

  while (v5);
LABEL_42:
  if (*(void *)p)
  {
    uint64_t v15 = *(void *)(*(void *)(*(void *)p + 48LL) + 24LL);
    if (v15) {
      pthread_mutex_lock((pthread_mutex_t *)(v15 + 8));
    }
    uint64_t v16 = *((void *)p + 2);
    **((void **)p + 3) = v16;
    if (v16) {
      *(void *)(*((void *)p + 2) + 24LL) = *((void *)p + 3);
    }
    if (v15) {
      pthread_mutex_unlock((pthread_mutex_t *)(v15 + 8));
    }
  }

  vm_address_t v17 = *((void *)p + 6);
  vm_address_t v18 = *((void *)p + 12);
  **(void **)(v18 + 8) = 0LL;
  if (*(apr_pool_t **)(v17 + 32) == p)
  {
    *(void *)(v17 + 24) = 0LL;
  }

  else
  {
    uint64_t v19 = *(void *)(v17 + 24);
    if (v19) {
      pthread_mutex_lock((pthread_mutex_t *)(v19 + 8));
    }
  }

  vm_address_t v20 = 0LL;
  unint64_t v21 = *(void *)v17;
  uint64_t v22 = *(void *)(v17 + 8);
  unint64_t v23 = *(void *)(v17 + 16);
  do
  {
    while (1)
    {
      while (1)
      {
        vm_address_t v24 = v18;
        vm_address_t v18 = *(void *)v18;
        unint64_t v25 = *(unsigned int *)(v24 + 16);
        if (!v22 || v23 > v25) {
          break;
        }
        *(void *)vm_address_t v24 = v20;
        vm_address_t v20 = v24;
        if (!v18) {
          goto LABEL_72;
        }
      }

      vm_address_t v26 = v17 + 8 * v25;
      uint64_t v27 = *(void *)(v26 + 40);
      *(void *)vm_address_t v24 = v27;
      if (v21 < v25 && v27 == 0) {
        unint64_t v21 = v25;
      }
      *(void *)(v26 + 40) = v24;
      if (v23 <= v25)
      {
        unint64_t v23 = 0LL;
        if (!v18) {
          goto LABEL_72;
        }
      }

      else
      {
        v23 += ~v25;
        if (!v18) {
          goto LABEL_72;
        }
      }
    }

    *(void *)vm_address_t v24 = *(void *)(v17 + 40);
    *(void *)(v17 + 40) = v24;
    BOOL v29 = v23 > v25;
    v23 += ~v25;
    if (!v29) {
      unint64_t v23 = 0LL;
    }
  }

  while (v18);
LABEL_72:
  *(void *)vm_address_t v17 = v21;
  *(void *)(v17 + 16) = v23;
  uint64_t v30 = *(void *)(v17 + 24);
  if (v30) {
    pthread_mutex_unlock((pthread_mutex_t *)(v30 + 8));
  }
  if (v20)
  {
    do
    {
      vm_address_t v31 = *(void *)v20;
      vm_deallocate(mach_task_self_, v20, ((*(_DWORD *)(v20 + 16) << 12) + 4096));
      vm_address_t v20 = v31;
    }

    while (v31);
  }

  if (*(apr_pool_t **)(v17 + 32) == p) {
    sub_10001ED48(v17);
  }
}

uint64_t sub_10001ED48(vm_address_t address)
{
  for (uint64_t i = 0LL; i != 20; ++i)
  {
    vm_address_t v3 = address + 8 * i;
    vm_address_t v6 = *(void *)(v3 + 40);
    uint64_t v5 = (vm_address_t *)(v3 + 40);
    vm_address_t v4 = v6;
    if (v6)
    {
      do
      {
        vm_address_t *v5 = *(void *)v4;
        vm_deallocate(mach_task_self_, v4, ((*(_DWORD *)(v4 + 16) << 12) + 4096));
        vm_address_t v4 = *v5;
      }

      while (*v5);
    }
  }

  return vm_deallocate(mach_task_self_, address, 0xC8uLL);
}

void *sub_10001EDC0(unint64_t *a1, unint64_t a2)
{
  uint64_t v2 = 0LL;
  unint64_t v3 = (a2 + 4135) & 0xFFFFFFFFFFFFF000LL;
  unint64_t v4 = 0x2000LL;
  if (v3 > 0x2000) {
    unint64_t v4 = (a2 + 4135) & 0xFFFFFFFFFFFFF000LL;
  }
  if (v3 >= a2) {
    memory_object_size_t v5 = v4;
  }
  else {
    memory_object_size_t v5 = 0LL;
  }
  if (v3 >= a2)
  {
    unint64_t v6 = v4 >> 12;
    unint64_t v7 = (v4 >> 12) - 1;
    if (HIDWORD(v7)) {
      return 0LL;
    }
    unint64_t v9 = *a1;
    if (v7 <= *a1)
    {
      unint64_t v14 = a1[3];
      if (v14)
      {
        pthread_mutex_lock((pthread_mutex_t *)(v14 + 8));
        unint64_t v9 = *a1;
      }

      uint64_t v15 = &a1[v7];
      vm_address_t v17 = (void *)v15[5];
      uint64_t v16 = v15 + 5;
      uint64_t v2 = v17;
      BOOL v18 = v17 == 0LL;
      BOOL v19 = v7 < v9;
      if (v17) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v7 >= v9;
      }
      if (!v20)
      {
        do
        {
          unint64_t v21 = (void *)v16[1];
          ++v16;
          uint64_t v2 = v21;
          BOOL v18 = v21 == 0LL;
          BOOL v19 = v6 < v9;
          if (v21) {
            BOOL v22 = 1;
          }
          else {
            BOOL v22 = v6 >= v9;
          }
          ++v6;
        }

        while (!v22);
      }

      if (!v18)
      {
        uint64_t v25 = *v2;
        void *v16 = *v2;
        if (v25) {
          BOOL v19 = 1;
        }
        if (!v19)
        {
          vm_address_t v26 = v16 - 1;
          do
          {
            if (*v26--) {
              BOOL v28 = 1;
            }
            else {
              BOOL v28 = v9 == 1;
            }
            --v9;
          }

          while (!v28);
          *a1 = v9;
        }

        uint64_t v13 = (*((_DWORD *)v2 + 4) + 1);
LABEL_43:
        unint64_t v29 = a1[2] + v13;
        if (v29 >= a1[1]) {
          unint64_t v29 = a1[1];
        }
        a1[2] = v29;
        unint64_t v30 = a1[3];
        if (v30) {
          pthread_mutex_unlock((pthread_mutex_t *)(v30 + 8));
        }
        goto LABEL_47;
      }
    }

    else
    {
      uint64_t v2 = a1 + 5;
      if (!a1[5])
      {
LABEL_30:
        vm_address_t v24 = sub_10001E7FC(v5);
        uint64_t v2 = (void *)v24;
        if (!v24) {
          return v2;
        }
        *(_DWORD *)(v24 + 16) = v7;
        *(void *)(v24 + 32) = v24 + v5;
LABEL_47:
        *uint64_t v2 = 0LL;
        v2[3] = v2 + 5;
        return v2;
      }

      unint64_t v10 = a1[3];
      if (v10) {
        pthread_mutex_lock((pthread_mutex_t *)(v10 + 8));
      }
      while (1)
      {
        unint64_t v11 = v2;
        uint64_t v2 = (void *)*v2;
        if (!v2) {
          break;
        }
        unint64_t v12 = *((unsigned int *)v2 + 4);
        if (v7 <= v12)
        {
          void *v11 = *v2;
          uint64_t v13 = (v12 + 1);
          goto LABEL_43;
        }
      }
    }

    unint64_t v23 = a1[3];
    if (v23) {
      pthread_mutex_unlock((pthread_mutex_t *)(v23 + 8));
    }
    goto LABEL_30;
  }

  return v2;
}

apr_status_t apr_pool_create_ex( apr_pool_t **newpool, apr_pool_t *parent, apr_abortfunc_t abort_fn, apr_allocator_t *allocator)
{
  unint64_t v4 = (unint64_t *)allocator;
  apr_abortfunc_t v5 = abort_fn;
  *newpool = 0LL;
  if (parent) {
    unint64_t v7 = parent;
  }
  else {
    unint64_t v7 = (apr_pool_t *)qword_10003DD10;
  }
  if (!abort_fn && v7) {
    apr_abortfunc_t v5 = (apr_abortfunc_t)*((void *)v7 + 8);
  }
  if (!allocator) {
    unint64_t v4 = (unint64_t *)*((void *)v7 + 6);
  }
  int v8 = (apr_pool_t *)sub_10001EDC0(v4, 0x1FD8uLL);
  if (v8)
  {
    *(void *)int v8 = v8;
    *((void *)v8 + 1) = v8;
    unint64_t v9 = (apr_pool_t **)*((void *)v8 + 3);
    *((void *)v8 + 3) = v9 + 15;
    v9[12] = v8;
    v9[13] = (apr_pool_t *)(v9 + 15);
    v9[14] = 0LL;
    void v9[6] = (apr_pool_t *)v4;
    v9[7] = 0LL;
    v9[4] = 0LL;
    v9[5] = 0LL;
    v9[10] = 0LL;
    v9[11] = v8;
    v9[8] = (apr_pool_t *)v5;
    v9[9] = 0LL;
    void *v9 = v7;
    v9[1] = 0LL;
    if (v7)
    {
      uint64_t v10 = *(void *)(*((void *)v7 + 6) + 24LL);
      if (v10) {
        pthread_mutex_lock((pthread_mutex_t *)(v10 + 8));
      }
      uint64_t v13 = (apr_pool_t *)*((void *)v7 + 1);
      unint64_t v12 = (apr_pool_t ***)((char *)v7 + 8);
      unint64_t v11 = v13;
      _DWORD v9[2] = v13;
      if (v13) {
        *((void *)v11 + 3) = v9 + 2;
      }
      MTLTextureDescriptor *v12 = v9;
      v9[3] = (apr_pool_t *)v12;
      if (v10) {
        pthread_mutex_unlock((pthread_mutex_t *)(v10 + 8));
      }
    }

    else
    {
      _DWORD v9[2] = 0LL;
      v9[3] = 0LL;
    }

    apr_status_t v14 = 0;
    *newpool = (apr_pool_t *)v9;
  }

  else
  {
    apr_status_t v14 = 12;
    if (v5) {
      ((void (*)(uint64_t))v5)(12LL);
    }
  }

  return v14;
}

uint64_t sub_10001F078(uint64_t a1, unint64_t a2)
{
  unint64_t v3 = (a2 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  if (v3 < a2)
  {
LABEL_2:
    unint64_t v4 = *(void (**)(uint64_t))(a1 + 64);
    if (v4) {
      v4(12LL);
    }
    return 0LL;
  }

  unint64_t v6 = *(void **)(a1 + 88);
  uint64_t result = v6[3];
  if (v3 <= v6[4] - result)
  {
    v6[3] = result + v3;
    return result;
  }

  unint64_t v7 = (void *)*v6;
  if (v3 <= *(void *)(*v6 + 32LL) - *(void *)(*v6 + 24LL))
  {
    *(void *)v7[1] = *v7;
    *(void *)(*v7 + 8LL) = v7[1];
  }

  else
  {
    unint64_t v7 = sub_10001EDC0(*(unint64_t **)(a1 + 48), (a2 + 7) & 0xFFFFFFFFFFFFFFF8LL);
    if (!v7) {
      goto LABEL_2;
    }
  }

  *((_DWORD *)v7 + 5) = 0;
  uint64_t result = v7[3];
  v7[3] = result + v3;
  int v8 = (void *)v6[1];
  v7[1] = v8;
  *int v8 = v7;
  void *v7 = v6;
  v6[1] = v7;
  *(void *)(a1 + 88) = v7;
  unint64_t v9 = (uint64_t)(v6[4] - v6[3]) >> 12;
  *((_DWORD *)v6 + 5) = v9;
  if (v9 < *(unsigned int *)(*v6 + 20LL))
  {
    uint64_t v10 = (uint64_t *)*v6;
    do
      uint64_t v10 = (uint64_t *)*v10;
    while (*((_DWORD *)v10 + 5) > v9);
    void *v7 = *v6;
    *(void *)(*v6 + 8LL) = v6[1];
    unint64_t v11 = (void *)v10[1];
    v6[1] = v11;
    void *v11 = v6;
    void *v6 = v10;
    v10[1] = (uint64_t)v6;
  }

  return result;
}

void *sub_10001F19C(void *result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    uint64_t v5 = (uint64_t)result;
    uint64_t result = (void *)result[5];
    if (result) {
      *(void *)(v5 + 40) = *result;
    }
    else {
      uint64_t result = (void *)sub_10001F078(v5, 0x20uLL);
    }
    result[2] = a3;
    result[3] = sub_10001F204;
    *uint64_t result = *(void *)(v5 + 32);
    result[1] = a2;
    *(void *)(v5 + 32) = result;
  }

  return result;
}

uint64_t sub_10001F204()
{
  return 0LL;
}

uint64_t sub_10001F20C(pid_t *a1, int a2)
{
  if (a2) {
    int v3 = 3;
  }
  else {
    int v3 = 2;
  }
  while (1)
  {
    pid_t v4 = waitpid(*a1, &v6, v3);
    if ((v4 & 0x80000000) == 0) {
      break;
    }
    if (*__error() != 4) {
      return *__error();
    }
  }

  if (!v4) {
    return 70006LL;
  }
  *a1 = v4;
  if ((~v6 & 0x7F) != 0) {
    return 70005LL;
  }
  else {
    return 20014LL;
  }
}

apr_status_t apr_initialize(void)
{
  if (dword_10003DD18++) {
    return 0;
  }
  if (!byte_10003DD00++)
  {
    qword_10003DD08 = 0LL;
    vm_address_t v4 = sub_10001E7FC(0xC8uLL);
    if (!v4)
    {
      byte_10003DD00 = 0;
      return 12;
    }

    *(_OWORD *)vm_address_t v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    *(void *)(v4 + 192) = 0LL;
    *(_OWORD *)(v4 + 160) = 0u;
    *(_OWORD *)(v4 + 176) = 0u;
    *(_OWORD *)(v4 + 128) = 0u;
    *(_OWORD *)(v4 + 144) = 0u;
    *(_OWORD *)(v4 + 96) = 0u;
    *(_OWORD *)(v4 + 112) = 0u;
    *(_OWORD *)(v4 + 64) = 0u;
    *(_OWORD *)(v4 + 80) = 0u;
    *(_OWORD *)(v4 + 32) = 0u;
    *(_OWORD *)(v4 + 48) = 0u;
    qword_10003DD08 = v4;
    *(int64x2_t *)(v4 + 8) = vdupq_n_s64(0x8000uLL);
    apr_status_t v5 = apr_pool_create_ex((apr_pool_t **)&qword_10003DD10, 0LL, 0LL, (apr_allocator_t *)v4);
    if (v5)
    {
      apr_status_t v1 = v5;
      sub_10001ED48(qword_10003DD08);
      qword_10003DD08 = 0LL;
      byte_10003DD00 = 0;
      return v1;
    }

    int v6 = (void *)qword_10003DD10;
    *(void *)(qword_10003DD10 + 80) = "apr_global_pool";
    if (qword_10003DCF8)
    {
LABEL_17:
      apr_status_t v8 = sub_10001F478(&newpool, (uint64_t)v6);
      if (!v8)
      {
        uint64_t v9 = qword_10003DD08;
        uint64_t v10 = qword_10003DD10;
        *(void *)(qword_10003DD08 + 24) = newpool;
        *(void *)(v9 + 32) = v10;
        goto LABEL_5;
      }
    }

    else
    {
      qword_10003DCF8 = sub_10001F078((uint64_t)v6, 0x38uLL);
      sub_10001F19C(v6, qword_10003DCF8, (uint64_t)sub_10001E9A0);
      uint64_t v7 = 0LL;
      while (1)
      {
        apr_status_t v8 = sub_10001F478((void *)(qword_10003DCF8 + v7), (uint64_t)v6);
        if (v8) {
          break;
        }
        v7 += 8LL;
        if (v7 == 56)
        {
          int v6 = (void *)qword_10003DD10;
          goto LABEL_17;
        }
      }
    }

    return v8;
  }

uint64_t sub_10001F44C(pid_t a1, int a2)
{
  if (kill(a1, a2) == -1) {
    return *__error();
  }
  else {
    return 0LL;
  }
}

uint64_t sub_10001F478(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_10001F078(a2, 0x48uLL);
  apr_status_t v5 = (void **)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 56) = 0u;
    *(_OWORD *)(v4 + 40) = 0u;
    *(_OWORD *)(v4 + 24) = 0u;
    *(_OWORD *)(v4 + 8) = 0u;
  }

  *(void *)uint64_t v4 = a2;
  uint64_t result = pthread_mutex_init((pthread_mutex_t *)(v4 + 8), 0LL);
  if (!(_DWORD)result)
  {
    sub_10001F19C(*v5, (uint64_t)v5, (uint64_t)sub_10001F4F8);
    uint64_t result = 0LL;
    *a1 = v5;
  }

  return result;
}

uint64_t sub_10001F4F8(uint64_t a1)
{
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
}

void *sub_10001F500()
{
  if (qword_10003DD20 != -1) {
    dispatch_once(&qword_10003DD20, &stru_100031000);
  }
  return &_os_log_default;
}

void sub_10001F540(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)apr_status_t v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "GPUTOOLS(warning): Log uninitialized, please call GTCoreLogInit(), logging to OS_LOG_DEFAULT instead",  v1,  2u);
  }

uint64_t GTCorePlatformGet()
{
  return 3LL;
}

id PrettifyFenumString(void *a1, int a2, int a3)
{
  id v5 = a1;
  if (v5)
  {
    int v6 = v5;
    if ([v5 hasPrefix:@"kDYFE"])
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 substringFromIndex:5]);

      int v6 = (void *)v7;
    }

    id v8 = [v6 rangeOfString:@"_"];
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue( objc_msgSend( v6,  "stringByReplacingOccurrencesOfString:withString:options:range:",  @"_",  @" ",  0,  v8,  v9));

      int v6 = (void *)v10;
    }

    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByReplacingOccurrencesOfString:@"_" withString:@":"]);

    unint64_t v12 = @"-";
    if (a2) {
      unint64_t v12 = @"+";
    }
    uint64_t v13 = &stru_100031028;
    if (a3) {
      uint64_t v13 = @":";
    }
    apr_status_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@[%@%@]",  v12,  v11,  v13));
  }

  else
  {
    apr_status_t v14 = 0LL;
  }

  return v14;
}

id objc_msgSend_beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginTransferSessionWithFileEntries:basePath:toDevice:options:sessionID:completionHandler:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}