@interface MSDEnrollRequest
- (BOOL)isValid;
- (Class)getResponseClass;
- (NSArray)getRegistrationInfoKeys;
- (NSDictionary)registrationInfo;
- (NSString)deviceName;
- (NSString)pairingCredentials;
- (id)getPostData;
- (id)parseResponseForError:(id)a3 andPayload:(id)a4;
- (void)setDeviceName:(id)a3;
- (void)setPairingCredentials:(id)a3;
- (void)setRegistrationInfo:(id)a3;
@end

@implementation MSDEnrollRequest

- (BOOL)isValid
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MSDEnrollRequest;
  if (-[MSDCommandServerRequest isValid](&v8, "isValid"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDEnrollRequest registrationInfo](self, "registrationInfo"));
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary, v4);
    char isKindOfClass = objc_opt_isKindOfClass(v3, v5);
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)getPostData
{
  if (-[MSDEnrollRequest isValid](self, "isValid"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDEnrollRequest registrationInfo](self, "registrationInfo"));
    id v4 = [v3 mutableCopy];

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone defaultTimeZone](&OBJC_CLASS___NSTimeZone, "defaultTimeZone"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
    [v4 setObject:v6 forKey:@"MSDTimeZone"];

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDEnrollRequest deviceName](self, "deviceName"));
    if (v7)
    {
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDEnrollRequest deviceName](self, "deviceName"));
      [v4 setObject:v8 forKey:@"DeviceName"];
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDEnrollRequest pairingCredentials](self, "pairingCredentials"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDEnrollRequest pairingCredentials](self, "pairingCredentials"));
      [v4 setObject:v10 forKey:@"PairingCredential"];
    }

    id v11 = sub_10003A95C();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100096F24((uint64_t)v4, v12);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 convertToNSData]);
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___MSDEnrollResponse, a2);
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___MSDEnrollRequest;
  id v8 = -[MSDServerRequest parseResponseForError:andPayload:](&v35, "parseResponseForError:andPayload:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);

  if (v10)
  {
    id v11 = 0LL;
    v14 = 0LL;
    goto LABEL_25;
  }

  id v34 = v6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[MSDCommandServerRequest getDataDictFromPayload:error:]( self,  "getDataDictFromPayload:error:",  v7,  &v34));
  id v12 = v34;

  if (!v11)
  {
    v14 = 0LL;
LABEL_24:
    id v6 = v12;
LABEL_25:
    v31 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);

    if (v31)
    {
      id v12 = v6;
    }

    else
    {
      id v32 = v6;
      sub_100087610(&v32, 3727744512LL, (uint64_t)@"Unexpected server response.");
      id v12 = v32;

      [v9 setError:v12];
    }

    goto LABEL_14;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Credential"]);
  if (!v14 || (uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString, v13), (objc_opt_isKindOfClass(v14, v15) & 1) == 0))
  {
    id v25 = sub_10003A95C();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_100097018(self);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Error"]);
    if (v27)
    {
      id v28 = sub_10003A95C();
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_100096F98(self);
      }

      id v33 = v12;
      sub_100087610(&v33, 3727744512LL, (uint64_t)v27);
      id v30 = v33;

      id v12 = v30;
    }

    goto LABEL_24;
  }

  [v9 setCredential:v14];
  v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Settings"]);
  if (v17)
  {
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary, v16);
    if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0) {
      [v9 setSettingsDict:v17];
    }
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"protocolVersion"]);
  if (v20)
  {
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString, v19);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0) {
      [v9 setHubProtocolVersion:v20];
    }
  }

  id v22 = sub_10003A95C();
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v37 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Enroll succeeded with response: %{public}@",  buf,  0xCu);
  }

LABEL_14:
  return v9;
}

- (NSArray)getRegistrationInfoKeys
{
  return +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"UniqueDeviceID",  @"SerialNumber",  @"ProductVersion",  @"BuildVersion",  @"ProductType",  @"InternationalMobileEquipmentIdentity",  @"xRyzf9zFE/ycr/wJPweZvQ",  @"MobileEquipmentIdentifier",  @"BatteryCurrentCapacity",  @"MSDDemoAcceptUATContent",  @"MSDDemoNANDSize",  @"MSDDemoSystemLanguage",  @"MSDDemoSystemRegion",  @"MSDNetworkInterfacesEnabled",  @"MSDCurrentWiFiSSID",  @"MSDPersistentWiFiSSID",  @"MSDCellularConfiguration",  @"MSDDemoProductDescription",  @"PartNumber",  0LL);
}

- (NSDictionary)registrationInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setRegistrationInfo:(id)a3
{
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)pairingCredentials
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setPairingCredentials:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end