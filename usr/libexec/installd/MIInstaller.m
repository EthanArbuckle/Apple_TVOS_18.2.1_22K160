@interface MIInstaller
+ (id)installerForURL:(id)a3 identity:(id)a4 domain:(unint64_t)a5 options:(id)a6 operationType:(unint64_t)a7 forClient:(id)a8;
- (BOOL)_applyStagedUpdateForUUID:(id)a3 withError:(id *)a4;
- (BOOL)_extractPackageContainedSymlink:(BOOL *)a3 withError:(id *)a4;
- (BOOL)_installInstallable:(id)a3 containingSymlink:(BOOL)a4 error:(id *)a5;
- (BOOL)_installProvisioningProfilesAtStagingRootWithError:(id *)a3;
- (BOOL)_installProvisioningProfilesFromUserOptionsWithError:(id *)a3;
- (BOOL)_setupPackageStateWithError:(id *)a3;
- (BOOL)_takeOwnershipOfInstallableContainingSymlink:(BOOL *)a3 error:(id *)a4;
- (BOOL)_writeLockBundle:(id)a3 error:(id *)a4;
- (BOOL)applyStagedUpdateForUUID:(id)a3 withError:(id *)a4;
- (BOOL)performInstallationWithError:(id *)a3;
- (BOOL)terminationAssertionReleased;
- (LSRecordPromise)recordPromise;
- (MIAppIdentity)identity;
- (MIClientConnection)client;
- (MIInstallOptions)options;
- (MIInstaller)init;
- (MIInstaller)initWithURL:(id)a3 identity:(id)a4 domain:(unint64_t)a5 options:(id)a6 operationType:(unint64_t)a7 forClient:(id)a8;
- (NSArray)lockedIdentifiers;
- (NSArray)receipt;
- (NSString)stagedJournalEntryUniqueID;
- (NSURL)installURL;
- (NSURL)stagingRoot;
- (NSURL)stagingURL;
- (id)_bundleInDirectory:(id)a3 withBundleID:(id)a4 error:(id *)a5;
- (id)_discoverInstallableWithError:(id *)a3;
- (id)_identifiersToLockBundleIdentifier:(id)a3 error:(id *)a4;
- (id)_manifestPathForBase:(id)a3 withIdentifier:(id)a4 patchType:(unsigned __int8 *)a5 error:(id *)a6;
- (unint64_t)installOperationType;
- (unint64_t)installationDomain;
- (unint64_t)preflightAndPatchTime;
- (unint64_t)stagingTime;
- (unint64_t)verificationTime;
- (unint64_t)waitingTime;
- (unsigned)packageFormat;
- (void)_fireCallbackWithStatus:(id)a3;
- (void)_fireCallbackWithStatus:(id)a3 percentComplete:(unsigned int)a4;
- (void)_logOperationCompletionWithStartTime:(unint64_t)a3 distributorID:(id)a4;
- (void)_writeLockIdentifiers:(id)a3;
- (void)dealloc;
- (void)setIdentity:(id)a3;
- (void)setInstallOperationType:(unint64_t)a3;
- (void)setInstallURL:(id)a3;
- (void)setLockedIdentifiers:(id)a3;
- (void)setPackageFormat:(unsigned __int8)a3;
- (void)setPreflightAndPatchTime:(unint64_t)a3;
- (void)setStagingRoot:(id)a3;
- (void)setStagingTime:(unint64_t)a3;
- (void)setStagingURL:(id)a3;
- (void)setTerminationAssertionReleased:(BOOL)a3;
- (void)setVerificationTime:(unint64_t)a3;
- (void)setWaitingTime:(unint64_t)a3;
@end

@implementation MIInstaller

- (MIInstaller)init
{
}

- (MIInstaller)initWithURL:(id)a3 identity:(id)a4 domain:(unint64_t)a5 options:(id)a6 operationType:(unint64_t)a7 forClient:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MIInstaller;
  v18 = -[MIInstaller init](&v23, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_installURL, a3);
    objc_storeStrong((id *)&v19->_identity, a4);
    unint64_t v20 = 2LL;
    if (a5 != 1) {
      unint64_t v20 = a5;
    }
    v19->_installationDomain = v20;
    objc_storeStrong((id *)&v19->_options, a6);
    objc_storeStrong((id *)&v19->_client, a8);
    v19->_installOperationType = a7;
  }

  return v19;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));
    sub_10004D608(v4);

    -[MIInstaller setLockedIdentifiers:](self, "setLockedIdentifiers:", 0LL);
  }

  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MIInstaller client](self, "client"));
  if (v5)
  {
    v6 = (void *)v5;
    unsigned __int8 v7 = -[MIInstaller terminationAssertionReleased](self, "terminationAssertionReleased");

    if ((v7 & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller client](self, "client"));
      [v8 releaseTerminationAssertion];

      -[MIInstaller setTerminationAssertionReleased:](self, "setTerminationAssertionReleased:", 1LL);
    }
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MIInstaller;
  -[MIInstaller dealloc](&v9, "dealloc");
}

+ (id)installerForURL:(id)a3 identity:(id)a4 domain:(unint64_t)a5 options:(id)a6 operationType:(unint64_t)a7 forClient:(id)a8
{
  id v14 = a8;
  id v15 = a6;
  id v16 = a4;
  id v17 = a3;
  id v18 = [objc_alloc((Class)objc_opt_class(a1)) initWithURL:v17 identity:v16 domain:a5 options:v15 operationType:a7 forClient:v14];

  return v18;
}

- (void)_fireCallbackWithStatus:(id)a3 percentComplete:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MIInstaller client](self, "client"));
  [v7 sendProgressWithStatus:v6 percentComplete:v4];
}

- (void)_fireCallbackWithStatus:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MIInstaller client](self, "client"));
  [v5 sendProgressWithStatus:v4];
}

- (BOOL)_takeOwnershipOfInstallableContainingSymlink:(BOOL *)a3 error:(id *)a4
{
  BOOL v22 = 0;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIHelperServiceClient sharedInstance](&OBJC_CLASS___MIHelperServiceClient, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
  id v21 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 stageItemAtURL:v8 options:v9 containedSymlink:&v22 error:&v21]);
  id v11 = v21;

  if (v10)
  {
    if (a3) {
      *a3 = v22;
    }
    -[MIInstaller setInstallURL:](self, "setInstallURL:", v10);
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
    v13 = (void *)MIInstallerErrorDomain;
    unsigned __int8 v14 = [v12 isEqualToString:MIInstallerErrorDomain];

    if ((v14 & 1) != 0)
    {
    }

    else
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
      id v18 = sub_1000130F4( (uint64_t)"-[MIInstaller _takeOwnershipOfInstallableContainingSymlink:error:]",  191LL,  v13,  103LL,  v11,  0LL,  @"Failed to transfer ownership of path %@ to installd",  v17,  (uint64_t)v16);
      uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);

      id v11 = (id)v19;
    }

    if (a4)
    {
      id v11 = v11;
      *a4 = v11;
    }
  }

  return v10 != 0LL;
}

- (BOOL)_setupPackageStateWithError:(id *)a3
{
  id v5 = objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
  int v6 = lstat((const char *)[v5 fileSystemRepresentation], &v84);

  if (v6)
  {
    id v7 = (void *)MIInstallerErrorDomain;
    v8 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v92 = MIPathArgumentErrorKey;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
    v93 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v93,  &v92,  1LL));
    id v13 = objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
    id v14 = [v13 fileSystemRepresentation];
    id v15 = __error();
    strerror(*v15);
    id v17 = sub_1000130F4( (uint64_t)"-[MIInstaller _setupPackageStateWithError:]",  223LL,  v7,  3LL,  v9,  v12,  @"Can't stat %s: %s",  v16,  (uint64_t)v14);
    id v18 = (id)objc_claimAutoreleasedReturnValue(v17);

LABEL_3:
LABEL_8:

    v28 = 0LL;
    goto LABEL_9;
  }

  id v19 = (id)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
  LOBYTE(value) = 110;
  id v20 = v19;
  ssize_t v21 = getxattr( (const char *)[v20 fileSystemRepresentation],  "com.apple.streamingzip.incomplete_extraction",  &value,  1uLL,  0,  1);
  if (v21 == -1)
  {
    if (*__error() == 93) {
      goto LABEL_18;
    }
    if (*__error() == 34) {
      goto LABEL_6;
    }
  }

  else if ((v21 & 0x8000000000000000LL) == 0)
  {
LABEL_6:

    BOOL v22 = (void *)MIInstallerErrorDomain;
    v90[0] = MIPathArgumentErrorKey;
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
    objc_super v23 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
    v90[1] = @"LegacyErrorString";
    v91[0] = v23;
    v91[1] = @"PackageInspectionFailed";
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v91,  v90,  2LL));
    id v25 = objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
    id v74 = [v25 fileSystemRepresentation];
    id v27 = sub_1000130F4( (uint64_t)"-[MIInstaller _setupPackageStateWithError:]",  230LL,  v22,  3LL,  0LL,  v24,  @"Archive we've been requested to install at %s is an incomplete download.",  v26,  (uint64_t)v74);
LABEL_7:
    id v18 = (id)objc_claimAutoreleasedReturnValue(v27);

    goto LABEL_8;
  }

  uint64_t v31 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
  {
    v32 = (char *)[v20 fileSystemRepresentation];
    v33 = __error();
    v77 = v32;
    v78 = strerror(*v33);
    uint64_t v73 = (uint64_t)"com.apple.streamingzip.incomplete_extraction";
    MOLogWrite(v31);
  }

- (BOOL)_extractPackageContainedSymlink:(BOOL *)a3 withError:(id *)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  if (-[MIInstaller packageFormat](self, "packageFormat") != 1)
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL"));
    if (-[MIInstaller packageFormat](self, "packageFormat") == 2)
    {
      objc_super v23 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 pathExtension]);

      unsigned __int8 v25 = [v24 isEqualToString:@"app"];
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 lastPathComponent]);
      v28 = v27;
      if ((v25 & 1) == 0)
      {
        uint64_t v29 = objc_claimAutoreleasedReturnValue([v27 stringByAppendingString:@".app"]);

        v28 = (void *)v29;
      }

      uint64_t v30 = objc_claimAutoreleasedReturnValue([v14 URLByAppendingPathComponent:v28 isDirectory:1]);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL"));
      id v53 = 0LL;
      unsigned __int8 v32 = [v7 createDirectoryAtURL:v31 withIntermediateDirectories:0 mode:493 error:&v53];
      id v33 = v53;

      if ((v32 & 1) == 0)
      {
        uint64_t v34 = qword_100095BF8;
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
        {
          unsigned __int8 v48 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL"));
          v49 = v33;
          MOLogWrite(v34);
        }
      }

      id v14 = (id)v30;
    }

    else
    {
      id v33 = 0LL;
    }

    uint64_t v38 = qword_100095BF8;
    if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
    {
      ssize_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
      unsigned __int8 v48 = (void *)objc_claimAutoreleasedReturnValue([v39 path]);
      v49 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
      MOLogWrite(v38);
    }

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL", v48, v49));
    id v52 = v33;
    unsigned __int8 v41 = [v7 moveItemAtURL:v40 toURL:v14 error:&v52];
    id v11 = v52;

    if ((v41 & 1) != 0)
    {
      BOOL v21 = 1;
      goto LABEL_31;
    }

    v42 = (void *)MIInstallerErrorDomain;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
    v44 = (void *)objc_claimAutoreleasedReturnValue([v43 path]);
    id v51 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
    id v46 = sub_1000130F4( (uint64_t)"-[MIInstaller _extractPackageContainedSymlink:withError:]",  349LL,  v42,  5LL,  v11,  &off_10008A9F8,  @"Failed to move %@ to %@",  v45,  (uint64_t)v44);
    id v22 = (id)objc_claimAutoreleasedReturnValue(v46);

    goto LABEL_29;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL"));
  id v56 = 0LL;
  unsigned __int8 v10 = +[MIBOMWrapper extractZipArchiveAtURL:toURL:withError:]( &OBJC_CLASS___MIBOMWrapper,  "extractZipArchiveAtURL:toURL:withError:",  v8,  v9,  &v56);
  id v11 = v56;

  if ((v10 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
    id v55 = 0LL;
    unsigned __int8 v13 = [v7 removeItemAtURL:v12 error:&v55];
    id v14 = v55;

    if ((v13 & 1) == 0)
    {
      uint64_t v15 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
        unsigned __int8 v48 = (void *)objc_claimAutoreleasedReturnValue([v16 path]);
        v49 = v14;
        MOLogWrite(v15);
      }
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL", v48, v49));
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    id v19 = [v18 uid];
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    id v54 = v11;
    BOOL v21 = 1;
    LOBYTE(v19) = objc_msgSend( v7,  "standardizeOwnershipAtURL:toUID:GID:removeACLs:setProtectionClass:foundSymlink:error:",  v17,  v19,  objc_msgSend(v20, "gid"),  1,  1,  a3,  &v54);
    id v22 = v54;

LABEL_29:
    BOOL v21 = 0;
LABEL_30:
    id v11 = v22;
    goto LABEL_31;
  }

  uint64_t v35 = qword_100095BF8;
  if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) < 3)
  {
    BOOL v21 = 0;
    if (!a4) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }

  id v14 = (id)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
  id v36 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
  int v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL"));
  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v37 path]);
  MOLogWrite(v35);

  BOOL v21 = 0;
LABEL_31:

  if (a4) {
LABEL_32:
  }
    *a4 = v11;
LABEL_33:

  return v21;
}

- (id)_manifestPathForBase:(id)a3 withIdentifier:(id)a4 patchType:(unsigned __int8 *)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([@"com.apple.deltainstallcommands." stringByAppendingString:v9]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 URLByAppendingPathComponent:v10 isDirectory:0]);

  v12 = (void *)objc_claimAutoreleasedReturnValue([@"com.apple.parallelpatchinfo." stringByAppendingString:v9]);
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v8 URLByAppendingPathComponent:v12 isDirectory:0]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([@"com.apple.parallelpatcharchive." stringByAppendingString:v9]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 URLByAppendingPathComponent:v14 isDirectory:0]);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  id v42 = 0LL;
  LODWORD(v14) = [v16 itemIsFileAtURL:v15 error:&v42];
  id v17 = v42;
  ssize_t v39 = v11;
  if ((_DWORD)v14)
  {
    *a5 = 3;
    id v18 = v15;
    if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
    {
      id v19 = (void *)v13;
      MOLogWrite(qword_100095BF8);
    }

    else
    {
      id v19 = (void *)v13;
    }

    id v21 = 0LL;
    goto LABEL_17;
  }

  id v41 = 0LL;
  unsigned int v20 = [v16 itemIsFileAtURL:v11 error:&v41];
  id v21 = v41;
  if (v20)
  {
    *a5 = 1;
    id v18 = v11;
    if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
    {
      id v19 = (void *)v13;
      MOLogWrite(qword_100095BF8);
    }

    else
    {
      id v19 = (void *)v13;
    }

- (id)_bundleInDirectory:(id)a3 withBundleID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v35 = 0LL;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  uint64_t v38 = sub_100023C54;
  ssize_t v39 = sub_100023C64;
  id v40 = 0LL;
  uint64_t v29 = 0LL;
  id v30 = (id *)&v29;
  uint64_t v31 = 0x3032000000LL;
  unsigned __int8 v32 = sub_100023C54;
  id v33 = sub_100023C64;
  id v34 = 0LL;
  id v9 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100023C6C;
  v23[3] = &unk_100081410;
  id v27 = &v29;
  id v11 = v8;
  id v24 = v11;
  v28 = &v35;
  id v12 = v7;
  id v25 = v12;
  uint64_t v13 = v9;
  uint64_t v26 = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 enumerateURLsForItemsInDirectoryAtURL:v12 ignoreSymlinks:1 withBlock:v23]);

  if (v30[5])
  {
LABEL_4:
    id v15 = 0LL;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }

  if (v14)
  {
    objc_storeStrong(v30 + 5, v14);
    goto LABEL_4;
  }

  if (!v36[5])
  {
    if (-[NSMutableSet count](v13, "count")) {
      id v19 = sub_1000130F4( (uint64_t)"-[MIInstaller _bundleInDirectory:withBundleID:error:]",  469LL,  MIInstallerErrorDomain,  180LL,  0LL,  0LL,  @"The item being installed did not contain an app with bundle ID %@, but it did contain app(s) with bundle ID(s): %@",  v18,  (uint64_t)v11);
    }
    else {
      id v19 = sub_1000130F4( (uint64_t)"-[MIInstaller _bundleInDirectory:withBundleID:error:]",  471LL,  MIInstallerErrorDomain,  6LL,  0LL,  &off_10008AA70,  @"The item being installed did not contain any installable apps.",  v18,  v22);
    }
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    id v21 = v30[5];
    v30[5] = (id)v20;
  }

  id v15 = (id)v36[5];
  if (a5)
  {
LABEL_5:
    if (!v15) {
      *a5 = v30[5];
    }
  }

- (id)_identifiersToLockBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v7, "addObject:", v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 linkedParentBundleID]);

  if (v9) {
    -[NSMutableArray addObject:](v7, "addObject:", v9);
  }
  sub_10004D4E4(v6);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( +[MIContainerLinkManager sharedInstanceForDomain:]( &OBJC_CLASS___MIContainerLinkManager,  "sharedInstanceForDomain:",  -[MIInstaller installationDomain](self, "installationDomain")));
  id v19 = 0LL;
  id v20 = 0LL;
  unsigned int v11 = [v10 getLinkedParent:&v20 forChild:v6 error:&v19];
  id v12 = v20;
  id v13 = v19;
  sub_10004D608(v6);
  if (v11)
  {
    if (v12) {
      -[NSMutableArray addObject:](v7, "addObject:", v12);
    }
  }

  else
  {
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      id v17 = v6;
      id v18 = v13;
      MOLogWrite(qword_100095BF8);
    }

    id v13 = 0LL;
  }

  id v14 = -[NSMutableArray copy](v7, "copy", v17, v18);
  id v15 = v14;
  if (a4 && !v14) {
    *a4 = v13;
  }

  return v15;
}

- (void)_writeLockIdentifiers:(id)a3
{
  id v4 = a3;
  -[MIInstaller _fireCallbackWithStatus:](self, "_fireCallbackWithStatus:", @"TakingInstallLock");
  -[MIInstaller setLockedIdentifiers:](self, "setLockedIdentifiers:", v4);
  uint64_t v5 = mach_absolute_time();
  sub_10004D4EC(v4);

  uint64_t v6 = (mach_absolute_time() - v5) * qword_100095C00 / HIDWORD(qword_100095C00);
  -[MIInstaller setWaitingTime:](self, "setWaitingTime:", v6);
}

- (BOOL)_writeLockBundle:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  id v10 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MIInstaller _identifiersToLockBundleIdentifier:error:]( self,  "_identifiersToLockBundleIdentifier:error:",  v6,  &v10));
  id v8 = v10;

  if (v7)
  {
    -[MIInstaller _writeLockIdentifiers:](self, "_writeLockIdentifiers:", v7);
  }

  else if (a4)
  {
    *a4 = v8;
  }

  return v7 != 0LL;
}

- (id)_discoverInstallableWithError:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);

  if (v6)
  {
    switch(-[MIInstaller packageFormat](self, "packageFormat"))
    {
      case 1u:
      case 3u:
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL"));
        id v9 = v8;
        id v10 = @"Payload";
        goto LABEL_10;
      case 2u:
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL"));
        goto LABEL_11;
      case 4u:
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL"));
        id v9 = v8;
        id v10 = @"AssetData";
LABEL_10:
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 URLByAppendingPathComponent:v10 isDirectory:1]);

LABEL_11:
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
        id v20 = [v19 installTargetType];

        v113[0] = 0LL;
        id v18 = (void *)objc_claimAutoreleasedReturnValue( -[MIInstaller _bundleInDirectory:withBundleID:error:]( self,  "_bundleInDirectory:withBundleID:error:",  v17,  v6,  v113));
        id v21 = v113[0];
        id v16 = v21;
        if (!v18) {
          goto LABEL_24;
        }
        id v112 = v21;
        unsigned int v22 = -[MIInstaller _writeLockBundle:error:](self, "_writeLockBundle:error:", v18, &v112);
        id v23 = v112;

        if (!v22) {
          goto LABEL_23;
        }
        id v24 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller identity](self, "identity"));
        id v111 = v23;
        unsigned int v25 = [v24 resolvePersonaWithError:&v111];
        id v16 = v111;

        if (!v25) {
          goto LABEL_24;
        }
        unsigned int v26 = [v18 bundleType];
        unsigned int v27 = v26;
        if (v26 <= 4 && ((1 << v26) & 0x16) != 0)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
          id v110 = v16;
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerWithIdentifier:createIfNeeded:created:error:",  v28,  0LL,  0LL,  &v110));
          id v30 = v110;

          if (v29)
          {
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v29 bundle]);

            if (v31)
            {
              unsigned __int8 v32 = (void *)objc_claimAutoreleasedReturnValue([v29 bundle]);
              unsigned __int8 v33 = [v32 isPlaceholder];

              if ((v33 & 1) == 0 && v20 == (id)2)
              {
                v99 = objc_alloc(&OBJC_CLASS___MIInstallableParallelPlaceholder);
                v94 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL"));
                unsigned int v91 = -[MIInstaller packageFormat](self, "packageFormat");
                v89 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller identity](self, "identity"));
                unint64_t v34 = -[MIInstaller installationDomain](self, "installationDomain");
                uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
                id v108 = v30;
                id v36 = -[MIInstallableBundle initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:existingBundleContainer:operationType:error:]( v99,  "initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:existingBundleContaine r:operationType:error:",  v18,  v94,  v91,  v89,  v34,  v35,  v29,  -[MIInstaller installOperationType](self, "installOperationType"),  &v108);
                id v16 = v108;

                uint64_t v37 = (MIInstallableBundlePatch *)v36;
                if (!v36)
                {
LABEL_65:

                  if (a3) {
                    goto LABEL_25;
                  }
                  goto LABEL_66;
                }

- (BOOL)_installProvisioningProfilesFromUserOptionsWithError:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 provisioningProfiles]);
  if (v6)
  {
    unsigned int v26 = self;
    unsigned int v27 = a3;
    id v7 = [v5 provisioningProfileInstallFailureIsFatal];
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    v28 = v6;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v30;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)i);
          objc_opt_class(&OBJC_CLASS___NSData);
          if ((objc_opt_isKindOfClass(v13) & 1) != 0)
          {
            uint64_t v14 = MIInstallProfileWithData(v13);
            if ((MIIsFatalMISProfileInstallationError(v14, v7) & 1) != 0)
            {
              id v16 = (void *)MIInstallerErrorDomain;
              v33[0] = @"LegacyErrorString";
              v33[1] = MILibMISErrorNumberKey;
              v34[0] = @"ApplicationVerificationFailed";
              id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v14));
              v34[1] = v17;
              id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  2LL));
              id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](v26, "installURL"));
              uint64_t v20 = MIErrorStringForMISError(v14);
              unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(v20);
              id v22 = sub_1000130F4( (uint64_t)"-[MIInstaller _installProvisioningProfilesFromUserOptionsWithError:]",  857LL,  v16,  13LL,  0LL,  v18,  @"Failed to install local provisioning profile from user options for %@ : 0x%08x (%@)",  v21,  (uint64_t)v19);
              id v23 = (id)objc_claimAutoreleasedReturnValue(v22);

              if (v27)
              {
                id v23 = v23;
                BOOL v15 = 0;
                *unsigned int v27 = v23;
              }

              else
              {
                BOOL v15 = 0;
              }

              goto LABEL_20;
            }
          }

          else if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
          {
            MOLogWrite(qword_100095BF8);
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v29 objects:v35 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v23 = 0LL;
    BOOL v15 = 1;
LABEL_20:
    uint64_t v6 = v28;
  }

  else
  {
    id v23 = 0LL;
    BOOL v15 = 1;
  }

  return v15;
}

- (BOOL)_installProvisioningProfilesAtStagingRootWithError:(id *)a3
{
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_100023C54;
  uint64_t v21 = sub_100023C64;
  id v22 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingRoot](self, "stagingRoot"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:@"ProvisioningProfiles" isDirectory:1]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
  unsigned __int8 v8 = [v7 provisioningProfileInstallFailureIsFatal];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100025108;
  v15[3] = &unk_100081438;
  unsigned __int8 v16 = v8;
  v15[4] = self;
  v15[5] = &v17;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 enumerateURLsForItemsInDirectoryAtURL:v6 ignoreSymlinks:1 withBlock:v15]);

  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]);
    if ([v11 isEqualToString:NSPOSIXErrorDomain])
    {
      id v12 = [v10 code];

      if (v12 == (id)2) {
        goto LABEL_9;
      }
    }

    else
    {
    }
  }

- (BOOL)_installInstallable:(id)a3 containingSymlink:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  uint64_t v120 = 0LL;
  v121 = (id *)&v120;
  uint64_t v122 = 0x3032000000LL;
  v123 = sub_100023C54;
  v124 = sub_100023C64;
  id v125 = 0LL;
  unint64_t v98 = -[MIInstaller installOperationType](self, "installOperationType");
  v119[0] = _NSConcreteStackBlock;
  v119[1] = 3221225472LL;
  v119[2] = sub_1000260A0;
  v119[3] = &unk_100081460;
  v119[4] = self;
  [v7 setProgressBlock:v119];
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
  {
    id v95 = v7;
    MOLogWrite(qword_100095BF8);
  }

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundle", v95));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller identity](self, "identity"));
  v101 = (void *)objc_claimAutoreleasedReturnValue([v10 personaUniqueString]);

  objc_opt_class(&OBJC_CLASS___MIInstallableBundle);
  if ((objc_opt_isKindOfClass(v7) & 1) != 0)
  {
    id v13 = v7;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 existingBundleContainer]);

    if (v14 && v98 == 1)
    {
      uint64_t v15 = 13LL;
LABEL_34:

      uint64_t v16 = v15;
      goto LABEL_35;
    }

    objc_opt_class(&OBJC_CLASS___MIInstallableBundlePatch);
    if ((objc_opt_isKindOfClass(v13) & 1) != 0)
    {
      uint64_t v15 = 1LL;
      goto LABEL_34;
    }

    objc_opt_class(&OBJC_CLASS___MIInstallableParallelPlaceholder);
    if ((objc_opt_isKindOfClass(v13) & 1) != 0)
    {
      uint64_t v15 = 2LL;
      goto LABEL_34;
    }

    if ([v13 isPlaceholderInstall])
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v13 existingBundleContainer]);
      if (v17)
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 existingBundleContainer]);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bundle]);
        unsigned __int8 v20 = [v19 isPlaceholder];

        if ((v20 & 1) != 0)
        {
          uint64_t v15 = 3LL;
          goto LABEL_34;
        }
      }
    }

    if ([v13 isPlaceholderInstall])
    {
      uint64_t v15 = 4LL;
      goto LABEL_34;
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v13 existingBundleContainer]);
    if (v21)
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v13 existingBundleContainer]);
      if (v22)
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v13 existingBundleContainer]);
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 bundle]);
        unsigned __int8 v25 = [v24 isPlaceholder];

        if ((v25 & 1) != 0) {
          goto LABEL_22;
        }
      }

      else
      {
      }

      unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v13 existingBundleContainer]);
      if (v26)
      {
        unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v13 existingBundleContainer]);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 bundle]);
        if ([v28 isPlaceholder])
        {
        }

        else
        {
          __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
          id v30 = [v29 installTargetType];

          if (v30 == (id)3)
          {
            uint64_t v15 = 6LL;
            goto LABEL_34;
          }
        }
      }

      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v13 existingBundleContainer]);
      if (v31)
      {
        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v13 existingBundleContainer]);
        unsigned __int8 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 bundle]);
        unsigned int v34 = [v33 isPlaceholder];

        if (v34) {
          uint64_t v15 = 8LL;
        }
        else {
          uint64_t v15 = 7LL;
        }
      }

      else
      {
        uint64_t v15 = 8LL;
      }

      goto LABEL_34;
    }

- (void)_logOperationCompletionWithStartTime:(unint64_t)a3 distributorID:(id)a4
{
  id v11 = a4;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller identity](self, "identity"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);

  mach_absolute_time();
  if ((id)-[MIInstaller installOperationType](self, "installOperationType") == (id)1)
  {
    uint64_t v8 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
LABEL_11:
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 installTypeSummaryString]);
      -[MIInstaller stagingTime](self, "stagingTime");
      -[MIInstaller waitingTime](self, "waitingTime");
      -[MIInstaller preflightAndPatchTime](self, "preflightAndPatchTime");
      -[MIInstaller verificationTime](self, "verificationTime");
      goto LABEL_12;
    }
  }

  else
  {
    unint64_t v9 = -[MIInstaller installOperationType](self, "installOperationType");
    uint64_t v8 = qword_100095BF8;
    if (v9 == 2)
    {
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 installTypeSummaryString]);
LABEL_12:
        MOLogWrite(v8);
      }
    }

    else if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      goto LABEL_11;
    }
  }
}

- (BOOL)performInstallationWithError:(id *)a3
{
  unsigned __int8 v62 = 0;
  uint64_t v5 = mach_absolute_time();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  unsigned __int8 v54 = (void *)objc_claimAutoreleasedReturnValue([v6 installationBlacklist]);

  unint64_t v7 = -[MIInstaller installOperationType](self, "installOperationType");
  if (v7 == 1)
  {
    if (qword_100095B28 != -1) {
      dispatch_once(&qword_100095B28, &stru_100081480);
    }
    uint64_t v8 = (os_log_s *)qword_100095B20;
    if (os_signpost_enabled((os_log_t)qword_100095B20))
    {
      *(_WORD *)buf = 0;
      unint64_t v9 = "StageUpdate";
      id v10 = "Start update staging";
LABEL_10:
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  v9,  v10,  buf,  2u);
    }
  }

  else
  {
    if (qword_100095B28 != -1) {
      dispatch_once(&qword_100095B28, &stru_100081480);
    }
    uint64_t v8 = (os_log_s *)qword_100095B20;
    if (os_signpost_enabled((os_log_t)qword_100095B20))
    {
      *(_WORD *)buf = 0;
      unint64_t v9 = "Install";
      id v10 = "Start installation";
      goto LABEL_10;
    }
  }

  if (qword_100095B28 != -1) {
    dispatch_once(&qword_100095B28, &stru_100081480);
  }
  id v11 = (os_log_s *)qword_100095B20;
  if (os_signpost_enabled((os_log_t)qword_100095B20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Stage",  "Start staging",  buf,  2u);
  }

  id v61 = 0LL;
  unsigned __int8 v12 = -[MIInstaller _takeOwnershipOfInstallableContainingSymlink:error:]( self,  "_takeOwnershipOfInstallableContainingSymlink:error:",  &v62,  &v61);
  id v13 = v61;
  if ((v12 & 1) == 0)
  {
    if (qword_100095B28 != -1) {
      dispatch_once(&qword_100095B28, &stru_100081480);
    }
    unsigned __int8 v25 = (os_log_s *)qword_100095B20;
    if (!os_signpost_enabled((os_log_t)qword_100095B20)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
    goto LABEL_42;
  }

  uint64_t v14 = qword_100095BF8;
  if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
    MOLogWrite(v14);
  }

  id v60 = v13;
  unsigned __int8 v16 = -[MIInstaller _setupPackageStateWithError:](self, "_setupPackageStateWithError:", &v60, v52);
  id v17 = v60;

  if ((v16 & 1) == 0)
  {
    if (qword_100095B28 != -1) {
      dispatch_once(&qword_100095B28, &stru_100081480);
    }
    unsigned int v26 = (os_log_s *)qword_100095B20;
    if (os_signpost_enabled((os_log_t)qword_100095B20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v26,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Stage",  "End staging [failed]",  buf,  2u);
    }

    unsigned __int8 v20 = 0LL;
    goto LABEL_37;
  }

  -[MIInstaller _fireCallbackWithStatus:percentComplete:]( self,  "_fireCallbackWithStatus:percentComplete:",  @"CreatingStagingDirectory",  5LL);
  -[MIInstaller _fireCallbackWithStatus:percentComplete:]( self,  "_fireCallbackWithStatus:percentComplete:",  @"ExtractingPackage",  15LL);
  id v59 = v17;
  unsigned __int8 v18 = -[MIInstaller _extractPackageContainedSymlink:withError:]( self,  "_extractPackageContainedSymlink:withError:",  &v62,  &v59);
  id v13 = v59;

  if ((v18 & 1) == 0)
  {
    if (qword_100095B28 != -1) {
      dispatch_once(&qword_100095B28, &stru_100081480);
    }
    unsigned __int8 v25 = (os_log_s *)qword_100095B20;
    if (!os_signpost_enabled((os_log_t)qword_100095B20)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
LABEL_42:
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v25,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Stage",  "End staging [failed]",  buf,  2u);
LABEL_43:
    unsigned __int8 v20 = 0LL;
    id v22 = 0LL;
    BOOL v27 = 0;
    goto LABEL_44;
  }

  -[MIInstaller _fireCallbackWithStatus:percentComplete:]( self,  "_fireCallbackWithStatus:percentComplete:",  @"InspectingPackage",  20LL);
  if (qword_100095B28 != -1) {
    dispatch_once(&qword_100095B28, &stru_100081480);
  }
  uint64_t v19 = (os_log_s *)qword_100095B20;
  if (os_signpost_enabled((os_log_t)qword_100095B20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Stage",  "End staging [succeeded]",  buf,  2u);
  }

  -[MIInstaller setStagingTime:]( self,  "setStagingTime:",  (mach_absolute_time() - v5) * qword_100095C00 / HIDWORD(qword_100095C00));
  id v58 = v13;
  unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller _discoverInstallableWithError:](self, "_discoverInstallableWithError:", &v58));
  id v17 = v58;

  if (!v20)
  {
LABEL_37:
    id v22 = 0LL;
    BOOL v27 = 0;
    id v13 = v17;
    goto LABEL_44;
  }

  id v53 = a3;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v21));

  if ([v54 intersectsSet:v22])
  {
    id v24 = sub_1000130F4( (uint64_t)"-[MIInstaller performInstallationWithError:]",  1185LL,  MIInstallerErrorDomain,  7LL,  0LL,  &off_10008AAE8,  @"Found blacklisted app in identifiers to be installed: %@",  v23,  (uint64_t)v22);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v24);

LABEL_80:
    BOOL v27 = 0;
    goto LABEL_81;
  }

  id v57 = v17;
  unsigned int v47 = -[MIInstaller _installProvisioningProfilesAtStagingRootWithError:]( self,  "_installProvisioningProfilesAtStagingRootWithError:",  &v57);
  id v13 = v57;

  if (!v47) {
    goto LABEL_80;
  }
  id v56 = v13;
  unsigned int v48 = -[MIInstaller _installProvisioningProfilesFromUserOptionsWithError:]( self,  "_installProvisioningProfilesFromUserOptionsWithError:",  &v56);
  id v49 = v56;

  if (!v48)
  {
    BOOL v27 = 0;
    id v13 = v49;
    goto LABEL_81;
  }

  id v55 = v49;
  unsigned int v50 = -[MIInstaller _installInstallable:containingSymlink:error:]( self,  "_installInstallable:containingSymlink:error:",  v20,  v62,  &v55);
  id v13 = v55;

  if (!v50) {
    goto LABEL_80;
  }
  id v51 = (void *)objc_claimAutoreleasedReturnValue([v20 installedDistributorID]);
  -[MIInstaller _logOperationCompletionWithStartTime:distributorID:]( self,  "_logOperationCompletionWithStartTime:distributorID:",  v5,  v51);

  BOOL v27 = 1;
LABEL_81:
  a3 = v53;
LABEL_44:
  if (v7 == 1)
  {
    if (qword_100095B28 != -1) {
      dispatch_once(&qword_100095B28, &stru_100081480);
    }
    v28 = (os_log_s *)qword_100095B20;
    if (os_signpost_enabled((os_log_t)qword_100095B20))
    {
      __int128 v29 = "failed";
      if (v27) {
        __int128 v29 = "succeeded";
      }
      *(_DWORD *)buf = 136315138;
      unint64_t v64 = v29;
      id v30 = "StageUpdate";
      __int128 v31 = "End staging update [%s]";
LABEL_57:
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v28,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  v30,  v31,  buf,  0xCu);
    }
  }

  else
  {
    if (qword_100095B28 != -1) {
      dispatch_once(&qword_100095B28, &stru_100081480);
    }
    v28 = (os_log_s *)qword_100095B20;
    if (os_signpost_enabled((os_log_t)qword_100095B20))
    {
      __int128 v32 = "failed";
      if (v27) {
        __int128 v32 = "succeeded";
      }
      *(_DWORD *)buf = 136315138;
      unint64_t v64 = v32;
      id v30 = "Install";
      __int128 v31 = "End installation [%s]";
      goto LABEL_57;
    }
  }

  unsigned __int8 v33 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));

  if (v33)
  {
    unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));
    sub_10004D608(v34);

    -[MIInstaller setLockedIdentifiers:](self, "setLockedIdentifiers:", 0LL);
  }

  uint64_t v35 = objc_claimAutoreleasedReturnValue(-[MIInstaller client](self, "client"));
  if (v35)
  {
    id v36 = (void *)v35;
    unsigned __int8 v37 = -[MIInstaller terminationAssertionReleased](self, "terminationAssertionReleased");

    if ((v37 & 1) == 0)
    {
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller client](self, "client"));
      [v38 releaseTerminationAssertion];

      -[MIInstaller setTerminationAssertionReleased:](self, "setTerminationAssertionReleased:", 1LL);
    }
  }

  ssize_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingRoot](self, "stagingRoot"));

  if (v39)
  {
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingRoot](self, "stagingRoot"));
    [v41 removeItemAtURL:v42 error:0];
  }

  if (v13) {
    char v43 = 1;
  }
  else {
    char v43 = v27;
  }
  if ((v43 & 1) == 0)
  {
    id v44 = sub_1000130F4( (uint64_t)"-[MIInstaller performInstallationWithError:]",  1232LL,  MIInstallerErrorDomain,  1LL,  0LL,  0LL,  @"No error was specified but the operation failed.",  v40,  (uint64_t)v52);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v44);
  }

  if (a3) {
    char v45 = v27;
  }
  else {
    char v45 = 1;
  }
  if ((v45 & 1) == 0) {
    *a3 = v13;
  }

  return v27;
}

- (BOOL)_applyStagedUpdateForUUID:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  uint64_t v63 = 0LL;
  unint64_t v64 = (id *)&v63;
  uint64_t v65 = 0x3032000000LL;
  int v66 = sub_100023C54;
  int v67 = sub_100023C64;
  id v68 = 0LL;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller identity](self, "identity"));
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472LL;
  v62[2] = sub_100027380;
  v62[3] = &unk_100081460;
  v62[4] = self;
  unsigned int v50 = objc_retainBlock(v62);
  uint64_t v47 = mach_absolute_time();
  if (!v5)
  {
    id v29 = sub_1000130F4( (uint64_t)"-[MIInstaller _applyStagedUpdateForUUID:withError:]",  1259LL,  MIInstallerErrorDomain,  217LL,  0LL,  0LL,  @"Finalizing staged install operation is missing staged bundle UUID",  v8,  v44);
    uint64_t v30 = objc_claimAutoreleasedReturnValue(v29);
    id v11 = 0LL;
    unsigned __int8 v16 = 0LL;
    id v10 = 0LL;
LABEL_19:
    id v49 = 0LL;
    id v14 = 0LL;
LABEL_20:
    uint64_t v32 = 0LL;
    receipt = (NSArray *)v64[5];
    v64[5] = (id)v30;
LABEL_21:

    goto LABEL_24;
  }

  if (qword_100095B28 != -1) {
    dispatch_once(&qword_100095B28, &stru_100081480);
  }
  unint64_t v9 = (os_log_s *)qword_100095B20;
  if (os_signpost_enabled((os_log_t)qword_100095B20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "InstallStagedUpdate",  "Start Applying Staged Update",  buf,  2u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 personaUniqueString]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MIJournal sharedInstance](&OBJC_CLASS___MIJournal, "sharedInstance"));
  id v14 = (id)objc_claimAutoreleasedReturnValue([v11 journalEntryForUniqueIdentifier:v5]);
  if (!v14)
  {
    id v31 = sub_1000130F4( (uint64_t)"-[MIInstaller _applyStagedUpdateForUUID:withError:]",  1269LL,  MIInstallerErrorDomain,  218LL,  0LL,  0LL,  @"Failed to find matching journal entry for making staged install live operation: %@",  v13,  (uint64_t)v5);
    uint64_t v30 = objc_claimAutoreleasedReturnValue(v31);
    unsigned __int8 v16 = 0LL;
    goto LABEL_19;
  }

  if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
  {
    uint64_t v44 = (uint64_t)v14;
    MOLogWrite(qword_100095BF8);
  }

  _MILogTransactionStep(14LL, 1LL, 1LL, v7, v10, 0LL, v12, v13, v44);
  [v14 setProgressBlock:v50];
  uint64_t v15 = v64;
  id obj = v64[5];
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue( -[MIInstaller _identifiersToLockBundleIdentifier:error:]( self,  "_identifiersToLockBundleIdentifier:error:",  v7,  &obj));
  objc_storeStrong(v15 + 5, obj);
  if (!v16)
  {
    id v49 = 0LL;
    goto LABEL_23;
  }

  -[MIInstaller _writeLockIdentifiers:](self, "_writeLockIdentifiers:", v16);
  id v17 = v64;
  id v60 = v64[5];
  unsigned __int8 v18 = [v14 makeStagedBackgroundUpdateLive:&v60];
  objc_storeStrong(v17 + 5, v60);
  if ((v18 & 1) == 0)
  {
    id v43 = sub_1000130F4( (uint64_t)"-[MIInstaller _applyStagedUpdateForUUID:withError:]",  1288LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Failed to make staged background update live for app identity: %@",  v19,  (uint64_t)v6);
    uint64_t v30 = objc_claimAutoreleasedReturnValue(v43);
    id v49 = 0LL;
    goto LABEL_20;
  }

  id v49 = (NSArray *)objc_claimAutoreleasedReturnValue([v14 bundleRecordsToRegister]);
  unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));

  if (v20)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));
    sub_10004D608(v21);

    -[MIInstaller setLockedIdentifiers:](self, "setLockedIdentifiers:", 0LL);
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller client](self, "client"));
  [v22 releaseTerminationAssertion];

  -[MIInstaller setTerminationAssertionReleased:](self, "setTerminationAssertionReleased:", 1LL);
  context = objc_autoreleasePoolPush();
  uint64_t v56 = 0LL;
  id v57 = &v56;
  uint64_t v58 = 0x2020000000LL;
  char v59 = 0;
  id v23 = sub_10000D8B4();
  id v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v23);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100027390;
  block[3] = &unk_100080C38;
  id v14 = v14;
  id v53 = v14;
  unsigned __int8 v54 = &v63;
  id v55 = &v56;
  dispatch_sync(v24, block);

  LODWORD(v24) = *((unsigned __int8 *)v57 + 24);
  _Block_object_dispose(&v56, 8);
  objc_autoreleasePoolPop(context);
  if (!(_DWORD)v24)
  {
    -[MIInstaller _logOperationCompletionWithStartTime:distributorID:]( self,  "_logOperationCompletionWithStartTime:distributorID:",  v47,  @"Unknown");
    unsigned __int8 v25 = (LSRecordPromise *)objc_claimAutoreleasedReturnValue([v14 recordPromise]);
    recordPromise = self->_recordPromise;
    self->_recordPromise = v25;

    if (-[NSArray count](v49, "count"))
    {
      BOOL v27 = v49;
      receipt = self->_receipt;
      id v49 = v27;
      self->_receipt = v27;
    }

    else
    {
      receipt = self->_receipt;
      self->_receipt = (NSArray *)&__NSArray0__struct;
    }

    uint64_t v32 = 1LL;
    goto LABEL_21;
  }

- (BOOL)applyStagedUpdateForUUID:(id)a3 withError:(id *)a4
{
  return -[MIInstaller _applyStagedUpdateForUUID:withError:](self, "_applyStagedUpdateForUUID:withError:", a3, a4);
}

- (NSArray)receipt
{
  return self->_receipt;
}

- (LSRecordPromise)recordPromise
{
  return self->_recordPromise;
}

- (NSString)stagedJournalEntryUniqueID
{
  return self->_stagedJournalEntryUniqueID;
}

- (NSURL)installURL
{
  return self->_installURL;
}

- (void)setInstallURL:(id)a3
{
}

- (unint64_t)installationDomain
{
  return self->_installationDomain;
}

- (MIInstallOptions)options
{
  return self->_options;
}

- (MIClientConnection)client
{
  return self->_client;
}

- (NSURL)stagingRoot
{
  return self->_stagingRoot;
}

- (void)setStagingRoot:(id)a3
{
}

- (NSURL)stagingURL
{
  return self->_stagingURL;
}

- (void)setStagingURL:(id)a3
{
}

- (unsigned)packageFormat
{
  return self->_packageFormat;
}

- (void)setPackageFormat:(unsigned __int8)a3
{
  self->_packageFormat = a3;
}

- (NSArray)lockedIdentifiers
{
  return self->_lockedIdentifiers;
}

- (void)setLockedIdentifiers:(id)a3
{
}

- (MIAppIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (BOOL)terminationAssertionReleased
{
  return self->_terminationAssertionReleased;
}

- (void)setTerminationAssertionReleased:(BOOL)a3
{
  self->_terminationAssertionReleased = a3;
}

- (unint64_t)stagingTime
{
  return self->_stagingTime;
}

- (void)setStagingTime:(unint64_t)a3
{
  self->_stagingTime = a3;
}

- (unint64_t)waitingTime
{
  return self->_waitingTime;
}

- (void)setWaitingTime:(unint64_t)a3
{
  self->_waitingTime = a3;
}

- (unint64_t)preflightAndPatchTime
{
  return self->_preflightAndPatchTime;
}

- (void)setPreflightAndPatchTime:(unint64_t)a3
{
  self->_preflightAndPatchTime = a3;
}

- (unint64_t)verificationTime
{
  return self->_verificationTime;
}

- (void)setVerificationTime:(unint64_t)a3
{
  self->_verificationTime = a3;
}

- (unint64_t)installOperationType
{
  return self->_installOperationType;
}

- (void)setInstallOperationType:(unint64_t)a3
{
  self->_installOperationType = a3;
}

- (void).cxx_destruct
{
}

@end