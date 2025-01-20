@interface AKWebSessionPCSKeyProvider
+ (AKWebSessionPCSKeyProvider)sharedInstance;
- (AKWebSessionPCSKeyProvider)init;
- (AKWebSessionPCSKeyProvider)initWithKeychainManager:(id)a3;
- (id)_keychainItemForContext:(id)a3 error:(id *)a4;
- (void)_removeAllExpiredPCSCredentials;
- (void)_removeCredentialWithDescriptor:(id)a3;
- (void)fetchContextForWebSessionIdentifier:(id)a3 completion:(id)a4;
- (void)removeAllPCSCredentials;
- (void)saveContext:(id)a3 completion:(id)a4;
- (void)updateContext:(id)a3 completion:(id)a4;
@end

@implementation AKWebSessionPCSKeyProvider

+ (AKWebSessionPCSKeyProvider)sharedInstance
{
  if (qword_10020F3F8 != -1) {
    dispatch_once(&qword_10020F3F8, &stru_1001C7D90);
  }
  return (AKWebSessionPCSKeyProvider *)(id)qword_10020F3F0;
}

- (AKWebSessionPCSKeyProvider)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AKKeychainManager sharedManager](&OBJC_CLASS___AKKeychainManager, "sharedManager"));
  v4 = -[AKWebSessionPCSKeyProvider initWithKeychainManager:](self, "initWithKeychainManager:", v3);

  return v4;
}

- (AKWebSessionPCSKeyProvider)initWithKeychainManager:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___AKWebSessionPCSKeyProvider;
  v6 = -[AKWebSessionPCSKeyProvider init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_keychainManager, a3);
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.authkit.PCSKeyProvider", v9);
    keychainQueue = v7->_keychainQueue;
    v7->_keychainQueue = (OS_dispatch_queue *)v10;
  }

  return v7;
}

- (void)saveContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  uint64_t v8 = _AKLogSystem(v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    *(_DWORD *)buf = 138412290;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Saving PCS auth context %@.", buf, 0xCu);
  }

  -[AKWebSessionPCSKeyProvider _removeAllExpiredPCSCredentials](self, "_removeAllExpiredPCSCredentials");
  id v16 = 0LL;
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[AKWebSessionPCSKeyProvider _keychainItemForContext:error:]( self,  "_keychainItemForContext:error:",  v6,  &v16));
  id v12 = v16;
  if (v12)
  {
    v7[2](v7, v12);
  }

  else
  {
    keychainManager = self->_keychainManager;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10003933C;
    v14[3] = &unk_1001C6990;
    v15 = v7;
    -[AKKeychainManager addOrUpdateKeychainItem:completion:]( keychainManager,  "addOrUpdateKeychainItem:completion:",  v11,  v14);
  }
}

- (void)updateContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  uint64_t v8 = _AKLogSystem(v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    *(_DWORD *)buf = 138412290;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updating PCS auth context %@.", buf, 0xCu);
  }

  id v16 = 0LL;
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[AKWebSessionPCSKeyProvider _keychainItemForContext:error:]( self,  "_keychainItemForContext:error:",  v6,  &v16));
  id v12 = v16;
  if (v12)
  {
    v7[2](v7, v12);
  }

  else
  {
    keychainManager = self->_keychainManager;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100039568;
    v14[3] = &unk_1001C6990;
    v15 = v7;
    -[AKKeychainManager updateKeychainItem:completion:](keychainManager, "updateKeychainItem:completion:", v11, v14);
  }
}

- (void)fetchContextForWebSessionIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Fetching PCS auth context with ID %@.",  buf,  0xCu);
  }

  dispatch_queue_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[AKKeychainItemDescriptor pcsAuthDescriptor]( &OBJC_CLASS___AKKeychainItemDescriptor,  "pcsAuthDescriptor"));
  [v10 setAccount:v6];
  keychainManager = self->_keychainManager;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10003975C;
  v13[3] = &unk_1001C7DB8;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  -[AKKeychainManager fetchKeychainItemWithDescriptor:completion:]( keychainManager,  "fetchKeychainItemWithDescriptor:completion:",  v10,  v13);
}

- (void)removeAllPCSCredentials
{
  keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000399D4;
  block[3] = &unk_1001C7300;
  block[4] = self;
  dispatch_async(keychainQueue, block);
}

- (id)_keychainItemForContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[AKKeychainItemDescriptor pcsAuthDescriptor]( &OBJC_CLASS___AKKeychainItemDescriptor,  "pcsAuthDescriptor"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 webSessionIdentifier]);
  [v6 setAccount:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v5,  1LL,  a4));
  if (*a4)
  {
    uint64_t v10 = _AKLogSystem(v9);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001328DC(a4);
    }

    id v12 = 0LL;
  }

  else
  {
    id v12 = -[AKKeychainItem initWithDescriptor:value:]( objc_alloc(&OBJC_CLASS___AKKeychainItem),  "initWithDescriptor:value:",  v6,  v8);
  }

  return v12;
}

- (void)_removeAllExpiredPCSCredentials
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[AKKeychainItemDescriptor pcsAuthDescriptor]( &OBJC_CLASS___AKKeychainItemDescriptor,  "pcsAuthDescriptor"));
  keychainQueue = (dispatch_queue_s *)self->_keychainQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100039B90;
  v6[3] = &unk_1001C6538;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(keychainQueue, v6);
}

- (void)_removeCredentialWithDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end