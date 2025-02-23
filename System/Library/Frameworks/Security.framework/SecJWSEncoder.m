@interface SecJWSEncoder
- (BOOL)appendPaddedToData:(id)a3 ptr:(const char *)a4 len:(unint64_t)a5 expected:(unint64_t)a6;
- (SecJWSEncoder)init;
- (SecJWSEncoder)initWithPublicKey:(__SecKey *)a3 privateKey:(__SecKey *)a4;
- (__SecKey)privateKey;
- (__SecKey)publicKey;
- (id)base64URLEncodedStringRepresentationWithData:(id)a3;
- (id)base64URLEncodedStringRepresentationWithDictionary:(id)a3;
- (id)compactJSONStringRepresentationWithDictionary:(id)a3;
- (id)createKeyPair;
- (id)encodedJWSWithPayload:(id)a3 kid:(id)a4 nonce:(id)a5 url:(id)a6 error:(id *)a7;
- (id)jwkPublicKey;
- (id)signatureWithProtectedHeader:(id)a3 payload:(id)a4;
- (void)dealloc;
- (void)setPrivateKey:(__SecKey *)a3;
- (void)setPublicKey:(__SecKey *)a3;
@end

@implementation SecJWSEncoder

- (SecJWSEncoder)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SecJWSEncoder;
  return -[SecJWSEncoder init](&v3, sel_init);
}

- (SecJWSEncoder)initWithPublicKey:(__SecKey *)a3 privateKey:(__SecKey *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SecJWSEncoder;
  result = -[SecJWSEncoder init](&v7, sel_init);
  if (result)
  {
    result->_publicKey = a3;
    result->_privateKey = a4;
  }

  return result;
}

- (void)dealloc
{
  publicKey = self->_publicKey;
  if (publicKey)
  {
    self->_publicKey = 0LL;
    CFRelease(publicKey);
  }

  privateKey = self->_privateKey;
  if (privateKey)
  {
    self->_privateKey = 0LL;
    CFRelease(privateKey);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SecJWSEncoder;
  -[SecJWSEncoder dealloc](&v5, sel_dealloc);
}

- (id)createKeyPair
{
  v12[2] = *MEMORY[0x1895F89C0];
  uint64_t v10 = 0LL;
  v11[0] = @"type";
  v11[1] = @"bsiz";
  v12[0] = @"73";
  v12[1] = &unk_18969C150;
  [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:v11 count:2];
  objc_super v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  RandomKey = SecKeyCreateRandomKey(v3, (CFErrorRef *)&v10);
  self->_privateKey = RandomKey;
  if (RandomKey)
  {
    objc_super v5 = SecKeyCopyPublicKey(RandomKey);
    self->_publicKey = v5;
    if (self->_privateKey)
    {
      if ((unint64_t)v5 | v10)
      {
        if (!v10) {
          goto LABEL_12;
        }
LABEL_8:
        privateKey = self->_privateKey;
        if (privateKey)
        {
          self->_privateKey = 0LL;
          CFRelease(privateKey);
        }

        goto LABEL_10;
      }

- (id)jwkPublicKey
{
  v19[4] = *MEMORY[0x1895F89C0];
  CFErrorRef v17 = 0LL;
  CFDataRef v3 = SecKeyCopyExternalRepresentation(self->_publicKey, &v17);
  if (!v3) {
    return 0LL;
  }
  v4 = v3;
  objc_super v5 = (_BYTE *)-[__CFData bytes](v4, "bytes");
  BOOL v6 = (unint64_t)-[__CFData length](v4, "length") < 0x41 || v5 == 0LL;
  if (v6 || *v5 != 4)
  {
    v14 = 0LL;
  }

  else
  {
    objc_super v7 = v5 + 1;
    unint64_t v8 = -[__CFData length](v4, "length") - 1;
    uint64_t v9 = -[__CFData length](v4, "length") + ~(v8 >> 1);
    [MEMORY[0x189603F48] dataWithBytes:v5 + 1 length:v8 >> 1];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603F48] dataWithBytes:&v7[v8 >> 1] length:v9];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SecJWSEncoder base64URLEncodedStringRepresentationWithData:]( self,  "base64URLEncodedStringRepresentationWithData:",  v10);
    v13 = -[SecJWSEncoder base64URLEncodedStringRepresentationWithData:]( self,  "base64URLEncodedStringRepresentationWithData:",  v11);
    v18[0] = @"kty";
    v18[1] = @"crv";
    v19[0] = @"EC";
    v19[1] = @"P-256";
    v18[2] = @"x";
    v18[3] = @"y";
    v19[2] = v12;
    v19[3] = v13;
    [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:v18 count:4];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  CFRelease(v4);
  id v15 = v14;

  return v15;
}

- (BOOL)appendPaddedToData:(id)a3 ptr:(const char *)a4 len:(unint64_t)a5 expected:(unint64_t)a6
{
  id v9 = a3;
  if (a5 <= a6)
  {
    if (a5 < a6)
    {
      char v15 = 0;
      do
      {
        [v9 appendBytes:&v15 length:1];
        --a6;
      }

      while (a5 != a6);
    }

    a6 = a5;
    goto LABEL_13;
  }

  if (!*a4)
  {
    do
    {
      int v10 = *(unsigned __int8 *)++a4;
      --a5;
      if (v10) {
        BOOL v11 = 0;
      }
      else {
        BOOL v11 = a5 > a6;
      }
    }

    while (v11);
  }

  if (a5 == a6)
  {
LABEL_13:
    [MEMORY[0x189603F48] dataWithBytes:a4 length:a6];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 appendData:v13];

    BOOL v12 = 1;
    goto LABEL_14;
  }

  BOOL v12 = 0;
LABEL_14:

  return v12;
}

- (id)signatureWithProtectedHeader:(id)a3 payload:(id)a4
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  [NSString stringWithFormat:@"%@.%@", a3, a4];
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 dataUsingEncoding:4];
  BOOL v6 = (const __CFData *)objc_claimAutoreleasedReturnValue();

  CFErrorRef error = 0LL;
  objc_super v7 = SecKeyCreateSignature(self->_privateKey, @"algid:sign:ECDSA:message-X962:SHA256", v6, &error);
  if (error)
  {
    secLogObjForScope("SecError");
    unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = error;
      _os_log_impl(&dword_1804F4000, v8, OS_LOG_TYPE_DEFAULT, "Failed to create signature: %@", buf, 0xCu);
    }

    CFErrorRef v9 = error;
    if (error)
    {
      CFErrorRef error = 0LL;
      CFRelease(v9);
    }
  }

  if (v7)
  {
    [MEMORY[0x189603FB8] dataWithCapacity:0];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)&__int128 v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v11;
    __int128 v26 = v11;
    v19[0] = CFDataGetBytePtr(v7);
    v19[1] = CFDataGetLength(v7);
    int v12 = DERParseSequence((uint64_t)v19, 2u, (uint64_t)&DER_ECDSASigItemSpecs, (unint64_t)buf, 0x20uLL);
    if (!v12 && *(void *)buf && *(void *)&buf[8] && (void)v26 && *((void *)&v26 + 1))
    {
      if (-[SecJWSEncoder appendPaddedToData:ptr:len:expected:](self, "appendPaddedToData:ptr:len:expected:", v10))
      {
        if (-[SecJWSEncoder appendPaddedToData:ptr:len:expected:]( self,  "appendPaddedToData:ptr:len:expected:",  v10,  v26,  32LL))
        {
          v13 = -[SecJWSEncoder base64URLEncodedStringRepresentationWithData:]( self,  "base64URLEncodedStringRepresentationWithData:",  v10);
LABEL_25:
          CFRelease(v7);

          goto LABEL_26;
        }

        secLogObjForScope("SecError");
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v21 = 134218240;
          uint64_t v22 = *((void *)&v26 + 1);
          __int16 v23 = 2048;
          uint64_t v24 = 32LL;
          char v15 = "Non-compliant signature: s is %lld bytes, expected %lld";
          goto LABEL_22;
        }
      }

      else
      {
        secLogObjForScope("SecError");
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v21 = 134218240;
          uint64_t v22 = *(void *)&buf[8];
          __int16 v23 = 2048;
          uint64_t v24 = 32LL;
          char v15 = "Non-compliant signature: r is %lld bytes, expected %lld";
LABEL_22:
          v16 = v14;
          uint32_t v17 = 22;
          goto LABEL_23;
        }
      }
    }

    else
    {
      secLogObjForScope("SecError");
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v21 = 67109120;
        LODWORD(v22) = v12;
        char v15 = "Failed to parse signature: %d";
        v16 = v14;
        uint32_t v17 = 8;
LABEL_23:
        _os_log_impl(&dword_1804F4000, v16, OS_LOG_TYPE_DEFAULT, v15, v21, v17);
      }
    }

    v13 = 0LL;
    goto LABEL_25;
  }

  v13 = 0LL;
LABEL_26:

  return v13;
}

- (id)encodedJWSWithPayload:(id)a3 kid:(id)a4 nonce:(id)a5 url:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (self->_privateKey && self->_publicKey)
  {
    v16 = 0LL;
  }

  else
  {
    v16 = -[SecJWSEncoder createKeyPair](self, "createKeyPair");
  }

  [MEMORY[0x189603FC8] dictionaryWithCapacity:0];
  uint32_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 setObject:@"ES256" forKeyedSubscript:@"alg"];
  if (v13)
  {
    [v17 setObject:v13 forKeyedSubscript:@"kid"];
  }

  else
  {
    v18 = -[SecJWSEncoder jwkPublicKey](self, "jwkPublicKey");
    [v17 setObject:v18 forKeyedSubscript:@"jwk"];
  }

  [v17 setObject:v14 forKeyedSubscript:@"nonce"];
  [v17 setObject:v15 forKeyedSubscript:@"url"];
  if (v16)
  {
    v19 = 0LL;
    if (a7) {
LABEL_10:
    }
      *a7 = v16;
  }

  else
  {
    id v24 = v12;
    if (v12)
    {
      -[SecJWSEncoder base64URLEncodedStringRepresentationWithDictionary:]( self,  "base64URLEncodedStringRepresentationWithDictionary:",  v12);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v21 = &stru_1896794C8;
    }

    -[SecJWSEncoder base64URLEncodedStringRepresentationWithDictionary:]( self,  "base64URLEncodedStringRepresentationWithDictionary:",  v17);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SecJWSEncoder signatureWithProtectedHeader:payload:](self, "signatureWithProtectedHeader:payload:", v22, v21);
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607940] stringWithCapacity:0];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 appendString:@"{"];
    [v19 appendFormat:@"protected:%@,", v22];
    [v19 appendFormat:@"payload:%@,", v21];
    [v19 appendFormat:@"\"signature\":\"%@\"", v23];
    [v19 appendString:@"}"];

    id v12 = v24;
    if (a7) {
      goto LABEL_10;
    }
  }

  return v19;
}

- (id)base64URLEncodedStringRepresentationWithData:(id)a3
{
  CFDataRef v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)[v5 length] >= 2)
  {
    while ([v5 hasSuffix:@"="])
    {
      objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - 1);
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_super v5 = v6;
    }
  }

  BOOL v6 = v5;
  return v6;
}

- (id)base64URLEncodedStringRepresentationWithDictionary:(id)a3
{
  uint64_t v9 = 0LL;
  [MEMORY[0x1896078D8] dataWithJSONObject:a3 options:10 error:&v9];
  CFDataRef v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 base64EncodedStringWithOptions:0];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v5 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v6 length])
  {
    while ([v6 hasSuffix:@"="])
    {
      objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);
      objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();

      BOOL v6 = v7;
      if (![v7 length]) {
        goto LABEL_6;
      }
    }
  }

  objc_super v7 = v6;
LABEL_6:

  return v7;
}

- (id)compactJSONStringRepresentationWithDictionary:(id)a3
{
  uint64_t v8 = 0LL;
  [MEMORY[0x1896078D8] dataWithJSONObject:a3 options:10 error:&v8];
  CFDataRef v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = objc_alloc(NSString);
  id v5 = v3;
  BOOL v6 = (void *)objc_msgSend( v4,  "initWithBytes:length:encoding:",  objc_msgSend(v5, "bytes"),  objc_msgSend(v5, "length"),  4);

  return v6;
}

- (__SecKey)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(__SecKey *)a3
{
  self->_publicKey = a3;
}

- (__SecKey)privateKey
{
  return self->_privateKey;
}

- (void)setPrivateKey:(__SecKey *)a3
{
  self->_privateKey = a3;
}

@end