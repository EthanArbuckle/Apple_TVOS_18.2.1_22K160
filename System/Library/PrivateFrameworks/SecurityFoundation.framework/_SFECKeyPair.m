@interface _SFECKeyPair
+ (id)_secKeyCreationAttributesForSpecifier:(id)a3;
+ (id)_specifierForSecKey:(__SecKey *)a3;
- (id)initRandomKeyPairWithSpecifier:(id)a3;
- (id)initRandomKeyPairWithSpecifier:(id)a3 privateKeyDomain:(id)a4;
- (id)performWithCCKey:(id)a3;
- (id)publicKey;
@end

@implementation _SFECKeyPair

+ (id)_specifierForSecKey:(__SecKey *)a3
{
  return ECKeySpecifierForSecKey(a3);
}

+ (id)_secKeyCreationAttributesForSpecifier:(id)a3
{
  id v3 = a3;
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x18960B968], (const void *)*MEMORY[0x18960B970]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x18960B998], (const void *)*MEMORY[0x18960B9B0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x18960BA08], (const void *)*MEMORY[0x189604DE8]);
  v5 = (const void *)*MEMORY[0x18960B988];
  v6 = (void *)MEMORY[0x189607968];
  uint64_t v7 = [v3 curve];

  v8 = (const void *)[v6 numberWithInteger:ECKeyBitSize(v7)];
  CFDictionaryAddValue(Mutable, v5, v8);
  return Mutable;
}

- (id)initRandomKeyPairWithSpecifier:(id)a3
{
  return -[_SFECKeyPair initRandomKeyPairWithSpecifier:privateKeyDomain:]( self,  "initRandomKeyPairWithSpecifier:privateKeyDomain:",  a3,  @"SFKeyDomainCPU");
}

- (id)initRandomKeyPairWithSpecifier:(id)a3 privateKeyDomain:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 handleFailureInMethod:a2 object:self file:@"SFKey.m" lineNumber:1066 description:@"specifier not set"];
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v9 = v7;
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x18960B998], (const void *)*MEMORY[0x18960B9B0]);
    v11 = (const void *)*MEMORY[0x18960B988];
    v12 = (const void *)objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", ECKeyBitSize(objc_msgSend(v9, "curve")));
    CFDictionarySetValue(Mutable, v11, v12);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x18960BA08], (const void *)*MEMORY[0x189604DE8]);
    CFErrorRef error = 0LL;
    SecKeyRef v13 = SecKeyCreateRandomKey(Mutable, &error);
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS____SFECKeyPair;
    v14 = -[_SFKeyPair initWithSecKey:](&v19, sel_initWithSecKey_, v13);
    v15 = v14;
    if (v14 && error)
    {

      CFRelease(error);
      v15 = 0LL;
    }

    CFRelease(Mutable);
    CFRelease(v13);
    self = v15;

    v16 = self;
  }

  else
  {
    v16 = 0LL;
  }

  return v16;
}

- (id)publicKey
{
  SecKeyRef v2 = SecKeyCopyPublicKey(-[_SFKeyPair _secKey](self, "_secKey"));
  id v3 = -[_SFPublicKey initWithSecKey:](objc_alloc(&OBJC_CLASS____SFECPublicKey), "initWithSecKey:", v2);
  if (v2) {
    CFRelease(v2);
  }
  return v3;
}

- (id)performWithCCKey:(id)a3
{
  error[1] = *(CFErrorRef *)MEMORY[0x1895F89C0];
  v4 = (void (**)(id, char *, uint64_t))a3;
  v5 = -[_SFKey keySpecifier](self, "keySpecifier");
  CCCurveParameters([v5 curve]);
  MEMORY[0x1895F8858]();
  id v7 = (char *)error - v6;
  error[0] = 0LL;
  CFDataRef v8 = SecKeyCopyExternalRepresentation(*((SecKeyRef *)self->super._keyPairInternal + 1), error);
  CFErrorRef v9 = error[0];
  if (-[__CFData length](v8, "length")
    && ccec_x963_import_priv_size()
    && (-[_SFKey keySpecifier](self, "keySpecifier"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        CCCurveParameters([v10 curve]),
        -[__CFData length](v8, "length"),
        -[__CFData bytes](v8, "bytes"),
        int v11 = ccec_x963_import_priv(),
        v10,
        !v11))
  {
    uint64_t v12 = 0LL;
  }

  else
  {
    uint64_t v12 = (uint64_t)v9;
    if (!v9)
    {
      uint64_t v12 = [MEMORY[0x189607870] errorWithDomain:@"SFKeychainErrorDomain" code:2 userInfo:0];
      CFErrorRef v9 = (CFErrorRef)v12;
    }
  }

  v4[2](v4, v7, v12);
  SecKeyRef v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void).cxx_destruct
{
}

@end