id sub_100004C74(uint64_t a1)
{
  return [*(id *)(a1 + 32) recordClassName];
}

id sub_100004C7C(uint64_t a1)
{
  return [*(id *)(a1 + 32) changedValue];
}

void sub_100004F08(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordDictionary]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:*(void *)(a1 + 40)]);

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordDictionary]);
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    [v4 setValue:v5 forKey:*(void *)(a1 + 40)];
  }

  if ([*(id *)(a1 + 48) isEqual:&stru_100014E20])
  {
    uint64_t v6 = PTLogObjectForTopic(2LL);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "keyPath is an empty string.", buf, 2u);
    }
  }

  else
  {
    id v19 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) componentsSeparatedByString:@"."]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordDictionary]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:*(void *)(a1 + 40)]);

    if ([v19 count] == (id)1)
    {
      v10 = v9;
    }

    else
    {
      v11 = 0LL;
      do
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:v11]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v12]);

        if (!v13)
        {
          v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:v11]);
          [v9 setValue:v14 forKey:v15];
        }

        v16 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:v11]);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v16]);

        ++v11;
        v9 = v10;
      }

      while ((char *)[v19 count] - 1 > v11);
    }

    v17 = -[PTParameterRecordLeaf initWithRecordClassName:value:]( objc_alloc(&OBJC_CLASS___PTParameterRecordLeaf),  "initWithRecordClassName:value:",  *(void *)(a1 + 56),  *(void *)(a1 + 64));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v19 lastObject]);
    [v10 setValue:v17 forKey:v18];
  }
}

void sub_10000522C(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordDictionary]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:*(void *)(a1 + 40)]);

  if (v3)
  {
    id v21 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) componentsSeparatedByString:@"."]);
    v4 = objc_alloc_init(&OBJC_CLASS___NSArray);
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordDictionary]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:*(void *)(a1 + 40)]);

    -[NSMutableArray addObject:](v5, "addObject:", *(void *)(a1 + 40));
    if ([v21 count])
    {
      unint64_t v8 = 0LL;
      v9 = v21;
      while (1)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v8]);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v10]);

        if (!v11) {
          break;
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
        id v13 = [v12 count];

        if ((unint64_t)v13 >= 2)
        {
          v14 = (NSArray *)-[NSMutableArray copy](v5, "copy");

          v4 = v14;
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndexedSubscript:v8]);
        -[NSMutableArray addObject:](v5, "addObject:", v15);

        ++v8;
        v7 = v11;
        BOOL v16 = (unint64_t)[v21 count] > v8;
        v9 = v21;
        if (!v16) {
          goto LABEL_11;
        }
      }
    }

    else
    {
      v11 = v7;
LABEL_11:
      v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordDictionary]);

      if (-[NSArray count](v4, "count"))
      {
        unint64_t v18 = 0LL;
        do
        {
          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", v18));
          v7 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v19]);

          ++v18;
          v17 = v7;
        }

        while (-[NSArray count](v4, "count") > v18);
      }

      else
      {
        v7 = v17;
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v5, "objectAtIndex:", -[NSArray count](v4, "count")));
      [v7 removeObjectForKey:v20];
    }
  }

void sub_1000054AC(void *a1)
{
  id v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  NSFileAttributeKey v4 = NSFileProtectionKey;
  NSFileProtectionType v5 = NSFileProtectionNone;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));
  [v2 setAttributes:v3 ofItemAtPath:v1 error:0];
}

id sub_100005580()
{
  v0 = NSHomeDirectoryForUser(@"mobile");
  id v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }

  else
  {
    NSFileAttributeKey v4 = NSHomeDirectory();
    id v3 = (id)objc_claimAutoreleasedReturnValue(v4);
  }

  NSFileProtectionType v5 = v3;

  return v5;
}

id sub_1000055CC()
{
  if (qword_10001BEA0 != -1) {
    dispatch_once(&qword_10001BEA0, &stru_100014740);
  }
  return (id)qword_10001BE98;
}

void sub_10000560C(id a1)
{
  id v1 = sub_100005580();
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"Library/Prototyping"]);
  NSFileAttributeKey v4 = (void *)qword_10001BE98;
  qword_10001BE98 = v3;

  NSFileProtectionType v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v6 = qword_10001BE98;
  NSFileAttributeKey v8 = NSFileOwnerAccountName;
  v9 = @"mobile";
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  [v5 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:v7 error:0];

  sub_1000054AC((void *)qword_10001BE98);
}

id sub_100005708()
{
  id v0 = sub_1000055CC();
  id v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue([v1 stringByAppendingPathComponent:@"ParameterRecords.archive"]);

  return v2;
}

void sub_100005A80(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordDictionary]);
  id v15 = 0LL;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v2,  1LL,  &v15));
  id v4 = v15;

  if (!v3
    || (NSFileProtectionType v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) path]),
        id v14 = v4,
        unsigned __int8 v6 = [v3 writeToFile:v5 options:1 error:&v14],
        id v7 = v14,
        v4,
        v5,
        id v4 = v7,
        (v6 & 1) == 0))
  {
    uint64_t v8 = PTLogObjectForTopic(2LL);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) path]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
      *(_DWORD *)buf = 138412546;
      v17 = v10;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Unable to write test recipe dictionary to file %@: %@",  buf,  0x16u);
    }
  }

  uint64_t v12 = *(void *)(a1 + 40);
  id v13 = *(void **)(v12 + 8);
  *(void *)(v12 + 8) = 0LL;
}

void sub_100005C90(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[1];
  if (v3)
  {
    [v3 invalidate];
    v2 = *(void **)(a1 + 32);
  }

  objc_initWeak(&location, v2);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100005D88;
  v7[3] = &unk_100014790;
  objc_copyWeak(&v9, &location);
  id v8 = *(id *)(a1 + 40);
  uint64_t v4 = objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  v7,  0.25));
  uint64_t v5 = *(void *)(a1 + 32);
  unsigned __int8 v6 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v4;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void sub_100005D6C(_Unwind_Exception *a1)
{
}

void sub_100005D88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _writeToDiskWithParameterRecords:*(void *)(a1 + 32)];
}

void sub_100006234( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id a17)
{
}

PTUIModifiedChangesViewController *sub_100006268(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = (PTParameterRecords *)objc_claimAutoreleasedReturnValue([WeakRetained parameterRecordsOfTunedSettings]);
  }

  else
  {
    uint64_t v4 = objc_alloc(&OBJC_CLASS___PTParameterRecords);
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v3 = -[PTParameterRecords initWithDictionary:](v4, "initWithDictionary:", v5);
  }

  unsigned __int8 v6 = -[PTUIModifiedChangesViewController initWithParameterRecords:withTitle:]( objc_alloc(&OBJC_CLASS___PTUIModifiedChangesViewController),  "initWithParameterRecords:withTitle:",  v3,  @"Show Modified Settings");

  return v6;
}

void sub_100006484(uint64_t a1, uint64_t a2)
{
  if (PTPrototypingEventAvailable(a2))
  {
    uint64_t v4 = PTPrototypingEventName(a2);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100006650;
    v23[3] = &unk_1000147E0;
    id v24 = *(id *)(a1 + 32);
    uint64_t v25 = a2;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100006678;
    v20[3] = &unk_100014808;
    id v21 = *(id *)(a1 + 32);
    uint64_t v22 = a2;
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[PTSwitchRow rowWithTitle:valueGetter:valueSetter:]( &OBJC_CLASS___PTSwitchRow,  "rowWithTitle:valueGetter:valueSetter:",  v5,  v23,  v20));

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000066A4;
    v17[3] = &unk_100014830;
    id v18 = *(id *)(a1 + 32);
    uint64_t v19 = a2;
    [v6 setExternalCondition:v17];
    id v7 = *(void **)(a1 + 32);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000066B0;
    v15[3] = &unk_100014858;
    id v16 = v6;
    id v8 = v6;
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472LL;
    uint64_t v12 = sub_1000066B8;
    id v13 = &unk_100014880;
    id v14 = (id)objc_claimAutoreleasedReturnValue([v7 observeShowUISwitchDefaultsOnQueue:&_dispatch_main_q withBlock:v15]);
    id v9 = v14;
    [v8 setUnregisterBlock:&v10];
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8, v10, v11, v12, v13);
  }

id sub_100006650(uint64_t a1)
{
  return +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 32) displayedShowsUIValueForEvent:*(void *)(a1 + 40)]);
}

id sub_100006678(uint64_t a1, void *a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "setShowsUI:forEvent:", objc_msgSend(a2, "BOOLValue"), *(void *)(a1 + 40));
}

id sub_1000066A4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) canEditShowsUIForEvent:*(void *)(a1 + 40)];
}

id sub_1000066B0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) reloadRow];
}

id sub_1000066B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

id sub_1000066C0(uint64_t a1)
{
  return +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 32) multiWindowEnabled]);
}

void sub_1000066F0(uint64_t a1, void *a2)
{
  id v3 = [a2 BOOLValue];
  unsigned int v4 = [*(id *)(a1 + 32) multiWindowEnabled];
  [*(id *)(a1 + 32) setMultiWindowEnabled:v3];
  if ((_DWORD)v3 != v4)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication", 0LL));
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 connectedScenes]);

    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        v10 = 0LL;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v10);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 session]);
          [v12 requestSceneSessionDestruction:v13 options:0 errorHandler:0];

          v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v8);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[UISceneSessionActivationRequest request](&OBJC_CLASS___UISceneSessionActivationRequest, "request"));
    [v14 activateSceneSessionForRequest:v15 errorHandler:0];
  }

id sub_100006990(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _sendKillSpringBoard];
}

uint64_t sub_100006B30(uint64_t a1)
{
  return 1LL;
}

id SceneDelegate.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id sub_100006D3C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t sub_100006E28()
{
  uint64_t v0 = type metadata accessor for MainActor(0LL);
  uint64_t v1 = static MainActor.shared.getter(v0);
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter(v0, &protocol witness table for MainActor);
  uint64_t v4 = v3;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("", 0LL, 1LL, 0LL, v2, v4);
  }
  sub_100006F64();
  return swift_release(v1);
}

id SceneDelegate.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for MainActor(0LL);
  uint64_t v4 = static MainActor.shared.getter(v3);
  uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  uint64_t v7 = v6;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("", 0LL, 1LL, 0LL, v5, v7);
  }
  sub_100006F64();
  swift_release(v4);
  return 0;
}

void sub_100006F64()
{
  uint64_t v0 = type metadata accessor for MainActor(0LL);
  uint64_t v1 = static MainActor.shared.getter(v0);
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter(v0, &protocol witness table for MainActor);
  uint64_t v4 = v3;
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor("prototyped/Application.swift", 28LL, 1LL, 13LL, v2, v4);
  }
  int v6 = static CommandLine.argc.getter(isCurrentExecutor);
  uint64_t v7 = (char **)static CommandLine.unsafeArgv.getter();
  uint64_t v8 = type metadata accessor for Application();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v8);
  v10 = NSStringFromClass(ObjCClassFromMetadata);
  if (!v10)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
    uint64_t v12 = v11;
    v10 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v12);
  }

  uint64_t v13 = type metadata accessor for AppDelegate();
  id v14 = (objc_class *)swift_getObjCClassFromMetadata(v13);
  id v15 = NSStringFromClass(v14);
  if (!v15)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
    uint64_t v17 = v16;
    delegateClassName = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v17);
    id v15 = delegateClassName;
  }

  delegateClassNamea = v15;
  UIApplicationMain(v6, v7, v10, v15);
  swift_release(v1);
}

uint64_t type metadata accessor for Application()
{
  return objc_opt_self(&OBJC_CLASS____TtC10prototyped11Application);
}

uint64_t sub_1000070B0()
{
  uint64_t v0 = type metadata accessor for MainActor(0LL);
  uint64_t v1 = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter(v0, &protocol witness table for MainActor);
  uint64_t v4 = v3;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 14LL, v2, v4);
  }
  swift_release(v1);
  return 1LL;
}

id sub_100007210(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithWindowScene:a1];

  return v3;
}

id sub_100007250(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for Window();
  id v3 = objc_msgSendSuper2(&v5, "initWithWindowScene:", a1);

  return v3;
}

uint64_t type metadata accessor for Window()
{
  return objc_opt_self(&OBJC_CLASS____TtC10prototyped6Window);
}

id sub_100007378(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(objc_allocWithZone(v4), "initWithFrame:", a1, a2, a3, a4);
}

id sub_1000073C8(double a1, double a2, double a3, double a4)
{
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for Window();
  return objc_msgSendSuper2(&v10, "initWithFrame:", a1, a2, a3, a4);
}

id sub_100007504(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id sub_100007544(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for Window();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_10000764C(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(objc_allocWithZone(v4), "initWithContentRect:", a1, a2, a3, a4);
}

id sub_10000769C(double a1, double a2, double a3, double a4)
{
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for Window();
  return objc_msgSendSuper2(&v10, "initWithContentRect:", a1, a2, a3, a4);
}

id sub_1000077D8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Window();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_10000780C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for MainActor(0LL);
  uint64_t v3 = static MainActor.shared.getter(v2);
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  uint64_t v6 = v5;
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 50LL, v4, v6);
  }
  uint64_t v8 = OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___rootModuleController;
  uint64_t v9 = *(void **)(v1 + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___rootModuleController);
  if (v9) {
    goto LABEL_15;
  }
  uint64_t v10 = static MainActor.shared.getter(isCurrentExecutor);
  uint64_t v11 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  uint64_t v13 = v12;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 49LL, v11, v13);
  }
  id v14 = (void *)objc_opt_self(&OBJC_CLASS___UIApplication);
  id v15 = [v14 sharedApplication];
  id v16 = [v15 delegate];

  if (!v16)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  swift_release(v10);
  uint64_t v17 = type metadata accessor for AppDelegate();
  swift_dynamicCastClassUnconditional(v16, v17, 0LL, 0LL, 0LL);
  id v18 = sub_1000092F8();
  uint64_t v19 = swift_unknownObjectRelease(v16);
  uint64_t v20 = static MainActor.shared.getter(v19);
  uint64_t v21 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  uint64_t v23 = v22;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 49LL, v21, v23);
  }
  id v24 = [v14 sharedApplication];
  id v25 = [v24 delegate];

  if (!v25) {
    goto LABEL_17;
  }
  swift_release(v20);
  swift_dynamicCastClassUnconditional(v25, v17, 0LL, 0LL, 0LL);
  id v26 = sub_1000093AC();
  swift_unknownObjectRelease(v25);
  id v27 = [objc_allocWithZone((Class)PTDRootModuleController) initWithDomainServer:v18 editingServer:v26];

  if (!v27)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  uint64_t v29 = static MainActor.shared.getter(v28);
  uint64_t v30 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  uint64_t v32 = v31;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 49LL, v30, v32);
  }
  id v33 = [v14 sharedApplication];
  id v34 = [v33 delegate];

  if (v34)
  {
    swift_release(v29);
    objc_msgSend(v27, "setDelegate:", swift_dynamicCastClassUnconditional(v34, v17, 0, 0, 0));
    swift_unknownObjectRelease(v34);
    v35 = *(void **)(v1 + v8);
    *(void *)(v1 + v8) = v27;
    v27;

    uint64_t v9 = 0LL;
LABEL_15:
    id v36 = v9;
    swift_release(v3);
    return;
  }

LABEL_19:
  __break(1u);
}

void sub_100007B78()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for MainActor(0LL);
  uint64_t v3 = static MainActor.shared.getter(v2);
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  uint64_t v6 = v5;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 57LL, v4, v6);
  }
  uint64_t v7 = OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___settingsViewController;
  uint64_t v8 = *(void **)(v1 + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___settingsViewController);
  if (v8) {
    goto LABEL_6;
  }
  sub_10000780C();
  uint64_t v10 = v9;
  id v11 = [v9 module];

  id v12 = [objc_allocWithZone(PTUISettingsController) initWithRootModule:v11];
  if (v12)
  {
    id v13 = [objc_allocWithZone(UIBarButtonItem) initWithBarButtonSystemItem:0 target:v1 action:"didSelectDone"];
    [v12 setDismissButton:v13];

    id v14 = *(void **)(v1 + v7);
    *(void *)(v1 + v7) = v12;
    v12;

    uint64_t v8 = 0LL;
LABEL_6:
    id v15 = v8;
    swift_release(v3);
    return;
  }

  __break(1u);
}

id sub_100007CDC(uint64_t a1, uint64_t *a2, void *a3, Class *a4)
{
  uint64_t v9 = v4;
  uint64_t v10 = type metadata accessor for MainActor(0LL);
  uint64_t v11 = static MainActor.shared.getter(v10);
  uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(v10, &protocol witness table for MainActor);
  uint64_t v14 = v13;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, a1, v12, v14);
  }
  uint64_t v15 = *a2;
  id v16 = *(void **)(v9 + v15);
  if (v16)
  {
    id v17 = *(id *)(v9 + v15);
  }

  else
  {
    id v18 = [objc_allocWithZone(*a4) initWithTarget:v9 action:*a3];
    uint64_t v19 = *(void **)(v9 + v15);
    *(void *)(v9 + v15) = v18;
    id v17 = v18;

    id v16 = 0LL;
  }

  id v20 = v16;
  swift_release(v11);
  return v17;
}

void SceneDelegate.sceneDidDisconnect(_:)(id a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for MainActor(0LL);
  uint64_t v5 = static MainActor.shared.getter(v4);
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  uint64_t v8 = v7;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 37LL, v6, v8);
  }
  uint64_t v9 = OBJC_IVAR____TtC10prototyped13SceneDelegate_window;
  uint64_t v10 = *(void **)(v2 + OBJC_IVAR____TtC10prototyped13SceneDelegate_window);
  if (!v10
    || (id v11 = [v10 windowScene]) == 0
    || (id v12 = v11, v11, v12 != a1))
  {
    swift_release(v5);
    return;
  }

  uint64_t v13 = *(void **)(v2 + v9);
  if (!v13) {
    goto LABEL_14;
  }
  id v14 = [v13 rootViewController];
  if (!v14)
  {
LABEL_11:
    id v17 = *(void **)(v2 + v9);
    if (v17)
    {
      [v17 setRootViewController:0];
      id v18 = *(void **)(v2 + v9);
      if (v18)
      {
        [v18 removeFromSuperview];
        id v19 = *(id *)(v2 + v9);
LABEL_15:
        *(void *)(v2 + v9) = 0LL;
        swift_release(v5);

        return;
      }
    }

LABEL_14:
    id v19 = 0LL;
    goto LABEL_15;
  }

  uint64_t v15 = v14;
  id v16 = [v14 view];

  if (v16)
  {
    [v16 removeFromSuperview];

    goto LABEL_11;
  }

  __break(1u);
}

double sub_100008058()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for MainActor(0LL);
  uint64_t v3 = static MainActor.shared.getter(v2);
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  uint64_t v6 = v5;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 47LL, v4, v6);
  }
  uint64_t v7 = v1 + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___originalOrigin;
  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___originalOrigin + 16) & 1) != 0)
  {
    uint64_t v8 = *(void **)(v1 + OBJC_IVAR____TtC10prototyped13SceneDelegate_window);
    if (v8)
    {
      [v8 frame];
      double v10 = v9;
      uint64_t v12 = v11;
    }

    else
    {
      uint64_t v12 = 0LL;
      double v10 = 0.0;
    }

    *(double *)uint64_t v7 = v10;
    *(void *)(v7 + 8) = v12;
    *(_BYTE *)(v7 + 16) = 0;
  }

  else
  {
    double v10 = *(double *)v7;
  }

  swift_release(v3);
  return v10;
}

uint64_t variable initialization expression of SceneDelegate.$__lazy_storage_$_originalOrigin()
{
  return 0LL;
}

double sub_100008150()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for MainActor(0LL);
  uint64_t v3 = static MainActor.shared.getter(v2);
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  uint64_t v6 = v5;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 48LL, v4, v6);
  }
  uint64_t v7 = v1 + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___originalBounds;
  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___originalBounds + 32) & 1) != 0)
  {
    uint64_t v8 = *(void **)(v1 + OBJC_IVAR____TtC10prototyped13SceneDelegate_window);
    if (v8)
    {
      [v8 bounds];
      double v10 = v9;
      uint64_t v12 = v11;
      uint64_t v14 = v13;
      uint64_t v16 = v15;
    }

    else
    {
      uint64_t v14 = 0LL;
      uint64_t v16 = 0LL;
      double v10 = 0.0;
      uint64_t v12 = 0LL;
    }

    *(double *)uint64_t v7 = v10;
    *(void *)(v7 + 8) = v12;
    *(void *)(v7 + 16) = v14;
    *(void *)(v7 + 24) = v16;
    *(_BYTE *)(v7 + 32) = 0;
  }

  else
  {
    double v10 = *(double *)v7;
  }

  swift_release(v3);
  return v10;
}

double variable initialization expression of SceneDelegate.$__lazy_storage_$_originalBounds@<D0>( uint64_t a1@<X8>)
{
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_BYTE *)(a1 + 32) = 1;
  return result;
}

uint64_t variable initialization expression of SceneDelegate.window()
{
  return 0LL;
}

void sub_10000827C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for MainActor(0LL);
  uint64_t v3 = static MainActor.shared.getter(v2);
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  uint64_t v6 = v5;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 64LL, v4, v6);
  }
  uint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC10prototyped13SceneDelegate_window);
  if (v7
    && (id v8 = [v7 windowScene]) != 0
    && (double v9 = v8, v10 = [v8 session], v9, v10))
  {
    id v11 = [(id)objc_opt_self(UIApplication) sharedApplication];
    [v11 requestSceneSessionDestruction:v10 options:0 errorHandler:0];
    swift_release(v3);
  }

  else
  {
    swift_release(v3);
  }

void sub_100008454(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for MainActor(0LL);
  uint64_t v5 = static MainActor.shared.getter(v4);
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  uint64_t v8 = v7;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 69LL, v6, v8);
  }
  double v9 = *(void **)(v2 + OBJC_IVAR____TtC10prototyped13SceneDelegate_window);
  if (!v9)
  {
    uint64_t v22 = v5;
LABEL_11:
    swift_release(v22);
    return;
  }

  id v10 = v9;
  [v10 endEditing:1];
  id v11 = [a1 state];
  if ((unint64_t)v11 < 2)
  {
LABEL_7:
    id v12 = [v10 frame];
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t v17 = static MainActor.shared.getter(v12);
    uint64_t v18 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
    uint64_t v20 = v19;
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 47LL, v18, v20);
    }
    uint64_t v21 = v2 + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___originalOrigin;
    *(void *)uint64_t v21 = v14;
    *(void *)(v21 + 8) = v16;
    *(_BYTE *)(v21 + 16) = 0;
    swift_release(v5);

    uint64_t v22 = v17;
    goto LABEL_11;
  }

  if (v11 == (id)2)
  {
    [a1 translationInView:v10];
    double v24 = v23;
    double v26 = v25;
    objc_msgSend(a1, "setTranslation:inView:", v10, 0.0, 0.0);
    id v27 = v10;
    [v27 frame];
    [v27 setFrame:v24 + v28];

    id v34 = v27;
    [v34 frame];
    objc_msgSend(v34, "setFrame:", v30, v26 + v29);
  }

  else
  {
    if (v11 == (id)3) {
      goto LABEL_7;
    }
    id v34 = v10;
    double v31 = sub_100008058();
    double v33 = v32;
    [v34 frame];
    objc_msgSend(v34, "setFrame:", v31, v33);
  }

  swift_release(v5);
}

void sub_1000086D0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for MainActor(0LL);
  uint64_t v5 = static MainActor.shared.getter(v4);
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  uint64_t v8 = v7;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 89LL, v6, v8);
  }
  double v9 = *(void **)(v2 + OBJC_IVAR____TtC10prototyped13SceneDelegate_window);
  if (!v9)
  {
    uint64_t v26 = v5;
LABEL_11:
    swift_release(v26);
    return;
  }

  id v10 = v9;
  id v11 = [a1 state];
  if ((unint64_t)v11 < 2)
  {
LABEL_7:
    id v12 = [v10 bounds];
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    uint64_t v21 = static MainActor.shared.getter(v12);
    uint64_t v22 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
    uint64_t v24 = v23;
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 48LL, v22, v24);
    }
    uint64_t v25 = v2 + OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___originalBounds;
    *(void *)uint64_t v25 = v14;
    *(void *)(v25 + 8) = v16;
    *(void *)(v25 + 16) = v18;
    *(void *)(v25 + 24) = v20;
    *(_BYTE *)(v25 + 32) = 0;
    swift_release(v5);

    uint64_t v26 = v21;
    goto LABEL_11;
  }

  if (v11 == (id)2)
  {
    id v27 = v10;
    double v28 = sub_100008150();
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    [a1 scale];
    CGFloat v36 = v35;
    [a1 scale];
    CGAffineTransformMakeScale(&v39, v36, v37);
    v40.origin.x = v28;
    v40.origin.y = v30;
    v40.size.width = v32;
    v40.size.height = v34;
    CGRect v41 = CGRectApplyAffineTransform(v40, &v39);
    objc_msgSend(v27, "setBounds:", 0.0, 0.0, v41.size.width, v41.size.height);
    swift_release(v5);
  }

  else
  {
    if (v11 == (id)3) {
      goto LABEL_7;
    }
    id v38 = v10;
    [v38 setBounds:sub_100008150()];
    swift_release(v5);
  }

void sub_100008980(void *a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(id))
{
  uint64_t v9 = type metadata accessor for MainActor(0LL);
  uint64_t v10 = static MainActor.shared.getter(v9);
  uint64_t v11 = dispatch thunk of Actor.unownedExecutor.getter(v9, &protocol witness table for MainActor);
  uint64_t v13 = v12;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, a4, v11, v13);
  }
  id v14 = a3;
  id v15 = a1;
  a5(v14);
  swift_release(v10);
}

id SceneDelegate.init()()
{
  ObjectType = (objc_class *)swift_getObjectType(v0);
  uint64_t v2 = &v0[OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___originalOrigin];
  *(void *)uint64_t v2 = 0LL;
  *((void *)v2 + 1) = 0LL;
  v2[16] = 1;
  uint64_t v3 = &v0[OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___originalBounds];
  *(_OWORD *)uint64_t v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  v3[32] = 1;
  *(void *)&v0[OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___rootModuleController] = 0LL;
  *(void *)&v0[OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___panGesture] = 0LL;
  *(void *)&v0[OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___pinchGesture] = 0LL;
  *(void *)&v0[OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___settingsViewController] = 0LL;
  *(void *)&v0[OBJC_IVAR____TtC10prototyped13SceneDelegate_window] = 0LL;
  v5.receiver = v0;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, "init");
}

void _s10prototyped13SceneDelegateC5scene_13willConnectTo7optionsySo7UISceneC_So0I7SessionCSo0I17ConnectionOptionsCtF_0( void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for MainActor(0LL);
  uint64_t v5 = static MainActor.shared.getter(v4);
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  uint64_t v8 = v7;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 20LL, v6, v8);
  }
  uint64_t v9 = objc_opt_self(&OBJC_CLASS___UIWindowScene);
  uint64_t v10 = swift_dynamicCastObjCClass(a1, v9);
  if (!v10)
  {
    swift_release(v5);
    return;
  }

  uint64_t v11 = v10;
  id v12 = objc_allocWithZone((Class)type metadata accessor for Window());
  id v13 = a1;
  id v14 = [v12 initWithWindowScene:v11];
  sub_10000780C();
  uint64_t v16 = v15;
  uint64_t v17 = static MainActor.shared.getter(v15);
  uint64_t v18 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  uint64_t v20 = v19;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/SceneDelegate.swift", 30LL, 1LL, 49LL, v18, v20);
  }
  uint64_t v21 = (void *)objc_opt_self(&OBJC_CLASS___UIApplication);
  id v22 = [v21 sharedApplication];
  id v23 = [v22 delegate];

  if (!v23)
  {
    __break(1u);
    goto LABEL_19;
  }

  swift_release(v17);
  uint64_t v24 = type metadata accessor for AppDelegate();
  swift_dynamicCastClassUnconditional(v23, v24, 0LL, 0LL, 0LL);
  id v25 = sub_1000092F8();
  swift_unknownObjectRelease(v23);
  id v26 = [v25 parameterRecordsOfTunedSettings];

  [v16 setParameterRecordsOfTunedSettings:v26];
  id v27 = v14;
  sub_100007B78();
  double v29 = v28;
  [v27 setRootViewController:v28];

  [v27 makeKeyAndVisible];
  id v30 = [(id)objc_opt_self(PTDefaults) sharedInstance];
  if (!v30)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  double v31 = v30;
  unsigned int v32 = [v30 multiWindowEnabled];

  if (!v32)
  {
LABEL_17:

    id v50 = *(id *)(v2 + OBJC_IVAR____TtC10prototyped13SceneDelegate_window);
    *(void *)(v2 + OBJC_IVAR____TtC10prototyped13SceneDelegate_window) = v27;
    swift_release(v5);

    return;
  }

  id v33 = v27;
  [v33 bounds];
  objc_msgSend(v33, "setBounds:");

  id v34 = v33;
  [v34 bounds];
  objc_msgSend(v34, "setBounds:");

  id v35 = v34;
  [v35 bounds];
  id v36 = [v21 sharedApplication];
  id v37 = [v36 connectedScenes];

  unint64_t v38 = sub_1000091CC();
  unint64_t v39 = sub_100009208();
  uint64_t v40 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v37, v38, v39);

  if ((v40 & 0xC000000000000001LL) != 0)
  {
    if (v40 < 0) {
      uint64_t v41 = v40;
    }
    else {
      uint64_t v41 = v40 & 0xFFFFFFFFFFFFFF8LL;
    }
    __CocoaSet.count.getter(v41);
  }

  swift_bridgeObjectRelease(v40);
  [v35 center];
  objc_msgSend(v35, "setCenter:");

  sub_100007B78();
  v43 = v42;
  id v44 = [v42 navigationBar];

  id v45 = sub_100007CDC( 55LL,  &OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___panGesture,  &selRef_didDrag_,  (Class *)&OBJC_CLASS___UIPanGestureRecognizer_ptr);
  [v44 addGestureRecognizer:v45];

  sub_100007B78();
  v47 = v46;
  id v48 = [v46 view];

  if (v48)
  {
    id v49 = sub_100007CDC( 56LL,  &OBJC_IVAR____TtC10prototyped13SceneDelegate____lazy_storage___pinchGesture,  &selRef_didPinch_,  (Class *)&OBJC_CLASS___UIPinchGestureRecognizer_ptr);
    [v48 addGestureRecognizer:v49];

    goto LABEL_17;
  }

LABEL_20:
  __break(1u);
}

uint64_t type metadata accessor for SceneDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC10prototyped13SceneDelegate);
}

uint64_t sub_10000910C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 sub_100009140(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000914C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_10000916C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0LL;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

__n128 sub_1000091AC(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

unint64_t sub_1000091CC()
{
  unint64_t result = qword_10001BAE8;
  if (!qword_10001BAE8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___UIScene);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001BAE8);
  }

  return result;
}

unint64_t sub_100009208()
{
  unint64_t result = qword_10001BAF0;
  if (!qword_10001BAF0)
  {
    unint64_t v1 = sub_1000091CC();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_10001BAF0);
  }

  return result;
}

uint64_t sub_100009250(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100009270(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    *(void *)(result + 8) = 0LL;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void sub_1000092AC(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

id sub_1000092F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for MainActor(0LL);
  uint64_t v3 = static MainActor.shared.getter(v2);
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  uint64_t v6 = v5;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/AppDelegate.swift", 28LL, 1LL, 13LL, v4, v6);
  }
  id v7 = objc_retain(*(id *)(*(void *)(*(void *)(v1 + OBJC_IVAR____TtC10prototyped11AppDelegate_listener)
                                     + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_uiServer)
                         + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer_domainServer));
  swift_release(v3);
  return v7;
}

id sub_1000093AC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for MainActor(0LL);
  uint64_t v3 = static MainActor.shared.getter(v2);
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  uint64_t v6 = v5;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/AppDelegate.swift", 28LL, 1LL, 14LL, v4, v6);
  }
  id v7 = objc_retain(*(id *)(*(void *)(v1 + OBJC_IVAR____TtC10prototyped11AppDelegate_listener)
                         + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_uiServer));
  id v8 = sub_100009464();
  swift_release(v3);

  return v8;
}

id sub_100009464()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for MainActor(0LL);
  uint64_t v3 = static MainActor.shared.getter(v2);
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  uint64_t v6 = v5;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/AppDelegate.swift", 28LL, 1LL, 65LL, v4, v6);
  }
  uint64_t v7 = OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer____lazy_storage___editingServer;
  id v8 = *(void **)(v1
                + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer____lazy_storage___editingServer);
  if (v8)
  {
    id v9 = *(id *)(v1
               + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer____lazy_storage___editingServer);
LABEL_7:
    id v12 = v8;
    swift_release(v3);
    return v9;
  }

  id result = [objc_allocWithZone(PTUIEditingServer) initWithDataSource:*(void *)(v1 + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer_domainServer) delegate:*(void *)(v1 + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer_domainServer) forRemoteEditing:0];
  if (result)
  {
    uint64_t v11 = *(void **)(v1 + v7);
    *(void *)(v1 + v7) = result;
    id v9 = result;

    id v8 = 0LL;
    goto LABEL_7;
  }

  __break(1u);
  return result;
}

id sub_100009558()
{
  return [objc_allocWithZone((Class)type metadata accessor for Listener()) init];
}

uint64_t type metadata accessor for Listener()
{
  return objc_opt_self(&OBJC_CLASS____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener);
}

uint64_t sub_100009598(uint64_t a1, uint64_t a2)
{
  return sub_10000B53C(a2);
}

uint64_t sub_1000095A0()
{
  if (qword_10001BEB0 != -1) {
    swift_once(&qword_10001BEB0, sub_10000A8FC);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  return sub_10000B8F8(v0, (uint64_t)qword_10001C1C0);
}

id sub_1000096FC()
{
  ObjectType = (objc_class *)swift_getObjectType(v0);
  uint64_t v2 = OBJC_IVAR____TtC10prototyped11AppDelegate_listener;
  id v3 = objc_allocWithZone((Class)type metadata accessor for Listener());
  uint64_t v4 = v0;
  *(void *)&v0[v2] = [v3 init];

  v6.receiver = v4;
  v6.super_class = ObjectType;
  return objc_msgSendSuper2(&v6, "init");
}

uint64_t sub_100009880()
{
  uint64_t v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56LL))(v2, 1LL, 1LL, v3);
  type metadata accessor for MainActor(0LL);
  id v4 = v0;
  uint64_t v5 = static MainActor.shared.getter(v4);
  objc_super v6 = (void *)swift_allocObject(&unk_100014B60, 40LL, 7LL);
  v6[2] = v5;
  v6[3] = &protocol witness table for MainActor;
  v6[4] = v4;
  uint64_t v7 = sub_100009AAC((uint64_t)v2, (uint64_t)&unk_10001BBE8, (uint64_t)v6);
  return swift_release(v7);
}

uint64_t sub_10000995C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[7] = a1;
  v4[8] = a4;
  uint64_t v5 = type metadata accessor for MainActor(0LL);
  v4[9] = static MainActor.shared.getter(v5);
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  return swift_task_switch(sub_1000099C8, v6, v7);
}

uint64_t sub_1000099C8()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_release(*(void *)(v0 + 72));
  if (v2
    && (id v3 = [v2 remoteObjectProxy],
        _bridgeAnyObjectToAny(_:)(),
        swift_unknownObjectRelease(v3),
        uint64_t v4 = sub_10000B910(&qword_10001BE58),
        (swift_dynamicCast(v0 + 48, v0 + 16, (char *)&type metadata for Any + 8, v4, 6LL) & 1) != 0))
  {
    uint64_t v5 = *(void **)(v0 + 48);
    [v5 killSpringBoard];
    swift_unknownObjectRelease(v5);
    char v6 = 0;
  }

  else
  {
    char v6 = 1;
  }

  **(_BYTE **)(v0 + 56) = v6;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100009AAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_10000BAC8(a1);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      uint64_t v10 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9, v12);
      uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      uint64_t v15 = v14;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v16 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v13 = 0LL;
  uint64_t v15 = 0LL;
LABEL_6:
  uint64_t v17 = swift_allocObject(&unk_100014C50, 32LL, 7LL);
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  uint64_t v18 = sub_10000B910(&qword_10001BE50);
  if (v15 | v13)
  {
    v21[0] = 0LL;
    v21[1] = 0LL;
    uint64_t v19 = v21;
    v21[2] = v13;
    v21[3] = v15;
  }

  else
  {
    uint64_t v19 = 0LL;
  }

  return swift_task_create(v8, v19, v18, &unk_10001BE48, v17);
}

uint64_t sub_100009BF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_10000BAC8(a1);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      uint64_t v10 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9, v12);
      uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      uint64_t v15 = v14;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v16 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v13 = 0LL;
  uint64_t v15 = 0LL;
LABEL_6:
  uint64_t v17 = swift_allocObject(&unk_100014BB0, 32LL, 7LL);
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0LL;
    v20[1] = 0LL;
    uint64_t v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  return swift_task_create(v8, v18, (char *)&type metadata for () + 8, &unk_10001BE20, v17);
}

char *sub_100009E28()
{
  *(void *)&v0[OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_connection] = 0LL;
  uint64_t v1 = OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_listener;
  static String._unconditionallyBridgeFromObjectiveC(_:)(PTUIMachService);
  uint64_t v3 = v2;
  id v4 = objc_allocWithZone(&OBJC_CLASS___NSXPCListener);
  uint64_t v5 = v0;
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  id v7 = [v4 initWithMachServiceName:v6];

  *(void *)&v0[v1] = v7;
  uint64_t v8 = OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_uiServer;
  *(void *)&v5[v8] = [objc_allocWithZone((Class)type metadata accessor for UIServer()) init];

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for Listener();
  uint64_t v9 = (char *)objc_msgSendSuper2(&v11, "init");
  [*(id *)&v9[OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_listener] setDelegate:v9];
  return v9;
}

uint64_t sub_100009F54(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

id sub_100009FDC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Listener();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000A054(uint64_t a1)
{
  objc_super v2 = v1;
  sub_10000B910(&qword_10001BBD8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10001BEB0 != -1) {
    swift_once(&qword_10001BEB0, sub_10000A8FC);
  }
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = sub_10000B8F8(v6, (uint64_t)qword_10001C1C0);
  uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v11 = swift_slowAlloc(32LL, -1LL);
    uint64_t v22 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    unint64_t v12 = sub_10000A284(a1);
    unint64_t v14 = v13;
    uint64_t v21 = sub_10000AE44(v12, v13, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v10 + 4, v10 + 12);
    swift_bridgeObjectRelease(v14);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "handle prototyping event: %s", v10, 0xCu);
    swift_arrayDestroy(v11, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1LL, -1LL);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  uint64_t v15 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v5, 1LL, 1LL, v15);
  type metadata accessor for MainActor(0LL);
  id v16 = v2;
  uint64_t v17 = static MainActor.shared.getter(v16);
  uint64_t v18 = (void *)swift_allocObject(&unk_100014B88, 48LL, 7LL);
  v18[2] = v17;
  v18[3] = &protocol witness table for MainActor;
  v18[4] = a1;
  v18[5] = v16;
  uint64_t v19 = sub_100009BF8((uint64_t)v5, (uint64_t)&unk_10001BE08, (uint64_t)v18);
  return swift_release(v19);
}

unint64_t sub_10000A284(uint64_t a1)
{
  unint64_t result = 0xD000000000000010LL;
  switch(a1)
  {
    case 0LL:
      unint64_t result = 1701736302LL;
      break;
    case 1LL:
      return result;
    case 2LL:
      unint64_t result = 0xD000000000000012LL;
      break;
    case 3LL:
    case 4LL:
      unint64_t result = 0xD000000000000014LL;
      break;
    default:
      v3._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
      object = v3._object;
      String.append(_:)(v3);
      swift_bridgeObjectRelease(object);
      unint64_t result = 0x206E776F6E6B6E75LL;
      break;
  }

  return result;
}

uint64_t sub_10000A380(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  uint64_t v6 = type metadata accessor for UISceneSessionActivationRequest(0LL);
  v5[4] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[5] = v7;
  v5[6] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for MainActor(0LL);
  v5[7] = static MainActor.shared.getter(v8);
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000A414, v9, v10);
}

CFNotificationCenterRef sub_10000A414()
{
  id v1 = [(id)objc_opt_self(UIApplication) sharedApplication];
  CFNotificationCenterRef result = (CFNotificationCenterRef)[(id)objc_opt_self(PTDefaults) sharedInstance];
  if (result)
  {
    CFNotificationCenterRef v3 = result;
    if (-[__CFNotificationCenter activeTestRecipeEatsEvent:]( result,  "activeTestRecipeEatsEvent:",  *(void *)(v0 + 16)))
    {
      uint64_t v4 = *(void *)(v0 + 16);
      id v6 = -[__CFNotificationCenter activeTestRecipeIdentifier](v3, "activeTestRecipeIdentifier");
      [v5 sendEvent:v4 forTestRecipeID:v6];

LABEL_15:
      swift_task_dealloc(*(void *)(v0 + 48));
      return (CFNotificationCenterRef)(*(uint64_t (**)(void))(v0 + 8))();
    }

    if ((-[__CFNotificationCenter multiWindowEnabled](v3, "multiWindowEnabled") & 1) == 0)
    {
      id v7 = [v1 connectedScenes];
      unint64_t v8 = sub_1000091CC();
      uint64_t v9 = sub_10000C344( (unint64_t *)&qword_10001BAF0,  (uint64_t (*)(uint64_t))sub_1000091CC,  (uint64_t)&protocol conformance descriptor for NSObject);
      uint64_t v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v7, v8, v9);

      if ((v10 & 0xC000000000000001LL) != 0)
      {
        uint64_t v11 = v10 < 0 ? v10 : v10 & 0xFFFFFFFFFFFFFF8LL;
        uint64_t v12 = __CocoaSet.count.getter(v11);
      }

      else
      {
        uint64_t v12 = *(void *)(v10 + 16);
      }

      swift_bridgeObjectRelease(v10);
      if (v12)
      {
        id v13 = [v1 connectedScenes];
        uint64_t v14 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v13, v8, v9);

        id v15 = v1;
        sub_10000BE64(v14, v15);

        swift_bridgeObjectRelease(v14);
        goto LABEL_15;
      }
    }

    CFNotificationCenterRef result = CFNotificationCenterGetDarwinNotifyCenter();
    if (PTPrototypingIsActiveDarwinNotification)
    {
      CFNotificationCenterRef v16 = result;
      uint64_t v18 = *(void *)(v0 + 40);
      uint64_t v17 = *(void *)(v0 + 48);
      uint64_t v19 = *(void *)(v0 + 32);
      CFNotificationCenterPostNotification(result, PTPrototypingIsActiveDarwinNotification, 0LL, 0LL, 1u);

      UISceneSessionActivationRequest.init(role:userActivity:options:)( UIWindowSceneSessionRoleApplication,  0LL,  0LL);
      UIApplication.activateSceneSession(for:errorHandler:)(v17, 0LL, 0LL);

      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
      goto LABEL_15;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_10000A8FC()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_10000C3F4(v0, qword_10001C1C0);
  sub_10000B8F8(v0, (uint64_t)qword_10001C1C0);
  return Logger.init(subsystem:category:)( 0x7079746F746F7270LL,  0xEA00000000006465LL,  0x67656C6544707041LL,  0xEB00000000657461LL);
}

uint64_t sub_10000A978@<X0>(uint64_t a1@<X8>)
{
  if (qword_10001BEB0 != -1) {
    swift_once(&qword_10001BEB0, sub_10000A8FC);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_10000B8F8(v2, (uint64_t)qword_10001C1C0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
}

uint64_t sub_10000A9E8(uint64_t a1, uint64_t a2)
{
  return sub_10000AAB0(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10000A9F4(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_10000AA34(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  Swift::Int v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_10000AAA4(uint64_t a1, uint64_t a2)
{
  return sub_10000AAB0(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10000AAB0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  uint64_t v7 = v6;
  uint64_t v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_10000AAEC(uint64_t a1, id *a2)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  uint64_t v5 = v8;
  if (v8)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    uint64_t result = swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return result;
}

uint64_t sub_10000AB60(uint64_t a1, id *a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  char v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  uint64_t v5 = v9;
  if (v9)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_10000ABDC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = v3;
  NSString v5 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v4);
  *a2 = v5;
  return result;
}

uint64_t sub_10000AC1C(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    char v10 = 1;
    uint64_t v9 = v5;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0LL);
  }

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t sub_10000ACA4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_10000ACE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10000AD10(uint64_t a1)
{
  uint64_t v2 = sub_10000C344( &qword_10001BE38,  (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey,  (uint64_t)&unk_100012F64);
  uint64_t v3 = sub_10000C344( &qword_10001BE88,  (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey,  (uint64_t)&unk_100012EB8);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10000AD94(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10000ADF8;
  return v6(a1);
}

uint64_t sub_10000ADF8()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000AE44(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000AF14(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000BA88((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000BA88((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_10000BA68(v12);
  return v7;
}

uint64_t sub_10000AF14(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

LABEL_13:
    uint64_t result = sub_10000B0CC(a5, a6);
    *a1 = v13;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  uint64_t v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  v14,  1173LL,  0);
    __break(1u);
    return result;
  }

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

uint64_t sub_10000B0CC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000B160(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000B338(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000B338(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000B160(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    while (1)
    {
      uint64_t v5 = sub_10000B2D4(v4, 0LL);
      if (v4 < 0) {
        break;
      }
      uint64_t v6 = v5;
      uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0) {
        goto LABEL_14;
      }
      if (v7 == v4) {
        return v6;
      }
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  v10,  1122LL,  0);
      __break(1u);
LABEL_10:
      uint64_t v4 = String.UTF8View._foreignCount()();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }

    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  v10,  71LL,  0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    __break(1u);
  }

  else
  {
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_10000B2D4(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v4 = sub_10000B910(&qword_10001BE10);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000B338(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10000B910(&qword_10001BE10);
    uint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  int v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8]) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }

LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_10000B484(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unint64_t v3 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 24) = v3;
  void *v3 = v2;
  v3[1] = sub_10000B4EC;
  return v5(v2 + 32);
}

uint64_t sub_10000B4EC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(_BYTE **)(*v0 + 16);
  uint64_t v4 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 24));
  _BYTE *v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_10000B53C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  int64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for MainActor(0LL);
  uint64_t v9 = static MainActor.shared.getter(v8);
  uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
  uint64_t v12 = v11;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor("prototyped/AppDelegate.swift", 28LL, 1LL, 16LL, v10, v12);
  }
  if (qword_10001BEB0 != -1) {
    swift_once(&qword_10001BEB0, sub_10000A8FC);
  }
  uint64_t v13 = sub_10000B8F8(v4, (uint64_t)qword_10001C1C0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v13, v4);
  uint64_t v14 = swift_bridgeObjectRetain_n(a1, 2LL);
  uint64_t v15 = v5;
  CFNotificationCenterRef v16 = (os_log_s *)Logger.logObject.getter(v14);
  os_log_type_t v17 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v38 = v15;
    uint64_t v39 = v9;
    uint64_t v40 = v2;
    uint64_t v18 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v19 = swift_slowAlloc(32LL, -1LL);
    uint64_t v37 = v19;
    uint64_t v42 = v19;
    *(_DWORD *)uint64_t v18 = 136315138;
    uint64_t v20 = static MainActor.shared.getter(v19);
    uint64_t v21 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
    uint64_t v23 = v22;
    uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
    if ((isCurrentExecutor & 1) == 0) {
      uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor("prototyped/AppDelegate.swift", 28LL, 1LL, 18LL, v21, v23);
    }
    if (a1)
    {
      type metadata accessor for LaunchOptionsKey(0LL);
      uint64_t v26 = v25;
      uint64_t v27 = sub_10000C344( &qword_10001BE38,  (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey,  (uint64_t)&unk_100012F64);
      uint64_t v28 = Dictionary.description.getter(a1, v26, (char *)&type metadata for Any + 8, v27);
      unint64_t v30 = v29;
      swift_release(v20);
    }

    else
    {
      uint64_t v31 = static MainActor.shared.getter(isCurrentExecutor);
      uint64_t v32 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
      uint64_t v34 = v33;
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor("prototyped/AppDelegate.swift", 28LL, 1LL, 18LL, v32, v34);
      }
      swift_release(v20);
      swift_release(v31);
      unint64_t v30 = 0xE300000000000000LL;
      uint64_t v28 = 7104878LL;
    }

    uint64_t v41 = sub_10000AE44(v28, v30, &v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v18 + 4, v18 + 12);
    swift_bridgeObjectRelease_n(a1, 2LL);
    swift_bridgeObjectRelease(v30);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "application didFinishLaunchingWithOptions: %s", v18, 0xCu);
    uint64_t v35 = v37;
    swift_arrayDestroy(v37, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v35, -1LL, -1LL);
    swift_slowDealloc(v18, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v38 + 8))(v7, v4);
    uint64_t v9 = v39;
    uint64_t v2 = v40;
  }

  else
  {

    swift_bridgeObjectRelease_n(a1, 2LL);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v4);
  }

  objc_msgSend( *(id *)(*(void *)(v2 + OBJC_IVAR____TtC10prototyped11AppDelegate_listener)
          + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_listener),
    "resume");
  swift_release(v9);
  return 1LL;
}

uint64_t sub_10000B8F8(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000B910(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_10000B954(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = (void *)swift_task_alloc(dword_10001BBE4);
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10000C4CC;
  return sub_10000995C(a1, v6, v7, v4);
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC10prototyped11AppDelegate);
}

uint64_t type metadata accessor for UIServer()
{
  return objc_opt_self(&OBJC_CLASS____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer);
}

uint64_t sub_10000B9EC()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_10000BA18()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc(dword_10001BE04);
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_10000C4CC;
  return sub_10000A380((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_10000BA68(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000BA88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000BAC8(uint64_t a1)
{
  uint64_t v2 = sub_10000B910(&qword_10001BBD8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10000BB08()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000BB2C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_10001BE1C);
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10000C4CC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10001BE18 + dword_10001BE18))(a1, v4);
}

BOOL sub_10000BB9C(void *a1)
{
  uint64_t v2 = v1;
  if (qword_10001BEB0 != -1) {
    swift_once(&qword_10001BEB0, sub_10000A8FC);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  sub_10000B8F8(v4, (uint64_t)qword_10001C1C0);
  uint64_t v5 = a1;
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v9 = (void ***)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v8 = 138412290;
    uint64_t v23 = v5;
    uint64_t v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, v24, v8 + 4, v8 + 12);
    char *v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "listener shouldAcceptNewConnection: %@", v8, 0xCu);
    uint64_t v11 = sub_10000B910(&qword_10001BE28);
    swift_arrayDestroy(v9, 1LL, v11);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {
  }

  uint64_t v13 = OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_connection;
  uint64_t v14 = *(void *)(v2 + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_connection);
  if (!v14)
  {
    id v15 = (id)PTUIClientInterface(v12);
    [v5 setRemoteObjectInterface:v15];

    id v17 = (id)PTUIServerInterface(v16);
    [v5 setExportedInterface:v17];

    [v5 setExportedObject:*(void *)(v2 + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_uiServer)];
    uint64_t v18 = swift_allocObject(&unk_100014BD8, 24LL, 7LL);
    swift_unknownObjectWeakInit(v18 + 16, v2);
    v24[3] = sub_10000C1EC;
    uint64_t v25 = v18;
    uint64_t v23 = _NSConcreteStackBlock;
    v24[0] = 1107296256LL;
    v24[1] = sub_100009F54;
    v24[2] = &unk_100014BF0;
    uint64_t v19 = _Block_copy(&v23);
    swift_release(v25);
    [v5 setInvalidationHandler:v19];
    _Block_release(v19);
    [v5 resume];
    uint64_t v20 = *(void **)(v2 + v13);
    *(void *)(v2 + v13) = v5;
    uint64_t v21 = v5;
  }

  return v14 == 0;
}

void sub_10000BE64(uint64_t a1, void *a2)
{
  uint64_t v3 = a1;
  if ((a1 & 0xC000000000000001LL) != 0)
  {
    if (a1 < 0) {
      uint64_t v4 = a1;
    }
    else {
      uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v5 = __CocoaSet.makeIterator()(v4);
    unint64_t v6 = sub_1000091CC();
    uint64_t v7 = sub_10000C344( (unint64_t *)&qword_10001BAF0,  (uint64_t (*)(uint64_t))sub_1000091CC,  (uint64_t)&protocol conformance descriptor for NSObject);
    uint64_t v8 = Set.Iterator.init(_cocoa:)(v36, v5, v6, v7);
    uint64_t v3 = v36[0];
    uint64_t v34 = v36[1];
    uint64_t v9 = v36[2];
    uint64_t v10 = v36[3];
    unint64_t v11 = v36[4];
  }

  else
  {
    uint64_t v12 = -1LL << *(_BYTE *)(a1 + 32);
    uint64_t v34 = a1 + 56;
    uint64_t v9 = ~v12;
    uint64_t v13 = -v12;
    if (v13 < 64) {
      uint64_t v14 = ~(-1LL << v13);
    }
    else {
      uint64_t v14 = -1LL;
    }
    unint64_t v11 = v14 & *(void *)(a1 + 56);
    uint64_t v8 = (void *)swift_bridgeObjectRetain(a1);
    uint64_t v10 = 0LL;
  }

  uint64_t v32 = v9;
  int64_t v33 = (unint64_t)(v9 + 64) >> 6;
  while (v3 < 0)
  {
    uint64_t v19 = __CocoaSet.Iterator.next()(v8);
    if (!v19) {
      goto LABEL_37;
    }
    uint64_t v20 = v19;
    uint64_t v35 = v19;
    unint64_t v21 = sub_1000091CC();
    swift_unknownObjectRetain(v20, v22);
    swift_dynamicCast(&v37, &v35, (char *)&type metadata for Swift.AnyObject + 8, v21, 7LL);
    id v23 = v37;
    swift_unknownObjectRelease(v20);
    uint64_t v18 = v10;
    uint64_t v16 = v11;
    if (!v23) {
      goto LABEL_37;
    }
LABEL_35:
    uint64_t v27 = type metadata accessor for MainActor(0LL);
    uint64_t v28 = static MainActor.shared.getter(v27);
    uint64_t v29 = dispatch thunk of Actor.unownedExecutor.getter(v27, &protocol witness table for MainActor);
    uint64_t v31 = v30;
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor("prototyped/AppDelegate.swift", 28LL, 1LL, 75LL, v29, v31);
    }
    id v15 = objc_msgSend(v23, "session", v32);
    [a2 requestSceneSessionDestruction:v15 options:0 errorHandler:0];

    swift_release(v28);
    uint64_t v10 = v18;
    unint64_t v11 = v16;
  }

  if (v11)
  {
    uint64_t v16 = (v11 - 1) & v11;
    unint64_t v17 = __clz(__rbit64(v11)) | (v10 << 6);
    uint64_t v18 = v10;
LABEL_34:
    id v23 = *(id *)(*(void *)(v3 + 48) + 8 * v17);
    if (!v23) {
      goto LABEL_37;
    }
    goto LABEL_35;
  }

  int64_t v24 = v10 + 1;
  if (!__OFADD__(v10, 1LL))
  {
    if (v24 >= v33) {
      goto LABEL_37;
    }
    unint64_t v25 = *(void *)(v34 + 8 * v24);
    uint64_t v18 = v10 + 1;
    if (!v25)
    {
      uint64_t v18 = v10 + 2;
      if (v10 + 2 >= v33) {
        goto LABEL_37;
      }
      unint64_t v25 = *(void *)(v34 + 8 * v18);
      if (!v25)
      {
        uint64_t v18 = v10 + 3;
        if (v10 + 3 >= v33) {
          goto LABEL_37;
        }
        unint64_t v25 = *(void *)(v34 + 8 * v18);
        if (!v25)
        {
          uint64_t v18 = v10 + 4;
          if (v10 + 4 >= v33) {
            goto LABEL_37;
          }
          unint64_t v25 = *(void *)(v34 + 8 * v18);
          if (!v25)
          {
            uint64_t v18 = v10 + 5;
            if (v10 + 5 >= v33) {
              goto LABEL_37;
            }
            unint64_t v25 = *(void *)(v34 + 8 * v18);
            if (!v25)
            {
              uint64_t v26 = v10 + 6;
              while (v33 != v26)
              {
                unint64_t v25 = *(void *)(v34 + 8 * v26++);
                if (v25)
                {
                  uint64_t v18 = v26 - 1;
                  goto LABEL_33;
                }
              }

LABEL_37:
              sub_10000C1C0(v3);
              return;
            }
          }
        }
      }
    }

LABEL_33:
    uint64_t v16 = (v25 - 1) & v25;
    unint64_t v17 = __clz(__rbit64(v25)) + (v18 << 6);
    goto LABEL_34;
  }

  __break(1u);
}

uint64_t sub_10000C1C0(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000C1C8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_10000C1EC()
{
  Strong = (char *)swift_unknownObjectWeakLoadStrong(v0 + 16);
  if (Strong)
  {
    uint64_t v2 = *(void **)&Strong[OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_connection];
    *(void *)&Strong[OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28Listener_connection] = 0LL;
  }

uint64_t sub_10000C248(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000C258(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10000C264()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_10000C290(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = (void *)swift_task_alloc(dword_10001BBE4);
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10000C2E8;
  return sub_10000995C(a1, v6, v7, v4);
}

uint64_t sub_10000C2E8()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
}

uint64_t sub_10000C344(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_10000C384(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_10001BE44);
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10000C2E8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10001BE40 + dword_10001BE40))(a1, v4);
}

uint64_t *sub_10000C3F4(uint64_t a1, uint64_t *a2)
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

void type metadata accessor for PTPrototypingEvent(uint64_t a1)
{
}

uint64_t sub_10000C448()
{
  return sub_10000C344( &qword_10001BE70,  (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey,  (uint64_t)&unk_100012E7C);
}

uint64_t sub_10000C474()
{
  return sub_10000C344( &qword_10001BE78,  (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey,  (uint64_t)&unk_100012E50);
}

uint64_t sub_10000C4A0()
{
  return sub_10000C344( &qword_10001BE80,  (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey,  (uint64_t)&unk_100012EEC);
}

id objc_msgSend__hardwareEventSection(void *a1, const char *a2, ...)
{
  return _[a1 _hardwareEventSection];
}

id objc_msgSend__killSection(void *a1, const char *a2, ...)
{
  return _[a1 _killSection];
}

id objc_msgSend__populateTableDataAndChildren(void *a1, const char *a2, ...)
{
  return _[a1 _populateTableDataAndChildren];
}

id objc_msgSend__writeToDiskWithParameterRecords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_writeToDiskWithParameterRecords:");
}

id objc_msgSend_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "action:");
}

id objc_msgSend_actionWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithHandler:");
}

id objc_msgSend_actionWithViewControllerCreator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithViewControllerCreator:");
}

id objc_msgSend_activateSceneSessionForRequest_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateSceneSessionForRequest:errorHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_appendObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendObject:");
}

id objc_msgSend_appendObject_counterpart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendObject:counterpart:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appendString_counterpart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:counterpart:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_builder(void *a1, const char *a2, ...)
{
  return _[a1 builder];
}

id objc_msgSend_builderWithObject_ofExpectedClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "builderWithObject:ofExpectedClass:");
}

id objc_msgSend_changedValue(void *a1, const char *a2, ...)
{
  return _[a1 changedValue];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_connectedScenes(void *a1, const char *a2, ...)
{
  return _[a1 connectedScenes];
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

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultContentConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultContentConfiguration];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithIdentifier:");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_displayedShowsUIValueForEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayedShowsUIValueForEvent:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:style:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithParameterRecords_withTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParameterRecords:withTitle:");
}

id objc_msgSend_initWithRecordClassName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordClassName:value:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_killSpringBoard(void *a1, const char *a2, ...)
{
  return _[a1 killSpringBoard];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_localSettingsOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localSettingsOfClass:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_moduleWithSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moduleWithSettings:");
}

id objc_msgSend_moduleWithTitle_contents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moduleWithTitle:contents:");
}

id objc_msgSend_multiWindowEnabled(void *a1, const char *a2, ...)
{
  return _[a1 multiWindowEnabled];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_observeShowUISwitchDefaultsOnQueue_withBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observeShowUISwitchDefaultsOnQueue:withBlock:");
}

id objc_msgSend_parameterRecordsOfTunedSettings(void *a1, const char *a2, ...)
{
  return _[a1 parameterRecordsOfTunedSettings];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_recordClassName(void *a1, const char *a2, ...)
{
  return _[a1 recordClassName];
}

id objc_msgSend_recordDictionary(void *a1, const char *a2, ...)
{
  return _[a1 recordDictionary];
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellReuseIdentifier:");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _[a1 reloadData];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_requestSceneSessionDestruction_options_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestSceneSessionDestruction:options:errorHandler:");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_rowWithTitle_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowWithTitle:action:");
}

id objc_msgSend_rowWithTitle_actionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowWithTitle:actionHandler:");
}

id objc_msgSend_rowWithTitle_valueGetter_valueSetter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowWithTitle:valueGetter:valueSetter:");
}

id objc_msgSend_rowWithTitle_valueKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowWithTitle:valueKeyPath:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_sectionWithRows_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionWithRows:");
}

id objc_msgSend_sectionWithRows_title_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionWithRows:title:");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setChangedValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChangedValue:");
}

id objc_msgSend_setContentConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentConfiguration:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExternalCondition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExternalCondition:");
}

id objc_msgSend_setMultiWindowEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMultiWindowEnabled:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPreventLockover_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreventLockover:");
}

id objc_msgSend_setRecordClassName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordClassName:");
}

id objc_msgSend_setRecordDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordDictionary:");
}

id objc_msgSend_setSecondaryText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecondaryText:");
}

id objc_msgSend_setSelectionStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionStyle:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setUnregisterBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnregisterBlock:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_settingsEditingModule(void *a1, const char *a2, ...)
{
  return _[a1 settingsEditingModule];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_submoduleWithModule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submoduleWithModule:");
}

id objc_msgSend_testRecipeSelectionModule(void *a1, const char *a2, ...)
{
  return _[a1 testRecipeSelectionModule];
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:options:error:");
}