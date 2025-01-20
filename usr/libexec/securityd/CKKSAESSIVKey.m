@interface CKKSAESSIVKey
+ (id)randomKey:(id *)a3;
- (BOOL)doSIV:(const ccmode_siv *)a3 nonce:(id)a4 text:(id)a5 buffer:(char *)a6 bufferLength:(unint64_t)a7 authenticatedData:(id)a8 error:(id *)a9;
- (CKKSAESSIVKey)init;
- (CKKSAESSIVKey)initWithBase64:(id)a3;
- (CKKSAESSIVKey)initWithBytes:(char *)a3 len:(unint64_t)a4;
- (id)decryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5;
- (id)encryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5;
- (id)keyMaterial;
- (id)unwrapAESKey:(id)a3 error:(id *)a4;
- (id)wrapAESKey:(id)a3 error:(id *)a4;
@end

@implementation CKKSAESSIVKey

- (CKKSAESSIVKey)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CKKSAESSIVKey;
  result = -[CKKSBaseAESSIVKey init](&v3, "init");
  if (result) {
    result->super.size = 64LL;
  }
  return result;
}

- (CKKSAESSIVKey)initWithBytes:(char *)a3 len:(unint64_t)a4
{
  if (a4 == 64)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___CKKSAESSIVKey;
    return -[CKKSBaseAESSIVKey initWithBytes:len:](&v10, "initWithBytes:len:", a3);
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"length (%lu) was not %d",  a4,  64LL));
    id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"WrongKeySizeException",  v5,  0LL));

    objc_exception_throw(v6);
    return -[CKKSAESSIVKey initWithBase64:](v7, v8, v9);
  }

- (CKKSAESSIVKey)initWithBase64:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CKKSAESSIVKey;
  v5 = -[CKKSBaseAESSIVKey initWithBase64:](&v14, "initWithBase64:", v4);
  id v6 = v5;
  if (v5 && v5->super.size != 64)
  {
    SEL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"length (%lu) was not %d",  v5->super.size,  64LL));
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"WrongKeySizeException",  v8,  0LL));

    objc_exception_throw(v9);
    return (CKKSAESSIVKey *)-[CKKSAESSIVKey wrapAESKey:error:](v10, v11, v12, v13);
  }

  else
  {

    return v6;
  }

- (id)wrapAESKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -50LL,  @"No key given"));
    id v12 = v14;
    if (!a4)
    {
      SEL v11 = 0LL;
      goto LABEL_12;
    }

    id v13 = v14;
    id v12 = v13;
    SEL v11 = 0LL;
    goto LABEL_10;
  }

  memset(__s, 0, sizeof(__s));
  uint64_t v7 = ccaes_siv_encrypt_mode();
  if (ccsiv_ciphertext_size(v7, 64LL) != 80)
  {
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    v18 = @"wrapped key size does not match key size";
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v16));

LABEL_15:
    SEL v11 = 0LL;
    goto LABEL_5;
  }

  uint64_t v8 = ccaes_siv_encrypt_mode();
  id v9 = +[NSData _newZeroingDataWithBytes:length:]( &OBJC_CLASS___NSData,  "_newZeroingDataWithBytes:length:",  v6 + 1,  v6[11]);
  unsigned int v10 = -[CKKSAESSIVKey doSIV:nonce:text:buffer:bufferLength:authenticatedData:error:]( self,  "doSIV:nonce:text:buffer:bufferLength:authenticatedData:error:",  v8,  0LL,  v9,  __s,  80LL,  0LL,  a4);

  if (!v10)
  {
    id v12 = 0LL;
    goto LABEL_15;
  }

  SEL v11 = -[CKKSWrappedAESSIVKey initWithBytes:len:]( objc_alloc(&OBJC_CLASS___CKKSWrappedAESSIVKey),  "initWithBytes:len:",  __s,  80LL);
  id v12 = 0LL;
LABEL_5:
  memset_s(__s, 0x50uLL, 0, 0x40uLL);
  if (a4 && v12)
  {
    id v13 = v12;
LABEL_10:
    *a4 = v13;
  }

- (id)unwrapAESKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  memset(__s, 0, sizeof(__s));
  uint64_t v7 = ccaes_siv_decrypt_mode();
  if (ccsiv_plaintext_size(v7, 80LL) == 64)
  {
    uint64_t v8 = ccaes_siv_decrypt_mode();
    id v9 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytesNoCopy:length:freeWhenDone:",  v6 + 1,  v6[11],  0LL);
    unsigned int v10 = -[CKKSAESSIVKey doSIV:nonce:text:buffer:bufferLength:authenticatedData:error:]( self,  "doSIV:nonce:text:buffer:bufferLength:authenticatedData:error:",  v8,  0LL,  v9,  __s,  64LL,  0LL,  a4);

    if (v10) {
      SEL v11 = -[CKKSAESSIVKey initWithBytes:len:]( objc_alloc(&OBJC_CLASS___CKKSAESSIVKey),  "initWithBytes:len:",  __s,  64LL);
    }
    else {
      SEL v11 = 0LL;
    }
    id v12 = 0LL;
  }

  else
  {
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    v16 = @"unwrapped key size does not match key size";
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v14));

    SEL v11 = 0LL;
  }

  memset_s(__s, 0x40uLL, 0, 0x40uLL);
  if (a4 && v12) {
    *a4 = v12;
  }

  return v11;
}

- (id)encryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = ccaes_siv_encrypt_mode();
  SEL v11 = -[NSMutableData initWithLength:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithLength:", 16LL);
  CCRNGStatus Bytes = CCRandomGenerateBytes( -[NSMutableData mutableBytes](v11, "mutableBytes"),  -[NSMutableData length](v11, "length"));
  if (Bytes)
  {
    if (!a5)
    {
      NSErrorUserInfoKey v15 = 0LL;
      goto LABEL_8;
    }

    uint64_t v13 = Bytes;
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    v18 = @"IV generation failed";
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CommonCrypto",  v13,  v14));

    NSErrorUserInfoKey v15 = 0LL;
    goto LABEL_6;
  }

  NSErrorUserInfoKey v15 = -[NSMutableData initWithLength:]( [NSMutableData alloc], "initWithLength:", ccsiv_ciphertext_size(v10, [v8 length]));
  if (!-[CKKSAESSIVKey doSIV:nonce:text:buffer:bufferLength:authenticatedData:error:]( self,  "doSIV:nonce:text:buffer:bufferLength:authenticatedData:error:",  v10,  v11,  v8,  -[NSMutableData mutableBytes](v15, "mutableBytes"),  -[NSMutableData length](v15, "length"),  v9,  a5))
  {
LABEL_6:
    a5 = 0LL;
    goto LABEL_8;
  }

  a5 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  [a5 appendData:v11];
  [a5 appendData:v15];
LABEL_8:

  return a5;
}

- (id)decryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = ccaes_siv_decrypt_mode();
  if ((unint64_t)[v8 length] > 0x10)
  {
    NSErrorUserInfoKey v15 = (char *)[v8 length] - 16;
    v16 = objc_alloc(&OBJC_CLASS___NSData);
    id v17 = v8;
    uint64_t v13 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( v16,  "initWithBytesNoCopy:length:freeWhenDone:",  [v17 bytes],  16,  0);
    objc_super v14 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( [NSData alloc], "initWithBytesNoCopy:length:freeWhenDone:", (char *)[v17 bytes] + 16, v15, 0);
    id v12 = -[NSMutableData initWithLength:]( objc_alloc(&OBJC_CLASS___NSMutableData), "initWithLength:", ccsiv_plaintext_size(v10, v15));
    if (-[CKKSAESSIVKey doSIV:nonce:text:buffer:bufferLength:authenticatedData:error:]( self,  "doSIV:nonce:text:buffer:bufferLength:authenticatedData:error:",  v10,  v13,  v14,  -[NSMutableData mutableBytes](v12, "mutableBytes"),  -[NSMutableData length](v12, "length"),  v9,  a5))
    {
      a5 = v12;
      id v12 = (NSMutableData *)a5;
    }

    else
    {
      a5 = 0LL;
    }
  }

  else
  {
    if (a5)
    {
      NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
      v20 = @"ciphertext too short";
      SEL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  4LL,  v11));

      a5 = 0LL;
    }

    id v12 = 0LL;
    uint64_t v13 = 0LL;
    objc_super v14 = 0LL;
  }

  return a5;
}

- (BOOL)doSIV:(const ccmode_siv *)a3 nonce:(id)a4 text:(id)a5 buffer:(char *)a6 bufferLength:(unint64_t)a7 authenticatedData:(id)a8 error:(id *)a9
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  unint64_t v17 = a3->var0 + 15;
  unint64_t v18 = v17 & 0xFFFFFFFFFFFFFFF0LL;
  NSErrorUserInfoKey v19 = (char *)&v47 - (v17 & 0xFFFFFFFFFFFFFFF0LL);
  if (v17 >= 0x10)
  {
    v20 = (uint64_t *)((char *)&v47 - (v17 & 0xFFFFFFFFFFFFFFF0LL));
    do
    {
      void *v20 = 0xAAAAAAAAAAAAAAAALL;
      v20[1] = 0xAAAAAAAAAAAAAAAALL;
      v20 += 2;
      v18 -= 16LL;
    }

    while (v18);
  }

  int v21 = ccsiv_init(a3, v19, self->super.size, self->super.key);
  v51 = &v47;
  v52 = a9;
  if (v21)
  {
    uint64_t v43 = v21;
    NSErrorUserInfoKey v64 = NSLocalizedDescriptionKey;
    v65 = @"could not ccsiv_init";
    v44 = &v65;
    v45 = &v64;
LABEL_25:
    v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v45,  1LL));
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"corecrypto",  v43,  v40));
    id v25 = 0LL;
    goto LABEL_18;
  }

  if (v14)
  {
    int v22 = ccsiv_set_nonce(a3, v19, [v14 length], objc_msgSend(v14, "bytes"));
    if (v22)
    {
      uint64_t v43 = v22;
      NSErrorUserInfoKey v62 = NSLocalizedDescriptionKey;
      v63 = @"could not ccsiv_set_nonce";
      v44 = &v63;
      v45 = &v62;
      goto LABEL_25;
    }
  }

  v48 = a6;
  id v49 = v15;
  id v50 = v14;
  v23 = (void *)objc_claimAutoreleasedReturnValue([v16 allKeys]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 sortedArrayUsingSelector:"compare:"]);

  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v25 = v24;
  id v26 = [v25 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v54;
    while (2)
    {
      for (i = 0LL; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v54 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:*(void *)(*((void *)&v53 + 1) + 8 * (void)i)]);
        id v31 = [v30 length];
        id v32 = v30;
        int v33 = ccsiv_aad(a3, v19, v31, [v32 bytes]);
        if (v33)
        {
          uint64_t v38 = v33;
          NSErrorUserInfoKey v59 = NSLocalizedDescriptionKey;
          v60 = @"could not ccsiv_aad";
          v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v60,  &v59,  1LL));
          v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"corecrypto",  v38,  v39));

          v40 = v25;
          id v15 = v49;
          id v14 = v50;
          goto LABEL_18;
        }
      }

      id v27 = [v25 countByEnumeratingWithState:&v53 objects:v61 count:16];
      if (v27) {
        continue;
      }
      break;
    }
  }

  id v15 = v49;
  id v34 = [v49 length];
  id v35 = [v15 bytes];
  int v36 = ccsiv_crypt(a3, v19, v34, v35, v48);
  if (!v36)
  {
    v37 = 0LL;
    id v14 = v50;
    goto LABEL_19;
  }

  uint64_t v46 = v36;
  NSErrorUserInfoKey v57 = NSLocalizedDescriptionKey;
  v58 = @"could not ccsiv_crypt";
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v58,  &v57,  1LL));
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"corecrypto",  v46,  v40));
  id v14 = v50;
LABEL_18:

LABEL_19:
  cc_clear(a3->var0, v19);
  v41 = v52;
  if (v52) {
    id *v41 = v37;
  }

  return v37 == 0LL;
}

- (id)keyMaterial
{
  return  +[NSData _newZeroingDataWithBytes:length:]( &OBJC_CLASS___NSData,  "_newZeroingDataWithBytes:length:",  self->super.key,  self->super.size);
}

+ (id)randomKey:(id *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___CKKSAESSIVKey);
  uint64_t Bytes = CCRandomGenerateBytes(v4->super.key, v4->super.size);
  if ((_DWORD)Bytes)
  {
    if (a3)
    {
      uint64_t v6 = (int)Bytes;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CCRandomGenerateBytes failed with %d",  Bytes));
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"corecrypto",  v6,  v7));

      a3 = 0LL;
    }
  }

  else
  {
    a3 = v4;
  }

  return a3;
}

@end