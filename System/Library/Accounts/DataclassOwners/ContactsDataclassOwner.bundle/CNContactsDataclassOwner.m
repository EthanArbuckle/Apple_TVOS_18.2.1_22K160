@interface CNContactsDataclassOwner
+ (OS_os_log)log;
+ (id)dataclasses;
- (BOOL)areSourcesEmptyForAccount:(id)a3;
- (BOOL)isLocalSourceEmpty;
- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6;
- (CNACAccountProvider)accountProvider;
- (CNContactsDataclassOwner)init;
- (CNContactsDataclassOwner)initWithImplementation:(id)a3 accountProvider:(id)a4;
- (CNContactsDataclassOwnerImplementation)implementation;
- (id)actionsForAddingAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForDeletingAppleAccount:(id)a3;
- (id)actionsForDeletingGenericAccount:(id)a3;
- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForDisablingDataclassOnAppleAccount:(id)a3;
- (id)actionsForDisablingDataclassOnGenericAccount:(id)a3;
- (id)actionsForEnablingDataclassOnAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForEnablingDataclassOnAppleAccount:(id)a3;
- (id)actionsForEnablingDataclassOnGenericAccount:(id)a3;
@end

@implementation CNContactsDataclassOwner

+ (id)dataclasses
{
  uint64_t v3 = kAccountDataclassContacts;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v3,  1LL));
}

+ (OS_os_log)log
{
  if (qword_15C90 != -1) {
    dispatch_once(&qword_15C90, &stru_10308);
  }
  return (OS_os_log *)(id)qword_15C98;
}

- (CNContactsDataclassOwner)init
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  v4 = objc_alloc_init(&OBJC_CLASS___CNContactStore);
  v5 = +[CNACAccountProvider providerWithStore:](&OBJC_CLASS___CNACAccountProvider, "providerWithStore:", v3);
  v6 = -[CNContactsDataclassOwnerContactsImplementation initWithContactStore:accountProvider:]( objc_alloc(&OBJC_CLASS___CNContactsDataclassOwnerContactsImplementation),  "initWithContactStore:accountProvider:",  v4,  v5);
  v7 = -[CNContactsDataclassOwner initWithImplementation:accountProvider:]( self,  "initWithImplementation:accountProvider:",  v6,  v5);

  return v7;
}

- (CNContactsDataclassOwner)initWithImplementation:(id)a3 accountProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CNContactsDataclassOwner;
  v9 = -[CNContactsDataclassOwner init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_implementation, a3);
    objc_storeStrong((id *)&v10->_accountProvider, a4);
    v11 = v10;
  }

  return v10;
}

- (id)actionsForAddingAccount:(id)a3 forDataclass:(id)a4
{
  return -[CNContactsDataclassOwner actionsForEnablingDataclassOnAccount:forDataclass:]( self,  "actionsForEnablingDataclassOnAccount:forDataclass:",  a3,  a4);
}

- (id)actionsForEnablingDataclassOnAccount:(id)a3 forDataclass:(id)a4
{
  id v5 = a3;
  if (+[CNACAccountTypeAnalyzer isAccountAppleAccount:]( &OBJC_CLASS___CNACAccountTypeAnalyzer,  "isAccountAppleAccount:",  v5))
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( -[CNContactsDataclassOwner actionsForEnablingDataclassOnAppleAccount:]( self,  "actionsForEnablingDataclassOnAppleAccount:",  v5));
  }

  else
  {
    if (!+[CNACAccountTypeAnalyzer isAccountGenericContactsSyncingAccount:]( &OBJC_CLASS___CNACAccountTypeAnalyzer,  "isAccountGenericContactsSyncingAccount:",  v5))
    {
      id v7 = 0LL;
      goto LABEL_7;
    }

    uint64_t v6 = objc_claimAutoreleasedReturnValue( -[CNContactsDataclassOwner actionsForEnablingDataclassOnGenericAccount:]( self,  "actionsForEnablingDataclassOnGenericAccount:",  v5));
  }

  id v7 = (void *)v6;
LABEL_7:

  return v7;
}

- (id)actionsForEnablingDataclassOnAppleAccount:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[CNContactsDataclassOwner isLocalSourceEmpty](self, "isLocalSourceEmpty");
  id v6 = [(id)objc_opt_class(self) log];
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      sub_9AE0();
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[CNDataclassActionDefinition createSyncDataStore]( &OBJC_CLASS___CNDataclassActionDefinition,  "createSyncDataStore"));
    v14 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  }

  else
  {
    if (v8) {
      sub_9B40();
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[CNDataclassActionDefinition mergeLocalDataIntoSyncData]( &OBJC_CLASS___CNDataclassActionDefinition,  "mergeLocalDataIntoSyncData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CNDataclassActionDefinition cancel](&OBJC_CLASS___CNDataclassActionDefinition, "cancel", v9));
    v13[1] = v11;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
  }

  return v10;
}

- (id)actionsForEnablingDataclassOnGenericAccount:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[CNContactsDataclassOwner isLocalSourceEmpty](self, "isLocalSourceEmpty");
  id v6 = [(id)objc_opt_class(self) log];
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      sub_9BA0();
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[CNDataclassActionDefinition createSyncDataStore]( &OBJC_CLASS___CNDataclassActionDefinition,  "createSyncDataStore"));
    v15 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  }

  else
  {
    if (v8) {
      sub_9C00();
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[CNDataclassActionDefinition createSyncDataStoreKeepLocalData]( &OBJC_CLASS___CNDataclassActionDefinition,  "createSyncDataStoreKeepLocalData"));
    v14[0] = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[CNDataclassActionDefinition createSyncDataStoreDeleteLocalData]( &OBJC_CLASS___CNDataclassActionDefinition,  "createSyncDataStoreDeleteLocalData"));
    v14[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CNDataclassActionDefinition cancel](&OBJC_CLASS___CNDataclassActionDefinition, "cancel"));
    v14[2] = v12;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 3LL));
  }

  return v10;
}

- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4
{
  id v5 = a3;
  if (+[CNACAccountTypeAnalyzer isAccountAppleAccount:]( &OBJC_CLASS___CNACAccountTypeAnalyzer,  "isAccountAppleAccount:",  v5))
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[CNContactsDataclassOwner actionsForDeletingAppleAccount:](self, "actionsForDeletingAppleAccount:", v5));
  }

  else
  {
    if (!+[CNACAccountTypeAnalyzer isAccountGenericContactsSyncingAccount:]( &OBJC_CLASS___CNACAccountTypeAnalyzer,  "isAccountGenericContactsSyncingAccount:",  v5))
    {
      id v7 = 0LL;
      goto LABEL_7;
    }

    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[CNContactsDataclassOwner actionsForDeletingGenericAccount:](self, "actionsForDeletingGenericAccount:", v5));
  }

  id v7 = (void *)v6;
LABEL_7:

  return v7;
}

- (id)actionsForDeletingAppleAccount:(id)a3
{
  id v4 = a3;
  if (+[CNACAccountTypeAnalyzer isiCloudSignoutRestrictionEnabled]( &OBJC_CLASS___CNACAccountTypeAnalyzer,  "isiCloudSignoutRestrictionEnabled"))
  {
    id v5 = [(id)objc_opt_class(self) log];
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_9C60();
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CNDataclassActionDefinition cancelDueToRestrictions]( &OBJC_CLASS___CNDataclassActionDefinition,  "cancelDueToRestrictions"));
    v19 = v7;
    BOOL v8 = &v19;
LABEL_9:
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 1LL));
    goto LABEL_13;
  }

  unsigned int v9 = -[CNContactsDataclassOwner areSourcesEmptyForAccount:](self, "areSourcesEmptyForAccount:", v4);
  id v10 = [(id)objc_opt_class(self) log];
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v12) {
      sub_9CC0();
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CNDataclassActionDefinition deleteSyncData]( &OBJC_CLASS___CNDataclassActionDefinition,  "deleteSyncData"));
    v18 = v7;
    BOOL v8 = &v18;
    goto LABEL_9;
  }

  if (v12) {
    sub_9D20();
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CNDataclassActionDefinition deleteSyncData]( &OBJC_CLASS___CNDataclassActionDefinition,  "deleteSyncData"));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[CNDataclassActionDefinition mergeSyncDataIntoLocalData]( &OBJC_CLASS___CNDataclassActionDefinition,  "mergeSyncDataIntoLocalData",  v7));
  v17[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CNDataclassActionDefinition cancel](&OBJC_CLASS___CNDataclassActionDefinition, "cancel"));
  v17[2] = v15;
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 3LL));

LABEL_13:
  return v13;
}

- (id)actionsForDeletingGenericAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(self) log];
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_9D80();
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CNDataclassActionDefinition deleteSyncData]( &OBJC_CLASS___CNDataclassActionDefinition,  "deleteSyncData"));
  v11[0] = v7;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[CNDataclassActionDefinition cancel](&OBJC_CLASS___CNDataclassActionDefinition, "cancel"));
  v11[1] = v8;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));

  return v9;
}

- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4
{
  id v5 = a3;
  if (+[CNACAccountTypeAnalyzer isAccountAppleAccount:]( &OBJC_CLASS___CNACAccountTypeAnalyzer,  "isAccountAppleAccount:",  v5))
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( -[CNContactsDataclassOwner actionsForDisablingDataclassOnAppleAccount:]( self,  "actionsForDisablingDataclassOnAppleAccount:",  v5));
  }

  else
  {
    if (!+[CNACAccountTypeAnalyzer isAccountPopularContactsSyncingAccount:]( &OBJC_CLASS___CNACAccountTypeAnalyzer,  "isAccountPopularContactsSyncingAccount:",  v5))
    {
      id v7 = 0LL;
      goto LABEL_7;
    }

    uint64_t v6 = objc_claimAutoreleasedReturnValue( -[CNContactsDataclassOwner actionsForDisablingDataclassOnGenericAccount:]( self,  "actionsForDisablingDataclassOnGenericAccount:",  v5));
  }

  id v7 = (void *)v6;
LABEL_7:

  return v7;
}

- (id)actionsForDisablingDataclassOnAppleAccount:(id)a3
{
  id v4 = a3;
  if (+[CNACAccountTypeAnalyzer isiCloudSignoutRestrictionEnabled]( &OBJC_CLASS___CNACAccountTypeAnalyzer,  "isiCloudSignoutRestrictionEnabled"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[CNDataclassActionDefinition cancelDueToRestrictions]( &OBJC_CLASS___CNDataclassActionDefinition,  "cancelDueToRestrictions"));
    v15 = v5;
    uint64_t v6 = (uint64_t *)&v15;
  }

  else
  {
    unsigned int v7 = -[CNContactsDataclassOwner areSourcesEmptyForAccount:](self, "areSourcesEmptyForAccount:", v4);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[CNDataclassActionDefinition deleteSyncData](&OBJC_CLASS___CNDataclassActionDefinition, "deleteSyncData"));
    id v5 = (void *)v8;
    if (!v7)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[CNDataclassActionDefinition mergeSyncDataIntoLocalData]( &OBJC_CLASS___CNDataclassActionDefinition,  "mergeSyncDataIntoLocalData",  v8));
      v13[1] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CNDataclassActionDefinition cancel](&OBJC_CLASS___CNDataclassActionDefinition, "cancel"));
      void v13[2] = v11;
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 3LL));

      goto LABEL_7;
    }

    uint64_t v14 = v8;
    uint64_t v6 = &v14;
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 1LL));
LABEL_7:

  return v9;
}

- (id)actionsForDisablingDataclassOnGenericAccount:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[CNDataclassActionDefinition deleteSyncData]( &OBJC_CLASS___CNDataclassActionDefinition,  "deleteSyncData",  a3));
  v7[0] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CNDataclassActionDefinition cancel](&OBJC_CLASS___CNDataclassActionDefinition, "cancel"));
  v7[1] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 2LL));

  return v5;
}

- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  BOOL v12 = objc_alloc_init(&OBJC_CLASS___CNDataclassActionParameters);
  -[CNDataclassActionParameters setAction:](v12, "setAction:", v9);
  -[CNDataclassActionParameters setAccount:](v12, "setAccount:", v10);
  -[CNDataclassActionParameters setChildAccounts:](v12, "setChildAccounts:", v11);

  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactsDataclassOwner accountProvider](self, "accountProvider"));
  -[CNDataclassActionParameters setAccountProvider:](v12, "setAccountProvider:", v13);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactsDataclassOwner implementation](self, "implementation"));
  -[CNDataclassActionParameters setImplementation:](v12, "setImplementation:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[CNDataclassActionHandler actionHandlerSuitableForParameters:]( &OBJC_CLASS___CNDataclassActionHandler,  "actionHandlerSuitableForParameters:",  v12));
  id v16 = [(id)objc_opt_class(self) log];
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 134218754;
    v21 = self;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2112;
    v27 = v15;
    _os_log_debug_impl( &dword_0,  v17,  OS_LOG_TYPE_DEBUG,  "%p - CNContactsDataclassOwner will performAction (%@) forAccount (%@) with handler (%@).",  (uint8_t *)&v20,  0x2Au);
  }

  unsigned __int8 v18 = [v15 perform];
  return v18;
}

- (BOOL)isLocalSourceEmpty
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactsDataclassOwner implementation](self, "implementation"));
  unsigned __int8 v3 = [v2 isLocalContainerEmpty];

  return v3;
}

- (BOOL)areSourcesEmptyForAccount:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactsDataclassOwner implementation](self, "implementation"));
  unsigned __int8 v6 = [v5 areContainersEmptyForParentAccount:v4];

  return v6;
}

- (CNACAccountProvider)accountProvider
{
  return self->_accountProvider;
}

- (CNContactsDataclassOwnerImplementation)implementation
{
  return self->_implementation;
}

- (void).cxx_destruct
{
}

@end