uint64_t sub_1000045E8(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v16;
  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if (v4)
  {
    if (v3)
    {
      v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0
        || (v7 = objc_opt_class(&OBJC_CLASS___NSData), (objc_opt_isKindOfClass(v3, v7) & 1) != 0)
        || (v8 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v3, v8) & 1) != 0))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByDeletingLastPathComponent]);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:v11]);

        if ([v3 writeToFile:v12 atomically:0]
          && !rename( (const char *)[v12 fileSystemRepresentation], (const char *)objc_msgSend(v4, "fileSystemRepresentation")))
        {
          v14 = 1LL;
          goto LABEL_16;
        }

        NSLog(@"%s: Failed to write item to path %@", "safeAtomicWriteToPath", v4);
        if ([v5 fileExistsAtPath:v12 isDirectory:0])
        {
          v16 = 0LL;
          [v5 removeItemAtPath:v12 error:&v16];
          v13 = v16;
          v14 = (uint64_t)v13;
          if (!v13)
          {
LABEL_16:

            goto LABEL_17;
          }

          NSLog( @"%s: Atomic write to path failed and failed to remove temp path(%@): %@",  "safeAtomicWriteToPath",  v12,  v13);
        }

        v14 = 0LL;
        goto LABEL_16;
      }
    }

    NSLog(@"Invalid data passed to %s", "safeAtomicWriteToPath");
  }

  else
  {
    NSLog(@"Invalid path passed to %s", "safeAtomicWriteToPath");
  }

  v14 = 0LL;
LABEL_17:

  return v14;
}

BOOL sub_1000047F4(void *a1, char a2, void *a3)
{
  id v5 = a1;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 enumeratorAtPath:v5]);

  if (v8)
  {
    v9 = objc_autoreleasePoolPush();
    v10 = 0LL;
    while (1)
    {
      v11 = v10;
      v10 = (void *)objc_claimAutoreleasedReturnValue([v8 nextObject]);

      if (!v10) {
        break;
      }
      if ((a2 & 1) == 0) {
        [v8 skipDescendants];
      }
      if ((v6[2](v6, v10) & 1) == 0)
      {
        id v12 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Caller canceled enumeration"));
        NSLog(@"[MAB] %s", [v12 UTF8String]);

        break;
      }
    }

    objc_autoreleasePoolPop(v9);
  }

  else
  {
    id v13 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Could not create directory enumerator for %@", v5));
    NSLog(@"[MAB] %s", [v13 UTF8String]);
  }

  return v8 != 0LL;
}

uint64_t sub_100004954()
{
  uint64_t result = os_variant_has_internal_content("com.apple.mobileassetd");
  if ((_DWORD)result) {
    return sub_100004F8C(@"MABrainAllowUnpersonalized", 0LL) != 0;
  }
  return result;
}

BOOL sub_10000498C()
{
  char v3 = 0;
  unsigned int v0 = sub_100004F8C(@"MABrainAllowDownloaded", &v3);
  if (v3) {
    BOOL v1 = v0 == 0;
  }
  else {
    BOOL v1 = 0;
  }
  return !v1;
}

uint64_t sub_1000049E0()
{
  uint64_t result = os_variant_has_internal_content("com.apple.mobileassetd");
  if ((_DWORD)result) {
    return sub_100004F8C(@"MABrainAllowCrossBuildGroup", 0LL) != 0;
  }
  return result;
}

uint64_t sub_100004A18()
{
  uint64_t result = os_variant_has_internal_content("com.apple.mobileassetd");
  if ((_DWORD)result) {
    return sub_100004F8C(@"MABrainDisableHealthCheck", 0LL) != 0;
  }
  return result;
}

id sub_100004A50()
{
  unsigned int v0 = _NSGetMachExecuteHeader();
  uint64_t ncmds = v0->ncmds;
  if ((_DWORD)ncmds)
  {
    v2 = v0;
    uint64_t v3 = 0LL;
    uint64_t v4 = 32LL;
    while (1)
    {
      id v5 = (const unsigned __int8 *)v0 + v4;
      v4 += *((unsigned int *)v5 + 1);
      if (ncmds == ++v3) {
        goto LABEL_9;
      }
    }

    uuid_copy(dst, v5 + 8);
    uint64_t v6 = v2->ncmds;
  }

  else
  {
    uint64_t v6 = 0LL;
    uint64_t v3 = 0LL;
  }

  if (v3 == v6) {
LABEL_9:
  }
    uuid_clear(dst);
  uuid_unparse_lower(dst, out);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  out,  1LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByReplacingOccurrencesOfString:@"-" withString:&stru_10000C5D8]);

  return v8;
}

id sub_100004B54()
{
  size_t __size = 0LL;
  if (sysctlbyname("kern.bootsessionuuid", 0LL, &__size, 0LL, 0LL))
  {
    uint64_t v0 = *__error();
    BOOL v1 = __error();
    uint64_t v13 = v0;
    v14 = strerror(*v1);
    v2 = @"Could not look up boot session UUID: %d (%s)";
LABEL_3:
    uint64_t v3 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v2, v13, v14);
LABEL_4:
    id v4 = objc_claimAutoreleasedReturnValue(v3);
    NSLog(@"[MAB] %s", [v4 UTF8String]);

    id v5 = 0LL;
    return v5;
  }

  if (!__size)
  {
    uint64_t v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Boot session UUID has an invalid length (%zu)",  0LL,  v14);
    goto LABEL_4;
  }

  v7 = malloc(__size);
  if (!v7)
  {
    v2 = @"Could not allocate buffer to copy boot session UUID";
    goto LABEL_3;
  }

  v8 = v7;
  if (sysctlbyname("kern.bootsessionuuid", v7, &__size, 0LL, 0LL))
  {
    uint64_t v9 = *__error();
    v10 = __error();
    v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Could not copy boot session UUID: %d (%s)",  v9,  strerror(*v10));
    id v12 = objc_claimAutoreleasedReturnValue(v11);
    NSLog(@"[MAB] %s", [v12 UTF8String]);

    id v5 = 0LL;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v8,  4LL));
  }

  free(v8);
  return v5;
}

uint64_t sub_100004CDC()
{
  v2[0] = kMKBUserSessionIDKey;
  v2[1] = @"ExtendedDeviceLockState";
  v3[0] = &off_10000D718;
  v3[1] = &__kCFBooleanTrue;
  unsigned int v0 = MKBGetDeviceLockState( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v3,  v2,  2LL));
  return (v0 < 7) & (0x46u >> v0);
}

id sub_100004D7C()
{
  if (qword_1000105E8 != -1) {
    dispatch_once(&qword_1000105E8, &stru_10000C330);
  }
  return (id)qword_1000105E0;
}

void sub_100004DBC(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.MobileAsset.preferencesDomain", 0LL);
  v2 = (void *)qword_1000105E0;
  qword_1000105E0 = (uint64_t)v1;
}

id sub_100004DE8(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v18 = 0LL;
    v19 = &v18;
    uint64_t v20 = 0x3032000000LL;
    v21 = sub_100004F38;
    v22 = sub_100004F48;
    id v23 = 0LL;
    id v2 = sub_100004D7C();
    uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v2);
    block = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472LL;
    v14 = sub_100004F50;
    v15 = &unk_10000C358;
    id v4 = v1;
    id v16 = v4;
    v17 = &v18;
    dispatch_sync(v3, &block);

    id v5 = (void *)v19[5];
    if (v5)
    {
      id v6 = v5;
      v7 = (objc_class *)objc_opt_class(v6);
      v8 = NSStringFromClass(v7);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    }

    id v10 = v5;

    _Block_object_dispose(&v18, 8);
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

void sub_100004F20( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_100004F38(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100004F48(uint64_t a1)
{
}

void sub_100004F50(uint64_t a1)
{
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(*(CFStringRef *)(a1 + 32), @"com.apple.MobileAsset");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_100004F8C(void *a1, _BYTE *a2)
{
  id v3 = sub_100004DE8(a1);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char isKindOfClass = objc_opt_isKindOfClass(v4, v5);
    char v7 = isKindOfClass ^ 1;
    char v8 = isKindOfClass & 1;
    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  char v8 = 0;
  char v7 = 1;
  if (a2) {
LABEL_3:
  }
    *a2 = v8;
LABEL_4:
  if ((v7 & 1) != 0) {
    id v9 = 0LL;
  }
  else {
    id v9 = [v4 BOOLValue];
  }

  return v9;
}

id start(uint64_t a1, uint64_t a2)
{
  id v4 = objc_autoreleasePoolPush();
  NSLog(@"Starting mobileassetd built Nov 10 2024 01:26:07");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MABrainLoader sharedInstance](&OBJC_CLASS___MABrainLoader, "sharedInstance"));
  id v6 = [v5 run:a1 argv:a2];

  objc_autoreleasePoolPop(v4);
  return v6;
}

id sub_10000508C(uint64_t a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain" stringByAppendingPathComponent:a1]);
  CFPropertyListRef v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v3 = [v2 fileExistsAtPath:v1];

  if (!v3)
  {
    id v7 = 0LL;
    id v4 = 0LL;
    goto LABEL_5;
  }

  id v14 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  v1,  4LL,  &v14));
  id v5 = v14;
  if (v5)
  {
    id v6 = v5;
    id v7 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Error loading contents of %@: %@", v1, v5));
    NSLog(@"[MAB] %s", [v7 UTF8String]);
LABEL_14:

    id v7 = 0LL;
    goto LABEL_15;
  }

  if (![v4 length])
  {
    id v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid target path at %@",  v1);
LABEL_12:
    id v7 = objc_claimAutoreleasedReturnValue(v12);
    NSLog(@"[MAB] %s", [v7 UTF8String]);
    goto LABEL_13;
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue( [@"/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain" stringByAppendingPathComponent:v4]);
  if (!v8)
  {
    id v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Allocating targetPath failed for target %@",  v4);
    goto LABEL_12;
  }

  id v7 = (id)v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v10 = [v9 fileExistsAtPath:v7];

  if ((v10 & 1) == 0)
  {
    id v11 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@ does not exist", v7));
    NSLog(@"[MAB] %s", [v11 UTF8String]);

LABEL_13:
    id v6 = 0LL;
    goto LABEL_14;
  }

LABEL_5:
  id v6 = 0LL;
LABEL_15:

  return v7;
}

uint64_t sub_100005658(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain" stringByAppendingPathComponent:v3]);
  id v5 = -[__MABuiltinBrainBundle__ initWithPath:]( objc_alloc(&OBJC_CLASS_____MABuiltinBrainBundle__),  "initWithPath:",  v4);
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
    id v6 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Preserving item %@", v3);
LABEL_5:
    id v7 = objc_claimAutoreleasedReturnValue(v6);
    NSLog(@"[MAB] %s", [v7 UTF8String]);
    goto LABEL_10;
  }

  if (-[__MABuiltinBrainBundle__ isGrafted](v5, "isGrafted"))
  {
    id v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Preserving item %@ (still grafted)",  v3);
    goto LABEL_5;
  }

  uint64_t v8 = *(void **)(a1 + 40);
  id v14 = 0LL;
  unsigned int v9 = [v8 removeItemAtPath:v4 error:&v14];
  id v7 = v14;
  if (v9) {
    unsigned __int8 v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Successfully removed item %@",  v3,  v13);
  }
  else {
    unsigned __int8 v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error removing item %@: %@",  v3,  v7);
  }
  id v11 = objc_claimAutoreleasedReturnValue(v10);
  NSLog(@"[MAB] %s", [v11 UTF8String]);

LABEL_10:
  return 1LL;
}

LABEL_13:
  return v10;
}

LABEL_17:
  return v20;
}

void sub_1000068C4(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___MABrainLoader);
  CFPropertyListRef v2 = (void *)qword_1000105F0;
  qword_1000105F0 = (uint64_t)v1;
}

LABEL_29:
  return (char)v8;
}

void sub_100006F00(uint64_t a1)
{
  if (lstat( (const char *)[@"/private/var/run/com.apple.mobileassetd-MobileAssetBrain" fileSystemRepresentation],  &v17))
  {
    if (*__error() == 2)
    {
      CFPropertyListRef v2 = @"mobileassetd has no launch history; possible first launch since boot.";
    }

    else
    {
      unsigned __int8 v10 = __error();
      v15 = strerror(*v10);
      CFPropertyListRef v2 = @"Error reading mobileassetd launch history file metadata: %s";
    }

    goto LABEL_9;
  }

  if (v17.st_size > 0x10000)
  {
    CFPropertyListRef v2 = @"mobileassetd launch history file is too large; disregarding.";
LABEL_9:
    id v3 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", v2, v15));
    NSLog(@"[MAB] %s", [v3 UTF8String]);
    goto LABEL_10;
  }

  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/private/var/run/com.apple.mobileassetd-MobileAssetBrain"));
  id v16 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v3,  &v16));
  id v5 = v16;
  id v6 = [v4 mutableCopy];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 8);
  *(void *)(v7 + _Block_object_dispose(va, 8) = v6;

  if (v5) {
    unsigned int v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Could not load mobileassetd launch history: %@",  v5);
  }
  else {
    unsigned int v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"mobileassetd launch history successfully loaded",  v15);
  }
  id v14 = objc_claimAutoreleasedReturnValue(v9);
  NSLog(@"[MAB] %s", [v14 UTF8String]);

LABEL_10:
  if (!*(void *)(*(void *)(a1 + 32) + 8LL))
  {
    id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(v12 + 8);
    *(void *)(v12 + _Block_object_dispose(va, 8) = v11;
  }
}

void sub_100007D34(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"bundleId"]);
  [v1 recordLaunch:v2];
}

void sub_100007DBC(id a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "$SIDEBUILD_PARENT_TRAIN"));
  if ([v1 isEqualToString:&stru_10000C5D8])
  {
  }

  else
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "$SIDEBUILD_PARENT_TRAIN"));
    unsigned __int8 v3 = [v2 isEqualToString:@"$SIDEBUILD_PARENT_TRAIN"];

    if ((v3 & 1) == 0)
    {
      qword_100010618 = (uint64_t)"$SIDEBUILD_PARENT_TRAIN";
      return;
    }
  }

  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", "SapphireC"));
  if ([v6 isEqualToString:&stru_10000C5D8])
  {
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", "SapphireC"));
    unsigned __int8 v5 = [v4 isEqualToString:@"$RC_RELEASE"];

    if ((v5 & 1) == 0) {
      qword_100010618 = (uint64_t)"SapphireC";
    }
  }

void sub_1000086CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39)
{
}

uint64_t sub_100008750(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100008760(uint64_t a1)
{
}

uint64_t sub_100008768(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  unsigned int v9 = v8;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
  if (!v8)
  {
    id v10 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@ MobileAssetBrain not found", v7));
    NSLog(@"[MAB] %s", [v10 UTF8String]);
LABEL_24:
    uint64_t v26 = 0LL;
    goto LABEL_25;
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
  id v11 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@ MobileAssetBrain found in bundle %@", v7, v10));
  NSLog(@"[MAB] %s", [v11 UTF8String]);

  uint64_t v12 = -[__MABuiltinBrainBundle__ initWithPath:]( objc_alloc(&OBJC_CLASS_____MABuiltinBrainBundle__),  "initWithPath:",  v9);
  uint64_t v13 = v12;
  if (!v12)
  {
    stat v17 = (NSDictionary *) objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Allocating bundle failed for %@", v9));
    NSLog(@"[MAB] %s", -[NSDictionary UTF8String](v17, "UTF8String"));
LABEL_23:

    goto LABEL_24;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[__MABuiltinBrainBundle__ brainInfo](v12, "brainInfo"));
  v15 = v14;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
  }
  stat v17 = v16;

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", @"boot-session-uuid"));
  v19 = *(void **)(a1 + 32);
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)
    && !-[__MABuiltinBrainBundle__ hasValidCurrentBootOnlyTicket](v13, "hasValidCurrentBootOnlyTicket"))
  {
LABEL_22:

    goto LABEL_23;
  }

  if (![*(id *)(a1 + 40) loadCryptex:*(unsigned __int8 *)(a1 + 80) bundle:v13 bundleName:v10])
  {
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)) {
      goto LABEL_22;
    }
    v27 = @"MobileAssetBrain bundle/cryptex %@ could not be loaded";
LABEL_21:
    id v28 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", v27, v10));
    NSLog(@"[MAB] %s", [v28 UTF8String]);

    goto LABEL_22;
  }

  if (![*(id *)(a1 + 40) verify:v13])
  {
    v27 = @"MobileAssetBrain bundle %@ could not be verified";
    goto LABEL_21;
  }

  if (![*(id *)(a1 + 40) loadTrustCache:*(unsigned __int8 *)(a1 + 80) bundle:v13 bundleName:v10 needsUnlock:a4]) {
    goto LABEL_22;
  }
  id v20 = objc_claimAutoreleasedReturnValue(-[__MABuiltinBrainBundle__ brainPath](v13, "brainPath"));
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v20 fileSystemRepresentation];

  id v21 = -[NSDictionary mutableCopy](v17, "mutableCopy");
  [v21 setObject:v10 forKeyedSubscript:@"bundleId"];
  [v21 setObject:v9 forKeyedSubscript:@"bundlePath"];
  [v21 setObject:&off_10000D760 forKeyedSubscript:@"_CompatibilityVersion"];
  [v21 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"mobileassetd-uuid"];
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%s",  [*(id *)(a1 + 40) getTrainName]));
  [v21 setObject:v22 forKeyedSubscript:@"mobileassetd-trainname"];

  [v21 removeObjectForKey:@"boot-session-uuid"];
  uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v21));
  uint64_t v24 = *(void *)(*(void *)(a1 + 72) + 8LL);
  v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;

  uint64_t v26 = 1LL;
LABEL_25:

  return v26;
}

uint64_t amfi_load_trust_cache(char a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  v8[0] = 0xAAAAAAAAAAAAAAAALL;
  int v10 = -1431655766;
  int v13 = -1431655766;
  LOBYTE(v8[0]) = a1;
  v8[1] = a2;
  int v9 = a3;
  uint64_t v11 = a4;
  int v12 = a5;
  uint64_t v14 = a6;
  int v16 = -1431655766;
  int v15 = a7;
  return __sandbox_ms("AMFI", 101LL, v8);
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}