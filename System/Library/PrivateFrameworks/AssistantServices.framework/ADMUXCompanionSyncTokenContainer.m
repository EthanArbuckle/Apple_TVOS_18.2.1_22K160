@interface ADMUXCompanionSyncTokenContainer
+ (BOOL)supportsSecureCoding;
+ (id)sharedInstance;
- (ADMUXCompanionSyncTokenContainer)init;
- (ADMUXCompanionSyncTokenContainer)initWithCoder:(id)a3;
- (BOOL)_loadContentsOfFileIfExists;
- (BOOL)_openFileAtPath:(id)a3 withFlags:(int)a4;
- (NSMutableDictionary)aceHostPrimeTokens;
- (NSMutableDictionary)aceHostSyncTokens;
- (id)getSyncTokenForAceHost:(id)a3;
- (id)primeTokenWrapperForAceHost:(id)a3;
- (void)_cleanUpPostFileOperationErrors;
- (void)_deviceUnlockedPostBoot:(id)a3;
- (void)_handleAccountCreatedNotification:(id)a3;
- (void)_loadContentsOfFileOnNotification;
- (void)_removeFilePostAccountRemoval:(id)a3;
- (void)_syncTokens;
- (void)_writeTokensToFile;
- (void)encodeWithCoder:(id)a3;
- (void)handleMuxTokenExchangeMessage:(id)a3 fromPeer:(id)a4 completion:(id)a5;
- (void)putSyncToken:(id)a3 forAceHost:(id)a4;
- (void)setAceHostPrimeTokens:(id)a3;
- (void)setAceHostSyncTokens:(id)a3;
- (void)setPrimeToken:(id)a3 forAceHost:(id)a4;
@end

@implementation ADMUXCompanionSyncTokenContainer

- (ADMUXCompanionSyncTokenContainer)init
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___ADMUXCompanionSyncTokenContainer;
  v2 = -[ADMUXCompanionSyncTokenContainer init](&v22, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("ADMUXCompanionSyncTokenContainerFileOperationQueue", v4);

    fileOperationQueue = v2->_fileOperationQueue;
    v2->_fileOperationQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    aceHostSyncTokens = v2->_aceHostSyncTokens;
    v2->_aceHostSyncTokens = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    aceHostPrimeTokens = v2->_aceHostPrimeTokens;
    v2->_aceHostPrimeTokens = v9;

    v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[ADMUXCompanionSyncTokenContainer init]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s Registering for first unlock notification",  buf,  0xCu);
    }

    v2->_deviceUnlockedAtleastOnce = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:v2 selector:"_deviceUnlockedPostBoot:" name:@"ADFirstUnlockNotification" object:0];

    v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[ADMUXCompanionSyncTokenContainer init]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s Registering for account removal notification",  buf,  0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v14 addObserver:v2 selector:"_removeFilePostAccountRemoval:" name:@"AssistantAccountRemoved" object:0];

    v15 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[ADMUXCompanionSyncTokenContainer init]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%s Registering for account creation notification",  buf,  0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v16 addObserver:v2 selector:"_handleAccountCreatedNotification:" name:@"AssistantAccountCreated" object:0];

    v17 = (dispatch_queue_s *)v2->_fileOperationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10025B7B0;
    block[3] = &unk_1004FD940;
    v18 = v2;
    v21 = v18;
    dispatch_sync(v17, block);
    v18->_tokenLock._os_unfair_lock_opaque = 0;
  }

  return v2;
}

- (void)_handleAccountCreatedNotification:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences", a3));
  unsigned int v5 = [v4 assistantIsEnabled];

  v6 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v7 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      int v8 = 136315138;
      v9 = "-[ADMUXCompanionSyncTokenContainer _handleAccountCreatedNotification:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s Handling file load on account creation",  (uint8_t *)&v8,  0xCu);
    }

    -[ADMUXCompanionSyncTokenContainer _loadContentsOfFileOnNotification](self, "_loadContentsOfFileOnNotification");
  }

  else if (v7)
  {
    int v8 = 136315138;
    v9 = "-[ADMUXCompanionSyncTokenContainer _handleAccountCreatedNotification:]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s Assistant hasn't been enabled",  (uint8_t *)&v8,  0xCu);
  }

- (void)_removeFilePostAccountRemoval:(id)a3
{
  fileOperationQueue = (dispatch_queue_s *)self->_fileOperationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10025B598;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(fileOperationQueue, block);
}

- (void)_deviceUnlockedPostBoot:(id)a3
{
  v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    v6 = "-[ADMUXCompanionSyncTokenContainer _deviceUnlockedPostBoot:]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "%s Received notification about device unlock post boot",  (uint8_t *)&v5,  0xCu);
  }

  -[ADMUXCompanionSyncTokenContainer _loadContentsOfFileOnNotification](self, "_loadContentsOfFileOnNotification");
}

- (void)_loadContentsOfFileOnNotification
{
  fileOperationQueue = (dispatch_queue_s *)self->_fileOperationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10025B590;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(fileOperationQueue, block);
}

- (BOOL)_loadContentsOfFileIfExists
{
  if (!self->_fileHandle)
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 URLsForDirectory:5 inDomains:1]);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);

    int v8 = (NSString *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathComponent:@"Assistant" isDirectory:1]);
    id v35 = 0LL;
    [v5 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v35];
    id v9 = v35;
    if (v9)
    {
      v10 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v37 = "-[ADMUXCompanionSyncTokenContainer _loadContentsOfFileIfExists]";
        __int16 v38 = 2112;
        v39 = v8;
        __int16 v40 = 2112;
        id v41 = v9;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Failed to create directory at path=%@, error=%@",  buf,  0x20u);
      }

      BOOL v3 = 0;
      v11 = v8;
    }

    else
    {
      v11 = (NSString *)objc_claimAutoreleasedReturnValue( -[NSString URLByAppendingPathComponent:]( v8,  "URLByAppendingPathComponent:",  @"ADMUXSyncTokensFile"));

      v12 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString path](v11, "path"));
      filePath = self->_filePath;
      self->_filePath = v12;

      id v14 = [v5 fileExistsAtPath:self->_filePath];
      int v15 = (int)v14;
      if ((_DWORD)v14) {
        uint64_t v16 = 2LL;
      }
      else {
        uint64_t v16 = 2562LL;
      }
      self->_deviceUnlockedAtleastOnce = AFHasUnlockedSinceBoot(v14);
      v17 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "-[ADMUXCompanionSyncTokenContainer _loadContentsOfFileIfExists]";
        __int16 v38 = 1024;
        LODWORD(v39) = v15;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%s ADMUXSyncTokensFile fileExists?=%d",  buf,  0x12u);
      }

      unsigned int v18 = -[ADMUXCompanionSyncTokenContainer _openFileAtPath:withFlags:]( self,  "_openFileAtPath:withFlags:",  self->_filePath,  v16);
      if ((v18 & v15) == 1)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileHandle availableData](self->_fileHandle, "availableData"));
        if ([v19 length])
        {
          id v34 = 0LL;
          id v20 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___ADMUXCompanionSyncTokenContainer),  v19,  &v34);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          id v22 = v34;
          v23 = (void *)AFSiriLogContextDaemon;
          if (v22)
          {
            v24 = v22;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              v31 = self->_filePath;
              v32 = v23;
              v33 = (void *)objc_claimAutoreleasedReturnValue([v24 description]);
              *(_DWORD *)buf = 136315650;
              v37 = "-[ADMUXCompanionSyncTokenContainer _loadContentsOfFileIfExists]";
              __int16 v38 = 2112;
              v39 = v31;
              __int16 v40 = 2112;
              id v41 = v33;
              _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "%s Failed to load data from file =%@ with error=%@",  buf,  0x20u);
            }

            BOOL v3 = 0;
            goto LABEL_27;
          }

          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v37 = "-[ADMUXCompanionSyncTokenContainer _loadContentsOfFileIfExists]";
            _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v23,  OS_LOG_TYPE_DEBUG,  "%s Extracting primeTokens and syncTokens per ace host from file",  buf,  0xCu);
          }

          v26 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v21 aceHostPrimeTokens]);
          aceHostPrimeTokens = self->_aceHostPrimeTokens;
          self->_aceHostPrimeTokens = v26;

          v28 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v21 aceHostSyncTokens]);
          aceHostSyncTokens = self->_aceHostSyncTokens;
          self->_aceHostSyncTokens = v28;
        }

        else
        {
          v25 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v37 = "-[ADMUXCompanionSyncTokenContainer _loadContentsOfFileIfExists]";
            _os_log_debug_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "%s ADMUXSyncTokensFile is empty",  buf,  0xCu);
          }
        }

        BOOL v3 = 1;
      }

      else
      {
        BOOL v3 = v18;
      }
    }

- (BOOL)_openFileAtPath:(id)a3 withFlags:(int)a4
{
  uint64_t v5 = open_dprotected_np((const char *)[a3 UTF8String], a4, 3, 0, 384);
  if ((_DWORD)v5 == -1)
  {
    int v8 = __error();
    id v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v11 = *v8;
      filePath = self->_filePath;
      *(_DWORD *)buf = 136315650;
      id v14 = "-[ADMUXCompanionSyncTokenContainer _openFileAtPath:withFlags:]";
      __int16 v15 = 2112;
      uint64_t v16 = filePath;
      __int16 v17 = 1024;
      int v18 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Failed to open file at path=%@, errno=%d",  buf,  0x1Cu);
    }
  }

  else
  {
    v6 = -[NSFileHandle initWithFileDescriptor:closeOnDealloc:]( objc_alloc(&OBJC_CLASS___NSFileHandle),  "initWithFileDescriptor:closeOnDealloc:",  v5,  1LL);
    fileHandle = self->_fileHandle;
    self->_fileHandle = v6;
  }

  return (_DWORD)v5 != -1;
}

- (void)encodeWithCoder:(id)a3
{
  aceHostSyncTokens = self->_aceHostSyncTokens;
  id v5 = a3;
  [v5 encodeObject:aceHostSyncTokens forKey:@"aceHostSyncTokens"];
  [v5 encodeObject:self->_aceHostPrimeTokens forKey:@"aceHostPrimeTokens"];
}

- (ADMUXCompanionSyncTokenContainer)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
  BOOL v7 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v5,  v6,  objc_opt_class(&OBJC_CLASS___ADPrimeTokenWrapper),  0LL);
  int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v8 forKey:@"aceHostPrimeTokens"]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v8 forKey:@"aceHostSyncTokens"]);

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ADMUXCompanionSyncTokenContainer;
  int v11 = -[ADMUXCompanionSyncTokenContainer init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_aceHostPrimeTokens, v9);
    objc_storeStrong((id *)&v12->_aceHostSyncTokens, v10);
  }

  return v12;
}

- (void)_syncTokens
{
  fileOperationQueue = (dispatch_queue_s *)self->_fileOperationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10025B588;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(fileOperationQueue, block);
}

- (void)_writeTokensToFile
{
  id v20 = 0LL;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  self,  1LL,  &v20));
  id v4 = v20;
  if (v4)
  {
    uint64_t v5 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v12 = v5;
      v13 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
      *(_DWORD *)buf = 136315394;
      id v22 = "-[ADMUXCompanionSyncTokenContainer _writeTokensToFile]";
      __int16 v23 = 2112;
      v24 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Failed to archive token container with error=%@",  buf,  0x16u);
    }
  }

  fileHandle = self->_fileHandle;
  id v19 = 0LL;
  -[NSFileHandle writeData:error:](fileHandle, "writeData:error:", v3, &v19);
  id v7 = v19;
  if (v7)
  {
    int v8 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      objc_super v14 = v8;
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
      *(_DWORD *)buf = 136315394;
      id v22 = "-[ADMUXCompanionSyncTokenContainer _writeTokensToFile]";
      __int16 v23 = 2112;
      v24 = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Failed to write data to disk %@",  buf,  0x16u);
    }

    -[ADMUXCompanionSyncTokenContainer _cleanUpPostFileOperationErrors](self, "_cleanUpPostFileOperationErrors");
  }

  else
  {
    id v9 = self->_fileHandle;
    id v18 = 0LL;
    -[NSFileHandle synchronizeAndReturnError:](v9, "synchronizeAndReturnError:", &v18);
    id v10 = v18;
    int v11 = (void *)AFSiriLogContextDaemon;
    if (v10)
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = v11;
        __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v10 description]);
        *(_DWORD *)buf = 136315394;
        id v22 = "-[ADMUXCompanionSyncTokenContainer _writeTokensToFile]";
        __int16 v23 = 2112;
        v24 = v17;
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Failed to synchronize file to the disk due to %@",  buf,  0x16u);
      }

      -[ADMUXCompanionSyncTokenContainer _cleanUpPostFileOperationErrors](self, "_cleanUpPostFileOperationErrors");
    }

    else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v22 = "-[ADMUXCompanionSyncTokenContainer _writeTokensToFile]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEBUG,  "%s Writing primeToken and sync tokens per ace host to file",  buf,  0xCu);
    }
  }
}

- (void)_cleanUpPostFileOperationErrors
{
}

- (void)putSyncToken:(id)a3 forAceHost:(id)a4
{
  p_tokenLock = &self->_tokenLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_tokenLock);
  -[NSMutableDictionary setObject:forKey:](self->_aceHostSyncTokens, "setObject:forKey:", v8, v7);

  os_unfair_lock_unlock(p_tokenLock);
  -[ADMUXCompanionSyncTokenContainer _syncTokens](self, "_syncTokens");
}

- (id)getSyncTokenForAceHost:(id)a3
{
  p_tokenLock = &self->_tokenLock;
  id v5 = a3;
  os_unfair_lock_lock(p_tokenLock);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_aceHostSyncTokens, "objectForKey:", v5));

  os_unfair_lock_unlock(p_tokenLock);
  return v6;
}

- (id)primeTokenWrapperForAceHost:(id)a3
{
  p_tokenLock = &self->_tokenLock;
  id v5 = a3;
  os_unfair_lock_lock(p_tokenLock);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_aceHostPrimeTokens, "objectForKey:", v5));

  os_unfair_lock_unlock(p_tokenLock);
  return v6;
}

- (void)setPrimeToken:(id)a3 forAceHost:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    os_unfair_lock_lock(&self->_tokenLock);
    id v8 = objc_alloc(&OBJC_CLASS___ADPrimeTokenWrapper);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v9 timeIntervalSince1970];
    id v10 = -[ADPrimeTokenWrapper init:timeStamp:](v8, "init:timeStamp:", v6);

    -[NSMutableDictionary setObject:forKey:](self->_aceHostPrimeTokens, "setObject:forKey:", v10, v7);
    os_unfair_lock_unlock(&self->_tokenLock);
  }

  else
  {
    int v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      v13 = "-[ADMUXCompanionSyncTokenContainer setPrimeToken:forAceHost:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Prime token is nil",  (uint8_t *)&v12,  0xCu);
    }
  }
}

- (void)handleMuxTokenExchangeMessage:(id)a3 fromPeer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  if ((AFIsMultiUserCompanion(v10) & 1) != 0)
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"SiriMuxTokenHost"]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ADMUXCompanionSyncTokenContainer getSyncTokenForAceHost:](self, "getSyncTokenForAceHost:", v11));
    if (v12)
    {
      v13 = (void *)v12;
    }

    else
    {
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADAccount activeAccount](&OBJC_CLASS___ADAccount, "activeAccount"));
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 aceHostCluster]);

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[ADMUXCompanionSyncTokenContainer sharedInstance]( &OBJC_CLASS___ADMUXCompanionSyncTokenContainer,  "sharedInstance"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v16 getSyncTokenForAceHost:v15]);

      int v11 = (void *)v15;
    }

    if (self->_deviceUnlockedAtleastOnce)
    {
      if (v13 && v11)
      {
        __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v9 assistantIdentifier]);
        id v18 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v27 = "-[ADMUXCompanionSyncTokenContainer handleMuxTokenExchangeMessage:fromPeer:completion:]";
          __int16 v28 = 2112;
          v29 = v11;
          __int16 v30 = 2112;
          v31 = v17;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "%s Sending token for aceHost: %@ to peer with assistantID: %@",  buf,  0x20u);
        }

        v25[0] = v13;
        v25[1] = v11;
        id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate date]( &OBJC_CLASS___NSDate,  "date",  @"SiriMuxToken",  @"SiriMuxTokenHost",  @"SiriMuxEventTimestamp"));
        [v19 timeIntervalSince1970];
        id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        v24[3] = @"SiriMuxSyncTokenTransferReason";
        v25[2] = v20;
        v25[3] = &off_1005136F0;
        v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  4LL));

        v10[2](v10, v21, 0LL);
        goto LABEL_15;
      }

      uint64_t v22 = 6016LL;
    }

    else
    {
      uint64_t v22 = 6017LL;
    }

    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", v22));
    ((void (**)(id, void *, void *))v10)[2](v10, 0LL, v23);

LABEL_15:
    goto LABEL_16;
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 1010LL));
  ((void (**)(id, void *, void *))v10)[2](v10, 0LL, v11);
LABEL_16:
}

- (NSMutableDictionary)aceHostSyncTokens
{
  return self->_aceHostSyncTokens;
}

- (void)setAceHostSyncTokens:(id)a3
{
}

- (NSMutableDictionary)aceHostPrimeTokens
{
  return self->_aceHostPrimeTokens;
}

- (void)setAceHostPrimeTokens:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_100578290 != -1) {
    dispatch_once(&qword_100578290, &stru_1004F7B50);
  }
  return (id)qword_100578298;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end