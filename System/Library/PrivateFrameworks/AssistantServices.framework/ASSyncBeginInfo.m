@interface ASSyncBeginInfo
- (NSSet)reasons;
- (NSString)anchor;
- (NSString)applicationBundleIdentifier;
- (NSString)intentSlotName;
- (NSString)key;
- (NSString)resetValidity;
- (NSString)validity;
- (SASyncAppMetaData)appMetadata;
- (id)description;
- (int64_t)count;
- (void)resetWithValidity:(id)a3;
- (void)setAnchor:(id)a3;
- (void)setAppMetadata:(id)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setIntentSlotName:(id)a3;
- (void)setKey:(id)a3;
- (void)setReasons:(id)a3;
- (void)setResetValidity:(id)a3;
- (void)setValidity:(id)a3;
@end

@implementation ASSyncBeginInfo

- (void)resetWithValidity:(id)a3
{
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ASSyncBeginInfo;
  id v3 = -[ASSyncBeginInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASSyncBeginInfo resetValidity](self, "resetValidity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingFormat:@" reset validity: %@", v5]);

  return v6;
}

- (NSString)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
}

- (NSString)validity
{
  return self->_validity;
}

- (void)setValidity:(id)a3
{
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (NSString)intentSlotName
{
  return self->_intentSlotName;
}

- (void)setIntentSlotName:(id)a3
{
}

- (SASyncAppMetaData)appMetadata
{
  return self->_appMetadata;
}

- (void)setAppMetadata:(id)a3
{
}

- (NSSet)reasons
{
  return self->_reasons;
}

- (void)setReasons:(id)a3
{
}

- (NSString)resetValidity
{
  return self->_resetValidity;
}

- (void)setResetValidity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end