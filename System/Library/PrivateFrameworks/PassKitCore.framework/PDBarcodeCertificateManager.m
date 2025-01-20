@interface PDBarcodeCertificateManager
- (PDBarcodeCertificateManager)init;
- (id)_keychainItemIdentifierForCertificateType:(int64_t)a3 withDeviceAccountIdentifier:(id)a4;
- (id)_keychainItemIdentifierForKeyDataWithCertificateType:(int64_t)a3 deviceAccountIdentifier:(id)a4;
- (id)_keychainItemWithIdentifier:(id)a3;
- (id)_readValueForIdentifier:(id)a3;
- (id)_storeCertificates:(id)a3 withCertificateType:(int64_t)a4 forDeviceAccountIdentifier:(id)a5;
- (id)fetchCertificatesForDeviceAccountIdentifier:(id)a3 withCertificateType:(int64_t)a4;
- (id)fetchKeyDataForDeviceAccountIdentifier:(id)a3 withCertificateType:(int64_t)a4;
- (id)publicKeyHashForCertificateType:(int64_t)a3 deviceAccountIdentifier:(id)a4;
- (id)validateAndStoreCertificateChain:(id)a3 withCertificateType:(int64_t)a4 forPass:(id)a5;
- (void)_deleteItemForIdentifier:(id)a3;
- (void)_storeValue:(id)a3 forIdentifier:(id)a4;
- (void)removeCertificateForDeviceAccountIdentifier:(id)a3 withCertificateType:(int64_t)a4;
@end

@implementation PDBarcodeCertificateManager

- (PDBarcodeCertificateManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDBarcodeCertificateManager;
  result = -[PDBarcodeCertificateManager init](&v3, "init");
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (id)validateAndStoreCertificateChain:(id)a3 withCertificateType:(int64_t)a4 forPass:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (![v8 count])
  {
    uint64_t Object = PKLogFacilityTypeGetObject(28LL);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      else {
        v13 = off_100650AD8[a4];
      }
      *(_DWORD *)buf = 138412290;
      v27 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "_validateAndStoreCertificateChain: Certificates for type %@ is empty.",  buf,  0xCu);
    }

    v20 = objc_alloc(&OBJC_CLASS___NSString);
    else {
      v21 = off_100650AD8[a4];
    }
    v19 = -[NSString initWithFormat:]( v20,  "initWithFormat:",  @"_validateAndStoreCertificateChain: Certificates for type %@ is empty.",  v21);
    NSErrorUserInfoKey v24 = NSDebugDescriptionErrorKey;
    v25 = v19;
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  -1LL,  v22));

    goto LABEL_19;
  }

  if ((PKBarcodeCreateAndValidateTrustWithCerts(v8, 0LL, a4) & 1) != 0) {
    goto LABEL_23;
  }
  v10 = (unint64_t)a4 > 3 ? 0LL : off_100650AD8[a4];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueID]);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to validate certificate of type: %@, for pass: %@",  v10,  v14));

  NSErrorUserInfoKey v30 = NSDebugDescriptionErrorKey;
  v31 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  1LL,  v16));

  if (!v17)
  {
LABEL_23:
    if ((unint64_t)a4 > 1
      || (NSErrorUserInfoKey v28 = NSDebugDescriptionErrorKey,
          v29 = @"Platform not supported",
          v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL)),  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  -1LL,  v18)),  v18,  !v17))
    {
      v19 = (NSString *)objc_claimAutoreleasedReturnValue([v9 deviceAccountIdentifier]);
      v17 = (void *)objc_claimAutoreleasedReturnValue( -[PDBarcodeCertificateManager _storeCertificates:withCertificateType:forDeviceAccountIdentifier:]( self,  "_storeCertificates:withCertificateType:forDeviceAccountIdentifier:",  v8,  a4,  v19));
LABEL_19:
    }
  }

  return v17;
}

- (id)fetchCertificatesForDeviceAccountIdentifier:(id)a3 withCertificateType:(int64_t)a4
{
  if (!a3) {
    return 0LL;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDBarcodeCertificateManager _keychainItemIdentifierForCertificateType:withDeviceAccountIdentifier:]( self,  "_keychainItemIdentifierForCertificateType:withDeviceAccountIdentifier:",  a4,  a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDBarcodeCertificateManager _readValueForIdentifier:](self, "_readValueForIdentifier:", v6));
  if (v7)
  {
    id v8 = objc_alloc(&OBJC_CLASS___NSSet);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray, v9);
    v12 = -[NSSet initWithObjects:](v8, "initWithObjects:", v10, objc_opt_class(&OBJC_CLASS___NSData, v11), 0LL);
    id v19 = 0LL;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v12,  v7,  &v19));
    id v14 = v19;

    if (!v13 || v14)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(28LL);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        else {
          v17 = off_100650AD8[a4];
        }
        *(_DWORD *)buf = 138412546;
        v21 = v17;
        __int16 v22 = 2112;
        id v23 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Failed to unarchive certificate type: %@, with error %@",  buf,  0x16u);
      }
    }
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (id)fetchKeyDataForDeviceAccountIdentifier:(id)a3 withCertificateType:(int64_t)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDBarcodeCertificateManager _keychainItemIdentifierForKeyDataWithCertificateType:deviceAccountIdentifier:]( self,  "_keychainItemIdentifierForKeyDataWithCertificateType:deviceAccountIdentifier:",  a4,  a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDBarcodeCertificateManager _readValueForIdentifier:](self, "_readValueForIdentifier:", v5));

  return v6;
}

- (void)removeCertificateForDeviceAccountIdentifier:(id)a3 withCertificateType:(int64_t)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[PDBarcodeCertificateManager _keychainItemIdentifierForCertificateType:withDeviceAccountIdentifier:]( self,  "_keychainItemIdentifierForCertificateType:withDeviceAccountIdentifier:",  a4,  a3));
  -[PDBarcodeCertificateManager _deleteItemForIdentifier:](self, "_deleteItemForIdentifier:", v5);
}

- (id)publicKeyHashForCertificateType:(int64_t)a3 deviceAccountIdentifier:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[PDBarcodeCertificateManager fetchCertificatesForDeviceAccountIdentifier:withCertificateType:]( self,  "fetchCertificatesForDeviceAccountIdentifier:withCertificateType:",  a4,  a3));
  id v5 = (const __CFData *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  SecCertificateRef v6 = SecCertificateCreateWithData(kCFAllocatorDefault, v5);
  if (v6)
  {
    SecCertificateRef v7 = v6;
    id v8 = (void *)SecCertificateCopySubjectPublicKeyInfoSHA256Digest(v6);
    CFRelease(v7);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)_storeCertificates:(id)a3 withCertificateType:(int64_t)a4 forDeviceAccountIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 count];
  uint64_t v11 = 0LL;
  if (v9 && v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDBarcodeCertificateManager _keychainItemIdentifierForCertificateType:withDeviceAccountIdentifier:]( self,  "_keychainItemIdentifierForCertificateType:withDeviceAccountIdentifier:",  a4,  v9));
    id v19 = 0LL;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  &v19));
    id v14 = v19;
    uint64_t v11 = v14;
    if (!v13 || v14)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(28LL);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        else {
          v17 = off_100650AD8[a4];
        }
        *(_DWORD *)buf = 138412546;
        v21 = v17;
        __int16 v22 = 2112;
        id v23 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Failed to archive certificate type: %@, with error: %@",  buf,  0x16u);
      }
    }

    else
    {
      -[PDBarcodeCertificateManager _storeValue:forIdentifier:](self, "_storeValue:forIdentifier:", v13, v12);
    }
  }

  return v11;
}

- (void)_storeValue:(id)a3 forIdentifier:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[PDBarcodeCertificateManager _keychainItemWithIdentifier:](self, "_keychainItemWithIdentifier:", v7));

  [v9 setObject:v8 forKey:kSecValueData];
  os_unfair_lock_unlock(p_lock);
}

- (id)_readValueForIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  SecCertificateRef v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDBarcodeCertificateManager _keychainItemWithIdentifier:](self, "_keychainItemWithIdentifier:", v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kSecValueData]);
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)_deleteItemForIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[PDBarcodeCertificateManager _keychainItemWithIdentifier:](self, "_keychainItemWithIdentifier:", v5));

  [v6 resetKeychainItem];
  os_unfair_lock_unlock(p_lock);
}

- (id)_keychainItemWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___PKKeychainItemWrapper);
  id v5 = [v4 initWithIdentifier:v3 accessGroup:PKPassdBundleIdentifier serviceName:@"com.apple.passd.auxiliarycapability" type:0 invisible:1 accessibility:1];

  [v5 setLabel:@"com.apple.passd.auxiliarycapability"];
  return v5;
}

- (id)_keychainItemIdentifierForCertificateType:(int64_t)a3 withDeviceAccountIdentifier:(id)a4
{
  else {
    id v4 = off_100650AD8[a3];
  }
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.%@", a4, v4);
}

- (id)_keychainItemIdentifierForKeyDataWithCertificateType:(int64_t)a3 deviceAccountIdentifier:(id)a4
{
  else {
    id v4 = off_100650AD8[a3];
  }
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.%@.keydata", a4, v4);
}

@end