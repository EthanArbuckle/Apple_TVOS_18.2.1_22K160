@interface OTAccountsActualAdapter
- (ACAccountStore)store;
- (BOOL)isErrorRetryable:(id)a3;
- (id)fetchAccountsRetryingWithError:(id *)a3;
- (id)findAccountForCurrentThread:(id)a3 optionalAltDSID:(id)a4 cloudkitContainerName:(id)a5 octagonContextID:(id)a6 error:(id *)a7;
- (id)inflateAllTPSpecificUsers:(id)a3 octagonContextID:(id)a4;
- (void)setStore:(id)a3;
@end

@implementation OTAccountsActualAdapter

- (BOOL)isErrorRetryable:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    else {
      BOOL v6 = 0;
    }
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)fetchAccountsRetryingWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTAccountsActualAdapter store](self, "store"));
  id v16 = 0LL;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_appleAccountsWithError:", &v16));
  id v7 = v16;

  if (v6)
  {
LABEL_2:
    id v8 = v6;
  }

  else
  {
    int v10 = 0;
    while (v10 != 5 && -[OTAccountsActualAdapter isErrorRetryable:](self, "isErrorRetryable:", v7))
    {
      v11 = sub_10001267C("octagon-account");
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        LODWORD(v18[0]) = v10;
        WORD2(v18[0]) = 2112;
        *(void *)((char *)v18 + 6) = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "retrying accountsd XPC, (%d, %@)",  buf,  0x12u);
      }

      ++v10;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTAccountsActualAdapter store](self, "store"));
      id v16 = 0LL;
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "aa_appleAccountsWithError:", &v16));
      id v7 = v16;

      if (v6) {
        goto LABEL_2;
      }
    }

    v14 = sub_10001267C("SecError");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18[0] = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "octagon-account: Can't talk with accountsd: %@",  buf,  0xCu);
    }

    if (a3)
    {
      id v7 = v7;
      id v8 = 0LL;
      *a3 = v7;
    }

    else
    {
      id v8 = 0LL;
    }
  }

  return v8;
}

- (id)findAccountForCurrentThread:(id)a3 optionalAltDSID:(id)a4 cloudkitContainerName:(id)a5 octagonContextID:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  unsigned int v16 = [v12 currentThreadIsForPrimaryiCloudAccount];
  v17 = (void *)objc_claimAutoreleasedReturnValue([v12 currentThreadPersonaUniqueString]);
  v18 = sub_10001267C("octagon-account");
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v94 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "persona identifier: %@", buf, 0xCu);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTAccountsActualAdapter store](self, "store"));
  if (!v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    -[OTAccountsActualAdapter setStore:](self, "setStore:", v21);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue( -[OTAccountsActualAdapter fetchAccountsRetryingWithError:]( self,  "fetchAccountsRetryingWithError:",  a7));
  id obj = v22;
  if (!v22)
  {
    v38 = sub_10001267C("SecError");
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "octagon-account: failed to find accounts",  buf,  2u);
    }

    v39 = 0LL;
    goto LABEL_61;
  }

  unsigned int v84 = v16;
  v81 = a7;
  id v82 = v12;
  id v85 = v15;
  id v83 = v14;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  id v23 = [v22 countByEnumeratingWithState:&v89 objects:v95 count:16];
  if (!v23)
  {
    v25 = 0LL;
    v88 = 0LL;
    id v86 = 0LL;
    goto LABEL_27;
  }

  id v24 = v23;
  v25 = 0LL;
  v88 = 0LL;
  id v86 = 0LL;
  uint64_t v26 = *(void *)v90;
  uint64_t v27 = AAAccountClassPrimary;
  do
  {
    for (i = 0LL; i != v24; i = (char *)i + 1)
    {
      if (*(void *)v90 != v26) {
        objc_enumerationMutation(obj);
      }
      v29 = *(void **)(*((void *)&v89 + 1) + 8LL * (void)i);
      if (v13)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v89 + 1) + 8 * (void)i), "aa_altDSID"));
        unsigned int v31 = [v13 isEqualToString:v30];

        if (v31)
        {
          id v32 = v29;

          v88 = v32;
        }
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue([v29 personaIdentifier]);
      unsigned int v34 = [v17 isEqualToString:v33];

      if (v34)
      {
        v35 = v29;

        v25 = v35;
      }

      v36 = (void *)objc_claimAutoreleasedReturnValue([v29 personaIdentifier]);
      if (!v36)
      {
        id v37 = v29;
        v36 = v86;
        id v86 = v37;
      }
    }

    id v24 = [obj countByEnumeratingWithState:&v89 objects:v95 count:16];
  }

  while (v24);
LABEL_27:
  v40 = sub_10001267C("octagon-account");
  v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v94 = v17;
    *(_WORD *)&v94[8] = 2112;
    *(void *)&v94[10] = v13;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEBUG,  "Search Criteria  - persona: %@ altDSID: %@",  buf,  0x16u);
  }

  v42 = sub_10001267C("octagon-account");
  v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
  id v15 = v85;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "aa_altDSID"));
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v94 = v84;
    *(_WORD *)&v94[4] = 2112;
    *(void *)&v94[6] = v76;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEBUG,  "Primary account - persona primary: %{BOOL}d altDSID: %@",  buf,  0x12u);
  }

  v44 = sub_10001267C("octagon-account");
  v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
  id v14 = v83;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
  {
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s personaIdentifier](v25, "personaIdentifier"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s aa_altDSID](v25, "aa_altDSID"));
    *(_DWORD *)buf = 138412546;
    *(void *)v94 = v77;
    *(_WORD *)&v94[8] = 2112;
    *(void *)&v94[10] = v78;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEBUG,  "Match by persona - persona: %@ altDSID: %@",  buf,  0x16u);
  }

  v46 = sub_10001267C("octagon-account");
  v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
  {
    v79 = (void *)objc_claimAutoreleasedReturnValue([v88 personaIdentifier]);
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "aa_altDSID"));
    *(_DWORD *)buf = 138412546;
    *(void *)v94 = v79;
    *(_WORD *)&v94[8] = 2112;
    *(void *)&v94[10] = v80;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEBUG,  "Match by altDSID - persona: %@ altDSID: %@",  buf,  0x16u);
  }

  if (!v84)
  {
    if (v13)
    {
      if (!v25
        || !v88
        || (v49 = (void *)objc_claimAutoreleasedReturnValue([v88 personaIdentifier]),
            v50 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s personaIdentifier](v25, "personaIdentifier")),
            unsigned __int8 v51 = [v49 isEqualToString:v50],
            v50,
            v49,
            v48 = v25,
            (v51 & 1) == 0))
      {
        v52 = sub_10001267C("octagon-account");
        v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v94 = v17;
          *(_WORD *)&v94[8] = 2112;
          *(void *)&v94[10] = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Search Criteria  - persona: %@ altDSID: %@",  buf,  0x16u);
        }

        v54 = sub_10001267C("octagon-account");
        v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
        id v12 = v82;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "aa_altDSID"));
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v94 = 0;
          *(_WORD *)&v94[4] = 2112;
          *(void *)&v94[6] = v56;
          _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "Primary account - persona primary: %{BOOL}d altDSID: %@",  buf,  0x12u);
        }

        v57 = sub_10001267C("octagon-account");
        v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          v59 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s personaIdentifier](v25, "personaIdentifier"));
          v60 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s aa_altDSID](v25, "aa_altDSID"));
          *(_DWORD *)buf = 138412546;
          *(void *)v94 = v59;
          *(_WORD *)&v94[8] = 2112;
          *(void *)&v94[10] = v60;
          _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "Match by persona - persona: %@ altDSID: %@",  buf,  0x16u);
        }

        v61 = sub_10001267C("octagon-account");
        v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          v63 = (void *)objc_claimAutoreleasedReturnValue([v88 personaIdentifier]);
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "aa_altDSID"));
          *(_DWORD *)buf = 138412546;
          *(void *)v94 = v63;
          *(_WORD *)&v94[8] = 2112;
          *(void *)&v94[10] = v64;
          _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "Match by altDSID - persona: %@ altDSID: %@",  buf,  0x16u);
        }

        if (v81)
        {
          v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AppleAccount mismatch for persona '%@' and altDSID '%@'",  v17,  v13));
          id *v81 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  63LL,  v65));
        }

        v66 = sub_10001267C("octagon-account");
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
        id v15 = v85;
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "Persona/altDSID mis-match specified for query",  buf,  2u);
        }

        v39 = 0LL;
        goto LABEL_59;
      }

      goto LABEL_58;
    }

    goto LABEL_57;
  }

  if (!v13)
  {
    v48 = (os_log_s *)v86;
    if (v86) {
      goto LABEL_58;
    }
LABEL_57:
    v48 = v25;
    if (!v25) {
      goto LABEL_62;
    }
    goto LABEL_58;
  }

  v48 = (os_log_s *)v88;
  if (v88)
  {
LABEL_58:
    v67 = v48;
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s aa_altDSID](v67, "aa_altDSID"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s identifier](v67, "identifier"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s personaIdentifier](v67, "personaIdentifier"));
    v71 = objc_alloc(&OBJC_CLASS___TPSpecificUser);
    v39 = -[TPSpecificUser initWithCloudkitContainerName:octagonContextID:appleAccountID:altDSID:isPrimaryPersona:personaUniqueString:]( v71,  "initWithCloudkitContainerName:octagonContextID:appleAccountID:altDSID:isPrimaryPersona:personaUniqueString:",  v83,  v85,  v69,  v68,  -[os_log_s aa_isAccountClass:](v67, "aa_isAccountClass:", AAAccountClassPrimary),  v70);

    id v12 = v82;
LABEL_59:

    goto LABEL_60;
  }

- (id)inflateAllTPSpecificUsers:(id)a3 octagonContextID:(id)a4
{
  id v23 = a3;
  id v22 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  v20 = v5;
  id obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_appleAccounts"));
  id v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v25;
    uint64_t v10 = AAAccountClassPrimary;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)v11);
        id v13 = objc_alloc(&OBJC_CLASS___TPSpecificUser);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "aa_altDSID"));
        id v16 = objc_msgSend(v12, "aa_isAccountClass:", v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v12 personaIdentifier]);
        v18 = -[TPSpecificUser initWithCloudkitContainerName:octagonContextID:appleAccountID:altDSID:isPrimaryPersona:personaUniqueString:]( v13,  "initWithCloudkitContainerName:octagonContextID:appleAccountID:altDSID:isPrimaryPersona:personaUniqueString:",  v23,  v22,  v14,  v15,  v16,  v17);

        [v6 addObject:v18];
        v11 = (char *)v11 + 1;
      }

      while (v8 != v11);
      id v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v8);
  }

  return v6;
}

- (ACAccountStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end