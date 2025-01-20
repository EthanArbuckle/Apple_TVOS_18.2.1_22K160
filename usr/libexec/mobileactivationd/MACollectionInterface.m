@interface MACollectionInterface
+ (id)copyIngestURL;
- (BOOL)collectionLibraryLoaded;
- (BOOL)processSUInfo:(id)a3 withError:(id *)a4;
- (DataArk)dark;
- (MACollectionInterface)initWithContext:(id)a3;
- (__SecKey)signingKey;
- (id)collectPCRT:(id *)a3;
- (id)collectSIK:(id *)a3;
- (id)collectSigningAttestation:(id *)a3;
- (id)copyIngestData:(id *)a3;
- (id)copyIngestHeaders:(id)a3 withError:(id *)a4;
- (id)signatureForData:(id)a3 error:(id *)a4;
- (id)signingKeyPublicKeyWithError:(id *)a3;
- (void)dealloc;
- (void)setCollectionLibraryLoaded:(BOOL)a3;
@end

@implementation MACollectionInterface

- (MACollectionInterface)initWithContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MACollectionInterface;
  v4 = -[MACollectionInterface init](&v7, "init");
  v5 = v4;
  if (!v4)
  {
LABEL_5:
    a3 = v5;
    goto LABEL_6;
  }

  if (a3)
  {
    v4->_dark = (DataArk *)a3;
    if (libInFieldCollectionLibraryCore(0LL)) {
      v5->_collectionLibraryLoaded = 1;
    }
    goto LABEL_5;
  }

- (void)dealloc
{
  signingKey = self->_signingKey;
  if (signingKey) {
    CFRelease(signingKey);
  }
  self->_signingKey = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MACollectionInterface;
  -[MACollectionInterface dealloc](&v4, "dealloc");
}

+ (id)copyIngestURL
{
  v2 = @"https://tbsc.apple.com/ingest/register";
  if (is_internal_build())
  {
    v3 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
    objc_super v4 =  -[NSUserDefaults persistentDomainForName:]( v3,  "persistentDomainForName:",  @"com.apple.mobileactivationd");

    id v5 =  -[NSDictionary objectForKeyedSubscript:]( v4,  "objectForKeyedSubscript:",  @"InFieldCollectionOverrideURL");
    id v6 = isNSString(v5);

    if (v6)
    {
      objc_super v7 = (__CFString *) -[NSDictionary objectForKeyedSubscript:]( v4,  "objectForKeyedSubscript:",  @"InFieldCollectionOverrideURL");

      v2 = v7;
    }
  }

  else
  {
    objc_super v4 = 0LL;
  }

  v8 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v2);

  return v8;
}

- (__SecKey)signingKey
{
  v3 = (id)kSecAttrKeyTypeECSECPrimeRandom;
  CFErrorRef error = 0LL;
  if (self->_signingKey)
  {
    id v4 = 0LL;
    id v5 = 0LL;
  }

  else
  {
    id v6 = +[GestaltHlpr getSharedInstance](&OBJC_CLASS___GestaltHlpr, "getSharedInstance");
    id v4 = [v6 copyAnswer:@"HasPKA"];

    id v5 = (NSDictionary *)isNSNumber(v4);
    if (v5)
    {
      if ([v4 BOOLValue])
      {
        objc_super v7 = (__CFString *)kSecAttrKeyTypeECSECPrimeRandomPKA;

        v3 = v7;
      }

      SecAccessControlRef v8 = SecAccessControlCreateWithFlags(0LL, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, &error);
      if (v8)
      {
        SecAccessControlRef v9 = v8;
        v14[0] = kSecAttrIsPermanent;
        v14[1] = kSecAttrTokenID;
        v15[0] = &__kCFBooleanFalse;
        v15[1] = kSecAttrTokenIDAppleKeyStore;
        v14[2] = kSecAttrKeyType;
        v14[3] = kSecAttrAccessControl;
        v15[2] = v3;
        v15[3] = v8;
        id v5 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  4LL);
        v10 = SecKeyCreateRandomKey((CFDictionaryRef)v5, &error);
        self->_signingKey = v10;
        if (!v10) {
          maLog((uint64_t)"-[MACollectionInterface signingKey]", 0LL, @"Failed to create ref key: %@", error);
        }
        CFRelease(v9);
      }

      else
      {
        maLog((uint64_t)"-[MACollectionInterface signingKey]", 0LL, @"Failed to create access control: %@", error);
        id v5 = 0LL;
      }
    }

    else
    {
      maLog((uint64_t)"-[MACollectionInterface signingKey]", 0LL, @"Failed to retrieve PKA state.");
    }

    if (error) {
      CFRelease(error);
    }
  }

  signingKey = self->_signingKey;

  return signingKey;
}

- (id)collectSigningAttestation:(id *)a3
{
  if (!-[MACollectionInterface signingKey](self, "signingKey"))
  {
    id v6 =  createMobileActivationError( (uint64_t)"-[MACollectionInterface collectSigningAttestation:]",  154LL,  @"com.apple.MobileActivation.ErrorDomain",  -2LL,  0LL,  @"Invalid input");
    if (!a3)
    {
LABEL_7:
      id v7 = 0LL;
      goto LABEL_8;
    }

- (id)collectSIK:(id *)a3
{
  uint64_t v24 = 0LL;
  v25 = 0LL;
  size_t v22 = 0LL;
  v23 = 0LL;
  id v4 = +[GestaltHlpr getSharedInstance](&OBJC_CLASS___GestaltHlpr, "getSharedInstance");
  id v5 = [v4 copyAnswer:@"HasPKA"];

  id v6 = isNSNumber(v5);
  if (!v6)
  {
    id v10 =  createMobileActivationError( (uint64_t)"-[MACollectionInterface collectSIK:]",  190LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to retrieve PKA state.");
    SecAccessControlRef v9 = 0LL;
    v14 = 0LL;
    goto LABEL_16;
  }

  if ([v5 BOOLValue])
  {
    uint64_t v7 = 0LL;
    SecAccessControlRef v8 = 0LL;
    SecAccessControlRef v9 = 0LL;
    id v10 = 0LL;
  }

  else
  {
    id v21 = 0LL;
    SecAccessControlRef v9 = copyPersonalizedFirmwareData(2LL, (NSError **)&v21);
    id v10 = (NSError *)v21;
    if (!v9)
    {
      v12 = @"Failed to load boot manifest.";
      uint64_t v13 = 197LL;
      v16 = v10;
      goto LABEL_14;
    }

    SecAccessControlRef v9 = v9;
    uint64_t v15 = aks_sik_optional_params( 0LL,  0LL,  (uint64_t)-[NSData bytes](v9, "bytes"),  -[NSData length](v9, "length"),  &v25,  &v24);
    if ((_DWORD)v15)
    {
      uint64_t v20 = v15;
      v12 = @"Failed to decode SIK data: 0x%08x";
      uint64_t v13 = 203LL;
      goto LABEL_10;
    }

    uint64_t v7 = v24;
    SecAccessControlRef v8 = v25;
  }

  uint64_t v11 = aks_sik_collection((uint64_t)v8, v7, &v23, &v22);
  if ((_DWORD)v11)
  {
    uint64_t v20 = v11;
    v12 = @"Failed to perform SIK collection: 0x%08x";
    uint64_t v13 = 210LL;
LABEL_10:
    v16 = 0LL;
LABEL_14:
    v18 =  createMobileActivationError( (uint64_t)"-[MACollectionInterface collectSIK:]",  v13,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v16,  v12,  v20);

    v14 = 0LL;
    goto LABEL_15;
  }

  v17 = objc_alloc(&OBJC_CLASS___NSData);
  v14 = -[NSData initWithBytesNoCopy:length:](v17, "initWithBytesNoCopy:length:", v23, v22);
  if (v14)
  {
    v23 = 0LL;
    goto LABEL_16;
  }

  v18 =  createMobileActivationError( (uint64_t)"-[MACollectionInterface collectSIK:]",  216LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to convert data.");

LABEL_15:
  id v10 = v18;
LABEL_16:
  if (v25) {
    free(v25);
  }
  v25 = 0LL;
  if (v23) {
    free(v23);
  }
  v23 = 0LL;
  if (a3 && !v14) {
    *a3 = v10;
  }

  return v14;
}

- (id)collectPCRT:(id *)a3
{
  uint64_t v18 = 0LL;
  unsigned int v17 = 0;
  if (-[MACollectionInterface collectionLibraryLoaded](self, "collectionLibraryLoaded"))
  {
    uint64_t v19 = 0LL;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000LL;
    id v4 = getvsPHbdGfSymbolLoc_ptr;
    size_t v22 = getvsPHbdGfSymbolLoc_ptr;
    if (!getvsPHbdGfSymbolLoc_ptr)
    {
      id v5 = (void *)libInFieldCollectionLibrary();
      id v4 = dlsym(v5, "vsPHbdGf");
      v20[3] = (uint64_t)v4;
      getvsPHbdGfSymbolLoc_ptr = v4;
    }

    _Block_object_dispose(&v19, 8);
    if (!v4) {
      -[MACollectionInterface collectPCRT:].cold.1();
    }
    int v6 = ((uint64_t (*)(uint64_t *, unsigned int *))v4)(&v18, &v17);
    if (v6)
    {
      MobileActivationError = createMobileActivationError( (uint64_t)"-[MACollectionInterface collectPCRT:]",  249LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to collect PCRT: %ld",  v6);
    }

    else
    {
      uint64_t v11 = objc_alloc(&OBJC_CLASS___NSData);
      v12 = -[NSData initWithBytes:length:](v11, "initWithBytes:length:", v18, v17);
      if (v12)
      {
        id v10 = v12;
        SecAccessControlRef v9 = 0LL;
        goto LABEL_13;
      }

      MobileActivationError = createMobileActivationError( (uint64_t)"-[MACollectionInterface collectPCRT:]",  255LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to convert data.");
    }
  }

  else
  {
    MobileActivationError = createMobileActivationError( (uint64_t)"-[MACollectionInterface collectPCRT:]",  243LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Collection library not loaded.");
  }

  SecAccessControlRef v8 = MobileActivationError;
  SecAccessControlRef v9 = v8;
  if (a3)
  {
    SecAccessControlRef v9 = v8;
    id v10 = 0LL;
    *a3 = v9;
  }

  else
  {
    id v10 = 0LL;
  }

- (id)signingKeyPublicKeyWithError:(id *)a3
{
  CFErrorRef error = 0LL;
  id v4 = SecKeyCopyPublicKey(-[MACollectionInterface signingKey](self, "signingKey"));
  id v5 = v4;
  if (v4)
  {
    CFDataRef v6 = SecKeyCopyExternalRepresentation(v4, &error);
    if (v6)
    {
      uint64_t v7 = v6;
      SecAccessControlRef v8 = 0LL;
      goto LABEL_9;
    }

    MobileActivationError = createMobileActivationError( (uint64_t)"-[MACollectionInterface signingKeyPublicKeyWithError:]",  288LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  error,  @"Failed to RK public key as data.");
  }

  else
  {
    MobileActivationError = createMobileActivationError( (uint64_t)"-[MACollectionInterface signingKeyPublicKeyWithError:]",  282LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to copy RK public key.");
  }

  id v10 = MobileActivationError;
  SecAccessControlRef v8 = v10;
  if (a3)
  {
    SecAccessControlRef v8 = v10;
    uint64_t v7 = 0LL;
    *a3 = v8;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

- (id)signatureForData:(id)a3 error:(id *)a4
{
  CFErrorRef error = 0LL;
  CFDataRef v6 = (const __CFData *)a3;
  CFDataRef v7 = SecKeyCreateSignature( -[MACollectionInterface signingKey](self, "signingKey"),  kSecKeyAlgorithmECDSASignatureMessageX962SHA256,  v6,  &error);

  if (v7)
  {
    SecAccessControlRef v8 = v7;
    SecAccessControlRef v9 = 0LL;
  }

  else
  {
    SecAccessControlRef v9 =  createMobileActivationError( (uint64_t)"-[MACollectionInterface signatureForData:error:]",  317LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  error,  @"Failed to sign activation data with ref key.");
  }

  if (error) {
    CFRelease(error);
  }
  CFErrorRef error = 0LL;
  if (a4 && !v7) {
    *a4 = v9;
  }

  return v7;
}

- (id)copyIngestHeaders:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (-[MACollectionInterface collectionLibraryLoaded](self, "collectionLibraryLoaded"))
  {
    id v21 = 0LL;
    id v7 = -[MACollectionInterface signatureForData:error:](self, "signatureForData:error:", v6, &v21);
    id v8 = v21;
    SecAccessControlRef v9 = v8;
    if (v7)
    {
      id v20 = v8;
      id v10 = -[MACollectionInterface signingKeyPublicKeyWithError:](self, "signingKeyPublicKeyWithError:", &v20);
      uint64_t v11 = (NSError *)v20;

      if (v10)
      {
        id v12 = [v7 base64EncodedStringWithOptions:0];
        id v13 = [v10 base64EncodedStringWithOptions:0];
        v14 = v13;
        if (v12 && v13)
        {
          v22[0] = @"X-Apple-Signature";
          v22[1] = @"X-Apple-Sig-Key";
          v23[0] = v12;
          v23[1] = v13;
          v22[2] = @"Content-Type";
          v22[3] = @"User-Agent";
          v23[2] = @"application/octet-stream";
          v23[3] = @"iOS Device Activator (MobileActivation-1015.60.1)";
          v22[4] = @"X-Apple-AL-ID";
          uint64_t v15 = +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID");
          v16 = -[NSUUID UUIDString](v15, "UUIDString");
          v23[4] = v16;
          unsigned int v17 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  5LL);

          if (!a4) {
            goto LABEL_17;
          }
          goto LABEL_15;
        }

        uint64_t v18 =  createMobileActivationError( (uint64_t)"-[MACollectionInterface copyIngestHeaders:withError:]",  368LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to encode data as string.");
      }

      else
      {
        uint64_t v18 =  createMobileActivationError( (uint64_t)"-[MACollectionInterface copyIngestHeaders:withError:]",  358LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to copy signing key public key: %@",  v11);

        id v12 = 0LL;
        v14 = 0LL;
      }

      unsigned int v17 = 0LL;
      uint64_t v11 = v18;
      if (!a4) {
        goto LABEL_17;
      }
      goto LABEL_15;
    }

    uint64_t v11 =  createMobileActivationError( (uint64_t)"-[MACollectionInterface copyIngestHeaders:withError:]",  352LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to create signature for data: %@",  v8);

    id v12 = 0LL;
    v14 = 0LL;
  }

  else
  {
    uint64_t v11 =  createMobileActivationError( (uint64_t)"-[MACollectionInterface copyIngestHeaders:withError:]",  344LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Collection library not loaded.");
    id v12 = 0LL;
    v14 = 0LL;
    id v7 = 0LL;
  }

  id v10 = 0LL;
  unsigned int v17 = 0LL;
  if (!a4) {
    goto LABEL_17;
  }
LABEL_15:
  if (!v17) {
    *a4 = v11;
  }
LABEL_17:

  return v17;
}

- (id)copyIngestData:(id *)a3
{
  v74[0] = 0LL;
  v74[1] = v74;
  v74[2] = 0x3032000000LL;
  v74[3] = __Block_byref_object_copy__1;
  v74[4] = __Block_byref_object_dispose__1;
  id v75 = 0LL;
  uint64_t v68 = 0LL;
  v69 = &v68;
  uint64_t v70 = 0x3032000000LL;
  v71 = __Block_byref_object_copy__1;
  v72 = __Block_byref_object_dispose__1;
  id v73 = 0LL;
  v66[0] = 0LL;
  v66[1] = v66;
  v66[2] = 0x3032000000LL;
  v66[3] = __Block_byref_object_copy__1;
  v66[4] = __Block_byref_object_dispose__1;
  id v67 = 0LL;
  uint64_t v60 = 0LL;
  v61 = &v60;
  uint64_t v62 = 0x3032000000LL;
  v63 = __Block_byref_object_copy__1;
  v64 = __Block_byref_object_dispose__1;
  id v65 = 0LL;
  if (copyIngestData__onceToken != -1) {
    dispatch_once(&copyIngestData__onceToken, &__block_literal_global_1);
  }
  if (!copyIngestData__queue)
  {
    id v12 =  createMobileActivationError( (uint64_t)"-[MACollectionInterface copyIngestData:]",  419LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to create queue.");
    id v13 = 0LL;
    id v14 = 0LL;
    id v15 = 0LL;
    id v49 = 0LL;
    id v47 = 0LL;
LABEL_26:
    id v48 = 0LL;
LABEL_27:
    id v46 = 0LL;
    goto LABEL_28;
  }

  if (!is_product_cellular())
  {
    id v47 = 0LL;
    id v48 = 0LL;
    goto LABEL_13;
  }

  id v4 = +[GestaltHlpr getSharedInstance](&OBJC_CLASS___GestaltHlpr, "getSharedInstance");
  id v47 = [v4 copyAnswer:@"InternationalMobileEquipmentIdentity"];

  id v5 = isNSString(v47);
  LODWORD(v4) = v5 == 0LL;

  if ((_DWORD)v4)
  {
    id v12 =  createMobileActivationError( (uint64_t)"-[MACollectionInterface copyIngestData:]",  428LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to retrieve IMEI.");
    id v13 = 0LL;
    id v14 = 0LL;
    id v15 = 0LL;
    id v49 = 0LL;
    goto LABEL_26;
  }

  id v6 = +[GestaltHlpr getSharedInstance](&OBJC_CLASS___GestaltHlpr, "getSharedInstance");
  id v48 = [v6 copyAnswer:@"xRyzf9zFE/ycr/wJPweZvQ"];

  if (v48)
  {
    id v7 = isNSString(v48);
    BOOL v8 = v7 == 0LL;

    if (v8)
    {
      id v12 =  createMobileActivationError( (uint64_t)"-[MACollectionInterface copyIngestData:]",  434LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Invalid IMEI2.");
      id v13 = 0LL;
      id v14 = 0LL;
      id v15 = 0LL;
      id v49 = 0LL;
      goto LABEL_27;
    }
  }

  id v9 = +[GestaltHlpr getSharedInstance](&OBJC_CLASS___GestaltHlpr, "getSharedInstance");
  id v46 = [v9 copyAnswer:@"MobileEquipmentIdentifier"];

  if (!v46)
  {
LABEL_13:
    id v46 = 0LL;
    goto LABEL_14;
  }

  id v10 = isNSString(v46);
  BOOL v11 = v10 == 0LL;

  if (v11)
  {
    id v12 =  createMobileActivationError( (uint64_t)"-[MACollectionInterface copyIngestData:]",  442LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Invalid MEID.");
    id v13 = 0LL;
    id v14 = 0LL;
    id v15 = 0LL;
    id v49 = 0LL;
LABEL_28:
    id v19 = 0LL;
LABEL_29:
    id v22 = 0LL;
LABEL_30:
    id v27 = 0LL;
LABEL_31:
    id v30 = 0LL;
LABEL_32:
    v33 = 0LL;
    v34 = 0LL;
LABEL_33:
    v35 = (void *)v61[5];
    v61[5] = (uint64_t)v12;

LABEL_34:
    v36 = 0LL;
    if (a3) {
      *a3 = (id) v61[5];
    }
    goto LABEL_36;
  }

void __40__MACollectionInterface_copyIngestData___block_invoke(id a1)
{
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.mobileactivationd.collection", v1);
  v3 = (void *)copyIngestData__queue;
  copyIngestData__queue = (uint64_t)v2;
}

void __40__MACollectionInterface_copyIngestData___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dark];
  id v3 = data_ark_copy(v2, 0LL, @"PCRTCollectionString");
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) dark];
  id v7 = data_ark_copy(v6, 0LL, @"PCRTCollectionStringBuild");
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  id v10 = isNSString(*(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
  if (!v10)
  {
LABEL_6:
    id v15 = *(void **)(a1 + 32);
    uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8LL);
    id obj = *(id *)(v16 + 40);
    id v17 = [v15 collectPCRT:&obj];
    objc_storeStrong((id *)(v16 + 40), obj);
    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    id v20 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
    if (v20)
    {
      id v21 = [v20 base64EncodedStringWithOptions:0];
      uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8LL);
      id v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;

      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
      {
        id v24 = [*(id *)(a1 + 32) dark];
        data_ark_set( v24,  0LL,  @"PCRTCollectionString",  *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL),  1);

        id v25 = [*(id *)(a1 + 32) dark];
        data_ark_set(v25, 0LL, @"PCRTCollectionStringBuild", *(void **)(a1 + 40), 1);
LABEL_12:

        return;
      }

      MobileActivationError = createMobileActivationError( (uint64_t)"-[MACollectionInterface copyIngestData:]_block_invoke_2",  510LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to encode data as string.");
    }

    else
    {
      MobileActivationError = createMobileActivationError( (uint64_t)"-[MACollectionInterface copyIngestData:]_block_invoke_2",  504LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  *(void **)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL),  @"Failed to collect PCRT.");
    }

    id v27 = MobileActivationError;
    uint64_t v28 = *(void *)(*(void *)(a1 + 72) + 8LL);
    id v25 = *(id *)(v28 + 40);
    *(void *)(v28 + 40) = v27;
    goto LABEL_12;
  }

  BOOL v11 = v10;
  id v12 = isNSString(*(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL));
  if (!v12)
  {

    goto LABEL_6;
  }

  id v13 = v12;
  unsigned __int8 v14 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) isEqualToString:*(void *)(a1 + 40)];

  if ((v14 & 1) == 0) {
    goto LABEL_6;
  }
}

- (BOOL)processSUInfo:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (-[MACollectionInterface collectionLibraryLoaded](self, "collectionLibraryLoaded"))
  {
    id v7 = v6;
    uint64_t v8 = NAAB((uint64_t)[v7 bytes], (int)objc_msgSend(v7, "length"));
    if (!(_DWORD)v8)
    {
      id v10 = 0LL;
      BOOL v11 = 1;
      goto LABEL_9;
    }

    MobileActivationError = createMobileActivationError( (uint64_t)"-[MACollectionInterface processSUInfo:withError:]",  600LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to process SUInfo: %d",  v8);
  }

  else
  {
    MobileActivationError = createMobileActivationError( (uint64_t)"-[MACollectionInterface processSUInfo:withError:]",  592LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Collection library not loaded.");
  }

  id v10 = MobileActivationError;
  if (a4)
  {
    id v10 = v10;
    BOOL v11 = 0;
    *a4 = v10;
  }

  else
  {
    BOOL v11 = 0;
  }

- (BOOL)collectionLibraryLoaded
{
  return self->_collectionLibraryLoaded;
}

- (void)setCollectionLibraryLoaded:(BOOL)a3
{
  self->_collectionLibraryLoaded = a3;
}

- (DataArk)dark
{
  return self->_dark;
}

- (void)collectPCRT:.cold.1()
{
  v0 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( v0,  "handleFailureInFunction:file:lineNumber:description:",   +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "OSStatus gCollectInFieldManifest(UInt8 **, UInt32 *)"),  @"MACollectionInterface.m",  43LL,  @"%s",  dlerror());
  OUTLINED_FUNCTION_0();

  __break(1u);
}

- (void)collectPCRT:.cold.2()
{
  v0 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( v0,  "handleFailureInFunction:file:lineNumber:description:",   +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void gFreeInFieldManifest(UInt8 *)"),  @"MACollectionInterface.m",  44LL,  @"%s",  dlerror());
  OUTLINED_FUNCTION_0();

  __break(1u);
}

@end