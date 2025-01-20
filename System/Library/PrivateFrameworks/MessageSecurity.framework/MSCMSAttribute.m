@interface MSCMSAttribute
+ (id)decodeAttribute:(Attribute *)a3 error:(id *)a4;
- (Attribute)encodedAttribute;
- (Attribute)generateAttributeStruct;
- (MSCMSAttribute)initWithAttribute:(id)a3 error:(id *)a4;
- (MSCMSAttribute)initWithAttributeStruct:(Attribute *)a3 error:(id *)a4;
- (MSCMSAttribute)initWithAttributeType:(id)a3 values:(id)a4;
- (MSCMSAttribute)initWithDER:(id)a3;
- (MSOID)attributeType;
- (NSArray)attributeValues;
- (NSData)attributeDERData;
- (void)dealloc;
- (void)setAttributeDERData:(id)a3;
- (void)setEncodedAttribute:(Attribute *)a3;
@end

@implementation MSCMSAttribute

- (MSCMSAttribute)initWithAttributeStruct:(Attribute *)a3 error:(id *)a4
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MSCMSAttribute;
  v6 = -[MSCMSAttribute init](&v18, sel_init);
  if (!v6)
  {
LABEL_13:
    v9 = v6;
    goto LABEL_17;
  }

  v7 = (Attribute *)malloc(0x20uLL);
  v6->_encodedAttribute = v7;
  if (v7)
  {
    int v8 = copy_Attribute();
    if (v8)
    {
      if (a4)
      {
        +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorASN1Domain[0],  v8,  *a4,  @"unable to copy Attribute");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_16;
    }

    uint64_t v10 = +[MSOID OIDWithAsn1OID:error:](&OBJC_CLASS___MSOID, "OIDWithAsn1OID:error:", a3, a4);
    attributeType = v6->_attributeType;
    v6->_attributeType = (MSOID *)v10;

    if (!v6->_attributeType)
    {
      free_Attribute();
LABEL_16:
      free(v6->_encodedAttribute);
      v9 = 0LL;
      v6->_encodedAttribute = 0LL;
      goto LABEL_17;
    }

    [MEMORY[0x189603FA8] arrayWithCapacity:a3->var1.var0];
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (a3->var1.var0)
    {
      uint64_t v13 = 0LL;
      unint64_t v14 = 0LL;
      do
      {
        [MEMORY[0x189603F48] dataWithBytes:a3->var1.var1[v13].var1 length:a3->var1.var1[v13].var0];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v12, "addObject:", v15);

        ++v14;
        ++v13;
      }

      while (v14 < a3->var1.var0);
    }

    attributeValues = v6->_attributeValues;
    v6->_attributeValues = v12;

    goto LABEL_13;
  }

  if (a4)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorASN1Domain[0],  -108LL,  *a4,  @"unable to allocate Attribute");
    v9 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v9 = 0LL;
  }

- (MSCMSAttribute)initWithDER:(id)a3
{
  id v4 = a3;
  v5 = (MSCMSAttribute *)malloc(0x20uLL);
  if (v5)
  {
    id v6 = v4;
    [v6 bytes];
    [v6 length];
    if (decode_Attribute())
    {
      free(v5);
      v5 = 0LL;
    }

    else
    {
      v7 = -[MSCMSAttribute initWithAttributeStruct:error:](self, "initWithAttributeStruct:error:", v5, 0LL);
      int v8 = v7;
      if (v7)
      {
        objc_storeStrong((id *)&v7->_attributeDERData, v6);
        free_Attribute();
        free(v5);
      }

      self = v8;
      v5 = self;
    }
  }

  return v5;
}

- (MSCMSAttribute)initWithAttributeType:(id)a3 values:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MSCMSAttribute;
  v9 = -[MSCMSAttribute init](&v12, sel_init);
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attributeType, a3);
    objc_storeStrong((id *)&v10->_attributeValues, a4);
  }

  return v10;
}

- (MSCMSAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  v5 = (MSCMSAttribute *)a3;

  return v5;
}

+ (id)decodeAttribute:(Attribute *)a3 error:(id *)a4
{
  return (id)[objc_alloc((Class)a1) initWithAttributeStruct:a3 error:a4];
}

- (Attribute)generateAttributeStruct
{
  if (self->_encodedAttribute)
  {
    free_Attribute();
    free(self->_encodedAttribute);
  }

  self->_encodedAttribute = (Attribute *)malloc(0x20uLL);
  v6[5] = -[MSOID Asn1OID](self->_attributeType, "Asn1OID");
  v6[6] = v3;
  der_copy_oid();
  self->_encodedAttribute->var1.var0 = -[NSArray count](self->_attributeValues, "count");
  self->_encodedAttribute->var1.var1 = (heim_base_data *)malloc(16 * -[NSArray count](self->_attributeValues, "count"));
  attributeValues = self->_attributeValues;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __41__MSCMSAttribute_generateAttributeStruct__block_invoke;
  v6[3] = &unk_189B4AB18;
  v6[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](attributeValues, "enumerateObjectsUsingBlock:", v6);
  return self->_encodedAttribute;
}

uint64_t __41__MSCMSAttribute_generateAttributeStruct__block_invoke(uint64_t a1, id a2, uint64_t a3)
{
  id v5 = a2;
  v8[1] = [v5 bytes];
  unsigned int v6 = [v5 length];

  v8[0] = v6;
  return MEMORY[0x186E066B4](v8, *(void *)(*(void *)(*(void *)(a1 + 32) + 32LL) + 24LL) + 16 * a3);
}

- (void)dealloc
{
  encodedAttribute = self->_encodedAttribute;
  if (encodedAttribute)
  {
    free_Attribute();
    encodedAttribute = self->_encodedAttribute;
  }

  free(encodedAttribute);
  self->_encodedAttribute = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MSCMSAttribute;
  -[MSCMSAttribute dealloc](&v4, sel_dealloc);
}

- (MSOID)attributeType
{
  return (MSOID *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSArray)attributeValues
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSData)attributeDERData
{
  return (NSData *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setAttributeDERData:(id)a3
{
}

- (Attribute)encodedAttribute
{
  return self->_encodedAttribute;
}

- (void)setEncodedAttribute:(Attribute *)a3
{
  self->_encodedAttribute = a3;
}

- (void).cxx_destruct
{
}

@end