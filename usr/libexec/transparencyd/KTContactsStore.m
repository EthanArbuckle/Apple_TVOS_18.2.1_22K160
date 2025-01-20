@interface KTContactsStore
- (BOOL)haveContact:(id)a3 error:(id *)a4;
- (CNContactStore)contactStore;
- (KTContactsStore)initWithContactStore:(id)a3;
- (void)fetchAndStoreContactsSyncTokenWithConfigStore:(id)a3;
- (void)setContactStore:(id)a3;
@end

@implementation KTContactsStore

- (KTContactsStore)initWithContactStore:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___KTContactsStore;
  v5 = -[KTContactsStore init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[KTContactsStore setContactStore:](v5, "setContactStore:", v4);
  }

  return v6;
}

- (void)fetchAndStoreContactsSyncTokenWithConfigStore:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTContactsStore contactStore](self, "contactStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentHistoryToken]);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTContactsStore contactStore](self, "contactStore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentHistoryToken]);
    [v8 setSettingsData:@"lastContactSyncData" data:v7];
  }
}

- (BOOL)haveContact:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 hasPrefix:@"mailto:"])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 substringFromIndex:7]);
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[CNContact predicateForContactsMatchingEmailAddress:]( &OBJC_CLASS___CNContact,  "predicateForContactsMatchingEmailAddress:",  v6));
  }

  else
  {
    if (![v5 hasPrefix:@"tel:"])
    {
      BOOL v13 = 0;
      goto LABEL_7;
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 substringFromIndex:4]);
    id v8 = -[CNPhoneNumber initWithStringValue:](objc_alloc(&OBJC_CLASS___CNPhoneNumber), "initWithStringValue:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[CNContact predicateForContactsMatchingPhoneNumber:]( &OBJC_CLASS___CNContact,  "predicateForContactsMatchingPhoneNumber:",  v8));
  }

  v9 = objc_alloc(&OBJC_CLASS___CNContactFetchRequest);
  v20[0] = CNContactEmailAddressesKey;
  v20[1] = CNContactPhoneNumbersKey;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL));
  v11 = -[CNContactFetchRequest initWithKeysToFetch:](v9, "initWithKeysToFetch:", v10);

  -[CNContactFetchRequest setUnifyResults:](v11, "setUnifyResults:", 1LL);
  -[CNContactFetchRequest setPredicate:](v11, "setPredicate:", v7);
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTContactsStore contactStore](self, "contactStore"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000303F4;
  v15[3] = &unk_100279138;
  v15[4] = &v16;
  [v12 enumerateContactsWithFetchRequest:v11 error:0 usingBlock:v15];

  BOOL v13 = *((_BYTE *)v17 + 24) != 0;
  _Block_object_dispose(&v16, 8);

LABEL_7:
  return v13;
}

- (CNContactStore)contactStore
{
  return (CNContactStore *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setContactStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end