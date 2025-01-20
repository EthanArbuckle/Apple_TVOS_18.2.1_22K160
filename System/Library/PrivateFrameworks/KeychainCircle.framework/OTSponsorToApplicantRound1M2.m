@interface OTSponsorToApplicantRound1M2
- (BOOL)hasEpoch;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)epoch;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEpoch:(unint64_t)a3;
- (void)setHasEpoch:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTSponsorToApplicantRound1M2

- (void)setEpoch:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_epoch = a3;
}

- (void)setHasEpoch:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEpoch
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTSponsorToApplicantRound1M2;
  v4 = -[OTSponsorToApplicantRound1M2 description](&v8, sel_description);
  v5 = -[OTSponsorToApplicantRound1M2 dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_epoch];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v4 forKey:@"epoch"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return OTSponsorToApplicantRound1M2ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((void *)a3 + 1) = self->_epoch;
    *((_BYTE *)a3 + 16) |= 1u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((void *)result + 1) = self->_epoch;
    *((_BYTE *)result + 16) |= 1u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = (*((_BYTE *)v4 + 16) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) != 0 && self->_epoch == *((void *)v4 + 1))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return 2654435761u * self->_epoch;
  }
  else {
    return 0LL;
  }
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 16) & 1) != 0)
  {
    self->_epoch = *((void *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

- (unint64_t)epoch
{
  return self->_epoch;
}

@end