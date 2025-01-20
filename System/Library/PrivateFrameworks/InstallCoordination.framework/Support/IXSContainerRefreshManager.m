@interface IXSContainerRefreshManager
+ (id)sharedInstance;
- (BOOL)_onQueue_refreshContainerTypes:(unint64_t)a3 forAppWithIdentity:(id)a4 error:(id *)a5;
- (BOOL)_onQueue_terminateBundleID:(id)a3 reason:(id)a4 terminationAssertion:(id *)a5 error:(id *)a6;
- (void)refreshContainerTypes:(unint64_t)a3 forAppWithIdentity:(id)a4 reason:(id)a5 completion:(id)a6;
@end

@implementation IXSContainerRefreshManager

+ (id)sharedInstance
{
  if (qword_1000E8F78 != -1) {
    dispatch_once(&qword_1000E8F78, &stru_1000CE7F0);
  }
  return (id)qword_1000E8F80;
}

- (BOOL)_onQueue_terminateBundleID:(id)a3 reason:(id)a4 terminationAssertion:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_alloc(&OBJC_CLASS___RBSTerminateContext);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Refreshing data container: %@",  v10));

  id v13 = [v11 initWithExplanation:v12];
  [v13 setMaximumTerminationResistance:40];
  v14 = objc_alloc(&OBJC_CLASS___RBSTerminationAssertion);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingBundleIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingBundleIdentifier:",  v9));
  v16 = -[RBSTerminationAssertion initWithPredicate:context:](v14, "initWithPredicate:context:", v15, v13);

  if (v16)
  {
    id v30 = 0LL;
    unsigned __int8 v17 = -[RBSTerminationAssertion acquireWithError:](v16, "acquireWithError:", &v30);
    id v18 = v30;
    if ((v17 & 1) != 0)
    {
      BOOL v19 = 1;
      if (!a5) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }

    v25 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v32 = "-[IXSContainerRefreshManager _onQueue_terminateBundleID:reason:terminationAssertion:error:]";
      __int16 v33 = 2112;
      id v34 = v9;
      __int16 v35 = 2112;
      v36 = v16;
      __int16 v37 = 2112;
      id v38 = v18;
      _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%s: Failed to acquire termination assertion for identifier %@: assertion = %@ : %@",  buf,  0x2Au);
    }

    id v28 = sub_10003556C( (uint64_t)"-[IXSContainerRefreshManager _onQueue_terminateBundleID:reason:terminationAssertion:error:]",  62LL,  @"IXErrorDomain",  0x13uLL,  v18,  0LL,  @"Failed to acquire termination assertion for identifier %@: assertion = %@",  v27,  (uint64_t)v9);
    uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);

    id v18 = (id)v29;
    if (!a6) {
      goto LABEL_14;
    }
  }

  else
  {
    v20 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100082104();
    }

    id v23 = sub_10003556C( (uint64_t)"-[IXSContainerRefreshManager _onQueue_terminateBundleID:reason:terminationAssertion:error:]",  56LL,  @"IXErrorDomain",  0x13uLL,  0LL,  0LL,  @"Failed to create termination assertion for identifier %@",  v22,  (uint64_t)v9);
    id v18 = (id)objc_claimAutoreleasedReturnValue(v23);
    if (!a6)
    {
LABEL_14:
      BOOL v19 = 0;
      v16 = 0LL;
      if (!a5) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }

  id v18 = v18;
  BOOL v19 = 0;
  v16 = 0LL;
  *a6 = v18;
  if (a5) {
LABEL_9:
  }
    *a5 = v16;
LABEL_10:

  return v19;
}

- (BOOL)_onQueue_refreshContainerTypes:(unint64_t)a3 forAppWithIdentity:(id)a4 error:(id *)a5
{
  char v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 personaUniqueString]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleID]);
  if ((v6 & 2) != 0)
  {
    id v43 = 0LL;
    v12 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  v9,  1LL,  &v43);
    id v13 = (LSApplicationRecord *)v43;
    if (!v12)
    {
      v25 = sub_1000047B4((uint64_t)off_1000E8CA0);
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_100082174((uint64_t)v7, (uint64_t)v13, v26);
      }

      id v28 = sub_10003556C( (uint64_t)"-[IXSContainerRefreshManager _onQueue_refreshContainerTypes:forAppWithIdentity:error:]",  152LL,  @"IXErrorDomain",  0x23uLL,  v13,  0LL,  @"Failed to fetch application record for \"%@\"",  v27,  (uint64_t)v7);
      id v10 = (LSApplicationRecord *)objc_claimAutoreleasedReturnValue(v28);
LABEL_18:

      if (!a5) {
        goto LABEL_25;
      }
      goto LABEL_19;
    }

    char v32 = v6;
    __int16 v33 = v12;
    id v34 = a5;
    __int16 v35 = v9;
    id v36 = v7;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id v14 = (id)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord applicationExtensionRecords](v12, "applicationExtensionRecords"));
    id v15 = [v14 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v40;
      id v10 = v13;
      while (2)
      {
        id v18 = 0LL;
        BOOL v19 = v10;
        do
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(v14);
          }
          v20 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)v18);
          v21 = objc_alloc(&OBJC_CLASS___IXApplicationIdentity);
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 bundleIdentifier]);
          id v23 = -[IXApplicationIdentity initWithBundleIdentifier:personaUniqueString:]( v21,  "initWithBundleIdentifier:personaUniqueString:",  v22,  v8);

          id v38 = v19;
          int v24 = sub_100058BCC(v23, 4LL, &v38);
          id v10 = v38;

          if (!v24)
          {

            id v13 = v33;
            a5 = v34;
            id v9 = v35;
            id v7 = v36;
            goto LABEL_18;
          }

          id v18 = (char *)v18 + 1;
          BOOL v19 = v10;
        }

        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    else
    {
      id v10 = v13;
    }

    id v9 = v35;
    id v7 = v36;
    a5 = v34;
    if ((v32 & 1) == 0) {
      goto LABEL_3;
    }
LABEL_22:
    __int16 v37 = v10;
    char v29 = sub_100058BCC(v7, 2LL, &v37);
    id v30 = v37;

    if ((v29 & 1) != 0)
    {
      BOOL v11 = 1;
      id v10 = v30;
      goto LABEL_26;
    }

    id v10 = v30;
    if (!a5)
    {
LABEL_25:
      BOOL v11 = 0;
      goto LABEL_26;
    }

- (void)refreshContainerTypes:(unint64_t)a3 forAppWithIdentity:(id)a4 reason:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100059060;
  v17[3] = &unk_1000CE818;
  id v18 = (id)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
  id v19 = v10;
  v20 = self;
  id v21 = v11;
  id v22 = v12;
  unint64_t v23 = a3;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = v18;
  [v16 performCreationBlockingOperation:v17];
}

@end