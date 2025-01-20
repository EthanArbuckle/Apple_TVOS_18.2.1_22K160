@interface MIIPAPatcherManifest
+ (id)_arrayFromPlistRepresentation:(id)a3 key:(id)a4 sub:(id)a5 index:(unint64_t)a6 withError:(id *)a7;
+ (id)_manifestErrorForKey:(id)a3 sub:(id)a4 index:(int64_t)a5 expected:(id)a6 value:(id)a7;
+ (id)_manifestFromPlistRepresentationV1:(id)a3 withError:(id *)a4;
+ (id)_numberFromPlistRepresentation:(id)a3 key:(id)a4 sub:(id)a5 index:(unint64_t)a6 withError:(id *)a7;
+ (id)_stringFromPlistRepresentation:(id)a3 key:(id)a4 sub:(id)a5 index:(unint64_t)a6 withError:(id *)a7;
+ (id)_targetsFromPlistRepresentationV1:(id)a3 withError:(id *)a4;
+ (id)manifestFromFileURL:(id)a3 fmRead:(id)a4 withError:(id *)a5;
+ (id)manifestFromFileURL:(id)a3 withError:(id *)a4;
+ (id)manifestFromPlistRepresentation:(id)a3 withError:(id *)a4;
- (BOOL)writeToFileURL:(id)a3 withError:(id *)a4;
- (MIIPAPatcherManifest)initWithCommandLineArgs:(id)a3 targets:(id)a4 toolVersion:(id)a5 toolArch:(id)a6 toolBuiltWithSDKVersion:(id)a7 toolBuiltWithXcodeVersion:(id)a8 hostVersion:(id)a9;
- (MIIPAPatcherWriteable)fmWrite;
- (NSArray)commandLineArgs;
- (NSArray)targets;
- (NSNumber)manifestVersion;
- (NSString)hostVersion;
- (NSString)toolArch;
- (NSString)toolBuiltWithSDKVersion;
- (NSString)toolBuiltWithXcodeVersion;
- (NSString)toolVersion;
- (id)plistRepresentation;
- (void)setFmWrite:(id)a3;
@end

@implementation MIIPAPatcherManifest

- (MIIPAPatcherManifest)initWithCommandLineArgs:(id)a3 targets:(id)a4 toolVersion:(id)a5 toolArch:(id)a6 toolBuiltWithSDKVersion:(id)a7 toolBuiltWithXcodeVersion:(id)a8 hostVersion:(id)a9
{
  id v26 = a3;
  id v25 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v16 = a8;
  id v17 = a9;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___MIIPAPatcherManifest;
  v18 = -[MIIPAPatcherManifest init](&v27, "init");
  if (v18)
  {
    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[MIIPAPatcherFileManager defaultManager](&OBJC_CLASS___MIIPAPatcherFileManager, "defaultManager"));
    fmWrite = v18->_fmWrite;
    v18->_fmWrite = (MIIPAPatcherWriteable *)v19;

    objc_storeStrong((id *)&v18->_manifestVersion, (id)qword_100095AB0);
    objc_storeStrong((id *)&v18->_commandLineArgs, a3);
    objc_storeStrong((id *)&v18->_targets, a4);
    objc_storeStrong((id *)&v18->_toolVersion, a5);
    objc_storeStrong((id *)&v18->_toolArch, a6);
    objc_storeStrong((id *)&v18->_toolBuiltWithSDKVersion, a7);
    objc_storeStrong((id *)&v18->_toolBuiltWithXcodeVersion, a8);
    objc_storeStrong((id *)&v18->_hostVersion, a9);
  }

  return v18;
}

+ (id)manifestFromPlistRepresentation:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  objc_opt_class(&OBJC_CLASS___NSDictionary);
  id v7 = v6;
  if ((objc_opt_isKindOfClass(v7) & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0LL;
  }

  if (v8)
  {
    id v19 = 0LL;
    v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _manifestFromPlistRepresentationV1:v7 withError:&v19]);
    id v10 = v19;
    if (!a4) {
      goto LABEL_10;
    }
  }

  else
  {
    v20[0] = NSLocalizedDescriptionKey;
    v11 = objc_alloc(&OBJC_CLASS___NSString);
    v12 = (objc_class *)objc_opt_class(v7);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = -[NSString initWithFormat:]( v11,  "initWithFormat:",  @"Invalid manifest, expected NSDictionary, got [%@]",  v14);
    v21[0] = v15;
    v21[1] = &off_10008A0F8;
    v20[1] = @"line";
    v20[2] = @"function";
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "+[MIIPAPatcherManifest manifestFromPlistRepresentation:withError:]"));
    v21[2] = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  3LL));
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.MIIPAPatcher",  7LL,  v17));

    v9 = 0LL;
    if (!a4) {
      goto LABEL_10;
    }
  }

  if (!v9) {
    *a4 = v10;
  }
LABEL_10:

  return v9;
}

+ (id)manifestFromFileURL:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIIPAPatcherFileManager defaultManager](&OBJC_CLASS___MIIPAPatcherFileManager, "defaultManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 manifestFromFileURL:v6 fmRead:v7 withError:a4]);

  return v8;
}

+ (id)manifestFromFileURL:(id)a3 fmRead:(id)a4 withError:(id *)a5
{
  id v12 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a4 plistRepresentationFromFileURL:a3 withError:&v12]);
  id v7 = v12;
  if (v6)
  {
    id v11 = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[MIIPAPatcherManifest manifestFromPlistRepresentation:withError:]( &OBJC_CLASS___MIIPAPatcherManifest,  "manifestFromPlistRepresentation:withError:",  v6,  &v11));
    id v9 = v11;

    id v7 = v9;
    if (!a5) {
      goto LABEL_7;
    }
  }

  else
  {
    id v8 = 0LL;
    if (!a5) {
      goto LABEL_7;
    }
  }

  if (!v8) {
    *a5 = v7;
  }
LABEL_7:

  return v8;
}

- (id)plistRepresentation
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifest targets](self, "targets"));
  v5 = -[NSMutableArray initWithCapacity:](v3, "initWithCapacity:", [v4 count]);

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifest targets](self, "targets", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v22 + 1) + 8 * (void)v10) plistRepresentation]);
        -[NSMutableArray addObject:](v5, "addObject:", v11);

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }

    while (v8);
  }

  v26[0] = @"version";
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifest manifestVersion](self, "manifestVersion"));
  v27[0] = v12;
  v26[1] = @"commandLineArgs";
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifest commandLineArgs](self, "commandLineArgs"));
  v27[1] = v13;
  v26[2] = @"targets";
  id v14 = -[NSMutableArray copy](v5, "copy");
  v27[2] = v14;
  v26[3] = @"toolVersion";
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifest toolVersion](self, "toolVersion"));
  v27[3] = v15;
  v26[4] = @"toolArch";
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifest toolArch](self, "toolArch"));
  v27[4] = v16;
  v26[5] = @"toolBuiltWithSDKVersion";
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifest toolBuiltWithSDKVersion](self, "toolBuiltWithSDKVersion"));
  v27[5] = v17;
  v26[6] = @"toolBuiltWithXcodeVersion";
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifest toolBuiltWithXcodeVersion](self, "toolBuiltWithXcodeVersion"));
  v27[6] = v18;
  v26[7] = @"hostVersion";
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifest hostVersion](self, "hostVersion"));
  v27[7] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  8LL));

  return v20;
}

- (BOOL)writeToFileURL:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifest plistRepresentation](self, "plistRepresentation"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifest fmWrite](self, "fmWrite"));
  LOBYTE(a4) = [v8 writePlistRepresentation:v7 toFileURL:v6 mode:384 withError:a4];

  return (char)a4;
}

+ (id)_manifestErrorForKey:(id)a3 sub:(id)a4 index:(int64_t)a5 expected:(id)a6 value:(id)a7
{
  id v26 = a3;
  id v11 = (__CFString *)a4;
  id v12 = a6;
  id v13 = a7;
  id v14 = &stru_100082BD0;
  if (v11) {
    v15 = v11;
  }
  else {
    v15 = &stru_100082BD0;
  }
  id v16 = v15;
  if ((a5 & 0x8000000000000000LL) == 0) {
    id v14 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" at index %lu",  a5));
  }
  v27[0] = NSLocalizedDescriptionKey;
  id v17 = objc_alloc(&OBJC_CLASS___NSString);
  v18 = (objc_class *)objc_opt_class(v13);
  id v19 = NSStringFromClass(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = -[NSString initWithFormat:]( v17,  "initWithFormat:",  @"Invalid manifest %@key [%@]%@. Expected [%@], got [%@].",  v16,  v26,  v14,  v12,  v20);
  v28[0] = v21;
  v28[1] = &off_10008A110;
  v27[1] = @"line";
  v27[2] = @"function";
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "+[MIIPAPatcherManifest _manifestErrorForKey:sub:index:expected:value:]"));
  v28[2] = v22;
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  3LL));
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.MIIPAPatcher",  5LL,  v23));

  return v24;
}

+ (id)_arrayFromPlistRepresentation:(id)a3 key:(id)a4 sub:(id)a5 index:(unint64_t)a6 withError:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:v12]);
  objc_opt_class(&OBJC_CLASS___NSArray);
  id v15 = v14;
  if ((objc_opt_isKindOfClass(v15) & 1) != 0) {
    id v16 = v15;
  }
  else {
    id v16 = 0LL;
  }

  if (a7 && !v16) {
    *a7 = (id)objc_claimAutoreleasedReturnValue( [a1 _manifestErrorForKey:v12 sub:v13 index:a6 expected:@"NSArray" value:v15]);
  }

  return v16;
}

+ (id)_stringFromPlistRepresentation:(id)a3 key:(id)a4 sub:(id)a5 index:(unint64_t)a6 withError:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:v12]);
  objc_opt_class(&OBJC_CLASS___NSString);
  id v15 = v14;
  if ((objc_opt_isKindOfClass(v15) & 1) != 0) {
    id v16 = v15;
  }
  else {
    id v16 = 0LL;
  }

  if (a7 && !v16) {
    *a7 = (id)objc_claimAutoreleasedReturnValue( [a1 _manifestErrorForKey:v12 sub:v13 index:a6 expected:@"NSString" value:v15]);
  }

  return v16;
}

+ (id)_numberFromPlistRepresentation:(id)a3 key:(id)a4 sub:(id)a5 index:(unint64_t)a6 withError:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:v12]);
  objc_opt_class(&OBJC_CLASS___NSNumber);
  id v15 = v14;
  if ((objc_opt_isKindOfClass(v15) & 1) != 0) {
    id v16 = v15;
  }
  else {
    id v16 = 0LL;
  }

  if (a7 && !v16) {
    *a7 = (id)objc_claimAutoreleasedReturnValue( [a1 _manifestErrorForKey:v12 sub:v13 index:a6 expected:@"NSNumber" value:v15]);
  }

  return v16;
}

+ (id)_manifestFromPlistRepresentationV1:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v31 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( [a1 _numberFromPlistRepresentation:v6 key:@"version" sub:0 index:-1 withError:&v31]);
  id v8 = v31;
  id v9 = v8;
  id obj = v7;
  if (!v7)
  {
    id v10 = 0LL;
    v21 = 0LL;
    id v12 = 0LL;
    id v14 = 0LL;
    id v15 = 0LL;
    id v13 = 0LL;
    if (a4)
    {
LABEL_24:
      id v9 = v9;
      id v16 = 0LL;
      v18 = a4;
      a4 = 0LL;
      id *v18 = v9;
      goto LABEL_25;
    }

+ (id)_targetsFromPlistRepresentationV1:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v6 count]);
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id obj = v6;
  id v38 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
  id v8 = 0LL;
  if (!v38)
  {
LABEL_32:

    id v13 = -[NSMutableArray copy](v7, "copy");
    if (a4) {
      goto LABEL_37;
    }
    goto LABEL_39;
  }

  uint64_t v39 = *(void *)v48;
  uint64_t v40 = 0LL;
  uint64_t v33 = _kCFBundleShortVersionStringKey;
  id v31 = v7;
  id v37 = a1;
  id v29 = a4;
LABEL_3:
  id v9 = 0LL;
  while (1)
  {
    if (*(void *)v48 != v39) {
      objc_enumerationMutation(obj);
    }
    id v10 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)v9);
    objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v11 = v10;
    if ((objc_opt_isKindOfClass(v11) & 1) == 0)
    {

      uint64_t v12 = v40;
LABEL_35:
      uint64_t v27 = objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_manifestErrorForKey:sub:index:expected:value:",  @"targets",  @"target ",  v12,  @"NSDictionary",  v11,  v29));

      id v13 = 0LL;
      id v8 = (id)v27;
      goto LABEL_36;
    }

    uint64_t v12 = v40;
    if (!v11) {
      goto LABEL_35;
    }
    id v46 = v8;
    id v13 = (id)objc_claimAutoreleasedReturnValue( [a1 _stringFromPlistRepresentation:v11 key:kCFBundleVersionKey sub:@"target " index:v40 withError:&v46]);
    id v14 = v46;

    if (!v13)
    {
      v20 = 0LL;
      id v15 = 0LL;
      id v19 = 0LL;
      v21 = 0LL;
      int v22 = 0;
      int v35 = 1;
      id v8 = v14;
      id v23 = 0LL;
      goto LABEL_29;
    }

    id v45 = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( [a1 _stringFromPlistRepresentation:v11 key:v33 sub:@"target " index:v40 withError:&v45]);
    id v8 = v45;

    if (!v15)
    {
      v20 = 0LL;
      id v23 = 0LL;
      id v19 = 0LL;
      v21 = 0LL;
      int v22 = 0;
      int v35 = 1;
      goto LABEL_29;
    }

    id v34 = v13;
    id v44 = v8;
    uint64_t v16 = objc_claimAutoreleasedReturnValue( [a1 _stringFromPlistRepresentation:v11 key:kCFBundleIdentifierKey sub:@"target " index:v40 withError:&v44]);
    id v17 = v44;

    v32 = (void *)v16;
    if (!v16)
    {
      v20 = 0LL;
      id v19 = 0LL;
      v21 = 0LL;
      int v22 = 0;
      int v35 = 1;
      id v8 = v17;
      id v23 = 0LL;
LABEL_23:
      id v13 = v34;
      goto LABEL_29;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"UISupportedDevices"]);

    if (!v18)
    {
      id v19 = 0LL;
      id v13 = v34;
      goto LABEL_19;
    }

    id v43 = v17;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( [a1 _arrayFromPlistRepresentation:v11 key:@"UISupportedDevices" sub:0 index:v40 withError:&v43]);
    id v8 = v43;

    if (!v19)
    {
      v20 = 0LL;
      v21 = 0LL;
      int v22 = 0;
      int v35 = 1;
      id v23 = (void *)v16;
      goto LABEL_23;
    }

    objc_opt_class(&OBJC_CLASS___NSString);
    id v13 = v34;
    if ((sub_100013434(v19) & 1) == 0)
    {
      uint64_t v26 = objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"UISupportedDevices"]);
      id v30 = (id)objc_claimAutoreleasedReturnValue( [a1 _manifestErrorForKey:@"UISupportedDevices" sub:@"target " index:v40 expected:@"NSArray<NSString>" value:v26]);

      id v25 = (void *)v26;
      v20 = 0LL;
      v21 = 0LL;
      int v22 = 0;
      int v35 = 1;
      id v23 = v32;
      goto LABEL_26;
    }

    id v17 = v8;
LABEL_19:
    id v42 = v17;
    v21 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_stringFromPlistRepresentation:key:sub:index:withError:",  v11,  @"infoPlistHash",  @"target ",  v40,  &v42,  v29));
    id v8 = v42;

    if (!v21)
    {
      v20 = 0LL;
      int v22 = 0;
      int v35 = 1;
      id v23 = v32;
      goto LABEL_29;
    }

    id v41 = v8;
    uint64_t v24 = objc_claimAutoreleasedReturnValue( [a1 _stringFromPlistRepresentation:v11 key:@"infoPlistHashAlgorithm" sub:@"target " index:v40 withError:&v41]);
    id v30 = v41;

    id v25 = (void *)v24;
    id v23 = v32;
    if (!v25)
    {
      v20 = 0LL;
      int v22 = 0;
      int v35 = 1;
      goto LABEL_28;
    }

    v20 = -[MIIPAPatcherManifestTarget initWithCFBundleVersion:cfBundleShortVersion:bundleIdentifier:uiSupportedDevices:infoPlistHash:infoPlistHashAlgorithm:]( objc_alloc(&OBJC_CLASS___MIIPAPatcherManifestTarget),  "initWithCFBundleVersion:cfBundleShortVersion:bundleIdentifier:uiSupportedDevices:infoPlistHash:infoPlistHashAlgorithm:",  v13,  v15,  v32,  v19,  v21,  v25);
    -[NSMutableArray addObject:](v31, "addObject:", v20);
    int v35 = 0;
    ++v40;
    int v22 = 1;
LABEL_26:

LABEL_28:
    id v8 = v30;
LABEL_29:

    if (!v22) {
      break;
    }
    id v9 = (char *)v9 + 1;
    a1 = v37;
    if (v38 == v9)
    {
      a4 = v29;
      id v7 = v31;
      id v38 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v38) {
        goto LABEL_3;
      }
      goto LABEL_32;
    }
  }

  if (!v35)
  {
    id v7 = v31;
    goto LABEL_39;
  }

  id v13 = 0LL;
LABEL_36:
  a4 = v29;
  id v7 = v31;
  if (!v29) {
    goto LABEL_39;
  }
LABEL_37:
  if (!v13)
  {
    id v8 = v8;
    *a4 = v8;
  }

- (MIIPAPatcherWriteable)fmWrite
{
  return self->_fmWrite;
}

- (void)setFmWrite:(id)a3
{
}

- (NSNumber)manifestVersion
{
  return self->_manifestVersion;
}

- (NSArray)commandLineArgs
{
  return self->_commandLineArgs;
}

- (NSArray)targets
{
  return self->_targets;
}

- (NSString)toolVersion
{
  return self->_toolVersion;
}

- (NSString)toolArch
{
  return self->_toolArch;
}

- (NSString)toolBuiltWithSDKVersion
{
  return self->_toolBuiltWithSDKVersion;
}

- (NSString)toolBuiltWithXcodeVersion
{
  return self->_toolBuiltWithXcodeVersion;
}

- (NSString)hostVersion
{
  return self->_hostVersion;
}

- (void).cxx_destruct
{
}

@end