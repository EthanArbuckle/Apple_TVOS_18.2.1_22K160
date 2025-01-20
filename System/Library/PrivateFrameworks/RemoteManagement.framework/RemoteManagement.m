id start()
{
  void *v0;
  void *v1;
  RMIProgramDelegate *v2;
  id v3;
  v0 = objc_autoreleasePoolPush();
  +[RMBundle setManagementScope:](&OBJC_CLASS___RMBundle, "setManagementScope:", sub_100005DFC());
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[CLIProgram sharedProgram](&OBJC_CLASS___CLIProgram, "sharedProgram"));
  v2 = objc_opt_new(&OBJC_CLASS___RMIProgramDelegate);
  [v1 setDelegate:v2];

  v3 = [v1 main];
  objc_autoreleasePoolPop(v0);
  return v3;
}

void sub_100003F84( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

LABEL_24:
  -[RMActivationPayloadState didChangeValueForKey:](self, "didChangeValueForKey:", @"inactiveReasons");
}

void sub_100005784(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v23 = a2;
  id v7 = a3;
  id v8 = a4;
  v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v10 = v9;
  if (!v8)
  {
    uint64_t v11 = sub_100011B0C();
    uint64_t v18 = v11;
    if (v7 || v11)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  @"Result",  @"Type");
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a1));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v19, @"Code");

      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v23, @"Message");
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v7, @"Detail");
      sub_100011D40(v10);
      if (v18) {
        goto LABEL_5;
      }
      v20 = __stdoutp;
      v21 = @"\n";
    }

    else
    {
      if (a1)
      {
        sub_100011B4C(@"%@\n\n", (uint64_t)v23, v12, v13, v14, v15, v16, v17, (uint64_t)v23);
        goto LABEL_5;
      }

      v20 = __stdoutp;
      uint64_t v22 = (uint64_t)v23;
      v21 = @"%@\n\n";
    }

    sub_100011A20(v20, v21, v12, v13, v14, v15, v16, v17, v22);
    goto LABEL_5;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v23, @"Detail");
  if (v7) {
    -[NSMutableDictionary addEntriesFromDictionary:](v10, "addEntriesFromDictionary:", v7);
  }
  sub_100011FD0(v8, v10);
LABEL_5:
}

void sub_100005950(id a1)
{
  v1 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v2 = (void *)qword_100025378;
  qword_100025378 = (uint64_t)v1;

  v3 = (objc_class *)objc_opt_class(&OBJC_CLASS___RMCTestSuite);
  objc_enumerateClasses(0LL, 0LL, 0LL, v3, &stru_10001C520);
}

void sub_1000059A4(id a1, Class a2, BOOL *a3)
{
  v4 = (void *)qword_100025378;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[objc_class name](a2, "name", a3));
  [v4 setObject:a2 forKeyedSubscript:v5];
}

NSPersistentContainer *sub_100005AB4(char a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[RMLocations persistentStoreURLCreateIfNeeded:]( &OBJC_CLASS___RMLocations,  "persistentStoreURLCreateIfNeeded:",  0LL));
  id v3 = 0LL;
  v4 = v3;
  if (v2)
  {
    id v31 = v3;
    unsigned __int8 v5 = [v2 checkResourceIsReachableAndReturnError:&v31];
    id v6 = v31;

    if ((v5 & 1) != 0)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPersistentStoreDescription persistentStoreDescriptionWithURL:]( &OBJC_CLASS___NSPersistentStoreDescription,  "persistentStoreDescriptionWithURL:",  v2));
      [v7 setType:NSSQLiteStoreType];
      [v7 setShouldMigrateStoreAutomatically:0];
      [v7 setShouldInferMappingModelAutomatically:1];
      [v7 setOption:&__kCFBooleanTrue forKey:NSPersistentHistoryTrackingKey];
      id v8 = objc_alloc(&OBJC_CLASS___NSManagedObjectModel);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[RMLocations managedObjectModelURL](&OBJC_CLASS___RMLocations, "managedObjectModelURL"));
      v10 = -[NSManagedObjectModel initWithContentsOfURL:](v8, "initWithContentsOfURL:", v9);

      uint64_t v11 = -[NSPersistentContainer initWithName:managedObjectModel:]( objc_alloc(&OBJC_CLASS___NSPersistentContainer),  "initWithName:managedObjectModel:",  @"RemoteManagement",  v10);
      v32 = v7;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
      -[NSPersistentContainer setPersistentStoreDescriptions:](v11, "setPersistentStoreDescriptions:", v12);

      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_100005D94;
      v28[3] = &unk_10001C548;
      char v30 = a1;
      id v29 = v2;
      -[NSPersistentContainer loadPersistentStoresWithCompletionHandler:]( v11,  "loadPersistentStoresWithCompletionHandler:",  v28);
    }

    else
    {
      if ((a1 & 1) == 0)
      {
        uint64_t v21 = objc_claimAutoreleasedReturnValue([v2 path]);
        objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
        sub_100011CB4(74, @"Missing Core Data store %@: %@", v22, v23, v24, v25, v26, v27, v21);
      }

      uint64_t v11 = 0LL;
    }

    v4 = v6;
  }

  else
  {
    if ((a1 & 1) == 0)
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v3 localizedDescription]);
      sub_100011CB4(74, @"Can't get persistent store URL: %@", v15, v16, v17, v18, v19, v20, v14);
    }

    uint64_t v11 = 0LL;
  }

  return v11;
}

void sub_100005D24(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[RMErrorUtilities createInternalError](&OBJC_CLASS___RMErrorUtilities, "createInternalError"));
    v4 = v3;
    if (v3) {
      id v5 = v3;
    }

    objc_end_catch();
    JUMPOUT(0x100005B00LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_100005D94(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if (v5 && !*(_BYTE *)(a1 + 40))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
    sub_100011CB4(74, @"Can't open Core Data store %@: %@", v7, v8, v9, v10, v11, v12, v6);
  }
}

BOOL sub_100005DFC()
{
  return !geteuid() || geteuid() == 277;
}

LABEL_12:
}

LABEL_15:
  uint64_t v18 = -[NSMutableDictionary copy](v3, "copy");
  return v18;
}

  goto LABEL_16;
}

  if (self)
  {
    if (v6)
    {
      --qword_100025440;
      --self->_optind;
    }
  }

  return 1;
}

void sub_100006A28(id a1)
{
  os_log_t v1 = os_log_create("com.apple.remotemanagementd", "httpconduitstate");
  id v2 = (void *)qword_100025388;
  qword_100025388 = (uint64_t)v1;
}

void sub_100007FDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100007FF4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100008004(uint64_t a1)
{
}

void sub_10000800C(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[RMReport reportWithContext:allInformation:]( &OBJC_CLASS___RMReport,  "reportWithContext:allInformation:",  *(void *)(a1 + 32),  0LL));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100008350( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35)
{
}

void sub_100008374(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[RMManagementSource fetchRequest](&OBJC_CLASS___RMManagementSource, "fetchRequest"));
  id v16 = 0LL;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 execute:&v16]);
  id v4 = v16;
  if (v3)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(a1 + 32);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v9), "identifier", (void)v12));
          [v10 addObject:v11];

          uint64_t v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }

      while (v7);
    }
  }
}

void sub_1000084CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:&__NSDictionary0__struct forKeyedSubscript:@"Status"];
  uint64_t v14 = a1;
  id v4 = *(id *)(a1 + 32);
  id v5 = v3;
  id v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v10);
        uint64_t v20 = @"Error";
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedDescription", v14));
        uint64_t v21 = v12;
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v13, v11);

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
    }

    while (v8);
  }

  [*(id *)(*(void *)(*(void *)(v14 + 40) + 8) + 40) setObject:v6 forKeyedSubscript:@"Errors"];
}

void sub_10000869C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (v8)
  {
    id v23 = v7;
    [v9 setObject:&__NSDictionary0__struct forKeyedSubscript:@"Status"];
    uint64_t v22 = a1;
    id v10 = *(id *)(a1 + 32);
    id v11 = v8;
    __int128 v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id obj = v10;
    id v13 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v26;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
          id v29 = @"Error";
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedDescription", v22));
          char v30 = v18;
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v19, v17);
        }

        id v14 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
      }

      while (v14);
    }

    [*(id *)(*(void *)(*(void *)(v22 + 40) + 8) + 40) setObject:v12 forKeyedSubscript:@"Errors"];
    id v7 = v23;
  }

  else
  {
    [v9 setObject:a2 forKeyedSubscript:@"Status"];
    id v20 = v7;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_10000892C;
    v31[3] = &unk_10001C650;
    uint64_t v21 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    v32 = v21;
    [v20 enumerateKeysAndObjectsUsingBlock:v31];

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v21 forKeyedSubscript:@"Errors"];
  }
}

void sub_10000892C(uint64_t a1, void *a2, void *a3)
{
  v11[0] = @"Domain";
  id v5 = a3;
  id v6 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  v12[0] = v7;
  v11[1] = @"Code";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 code]));
  v12[1] = v8;
  v11[2] = @"Description";
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);

  v12[2] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  3LL));
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v6];
}

void sub_100008A9C(id a1)
{
  os_log_t v1 = objc_opt_new(&OBJC_CLASS___NSDateFormatter);
  uint64_t v2 = (void *)qword_100025398;
  qword_100025398 = (uint64_t)v1;

  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  @"en_US_POSIX"));
  [(id)qword_100025398 setLocale:v3];

  [(id)qword_100025398 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](&OBJC_CLASS___NSTimeZone, "timeZoneForSecondsFromGMT:", 0LL));
  [(id)qword_100025398 setTimeZone:v4];
}

LABEL_40:
    }

    else
    {
      __int128 v25 = objc_opt_class(&OBJC_CLASS___NSSet);
      if ((objc_opt_isKindOfClass(v4, v25) & 1) != 0)
      {
        id v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
        id v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        __int128 v26 = v4;
        __int128 v27 = [v26 countByEnumeratingWithState:&v31 objects:v46 count:16];
        if (v27)
        {
          __int128 v28 = *(void *)v32;
          while (2)
          {
            for (j = 0LL; j != v27; j = (char *)j + 1)
            {
              if (*(void *)v32 != v28) {
                objc_enumerationMutation(v26);
              }
              char v30 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "serializeValue:",  *(void *)(*((void *)&v31 + 1) + 8 * (void)j),  (void)v31));
              if (!v30)
              {

                id v8 = 0LL;
                goto LABEL_43;
              }

              -[NSMutableArray addObject:](v8, "addObject:", v30);
            }

            __int128 v27 = [v26 countByEnumeratingWithState:&v31 objects:v46 count:16];
            if (v27) {
              continue;
            }
            break;
          }
        }

LABEL_43:
      }

      else
      {
        id v8 = 0LL;
      }
    }
  }

LABEL_5:
  return v8;
}

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[CLICommand registeredCommandWithName:]( &OBJC_CLASS___CLICommand,  "registeredCommandWithName:",  @"help"));
    uint64_t v9 = 0LL;
  }

LABEL_8:
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[CLIOptionParser optionParserWithArguments:forCommand:]( &OBJC_CLASS___CLIOptionParser,  "optionParserWithArguments:forCommand:",  v8,  v11));

  return v12;
}

void sub_100008F9C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, char a32)
{
}

uint64_t sub_100008FBC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100008FCC(uint64_t a1)
{
}

void sub_100008FD4(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7 = *(void **)(a1 + 40);
  id v8 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue([v7 serializeValue:a2]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) serializeValue:v8]);

  if (v13) {
    BOOL v10 = v9 == 0LL;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    *a4 = 1;
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8LL);
    __int128 v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0LL;
  }

  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v9 forKeyedSubscript:v13];
  }
}

void sub_1000092B0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.remotemanagementd", "managementSettings");
  uint64_t v2 = (void *)qword_1000253A8;
  qword_1000253A8 = (uint64_t)v1;
}

void sub_100009320(id a1)
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[RMLocations dataVaultDirectoryURLCreateIfNeeded:]( &OBJC_CLASS___RMLocations,  "dataVaultDirectoryURLCreateIfNeeded:",  1LL));
  id v4 = (id)objc_claimAutoreleasedReturnValue([v1 URLByAppendingPathComponent:@"ManagementSettings.plist"]);

  uint64_t v2 = -[RMManagementSettings initWithURL:](objc_alloc(&OBJC_CLASS___RMManagementSettings), "initWithURL:", v4);
  id v3 = (void *)qword_1000253B8;
  qword_1000253B8 = (uint64_t)v2;
}

void sub_100009534(_Unwind_Exception *a1)
{
}

void sub_1000095CC(_Unwind_Exception *a1)
{
}

void sub_100009674(_Unwind_Exception *a1)
{
}
}

void sub_100009A70( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100009A80( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_10000AC30(id a1)
{
  os_log_t v1 = os_log_create("com.apple.remotemanagementd", "mdmconduitstate");
  uint64_t v2 = (void *)qword_1000253C8;
  qword_1000253C8 = (uint64_t)v1;
}

void sub_10000ADD4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.remotemanagementd", "predicateDescription");
  uint64_t v2 = (void *)qword_1000253D8;
  qword_1000253D8 = (uint64_t)v1;
}

LABEL_13:
          uint64_t v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        __int128 v18 = [v6 countByEnumeratingWithState:&v42 objects:v47 count:16];
        id v7 = v18;
        if (!v18)
        {
LABEL_18:

          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v39,  "stringByReplacingMatchesInString:options:range:withTemplate:",  v4,  0,  0,  v34,  @"%K"));
          id v20 = (NSPredicate *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:argumentArray:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:argumentArray:",  v19,  v5));
          predicate = self->_predicate;
          self->_predicate = v20;

          uint64_t v22 = (NSArray *)[v41 copy];
          statusKeyPaths = self->_statusKeyPaths;
          self->_statusKeyPaths = v22;

          uint64_t v24 = (NSArray *)[v40 copy];
          properties = self->_properties;
          self->_properties = v24;

          version = self->_version;
          self->_version = (NSNumber *)&off_10001E880;

          __int128 v27 = v38;
          goto LABEL_27;
        }
      }
    }

    -[RMPredicateDescription _buildPredicateWithVisitorFromFormatString:]( self,  "_buildPredicateWithVisitorFromFormatString:",  v4);
    __int128 v27 = v38;
LABEL_27:

    v32 = 1;
  }

  else
  {
    __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog predicateDescription](&OBJC_CLASS___RMLog, "predicateDescription"));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_1000125EC((uint64_t)v36, v28, v29);
    }

    if (a4)
    {
      char v30 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createUnableToParsePredicateErrorWithFormat:reason:]( &OBJC_CLASS___RMErrorUtilities,  "createUnableToParsePredicateErrorWithFormat:reason:",  v4,  @"Unable to create predicate regular expression"));
      id v31 = v30;
      if (v30) {
        *a4 = v30;
      }
    }

    v32 = 0;
  }

  return v32;
}

void sub_10000B2E8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
  if (a2 != 1) {
    _Unwind_Resume(exception_object);
  }
  id v30 = objc_begin_catch(exception_object);
  id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 name]);
  unsigned int v32 = [v31 isEqualToString:RMErrorDomain];

  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue([v30 userInfo]);
    v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:@"error"]);
    v35 = v34;
    if (v34) {
      id v36 = v34;
    }
    else {
      id v36 = (id)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createUnableToParsePredicateErrorWithFormat:reason:]( &OBJC_CLASS___RMErrorUtilities,  "createUnableToParsePredicateErrorWithFormat:reason:",  v29,  @"Unknown"));
    }
    id v40 = v36;

    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog predicateDescription](&OBJC_CLASS___RMLog, "predicateDescription"));
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_100012658(v29, (uint64_t)v40, v41);
    }

    if (!a12) {
      goto LABEL_15;
    }
  }

  else
  {
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog predicateDescription](&OBJC_CLASS___RMLog, "predicateDescription"));
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue([v30 reason]);
      sub_1000126D4(v29, v38, (uint64_t)&a29, v37);
    }

    if (!a12)
    {
LABEL_16:

      objc_end_catch();
      JUMPOUT(0x10000B274LL);
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue([v30 reason]);
    id v40 = (id)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createUnableToParsePredicateErrorWithFormat:reason:]( &OBJC_CLASS___RMErrorUtilities,  "createUnableToParsePredicateErrorWithFormat:reason:",  v29,  v39));
  }

  if (v40)
  {
    id v40 = v40;
    *a12 = v40;
  }

void sub_10000BB5C( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf)
{
  uint64_t v22 = v12;
  if (a2 == 1)
  {
    id v13 = objc_begin_catch(a1);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog predicateDescription](&OBJC_CLASS___RMLog, "predicateDescription"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v22 predicate]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 predicateFormat]);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v13 reason]);
      LODWORD(buf) = 138543618;
      *(void *)((char *)&buf + 4) = v20;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v21;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Unable to evaluate “%{public}@”: %{public}@",  (uint8_t *)&buf,  0x16u);
    }

    if (v11)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v22 predicate]);
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 predicateFormat]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v13 reason]);
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createUnableToEvaluatePredicateErrorWithFormat:reason:]( &OBJC_CLASS___RMErrorUtilities,  "createUnableToEvaluatePredicateErrorWithFormat:reason:",  v16,  v17));

      if (v18) {
        *uint64_t v11 = v18;
      }
    }

    objc_end_catch();
    JUMPOUT(0x10000BB1CLL);
  }

  _Unwind_Resume(a1);
}

void sub_10000C1DC(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10000C1E8(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10000C2C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10000C2DC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000C2EC(uint64_t a1)
{
}

void sub_10000C2F4(uint64_t a1)
{
  v9[0] = @"Management Sources";
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[RMReport managementSources](&OBJC_CLASS___RMReport, "managementSources"));
  v9[1] = @"Orphaned Entities";
  v10[0] = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[RMReport orphanedEntities](&OBJC_CLASS___RMReport, "orphanedEntities"));
  v10[1] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));
  id v5 = [v4 mutableCopy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(_BYTE *)(a1 + 48))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[RMReport internalStateArchiveWithContext:]( &OBJC_CLASS___RMReport,  "internalStateArchiveWithContext:",  *(void *)(a1 + 32)));
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v8 forKeyedSubscript:@"Internal Device Status"];
  }

void sub_10000D960(id a1)
{
  os_log_t v1 = os_log_create("com.apple.remotemanagementd", "storeHelper");
  uint64_t v2 = (void *)qword_1000253E8;
  qword_1000253E8 = (uint64_t)v1;
}

id sub_10000E90C(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", a2));
  for (i = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithCapacity:]( &OBJC_CLASS___NSMutableString,  "stringWithCapacity:",  a2 + 1)); a2; --a2)
    [v4 appendString:@"\t"];
  [i appendFormat:@"\n%@", v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByReplacingOccurrencesOfString:@"\n" withString:i]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v4, v6));

  return v7;
}

void sub_10000E9FC()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[CLIProgram sharedProgram](&OBJC_CLASS___CLIProgram, "sharedProgram"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v0 programName]);

  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 infoDictionary]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:_kCFBundleShortVersionStringKey]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:kCFBundleVersionKey]);
  if ([v3 length]) {
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue([@" " stringByAppendingString:v3]);
  }
  else {
    id v5 = &stru_10001DAB8;
  }

  if ([v4 length]) {
    sub_100011A20(__stdoutp, @"%@%@ (%@)\n", v6, v7, v8, v9, v10, v11, (uint64_t)v12);
  }
  else {
    sub_100011A20(__stdoutp, @"%@%@\n", v6, v7, v8, v9, v10, v11, (uint64_t)v12);
  }
}

void sub_10000EB34(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000253F8 objectForKeyedSubscript:v1]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue([(id)qword_100025400 objectForKey:v2]);
  uint64_t v10 = (void *)v3;
  if (v1 && !v2)
  {
    v68 = (void *)v3;

    sub_100011A20(__stdoutp, @"\n", v11, v12, v13, v14, v15, v16, v64);
    id v69 = 0LL;
LABEL_8:
    sub_10000EE98((void *)qword_100025408);
    sub_100011A20(__stdoutp, @"Commands:\n", v22, v23, v24, v25, v26, v27, v65);
    __int128 v28 = (void *)qword_100025410;
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"name",  1LL));
    v75 = v29;
    id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v75, 1LL));
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v28 sortedArrayUsingDescriptors:v30]);

    __int128 v72 = 0u;
    __int128 v73 = 0u;
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    id v32 = v31;
    id v33 = [v32 countByEnumeratingWithState:&v70 objects:v74 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v71;
      do
      {
        for (i = 0LL; i != v34; i = (char *)i + 1)
        {
          if (*(void *)v71 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = *(void **)(*((void *)&v70 + 1) + 8LL * (void)i);
          v38 = __stdoutp;
          v39 = (void *)objc_claimAutoreleasedReturnValue([v37 nameSummaryString]);
          v66 = (void *)objc_claimAutoreleasedReturnValue([v37 shortEnglishDescription]);
          sub_100011A20(v38, @"\t%@\n\t%@\n\n", v40, v41, v42, v43, v44, v45, (uint64_t)v39);
        }

        id v34 = [v32 countByEnumeratingWithState:&v70 objects:v74 count:16];
      }

      while (v34);
    }

    uint64_t v10 = v68;
    id v1 = v69;
    goto LABEL_21;
  }

  sub_100011A20(__stdoutp, @"\n", v4, v5, v6, v7, v8, v9, v64);
  if (!v2)
  {
    v68 = v10;
    id v69 = v1;
    goto LABEL_8;
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v2 nameSummaryString]);
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v2 usageLine]);

  if (v18)
  {
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v2 name]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v2 usageLine]);
    uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Usage: %@ %@\n\t",  v19,  v20));
  }

  else
  {
    uint64_t v21 = &stru_10001DAB8;
  }

  v46 = __stdoutp;
  v67 = (void *)objc_claimAutoreleasedReturnValue([v2 shortEnglishDescription]);
  sub_100011A20(v46, @"%@\n\t%@%@\n\n", v47, v48, v49, v50, v51, v52, (uint64_t)v17);

  v53 = (void *)objc_claimAutoreleasedReturnValue([v2 longEnglishDescription]);
  v54 = v53;
  if (v53)
  {
    v55 = __stdoutp;
    id v56 = sub_10000E90C(v53, 1LL);
    v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
    sub_100011A20(v55, @"%@\n\n", v58, v59, v60, v61, v62, v63, (uint64_t)v57);
  }

  sub_10000EE98((void *)qword_100025408);
  if (v10) {
    sub_10000EE98(v10);
  }
LABEL_21:
}

void sub_10000EE98(void *a1)
{
  id v1 = a1;
  if ([v1[1] count])
  {
    if ((id *)qword_100025408 == v1) {
      uint64_t v8 = @"Global options:\n";
    }
    else {
      uint64_t v8 = @"Command options:\n";
    }
    sub_100011A20(__stdoutp, v8, v2, v3, v4, v5, v6, v7, v38);
    uint64_t v40 = v1;
    id v9 = v1[1];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"canonicalName",  1LL));
    v46 = v10;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v46, 1LL));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 sortedArrayUsingDescriptors:v11]);

    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v42;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v42 != v16) {
            objc_enumerationMutation(v13);
          }
          __int128 v18 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
          __int128 v19 = __stdoutp;
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 nameSummaryString]);
          v39 = (void *)objc_claimAutoreleasedReturnValue([v18 shortEnglishDescription]);
          sub_100011A20(v19, @"\t%@\n\t%@\n\n", v21, v22, v23, v24, v25, v26, (uint64_t)v20);

          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v18 longEnglishDescription]);
          __int128 v28 = v27;
          if (v27)
          {
            uint64_t v29 = __stdoutp;
            id v30 = sub_10000E90C(v27, 1LL);
            id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
            sub_100011A20(v29, @"%@\n\n", v32, v33, v34, v35, v36, v37, (uint64_t)v31);
          }
        }

        id v15 = [v13 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }

      while (v15);
    }

    id v1 = v40;
  }
}

id *sub_10000FF64(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)&OBJC_CLASS___CLIOptionParser;
    uint64_t v7 = (id *)objc_msgSendSuper2(&v17, "init");
    a1 = v7;
    if (v7)
    {
      [v7 setArguments:v5];
      uint64_t v8 = objc_claimAutoreleasedReturnValue([a1 nextArgument]);
      id v9 = a1[4];
      a1[4] = (id)v8;

      if (v6)
      {
        objc_storeStrong(a1 + 5, a3);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100025400 objectForKey:v6]);
        id v11 = v10;
        if (v10) {
          uint64_t v12 = v10;
        }
        else {
          uint64_t v12 = objc_opt_new(&OBJC_CLASS___CLIOptionSet);
        }
        id v14 = a1[2];
        a1[2] = v12;
      }

      else
      {
        if (qword_100025418 != -1) {
          dispatch_once(&qword_100025418, &stru_10001C850);
        }
        id v13 = (id)qword_100025408;
        id v11 = a1[2];
        a1[2] = v13;
      }

      if (!a1[2])
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
        [v16 handleFailureInMethod:"initWithArguments:command:" object:a1 file:@"CLIOptionParsing.m" lineNumber:422 description:@"The commands or global options haven't been registered yet!"];
      }
    }
  }

  return a1;
}

void sub_1000100E0(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    sub_100011B4C(@"Unknown option '%@'", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 command]);
    sub_100011CF0(v11);
  }
}

void sub_10001012C(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    sub_100011B4C(@"Option '%@' missing an argument", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 command]);
    sub_100011CF0(v11);
  }
}

void sub_1000103D8(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 16) + 16), "objectForKeyedSubscript:"));
  id v4 = [v3 parameterCount];
  if (v3)
  {
    if (v4)
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) nextArgument]);
      if (v5)
      {
LABEL_6:
        uint64_t v6 = *(void *)(a1 + 48);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 shortName]);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 longName]);
        (*(void (**)(uint64_t, void *, void *, void *))(v6 + 16))(v6, v7, v8, v5);

        return;
      }

      sub_10001012C(*(void **)(a1 + 32), *(void **)(a1 + 40));
    }

    uint64_t v5 = 0LL;
    goto LABEL_6;
  }

  sub_1000100E0(*(void **)(a1 + 32), v11);
  -[CLIOptionParser dictionaryWithOptionsAndValues](v9, v10);
}

uint64_t sub_100010548(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8) {
    SEL v10 = v8;
  }
  else {
    SEL v10 = v7;
  }
  id v11 = v10;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v11]);
  if (![*(id *)(a1 + 40) preserveMultipleArguments])
  {
    if (v9)
    {
      [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v11];
      goto LABEL_13;
    }

    goto LABEL_10;
  }

  if (!v9)
  {
LABEL_10:
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  (char *)[v12 unsignedIntegerValue] + 1));
LABEL_12:
    id v14 = (void *)v13;
    [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:v11];

    goto LABEL_13;
  }

  if (!v12)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v9));
    goto LABEL_12;
  }

  [v12 addObject:v9];
LABEL_13:

  return 1LL;
}

BOOL sub_100010744(id a1, NSString *a2, NSString *a3, NSString *a4)
{
  return 1;
}

void sub_1000107D8(id a1)
{
  id v1 = objc_opt_new(&OBJC_CLASS___CLIOptionSet);
  uint64_t v2 = (void *)qword_100025408;
  qword_100025408 = (uint64_t)v1;

  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  id v4 = (void *)qword_100025410;
  qword_100025410 = (uint64_t)v3;

  uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v6 = (void *)qword_1000253F8;
  qword_1000253F8 = (uint64_t)v5;

  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
  id v8 = (void *)qword_100025400;
  qword_100025400 = v7;
}

void sub_100010900(id a1)
{
  id v1 = objc_opt_new(&OBJC_CLASS___CLIProgram);
  uint64_t v2 = (void *)qword_100025428;
  qword_100025428 = (uint64_t)v1;
}

void sub_100010A10(uint64_t a1, void *a2)
{
  id v15 = a2;
  objc_opt_self(a1);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v15, v3) & 1) != 0)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue([v15 lastObject]);
  }

  else
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v15, v11) & 1) == 0) {
      goto LABEL_12;
    }
    id v4 = v15;
  }

  uint64_t v12 = v4;
  if (!v4) {
LABEL_12:
  }
    sub_100011CB4(64, @"Unrecognized format, valid formats are: text, JSON, plist", v5, v6, v7, v8, v9, v10, v14);
  uint64_t v13 = (uint64_t)[v4 caseInsensitiveCompare:@"text"];
  if (v13)
  {
    if (![v12 caseInsensitiveCompare:@"plist"])
    {
      uint64_t v13 = 1LL;
      goto LABEL_11;
    }

    if (![v12 caseInsensitiveCompare:@"json"])
    {
      uint64_t v13 = 2LL;
      goto LABEL_11;
    }

    goto LABEL_12;
  }

LABEL_11:
  sub_100011AC0(v13);
}

void sub_100010D1C(uint64_t a1)
{
  if (a1)
  {
    id v1 = objc_opt_new(&OBJC_CLASS___CLICommand);
    -[CLICommand setName:](v1, "setName:", @"help");
    -[CLICommand setAliases:](v1, "setAliases:", &off_10001E938);
    -[CLICommand setShortEnglishDescription:]( v1,  "setShortEnglishDescription:",  @"Show help for a command or show all commands.");
    -[CLICommand setExecutionBlock:](v1, "setExecutionBlock:", &stru_10001C8B0);
    -[CLICommand register](v1, "register");
    uint64_t v2 = objc_opt_new(&OBJC_CLASS___CLICommand);

    -[CLICommand setName:](v2, "setName:", @"version");
    -[CLICommand setShortEnglishDescription:](v2, "setShortEnglishDescription:", @"Show this program's version.");
    -[CLICommand setExecutionBlock:](v2, "setExecutionBlock:", &stru_10001C8D0);
    -[CLICommand register](v2, "register");
  }

BOOL sub_100010DE4(id a1, CLIOptionParser *a2)
{
  uint64_t v2 = a2;
  sub_10000E9FC();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CLIOptionParser nextArgument](v2, "nextArgument"));

  sub_10000EB34(v3);
  return 1;
}

BOOL sub_100010E2C(id a1, CLIOptionParser *a2)
{
  return 1;
}

void sub_10001139C(_Unwind_Exception *a1)
{
}

void sub_100011460(_Unwind_Exception *a1)
{
}

unint64_t sub_10001179C(unint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1 && !*(void *)(a1 + 8)) {
    a1 = sub_1000117FC(v5, v6);
  }

  return a1;
}

unint64_t sub_1000117FC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 isEqual:v4])
  {
    unint64_t v5 = 0LL;
  }

  else
  {
    id v6 = [v3 length];
    else {
      unint64_t v7 = (unint64_t)v6;
    }
    id v8 = [v4 length];
    else {
      unint64_t v9 = (unint64_t)v8;
    }
    if (v7 && v9)
    {
      id v30 = &v28;
      __chkstk_darwin();
      uint64_t v11 = (char *)&v28 - v10;
      bzero((char *)&v28 - v10, v12);
      uint64_t v13 = 0LL;
      uint64_t v14 = v9;
      id v15 = v11;
      do
      {
        *id v15 = v13++;
        v15 += v9 + 1;
      }

      while (v7 + 1 != v13);
      uint64_t v16 = 0LL;
      do
      {
        *(void *)&v11[8 * v16] = v16;
        ++v16;
      }

      while (v9 + 1 != v16);
      __int128 v28 = v11;
      unint64_t v29 = v9 + 1;
      objc_super v17 = v11 + 8;
      uint64_t v18 = 1LL;
      unint64_t v31 = v9;
      do
      {
        uint64_t v19 = 0LL;
        uint64_t v32 = v18;
        uint64_t v20 = v18 - 1;
        uint64_t v21 = v17;
        do
        {
          unsigned int v22 = objc_msgSend(v3, "characterAtIndex:", v19, v28, v29);
          unsigned int v23 = [v4 characterAtIndex:v20];
          uint64_t v24 = *v21 + 1LL;
          uint64_t v25 = v21[v14];
          if (v24 >= v25 + 1) {
            uint64_t v24 = v25 + 1;
          }
          uint64_t v26 = *(v21 - 1);
          if (v22 != v23) {
            ++v26;
          }
          if (v24 >= v26) {
            uint64_t v24 = v26;
          }
          v21[v14 + 1] = v24;
          ++v19;
          uint64_t v21 = (void *)((char *)v21 + v14 * 8 + 8);
        }

        while (v7 != v19);
        uint64_t v18 = v32 + 1;
        v17 += 8;
      }

      while (v32 != v31);
      unint64_t v5 = *(void *)&v28[8 * v29 * v7 + 8 * v31];
    }

    else if (v7 <= v9)
    {
      unint64_t v5 = v9;
    }

    else
    {
      unint64_t v5 = v7;
    }
  }

  return v5;
}

size_t sub_100011A20( FILE *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  uint64_t v11 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v10, &a9);

  size_t v12 = v11;
  size_t v13 = fwrite( -[NSString UTF8String](v12, "UTF8String"),  1uLL,  -[NSString lengthOfBytesUsingEncoding:](v12, "lengthOfBytesUsingEncoding:", 4LL),  a1);

  return v13;
}

void sub_100011AC0(uint64_t a1)
{
  if (qword_100025438 != -1) {
    dispatch_once(&qword_100025438, &stru_10001C8F8);
  }
  qword_100025430 = a1;
}

uint64_t sub_100011B0C()
{
  if (qword_100025438 != -1) {
    dispatch_once(&qword_100025438, &stru_10001C8F8);
  }
  return qword_100025430;
}

void sub_100011B4C( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100011B80(const char *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v5, a3);

  if (-[NSString length](v6, "length")) {
    BOOL v7 = -[NSString characterAtIndex:](v6, "characterAtIndex:", (char *)-[NSString length](v6, "length") - 1) != 10;
  }
  else {
    BOOL v7 = 1;
  }
  id v8 = __stderrp;
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[CLIProgram sharedProgram](&OBJC_CLASS___CLIProgram, "sharedProgram"));
  id v10 = objc_claimAutoreleasedReturnValue([v9 programName]);
  fprintf(v8, "%s: %s: ", (const char *)[v10 UTF8String], a1);

  size_t v13 = v6;
  uint64_t v11 = -[NSString UTF8String](v13, "UTF8String");
  NSUInteger v12 = -[NSString lengthOfBytesUsingEncoding:](v13, "lengthOfBytesUsingEncoding:", 4LL);
  fwrite(v11, 1uLL, v12, __stderrp);
  if (v7) {
    fputc(10, __stderrp);
  }
}

void sub_100011CB4( int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100011CF0(void *a1)
{
  id v1 = a1;
  if (!objc_claimAutoreleasedReturnValue([v1 usageLine])) {
    exit(64);
  }
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v1 name]);
  sub_100011CB4(64, @"Usage: %@ %@\n", v3, v4, v5, v6, v7, v8, v2);
}

void sub_100011D40(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"Type"]);

  if (!v2)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void CLIPrintDictionary(NSDictionary * _Nonnull __strong)"));
    [v19 handleFailureInFunction:v20 file:@"CLITerminal.m" lineNumber:151 description:@"Output dictionaries must have a type"];
  }

  switch(qword_100025430)
  {
    case 2LL:
      id v21 = 0LL;
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v1,  0LL,  &v21));
      id v15 = v21;
      uint64_t v11 = v15;
      if (!v9)
      {
        NSLog(@"Couldn't make JSON for:\n%@\n%@", v1, v15);
        goto LABEL_14;
      }

      id v16 = v9;
      id v17 = [v16 bytes];
      id v18 = [v16 length];
      fwrite(v17, (size_t)v18, 1uLL, __stdoutp);
      goto LABEL_11;
    case 1LL:
      id v22 = 0LL;
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v1,  100LL,  0LL,  &v22));
      id v10 = v22;
      uint64_t v11 = v10;
      if (!v9)
      {
        NSLog(@"Couldn't make plist for:\n%@\n%@", v1, v10);
        goto LABEL_14;
      }

      id v12 = v9;
      id v13 = [v12 bytes];
      id v14 = [v12 length];
      fwrite(v13, (size_t)v14, 1uLL, __stdoutp);
LABEL_11:
      fputc(10, __stdoutp);
LABEL_14:

      break;
    case 0LL:
      sub_100011A20(__stdoutp, @"%@\n", v3, v4, v5, v6, v7, v8, (uint64_t)v1);
      break;
  }
}

void sub_100011FD0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v3)
  {
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void CLIPrintNSError(NSError * _Nonnull __strong, NSDictionary * _Nullable __strong)"));
    [v28 handleFailureInFunction:v29, @"CLITerminal.m", 202, @"Invalid parameter not satisfying: %@", @"error != nil" file lineNumber description];
  }

  if (qword_100025430)
  {
    v32[0] = @"Error";
    v31[0] = @"Type";
    v31[1] = @"Message";
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 localizedDescription]);
    uint64_t v6 = (void *)v5;
    if (v5) {
      uint64_t v7 = (const __CFString *)v5;
    }
    else {
      uint64_t v7 = &stru_10001DAB8;
    }
    v32[1] = v7;
    v31[2] = @"Detail";
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 localizedRecoverySuggestion]);
    unint64_t v9 = (void *)v8;
    if (v8) {
      id v10 = (const __CFString *)v8;
    }
    else {
      id v10 = &stru_10001DAB8;
    }
    v32[2] = v10;
    v31[3] = @"FailureReason";
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v3 localizedFailureReason]);
    id v12 = (void *)v11;
    if (v11) {
      id v13 = (const __CFString *)v11;
    }
    else {
      id v13 = &stru_10001DAB8;
    }
    v32[3] = v13;
    void v31[4] = @"Domain";
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v3 domain]);
    id v15 = (void *)v14;
    if (v14) {
      id v16 = (const __CFString *)v14;
    }
    else {
      id v16 = &stru_10001DAB8;
    }
    v32[4] = v16;
    v31[5] = @"Code";
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v3 code]));
    v32[5] = v17;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  6LL));
    id v19 = [v18 mutableCopy];

    if (v4) {
      [v19 addEntriesFromDictionary:v4];
    }
    sub_100011D40(v19);
  }

  else
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedDescription]);
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    [v3 code];
    sub_100011B4C(@"%@\n(Domain: %@ Code: %d)\n\n", v21, v22, v23, v24, v25, v26, v27, (uint64_t)v20);
  }
}

void sub_100012264(id a1)
{
  qword_100025430 = 0LL;
  byte_100025370 = isatty(1) != 0;
}

void sub_100012294(uint64_t a1)
{
  id v1 = (objc_class *)objc_opt_class(a1);
  uint64_t v2 = NSStringFromClass(v1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100003F94();
  sub_100003F84( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v4,  "Could not deserialize data for %{public}@: %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100003FAC();
}

void sub_100012318(uint64_t a1)
{
  id v1 = (objc_class *)objc_opt_class(a1);
  uint64_t v2 = NSStringFromClass(v1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100003F94();
  sub_100003F84( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v4,  "Could not serialize data for %{public}@: %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100003FAC();
}

void sub_10001239C()
{
}

void sub_1000123FC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Management settings cache does not currently exist",  v1,  2u);
}

void sub_10001243C(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 cachedSettings]);
  sub_100009A94();
  sub_100009A80((void *)&_mh_execute_header, v2, v3, "Cached management settings: %{public}@", v4, v5, v6, v7, v8);

  sub_100003FAC();
}

void sub_1000124B4()
{
}

void sub_100012514()
{
}

void sub_100012574(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 cachedSettings]);
  sub_100009A94();
  sub_100009A80((void *)&_mh_execute_header, v2, v3, "Wrote management settings: %{public}@", v4, v5, v6, v7, v8);

  sub_100003FAC();
}

void sub_1000125EC(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138543362;
  uint64_t v4 = a1;
  sub_10000C1DC( (void *)&_mh_execute_header,  a2,  a3,  "Unable to create predicate regular expression: %{public}@",  (uint8_t *)&v3);
}

void sub_100012658(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  sub_10000C1E8( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Unable to parse “%{public}@”: %{public}@",  (uint8_t *)&v3);
}

void sub_1000126D4(uint64_t a1, void *a2, uint64_t a3, os_log_s *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  sub_10000C1E8((void *)&_mh_execute_header, a4, a3, "Unable to parse “%{public}@”: %{public}@", (uint8_t *)a3);
}

void sub_100012730(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 version]);
  int v5 = 138543362;
  uint64_t v6 = v3;
  sub_10000C1DC( (void *)&_mh_execute_header,  a2,  v4,  "Invalid predicate description version: %{public}@",  (uint8_t *)&v5);
}

void sub_1000127BC(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Unable to fetch management source objects with enrollment types: %{public}@",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend_initWithType_identifier_accountIdentifier_accountDescription_organizationDescription_enrollmentURL_enrollmentToken_isEnrolled_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithType:identifier:accountIdentifier:accountDescription:organizationDescription:enrollmentURL:enrollment Token:isEnrolled:");
}

id objc_msgSend_queryForStatusAndErrorsWithKeyPaths_fromManagementSourceWithIdentifier_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryForStatusAndErrorsWithKeyPaths:fromManagementSourceWithIdentifier:completionHandler:");
}

id objc_msgSend_writePropertyList_toStream_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writePropertyList:toStream:format:options:error:");
}