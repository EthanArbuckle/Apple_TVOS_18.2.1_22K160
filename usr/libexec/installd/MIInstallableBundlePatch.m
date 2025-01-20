@interface MIInstallableBundlePatch
- (BOOL)_applyDeltaPatchWithError:(id *)a3;
- (BOOL)_applyParallelPatchProcessingArchiveSection:(BOOL)a3 withError:(id *)a4;
- (BOOL)applyPatchWithError:(id *)a3;
- (MIInstallableBundlePatch)initWithBundle:(id)a3 inStagingRoot:(id)a4 packageFormat:(unsigned __int8)a5 identity:(id)a6 domain:(unint64_t)a7 installOptions:(id)a8 manifestURL:(id)a9 existingBundleContainer:(id)a10 patchType:(unsigned __int8)a11 operationType:(unint64_t)a12 error:(id *)a13;
- (NSString)existingBundleShortVersion;
- (NSString)existingBundleVersion;
- (NSString)patchTypeName;
- (NSString)updatedBundleShortVersion;
- (NSString)updatedBundleVersion;
- (NSURL)manifestURL;
- (unsigned)patchType;
@end

@implementation MIInstallableBundlePatch

- (MIInstallableBundlePatch)initWithBundle:(id)a3 inStagingRoot:(id)a4 packageFormat:(unsigned __int8)a5 identity:(id)a6 domain:(unint64_t)a7 installOptions:(id)a8 manifestURL:(id)a9 existingBundleContainer:(id)a10 patchType:(unsigned __int8)a11 operationType:(unint64_t)a12 error:(id *)a13
{
  uint64_t v16 = a5;
  id v58 = a9;
  v59.receiver = self;
  v59.super_class = (Class)&OBJC_CLASS___MIInstallableBundlePatch;
  v20 = -[MIInstallableBundle initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:existingBundleContainer:operationType:error:]( &v59,  "initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:existingBundleContainer:operationType:error:",  a3,  a4,  v16,  a6,  a7,  a8);
  v22 = v20;
  if (!v20) {
    goto LABEL_6;
  }
  if (!a10)
  {
    if (a13)
    {
      id v52 = sub_1000130F4( (uint64_t)"-[MIInstallableBundlePatch initWithBundle:inStagingRoot:packageFormat:identity:domain:installOpti ons:manifestURL:existingBundleContainer:patchType:operationType:error:]",  48LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"No installed app container supplied for patch update.",  v21,  (uint64_t)a10);
      v51 = 0LL;
      *a13 = (id)objc_claimAutoreleasedReturnValue(v52);
    }

    else
    {
      v51 = 0LL;
    }

    goto LABEL_15;
  }

  v23 = v58;
  if (v58)
  {
    if (a11)
    {
      objc_storeStrong((id *)&v20->_manifestURL, a9);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](v22, "bundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 infoPlistSubset]);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:kCFBundleVersionKey]);
      id v27 = sub_1000137D0(v26);
      uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
      updatedBundleVersion = v22->_updatedBundleVersion;
      v22->_updatedBundleVersion = (NSString *)v28;

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](v22, "bundle"));
      v31 = (void *)objc_claimAutoreleasedReturnValue([v30 infoPlistSubset]);
      uint64_t v32 = _kCFBundleShortVersionStringKey;
      v33 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:_kCFBundleShortVersionStringKey]);
      id v34 = sub_1000137D0(v33);
      uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);
      updatedBundleShortVersion = v22->_updatedBundleShortVersion;
      v22->_updatedBundleShortVersion = (NSString *)v35;

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](v22, "existingBundleContainer"));
      v38 = (void *)objc_claimAutoreleasedReturnValue([v37 bundle]);
      v39 = (void *)objc_claimAutoreleasedReturnValue([v38 infoPlistSubset]);
      v40 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:kCFBundleVersionKey]);
      id v41 = sub_1000137D0(v40);
      uint64_t v42 = objc_claimAutoreleasedReturnValue(v41);
      existingBundleVersion = v22->_existingBundleVersion;
      v22->_existingBundleVersion = (NSString *)v42;

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](v22, "existingBundleContainer"));
      v45 = (void *)objc_claimAutoreleasedReturnValue([v44 bundle]);
      v46 = (void *)objc_claimAutoreleasedReturnValue([v45 infoPlistSubset]);
      v47 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKeyedSubscript:v32]);
      id v48 = sub_1000137D0(v47);
      uint64_t v49 = objc_claimAutoreleasedReturnValue(v48);
      existingBundleShortVersion = v22->_existingBundleShortVersion;
      v22->_existingBundleShortVersion = (NSString *)v49;

      v22->_patchType = a11;
LABEL_6:
      v51 = v22;
LABEL_15:
      v23 = v58;
      goto LABEL_16;
    }

    if (a13)
    {
      v53 = (void *)MIInstallerErrorDomain;
      v54 = @"No patch type supplied for patch update.";
      uint64_t v55 = 58LL;
      goto LABEL_13;
    }

- (NSString)patchTypeName
{
  unsigned int v2 = -[MIInstallableBundlePatch patchType](self, "patchType") - 1;
  if (v2 > 2) {
    return (NSString *)@"Invalid";
  }
  else {
    return &off_1000816F8[(char)v2]->isa;
  }
}

- (BOOL)_applyDeltaPatchWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundle]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleURL]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathComponent:@"Info.plist" isDirectory:0]);

  id v60 = 0LL;
  uint64_t v9 = MICreateSHA256Digest(v8, &v60);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v12 = v60;
  if (!v10)
  {
    id v28 = sub_1000130F4( (uint64_t)"-[MIInstallableBundlePatch _applyDeltaPatchWithError:]",  91LL,  MIInstallerErrorDomain,  8LL,  v12,  &off_10008AB10,  @"Failed to get Info.plist hash for %@",  v11,  (uint64_t)v8);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

    v15 = 0LL;
    if (a3) {
      goto LABEL_8;
    }
LABEL_12:
    BOOL v27 = 0;
    id v12 = v29;
    goto LABEL_13;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundle]);
  v15 = (const __CFArray *)objc_claimAutoreleasedReturnValue([v14 supportedDevices]);

  objc_opt_class(&OBJC_CLASS___NSString);
  if ((sub_100013434(v15) & 1) == 0)
  {
    id v30 = sub_1000130F4( (uint64_t)"-[MIInstallableBundlePatch _applyDeltaPatchWithError:]",  97LL,  MIInstallerErrorDomain,  87LL,  0LL,  &off_10008AB38,  @"Existing app's SupportedDevices Info.plist key does not contain only string values.",  v16,  v41);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v30);

    if (a3) {
      goto LABEL_8;
    }
    goto LABEL_12;
  }

  v43 = a3;
  v45 = v8;
  MIAssertHighResourceUsage();
  CFErrorRef v59 = 0LL;
  id v56 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  v54 = (void *)objc_claimAutoreleasedReturnValue([v56 bundle]);
  id v52 = objc_claimAutoreleasedReturnValue([v54 bundleURL]);
  id v48 = (char *)[v52 fileSystemRepresentation];
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  id v50 = objc_claimAutoreleasedReturnValue([v51 bundleURL]);
  v47 = (const char *)[v50 fileSystemRepresentation];
  id v49 = objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch manifestURL](self, "manifestURL"));
  v46 = (const char *)[v49 fileSystemRepresentation];
  id v17 = objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch existingBundleVersion](self, "existingBundleVersion"));
  v18 = (const char *)[v17 UTF8String];
  id v19 = objc_claimAutoreleasedReturnValue( -[MIInstallableBundlePatch existingBundleShortVersion]( self, "existingBundleShortVersion"));
  id v58 = v15;
  v20 = (const char *)[v19 UTF8String];
  v44 = v10;
  id v21 = [v10 UTF8String];
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 bundle]);
  id v24 = objc_claimAutoreleasedReturnValue([v23 executableURL]);
  id v25 = [v24 fileSystemRepresentation];
  v26 = v20;
  v15 = v58;
  LOBYTE(v21) = sub_1000082AC(v48, v47, v46, v18, v26, v21, (uint64_t)v25, v58, 0LL, &v59);

  MIClearResourceAssertion();
  if ((v21 & 1) == 0)
  {
    v53 = (void *)MIInstallerErrorDomain;
    CFErrorRef v55 = v59;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v57 bundle]);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 bundleURL]);
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 path]);
    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 bundleURL]);
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 path]);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch manifestURL](self, "manifestURL"));
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v37 path]);
    id v39 = sub_1000130F4( (uint64_t)"-[MIInstallableBundlePatch _applyDeltaPatchWithError:]",  116LL,  v53,  8LL,  v55,  &off_10008AB60,  @"Could not hardlink copy %@ to %@ with manifest %@",  v38,  (uint64_t)v33);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v39);

    if (v59)
    {
      CFRelease(v59);
      CFErrorRef v59 = 0LL;
    }

    v10 = v44;
    v8 = v45;
    a3 = v43;
    v15 = v58;
    if (!v43) {
      goto LABEL_12;
    }
LABEL_8:
    id v12 = v29;
    BOOL v27 = 0;
    *a3 = v12;
    goto LABEL_13;
  }

  BOOL v27 = 1;
  v10 = v44;
  v8 = v45;
LABEL_13:

  return v27;
}

- (BOOL)_applyParallelPatchProcessingArchiveSection:(BOOL)a3 withError:(id *)a4
{
  BOOL v4 = a3;
  v62 = 0LL;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  unsigned int v51 = [v6 uid];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  unsigned int v49 = [v7 gid];

  if (v4) {
    int v8 = 256;
  }
  else {
    int v8 = 258;
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundle]);
  id v11 = objc_claimAutoreleasedReturnValue([v10 bundleURL]);
  id v47 = [v11 fileSystemRepresentation];
  v54[0] = v47;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  id v13 = objc_claimAutoreleasedReturnValue([v12 bundleURL]);
  id v14 = [v13 fileSystemRepresentation];
  v54[1] = v14;
  id v15 = objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch manifestURL](self, "manifestURL"));
  id v16 = [v15 fileSystemRepresentation];
  v54[2] = v16;
  int v55 = v8;
  char v56 = 15;
  unsigned int v57 = v51;
  unsigned int v58 = v49;
  __int128 v59 = xmmword_10005C340;
  id v60 = &v62;
  uint64_t v61 = 0LL;

  uint64_t v19 = qword_100095BF8;
  if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
  {
    id v44 = v14;
    id v45 = v16;
    id v42 = v47;
    uint64_t v19 = MOLogWrite(qword_100095BF8);
  }

  MIAssertHighResourceUsage(v19, v17, v18);
  uint64_t v20 = DirectoryPatch(v54);
  int v21 = v20;
  MIClearResourceAssertion(v20, v22, v23);
  if (v21)
  {
    int v50 = v21;
    id v24 = (void *)MIInstallerErrorDomain;
    id v25 = v62;
    id v52 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v52 bundle]);
    BOOL v27 = (void *)objc_claimAutoreleasedReturnValue([v26 bundleURL]);
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 path]);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 bundleURL]);
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 path]);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch manifestURL](self, "manifestURL"));
    v46 = (void *)objc_claimAutoreleasedReturnValue([v32 path]);
    id v34 = sub_1000130F4( (uint64_t)"-[MIInstallableBundlePatch _applyParallelPatchProcessingArchiveSection:withError:]",  182LL,  v24,  8LL,  v25,  &off_10008AB88,  @"DirectoryPatch failed for %@ to %@ with manifest %@",  v33,  (uint64_t)v28);
    id v35 = (id)objc_claimAutoreleasedReturnValue(v34);

    if (v25) {
    if (a4)
    }
    {
      id v35 = v35;
      *a4 = v35;
    }

    int v21 = v50;
  }

  else
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch manifestURL](self, "manifestURL"));
    id v53 = 0LL;
    unsigned __int8 v38 = [v36 removeItemAtURL:v37 error:&v53];
    id v35 = v53;

    if ((v38 & 1) == 0)
    {
      uint64_t v39 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch manifestURL](self, "manifestURL", v42, v44, v45));
        v43 = (void *)objc_claimAutoreleasedReturnValue([v40 path]);
        MOLogWrite(v39);
      }
    }
  }

  return v21 == 0;
}

- (BOOL)applyPatchWithError:(id *)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch manifestURL](self, "manifestURL"));

  if (!v5) {
    goto LABEL_18;
  }
  v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
  ((void (**)(void, const __CFString *, uint64_t))v6)[2](v6, @"PatchingApplication", 35LL);

  uint64_t v7 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch patchTypeName](self, "patchTypeName"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch existingBundleVersion](self, "existingBundleVersion"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch existingBundleShortVersion](self, "existingBundleShortVersion"));
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch updatedBundleVersion](self, "updatedBundleVersion"));
    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch updatedBundleShortVersion](self, "updatedBundleShortVersion"));
    v31 = v11;
    uint64_t v32 = v12;
    id v28 = v8;
    id v30 = v10;
    MOLogWrite(v7);
  }

  unsigned int v13 = -[MIInstallableBundlePatch patchType](self, "patchType", v28, v30, v31, v32, v33, v34);
  if (v13 == 1)
  {
    id v36 = 0LL;
    unsigned int v15 = -[MIInstallableBundlePatch _applyDeltaPatchWithError:](self, "_applyDeltaPatchWithError:", &v36);
    id v5 = v36;
    if (v15) {
      goto LABEL_13;
    }
    goto LABEL_20;
  }

  if (v13 != 2)
  {
    if (v13 == 3)
    {
      uint64_t v14 = 1LL;
      goto LABEL_12;
    }

    id v5 = 0LL;
LABEL_20:
    if (!a3) {
      goto LABEL_24;
    }
    goto LABEL_21;
  }

  uint64_t v14 = 0LL;
LABEL_12:
  id v35 = 0LL;
  unsigned __int8 v16 = -[MIInstallableBundlePatch _applyParallelPatchProcessingArchiveSection:withError:]( self,  "_applyParallelPatchProcessingArchiveSection:withError:",  v14,  &v35);
  id v5 = v35;
  if ((v16 & 1) == 0) {
    goto LABEL_20;
  }
LABEL_13:
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  if (([v17 allowPatchWithoutSinf] & 1) == 0)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sinfData]);
    if (v19)
    {

      goto LABEL_16;
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    unsigned int v23 = [v22 needsSinf];

    if (!v23) {
      goto LABEL_17;
    }
    id v25 = sub_1000130F4( (uint64_t)"-[MIInstallableBundlePatch applyPatchWithError:]",  245LL,  MIInstallerErrorDomain,  60LL,  0LL,  &off_10008ABB0,  @"Client requesting patch installation did not supply a new SINF for an app that requires one to function",  v24,  v29);
    uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);

    id v5 = (id)v26;
    if (!a3)
    {
LABEL_24:
      BOOL v21 = 0;
      goto LABEL_25;
    }

- (NSString)existingBundleVersion
{
  return self->_existingBundleVersion;
}

- (NSString)existingBundleShortVersion
{
  return self->_existingBundleShortVersion;
}

- (NSString)updatedBundleVersion
{
  return self->_updatedBundleVersion;
}

- (NSString)updatedBundleShortVersion
{
  return self->_updatedBundleShortVersion;
}

- (NSURL)manifestURL
{
  return self->_manifestURL;
}

- (unsigned)patchType
{
  return self->_patchType;
}

- (void).cxx_destruct
{
}

@end