@interface MSCMSAppleHashAgilityAttribute
- (MSCMSAppleHashAgilityAttribute)initWithAttribute:(id)a3 error:(id *)a4;
- (MSCMSAppleHashAgilityAttribute)initWithHashAgilityValue:(id)a3;
- (MSOID)attributeType;
- (NSData)hashAgilityValue;
- (id)encodeAttributeWithError:(id *)a3;
@end

@implementation MSCMSAppleHashAgilityAttribute

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:error:]( &OBJC_CLASS___MSOID,  "OIDWithString:error:",  @"1.2.840.113635.100.9.1",  0LL);
}

- (MSCMSAppleHashAgilityAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___MSCMSAppleHashAgilityAttribute;
  v7 = -[MSCMSAppleHashAgilityAttribute init](&v22, sel_init);
  [v6 attributeValues];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 count];

  if (v9 != 1)
  {
    if (a4)
    {
      v13 = MSErrorCMSDomain[0];
      id v15 = *a4;
      v16 = @"Apple Hash Agility Attribute should only have one value";
      uint64_t v14 = -50LL;
      goto LABEL_7;
    }

- (MSCMSAppleHashAgilityAttribute)initWithHashAgilityValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MSCMSAppleHashAgilityAttribute;
  id v6 = -[MSCMSAppleHashAgilityAttribute init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_hashAgilityValue, a3);
  }

  return v7;
}

- (id)encodeAttributeWithError:(id *)a3
{
  v22[1] = *MEMORY[0x1895F89C0];
  -[NSData length](self->_hashAgilityValue, "length");
  -[NSData bytes](self->_hashAgilityValue, "bytes");
  uint64_t v5 = length_AppleHashAgilityValue();
  [MEMORY[0x189603FB8] dataWithLength:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    uint64_t v10 = 12LL;
    if (!a3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  id v7 = v6;
  [v7 mutableBytes];
  int v8 = encode_AppleHashAgilityValue();
  if (v8)
  {
    int v9 = v8;

    uint64_t v10 = v9;
    if (!a3)
    {
LABEL_5:
      id v7 = 0LL;
      goto LABEL_9;
    }

- (NSData)hashAgilityValue
{
  return (NSData *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end