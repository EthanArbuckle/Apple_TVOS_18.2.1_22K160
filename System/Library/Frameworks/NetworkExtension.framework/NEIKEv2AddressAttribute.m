@interface NEIKEv2AddressAttribute
+ (id)copyTypeDescription;
- (NEIKEv2AddressAttribute)initWithAddress:(id)a3;
- (NWAddressEndpoint)address;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initCustomWithAttributeType:(unint64_t)a3 attributeName:(id)a4 addressValue:(id)a5;
- (unint64_t)attributeType;
@end

@implementation NEIKEv2AddressAttribute

- (NEIKEv2AddressAttribute)initWithAddress:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NEIKEv2AddressAttribute;
  v5 = -[NEIKEv2AddressAttribute init](&v13, sel_init);
  v7 = v5;
  if (v5)
  {
    objc_setProperty_atomic(v5, v6, @"AssignedAddress", 8LL);
    objc_setProperty_atomic(v7, v8, v4, 16LL);
    v9 = v7;
  }

  else
  {
    ne_log_obj();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_fault_impl(&dword_1876B1000, v11, OS_LOG_TYPE_FAULT, "[super init] failed", v12, 2u);
    }
  }

  return v7;
}

- (id)initCustomWithAttributeType:(unint64_t)a3 attributeName:(id)a4 addressValue:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NEIKEv2AddressAttribute;
  v10 = -[NEIKEv2AddressAttribute init](&v18, sel_init);
  v12 = v10;
  if (v10)
  {
    v10->_customType = a3;
    objc_setProperty_atomic(v10, v11, v8, 8LL);
    objc_setProperty_atomic(v12, v13, v9, 16LL);
    v14 = v12;
  }

  else
  {
    ne_log_obj();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      v17[0] = 0;
      _os_log_fault_impl(&dword_1876B1000, v16, OS_LOG_TYPE_FAULT, "[super init] failed", (uint8_t *)v17, 2u);
    }
  }

  return v12;
}

- (unint64_t)attributeType
{
  if (self) {
    return *(void *)(self + 24);
  }
  return self;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  -[NEIKEv2ConfigurationAttribute attributeName](self, "attributeName");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"Name" andIndent:v5 options:a4];

  String = (__CFString *)NEIKEv2AttributeTypeCreateString(-[NEIKEv2AddressAttribute attributeType](self, "attributeType"));
  [v7 appendPrettyObject:String withName:@"Type" andIndent:v5 options:a4];

  v10 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v10 withName:@"Payload Type" andIndent:v5 options:a4];
  v11 = -[NEIKEv2AddressAttribute address](self, "address");
  [v7 appendPrettyObject:v11 withName:@"Address" andIndent:v5 options:a4];

  return v7;
}

- (id)description
{
  return -[NEIKEv2AddressAttribute descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t v5 = -[NEIKEv2AddressAttribute attributeType](self, "attributeType");
  v6 = -[NEIKEv2ConfigurationAttribute attributeName](self, "attributeName");
  v7 = -[NEIKEv2AddressAttribute address](self, "address");
  id v8 = (void *)[v7 copy];
  id v9 = (void *)[v4 initCustomWithAttributeType:v5 attributeName:v6 addressValue:v8];

  return v9;
}

- (NWAddressEndpoint)address
{
  return (NWAddressEndpoint *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

+ (id)copyTypeDescription
{
  return @"Address";
}

@end