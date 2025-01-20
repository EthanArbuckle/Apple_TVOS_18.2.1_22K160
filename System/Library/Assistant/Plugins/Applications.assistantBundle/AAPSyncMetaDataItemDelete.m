@interface AAPSyncMetaDataItemDelete
+ (BOOL)supportsSecureCoding;
- (AAPSyncAnchor)anchor;
- (AAPSyncMetaDataItemDelete)init;
- (AAPSyncMetaDataItemDelete)initWithAppId:(id)a3 anchor:(id)a4;
- (AAPSyncMetaDataItemDelete)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMetaDataItemDelete;
- (NSString)appId;
- (NSString)description;
- (id)scrapeAppInfo;
- (unint64_t)hash;
- (void)_validate;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AAPSyncMetaDataItemDelete

- (AAPSyncMetaDataItemDelete)initWithAppId:(id)a3 anchor:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AAPSyncMetaDataItemDelete;
  v6 = -[AAPSyncMetaDataItemDelete init](&v8, "init");
  if (v6)
  {
    v6->_appId = (NSString *)[a3 copy];
    v6->_anchor = (AAPSyncAnchor *)[a4 copy];
    -[AAPSyncMetaDataItemDelete _validate](v6, "_validate");
  }

  return v6;
}

- (AAPSyncMetaDataItemDelete)init
{
  return -[AAPSyncMetaDataItemDelete initWithAppId:anchor:](self, "initWithAppId:anchor:", 0LL, 0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AAPSyncMetaDataItemDelete;
  -[AAPSyncMetaDataItemDelete dealloc](&v3, "dealloc");
}

- (void)_validate
{
  if (!self->_appId) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncMetaDataItemDelete.m",  53LL,  @"appId cannot be nil");
  }
  if (!self->_anchor) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncMetaDataItemDelete.m",  54LL,  @"anchor cannot be nil");
  }
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___AAPSyncAnchor);
  if ((objc_opt_isKindOfClass(self->_appId, v4) & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncMetaDataItemDelete.m",  59LL,  @"appId must be a %@",  v4);
  }
  if ((objc_opt_isKindOfClass(self->_anchor, v5) & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPSyncMetaDataItemDelete.m",  60LL,  @"anchor must be a %@",  v5);
  }
}

- (id)scrapeAppInfo
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___SAAppInfo);
  -[SAAppInfo setIdentifier:](v3, "setIdentifier:", AAPSyncInfoIdentifierForAppId((uint64_t)self->_appId));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AAPSyncMetaDataItemDelete)initWithCoder:(id)a3
{
  id v5 = [a3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"appId"];
  return -[AAPSyncMetaDataItemDelete initWithAppId:anchor:]( self,  "initWithAppId:anchor:",  v5,  [a3 decodeObjectOfClass:objc_opt_class(AAPSyncAnchor) forKey:@"anchor"]);
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isMetaDataItemDelete
{
  return 1;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_appId, "hash");
  return -[AAPSyncAnchor hash](self->_anchor, "hash") + 37 * v3 + 17797;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v3 = self;
  if (self == a3)
  {
    LOBYTE(self) = self != 0LL;
  }

  else
  {
    uint64_t v5 = objc_opt_class(self);
    if (v5 == objc_opt_class(a3))
    {
      LODWORD(self) = -[NSString isEqualToString:](v3->_appId, "isEqualToString:", [a3 appId]);
      if ((_DWORD)self) {
        LOBYTE(self) = -[AAPSyncAnchor isEqualToAnchor:](v3->_anchor, "isEqualToAnchor:", [a3 anchor]);
      }
    }

    else
    {
      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p appId='%@' anchor=%@>",  objc_opt_class(self),  self,  self->_appId,  self->_anchor);
}

- (NSString)appId
{
  return self->_appId;
}

- (AAPSyncAnchor)anchor
{
  return self->_anchor;
}

@end