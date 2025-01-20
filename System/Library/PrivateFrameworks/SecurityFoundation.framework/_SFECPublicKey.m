@interface _SFECPublicKey
+ (id)_secKeyCreationAttributesForSpecifier:(id)a3;
+ (id)_specifierForSecKey:(__SecKey *)a3;
+ (id)keyWithSubjectPublicKeyInfo:(id)a3;
- (id)encodeSubjectPublicKeyInfo;
- (id)performWithCCKey:(id)a3;
@end

@implementation _SFECPublicKey

+ (id)_specifierForSecKey:(__SecKey *)a3
{
  return ECKeySpecifierForSecKey(a3);
}

+ (id)_secKeyCreationAttributesForSpecifier:(id)a3
{
  id v3 = a3;
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x18960B968], (const void *)*MEMORY[0x18960B980]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x18960B998], (const void *)*MEMORY[0x18960B9B0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x18960BA08], (const void *)*MEMORY[0x189604DE8]);
  v5 = (const void *)*MEMORY[0x18960B988];
  v6 = (void *)MEMORY[0x189607968];
  uint64_t v7 = [v3 curve];

  v8 = (const void *)[v6 numberWithInteger:ECKeyBitSize(v7)];
  CFDictionaryAddValue(Mutable, v5, v8);
  return Mutable;
}

- (id)performWithCCKey:(id)a3
{
  error[1] = *(CFErrorRef *)MEMORY[0x1895F89C0];
  v4 = (void (**)(id, char *, uint64_t))a3;
  v5 = -[_SFKey keySpecifier](self, "keySpecifier");
  CCCurveParameters([v5 curve]);
  MEMORY[0x1895F8858]();
  uint64_t v7 = (char *)error - v6;
  error[0] = 0LL;
  CFDataRef v8 = SecKeyCopyExternalRepresentation(*((SecKeyRef *)self->super._publicKeyInternal + 1), error);
  CFErrorRef v9 = error[0];
  if (-[__CFData length](v8, "length")
    && ccec_x963_import_pub_size()
    && (-[_SFKey keySpecifier](self, "keySpecifier"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        CCCurveParameters([v10 curve]),
        -[__CFData length](v8, "length"),
        -[__CFData bytes](v8, "bytes"),
        int v11 = ccec_x963_import_pub(),
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
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)encodeSubjectPublicKeyInfo
{
  return (id)SecKeyCopySubjectPublicKeyInfo();
}

+ (id)keyWithSubjectPublicKeyInfo:(id)a3
{
  uint64_t v3 = SecKeyCreateFromSubjectPublicKeyInfoData();
  if (v3)
  {
    v4 = (const void *)v3;
    v5 = -[_SFPublicKey initWithSecKey:](objc_alloc(&OBJC_CLASS____SFECPublicKey), "initWithSecKey:", v3);
    CFRelease(v4);
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end