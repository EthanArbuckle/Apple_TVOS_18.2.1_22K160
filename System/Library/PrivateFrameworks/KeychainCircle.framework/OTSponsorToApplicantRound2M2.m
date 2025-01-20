@interface OTSponsorToApplicantRound2M2
- (BOOL)hasVoucher;
- (BOOL)hasVoucherSignature;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)voucher;
- (NSData)voucherSignature;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setVoucher:(id)a3;
- (void)setVoucherSignature:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTSponsorToApplicantRound2M2

- (BOOL)hasVoucher
{
  return self->_voucher != 0LL;
}

- (BOOL)hasVoucherSignature
{
  return self->_voucherSignature != 0LL;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTSponsorToApplicantRound2M2;
  v4 = -[OTSponsorToApplicantRound2M2 description](&v8, sel_description);
  v5 = -[OTSponsorToApplicantRound2M2 dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  voucher = self->_voucher;
  if (voucher) {
    [v3 setObject:voucher forKey:@"voucher"];
  }
  voucherSignature = self->_voucherSignature;
  if (voucherSignature) {
    [v4 setObject:voucherSignature forKey:@"voucherSignature"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return OTSponsorToApplicantRound2M2ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_voucher)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }

  if (self->_voucherSignature)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_voucher)
  {
    objc_msgSend(v4, "setVoucher:");
    id v4 = v5;
  }

  if (self->_voucherSignature)
  {
    objc_msgSend(v5, "setVoucherSignature:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSData copyWithZone:](self->_voucher, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = -[NSData copyWithZone:](self->_voucherSignature, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((voucher = self->_voucher, !((unint64_t)voucher | v4[1]))
     || -[NSData isEqual:](voucher, "isEqual:")))
  {
    voucherSignature = self->_voucherSignature;
    else {
      char v7 = 1;
    }
  }

  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = -[NSData hash](self->_voucher, "hash");
  return -[NSData hash](self->_voucherSignature, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[OTSponsorToApplicantRound2M2 setVoucher:](self, "setVoucher:");
    id v4 = v5;
  }

  if (v4[2])
  {
    -[OTSponsorToApplicantRound2M2 setVoucherSignature:](self, "setVoucherSignature:");
    id v4 = v5;
  }
}

- (NSData)voucher
{
  return self->_voucher;
}

- (void)setVoucher:(id)a3
{
}

- (NSData)voucherSignature
{
  return self->_voucherSignature;
}

- (void)setVoucherSignature:(id)a3
{
}

- (void).cxx_destruct
{
}

@end