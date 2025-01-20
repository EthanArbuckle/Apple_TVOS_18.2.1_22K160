@interface StartCallDefaultFavoritesDataSource
- (BOOL)hasFavoritesEntryForContact:(id)a3;
- (BOOL)hasFavoritesEntryForTelephonyCallWithPhoneNumber:(id)a3 isoCountryCodes:(id)a4;
- (CNFavorites)favoritesController;
- (StartCallDefaultFavoritesDataSource)initWithCallCenter:(id)a3;
- (TUCallCenter)callCenter;
@end

@implementation StartCallDefaultFavoritesDataSource

- (StartCallDefaultFavoritesDataSource)initWithCallCenter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___StartCallDefaultFavoritesDataSource;
  v6 = -[StartCallDefaultFavoritesDataSource init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_callCenter, a3);
  }

  return v7;
}

- (CNFavorites)favoritesController
{
  favoritesController = self->_favoritesController;
  if (!favoritesController)
  {
    v4 = objc_alloc(&OBJC_CLASS___CNFavorites);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUCallCenter contactStore](self->_callCenter, "contactStore"));
    v6 = -[CNFavorites initWithContactStore:](v4, "initWithContactStore:", v5);
    v7 = self->_favoritesController;
    self->_favoritesController = v6;

    favoritesController = self->_favoritesController;
  }

  return favoritesController;
}

- (BOOL)hasFavoritesEntryForContact:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallDefaultFavoritesDataSource favoritesController](self, "favoritesController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 entriesForContact:v4]);

  LOBYTE(v5) = [v6 count] != 0;
  return (char)v5;
}

- (BOOL)hasFavoritesEntryForTelephonyCallWithPhoneNumber:(id)a3 isoCountryCodes:(id)a4
{
  id v38 = a3;
  id v6 = a4;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallDefaultFavoritesDataSource favoritesController](self, "favoritesController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 entries]);

  id v9 = [v8 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (!v9) {
    goto LABEL_29;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v44;
  v36 = (void *)CNActionBundleIdentifierPhone;
  v37 = (void *)CNActionTypeAudioCall;
  v32 = v8;
  id v33 = v6;
  uint64_t v34 = *(void *)v44;
  do
  {
    v12 = 0LL;
    id v35 = v10;
    do
    {
      if (*(void *)v44 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "actionType", v32, v33));
      if ([v37 isEqualToString:v14])
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
        unsigned int v16 = [v36 isEqualToString:v15];

        if (!v16) {
          goto LABEL_27;
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 contactProperty]);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v14 value]);
        if (v17 && (uint64_t v18 = objc_opt_class(&OBJC_CLASS___CNPhoneNumber), (objc_opt_isKindOfClass(v17, v18) & 1) != 0))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue([v17 stringValue]);
          if ([v19 length])
          {
            v20 = -[TUHandle initWithType:value:](objc_alloc(&OBJC_CLASS___TUHandle), "initWithType:value:", 2LL, v19);
            __int128 v39 = 0u;
            __int128 v40 = 0u;
            __int128 v41 = 0u;
            __int128 v42 = 0u;
            id v21 = v6;
            id v22 = [v21 countByEnumeratingWithState:&v39 objects:v49 count:16];
            if (v22)
            {
              id v23 = v22;
              uint64_t v24 = *(void *)v40;
              while (2)
              {
                for (i = 0LL; i != v23; i = (char *)i + 1)
                {
                  if (*(void *)v40 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  if (-[TUHandle isCanonicallyEqualToHandle:isoCountryCode:]( v20,  "isCanonicallyEqualToHandle:isoCountryCode:",  v38,  *(void *)(*((void *)&v39 + 1) + 8LL * (void)i)))
                  {
                    id v29 = IntentHandlerDefaultLog();
                    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
                    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v48 = v13;
                      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Found a favorites entry matching handle: %@",  buf,  0xCu);
                    }

                    BOOL v28 = 1;
                    v8 = v32;
                    id v6 = v33;
                    goto LABEL_33;
                  }
                }

                id v23 = [v21 countByEnumeratingWithState:&v39 objects:v49 count:16];
                if (v23) {
                  continue;
                }
                break;
              }
            }

            v8 = v32;
            id v6 = v33;
          }

          else
          {
            id v27 = IntentHandlerDefaultLog();
            v20 = (TUHandle *)objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v48 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring favorite for telephony call with an empty phone number: %@",  buf,  0xCu);
            }
          }
        }

        else
        {
          id v26 = IntentHandlerDefaultLog();
          v19 = (void *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v48 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring favorite for telephony call without a phone number: %@",  buf,  0xCu);
          }
        }

        uint64_t v11 = v34;
        id v10 = v35;
      }

LABEL_27:
      v12 = (char *)v12 + 1;
    }

    while (v12 != v10);
    id v10 = [v8 countByEnumeratingWithState:&v43 objects:v50 count:16];
  }

  while (v10);
LABEL_29:
  BOOL v28 = 0;
LABEL_33:

  return v28;
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (void).cxx_destruct
{
}

@end