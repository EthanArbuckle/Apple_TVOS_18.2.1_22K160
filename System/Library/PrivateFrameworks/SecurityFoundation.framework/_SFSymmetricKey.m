@interface _SFSymmetricKey
+ (Class)_attributesClass;
- (_SFSymmetricKey)initWithData:(id)a3 specifier:(id)a4 error:(id *)a5;
- (id)initRandomKeyWithSpecifier:(id)a3 error:(id *)a4;
- (id)keyData;
@end

@implementation _SFSymmetricKey

+ (Class)_attributesClass
{
  return (Class)objc_opt_class();
}

- (id)initRandomKeyWithSpecifier:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 handleFailureInMethod:a2, self, @"SFKey.m", 653, @"Invalid parameter not satisfying: %@", @"specifier" object file lineNumber description];
  }

  size_t v8 = [v7 keyLengthInBytes];
  v9 = malloc(v8);
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x18960BE08], v8, v9))
  {
    if (a4)
    {
      [MEMORY[0x189607870] errorWithDomain:@"SFKeychainErrorDomain" code:3 userInfo:0];
      v10 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v10 = 0LL;
    }
  }

  else
  {
    id v11 = objc_alloc(MEMORY[0x189603F48]);
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __52___SFSymmetricKey_initRandomKeyWithSpecifier_error___block_invoke;
    v15[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
    v15[4] = v8;
    v12 = (void *)[v11 initWithBytesNoCopy:v9 length:v8 deallocator:v15];
    self = -[_SFSymmetricKey initWithData:specifier:error:](self, "initWithData:specifier:error:", v12, v7, a4);

    v10 = self;
  }

  return v10;
}

- (_SFSymmetricKey)initWithData:(id)a3 specifier:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 handleFailureInMethod:a2, self, @"SFKey.m", 673, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 handleFailureInMethod:a2, self, @"SFKey.m", 674, @"Invalid parameter not satisfying: %@", @"keySpecifier2" object file lineNumber description];

LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v12 = v11;
    uint64_t v13 = [v9 length];
    if (v13 == [v12 keyLengthInBytes])
    {
      v14 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_attributesClass"), "alloc"),  "initWithSpecifier:",  v12);
      v29.receiver = self;
      v29.super_class = (Class)&OBJC_CLASS____SFSymmetricKey;
      v15 = -[_SFKey initWithAttributes:](&v29, sel_initWithAttributes_, v14);

      if (v15)
      {
        v16 = objc_alloc_init(&OBJC_CLASS___SFSymmetricKey_Ivars);
        id symmetricKeyInternal = v15->_symmetricKeyInternal;
        v15->_id symmetricKeyInternal = v16;

        size_t v18 = [v9 length];
        v19 = malloc(v18);
        memcpy(v19, (const void *)[v9 bytes], v18);
        id v20 = objc_alloc(MEMORY[0x189603F48]);
        v28[0] = MEMORY[0x1895F87A8];
        v28[1] = 3221225472LL;
        v28[2] = __48___SFSymmetricKey_initWithData_specifier_error___block_invoke;
        v28[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
        v28[4] = v18;
        uint64_t v21 = [v20 initWithBytesNoCopy:v19 length:v18 deallocator:v28];
        v22 = v15->_symmetricKeyInternal;
        v23 = (void *)v22[1];
        v22[1] = v21;
      }

      self = v15;
      v24 = self;
    }

    else if (a5)
    {
      [MEMORY[0x189607870] errorWithDomain:@"SFKeychainErrorDomain" code:2 userInfo:0];
      v24 = 0LL;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v24 = 0LL;
    }
  }

  else if (a5)
  {
    [MEMORY[0x189607870] errorWithDomain:@"SFCryptoServicesErrorDomain" code:4 userInfo:0];
    v24 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v24 = 0LL;
  }

  return v24;
}

- (id)keyData
{
  return *((id *)self->_symmetricKeyInternal + 1);
}

- (void).cxx_destruct
{
}

@end