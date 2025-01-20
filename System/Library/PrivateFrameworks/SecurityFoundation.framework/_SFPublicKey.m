@interface _SFPublicKey
+ (Class)_attributesClass;
+ (id)_secKeyCreationAttributesForSpecifier:(id)a3;
- (_SFPublicKey)initWithAttributes:(id)a3;
- (_SFPublicKey)initWithData:(id)a3 specifier:(id)a4 error:(id *)a5;
- (_SFPublicKey)initWithSecKey:(__SecKey *)a3;
- (__SecKey)_secKey;
- (id)keyData;
- (void)dealloc;
@end

@implementation _SFPublicKey

+ (Class)_attributesClass
{
  return (Class)objc_opt_class();
}

+ (id)_secKeyCreationAttributesForSpecifier:(id)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2, a1, @"SFKey.m", 740, @"subclass %@ must implement %@", v6, v7 object file lineNumber description];

  return 0LL;
}

- (_SFPublicKey)initWithAttributes:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____SFPublicKey;
  return -[_SFKey initWithAttributes:](&v4, sel_initWithAttributes_, a3);
}

- (_SFPublicKey)initWithData:(id)a3 specifier:(id)a4 error:(id *)a5
{
  v9 = (const __CFData *)a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 handleFailureInMethod:a2, self, @"SFKey.m", 755, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 handleFailureInMethod:a2, self, @"SFKey.m", 756, @"Invalid parameter not satisfying: %@", @"specifier2" object file lineNumber description];

LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v12 = v11;
    v13 = (const __CFDictionary *)[(id)objc_opt_class() _secKeyCreationAttributesForSpecifier:v12];
    SecKeyRef v14 = SecKeyCreateWithData(v9, v13, (CFErrorRef *)a5);
    if (v14)
    {
      SecKeyRef v15 = v14;
      v16 = -[_SFPublicKey initWithSecKey:](self, "initWithSecKey:", v14);
      CFRelease(v15);
    }

    else
    {

      v16 = 0LL;
    }

    self = v16;

    v17 = self;
  }

  else if (a5)
  {
    [MEMORY[0x189607870] errorWithDomain:@"SFCryptoServicesErrorDomain" code:4 userInfo:0];
    v17 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v17 = 0LL;
  }

  return v17;
}

- (_SFPublicKey)initWithSecKey:(__SecKey *)a3
{
  if (!a3)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"SFKey.m", 780, @"Invalid parameter not satisfying: %@", @"secKey" object file lineNumber description];
  }

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_attributesClass"), "alloc");
  [(id)objc_opt_class() _specifierForSecKey:a3];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)[v5 initWithSpecifier:v6];
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____SFPublicKey;
  v8 = -[_SFKey initWithAttributes:](&v14, sel_initWithAttributes_, v7);

  if (v8)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___SFPublicKey_Ivars);
    id publicKeyInternal = v8->_publicKeyInternal;
    v8->_id publicKeyInternal = v9;

    *((void *)v8->_publicKeyInternal + 1) = a3;
    CFRetain(*((CFTypeRef *)v8->_publicKeyInternal + 1));
  }

  return v8;
}

- (__SecKey)_secKey
{
  return (__SecKey *)*((void *)self->_publicKeyInternal + 1);
}

- (id)keyData
{
  return SecKeyCopyExternalRepresentation(*((SecKeyRef *)self->_publicKeyInternal + 1), 0LL);
}

- (void)dealloc
{
  v3 = (const void *)*((void *)self->_publicKeyInternal + 1);
  if (v3)
  {
    CFRelease(v3);
    *((void *)self->_publicKeyInternal + 1) = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____SFPublicKey;
  -[_SFPublicKey dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end