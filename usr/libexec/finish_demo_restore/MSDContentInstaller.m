@interface MSDContentInstaller
+ (id)sharedInstance;
- (BOOL)adjustContentUnder:(id)a3;
- (BOOL)createIntermdediateDirectoriesInPathAndRestoreAttributes:(id)a3;
- (BOOL)finishInstallContent;
- (BOOL)hasInheritanceACL:(id)a3;
- (BOOL)hasXattr:(id)a3 path:(id)a4;
- (BOOL)isContentRoot:(id)a3;
- (BOOL)isContentRootToRemove:(id)a3;
- (BOOL)isNotExtracted:(id)a3;
- (BOOL)removeXattr:(id)a3;
- (MSDContentInstaller)init;
- (id)originalPathFor:(id)a3;
@end

@implementation MSDContentInstaller

+ (id)sharedInstance
{
  if (qword_10000C760 != -1) {
    dispatch_once(&qword_10000C760, &stru_1000083D0);
  }
  return (id)qword_10000C758;
}

- (MSDContentInstaller)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MSDContentInstaller;
  v2 = -[MSDContentInstaller init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/logs/demod" stringByAppendingPathComponent:@"demod-finish-demo-restore.log"]);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    [v4 enableLogToFile:v3];

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    [v5 logMessage:1 prefix:@"[INF]" message:@"MSDContentInstaller launched!"];

    v6 = v2;
  }

  return v2;
}

- (BOOL)finishInstallContent
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoVolumeManager sharedInstance](&OBJC_CLASS___MSDDemoVolumeManager, "sharedInstance"));
  [v4 mountDemoVolume];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoVolumeManager sharedInstance](&OBJC_CLASS___MSDDemoVolumeManager, "sharedInstance"));
  [v5 moveDataFromShelterToFinal];

  unsigned int v6 = [v3 fileExistsAtPath:@"/private/var/demo_backup/backup"];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
  objc_super v8 = v7;
  if (v6)
  {
    [v7 logMessage:1 prefix:@"[INF]" message:@"Starting to move staged demo content..."];

    if (!-[MSDContentInstaller adjustContentUnder:]( self,  "adjustContentUnder:",  @"/private/var/demo_backup/backup"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
      [v9 logMessage:1 prefix:@"[INF]" message:@"Cannot move staged demo content."];
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    [v10 logMessage:1, @"[INF]", @"Removing staging folder %@...", @"/private/var/demo_backup/backup" prefix message];

    id v16 = 0LL;
    unsigned __int8 v11 = [v3 removeItemAtPath:@"/private/var/demo_backup/backup" error:&v16];
    id v12 = v16;
    if ((v11 & 1) == 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedDescription]);
      [v13 logMessage:1, @"[INF]", @"Cannot remove staging folder: %@", v14 prefix message];
    }
  }

  else
  {
    [v7 logMessage:1 prefix:@"[INF]" message:@"Skipping demo content restore as staging folder does not exist."];

    id v12 = 0LL;
  }

  return 1;
}

- (BOOL)adjustContentUnder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  else {
    BOOL v6 = 1;
  }
  v56 = v5;
  if (v6)
  {
    v7 = 0LL;
    objc_super v8 = 0LL;
    v9 = 0LL;
    id v10 = 0LL;
    goto LABEL_33;
  }

  id v69 = 0LL;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v5 contentsOfDirectoryAtPath:v4 error:&v69]);
  id v12 = v69;
  id v13 = v12;
  if (!v11)
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    v49 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
    [v14 logMessage:1, @"[INF]", @"%s: Cannot find files/dirs under %@ - %@", "-[MSDContentInstaller adjustContentUnder:]", v4, v49 prefix message];

    v32 = 0LL;
    objc_super v8 = 0LL;
    v39 = 0LL;
    v9 = 0LL;
LABEL_65:
    BOOL v38 = 0;
    goto LABEL_54;
  }

  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  id v14 = v11;
  id v55 = [v14 countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (!v55)
  {
    v53 = 0LL;
    objc_super v8 = 0LL;
    v9 = 0LL;
    goto LABEL_32;
  }

  v53 = 0LL;
  objc_super v8 = 0LL;
  v9 = 0LL;
  uint64_t v15 = *(void *)v66;
  id v54 = v4;
  while (2)
  {
    for (i = 0LL; i != v55; i = (char *)i + 1)
    {
      v17 = v9;
      v18 = v8;
      if (*(void *)v66 != v15) {
        objc_enumerationMutation(v14);
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue( [v4 stringByAppendingPathComponent:*(void *)(*((void *)&v65 + 1) + 8 * (void)i)]);

      id v64 = v13;
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v56 attributesOfItemAtPath:v9 error:&v64]);
      id v10 = v64;

      if (!v8)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
        v47 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
        [v46 logMessage:1, @"[INF]", @"%s: Cannot get attribute from %@ - %@", "-[MSDContentInstaller adjustContentUnder:]", v9, v47 prefix message];
LABEL_52:

        v39 = 0LL;
        BOOL v38 = 0;
        v32 = v53;
        goto LABEL_53;
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue([v8 fileType]);
      unsigned int v20 = [v19 isEqualToString:NSFileTypeSymbolicLink];

      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoVolumeManager sharedInstance](&OBJC_CLASS___MSDDemoVolumeManager, "sharedInstance"));
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 userHomePath]);
        v23 = (void *)objc_claimAutoreleasedReturnValue([@"/private/var/demo_backup/backup" stringByAppendingPathComponent:v22]);

        if (!v23 || [v9 caseInsensitiveCompare:v23])
        {

          id v13 = v10;
          id v4 = v54;
          continue;
        }

        v24 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
        [v24 logMessage:1, @"[INF]", @"Found wormhole in staging to user volume: %@", v23 prefix message];

        id v4 = v54;
      }

      if (!-[MSDContentInstaller isNotExtracted:](self, "isNotExtracted:", v9))
      {
        -[MSDContentInstaller adjustContentUnder:](self, "adjustContentUnder:", v9);
        id v13 = v10;
        continue;
      }

      uint64_t v25 = objc_claimAutoreleasedReturnValue(-[MSDContentInstaller originalPathFor:](self, "originalPathFor:", v9));

      uint64_t v26 = objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
      [(id)v26 logMessage:1, @"[INF]", @"%@ is not extracted (under a content root), should use the original content.", v9 prefix message];

      id v63 = v10;
      LOBYTE(v26) = [v56 removeItemAtPath:v9 error:&v63];
      id v27 = v63;

      if ((v26 & 1) == 0)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
        v47 = (void *)objc_claimAutoreleasedReturnValue([v27 localizedDescription]);
        [v46 logMessage:1, @"[INF]", @"%s: Cannot remove item: %@ - Error:  %@", "-[MSDContentInstaller adjustContentUnder:]", v9, v47 prefix message];
        v53 = (void *)v25;
        id v10 = v27;
        id v4 = v54;
        goto LABEL_52;
      }

      if ([v56 fileExistsAtPath:v25])
      {
        id v62 = v27;
        unsigned __int8 v28 = [v56 moveItemAtPath:v25 toPath:v9 error:&v62];
        id v13 = v62;

        if ((v28 & 1) == 0)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
          v30 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
          [v29 logMessage:1, @"[INF]", @"%s: Could not move item %@ to %@.  Error:  %@", "-[MSDContentInstaller adjustContentUnder:]", v25, v9, v30 prefix message];
        }

        v53 = (void *)v25;
      }

      else
      {
        v53 = (void *)v25;
        id v13 = v27;
      }

      id v4 = v54;
    }

    id v55 = [v14 countByEnumeratingWithState:&v65 objects:v71 count:16];
    if (v55) {
      continue;
    }
    break;
  }

- (BOOL)createIntermdediateDirectoriesInPathAndRestoreAttributes:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
  [v4 logMessage:1, @"[INF]", @"%s - fullPath:  %@", "-[MSDContentInstaller createIntermdediateDirectoriesInPathAndRestoreAttributes:]", v3 prefix message];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 1;
  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x3032000000LL;
  v13[3] = sub_100004EE0;
  v13[4] = sub_100004EF0;
  id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSString string](&OBJC_CLASS___NSString, "string"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v3 pathComponents]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100004EF8;
  v9[3] = &unk_1000083F8;
  unsigned __int8 v11 = v13;
  id v7 = v5;
  id v10 = v7;
  id v12 = &v15;
  [v6 enumerateObjectsUsingBlock:v9];

  LOBYTE(v6) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

- (BOOL)isNotExtracted:(id)a3
{
  return -[MSDContentInstaller hasXattr:path:](self, "hasXattr:path:", @"NotExtracted", a3);
}

- (BOOL)isContentRoot:(id)a3
{
  id v4 = a3;
  if (-[MSDContentInstaller hasXattr:path:](self, "hasXattr:path:", @"ContentRoot", v4)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = -[MSDContentInstaller hasXattr:path:](self, "hasXattr:path:", @"ContentRootToRemove", v4);
  }

  return v5;
}

- (BOOL)isContentRootToRemove:(id)a3
{
  return -[MSDContentInstaller hasXattr:path:](self, "hasXattr:path:", @"ContentRootToRemove", a3);
}

- (BOOL)hasXattr:(id)a3 path:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  objc_super v8 = (const char *)[@"MSDAnnotation" UTF8String];
  id v9 = v6;
  id v10 = (const char *)[v9 fileSystemRepresentation];
  ssize_t v11 = getxattr(v10, v8, 0LL, 0LL, 0, 1);
  if (v11 < 0)
  {
    if (*__error() == 93)
    {
      id v12 = 0LL;
      id v14 = 0LL;
      goto LABEL_7;
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    [v15 logMessage:1, @"[INF]", @"Could not extract extended file attributes from %@, returned %ld", v9, v11 prefix message];
    id v12 = 0LL;
LABEL_9:
    id v14 = 0LL;
    BOOL v16 = 0;
    goto LABEL_10;
  }

  id v12 = objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithLength:]( &OBJC_CLASS___NSMutableData, "dataWithLength:", v11));
  ssize_t v13 = getxattr(v10, v8, [v12 mutableBytes], v11, 0, 1);
  if (v13 < 0)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    [v15 logMessage:1, @"[INF]", @"Coud not extract extended file attributes from %@. File is expected to have extended attributes.", v9 prefix message];
    goto LABEL_9;
  }

  [v12 setLength:v13];
  id v14 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v12, 4LL);
  if (-[NSString isEqualToString:](v14, "isEqualToString:", v7))
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    BOOL v16 = 1;
    [v15 logMessage:1, @"[INF]", @"%@: Has expected xattr %@", v9, v7 prefix message];
LABEL_10:

    goto LABEL_11;
  }

- (BOOL)removeXattr:(id)a3
{
  id v3 = a3;
  id v4 = (const char *)[@"MSDAnnotation" UTF8String];
  id v5 = v3;
  int v6 = removexattr((const char *)[v5 fileSystemRepresentation], v4, 1);
  if (v6)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    [v8 logMessage:1, @"[INF]", @"Cannot remove xattr for %@", v5 prefix message];
  }

  return v6 == 0;
}

- (BOOL)hasInheritanceACL:(id)a3
{
  acl_flagset_t flagset_p = 0LL;
  acl_entry_t entry_p = 0LL;
  id v3 = a3;
  file = acl_get_file((const char *)[v3 fileSystemRepresentation], ACL_TYPE_EXTENDED);
  if (file)
  {
    objc_super v8 = file;
    BOOL v9 = 0;
    if (!acl_get_entry(file, 0, &entry_p))
    {
      while (1)
      {
        if (acl_get_flagset_np(entry_p, &flagset_p))
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
          ssize_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[ERR] %s",  "-[MSDContentInstaller hasInheritanceACL:]"));
          id v12 = __error();
          [v10 logMessage:2, v11, @"Failed to read ACL flagset from %@: %s", v3, strerror(*v12) prefix message];
        }

        else if (acl_get_flag_np(flagset_p, ACL_ENTRY_DIRECTORY_INHERIT) == 1 {
               && acl_get_flag_np(flagset_p, ACL_ENTRY_FILE_INHERIT) == 1)
        }
        {
          BOOL v9 = 1;
          break;
        }

        if (entry_p) {
          int v13 = -1;
        }
        else {
          int v13 = 0;
        }
        if (acl_get_entry(v8, v13, &entry_p)) {
          goto LABEL_13;
        }
      }
    }
  }

  else
  {
    if (*__error() != 2)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
      int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[ERR] %s",  "-[MSDContentInstaller hasInheritanceACL:]"));
      id v7 = __error();
      [v5 logMessage:2, v6, @"Could not read ACL from %@: %s", v3, strerror(*v7), flagset_p prefix message];
    }

- (id)originalPathFor:(id)a3
{
  id v3 = a3;
  id v4 = [v3 rangeOfString:@"/private/var/demo_backup/backup"];
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v4 = [v3 rangeOfString:@"/var/demo_backup/backup"];
  }
  if (v4)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    [v8 logMessage:1, @"[INF]", @"Cannot calculate original path for %@", v3 prefix message];

    int v6 = 0LL;
  }

  else
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 substringFromIndex:v5]);
  }

  return v6;
}

@end