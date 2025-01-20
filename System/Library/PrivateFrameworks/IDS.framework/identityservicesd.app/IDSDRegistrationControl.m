@interface IDSDRegistrationControl
+ (id)sharedInstance;
- (BOOL)_setKeychainData:(id)a3 withServiceName:(id)a4 withAccountKey:(id)a5 withIDSRegistrationAccesssGroup:(id)a6 error:(int)a7;
- (BOOL)updateRegistrationType:(int64_t)a3 toState:(int64_t)a4 error:(id *)a5;
- (int64_t)registrationStateForRegistrationType:(int64_t)a3 error:(id *)a4;
@end

@implementation IDSDRegistrationControl

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FC484;
  block[3] = &unk_1008F6558;
  block[4] = a1;
  if (qword_1009BEA08 != -1) {
    dispatch_once(&qword_1009BEA08, block);
  }
  return (id)qword_1009BEA00;
}

- (BOOL)updateRegistrationType:(int64_t)a3 toState:(int64_t)a4 error:(id *)a5
{
  v13 = self;
  id v47 = 0LL;
  int64_t v8 = -[IDSDRegistrationControl registrationStateForRegistrationType:error:]( self,  "registrationStateForRegistrationType:error:",  a3,  &v47);
  id v9 = v47;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%ld",  IDSRegistrationControlKeychainAccountName,  a3));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  v12 = (IDSDRegistrationControl *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v11,  1LL,  0LL));

  LODWORD(v13) = -[IDSDRegistrationControl _setKeychainData:withServiceName:withAccountKey:withIDSRegistrationAccesssGroup:error:]( v13,  "_setKeychainData:withServiceName:withAccountKey:withIDSRegistrationAccesssGroup:error:",  v12,  IDSRegistrationControlKeychainServiceName,  v10,  IDSRegistrationControlKeychainAccessGroup,  0LL);
  if (!(_DWORD)v13)
  {
    if (!a5) {
      goto LABEL_29;
    }
    v22 = objc_alloc(&OBJC_CLASS___NSError);
    v23 =  -[NSError initWithDomain:code:userInfo:]( v22,  "initWithDomain:code:userInfo:",  IDSRegistrationControlErrorDomain,  1LL,  0LL);
    goto LABEL_28;
  }

  if (a4 == 2 && v8 == 1)
  {
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountsWithType:0]);

    id v16 = [v15 countByEnumeratingWithState:&v43 objects:v55 count:16];
    if (v16)
    {
      id v17 = v16;
      v38 = a5;
      char v18 = (char)v13;
      v13 = v12;
      v19 = v10;
      uint64_t v20 = *(void *)v44;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v44 != v20) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(*((void *)&v43 + 1) + 8 * (void)i) reregister];
        }

        id v17 = [v15 countByEnumeratingWithState:&v43 objects:v55 count:16];
      }

      while (v17);
      v10 = v19;
      v12 = v13;
      LOBYTE(v13) = v18;
LABEL_24:
      a5 = v38;
    }
  }

  else
  {
    if (a4 != 1 || v8 == 1) {
      goto LABEL_26;
    }
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v24 accountsWithType:0]);

    id v25 = [v15 countByEnumeratingWithState:&v39 objects:v54 count:16];
    if (v25)
    {
      id v26 = v25;
      id v37 = v9;
      v38 = a5;
      char v34 = (char)v13;
      v35 = v12;
      v36 = v10;
      uint64_t v27 = *(void *)v40;
      do
      {
        for (j = 0LL; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v40 != v27) {
            objc_enumerationMutation(v15);
          }
          v29 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)j);
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
          v31 = (void *)objc_claimAutoreleasedReturnValue([v29 uniqueID]);
          [v30 disableAccountWithUniqueID:v31];

          [v29 setIsUserDisabled:1];
        }

        id v26 = [v15 countByEnumeratingWithState:&v39 objects:v54 count:16];
      }

      while (v26);
      v10 = v36;
      id v9 = v37;
      v12 = v35;
      LOBYTE(v13) = v34;
      goto LABEL_24;
    }
  }

LABEL_26:
  if (!a5) {
    goto LABEL_29;
  }
  v23 = 0LL;
LABEL_28:
  *a5 = v23;
LABEL_29:
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    int64_t v49 = a3;
    __int16 v50 = 2048;
    int64_t v51 = a4;
    __int16 v52 = 1024;
    int v53 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Updating registration control state { registrationType: %lld, toState: %lld, err: %d }",  buf,  0x1Cu);
  }

  return (char)v13;
}

- (int64_t)registrationStateForRegistrationType:(int64_t)a3 error:(id *)a4
{
  int v21 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%ld",  IDSRegistrationControlKeychainAccountName,  a3));
  id v20 = 0LL;
  int v7 = IMGetKeychainData( &v20,  IDSRegistrationControlKeychainServiceName,  v6,  IDSRegistrationControlKeychainAccessGroup,  &v21);
  id v9 = v20;
  if (v7)
  {
    id v10 = +[NSKeyedUnarchiver ids_secureUnarchiveObjectOfClass:withData:]( &OBJC_CLASS___NSKeyedUnarchiver,  "ids_secureUnarchiveObjectOfClass:withData:",  objc_opt_class(&OBJC_CLASS___NSNumber, v8),  v9);
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v10);
    v12 = 0LL;
    goto LABEL_14;
  }

  if (v21 != -25300)
  {
    if (v21 == -34019)
    {
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = v21;
        v14 = "Registration control state can't be loaded because the keychain is upgrading { err: %d }";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 8u);
      }
    }

    else
    {
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = v21;
        v14 = "Registration control state can't be loaded because of a keychain error { err: %d }";
        goto LABEL_12;
      }
    }

    id v16 = objc_alloc(&OBJC_CLASS___NSError);
    v12 = -[NSError initWithDomain:code:userInfo:]( v16,  "initWithDomain:code:userInfo:",  IDSRegistrationControlErrorDomain,  1LL,  0LL);
    v11 = &off_100946C90;
    goto LABEL_14;
  }

  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Registration control state item was not present in the keychain",  buf,  2u);
  }

  v12 = 0LL;
  v11 = &off_100946CA8;
LABEL_14:
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    int64_t v23 = a3;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2112;
    uint64_t v27 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Loaded registration control state { registrationType: %lld, state: %@, error: %@ }",  buf,  0x20u);
  }

  if (a4) {
    *a4 = v12;
  }
  id v18 = [v11 integerValue];

  return (int64_t)v18;
}

- (BOOL)_setKeychainData:(id)a3 withServiceName:(id)a4 withAccountKey:(id)a5 withIDSRegistrationAccesssGroup:(id)a6 error:(int)a7
{
  int v8 = a7;
  return IMSetKeychainData(a3, IDSRegistrationControlKeychainServiceName, a5, a6, 0LL, &v8);
}

@end