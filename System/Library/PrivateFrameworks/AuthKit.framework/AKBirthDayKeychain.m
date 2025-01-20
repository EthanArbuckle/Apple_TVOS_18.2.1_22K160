@interface AKBirthDayKeychain
- (AAFKeychainManager)keychainManager;
- (AKBirthDayKeychain)init;
- (BOOL)deleteBirthdayForAltDSID:(id)a3 error:(id *)a4;
- (BOOL)updateBirthdayForAltDSID:(id)a3 userInformation:(id)a4 error:(id *)a5;
- (id)_birthDayKeychainDescriptorForAltDSID:(id)a3;
- (id)fetchBirthDayForAltDSID:(id)a3 error:(id *)a4;
- (void)setKeychainManager:(id)a3;
@end

@implementation AKBirthDayKeychain

- (AKBirthDayKeychain)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AKBirthDayKeychain;
  v2 = -[AKBirthDayKeychain init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___AAFKeychainManager);
    keychainManager = v2->_keychainManager;
    v2->_keychainManager = v3;
  }

  return v2;
}

- (id)fetchBirthDayForAltDSID:(id)a3 error:(id *)a4
{
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( -[AKBirthDayKeychain _birthDayKeychainDescriptorForAltDSID:]( self,  "_birthDayKeychainDescriptorForAltDSID:",  a3));
  keychainManager = self->_keychainManager;
  id v23 = 0LL;
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[AAFKeychainManager keychainItemForDescriptor:error:]( keychainManager,  "keychainItemForDescriptor:error:",  v6,  &v23));
  id v9 = v23;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 value]);
  if ([v9 code] == (id)-25300
    && (v12 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]),
        unsigned __int8 v13 = [v12 isEqualToString:NSOSStatusErrorDomain],
        v12,
        (v13 & 1) != 0))
  {
    id v14 = 0LL;
  }

  else
  {
    id v22 = 0LL;
    id v15 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___NSDate, v11),  v10,  &v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    id v17 = v22;
    v18 = v17;
    if (v10)
    {
      id v14 = v16;
    }

    else
    {
      uint64_t v19 = _AKLogSystem(v17);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10013EDE0();
      }

      id v14 = 0LL;
      if (a4) {
        *a4 = v18;
      }
    }
  }

  return v14;
}

- (BOOL)updateBirthdayForAltDSID:(id)a3 userInformation:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  id v43 = 0LL;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 authKitAccountWithAltDSID:v8 error:&v43]);
  id v12 = v43;

  if (v11)
  {
    id v39 = v12;
    id v41 = v8;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 birthMonth]);
    id v40 = v9;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 birthDay]);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 birthYearForAccount:v11]);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@-%@", v14, v15, v17));

    uint64_t v19 = (void *)v18;
    v20 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateFormat:](v20, "setDateFormat:", @"MM-dd-yyyy");
    v42[1] = 0LL;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v20, "dateFromString:", v18));
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:"));
    id v22 = 0LL;
    id v23 = v22;
    if (v21)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue( -[AKBirthDayKeychain _birthDayKeychainDescriptorForAltDSID:]( self,  "_birthDayKeychainDescriptorForAltDSID:",  v41));
      id v25 = [[AAFKeychainItem alloc] initWithDescriptor:v24 value:v21];
      keychainManager = self->_keychainManager;
      v42[0] = 0LL;
      -[AAFKeychainManager addOrUpdateKeychainItem:error:](keychainManager, "addOrUpdateKeychainItem:error:", v25, v42);
      id v27 = v42[0];
      v28 = v27;
      BOOL v29 = v27 == 0LL;
      if (v27)
      {
        v37 = a5;
        v30 = v19;
        uint64_t v31 = _AKLogSystem(v27);
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          sub_10013EF00();
        }

        uint64_t v19 = v30;
        if (v37) {
          id *v37 = v28;
        }
      }

      id v9 = v40;
      id v8 = v41;
    }

    else
    {
      uint64_t v34 = _AKLogSystem(v22);
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      id v8 = v41;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_10013EEA0();
      }

      id v9 = v40;
      BOOL v29 = 0;
      if (a5) {
        *a5 = v23;
      }
    }

    id v12 = v39;
LABEL_19:

    goto LABEL_20;
  }

  if (v12)
  {
    uint64_t v33 = _AKLogSystem(v13);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEBUG)) {
      sub_10013EE40();
    }
    id v23 = 0LL;
    BOOL v29 = 0;
    goto LABEL_19;
  }

  id v23 = 0LL;
  BOOL v29 = 0;
LABEL_20:

  return v29;
}

- (BOOL)deleteBirthdayForAltDSID:(id)a3 error:(id *)a4
{
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( -[AKBirthDayKeychain _birthDayKeychainDescriptorForAltDSID:]( self,  "_birthDayKeychainDescriptorForAltDSID:",  a3));
  id v7 = -[AAFKeychainManager deleteKeychainItemsForDescriptor:error:]( self->_keychainManager,  "deleteKeychainItemsForDescriptor:error:",  v6,  a4);
  if (a4)
  {
    uint64_t v8 = _AKLogSystem(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10013EF60((uint64_t)a4, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  return a4 == 0LL;
}

- (id)_birthDayKeychainDescriptorForAltDSID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___AAFKeychainItemDescriptor);
  [v4 setItemClass:1];
  [v4 setInvisible:2];
  [v4 setSynchronizable:1];
  [v4 setUseDataProtection:2];
  [v4 setItemAccessible:0];
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"com.apple.authkit.birthDay",  v3));
  [v4 setService:v5];
  [v4 setLabel:v3];

  return v4;
}

- (AAFKeychainManager)keychainManager
{
  return self->_keychainManager;
}

- (void)setKeychainManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end