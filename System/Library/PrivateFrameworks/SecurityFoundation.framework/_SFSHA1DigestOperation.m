@interface _SFSHA1DigestOperation
+ (BOOL)supportsSecureCoding;
+ (id)digest:(id)a3;
+ (int64_t)blockSize;
+ (int64_t)outputSize;
- (NSData)hashValue;
- (_SFSHA1DigestOperation)init;
- (_SFSHA1DigestOperation)initWithCoder:(id)a3;
- (__CFString)_secKeyECDSAAlgorithm;
- (void)addData:(id)a3;
@end

@implementation _SFSHA1DigestOperation

+ (id)digest:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS____SFSHA1DigestOperation);
  -[_SFSHA1DigestOperation addData:](v4, "addData:", v3);
  v5 = -[_SFSHA1DigestOperation hashValue](v4, "hashValue");
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFSHA1DigestOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____SFSHA1DigestOperation;
  v2 = -[_SFSHA1DigestOperation init](&v6, sel_init);
  if (v2)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___SFSHA1DigestOperation_Ivars);
    sha1DigestOperationInternal = v2->_sha1DigestOperationInternal;
    v2->_sha1DigestOperationInternal = v3;

    CC_SHA1_Init((CC_SHA1_CTX *)((char *)v2->_sha1DigestOperationInternal + 8));
  }

  return v2;
}

- (_SFSHA1DigestOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____SFSHA1DigestOperation;
  return -[_SFSHA1DigestOperation init](&v4, sel_init, a3);
}

+ (int64_t)outputSize
{
  return 0LL;
}

+ (int64_t)blockSize
{
  return 0LL;
}

- (NSData)hashValue
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  sha1DigestOperationInternal = (char *)self->_sha1DigestOperationInternal;
  __int128 v3 = *(_OWORD *)(sha1DigestOperationInternal + 24);
  *(_OWORD *)&v8.h0 = *(_OWORD *)(sha1DigestOperationInternal + 8);
  *(_OWORD *)&v8.h4 = v3;
  __int128 v4 = *(_OWORD *)(sha1DigestOperationInternal + 56);
  __int128 v5 = *(_OWORD *)(sha1DigestOperationInternal + 88);
  __int128 v6 = *(_OWORD *)(sha1DigestOperationInternal + 40);
  *(_OWORD *)&v8.data[9] = *(_OWORD *)(sha1DigestOperationInternal + 72);
  *(_OWORD *)&v8.data[13] = v5;
  *(_OWORD *)&v8.data[1] = v6;
  *(_OWORD *)&v8.data[5] = v4;
  CC_SHA1_Final(md, &v8);
  [MEMORY[0x189603F48] dataWithBytes:md length:20];
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)addData:(id)a3
{
  __int128 v3 = (CC_SHA1_CTX *)((char *)self->_sha1DigestOperationInternal + 8);
  id v4 = a3;
  __int128 v5 = (const void *)[v4 bytes];
  CC_LONG v6 = [v4 length];

  CC_SHA1_Update(v3, v5, v6);
}

- (__CFString)_secKeyECDSAAlgorithm
{
  return (__CFString *)*MEMORY[0x18960BC30];
}

- (void).cxx_destruct
{
}

@end