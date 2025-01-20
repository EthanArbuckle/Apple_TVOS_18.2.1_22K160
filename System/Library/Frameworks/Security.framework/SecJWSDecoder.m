@interface SecJWSDecoder
- (BOOL)_validateJWSProtectedHeader:(id)a3;
- (NSData)payload;
- (NSData)signature;
- (NSError)verificationError;
- (NSString)keyID;
- (SecJWSDecoder)initWithJWSCompactEncodedString:(id)a3 keyID:(id)a4 publicKey:(__SecKey *)a5;
- (id)_createASN1SignatureFromJWSSignature:(id)a3;
- (id)dataWithBase64URLEncodedString:(id)a3;
- (void)_validateJWSSignature:(id)a3 ofHeader:(id)a4 andPayload:(id)a5 withPublicKey:(__SecKey *)a6;
@end

@implementation SecJWSDecoder

- (SecJWSDecoder)initWithJWSCompactEncodedString:(id)a3 keyID:(id)a4 publicKey:(__SecKey *)a5
{
  id v8 = a3;
  id v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___SecJWSDecoder;
  v10 = -[SecJWSDecoder init](&v31, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_keyID, a4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v8 componentsSeparatedByString:@"."];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v12 count] != 3)
      {
        uint64_t v25 = [MEMORY[0x189607870] errorWithDomain:@"com.apple.security.errors.jws" code:1 userInfo:0];
        verificationError = v11->_verificationError;
        v11->_verificationError = (NSError *)v25;
        goto LABEL_14;
      }

      [v12 objectAtIndexedSubscript:0];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v14 = -[SecJWSDecoder _validateJWSProtectedHeader:](v11, "_validateJWSProtectedHeader:", v13);

      if (v14)
      {
        [v12 objectAtIndexedSubscript:1];
        verificationError = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = -[SecJWSDecoder dataWithBase64URLEncodedString:](v11, "dataWithBase64URLEncodedString:", verificationError);
        payload = v11->_payload;
        v11->_payload = (NSData *)v16;

        [v12 objectAtIndexedSubscript:2];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = -[SecJWSDecoder dataWithBase64URLEncodedString:](v11, "dataWithBase64URLEncodedString:", v18);
        signature = v11->_signature;
        v11->_signature = (NSData *)v19;

        if (v11->_payload && v11->_signature)
        {
          if (a5)
          {
            CFRetain(a5);
            v21 = v11->_signature;
            [v12 objectAtIndexedSubscript:0];
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v12 objectAtIndexedSubscript:1];
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[SecJWSDecoder _validateJWSSignature:ofHeader:andPayload:withPublicKey:]( v11,  "_validateJWSSignature:ofHeader:andPayload:withPublicKey:",  v21,  v22,  v23,  a5);

            CFRelease(a5);
LABEL_14:

            goto LABEL_15;
          }

          v26 = (void *)MEMORY[0x189607870];
          uint64_t v27 = 10LL;
        }

        else
        {
          v26 = (void *)MEMORY[0x189607870];
          uint64_t v27 = 3LL;
        }

        uint64_t v28 = [v26 errorWithDomain:@"com.apple.security.errors.jws" code:v27 userInfo:0];
        v29 = v11->_verificationError;
        v11->_verificationError = (NSError *)v28;

        goto LABEL_14;
      }
    }

    else
    {
      uint64_t v24 = [MEMORY[0x189607870] errorWithDomain:@"com.apple.security.errors.jws" code:0 userInfo:0];
      v12 = v11->_verificationError;
      v11->_verificationError = (NSError *)v24;
    }

- (BOOL)_validateJWSProtectedHeader:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    id v34 = 0LL;
    [MEMORY[0x1896078D8] JSONObjectWithData:v4 options:0 error:&v34];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = v34;
    v7 = v6;
    if (v6)
    {
      id v8 = (NSError *)v6;
LABEL_12:
      BOOL v11 = 0;
      verificationError = self->_verificationError;
      self->_verificationError = v8;
LABEL_13:

      goto LABEL_14;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x189607870] errorWithDomain:@"com.apple.security.errors.jws" code:5 userInfo:0];
      id v8 = (NSError *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }

    verificationError = v5;
    if (-[NSError count](verificationError, "count"))
    {
      v13 = -[NSError objectForKeyedSubscript:](verificationError, "objectForKeyedSubscript:", @"alg");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v14 = -[NSError objectForKeyedSubscript:](verificationError, "objectForKeyedSubscript:", @"kid");
        if (!v14)
        {

LABEL_18:
          v20 = -[NSError objectForKeyedSubscript:](verificationError, "objectForKeyedSubscript:", @"alg");
          if ([v20 isEqualToString:@"ES256"])
          {
            v21 = -[NSError objectForKeyedSubscript:](verificationError, "objectForKeyedSubscript:", @"kid");
            if (v21
              && (-[SecJWSDecoder keyID](self, "keyID"),
                  v22 = (void *)objc_claimAutoreleasedReturnValue(),
                  char v23 = [v22 isEqualToString:v21],
                  v22,
                  (v23 & 1) == 0))
            {
              [MEMORY[0x189607870] errorWithDomain:@"com.apple.security.errors.jws" code:8 userInfo:0];
              v33 = (NSError *)objc_claimAutoreleasedReturnValue();
              BOOL v11 = 0;
              uint64_t v25 = self->_verificationError;
              self->_verificationError = v33;
            }

            else
            {
              -[NSError objectForKeyedSubscript:](verificationError, "objectForKeyedSubscript:", @"typ");
              uint64_t v24 = (NSError *)objc_claimAutoreleasedReturnValue();
              uint64_t v25 = v24;
              if (v24 && -[NSError caseInsensitiveCompare:](v24, "caseInsensitiveCompare:", @"JOSE"))
              {
                [MEMORY[0x189607870] errorWithDomain:@"com.apple.security.errors.jws" code:9 userInfo:0];
                v26 = (NSError *)objc_claimAutoreleasedReturnValue();
                uint64_t v27 = self->_verificationError;
                self->_verificationError = v26;
              }

              -[NSError objectForKeyedSubscript:](verificationError, "objectForKeyedSubscript:", @"cty");
              uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = v28;
              if (v28 && [v28 caseInsensitiveCompare:@"JSON"])
              {
                [MEMORY[0x189607870] errorWithDomain:@"com.apple.security.errors.jws" code:9 userInfo:0];
                v30 = (NSError *)objc_claimAutoreleasedReturnValue();
                objc_super v31 = self->_verificationError;
                self->_verificationError = v30;
              }

              BOOL v11 = 1;
            }
          }

          else
          {
            [MEMORY[0x189607870] errorWithDomain:@"com.apple.security.errors.jws" code:7 userInfo:0];
            v32 = (NSError *)objc_claimAutoreleasedReturnValue();
            BOOL v11 = 0;
            v21 = self->_verificationError;
            self->_verificationError = v32;
          }

          goto LABEL_32;
        }

        v15 = (void *)v14;
        -[NSError objectForKeyedSubscript:](verificationError, "objectForKeyedSubscript:", @"kid");
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0) {
          goto LABEL_18;
        }
      }

      else
      {
      }
    }

    [MEMORY[0x189607870] errorWithDomain:@"com.apple.security.errors.jws" code:6 userInfo:0];
    uint64_t v19 = (NSError *)objc_claimAutoreleasedReturnValue();
    BOOL v11 = 0;
    v20 = self->_verificationError;
    self->_verificationError = v19;
LABEL_32:

    goto LABEL_13;
  }

  [MEMORY[0x189607870] errorWithDomain:@"com.apple.security.errors.jws" code:4 userInfo:0];
  id v9 = (NSError *)objc_claimAutoreleasedReturnValue();
  v10 = self->_verificationError;
  self->_verificationError = v9;

  BOOL v11 = 0;
LABEL_14:

  return v11;
}

- (void)_validateJWSSignature:(id)a3 ofHeader:(id)a4 andPayload:(id)a5 withPublicKey:(__SecKey *)a6
{
  v10 = (void *)NSString;
  id v11 = a3;
  [v10 stringWithFormat:@"%@.%@", a4, a5];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 dataUsingEncoding:4];
  v13 = (const __CFData *)objc_claimAutoreleasedReturnValue();

  -[SecJWSDecoder _createASN1SignatureFromJWSSignature:](self, "_createASN1SignatureFromJWSSignature:", v11);
  uint64_t v14 = (const __CFData *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    uint64_t v16 = (void *)MEMORY[0x189607870];
    uint64_t v17 = 11LL;
    goto LABEL_8;
  }

  CFErrorRef error = 0LL;
  if (SecKeyVerifySignature(a6, @"algid:sign:ECDSA:message-X962:SHA256", v13, v14, &error)) {
    BOOL v15 = error == 0LL;
  }
  else {
    BOOL v15 = 0;
  }
  if (!v15)
  {
    uint64_t v16 = (void *)MEMORY[0x189607870];
    uint64_t v17 = 12LL;
LABEL_8:
    [v16 errorWithDomain:@"com.apple.security.errors.jws" code:v17 userInfo:0];
    v18 = (NSError *)objc_claimAutoreleasedReturnValue();
    verificationError = self->_verificationError;
    self->_verificationError = v18;
  }
}

- (id)_createASN1SignatureFromJWSSignature:(id)a3
{
  return 0LL;
}

- (id)dataWithBase64URLEncodedString:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (([v4 length] & 3) != 0)
  {
    do
    {
      [v4 stringByAppendingString:@"="];
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v5;
    }

    while (([v5 length] & 3) != 0);
  }

  else
  {
    v5 = v4;
  }

  id v6 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBase64EncodedString:v5 options:0];

  return v6;
}

- (NSString)keyID
{
  return self->_keyID;
}

- (NSData)payload
{
  return self->_payload;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSError)verificationError
{
  return self->_verificationError;
}

- (void).cxx_destruct
{
}

@end