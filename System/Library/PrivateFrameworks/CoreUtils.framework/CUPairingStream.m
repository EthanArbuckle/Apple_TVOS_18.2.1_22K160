@interface CUPairingStream
- (BOOL)decryptInputBytes:(const void *)a3 inputLength:(unint64_t)a4 inputAADBytes:(const void *)a5 inputAADLength:(unint64_t)a6 inputAuthTagPtr:(const void *)a7 inputAuthTagLength:(unint64_t)a8 outputBytes:(void *)a9 error:(id *)a10;
- (BOOL)encryptInputBytes:(const void *)a3 inputLength:(unint64_t)a4 inputAADBytes:(const void *)a5 inputAADLength:(unint64_t)a6 outputBytes:(void *)a7 outputAuthTagBytes:(void *)a8 outputAuthTagLength:(unint64_t)a9 error:(id *)a10;
- (BOOL)prepareWithName:(id)a3 isClient:(BOOL)a4 pskData:(id)a5 error:(id *)a6;
- (CUPairingStream)init;
- (NSString)name;
- (id)decryptData:(id)a3 aadBytes:(const void *)a4 aadLength:(unint64_t)a5 error:(id *)a6;
- (id)decryptData:(id)a3 aadData:(id)a4 error:(id *)a5;
- (id)encryptData:(id)a3 aadBytes:(const void *)a4 aadLength:(unint64_t)a5 error:(id *)a6;
- (id)encryptData:(id)a3 aadData:(id)a4 error:(id *)a5;
- (unint64_t)authTagLength;
- (void)_cleanup;
- (void)dealloc;
- (void)setAuthTagLength:(unint64_t)a3;
- (void)setName:(id)a3;
@end

@implementation CUPairingStream

- (CUPairingStream)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CUPairingStream;
  v2 = -[CUPairingStream init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_authTagLength = 16LL;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CUPairingStream;
  -[CUPairingStream dealloc](&v3, sel_dealloc);
}

- (void)_cleanup
{
  encryptAEAD = self->_encryptAEAD;
  if (encryptAEAD)
  {
    CFRelease(encryptAEAD);
    self->_encryptAEAD = 0LL;
  }

  decryptAEAD = self->_decryptAEAD;
  if (decryptAEAD)
  {
    CFRelease(decryptAEAD);
    self->_decryptAEAD = 0LL;
  }

- (BOOL)prepareWithName:(id)a3 isClient:(BOOL)a4 pskData:(id)a5 error:(id *)a6
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = [v11 bytes];
  uint64_t v13 = [v11 length];
  __s = 0LL;
  if (![v10 length])
  {
    if (!a6) {
      goto LABEL_26;
    }
    uint64_t v22 = 4294960552LL;
LABEL_25:
    NSErrorWithOSStatusF((const char *)v22);
    BOOL v20 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }

  objc_storeStrong((id *)&self->_name, a3);
  if ((unint64_t)[v11 length] <= 0x1F)
  {
    if (!a6) {
      goto LABEL_26;
    }
    uint64_t v22 = 4294960553LL;
    goto LABEL_25;
  }

  ASPrintF((void **)&__s);
  v14 = __s;
  if (!__s)
  {
    if (!a6) {
      goto LABEL_26;
    }
    goto LABEL_20;
  }

  size_t v15 = strlen(__s);
  CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, v12, v13, "", 0LL, (uint64_t)__s, v15, 0x20uLL, (uint64_t)v25);
  free(v14);
  v16 = (CryptoAEADPrivate *)CryptoAEADCreate( (uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))kCryptoAEADDescriptorChaCha20Poly1305[0],  1LL,  (uint64_t)v25,  32LL,  (int *)&v24);
  self->_encryptAEAD = v16;
  if (!v16)
  {
    if (a6)
    {
      if (v24) {
        uint64_t v22 = v24;
      }
      else {
        uint64_t v22 = 4294960596LL;
      }
      goto LABEL_25;
    }

    goto LABEL_26;
  }

  ASPrintF((void **)&__s);
  v17 = __s;
  if (!__s)
  {
    if (!a6) {
      goto LABEL_26;
    }
LABEL_20:
    uint64_t v22 = 4294960568LL;
    goto LABEL_25;
  }

  size_t v18 = strlen(__s);
  CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, v12, v13, "", 0LL, (uint64_t)__s, v18, 0x20uLL, (uint64_t)v25);
  free(v17);
  v19 = (CryptoAEADPrivate *)CryptoAEADCreate( (uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))kCryptoAEADDescriptorChaCha20Poly1305[0],  2LL,  (uint64_t)v25,  32LL,  (int *)&v24);
  self->_decryptAEAD = v19;
  if (!v19)
  {
    if (a6)
    {
      if (v24) {
        uint64_t v22 = v24;
      }
      else {
        uint64_t v22 = 4294960596LL;
      }
      goto LABEL_25;
    }

- (id)encryptData:(id)a3 aadData:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v8 bytes];
  uint64_t v11 = [v8 length];

  -[CUPairingStream encryptData:aadBytes:aadLength:error:]( self,  "encryptData:aadBytes:aadLength:error:",  v9,  v10,  v11,  a5);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)encryptData:(id)a3 aadBytes:(const void *)a4 aadLength:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v11 = [v10 length];
  size_t v12 = self->_authTagLength + v11;
  uint64_t v13 = (char *)malloc(v12);
  if (v13)
  {
    v14 = v13;
    uint64_t v15 = [v10 bytes];
    unint64_t authTagLength = self->_authTagLength;
    id v23 = 0LL;
    BOOL v17 = -[CUPairingStream encryptInputBytes:inputLength:inputAADBytes:inputAADLength:outputBytes:outputAuthTagBytes:outputAuthTagLength:error:]( self,  "encryptInputBytes:inputLength:inputAADBytes:inputAADLength:outputBytes:outputAuthTagBytes:outputAuthTagLength:error:",  v15,  v11,  a4,  a5,  v14,  &v14[v11],  authTagLength,  &v23);
    id v18 = v23;
    if (v17)
    {
      uint64_t v19 = [objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:v14 length:v12];
      if (v19)
      {
        BOOL v20 = (void *)v19;

        id v18 = 0LL;
        goto LABEL_5;
      }

      uint64_t v22 = NSErrorWithOSStatusF((const char *)0xFFFFE5B8LL);

      id v18 = (id)v22;
    }

    free(v14);
  }

  else
  {
    NSErrorWithOSStatusF((const char *)0xFFFFE5B8LL);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
  }

  BOOL v20 = 0LL;
  if (a6 && v18)
  {
    id v18 = v18;
    BOOL v20 = 0LL;
    *a6 = v18;
  }

- (id)decryptData:(id)a3 aadData:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v8 bytes];
  uint64_t v11 = [v8 length];

  -[CUPairingStream decryptData:aadBytes:aadLength:error:]( self,  "decryptData:aadBytes:aadLength:error:",  v9,  v10,  v11,  a5);
  size_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)decryptData:(id)a3 aadBytes:(const void *)a4 aadLength:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  unint64_t v11 = [v10 length];
  unint64_t authTagLength = self->_authTagLength;
  if (v11 < authTagLength)
  {
    uint64_t v22 = 4294960553LL;
LABEL_16:
    NSErrorWithOSStatusF((const char *)v22);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }

  uint64_t v13 = [v10 bytes];
  size_t v14 = v11 - authTagLength;
  if (!v14)
  {
    uint64_t v15 = 0LL;
    goto LABEL_5;
  }

  uint64_t v15 = malloc(v14);
  if (!v15)
  {
    uint64_t v22 = 4294960568LL;
    goto LABEL_16;
  }

- (BOOL)encryptInputBytes:(const void *)a3 inputLength:(unint64_t)a4 inputAADBytes:(const void *)a5 inputAADLength:(unint64_t)a6 outputBytes:(void *)a7 outputAuthTagBytes:(void *)a8 outputAuthTagLength:(unint64_t)a9 error:(id *)a10
{
  encryptAEAD = self->_encryptAEAD;
  if (encryptAEAD)
  {
    encryptNonce = self->_encryptNonce;
    uint64_t v13 = (*(uint64_t (**)(CryptoAEADPrivate *, unsigned __int8 *))(*((void *)encryptAEAD + 2) + 16LL))( encryptAEAD,  self->_encryptNonce);
    uint64_t v14 = 0LL;
    do
    {
      if (++encryptNonce[v14]) {
        BOOL v16 = 1;
      }
      else {
        BOOL v16 = v14 == 11;
      }
      ++v14;
    }

    while (!v16);
    if (!(_DWORD)v13)
    {
      BOOL v17 = 0;
      id v18 = 0LL;
      goto LABEL_10;
    }
  }

  else
  {
    uint64_t v13 = 4294960541LL;
  }

  NSErrorWithOSStatusF((const char *)v13);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v17 = v18 != 0LL;
  if (a10) {
    BOOL v21 = v18 == 0LL;
  }
  else {
    BOOL v21 = 1;
  }
  if (!v21)
  {
    id v18 = v18;
    *a10 = v18;
    BOOL v17 = 1;
  }

- (BOOL)decryptInputBytes:(const void *)a3 inputLength:(unint64_t)a4 inputAADBytes:(const void *)a5 inputAADLength:(unint64_t)a6 inputAuthTagPtr:(const void *)a7 inputAuthTagLength:(unint64_t)a8 outputBytes:(void *)a9 error:(id *)a10
{
  decryptAEAD = self->_decryptAEAD;
  if (decryptAEAD)
  {
    decryptNonce = self->_decryptNonce;
    uint64_t v13 = (*(uint64_t (**)(CryptoAEADPrivate *, unsigned __int8 *))(*((void *)decryptAEAD + 2) + 24LL))( decryptAEAD,  self->_decryptNonce);
    uint64_t v14 = 0LL;
    do
    {
      if (++decryptNonce[v14]) {
        BOOL v16 = 1;
      }
      else {
        BOOL v16 = v14 == 11;
      }
      ++v14;
    }

    while (!v16);
    if (!(_DWORD)v13)
    {
      BOOL v17 = 0;
      id v18 = 0LL;
      goto LABEL_10;
    }
  }

  else
  {
    uint64_t v13 = 4294960541LL;
  }

  NSErrorWithOSStatusF((const char *)v13);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v17 = v18 != 0LL;
  if (a10) {
    BOOL v21 = v18 == 0LL;
  }
  else {
    BOOL v21 = 1;
  }
  if (!v21)
  {
    id v18 = v18;
    *a10 = v18;
    BOOL v17 = 1;
  }

- (unint64_t)authTagLength
{
  return self->_authTagLength;
}

- (void)setAuthTagLength:(unint64_t)a3
{
  self->_unint64_t authTagLength = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end