@interface RMReport
+ (id)internalStateArchiveWithContext:(id)a3;
+ (id)managementSources;
+ (id)orphanedEntities;
+ (id)reportWithContext:(id)a3 allInformation:(BOOL)a4;
@end

@implementation RMReport

+ (id)reportWithContext:(id)a3 allInformation:(BOOL)a4
{
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  v14 = sub_10000C2DC;
  v15 = sub_10000C2EC;
  id v16 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000C2F4;
  v7[3] = &unk_10001C740;
  v9 = &v11;
  BOOL v10 = a4;
  id v4 = a3;
  id v8 = v4;
  [v4 performBlockAndWait:v7];
  id v5 = [(id)v12[5] copy];

  _Block_object_dispose(&v11, 8);
  return v5;
}

+ (id)managementSources
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RMManagementSource fetchRequest](&OBJC_CLASS___RMManagementSource, "fetchRequest"));
  id v20 = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 execute:&v20]);
  id v4 = v20;
  id v5 = v4;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v7 = v3;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v11), "reportDetails", (void)v16));
          [v6 addObject:v12];

          uint64_t v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }

      while (v9);
    }

    id v13 = [v6 copy];
  }

  else
  {
    v22 = @"Error";
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
    v23 = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    v24 = v14;
    id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
  }

  return v13;
}

+ (id)orphanedEntities
{
  v112 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  4LL));
  v113 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K == nil",  @"managementSource"));
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  __int128 v119 = 0u;
  v121[0] = objc_opt_class(&OBJC_CLASS___RMCommandPayload);
  v121[1] = objc_opt_class(&OBJC_CLASS___RMActivationPayload);
  v121[2] = objc_opt_class(&OBJC_CLASS___RMConfigurationPayload);
  v121[3] = objc_opt_class(&OBJC_CLASS___RMAssetPayload);
  v121[4] = objc_opt_class(&OBJC_CLASS___RMManagementPayload);
  id obj = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v121, 5LL));
  id v114 = [obj countByEnumeratingWithState:&v116 objects:v122 count:16];
  if (v114)
  {
    uint64_t v111 = *(void *)v117;
    do
    {
      v2 = 0LL;
      do
      {
        if (*(void *)v117 != v111) {
          objc_enumerationMutation(obj);
        }
        v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v116 + 1) + 8 * (void)v2) fetchRequest]);
        [v3 setPredicate:v113];
        id v4 = v112;
        id v5 = v3;
        id v120 = 0LL;
        v6 = (void *)objc_claimAutoreleasedReturnValue([v5 execute:&v120]);
        id v7 = v120;
        id v8 = v7;
        if (v6)
        {
          id v115 = v4;
          id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
          __int128 v124 = 0u;
          __int128 v125 = 0u;
          __int128 v126 = 0u;
          __int128 v127 = 0u;
          id v10 = v6;
          id v11 = [v10 countByEnumeratingWithState:&v124 objects:v123 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v125;
            do
            {
              v14 = 0LL;
              do
              {
                if (*(void *)v125 != v13) {
                  objc_enumerationMutation(v10);
                }
                [v9 addObject:v15];

                v14 = (char *)v14 + 1;
              }

              while (v12 != v14);
              id v12 = [v10 countByEnumeratingWithState:&v124 objects:v123 count:16];
            }

            while (v12);
          }

          id v16 = [v9 copy];
          id v4 = v115;
        }

        else
        {
          *(void *)&__int128 v124 = @"Error";
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
          v123[0] = v9;
          id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v123,  &v124,  1LL));
        }

        if ([v16 count])
        {
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v5 entity]);
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 managedObjectClassName]);
          [v4 setObject:v16 forKeyedSubscript:v18];
        }

        v2 = (char *)v2 + 1;
      }

      while (v2 != v114);
      id v114 = [obj countByEnumeratingWithState:&v116 objects:v122 count:16];
    }

    while (v114);
  }

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[RMConfigurationPayloadReference fetchRequest]( &OBJC_CLASS___RMConfigurationPayloadReference,  "fetchRequest"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == nil) && (%K == nil)",  @"configuration",  @"activation"));
  [v19 setPredicate:v20];

  id v21 = v112;
  id v22 = v19;
  id v120 = 0LL;
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 execute:&v120]);
  id v24 = v120;
  v25 = v24;
  if (v23)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v23 count]));
    __int128 v124 = 0u;
    __int128 v125 = 0u;
    __int128 v126 = 0u;
    __int128 v127 = 0u;
    id v27 = v23;
    id v28 = [v27 countByEnumeratingWithState:&v124 objects:v123 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v125;
      do
      {
        v31 = 0LL;
        do
        {
          if (*(void *)v125 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v124 + 1) + 8 * (void)v31) reportDetails]);
          [v26 addObject:v32];

          v31 = (char *)v31 + 1;
        }

        while (v29 != v31);
        id v29 = [v27 countByEnumeratingWithState:&v124 objects:v123 count:16];
      }

      while (v29);
    }

    id v33 = [v26 copy];
  }

  else
  {
    *(void *)&__int128 v124 = @"Error";
    v26 = (void *)objc_claimAutoreleasedReturnValue([v24 description]);
    v123[0] = v26;
    id v33 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v123,  &v124,  1LL));
  }

  if ([v33 count])
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue([v22 entity]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 managedObjectClassName]);
    [v21 setObject:v33 forKeyedSubscript:v35];
  }

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[RMAssetPayloadReference fetchRequest](&OBJC_CLASS___RMAssetPayloadReference, "fetchRequest"));
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == nil) && (%K == nil)",  @"configuration",  @"asset"));
  [v36 setPredicate:v37];

  id v38 = v21;
  id v39 = v36;
  id v120 = 0LL;
  v40 = (void *)objc_claimAutoreleasedReturnValue([v39 execute:&v120]);
  id v41 = v120;
  v42 = v41;
  if (v40)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v40 count]));
    __int128 v124 = 0u;
    __int128 v125 = 0u;
    __int128 v126 = 0u;
    __int128 v127 = 0u;
    id v44 = v40;
    id v45 = [v44 countByEnumeratingWithState:&v124 objects:v123 count:16];
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v125;
      do
      {
        v48 = 0LL;
        do
        {
          if (*(void *)v125 != v47) {
            objc_enumerationMutation(v44);
          }
          v49 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v124 + 1) + 8 * (void)v48) reportDetails]);
          [v43 addObject:v49];

          v48 = (char *)v48 + 1;
        }

        while (v46 != v48);
        id v46 = [v44 countByEnumeratingWithState:&v124 objects:v123 count:16];
      }

      while (v46);
    }

    id v50 = [v43 copy];
  }

  else
  {
    *(void *)&__int128 v124 = @"Error";
    v43 = (void *)objc_claimAutoreleasedReturnValue([v41 description]);
    v123[0] = v43;
    id v50 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v123,  &v124,  1LL));
  }

  v51 = v50;

  if ([v51 count])
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue([v39 entity]);
    v53 = (void *)objc_claimAutoreleasedReturnValue([v52 managedObjectClassName]);
    [v38 setObject:v51 forKeyedSubscript:v53];
  }

  v54 = (void *)objc_claimAutoreleasedReturnValue(+[RMStatusSubscription fetchRequest](&OBJC_CLASS___RMStatusSubscription, "fetchRequest"));
  v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == nil)",  @"managementSource"));
  [v54 setPredicate:v55];

  id v56 = v38;
  id v57 = v54;
  id v120 = 0LL;
  v58 = (void *)objc_claimAutoreleasedReturnValue([v57 execute:&v120]);
  id v59 = v120;
  v60 = v59;
  if (v58)
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v58 count]));
    __int128 v124 = 0u;
    __int128 v125 = 0u;
    __int128 v126 = 0u;
    __int128 v127 = 0u;
    id v62 = v58;
    id v63 = [v62 countByEnumeratingWithState:&v124 objects:v123 count:16];
    if (v63)
    {
      id v64 = v63;
      uint64_t v65 = *(void *)v125;
      do
      {
        v66 = 0LL;
        do
        {
          if (*(void *)v125 != v65) {
            objc_enumerationMutation(v62);
          }
          v67 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v124 + 1) + 8 * (void)v66) reportDetails]);
          [v61 addObject:v67];

          v66 = (char *)v66 + 1;
        }

        while (v64 != v66);
        id v64 = [v62 countByEnumeratingWithState:&v124 objects:v123 count:16];
      }

      while (v64);
    }

    id v68 = [v61 copy];
  }

  else
  {
    *(void *)&__int128 v124 = @"Error";
    v61 = (void *)objc_claimAutoreleasedReturnValue([v59 description]);
    v123[0] = v61;
    id v68 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v123,  &v124,  1LL));
  }

  v69 = v68;

  if ([v69 count])
  {
    v70 = (void *)objc_claimAutoreleasedReturnValue([v57 entity]);
    v71 = (void *)objc_claimAutoreleasedReturnValue([v70 managedObjectClassName]);
    [v56 setObject:v69 forKeyedSubscript:v71];
  }

  v72 = (void *)objc_claimAutoreleasedReturnValue(+[RMStatusSubscriptionItem fetchRequest](&OBJC_CLASS___RMStatusSubscriptionItem, "fetchRequest"));
  v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == nil)",  @"subscription"));
  [v72 setPredicate:v73];

  id v74 = v56;
  id v75 = v72;
  id v120 = 0LL;
  v76 = (void *)objc_claimAutoreleasedReturnValue([v75 execute:&v120]);
  id v77 = v120;
  v78 = v77;
  if (v76)
  {
    v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v76 count]));
    __int128 v124 = 0u;
    __int128 v125 = 0u;
    __int128 v126 = 0u;
    __int128 v127 = 0u;
    id v80 = v76;
    id v81 = [v80 countByEnumeratingWithState:&v124 objects:v123 count:16];
    if (v81)
    {
      id v82 = v81;
      uint64_t v83 = *(void *)v125;
      do
      {
        v84 = 0LL;
        do
        {
          if (*(void *)v125 != v83) {
            objc_enumerationMutation(v80);
          }
          v85 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v124 + 1) + 8 * (void)v84) reportDetails]);
          [v79 addObject:v85];

          v84 = (char *)v84 + 1;
        }

        while (v82 != v84);
        id v82 = [v80 countByEnumeratingWithState:&v124 objects:v123 count:16];
      }

      while (v82);
    }

    id v86 = [v79 copy];
  }

  else
  {
    *(void *)&__int128 v124 = @"Error";
    v79 = (void *)objc_claimAutoreleasedReturnValue([v77 description]);
    v123[0] = v79;
    id v86 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v123,  &v124,  1LL));
  }

  v87 = v86;

  if ([v87 count])
  {
    v88 = (void *)objc_claimAutoreleasedReturnValue([v75 entity]);
    v89 = (void *)objc_claimAutoreleasedReturnValue([v88 managedObjectClassName]);
    [v74 setObject:v87 forKeyedSubscript:v89];
  }

  v90 = (void *)objc_claimAutoreleasedReturnValue(+[RMSubscribedStatusKeyPath fetchRequest](&OBJC_CLASS___RMSubscribedStatusKeyPath, "fetchRequest"));
  v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == nil)",  @"managementSource"));
  [v90 setPredicate:v91];

  id v92 = v74;
  id v93 = v90;
  id v120 = 0LL;
  v94 = (void *)objc_claimAutoreleasedReturnValue([v93 execute:&v120]);
  id v95 = v120;
  v96 = v95;
  if (v94)
  {
    v97 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v94 count]));
    __int128 v124 = 0u;
    __int128 v125 = 0u;
    __int128 v126 = 0u;
    __int128 v127 = 0u;
    id v98 = v94;
    id v99 = [v98 countByEnumeratingWithState:&v124 objects:v123 count:16];
    if (v99)
    {
      id v100 = v99;
      uint64_t v101 = *(void *)v125;
      do
      {
        v102 = 0LL;
        do
        {
          if (*(void *)v125 != v101) {
            objc_enumerationMutation(v98);
          }
          [v97 addObject:v103];

          v102 = (char *)v102 + 1;
        }

        while (v100 != v102);
        id v100 = [v98 countByEnumeratingWithState:&v124 objects:v123 count:16];
      }

      while (v100);
    }

    id v104 = [v97 copy];
  }

  else
  {
    *(void *)&__int128 v124 = @"Error";
    v97 = (void *)objc_claimAutoreleasedReturnValue([v95 description]);
    v123[0] = v97;
    id v104 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v123,  &v124,  1LL));
  }

  v105 = v104;

  if ([v105 count])
  {
    v106 = (void *)objc_claimAutoreleasedReturnValue([v93 entity]);
    v107 = (void *)objc_claimAutoreleasedReturnValue([v106 managedObjectClassName]);
    [v92 setObject:v105 forKeyedSubscript:v107];
  }

  id v108 = [v92 copy];
  return v108;
}

+ (id)internalStateArchiveWithContext:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 persistentStoreCoordinator]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentStores]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 metadataForPersistentStore:v5]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"InternalStateArchiver.DeviceStatusByKeyPath"]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNull);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDate);
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSUUID);
    v15 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v19,  v9,  v10,  v11,  v12,  v13,  v14,  objc_opt_class(&OBJC_CLASS___NSURL),  0LL);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    uint64_t v20 = 0LL;
    __int128 v17 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v16,  v7,  &v20));

    if (!v17) {
      __int128 v17 = &off_10001E950;
    }
  }

  else if (v7)
  {
    __int128 v17 = &off_10001E978;
  }

  else
  {
    __int128 v17 = 0LL;
  }

  return v17;
}

@end