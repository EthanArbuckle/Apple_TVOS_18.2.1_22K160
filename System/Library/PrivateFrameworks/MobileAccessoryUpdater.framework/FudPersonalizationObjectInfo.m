@interface FudPersonalizationObjectInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)effectiveProductionMode;
- (BOOL)effectiveSecurityMode;
- (BOOL)isEffectiveProductionModeSet;
- (BOOL)isEffectiveSecurityModeSet;
- (BOOL)isTrustedSet;
- (BOOL)trusted;
- (FudPersonalizationObjectInfo)initWithCoder:(id)a3;
- (FudPersonalizationObjectInfo)initWithTag:(id)a3;
- (NSData)digest;
- (NSString)objectTag;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDigest:(id)a3;
- (void)setEffectiveProductionMode:(BOOL)a3;
- (void)setEffectiveSecurityMode:(BOOL)a3;
- (void)setTrusted:(BOOL)a3;
@end

@implementation FudPersonalizationObjectInfo

- (FudPersonalizationObjectInfo)initWithTag:(id)a3
{
  v8 = self;
  if (a3)
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___FudPersonalizationObjectInfo;
    v8 = -[FudPersonalizationObjectInfo init](&v17, sel_init);
    if (v8)
    {
      v8->_objectTag = (NSString *)[a3 copy];
      v8->_digest = 0LL;
      v8->_trustedSet = 0;
      *(_WORD *)&v8->_esecSet = 0;
    }

    else
    {
      FudLog( 3,  (uint64_t)@"%s(): super init error\n",  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"-[FudPersonalizationObjectInfo initWithTag:]");
    }
  }

  else
  {
    FudLog( 3,  (uint64_t)@"%s(): objectTag=nil\n",  0LL,  v3,  v4,  v5,  v6,  v7,  (uint64_t)"-[FudPersonalizationObjectInfo initWithTag:]");
  }

  return v8;
}

- (void)dealloc
{
  objectTag = self->_objectTag;
  if (objectTag) {

  }
  digest = self->_digest;
  if (digest) {

  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___FudPersonalizationObjectInfo;
  -[FudPersonalizationObjectInfo dealloc](&v5, sel_dealloc);
}

- (void)setTrusted:(BOOL)a3
{
  self->_trustedSet = 1;
  self->_trusted = a3;
}

- (void)setEffectiveProductionMode:(BOOL)a3
{
  self->_eproSet = 1;
  self->_effectiveProductionMode = a3;
}

- (void)setEffectiveSecurityMode:(BOOL)a3
{
  self->_esecSet = 1;
  self->_effectiveSecurityMode = a3;
}

- (BOOL)isTrustedSet
{
  return self->_trustedSet;
}

- (BOOL)isEffectiveProductionModeSet
{
  return self->_eproSet;
}

- (BOOL)isEffectiveSecurityModeSet
{
  return self->_esecSet;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (FudPersonalizationObjectInfo)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___FudPersonalizationObjectInfo;
  uint64_t v4 = -[FudPersonalizationObjectInfo init](&v6, sel_init);
  if (v4)
  {
    v4->_objectTag = (NSString *)(id)[a3 decodeObjectForKey:@"requestObjectTag"];
    v4->_digest = (NSData *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"requestDigest"];
    v4->_trustedSet = [a3 decodeBoolForKey:@"requestTrustedSet"];
    v4->_trusted = [a3 decodeBoolForKey:@"requestTrusted"];
    v4->_esecSet = [a3 decodeBoolForKey:@"requestEffectiveSecModeSet"];
    v4->_effectiveSecurityMode = [a3 decodeBoolForKey:@"requestEffectiveSecMode"];
    v4->_eproSet = [a3 decodeBoolForKey:@"requestEffectiveProdModeSet"];
    v4->_effectiveProductionMode = [a3 decodeBoolForKey:@"requestEffectiveProdMode"];
  }

  return v4;
}

- (NSString)objectTag
{
  return self->_objectTag;
}

- (NSData)digest
{
  return self->_digest;
}

- (void)setDigest:(id)a3
{
}

- (BOOL)trusted
{
  return self->_trusted;
}

- (BOOL)effectiveProductionMode
{
  return self->_effectiveProductionMode;
}

- (BOOL)effectiveSecurityMode
{
  return self->_effectiveSecurityMode;
}

@end