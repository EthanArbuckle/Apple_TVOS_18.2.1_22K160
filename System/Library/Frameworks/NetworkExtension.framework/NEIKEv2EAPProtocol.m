@interface NEIKEv2EAPProtocol
- (BOOL)isEqual:(id)a3;
- (NEIKEv2EAPProtocol)initWithMethod:(unint64_t)a3;
- (NSDictionary)properties;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)method;
- (void)setProperties:(id)a3;
@end

@implementation NEIKEv2EAPProtocol

- (NEIKEv2EAPProtocol)initWithMethod:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEIKEv2EAPProtocol;
  v4 = -[NEIKEv2EAPProtocol init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_method = a3;
    v6 = v4;
  }

  else
  {
    ne_log_obj();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_1876B1000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", v9, 2u);
    }
  }

  return v5;
}

- (id)description
{
  unint64_t v3 = -[NEIKEv2EAPProtocol method](self, "method");
  if (v3 >= 8) {
    v4 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Unknown[%llu]",  -[NEIKEv2EAPProtocol method](self, "method"));
  }
  else {
    v4 = off_18A08CA28[v3];
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    unint64_t v6 = -[NEIKEv2EAPProtocol method](self, "method");
    uint64_t v7 = [v5 method];

    BOOL v8 = v6 == v7;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NEIKEv2EAPProtocol initWithMethod:]( +[NEIKEv2EAPProtocol allocWithZone:](&OBJC_CLASS___NEIKEv2EAPProtocol, "allocWithZone:", a3),  "initWithMethod:",  -[NEIKEv2EAPProtocol method](self, "method"));
  -[NEIKEv2EAPProtocol properties](self, "properties");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = (void *)[v5 copy];
  -[NEIKEv2EAPProtocol setProperties:](v4, "setProperties:", v6);

  return v4;
}

- (unint64_t)method
{
  return self->_method;
}

- (NSDictionary)properties
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setProperties:(id)a3
{
}

- (void).cxx_destruct
{
}

@end