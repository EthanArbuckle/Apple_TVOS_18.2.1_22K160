@interface CNDataclassActionHandler
+ (OS_os_log)os_log;
+ (id)actionHandlerSuitableForParameters:(id)a3;
+ (id)appleAccountActionHandlerWithParameters:(id)a3;
+ (id)delegatesFromAccounts:(id)a3;
+ (id)genericAccountActionHandlerWithParameters:(id)a3;
- (ACAccount)account;
- (BOOL)createContactsAccountForACAccount:(id)a3 withChildren:(id)a4;
- (BOOL)drainLocalStore;
- (BOOL)mergeContactsFromLocalSourceIntoSource:(id)a3;
- (BOOL)mergeContactsIntoLocalSourceFromABAccount:(id)a3;
- (BOOL)perform;
- (BOOL)removeContactsAccount:(id)a3;
- (BOOL)removeContactsAccountForACAccount:(id)a3 withChildren:(id)a4;
- (CNACAccountProvider)accountProvider;
- (CNContactsDataclassOwnerImplementation)implementation;
- (CNDataclassActionHandler)initWithParameters:(id)a3;
- (NSArray)childAccounts;
- (id)copyABAccountForACAccount:(id)a3 withChildren:(id)a4;
- (id)copyDefaultAddressBookSourceForAccount:(id)a3 withChildren:(id)a4 createIfNecessary:(BOOL)a5;
- (void)disableLocalSourceIfNeededAddingAccount:(id)a3;
- (void)enableLocalSourceIfNecessaryIgnoringAccount:(id)a3;
- (void)setLocalSourceEnabled:(BOOL)a3;
- (void)setSourceEnabled:(BOOL)a3 forAccount:(id)a4 withChildren:(id)a5;
@end

@implementation CNDataclassActionHandler

+ (OS_os_log)os_log
{
  if (qword_15CA0 != -1) {
    dispatch_once(&qword_15CA0, &stru_10328);
  }
  return (OS_os_log *)(id)qword_15CA8;
}

+ (id)actionHandlerSuitableForParameters:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 account]);
  unsigned int v6 = +[CNACAccountTypeAnalyzer isAccountAppleAccount:]( &OBJC_CLASS___CNACAccountTypeAnalyzer,  "isAccountAppleAccount:",  v5);

  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([a1 appleAccountActionHandlerWithParameters:v4]);
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 account]);
    unsigned int v9 = +[CNACAccountTypeAnalyzer isAccountGenericContactsSyncingOrDirectoryAccount:]( &OBJC_CLASS___CNACAccountTypeAnalyzer,  "isAccountGenericContactsSyncingOrDirectoryAccount:",  v8);

    if (!v9)
    {
      v10 = 0LL;
      goto LABEL_7;
    }

    uint64_t v7 = objc_claimAutoreleasedReturnValue([a1 genericAccountActionHandlerWithParameters:v4]);
  }

  v10 = (void *)v7;
LABEL_7:

  return v10;
}

+ (id)appleAccountActionHandlerWithParameters:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 action]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[CNDataclassActionDefinition createSyncDataStore]( &OBJC_CLASS___CNDataclassActionDefinition,  "createSyncDataStore"));
  unsigned __int8 v6 = [v4 isEqual:v5];

  if ((v6 & 1) != 0)
  {
    uint64_t v7 = off_10088;
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 action]);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[CNDataclassActionDefinition mergeLocalDataIntoSyncData]( &OBJC_CLASS___CNDataclassActionDefinition,  "mergeLocalDataIntoSyncData"));
    unsigned __int8 v10 = [v8 isEqual:v9];

    if ((v10 & 1) != 0)
    {
      uint64_t v7 = off_10098;
    }

    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v3 action]);
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[CNDataclassActionDefinition mergeSyncDataIntoLocalData]( &OBJC_CLASS___CNDataclassActionDefinition,  "mergeSyncDataIntoLocalData"));
      unsigned __int8 v13 = [v11 isEqual:v12];

      if ((v13 & 1) != 0)
      {
        uint64_t v7 = &off_100A0;
      }

      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue([v3 action]);
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[CNDataclassActionDefinition deleteSyncData]( &OBJC_CLASS___CNDataclassActionDefinition,  "deleteSyncData"));
        unsigned int v16 = [v14 isEqual:v15];

        if (!v16)
        {
          id v17 = 0LL;
          goto LABEL_10;
        }

        uint64_t v7 = off_10090;
      }
    }
  }

  id v17 = [objc_alloc(*v7) initWithParameters:v3];
LABEL_10:

  return v17;
}

+ (id)genericAccountActionHandlerWithParameters:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 action]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[CNDataclassActionDefinition createSyncDataStore]( &OBJC_CLASS___CNDataclassActionDefinition,  "createSyncDataStore"));
  unsigned __int8 v6 = [v4 isEqual:v5];

  if ((v6 & 1) != 0)
  {
    uint64_t v7 = off_100D0;
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 action]);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[CNDataclassActionDefinition createSyncDataStoreDeleteLocalData]( &OBJC_CLASS___CNDataclassActionDefinition,  "createSyncDataStoreDeleteLocalData"));
    unsigned __int8 v10 = [v8 isEqual:v9];

    if ((v10 & 1) != 0)
    {
      uint64_t v7 = off_100D8;
    }

    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v3 action]);
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[CNDataclassActionDefinition createSyncDataStoreKeepLocalData]( &OBJC_CLASS___CNDataclassActionDefinition,  "createSyncDataStoreKeepLocalData"));
      unsigned __int8 v13 = [v11 isEqual:v12];

      if ((v13 & 1) != 0)
      {
        uint64_t v7 = off_100E0;
      }

      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue([v3 action]);
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[CNDataclassActionDefinition deleteSyncData]( &OBJC_CLASS___CNDataclassActionDefinition,  "deleteSyncData"));
        unsigned int v16 = [v14 isEqual:v15];

        if (!v16)
        {
          id v17 = 0LL;
          goto LABEL_10;
        }

        uint64_t v7 = &off_100E8;
      }
    }
  }

  id v17 = [objc_alloc(*v7) initWithParameters:v3];
LABEL_10:

  return v17;
}

- (CNDataclassActionHandler)initWithParameters:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CNDataclassActionHandler;
  v5 = -[CNDataclassActionHandler init](&v16, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 account]);
    account = v5->_account;
    v5->_account = (ACAccount *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 childAccounts]);
    childAccounts = v5->_childAccounts;
    v5->_childAccounts = (NSArray *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 accountProvider]);
    accountProvider = v5->_accountProvider;
    v5->_accountProvider = (CNACAccountProvider *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 implementation]);
    implementation = v5->_implementation;
    v5->_implementation = (CNContactsDataclassOwnerImplementation *)v12;

    v14 = v5;
  }

  return v5;
}

- (BOOL)perform
{
  uint64_t v2 = CNAbstractMethodException(self, a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  objc_exception_throw(v3);
  return -[CNDataclassActionHandler createContactsAccountForACAccount:withChildren:](v4, v5, v6, v7);
}

- (BOOL)createContactsAccountForACAccount:(id)a3 withChildren:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler implementation](self, "implementation"));
  unsigned __int8 v9 = [v8 createContactsAccountForParentAccount:v7 withChildAccounts:v6];

  return v9;
}

- (BOOL)removeContactsAccountForACAccount:(id)a3 withChildren:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler implementation](self, "implementation"));
  id v9 = [(id)objc_opt_class(self) delegatesFromAccounts:v6];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  unsigned __int8 v11 = [v8 removeContactsAccountForParentAccount:v7 delegates:v10 withChildAccounts:v6];

  return v11;
}

+ (id)delegatesFromAccounts:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_cn_filter:", &stru_10368));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_cn_flatMap:", &stru_103A8));
  SEL v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_cn_map:", &stru_103E8));

  return v5;
}

- (BOOL)drainLocalStore
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler implementation](self, "implementation"));
  unsigned __int8 v3 = [v2 emptyLocalContainer];

  return v3;
}

- (BOOL)mergeContactsFromLocalSourceIntoSource:(id)a3
{
  id v4 = a3;
  SEL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler implementation](self, "implementation"));
  unsigned __int8 v6 = [v5 mergeContactsFromLocalContainerToContainer:v4];

  return v6;
}

- (BOOL)mergeContactsIntoLocalSourceFromABAccount:(id)a3
{
  id v4 = a3;
  SEL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler implementation](self, "implementation"));
  unsigned __int8 v6 = [v5 mergeContactsIntoLocalContainerFromContainersOfContactsAccount:v4];

  return v6;
}

- (BOOL)removeContactsAccount:(id)a3
{
  id v4 = a3;
  SEL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler implementation](self, "implementation"));
  unsigned __int8 v6 = [v5 removeContactsAccount:v4];

  return v6;
}

- (id)copyABAccountForACAccount:(id)a3 withChildren:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler implementation](self, "implementation"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 contactsAccountForParentAccount:v7 withChildAccounts:v6]);

  return v9;
}

- (id)copyDefaultAddressBookSourceForAccount:(id)a3 withChildren:(id)a4 createIfNecessary:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler implementation](self, "implementation"));
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 defaultContainerForParentAccount:v9 withChildAccounts:v8 createIfNecessary:v5]);

  return v11;
}

- (void)disableLocalSourceIfNeededAddingAccount:(id)a3
{
  if (([a3 MCIsManaged] & 1) == 0)
  {
    id v4 = objc_msgSend((id)objc_opt_class(self), "os_log");
    BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "It is necessary to disable the Contacts local container", v6, 2u);
    }

    -[CNDataclassActionHandler setLocalSourceEnabled:](self, "setLocalSourceEnabled:", 0LL);
  }

- (void)setLocalSourceEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler implementation](self, "implementation"));
  [v4 setLocalContainerEnabled:v3];
}

- (void)setSourceEnabled:(BOOL)a3 forAccount:(id)a4 withChildren:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler implementation](self, "implementation"));
  [v10 setContainersEnabled:v6 forParentAccount:v9 withChildAccounts:v8];
}

- (void)enableLocalSourceIfNecessaryIgnoringAccount:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler accountProvider](self, "accountProvider"));
  unsigned __int8 v6 = [v5 isAnyAccountSyncableIgnoringAccount:v4];

  if ((v6 & 1) == 0)
  {
    id v7 = objc_msgSend((id)objc_opt_class(self), "os_log");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "It is necessary to enable the Contacts local container", v9, 2u);
    }

    -[CNDataclassActionHandler setLocalSourceEnabled:](self, "setLocalSourceEnabled:", 1LL);
  }

- (CNContactsDataclassOwnerImplementation)implementation
{
  return self->_implementation;
}

- (CNACAccountProvider)accountProvider
{
  return self->_accountProvider;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSArray)childAccounts
{
  return self->_childAccounts;
}

- (void).cxx_destruct
{
}

@end