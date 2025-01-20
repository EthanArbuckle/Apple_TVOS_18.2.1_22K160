@interface KeyTransparencyContactMapping
+ (id)countryCodeMap;
+ (id)mapContactsToIDS:(id)a3;
@end

@implementation KeyTransparencyContactMapping

+ (id)countryCodeMap
{
  if (qword_1002EED38 != -1) {
    dispatch_once(&qword_1002EED38, &stru_100287E50);
  }
  return (id)qword_1002EED30;
}

+ (id)mapContactsToIDS:(id)a3
{
  id v39 = a3;
  id v40 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v39 phoneNumbers]);
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v45 objects:v58 count:16];
  v38 = v3;
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v46;
    *(void *)&__int128 v5 = 138413058LL;
    __int128 v36 = v5;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v46 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value", v36));
        v11 = v10;
        if (v10)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue([v10 digits]);
          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue([v11 countryCode]);
            v14 = (void *)IDSCopyIDForPhoneNumberWithOptions(v12, v13, 1LL);

            if (qword_1002EED40 != -1) {
              dispatch_once(&qword_1002EED40, &stru_100287EB0);
            }
            v15 = (void *)qword_1002EED48;
            if (os_log_type_enabled((os_log_t)qword_1002EED48, OS_LOG_TYPE_DEFAULT))
            {
              v16 = v15;
              v17 = (void *)objc_claimAutoreleasedReturnValue([v11 digits]);
              v18 = (void *)objc_claimAutoreleasedReturnValue([v11 countryCode]);
              *(_DWORD *)buf = v36;
              uint64_t v51 = (uint64_t)v17;
              __int16 v52 = 2112;
              v53 = v18;
              __int16 v54 = 2160;
              uint64_t v55 = 1752392040LL;
              __int16 v56 = 2112;
              v57 = v14;
              _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "mapContactsToIDS adding phonenumber %@[%@] as %{mask.hash}@",  buf,  0x2Au);

              v3 = v38;
            }
          }

          else
          {
            if (qword_1002EED40 != -1) {
              dispatch_once(&qword_1002EED40, &stru_100287E90);
            }
            v20 = (os_log_s *)qword_1002EED48;
            if (os_log_type_enabled((os_log_t)qword_1002EED48, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 141558530;
              uint64_t v51 = 1752392040LL;
              __int16 v52 = 2112;
              v53 = v9;
              __int16 v54 = 2112;
              uint64_t v55 = (uint64_t)v39;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "mapContactsToIDS phonenumber string missing %{mask.hash}@ on %@",  buf,  0x20u);
            }
          }
        }

        else
        {
          if (qword_1002EED40 != -1) {
            dispatch_once(&qword_1002EED40, &stru_100287E70);
          }
          v19 = (os_log_s *)qword_1002EED48;
          if (os_log_type_enabled((os_log_t)qword_1002EED48, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 141558530;
            uint64_t v51 = 1752392040LL;
            __int16 v52 = 2112;
            v53 = v9;
            __int16 v54 = 2112;
            uint64_t v55 = (uint64_t)v39;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "mapContactsToIDS phonenumber missing %{mask.hash}@ on %@",  buf,  0x20u);
          }
        }

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v45 objects:v58 count:16];
    }

    while (v6);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v39 emailAddresses]);
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v22 = [v21 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v22)
  {
    id v24 = v22;
    uint64_t v25 = *(void *)v42;
    *(void *)&__int128 v23 = 141558530LL;
    __int128 v37 = v23;
    do
    {
      v26 = 0LL;
      do
      {
        if (*(void *)v42 != v25) {
          objc_enumerationMutation(v21);
        }
        v27 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "value", v37));

        if (v28)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue([v27 value]);
          v30 = (void *)IDSCopyIDForEmailAddress();

          if (qword_1002EED40 != -1) {
            dispatch_once(&qword_1002EED40, &stru_100287EF0);
          }
          v31 = (void *)qword_1002EED48;
          if (os_log_type_enabled((os_log_t)qword_1002EED48, OS_LOG_TYPE_DEFAULT))
          {
            v32 = v31;
            v33 = (void *)objc_claimAutoreleasedReturnValue([v27 value]);
            *(_DWORD *)buf = 141558786;
            uint64_t v51 = 1752392040LL;
            __int16 v52 = 2112;
            v53 = v33;
            __int16 v54 = 2160;
            uint64_t v55 = 1752392040LL;
            __int16 v56 = 2112;
            v57 = v30;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "mapContactsToIDS adding email %{mask.hash}@ as %{mask.hash}@",  buf,  0x2Au);
          }

          if (v30) {
            [v40 addObject:v30];
          }
        }

        else
        {
          if (qword_1002EED40 != -1) {
            dispatch_once(&qword_1002EED40, &stru_100287ED0);
          }
          v34 = (os_log_s *)qword_1002EED48;
          if (os_log_type_enabled((os_log_t)qword_1002EED48, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v37;
            uint64_t v51 = 1752392040LL;
            __int16 v52 = 2112;
            v53 = v27;
            __int16 v54 = 2112;
            uint64_t v55 = (uint64_t)v39;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "mapContactsToIDS phonenumber missing %{mask.hash}@ on %@",  buf,  0x20u);
          }
        }

        v26 = (char *)v26 + 1;
      }

      while (v24 != v26);
      id v24 = [v21 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }

    while (v24);
  }

  return v40;
}

@end