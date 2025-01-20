@interface CSDCTCallCapabilities
+ (id)callCapabilitiesForCTCallCapabilities:(id)a3;
+ (id)callCapabilitiesForCallManagementStateInfo:(id)a3;
- (BOOL)isCSCallingAvailable;
- (BOOL)isVoLTECallingAvailable;
- (BOOL)isWiFiCallingAvailable;
- (BOOL)isWiFiEmergencyCallingAllowed;
- (BOOL)isWiFiEmergencyCallingAvailable;
- (id)debugDescription;
- (void)setCsCallingAvailable:(BOOL)a3;
- (void)setVoLTECallingAvailable:(BOOL)a3;
- (void)setWiFiCallingAvailable:(BOOL)a3;
- (void)setWiFiEmergencyCallingAllowed:(BOOL)a3;
- (void)setWiFiEmergencyCallingAvailable:(BOOL)a3;
@end

@implementation CSDCTCallCapabilities

+ (id)callCapabilitiesForCTCallCapabilities:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___CSDCTCallCapabilities);
  -[CSDCTCallCapabilities setCsCallingAvailable:]( v4,  "setCsCallingAvailable:",  [v3 isCSCallingAvailable]);
  -[CSDCTCallCapabilities setVoLTECallingAvailable:]( v4,  "setVoLTECallingAvailable:",  [v3 isVoLTECallingAvailable]);
  -[CSDCTCallCapabilities setWiFiCallingAvailable:]( v4,  "setWiFiCallingAvailable:",  [v3 isWifiCallingAvailable]);
  -[CSDCTCallCapabilities setWiFiEmergencyCallingAllowed:]( v4,  "setWiFiEmergencyCallingAllowed:",  [v3 isEmergencyCallingOnWifiAllowed]);
  id v5 = [v3 isEmergencyCallingOnWifiAvailable];

  -[CSDCTCallCapabilities setWiFiEmergencyCallingAvailable:](v4, "setWiFiEmergencyCallingAvailable:", v5);
  return v4;
}

+ (id)callCapabilitiesForCallManagementStateInfo:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___CSDCTCallCapabilities);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kCTCallManagementPhoneServicesCSCallingAvailable]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0) {
    -[CSDCTCallCapabilities setCsCallingAvailable:](v4, "setCsCallingAvailable:", [v5 BOOLValue]);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kCTCallManagementPhoneServicesVoLTECallingAvailable]);

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0) {
    -[CSDCTCallCapabilities setVoLTECallingAvailable:](v4, "setVoLTECallingAvailable:", [v8 BOOLValue]);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kCTCallManagementIsPhoneServicesActive]);

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber, v12);
  if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0) {
    -[CSDCTCallCapabilities setWiFiCallingAvailable:](v4, "setWiFiCallingAvailable:", [v11 BOOLValue]);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kCTCallManagementEmergencyWifiAllowed]);

  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNumber, v15);
  if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0) {
    -[CSDCTCallCapabilities setWiFiEmergencyCallingAllowed:]( v4,  "setWiFiEmergencyCallingAllowed:",  [v14 BOOLValue]);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kCTCallManagementEmergencyWifiCallCapable]);

  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber, v18);
  if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0) {
    -[CSDCTCallCapabilities setWiFiEmergencyCallingAvailable:]( v4,  "setWiFiEmergencyCallingAvailable:",  [v17 BOOLValue]);
  }

  return v4;
}

- (id)debugDescription
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"<%@ %p ", objc_opt_class(self, v4), self);
  id v5 = NSStringFromSelector("isCSCallingAvailable");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CSDCTCallCapabilities isCSCallingAvailable](self, "isCSCallingAvailable")));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@=%@", v6, v7);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v8 = NSStringFromSelector("isVoLTECallingAvailable");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CSDCTCallCapabilities isVoLTECallingAvailable](self, "isVoLTECallingAvailable")));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@=%@", v9, v10);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v11 = NSStringFromSelector("isWiFiCallingAvailable");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CSDCTCallCapabilities isWiFiCallingAvailable](self, "isWiFiCallingAvailable")));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@=%@", v12, v13);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v14 = NSStringFromSelector("isWiFiEmergencyCallingAllowed");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CSDCTCallCapabilities isWiFiEmergencyCallingAllowed](self, "isWiFiEmergencyCallingAllowed")));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@=%@", v15, v16);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @", ");
  v17 = NSStringFromSelector("isWiFiEmergencyCallingAvailable");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CSDCTCallCapabilities isWiFiEmergencyCallingAvailable](self, "isWiFiEmergencyCallingAvailable")));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@=%@", v18, v19);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @">");
  id v20 = -[NSMutableString copy](v3, "copy");

  return v20;
}

- (BOOL)isCSCallingAvailable
{
  return self->_csCallingAvailable;
}

- (void)setCsCallingAvailable:(BOOL)a3
{
  self->_csCallingAvailable = a3;
}

- (BOOL)isVoLTECallingAvailable
{
  return self->_voLTECallingAvailable;
}

- (void)setVoLTECallingAvailable:(BOOL)a3
{
  self->_voLTECallingAvailable = a3;
}

- (BOOL)isWiFiCallingAvailable
{
  return self->_wiFiCallingAvailable;
}

- (void)setWiFiCallingAvailable:(BOOL)a3
{
  self->_wiFiCallingAvailable = a3;
}

- (BOOL)isWiFiEmergencyCallingAllowed
{
  return self->_wiFiEmergencyCallingAllowed;
}

- (void)setWiFiEmergencyCallingAllowed:(BOOL)a3
{
  self->_wiFiEmergencyCallingAllowed = a3;
}

- (BOOL)isWiFiEmergencyCallingAvailable
{
  return self->_wiFiEmergencyCallingAvailable;
}

- (void)setWiFiEmergencyCallingAvailable:(BOOL)a3
{
  self->_wiFiEmergencyCallingAvailable = a3;
}

@end