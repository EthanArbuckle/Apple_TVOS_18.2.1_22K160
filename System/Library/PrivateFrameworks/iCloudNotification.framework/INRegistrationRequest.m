@interface INRegistrationRequest
+ (Class)responseClass;
+ (id)bodyParameterValueForRegistrationReason:(unint64_t)a3;
- (id)addBodyParameters:(id)a3;
- (id)urlString;
- (unint64_t)registrationReason;
- (void)setRegistrationReason:(unint64_t)a3;
@end

@implementation INRegistrationRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___INRegistrationResponse, a2);
}

- (id)urlString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AAURLConfiguration urlConfiguration](&OBJC_CLASS___AAURLConfiguration, "urlConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 registerDeviceURL]);

  return v3;
}

+ (id)bodyParameterValueForRegistrationReason:(unint64_t)a3
{
  if (a3 > 9) {
    return @"unknown";
  }
  else {
    return *(&off_1000249D0 + a3);
  }
}

- (id)addBodyParameters:(id)a3
{
  id v4 = [a3 mutableCopy];
  v55 = (void *)objc_claimAutoreleasedReturnValue( +[INRegistrationRequest bodyParameterValueForRegistrationReason:]( &OBJC_CLASS___INRegistrationRequest,  "bodyParameterValueForRegistrationReason:",  self->_registrationReason));
  objc_msgSend(v4, "setObject:forKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[INRequest account](self, "account"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 enabledDataclasses]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
  id v8 = [v7 mutableCopy];

  [v8 sortUsingComparator:&stru_1000249B0];
  if (v8) {
    [v4 setObject:v8 forKeyedSubscript:@"enabledDataClasses"];
  }
  v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"deviceInfo"]);
  if (!v9) {
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[INRequest deviceInfoProvider](self, "deviceInfoProvider"));
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 productVersion]);

  if (v11) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v11,  @"productVersion");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[INRequest deviceInfoProvider](self, "deviceInfoProvider"));
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 productType]);

  if (v13) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v13, @"productType");
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[INRequest deviceInfoProvider](self, "deviceInfoProvider"));
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 deviceClass]);

  if (v15) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v15, @"deviceClass");
  }
  v53 = (void *)v11;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[INRequest deviceInfoProvider](self, "deviceInfoProvider"));
  uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 deviceName]);

  if (v17) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v17, @"deviceName");
  }
  v50 = (void *)v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[INRequest deviceInfoProvider](self, "deviceInfoProvider"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 storageCapacity]);
  uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 stringValue]);

  if (v20) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v20,  @"storageCapacity");
  }
  v56 = v4;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[INRequest deviceInfoProvider](self, "deviceInfoProvider"));
  unsigned int v22 = [v21 hasCellularCapability];

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v23,  @"hasCellularCapability");
  }

  v54 = v8;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[INCachedDeviceInfo currentDeviceInfo](&OBJC_CLASS___INCachedDeviceInfo, "currentDeviceInfo"));
  uint64_t v25 = objc_claimAutoreleasedReturnValue([v24 mobileEquipmentIdentifier]);

  if (v25) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v25, @"meid");
  }
  v52 = (void *)v13;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[INRequest deviceInfoProvider](self, "deviceInfoProvider"));
  uint64_t v27 = objc_claimAutoreleasedReturnValue([v26 internationalMobileEquipmentIdentity]);

  if (v27) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v27, @"imei");
  }
  v51 = (void *)v15;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[INRequest deviceInfoProvider](self, "deviceInfoProvider"));
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 deviceColor]);

  if (v29) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v29, @"deviceColor");
  }
  v49 = (void *)v20;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[INCachedDeviceInfo currentDeviceInfo](&OBJC_CLASS___INCachedDeviceInfo, "currentDeviceInfo"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 deviceEnclosureColor]);

  if (v31) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v31,  @"enclosureColor");
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[INRequest deviceInfoProvider](self, "deviceInfoProvider"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 deviceCoverGlassColor]);

  if (v33) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v33,  @"deviceCoverGlassColor");
  }
  v48 = (void *)v25;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[INRequest deviceInfoProvider](self, "deviceInfoProvider"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 deviceHousingColor]);

  if (v35) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v35,  @"deviceHousingColor");
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[INRequest deviceInfoProvider](self, "deviceInfoProvider", v27));
  v37 = (void *)objc_claimAutoreleasedReturnValue([v36 deviceBackingColor]);

  if (v37) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v37,  @"deviceBackingColor");
  }
  [v4 setObject:v9 forKeyedSubscript:@"deviceInfo"];
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[INRequest account](self, "account"));
  id v39 = objc_msgSend(v38, "aa_isSuspended");

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v39));
  [v4 setObject:v40 forKeyedSubscript:@"isAccountInGrayMode"];

  if ((_DWORD)v39)
  {
    id v41 = objc_alloc_init(&OBJC_CLASS___AAFollowUpController);
    uint64_t v57 = AAFollowUpIdentifierVerifyTerms;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v57, 1LL));
    v43 = (void *)objc_claimAutoreleasedReturnValue([v41 creationDateOfOldestFollowUpWithIdentifiers:v42]);

    [v43 timeIntervalSince1970];
    if (v44 == 0.0) {
      double v44 = -1.0;
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v44));
    [v56 setObject:v45 forKeyedSubscript:@"verifyTermsCFUTimestamp"];

    id v4 = v56;
  }

  return v4;
}

- (unint64_t)registrationReason
{
  return self->_registrationReason;
}

- (void)setRegistrationReason:(unint64_t)a3
{
  self->_registrationReason = a3;
}

@end