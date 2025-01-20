@interface SDActivityEncryptionManager
+ (id)sharedEncryptionManager;
- (BOOL)deleteAllEncryptionAndDecryptionKeys;
- (BOOL)saveDecryptionKeyDataRepresentation:(id)a3 forDeviceIdentifier:(id)a4;
- (BOOL)saveEncryptionKeyDataRepresentation:(id)a3;
- (BOOL)saveKeyDataRepresentation:(id)a3 withBaseDict:(id)a4;
- (NSData)dataRepresentationForCurrentEncryptionKey;
- (NSString)state;
- (SDActivityEncryptionKey)encryptionKey;
- (SDActivityEncryptionManager)init;
- (id)allKeys;
- (id)baseDict;
- (id)baseDictDecryptionKeyForDeviceIdentifier:(id)a3;
- (id)baseDictEncryptionKey;
- (id)baseDictWrappingKey;
- (id)cachedDecryptionKeyForDeviceIdentifier:(id)a3;
- (id)decryptionKeyForDeviceIdentifier:(id)a3;
- (id)loadDecryptionKeyDataRepresentationForDeviceIdentifier:(id)a3;
- (id)loadEncryptionKeyDataRepresentation;
- (id)loadKeyDataRepresentationWithBaseDict:(id)a3;
- (id)loadWrappingKeyData;
- (id)newDecryptionKeyFromDataRepresentation:(id)a3;
- (id)unwrappedDataRepresentationForKey:(id)a3;
- (void)addObservers;
- (void)bumpEncryptionKeyCounterValue;
- (void)dealloc;
- (void)generateNewEncryptionKey;
- (void)getTagAndCounterWhileEncryptingBytesInPlace:(unsigned __int8)a3[10] forAdvertisementWithVersion:(unsigned __int8)a4 handler:(id)a5;
- (void)removeObservers;
- (void)setDecryptionKey:(id)a3 forDeviceIdentifier:(id)a4;
@end

@implementation SDActivityEncryptionManager

+ (id)sharedEncryptionManager
{
  if (qword_100657040 != -1) {
    dispatch_once(&qword_100657040, &stru_1005CE128);
  }
  return (id)qword_100657038;
}

- (SDActivityEncryptionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SDActivityEncryptionManager;
  v2 = -[SDActivityEncryptionManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    deviceIdentifierToDecryptionKey = v2->_deviceIdentifierToDecryptionKey;
    v2->_deviceIdentifierToDecryptionKey = v3;

    v2->_shouldRefreshWrappingKey = 1;
    -[SDActivityEncryptionManager addObservers](v2, "addObservers");
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDActivityEncryptionManager;
  -[SDActivityEncryptionManager dealloc](&v3, "dealloc");
}

- (NSString)state
{
  id v26 = 0LL;
  objc_super v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&v26, "%@\n", v5);
  id v6 = v26;

  id v25 = v6;
  NSAppendPrintF(&v25, "-------------\n");
  id v7 = v25;

  id v24 = v7;
  v8 = @"YES";
  if (self->_wrappingKey) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  if (!self->_shouldRefreshWrappingKey) {
    v8 = @"NO";
  }
  NSAppendPrintF(&v24, "Has Wrapping Key: %@, Should Refresh: %@\n", v9, v8);
  id v10 = v24;

  id v23 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager allKeys](self, "allKeys"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"@unionOfObjects.%@",  kSecAttrLabel));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForKeyPath:v12]);
  uint64_t v14 = SFCompactStringFromCollection(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  NSAppendPrintF(&v23, "Keychain Items: %@\n", v15);
  id v16 = v23;

  id v22 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager encryptionKey](self, "encryptionKey"));
  NSAppendPrintF(&v22, "Encryption Key: %@\n", v17);
  id v18 = v22;

  id v21 = v18;
  NSAppendPrintF(&v21, "Device Identifier To Decryption Key: %@\n", self->_deviceIdentifierToDecryptionKey);
  id v19 = v21;

  return (NSString *)v19;
}

- (void)addObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"resetStateRequested:" name:@"com.apple.sharingd.ResetState" object:0];
}

- (void)removeObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (void)generateNewEncryptionKey
{
  id v3 = +[SDActivityEncryptionKey newEncryptionKey](&OBJC_CLASS___SDActivityEncryptionKey, "newEncryptionKey");
  p_encryptionKey = (uint64_t *)&self->_encryptionKey;
  encryptionKey = self->_encryptionKey;
  self->_encryptionKey = v3;

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[SDActivityEncryptionManager unwrappedDataRepresentationForKey:]( self,  "unwrappedDataRepresentationForKey:",  self->_encryptionKey));
  -[SDActivityEncryptionManager saveEncryptionKeyDataRepresentation:](self, "saveEncryptionKeyDataRepresentation:", v6);

  uint64_t v9 = handoff_log(v7, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000E8200(p_encryptionKey, v10);
  }
}

- (SDActivityEncryptionKey)encryptionKey
{
  encryptionKey = self->_encryptionKey;
  if (!encryptionKey)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( -[SDActivityEncryptionManager loadEncryptionKeyDataRepresentation]( self,  "loadEncryptionKeyDataRepresentation"));
    if (v4)
    {
      id v36 = 0LL;
      uint64_t v37 = 0LL;
      v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v4,  1LL,  &v37,  &v36));
      id v6 = v36;
      uint64_t v8 = v6;
      if (v5)
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"lastUsedCounter"]);
        unsigned __int16 v10 = (unsigned __int16)[v9 integerValue];

        int v13 = v10;
        if (v10 > 0xFF90u)
        {
          uint64_t v34 = handoff_log(v11, v12);
          id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Did not load advertising encryption key from keychain as the bumped last used counter exceeds max value",  buf,  2u);
          }
        }

        else
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  v10 + 110));
          [v5 setObject:v14 forKeyedSubscript:@"lastUsedCounter"];

          v15 = -[SDActivityKey initWithDictRepresentation:]( objc_alloc(&OBJC_CLASS___SDActivityEncryptionKey),  "initWithDictRepresentation:",  v5);
          id v16 = self->_encryptionKey;
          self->_encryptionKey = v15;

          v17 = (void *)objc_claimAutoreleasedReturnValue( -[SDActivityEncryptionManager unwrappedDataRepresentationForKey:]( self,  "unwrappedDataRepresentationForKey:",  self->_encryptionKey));
          -[SDActivityEncryptionManager saveEncryptionKeyDataRepresentation:]( self,  "saveEncryptionKeyDataRepresentation:",  v17);

          uint64_t v20 = handoff_log(v18, v19);
          id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            id v23 = (objc_class *)objc_opt_class(self, v22);
            id v24 = NSStringFromClass(v23);
            id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
            id v26 = self->_encryptionKey;
            *(_DWORD *)buf = 138413058;
            v39 = v25;
            __int16 v40 = 1024;
            int v41 = v13;
            __int16 v42 = 1024;
            int v43 = 110;
            __int16 v44 = 2112;
            v45 = v26;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "%@: Loaded advertising encryption key and bumped last used counter from %d by %d, then persisted key to keychain %@",  buf,  0x22u);
          }
        }
      }

      else
      {
        uint64_t v27 = handoff_log(v6, v7);
        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_1000E8274((uint64_t)v8, v21, v28, v29, v30, v31, v32, v33);
        }
      }
    }

    if (!self->_encryptionKey) {
      -[SDActivityEncryptionManager generateNewEncryptionKey](self, "generateNewEncryptionKey");
    }

    encryptionKey = self->_encryptionKey;
  }

  return encryptionKey;
}

- (void)bumpEncryptionKeyCounterValue
{
  uint32_t v3 = arc4random();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager encryptionKey](self, "encryptionKey"));
  uint64_t v5 = v3 + [v4 lastUsedCounter] - 31 * (v3 / 0x1F) + 20;

  uint64_t v8 = handoff_log(v6, v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v5 > 0xFFFE)
  {
    if (v10)
    {
      LOWORD(v13) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Generating new advertising encryption key as the bumped value of the old one exceeds max value",  (uint8_t *)&v13,  2u);
    }

    -[SDActivityEncryptionManager generateNewEncryptionKey](self, "generateNewEncryptionKey");
  }

  else
  {
    if (v10)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager encryptionKey](self, "encryptionKey"));
      int v13 = 134218240;
      uint64_t v14 = [v11 lastUsedCounter];
      __int16 v15 = 2048;
      uint64_t v16 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Bumped advertising encryption key counter value from %ld to %ld",  (uint8_t *)&v13,  0x16u);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager encryptionKey](self, "encryptionKey"));
    [v12 setLastUsedCounter:(unsigned __int16)v5];
  }

- (void)getTagAndCounterWhileEncryptingBytesInPlace:(unsigned __int8)a3[10] forAdvertisementWithVersion:(unsigned __int8)a4 handler:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v8 = (void (**)(id, id, _WORD *, id))a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager encryptionKey](self, "encryptionKey"));
  [v9 prepareForNewEncryptionRequest];

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager encryptionKey](self, "encryptionKey"));
  unsigned __int8 v11 = [v10 isValidKey];

  if ((v11 & 1) == 0)
  {
    uint64_t v14 = handoff_log(v12, v13);
    __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000E8380(self, v15);
    }

    -[SDActivityEncryptionManager generateNewEncryptionKey](self, "generateNewEncryptionKey");
  }

  __int16 v27 = 0;
  uint64_t v16 = objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager encryptionKey](self, "encryptionKey"));
  id v17 = [(id)v16 getTagWhileEncryptingBytesInPlace:a3 counterValue:&v27 forAdvertisementWithVersion:v5];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager encryptionKey](self, "encryptionKey"));
  LODWORD(v16) = [v18 lastUsedCounter] + 10;

  HIDWORD(v19) = -1030792151 * v16;
  LODWORD(v19) = -1030792151 * v16;
  if ((v19 >> 2) <= 0x28F5C28)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager encryptionKey](self, "encryptionKey"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue( -[SDActivityEncryptionManager unwrappedDataRepresentationForKey:]( self,  "unwrappedDataRepresentationForKey:",  v20));
    -[SDActivityEncryptionManager saveEncryptionKeyDataRepresentation:]( self,  "saveEncryptionKeyDataRepresentation:",  v21);

    uint64_t v24 = handoff_log(v22, v23);
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_1000E82D8(self, v25);
    }
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager encryptionKey](self, "encryptionKey"));
  v8[2](v8, v17, &v27, [v26 lastUsedCounter]);
}

- (void)setDecryptionKey:(id)a3 forDeviceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_deviceIdentifierToDecryptionKey,  "objectForKeyedSubscript:",  v7));
    if (v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 dateCreated]);
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v8 dateCreated]);
      [v9 timeIntervalSinceDate:v10];
      uint64_t v12 = (uint64_t)(v11 / 3600.0);
    }

    else
    {
      uint64_t v12 = 0LL;
    }

    sub_100085798( v8 != 0,  [v8 lastUsedCounter],  objc_msgSend(v6, "lastUsedCounter"),  v12);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_deviceIdentifierToDecryptionKey,  "setObject:forKeyedSubscript:",  v6,  v7);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[SDActivityEncryptionManager unwrappedDataRepresentationForKey:]( self,  "unwrappedDataRepresentationForKey:",  v6));
    unsigned int v14 = -[SDActivityEncryptionManager saveDecryptionKeyDataRepresentation:forDeviceIdentifier:]( self,  "saveDecryptionKeyDataRepresentation:forDeviceIdentifier:",  v13,  v7);

    uint64_t v17 = handoff_log(v15, v16);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    unint64_t v19 = v18;
    if (v14)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_1000E8428();
      }
    }

    else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      sub_1000E8488();
    }
  }
}

- (id)decryptionKeyForDeviceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_deviceIdentifierToDecryptionKey,  "objectForKeyedSubscript:",  v4));
  if (!v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[SDActivityEncryptionManager loadDecryptionKeyDataRepresentationForDeviceIdentifier:]( self,  "loadDecryptionKeyDataRepresentationForDeviceIdentifier:",  v4));
    id v5 = -[SDActivityEncryptionManager newDecryptionKeyFromDataRepresentation:]( self,  "newDecryptionKeyFromDataRepresentation:",  v6);

    if (v5)
    {
      uint64_t v9 = handoff_log(v7, v8);
      BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_1000E84E8();
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_deviceIdentifierToDecryptionKey,  "setObject:forKeyedSubscript:",  v5,  v4);
    }
  }

  return v5;
}

- (id)cachedDecryptionKeyForDeviceIdentifier:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:]( self->_deviceIdentifierToDecryptionKey,  "objectForKeyedSubscript:",  a3);
}

- (NSData)dataRepresentationForCurrentEncryptionKey
{
  uint32_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager encryptionKey](self, "encryptionKey"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dictRepresentation]);
  id v5 = [v4 mutableCopy];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"keyData"]);
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager loadWrappingKeyData](self, "loadWrappingKeyData"));
    id v8 = [v7 length];
    uint64_t v10 = handoff_log(v8, v9);
    double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Converting key to wrapped key", buf, 2u);
      }

      uint64_t v13 = (void *)ccaes_ecb_encrypt_mode();
      size_t v14 = (*v13 + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
      uint64_t v15 = (char *)&v29 - v14;
      bzero((char *)&v29 - v14, v14);
      ccecb_init(v13, v15, [v7 length], objc_msgSend(v7, "bytes"));
      uint64_t v16 = ccwrap_wrapped_size([v6 length]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", v16));
      [v17 setLength:v16];
      *(void *)buf = v16;
      id v18 = [v6 length];
      id v19 = [v6 bytes];
      id v20 = v17;
      ccwrap_auth_encrypt(v13, v15, v18, v19, buf, [v20 mutableBytes]);
      id v21 = [v20 copy];
      [v5 setObject:v21 forKeyedSubscript:@"keyData"];

      [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"isWrappedKey"];
    }

    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Not wrapping key as wrapping key is unavailable",  buf,  2u);
      }

      [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:@"isWrappedKey"];
    }

    id v30 = 0LL;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v5,  200LL,  0LL,  &v30));
    id v23 = v30;
    id v25 = v23;
    if (!v22)
    {
      uint64_t v26 = handoff_log(v23, v24);
      __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1000E8548();
      }
    }
  }

  else
  {
    uint64_t v22 = 0LL;
  }

  return (NSData *)v22;
}

- (id)unwrappedDataRepresentationForKey:(id)a3
{
  uint32_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 dictRepresentation]);
  id v4 = [v3 mutableCopy];

  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"isWrappedKey"];
  id v12 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v4,  200LL,  0LL,  &v12));
  id v6 = v12;
  id v8 = v6;
  if (!v5)
  {
    uint64_t v9 = handoff_log(v6, v7);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000E8548();
    }
  }

  return v5;
}

- (id)newDecryptionKeyFromDataRepresentation:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v56 = 0LL;
    uint64_t v57 = 0LL;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v3,  1LL,  &v57,  &v56));
    id v5 = v56;
    uint64_t v7 = v5;
    if (v4)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"isWrappedKey"]);
      unsigned int v9 = [v8 BOOLValue];

      if (!v9)
      {
LABEL_9:
        id v30 = -[SDActivityKey initWithDictRepresentation:]( objc_alloc(&OBJC_CLASS___SDActivityDecryptionKey),  "initWithDictRepresentation:",  v4);
LABEL_20:

        goto LABEL_21;
      }

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"keyData"]);
      if ([v10 length])
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SDActivityEncryptionManager sharedEncryptionManager]( &OBJC_CLASS___SDActivityEncryptionManager,  "sharedEncryptionManager"));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 loadWrappingKeyData]);

        id v14 = [v13 length];
        uint64_t v16 = handoff_log(v14, v15);
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        id v18 = v17;
        if (v14)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Converting wrapped key to key",  buf,  2u);
          }

          id v19 = (void *)ccaes_ecb_decrypt_mode();
          v54[1] = v54;
          size_t v20 = (*v19 + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
          id v21 = (char *)v54 - v20;
          bzero((char *)v54 - v20, v20);
          id v22 = [v13 length];
          id v23 = v13;
          ccecb_init(v19, v21, v22, [v23 bytes]);
          uint64_t v24 = ccwrap_unwrapped_size([v10 length]);
          id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", v24));
          [v25 setLength:v24];
          *(void *)buf = v24;
          id v26 = [v10 length];
          id v27 = v10;
          id v28 = [v27 bytes];
          id v29 = v25;
          ccwrap_auth_decrypt(v19, v21, v26, v28, buf, [v29 mutableBytes]);
          [v4 setObject:v29 forKeyedSubscript:@"keyData"];

          goto LABEL_9;
        }

        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_1000E863C(v18, v46, v47, v48, v49, v50, v51, v52);
        }
      }

      else
      {
        uint64_t v38 = handoff_log(0LL, v11);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
          sub_1000E860C((os_log_s *)v13, v39, v40, v41, v42, v43, v44, v45);
        }
      }
    }

    else
    {
      uint64_t v31 = handoff_log(v5, v6);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
        sub_1000E85A8((uint64_t)v7, (os_log_s *)v10, v32, v33, v34, v35, v36, v37);
      }
    }

    id v30 = 0LL;
    goto LABEL_20;
  }

  id v30 = 0LL;
LABEL_21:

  return v30;
}

- (BOOL)deleteAllEncryptionAndDecryptionKeys
{
  v2 = self;
  self->_shouldRefreshWrappingKey = 1;
  if (self->_wrappingKey
    || self->_encryptionKey
    || (self = (SDActivityEncryptionManager *)-[NSMutableDictionary count]( self->_deviceIdentifierToDecryptionKey,  "count")) != 0LL)
  {
    uint64_t v3 = handoff_log(self, a2);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Successfully cleared in-memory key caches",  v17,  2u);
    }

    wrappingKey = v2->_wrappingKey;
    v2->_wrappingKey = 0LL;

    encryptionKey = v2->_encryptionKey;
    v2->_encryptionKey = 0LL;

    -[NSMutableDictionary removeAllObjects](v2->_deviceIdentifierToDecryptionKey, "removeAllObjects");
  }

  OSStatus v7 = SecItemDelete((CFDictionaryRef)-[SDActivityEncryptionManager baseDictEncryptionKey](v2, "baseDictEncryptionKey"));
  uint64_t v8 = SecItemDelete((CFDictionaryRef)-[SDActivityEncryptionManager baseDictDecryptionKeyForDeviceIdentifier:]( v2,  "baseDictDecryptionKeyForDeviceIdentifier:",  0LL));
  if (v7) {
    BOOL v10 = v7 == -25300;
  }
  else {
    BOOL v10 = 1;
  }
  char v11 = v10;
  if ((_DWORD)v8) {
    BOOL v12 = (_DWORD)v8 == -25300;
  }
  else {
    BOOL v12 = 1;
  }
  uint64_t v13 = v12;
  uint64_t v14 = handoff_log(v8, v9);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_1000E866C(v11, v13, v15);
  }

  return v11 & v13;
}

- (id)allKeys
{
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager baseDict](self, "baseDict"));
  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnAttributes];
  [v4 setObject:kSecMatchLimitAll forKeyedSubscript:kSecMatchLimit];
  id v5 = [v4 mutableCopy];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager baseDictWrappingKey](self, "baseDictWrappingKey"));
  [v5 addEntriesFromDictionary:v6];

  CFTypeRef result = 0LL;
  uint64_t v7 = SecItemCopyMatching((CFDictionaryRef)v5, &result);
  if ((_DWORD)v7)
  {
    int v9 = v7;
    uint64_t v10 = handoff_log(v7, v8);
    char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "SecItemCopyMatching wrappingKeyQuery failed with error %d",  buf,  8u);
    }
  }

  else
  {
    -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", result);
    CFRelease(result);
  }

  id v12 = [v4 mutableCopy];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager baseDictEncryptionKey](self, "baseDictEncryptionKey"));
  [v12 addEntriesFromDictionary:v13];

  *(void *)buf = 0LL;
  uint64_t v14 = SecItemCopyMatching((CFDictionaryRef)v12, (CFTypeRef *)buf);
  if ((_DWORD)v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = handoff_log(v14, v15);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000E8760(v16, v18, v19, v20, v21, v22, v23, v24);
    }
  }

  else
  {
    -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", *(void *)buf);
    CFRelease(*(CFTypeRef *)buf);
  }

  id v25 = [v4 mutableCopy];
  id v26 = (void *)objc_claimAutoreleasedReturnValue( -[SDActivityEncryptionManager baseDictDecryptionKeyForDeviceIdentifier:]( self,  "baseDictDecryptionKeyForDeviceIdentifier:",  0LL));
  [v25 addEntriesFromDictionary:v26];

  CFTypeRef cf = 0LL;
  uint64_t v27 = SecItemCopyMatching((CFDictionaryRef)v25, &cf);
  if ((_DWORD)v27)
  {
    uint64_t v29 = v27;
    uint64_t v30 = handoff_log(v27, v28);
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_1000E86FC(v29, v31, v32, v33, v34, v35, v36, v37);
    }
  }

  else
  {
    id v46 = v12;
    id v47 = v5;
    uint64_t v48 = v4;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    uint64_t v38 = (id)cf;
    id v39 = [v38 countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v50;
      do
      {
        for (i = 0LL; i != v40; i = (char *)i + 1)
        {
          if (*(void *)v50 != v41) {
            objc_enumerationMutation(v38);
          }
          uint64_t v43 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:kSecAttrAccount]);
        }

        id v40 = [v38 countByEnumeratingWithState:&v49 objects:v55 count:16];
      }

      while (v40);
    }

    CFRelease(cf);
    id v5 = v47;
    id v4 = v48;
    id v12 = v46;
  }

  return v3;
}

- (id)loadWrappingKeyData
{
  if (self->_shouldRefreshWrappingKey)
  {
    self->_shouldRefreshWrappingKey = 0;
    p_wrappingKey = &self->_wrappingKey;
    wrappingKey = self->_wrappingKey;
    self->_wrappingKey = 0LL;

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager baseDictWrappingKey](self, "baseDictWrappingKey"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[SDActivityEncryptionManager loadKeyDataRepresentationWithBaseDict:]( self,  "loadKeyDataRepresentationWithBaseDict:",  v5));

    if ([v6 length] == (id)32)
    {
      objc_storeStrong((id *)&self->_wrappingKey, v6);
      uint64_t v9 = handoff_log(v7, v8);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = 0;
        char v11 = "Loaded wrapping key from keychain";
        id v12 = (uint8_t *)&v19;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
      }
    }

    else
    {
      uint64_t v13 = *p_wrappingKey;
      *p_wrappingKey = 0LL;

      uint64_t v16 = handoff_log(v14, v15);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v18 = 0;
        char v11 = "No wrapping key found in keychain";
        id v12 = (uint8_t *)&v18;
        goto LABEL_7;
      }
    }
  }

  return self->_wrappingKey;
}

- (id)loadKeyDataRepresentationWithBaseDict:(id)a3
{
  id v3 = a3;
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnData];
  CFTypeRef result = 0LL;
  uint64_t v4 = SecItemCopyMatching((CFDictionaryRef)v3, &result);

  if (!(_DWORD)v4) {
    return (id)(id)result;
  }
  uint64_t v7 = handoff_log(v5, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1000E87C4(v4, v8, v9, v10, v11, v12, v13, v14);
  }

  return 0LL;
}

- (BOOL)saveKeyDataRepresentation:(id)a3 withBaseDict:(id)a4
{
  id v5 = a4;
  CFStringRef v30 = kSecValueData;
  id v31 = a3;
  id v6 = a3;
  BOOL v7 = 1;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));

  id v9 = [v8 mutableCopy];
  [v9 setObject:kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly forKeyedSubscript:kSecAttrAccessible];
  id v10 = [v5 mutableCopy];
  [v10 addEntriesFromDictionary:v9];
  if (SecItemAdd((CFDictionaryRef)v10, 0LL))
  {
    uint64_t v11 = SecItemUpdate((CFDictionaryRef)v5, (CFDictionaryRef)v9);
    if (!(_DWORD)v11) {
      goto LABEL_13;
    }
    int v13 = v11;
    uint64_t v14 = handoff_log(v11, v12);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v25[0] = 67109634;
      v25[1] = v13;
      __int16 v26 = 2112;
      id v27 = v5;
      __int16 v28 = 2112;
      id v29 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to update keychain item with error %d for query %@ attributesToUpdate %@",  (uint8_t *)v25,  0x1Cu);
    }

    [v10 removeObjectForKey:kSecAttrAccessible];
    uint64_t v16 = SecItemDelete((CFDictionaryRef)v10);
    if ((_DWORD)v16)
    {
      uint64_t v18 = handoff_log(v16, v17);
      __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000E8888();
      }
    }

    [v10 setObject:kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly forKeyedSubscript:kSecAttrAccessible];
    uint64_t v20 = SecItemAdd((CFDictionaryRef)v10, 0LL);
    if ((_DWORD)v20)
    {
      uint64_t v22 = handoff_log(v20, v21);
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1000E8828();
      }

      BOOL v7 = 0;
    }

    else
    {
LABEL_13:
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (id)loadEncryptionKeyDataRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager baseDictEncryptionKey](self, "baseDictEncryptionKey"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[SDActivityEncryptionManager loadKeyDataRepresentationWithBaseDict:]( self,  "loadKeyDataRepresentationWithBaseDict:",  v3));

  return v4;
}

- (BOOL)saveEncryptionKeyDataRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager baseDictEncryptionKey](self, "baseDictEncryptionKey"));
  LOBYTE(self) = -[SDActivityEncryptionManager saveKeyDataRepresentation:withBaseDict:]( self,  "saveKeyDataRepresentation:withBaseDict:",  v4,  v5);

  return (char)self;
}

- (id)loadDecryptionKeyDataRepresentationForDeviceIdentifier:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[SDActivityEncryptionManager baseDictDecryptionKeyForDeviceIdentifier:]( self,  "baseDictDecryptionKeyForDeviceIdentifier:",  a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[SDActivityEncryptionManager loadKeyDataRepresentationWithBaseDict:]( self,  "loadKeyDataRepresentationWithBaseDict:",  v4));

  return v5;
}

- (BOOL)saveDecryptionKeyDataRepresentation:(id)a3 forDeviceIdentifier:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( -[SDActivityEncryptionManager baseDictDecryptionKeyForDeviceIdentifier:]( self,  "baseDictDecryptionKeyForDeviceIdentifier:",  a4));
  LOBYTE(self) = -[SDActivityEncryptionManager saveKeyDataRepresentation:withBaseDict:]( self,  "saveKeyDataRepresentation:withBaseDict:",  v6,  v7);

  return (char)self;
}

- (id)baseDict
{
  v2 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  kSecClassGenericPassword,  kSecClass);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  @"com.apple.continuity.encryption",  kSecAttrService);
  return v2;
}

- (id)baseDictWrappingKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager baseDict](self, "baseDict"));
  [v2 setObject:@"com.apple.continuity.encryption" forKeyedSubscript:kSecAttrAccessGroup];
  [v2 setObject:@"handoff-wrapping-key" forKeyedSubscript:kSecAttrAccount];
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:kSecAttrAccount]);
  [v2 setObject:v3 forKeyedSubscript:kSecAttrLabel];

  [v2 setObject:@"Handoff Wrapping Key" forKeyedSubscript:kSecAttrDescription];
  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecAttrSynchronizable];
  return v2;
}

- (id)baseDictEncryptionKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager baseDict](self, "baseDict"));
  [v2 setObject:@"com.apple.continuity.encryption" forKeyedSubscript:kSecAttrAccessGroup];
  [v2 setObject:@"handoff-own-encryption-key" forKeyedSubscript:kSecAttrAccount];
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:kSecAttrAccount]);
  [v2 setObject:v3 forKeyedSubscript:kSecAttrLabel];

  [v2 setObject:@"Handoff Encryption Key" forKeyedSubscript:kSecAttrDescription];
  [v2 setObject:&__kCFBooleanFalse forKeyedSubscript:kSecAttrSynchronizable];
  return v2;
}

- (id)baseDictDecryptionKeyForDeviceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager baseDict](self, "baseDict"));
  [v5 setObject:@"com.apple.continuity.encryption" forKeyedSubscript:kSecAttrAccessGroup];
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"handoff-decryption-key",  v4));
    [v5 setObject:v6 forKeyedSubscript:kSecAttrAccount];

    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kSecAttrAccount]);
    [v5 setObject:v7 forKeyedSubscript:kSecAttrLabel];
  }

  [v5 setObject:@"Handoff Decryption Key" forKeyedSubscript:kSecAttrDescription];
  [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:kSecAttrSynchronizable];

  return v5;
}

- (void).cxx_destruct
{
}

@end