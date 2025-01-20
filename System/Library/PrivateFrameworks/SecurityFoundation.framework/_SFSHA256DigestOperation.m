@interface _SFSHA256DigestOperation
+ (BOOL)supportsSecureCoding;
+ (id)digest:(id)a3;
+ (int64_t)blockSize;
+ (int64_t)outputSize;
- (NSData)hashValue;
- (_SFSHA256DigestOperation)init;
- (_SFSHA256DigestOperation)initWithCoder:(id)a3;
- (__CFString)_secKeyECDSAAlgorithm;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addData:(id)a3;
@end

@implementation _SFSHA256DigestOperation

+ (id)digest:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS____SFSHA256DigestOperation);
  -[_SFSHA256DigestOperation addData:](v4, "addData:", v3);
  v5 = -[_SFSHA256DigestOperation hashValue](v4, "hashValue");
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFSHA256DigestOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____SFSHA256DigestOperation;
  v2 = -[_SFSHA256DigestOperation init](&v6, sel_init);
  if (v2)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___SFSHA256DigestOperation_Ivars);
    sha256DigestOperationInternal = v2->_sha256DigestOperationInternal;
    v2->_sha256DigestOperationInternal = v3;

    CC_SHA256_Init((CC_SHA256_CTX *)((char *)v2->_sha256DigestOperationInternal + 8));
  }

  return v2;
}

- (_SFSHA256DigestOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____SFSHA256DigestOperation;
  return -[_SFSHA256DigestOperation init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init((Class)objc_opt_class());
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
  uint64_t v11 = *MEMORY[0x1895F89C0];
  sha256DigestOperationInternal = (char *)self->_sha256DigestOperationInternal;
  __int128 v3 = *(_OWORD *)(sha256DigestOperationInternal + 40);
  __int128 v4 = *(_OWORD *)(sha256DigestOperationInternal + 24);
  *(_OWORD *)v9.count = *(_OWORD *)(sha256DigestOperationInternal + 8);
  *(_OWORD *)&v9.hash[2] = v4;
  *(_OWORD *)&v9.hash[6] = v3;
  __int128 v5 = *(_OWORD *)(sha256DigestOperationInternal + 56);
  __int128 v6 = *(_OWORD *)(sha256DigestOperationInternal + 72);
  __int128 v7 = *(_OWORD *)(sha256DigestOperationInternal + 88);
  *(void *)&v9.wbuf[14] = *((void *)sha256DigestOperationInternal + 13);
  *(_OWORD *)&v9.wbuf[6] = v6;
  *(_OWORD *)&v9.wbuf[10] = v7;
  *(_OWORD *)&v9.wbuf[2] = v5;
  CC_SHA256_Final(md, &v9);
  [MEMORY[0x189603F48] dataWithBytes:md length:32];
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)addData:(id)a3
{
  __int128 v3 = (CC_SHA256_CTX *)((char *)self->_sha256DigestOperationInternal + 8);
  id v4 = a3;
  __int128 v5 = (const void *)[v4 bytes];
  CC_LONG v6 = [v4 length];

  CC_SHA256_Update(v3, v5, v6);
}

- (__CFString)_secKeyECDSAAlgorithm
{
  return (__CFString *)*MEMORY[0x18960BC40];
}

- (void).cxx_destruct
{
}

@end