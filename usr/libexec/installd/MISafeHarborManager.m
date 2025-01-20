@interface MISafeHarborManager
+ (id)defaultManager;
- (BOOL)registerSafeHarborAtURL:(id)a3 withOptions:(id)a4 forIdentifier:(id)a5 forPersona:(id)a6 ofType:(unint64_t)a7 error:(id *)a8;
- (BOOL)removeSafeHarborWithIdentifier:(id)a3 forPersona:(id)a4 ofType:(unint64_t)a5 options:(id)a6 error:(id *)a7;
- (id)safeHarborListForType:(unint64_t)a3 forPersona:(id)a4 withError:(id *)a5;
@end

@implementation MISafeHarborManager

+ (id)defaultManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100044064;
  block[3] = &unk_100080BC0;
  block[4] = a1;
  if (qword_100095BA8 != -1) {
    dispatch_once(&qword_100095BA8, block);
  }
  return (id)qword_100095BA0;
}

- (BOOL)registerSafeHarborAtURL:(id)a3 withOptions:(id)a4 forIdentifier:(id)a5 forPersona:(id)a6 ofType:(unint64_t)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v17 = a6;
  if (a7 > 7 || ((1LL << a7) & 0x94) == 0)
  {
    id v23 = sub_1000130F4( (uint64_t)"-[MISafeHarborManager registerSafeHarborAtURL:withOptions:forIdentifier:forPersona:ofType:error:]",  257LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Safe harbors are not supported for container type %ld",  v16,  a7);
    id v20 = (id)objc_claimAutoreleasedReturnValue(v23);
    if (!a8) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  sub_10004D4EC(v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MIHelperServiceClient sharedInstance](&OBJC_CLASS___MIHelperServiceClient, "sharedInstance"));
  id v24 = 0LL;
  unsigned int v19 = [v18 createSafeHarborWithIdentifier:v15 forPersona:v17 containerType:a7 andMigrateDataFrom:v13 withError:&v24];
  id v20 = v24;

  if (v19)
  {

    BOOL v21 = 1;
LABEL_12:
    sub_10004D608(v15);
    goto LABEL_13;
  }

  if (a8) {
LABEL_9:
  }
    *a8 = v20;
LABEL_10:

  BOOL v21 = 0;
  if (a7 <= 7 && ((1LL << a7) & 0x94) != 0) {
    goto LABEL_12;
  }
LABEL_13:

  return v21;
}

- (BOOL)removeSafeHarborWithIdentifier:(id)a3 forPersona:(id)a4 ofType:(unint64_t)a5 options:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v35 = a6;
  if (a5 > 7 || ((1LL << a5) & 0x94) == 0)
  {
    id v26 = sub_1000130F4( (uint64_t)"-[MISafeHarborManager removeSafeHarborWithIdentifier:forPersona:ofType:options:error:]",  312LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Safe harbors are not supported for container type %ld",  v13,  a5);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v26);
    if (!a7) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

  sub_10004D4EC(v11);
  id v38 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[MIContainer containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:]( &OBJC_CLASS___MIContainer,  "containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:",  v11,  v12,  a5,  0LL,  0LL,  &v38));
  id v15 = v38;
  id v17 = v15;
  if (!v14)
  {
    id v24 = sub_1000130F4( (uint64_t)"-[MISafeHarborManager removeSafeHarborWithIdentifier:forPersona:ofType:options:error:]",  321LL,  MIInstallerErrorDomain,  26LL,  v15,  0LL,  @"Safe harbor with identifier %@ persona %@ of type %ld not found",  v16,  (uint64_t)v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    goto LABEL_18;
  }

  id v37 = v15;
  v18 = (void *)objc_claimAutoreleasedReturnValue( [v14 infoValueForKey:@"com.apple.MobileContainerManager.SafeHarborInfo" error:&v37]);
  id v19 = v37;

  if (v18)
  {
    id v36 = v19;
    unsigned int v20 = [v14 removeUnderlyingContainerWaitingForDeletion:0 error:&v36];
    id v21 = v36;

    if (v20)
    {

      BOOL v23 = 1;
LABEL_22:
      sub_10004D608(v11);
      goto LABEL_23;
    }

    id v32 = sub_1000130F4( (uint64_t)"-[MISafeHarborManager removeSafeHarborWithIdentifier:forPersona:ofType:options:error:]",  337LL,  MIInstallerErrorDomain,  4LL,  v21,  0LL,  @"Failed to destroy safe harbor container %@",  v22,  (uint64_t)v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v32);

    id v19 = v14;
    id v14 = v18;
    goto LABEL_17;
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue([v19 domain]);
  if (![v27 isEqualToString:MIContainerManagerErrorDomain])
  {

    goto LABEL_15;
  }

  id v28 = [v19 code];

  if (v28 != (id)24)
  {
LABEL_15:
    id v33 = sub_1000130F4( (uint64_t)"-[MISafeHarborManager removeSafeHarborWithIdentifier:forPersona:ofType:options:error:]",  331LL,  MIInstallerErrorDomain,  4LL,  v19,  0LL,  @"Unable to get safe harbor container attribute from container %@ : %@",  v29,  (uint64_t)v14);
    uint64_t v31 = objc_claimAutoreleasedReturnValue(v33);
    goto LABEL_16;
  }

  id v30 = sub_1000130F4( (uint64_t)"-[MISafeHarborManager removeSafeHarborWithIdentifier:forPersona:ofType:options:error:]",  329LL,  MIInstallerErrorDomain,  26LL,  v19,  0LL,  @"Safe harbor with identifier %@ persona %@ of type %ld was already installed.",  v29,  (uint64_t)v11);
  uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
LABEL_16:
  v25 = (void *)v31;
LABEL_17:

  id v17 = v14;
LABEL_18:

  if (a7) {
LABEL_19:
  }
    *a7 = v25;
LABEL_20:

  BOOL v23 = 0;
  if (a5 <= 7 && ((1LL << a5) & 0x94) != 0) {
    goto LABEL_22;
  }
LABEL_23:

  return v23;
}

- (id)safeHarborListForType:(unint64_t)a3 forPersona:(id)a4 withError:(id *)a5
{
  id v33 = a4;
  id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
  if (a3 > 7 || ((1LL << a3) & 0x94) == 0)
  {
    id v28 = sub_1000130F4( (uint64_t)"-[MISafeHarborManager safeHarborListForType:forPersona:withError:]",  384LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Safe harbors are not supported for container type %ld",  v5,  a3);
    id v12 = (id)objc_claimAutoreleasedReturnValue(v28);
    id v27 = 0LL;
    goto LABEL_43;
  }

  sub_10004DA4C();
  id v43 = 0LL;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[MIContainer containersWithClass:personaUniqueString:error:]( &OBJC_CLASS___MIContainer,  "containersWithClass:personaUniqueString:error:",  a3,  v33,  &v43));
  id v7 = v43;
  v9 = v7;
  if (!v6)
  {
    id v26 = sub_1000130F4( (uint64_t)"-[MISafeHarborManager safeHarborListForType:forPersona:withError:]",  393LL,  MIInstallerErrorDomain,  4LL,  v7,  0LL,  @"Failed to get list of containers of type %ld for persona %@: %@",  v8,  a3);
    id v12 = (id)objc_claimAutoreleasedReturnValue(v26);
    id v27 = 0LL;
    goto LABEL_42;
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id obj = v6;
  id v10 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (!v10)
  {
    id v12 = v9;
    goto LABEL_41;
  }

  uint64_t v11 = *(void *)v40;
  uint64_t v36 = MIContainerManagerErrorDomain;
  id v12 = v9;
  do
  {
    uint64_t v13 = 0LL;
    id v14 = v12;
    do
    {
      if (*(void *)v40 != v11) {
        objc_enumerationMutation(obj);
      }
      id v15 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)v13);
      uint64_t v16 = objc_autoreleasePoolPush();
      id v38 = v14;
      id v17 = (void *)objc_claimAutoreleasedReturnValue( [v15 infoValueForKey:@"com.apple.MobileContainerManager.SafeHarborInfo" error:&v38]);
      id v12 = v38;

      if (v17)
      {
        objc_opt_class(&OBJC_CLASS___NSDictionary);
        id v18 = v17;
        if ((objc_opt_isKindOfClass(v18) & 1) != 0) {
          id v19 = v18;
        }
        else {
          id v19 = 0LL;
        }

        if (v19)
        {
          id v22 = [v18 mutableCopy];
          BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v15 containerURL]);
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 path]);

          if (v24)
          {
            [v22 setObject:v24 forKeyedSubscript:@"HarborPathKey"];
            v25 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
            if (v25)
            {
              [v35 setObject:v22 forKeyedSubscript:v25];
            }

            else if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
            {
              MOLogWrite(qword_100095BF8);
            }
          }

          else if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
          {
            MOLogWrite(qword_100095BF8);
          }
        }

        else if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
        {
          goto LABEL_22;
        }
      }

      else
      {
        unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v12 domain]);
        if ([v20 isEqualToString:v36])
        {
          BOOL v21 = [v12 code] == (id)24;

          if (v21) {
            goto LABEL_35;
          }
        }

        else
        {
        }

        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3) {
LABEL_22:
        }
          MOLogWrite(qword_100095BF8);
      }

@end