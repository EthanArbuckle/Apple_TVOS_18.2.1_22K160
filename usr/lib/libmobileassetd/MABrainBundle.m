@interface MABrainBundle
+ (BOOL)destageCurrent:(id *)a3;
+ (BOOL)destageProposed:(id *)a3;
+ (BOOL)stageProposed:(id)a3 error:(id *)a4;
+ (id)currentTargetPath;
+ (id)proposedTargetPath;
+ (void)garbageCollect;
- (BOOL)graft:(id *)a3;
- (BOOL)hasValidCurrentBootOnlyTicket;
- (BOOL)isGloballySigned;
- (BOOL)isGrafted;
- (BOOL)isGraftedPath:(id)a3;
- (BOOL)isPersonalized;
- (BOOL)personalize:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)stageCurrent:(id *)a3;
- (BOOL)ungraft:(id *)a3;
- (MABrainBundle)initWithPath:(id)a3;
- (NSDictionary)brainInfo;
- (NSString)brainPath;
- (NSString)bundleId;
- (NSString)bundlePath;
- (NSString)cryptexPath;
- (NSString)currentBootOnlyTicketPath;
- (NSString)graftPath;
- (NSString)primaryTicketPath;
- (NSString)rootHashPath;
- (NSString)ticketPath;
- (NSString)trustCachePath;
- (unsigned)graftdmgType;
@end

@implementation MABrainBundle

+ (id)currentTargetPath
{
  return _targetPath((uint64_t)@".current");
}

+ (id)proposedTargetPath
{
  return _targetPath((uint64_t)@".proposed");
}

+ (BOOL)destageCurrent:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain" stringByAppendingPathComponent:@".current"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MABrainBundle currentTargetPath](&OBJC_CLASS___MABrainBundle, "currentTargetPath"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v7 = [v6 removeItemAtPath:v4 error:a3];
  }

  else
  {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

+ (BOOL)destageProposed:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain" stringByAppendingPathComponent:@".proposed"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MABrainBundle proposedTargetPath](&OBJC_CLASS___MABrainBundle, "proposedTargetPath"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v7 = [v6 removeItemAtPath:v4 error:a3];
  }

  else
  {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

+ (BOOL)stageProposed:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain" stringByAppendingPathComponent:@".proposed"]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
  unsigned __int8 v7 = safeAtomicWriteToPath(v6, v5);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to write stagingName final path component(%@) to proposed path(%@)",  v8,  v5));

    id v10 = v9;
    id v11 = [v10 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"+[MABrainBundle stageProposed:error:]",  @"[MAB] %s",  v12,  v13,  v14,  v15,  (uint64_t)v11);
  }

  return v7;
}

+ (void)garbageCollect
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v2 fileExistsAtPath:@"/private/var/MobileAsset/MobileAssetBrain"])
  {
    id v29 = 0LL;
    unsigned int v3 = [v2 removeItemAtPath:@"/private/var/MobileAsset/MobileAssetBrain" error:&v29];
    id v4 = v29;
    if (v3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Successfully removed old MobileAssetBrain installation directory"));
      int v6 = 6;
    }

    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error removing old MobileAssetBrain installation directory: %@",  v4));
      int v6 = 3;
    }

    id v7 = v5;
    id v8 = [v7 UTF8String];
    _MobileAssetLog( 0LL,  v6,  (uint64_t)"+[MABrainBundle garbageCollect]",  @"[MAB] %s",  v9,  v10,  v11,  v12,  (uint64_t)v8);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_38FB50));
  id v14 = [v13 mutableCopy];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MABrainBundle currentTargetPath](&OBJC_CLASS___MABrainBundle, "currentTargetPath"));
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v15 lastPathComponent]);

  if (v16)
  {
    [v14 addObject:v16];
    v17 = v16;
  }

  else
  {
    v17 = @"nil";
  }

  id v18 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Performing MABrain garbage collection (current=%@)...", v17));
  id v19 = [v18 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"+[MABrainBundle garbageCollect]",  @"[MAB] %s",  v20,  v21,  v22,  v23,  (uint64_t)v19);

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = __31__MABrainBundle_garbageCollect__block_invoke;
  v26[3] = &unk_34F6D8;
  id v27 = v14;
  id v28 = v2;
  id v24 = v2;
  id v25 = v14;
  MABrainUtilityWalkDirectory(@"/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain", 0, v26);
}

uint64_t __31__MABrainBundle_garbageCollect__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain" stringByAppendingPathComponent:v3]);
  v5 = -[MABrainBundle initWithPath:](objc_alloc(&OBJC_CLASS___MABrainBundle), "initWithPath:", v4);
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
    int v6 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Preserving item %@", v3);
LABEL_5:
    id v7 = objc_claimAutoreleasedReturnValue(v6);
    id v8 = [v7 UTF8String];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"+[MABrainBundle garbageCollect]_block_invoke",  @"[MAB] %s",  v9,  v10,  v11,  v12,  (uint64_t)v8);
    goto LABEL_10;
  }

  if (-[MABrainBundle isGrafted](v5, "isGrafted"))
  {
    int v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Preserving item %@ (still grafted)",  v3);
    goto LABEL_5;
  }

  uint64_t v13 = *(void **)(a1 + 40);
  id v24 = 0LL;
  unsigned int v14 = [v13 removeItemAtPath:v4 error:&v24];
  id v7 = v24;
  if (v14) {
    uint64_t v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Successfully removed item %@",  v3,  v23);
  }
  else {
    uint64_t v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error removing item %@: %@",  v3,  v7);
  }
  id v16 = objc_claimAutoreleasedReturnValue(v15);
  id v17 = [v16 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"+[MABrainBundle garbageCollect]_block_invoke",  @"[MAB] %s",  v18,  v19,  v20,  v21,  (uint64_t)v17);

LABEL_10:
  return 1LL;
}

- (MABrainBundle)initWithPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MABrainBundle;
  int v6 = -[MABrainBundle init](&v9, "init");
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundlePath, a3);
  }

  return v7;
}

- (BOOL)personalize:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  AMAuthInstallLogSetHandler(_mabrainbundle_log);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", self->_bundlePath));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:@"Restore"]);
  v272 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v10));
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"ssoToken"]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"AuthInstallOptions"]);

  v285 = 0LL;
  v270 = v7;
  v271 = (void *)v9;
  v267 = (void *)v11;
  v268 = v8;
  if (&_AMAuthInstallSetUpdaterRequestEntry)
  {
    uint64_t v13 = (const void *)AMAuthInstallCreate(kCFAllocatorDefault);
    uint64_t v261 = objc_claimAutoreleasedReturnValue( +[SecureMobileAssetBundle getSigningServerURL:]( &OBJC_CLASS___SecureMobileAssetBundle,  "getSigningServerURL:",  @"com.apple.MobileAsset.MobileAssetBrain"));
    uint64_t v14 = AMAuthInstallSetSigningServerURL(v13, v261);
    if ((_DWORD)v14)
    {
      uint64_t v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AMAuthInstallSetSigningServerURL() failed with error %d (%@)",  v14,  AMAuthInstallGetLocalizedStatusString(v13, v14));
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      [v17 setObject:v16 forKeyedSubscript:NSDebugDescriptionErrorKey];
      [v17 setObject:0 forKeyedSubscript:NSUnderlyingErrorKey];
      id v269 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SecureMobileAssetErrorDomain",  102LL,  v17));

      char v262 = 0;
      uint64_t v18 = 0LL;
      uint64_t v19 = 0LL;
      uint64_t v20 = 0LL;
      uint64_t v21 = 0LL;
      uint64_t v22 = 0LL;
      uint64_t v23 = 0LL;
      id v264 = 0LL;
      v266 = 0LL;
      v273 = 0LL;
      id v24 = &__NSDictionary0__struct;
      if (!v13)
      {
LABEL_5:
        v26 = (void *)v261;
        id v27 = v264;
        goto LABEL_7;
      }

- (BOOL)isGrafted
{
  v2 = self;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MABrainBundle graftPath](self, "graftPath"));
  LOBYTE(v2) = -[MABrainBundle isGraftedPath:](v2, "isGraftedPath:", v3);

  return (char)v2;
}

- (BOOL)isGraftedPath:(id)a3
{
  v5[0] = 0LL;
  v5[1] = 0LL;
  if (fsctl( (const char *)objc_msgSend(a3, "fileSystemRepresentation", 0, 0), 0xC0104A66uLL, v5, 1u))
  {
    BOOL v3 = 1;
  }

  else
  {
    BOOL v3 = BYTE4(v5[0]) == 0;
  }

  return !v3;
}

- (BOOL)stageCurrent:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain" stringByAppendingPathComponent:@".current"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MABrainBundle bundleId](self, "bundleId"));
  unsigned __int8 v6 = safeAtomicWriteToPath(v5, v4);

  if ((v6 & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MABrainBundle bundleId](self, "bundleId"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to mark bundle(%@) as current brain.",  v7));

    id v9 = v8;
    id v10 = [v9 UTF8String];
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MABrainBundle stageCurrent:]",  @"[MAB] %s",  v11,  v12,  v13,  v14,  (uint64_t)v10);
  }

  return v6;
}

- (BOOL)graft:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[MABrainBundle graftPath](self, "graftPath"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MABrainBundle cryptexPath](self, "cryptexPath"));
  char v78 = 0;
  v76[0] = 0LL;
  v76[1] = 0LL;
  __int128 v119 = 0u;
  memset(v120, 0, sizeof(v120));
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  __int128 v115 = 0u;
  __int128 v116 = 0u;
  __int128 v113 = 0u;
  __int128 v114 = 0u;
  __int128 v111 = 0u;
  __int128 v112 = 0u;
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  __int128 v106 = 0u;
  __int128 v105 = 0u;
  __int128 v104 = 0u;
  __int128 v103 = 0u;
  __int128 v102 = 0u;
  __int128 v101 = 0u;
  __int128 v100 = 0u;
  __int128 v99 = 0u;
  __int128 v98 = 0u;
  __int128 v97 = 0u;
  __int128 v96 = 0u;
  __int128 v95 = 0u;
  __int128 v94 = 0u;
  __int128 v93 = 0u;
  __int128 v92 = 0u;
  __int128 v91 = 0u;
  __int128 v89 = xmmword_27EC70;
  int v90 = -1;
  v87[0] = NSFileOwnerAccountID;
  v87[1] = NSFileGroupOwnerAccountID;
  v88[0] = &off_38F040;
  v88[1] = &off_38F040;
  v87[2] = NSFilePosixPermissions;
  v88[2] = &off_38F058;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v88,  v87,  3LL));
  if (!v6)
  {
    NSErrorUserInfoKey v85 = NSDebugDescriptionErrorKey;
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"graftPath is nil"));
    id v86 = v11;
    uint64_t v12 = &v86;
    uint64_t v13 = &v85;
LABEL_7:
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v13,  1LL));
    uint64_t v15 = 100LL;
    id v16 = v14;
LABEL_8:
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileAssetBrainErrorDomain",  v15,  v16));

LABEL_9:
    BOOL v10 = 0;
    goto LABEL_10;
  }

  if (!v7)
  {
    NSErrorUserInfoKey v83 = NSDebugDescriptionErrorKey;
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"cryptexPath is nil"));
    id v84 = v11;
    uint64_t v12 = &v84;
    uint64_t v13 = &v83;
    goto LABEL_7;
  }

  if (-[MABrainBundle isGraftedPath:](self, "isGraftedPath:", v6))
  {
    id v9 = 0LL;
    BOOL v10 = 1;
    goto LABEL_13;
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v19 = [v18 fileExistsAtPath:v6 isDirectory:&v78];

  uint64_t v72 = v5;
  if ((v19 & 1) == 0)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v75 = 0LL;
    unsigned __int8 v21 = [v20 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:v8 error:&v75];
    id v9 = v75;

    if ((v21 & 1) != 0)
    {
LABEL_18:
      id v5 = v72;
LABEL_19:
      id v22 = v6;
      if (lstat((const char *)[v22 fileSystemRepresentation], &v77))
      {
        id v23 = v22;
        id v24 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"Could not lstat %s", [v23 fileSystemRepresentation]));
        id v25 = [v24 UTF8String];
        _MobileAssetLog(0LL, 3, (uint64_t)"-[MABrainBundle graft:]", @"[MAB] %s", v26, v27, v28, v29, (uint64_t)v25);

        id v5 = v72;
        v30 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v30);

        v81[0] = NSDebugDescriptionErrorKey;
        v81[1] = NSUnderlyingErrorKey;
        v82[0] = @"lstat failed";
        v82[1] = v14;
        v81[2] = @"graftPath";
        v82[2] = v23;
        id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v82,  v81,  3LL));
        uint64_t v15 = 104LL;
        id v16 = v11;
        goto LABEL_8;
      }

      if (-[MABrainBundle isPersonalized](self, "isPersonalized")
        || -[MABrainBundle isGloballySigned](self, "isGloballySigned"))
      {
        id v70 = v22;
        id v31 = objc_claimAutoreleasedReturnValue(-[MABrainBundle cryptexPath](self, "cryptexPath"));
        int v32 = open((const char *)[v31 fileSystemRepresentation], 0);

        unsigned int v69 = v32;
        if (v32 < 0)
        {
          [v5 setObject:@"open()" forKeyedSubscript:@"syscall"];
          int v49 = (void *)objc_claimAutoreleasedReturnValue(-[MABrainBundle cryptexPath](self, "cryptexPath"));
          [v5 setObject:v49 forKeyedSubscript:@"path"];

          id v22 = v70;
LABEL_43:
          id v71 = v7;
          id v51 = [v71 fileSystemRepresentation];
          id v52 = v22;
          id v53 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"Could not graft %s to %s", v51, [v52 fileSystemRepresentation]));
          id v54 = [v53 UTF8String];
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MABrainBundle graft:]",  @"[MAB] %s",  v55,  v56,  v57,  v58,  (uint64_t)v54);

          uint64_t v59 = *__error();
          if ([v72 count]) {
            CFNumberRef v60 = v72;
          }
          else {
            CFNumberRef v60 = 0LL;
          }
          CFNumberRef v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v59,  v60));

          v79[0] = NSDebugDescriptionErrorKey;
          v79[1] = NSUnderlyingErrorKey;
          v80[0] = @"graft failed";
          v80[1] = v61;
          v79[2] = @"cryptexPath";
          v79[3] = @"graftPath";
          v80[2] = v71;
          v80[3] = v52;
          id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v80,  v79,  4LL));
          id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileAssetBrainErrorDomain",  104LL,  v11));

          id v5 = v72;
          goto LABEL_9;
        }

        id v33 = objc_claimAutoreleasedReturnValue(-[MABrainBundle ticketPath](self, "ticketPath"));
        int v68 = open((const char *)[v33 fileSystemRepresentation], 0);
        if (v68 < 0)
        {
          [v5 setObject:@"open()" forKeyedSubscript:@"syscall"];
          [v5 setObject:v33 forKeyedSubscript:@"path"];
          int v43 = -1;
          int v42 = v32;
          id v22 = v70;
        }

        else
        {
          id v67 = v33;
          id v34 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Found MA brain ticket: %@", v33));
          id v35 = [v34 UTF8String];
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MABrainBundle graft:]",  @"[MAB] %s",  v36,  v37,  v38,  v39,  (uint64_t)v35);

          id v40 = objc_claimAutoreleasedReturnValue(-[MABrainBundle rootHashPath](self, "rootHashPath"));
          int v41 = open((const char *)[v40 fileSystemRepresentation], 0);

          id v22 = v70;
          if (v41 < 0)
          {
            id v5 = v72;
            [v72 setObject:@"open()" forKeyedSubscript:@"syscall"];
            id v50 = (void *)objc_claimAutoreleasedReturnValue(-[MABrainBundle rootHashPath](self, "rootHashPath"));
            [v72 setObject:v50 forKeyedSubscript:@"path"];

            int v43 = -1;
            int v42 = v69;
          }

          else
          {
            DWORD2(v89) = v68;
            int v90 = v41;
            *(void *)&__int128 v91 = 16LL;
            int v42 = v69;
            int v43 = graftdmg( v69, [v70 fileSystemRepresentation], -[MABrainBundle graftdmgType](self, "graftdmgType"), &v89);
            id v5 = v72;
            if (v43)
            {
              [v72 setObject:@"graftdmg()" forKeyedSubscript:@"syscall"];
              [v72 setObject:v67 forKeyedSubscript:@"path"];
            }

            close(v41);
          }

          close(v68);
          id v33 = v67;
        }

        close(v42);
      }

      else
      {
        v76[0] = v77.st_ino;
        int v43 = fsctl( (const char *)[v7 fileSystemRepresentation], 0x80104A63uLL, v76, 0);
      }

      if (!v43)
      {
        id v11 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Successfully grafted %@ onto %@", v7, v22));
        id v62 = [v11 UTF8String];
        _MobileAssetLog(0LL, 6, (uint64_t)"-[MABrainBundle graft:]", @"[MAB] %s", v63, v64, v65, v66, (uint64_t)v62);
        BOOL v10 = 1;
LABEL_10:

        if (!a3) {
          goto LABEL_13;
        }
        goto LABEL_11;
      }

      goto LABEL_43;
    }

    goto LABEL_32;
  }

  if (v78)
  {
    id v9 = 0LL;
    goto LABEL_19;
  }

  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v74 = 0LL;
  unsigned int v45 = [v44 removeItemAtPath:v6 error:&v74];
  id v9 = v74;

  if (!v45)
  {
LABEL_32:
    BOOL v10 = 0;
    goto LABEL_33;
  }

  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v73 = v9;
  unsigned int v47 = [v46 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:v8 error:&v73];
  id v48 = v73;

  if (v47)
  {
    id v9 = v48;
    goto LABEL_18;
  }

  BOOL v10 = 0;
  id v9 = v48;
LABEL_33:
  id v5 = v72;
  if (!a3) {
    goto LABEL_13;
  }
LABEL_11:
  if (v9)
  {
    id v9 = v9;
    *a3 = v9;
  }

- (BOOL)ungraft:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[MABrainBundle graftPath](self, "graftPath"));
  uint64_t v33 = 0LL;
  if (v6)
  {
    if (-[MABrainBundle isGraftedPath:](self, "isGraftedPath:", v6))
    {
      id v7 = v6;
      id v8 = (const char *)[v7 fileSystemRepresentation];
      if (&_ungraftdmg)
      {
        int v9 = ungraftdmg(v8, 0LL);
        BOOL v10 = @"ungraftdmg()";
      }

      else
      {
        int v9 = fsctl(v8, 0x80084A64uLL, &v33, 0);
        BOOL v10 = @"fsctl()";
      }

      if (v9)
      {
        id v15 = v7;
        id v16 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"Could not ungraft %s", [v15 fileSystemRepresentation]));
        id v17 = [v16 UTF8String];
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MABrainBundle ungraft:]",  @"[MAB] %s",  v18,  v19,  v20,  v21,  (uint64_t)v17);

        [v5 setObject:v10 forKeyedSubscript:@"syscall"];
        uint64_t v22 = *__error();
        if ([v5 count]) {
          id v23 = v5;
        }
        else {
          id v23 = 0LL;
        }
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v22,  v23));
        v34[0] = NSDebugDescriptionErrorKey;
        v34[1] = NSUnderlyingErrorKey;
        v35[0] = @"ungraft failed";
        v35[1] = v12;
        v34[2] = @"graftPath";
        v35[2] = v15;
        id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  3LL));
        uint64_t v13 = 105LL;
        uint64_t v14 = v11;
        goto LABEL_12;
      }

      id v26 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Successfully ungrafted %@ from the file system using %@", v7, v10, v33));
      id v27 = [v26 UTF8String];
      _MobileAssetLog(0LL, 6, (uint64_t)"-[MABrainBundle ungraft:]", @"[MAB] %s", v28, v29, v30, v31, (uint64_t)v27);
    }

    id v24 = 0LL;
    BOOL v25 = 1;
    goto LABEL_17;
  }

  NSErrorUserInfoKey v36 = NSDebugDescriptionErrorKey;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"graftPath is nil"));
  uint64_t v37 = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
  uint64_t v13 = 100LL;
  uint64_t v14 = v12;
LABEL_12:
  id v24 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileAssetBrainErrorDomain",  v13,  v14));

  BOOL v25 = 0;
  if (a3 && v24)
  {
    id v24 = v24;
    BOOL v25 = 0;
    *a3 = v24;
  }

- (BOOL)isPersonalized
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MABrainBundle ticketPath](self, "ticketPath"));
  unsigned __int8 v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)isGloballySigned
{
  return 0;
}

- (BOOL)hasValidCurrentBootOnlyTicket
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MABrainBundle currentBootOnlyTicketPath](self, "currentBootOnlyTicketPath"));
  if (v2)
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v4 = [v3 fileExistsAtPath:v2];
  }

  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (NSString)bundleId
{
  return -[NSString lastPathComponent](self->_bundlePath, "lastPathComponent");
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (NSString)graftPath
{
  return -[NSString stringByAppendingPathComponent:]( self->_bundlePath,  "stringByAppendingPathComponent:",  @".graft");
}

- (NSString)cryptexPath
{
  return -[NSString stringByAppendingPathComponent:]( self->_bundlePath,  "stringByAppendingPathComponent:",  @"MobileAssetBrain.cryptex");
}

- (NSString)ticketPath
{
  if (-[MABrainBundle hasValidCurrentBootOnlyTicket](self, "hasValidCurrentBootOnlyTicket")) {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MABrainBundle currentBootOnlyTicketPath](self, "currentBootOnlyTicketPath"));
  }
  else {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MABrainBundle primaryTicketPath](self, "primaryTicketPath"));
  }
  return (NSString *)v3;
}

- (NSString)primaryTicketPath
{
  return -[NSString stringByAppendingPathComponent:]( self->_bundlePath,  "stringByAppendingPathComponent:",  @"cryptex1ticket.der");
}

- (NSString)currentBootOnlyTicketPath
{
  bundlePath = self->_bundlePath;
  id v3 = MABrainUtilityBootSessionUUID();
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"cryptex1ticket.%@.der",  v4));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](bundlePath, "stringByAppendingPathComponent:", v5));

  return (NSString *)v6;
}

- (unsigned)graftdmgType
{
  unsigned int v2 = -[MABrainBundle hasValidCurrentBootOnlyTicket](self, "hasValidCurrentBootOnlyTicket");
  if (v2) {
    id v3 = @"Using GRAFTDMG_CRYPTEX_PDI_NONCE";
  }
  else {
    id v3 = @"Using GRAFTDMG_CRYPTEX_BOOT";
  }
  if (v2) {
    unsigned int v4 = 6;
  }
  else {
    unsigned int v4 = 1;
  }
  id v5 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v3));
  id v6 = [v5 UTF8String];
  _MobileAssetLog(0LL, 6, (uint64_t)"-[MABrainBundle graftdmgType]", @"[MAB] %s", v7, v8, v9, v10, (uint64_t)v6);

  return v4;
}

- (NSString)rootHashPath
{
  return -[NSString stringByAppendingPathComponent:]( self->_bundlePath,  "stringByAppendingPathComponent:",  @"mobileassetbrain_root_hash");
}

- (NSString)trustCachePath
{
  return -[NSString stringByAppendingPathComponent:]( self->_bundlePath,  "stringByAppendingPathComponent:",  @"MobileAssetTrustCache");
}

- (NSString)brainPath
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(-[MABrainBundle graftPath](self, "graftPath"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"/usr/lib/libmobileassetd.dylib"]);

  return (NSString *)v3;
}

- (NSDictionary)brainInfo
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( self->_bundlePath,  "stringByAppendingPathComponent:",  @"MobileAssetBrain.plist"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v2));

  return (NSDictionary *)v3;
}

- (void).cxx_destruct
{
}

@end