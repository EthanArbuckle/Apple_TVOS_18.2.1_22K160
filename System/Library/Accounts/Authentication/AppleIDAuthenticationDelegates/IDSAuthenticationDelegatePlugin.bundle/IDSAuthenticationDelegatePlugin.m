}

id sub_2804(id result, void *a2, uint64_t a3)
{
  if (a2)
  {
    v3 = result;
    if (result)
    {
      if (a3)
      {
        uint64_t v5 = IDSAccountKeyForServerKey(a3);
        result = [a2 objectForKey:v5];
        if (result)
        {
          id v6 = result;
          v7 = (os_log_s *)+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration");
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            int v8 = 138412802;
            id v9 = v6;
            __int16 v10 = 2112;
            uint64_t v11 = v5;
            __int16 v12 = 2112;
            id v13 = [v3 identifier];
            _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "   * Setting %@ for key %@  on accountIdentifier: %@",  (uint8_t *)&v8,  0x20u);
          }

          return [v3 setAccountProperty:v6 forKey:v5];
        }
      }
    }
  }

  return result;
}

void sub_2908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = (os_log_s *)+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    uint64_t v11 = a3;
    __int16 v12 = 2112;
    uint64_t v13 = a2;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "Saved account: %@  (error %@  objectID: %@)",  (uint8_t *)&v8,  0x20u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_2ABC(uint64_t a1)
{
  v2 = dispatch_group_create();
  v3 = +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  ACAccountTypeIdentifierIdentityServices,  0LL);
  uint64_t v4 = IDSAuthenticationDictionaryKeyIDSDelegate;
  id v5 = [*(id *)(a1 + 32) objectForKey:IDSAuthenticationDictionaryKeyIDSDelegate];
  if (v5)
  {
    id v6 = v5;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v34,  v40,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v35;
      do
      {
        __int16 v10 = 0LL;
        do
        {
          if (*(void *)v35 != v9) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(a1 + 40) _storeAccountForServiceType:*(void *)(*((void *)&v34 + 1) + 8 * (void)v10) accountStore:*(void *)(a1 + 48) parameters:v6 group:v2 completion:*(void *)(a1 + 56)];
          __int16 v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v34,  v40,  16LL);
      }

      while (v8);
    }

    uint64_t v11 = IDSParseAuthDictionaryForServiceData(v6);
    __int16 v12 = (void *)IDSAccountPropertiesFromAuthenticationDictionary(v11);
    uint64_t v13 = IDSAuthenticationDictionaryKeyAppleID;
    id v14 = [v12 objectForKey:IDSAuthenticationDictionaryKeyAppleID];
    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v16 = objc_msgSend( objc_msgSend(v12, "objectForKey:", IDSAuthenticationDictionaryKeySelfHandle),  "objectForKey:",  @"uri");
    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_2EC4;
    v33[3] = &unk_4208;
    v33[4] = v17;
    id v18 = objc_msgSend( objc_msgSend(v12, "objectForKey:", IDSAuthenticationDictionaryKeyHandles),  "__imArrayByApplyingBlock:",  v33);
    id v19 = [v12 objectForKey:IDSAuthenticationDictionaryKeyProfileID];
    if (v19) {
      CFDictionarySetValue(v15, kIDSServiceDefaultsAuthorizationIDKey, v19);
    }
    id v20 = [v12 objectForKey:v13];
    if (v20) {
      CFDictionarySetValue(v15, kIDSServiceDefaultsAppleIDKey, v20);
    }
    if ([v16 length] && v16) {
      CFDictionarySetValue(v15, kIDSServiceDefaultsSelfHandleKey, v16);
    }
    if (-[NSMutableArray count](v17, "count"))
    {
      id v21 = -[NSMutableArray copy](v17, "copy");
      if (v21) {
        CFDictionarySetValue(v15, kIDSServiceDefaultsInvisibleAliasesKey, v21);
      }
    }

    if ([v18 count] && v18) {
      CFDictionarySetValue(v15, kIDSServiceDefaultsVettedAliasesKey, v18);
    }
    id v22 = -[__CFDictionary count](v15, "count");
    v23 = (os_log_s *)+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration");
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      if (v24)
      {
        *(_DWORD *)buf = 138412290;
        v39 = v15;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "   Updating with dictionary: %@", buf, 0xCu);
      }

      IDSiCloudUpdate(v14, v15);
    }

    else if (v24)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "   Nothing to update, moving along", buf, 2u);
    }
  }

  else
  {
    v25 = (os_log_s *)+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_2FC8(v4, v25, v26, v27, v28, v29, v30, v31);
    }
  }

  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v2);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  v32 = (os_log_s *)+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_DEFAULT,  "IDSAuthenticationDelegatePlugin - didReceiveAuthenticationResponseParameters done",  buf,  2u);
  }

id sub_2EC4(uint64_t a1, void *a2)
{
  id v4 = objc_msgSend(objc_msgSend(a2, "objectForKey:", @"uri"), "_stripFZIDPrefix");
  unsigned int v5 = objc_msgSend(objc_msgSend(a2, "objectForKey:", @"status"), "intValue");
  id v6 = [a2 objectForKey:@"is-user-visible"];
  if (v5 == 5051) {
    return v4;
  }
  else {
    return 0LL;
  }
}

void sub_2F50( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_2F60( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2FC8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_warning(void *a1, const char *a2, ...)
{
  return [a1 warning];
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   v41 = (os_log_s *)+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration");
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                  {
                    v42 = [v26 identifier];
                    *(_DWORD *)buf = 138412802;
                    v98 = v40;
                    v99 = 2112;
                    v100 = v39;
                    v101 = 2112;
                    v102 = v42;
                    _os_log_impl( &dword_0,  v41,  OS_LOG_TYPE_DEFAULT,  "   * Setting %@ for key %@  on accountIdentifier: %@",  buf,  0x20u);
                  }

                  [v26 setAccountProperty:v40 forKey:v39];
                }

                __int128 v36 = [v34 countByEnumeratingWithState:&v87 objects:v96 count:16];
              }

              while (v36);
            }

            v43 = objc_alloc(&OBJC_CLASS___NSNumber);
            -[NSDate timeIntervalSince1970](+[NSDate now](&OBJC_CLASS___NSDate, "now"), "timeIntervalSince1970");
            objc_msgSend(v26, "setAccountProperty:forKey:", -[NSNumber initWithDouble:](v43, "initWithDouble:"), v71);
            sub_2804(v26, v73, v70);
            sub_2804(v26, v73, v69);
            sub_2804(v26, v73, v68);
            __int16 v12 = v72;
            v44 = [v72 objectForKey:v67];
            if (v44)
            {
              v45 = v44;
              v46 = (ACAccountCredential *)[v66 credentialForAccount:v26];
              if (!v46) {
                v46 = objc_alloc_init(&OBJC_CLASS___ACAccountCredential);
              }
              -[ACAccountCredential setToken:](v46, "setToken:", v45);
              [v26 setCredential:v46];
              [v26 setAuthenticated:1];
              +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
              v48 = v47;
              objc_msgSend( v26,  "setAccountProperty:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  v65);
              v49 = (os_log_s *)+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration");
              v50 = v74;
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138413058;
                v98 = v46;
                v99 = 2112;
                v100 = v26;
                v101 = 2048;
                v102 = v48;
                v103 = 2112;
                v104 = v45;
                _os_log_impl( &dword_0,  v49,  OS_LOG_TYPE_DEFAULT,  "Setting credential on account {credential: %@, account: %@, receiptTime: %f, token: %@}",  buf,  0x2Au);
              }
            }

            else
            {
              v51 = (os_log_s *)+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning");
              v50 = v74;
              if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v63;
                v98 = v64;
                _os_log_error_impl(&dword_0, v51, OS_LOG_TYPE_ERROR, "No auth-token for serviceType = %@", buf, 0xCu);
              }

              [v26 setAuthenticated:0];
            }

            dispatch_group_enter(v50);
          }

          v23 = v81;
          v25 = v82 + 1;
        }

        while ((id)(v82 + 1) != v80);
        v80 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v91,  v111,  16LL);
      }

      while (v80);
    }

    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v52 = (char *)-[NSMutableSet countByEnumeratingWithState:objects:count:]( v75,  "countByEnumeratingWithState:objects:count:",  &v83,  v95,  16LL);
    if (v52)
    {
      v53 = v52;
      v54 = *(void *)v84;
      do
      {
        for (j = 0LL; j != v53; ++j)
        {
          if (*(void *)v84 != v54) {
            objc_enumerationMutation(v75);
          }
          objc_msgSend(v66, "saveAccount:pid:verify:dataclassActions:completion:");
        }

        v53 = (char *)-[NSMutableSet countByEnumeratingWithState:objects:count:]( v75,  "countByEnumeratingWithState:objects:count:",  &v83,  v95,  16LL);
      }

      while (v53);
    }
  }

  else
  {
    v56 = (os_log_s *)+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning");
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      sub_2F60((uint64_t)a3, v56, v57, v58, v59, v60, v61, v62);
    }
  }

- (void)didReceiveAuthenticationResponseParameters:(id)a3 accountStore:(id)a4 completion:(id)a5
{
  uint64_t v9 = (os_log_s *)+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "IDSAuthenticationDelegatePlugin received parameters", buf, 2u);
  }

  IDSAuthenticationDelegatePrintLoginDelegatesBag(a3);
  id v10 = [a5 copy];
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_2ABC;
  v12[3] = &unk_4230;
  v12[4] = a3;
  v12[5] = self;
  v12[6] = a4;
  v12[7] = v10;
  dispatch_async(global_queue, v12);
}

@end