@interface IDSDMessageStoreMap
+ (id)sharedInstance;
- (IDSDMessageStoreMap)init;
- (NSArray)messageStores;
- (id)getOrCreateMessageStoreForDataProtectionClass:(unsigned int)a3;
- (void)dealloc;
@end

@implementation IDSDMessageStoreMap

+ (id)sharedInstance
{
  if (qword_1009C0AA8 != -1) {
    dispatch_once(&qword_1009C0AA8, &stru_100900890);
  }
  return (id)qword_1009C0AA0;
}

- (IDSDMessageStoreMap)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IDSDMessageStoreMap;
  v2 = -[IDSDMessageStoreMap init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_mutex, 0LL);
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    messageStores = v3->_messageStores;
    v3->_messageStores = v4;

    id v6 =  -[IDSDMessageStoreMap getOrCreateMessageStoreForDataProtectionClass:]( v3,  "getOrCreateMessageStoreForDataProtectionClass:",  1LL);
    id v7 =  -[IDSDMessageStoreMap getOrCreateMessageStoreForDataProtectionClass:]( v3,  "getOrCreateMessageStoreForDataProtectionClass:",  0LL);
    id v8 =  -[IDSDMessageStoreMap getOrCreateMessageStoreForDataProtectionClass:]( v3,  "getOrCreateMessageStoreForDataProtectionClass:",  2LL);
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSDMessageStoreMap;
  -[IDSDMessageStoreMap dealloc](&v3, "dealloc");
}

- (id)getOrCreateMessageStoreForDataProtectionClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  unsigned int v6 = [v5 supportsHandoff];

  uint64_t v8 = IDSDataProtectionClassStringFromDataProtectionClass(v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  pthread_mutex_lock(&self->_mutex);
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  unsigned __int8 v11 = [v10 isUnderFirstDataProtectionLock];

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  unsigned __int8 v13 = [v12 isUnderDataProtectionLock];

  v14 = (IDSDMessageStore *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_messageStores, "objectForKey:", v9));
  if (!v14)
  {
    char v15 = v13 ^ 1;
    if ((_DWORD)v3 != 1) {
      char v15 = 1;
    }
    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
    char v16 = v11 ^ 1;
    if ((_DWORD)v3 == 2) {
      char v16 = 1;
    }
    if ((v16 & 1) == 0)
    {
LABEL_12:
      pthread_mutex_unlock(&self->_mutex);
      v14 = 0LL;
      goto LABEL_13;
    }

    v14 = -[IDSDMessageStore initWithDataProtectionClass:]( objc_alloc(&OBJC_CLASS___IDSDMessageStore),  "initWithDataProtectionClass:",  v3);
    -[IDSDMessageStore _performInitialHousekeeping](v14, "_performInitialHousekeeping");
    -[NSMutableDictionary setObject:forKey:](self->_messageStores, "setObject:forKey:", v14, v9);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog dataProtectionClass](&OBJC_CLASS___IMRGLog, "dataProtectionClass"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      messageStores = self->_messageStores;
      int v19 = 138412290;
      v20 = messageStores;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Message store map %@", (uint8_t *)&v19, 0xCu);
    }
  }

  pthread_mutex_unlock(&self->_mutex);
LABEL_13:

  return v14;
}

- (NSArray)messageStores
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_messageStores, "allValues"));
  pthread_mutex_unlock(p_mutex);
  return (NSArray *)v4;
}

- (void).cxx_destruct
{
}

@end