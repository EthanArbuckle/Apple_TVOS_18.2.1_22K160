@interface WCAFetchKeyValuesRequest
+ (BOOL)supportsSecureCoding;
- (NSArray)keys;
- (WCAFetchKeyValuesRequest)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setKeys:(id)a3;
@end

@implementation WCAFetchKeyValuesRequest

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ : %p ", v5, self];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 appendFormat:@"keys: %@", self->_keys];
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
  v5.super_class = (Class)&OBJC_CLASS___WCAFetchKeyValuesRequest;
  id v4 = a3;
  -[WCAFetchRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_keys, @"_keys", v5.receiver, v5.super_class);
}

- (WCAFetchKeyValuesRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___WCAFetchKeyValuesRequest;
  objc_super v5 = -[WCAFetchRequest initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_keys"];
    keys = v5->_keys;
    v5->_keys = (NSArray *)v9;
  }

  return v5;
}

- (NSArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end