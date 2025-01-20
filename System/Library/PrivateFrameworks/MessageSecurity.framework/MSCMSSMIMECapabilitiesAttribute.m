@interface MSCMSSMIMECapabilitiesAttribute
- (MSCMSSMIMECapabilitiesAttribute)init;
- (MSCMSSMIMECapabilitiesAttribute)initWithAttribute:(id)a3 error:(id *)a4;
- (MSCMSSMIMECapabilitiesAttribute)initWithCapabilities:(id)a3;
- (MSOID)attributeType;
- (NSSet)capabilities;
- (id)copyAttributeData:(id *)a3;
- (id)encodeAttributeWithError:(id *)a3;
@end

@implementation MSCMSSMIMECapabilitiesAttribute

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.15", 0LL);
}

- (MSCMSSMIMECapabilitiesAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___MSCMSSMIMECapabilitiesAttribute;
  v7 = -[MSCMSSMIMECapabilitiesAttribute init](&v29, sel_init);
  [v6 attributeType];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = [v8 isEqualToString:@"1.2.840.113549.1.9.15"];

  if ((v9 & 1) == 0)
  {
    if (a4)
    {
      v15 = MSErrorCMSDomain[0];
      id v17 = *a4;
      v18 = @"Not an SMIMECapabilities attribute according to AttributeType";
      uint64_t v16 = -26275LL;
      goto LABEL_10;
    }

- (MSCMSSMIMECapabilitiesAttribute)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MSCMSSMIMECapabilitiesAttribute;
  v2 = -[MSCMSSMIMECapabilitiesAttribute init](&v12, sel_init);
  [MEMORY[0x189603FE0] set];
  v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
  for (uint64_t i = 0LL; i != 56; i += 8LL)
  {
    v5 = objc_alloc(&OBJC_CLASS___MSOID);
    uint64_t v6 = *(uint64_t *)((char *)&off_189B4ABC0 + i);
    id v11 = 0LL;
    v7 = -[MSOID initWithAsn1OID:error:](v5, "initWithAsn1OID:error:", v6, &v11);
    id v8 = v11;
    -[NSSet addObject:](v3, "addObject:", v7);
  }

  capabilities = v2->_capabilities;
  v2->_capabilities = v3;

  return v2;
}

- (MSCMSSMIMECapabilitiesAttribute)initWithCapabilities:(id)a3
{
  v4 = (NSSet *)a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MSCMSSMIMECapabilitiesAttribute;
  v5 = -[MSCMSSMIMECapabilitiesAttribute init](&v8, sel_init);
  capabilities = v5->_capabilities;
  v5->_capabilities = v4;

  return v5;
}

- (id)copyAttributeData:(id *)a3
{
  v23[1] = *MEMORY[0x1895F89C0];
  capabilities = self->_capabilities;
  if (!capabilities) {
    return 0LL;
  }
  unsigned int v20 = -[NSSet count](capabilities, "count");
  uint64_t v6 = malloc(24LL * v20);
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x2020000000LL;
  v19[3] = 0LL;
  v7 = self->_capabilities;
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __53__MSCMSSMIMECapabilitiesAttribute_copyAttributeData___block_invoke;
  v18[3] = &unk_189B4AC00;
  v18[4] = v19;
  v18[5] = v6;
  -[NSSet enumerateObjectsUsingBlock:](v7, "enumerateObjectsUsingBlock:", v18);
  uint64_t v21 = v6;
  uint64_t v8 = length_SMIMECapabilities();
  [MEMORY[0x189603FB8] dataWithLength:v8];
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    uint64_t v12 = 12LL;
    if (!a3)
    {
LABEL_9:
      id v10 = 0LL;
LABEL_11:
      free(v6);
      uint64_t v21 = 0LL;
      id v13 = v10;
      _Block_object_dispose(v19, 8);

      return v13;
    }

uint64_t __53__MSCMSSMIMECapabilitiesAttribute_copyAttributeData___block_invoke(uint64_t a1, void *a2)
{
  v3 = (uint64_t *)(*(void *)(a1 + 40) + 24LL * *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
  uint64_t result = [a2 Asn1OID];
  uint64_t *v3 = result;
  v3[1] = v5;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

- (id)encodeAttributeWithError:(id *)a3
{
  id v4 = -[MSCMSSMIMECapabilitiesAttribute copyAttributeData:](self, "copyAttributeData:");
  if (v4)
  {
    uint64_t v5 = objc_alloc(&OBJC_CLASS___MSCMSAttribute);
    +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.15", a3);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603F18] arrayWithObject:v4];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = -[MSCMSAttribute initWithAttributeType:values:](v5, "initWithAttributeType:values:", v6, v7);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (NSSet)capabilities
{
  return (NSSet *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end