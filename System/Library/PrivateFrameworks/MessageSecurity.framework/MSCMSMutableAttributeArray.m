@interface MSCMSMutableAttributeArray
+ (id)createAttributeArrayFromAttributeSetRaw:(heim_base_data *)a3 error:(id *)a4;
- (MSCMSMutableAttributeArray)initWithCapacity:(unint64_t)a3;
- (NSData)encodedAttributeSet;
- (NSMutableArray)attributes;
- (NSMutableArray)genericAttributes;
- (id)calculateAttributesWithDigest:(id)a3 error:(id *)a4;
- (id)encodeAttributesWithError:(id *)a3;
- (id)encodeImplicitAttributesWithError:(id *)a3;
- (id)getAttributesWithType:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)addObject:(id)a3;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)removeAttributes:(id)a3;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)reset;
- (void)setAttributes:(id)a3;
- (void)setEncodedAttributeSet:(id)a3;
- (void)setGenericAttributes:(id)a3;
@end

@implementation MSCMSMutableAttributeArray

+ (id)createAttributeArrayFromAttributeSetRaw:(heim_base_data *)a3 error:(id *)a4
{
  v29[1] = *MEMORY[0x1895F89C0];
  v5 = -[MSCMSMutableAttributeArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___MSCMSMutableAttributeArray),  "initWithCapacity:",  0LL);
  [MEMORY[0x189603FB8] data];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t var0 = a3->var0;
  if (a3->var0)
  {
    v8 = 0LL;
    var1 = (char *)a3->var1;
    while (1)
    {
      memset(v27, 0, sizeof(v27));
      uint64_t v26 = 0LL;
      int v10 = decode_Attribute();
      if (v10) {
        break;
      }
      id v25 = v8;
      v11 = +[MSCMSAttribute decodeAttribute:error:](&OBJC_CLASS___MSCMSAttribute, "decodeAttribute:error:", v27, &v25);
      id v12 = v25;

      if (v11) {
        -[MSCMSMutableAttributeArray addObject:](v5, "addObject:", v11);
      }
      var0 -= v26;
      var1 += v26;
      free_Attribute();

      v8 = v12;
      if (!var0) {
        goto LABEL_9;
      }
    }

    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorASN1Domain[0],  v10,  v8,  @"unable to decode CMSAttributes");
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }

  id v12 = 0LL;
LABEL_9:
  *((void *)&v27[0] + 1) = a3;
  LODWORD(v27[0]) = 1;
  uint64_t v13 = length_CMSOrderedAttributes();
  [MEMORY[0x189603FB8] dataWithLength:v13];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    uint64_t v17 = 12LL;
    goto LABEL_15;
  }

  id v6 = v14;
  [v6 mutableBytes];
  int v15 = encode_CMSOrderedAttributes();
  if (v15)
  {
    int v16 = v15;

    uint64_t v17 = v16;
LABEL_15:
    v18 = (void *)MEMORY[0x189607870];
    uint64_t v28 = *MEMORY[0x1896075E0];
    v29[0] = @"Failed encoding type CMSOrderedAttributes";
    [MEMORY[0x189603F68] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v18 errorWithDomain:@"com.apple.HeimASN1" code:v17 userInfo:v19];

    id v6 = 0LL;
    id v12 = (id)v20;
    goto LABEL_17;
  }

  if (v13 != v26)
  {
    v22 = (MSCMSMutableAttributeArray *)asn1_abort();
    -[MSCMSMutableAttributeArray reset](v22, v23);
    return result;
  }

- (void)reset
{
  encodedAttributeSet = self->_encodedAttributeSet;
  self->_encodedAttributeSet = 0LL;

  -[MSCMSMutableAttributeArray encodeAttributesWithError:](self, "encodeAttributesWithError:", 0LL);
  v4 = (NSData *)objc_claimAutoreleasedReturnValue();
  v5 = self->_encodedAttributeSet;
  self->_encodedAttributeSet = v4;
}

- (MSCMSMutableAttributeArray)initWithCapacity:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MSCMSMutableAttributeArray;
  v4 = -[MSCMSMutableAttributeArray init](&v8, sel_init);
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x189603FA8] arrayWithCapacity:a3];
    attributes = v4->_attributes;
    v4->_attributes = (NSMutableArray *)v5;
  }

  return v4;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_attributes, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_attributes, "objectAtIndex:", a3);
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  if (a3)
  {
    -[NSMutableArray insertObject:atIndex:](self->_attributes, "insertObject:atIndex:", a3, a4);
    -[MSCMSMutableAttributeArray reset](self, "reset");
  }

- (void)removeObjectAtIndex:(unint64_t)a3
{
}

- (void)addObject:(id)a3
{
  if (a3)
  {
    -[NSMutableArray addObject:](self->_attributes, "addObject:");
    -[MSCMSMutableAttributeArray reset](self, "reset");
  }

- (void)removeLastObject
{
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  if (a4)
  {
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_attributes, "replaceObjectAtIndex:withObject:", a3);
    -[MSCMSMutableAttributeArray reset](self, "reset");
  }

- (void)removeAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  int v15 = __Block_byref_object_copy__1;
  int v16 = __Block_byref_object_dispose__1;
  id v17 = objc_alloc_init(MEMORY[0x189607938]);
  uint64_t v6 = MEMORY[0x1895F87A8];
  uint64_t v7 = 3221225472LL;
  objc_super v8 = __47__MSCMSMutableAttributeArray_removeAttributes___block_invoke;
  v9 = &unk_189B4AAC8;
  id v5 = v4;
  id v10 = v5;
  v11 = &v12;
  -[MSCMSMutableAttributeArray enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", &v6);
  -[MSCMSMutableAttributeArray removeObjectsAtIndexes:](self, "removeObjectsAtIndexes:", v13[5], v6, v7, v8, v9);

  _Block_object_dispose(&v12, 8);
}

void __47__MSCMSMutableAttributeArray_removeAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 attributeType];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 isEqual:*(void *)(a1 + 32)];

  if (v6) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addIndex:a3];
  }
}

- (id)encodeAttributesWithError:(id *)a3
{
  v40[1] = *MEMORY[0x1895F89C0];
  encodedAttributeSet = self->_encodedAttributeSet;
  if (encodedAttributeSet) {
    return encodedAttributeSet;
  }
  if (!-[MSCMSMutableAttributeArray count](self, "count")) {
    return 0LL;
  }
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  v36 = __Block_byref_object_copy__1;
  v37 = __Block_byref_object_dispose__1;
  if (a3)
  {
    id v7 = *a3;
    if (*a3) {
      id v7 = (id)[v7 copy];
    }
  }

  else
  {
    id v7 = 0LL;
  }

  id v38 = v7;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  char v32 = 0;
  [MEMORY[0x189603FB8] data];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = malloc(32 * -[MSCMSMutableAttributeArray count](self, "count"));
  if (v9)
  {
    id v10 = v9;
    objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", -[MSCMSMutableAttributeArray count](self, "count"));
    v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    genericAttributes = self->_genericAttributes;
    self->_genericAttributes = v11;

    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = __56__MSCMSMutableAttributeArray_encodeAttributesWithError___block_invoke;
    v28[3] = &unk_189B4AAF0;
    v28[4] = self;
    v28[5] = &v33;
    v28[6] = &v29;
    v28[7] = v10;
    -[MSCMSMutableAttributeArray enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v28);
    if (*((_BYTE *)v30 + 24)) {
      goto LABEL_20;
    }
    -[MSCMSMutableAttributeArray count](self, "count");
    uint64_t v13 = length_CMSAttributes();
    [MEMORY[0x189603FB8] dataWithLength:v13];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      id v8 = v14;
      [v8 mutableBytes];
      int v15 = encode_CMSAttributes();
      if (!v15)
      {
        if (v13 != v27)
        {
          id result = (id)asn1_abort();
          __break(1u);
          return result;
        }

        goto LABEL_19;
      }

      uint64_t v16 = v15;
    }

    else
    {
      uint64_t v16 = 12LL;
    }

    v21 = (void *)MEMORY[0x189607870];
    uint64_t v39 = *MEMORY[0x1896075E0];
    v40[0] = @"Failed encoding type CMSAttributes";
    [MEMORY[0x189603F68] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [v21 errorWithDomain:@"com.apple.HeimASN1" code:v16 userInfo:v22];
    v24 = (void *)v34[5];
    v34[5] = v23;

    id v8 = 0LL;
LABEL_19:
    [v8 length];
LABEL_20:
    free(v10);
    if (a3)
    {
      id v25 = (void *)v34[5];
      if (v25) {
        *a3 = v25;
      }
    }

    if ([v8 length]) {
      uint64_t v26 = v8;
    }
    else {
      uint64_t v26 = 0LL;
    }
    id v20 = v26;
    goto LABEL_27;
  }

  if (a3)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorAllocationDomain[0],  -67672LL,  v34[5],  @"Unable to allocate attribute array");
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)v34[5];
    v34[5] = (uint64_t)v17;

    id v19 = v17;
    id v20 = 0LL;
    *a3 = v19;
  }

  else
  {
    id v20 = 0LL;
  }

void __56__MSCMSMutableAttributeArray_encodeAttributesWithError___block_invoke( void *a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  uint64_t v7 = *(void *)(a1[5] + 8LL);
  id obj = *(id *)(v7 + 40);
  [a2 encodeAttributeWithError:&obj];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    [*(id *)(a1[4] + 16) addObject:v8];
    v9 = (_OWORD *)(a1[7] + 32 * a3);
    id v10 = (_OWORD *)[v8 generateAttributeStruct];
    __int128 v11 = v10[1];
    _OWORD *v9 = *v10;
    v9[1] = v11;
  }

  else
  {
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
    *a4 = 1;
  }
}

- (id)encodeImplicitAttributesWithError:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (v4)
  {
    int v6 = nsheim_decode_CMSOrderedAttributes(v4);
    if (!v6)
    {
      [MEMORY[0x189603F48] dataWithBytes:v11[1] length:*v11];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      free_CMSOrderedAttributes();
      goto LABEL_8;
    }

    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorASN1Domain[0],  v6,  0LL,  @"unable to decode CMSAttributes");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = v7;
    if (a3) {
      *a3 = v7;
    }
  }

  v9 = 0LL;
LABEL_8:

  return v9;
}

- (id)calculateAttributesWithDigest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4 && *a4) {
    uint64_t v7 = (void *)[*a4 copy];
  }
  else {
    uint64_t v7 = 0LL;
  }
  if (!self->_encodedAttributeSet)
  {
    uint64_t v15 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26276LL,  v7,  @"unable to encode signed attributes");

LABEL_10:
    id v11 = 0LL;
    uint64_t v7 = (void *)v15;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }

  [v6 algorithm];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)[v8 ccdigest];

  if (!v9)
  {
    uint64_t v12 = MSErrorCryptoDomain[0];
    [v6 algorithm];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 OIDString];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v12,  -4LL,  v7,  @"%@ is not a supported digest algorithm",  v14);

    goto LABEL_10;
  }

  [MEMORY[0x189603FB8] dataWithLength:*v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData length](self->_encodedAttributeSet, "length");
  -[NSData bytes](self->_encodedAttributeSet, "bytes");
  id v11 = v10;
  [v11 mutableBytes];
  ccdigest();
  if (!a4) {
    goto LABEL_13;
  }
LABEL_11:
  if (v7) {
    *a4 = v7;
  }
LABEL_13:

  return v11;
}

- (id)getAttributesWithType:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = __Block_byref_object_copy__1;
  uint64_t v15 = __Block_byref_object_dispose__1;
  +[MSCMSMutableAttributeArray array](&OBJC_CLASS___MSCMSMutableAttributeArray, "array");
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __52__MSCMSMutableAttributeArray_getAttributesWithType___block_invoke;
  v8[3] = &unk_189B4AAC8;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  -[MSCMSMutableAttributeArray enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __52__MSCMSMutableAttributeArray_getAttributesWithType___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 attributeType];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = [v3 isEqual:*(void *)(a1 + 32)];

  if (v4) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v5];
  }
}

- (NSMutableArray)attributes
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setAttributes:(id)a3
{
}

- (NSMutableArray)genericAttributes
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setGenericAttributes:(id)a3
{
}

- (NSData)encodedAttributeSet
{
  return (NSData *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setEncodedAttributeSet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end