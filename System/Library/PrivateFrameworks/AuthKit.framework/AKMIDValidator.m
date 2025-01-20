@interface AKMIDValidator
+ (id)_anisetteValidationQueue;
+ (id)sharedValidator;
- (AKMIDValidator)init;
- (BOOL)_isMatchingMIDDriftedErrorDictionary:(id)a3 ttrConfigMIDDriftedErrors:(id)a4;
- (BOOL)_isTTRConfigMatchingMIDDriftedErrors:(id)a3;
- (BOOL)_isTTREligibleForMIDDriftedError:(id)a3;
- (BOOL)_setLastKnownMID:(id)a3 keychainError:(id *)a4;
- (BOOL)resetKeychainCacheWithError:(id *)a3;
- (NSString)lastKnownMID;
- (id)_createErrorWithMIDDriftUnderlyingError:(id)a3 anisetteFetchError:(id)a4;
- (id)_defaultMIDInvalidatedTTRConfig;
- (id)_initWithKeychain:(id)a3;
- (id)_lastKnownMIDWithKeychainError:(id *)a3;
- (id)_normalizedMIDDriftedError:(id)a3 underlyingLevel:(unint64_t)a4 midDriftedErrorDict:(id)a5;
- (int64_t)_calculateAndPersistDriftStatusForMID:(id)a3 anisetteFetchError:(id)a4 error:(id *)a5;
- (void)_triggerTTRForMIDDriftedError:(id)a3;
- (void)setLastKnownMID:(id)a3;
- (void)validateMID:(id)a3 anisetteFetchError:(id)a4;
@end

@implementation AKMIDValidator

- (AKMIDValidator)init
{
  v3 = objc_opt_new(&OBJC_CLASS___AKMIDKeychain);
  v4 = -[AKMIDValidator _initWithKeychain:](objc_alloc(&OBJC_CLASS___AKMIDValidator), "_initWithKeychain:", v3);

  return v4;
}

- (id)_initWithKeychain:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AKMIDValidator;
  v6 = -[AKMIDValidator init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_midKeychain, a3);
  }

  return v7;
}

+ (id)sharedValidator
{
  if (qword_10020F4E8 != -1) {
    dispatch_once(&qword_10020F4E8, &stru_1001C9BF0);
  }
  return (id)qword_10020F4E0;
}

+ (id)_anisetteValidationQueue
{
  if (qword_10020F4F8 != -1) {
    dispatch_once(&qword_10020F4F8, &stru_1001C9C10);
  }
  return (id)qword_10020F4F0;
}

- (void)validateMID:(id)a3 anisetteFetchError:(id)a4
{
  id v6 = a4;
  if (a3) {
    a3 = (id)objc_claimAutoreleasedReturnValue([a3 machineID]);
  }
  v7 = (void *)os_transaction_create("com.apple.akd.anisette.calculate-mid-drift");
  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "_anisetteValidationQueue");
  v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100080304;
  v14[3] = &unk_1001C9BA8;
  v14[4] = self;
  id v15 = a3;
  id v16 = v6;
  id v17 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = a3;
  dispatch_async(v10, v14);
}

- (BOOL)resetKeychainCacheWithError:(id *)a3
{
  return -[AKMIDValidator _setLastKnownMID:keychainError:](self, "_setLastKnownMID:keychainError:", 0LL, a3);
}

- (void)_triggerTTRForMIDDriftedError:(id)a3
{
  uint64_t v3 = _AKLogSystem(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10013A308();
  }
}

- (BOOL)_isTTREligibleForMIDDriftedError:(id)a3
{
  return 0;
}

- (BOOL)_isTTRConfigMatchingMIDDriftedErrors:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag sharedBag](&OBJC_CLASS___AKURLBag, "sharedBag"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 ttrConfigurationAtKey:@"com.apple.authkit.midInvalidated"]);

  if (!v6)
  {
    uint64_t v8 = _AKLogSystem(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10013A334();
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKMIDValidator _defaultMIDInvalidatedTTRConfig](self, "_defaultMIDInvalidatedTTRConfig"));
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v10 = v4;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        if (-[AKMIDValidator _isMatchingMIDDriftedErrorDictionary:ttrConfigMIDDriftedErrors:]( self,  "_isMatchingMIDDriftedErrorDictionary:ttrConfigMIDDriftedErrors:",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)i),  0LL,  (void)v17))
        {
          BOOL v15 = 1;
          goto LABEL_15;
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  BOOL v15 = 0;
LABEL_15:

  return v15;
}

- (id)_defaultMIDInvalidatedTTRConfig
{
  return &off_1001D9388;
}

- (BOOL)_isMatchingMIDDriftedErrorDictionary:(id)a3 ttrConfigMIDDriftedErrors:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000806EC;
  v9[3] = &unk_1001C9C38;
  id v10 = a3;
  id v5 = v10;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "aaf_filter:", v9));
  BOOL v7 = [v6 count] != 0;

  return v7;
}

- (id)_normalizedMIDDriftedError:(id)a3 underlyingLevel:(unint64_t)a4 midDriftedErrorDict:(id)a5
{
  id v8 = a3;
  id v9 = v8;
  if (a4)
  {
    id v10 = v8;
    id v11 = a5;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"uec%lu", a4));
    id v9 = v10;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"ued%lu", a4));
    v42[0] = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v9 code]));
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stringValue]);
    v42[1] = v13;
    v43[0] = v15;
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
    v43[1] = v16;
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  2LL));
  }

  else
  {
    v44[0] = @"ec";
    id v18 = a5;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v9 code]));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringValue]);
    v44[1] = @"ed";
    v45[0] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
    v45[1] = v14;
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  2LL));
  }

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "aaf_dictionaryByAddingEntriesFromDictionary:", v17));
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v9 underlyingErrors]);
  id v21 = [v20 count];

  if (a4 <= 1 && v21)
  {
    v34 = v17;
    v35 = v9;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    v22 = (void *)objc_claimAutoreleasedReturnValue([v9 underlyingErrors]);
    id v23 = [v22 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v37;
      unint64_t v26 = a4 + 1;
      v27 = &__NSArray0__struct;
      do
      {
        v28 = 0LL;
        v29 = v27;
        do
        {
          if (*(void *)v37 != v25) {
            objc_enumerationMutation(v22);
          }
          v30 = (void *)objc_claimAutoreleasedReturnValue( -[AKMIDValidator _normalizedMIDDriftedError:underlyingLevel:midDriftedErrorDict:]( self,  "_normalizedMIDDriftedError:underlyingLevel:midDriftedErrorDict:",  *(void *)(*((void *)&v36 + 1) + 8LL * (void)v28),  v26,  v19));
          v27 = (void *)objc_claimAutoreleasedReturnValue([v29 arrayByAddingObjectsFromArray:v30]);

          v28 = (char *)v28 + 1;
          v29 = v27;
        }

        while (v24 != v28);
        id v24 = [v22 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }

      while (v24);
    }

    else
    {
      v27 = &__NSArray0__struct;
    }

    id v32 = v27;
    v31 = v32;
    __int128 v17 = v34;
    id v9 = v35;
  }

  else
  {
    v40 = v19;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v40, 1LL));
    id v32 = &__NSArray0__struct;
  }

  return v31;
}

- (id)_lastKnownMIDWithKeychainError:(id *)a3
{
  lastKnownMID = self->_lastKnownMID;
  if (!lastKnownMID)
  {
    id v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[AKMIDKeychain lastKnownMID:](self->_midKeychain, "lastKnownMID:", a3));
    id v6 = self->_lastKnownMID;
    self->_lastKnownMID = v5;

    lastKnownMID = self->_lastKnownMID;
  }

  return lastKnownMID;
}

- (BOOL)_setLastKnownMID:(id)a3 keychainError:(id *)a4
{
  id v6 = a3;
  BOOL v7 = -[AKMIDKeychain updateLastKnownMID:error:](self->_midKeychain, "updateLastKnownMID:error:", v6, a4);
  if (v7)
  {
    id v8 = (NSString *)[v6 copy];
    lastKnownMID = self->_lastKnownMID;
    self->_lastKnownMID = v8;
  }

  return v7;
}

- (int64_t)_calculateAndPersistDriftStatusForMID:(id)a3 anisetteFetchError:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v36 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKMIDValidator _lastKnownMIDWithKeychainError:](self, "_lastKnownMIDWithKeychainError:", &v36));
  id v11 = v36;
  id v12 = v11;
  if (!v11)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    id v18 = [v17 isAccountNotProvisioned];
    if ((_DWORD)v18)
    {
      if (v10)
      {
        id v35 = 0LL;
        unsigned __int8 v19 = -[AKMIDValidator _setLastKnownMID:keychainError:](self, "_setLastKnownMID:keychainError:", v8, &v35);
        id v20 = v35;
        uint64_t v21 = _AKLogSystem(v20);
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        id v23 = v22;
        if ((v19 & 1) != 0)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
            sub_10013A3F8();
          }

LABEL_21:
          int64_t v15 = 2LL;
LABEL_39:

          goto LABEL_40;
        }

        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_10013A464();
        }
LABEL_28:

        if (a5)
        {
          id v20 = v20;
          int64_t v15 = 0LL;
          *a5 = v20;
        }

        else
        {
          int64_t v15 = 0LL;
        }

        goto LABEL_39;
      }

      uint64_t v28 = _AKLogSystem(v18);
      id v20 = (id)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEBUG)) {
        sub_10013A3CC();
      }
    }

    else
    {
      if ([v8 isEqualToString:v10])
      {
        int64_t v15 = 1LL;
LABEL_40:

        goto LABEL_41;
      }

      id v34 = 0LL;
      unsigned __int8 v24 = -[AKMIDValidator _setLastKnownMID:keychainError:](self, "_setLastKnownMID:keychainError:", v8, &v34);
      id v25 = v34;
      id v20 = v25;
      if ((v24 & 1) == 0)
      {
        uint64_t v29 = _AKLogSystem(v25);
        id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_10013A588();
        }
        goto LABEL_28;
      }

      if (v8 && v10)
      {
        uint64_t v26 = _AKLogSystem(v25);
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          sub_10013A4C4();
        }

        goto LABEL_21;
      }

      uint64_t v30 = _AKLogSystem(v25);
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG);
      if (v8 || !v10)
      {
        if (v32) {
          sub_10013A55C();
        }
      }

      else if (v32)
      {
        sub_10013A530();
      }
    }

    int64_t v15 = 1LL;
    goto LABEL_39;
  }

  uint64_t v13 = _AKLogSystem(v11);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_10013A5E8();
  }

  int64_t v15 = 0LL;
  if (a5) {
    *a5 = v12;
  }
LABEL_41:

  return v15;
}

- (id)_createErrorWithMIDDriftUnderlyingError:(id)a3 anisetteFetchError:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a4 userInfo]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  else {
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError ak_generalErrorWithCode:errorDomain:underlyingError:]( &OBJC_CLASS___NSError,  "ak_generalErrorWithCode:errorDomain:underlyingError:",  -8023LL,  AKAnisetteErrorDomain,  v5));
  }
  id v9 = v8;

  return v9;
}

- (NSString)lastKnownMID
{
  return self->_lastKnownMID;
}

- (void)setLastKnownMID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end