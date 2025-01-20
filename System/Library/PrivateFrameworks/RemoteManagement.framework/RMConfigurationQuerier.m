@interface RMConfigurationQuerier
- (NSPersistentContainer)persistentContainer;
- (RMConfigurationQuerier)initWithPersistentContainer:(id)a3;
- (id)_activeConfigurationsByTypeForTypes:(id)a3 managementSourceIdentifier:(id)a4 error:(id *)a5;
- (id)activeConfigurationsByTypeForTypes:(id)a3 error:(id *)a4;
- (id)activeConfigurationsByTypeForTypes:(id)a3 managementSourceIdentifier:(id)a4 error:(id *)a5;
- (id)activeConfigurationsForManagementSourceIdentifier:(id)a3 error:(id *)a4;
- (id)configurationUIsByTypeForTypes:(id)a3 managementSourceIdentifier:(id)a4 error:(id *)a5;
@end

@implementation RMConfigurationQuerier

- (RMConfigurationQuerier)initWithPersistentContainer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RMConfigurationQuerier;
  v6 = -[RMConfigurationQuerier init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_persistentContainer, a3);
  }

  return v7;
}

- (id)activeConfigurationsByTypeForTypes:(id)a3 error:(id *)a4
{
  return -[RMConfigurationQuerier _activeConfigurationsByTypeForTypes:managementSourceIdentifier:error:]( self,  "_activeConfigurationsByTypeForTypes:managementSourceIdentifier:error:",  a3,  0LL,  a4);
}

- (id)activeConfigurationsByTypeForTypes:(id)a3 managementSourceIdentifier:(id)a4 error:(id *)a5
{
  return -[RMConfigurationQuerier _activeConfigurationsByTypeForTypes:managementSourceIdentifier:error:]( self,  "_activeConfigurationsByTypeForTypes:managementSourceIdentifier:error:",  a3,  a4,  a5);
}

- (id)_activeConfigurationsByTypeForTypes:(id)a3 managementSourceIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = sub_100021104;
  v30 = sub_100021114;
  id v31 = 0LL;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  v23 = sub_100021104;
  v24 = sub_100021114;
  id v25 = 0LL;
  if ([v8 count])
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationQuerier persistentContainer](self, "persistentContainer"));
    id v11 = [v10 newBackgroundContext];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10002111C;
    v15[3] = &unk_1000B9408;
    id v16 = v9;
    id v17 = v8;
    v18 = &v20;
    v19 = &v26;
    [v11 performBlockAndWait:v15];
    if (a5)
    {
      v12 = (void *)v21[5];
      if (v12) {
        *a5 = v12;
      }
    }

    id v13 = (id)v27[5];
  }

  else
  {
    id v13 = &__NSDictionary0__struct;
  }

  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v13;
}

- (id)activeConfigurationsForManagementSourceIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  uint64_t v26 = sub_100021104;
  v27 = sub_100021114;
  id v28 = 0LL;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_100021104;
  v21 = sub_100021114;
  id v22 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationQuerier persistentContainer](self, "persistentContainer"));
  id v8 = [v7 newBackgroundContext];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100021844;
  v13[3] = &unk_1000B9738;
  id v9 = v6;
  id v14 = v9;
  v15 = &v17;
  id v16 = &v23;
  [v8 performBlockAndWait:v13];
  if (a4)
  {
    v10 = (void *)v18[5];
    if (v10) {
      *a4 = v10;
    }
  }

  id v11 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

- (id)configurationUIsByTypeForTypes:(id)a3 managementSourceIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = sub_100021104;
  v30 = sub_100021114;
  id v31 = 0LL;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_100021104;
  v24 = sub_100021114;
  id v25 = 0LL;
  if ([v8 count])
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationQuerier persistentContainer](self, "persistentContainer"));
    id v11 = [v10 newBackgroundContext];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100021F0C;
    v15[3] = &unk_1000B9408;
    id v16 = v9;
    id v17 = v8;
    v18 = &v20;
    uint64_t v19 = &v26;
    [v11 performBlockAndWait:v15];
    if (a5)
    {
      v12 = (void *)v21[5];
      if (v12) {
        *a5 = v12;
      }
    }

    id v13 = (id)v27[5];
  }

  else
  {
    id v13 = &__NSDictionary0__struct;
  }

  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v13;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void).cxx_destruct
{
}

@end