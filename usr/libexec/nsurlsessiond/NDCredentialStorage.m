@interface NDCredentialStorage
- (NDCredentialStorage)initWithDelegate:(id)a3 forBundleID:(id)a4;
- (NDCredentialStorageDelegate)delegate;
- (NSString)bundleID;
- (id)allCredentials;
- (id)credentialsForProtectionSpace:(id)a3;
- (id)defaultCredentialForProtectionSpace:(id)a3;
- (void)populateWithInitialCredentials;
- (void)removeCredential:(id)a3 forProtectionSpace:(id)a4;
- (void)reset;
- (void)setBundleID:(id)a3;
- (void)setCredential:(id)a3 forProtectionSpace:(id)a4;
- (void)setDefaultCredential:(id)a3 forProtectionSpace:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation NDCredentialStorage

- (NDCredentialStorage)initWithDelegate:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NDCredentialStorage;
  v8 = -[NDCredentialStorage init](&v21, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_bundleID, a4);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    cachedCredentials = v9->_cachedCredentials;
    v9->_cachedCredentials = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    cachedDefaultCredentialUsers = v9->_cachedDefaultCredentialUsers;
    v9->_cachedDefaultCredentialUsers = (NSMutableDictionary *)v12;

    dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);
    dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_UTILITY, 0);
    v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.nsurlsessiond.credential-storage-queue", v17);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v18;
  }

  return v9;
}

- (void)populateWithInitialCredentials
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained getClientProxy]);

  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100034358;
    v5[3] = &unk_100079530;
    v5[4] = self;
    objc_msgSend(v4, "credStorage_getInitialCredentialDictionariesWithReply:", v5);
  }
}

- (id)credentialsForProtectionSpace:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained getClientProxy]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 synchronousRemoteObjectProxyWithErrorHandler:&stru_100079570]);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100034164;
    v21[3] = &unk_100079598;
    v21[4] = self;
    id v22 = v4;
    objc_msgSend(v7, "credStorage_credentialsForProtectionSpace:reply:", v22, v21);
  }

  uint64_t v15 = 0LL;
  dispatch_queue_attr_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  dispatch_queue_t v18 = sub_100033B40;
  v19 = sub_100033B50;
  id v20 = 0LL;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100034200;
  block[3] = &unk_100079990;
  id v13 = v4;
  dispatch_queue_attr_t v14 = &v15;
  block[4] = self;
  id v9 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (id)allCredentials
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained getClientProxy]);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000795B8]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100033FB0;
    v16[3] = &unk_1000795E0;
    v16[4] = self;
    objc_msgSend(v5, "credStorage_allCredentialsWithReply:", v16);
  }

  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  id v13 = sub_100033B40;
  dispatch_queue_attr_t v14 = sub_100033B50;
  queue = self->_queue;
  id v15 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100034038;
  block[3] = &unk_100079608;
  block[4] = self;
  void block[5] = &v10;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)setCredential:(id)a3 forProtectionSpace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v12 = (id)objc_claimAutoreleasedReturnValue([WeakRetained getClientProxy]);

  if (v12) {
    objc_msgSend(v12, "credStorage_setCredential:forProtectionSpace:", v6, v7);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100033EB4;
  block[3] = &unk_100079968;
  block[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v10 = v6;
  id v11 = v7;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)removeCredential:(id)a3 forProtectionSpace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v12 = (id)objc_claimAutoreleasedReturnValue([WeakRetained getClientProxy]);

  if (v12) {
    objc_msgSend(v12, "credStorage_setCredential:forProtectionSpace:", v6, v7);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100033E30;
  block[3] = &unk_100079968;
  block[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v10 = v6;
  id v11 = v7;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (id)defaultCredentialForProtectionSpace:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained getClientProxy]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 synchronousRemoteObjectProxyWithErrorHandler:&stru_100079628]);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100033AA4;
    v21[3] = &unk_100079650;
    v21[4] = self;
    id v22 = v4;
    objc_msgSend(v7, "credStorage_defaultCredentialForProtectionSpace:reply:", v22, v21);
  }

  uint64_t v15 = 0LL;
  dispatch_queue_attr_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  dispatch_queue_t v18 = sub_100033B40;
  v19 = sub_100033B50;
  id v20 = 0LL;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100033B58;
  block[3] = &unk_100079990;
  block[4] = self;
  id v13 = v4;
  id v14 = &v15;
  id v9 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (void)setDefaultCredential:(id)a3 forProtectionSpace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v12 = (id)objc_claimAutoreleasedReturnValue([WeakRetained getClientProxy]);

  if (v12) {
    objc_msgSend(v12, "credStorage_setDefaultCredential:forProtectionSpace:", v6, v7);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003394C;
  block[3] = &unk_100079968;
  block[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v10 = v6;
  id v11 = v7;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)reset
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003390C;
  block[3] = &unk_100079BE0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (NDCredentialStorageDelegate)delegate
{
  return (NDCredentialStorageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end