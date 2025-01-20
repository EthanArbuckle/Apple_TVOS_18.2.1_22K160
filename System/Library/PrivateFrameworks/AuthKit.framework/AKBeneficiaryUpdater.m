@interface AKBeneficiaryUpdater
+ (id)_beneficiaryWrappedKeyKeychainDescriptor;
+ (id)removeWrappedKeyFrom:(id)a3;
+ (id)saveWrappedKeyInKeychain:(id)a3;
@end

@implementation AKBeneficiaryUpdater

+ (id)removeWrappedKeyFrom:(id)a3
{
  id v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100063CC0;
  v6[3] = &unk_1001C8F58;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v7 = v4;
  [v3 enumerateObjectsUsingBlock:v6];

  return v4;
}

+ (id)saveWrappedKeyInKeychain:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_100064058;
  v51[3] = &unk_1001C8F10;
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v52 = v6;
  v7 = v5;
  v53 = v7;
  [v4 enumerateObjectsUsingBlock:v51];

  uint64_t v9 = _AKLogSystem(v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10013725C(v10, v11, v12, v13, v14, v15, v16, v17);
  }

  v18 = objc_alloc_init(&OBJC_CLASS___AAFKeychainManager);
  v19 = (void *)objc_claimAutoreleasedReturnValue([a1 _beneficiaryWrappedKeyKeychainDescriptor]);
  id v50 = 0LL;
  -[AAFKeychainManager deleteKeychainItemsForDescriptor:error:]( v18,  "deleteKeychainItemsForDescriptor:error:",  v19,  &v50);
  id v20 = v50;

  uint64_t v22 = _AKLogSystem(v21);
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_1001371FC();
  }

  id v49 = 0LL;
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  &v49));
  id v25 = v49;
  v26 = v25;
  if (v24)
  {
    id v27 = objc_alloc(&OBJC_CLASS___AAFKeychainItem);
    v28 = (void *)objc_claimAutoreleasedReturnValue([a1 _beneficiaryWrappedKeyKeychainDescriptor]);
    id v29 = [v27 initWithDescriptor:v28 value:v24];

    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 descriptor]);
    id v48 = 0LL;
    -[AAFKeychainManager deleteKeychainItemsForDescriptor:error:]( v18,  "deleteKeychainItemsForDescriptor:error:",  v30,  &v48);
    id v31 = v48;

    id v47 = v31;
    -[AAFKeychainManager addOrUpdateKeychainItem:error:](v18, "addOrUpdateKeychainItem:error:", v29, &v47);
    id v32 = v47;

    uint64_t v34 = _AKLogSystem(v33);
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    v36 = v35;
    if (v32)
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_10013719C();
      }
    }

    else if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      sub_10013716C(v36, v38, v39, v40, v41, v42, v43, v44);
    }
  }

  else
  {
    uint64_t v37 = _AKLogSystem(v25);
    id v29 = (id)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR)) {
      sub_10013710C();
    }
    id v32 = 0LL;
  }

  v45 = v7;
  return v45;
}

+ (id)_beneficiaryWrappedKeyKeychainDescriptor
{
  id v2 = objc_alloc_init(&OBJC_CLASS___AAFKeychainItemDescriptor);
  [v2 setItemClass:3];
  [v2 setUseDataProtection:2];
  [v2 setAccessGroup:AKBeneficiaryInfoKeychainAccessGroup];
  [v2 setItemAccessible:2];
  return v2;
}

@end