@interface PlistProcessor
+ (id)sharedPlistProcessor;
- (BOOL)jobIsManagedByMSM:(id)a3;
- (BOOL)verifyPlist:(id)a3 forMountPoint:(id)a4 withError:(id *)a5;
- (id)copyAndFixPlist:(id)a3 forMountPoint:(id)a4 withError:(id *)a5;
- (id)copyPlistWithMSMKeys:(id)a3 withError:(id *)a4;
- (void)scanPlistsAtPath:(id)a3 execBlock:(id)a4;
@end

@implementation PlistProcessor

+ (id)sharedPlistProcessor
{
  if (qword_100034880 != -1) {
    dispatch_once(&qword_100034880, &stru_10002CD78);
  }
  return (id)qword_100034878;
}

- (void)scanPlistsAtPath:(id)a3 execBlock:(id)a4
{
  id v5 = a3;
  v6 = (uint64_t (**)(id, void *, void))a4;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager", 0LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 enumeratorAtPath:v5]);

  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v13]);
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v14));
        if (v15 && (v6[2](v6, v15, v13) & 1) == 0)
        {

          goto LABEL_12;
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

- (id)copyAndFixPlist:(id)a3 forMountPoint:(id)a4 withError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v12 = v8;
  if (!v7 || !v8)
  {
    id v42 = sub_1000139A0( (uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]",  107LL,  -3,  0LL,  @"Invalid input(s).",  v9,  v10,  v11,  v52);
    id v41 = (id)objc_claimAutoreleasedReturnValue(v42);
    v53 = 0LL;
    id v40 = 0LL;
    id v31 = 0LL;
    v21 = 0LL;
    v39 = 0LL;
    goto LABEL_15;
  }

  id v13 = sub_100008B7C(v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = sub_100008B7C(@"/private/var/personalized_factory");
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  unsigned __int8 v17 = [v14 hasPrefix:v16];

  v53 = v14;
  if ((v17 & 1) == 0)
  {
    id v43 = v7;
    v37 = 0LL;
    v26 = 0LL;
    id v41 = 0LL;
    v39 = 0LL;
LABEL_20:
    v21 = 0LL;
    id v31 = 0LL;
    id v40 = 0LL;
    goto LABEL_29;
  }

  uint64_t v18 = objc_claimAutoreleasedReturnValue([v7 objectForKey:@"Label"]);
  __int128 v19 = sub_10000922C(v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  if (!v20)
  {
    v39 = (void *)v18;
    id v40 = (id)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"XPCServiceName"]);

    if (v40)
    {
      id v43 = v7;
      v37 = 0LL;
      v26 = 0LL;
      id v41 = 0LL;
      goto LABEL_20;
    }

    id v48 = sub_1000139A0( (uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]",  127LL,  -2,  0LL,  @"Missing program arguments.",  v44,  v45,  v46,  v52);
    id v41 = (id)objc_claimAutoreleasedReturnValue(v48);
    id v31 = 0LL;
    v21 = 0LL;
LABEL_15:
    v26 = 0LL;
    goto LABEL_16;
  }

  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue([v20 objectAtIndex:0]);
  v26 = v22;
  if (v22)
  {
    if ([v22 hasPrefix:@"/Developer"])
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue([v26 componentsSeparatedByString:@"/"]);
      id v31 = [v30 mutableCopy];

      v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectAtIndex:0]);
      unsigned int v33 = [v32 isEqualToString:&stru_10002F6C8];

      if (v33) {
        [v31 removeObjectAtIndex:0];
      }
      [v31 replaceObjectAtIndex:0 withObject:v14];
      v37 = (void *)objc_claimAutoreleasedReturnValue([v31 componentsJoinedByString:@"/"]);
      if (v37)
      {
        id v38 = [v7 mutableCopy];
        [v21 replaceObjectAtIndex:0 withObject:v37];
        [v38 setObject:v21 forKey:@"ProgramArguments"];
        [v38 removeObjectForKey:@"Program"];
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_10001E440();
        }
        v39 = (void *)v18;
        id v40 = v38;
        id v41 = 0LL;
        if (!a5) {
          goto LABEL_28;
        }
      }

      else
      {
        v39 = (void *)v18;
        id v49 = sub_1000139A0( (uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]",  158LL,  -2,  0LL,  @"Failed to update program path %@.",  v34,  v35,  v36,  (uint64_t)v26);
        id v41 = (id)objc_claimAutoreleasedReturnValue(v49);
        id v40 = 0LL;
        if (!a5) {
          goto LABEL_28;
        }
      }

      goto LABEL_17;
    }

    v39 = (void *)v18;
    id v47 = sub_1000139A0( (uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]",  144LL,  -2,  0LL,  @"Invalid program path: %@",  v27,  v28,  v29,  (uint64_t)v26);
  }

  else
  {
    v39 = (void *)v18;
    id v47 = sub_1000139A0( (uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]",  135LL,  -2,  0LL,  @"Invalid program arguments: %@",  v23,  v24,  v25,  (uint64_t)v21);
  }

  id v41 = (id)objc_claimAutoreleasedReturnValue(v47);
  id v40 = 0LL;
  id v31 = 0LL;
LABEL_16:
  v37 = 0LL;
  if (!a5)
  {
LABEL_28:
    id v43 = v40;
    goto LABEL_29;
  }

- (id)copyPlistWithMSMKeys:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  uint64_t v9 = v5;
  if (v5)
  {
    id v10 = [v5 mutableCopy];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"_AdditionalProperties"]);
    id v12 = sub_100013118(v11);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if (v13) {
      v14 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v11);
    }
    else {
      v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    v21 = v14;
    if (v14)
    {
      uint64_t v27 = @"ManagedByMobileStorageMounter";
      uint64_t v28 = &__kCFBooleanTrue;
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v21,  "setObject:forKeyedSubscript:",  v22,  @"MobileStorageMounter");

      [v10 setObject:v21 forKeyedSubscript:@"_AdditionalProperties"];
      id v20 = v10;
      __int128 v19 = 0LL;
      id v10 = v20;
      if (!a4) {
        goto LABEL_13;
      }
    }

    else
    {
      id v23 = sub_1000139A0( (uint64_t)"-[PlistProcessor copyPlistWithMSMKeys:withError:]",  208LL,  -2,  0LL,  @"Failed to allocate dictionary.",  v15,  v16,  v17,  v26);
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v23);
      id v20 = 0LL;
      if (!a4) {
        goto LABEL_13;
      }
    }
  }

  else
  {
    id v18 = sub_1000139A0( (uint64_t)"-[PlistProcessor copyPlistWithMSMKeys:withError:]",  192LL,  -2,  0LL,  @"Invalid input.",  v6,  v7,  v8,  v26);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    id v20 = 0LL;
    id v10 = 0LL;
    uint64_t v11 = 0LL;
    v21 = 0LL;
    if (!a4) {
      goto LABEL_13;
    }
  }

  if (!v20) {
    *a4 = v19;
  }
LABEL_13:
  id v24 = v20;

  return v24;
}

- (BOOL)jobIsManagedByMSM:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v17) {
      sub_10001E4B4(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    goto LABEL_22;
  }

  uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Label"]);
  if (!v5)
  {
    BOOL v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v25) {
      sub_10001E4EC(v25, v26, v27, v28, v29, v30, v31, v32);
    }
    goto LABEL_22;
  }

  uint64_t v6 = (void *)v5;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"_AdditionalProperties"]);
  id v8 = sub_100013118(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10001E524();
    }

    goto LABEL_21;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"MobileStorageMounter"]);
  id v11 = sub_100013118(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10001E5A8((uint64_t)v6, v33, v34, v35, v36, v37, v38, v39);
    }

    goto LABEL_20;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"ManagedByMobileStorageMounter"]);
  id v14 = sub_1000130C0(v13);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  if (!v15)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10001E638((uint64_t)v6, v40, v41, v42, v43, v44, v45, v46);
    }

LABEL_20:
LABEL_21:

LABEL_22:
    unsigned __int8 v16 = 0;
    goto LABEL_23;
  }

  unsigned __int8 v16 = [v13 BOOLValue];

LABEL_23:
  return v16;
}

- (BOOL)verifyPlist:(id)a3 forMountPoint:(id)a4 withError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v12 = v8;
  if (!v7 || !v8)
  {
    id v42 = sub_1000139A0( (uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]",  282LL,  -3,  0LL,  @"Invalid input(s).",  v9,  v10,  v11,  v52);
    id v40 = (id)objc_claimAutoreleasedReturnValue(v42);
    uint64_t v22 = 0LL;
    BOOL v25 = 0LL;
    uint64_t v30 = 0LL;
    unsigned __int8 v16 = 0LL;
    if (!a5) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }

  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"Label"]);
  if (!v16)
  {
    id v43 = sub_1000139A0( (uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]",  288LL,  -2,  0LL,  @"Failed to retrieve job label.",  v13,  v14,  v15,  v52);
    id v40 = (id)objc_claimAutoreleasedReturnValue(v43);
    uint64_t v22 = 0LL;
    goto LABEL_15;
  }

  BOOL v17 = sub_10000922C(v7);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  uint64_t v22 = v18;
  if (!v18)
  {
    id v44 = sub_1000139A0( (uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]",  294LL,  -2,  0LL,  @"Failed to retrieve program arguments.",  v19,  v20,  v21,  v52);
    id v40 = (id)objc_claimAutoreleasedReturnValue(v44);
    goto LABEL_15;
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v18 objectAtIndex:0]);
  id v24 = sub_100008B7C(v23);
  BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

  if (!v25)
  {
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndex:0]);
    id v49 = sub_1000139A0( (uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]",  300LL,  -2,  0LL,  @"Failed to normalize %@.",  v46,  v47,  v48,  (uint64_t)v45);
    id v40 = (id)objc_claimAutoreleasedReturnValue(v49);

LABEL_15:
    BOOL v25 = 0LL;
    uint64_t v30 = 0LL;
    if (!a5)
    {
LABEL_20:
      BOOL v41 = 0;
      goto LABEL_21;
    }

@end