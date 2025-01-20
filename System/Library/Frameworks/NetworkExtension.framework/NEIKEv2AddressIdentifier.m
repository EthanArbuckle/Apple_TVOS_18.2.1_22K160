@interface NEIKEv2AddressIdentifier
+ (id)copyTypeDescription;
- (NEIKEv2AddressIdentifier)initWithAddress:(id)a3;
- (NWAddressEndpoint)address;
- (id)identifierData;
- (id)stringValue;
- (unint64_t)identifierType;
@end

@implementation NEIKEv2AddressIdentifier

- (NEIKEv2AddressIdentifier)initWithAddress:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!v4)
  {
    ne_log_obj();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[NEIKEv2AddressIdentifier initWithAddress:]";
      _os_log_fault_impl(&dword_1876B1000, v10, OS_LOG_TYPE_FAULT, "%s called with null address", buf, 0xCu);
    }

    goto LABEL_10;
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NEIKEv2AddressIdentifier;
  v5 = -[NEIKEv2AddressIdentifier init](&v11, sel_init);
  if (!v5)
  {
    ne_log_obj();
    self = (NEIKEv2AddressIdentifier *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)self, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1876B1000, (os_log_t)self, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }

- (unint64_t)identifierType
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v3 = -[NEIKEv2AddressIdentifier address](self, "address");
  uint64_t v4 = [v3 addressFamily];

  if (v4 == 2) {
    return 1LL;
  }
  v6 = -[NEIKEv2AddressIdentifier address](self, "address");
  uint64_t v7 = [v6 addressFamily];

  if (v7 == 30) {
    return 5LL;
  }
  ne_log_obj();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = -[NEIKEv2AddressIdentifier address](self, "address");
    v10[0] = 67109120;
    v10[1] = [v9 addressFamily];
    _os_log_error_impl(&dword_1876B1000, v8, OS_LOG_TYPE_ERROR, "Unknown address family %u", (uint8_t *)v10, 8u);
  }

  return 0LL;
}

- (id)identifierData
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v3 = -[NEIKEv2AddressIdentifier address](self, "address");
  uint64_t v4 = [v3 addressFamily];
  v5 = -[NEIKEv2AddressIdentifier address](self, "address");
  v6 = v5;
  if (v4 == 2)
  {
    uint64_t v7 = [v5 address];

    id v8 = objc_alloc(MEMORY[0x189603F48]);
    uint64_t v9 = v7 + 4;
    uint64_t v10 = 4LL;
LABEL_5:
    uint64_t v14 = (void *)[v8 initWithBytes:v9 length:v10];
    return v14;
  }

  uint64_t v11 = [v5 addressFamily];

  if (v11 == 30)
  {
    v12 = -[NEIKEv2AddressIdentifier address](self, "address");
    uint64_t v13 = [v12 address];

    id v8 = objc_alloc(MEMORY[0x189603F48]);
    uint64_t v9 = v13 + 8;
    uint64_t v10 = 16LL;
    goto LABEL_5;
  }

  ne_log_obj();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v17 = -[NEIKEv2AddressIdentifier address](self, "address");
    v18[0] = 67109120;
    v18[1] = [v17 addressFamily];
    _os_log_error_impl(&dword_1876B1000, v15, OS_LOG_TYPE_ERROR, "Unknown address family %u", (uint8_t *)v18, 8u);
  }

  uint64_t v14 = 0LL;
  return v14;
}

- (id)stringValue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 hostname];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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