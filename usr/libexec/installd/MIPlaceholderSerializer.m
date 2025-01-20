@interface MIPlaceholderSerializer
+ (BOOL)serializedPlaceholderForInstalledAppWithBundeID:(id)a3 personaUniqueString:(id)a4 atResultURL:(id)a5 onDevice:(int)a6 onBehalfOf:(id *)a7 withError:(id *)a8;
@end

@implementation MIPlaceholderSerializer

+ (BOOL)serializedPlaceholderForInstalledAppWithBundeID:(id)a3 personaUniqueString:(id)a4 atResultURL:(id)a5 onDevice:(int)a6 onBehalfOf:(id *)a7 withError:(id *)a8
{
  uint64_t v9 = *(void *)&a6;
  id v12 = a3;
  id v82 = a4;
  id v13 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  uint64_t v101 = 0LL;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  id v100 = 0LL;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stagingRootForDevice:v9 url:v13 identifier:&v101 error:&v100]);
  id v17 = v100;

  v78 = v13;
  v80 = v14;
  if (!v16)
  {
    v79 = 0LL;
    v19 = 0LL;
LABEL_13:
    v77 = 0LL;
    v81 = 0LL;
    id v75 = 0LL;
    id v34 = 0LL;
    v22 = 0LL;
LABEL_14:
    v35 = 0LL;
    v76 = 0LL;
    v36 = 0LL;
    v23 = 0LL;
    goto LABEL_32;
  }

  id v99 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerWithIdentifier:createIfNeeded:created:error:",  v12,  0LL,  0LL,  &v99));
  id v20 = v99;

  if (!v19)
  {
    v79 = 0LL;
    v76 = 0LL;
    v77 = 0LL;
    v81 = 0LL;
    id v75 = 0LL;
    id v34 = 0LL;
    v22 = 0LL;
    v35 = 0LL;
    v36 = 0LL;
    v23 = 0LL;
LABEL_31:
    id v17 = v20;
    goto LABEL_32;
  }

  v72 = a7;
  v81 = (void *)objc_claimAutoreleasedReturnValue([v19 bundle]);
  if (!v81)
  {
    id v37 = sub_1000130F4( (uint64_t)"+[MIPlaceholderSerializer serializedPlaceholderForInstalledAppWithBundeID:personaUniqueString:atRes ultURL:onDevice:onBehalfOf:withError:]",  59LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Failed to locate app bundle in container for %@",  v21,  (uint64_t)v12);
    id v17 = (id)objc_claimAutoreleasedReturnValue(v37);

    v79 = 0LL;
    goto LABEL_13;
  }

  id v98 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue([v14 createTemporaryDirectoryInDirectoryURL:v16 error:&v98]);
  id v17 = v98;

  if (!v22)
  {
    v79 = 0LL;
    v77 = 0LL;
    id v75 = 0LL;
    id v34 = 0LL;
    goto LABEL_14;
  }

  id v97 = v17;
  v23 = (void *)objc_claimAutoreleasedReturnValue([v14 createTemporaryDirectoryInDirectoryURL:v22 error:&v97]);
  id v20 = v97;

  if (!v23)
  {
    v36 = 0LL;
    id v75 = 0LL;
    v76 = 0LL;
    v77 = 0LL;
    v79 = 0LL;
    id v34 = 0LL;
LABEL_30:
    [v80 removeItemAtURL:v22 error:0];
    v35 = 0LL;
    goto LABEL_31;
  }

  id v70 = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 URLByAppendingPathComponent:@"Payload" isDirectory:1]);
  id v96 = v20;
  unsigned int v25 = [v14 createDirectoryAtURL:v24 withIntermediateDirectories:0 mode:493 error:&v96];
  id v26 = v96;

  if (!v25)
  {
    id v75 = 0LL;
    v76 = 0LL;
    v77 = 0LL;
    v79 = 0LL;
    id v20 = v26;
    v23 = 0LL;
    id v34 = v70;
    v36 = v24;
    goto LABEL_30;
  }

  v67 = v22;
  v27 = (void *)objc_claimAutoreleasedReturnValue([v81 bundleName]);
  v66 = v24;
  uint64_t v28 = objc_claimAutoreleasedReturnValue([v24 URLByAppendingPathComponent:v27 isDirectory:1]);

  v69 = (void *)v28;
  if ([v81 isPlaceholder])
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue([v81 bundleURL]);
    id v95 = v26;
    unsigned __int8 v30 = [v14 copyItemAtURL:v29 toURL:v28 error:&v95];
    v31 = v14;
    unsigned __int8 v32 = v30;
    id v33 = v95;

    v79 = 0LL;
    v22 = v67;
    if ((v32 & 1) == 0)
    {
      id v75 = 0LL;
      v76 = 0LL;
      id v20 = v33;
      v77 = 0LL;
LABEL_29:
      v23 = v69;
      id v34 = v70;
      v36 = v24;
      goto LABEL_30;
    }
  }

  else
  {
    id v38 = objc_alloc(&OBJC_CLASS___MIPlaceholderConstructor);
    v39 = (void *)objc_claimAutoreleasedReturnValue([v81 bundleURL]);
    id v94 = v26;
    id v40 = [v38 initWithSource:v39 byPreservingFullInfoPlist:1 error:&v94];
    id v20 = v94;

    if (!v40)
    {
      id v75 = 0LL;
      v76 = 0LL;
      v77 = 0LL;
      v79 = 0LL;
      v22 = v67;
      goto LABEL_29;
    }

    id v93 = v20;
    v79 = v40;
    unsigned int v41 = [v40 materializeIntoBundleDirectory:v69 error:&v93];
    id v33 = v93;

    v22 = v67;
    if (!v41)
    {
      id v75 = 0LL;
      v76 = 0LL;
      v77 = 0LL;
      id v20 = v33;
      goto LABEL_29;
    }

    v31 = v14;
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue([v19 containerURL]);
  uint64_t v43 = objc_claimAutoreleasedReturnValue([v42 URLByAppendingPathComponent:@"iTunesMetadata.plist" isDirectory:0]);

  v44 = (void *)objc_claimAutoreleasedReturnValue([v70 URLByAppendingPathComponent:@"iTunesMetadata.plist" isDirectory:0]);
  id v92 = v33;
  v76 = (void *)v43;
  LODWORD(v43) = [v31 copyItemIfExistsAtURL:v43 toURL:v44 error:&v92];
  id v20 = v92;

  if (!(_DWORD)v43)
  {
    id v75 = 0LL;
    v77 = 0LL;
    goto LABEL_29;
  }

  v68 = v20;
  v45 = (void *)objc_claimAutoreleasedReturnValue([v13 lastPathComponent]);
  v46 = (void *)objc_claimAutoreleasedReturnValue([v22 URLByAppendingPathComponent:v45 isDirectory:0]);

  v47 = (void *)objc_claimAutoreleasedReturnValue([v22 lastPathComponent]);
  v48 = (void *)objc_claimAutoreleasedReturnValue([v13 lastPathComponent]);
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@", v47, v48));

  id v49 = v46;
  v50 = fopen((const char *)[v49 fileSystemRepresentation], "wx");
  if (!v50)
  {
    int v55 = *__error();
    id v75 = v49;
    id v56 = [v75 fileSystemRepresentation];
    strerror(v55);
    id v58 = sub_1000130F4( (uint64_t)"+[MIPlaceholderSerializer serializedPlaceholderForInstalledAppWithBundeID:personaUniqueString:atRes ultURL:onDevice:onBehalfOf:withError:]",  108LL,  NSPOSIXErrorDomain,  v55,  0LL,  0LL,  @"Failed to create output file %s: %s",  v57,  (uint64_t)v56);
    id v20 = (id)objc_claimAutoreleasedReturnValue(v58);

    goto LABEL_29;
  }

  id v75 = v49;
  uint64_t v91 = 0LL;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  uint64_t v86 = 0LL;
  __int128 v88 = 0u;
  memset(v85, 0, sizeof(v85));
  v65 = v50;
  v87 = v50;
  v102[0] = kSZArchiverOptionCompressionOptions;
  v102[1] = kSZArchiverOptionNoCache;
  v102[2] = kSZArchiverOptionZlibCompressionLevel;
  v102[3] = kSZArchiverOptionSkipPrescan;
  v103[2] = &off_10008A128;
  v103[3] = &__kCFBooleanFalse;
  v103[0] = kSZArchiverCompressionOptionTryRecompress;
  v103[1] = &__kCFBooleanTrue;
  v102[4] = kSZArchiverOptionUncompressBloatedFiles;
  v103[4] = &__kCFBooleanTrue;
  v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v103,  v102,  5LL));
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v51));

  id v34 = v70;
  v36 = v66;
  if (SZArchiverCreateStreamableZip([v34 fileSystemRepresentation], v85, v35, 0))
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[MIHelperServiceClient sharedInstance](&OBJC_CLASS___MIHelperServiceClient, "sharedInstance"));
    id v84 = v68;
    __int128 v53 = *(_OWORD *)&v72->var0[4];
    v83[0] = *(_OWORD *)v72->var0;
    v83[1] = v53;
    v73 = v52;
    unsigned __int8 v54 = [v52 moveItemInStagingDirectory:v101 atRelativePath:v77 toDestinationURL:v78 onBehalfOf:v83 withError:&v84];
    id v17 = v84;

    v23 = v69;
  }

  else
  {
    v62 = (void *)MIInstallerErrorDomain;
    v23 = v69;
    v73 = (void *)objc_claimAutoreleasedReturnValue([v69 path]);
    id v64 = sub_1000130F4( (uint64_t)"+[MIPlaceholderSerializer serializedPlaceholderForInstalledAppWithBundeID:personaUniqueString:atRes ultURL:onDevice:onBehalfOf:withError:]",  124LL,  v62,  4LL,  0LL,  0LL,  @"Failed to archive contents of %@",  v63,  (uint64_t)v73);
    id v17 = (id)objc_claimAutoreleasedReturnValue(v64);

    unsigned __int8 v54 = 0;
  }

  [v80 removeItemAtURL:v22 error:0];
  fclose(v65);
  if ((v54 & 1) != 0)
  {
    BOOL v74 = 1;
    goto LABEL_35;
  }

@end