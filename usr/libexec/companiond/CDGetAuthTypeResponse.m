@interface CDGetAuthTypeResponse
- (BOOL)isSandboxPurchase;
- (CDGetAuthTypeResponse)initWithRapportDictionary:(id)a3;
- (NSString)description;
- (id)makeRapportDictionary;
- (int64_t)authType;
- (unint64_t)authFlags;
- (void)setAuthFlags:(unint64_t)a3;
- (void)setAuthType:(int64_t)a3;
- (void)setSandboxPurchase:(BOOL)a3;
@end

@implementation CDGetAuthTypeResponse

- (CDGetAuthTypeResponse)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CDGetAuthTypeResponse;
  v5 = -[CDGetAuthTypeResponse init](&v11, "init");
  if (v5)
  {
    uint64_t NSNumber = NSDictionaryGetNSNumber(v4, @"authType", 0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    v5->_authType = (int64_t)[v7 integerValue];

    v5->_sandboxPurchase = CFDictionaryGetInt64(v4, @"sandboxPurchase", 0LL) != 0;
    uint64_t v8 = NSDictionaryGetNSNumber(v4, @"authFlags", 0LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v5->_authFlags = (unint64_t)[v9 integerValue];
  }

  return v5;
}

- (id)makeRapportDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_authType));
  [v3 setObject:v4 forKeyedSubscript:@"authType"];

  if (self->_sandboxPurchase) {
    v5 = &__kCFBooleanTrue;
  }
  else {
    v5 = 0LL;
  }
  [v3 setObject:v5 forKeyedSubscript:@"sandboxPurchase"];
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_authFlags));
  [v3 setObject:v6 forKeyedSubscript:@"authFlags"];

  id v7 = [v3 copy];
  return v7;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  unint64_t v4 = self->_authType - 1;
  if (v4 >= 0xE) {
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %ld)",  self->_authType));
  }
  else {
    v5 = off_100031080[v4];
  }
  [v3 appendString:v5 withName:@"authType"];

  id v6 = [v3 appendBool:self->_sandboxPurchase withName:@"sandboxPurchase" ifEqualTo:1];
  id v7 = [v3 appendInteger:self->_authFlags withName:@"authFlags"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v8;
}

- (int64_t)authType
{
  return self->_authType;
}

- (void)setAuthType:(int64_t)a3
{
  self->_authType = a3;
}

- (BOOL)isSandboxPurchase
{
  return self->_sandboxPurchase;
}

- (void)setSandboxPurchase:(BOOL)a3
{
  self->_sandboxPurchase = a3;
}

- (unint64_t)authFlags
{
  return self->_authFlags;
}

- (void)setAuthFlags:(unint64_t)a3
{
  self->_authFlags = a3;
}

@end