@interface IDSCurrentDevice
+ (id)sharedInstance;
- (BOOL)hasAllEncryptionKeys;
- (IDSCurrentDevice)init;
- (NSData)encryptionClassAKey;
- (NSData)encryptionClassCKey;
- (NSData)encryptionClassDKey;
- (NSString)deviceIdentifier;
- (id)_deviceIdentifierKeychainID;
- (void)regenerateDeviceIdentifier;
@end

@implementation IDSCurrentDevice

+ (id)sharedInstance
{
  if (qword_1009C0A70 != -1) {
    dispatch_once(&qword_1009C0A70, &stru_1009001F0);
  }
  return (id)qword_1009C0A78;
}

- (IDSCurrentDevice)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IDSCurrentDevice;
  v2 = -[IDSCurrentDevice init](&v6, "init");
  v3 = v2;
  if (v2) {
    id v4 = -[IDSCurrentDevice deviceIdentifier](v2, "deviceIdentifier");
  }
  return v3;
}

- (NSData)encryptionClassAKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 publicMessageProtectionDataToRegisterForClassA]);

  return (NSData *)v3;
}

- (NSData)encryptionClassCKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 publicMessageProtectionDataToRegisterForClassC]);

  return (NSData *)v3;
}

- (NSData)encryptionClassDKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 publicMessageProtectionDataToRegisterForClassD]);

  return (NSData *)v3;
}

- (BOOL)hasAllEncryptionKeys
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCurrentDevice encryptionClassAKey](self, "encryptionClassAKey"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCurrentDevice encryptionClassCKey](self, "encryptionClassCKey"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCurrentDevice encryptionClassDKey](self, "encryptionClassDKey"));
      BOOL v6 = v5 != 0LL;
    }

    else
    {
      BOOL v6 = 0;
    }
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_deviceIdentifierKeychainID
{
  return @"LocalDevice";
}

- (NSString)deviceIdentifier
{
  p_localDeviceIdentifier = &self->_localDeviceIdentifier;
  localDeviceIdentifier = self->_localDeviceIdentifier;
  if (!localDeviceIdentifier)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCurrentDevice _deviceIdentifierKeychainID](self, "_deviceIdentifierKeychainID"));
    id v15 = 0LL;
    IMGetKeychainAuthToken(&v15, @"com.apple.ids", v5);
    id v6 = v15;
    id v7 = v15;
    if (v7) {
      objc_storeStrong((id *)p_localDeviceIdentifier, v6);
    }
    if (*p_localDeviceIdentifier)
    {
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *p_localDeviceIdentifier;
        *(_DWORD *)buf = 138412290;
        v17 = v9;
        v10 = "Loaded unique ID %@";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
      }
    }

    else
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
      v12 = *p_localDeviceIdentifier;
      *p_localDeviceIdentifier = (NSString *)v11;

      IMSetKeychainAuthToken(*p_localDeviceIdentifier, @"com.apple.ids", v5);
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *p_localDeviceIdentifier;
        *(_DWORD *)buf = 138412290;
        v17 = v13;
        v10 = "No unique ID found - generating new one %@";
        goto LABEL_9;
      }
    }

    localDeviceIdentifier = *p_localDeviceIdentifier;
  }

  return localDeviceIdentifier;
}

- (void)regenerateDeviceIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCurrentDevice _deviceIdentifierKeychainID](self, "_deviceIdentifierKeychainID"));
  IMRemoveKeychainAuthToken(@"com.apple.ids", v3);
  localDeviceIdentifier = self->_localDeviceIdentifier;
  self->_localDeviceIdentifier = 0LL;

  id v5 = -[IDSCurrentDevice deviceIdentifier](self, "deviceIdentifier");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog uniqueID](&OBJC_CLASS___IMRGLog, "uniqueID"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCurrentDevice deviceIdentifier](self, "deviceIdentifier"));
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Re-generated my uniqueID %@",  (uint8_t *)&v8,  0xCu);
  }
}

- (void).cxx_destruct
{
}

@end