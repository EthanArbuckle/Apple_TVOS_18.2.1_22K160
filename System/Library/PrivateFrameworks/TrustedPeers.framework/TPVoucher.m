@interface TPVoucher
+ (id)voucherInfoWithData:(id)a3 sig:(id)a4;
+ (id)voucherWithReason:(unint64_t)a3 beneficiaryID:(id)a4 sponsorID:(id)a5 signingKeyPair:(id)a6 error:(id *)a7;
- (BOOL)checkSignatureWithKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToVoucher:(id)a3;
- (NSData)data;
- (NSData)sig;
- (NSString)beneficiaryID;
- (NSString)sponsorID;
- (TPVoucher)initWithObj:(id)a3 data:(id)a4 sig:(id)a5;
- (id)createRecoveryECPublicKey:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)reason;
- (void)setBeneficiaryID:(id)a3;
- (void)setData:(id)a3;
- (void)setReason:(unint64_t)a3;
- (void)setSig:(id)a3;
- (void)setSponsorID:(id)a3;
@end

@implementation TPVoucher

- (TPVoucher)initWithObj:(id)a3 data:(id)a4 sig:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[TPStringTable defaultTable](&OBJC_CLASS___TPStringTable, "defaultTable");
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TPVoucher;
  v12 = -[TPVoucher init](&v22, sel_init);
  if (v12)
  {
    uint64_t v13 = [v8 reason] - 1;
    else {
      unint64_t v14 = 0LL;
    }
    v12->_reason = v14;
    [v8 beneficiary];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v11 stringWithString:v15];
    beneficiaryID = v12->_beneficiaryID;
    v12->_beneficiaryID = (NSString *)v16;

    [v8 sponsor];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v11 stringWithString:v18];
    sponsorID = v12->_sponsorID;
    v12->_sponsorID = (NSString *)v19;

    objc_storeStrong((id *)&v12->_data, a4);
    objc_storeStrong((id *)&v12->_sig, a5);
  }

  return v12;
}

- (BOOL)checkSignatureWithKey:(id)a3
{
  id v4 = a3;
  v5 = -[TPVoucher sig](self, "sig");
  v6 = -[TPVoucher data](self, "data");
  char v7 = checkTypesafeSignature(v4, v5, v6, @"TPPB.Voucher");

  return v7;
}

- (id)createRecoveryECPublicKey:(id)a3
{
  v3 = (objc_class *)MEMORY[0x189612718];
  id v4 = a3;
  id v5 = objc_alloc(v3);
  v6 = (void *)[objc_alloc(MEMORY[0x189612710]) initWithCurve:4];
  uint64_t v11 = 0LL;
  char v7 = (void *)[v5 initWithData:v4 specifier:v6 error:&v11];

  uint64_t v8 = v11;
  id v9 = 0LL;
  if (!v8) {
    id v9 = v7;
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  v3 = objc_alloc(&OBJC_CLASS___TPPBVoucher);
  -[TPVoucher data](self, "data");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = -[PBCodable initWithData:](v3, "initWithData:", v4);
  v6 = -[TPPBVoucher dictionaryRepresentation](v5, "dictionaryRepresentation");
  return v6;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1895C3FC8](self, a2);
  -[TPVoucher dictionaryRepresentation](self, "dictionaryRepresentation");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 description];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (BOOL)isEqualToVoucher:(id)a3
{
  id v4 = (TPVoucher *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }

  else
  {
    -[TPVoucher data](self, "data");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TPVoucher data](v4, "data");
    if ([v5 isEqualToData:v6])
    {
      -[TPVoucher sig](self, "sig");
      char v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPVoucher sig](v4, "sig");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      char v9 = [v7 isEqualToData:v8];
    }

    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TPVoucher *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }

  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[TPVoucher isEqualToVoucher:](self, "isEqualToVoucher:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];
  -[TPVoucher sig](self, "sig");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = [v5 hash] - v4 + 32 * v4;

  return v6;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (NSString)beneficiaryID
{
  return self->_beneficiaryID;
}

- (void)setBeneficiaryID:(id)a3
{
}

- (NSString)sponsorID
{
  return self->_sponsorID;
}

- (void)setSponsorID:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSData)sig
{
  return self->_sig;
}

- (void)setSig:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)voucherWithReason:(unint64_t)a3 beneficiaryID:(id)a4 sponsorID:(id)a5 signingKeyPair:(id)a6 error:(id *)a7
{
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  uint64_t v16 = objc_alloc_init(&OBJC_CLASS___TPPBVoucher);
  -[TPPBVoucher setBeneficiary:](v16, "setBeneficiary:", v15);

  -[TPPBVoucher setSponsor:](v16, "setSponsor:", v14);
  if (a3 - 1 >= 5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 handleFailureInMethod:a2, a1, @"TPVoucher.m", 109, @"Invalid parameter not satisfying: %@", @"NO" object file lineNumber description];
    uint64_t v19 = 0LL;
  }

  else
  {
    -[TPPBVoucher setReason:](v16, "setReason:", a3);
    v17 = -[PBCodable data](v16, "data");
    typesafeSignature(v13, v17, @"TPPB.Voucher", a7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18) {
      uint64_t v19 = -[TPVoucher initWithObj:data:sig:]( objc_alloc(&OBJC_CLASS___TPVoucher),  "initWithObj:data:sig:",  v16,  v17,  v18);
    }
    else {
      uint64_t v19 = 0LL;
    }
  }

  return v19;
}

+ (id)voucherInfoWithData:(id)a3 sig:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = -[PBCodable initWithData:](objc_alloc(&OBJC_CLASS___TPPBVoucher), "initWithData:", v5);
  if (v7) {
    uint64_t v8 = -[TPVoucher initWithObj:data:sig:](objc_alloc(&OBJC_CLASS___TPVoucher), "initWithObj:data:sig:", v7, v5, v6);
  }
  else {
    uint64_t v8 = 0LL;
  }

  return v8;
}

@end