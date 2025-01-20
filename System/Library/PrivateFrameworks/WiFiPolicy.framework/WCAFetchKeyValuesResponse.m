@interface WCAFetchKeyValuesResponse
+ (BOOL)supportsSecureCoding;
- (NSDictionary)keyValues;
- (WCAFetchKeyValuesResponse)initWithCoder:(id)a3;
- (WCAFetchKeyValuesResponse)initWithKeyValues:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setKeyValues:(id)a3;
@end

@implementation WCAFetchKeyValuesResponse

- (WCAFetchKeyValuesResponse)initWithKeyValues:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___WCAFetchKeyValuesResponse;
  id v3 = a3;
  v4 = -[WCAFetchKeyValuesResponse init](&v6, sel_init);
  -[WCAFetchKeyValuesResponse setKeyValues:](v4, "setKeyValues:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x189607940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ : %p ", v5, self];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 appendFormat:@"key/values: %@", self->_keyValues];
  [v6 appendString:@">"];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WCAFetchKeyValuesResponse;
  id v4 = a3;
  -[WCAFetchResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyValues, @"_keyValues", v5.receiver, v5.super_class);
}

- (WCAFetchKeyValuesResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___WCAFetchKeyValuesResponse;
  objc_super v5 = -[WCAFetchResponse initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"_keyValues"];
    keyValues = v5->_keyValues;
    v5->_keyValues = (NSDictionary *)v10;
  }

  return v5;
}

- (NSDictionary)keyValues
{
  return self->_keyValues;
}

- (void)setKeyValues:(id)a3
{
}

- (void).cxx_destruct
{
}

@end