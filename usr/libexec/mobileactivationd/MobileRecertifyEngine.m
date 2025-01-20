@interface MobileRecertifyEngine
- (DataArk)dark;
- (MobileRecertifyEngine)initWithQueue:(id)a3 dark:(id)a4;
- (OS_dispatch_queue)queue;
- (id)createRecertInfoWithDataArk:(id)a3 alcoholBlob:(NACContextOpaque_ *)a4 options:(id)a5 error:(id *)a6;
- (void)recertifyDevice:(id)a3;
- (void)setDark:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation MobileRecertifyEngine

- (MobileRecertifyEngine)initWithQueue:(id)a3 dark:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MobileRecertifyEngine;
  v9 = -[MobileRecertifyEngine init](&v13, "init");
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    if (!v7 || !v8)
    {
      maLog((uint64_t)"-[MobileRecertifyEngine initWithQueue:dark:]", 0LL, @"Invalid input");
      v11 = 0LL;
      goto LABEL_7;
    }

    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong(p_isa + 1, a4);
  }

  v11 = p_isa;
LABEL_7:

  return v11;
}

- (id)createRecertInfoWithDataArk:(id)a3 alcoholBlob:(NACContextOpaque_ *)a4 options:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a5;
  __int128 v73 = 0uLL;
  int v74 = 0;
  memset(v72, 0, 35);
  memset(v71, 0, sizeof(v71));
  unsigned int v65 = 256;
  bzero(v70, 0x1000uLL);
  unsigned int v64 = 4096;
  SecKeyRef privateKeyRef = 0LL;
  SecIdentityRef identityRef = 0LL;
  uint64_t v61 = 0LL;
  unsigned int v60 = 0;
  id v51 = v9;
  id v52 = v8;
  if (v8 && a4)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if (v10)
    {
      id v11 = +[GestaltHlpr getSharedInstance](&OBJC_CLASS___GestaltHlpr, "getSharedInstance");
      id v59 = 0LL;
      [v11 updateRecertInfo:v10 errors:&v59];
      id v12 = v59;
      id v49 = v12;
      id v50 = v11;
      if ([v12 count])
      {
        objc_super v13 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]",  119LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to retrieve gestalt values: %@",  v12);
        v53 = 0LL;
        id v46 = 0LL;
        v47 = 0LL;
        v14 = 0LL;
        id v48 = 0LL;
LABEL_22:
        v15 = 0LL;
        v16 = 0LL;
        v17 = 0LL;
        goto LABEL_23;
      }

      id v18 = copy_device_certificate(0LL);
      if (v18) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v18,  @"DeviceCertificate");
      }
      id v58 = 0LL;
      v19 = create_cert_request(v8, &v58);
      id v20 = v58;
      v21 = v19;
      v22 = v20;
      id v48 = v18;
      if (v21)
      {
        v53 = v21;
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v21,  @"DeviceCertRequest");
        v23 = +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID");
        if (v23)
        {
          v47 = v23;
          id v24 = [v9 objectForKeyedSubscript:@"ReCertRandomness"];
          v25 = (NSMutableDictionary *)isNSString(v24);

          id v46 = v24;
          if (!v25)
          {
            objc_super v13 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]",  148LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Invalid nonce.");

            v14 = 0LL;
            v15 = 0LL;
            v16 = 0LL;
            v17 = 0LL;
            v27 = 0LL;
            goto LABEL_24;
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v24,  @"ActivationRandomness");
          v68 = @"UseSystemKeychainSharediPadOnly";
          v69 = &__kCFBooleanTrue;
          v45 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v69,  &v68,  1LL);
          if (load_identity( (CFTypeRef *)&identityRef,  @"lockdown-identities",  @"com.apple.lockdown.identity.activation",  v45,  0LL,  0LL))
          {
            uint64_t v26 = SecIdentityCopyPrivateKey(identityRef, &privateKeyRef);
            if ((_DWORD)v26 || !privateKeyRef)
            {
              objc_super v13 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]",  165LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to copy private key: %d",  v26);

              v14 = 0LL;
              v15 = 0LL;
              v16 = 0LL;
              v17 = 0LL;
              v27 = 0LL;
LABEL_51:
              v25 = 0LL;
              v29 = 0LL;
              goto LABEL_52;
            }

            id v57 = v22;
            v27 = lockcrypto_sign(privateKeyRef, v53, (NSError **)&v57);
            id v28 = v57;

            if (!v27)
            {
              objc_super v13 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]",  171LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v28,  @"Failed to sign data.");

              v14 = 0LL;
              goto LABEL_50;
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v27,  @"IdentitySignature");
          }

          else
          {
            v27 = 0LL;
            id v28 = v22;
          }

          id v56 = 0LL;
          v29 =  +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v10,  100LL,  0LL,  &v56);
          id v33 = v56;

          if (v29)
          {
            v14 = v29;
            t1BoNctgaUu66( (uint64_t)a4,  (uint64_t)-[NSData bytes](v14, "bytes"),  -[NSData length](v14, "length"),  (uint64_t)&v61);
            if ((_DWORD)v34)
            {
              objc_super v13 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]",  192LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to sign data: %d",  v34);

LABEL_50:
              v15 = 0LL;
              v16 = 0LL;
              v17 = 0LL;
              goto LABEL_51;
            }

            v35 = objc_alloc(&OBJC_CLASS___NSData);
            v36 = -[NSData initWithBytes:length:](v35, "initWithBytes:length:", v61, v60);
            v29 = v36;
            if (v36)
            {
              v30 = -[NSData base64EncodedStringWithOptions:](v36, "base64EncodedStringWithOptions:", 0LL);
              if (!v30)
              {
                objc_super v13 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]",  205LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to encode data as base64.");

                v15 = 0LL;
                v16 = 0LL;
                v17 = 0LL;
                v25 = 0LL;
                goto LABEL_25;
              }

              v37 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
              v25 = v37;
              if (!v37)
              {
                objc_super v13 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]",  211LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to create dictionary.");

                v15 = 0LL;
                v16 = 0LL;
                v17 = 0LL;
                goto LABEL_25;
              }

              -[NSMutableDictionary setObject:forKeyedSubscript:]( v37,  "setObject:forKeyedSubscript:",  v30,  @"ValidationData");
              v38 =  +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v10);
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  v38,  @"payload");

              id v55 = 0LL;
              v16 =  +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v25,  100LL,  0LL,  &v55);
              objc_super v13 = (NSError *)v55;

              if (!v16)
              {
                v44 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]",  220LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v13,  @"Failed to convert dictionary to xml data.");

                v14 = 0LL;
                v15 = 0LL;
LABEL_61:
                v17 = 0LL;
                objc_super v13 = v44;
                goto LABEL_25;
              }

              v14 = v16;
              if (CCDigest(8LL, -[NSData bytes](v14, "bytes"), -[NSData length](v14, "length"), &v73))
              {
                MobileActivationError = createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]",  229LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to digest data.");
              }

              else
              {
                *(void *)&v72[0] = 0xE2B050609302130LL;
                DWORD2(v72[0]) = 85590531;
                WORD6(v72[0]) = 1024;
                BYTE14(v72[0]) = 20;
                *(_OWORD *)((char *)v72 + 15) = v73;
                *(_DWORD *)((char *)&v72[1] + 15) = v74;
                wyjYwk((uint64_t)v72, 35LL, (uint64_t)v71, (uint64_t)&v65, (uint64_t)v70, (uint64_t)&v64);
                if (!v40)
                {
                  v41 = objc_alloc(&OBJC_CLASS___NSData);
                  v15 = -[NSData initWithBytes:length:](v41, "initWithBytes:length:", v71, v65);
                  if (v15)
                  {
                    v42 = objc_alloc(&OBJC_CLASS___NSData);
                    v43 = -[NSData initWithBytes:length:](v42, "initWithBytes:length:", v70, v64);
                    v16 = v43;
                    if (v43)
                    {
                      v66[0] = @"CertificateInfoXML";
                      v66[1] = @"FairPlaySignature";
                      v67[0] = v14;
                      v67[1] = v15;
                      v66[2] = @"FairPlayCertChain";
                      v67[2] = v43;
                      v17 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v67,  v66,  3LL);
                      goto LABEL_25;
                    }

                    v44 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]",  275LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to serialize cert chain.");

                    goto LABEL_61;
                  }

                  v44 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]",  269LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to serialize signature data.");

                  goto LABEL_60;
                }

                MobileActivationError = createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]",  263LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to compute fairplay activation signature: %ld",  v40);
              }

              v44 = MobileActivationError;

              v15 = 0LL;
LABEL_60:
              v16 = 0LL;
              goto LABEL_61;
            }

            objc_super v13 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]",  199LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to convert signed data.");
          }

          else
          {
            objc_super v13 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]",  182LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v33,  @"Could not convert dictionary to xml data.");

            v14 = 0LL;
          }

          v15 = 0LL;
          v16 = 0LL;
          v17 = 0LL;
          v25 = 0LL;
LABEL_52:
          v30 = 0LL;
          goto LABEL_25;
        }

        objc_super v13 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]",  142LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Could not create UUID.");
      }

      else
      {
        objc_super v13 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]",  132LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v20,  @"Failed to create certificate request.");

        v53 = 0LL;
      }

      id v46 = 0LL;
      v47 = 0LL;
      v14 = 0LL;
      goto LABEL_22;
    }

    objc_super v13 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]",  110LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Could not create dictionary.");
  }

  else
  {
    objc_super v13 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]",  104LL,  @"com.apple.MobileActivation.ErrorDomain",  -2LL,  0LL,  @"Invalid input(s).");
    v10 = 0LL;
  }

  v53 = 0LL;
  id v46 = 0LL;
  v47 = 0LL;
  v14 = 0LL;
  id v48 = 0LL;
  id v49 = 0LL;
  v15 = 0LL;
  v16 = 0LL;
  v17 = 0LL;
  id v50 = 0LL;
LABEL_23:
  v27 = 0LL;
  v25 = 0LL;
LABEL_24:
  v29 = 0LL;
  v30 = 0LL;
  v45 = 0LL;
LABEL_25:
  if (a6 && !v17) {
    *a6 = v13;
  }
  if (privateKeyRef) {
    CFRelease(privateKeyRef);
  }
  SecKeyRef privateKeyRef = 0LL;
  if (identityRef) {
    CFRelease(identityRef);
  }
  SecIdentityRef identityRef = 0LL;
  if (v61) {
    Be81a395Bf0(v61);
  }
  v31 = v17;

  return v31;
}

- (void)recertifyDevice:(id)a3
{
  id v4 = a3;
  uint64_t v128 = 0LL;
  uint64_t v129 = 0LL;
  v126 = 0LL;
  v5 = -[MobileRecertifyEngine queue](self, "queue");
  dispatch_assert_queue_not_V2((dispatch_queue_t)v5);

  v6 = -[NSURL initWithString:]( objc_alloc(&OBJC_CLASS___NSURL),  "initWithString:",  @"https://albert.apple.com/deviceservices/certifySB");
  id v7 = -[NSURL initWithString:]( objc_alloc(&OBJC_CLASS___NSURL),  "initWithString:",  @"https://static.ips.apple.com/absinthe-cert/certificate.cer");
  id v8 = -[NSURL initWithString:]( objc_alloc(&OBJC_CLASS___NSURL),  "initWithString:",  @"https://albert.apple.com/deviceservices/session");
  v104 = v7;
  v105 = v6;
  if (v6) {
    BOOL v9 = v7 == 0LL;
  }
  else {
    BOOL v9 = 1;
  }
  v107 = v8;
  if (v9 || v8 == 0LL)
  {
    id v11 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  350LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to allocate URL.");
    id v12 = 0LL;
    v101 = 0LL;
    v102 = 0LL;
    v108 = 0LL;
    id v99 = 0LL;
    id v100 = 0LL;
    id v97 = 0LL;
    id v98 = 0LL;
    v96 = 0LL;
    v106 = 0LL;
    v103 = 0LL;
LABEL_24:
    id v32 = 0LL;
    id v33 = 0LL;
    id v34 = 0LL;
    v35 = 0LL;
    v31 = 0LL;
    v36 = 0LL;
    id v109 = 0LL;
LABEL_25:
    v29 = 0LL;
    goto LABEL_37;
  }

  if (is_internal_build())
  {
    v14 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
    v15 =  -[NSUserDefaults persistentDomainForName:]( v14,  "persistentDomainForName:",  @"com.apple.mobileactivationd");

    id v16 = -[NSDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", @"UseReverseProxy");
    id v17 = isNSNumber(v16);
    v103 = v15;
    if (v17)
    {
      id v18 = v17;
      id v19 = -[NSDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", @"UseReverseProxy");
      unsigned int v20 = [v19 BOOLValue];

      if (v20)
      {
        v21 = copyReverseProxyDictionary(0LL, 0LL, 0LL);
        if (v21)
        {
          v22 = v21;
          id v23 = 0LL;
          goto LABEL_19;
        }
      }
    }

    else
    {
    }
  }

  else
  {
    v103 = 0LL;
  }

  v125[1] = 0LL;
  BOOL v24 = networkReachable();
  id v23 = 0LL;
  if (!v24)
  {
    id v11 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  365LL,  @"com.apple.MobileActivation.ErrorDomain",  -17LL,  v23,  @"Network is unavailable.");

    id v12 = 0LL;
    v101 = 0LL;
    v102 = 0LL;
    v108 = 0LL;
    id v99 = 0LL;
    id v100 = 0LL;
    id v97 = 0LL;
    id v98 = 0LL;
    v96 = 0LL;
    v106 = 0LL;
    goto LABEL_24;
  }

  v22 = 0LL;
LABEL_19:
  v25 = objc_alloc(&OBJC_CLASS___NSMutableURLRequest);
  LODWORD(v26) = NETWORK_TIMEOUT_SECONDS;
  double v27 = (double)v26;
  id v28 = -[NSMutableURLRequest initWithURL:cachePolicy:timeoutInterval:]( v25,  "initWithURL:cachePolicy:timeoutInterval:",  v7,  1LL,  (double)v26);
  v29 = (NSData *)v28;
  v106 = v22;
  if (!v28)
  {
    id v11 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  373LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to allocate request.");

    id v12 = 0LL;
    v101 = 0LL;
    v102 = 0LL;
    v108 = 0LL;
    id v109 = 0LL;
LABEL_34:
    id v99 = 0LL;
    id v100 = 0LL;
    id v97 = 0LL;
    id v98 = 0LL;
    v96 = 0LL;
    id v32 = 0LL;
    id v33 = 0LL;
LABEL_35:
    id v34 = 0LL;
    v35 = 0LL;
    v31 = 0LL;
    goto LABEL_36;
  }

  -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v28,  "setValue:forHTTPHeaderField:",  @"Absinthe/2.0 iOS Device Activator (MobileActivation-1015.60.1 built on Nov 10 2024 at 01:51:41)",  @"User-Agent");
  id v124 = v23;
  v125[0] = 0LL;
  id v12 = (NSString *)talkToServerWithError(v29, 0LL, 0, v22, v125, &v126, &v124);
  id v109 = v125[0];
  id v30 = v124;

  v31 = v126;
  if (v126 != (NSDictionary *)200)
  {
    if (!v126)
    {
      id v11 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  382LL,  @"com.apple.MobileActivation.ErrorDomain",  -6LL,  v30,  @"Network communication error.");

      v101 = 0LL;
      v102 = 0LL;
      v108 = 0LL;
      id v99 = 0LL;
      id v100 = 0LL;
      id v97 = 0LL;
      id v98 = 0LL;
      v96 = 0LL;
      id v32 = 0LL;
      id v33 = 0LL;
      id v34 = 0LL;
      v35 = 0LL;
LABEL_36:
      v36 = 0LL;
      goto LABEL_37;
    }

    v39 =  +[NSHTTPURLResponse localizedStringForStatusCode:]( &OBJC_CLASS___NSHTTPURLResponse,  "localizedStringForStatusCode:",  v126);
    int v40 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  387LL,  @"com.apple.MobileActivation.ServerErrorDomain",  (uint64_t)v31,  v30,  @"Server error: %ld (%@)",  v31,  v39);

    uint64_t v41 = (uint64_t)v126;
    v42 =  +[NSHTTPURLResponse localizedStringForStatusCode:]( &OBJC_CLASS___NSHTTPURLResponse,  "localizedStringForStatusCode:",  v126);
    id v11 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  387LL,  @"com.apple.MobileActivation.ErrorDomain",  -6LL,  v40,  @"Server error: %ld (%@)",  v41,  v42);

    goto LABEL_33;
  }

  if (!v12)
  {
    MobileActivationError = createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  392LL,  @"com.apple.MobileActivation.ErrorDomain",  -6LL,  v30,  @"Failed to get a response from the server.");
    goto LABEL_32;
  }

  id v12 = v12;
  KxmB0CKvgWt((uint64_t)-[NSString bytes](v12, "bytes"), (int)-[NSString length](v12, "length"));
  if ((_DWORD)v37)
  {
    MobileActivationError = createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  398LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to initialize NAC: %d",  v37);
LABEL_32:
    id v11 = MobileActivationError;
LABEL_33:

    v101 = 0LL;
    v102 = 0LL;
    v108 = 0LL;
    goto LABEL_34;
  }

  v137[0] = @"id";
  v137[1] = @"request";
  v138[0] = &off_10026D620;
  v43 = objc_alloc(&OBJC_CLASS___NSData);
  v44 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( v43,  "initWithBytesNoCopy:length:freeWhenDone:",  v128,  v127,  0LL);
  v45 = -[NSData base64EncodedStringWithOptions:](v44, "base64EncodedStringWithOptions:", 0LL);
  v138[1] = v45;
  id v46 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v138,  v137,  2LL);

  v135 = @"absinthe-operations";
  v132 = v46;
  v133 = @"create-session-info";
  v102 = v46;
  v47 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v132, 1LL);
  v134 = v47;
  id v48 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v134,  &v133,  1LL);
  v136 = v48;
  id v49 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v136,  &v135,  1LL);

  id v123 = v30;
  id v33 =  +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v49,  0LL,  &v123);
  id v50 = v123;

  v108 = v33;
  v101 = v49;
  if (!v33)
  {
    id v11 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  411LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v50,  @"Failed to serialize data.");

    v108 = 0LL;
    id v99 = 0LL;
    id v100 = 0LL;
    id v97 = 0LL;
    id v98 = 0LL;
    v96 = 0LL;
    id v32 = 0LL;
    goto LABEL_35;
  }

  id v33 = -[NSMutableURLRequest initWithURL:cachePolicy:timeoutInterval:]( objc_alloc(&OBJC_CLASS___NSMutableURLRequest),  "initWithURL:cachePolicy:timeoutInterval:",  v107,  1LL,  v27);

  if (!v33)
  {
    id v11 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  420LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to allocate request.");

    id v99 = 0LL;
    id v100 = 0LL;
    id v97 = 0LL;
    id v98 = 0LL;
    v96 = 0LL;
    id v32 = 0LL;
    id v34 = 0LL;
    v35 = 0LL;
    v31 = 0LL;
    v36 = 0LL;
    goto LABEL_25;
  }

  -[NSData setHTTPBody:](v33, "setHTTPBody:", v108);
  -[NSData setValue:forHTTPHeaderField:]( v33,  "setValue:forHTTPHeaderField:",  @"Absinthe/2.0 iOS Device Activator (MobileActivation-1015.60.1 built on Nov 10 2024 at 01:51:41)",  @"User-Agent");
  -[NSData setValue:forHTTPHeaderField:]( v33,  "setValue:forHTTPHeaderField:",  @"application/json",  @"Content-Type");
  -[NSData setHTTPMethod:](v33, "setHTTPMethod:", @"POST");
  id v121 = v50;
  id v122 = v109;
  v36 = (NSString *)talkToServerWithError(v33, 0LL, 0, v106, &v122, &v126, &v121);
  id v93 = v122;

  id v51 = v121;
  uint64_t v52 = (uint64_t)v126;
  if (v126 != (NSDictionary *)200)
  {
    v91 = v33;
    v92 = v36;
    if (v126)
    {
      unsigned int v65 =  +[NSHTTPURLResponse localizedStringForStatusCode:]( &OBJC_CLASS___NSHTTPURLResponse,  "localizedStringForStatusCode:",  v126);
      v66 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  438LL,  @"com.apple.MobileActivation.ServerErrorDomain",  v52,  v51,  @"Server error: %ld (%@)",  v52,  v65);

      uint64_t v67 = (uint64_t)v126;
      v68 =  +[NSHTTPURLResponse localizedStringForStatusCode:]( &OBJC_CLASS___NSHTTPURLResponse,  "localizedStringForStatusCode:",  v126);
      id v11 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  438LL,  @"com.apple.MobileActivation.ErrorDomain",  -6LL,  v66,  @"Server error: %ld (%@)",  v67,  v68);
    }

    else
    {
      id v11 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  433LL,  @"com.apple.MobileActivation.ErrorDomain",  -6LL,  v51,  @"Network communication error.");
    }

    id v99 = 0LL;
    id v100 = 0LL;
    id v97 = 0LL;
    id v98 = 0LL;
    goto LABEL_61;
  }

  if (!v36)
  {
    id v11 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  443LL,  @"com.apple.MobileActivation.ErrorDomain",  -6LL,  v51,  @"Failed to get response from server.");

    id v12 = 0LL;
    id v99 = 0LL;
    id v100 = 0LL;
    id v97 = 0LL;
    id v98 = 0LL;
    v96 = 0LL;
    id v32 = 0LL;
    v29 = v33;
    id v33 = 0LL;
    id v34 = 0LL;
    v35 = 0LL;
    v31 = 0LL;
LABEL_72:
    id v109 = v93;
    goto LABEL_37;
  }

  id v120 = v51;
  id v53 =  +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v36,  1LL,  &v120);
  id v54 = v120;

  if (!v53)
  {
    id v11 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  449LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v54,  @"Failed to serialize json data.");

    id v99 = 0LL;
    id v100 = 0LL;
LABEL_68:
    id v97 = 0LL;
    id v98 = 0LL;
    v96 = 0LL;
    id v32 = 0LL;
    v29 = v33;
    id v33 = 0LL;
    id v34 = 0LL;
    v35 = 0LL;
    v31 = 0LL;
    id v12 = v36;
    v36 = 0LL;
    goto LABEL_72;
  }

  id v55 = [v53 objectForKeyedSubscript:@"absinthe-results"];
  id v56 = [v55 objectForKeyedSubscript:@"create-session-info"];

  id v57 = isNSArray(v56);
  id v99 = v56;
  id v100 = v53;
  if (!v57)
  {
    id v11 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  486LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Missing one drink: %@",  v53);

    goto LABEL_68;
  }

  v92 = v36;
  id v58 = [v56 objectAtIndexedSubscript:0];
  id v59 = isNSDictionary(v58);

  id v98 = v58;
  if (!v59)
  {
    id v11 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  492LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Missing two drinks: %@",  v53);

    id v97 = 0LL;
LABEL_71:
    v96 = 0LL;
    id v32 = 0LL;
    v29 = v33;
    id v33 = 0LL;
    id v34 = 0LL;
    v35 = 0LL;
    v31 = 0LL;
    v36 = 0LL;
    id v12 = v92;
    goto LABEL_72;
  }

  id v60 = [v58 objectForKeyedSubscript:@"session-info"];
  id v61 = isNSString(v60);

  id v97 = v60;
  if (!v61)
  {
    id v11 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  498LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Missing three drinks: %@",  v53);

    goto LABEL_71;
  }

  v91 = v33;
  v62 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v60,  1LL);
  if (!v62)
  {
    id v11 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  504LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Missing four drinks: %@",  v53);

LABEL_61:
    v96 = 0LL;
    goto LABEL_62;
  }

  uint64_t v63 = v129;
  v96 = v62;
  nDYmeMqvWb(v63, (uint64_t)-[NSData bytes](v96, "bytes"), (int)-[NSData length](v96, "length"));
  if ((_DWORD)v64)
  {
    id v11 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  510LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"NACKeyEstablishment failed: %d",  v64);

LABEL_62:
    id v32 = 0LL;
    id v33 = 0LL;
    id v34 = 0LL;
    v35 = 0LL;
    v31 = 0LL;
    v36 = 0LL;
LABEL_63:
    id v12 = v92;
    id v109 = v93;
LABEL_64:
    v29 = v91;
    goto LABEL_37;
  }

  v69 = +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID");
  v36 = -[NSUUID UUIDString](v69, "UUIDString");

  if (!v36)
  {
    id v11 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  516LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to create nonce.");

    id v32 = 0LL;
    id v33 = 0LL;
    id v34 = 0LL;
    v35 = 0LL;
    v31 = 0LL;
    goto LABEL_63;
  }

  v130 = @"ReCertRandomness";
  v131 = v36;
  v31 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v131,  &v130,  1LL);
  v70 = -[MobileRecertifyEngine dark](self, "dark");
  id v119 = v54;
  id v32 =  -[MobileRecertifyEngine createRecertInfoWithDataArk:alcoholBlob:options:error:]( self,  "createRecertInfoWithDataArk:alcoholBlob:options:error:",  v70,  v129,  v31,  &v119);
  id v71 = v119;

  if (!v32)
  {
    id v11 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  524LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v71,  @"Failed to create recert info.");

    id v33 = 0LL;
LABEL_87:
    id v34 = 0LL;
    v35 = 0LL;
    goto LABEL_63;
  }

  id v117 = v71;
  id v118 = 0LL;
  char ActivationRequest = createActivationRequest(v32, (NSMutableURLRequest **)&v118, 1, (NSError **)&v117);
  id v33 = (NSData *)v118;
  id v73 = v117;

  if ((ActivationRequest & 1) == 0)
  {
    id v11 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  531LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v73,  @"Failed to create recert request.");

    goto LABEL_87;
  }

  -[NSData setURL:](v33, "setURL:", v105);
  -[NSData setTimeoutInterval:](v33, "setTimeoutInterval:", v27);
  if (is_internal_build())
  {
    int v74 = formatURLRequest(v33);
    id v75 = copy_log_directory_path();
    id v76 = [v75 stringByAppendingPathComponent:@"recert_request.txt"];
    -[NSMutableString writeToFile:atomically:encoding:error:]( v74,  "writeToFile:atomically:encoding:error:",  v76,  0LL,  4LL,  0LL);
  }

  id v115 = v73;
  id v116 = v93;
  id v34 = talkToServerWithError(v33, 0LL, 0, v106, &v116, &v126, &v115);
  id v109 = v116;

  id v94 = v115;
  if (is_internal_build())
  {
    v77 = formatURLResponse(v34, (uint64_t)v126, v109);
    id v78 = copy_log_directory_path();
    id v79 = [v78 stringByAppendingPathComponent:@"recert_response.txt"];
    -[NSMutableString writeToFile:atomically:encoding:error:]( v77,  "writeToFile:atomically:encoding:error:",  v79,  0LL,  4LL,  0LL);
  }

  uint64_t v80 = (uint64_t)v126;
  if (v126 != (NSDictionary *)200)
  {
    if (v126)
    {
      v86 =  +[NSHTTPURLResponse localizedStringForStatusCode:]( &OBJC_CLASS___NSHTTPURLResponse,  "localizedStringForStatusCode:",  v126);
      v87 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  554LL,  @"com.apple.MobileActivation.ServerErrorDomain",  v80,  v94,  @"Server error: %ld (%@)",  v80,  v86);

      uint64_t v88 = (uint64_t)v126;
      v89 =  +[NSHTTPURLResponse localizedStringForStatusCode:]( &OBJC_CLASS___NSHTTPURLResponse,  "localizedStringForStatusCode:",  v126);
      id v11 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  554LL,  @"com.apple.MobileActivation.ErrorDomain",  -6LL,  v87,  @"Server error: %ld (%@)",  v88,  v89);

      v90 = v94;
LABEL_94:

      v35 = 0LL;
      goto LABEL_95;
    }

    v81 = @"Network communication error.";
    uint64_t v82 = 549LL;
LABEL_93:
    id v11 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  v82,  @"com.apple.MobileActivation.ErrorDomain",  -6LL,  v94,  v81);
    v90 = v94;
    goto LABEL_94;
  }

  if (!v34)
  {
    v81 = @"Failed to get response from server.";
    uint64_t v82 = 559LL;
    goto LABEL_93;
  }

  id v114 = v94;
  v83 = getRecertInfoFromData(v34, &v114);
  id v11 = (NSError *)v114;

  if (v83)
  {
    v84 = -[MobileRecertifyEngine queue](self, "queue");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3254779904LL;
    block[2] = __41__MobileRecertifyEngine_recertifyDevice___block_invoke;
    block[3] = &__block_descriptor_64_e8_32s40s48s56bs_e5_v8__0l;
    block[4] = self;
    v35 = v83;
    id v111 = v35;
    v31 = v31;
    id v112 = v31;
    id v113 = v4;
    id v85 = v4;
    dispatch_async((dispatch_queue_t)v84, block);

    id v4 = 0LL;
LABEL_95:
    id v12 = v92;
    goto LABEL_64;
  }

  v95 =  createMobileActivationError( (uint64_t)"-[MobileRecertifyEngine recertifyDevice:]",  568LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v11,  @"Failed to retrieve recert info from data.");

  v35 = 0LL;
  v29 = v91;
  id v12 = v92;
  id v11 = v95;
LABEL_37:
  if (v129) {
    IW1PcFszqNK(v129);
  }
  if (v128) {
    Be81a395Bf0(v128);
  }
  if (v4) {
    (*((void (**)(id, NSError *))v4 + 2))(v4, v11);
  }
}

void __41__MobileRecertifyEngine_recertifyDevice___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dark];
  v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(a1 + 48);
  id v7 = 0LL;
  handle_recert(v2, v3, v4, (NSError **)&v7);
  id v5 = v7;

  uint64_t v6 = *(void *)(a1 + 56);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
}

- (DataArk)dark
{
  return self->_dark;
}

- (void)setDark:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end