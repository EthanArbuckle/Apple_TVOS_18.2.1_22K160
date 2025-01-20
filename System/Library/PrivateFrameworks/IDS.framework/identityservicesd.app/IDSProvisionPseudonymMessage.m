@interface IDSProvisionPseudonymMessage
- (BOOL)allowDualDelivery;
- (BOOL)hasRequiredKeys:(id *)a3;
- (BOOL)requiresPushTokenKeys;
- (BOOL)wantsBodySignature;
- (BOOL)wantsHTTPGet;
- (BOOL)wantsManagedRetries;
- (NSDictionary)subservicesByPrimaryService;
- (NSString)featureID;
- (NSString)pseudonymAlias;
- (NSString)scopeID;
- (NSString)userVisibleName;
- (double)anisetteHeadersTimeout;
- (double)expiryEpoch;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (unint64_t)operation;
- (void)setExpiryEpoch:(double)a3;
- (void)setFeatureID:(id)a3;
- (void)setOperation:(unint64_t)a3;
- (void)setPseudonymAlias:(id)a3;
- (void)setScopeID:(id)a3;
- (void)setSubservicesByPrimaryService:(id)a3;
- (void)setUserVisibleName:(id)a3;
@end

@implementation IDSProvisionPseudonymMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IDSProvisionPseudonymMessage;
  id v4 = -[IDSProvisionPseudonymMessage copyWithZone:](&v11, "copyWithZone:", a3);
  objc_msgSend(v4, "setOperation:", -[IDSProvisionPseudonymMessage operation](self, "operation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionPseudonymMessage pseudonymAlias](self, "pseudonymAlias"));
  [v4 setPseudonymAlias:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionPseudonymMessage featureID](self, "featureID"));
  [v4 setFeatureID:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionPseudonymMessage scopeID](self, "scopeID"));
  [v4 setScopeID:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionPseudonymMessage subservicesByPrimaryService](self, "subservicesByPrimaryService"));
  [v4 setSubservicesByPrimaryService:v8];

  -[IDSProvisionPseudonymMessage expiryEpoch](self, "expiryEpoch");
  objc_msgSend(v4, "setExpiryEpoch:");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionPseudonymMessage userVisibleName](self, "userVisibleName"));
  [v4 setUserVisibleName:v9];

  return v4;
}

- (BOOL)wantsManagedRetries
{
  return 0;
}

- (BOOL)wantsHTTPGet
{
  return 0;
}

- (BOOL)allowDualDelivery
{
  return 1;
}

- (BOOL)wantsBodySignature
{
  return 1;
}

- (id)bagKey
{
  return @"id-provision-alias";
}

- (id)requiredKeys
{
  return objc_alloc_init(&OBJC_CLASS___NSMutableArray);
}

- (id)messageBody
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionPseudonymMessage featureID](self, "featureID"));
  if (v5) {
    CFDictionarySetValue((CFMutableDictionaryRef)v4, @"featureId", v5);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionPseudonymMessage scopeID](self, "scopeID"));
  if (v6) {
    CFDictionarySetValue((CFMutableDictionaryRef)v4, @"scopeId", v6);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionPseudonymMessage subservicesByPrimaryService](self, "subservicesByPrimaryService"));
  if (v7) {
    CFDictionarySetValue((CFMutableDictionaryRef)v4, @"allowedServices", v7);
  }

  -[IDSProvisionPseudonymMessage expiryEpoch](self, "expiryEpoch");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  if (v8) {
    CFDictionarySetValue((CFMutableDictionaryRef)v4, @"expiry-epoch-seconds", v8);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionPseudonymMessage userVisibleName](self, "userVisibleName"));
  if (v9) {
    CFDictionarySetValue((CFMutableDictionaryRef)v4, @"userVisibleName", v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionPseudonymMessage pseudonymAlias](self, "pseudonymAlias"));
  if (v10) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"alias", v10);
  }

  unint64_t v11 = -[IDSProvisionPseudonymMessage operation](self, "operation");
  if (v11 > 2) {
    v12 = @"create";
  }
  else {
    v12 = off_1008FBA00[v11];
  }
  CFDictionarySetValue((CFMutableDictionaryRef)v3, @"operation", v12);
  v13 = v4;
  if (v13)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"attributes", v13);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069D9F0();
  }

  return v3;
}

- (BOOL)hasRequiredKeys:(id *)a3
{
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionPseudonymMessage selfURI](self, "selfURI"));

  if (!v6)
  {
    _IMWarn(@"Missing self identity");
    -[NSMutableArray addObject:](v5, "addObject:", @"self URI");
  }

  if (*a3 && -[NSMutableArray count](v5, "count")) {
    *a3 = v5;
  }
  if (-[NSMutableArray count](v5, "count"))
  {
    BOOL v7 = 0;
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___IDSProvisionPseudonymMessage;
    BOOL v7 = -[IDSProvisionPseudonymMessage hasRequiredKeys:](&v9, "hasRequiredKeys:", a3);
  }

  return v7;
}

- (BOOL)requiresPushTokenKeys
{
  return 1;
}

- (double)anisetteHeadersTimeout
{
  return 5.0;
}

- (unint64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(unint64_t)a3
{
  self->_operation = a3;
}

- (NSString)pseudonymAlias
{
  return self->_pseudonymAlias;
}

- (void)setPseudonymAlias:(id)a3
{
}

- (NSString)featureID
{
  return self->_featureID;
}

- (void)setFeatureID:(id)a3
{
}

- (NSString)scopeID
{
  return self->_scopeID;
}

- (void)setScopeID:(id)a3
{
}

- (NSDictionary)subservicesByPrimaryService
{
  return self->_subservicesByPrimaryService;
}

- (void)setSubservicesByPrimaryService:(id)a3
{
}

- (double)expiryEpoch
{
  return self->_expiryEpoch;
}

- (void)setExpiryEpoch:(double)a3
{
  self->_expiryEpoch = a3;
}

- (NSString)userVisibleName
{
  return self->_userVisibleName;
}

- (void)setUserVisibleName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end