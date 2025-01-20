@interface NEIKEv2KEMProtocol
- (BOOL)isEqual:(id)a3;
- (NEIKEv2KEMProtocol)initWithMethod:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)method;
@end

@implementation NEIKEv2KEMProtocol

- (NEIKEv2KEMProtocol)initWithMethod:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEIKEv2KEMProtocol;
  v4 = -[NEIKEv2KEMProtocol init](&v10, sel_init);
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
  unint64_t v3 = -[NEIKEv2KEMProtocol method](self, "method");
  if (v3 < 0x26 && ((0x31803FC027uLL >> v3) & 1) != 0) {
    v4 = off_18A08CC78[v3];
  }
  else {
    v4 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Unknown[%llu]",  -[NEIKEv2KEMProtocol method](self, "method"));
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    unint64_t v6 = -[NEIKEv2KEMProtocol method](self, "method");
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
  return -[NEIKEv2KEMProtocol initWithMethod:]( +[NEIKEv2KEMProtocol allocWithZone:](&OBJC_CLASS___NEIKEv2KEMProtocol, "allocWithZone:", a3),  "initWithMethod:",  -[NEIKEv2KEMProtocol method](self, "method"));
}

- (unint64_t)method
{
  return self->_method;
}

@end