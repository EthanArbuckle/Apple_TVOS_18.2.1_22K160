@interface MISafeHarborManager
+ (id)defaultManager;
- (BOOL)fromMIH_createSafeHarborWithIdentifier:(id)a3 forPersona:(id)a4 containerType:(unint64_t)a5 andMigrateDataFrom:(id)a6 containsOneOrMoreSymlinks:(BOOL)a7 withError:(id *)a8;
@end

@implementation MISafeHarborManager

+ (id)defaultManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A738;
  block[3] = &unk_10001C9A8;
  block[4] = a1;
  if (qword_100021680 != -1) {
    dispatch_once(&qword_100021680, block);
  }
  return (id)qword_100021678;
}

- (BOOL)fromMIH_createSafeHarborWithIdentifier:(id)a3 forPersona:(id)a4 containerType:(unint64_t)a5 andMigrateDataFrom:(id)a6 containsOneOrMoreSymlinks:(BOOL)a7 withError:(id *)a8
{
  BOOL v9 = a7;
  id v71 = a3;
  id v70 = a4;
  id v13 = a6;
  uint64_t v88 = 0LL;
  v89 = &v88;
  uint64_t v90 = 0x3032000000LL;
  v91 = sub_10000B034;
  v92 = sub_10000B044;
  id v93 = 0LL;
  v69 = (void *)objc_claimAutoreleasedReturnValue([v13 URLByAppendingPathComponent:@"Container" isDirectory:1]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 URLByAppendingPathComponent:@"Info" isDirectory:1]);
  v72 = (void *)objc_claimAutoreleasedReturnValue([v14 URLByAppendingPathComponent:@"Info.plist" isDirectory:0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  v17 = v15;
  if (a5 > 7 || ((1LL << a5) & 0x94) == 0)
  {
    id v22 = _CreateAndLogError( (uint64_t)"-[MISafeHarborManager fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDat aFrom:containsOneOrMoreSymlinks:withError:]",  71LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Safe harbors are not supported for container type %ld",  v16,  a5);
    uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
LABEL_12:
    id v25 = (id)v23;
    v26 = 0LL;
    v27 = 0LL;
    goto LABEL_13;
  }

  if (v9)
  {
    if ([v15 itemIsSymlinkAtURL:v69 error:0])
    {
      v19 = @"Safe harbor's Container directory at %@ is unexpectedly a symlink.";
      uint64_t v20 = 79LL;
      uint64_t v21 = (uint64_t)v69;
LABEL_11:
      id v24 = _CreateAndLogError( (uint64_t)"-[MISafeHarborManager fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateD ataFrom:containsOneOrMoreSymlinks:withError:]",  v20,  MIInstallerErrorDomain,  160LL,  0LL,  0LL,  v19,  v18,  v21);
      uint64_t v23 = objc_claimAutoreleasedReturnValue(v24);
      goto LABEL_12;
    }

    if ([v17 itemIsSymlinkAtURL:v14 error:0])
    {
      v19 = @"Safe harbor's Info directory at %@ is unexpectedly a symlink.";
      uint64_t v20 = 84LL;
      uint64_t v21 = (uint64_t)v14;
      goto LABEL_11;
    }

    if ([v17 itemIsSymlinkAtURL:v72 error:0])
    {
      v19 = @"Safe harbor's Info.plist at %@ is unexpectedly a symlink.";
      uint64_t v20 = 89LL;
      uint64_t v21 = (uint64_t)v72;
      goto LABEL_11;
    }
  }

  id v87 = 0LL;
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v72,  &v87));
  id v33 = v87;
  if (!v27)
  {
    id v39 = _CreateAndLogError( (uint64_t)"-[MISafeHarborManager fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDat aFrom:containsOneOrMoreSymlinks:withError:]",  98LL,  MIInstallerErrorDomain,  31LL,  v33,  0LL,  @"Could not load safe harbor Info.plist at path %@",  v32,  (uint64_t)v72);
    id v25 = (id)objc_claimAutoreleasedReturnValue(v39);
    v26 = 0LL;
    v27 = 0LL;
    goto LABEL_39;
  }

  id v86 = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[MIDataContainer containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:]( &OBJC_CLASS___MIDataContainer,  "containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:",  v71,  v70,  a5,  0LL,  0LL,  &v86));
  id v25 = v86;

  if (v34)
  {

    id v36 = _CreateAndLogError( (uint64_t)"-[MISafeHarborManager fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDat aFrom:containsOneOrMoreSymlinks:withError:]",  107LL,  MIInstallerErrorDomain,  32LL,  0LL,  0LL,  @"Safe harbor already exists with identifier %@ persona %@ for type %ld",  v35,  (uint64_t)v71);
    id v37 = (id)objc_claimAutoreleasedReturnValue(v36);
    v26 = 0LL;
    id v28 = 0LL;
    id v33 = v25;
LABEL_25:
    id v25 = v37;
    goto LABEL_40;
  }

  id v33 = (id)objc_claimAutoreleasedReturnValue([v25 domain]);
  if (![v33 isEqualToString:MIContainerManagerErrorDomain])
  {
LABEL_38:
    v26 = 0LL;
    goto LABEL_39;
  }

  id v40 = [v25 code];

  if (v40 == (id)21)
  {
    id v85 = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[MIDataContainer tempContainerWithIdentifier:forPersona:ofContentClass:error:]( &OBJC_CLASS___MIDataContainer,  "tempContainerWithIdentifier:forPersona:ofContentClass:error:",  v71,  v70,  a5,  &v85));
    id v33 = v85;

    if (v26)
    {
      id v28 = (id)objc_claimAutoreleasedReturnValue([v26 containerURL]);
      if (v28)
      {
        id v84 = v33;
        unsigned __int8 v66 = [v26 setInfoValue:v27 forKey:@"com.apple.MobileContainerManager.SafeHarborInfo" error:&v84];
        id v43 = v84;

        if ((v66 & 1) == 0)
        {
          id v33 = v43;
          id v51 = _CreateAndLogError( (uint64_t)"-[MISafeHarborManager fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigr ateDataFrom:containsOneOrMoreSymlinks:withError:]",  129LL,  MIInstallerErrorDomain,  21LL,  v43,  0LL,  @"Failed to set safe harbor attribute on new safe harbor container with identifier %@ persona %@ type %ld: %@",  v44,  (uint64_t)v71);
          id v37 = (id)objc_claimAutoreleasedReturnValue(v51);
          goto LABEL_25;
        }

        v63 = v43;
        v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%ld",  v71,  a5));
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
        v46 = (void *)objc_claimAutoreleasedReturnValue([v45 dataContainerRootItemNames]);

        v77[0] = _NSConcreteStackBlock;
        v77[1] = 3221225472LL;
        v77[2] = sub_10000B04C;
        v77[3] = &unk_10001C9D0;
        BOOL v83 = a5 != 7;
        id v67 = v64;
        id v78 = v67;
        id v47 = v46;
        id v79 = v47;
        id v28 = v28;
        id v80 = v28;
        id v81 = v17;
        v82 = &v88;
        id v65 = v81;
        id v33 = (id)objc_claimAutoreleasedReturnValue([v81 enumerateURLsForItemsInDirectoryAtURL:v69 ignoreSymlinks:1 withBlock:v77]);

        v48 = (void *)v89[5];
        if (v48)
        {
          id v37 = v48;
          goto LABEL_25;
        }

        if (v33)
        {
          id v68 = (id)objc_claimAutoreleasedReturnValue([v69 path]);
          id v53 = _CreateAndLogError( (uint64_t)"-[MISafeHarborManager fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigr ateDataFrom:containsOneOrMoreSymlinks:withError:]",  197LL,  MIInstallerErrorDomain,  21LL,  v33,  0LL,  @"Failed to enumerate URLs for items in safe harbor's container directory at %@ : %@",  v52,  (uint64_t)v68);
          id v25 = (id)objc_claimAutoreleasedReturnValue(v53);
        }

        else
        {
          id v76 = 0LL;
          unsigned __int8 v54 = [v26 recreateDefaultStructureWithError:&v76];
          id v55 = v76;
          id v33 = v55;
          if ((v54 & 1) == 0)
          {
            id v61 = _CreateAndLogError( (uint64_t)"-[MISafeHarborManager fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMi grateDataFrom:containsOneOrMoreSymlinks:withError:]",  203LL,  MIInstallerErrorDomain,  21LL,  v55,  0LL,  @"Failed to recreate default container structure for container with identifier %@ persona %@ type %ld: %@",  v56,  (uint64_t)v71);
            id v37 = (id)objc_claimAutoreleasedReturnValue(v61);
            goto LABEL_25;
          }

          id v75 = v55;
          unsigned __int8 v57 = [v26 makeContainerLiveWithError:&v75];
          id v68 = v75;

          if ((v57 & 1) != 0)
          {
            id v74 = v68;
            unsigned __int8 v59 = [v65 removeItemAtURL:v13 error:&v74];
            id v25 = v74;

            if ((v59 & 1) != 0 || (uint64_t v60 = gLogHandle) != 0 && *(int *)(gLogHandle + 44) < 3)
            {
              BOOL v31 = 1;
              goto LABEL_27;
            }

            id v30 = (id)objc_claimAutoreleasedReturnValue([v13 path]);
            MOLogWrite(v60);
            BOOL v31 = 1;
            goto LABEL_21;
          }

          id v62 = _CreateAndLogError( (uint64_t)"-[MISafeHarborManager fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigr ateDataFrom:containsOneOrMoreSymlinks:withError:]",  209LL,  MIInstallerErrorDomain,  21LL,  v68,  0LL,  @"Failed to make safe harbor active for container with identifier %@ persona %@ type %ld: %@",  v58,  (uint64_t)v71);
          id v25 = (id)objc_claimAutoreleasedReturnValue(v62);
        }

        id v33 = v68;
LABEL_40:

        if (!a8) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }

      id v50 = _CreateAndLogError( (uint64_t)"-[MISafeHarborManager fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateD ataFrom:containsOneOrMoreSymlinks:withError:]",  123LL,  MIInstallerErrorDomain,  21LL,  0LL,  0LL,  @"Failed to get URL for new safe harbor container with identifier %@ persona %@ type %ld: %@",  v42,  (uint64_t)v71);
      id v25 = (id)objc_claimAutoreleasedReturnValue(v50);
LABEL_39:
      id v28 = 0LL;
      goto LABEL_40;
    }

    id v49 = _CreateAndLogError( (uint64_t)"-[MISafeHarborManager fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDat aFrom:containsOneOrMoreSymlinks:withError:]",  117LL,  MIInstallerErrorDomain,  21LL,  v33,  0LL,  @"Failed to create container with identifier %@ of type %ld: %@",  v41,  (uint64_t)v71);
    id v25 = (id)objc_claimAutoreleasedReturnValue(v49);
    goto LABEL_38;
  }

  v26 = 0LL;
LABEL_13:
  id v28 = 0LL;
  if (a8) {
LABEL_14:
  }
    *a8 = v25;
LABEL_15:
  if (!v26)
  {
    BOOL v31 = 0;
    goto LABEL_27;
  }

  id v73 = 0LL;
  unsigned __int8 v29 = [v26 removeUnderlyingContainerWaitingForDeletion:0 error:&v73];
  id v30 = v73;
  BOOL v31 = 0;
LABEL_21:

LABEL_27:
  _Block_object_dispose(&v88, 8);

  return v31;
}

@end