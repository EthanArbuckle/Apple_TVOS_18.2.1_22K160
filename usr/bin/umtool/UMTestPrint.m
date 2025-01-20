@interface UMTestPrint
+ (BOOL)printInfoForUMLUser:(id)a3 outError:(id *)a4;
+ (BOOL)printInfoForUser:(id)a3 outError:(id *)a4;
+ (BOOL)printInfoForUsers:(id)a3 outError:(id *)a4;
+ (BOOL)printPersonaAttributesInfo:(id)a3 outError:(id *)a4;
+ (BOOL)printPersonaInfo:(id)a3 outError:(id *)a4;
+ (BOOL)printSyncBubbleInfoForUser:(id)a3 outError:(id *)a4;
+ (BOOL)printSyncBubbleInfoForUsers:(id)a3 outError:(id *)a4;
+ (id)_dataSizeStringFromBytes:(unint64_t)a3;
+ (void)_printDivider;
+ (void)_printInfoForUser:(id)a3;
+ (void)_printSyncBubbleInfoForUser:(id)a3;
+ (void)printTable:(id)a3 withColumns:(id)a4 rows:(id)a5;
+ (void)println;
+ (void)println:(id)a3;
@end

@implementation UMTestPrint

+ (void)println
{
}

+ (void)println:(id)a3
{
  id v3 = a3;
  v4 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v3, &v6);

  v5 = v4;
  puts(-[NSString UTF8String](v5, "UTF8String"));
}

+ (void)printTable:(id)a3 withColumns:(id)a4 rows:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  printf("%s:\n\n", (const char *)[a3 UTF8String]);
  if ([v8 count])
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v7 count]));
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472LL;
    v77[2] = sub_100007728;
    v77[3] = &unk_10000C2D0;
    id v47 = v7;
    id v10 = v7;
    id v78 = v10;
    v54 = (void *)objc_claimAutoreleasedReturnValue([v8 sortedArrayUsingComparator:v77]);

    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    id obj = v10;
    id v11 = [obj countByEnumeratingWithState:&v73 objects:v83 count:16];
    v56 = v9;
    if (v11)
    {
      id v12 = v11;
      id v52 = *(id *)v74;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(id *)v74 != v52) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)i);
          id v15 = [v14 length];
          __int128 v69 = 0u;
          __int128 v70 = 0u;
          __int128 v71 = 0u;
          __int128 v72 = 0u;
          id v16 = v54;
          id v17 = [v16 countByEnumeratingWithState:&v69 objects:v82 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v70;
            do
            {
              for (j = 0LL; j != v18; j = (char *)j + 1)
              {
                if (*(void *)v70 != v19) {
                  objc_enumerationMutation(v16);
                }
                v21 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v69 + 1) + 8 * (void)j) objectForKeyedSubscript:v14]);
                id v22 = [v21 length];

                if (v22 > v15) {
                  id v15 = v22;
                }
              }

              id v18 = [v16 countByEnumeratingWithState:&v69 objects:v82 count:16];
            }

            while (v18);
          }

          v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v15));
          v9 = v56;
          [v56 setObject:v23 forKeyedSubscript:v14];

          printf("%-*s ", (int)v15, (const char *)[v14 UTF8String]);
        }

        id v12 = [obj countByEnumeratingWithState:&v73 objects:v83 count:16];
      }

      while (v12);
    }

    putchar(10);
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    id v53 = obj;
    id v24 = [v53 countByEnumeratingWithState:&v65 objects:v81 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v66;
      do
      {
        for (k = 0LL; k != v25; k = (char *)k + 1)
        {
          if (*(void *)v66 != v26) {
            objc_enumerationMutation(v53);
          }
          uint64_t v28 = *(void *)(*((void *)&v65 + 1) + 8LL * (void)k);
          v29 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v28]);
          int v30 = [v29 intValue];

          if (v30 >= 1)
          {
            signed int v31 = 0;
            do
            {
              putchar(45);
              ++v31;
              v32 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v28]);
              signed int v33 = [v32 intValue];
            }

            while (v31 < v33);
          }

          putchar(32);
        }

        id v25 = [v53 countByEnumeratingWithState:&v65 objects:v81 count:16];
      }

      while (v25);
    }

    putchar(10);
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    id v48 = v54;
    id obja = [v48 countByEnumeratingWithState:&v61 objects:v80 count:16];
    if (obja)
    {
      uint64_t v49 = *(void *)v62;
      do
      {
        uint64_t v34 = 0LL;
        do
        {
          if (*(void *)v62 != v49) {
            objc_enumerationMutation(v48);
          }
          uint64_t v55 = v34;
          v35 = *(void **)(*((void *)&v61 + 1) + 8 * v34);
          __int128 v57 = 0u;
          __int128 v58 = 0u;
          __int128 v59 = 0u;
          __int128 v60 = 0u;
          id v36 = v53;
          id v37 = [v36 countByEnumeratingWithState:&v57 objects:v79 count:16];
          if (v37)
          {
            id v38 = v37;
            uint64_t v39 = *(void *)v58;
            do
            {
              for (m = 0LL; m != v38; m = (char *)m + 1)
              {
                if (*(void *)v58 != v39) {
                  objc_enumerationMutation(v36);
                }
                uint64_t v41 = *(void *)(*((void *)&v57 + 1) + 8LL * (void)m);
                uint64_t v42 = objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:v41]);
                if (v42) {
                  v43 = (__CFString *)v42;
                }
                else {
                  v43 = &stru_10000C850;
                }
                v44 = (void *)objc_claimAutoreleasedReturnValue([v56 objectForKeyedSubscript:v41]);
                unsigned int v45 = [v44 intValue];
                v46 = v43;
                printf("%-*s ", v45, (const char *)-[__CFString UTF8String](v46, "UTF8String"));
              }

              id v38 = [v36 countByEnumeratingWithState:&v57 objects:v79 count:16];
            }

            while (v38);
          }

          putchar(10);
          uint64_t v34 = v55 + 1;
        }

        while ((id)(v55 + 1) != obja);
        id obja = [v48 countByEnumeratingWithState:&v61 objects:v80 count:16];
      }

      while (obja);
    }

    id v8 = v48;

    puts("\n");
    id v7 = v47;
  }

  else
  {
    puts("None\n\n");
  }
}

+ (void)_printDivider
{
}

+ (void)_printInfoForUser:(id)a3
{
  id v4 = a3;
  objc_msgSend(a1, "println:", @"UID                        : %d", objc_msgSend(v4, "uid"));
  [a1 println: @"GID                        : %d" , [v4 gid]];
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 alternateDSID]);
  [a1 println:@"Alternate DSID             : %@", v5];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 homeDirectoryURL]);
  [a1 println:@"Home Directory URL         : %@", v6];

  [a1 println];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 username]);
  [a1 println:@"Username                   : %@", v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 givenName]);
  [a1 println:@"Given Name                 : %@", v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 familyName]);
  [a1 println:@"Family Name                : %@", v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 displayName]);
  [a1 println:@"Display Name               : %@", v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 photoURL]);
  [a1 println:@"Photo URL                  : %@", v11];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 userAuxiliaryString]);
  [a1 println:@"User AuxString             : %@", v12];

  [a1 println];
  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 creationDate]);
  [a1 println:@"Creation Date              : %@", v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 lastLoginDate]);
  [a1 println:@"Last Login Date            : %@", v14];

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 lastRemoteAuthDate]);
  [a1 println:@"Last Remote Auth Date      : %@", v15];

  [a1 println];
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 firstLoginStartDate]);
  [a1 println:@"FirstLogin Start Date       : %@", v16];

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 firstLoginEndDate]);
  [a1 println:@"FirstLogin End Date         : %@", v17];

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 lastCachedLoginStartDate]);
  [a1 println:@"CachedLogin Start Date      : %@", v18];

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v4 lastCachedLoginEndDate]);
  [a1 println:@"CachedLogin End Date        : %@", v19];

  [a1 println];
  id v20 = [v4 userType];
  v21 = @"Permanent";
  if (v20) {
    v21 = 0LL;
  }
  if (v20 == (id)1) {
    v21 = @"Ephemeral";
  }
  [a1 println:@"User Type                  : %@", v21];
  id v22 = [v4 passcodeType];
  uint64_t v23 = 0LL;
  [a1 println:@"Passcode Type              : %@", v23];
  [a1 println];
  else {
    id v24 = @"false";
  }
  [a1 println:@"Is Login User              : %@", v24];
  else {
    id v25 = @"false";
  }
  [a1 println:@"Is Auditor                 : %@", v25];
  else {
    uint64_t v26 = @"false";
  }
  [a1 println:@"Is Disabled                : %@", v26];
  else {
    v27 = @"false";
  }
  [a1 println:@"Is TransientUser           : %@", v27];
  else {
    uint64_t v28 = @"false";
  }
  [a1 println:@"Is PrimaryUser              : %@", v28];
  else {
    v29 = @"false";
  }
  [a1 println:@"Is AdminUser               : %@", v29];
  [a1 println];
  objc_msgSend(a1, "println:", @"Passcode Lock Grace Period : %lu", objc_msgSend(v4, "passcodeLockGracePeriod"));
  signed int v31 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableString, v30);
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  v32 = (void *)objc_claimAutoreleasedReturnValue([v4 languages]);
  id v33 = [v32 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v44;
    id v36 = &stru_10000C850;
    do
    {
      id v37 = 0LL;
      do
      {
        if (*(void *)v44 != v35) {
          objc_enumerationMutation(v32);
        }
        [v31 appendFormat:@"%@%@", v36, *(void *)(*((void *)&v43 + 1) + 8 * (void)v37)];
        id v37 = (char *)v37 + 1;
        id v36 = @", ";
      }

      while (v34 != v37);
      id v34 = [v32 countByEnumeratingWithState:&v43 objects:v47 count:16];
      id v36 = @", ";
    }

    while (v34);
  }

  [a1 println:@"Languages                  : [%@]", v31];
  [a1 println];
  id v38 = [a1 _dataSizeStringFromBytes:[v4 dataQuota]];
  [a1 println:@"Data Quota                 : %@", v38];

  uint64_t v39 = (void *)[a1 _dataSizeStringFromBytes:[v4 dataUsed]];
  [a1 println:@"Data Used                  : %@", v39];

  [a1 println];
  unsigned int v40 = [v4 hasDataToSync];
  uint64_t v41 = @"false";
  if (v40) {
    uint64_t v41 = @"true";
  }
  [a1 println:@"Has Data to Sync           : %@", v41];
  [a1 println];
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v4 debugErrorCausingLogout]);
  [a1 println:@"Error Causing Logout       : %@", v42];
}

+ (BOOL)printInfoForUser:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v11 = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    unsigned __int8 v9 = [a1 printInfoForUsers:v8 outError:a4];
  }

  else
  {
    unsigned __int8 v9 = [a1 printInfoForUsers:&__NSArray0__struct outError:a4];
  }

  return v9;
}

+ (BOOL)printInfoForUsers:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6 && [v6 count])
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
          [a1 _printDivider];
          [a1 println];
          [a1 _printInfoForUser:v13];
          [a1 println];
        }

        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v10);
    }

    [a1 _printDivider];
    BOOL v14 = 1;
  }

  else
  {
    BOOL v14 = 0;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[UMTestError errorWithMessage:]( &OBJC_CLASS___UMTestError,  "errorWithMessage:",  @"Nothing to print"));
    }
  }

  return v14;
}

+ (BOOL)printInfoForUMLUser:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  +[UMTestPrint println:]( UMTestPrint,  "println:",  @"UID                        : %d",  [v5 uid]);
  +[UMTestPrint println:]( UMTestPrint,  "println:",  @"GID                        : %d",  [v5 gid]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userUUID]);
  +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", @"User UUID                  : %@", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 alternateDSID]);
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 alternateDSID]);
    +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", @"Alternate DSID                 : %@", v8);
  }

  +[UMTestPrint println](&OBJC_CLASS___UMTestPrint, "println");
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 userType]);
  +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", @"UserType                   : %@", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 username]);
  +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", @"Username                   : %@", v10);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 firstName]);
  +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", @"First Name                 : %@", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 lastName]);
  +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", @"Last Name                  : %@", v12);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 displayName]);
  +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", @"Display Name               : %@", v13);

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v5 fileInfoPath]);
  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 fileInfoPath]);
    +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", @"FileInfo Path               : %@", v15);
  }

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v5 libInfoPath]);

  if (v16)
  {
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v5 libInfoPath]);
    +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", @"Libinfo Path               : %@", v17);
  }

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v5 homeDirPath]);

  if (v18)
  {
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v5 homeDirPath]);
    +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", @"HomeDir Path               : %@", v19);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v5 diskNode]);

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v5 diskNode]);
    +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", @"Disk Node               : %@", v21);

    id v22 = (void *)objc_claimAutoreleasedReturnValue([v5 volumeUUID]);
    +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", @"Disk Vol UUID               : %@", v22);
  }

  [a1 println];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v5 creationDate]);
  +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", @"Creation Date              : %@", v23);

  +[UMTestPrint println](&OBJC_CLASS___UMTestPrint, "println");
  else {
    id v24 = @"false";
  }
  [a1 println:@"Is Login User              : %@", v24];
  else {
    id v25 = @"false";
  }
  [a1 println:@"Is Auditor                 : %@", v25];
  else {
    uint64_t v26 = @"false";
  }
  [a1 println:@"Is PrimaryUser             : %@", v26];
  else {
    v27 = @"false";
  }
  [a1 println:@"Is AdminUser               : %@", v27];
  [a1 println];

  return 1;
}

+ (BOOL)printPersonaInfo:(id)a3 outError:(id *)a4
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userPersonaUniqueString]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userPersonaUniqueString]);
    +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", @"Persona identifier: %@", v6);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userPersonaNickName]);

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userPersonaNickName]);
    +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", @"Persona NickName: %@", v8);
  }

  id v9 = [v4 userPersonaType];
  id v10 = @"Persona Type: Personal";
  switch((unint64_t)v9)
  {
    case 0uLL:
      goto LABEL_14;
    case 1uLL:
      id v10 = @"Persona Type: Managed";
      goto LABEL_14;
    case 2uLL:
      id v10 = @"Persona Type: Enterprise";
      goto LABEL_14;
    case 3uLL:
      id v10 = @"Persona Type: System";
      goto LABEL_14;
    case 4uLL:
      id v10 = @"Persona Type: Universal";
      goto LABEL_14;
    case 5uLL:
      id v10 = @"Persona Type: Default";
      goto LABEL_14;
    case 6uLL:
      id v10 = @"Persona Type: Guest";
      goto LABEL_14;
    default:
      if (v9 != (id)1000) {
        goto LABEL_15;
      }
      id v10 = @"Persona Type: Invalid";
LABEL_14:
      +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", v10);
LABEL_15:

      return 1;
  }

+ (BOOL)printPersonaAttributesInfo:(id)a3 outError:(id *)a4
{
  id v4 = a3;
  +[UMTestPrint println:]( &OBJC_CLASS___UMTestPrint,  "println:",  @"************************************************************");
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userPersonaUniqueString]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userPersonaUniqueString]);
    +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", @"Persona identifier: %@", v6);
  }

  else
  {
    +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", @"Persona identifier: NONE");
  }

  id v7 = [v4 userPersonaType];
  id v8 = @"Persona Type: Personal";
  switch((unint64_t)v7)
  {
    case 0uLL:
      goto LABEL_12;
    case 1uLL:
      id v8 = @"Persona Type: Managed";
      goto LABEL_12;
    case 2uLL:
      goto LABEL_13;
    case 3uLL:
      id v8 = @"Persona Type: System";
      goto LABEL_12;
    case 4uLL:
      id v8 = @"Persona Type: Universal";
      goto LABEL_12;
    case 5uLL:
      id v8 = @"Persona Type: Default";
      goto LABEL_12;
    case 6uLL:
      id v8 = @"Persona Type: Guest";
      goto LABEL_12;
    default:
      if (v7 != (id)1000) {
        goto LABEL_13;
      }
      id v8 = @"Persona Type: Invalid";
LABEL_12:
      +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", v8);
LABEL_13:
      if (objc_msgSend(v4, "userPersona_id", v8)) {
        +[UMTestPrint println:@"Kernel Persona ID is: %d" userPersona_id:[v4 userPersona_id]];
      }
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 personaLayoutPathURL]);

      if (v9)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 personaLayoutPathURL]);
        +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", @"Persona Volume Path is: %@", v10);
      }

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 userPersonaDisplayName]);

      if (v11)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 userPersonaDisplayName]);
        +[UMTestPrint println:](&OBJC_CLASS___UMTestPrint, "println:", @"Persona Display String: %@", v12);
      }

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 userPersonaBundleIDList]);

      if (v13)
      {
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v4 userPersonaBundleIDList]);
        +[UMTestPrint println:]( &OBJC_CLASS___UMTestPrint,  "println:",  @"Persona Associated BundleIDs are: %@",  v14);
      }

      +[UMTestPrint println:]( &OBJC_CLASS___UMTestPrint,  "println:",  @"************************************************************");

      return 1;
  }

+ (void)_printSyncBubbleInfoForUser:(id)a3
{
  id v4 = a3;
  [a1 println:@"UID           : %d" v4.uid];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 username]);
  [a1 println:@"Username      : %@", v5];

  [a1 println];
  [a1 println:@"Mach Services :"];
  [a1 println];
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[UMMobileKeyBag syncBubbleMachServiceNamesForUser:]( &OBJC_CLASS___UMMobileKeyBag,  "syncBubbleMachServiceNamesForUser:",  v4));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [a1 println:@"\t%@", *(void *)(*((void *)&v11 + 1) + 8 * (void)v10)];
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

+ (BOOL)printSyncBubbleInfoForUser:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v11 = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    unsigned __int8 v9 = [a1 printSyncBubbleInfoForUsers:v8 outError:a4];
  }

  else
  {
    unsigned __int8 v9 = [a1 printSyncBubbleInfoForUsers:&__NSArray0__struct outError:a4];
  }

  return v9;
}

+ (BOOL)printSyncBubbleInfoForUsers:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6 && [v6 count])
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
          [a1 _printDivider];
          [a1 println];
          [a1 _printSyncBubbleInfoForUser:v13];
          [a1 println];
        }

        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v10);
    }

    [a1 _printDivider];
    BOOL v14 = 1;
  }

  else
  {
    BOOL v14 = 0;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[UMTestError errorWithMessage:]( &OBJC_CLASS___UMTestError,  "errorWithMessage:",  @"Nothing to print"));
    }
  }

  return v14;
}

+ (id)_dataSizeStringFromBytes:(unint64_t)a3
{
  double v5 = (double)a3;
  double v6 = (double)a3 * 0.0009765625;
  if (v6 <= 1.0)
  {
    id v7 = @"bytes";
  }

  else
  {
    double v5 = v6 * 0.0009765625;
    if (v6 * 0.0009765625 <= 1.0)
    {
      id v7 = @"KB";
      double v5 = (double)a3 * 0.0009765625;
    }

    else
    {
      id v7 = @"MB";
      if (v5 * 0.0009765625 > 1.0)
      {
        id v7 = @"GB";
        double v5 = v5 * 0.0009765625;
      }
    }
  }

  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%f %@",  *(void *)&v5,  v7,  v3,  v4);
}

@end