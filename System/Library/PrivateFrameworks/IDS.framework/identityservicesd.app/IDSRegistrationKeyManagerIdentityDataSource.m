@interface IDSRegistrationKeyManagerIdentityDataSource
+ (id)containerStorageItemNameForContainerIdentityIdentifier:(int64_t)a3;
+ (id)containerStorageItemNameForContainerIdentityIdentifier:(int64_t)a3 applicationKeyIndex:(unsigned __int16)a4;
+ (id)containerStorageItemNameForIsRegisteredAtApplicationKeyIndex:(unsigned __int16)a3;
+ (id)containerStorageItemNameForKTDataAtKeyIndex:(unsigned __int16)a3 isRegistered:(BOOL)a4;
+ (id)legacyStorageItemNameForContainerIdentityIdentifier:(int64_t)a3;
+ (id)storageItemNameForLegacyIdentityIdentifier:(int64_t)a3;
- (BOOL)_removeDataFromKeychainForIdentifier:(id)a3 dataProtectionClass:(int64_t)a4 error:(id *)a5;
- (BOOL)loadIsIdentityRegisteredForApplicationKeyIndex:(unsigned __int16)a3 error:(id *)a4;
- (BOOL)removeIdentityContainer:(id)a3 withIdentifier:(int64_t)a4 dataProtectionClass:(int64_t)a5 error:(id *)a6;
- (BOOL)removeIdentityWithApplicationKeyIndex:(unsigned __int16)a3 error:(id *)a4;
- (BOOL)removeKTRegistrationDataForKeyIndex:(unsigned __int16)a3 isRegistered:(BOOL)a4 error:(id *)a5;
- (BOOL)removeLegacyIdentity:(id)a3 withIdentifier:(int64_t)a4 dataProtectionClass:(int64_t)a5 error:(id *)a6;
- (BOOL)saveIdentityContainer:(id)a3 withIdentifier:(int64_t)a4 dataProtectionClass:(int64_t)a5 error:(id *)a6;
- (BOOL)saveIsRegistered:(BOOL)a3 forApplicationKeyIndex:(unsigned __int16)a4 error:(id *)a5;
- (BOOL)saveKTRegistrationData:(id)a3 forKeyIndex:(unsigned __int16)a4 isRegistered:(BOOL)a5 error:(id *)a6;
- (BOOL)saveLegacyIdentity:(id)a3 withIdentifier:(int64_t)a4 dataProtectionClass:(int64_t)a5 error:(id *)a6;
- (IDSKeychainWrapper)keychainWrapper;
- (IDSRegistrationKeyManagerIdentityDataSource)initWithKeychainWrapper:(id)a3;
- (__SecKey)copyIdentityFromKeychainWithApplicationKeyIndex:(unsigned __int16)a3 error:(id *)a4;
- (__SecKey)createIdentityForApplicationKeyIndex:(unsigned __int16)a3 error:(id *)a4;
- (id)_loadContainerWithIdentifier:(id)a3 serializationDidChage:(BOOL *)a4 deserializationDidFail:(BOOL *)a5 needsEncryptionIdentityRoll:(BOOL *)a6 error:(id *)a7;
- (id)_loadIdentityWithIdentifier:(id)a3 serializationDidChage:(BOOL *)a4 deserializationDidFail:(BOOL *)a5 error:(id *)a6;
- (id)_loadLegacyIdentityWithIdentifier:(id)a3 serializationDidChange:(BOOL *)a4 deserializationDidFail:(BOOL *)a5 error:(id *)a6;
- (id)_retrying_loadLegacyIdentityWithIdentifier:(id)a3 serializationDidChange:(BOOL *)a4 deserializationDidFail:(BOOL *)a5 error:(id *)a6;
- (id)dataRepresentationForNGMVersion:(unsigned int)a3;
- (id)generateIdentityContainerWithIdentifier:(int64_t)a3 existingLegacyIdentity:(id)a4 existingNGMIdentity:(id)a5 dataProtectionClass:(int64_t)a6 nonLegacyError:(id *)a7 error:(id *)a8;
- (id)generateLegacyIdentityWithIdentifier:(int64_t)a3 dataProtectionClass:(int64_t)a4 error:(id *)a5;
- (id)loadIdentityContainerWithIdentifier:(int64_t)a3 withLegacyFallback:(BOOL)a4 serializationDidChange:(BOOL *)a5 deserializationDidFail:(BOOL *)a6 needsEncryptionIdentityRoll:(BOOL *)a7 nonLegacyError:(id *)a8 error:(id *)a9;
- (id)loadKTRegistrationDataForKeyIndex:(unsigned __int16)a3 isRegistered:(BOOL)a4 error:(id *)a5;
- (id)loadLegacyIdentityWithIdentifier:(int64_t)a3 serializationDidChange:(BOOL *)a4 error:(id *)a5;
- (unsigned)ngmVersion;
- (unsigned)ngmVersionFromDataRepresentation:(id)a3;
- (void)_eraseNGMIdentityFromKeychain:(id)a3;
@end

@implementation IDSRegistrationKeyManagerIdentityDataSource

+ (id)storageItemNameForLegacyIdentityIdentifier:(int64_t)a3
{
  return *(&off_100903F80 + a3 - 4);
}

+ (id)legacyStorageItemNameForContainerIdentityIdentifier:(int64_t)a3
{
  switch(a3)
  {
    case 2LL:
      return @"message-protection-key";
    case 3LL:
      return @"previous-message-protection-key";
    case 0LL:
      sub_1006ABA30();
  }

  return @"unregistered-message-protection-key";
}

+ (id)containerStorageItemNameForContainerIdentityIdentifier:(int64_t)a3
{
  switch(a3)
  {
    case 2LL:
      return @"container-message-protection-key";
    case 3LL:
      return @"container-previous-message-protection-key";
    case 0LL:
      sub_1006ABA58();
  }

  return @"container-unregistered-message-protection-key";
}

+ (id)containerStorageItemNameForContainerIdentityIdentifier:(int64_t)a3 applicationKeyIndex:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([a1 containerStorageItemNameForContainerIdentityIdentifier:a3]);
  if ((v4 | 2) == 2) {
    sub_1006ABA80();
  }
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%u", v5, v4));

  return v7;
}

+ (id)containerStorageItemNameForIsRegisteredAtApplicationKeyIndex:(unsigned __int16)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%u",  @"container-application-key-is-registered",  a3);
}

+ (id)containerStorageItemNameForKTDataAtKeyIndex:(unsigned __int16)a3 isRegistered:(BOOL)a4
{
  unsigned int v4 = @"container-unregistered-ktsignaturedata";
  if (a4) {
    unsigned int v4 = @"container-registered-ktsignaturedata";
  }
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%u",  v4,  a3));
}

- (IDSRegistrationKeyManagerIdentityDataSource)initWithKeychainWrapper:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSRegistrationKeyManagerIdentityDataSource;
  v6 = -[IDSRegistrationKeyManagerIdentityDataSource init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_keychainWrapper, a3);
  }

  return v7;
}

- (id)generateLegacyIdentityWithIdentifier:(int64_t)a3 dataProtectionClass:(int64_t)a4 error:(id *)a5
{
  id v9 = objc_msgSend((id)objc_opt_class(self, a2), "storageItemNameForLegacyIdentityIdentifier:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (!v10)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v16 handleFailureInMethod:a2, self, @"IDSRegistrationKeyManagerIdentityDataSource.m", 116, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[IDSMPFullLegacyIdentity identityWithDataProtectionClass:error:]( &OBJC_CLASS___IDSMPFullLegacyIdentity,  "identityWithDataProtectionClass:error:",  +[IDSKeychainWrapper imDataProtectionClassFromDataProtectionClass:]( &OBJC_CLASS___IDSKeychainWrapper,  "imDataProtectionClassFromDataProtectionClass:",  a4),  a5));
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      v18 = v10;
      __int16 v19 = 2113;
      v20 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Generated identity {identifier: %{public}@, identity: %{private}@}",  buf,  0x16u);
    }

    id v14 = v11;
  }

  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1006ABAA8();
    }
  }

  return v11;
}

- (BOOL)saveLegacyIdentity:(id)a3 withIdentifier:(int64_t)a4 dataProtectionClass:(int64_t)a5 error:(id *)a6
{
  id v11 = a3;
  id v13 = objc_msgSend((id)objc_opt_class(self, v12), "storageItemNameForLegacyIdentityIdentifier:", a4);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (v14)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_21:
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1006ABB18((uint64_t)v14, v15);
    }
    goto LABEL_23;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v26 handleFailureInMethod:a2, self, @"IDSRegistrationKeyManagerIdentityDataSource.m", 132, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

  if (!v11) {
    goto LABEL_21;
  }
LABEL_3:
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 dataRepresentationWithError:a6]);
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  v17 = v16;
  if (!v15)
  {
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_12:

LABEL_23:
      BOOL v20 = 0;
      goto LABEL_24;
    }

    if (a6) {
      id v21 = *a6;
    }
    else {
      id v21 = 0LL;
    }
    *(_DWORD *)buf = 138543875;
    id v29 = v21;
    __int16 v30 = 2114;
    id v31 = v14;
    __int16 v32 = 2113;
    v33 = (os_log_s *)v11;
    v23 = "Failed to generate data from identity -- Removing refence from keychain {error: %{public}@, identifier: %{publ"
          "ic}@, identity: %{private}@}";
    v24 = v17;
    uint32_t v25 = 32;
LABEL_19:
    _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v23, buf, v25);
    goto LABEL_12;
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543875;
    id v29 = v14;
    __int16 v30 = 2113;
    id v31 = v11;
    __int16 v32 = 2113;
    v33 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Generated data from identity {identifier: %{public}@, identity: %{private}@, data: %{private}@}",  buf,  0x20u);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManagerIdentityDataSource keychainWrapper](self, "keychainWrapper"));
  unsigned __int8 v19 = [v18 saveData:v15 forIdentifier:v14 allowSync:0 dataProtectionClass:a5 error:a6];

  if ((v19 & 1) == 0)
  {
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    if (a6) {
      id v22 = *a6;
    }
    else {
      id v22 = 0LL;
    }
    *(_DWORD *)buf = 138544131;
    id v29 = v22;
    __int16 v30 = 2114;
    id v31 = v14;
    __int16 v32 = 2113;
    v33 = (os_log_s *)v11;
    __int16 v34 = 2113;
    v35 = v15;
    v23 = "Failed to save to keychain -- Failed to save identity {error: %{public}@, identifier: %{public}@, identity: %{"
          "private}@, data: %{private}@}";
    v24 = v17;
    uint32_t v25 = 42;
    goto LABEL_19;
  }

  BOOL v20 = 1;
LABEL_24:

  return v20;
}

- (id)loadLegacyIdentityWithIdentifier:(int64_t)a3 serializationDidChange:(BOOL *)a4 error:(id *)a5
{
  id v9 = objc_msgSend((id)objc_opt_class(self, a2), "storageItemNameForLegacyIdentityIdentifier:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (!v10)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v15 handleFailureInMethod:a2, self, @"IDSRegistrationKeyManagerIdentityDataSource.m", 157, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }

  char v16 = 0;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManagerIdentityDataSource _retrying_loadLegacyIdentityWithIdentifier:serializationDidChange:deserializationDidFail:error:]( self,  "_retrying_loadLegacyIdentityWithIdentifier:serializationDidChange:deserializationDidFail:error:",  v10,  a4,  &v16,  a5));
  uint64_t v12 = v11;
  if (v11) {
    id v13 = v11;
  }

  return v12;
}

- (BOOL)removeLegacyIdentity:(id)a3 withIdentifier:(int64_t)a4 dataProtectionClass:(int64_t)a5 error:(id *)a6
{
  id v11 = a3;
  id v13 = objc_msgSend((id)objc_opt_class(self, v12), "storageItemNameForLegacyIdentityIdentifier:", a4);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (!v14)
  {
    uint32_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v25 handleFailureInMethod:a2, self, @"IDSRegistrationKeyManagerIdentityDataSource.m", 170, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }

  if (v11)
  {
    unsigned int v15 = [v11 purgeFromKeychain:a6];
    char v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543619;
        id v27 = v14;
        __int16 v28 = 2113;
        id v29 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Purged identity {identifier: %{public}@, identity: %{private}@}",  buf,  0x16u);
      }
    }

    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      if (a6) {
        id v24 = *a6;
      }
      else {
        id v24 = 0LL;
      }
      *(_DWORD *)buf = 138543875;
      id v27 = v24;
      __int16 v28 = 2114;
      id v29 = v14;
      __int16 v30 = 2113;
      id v31 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Failed to purge identity from keychain -- leaking identity but removing reference to it {error: %{public}@, iden tifier: %{public}@, identity: %{private}@}",  buf,  0x20u);
    }
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManagerIdentityDataSource keychainWrapper](self, "keychainWrapper"));
  unsigned int v19 = [v18 removeDataForIdentifier:v14 dataProtectionClass:a5 error:a6];

  BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  id v21 = v20;
  if (v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      id v27 = v14;
      __int16 v28 = 2113;
      id v29 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Removed identity reference from keychain {identifier: %{public}@, identity: %{private}@}",  buf,  0x16u);
    }
  }

  else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    if (a6) {
      id v23 = *a6;
    }
    else {
      id v23 = 0LL;
    }
    *(_DWORD *)buf = 138543875;
    id v27 = v23;
    __int16 v28 = 2114;
    id v29 = v14;
    __int16 v30 = 2113;
    id v31 = v11;
    _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to remove identity from keychain {error: %{public}@, identifier: %{public}@, identity: %{private}@}",  buf,  0x20u);
  }

  return v19;
}

- (__SecKey)createIdentityForApplicationKeyIndex:(unsigned __int16)a3 error:(id *)a4
{
  uint64_t v5 = a3;
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v18) = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Generating identity {index: %u}", buf, 8u);
  }

  id v9 = objc_msgSend( (id)objc_opt_class(self, v8),  "containerStorageItemNameForContainerIdentityIdentifier:applicationKeyIndex:",  2,  v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, 0LL, 0LL);
  CFDictionaryAddValue(Mutable, kSecAttrKeyType, kSecAttrKeyTypeECSECPrimeRandom);
  CFDictionaryAddValue(Mutable, kSecAttrKeySizeInBits, &off_100948010);
  CFDictionaryAddValue(Mutable, kSecAttrApplicationTag, @"com.apple.identityservicesd");
  CFDictionaryAddValue(Mutable, kSecAttrLabel, v10);
  CFDictionaryAddValue(Mutable, kSecAttrIsPermanent, kCFBooleanTrue);
  CFDictionaryAddValue(Mutable, kSecAttrAccessible, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly);
  CFDictionaryAddValue(Mutable, kSecUseDataProtectionKeychain, kCFBooleanTrue);
  CFErrorRef error = 0LL;
  uint64_t v12 = SecKeyCreateRandomKey(Mutable, &error);
  if (a4 && error)
  {
    *a4 = error;
  }

  else if (error)
  {
    CFRelease(error);
    CFErrorRef error = 0LL;
  }

  if (!v12)
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      if (a4) {
        id v15 = *a4;
      }
      else {
        id v15 = 0LL;
      }
      *(_DWORD *)buf = 138543874;
      id v18 = v15;
      __int16 v19 = 1024;
      int v20 = v5;
      __int16 v21 = 1024;
      int v22 = v5;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_FAULT,  "Failed to generate application identity -- returning container with nil ngm identity {error: %{public}@, index: %u, keyIndex: %u}",  buf,  0x18u);
    }
  }

  if (Mutable) {
    CFRelease(Mutable);
  }

  return v12;
}

- (id)generateIdentityContainerWithIdentifier:(int64_t)a3 existingLegacyIdentity:(id)a4 existingNGMIdentity:(id)a5 dataProtectionClass:(int64_t)a6 nonLegacyError:(id *)a7 error:(id *)a8
{
  id v14 = a4;
  id v15 = a5;
  char v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218499;
    int64_t v39 = a3;
    __int16 v40 = 2048;
    int64_t v41 = a6;
    __int16 v42 = 2113;
    int64_t v43 = (int64_t)v14;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Generating identity {identifier: %ld, dataProtectionClass: %ld, existingLegacyIdentity: %{private}@}",  buf,  0x20u);
  }

  uint64_t v17 = +[IDSKeychainWrapper imDataProtectionClassFromDataProtectionClass:]( &OBJC_CLASS___IDSKeychainWrapper,  "imDataProtectionClassFromDataProtectionClass:",  a6);
  id v18 = v15;
  __int16 v19 = v18;
  if (v18) {
    goto LABEL_11;
  }
  int64_t v36 = a6;
  int64_t v20 = a3;
  uint64_t v21 = IMGetSecAttrDataProtectionClassFromKeychainDataProtectionClass(v17);
  int v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  id v37 = 0LL;
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( +[IDSNGMFullDeviceIdentity identityWithAccess:usageIdentifier:error:]( &OBJC_CLASS___IDSNGMFullDeviceIdentity,  "identityWithAccess:usageIdentifier:error:",  v22,  @"com.apple.identityservicesd",  &v37));
  id v23 = v37;
  id v24 = v23;
  if (a7 && v23) {
    *a7 = v23;
  }
  if (a8 && v24) {
    *a8 = v24;
  }

  a3 = v20;
  a6 = v36;
  if (v19)
  {
LABEL_11:
    uint32_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[IDSRegistrationKeyManagerIdentityDataSource ngmVersion](self, "ngmVersion")));
  }

  else
  {
    __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      if (a8) {
        id v34 = *a8;
      }
      else {
        id v34 = 0LL;
      }
      *(_DWORD *)buf = 138543874;
      int64_t v39 = (int64_t)v34;
      __int16 v40 = 2048;
      int64_t v41 = a3;
      __int16 v42 = 2048;
      int64_t v43 = v36;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_FAULT,  "Failed to generate ngmIdentity -- returning container with nil ngm identity {error: %{public}@, identifier: %ld, dataProtectionClass: %ld}",  buf,  0x20u);
    }

    __int16 v19 = 0LL;
    uint32_t v25 = 0LL;
  }

  id v26 = v14;
  id v27 = v26;
  if (!v26)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[IDSMPFullLegacyIdentity identityWithDataProtectionClass:error:]( &OBJC_CLASS___IDSMPFullLegacyIdentity,  "identityWithDataProtectionClass:error:",  v17,  a8));
    if (!v27)
    {
      __int16 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        if (a8) {
          id v35 = *a8;
        }
        else {
          id v35 = 0LL;
        }
        *(_DWORD *)buf = 138543874;
        int64_t v39 = (int64_t)v35;
        __int16 v40 = 2048;
        int64_t v41 = a3;
        __int16 v42 = 2048;
        int64_t v43 = a6;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_FAULT,  "Failed to generate legacyIdentity -- returning nil container {error: %{public}@, identifier: %ld, dataProtectionClass: %ld}",  buf,  0x20u);
      }

      id v27 = 0LL;
      goto LABEL_23;
    }
  }

  uint64_t v28 = objc_claimAutoreleasedReturnValue( +[IDSMPFullDeviceIdentityContainer identityWithLegacyFullIdentity:ngmFullDeviceIdentity:ngmVersion:error:]( &OBJC_CLASS___IDSMPFullDeviceIdentityContainer,  "identityWithLegacyFullIdentity:ngmFullDeviceIdentity:ngmVersion:error:",  v27,  v19,  v25,  a8));
  if (!v28)
  {
    __int16 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      if (a8) {
        id v31 = *a8;
      }
      else {
        id v31 = 0LL;
      }
      *(_DWORD *)buf = 138543874;
      int64_t v39 = (int64_t)v31;
      __int16 v40 = 2048;
      int64_t v41 = a3;
      __int16 v42 = 2048;
      int64_t v43 = a6;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_FAULT,  "Failed to generate fullDeviceContainer -- returning nil {error: %{public}@, identifier: %ld, dataProtectionClass: %ld}",  buf,  0x20u);
    }

- (BOOL)saveIdentityContainer:(id)a3 withIdentifier:(int64_t)a4 dataProtectionClass:(int64_t)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 dataRepresentationWithError:a6]);
  if (v12)
  {
    id v13 = objc_msgSend((id)objc_opt_class(self, v11), "containerStorageItemNameForContainerIdentityIdentifier:", a4);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManagerIdentityDataSource keychainWrapper](self, "keychainWrapper"));
    unsigned __int8 v16 = [v15 saveData:v12 forIdentifier:v14 allowSync:0 allowBackup:0 dataProtectionClass:a5 error:a6];

    if ((v16 & 1) == 0)
    {
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        if (a6) {
          id v20 = *a6;
        }
        else {
          id v20 = 0LL;
        }
        int v21 = 138544643;
        id v22 = v20;
        __int16 v23 = 2048;
        int64_t v24 = a4;
        __int16 v25 = 2048;
        int64_t v26 = a5;
        __int16 v27 = 2114;
        uint64_t v28 = v14;
        __int16 v29 = 2113;
        __int16 v30 = v12;
        __int16 v31 = 2113;
        id v32 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Failed to identity to keychain {error: %{public}@, identifier: %ld, dataProtectionClas: %ld, storageIdentifier : %{public}@, dataToSave: %{private}@, container: %{private}@}",  (uint8_t *)&v21,  0x3Eu);
      }
    }
  }

  else
  {
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      if (a6) {
        id v19 = *a6;
      }
      else {
        id v19 = 0LL;
      }
      int v21 = 138544131;
      id v22 = v19;
      __int16 v23 = 2048;
      int64_t v24 = a4;
      __int16 v25 = 2048;
      int64_t v26 = a5;
      __int16 v27 = 2113;
      uint64_t v28 = (os_log_s *)v10;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_FAULT,  "Failed to generate data from container -- not saving {error: %{public}@, identifier: %ld, dataProtectionClass: % ld, container: %{private}@}",  (uint8_t *)&v21,  0x2Au);
    }

    unsigned __int8 v16 = 0;
  }

  return v16;
}

- (__SecKey)copyIdentityFromKeychainWithApplicationKeyIndex:(unsigned __int16)a3 error:(id *)a4
{
  int v5 = a3;
  id v6 = objc_msgSend( (id)objc_opt_class(self, a2),  "containerStorageItemNameForContainerIdentityIdentifier:applicationKeyIndex:",  2,  a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, 0LL, 0LL);
  CFDictionaryAddValue(Mutable, kSecAttrKeyType, kSecAttrKeyTypeECSECPrimeRandom);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassKey);
  CFDictionaryAddValue(Mutable, kSecAttrKeyClass, kSecAttrKeyClassPrivate);
  CFDictionaryAddValue(Mutable, kSecAttrKeySizeInBits, &off_100948010);
  CFDictionaryAddValue(Mutable, kSecAttrApplicationTag, @"com.apple.identityservicesd");
  CFDictionaryAddValue(Mutable, kSecAttrLabel, v7);
  CFDictionaryAddValue(Mutable, kSecAttrIsPermanent, kCFBooleanTrue);
  CFDictionaryAddValue(Mutable, kSecReturnRef, kCFBooleanTrue);
  CFDictionaryAddValue(Mutable, kSecAttrAccessible, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly);
  CFDictionaryAddValue(Mutable, kSecUseDataProtectionKeychain, kCFBooleanTrue);
  CFTypeRef result = 0LL;
  uint64_t v9 = SecItemCopyMatching(Mutable, &result);
  CFTypeRef v10 = result;
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  uint64_t v12 = v11;
  if ((_DWORD)v9 || !v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1006ABC14(v9);
    }

    if (result)
    {
      CFRelease(result);
      CFTypeRef result = 0LL;
    }

    CFTypeRef cf = 0LL;
    uint64_t v13 = SecItemCopyMatching(Mutable, &cf);
    CFTypeRef v14 = cf;
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    unsigned __int8 v16 = v15;
    if ((_DWORD)v13 || !v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1006ABB88(v13);
      }

      if (a4)
      {
        id v22 = @"IDSKeychainWrapperErrorOSStatus";
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v13));
        __int16 v23 = v17;
        id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSKeychainWrapperErrorDomain",  -2000LL,  v18));
      }

      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0LL;
      }

      if (Mutable)
      {
        CFRelease(Mutable);
        Mutable = 0LL;
      }
    }

    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109379;
        int v25 = v5;
        __int16 v26 = 2113;
        CFTypeRef v27 = cf;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Loaded identity on second try -- done {index: %u, secondTry: %{private}@}",  buf,  0x12u);
      }

      if (Mutable) {
        CFRelease(Mutable);
      }
      Mutable = (__CFDictionary *)cf;
    }
  }

  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109379;
      int v25 = v5;
      __int16 v26 = 2113;
      CFTypeRef v27 = result;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Loaded identity on first try -- done {index: %u, firstTry: %{private}@}",  buf,  0x12u);
    }

    if (Mutable) {
      CFRelease(Mutable);
    }
    Mutable = (__CFDictionary *)result;
  }

  return Mutable;
}

- (id)loadIdentityContainerWithIdentifier:(int64_t)a3 withLegacyFallback:(BOOL)a4 serializationDidChange:(BOOL *)a5 deserializationDidFail:(BOOL *)a6 needsEncryptionIdentityRoll:(BOOL *)a7 nonLegacyError:(id *)a8 error:(id *)a9
{
  BOOL v13 = a4;
  id v15 = objc_msgSend((id)objc_opt_class(self, a2), "containerStorageItemNameForContainerIdentityIdentifier:", a3);
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v48 = 0LL;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManagerIdentityDataSource _loadContainerWithIdentifier:serializationDidChage:deserializationDidFail:needsEncryptionIdentityRoll:error:]( self,  "_loadContainerWithIdentifier:serializationDidChage:deserializationDidFail:needsEncryptionIdentityRoll:error:",  v16,  a5,  a6,  a7,  &v48));
  id v18 = v48;
  id v19 = v18;
  if (a8 && v18) {
    *a8 = v18;
  }
  if (!v17)
  {
    __int16 v42 = v16;
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1006ABD0C((uint64_t)v19);
    }

    id v47 = 0LL;
    unsigned __int8 v16 = v42;
    int64_t v43 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManagerIdentityDataSource _loadContainerWithIdentifier:serializationDidChage:deserializationDidFail:needsEncryptionIdentityRoll:error:]( self,  "_loadContainerWithIdentifier:serializationDidChage:deserializationDidFail:needsEncryptionIdentityRoll:error:",  v42,  a5,  a6,  a7,  &v47));
    id v23 = v47;
    id v19 = v23;
    if (a8 && v23) {
      *a8 = v23;
    }
    if (v43)
    {
      if (a9 && v19) {
        *a9 = v19;
      }
      int64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      int v25 = v43;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218243;
        int64_t v50 = a3;
        __int16 v51 = 2113;
        int64_t v52 = (int64_t)v43;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Loaded identity container on second try -- done {identifier: %ld, secondTry: %{private}@}",  buf,  0x16u);
      }

      id v21 = v43;
      goto LABEL_50;
    }

    __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1006ABCA0((uint64_t)v19);
    }

    if (a7) {
      *a7 = 0;
    }
    if (!v13)
    {
      id v21 = 0LL;
LABEL_39:
      int v25 = 0LL;
LABEL_50:

      goto LABEL_51;
    }

    id v28 = objc_msgSend((id)objc_opt_class(self, v27), "legacyStorageItemNameForContainerIdentityIdentifier:", a3);
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    BOOL v46 = 0;
    uint64_t v30 = objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManagerIdentityDataSource _retrying_loadLegacyIdentityWithIdentifier:serializationDidChange:deserializationDidFail:error:]( self,  "_retrying_loadLegacyIdentityWithIdentifier:serializationDidChange:deserializationDidFail:error:",  v29,  a5,  &v46,  a9));
    __int16 v31 = (void *)v30;
    if (a6) {
      *a6 = v46;
    }
    if (v30)
    {
      uint64_t v32 = objc_claimAutoreleasedReturnValue( +[IDSMPFullDeviceIdentityContainer identityWithLegacyFullIdentity:ngmFullDeviceIdentity:ngmVersion:error:]( &OBJC_CLASS___IDSMPFullDeviceIdentityContainer,  "identityWithLegacyFullIdentity:ngmFullDeviceIdentity:ngmVersion:error:",  v30,  0LL,  0LL,  a9));
      if (v32)
      {
        id v21 = (id)v32;
        if (!-[IDSRegistrationKeyManagerIdentityDataSource saveIdentityContainer:withIdentifier:dataProtectionClass:error:]( self,  "saveIdentityContainer:withIdentifier:dataProtectionClass:error:",  v32,  a3,  0LL,  a9))
        {
          v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            if (a9) {
              id v41 = *a9;
            }
            else {
              id v41 = 0LL;
            }
            *(_DWORD *)buf = 138544131;
            int64_t v50 = (int64_t)v41;
            __int16 v51 = 2048;
            int64_t v52 = a3;
            __int16 v53 = 2048;
            id v54 = v29;
            __int16 v55 = 2113;
            v56 = v31;
            _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Failed to migrate container with legacyIdentity {error: %{public}@, identifier: %ld, legacyIdentifier: %ld , legacyIdentity: %{private}@",  buf,  0x2Au);
          }
        }

        id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218499;
          int64_t v50 = a3;
          __int16 v51 = 2048;
          int64_t v52 = (int64_t)v29;
          __int16 v53 = 2113;
          id v54 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Loaded legacy identity -- returning container with nil ngmIdentity {identifier: %ld, legacyIdentifier: %ld, container: %{private}@",  buf,  0x20u);
        }

        goto LABEL_39;
      }

      id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        if (a9) {
          id v40 = *a9;
        }
        else {
          id v40 = 0LL;
        }
        *(_DWORD *)buf = 138544131;
        int64_t v50 = (int64_t)v40;
        __int16 v51 = 2048;
        int v25 = 0LL;
        int64_t v52 = a3;
        __int16 v53 = 2048;
        id v54 = v29;
        __int16 v55 = 2113;
        v56 = v31;
        _os_log_error_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "Failed to create container with legacyIdentity -- returning nil {error: %{public}@, identifier: %ld, legacyIde ntifier: %ld, legacyIdentity: %{private}@",  buf,  0x2Au);
      }

      else
      {
        int v25 = 0LL;
      }
    }

    else
    {
      int v25 = 0LL;
      if (!v46)
      {
LABEL_49:

        id v21 = 0LL;
        goto LABEL_50;
      }

      id v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManagerIdentityDataSource keychainWrapper](self, "keychainWrapper"));
      id v45 = 0LL;
      unsigned __int8 v36 = [v35 removeDataForIdentifier:v29 dataProtectionClass:2 error:&v45];
      id v37 = (os_log_s *)v45;

      if ((v36 & 1) == 0)
      {
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138544131;
          int64_t v50 = (int64_t)v37;
          __int16 v51 = 2048;
          int64_t v52 = a3;
          __int16 v53 = 2048;
          id v54 = v29;
          __int16 v55 = 2113;
          v56 = 0LL;
          _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "Failed to remove legacy identity -- purging {removeError: %{public}@, identifier: %ld, legacyIdentifier: %ld , legacyIdentity: %{private}@",  buf,  0x2Au);
        }
      }

      unsigned __int8 v16 = v42;
    }

    goto LABEL_49;
  }

  if (a9 && v19) {
    *a9 = v19;
  }
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218243;
    int64_t v50 = a3;
    __int16 v51 = 2113;
    int64_t v52 = (int64_t)v17;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Loaded identity container on first try -- done {identifier: %ld, firstTry: %{private}@}",  buf,  0x16u);
  }

  id v21 = v17;
LABEL_51:

  return v21;
}

- (BOOL)loadIsIdentityRegisteredForApplicationKeyIndex:(unsigned __int16)a3 error:(id *)a4
{
  id v6 = objc_msgSend((id)objc_opt_class(self, a2), "containerStorageItemNameForIsRegisteredAtApplicationKeyIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManagerIdentityDataSource keychainWrapper](self, "keychainWrapper"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dataForIdentifier:v7 error:a4]);

    BOOL v10 = v9 != 0LL;
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)saveIsRegistered:(BOOL)a3 forApplicationKeyIndex:(unsigned __int16)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = objc_msgSend((id)objc_opt_class(self, a2), "containerStorageItemNameForIsRegisteredAtApplicationKeyIndex:", a4);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (v9)
  {
    if (v6)
    {
      char v15 = 1;
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v15, 1LL));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManagerIdentityDataSource keychainWrapper](self, "keychainWrapper"));
      unsigned __int8 v12 = [v11 saveData:v10 forIdentifier:v9 allowSync:0 dataProtectionClass:0 error:a5];
    }

    else
    {
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManagerIdentityDataSource keychainWrapper](self, "keychainWrapper"));
      unsigned __int8 v12 = [v13 removeDataForIdentifier:v9 dataProtectionClass:0 error:a5];
    }
  }

  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (id)loadKTRegistrationDataForKeyIndex:(unsigned __int16)a3 isRegistered:(BOOL)a4 error:(id *)a5
{
  id v7 = objc_msgSend((id)objc_opt_class(self, a2), "containerStorageItemNameForKTDataAtKeyIndex:isRegistered:", a3, a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManagerIdentityDataSource keychainWrapper](self, "keychainWrapper"));
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dataForIdentifier:v8 error:a5]);
  }

  else
  {
    BOOL v10 = 0LL;
  }

  return v10;
}

- (BOOL)saveKTRegistrationData:(id)a3 forKeyIndex:(unsigned __int16)a4 isRegistered:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v8 = a4;
  id v10 = a3;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "containerStorageItemNameForKTDataAtKeyIndex:isRegistered:", v8, v7);
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (v13)
  {
    CFTypeRef v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManagerIdentityDataSource keychainWrapper](self, "keychainWrapper"));
    unsigned __int8 v15 = [v14 saveData:v10 forIdentifier:v13 allowSync:0 dataProtectionClass:0 error:a6];
  }

  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (BOOL)removeKTRegistrationDataForKeyIndex:(unsigned __int16)a3 isRegistered:(BOOL)a4 error:(id *)a5
{
  id v7 = objc_msgSend((id)objc_opt_class(self, a2), "containerStorageItemNameForKTDataAtKeyIndex:isRegistered:", a3, a4);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManagerIdentityDataSource keychainWrapper](self, "keychainWrapper"));
    unsigned __int8 v10 = [v9 removeDataForIdentifier:v8 dataProtectionClass:0 error:a5];
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (void)_eraseNGMIdentityFromKeychain:(id)a3
{
  id v3 = a3;
  id v8 = 0LL;
  unsigned __int8 v4 = [v3 eraseFromKeyChain:&v8];
  id v5 = v8;
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  id v7 = v6;
  if ((v4 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Purged ngm full device identity {ngmFullDeviceIdentity: %@}",  buf,  0xCu);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_1006ABD78((uint64_t)v5);
  }
}

- (BOOL)_removeDataFromKeychainForIdentifier:(id)a3 dataProtectionClass:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManagerIdentityDataSource keychainWrapper](self, "keychainWrapper"));
  id v15 = 0LL;
  unsigned __int8 v10 = [v9 removeDataForIdentifier:v8 dataProtectionClass:a4 error:&v15];
  id v11 = v15;

  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  BOOL v13 = v12;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Purged key blob from keychain {identifier: %@}",  buf,  0xCu);
    }
  }

  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1006ABDE4((uint64_t)v11);
    }

    if (a5) {
      *a5 = v11;
    }
  }

  return v10;
}

- (BOOL)removeIdentityWithApplicationKeyIndex:(unsigned __int16)a3 error:(id *)a4
{
  id v4 = objc_msgSend( (id)objc_opt_class(self, a2),  "containerStorageItemNameForContainerIdentityIdentifier:applicationKeyIndex:",  2,  a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, 0LL, 0LL);
  CFDictionaryAddValue(Mutable, kSecAttrKeyType, kSecAttrKeyTypeECSECPrimeRandom);
  CFDictionaryAddValue(Mutable, kSecAttrKeySizeInBits, &off_100948010);
  CFDictionaryAddValue(Mutable, kSecAttrApplicationTag, @"com.apple.identityservicesd");
  CFDictionaryAddValue(Mutable, kSecAttrLabel, v5);
  CFDictionaryAddValue(Mutable, kSecAttrIsPermanent, kCFBooleanTrue);
  CFDictionaryAddValue(Mutable, kSecReturnRef, kCFBooleanTrue);
  CFDictionaryAddValue(Mutable, kSecAttrAccessible, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly);
  OSStatus v7 = SecItemDelete(Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }

  return v7 == 0;
}

- (BOOL)removeIdentityContainer:(id)a3 withIdentifier:(int64_t)a4 dataProtectionClass:(int64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 legacyFullIdentity]);
  id v23 = 0LL;
  unsigned __int8 v12 = [v11 purgeFromKeychain:&v23];
  id v13 = v23;

  CFTypeRef v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  id v15 = v14;
  if ((v12 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v10 legacyFullIdentity]);
      *(_DWORD *)buf = 138412290;
      int v25 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Purged legacy full identity {legacyFullIdentity: %@}",  buf,  0xCu);
    }
  }

  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    sub_1006ABE50((uint64_t)v13, v10, v15);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 ngmFullDeviceIdentity]);
  -[IDSRegistrationKeyManagerIdentityDataSource _eraseNGMIdentityFromKeychain:]( self,  "_eraseNGMIdentityFromKeychain:",  v17);

  id v19 = objc_msgSend((id)objc_opt_class(self, v18), "containerStorageItemNameForContainerIdentityIdentifier:", a4);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  BOOL v21 = -[IDSRegistrationKeyManagerIdentityDataSource _removeDataFromKeychainForIdentifier:dataProtectionClass:error:]( self,  "_removeDataFromKeychainForIdentifier:dataProtectionClass:error:",  v20,  a5,  a6);

  return v21;
}

- (id)_retrying_loadLegacyIdentityWithIdentifier:(id)a3 serializationDidChange:(BOOL *)a4 deserializationDidFail:(BOOL *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManagerIdentityDataSource _loadLegacyIdentityWithIdentifier:serializationDidChange:deserializationDidFail:error:]( self,  "_loadLegacyIdentityWithIdentifier:serializationDidChange:deserializationDidFail:error:",  v10,  a4,  a5,  a6));
  unsigned __int8 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (a4)
      {
        if (*a4) {
          CFTypeRef v14 = @"YES";
        }
        else {
          CFTypeRef v14 = @"NO";
        }
      }

      else
      {
        CFTypeRef v14 = 0LL;
      }

      int v21 = 138543875;
      id v22 = v10;
      __int16 v23 = 2114;
      int64_t v24 = v14;
      __int16 v25 = 2113;
      id v26 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Loaded identity on first try {identifier: %{public}@}, serializationDidChange: %{public}@, firstTry: %{private}@}",  (uint8_t *)&v21,  0x20u);
    }

    id v15 = v11;
  }

  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1006ABF64();
    }

    id v15 = (id)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManagerIdentityDataSource _loadLegacyIdentityWithIdentifier:serializationDidChange:deserializationDidFail:error:]( self,  "_loadLegacyIdentityWithIdentifier:serializationDidChange:deserializationDidFail:error:",  v10,  a4,  a5,  a6));
    unsigned __int8 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    id v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        if (a4)
        {
          if (*a4) {
            uint64_t v18 = @"YES";
          }
          else {
            uint64_t v18 = @"NO";
          }
        }

        else
        {
          uint64_t v18 = 0LL;
        }

        int v21 = 138543875;
        id v22 = v10;
        __int16 v23 = 2114;
        int64_t v24 = v18;
        __int16 v25 = 2113;
        id v26 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Loaded identity on second try {identifier: %{public}@, serializationDidChange: %{public}@, secondTry: %{private}@}",  (uint8_t *)&v21,  0x20u);
      }

      id v19 = v15;
    }

    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1006ABEF4();
      }
    }
  }

  return v15;
}

- (id)_loadLegacyIdentityWithIdentifier:(id)a3 serializationDidChange:(BOOL *)a4 deserializationDidFail:(BOOL *)a5 error:(id *)a6
{
  id v11 = a3;
  if (!v11)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v22 handleFailureInMethod:a2, self, @"IDSRegistrationKeyManagerIdentityDataSource.m", 508, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManagerIdentityDataSource keychainWrapper](self, "keychainWrapper"));
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 dataForIdentifier:v11 error:a6]);

  CFTypeRef v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  id v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      id v24 = v11;
      __int16 v25 = 2113;
      id v26 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Loaded identity data from keychain {identifier: %{public}@, data: %{private}@}",  buf,  0x16u);
    }

    unsigned __int8 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSMPFullLegacyIdentity identityWithData:error:]( &OBJC_CLASS___IDSMPFullLegacyIdentity,  "identityWithData:error:",  v13,  a6));
    id v15 = v16;
    if (v16)
    {
      if (a4) {
        *a4 = -[os_log_s didDataRepresentationFormatChangeFromDataRepresentation:error:]( v16,  "didDataRepresentationFormatChangeFromDataRepresentation:error:",  v13,  a6);
      }
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543619;
        id v24 = v11;
        __int16 v25 = 2113;
        id v26 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Loaded identity from keychain data {identifier: %{public}@, identity: %{private}@}",  buf,  0x16u);
      }

      id v15 = v15;
      uint64_t v18 = v15;
    }

    else
    {
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        if (a6) {
          id v21 = *a6;
        }
        else {
          id v21 = 0LL;
        }
        *(_DWORD *)buf = 138543875;
        id v24 = v21;
        __int16 v25 = 2114;
        id v26 = (os_log_s *)v11;
        __int16 v27 = 2113;
        id v28 = v13;
        _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Failed to load identity from data {error: %{public}@, identifier: %{public}@, data: %{private}@}",  buf,  0x20u);
      }

      if (a5) {
        *a5 = 1;
      }
      uint64_t v18 = 0LL;
    }
  }

  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1006ABFD4();
    }
    uint64_t v18 = 0LL;
  }

  return v18;
}

- (id)_loadIdentityWithIdentifier:(id)a3 serializationDidChage:(BOOL *)a4 deserializationDidFail:(BOOL *)a5 error:(id *)a6
{
  id v11 = (os_log_s *)a3;
  if (!v11)
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v28 handleFailureInMethod:a2, self, @"IDSRegistrationKeyManagerIdentityDataSource.m", 535, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManagerIdentityDataSource keychainWrapper](self, "keychainWrapper"));
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 dataForIdentifier:v11 error:a6]);

  CFTypeRef v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  id v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      uint64_t v30 = v11;
      __int16 v31 = 2113;
      uint64_t v32 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Loaded identity data from keychain {identifier: %{public}@, data: %{private}@}",  buf,  0x16u);
    }

    unsigned __int8 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSNGMFullDeviceIdentity identityWithDataRepresentation:error:]( &OBJC_CLASS___IDSNGMFullDeviceIdentity,  "identityWithDataRepresentation:error:",  v13,  a6));
    id v15 = v16;
    if (v16)
    {
      if (a4)
      {
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s dataRepresentationWithError:](v16, "dataRepresentationWithError:", a6));
        uint64_t v18 = v17;
        if (v17)
        {
          unsigned int v19 = -[os_log_s isEqualToData:](v17, "isEqualToData:", v13);
          id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          id v21 = v20;
          if (v19)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138477827;
              uint64_t v30 = v15;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Serialization did NOT change for identity {identity: %{private}@}",  buf,  0xCu);
            }

            *a4 = 0;
          }

          else
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138478339;
              uint64_t v30 = v15;
              __int16 v31 = 2113;
              uint64_t v32 = v18;
              __int16 v33 = 2113;
              id v34 = v13;
              _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Serialization did change for identity {identity: %{private}@, reSerializedData: %{private}@, data: %{private}@}",  buf,  0x20u);
            }

            *a4 = 1;
          }
        }

        else
        {
          id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
            sub_1006AC044((uint64_t *)a6);
          }
        }
      }

      __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543619;
        uint64_t v30 = v11;
        __int16 v31 = 2113;
        uint64_t v32 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Loaded identity from keychain data {identifier: %{public}@, identity: %{private}@}",  buf,  0x16u);
      }

      id v15 = v15;
      id v22 = v15;
    }

    else
    {
      __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        if (a6) {
          __int16 v27 = (os_log_s *)*a6;
        }
        else {
          __int16 v27 = 0LL;
        }
        *(_DWORD *)buf = 138543875;
        uint64_t v30 = v27;
        __int16 v31 = 2114;
        uint64_t v32 = v11;
        __int16 v33 = 2113;
        id v34 = v13;
        _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Failed to load identity from data {error: %{public}@, identifier: %{public}@, data: %{private}@}",  buf,  0x20u);
      }

      if (a5) {
        *a5 = 1;
      }
      id v22 = 0LL;
    }
  }

  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1006ABFD4();
    }
    id v22 = 0LL;
  }

  return v22;
}

- (id)_loadContainerWithIdentifier:(id)a3 serializationDidChage:(BOOL *)a4 deserializationDidFail:(BOOL *)a5 needsEncryptionIdentityRoll:(BOOL *)a6 error:(id *)a7
{
  id v13 = (os_log_s *)a3;
  if (!v13)
  {
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v32 handleFailureInMethod:a2, self, @"IDSRegistrationKeyManagerIdentityDataSource.m", 573, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }

  CFTypeRef v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManagerIdentityDataSource keychainWrapper](self, "keychainWrapper"));
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 dataForIdentifier:v13 error:a7]);

  unsigned __int8 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  id v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      id v34 = v13;
      __int16 v35 = 2113;
      unsigned __int8 v36 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Loaded identity data from keychain {identifier: %{public}@, data: %{private}@}",  buf,  0x16u);
    }

    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSMPFullDeviceIdentityContainer identityWithDataRepresentation:error:]( &OBJC_CLASS___IDSMPFullDeviceIdentityContainer,  "identityWithDataRepresentation:error:",  v15,  a7));
    id v17 = v18;
    if (v18)
    {
      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s ngmFullDeviceIdentity](v18, "ngmFullDeviceIdentity"));
      unsigned int v20 = [v19 shouldRollEncryptionIdentity];

      if (a6 && v20) {
        *a6 = 1;
      }
      if (a4)
      {
        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s dataRepresentationWithError:](v17, "dataRepresentationWithError:", a7));
        id v22 = v21;
        if (v21)
        {
          unsigned int v23 = -[os_log_s isEqualToData:](v21, "isEqualToData:", v15);
          id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          __int16 v25 = v24;
          if (v23)
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138477827;
              id v34 = v17;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Serialization did NOT change for identity {identity: %{private}@}",  buf,  0xCu);
            }

            *a4 = 0;
          }

          else
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138478339;
              id v34 = v17;
              __int16 v35 = 2113;
              unsigned __int8 v36 = v22;
              __int16 v37 = 2113;
              v38 = v15;
              _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Serialization did change for identity {identity: %{private}@, reSerializedData: %{private}@, data: %{private}@}",  buf,  0x20u);
            }

            *a4 = 1;
          }
        }

        else
        {
          id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
            sub_1006AC044((uint64_t *)a7);
          }
        }
      }

      __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543619;
        id v34 = v13;
        __int16 v35 = 2113;
        unsigned __int8 v36 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Loaded identity from keychain data {identifier: %{public}@, identity: %{private}@}",  buf,  0x16u);
      }

      id v17 = v17;
      id v26 = v17;
    }

    else
    {
      __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        if (a7) {
          __int16 v31 = (os_log_s *)*a7;
        }
        else {
          __int16 v31 = 0LL;
        }
        *(_DWORD *)buf = 138543875;
        id v34 = v31;
        __int16 v35 = 2114;
        unsigned __int8 v36 = v13;
        __int16 v37 = 2113;
        v38 = v15;
        _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Failed to load identity container from data {error: %{public}@, identifier: %{public}@, data: %{private}@}",  buf,  0x20u);
      }

      if (a5) {
        *a5 = 1;
      }
      id v26 = 0LL;
    }
  }

  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1006AC0C0();
    }
    id v26 = 0LL;
  }

  return v26;
}

- (unsigned)ngmVersion
{
  unsigned int v2 = +[IDSNGMProtocolVersion supportedVersion](&OBJC_CLASS___IDSNGMProtocolVersion, "supportedVersion");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  unsigned int v4 = [v3 isInternalInstall];

  if (v4)
  {
    uint64_t v6 = IMGetAppValueForKey(@"NGMVersionOverride", v5);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (v8)
    {
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v7);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        unsigned int v10 = [v8 unsignedIntValue];
        if (v10 > v2) {
          unsigned int v2 = v10;
        }
      }
    }
  }

  return v2;
}

- (id)dataRepresentationForNGMVersion:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
  id v9 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v4,  200LL,  0LL,  &v9));
  id v6 = v9;
  if (!v5)
  {
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_1006AC130((uint64_t)v6, v3, v7);
    }
  }

  return v5;
}

- (unsigned)ngmVersionFromDataRepresentation:(id)a3
{
  id v3 = a3;
  id v9 = 0LL;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v3,  0LL,  0LL,  &v9));
  id v5 = v9;
  if (v4)
  {
    unsigned int v6 = [v4 unsignedIntValue];
  }

  else
  {
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_1006AC1A4((uint64_t)v5);
    }

    unsigned int v6 = 0;
  }

  return v6;
}

- (IDSKeychainWrapper)keychainWrapper
{
  return self->_keychainWrapper;
}

- (void).cxx_destruct
{
}

  ;
}

@end