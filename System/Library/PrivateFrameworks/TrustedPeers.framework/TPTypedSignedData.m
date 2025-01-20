@interface TPTypedSignedData
- (BOOL)checkSignatureWithKey:(id)a3;
- (BOOL)lastSigValidationResult;
- (NSData)data;
- (NSData)sig;
- (NSString)sigTypeName;
- (OS_dispatch_queue)sigValidationQueue;
- (TPPublicKey)lastSigValidationPubkey;
- (TPTypedSignedData)initWithData:(id)a3 key:(id)a4 signatureTypeName:(id)a5 error:(id *)a6;
- (TPTypedSignedData)initWithData:(id)a3 sig:(id)a4 pubkey:(id)a5 sigTypeName:(id)a6;
- (TPTypedSignedData)initWithData:(id)a3 sig:(id)a4 signatureTypeName:(id)a5;
- (void)setLastSigValidationPubkey:(id)a3;
- (void)setLastSigValidationResult:(BOOL)a3;
@end

@implementation TPTypedSignedData

- (TPTypedSignedData)initWithData:(id)a3 sig:(id)a4 pubkey:(id)a5 sigTypeName:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___TPTypedSignedData;
  v15 = -[TPTypedSignedData init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_data, a3);
    objc_storeStrong((id *)&v16->_sig, a4);
    objc_storeStrong((id *)&v16->_sigTypeName, a6);
    objc_storeStrong((id *)&v16->_lastSigValidationPubkey, a5);
    v16->_lastSigValidationResult = v13 != 0LL;
    v17 = (void *)MEMORY[0x1895C3FC8]();
    id v18 = [NSString stringWithFormat:@"com.apple.security.TPTypedSignedData_%@", v14];
    v19 = (const char *)[v18 UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v21 = dispatch_queue_create(v19, v20);
    sigValidationQueue = v16->_sigValidationQueue;
    v16->_sigValidationQueue = (OS_dispatch_queue *)v21;

    objc_autoreleasePoolPop(v17);
  }

  return v16;
}

- (TPTypedSignedData)initWithData:(id)a3 key:(id)a4 signatureTypeName:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  typesafeSignature(v11, v10, v12, a6);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    [v11 publicKey];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    self =  -[TPTypedSignedData initWithData:sig:pubkey:sigTypeName:]( self,  "initWithData:sig:pubkey:sigTypeName:",  v10,  v13,  v14,  v12);

    v15 = self;
  }

  else
  {
    v15 = 0LL;
  }

  return v15;
}

- (TPTypedSignedData)initWithData:(id)a3 sig:(id)a4 signatureTypeName:(id)a5
{
  return -[TPTypedSignedData initWithData:sig:pubkey:sigTypeName:]( self,  "initWithData:sig:pubkey:sigTypeName:",  a3,  a4,  0LL,  a5);
}

- (BOOL)checkSignatureWithKey:(id)a3
{
  id v4 = a3;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 0;
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  -[TPTypedSignedData sigValidationQueue](self, "sigValidationQueue");
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = MEMORY[0x1895F87A8];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __43__TPTypedSignedData_checkSignatureWithKey___block_invoke;
  block[3] = &unk_18A22BEC8;
  block[4] = self;
  id v7 = v4;
  id v18 = v7;
  v19 = &v25;
  v20 = &v21;
  dispatch_sync(v5, block);

  if (*((_BYTE *)v26 + 24))
  {
    char v8 = *((_BYTE *)v22 + 24) != 0;
  }

  else
  {
    v9 = -[TPTypedSignedData sig](self, "sig");
    -[TPTypedSignedData data](self, "data");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPTypedSignedData sigTypeName](self, "sigTypeName");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    char v8 = checkTypesafeSignature(v7, v9, v10, v11);

    -[TPTypedSignedData sigValidationQueue](self, "sigValidationQueue");
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    v14[1] = 3221225472LL;
    v14[2] = __43__TPTypedSignedData_checkSignatureWithKey___block_invoke_2;
    v14[3] = &unk_18A22BEF0;
    v14[4] = self;
    id v15 = v7;
    char v16 = v8;
    dispatch_sync(v12, v14);
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v8;
}

- (NSData)data
{
  return self->_data;
}

- (NSData)sig
{
  return self->_sig;
}

- (NSString)sigTypeName
{
  return self->_sigTypeName;
}

- (TPPublicKey)lastSigValidationPubkey
{
  return self->_lastSigValidationPubkey;
}

- (void)setLastSigValidationPubkey:(id)a3
{
}

- (BOOL)lastSigValidationResult
{
  return self->_lastSigValidationResult;
}

- (void)setLastSigValidationResult:(BOOL)a3
{
  self->_lastSigValidationResult = a3;
}

- (OS_dispatch_queue)sigValidationQueue
{
  return self->_sigValidationQueue;
}

- (void).cxx_destruct
{
}

void __43__TPTypedSignedData_checkSignatureWithKey___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) lastSigValidationResult];
  }

uint64_t __43__TPTypedSignedData_checkSignatureWithKey___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLastSigValidationResult:*(unsigned __int8 *)(a1 + 48)];
}

@end