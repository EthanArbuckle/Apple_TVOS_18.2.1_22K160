@interface IDSGetFeatureToggleStateMessage
- (NSString)featureID;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)setFeatureID:(id)a3;
@end

@implementation IDSGetFeatureToggleStateMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IDSGetFeatureToggleStateMessage;
  id v4 = -[IDSGetFeatureToggleStateMessage copyWithZone:](&v7, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetFeatureToggleStateMessage featureID](self, "featureID"));
  [v4 setFeatureID:v5];

  return v4;
}

- (id)bagKey
{
  return @"id-get-user-flag";
}

- (id)requiredKeys
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v2, "addObject:", @"user-flag");
  return v2;
}

- (id)messageBody
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSGetFeatureToggleStateMessage;
  id v3 = -[IDSGetFeatureToggleStateMessage messageBody](&v8, "messageBody");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetFeatureToggleStateMessage featureID](self, "featureID"));
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"user-flag", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A7074();
  }

  return Mutable;
}

- (NSString)featureID
{
  return self->_featureID;
}

- (void)setFeatureID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end