@interface _SFAuthenticatedCiphertext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)authenticationCode;
- (NSData)initializationVector;
- (_SFAuthenticatedCiphertext)initWithCiphertext:(id)a3 authenticationCode:(id)a4 initializationVector:(id)a5;
- (_SFAuthenticatedCiphertext)initWithCoder:(id)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SFAuthenticatedCiphertext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFAuthenticatedCiphertext)initWithCiphertext:(id)a3 authenticationCode:(id)a4 initializationVector:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    [MEMORY[0x1896077D8] currentHandler];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 270, @"Invalid parameter not satisfying: %@", @"authenticationCode" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }

  [MEMORY[0x1896077D8] currentHandler];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 269, @"Invalid parameter not satisfying: %@", @"ciphertext" object file lineNumber description];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  [MEMORY[0x1896077D8] currentHandler];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 271, @"Invalid parameter not satisfying: %@", @"initializationVector" object file lineNumber description];

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS____SFAuthenticatedCiphertext;
  v12 = -[_SFCiphertext initWithCiphertext:](&v19, sel_initWithCiphertext_, v9);
  if (v12)
  {
    v13 = objc_alloc_init(&OBJC_CLASS___SFAuthenticatedCiphertext_Ivars);
    id authenticatedCiphertextInternal = v12->_authenticatedCiphertextInternal;
    v12->_id authenticatedCiphertextInternal = v13;

    objc_storeStrong((id *)v12->_authenticatedCiphertextInternal + 1, a4);
    objc_storeStrong((id *)v12->_authenticatedCiphertextInternal + 2, a5);
  }

  return v12;
}

- (_SFAuthenticatedCiphertext)initWithCoder:(id)a3
{
  v22[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS____SFAuthenticatedCiphertext;
  v5 = -[_SFCiphertext initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___SFAuthenticatedCiphertext_Ivars);
    id authenticatedCiphertextInternal = v5->_authenticatedCiphertextInternal;
    v5->_id authenticatedCiphertextInternal = v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SFAuthenticationCode"];
    id v9 = v5->_authenticatedCiphertextInternal;
    id v10 = (void *)v9[1];
    v9[1] = v8;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SFInitializationVector"];
    v12 = v5->_authenticatedCiphertextInternal;
    v13 = (void *)v12[2];
    v12[2] = v11;

    v14 = v5->_authenticatedCiphertextInternal;
    if (!v14[1] || !v14[2])
    {
      v15 = (void *)MEMORY[0x189607870];
      uint64_t v21 = *MEMORY[0x1896075E0];
      [NSString stringWithFormat:@"Failed to deserialize object of type %@", objc_opt_class()];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v16;
      [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 errorWithDomain:@"SFCryptoServicesErrorDomain" code:8 userInfo:v17];
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      [v4 failWithError:v18];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____SFAuthenticatedCiphertext;
  id v4 = a3;
  -[_SFCiphertext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  *((void *)self->_authenticatedCiphertextInternal + 1),  @"SFAuthenticationCode",  v5.receiver,  v5.super_class);
  [v4 encodeObject:*((void *)self->_authenticatedCiphertextInternal + 2) forKey:@"SFInitializationVector"];
}

- (id)debugDescription
{
  v3 = (void *)NSString;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____SFAuthenticatedCiphertext;
  -[_SFAuthenticatedCiphertext debugDescription](&v11, sel_debugDescription);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id authenticatedCiphertextInternal = self->_authenticatedCiphertextInternal;
  uint64_t v6 = authenticatedCiphertextInternal[1];
  uint64_t v7 = authenticatedCiphertextInternal[2];
  -[_SFCiphertext ciphertext](self, "ciphertext");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@\nAuth Code: %@\nIV: %@\ndata: %@", v4, v6, v7, v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_SFAuthenticatedCiphertext *)a3;
  objc_super v5 = v4;
  if (v4 == self)
  {
    char v11 = 1;
  }

  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS____SFAuthenticatedCiphertext;
    if (-[_SFCiphertext isEqual:](&v13, sel_isEqual_, v6))
    {
      uint64_t v7 = (void *)*((void *)self->_authenticatedCiphertextInternal + 1);
      -[_SFAuthenticatedCiphertext authenticationCode](v6, "authenticationCode");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v7 isEqual:v8])
      {
        id v9 = (void *)*((void *)self->_authenticatedCiphertextInternal + 2);
        -[_SFAuthenticatedCiphertext initializationVector](v6, "initializationVector");
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        char v11 = [v9 isEqual:v10];
      }

      else
      {
        char v11 = 0;
      }
    }

    else
    {
      char v11 = 0;
    }
  }

  else
  {
    char v11 = 0;
  }

  return v11;
}

- (NSData)authenticationCode
{
  return (NSData *)*((id *)self->_authenticatedCiphertextInternal + 1);
}

- (NSData)initializationVector
{
  return (NSData *)*((id *)self->_authenticatedCiphertextInternal + 2);
}

- (void).cxx_destruct
{
}

@end