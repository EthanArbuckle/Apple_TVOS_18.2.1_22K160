@interface TPPBVoucher
- (BOOL)hasBeneficiary;
- (BOOL)hasReason;
- (BOOL)hasSponsor;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)beneficiary;
- (NSString)sponsor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)reasonAsString:(int)a3;
- (int)StringAsReason:(id)a3;
- (int)reason;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBeneficiary:(id)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setReason:(int)a3;
- (void)setSponsor:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBVoucher

- (int)reason
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_reason;
  }
  else {
    return 0;
  }
}

- (void)setReason:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)reasonAsString:(int)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"RESTORE"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"SAME_DEVICE"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"SOS_UPGRADE"])
  {
    int v4 = 3;
  }

  else if ([v3 isEqualToString:@"SECURE_CHANNEL"])
  {
    int v4 = 4;
  }

  else if ([v3 isEqualToString:@"RECOVERY_KEY"])
  {
    int v4 = 5;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasBeneficiary
{
  return self->_beneficiary != 0LL;
}

- (BOOL)hasSponsor
{
  return self->_sponsor != 0LL;
}

- (id)description
{
  id v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TPPBVoucher;
  -[TPPBVoucher description](&v8, sel_description);
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TPPBVoucher dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t reason = self->_reason;
    if (reason >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_reason);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v5 = off_18A22C0A8[reason];
    }

    [v3 setObject:v5 forKey:@"reason"];
  }

  beneficiary = self->_beneficiary;
  if (beneficiary) {
    [v3 setObject:beneficiary forKey:@"beneficiary"];
  }
  sponsor = self->_sponsor;
  if (sponsor) {
    [v3 setObject:sponsor forKey:@"sponsor"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBVoucherReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }

  if (self->_beneficiary)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if (self->_sponsor)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_reason;
    *((_BYTE *)v4 + 32) |= 1u;
  }

  id v5 = v4;
  if (self->_beneficiary)
  {
    objc_msgSend(v4, "setBeneficiary:");
    id v4 = v5;
  }

  if (self->_sponsor)
  {
    objc_msgSend(v5, "setSponsor:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_reason;
    *(_BYTE *)(v5 + 32) |= 1u;
  }

  uint64_t v7 = -[NSString copyWithZone:](self->_beneficiary, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  uint64_t v9 = -[NSString copyWithZone:](self->_sponsor, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_reason != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }

  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }

  beneficiary = self->_beneficiary;
  if ((unint64_t)beneficiary | *((void *)v4 + 1)
    && !-[NSString isEqual:](beneficiary, "isEqual:"))
  {
    goto LABEL_11;
  }

  sponsor = self->_sponsor;
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v3 = 2654435761LL * self->_reason;
  }
  else {
    uint64_t v3 = 0LL;
  }
  NSUInteger v4 = -[NSString hash](self->_beneficiary, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_sponsor, "hash");
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if ((v4[8] & 1) != 0)
  {
    self->_uint64_t reason = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }

  uint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[TPPBVoucher setBeneficiary:](self, "setBeneficiary:");
    NSUInteger v4 = v5;
  }

  if (*((void *)v4 + 3))
  {
    -[TPPBVoucher setSponsor:](self, "setSponsor:");
    NSUInteger v4 = v5;
  }
}

- (NSString)beneficiary
{
  return self->_beneficiary;
}

- (void)setBeneficiary:(id)a3
{
}

- (NSString)sponsor
{
  return self->_sponsor;
}

- (void)setSponsor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end