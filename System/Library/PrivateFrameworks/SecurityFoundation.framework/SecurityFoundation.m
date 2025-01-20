}

_SFSHA256DigestOperation *_defaultDigestOperation()
{
  return objc_alloc_init(&OBJC_CLASS____SFSHA256DigestOperation);
}

SFMaskGenerationFunction1 *_defaultMaskGenerationFunction()
{
  return objc_alloc_init(&OBJC_CLASS___SFMaskGenerationFunction1);
}

SFHMACPseudoRandomFunction *_defaultPseudoRandomFunction()
{
  return objc_alloc_init(&OBJC_CLASS___SFHMACPseudoRandomFunction);
}

LABEL_12:
  return v15;
}
  v17 = +[_SFKeychainFetchResult fetchResultWithError:](&OBJC_CLASS____SFKeychainKeyFetchResult, "fetchResultWithError:", v10);
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v17);

  v18 = *(void *)(a1 + 48);
  v19 = +[_SFKeychainFetchResult fetchResultWithError:](&OBJC_CLASS____SFKeychainKeyFetchResult, "fetchResultWithError:", v10);
  (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

LABEL_18:
}

uint64_t SFAccessibilityMakeWithMode@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  a2[1] = 0LL;
  a2[2] = 0LL;
  *a2 = result;
  return result;
}

LABEL_14:
        goto LABEL_15;
      }
    }

    v12 = 0;
  }

  return v27;
}

LABEL_15:
  return v12;
}

LABEL_16:
  CFAutorelease(v4);
  return v4;
}

_SFECKeySpecifier *ECKeySpecifierForSecKey(__SecKey *a1)
{
  CFDictionaryRef v1 = SecKeyCopyAttributes(a1);
  v2 = -[__CFDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", *MEMORY[0x18960B988]);
  uint64_t v3 = [v2 integerValue];
  if (v3 > 383)
  {
    if (v3 == 384)
    {
      uint64_t v4 = 4LL;
      goto LABEL_10;
    }

    if (v3 == 521)
    {
      uint64_t v4 = 6LL;
      goto LABEL_10;
    }
  }

  else
  {
    if (v3 == 224)
    {
      uint64_t v4 = 0LL;
      goto LABEL_10;
    }

    if (v3 == 256)
    {
      uint64_t v4 = 2LL;
LABEL_10:
      v5 = -[_SFECKeySpecifier initWithCurve:](objc_alloc(&OBJC_CLASS____SFECKeySpecifier), "initWithCurve:", v4);

      return v5;
    }
  }

  v7 = (void *)MEMORY[0x189603F70];
  uint64_t v8 = *MEMORY[0x189603A58];
  objc_msgSend(NSString, "stringWithFormat:", @"unanticipated bitsize for EC key: %d", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 exceptionWithName:v8 reason:v9 userInfo:0];
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
  return (_SFECKeySpecifier *)+[_SFECPublicKey _secKeyCreationAttributesForSpecifier:](v11, v12, v13);
}

uint64_t ECKeyBitSize(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t result = 224LL;
  switch(a1)
  {
    case 0LL:
      return result;
    case 1LL:
    case 3LL:
    case 5LL:
    case 7LL:
      [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"compressed elliptic curves are not presently supported" userInfo:0];
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v4);
      goto LABEL_7;
    case 2LL:
      uint64_t result = 256LL;
      break;
    case 4LL:
      uint64_t result = 384LL;
      break;
    case 6LL:
      uint64_t result = 521LL;
      break;
    default:
LABEL_7:
      v5 = (void *)MEMORY[0x189603F70];
      uint64_t v6 = *MEMORY[0x189603A58];
      objc_msgSend(NSString, "stringWithFormat:", @"unknown SFEllipticCurve value: %d", v1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      id v8 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v8);
      uint64_t result = (uint64_t)-[_SFECPublicKey performWithCCKey:](v9, v10, v11);
      break;
  }

  return result;
}

id CCCurveParameters(uint64_t a1)
{
  switch(a1)
  {
    case 0LL:
      JUMPOUT(0x1895A563CLL);
    case 1LL:
    case 3LL:
    case 5LL:
    case 7LL:
      [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"compressed elliptic curves are not presently supported" userInfo:0];
      id v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v2);
      goto LABEL_4;
    case 2LL:
      JUMPOUT(0x1895A5648LL);
    case 4LL:
      JUMPOUT(0x1895A5654LL);
    case 6LL:
      return (id)ccec_cp_521();
    default:
LABEL_4:
      uint64_t v3 = (void *)MEMORY[0x189603F70];
      uint64_t v4 = *MEMORY[0x189603A58];
      objc_msgSend(NSString, "stringWithFormat:", @"unknown SFEllipticCurve value: %d", a1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 exceptionWithName:v4 reason:v5 userInfo:0];
      id v6 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v6);
      return -[_SFECPublicKey encodeSubjectPublicKeyInfo](v7, v8);
  }

void sub_1874838E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

LABEL_17:
    v21 = *(void *)(a1 + 48);
    +[_SFKeychainFetchResult fetchResultWithValue:]( &OBJC_CLASS____SFKeychainKeyFetchResult,  "fetchResultWithValue:",  v9);
    SEL v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v21 + 16))(v21, v10);
    goto LABEL_18;
  }

  id v6 = objc_alloc(&OBJC_CLASS___SFTripleDESKey);
  v7 = *(void *)(a1 + 32);
  SEL v8 = objc_alloc_init(&OBJC_CLASS____SFTripleDESKeySpecifier);
  v24 = 0LL;
  v9 = -[_SFSymmetricKey initWithData:specifier:error:](v6, "initWithData:specifier:error:", v7, v8, &v24);
  SEL v10 = v24;

  uint64_t v11 = *(void *)(a1 + 48);
  if (!v10)
  {
    +[_SFKeychainFetchResult fetchResultWithValue:]( &OBJC_CLASS____SFKeychainKeyFetchResult,  "fetchResultWithValue:",  v9);
    SEL v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
LABEL_16:

    goto LABEL_17;
  }

void sub_1874846F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_187488EF4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_187489434( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t CCCryptorGCM()
{
  return MEMORY[0x1895F80C8]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1895F8278](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1895F8280](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8288](c, data, *(void *)&len);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1895F8298](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1895F82A0](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82A8](c, data, *(void *)&len);
}

int CC_SHA224_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82B8](md, c);
}

int CC_SHA224_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82C0](c);
}

int CC_SHA224_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82C8](c, data, *(void *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82D8](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82E0](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82E8](c, data, *(void *)&len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F82F8](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8300](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8308](c, data, *(void *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8318](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8320](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8328](c, data, *(void *)&len);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x189602730](arg);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x189607718](aSelector);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x18960B3F8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x18960B400](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x18960B408](query);
}

CFDictionaryRef SecKeyCopyAttributes(SecKeyRef key)
{
  return (CFDictionaryRef)MEMORY[0x18960B420](key);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x18960B430](key, error);
}

CFDataRef SecKeyCopyKeyExchangeResult( SecKeyRef privateKey, SecKeyAlgorithm algorithm, SecKeyRef publicKey, CFDictionaryRef parameters, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x18960B438](privateKey, algorithm, publicKey, parameters, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x18960B450](key);
}

uint64_t SecKeyCopySubjectPublicKeyInfo()
{
  return MEMORY[0x18960B468]();
}

uint64_t SecKeyCreateFromSubjectPublicKeyInfoData()
{
  return MEMORY[0x18960B498]();
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x18960B4B8](parameters, error);
}

CFDataRef SecKeyCreateSignature( SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x18960B4C0](key, algorithm, dataToSign, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x18960B4C8](keyData, attributes, error);
}

Boolean SecKeyVerifySignature( SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x18960B510](key, algorithm, signedData, signature, error);
}

uint64_t SecPasswordCreateWithRandomDigits()
{
  return MEMORY[0x18960B520]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x18960B5F8](rnd, count, bytes);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x1895F9790]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x1895F9798]();
}

uint64_t ccec_cp_224()
{
  return MEMORY[0x1895F9B08]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x1895F9B10]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x1895F9B18]();
}

uint64_t ccec_cp_521()
{
  return MEMORY[0x1895F9B20]();
}

uint64_t ccec_x963_import_priv()
{
  return MEMORY[0x1895F9C58]();
}

uint64_t ccec_x963_import_priv_size()
{
  return MEMORY[0x1895F9C60]();
}

uint64_t ccec_x963_import_pub()
{
  return MEMORY[0x1895F9C68]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x1895F9C70]();
}

uint64_t ccecies_decrypt_gcm_composite()
{
  return MEMORY[0x1895F9CA0]();
}

uint64_t ccecies_decrypt_gcm_plaintext_size()
{
  return MEMORY[0x1895F9CA8]();
}

uint64_t ccecies_decrypt_gcm_setup()
{
  return MEMORY[0x1895F9CB0]();
}

uint64_t ccecies_encrypt_gcm_ciphertext_size()
{
  return MEMORY[0x1895F9CC0]();
}

uint64_t ccecies_encrypt_gcm_composite()
{
  return MEMORY[0x1895F9CC8]();
}

uint64_t ccecies_encrypt_gcm_setup()
{
  return MEMORY[0x1895F9CD0]();
}

uint64_t ccecies_pub_key_size()
{
  return MEMORY[0x1895F9CD8]();
}

uint64_t ccrng()
{
  return MEMORY[0x1895FA118]();
}

uint64_t ccrng_system_init()
{
  return MEMORY[0x1895FA128]();
}

uint64_t ccscrypt()
{
  return MEMORY[0x1895FA258]();
}

uint64_t ccscrypt_storage_size()
{
  return MEMORY[0x1895FA260]();
}

uint64_t ccsha224_di()
{
  return MEMORY[0x1895FA270]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1895FA278]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x1895FA280]();
}

uint64_t ccspake_cp_256()
{
  return MEMORY[0x1895FA2A0]();
}

uint64_t ccspake_generate_L()
{
  return MEMORY[0x1895FA2B0]();
}

uint64_t ccspake_kex_generate()
{
  return MEMORY[0x1895FA2B8]();
}

uint64_t ccspake_kex_process()
{
  return MEMORY[0x1895FA2C0]();
}

uint64_t ccspake_mac_compute()
{
  return MEMORY[0x1895FA2C8]();
}

uint64_t ccspake_mac_hkdf_hmac_sha256()
{
  return MEMORY[0x1895FA2D8]();
}

uint64_t ccspake_mac_verify_and_get_session_key()
{
  return MEMORY[0x1895FA2E0]();
}

uint64_t ccspake_prover_init()
{
  return MEMORY[0x1895FA2E8]();
}

uint64_t ccspake_sizeof_ctx()
{
  return MEMORY[0x1895FA300]();
}

uint64_t ccspake_sizeof_point()
{
  return MEMORY[0x1895FA308]();
}

uint64_t ccspake_sizeof_w()
{
  return MEMORY[0x1895FA310]();
}

uint64_t ccspake_verifier_init()
{
  return MEMORY[0x1895FA318]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t dispatch_queue_attr_make_with_overcommit()
{
  return MEMORY[0x1895FAD70]();
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1895FBE68](__s, __smax, *(void *)&__c, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int timingsafe_bcmp(const void *__b1, const void *__b2, size_t __len)
{
  return MEMORY[0x1895FD418](__b1, __b2, __len);
}

uint64_t objc_msgSend_generateAttributesForIdentityAndAddToKeychain_forIdentifier_accessPolicy_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_generateAttributesForIdentityAndAddToKeychain_forIdentifier_accessPolicy_);
}

uint64_t objc_msgSend_initWithCurve_diffieHellmanOperation_encryptionOperation_digestOperation_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithCurve_diffieHellmanOperation_encryptionOperation_digestOperation_);
}

uint64_t objc_msgSend_initWithTrustPolicy_revocationPolicy_applicationAnchorCertificates_allowCertificateFetching_trustSystemAnchorCertificates_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithTrustPolicy_revocationPolicy_applicationAnchorCertificates_allowCertificateFetching_trustSystemAnchorCertificates_);
}