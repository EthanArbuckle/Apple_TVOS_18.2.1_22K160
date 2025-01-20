@interface IDSFeatureToggleMessage
- (NSString)featureID;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (unint64_t)state;
- (void)setFeatureID:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation IDSFeatureToggleMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IDSFeatureToggleMessage;
  id v4 = -[IDSFeatureToggleMessage copyWithZone:](&v7, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSFeatureToggleMessage featureID](self, "featureID"));
  [v4 setFeatureID:v5];

  objc_msgSend(v4, "setState:", -[IDSFeatureToggleMessage state](self, "state"));
  return v4;
}

- (id)bagKey
{
  return @"id-set-user-flag";
}

- (id)requiredKeys
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v2, "addObject:", @"user-flag");
  -[NSMutableArray addObject:](v2, "addObject:", @"user-flag-status");
  return v2;
}

- (id)messageBody
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IDSFeatureToggleMessage;
  id v3 = -[IDSFeatureToggleMessage messageBody](&v10, "messageBody");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSFeatureToggleMessage featureID](self, "featureID"));
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"user-flag", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A7074();
  }

  unint64_t v7 = -[IDSFeatureToggleMessage state](self, "state");
  if (v7 == 1)
  {
    v8 = @"enabled";
    goto LABEL_11;
  }

  if (v7 == 2)
  {
    v8 = @"disabled";
LABEL_11:
    CFDictionarySetValue(Mutable, @"user-flag-status", v8);
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

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
}

@end