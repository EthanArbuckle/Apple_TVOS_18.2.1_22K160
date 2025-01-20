@interface _SFCiphertext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)ciphertext;
- (_SFCiphertext)initWithCiphertext:(id)a3;
- (_SFCiphertext)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SFCiphertext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFCiphertext)initWithCiphertext:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 204, @"Invalid parameter not satisfying: %@", @"ciphertext" object file lineNumber description];
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____SFCiphertext;
  v7 = -[_SFCiphertext init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_alloc_init(&OBJC_CLASS___SFCiphertext_Ivars);
    id ciphertextInternal = v7->_ciphertextInternal;
    v7->_id ciphertextInternal = v8;

    objc_storeStrong((id *)v7->_ciphertextInternal + 1, a3);
  }

  return v7;
}

- (_SFCiphertext)initWithCoder:(id)a3
{
  v18[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS____SFCiphertext;
  v5 = -[_SFCiphertext init](&v16, sel_init);
  if (v5)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___SFCiphertext_Ivars);
    id ciphertextInternal = v5->_ciphertextInternal;
    v5->_id ciphertextInternal = v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SFCiphertext"];
    v9 = v5->_ciphertextInternal;
    v10 = (void *)v9[1];
    v9[1] = v8;

    if (!*((void *)v5->_ciphertextInternal + 1))
    {
      v11 = (void *)MEMORY[0x189607870];
      uint64_t v17 = *MEMORY[0x1896075E0];
      [NSString stringWithFormat:@"Failed to deserialize object of type %@", objc_opt_class()];
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v12;
      [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 errorWithDomain:@"SFCryptoServicesErrorDomain" code:8 userInfo:v13];
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      [v4 failWithError:v14];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [*((id *)self->_ciphertextInternal + 1) copy];
  uint64_t v6 = v4[1];
  v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v5;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_SFCiphertext *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v8 = 1;
  }

  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = (void *)*((void *)self->_ciphertextInternal + 1);
    v7 = -[_SFCiphertext ciphertext](v5, "ciphertext");
    char v8 = [v6 isEqual:v7];
  }

  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NSData)ciphertext
{
  return (NSData *)*((id *)self->_ciphertextInternal + 1);
}

- (void).cxx_destruct
{
}

@end