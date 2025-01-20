@interface CNContactsDataclassOwnerContactsImplementation
+ (id)os_log;
+ (void)removeDelegate:(id)a3;
- (BOOL)areContainersEmptyForParentAccount:(id)a3;
- (BOOL)createAndExecuteSaveRequest:(id)a3 errorBlock:(id)a4;
- (BOOL)createContactsAccountForParentAccount:(id)a3 withChildAccounts:(id)a4;
- (BOOL)emptyLocalContainer;
- (BOOL)isContainerEmpty:(id)a3;
- (BOOL)isLocalContainerEmpty;
- (BOOL)mergeContactsFromLocalContainerToContainer:(id)a3;
- (BOOL)mergeContactsIntoLocalContainerFromContainersOfContactsAccount:(id)a3;
- (BOOL)moveContacts:(id)a3 fromContainer:(id)a4 toContainer:(id)a5;
- (BOOL)removeContactsAccount:(id)a3;
- (BOOL)removeContactsAccountForParentAccount:(id)a3 delegates:(id)a4 withChildAccounts:(id)a5;
- (CNACAccountProvider)accountProvider;
- (CNContactStore)contactStore;
- (CNContactsDataclassOwnerContactsImplementation)init;
- (CNContactsDataclassOwnerContactsImplementation)initWithAccountProvider:(id)a3;
- (CNContactsDataclassOwnerContactsImplementation)initWithContactStore:(id)a3 accountProvider:(id)a4;
- (id)accountWithExternalIdentifier:(id)a3;
- (id)contactsAccountForParentAccount:(id)a3 withChildAccounts:(id)a4;
- (id)contactsInContainer:(id)a3;
- (id)containersInAccount:(id)a3;
- (id)containersInAccountWithExternalIdentifier:(id)a3;
- (id)defaultContainerForParentAccount:(id)a3 withChildAccounts:(id)a4 createIfNecessary:(BOOL)a5;
- (id)defaultContainerInContactsAccount:(id)a3;
- (id)localContainer;
- (id)syncingAccountIdentifierForParentAccount:(id)a3 withChildAccounts:(id)a4;
- (void)setContainersEnabled:(BOOL)a3 forParentAccount:(id)a4 withChildAccounts:(id)a5;
- (void)setLocalContainerEnabled:(BOOL)a3;
@end

@implementation CNContactsDataclassOwnerContactsImplementation

+ (id)os_log
{
  if (qword_15CB0 != -1) {
    dispatch_once(&qword_15CB0, &stru_10408);
  }
  return (id)qword_15CB8;
}

- (CNContactsDataclassOwnerContactsImplementation)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  v4 = +[CNACAccountProvider providerWithStore:](&OBJC_CLASS___CNACAccountProvider, "providerWithStore:", v3);

  v5 = -[CNContactsDataclassOwnerContactsImplementation initWithAccountProvider:](self, "initWithAccountProvider:", v4);
  return v5;
}

- (CNContactsDataclassOwnerContactsImplementation)initWithAccountProvider:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___CNContactStore);
  v6 = -[CNContactsDataclassOwnerContactsImplementation initWithContactStore:accountProvider:]( self,  "initWithContactStore:accountProvider:",  v5,  v4);

  return v6;
}

- (CNContactsDataclassOwnerContactsImplementation)initWithContactStore:(id)a3 accountProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CNContactsDataclassOwnerContactsImplementation;
  v9 = -[CNContactsDataclassOwnerContactsImplementation init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a3);
    objc_storeStrong((id *)&v10->_accountProvider, a4);
    v11 = v10;
  }

  return v10;
}

- (void)setContainersEnabled:(BOOL)a3 forParentAccount:(id)a4 withChildAccounts:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_msgSend((id)objc_opt_class(self), "os_log");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[CNContactsDataclassOwnerContactsImplementation contactsAccountForParentAccount:withChildAccounts:]( self,  "contactsAccountForParentAccount:withChildAccounts:",  v8,  v9));
  if (v12)
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue( -[CNContactsDataclassOwnerContactsImplementation containersInAccount:]( self,  "containersInAccount:",  v12));
    if (((*(uint64_t (**)(void, id))(CNIsArrayEmpty + 16LL))(CNIsArrayEmpty, v13) & 1) == 0)
    {
      uint64_t v14 = CNLogicalNot(&stru_10650);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_cn_filter:", v15));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_cn_map:", &stru_10690));

      objc_msgSend(v17, "_cn_each:", &stru_10710);
      v18 = v11;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v20 = @"NO";
        if (v6) {
          v20 = @"YES";
        }
        v24 = v20;
        id v23 = [v13 count];
        v21 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
        v22 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForKey:@"identifier"]);
        *(_DWORD *)buf = 138544130;
        v30 = v24;
        __int16 v31 = 2048;
        id v32 = v23;
        __int16 v33 = 2114;
        v34 = v21;
        __int16 v35 = 2114;
        v36 = v22;
        _os_log_debug_impl( &dword_0,  v18,  OS_LOG_TYPE_DEBUG,  "setting enabled to %{public}@ for %ld containers associated with account (external identifier = %{public}@ chi ld external identifiers = %{public}@)",  buf,  0x2Au);
      }

      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_6E5C;
      v27[3] = &unk_10458;
      id v28 = v17;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_6EE4;
      v25[3] = &unk_10480;
      v26 = v18;
      id v19 = v17;
      -[CNContactsDataclassOwnerContactsImplementation createAndExecuteSaveRequest:errorBlock:]( self,  "createAndExecuteSaveRequest:errorBlock:",  v27,  v25);
    }
  }

  else
  {
    id v13 = v11;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      sub_A0E0();
    }
  }
}

- (void)setLocalContainerEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactsDataclassOwnerContactsImplementation localContainer](self, "localContainer"));
  BOOL v6 = v5;
  if (v5)
  {
    id v7 = [v5 mutableCopy];
    [v7 setEnabled:v3];
    v9[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_6FF8;
    v10[3] = &unk_10458;
    id v11 = v7;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_7004;
    v9[3] = &unk_10480;
    id v8 = v7;
    -[CNContactsDataclassOwnerContactsImplementation createAndExecuteSaveRequest:errorBlock:]( self,  "createAndExecuteSaveRequest:errorBlock:",  v10,  v9);
  }
}

- (BOOL)isLocalContainerEmpty
{
  v2 = self;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactsDataclassOwnerContactsImplementation localContainer](self, "localContainer"));
  LOBYTE(v2) = -[CNContactsDataclassOwnerContactsImplementation isContainerEmpty:](v2, "isContainerEmpty:", v3);

  return (char)v2;
}

- (BOOL)areContainersEmptyForParentAccount:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  objc_msgSend(v5, "_cn_addNonNilObject:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactsDataclassOwnerContactsImplementation accountProvider](self, "accountProvider"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 childAccountsForAccount:v4]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForKey:@"identifier"]);
  [v5 addObjectsFromArray:v9];

  if (((*(uint64_t (**)(void, void *))(CNIsArrayEmpty + 16LL))(CNIsArrayEmpty, v5) & 1) != 0)
  {
    char v10 = 1;
  }

  else
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_7284;
    v19[3] = &unk_104A8;
    v19[4] = self;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_cn_map:", v19));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_cn_flatten"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_cn_filter:", CNIsNotNull));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_7290;
    v18[3] = &unk_104D0;
    v18[4] = self;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_cn_firstObjectPassingTest:", v18));

    id v15 = objc_msgSend((id)objc_opt_class(self), "os_log");
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_A250();
    }

    char v10 = v14 == 0LL;
  }

  return v10;
}

- (BOOL)emptyLocalContainer
{
  id v3 = objc_msgSend((id)objc_opt_class(self), "os_log");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactsDataclassOwnerContactsImplementation localContainer](self, "localContainer"));
  if (v5)
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( -[CNContactsDataclassOwnerContactsImplementation contactsInContainer:]( self,  "contactsInContainer:",  v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_cn_map:", &stru_106D0));

    if (v7)
    {
      uint64_t v8 = CNIsArrayEmpty;
      if ((*(unsigned int (**)(void, void *))(CNIsArrayEmpty + 16LL))(CNIsArrayEmpty, v7)
        && os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        sub_A3B8(v4);
      }
    }

    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_A378(v4);
      }
      uint64_t v8 = CNIsArrayEmpty;
    }

    if (((*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v7) & 1) != 0)
    {
      LOBYTE(v9) = 1;
    }

    else
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_74A0;
      v16[3] = &unk_10458;
      id v17 = v7;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_7528;
      v13[3] = &unk_10520;
      char v10 = v4;
      uint64_t v14 = v10;
      id v15 = v17;
      BOOL v9 = -[CNContactsDataclassOwnerContactsImplementation createAndExecuteSaveRequest:errorBlock:]( self,  "createAndExecuteSaveRequest:errorBlock:",  v16,  v13);
      if (v9)
      {
        id v11 = v10;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          sub_A300();
        }
      }
    }
  }

  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (id)defaultContainerForParentAccount:(id)a3 withChildAccounts:(id)a4 createIfNecessary:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_msgSend((id)objc_opt_class(self), "os_log");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[CNContactsDataclassOwnerContactsImplementation contactsAccountForParentAccount:withChildAccounts:]( self,  "contactsAccountForParentAccount:withChildAccounts:",  v9,  v8));

  if (!v9)
  {
    v20 = v11;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_A47C(v8);
    }
    id v13 = 0LL;
    goto LABEL_11;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[CNContactsDataclassOwnerContactsImplementation defaultContainerInContactsAccount:]( self,  "defaultContainerInContactsAccount:",  v12));
  if (!v13 && v5)
  {
    uint64_t v14 = objc_alloc_init(&OBJC_CLASS___CNMutableContainer);
    -[CNMutableContainer setEnabled:](v14, "setEnabled:", 1LL);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_77C0;
    v30[3] = &unk_10548;
    id v15 = v14;
    __int16 v31 = v15;
    id v16 = v12;
    id v32 = v16;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_781C;
    v28[3] = &unk_10480;
    id v17 = v11;
    id v29 = v17;
    unsigned int v18 = -[CNContactsDataclassOwnerContactsImplementation createAndExecuteSaveRequest:errorBlock:]( self,  "createAndExecuteSaveRequest:errorBlock:",  v30,  v28);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_7868;
    v25[3] = &unk_10548;
    v26 = v15;
    id v19 = v16;
    id v27 = v19;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_78C4;
    v23[3] = &unk_10480;
    id v24 = v17;
    v20 = v15;
    unsigned int v21 = -[CNContactsDataclassOwnerContactsImplementation createAndExecuteSaveRequest:errorBlock:]( self,  "createAndExecuteSaveRequest:errorBlock:",  v25,  v23);
    id v13 = 0LL;
    if (v18 && v21) {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( -[CNContactsDataclassOwnerContactsImplementation defaultContainerInContactsAccount:]( self,  "defaultContainerInContactsAccount:",  v19));
    }

LABEL_11:
  }

  return v13;
}

- (id)contactsAccountForParentAccount:(id)a3 withChildAccounts:(id)a4
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[CNContactsDataclassOwnerContactsImplementation syncingAccountIdentifierForParentAccount:withChildAccounts:]( self,  "syncingAccountIdentifierForParentAccount:withChildAccounts:",  a3,  a4));
  else {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( -[CNContactsDataclassOwnerContactsImplementation accountWithExternalIdentifier:]( self,  "accountWithExternalIdentifier:",  v5));
  }

  return v6;
}

- (BOOL)createContactsAccountForParentAccount:(id)a3 withChildAccounts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend((id)objc_opt_class(self), "os_log");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CNContactsDataclassOwnerContactsImplementation syncingAccountIdentifierForParentAccount:withChildAccounts:]( self,  "syncingAccountIdentifierForParentAccount:withChildAccounts:",  v6,  v7));
  if (((*(uint64_t (**)(void, void *))(CNIsStringEmpty + 16LL))(CNIsStringEmpty, v10) & 1) != 0)
  {
    LOBYTE(v11) = 0;
  }

  else
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_7C90;
    v30[3] = &unk_10458;
    id v31 = [[CNAccount alloc] initWithExternalIdentifier:v10];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_7C9C;
    v27[3] = &unk_10520;
    id v12 = v9;
    id v28 = v12;
    id v13 = v10;
    id v29 = v13;
    id v14 = v31;
    BOOL v11 = -[CNContactsDataclassOwnerContactsImplementation createAndExecuteSaveRequest:errorBlock:]( self,  "createAndExecuteSaveRequest:errorBlock:",  v30,  v27);
    if (v11)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( -[CNContactsDataclassOwnerContactsImplementation accountWithExternalIdentifier:]( self,  "accountWithExternalIdentifier:",  v13));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForKey:@"identifier"]);
      id v17 = (os_log_s *)v12;
      unsigned int v18 = v17;
      if (v15)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
          unsigned int v24 = [v15 iOSLegacyIdentifier];
          v25 = (void *)objc_claimAutoreleasedReturnValue([v15 externalIdentifierString]);
          uint64_t v19 = objc_claimAutoreleasedReturnValue([v6 identifier]);
          *(_DWORD *)buf = 138544386;
          id v33 = v26;
          __int16 v34 = 1024;
          *(_DWORD *)__int16 v35 = v24;
          *(_WORD *)&v35[4] = 2114;
          *(void *)&v35[6] = v25;
          *(_WORD *)&v35[14] = 2114;
          *(void *)&v35[16] = v19;
          v20 = (void *)v19;
          __int16 v36 = 2114;
          v37 = v16;
          _os_log_debug_impl( &dword_0,  v18,  OS_LOG_TYPE_DEBUG,  "Created a local CN account (identifier = %{public}@ legacy id = %d, externalIdentifier = %{public}@) for ext ernal account with identifier %{public}@ and child identifiers %{public}@",  buf,  0x30u);
        }
      }

      else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = objc_claimAutoreleasedReturnValue([v6 identifier]);
        *(_DWORD *)buf = 138543874;
        id v33 = v13;
        __int16 v34 = 2114;
        *(void *)__int16 v35 = v22;
        id v23 = (void *)v22;
        *(_WORD *)&v35[8] = 2114;
        *(void *)&v35[10] = v16;
        _os_log_error_impl( &dword_0,  v18,  OS_LOG_TYPE_ERROR,  "Failed to create a CN account (externalIdentifier = %{public}@) for external account with for external account with identifier %{public}@ and child identifiers %{public}@",  buf,  0x20u);
      }
    }
  }

  return v11;
}

- (BOOL)removeContactsAccountForParentAccount:(id)a3 delegates:(id)a4 withChildAccounts:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_msgSend((id)objc_opt_class(self), "os_log");
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[CNContactsDataclassOwnerContactsImplementation contactsAccountForParentAccount:withChildAccounts:]( self,  "contactsAccountForParentAccount:withChildAccounts:",  v8,  v10));
  if (v13)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_7E20;
    v17[3] = &unk_10570;
    v17[4] = self;
    objc_msgSend(v9, "_cn_each:", v17);
    BOOL v14 = -[CNContactsDataclassOwnerContactsImplementation removeContactsAccount:](self, "removeContactsAccount:", v13);
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[CNContactsDataclassOwnerContactsImplementation syncingAccountIdentifierForParentAccount:withChildAccounts:]( self,  "syncingAccountIdentifierForParentAccount:withChildAccounts:",  v8,  v10));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_A688();
    }

    BOOL v14 = 0;
  }

  return v14;
}

+ (void)removeDelegate:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 first]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 second]);

  id v7 = [[CNAccount alloc] initWithExternalIdentifier:v5];
  id v8 = [[CNCoreDelegateInfo alloc] initWithDSID:0 altDSID:v6 appleID:0 principalPath:0 nameComponents:0 isMe:0];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactStore storeWithDelegateInfo:](&OBJC_CLASS___CNContactStore, "storeWithDelegateInfo:", v8));
  id v10 = objc_alloc_init(&OBJC_CLASS___CNSaveRequest);
  -[CNSaveRequest removeAccount:](v10, "removeAccount:", v7);
  id v15 = 0LL;
  unsigned __int8 v11 = [v9 executeSaveRequest:v10 error:&v15];
  id v12 = v15;
  if ((v11 & 1) == 0)
  {
    id v13 = objc_msgSend((id)objc_opt_class(a1), "os_log");
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_A6E8();
    }
  }
}

- (BOOL)removeContactsAccount:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(self), "os_log");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_A750(v4, v6);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_80C4;
  v14[3] = &unk_10458;
  id v15 = v4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_80D0;
  v11[3] = &unk_10520;
  id v12 = v6;
  id v13 = v15;
  id v7 = v15;
  id v8 = v6;
  BOOL v9 = -[CNContactsDataclassOwnerContactsImplementation createAndExecuteSaveRequest:errorBlock:]( self,  "createAndExecuteSaveRequest:errorBlock:",  v14,  v11);

  return v9;
}

- (BOOL)mergeContactsFromLocalContainerToContainer:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(self), "os_log");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactsDataclassOwnerContactsImplementation localContainer](self, "localContainer"));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CNContactsDataclassOwnerContactsImplementation contactsInContainer:]( self,  "contactsInContainer:",  v7));
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_cn_map:", &stru_106D0));

    if (![v9 count])
    {
      id v10 = v6;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_A898(v4);
      }
    }

    if (((*(uint64_t (**)(void, void *))(CNIsArrayEmpty + 16LL))(CNIsArrayEmpty, v9) & 1) != 0)
    {
      unsigned __int8 v11 = 1;
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactsDataclassOwnerContactsImplementation contactStore](self, "contactStore"));
      id v23 = 0LL;
      unsigned __int8 v11 = [v12 moveContacts:v9 fromContainer:v7 toContainer:v4 error:&v23];
      id v13 = v23;

      BOOL v14 = v6;
      id v15 = v14;
      if ((v11 & 1) != 0)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          id v22 = [v9 count];
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
          unsigned int v17 = [v7 iOSLegacyIdentifier];
          unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
          unsigned int v19 = [v4 iOSLegacyIdentifier];
          *(_DWORD *)buf = 134219522;
          id v25 = v22;
          __int16 v26 = 2114;
          id v27 = v16;
          __int16 v28 = 1024;
          *(_DWORD *)id v29 = v17;
          *(_WORD *)&v29[4] = 2112;
          *(void *)&v29[6] = v4;
          __int16 v30 = 2114;
          id v31 = v18;
          __int16 v32 = 1024;
          unsigned int v33 = v19;
          __int16 v34 = 2112;
          id v35 = v13;
          _os_log_debug_impl( &dword_0,  v15,  OS_LOG_TYPE_DEBUG,  "Migrated %ld contacts to from local container (identifier = %{public}@ legacy id: %d) to container %@ (ident ifier = %{public}@ legacy id %d): %@",  buf,  0x40u);
        }
      }

      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v21 = [v9 count];
        *(_DWORD *)buf = 134218498;
        id v25 = v21;
        __int16 v26 = 2112;
        id v27 = v4;
        __int16 v28 = 2112;
        *(void *)id v29 = v13;
        _os_log_error_impl( &dword_0,  v15,  OS_LOG_TYPE_ERROR,  "did not migrate %ld contacts to from local container to container %@: %@",  buf,  0x20u);
      }
    }
  }

  else
  {
    unsigned __int8 v11 = 1;
  }

  return v11;
}

- (BOOL)mergeContactsIntoLocalContainerFromContainersOfContactsAccount:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactsDataclassOwnerContactsImplementation localContainer](self, "localContainer"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CNContactsDataclassOwnerContactsImplementation containersInAccount:]( self,  "containersInAccount:",  v4));
    if (v6)
    {
      uint64_t v19 = 0LL;
      v20 = &v19;
      uint64_t v21 = 0x2020000000LL;
      char v22 = 1;
      id v7 = objc_msgSend((id)objc_opt_class(self), "os_log");
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 externalIdentifierString]);
        unsigned int v14 = [v4 iOSLegacyIdentifier];
        *(_DWORD *)buf = 138543874;
        unsigned int v24 = v12;
        __int16 v25 = 2114;
        __int16 v26 = v13;
        __int16 v27 = 1024;
        unsigned int v28 = v14;
        _os_log_debug_impl( &dword_0,  v8,  OS_LOG_TYPE_DEBUG,  "Merging contacts into local container from account with CN identifier: %{public}@ external identifier: %{publi c}@ legacy id = %d",  buf,  0x1Cu);
      }

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_8638;
      v18[3] = &unk_10598;
      v18[4] = self;
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_cn_map:", v18));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_86BC;
      v15[3] = &unk_105C0;
      v15[4] = self;
      id v16 = v5;
      unsigned int v17 = &v19;
      objc_msgSend(v9, "_cn_each:", v15);

      BOOL v10 = *((_BYTE *)v20 + 24) != 0;
      _Block_object_dispose(&v19, 8);
    }

    else
    {
      BOOL v10 = 0;
    }
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)moveContacts:(id)a3 fromContainer:(id)a4 toContainer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_msgSend((id)objc_opt_class(self), "os_log");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactsDataclassOwnerContactsImplementation contactStore](self, "contactStore"));
  id v23 = 0LL;
  unsigned __int8 v14 = [v13 moveContacts:v8 fromContainer:v9 toContainer:v10 error:&v23];
  id v15 = v23;

  if ((v14 & 1) != 0)
  {
    id v16 = v12;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v22 = [v8 count];
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
      unsigned int v19 = [v10 iOSLegacyIdentifier];
      v20 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
      unsigned int v21 = [v9 iOSLegacyIdentifier];
      *(_DWORD *)buf = 134219010;
      id v25 = v22;
      __int16 v26 = 2114;
      __int16 v27 = v18;
      __int16 v28 = 1024;
      unsigned int v29 = v19;
      __int16 v30 = 2114;
      id v31 = v20;
      __int16 v32 = 1024;
      unsigned int v33 = v21;
      _os_log_debug_impl( &dword_0,  v16,  OS_LOG_TYPE_DEBUG,  "Moved %ld contacts into container (CN identifier: %{public}@ legacy id = %d) from container (CN identifier: %{pu blic}@ legacy id = %d)",  buf,  0x2Cu);
    }
  }

  else if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
  {
    sub_A91C();
  }

  return v14;
}

- (id)syncingAccountIdentifierForParentAccount:(id)a3 withChildAccounts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactsDataclassOwnerContactsImplementation accountProvider](self, "accountProvider"));
  unsigned int v9 = [v8 isAccountSyncable:v6];

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  }

  else
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v11 = v7;
    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v23;
      while (2)
      {
        id v15 = 0LL;
        do
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v15);
          unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( -[CNContactsDataclassOwnerContactsImplementation accountProvider]( self,  "accountProvider",  (void)v22));
          unsigned __int8 v18 = [v17 isAccountSyncable:v16];

          if ((v18 & 1) != 0)
          {
            id v10 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);

            goto LABEL_15;
          }

          id v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    id v19 = objc_msgSend((id)objc_opt_class(self), "os_log");
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_A984(v6, v20);
    }

    id v10 = 0LL;
  }

- (BOOL)isContainerEmpty:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___CNContactFetchRequest);
  id v19 = CNContactIdentifierKey;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  id v7 = -[CNContactFetchRequest initWithKeysToFetch:](v5, "initWithKeysToFetch:", v6);

  -[CNContactFetchRequest setUnifyResults:](v7, "setUnifyResults:", 0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[CNContact predicateForContactsInContainerWithIdentifier:]( &OBJC_CLASS___CNContact,  "predicateForContactsInContainerWithIdentifier:",  v8));
  -[CNContactFetchRequest setPredicate:](v7, "setPredicate:", v9);

  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactsDataclassOwnerContactsImplementation contactStore](self, "contactStore"));
  void v13[4] = &v15;
  id v14 = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_8CD0;
  v13[3] = &unk_105E8;
  [v10 enumerateContactsWithFetchRequest:v7 error:&v14 usingBlock:v13];
  id v11 = v14;

  LODWORD(v10) = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (_DWORD)v10 == 0;
}

- (id)localContainer
{
  id v3 = objc_msgSend((id)objc_opt_class(self), "os_log");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactsDataclassOwnerContactsImplementation contactStore](self, "contactStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CNContainer predicateForLocalContainerIncludingDisabled:]( &OBJC_CLASS___CNContainer,  "predicateForLocalContainerIncludingDisabled:",  1LL));
  id v13 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 containersMatchingPredicate:v6 error:&v13]);
  id v8 = v13;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

  if (v9)
  {
    id v10 = v4;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_AA74(v9);
    }

    id v11 = v9;
  }

  else if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
  {
    sub_AA14();
  }

  return v9;
}

- (id)defaultContainerInContactsAccount:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(self), "os_log");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CNContainer predicateForDefaultContainerForAccountWithIdentifier:]( &OBJC_CLASS___CNContainer,  "predicateForDefaultContainerForAccountWithIdentifier:",  v7));

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactsDataclassOwnerContactsImplementation contactStore](self, "contactStore"));
  id v17 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 containersMatchingPredicate:v8 error:&v17]);
  id v11 = v17;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);

  id v13 = v6;
  id v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_AB9C(v12, v4, v14);
    }

    id v15 = v12;
  }

  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_AAF8(v4);
    }
  }

  return v12;
}

- (id)containersInAccountWithExternalIdentifier:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CNContactsDataclassOwnerContactsImplementation accountWithExternalIdentifier:]( self,  "accountWithExternalIdentifier:",  a3));
  if (v4) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CNContactsDataclassOwnerContactsImplementation containersInAccount:]( self,  "containersInAccount:",  v4));
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)accountWithExternalIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(self), "os_log");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CNAccount predicateForAccountWithExternalIdentifier:]( &OBJC_CLASS___CNAccount,  "predicateForAccountWithExternalIdentifier:",  v4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactsDataclassOwnerContactsImplementation contactStore](self, "contactStore"));
  id v15 = 0LL;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accountsMatchingPredicate:v7 error:&v15]);
  id v10 = v15;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

  if (v11)
  {
    id v12 = v6;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_AD14(v11);
    }

    id v13 = v11;
  }

  else if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
  {
    sub_ACAC();
  }

  return v11;
}

- (id)containersInAccount:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(self), "os_log");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CNContainer predicateForContainersInAccountWithIdentifier:includingDisabledContainers:]( &OBJC_CLASS___CNContainer,  "predicateForContainersInAccountWithIdentifier:includingDisabledContainers:",  v7,  1LL));

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactsDataclassOwnerContactsImplementation contactStore](self, "contactStore"));
  id v16 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 containersMatchingPredicate:v8 error:&v16]);
  id v11 = v16;

  id v12 = v6;
  id v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_AE58();
    }

    id v14 = v10;
  }

  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_ADD0();
    }
  }

  return v10;
}

- (id)contactsInContainer:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___CNContactFetchRequest);
  char v18 = CNContactIdentifierKey;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  id v7 = -[CNContactFetchRequest initWithKeysToFetch:](v5, "initWithKeysToFetch:", v6);

  -[CNContactFetchRequest setUnifyResults:](v7, "setUnifyResults:", 0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[CNContact predicateForContactsInContainerWithIdentifier:]( &OBJC_CLASS___CNContact,  "predicateForContactsInContainerWithIdentifier:",  v8));
  -[CNContactFetchRequest setPredicate:](v7, "setPredicate:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactsDataclassOwnerContactsImplementation contactStore](self, "contactStore"));
  id v17 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_9398;
  v15[3] = &unk_10610;
  id v12 = v10;
  id v16 = v12;
  [v11 enumerateContactsWithFetchRequest:v7 error:&v17 usingBlock:v15];
  id v13 = v17;

  return v12;
}

- (BOOL)createAndExecuteSaveRequest:(id)a3 errorBlock:(id)a4
{
  id v6 = (void (**)(id, CNSaveRequest *))a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___CNSaveRequest);
  if (v6) {
    v6[2](v6, v8);
  }
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactsDataclassOwnerContactsImplementation contactStore](self, "contactStore"));
  id v13 = 0LL;
  unsigned __int8 v10 = [v9 executeSaveRequest:v8 error:&v13];
  id v11 = v13;

  if (v7 && (v10 & 1) == 0) {
    v7[2](v7, v11);
  }

  return v10;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNACAccountProvider)accountProvider
{
  return self->_accountProvider;
}

- (void).cxx_destruct
{
}

  ;
}

@end