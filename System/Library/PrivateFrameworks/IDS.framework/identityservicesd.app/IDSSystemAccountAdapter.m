@interface IDSSystemAccountAdapter
- (IDSSystemAccountAdapter)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (id)_ACAccountWithTypeIdentifier:(id)a3 matchingCriteria:(id)a4 error:(id *)a5;
- (id)_firstAccountInStore:(id)a3 withType:(id)a4 matchingCriteria:(id)a5;
- (id)_systemAccountRepresentationOfACAccount:(id)a3 DSIDKey:(id)a4;
- (id)_systemAccountWithIdentifier:(id)a3 DSIDKey:(id)a4 criteria:(id)a5 error:(id *)a6;
- (id)iCloudSystemAccountWithError:(id *)a3;
- (id)iTunesSystemAccountWithError:(id *)a3;
- (void)_ACAccountWithTypeIdentifier:(id)a3 matchingCriteria:(id)a4 completion:(id)a5;
- (void)_systemAccountWithIdentifier:(id)a3 DSIDKey:(id)a4 criteria:(id)a5 completion:(id)a6;
- (void)iCloudSystemAccountWithCompletion:(id)a3;
- (void)iTunesSystemAccountWithCompletion:(id)a3;
@end

@implementation IDSSystemAccountAdapter

- (IDSSystemAccountAdapter)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSSystemAccountAdapter;
  v6 = -[IDSSystemAccountAdapter init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (void)iCloudSystemAccountWithCompletion:(id)a3
{
  uint64_t v4 = qword_1009BE858;
  id v5 = a3;
  id v7 = v5;
  if (v4 == -1)
  {
    id v6 = v5;
  }

  else
  {
    dispatch_once(&qword_1009BE858, &stru_1008F7B40);
    id v6 = v7;
  }

  -[IDSSystemAccountAdapter _systemAccountWithIdentifier:DSIDKey:criteria:completion:]( self,  "_systemAccountWithIdentifier:DSIDKey:criteria:completion:",  qword_1009BE860,  @"personID",  &stru_1008F7A48,  v6);
}

- (void)iTunesSystemAccountWithCompletion:(id)a3
{
  uint64_t v4 = qword_1009BE868;
  id v5 = a3;
  id v7 = v5;
  if (v4 == -1)
  {
    id v6 = v5;
  }

  else
  {
    dispatch_once(&qword_1009BE868, &stru_1008F7B60);
    id v6 = v7;
  }

  -[IDSSystemAccountAdapter _systemAccountWithIdentifier:DSIDKey:criteria:completion:]( self,  "_systemAccountWithIdentifier:DSIDKey:criteria:completion:",  qword_1009BE870,  @"dsid",  &stru_1008F7A68,  v6);
}

- (id)iCloudSystemAccountWithError:(id *)a3
{
  if (qword_1009BE858 != -1) {
    dispatch_once(&qword_1009BE858, &stru_1008F7B40);
  }
  return -[IDSSystemAccountAdapter _systemAccountWithIdentifier:DSIDKey:criteria:error:]( self,  "_systemAccountWithIdentifier:DSIDKey:criteria:error:",  qword_1009BE860,  @"personID",  &stru_1008F7A88,  a3);
}

- (id)iTunesSystemAccountWithError:(id *)a3
{
  if (qword_1009BE868 != -1) {
    dispatch_once(&qword_1009BE868, &stru_1008F7B60);
  }
  return -[IDSSystemAccountAdapter _systemAccountWithIdentifier:DSIDKey:criteria:error:]( self,  "_systemAccountWithIdentifier:DSIDKey:criteria:error:",  qword_1009BE870,  @"dsid",  &stru_1008F7AA8,  a3);
}

- (void)_systemAccountWithIdentifier:(id)a3 DSIDKey:(id)a4 criteria:(id)a5 completion:(id)a6
{
  id v10 = a3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100049310;
  v14[3] = &unk_1008F7AD0;
  v14[4] = self;
  id v15 = a4;
  id v16 = v10;
  id v17 = a6;
  id v11 = v17;
  id v12 = v10;
  id v13 = v15;
  -[IDSSystemAccountAdapter _ACAccountWithTypeIdentifier:matchingCriteria:completion:]( self,  "_ACAccountWithTypeIdentifier:matchingCriteria:completion:",  v12,  a5,  v14);
}

- (void)_ACAccountWithTypeIdentifier:(id)a3 matchingCriteria:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000495A8;
  v15[3] = &unk_1008F7B20;
  v15[4] = self;
  id v16 = objc_alloc_init((Class)IMWeakLinkClass(@"ACAccountStore", @"Accounts"));
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v16;
  [v14 accountTypeWithIdentifier:v12 completion:v15];
}

- (id)_systemAccountWithIdentifier:(id)a3 DSIDKey:(id)a4 criteria:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_autoreleasePoolPush();
  id v20 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[IDSSystemAccountAdapter _ACAccountWithTypeIdentifier:matchingCriteria:error:]( self,  "_ACAccountWithTypeIdentifier:matchingCriteria:error:",  v10,  v12,  &v20));
  id v15 = v20;
  if (v15)
  {

    objc_autoreleasePoolPop(v13);
    if (a6)
    {
      id v16 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v21 = NSUnderlyingErrorKey;
      id v22 = v15;
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
      *a6 =  -[NSError initWithDomain:code:userInfo:]( v16,  "initWithDomain:code:userInfo:",  @"IDSSystemAccountAdapterErrorDomain",  -1000LL,  v17);

      a6 = 0LL;
    }
  }

  else
  {
    a6 = (id *)objc_claimAutoreleasedReturnValue( -[IDSSystemAccountAdapter _systemAccountRepresentationOfACAccount:DSIDKey:]( self,  "_systemAccountRepresentationOfACAccount:DSIDKey:",  v14,  v11));
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v10;
      __int16 v25 = 2112;
      v26 = a6;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Done checking for system signed in account { identifier: %@, systemAccount: %@ }",  buf,  0x16u);
    }

    objc_autoreleasePoolPop(v13);
  }

  return a6;
}

- (id)_ACAccountWithTypeIdentifier:(id)a3 matchingCriteria:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_autoreleasePoolPush();
  id v11 = objc_alloc_init((Class)IMWeakLinkClass(@"ACAccountStore", @"Accounts"));
  id v18 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accountTypeWithAccountTypeIdentifier:v8 error:&v18]);
  id v13 = v18;
  id v14 = v13;
  if (!v12 || v13)
  {
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Did not find account type { identifier: %@, accountsError: %@ }",  buf,  0x16u);
    }

    id v15 = 0LL;
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[IDSSystemAccountAdapter _firstAccountInStore:withType:matchingCriteria:]( self,  "_firstAccountInStore:withType:matchingCriteria:",  v11,  v12,  v9));
  }

  objc_autoreleasePoolPop(v10);
  if (a5 && v14) {
    *a5 = v14;
  }

  return v15;
}

- (id)_firstAccountInStore:(id)a3 withType:(id)a4 matchingCriteria:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (unsigned int (**)(id, void *))a5;
  id v10 = objc_autoreleasePoolPush();
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue([v7 accountsWithAccountType:v8]);
  id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        if (v9)
        {
          id v15 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          if (v9[2](v9, v15))
          {
            id v12 = v15;
            goto LABEL_12;
          }
        }
      }

      id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

- (id)_systemAccountRepresentationOfACAccount:(id)a3 DSIDKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_autoreleasePoolPush();
  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 username]);
    if (v6)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 accountProperties]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v6]);

      if (v10) {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"D:%@", v10));
      }
      else {
        id v11 = 0LL;
      }
    }

    else
    {
      id v11 = 0LL;
    }

    id v12 = -[IDSSystemAccount initWithUsername:DSID:]( objc_alloc(&OBJC_CLASS___IDSSystemAccount),  "initWithUsername:DSID:",  v8,  v11);
  }

  else
  {
    id v12 = 0LL;
  }

  objc_autoreleasePoolPop(v7);

  return v12;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end