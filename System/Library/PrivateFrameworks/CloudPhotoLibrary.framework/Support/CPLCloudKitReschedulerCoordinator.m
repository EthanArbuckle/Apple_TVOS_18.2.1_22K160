@interface CPLCloudKitReschedulerCoordinator
+ (id)_cloudKitReschedulerManagerForLibraryWithIdentifier:(id)a3 involvedProcesses:(id)a4 relatedApplications:(id)a5;
+ (id)cloudKitReschedulerManagerForLibraryWithIdentifier:(id)a3 involvedProcesses:(id)a4 relatedApplications:(id)a5;
+ (void)_saveRegisteredTaskIdentifiers;
+ (void)beginRegisteringKnownReschedulerManager;
+ (void)dropCloudKitReschedulerManagerForLibraryWithIdentifier:(id)a3;
+ (void)endRegisteringKnownReschedulerManagers;
@end

@implementation CPLCloudKitReschedulerCoordinator

+ (void)_saveRegisteredTaskIdentifiers
{
  if ((byte_100295F90 & 1) == 0)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue([(id)qword_100295F98 allObjects]);
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v2 setObject:v3 forKey:@"_CPLRegisteredTaskIdentifiers"];
  }

+ (id)_cloudKitReschedulerManagerForLibraryWithIdentifier:(id)a3 involvedProcesses:(id)a4 relatedApplications:(id)a5
{
  id v7 = a3;
  uint64_t v8 = CPLLibraryIdentifierSystemLibrary;
  id v9 = a5;
  id v10 = a4;
  LODWORD(v8) = [v7 isEqualToString:v8];
  v11 = objc_alloc(&OBJC_CLASS___CPLBGSTReschedulerManager);
  if ((_DWORD)v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[CPLBGSTReschedulerManager taskIdentifierForSystemLibrary]( &OBJC_CLASS___CPLBGSTReschedulerManager,  "taskIdentifierForSystemLibrary"));
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[CPLBGSTReschedulerManager groupNameForSystemLibrarySync]( &OBJC_CLASS___CPLBGSTReschedulerManager,  "groupNameForSystemLibrarySync"));
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[CPLBGSTReschedulerManager taskIdentifierForLibraryIdentifier:]( &OBJC_CLASS___CPLBGSTReschedulerManager,  "taskIdentifierForLibraryIdentifier:",  v7));
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[CPLBGSTReschedulerManager groupNameForAppLibrarySync]( &OBJC_CLASS___CPLBGSTReschedulerManager,  "groupNameForAppLibrarySync"));
  }

  v14 = (void *)v13;
  v15 = -[CPLBGSTReschedulerManager initWithTaskIdentifier:involvedProcesses:relatedApplications:groupName:]( v11,  "initWithTaskIdentifier:involvedProcesses:relatedApplications:groupName:",  v12,  v10,  v9,  v13);

  return v15;
}

+ (id)cloudKitReschedulerManagerForLibraryWithIdentifier:(id)a3 involvedProcesses:(id)a4 relatedApplications:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  v30 = sub_10002BB88;
  v31 = sub_10002BB98;
  id v32 = 0LL;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v19 = sub_10002BBA0;
  v20 = &unk_10023F0D0;
  id v12 = v9;
  SEL v25 = a2;
  id v26 = a1;
  id v21 = v12;
  v24 = &v27;
  id v13 = v10;
  id v22 = v13;
  id v14 = v11;
  id v23 = v14;
  v15 = v18;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100295FA0);
  v19((uint64_t)v15);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100295FA0);

  id v16 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v16;
}

+ (void)dropCloudKitReschedulerManagerForLibraryWithIdentifier:(id)a3
{
  v12[0] = 0LL;
  v12[1] = v12;
  v12[2] = 0x3032000000LL;
  v12[3] = sub_10002BB88;
  v12[4] = sub_10002BB98;
  id v13 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  id v7 = sub_10002BFA8;
  uint64_t v8 = &unk_10023F0F8;
  id v10 = v12;
  id v4 = a3;
  id v9 = v4;
  id v11 = a1;
  v5 = v6;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100295FA0);
  v7((uint64_t)v5);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100295FA0);

  _Block_object_dispose(v12, 8);
}

+ (void)beginRegisteringKnownReschedulerManager
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  id v4 = sub_10002C1CC;
  v5 = &unk_10023F118;
  SEL v6 = a2;
  id v7 = a1;
  v2 = v3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100295FA0);
  v4((uint64_t)v2);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100295FA0);
}

+ (void)endRegisteringKnownReschedulerManagers
{
  v8[0] = 0LL;
  v8[1] = v8;
  v8[2] = 0x2020000000LL;
  char v9 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  id v4 = sub_10002C2D8;
  v5 = &unk_10023F140;
  SEL v6 = v8;
  id v7 = a1;
  v2 = v3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100295FA0);
  v4((uint64_t)v2);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100295FA0);

  _Block_object_dispose(v8, 8);
}

@end