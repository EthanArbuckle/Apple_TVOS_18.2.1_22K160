@interface NEIKEv2CustomPayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)type;
@end

@implementation NEIKEv2CustomPayload

- (unint64_t)type
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
  v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  if (self)
  {
    [v7 appendPrettyInt:self->_customType withName:@"Custom Type" andIndent:v5 options:a4];
    id Property = objc_getProperty(self, v9, 32LL, 1);
  }

  else
  {
    [v7 appendPrettyInt:0 withName:@"Custom Type" andIndent:v5 options:a4];
    id Property = 0LL;
  }

  [v7 appendPrettyObject:Property withName:@"Custom Data" andIndent:v5 options:a4];
  return v7;
}

- (BOOL)hasRequiredFields
{
  if (self)
  {
    if (self->_customType) {
      LOBYTE(self) = objc_getProperty(self, a2, 32LL, 1) != 0LL;
    }
    else {
      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

- (BOOL)generatePayloadData
{
  if (self)
  {
    if (objc_getProperty(self, a2, 16LL, 1))
    {
LABEL_5:
      id Property = objc_getProperty(self, v3, 16LL, 1);
      return Property != 0LL;
    }

    if (-[NEIKEv2CustomPayload hasRequiredFields](self, "hasRequiredFields"))
    {
      id v5 = objc_getProperty(self, v4, 32LL, 1);
      objc_setProperty_atomic(self, v6, v5, 16LL);

      goto LABEL_5;
    }
  }

  else
  {
    char v9 = [0 hasRequiredFields];
    id Property = 0LL;
    if ((v9 & 1) != 0) {
      return Property != 0LL;
    }
  }

  ne_log_obj();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_error_impl(&dword_1876B1000, v10, OS_LOG_TYPE_ERROR, "Custom payload missing required fields", v11, 2u);
  }

  return 0;
}

- (BOOL)parsePayloadData
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (self && objc_getProperty(self, a2, 16LL, 1))
  {
    id v4 = objc_getProperty(self, v3, 16LL, 1);
    objc_setProperty_atomic(self, v5, v4, 32LL);

    return -[NEIKEv2CustomPayload hasRequiredFields](self, "hasRequiredFields");
  }

  else
  {
    ne_log_obj();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315138;
      char v9 = "-[NEIKEv2CustomPayload parsePayloadData]";
      _os_log_fault_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_FAULT,  "%s called with null self.payloadData",  (uint8_t *)&v8,  0xCu);
    }

    return 0;
  }

- (void).cxx_destruct
{
}

+ (id)copyTypeDescription
{
  return @"Custom";
}

@end