@interface CPLCloudKitErrors
+ (BOOL)_isCKErrorForRejectedRecord:(id)a3;
+ (BOOL)getCloudKitErrorCode:(int64_t *)a3 internalCode:(int64_t *)a4 fromError:(id)a5;
+ (BOOL)isCloudKitOperationCancelledError:(id)a3;
+ (BOOL)isContainerHasBeenWipedError:(id)a3;
+ (BOOL)isFeatureDisabledError:(id)a3;
+ (BOOL)isOperationCancelledOrDeferredError:(id)a3;
+ (BOOL)isOperationThrottledError:(id)a3;
+ (BOOL)isPartialFailureError:(id)a3;
+ (BOOL)isRecordNotFoundError:(id)a3;
+ (id)CPLErrorForCloudKitError:(id)a3 scopeProvider:(id)a4 withRequestUUIDs:(id)a5 description:(id)a6;
+ (id)CPLErrorForCloudKitError:(id)a3 scopeProvider:(id)a4 withRequestUUIDs:(id)a5 description:(id)a6 arguments:(char *)a7;
+ (id)CPLErrorForCloudKitError:(id)a3 withRequestUUIDs:(id)a4 description:(id)a5;
+ (id)CPLErrorForCloudKitError:(id)a3 withRequestUUIDs:(id)a4 description:(id)a5 arguments:(char *)a6;
+ (id)CPLErrorForCloudKitUploadError:(id)a3 getDestinationRecordIDs:(id)a4 scopeProvider:(id)a5 withRequestUUIDs:(id)a6 uploadAction:(id)a7;
+ (id)_bestErrorForUnderlyingError:(id)a3 scopeProvider:(id)a4;
+ (id)_betterErrorForRecordId:(id)a3 recordError:(id)a4;
+ (id)_errorForCancelledError:(id)a3;
+ (id)_filteredPartialFailureError:(id)a3 itemClass:(Class)a4;
+ (id)_rejectionReasonFromPartialError:(id)a3 identifier:(id)a4;
+ (id)bestErrorForUnderlyingError:(id)a3;
+ (id)errorsPerRecordIDForPartialFailureError:(id)a3;
+ (id)errorsPerZoneIDForPartialFailureError:(id)a3;
+ (id)realErrorForError:(id)a3;
@end

@implementation CPLCloudKitErrors

+ (BOOL)_isCKErrorForRejectedRecord:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (unint64_t)[v3 code] - 1;
  if (v4 >= 0x1F || ((0x4405EE01u >> v4) & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:NSUnderlyingErrorKey]);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    unsigned __int8 v8 = [v7 isEqualToString:CKUnderlyingErrorDomain];

    if ((v8 & 1) == 0)
    {

LABEL_11:
      BOOL v11 = 0;
      goto LABEL_12;
    }

    id v9 = [v6 code];

    if (v9 != (id)2038 && v9 != (id)3006) {
      goto LABEL_11;
    }
  }

  BOOL v11 = 1;
LABEL_12:

  return v11;
}

+ (id)_betterErrorForRecordId:(id)a3 recordError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7 || (id v9 = v8) == 0LL) {
    sub_100197A18((uint64_t)a2, (uint64_t)a1);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedDescription]);
  if (v10)
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (for record %@)",  v10,  v7));
  }

  else
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"record %@", v7));
  }

  v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
    -[NSMutableDictionary setDictionary:](v12, "setDictionary:", v14);

    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v11, NSLocalizedDescriptionKey);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  v15,  [v9 code],  v12));

  return v16;
}

+ (id)_rejectionReasonFromPartialError:(id)a3 identifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:NSUnderlyingErrorKey]);
  uint64_t v9 = CKErrorServerDescriptionKey;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:CKErrorServerDescriptionKey]);
  if (v10
    || (BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]),
        v10 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v9]),
        v11,
        v10))
  {
    if ([v10 hasPrefix:@"{"])
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v10 dataUsingEncoding:4]);
      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v12,  0LL,  0LL));
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"title"]);
          if (v15)
          {
            uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
            {
              id v17 = v15;

              v10 = v17;
            }
          }
        }
      }
    }

    if ([v10 rangeOfString:v6] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v18 = v10;
      v19 = v18;
      goto LABEL_20;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByReplacingOccurrencesOfString:v6 withString:@"<redacted>"]);

    v18 = v20;
    v19 = v18;
    if (v18) {
      goto LABEL_20;
    }
  }

  if (v8
    && (v21 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]),
        unsigned int v22 = [v21 isEqualToString:CKUnderlyingErrorDomain],
        v21,
        v22))
  {
    v23 = objc_alloc(&OBJC_CLASS___NSString);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
    v25 = -[NSString initWithFormat:]( v23,  "initWithFormat:",  @"%@ %ld/%ld",  v24,  [v5 code],  objc_msgSend(v8, "code"));
  }

  else
  {
    v26 = objc_alloc(&OBJC_CLASS___NSString);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
    v25 = -[NSString initWithFormat:](v26, "initWithFormat:", @"%@ %ld", v24, [v5 code], v28);
  }

  v19 = v25;

  v18 = 0LL;
LABEL_20:

  return v19;
}

+ (id)_bestErrorForUnderlyingError:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
  if ([v8 isEqual:CKErrorDomain])
  {
    id v9 = [v6 code];

    if (v9 == (id)2)
    {
      v49[0] = 0LL;
      v49[1] = v49;
      v49[2] = 0x2020000000LL;
      char v50 = 0;
      uint64_t v43 = 0LL;
      v44 = &v43;
      uint64_t v45 = 0x3032000000LL;
      v46 = sub_1000A55BC;
      v47 = sub_1000A55CC;
      id v48 = 0LL;
      v10 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:CKPartialErrorsByItemIDKey]);
      uint64_t v37 = 0LL;
      v38 = &v37;
      uint64_t v39 = 0x3032000000LL;
      v40 = sub_1000A55BC;
      v41 = sub_1000A55CC;
      id v42 = 0LL;
      v27 = _NSConcreteStackBlock;
      uint64_t v28 = 3221225472LL;
      v29 = sub_1000A55D4;
      v30 = &unk_100242390;
      uint64_t v35 = objc_opt_class(&OBJC_CLASS___CKRecordID);
      id v36 = a1;
      id v31 = v7;
      v32 = v49;
      v33 = &v43;
      v34 = &v37;
      [v11 enumerateKeysAndObjectsUsingBlock:&v27];
      v12 = (void *)v38[5];
      if (v12)
      {
        id v13 = v12;
      }

      else
      {
        if (![(id)v44[5] count])
        {
          id v13 = v6;
LABEL_19:

          _Block_object_dispose(&v37, 8);
          _Block_object_dispose(&v43, 8);

          _Block_object_dispose(v49, 8);
          goto LABEL_20;
        }

        id v19 = [(id)v44[5] count];
        v20 = (void *)v44[5];
        if ((unint64_t)v19 < 4)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue([v20 allKeys]);
          uint64_t v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "componentsJoinedByString:", @", "));
        }

        else
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue([v20 allKeys]);
          unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "subarrayWithRange:", 0, 3));
          uint64_t v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "componentsJoinedByString:", @", "));
        }

        uint64_t v24 = v44[5];
        uint64_t v51 = CPLErrorRejectedRecordIdentifiersAndReasonsKey;
        uint64_t v52 = v24;
        v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v52,  &v51,  1LL));
        id v13 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:underlyingError:userInfo:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:underlyingError:userInfo:description:",  18LL,  v6,  v25,  @"%@ were rejected by server",  v23,  v27,  v28,  v29,  v30));

        id v6 = (id)v23;
      }

      goto LABEL_19;
    }
  }

  else
  {
  }

  if ([v6 code] == (id)20)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    unsigned int v15 = [v14 isEqualToString:CKErrorDomain];

    if (v15)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:NSUnderlyingErrorKey]);

      if (v17)
      {
        id v18 = v17;

        id v6 = v18;
      }
    }
  }

  id v13 = v6;
LABEL_20:

  return v13;
}

+ (id)bestErrorForUnderlyingError:(id)a3
{
  return [a1 _bestErrorForUnderlyingError:a3 scopeProvider:0];
}

+ (id)CPLErrorForCloudKitError:(id)a3 withRequestUUIDs:(id)a4 description:(id)a5
{
  return (id)objc_claimAutoreleasedReturnValue( [a1 CPLErrorForCloudKitError:a3 scopeProvider:0 withRequestUUIDs:a4 description:a5 arguments:&v6]);
}

+ (id)CPLErrorForCloudKitError:(id)a3 withRequestUUIDs:(id)a4 description:(id)a5 arguments:(char *)a6
{
  return [a1 CPLErrorForCloudKitError:a3 scopeProvider:0 withRequestUUIDs:a4 description:a5 arguments:a6];
}

+ (id)CPLErrorForCloudKitError:(id)a3 scopeProvider:(id)a4 withRequestUUIDs:(id)a5 description:(id)a6
{
  return (id)objc_claimAutoreleasedReturnValue( [a1 CPLErrorForCloudKitError:a3 scopeProvider:a4 withRequestUUIDs:a5 description:a6 arguments:&v7]);
}

+ (id)_errorForCancelledError:(id)a3
{
  v7[0] = NSLocalizedDescriptionKey;
  v7[1] = NSUnderlyingErrorKey;
  v8[0] = @"CloudKit operation has been cancelled by user";
  v8[1] = a3;
  id v3 = a3;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  3072LL,  v4));

  return v5;
}

+ (id)CPLErrorForCloudKitError:(id)a3 scopeProvider:(id)a4 withRequestUUIDs:(id)a5 description:(id)a6 arguments:(char *)a7
{
  v12 = (NSMutableDictionary *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!-[NSMutableDictionary isCPLError](v12, "isCPLError"))
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary domain](v12, "domain"));
    unsigned int v25 = [v24 isEqualToString:CKErrorDomain];

    if (!v25)
    {
      if (-[NSMutableDictionary isCPLOperationCancelledError](v12, "isCPLOperationCancelledError"))
      {
        uint64_t v35 = v12;
        v12 = v35;
      }

      else
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary cplUnderlyingError](v12, "cplUnderlyingError"));
        uint64_t v39 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v15,  a7);
        v40 = (void *)objc_claimAutoreleasedReturnValue([v38 localizedDescription]);
        uint64_t v35 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:underlyingError:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:underlyingError:description:",  80LL,  v12,  @"%@ (%@)",  v39,  v40));
      }

      goto LABEL_127;
    }

    id v89 = v13;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary userInfo](v12, "userInfo"));
    v88 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:CKErrorRetryAfterKey]);

    id v27 = -[NSMutableDictionary code](v12, "code");
    if (v27 == (id)2)
    {
      uint64_t v28 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([a1 _bestErrorForUnderlyingError:v12 scopeProvider:v13]);
      v29 = v28;
      if (v28 == v12)
      {
        uint64_t v33 = 2LL;
      }

      else
      {
        v30 = v28;

        id v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary domain](v30, "domain"));
        unsigned int v32 = [v31 isEqualToString:CKErrorDomain];

        if (!v32)
        {
          if ((-[NSMutableDictionary isCPLError](v30, "isCPLError") & 1) != 0)
          {
            id v42 = v30;
            v49 = v88;
            if ((-[NSMutableDictionary isCPLOperationCancelledError](v30, "isCPLOperationCancelledError") & 1) == 0)
            {
              uint64_t v35 = v30;
LABEL_126:

              v12 = v30;
              goto LABEL_127;
            }
          }

          else
          {

            v49 = v88;
            if (!-[NSMutableDictionary isCPLOperationCancelledError](v30, "isCPLOperationCancelledError"))
            {
              v90 = v30;
              v47 = 0LL;
              uint64_t v46 = 0LL;
              uint64_t v48 = 80LL;
              goto LABEL_116;
            }

            id v42 = 0LL;
          }

          v30 = v30;
          uint64_t v35 = v30;
LABEL_125:

          goto LABEL_126;
        }

        uint64_t v33 = (uint64_t)-[NSMutableDictionary code](v30, "code");
        if (!v88)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary userInfo](v30, "userInfo"));
          v88 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKey:CKErrorRetryAfterKey]);
        }

        v12 = v30;
      }
    }

    else
    {
      uint64_t v33 = (uint64_t)v27;
    }

    v90 = v12;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary userInfo](v12, "userInfo"));
    id v42 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v41 objectForKey:NSUnderlyingErrorKey]);

    if (v42)
    {
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary domain](v42, "domain"));
      unsigned int v44 = [v43 isEqualToString:CKUnderlyingErrorDomain];

      if (v44)
      {
        uint64_t v45 = (uint64_t)-[NSMutableDictionary code](v42, "code");
        if (v45 <= 2023)
        {
          if (v45 > 2010)
          {
            if ((unint64_t)(v45 - 2011) < 2)
            {
LABEL_82:
              v47 = 0LL;
              uint64_t v46 = 0LL;
              uint64_t v48 = 1006LL;
              goto LABEL_115;
            }
          }

          else
          {
            switch(v45)
            {
              case 1002LL:
                v47 = 0LL;
                uint64_t v46 = 0LL;
                uint64_t v48 = 28LL;
                goto LABEL_115;
              case 1020LL:
LABEL_96:
                v47 = 0LL;
                uint64_t v46 = 0LL;
                uint64_t v48 = 1012LL;
                goto LABEL_115;
              case 2006LL:
LABEL_83:
                v47 = 0LL;
                uint64_t v46 = 0LL;
                uint64_t v48 = 1000LL;
                goto LABEL_115;
            }
          }
        }

        else
        {
          switch(v45)
          {
            case 2024LL:
            case 2030LL:
            case 2031LL:
              goto LABEL_83;
            case 2025LL:
            case 2027LL:
            case 2028LL:
            case 2032LL:
            case 2033LL:
            case 2034LL:
            case 2037LL:
            case 2038LL:
            case 2040LL:
            case 2041LL:
            case 2042LL:
            case 2043LL:
            case 2044LL:
            case 2046LL:
              break;
            case 2026LL:
              if (v33 == 26) {
                goto LABEL_92;
              }
              uint64_t v46 = 0LL;
              v47 = @"Container reset by server";
              uint64_t v48 = 21LL;
              goto LABEL_115;
            case 2029LL:
              v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary localizedDescription](v42, "localizedDescription"));
              id v56 = [v55 rangeOfString:@"Snapshot in progress"];

              v47 = 0LL;
              if (v56 == (id)0x7FFFFFFFFFFFFFFFLL) {
                uint64_t v46 = 1LL;
              }
              else {
                uint64_t v46 = 2LL;
              }
              uint64_t v48 = 35LL;
              goto LABEL_115;
            case 2035LL:
LABEL_91:
              v47 = 0LL;
              uint64_t v46 = 0LL;
              uint64_t v48 = 30LL;
              goto LABEL_115;
            case 2036LL:
              if (v33 == 26)
              {
LABEL_92:
                v47 = 0LL;
                uint64_t v46 = 0LL;
                else {
                  uint64_t v48 = 23LL;
                }
              }

              else
              {
LABEL_97:
                v47 = 0LL;
                uint64_t v46 = 0LL;
                uint64_t v48 = 23LL;
              }

              goto LABEL_115;
            case 2039LL:
LABEL_88:

              id v42 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
              v49 = v88;
              if (v88)
              {
                [v88 doubleValue];
                uint64_t v48 = 1001LL;
                if (v63 >= 86400.0) {
                  goto LABEL_110;
                }
                v64 = &off_10025C718;
              }

              else
              {
                v64 = &off_10025C718;
                uint64_t v48 = 1001LL;
              }

              goto LABEL_113;
            case 2045LL:
LABEL_95:
              v47 = 0LL;
              uint64_t v46 = 0LL;
              uint64_t v48 = 37LL;
              goto LABEL_115;
            case 2047LL:
              v47 = 0LL;
              uint64_t v46 = 0LL;
              uint64_t v48 = 2009LL;
              goto LABEL_115;
            case 2048LL:
              v47 = 0LL;
              uint64_t v46 = 0LL;
              uint64_t v48 = 2008LL;
              goto LABEL_115;
            case 2049LL:
              v47 = 0LL;
              uint64_t v46 = 0LL;
              uint64_t v48 = 2011LL;
              goto LABEL_115;
            default:
              if (v45 == 2057)
              {
                v47 = 0LL;
                uint64_t v46 = 0LL;
                uint64_t v48 = 2010LL;
                goto LABEL_115;
              }

              if (v45 != 6000) {
                break;
              }
              char v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary userInfo](v42, "userInfo"));
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKey:NSUnderlyingErrorKey]);

              if (!v51) {
                goto LABEL_74;
              }
              uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v51 domain]);
              unsigned int v53 = [v52 isEqualToString:@"CPL"];

              if (v53)
              {
                id v54 = [v51 code];
                if (v54 == (id)11) {
                  uint64_t v48 = 1002LL;
                }
                else {
                  uint64_t v48 = 80LL;
                }
                if (v54 == (id)1)
                {
                  uint64_t v48 = 33LL;
LABEL_72:

LABEL_73:
                  v47 = 0LL;
                  uint64_t v46 = 0LL;
                  goto LABEL_115;
                }

                goto LABEL_67;
              }

              v57 = (void *)objc_claimAutoreleasedReturnValue([v51 domain]);
              unsigned int v58 = [v57 isEqualToString:@"completeMyMoment"];

              if (v58)
              {
                id v59 = [v51 code];
                if (v59 == (id)11) {
                  uint64_t v48 = 1002LL;
                }
                else {
                  uint64_t v48 = 80LL;
                }
                if (v59 == (id)12)
                {
                  uint64_t v48 = 36LL;
                  goto LABEL_72;
                }

+ (id)CPLErrorForCloudKitUploadError:(id)a3 getDestinationRecordIDs:(id)a4 scopeProvider:(id)a5 withRequestUUIDs:(id)a6 uploadAction:(id)a7
{
  id v12 = a3;
  id v13 = (uint64_t (**)(void))a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 domain]);
  if (![v17 isEqualToString:CKErrorDomain])
  {

    goto LABEL_27;
  }

  id v18 = [v12 code];

  if (v18 != (id)12)
  {
LABEL_27:
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( [a1 CPLErrorForCloudKitError:v12, v14, v15, @"Failed to %@ some records", v16 scopeProvider withRequestUUIDs description]);
    goto LABEL_28;
  }

  uint64_t v19 = v13[2](v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  if ((unint64_t)[v20 count] < 2)
  {
LABEL_26:

    goto LABEL_27;
  }

  id v46 = a1;
  id v21 = -[NSCountedSet initWithCapacity:]( [NSCountedSet alloc],  "initWithCapacity:",  [v20 count]);
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  uint64_t v45 = v20;
  id v22 = v20;
  id v23 = [v22 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v52;
    do
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v52 != v25) {
          objc_enumerationMutation(v22);
        }
        -[NSCountedSet addObject:](v21, "addObject:", *(void *)(*((void *)&v51 + 1) + 8LL * (void)i));
      }

      id v24 = [v22 countByEnumeratingWithState:&v51 objects:v58 count:16];
    }

    while (v24);
  }

  id v27 = -[NSCountedSet count](v21, "count");
  if (v27 == [v22 count])
  {
LABEL_25:

    v20 = v45;
    a1 = v46;
    goto LABEL_26;
  }

  id v42 = v15;
  uint64_t v43 = v13;
  id v44 = v12;
  id v28 = v16;
  v29 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v22 count]);
  v41 = v28;
  v30 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Tried to %@ the same record twice in the same batch",  v28);
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v31 = v21;
  id v32 = -[NSCountedSet countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v47,  v57,  16LL);
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v48;
    do
    {
      for (j = 0LL; j != v33; j = (char *)j + 1)
      {
        if (*(void *)v48 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)j);
        if (-[NSCountedSet countForObject:](v31, "countForObject:", v36) >= 2)
        {
          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v14 rejectedScopedIdentifierForRejectedCKRecordID:v36]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v30, v37);
        }
      }

      id v33 = -[NSCountedSet countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v47,  v57,  16LL);
    }

    while (v33);
  }

  if (!-[NSMutableDictionary count](v29, "count"))
  {

    id v13 = v43;
    id v12 = v44;
    id v16 = v41;
    id v15 = v42;
    goto LABEL_25;
  }

  uint64_t v55 = CPLErrorRejectedRecordIdentifiersAndReasonsKey;
  id v56 = v29;
  v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:underlyingError:userInfo:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:underlyingError:userInfo:description:",  18LL,  v44,  v38,  @"Tried to %@ the same record twice in the same batch",  v41));

  id v16 = v41;
  id v12 = v44;

  id v15 = v42;
  id v13 = v43;
LABEL_28:

  return v39;
}

+ (BOOL)getCloudKitErrorCode:(int64_t *)a3 internalCode:(int64_t *)a4 fromError:(id)a5
{
  id v8 = a5;
  uint64_t v31 = 0LL;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  id v34 = [v8 code];
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  uint64_t v30 = 0LL;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 0;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
  unsigned int v10 = [v9 isEqualToString:CKErrorDomain];

  if (v10)
  {
    id v11 = [v8 code];
    v32[3] = (uint64_t)v11;
    if (v11 == (id)2)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:CKPartialErrorsByItemIDKey]);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_1000A6B68;
      v22[3] = &unk_1002423B8;
      v22[4] = &v31;
      v22[5] = &v27;
      v22[6] = &v23;
      v22[7] = a1;
      [v13 enumerateKeysAndObjectsUsingBlock:v22];
    }

    if (!*((_BYTE *)v24 + 24))
    {
      *((_BYTE *)v24 + 24) = 1;
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:NSUnderlyingErrorKey]);

      if (v15
        && (id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 domain]),
            unsigned int v17 = [v16 isEqualToString:CKUnderlyingErrorDomain],
            v16,
            v17))
      {
        id v18 = [v15 code];
      }

      else
      {
        id v18 = 0LL;
      }

      v28[3] = (uint64_t)v18;
    }
  }

  int v19 = *((unsigned __int8 *)v24 + 24);
  if (*((_BYTE *)v24 + 24))
  {
    *a3 = v32[3];
    *a4 = v28[3];
  }

  BOOL v20 = v19 != 0;
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v20;
}

+ (BOOL)isPartialFailureError:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)_filteredPartialFailureError:(id)a3 itemClass:(Class)a4
{
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:CKPartialErrorsByItemIDKey]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000A6D78;
  v15[3] = &unk_1002423E0;
  Class v18 = a4;
  SEL v19 = a2;
  id v16 = v7;
  id v20 = a1;
  unsigned int v10 =  -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v9 count]);
  unsigned int v17 = v10;
  id v11 = v7;
  [v9 enumerateKeysAndObjectsUsingBlock:v15];
  id v12 = v17;
  id v13 = v10;

  return v13;
}

+ (id)errorsPerRecordIDForPartialFailureError:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _filteredPartialFailureError:v4 itemClass:objc_opt_class(CKRecordID)];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

+ (id)errorsPerZoneIDForPartialFailureError:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _filteredPartialFailureError:v4 itemClass:objc_opt_class(CKRecordZoneID)];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

+ (id)realErrorForError:(id)a3
{
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_1000A55BC;
  id v16 = sub_1000A55CC;
  id v4 = a3;
  id v17 = v4;
  if ([a1 isPartialFailureError:v4])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:CKPartialErrorsByItemIDKey]);

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000A7024;
    v9[3] = &unk_100242408;
    id v10 = v4;
    id v11 = &v12;
    [v6 enumerateKeysAndObjectsUsingBlock:v9];
  }

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

+ (BOOL)isRecordNotFoundError:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)isFeatureDisabledError:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:NSUnderlyingErrorKey]);

  if (v4)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    unsigned int v6 = [v5 isEqualToString:CKUnderlyingErrorDomain];

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:NSUnderlyingErrorKey]);

      if (v8)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
        LOBYTE(v6) = (([v9 isEqualToString:@"CPL"] & 1) != 0
      }

      else
      {
        LOBYTE(v6) = 0;
      }
    }
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)isCloudKitOperationCancelledError:(id)a3
{
  return CKErrorIsCode(a3, 20LL);
}

+ (BOOL)isOperationCancelledOrDeferredError:(id)a3
{
  id v3 = a3;
  if (([v3 isCPLOperationCancelledError] & 1) != 0
    || ([v3 isCPLOperationDeferredError] & 1) != 0)
  {
    BOOL v4 = 1;
  }

  else
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    unsigned int v7 = [v6 isEqualToString:CKErrorDomain];

    if (v7)
    {
      id v8 = [v3 code];
      BOOL v4 = v8 == (id)20 || v8 == (id)132;
    }

    else
    {
      BOOL v4 = 0;
    }
  }

  return v4;
}

+ (BOOL)isOperationThrottledError:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if (![v4 isEqualToString:CKErrorDomain])
  {

    goto LABEL_7;
  }

  if ([v3 code] != (id)7)
  {
    id v5 = [v3 code];

    if (v5 == (id)6) {
      goto LABEL_6;
    }
LABEL_7:
    unsigned __int8 v6 = [v3 isCPLThrottlingError];
    goto LABEL_8;
  }

LABEL_6:
  unsigned __int8 v6 = 1;
LABEL_8:

  return v6;
}

+ (BOOL)isContainerHasBeenWipedError:(id)a3
{
  id v3 = a3;
  if ([v3 code] == (id)26)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:CKErrorUserDidResetEncryptedDataKey]);
    unsigned __int8 v6 = [v5 BOOLValue];
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

@end