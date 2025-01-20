@interface NSPDeviceIdentityCertificate
+ (BOOL)supportsSecureCoding;
+ (id)sharedDeviceIdentity;
+ (void)removeFromPreferences;
- (NSPDeviceIdentityCertificate)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)deviceIdentityAuthenticationFailed;
- (void)encodeWithCoder:(id)a3;
- (void)resetDeviceIdentityInfo;
- (void)signData:(id)a3 andFetchDeviceIdentityCertificate:(id)a4;
@end

@implementation NSPDeviceIdentityCertificate

- (id)description
{
  if (self)
  {
    v3 = -[NSMutableString initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithCapacity:", 0LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:]( &OBJC_CLASS___NSDateFormatter,  "localizedStringFromDate:dateStyle:timeStyle:",  self->_deviceIdentityFetchDate,  1LL,  2LL));
    sub_100043E90(v3, v4, @"Device Identity Fetch Date", 0, 14LL);

    sub_100043E90(v3, self->_deviceIdentityRetryCount, @"Device Identity Retry Count", 0, 14LL);
  }

  else
  {
    v3 = 0LL;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = -[NSPDeviceIdentityCertificate init]( +[NSPDeviceIdentityCertificate allocWithZone:]( &OBJC_CLASS___NSPDeviceIdentityCertificate,  "allocWithZone:",  a3),  "init");
  p_isa = (id *)&v4->super.isa;
  if (self)
  {
    v4->_diskVersion = self->_diskVersion;
    deviceIdentityFetchDate = self->_deviceIdentityFetchDate;
  }

  else
  {
    deviceIdentityFetchDate = 0LL;
    v4->_diskVersion = 0LL;
  }

  objc_storeStrong((id *)&v4->_deviceIdentityFetchDate, deviceIdentityFetchDate);
  if (self) {
    deviceIdentityRetryCount = self->_deviceIdentityRetryCount;
  }
  else {
    deviceIdentityRetryCount = 0LL;
  }
  objc_storeStrong(p_isa + 4, deviceIdentityRetryCount);
  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPDeviceIdentityCertificate)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NSPDeviceIdentityCertificate;
  v7 = -[NSPDeviceIdentityCertificate init](&v19, "init");
  if (v7)
  {
    v7->_diskVersion = (int64_t)[v4 decodeIntegerForKey:@"DiskVersion"];
    id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"DeviceIdentityFetchDate"];
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    deviceIdentityFetchDate = v7->_deviceIdentityFetchDate;
    v7->_deviceIdentityFetchDate = (NSDate *)v9;

    id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"DeviceIdentityRetryCount"];
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    deviceIdentityRetryCount = v7->_deviceIdentityRetryCount;
    v7->_deviceIdentityRetryCount = (NSNumber *)v12;

    v14 = v7;
  }

  else
  {
    uint64_t v16 = nplog_obj(0LL, v5, v6);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "[super init] failed", v18, 2u);
    }
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInteger:1 forKey:@"DiskVersion"];
  if (self)
  {
    [v5 encodeObject:self->_deviceIdentityFetchDate forKey:@"DeviceIdentityFetchDate"];
    deviceIdentityRetryCount = self->_deviceIdentityRetryCount;
  }

  else
  {
    [v5 encodeObject:0 forKey:@"DeviceIdentityFetchDate"];
    deviceIdentityRetryCount = 0LL;
  }

  [v5 encodeObject:deviceIdentityRetryCount forKey:@"DeviceIdentityRetryCount"];
}

+ (void)removeFromPreferences
{
  uint64_t v2 = CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
  int v3 = v2;
  uint64_t v6 = nplog_obj(v2, v4, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Removed device identity info from preference file",  v9,  2u);
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Failed to remove device identity info from preference file",  buf,  2u);
  }
}

+ (id)sharedDeviceIdentity
{
  if (qword_100117150 != -1) {
    dispatch_once(&qword_100117150, &stru_1000F9E68);
  }
  return (id)qword_100117148;
}

- (void)resetDeviceIdentityInfo
{
  if (self)
  {
    int v3 = self->_deviceIdentityFetchDate;
    if (v3)
    {
      BOOL v4 = 1;
      goto LABEL_6;
    }

    deviceIdentityRetryCount = self->_deviceIdentityRetryCount;
  }

  else
  {
    deviceIdentityRetryCount = 0LL;
  }

  int v3 = 0LL;
  BOOL v4 = deviceIdentityRetryCount != 0LL;
LABEL_6:

  sub_10000E01C((uint64_t)self, 0LL);
  sub_10001F910((uint64_t)self, 0LL);
  if (self) {
    self->_ignoreExistingKeychainIdentity = 0;
  }
  if (v4) {
    sub_10004C7FC(self);
  }
}

- (void)deviceIdentityAuthenticationFailed
{
  if (self) {
    self->_ignoreExistingKeychainIdentity = 1;
  }
}

- (void)signData:(id)a3 andFetchDeviceIdentityCertificate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self
    || (id v8 = self->_deviceIdentityFetchDate) == 0LL
    || (uint64_t v9 = v8,
        -[NSDate timeIntervalSinceNow](self->_deviceIdentityFetchDate, "timeIntervalSinceNow"),
        double v11 = v10,
        v9,
        v11 <= 0.0))
  {
LABEL_12:
    v49[0] = kMAOptionsBAAValidity;
    v49[1] = kMAOptionsBAASCRTAttestation;
    v50[0] = &off_100103398;
    v50[1] = &off_1001033B0;
    v49[2] = kMAOptionsBAAOIDSToInclude;
    v48[0] = kMAOptionsBAAOIDUCRTDeviceIdentifiers;
    v48[1] = kMAOptionsBAAOIDDeviceIdentifiers;
    v48[2] = kMAOptionsBAAOIDDeviceOSInformation;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 3LL));
    v50[2] = v27;
    v49[3] = kMAOptionsBAANetworkTimeoutInterval;
    v49[4] = kMAOptionsBAAKeychainLabel;
    v50[3] = &off_1001033C8;
    v50[4] = @"PrivacyProxy";
    v49[5] = kMAOptionsBAADeleteDuplicateKeychainItems;
    v50[5] = &off_1001033E0;
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v50,  v49,  6LL));

    if (qword_100117140 != -1) {
      dispatch_once(&qword_100117140, &stru_1000F9E48);
    }
    if (byte_100117138 == 1)
    {
      objc_initWeak((id *)buf, self);
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v28));
      uint64_t v30 = NPGetInternalQueue([v29 setObject:&off_1001033E0 forKeyedSubscript:kMAOptionsBAASkipNetworkRequest]);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_10004D3D8;
      v45[3] = &unk_1000F9E90;
      objc_copyWeak(&v47, (id *)buf);
      id v46 = v7;
      DeviceIdentityCreateHostSignatureWithCompletion(v31, v6, v29, v45);

      objc_destroyWeak(&v47);
      objc_destroyWeak((id *)buf);
    }

    else
    {
      if (self && self->_ignoreExistingKeychainIdentity)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v28));
        [v39 setObject:&off_1001033E0 forKeyedSubscript:kMAOptionsBAAIgnoreExistingKeychainItems];
        self->_ignoreExistingKeychainIdentity = 0;
      }

      id inited = objc_initWeak((id *)buf, self);
      uint64_t v33 = NPGetInternalQueue(inited);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_10004D514;
      v40[3] = &unk_1000F9EB8;
      objc_copyWeak(&v44, (id *)buf);
      id v41 = v6;
      v42 = self;
      id v43 = v7;
      DeviceIdentityIssueClientCertificateWithCompletion(v34, v28, v40);

      objc_destroyWeak(&v44);
      objc_destroyWeak((id *)buf);
    }

    goto LABEL_21;
  }

  uint64_t v12 = self->_deviceIdentityRetryCount;
  if (!v12
    || (v15 = v12,
        unsigned int v16 = -[NSNumber unsignedIntValue](self->_deviceIdentityRetryCount, "unsignedIntValue"),
        v15,
        v16 <= 4))
  {
    uint64_t v17 = nplog_obj(v12, v13, v14);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v19 = -[NSNumber unsignedIntValue](self->_deviceIdentityRetryCount, "unsignedIntValue");
      *(_DWORD *)buf = 67109120;
      LODWORD(v52) = v19 + 1;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "previously failed to fetch device identity, allowing retry %u",  buf,  8u);
    }

    v20 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[NSNumber unsignedIntValue](self->_deviceIdentityRetryCount, "unsignedIntValue") + 1));
    deviceIdentityRetryCount = self->_deviceIdentityRetryCount;
    self->_deviceIdentityRetryCount = v20;

    uint64_t v22 = sub_10004C7FC(self);
    if ((v22 & 1) == 0)
    {
      uint64_t v25 = nplog_obj(v22, v23, v24);
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Failed to write device identity info to file",  buf,  2u);
      }
    }

    goto LABEL_12;
  }

  uint64_t v35 = nplog_obj(v12, v13, v14);
  v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    v37 = self->_deviceIdentityFetchDate;
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:]( &OBJC_CLASS___NSDateFormatter,  "localizedStringFromDate:dateStyle:timeStyle:",  v37,  1LL,  2LL));
    *(_DWORD *)buf = 138412290;
    v52 = v38;
    _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "deferring fetching device identity until %@",  buf,  0xCu);
  }

  (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
LABEL_21:
}

- (void).cxx_destruct
{
}

@end