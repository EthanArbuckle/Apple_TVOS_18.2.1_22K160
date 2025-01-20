@interface AKMIDKeychain
- (AKMIDKeychain)init;
- (BOOL)_clearLastKnownMID:(id *)a3;
- (BOOL)updateLastKnownMID:(id)a3 error:(id *)a4;
- (id)_lastKnownMIDDescriptor;
- (id)lastKnownMID:(id *)a3;
@end

@implementation AKMIDKeychain

- (AKMIDKeychain)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AKMIDKeychain;
  v2 = -[AKMIDKeychain init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___AAFKeychainManager);
    keychainManager = v2->_keychainManager;
    v2->_keychainManager = v3;
  }

  return v2;
}

- (id)lastKnownMID:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKMIDKeychain _lastKnownMIDDescriptor](self, "_lastKnownMIDDescriptor"));
  keychainManager = self->_keychainManager;
  id v22 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[AAFKeychainManager keychainItemForDescriptor:error:]( keychainManager,  "keychainItemForDescriptor:error:",  v5,  &v22));
  id v8 = v22;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 value]);
  if ([v8 code] == (id)-25300
    && (v11 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]),
        unsigned int v12 = [v11 isEqualToString:NSOSStatusErrorDomain],
        v11,
        v12))
  {
    uint64_t v14 = _AKLogSystem(v13);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_1001419EC((uint64_t)self, (uint64_t)v8, v15);
    }
    id v16 = 0LL;
  }

  else
  {
    id v21 = 0LL;
    id v17 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___NSString, v10),  v9,  &v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (os_log_s *)v21;
    v15 = v19;
    if (v9)
    {
      id v16 = v18;
    }

    else
    {
      id v16 = 0LL;
      if (a3) {
        *a3 = v19;
      }
    }
  }

  return v16;
}

- (BOOL)updateLastKnownMID:(id)a3 error:(id *)a4
{
  if (!a3) {
    return -[AKMIDKeychain _clearLastKnownMID:](self, "_clearLastKnownMID:", a4);
  }
  id v17 = 0LL;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  &v17));
  id v7 = v17;
  id v8 = v7;
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKMIDKeychain _lastKnownMIDDescriptor](self, "_lastKnownMIDDescriptor"));
    id v10 = [[AAFKeychainItem alloc] initWithDescriptor:v9 value:v6];
    keychainManager = self->_keychainManager;
    id v16 = 0LL;
    -[AAFKeychainManager addOrUpdateKeychainItem:error:](keychainManager, "addOrUpdateKeychainItem:error:", v10, &v16);
    id v12 = v16;
    uint64_t v13 = v12;
    BOOL v14 = v12 == 0LL;
    if (a4)
    {
      if (v12) {
        *a4 = v12;
      }
    }
  }

  else
  {
    BOOL v14 = 0;
    if (a4) {
      *a4 = v7;
    }
  }

  return v14;
}

- (id)_lastKnownMIDDescriptor
{
  id v2 = objc_alloc_init(&OBJC_CLASS___AAFKeychainItemDescriptor);
  [v2 setItemClass:1];
  [v2 setItemAccessible:5];
  [v2 setInvisible:2];
  [v2 setSynchronizable:1];
  [v2 setUseDataProtection:2];
  [v2 setSysBound:1];
  [v2 setService:@"com.apple.authkit.MID.svc"];
  [v2 setLabel:@"com.apple.authkit.previousKnownMID"];
  return v2;
}

- (BOOL)_clearLastKnownMID:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKMIDKeychain _lastKnownMIDDescriptor](self, "_lastKnownMIDDescriptor"));
  -[AAFKeychainManager deleteKeychainItemsForDescriptor:error:]( self->_keychainManager,  "deleteKeychainItemsForDescriptor:error:",  v5,  a3);

  return a3 != 0LL;
}

- (void).cxx_destruct
{
}

@end