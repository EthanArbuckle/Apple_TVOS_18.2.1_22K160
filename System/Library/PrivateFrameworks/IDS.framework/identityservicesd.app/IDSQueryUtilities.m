@interface IDSQueryUtilities
+ (id)URIToQueryFrom:(id)a3 withPreferredFromURI:(id)a4;
+ (id)accountToQueryFrom:(id)a3 fromURI:(id)a4 destinationStrings:(id)a5 allowLocalAccount:(BOOL)a6;
+ (id)accountToQueryFrom:(id)a3 fromURI:(id)a4 destinationURIs:(id)a5 allowLocalAccount:(BOOL)a6;
+ (id)prefixedAliasStringToQueryFrom:(id)a3 withPreferredFromURI:(id)a4;
@end

@implementation IDSQueryUtilities

+ (id)accountToQueryFrom:(id)a3 fromURI:(id)a4 destinationURIs:(id)a5 allowLocalAccount:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "__imArrayByApplyingBlock:", &stru_1008F8228));
  v13 = (void *)objc_claimAutoreleasedReturnValue( [a1 accountToQueryFrom:v11 fromURI:v10 destinationStrings:v12 allowLocalAccount:v6]);

  return v13;
}

+ (id)accountToQueryFrom:(id)a3 fromURI:(id)a4 destinationStrings:(id)a5 allowLocalAccount:(BOOL)a6
{
  BOOL v67 = a6;
  id v8 = a3;
  id v71 = a4;
  id v9 = a5;
  v72 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v68 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "__imArrayByApplyingBlock:", &stru_1008F8248));
  id v73 = [v10 mutableCopy];

  __int128 v83 = 0u;
  __int128 v84 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v81 objects:v90 count:16];
  if (v11)
  {
    v75 = 0LL;
    BOOL v12 = 0;
    v13 = 0LL;
    uint64_t v14 = *(void *)v82;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v82 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v81 + 1) + 8LL * (void)i);
        if ([v16 accountType] == 1)
        {
          id v17 = v16;

          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 unprefixedURIStringsFromRegistration]);
          v80[0] = _NSConcreteStackBlock;
          v80[1] = 3221225472LL;
          v80[2] = sub_10005F2CC;
          v80[3] = &unk_1008F8270;
          v80[4] = v17;
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v80));
          v20 = (void *)objc_claimAutoreleasedReturnValue([v18 filteredArrayUsingPredicate:v19]);

          BOOL v12 = [v20 count] != 0;
          v21 = (void *)objc_claimAutoreleasedReturnValue([v17 unprefixedURIStringsFromRegistration]);
          [v73 removeObjectsInArray:v21];

          v13 = v17;
        }

        else if ([v16 accountType] {
               || ![v16 isUsableForSending])
        }
        {
          id v22 = v16;

          v75 = v22;
        }

        else
        {
          -[NSMutableArray addObject:](v72, "addObject:", v16);
        }
      }

      id v11 = [obj countByEnumeratingWithState:&v81 objects:v90 count:16];
    }

    while (v11);
  }

  else
  {
    v75 = 0LL;
    BOOL v12 = 0;
    v13 = 0LL;
  }

  id v69 = [v73 count];
  if (v71)
  {
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    id v23 = obj;
    id v70 = [v23 countByEnumeratingWithState:&v76 objects:v89 count:16];
    if (v70)
    {
      uint64_t v24 = *(void *)v77;
LABEL_19:
      uint64_t v25 = 0LL;
      while (1)
      {
        if (*(void *)v77 != v24) {
          objc_enumerationMutation(v23);
        }
        v26 = *(void **)(*((void *)&v76 + 1) + 8 * v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 unprefixedURIStringsFromRegistration]);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v71 prefixedURI]);
        v29 = (void *)objc_claimAutoreleasedReturnValue([v28 _stripFZIDPrefix]);
        if ([v27 containsObject:v29])
        {
          unsigned __int8 v30 = [v26 isUsableForSending];

          if ((v30 & 1) != 0)
          {
            BOOL v31 = [v26 accountType] != 1 || v69 == 0;
            if (v31 || v12) {
              v32 = v26;
            }
            else {
              v32 = 0LL;
            }
            id v33 = v32;

            if (!v33) {
              goto LABEL_42;
            }
            uint64_t v34 = OSLogHandleForIDSCategory("IDQuery");
            v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              v36 = (__CFString *)objc_claimAutoreleasedReturnValue([v33 smallDescription]);
              *(_DWORD *)buf = 138412290;
              v86 = v36;
              _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Selected account {accountMatchingFromID: %@}",  buf,  0xCu);
            }

            if (os_log_shim_legacy_logging_enabled(v37))
            {
              v61 = (void *)objc_claimAutoreleasedReturnValue([v33 smallDescription]);
              MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @"Selected account {accountMatchingFromID: %@}");

              v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "smallDescription", v61));
              IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"Selected account {accountMatchingFromID: %@}");

              if ((_IMWillLog(@"IDQuery", v38) & 1) != 0)
              {
                v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "smallDescription", v62));
                _IMAlwaysLog(0LL, @"IDQuery", @"Selected account {accountMatchingFromID: %@}");
              }
            }

            id v39 = v33;
            id v40 = v26;
LABEL_78:

            goto LABEL_79;
          }
        }

        else
        {
        }

        if (v70 == (id)++v25)
        {
          id v70 = [v23 countByEnumeratingWithState:&v76 objects:v89 count:16];
          if (v70) {
            goto LABEL_19;
          }
          break;
        }
      }
    }
  }

+ (id)prefixedAliasStringToQueryFrom:(id)a3 withPreferredFromURI:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 URIToQueryFrom:a3 withPreferredFromURI:a4]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 prefixedURI]);

  return v5;
}

+ (id)URIToQueryFrom:(id)a3 withPreferredFromURI:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 accountType] == 2)
  {
    v7 = objc_alloc(&OBJC_CLASS___IDSURI);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 loginID]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    id v11 = -[IDSURI initWithPrefixedURI:withServiceLoggingHint:]( v7,  "initWithPrefixedURI:withServiceLoggingHint:",  v8,  v10);
  }

  else
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    uint64_t v14 = _IDSPrefersPhoneNumbersForServiceIdentifier();

    id v15 = [v5 shouldRegisterUsingDSHandle];
    if ((_DWORD)v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v5 primaryRegistration]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v16 dsHandle]);
    }

    else
    {
      id v8 = 0LL;
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 unprefixedURI]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v5 unprefixedURIStringsFromRegistration]);
    id v9 = (void *)_IDSCopyCallerIDWithSelfMessagingHint(v17, v18, 0LL, v8, v15, v14, 0LL);

    v19 = objc_alloc(&OBJC_CLASS___IDSURI);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    id v11 = -[IDSURI initWithUnprefixedURI:withServiceLoggingHint:]( v19,  "initWithUnprefixedURI:withServiceLoggingHint:",  v9,  v20);
  }

  return v11;
}

@end