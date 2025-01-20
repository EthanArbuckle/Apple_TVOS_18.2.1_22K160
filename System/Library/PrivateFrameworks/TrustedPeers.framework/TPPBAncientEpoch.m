@interface TPPBAncientEpoch
- (BOOL)hasCandidateEpoch;
- (BOOL)hasMyEpoch;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)candidateEpoch;
- (unint64_t)hash;
- (unint64_t)myEpoch;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCandidateEpoch:(unint64_t)a3;
- (void)setHasCandidateEpoch:(BOOL)a3;
- (void)setHasMyEpoch:(BOOL)a3;
- (void)setMyEpoch:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBAncientEpoch

- (void)setMyEpoch:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_myEpoch = a3;
}

- (void)setHasMyEpoch:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMyEpoch
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCandidateEpoch:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_candidateEpoch = a3;
}

- (void)setHasCandidateEpoch:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCandidateEpoch
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  char v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TPPBAncientEpoch;
  v4 = -[TPPBAncientEpoch description](&v8, sel_description);
  v5 = -[TPPBAncientEpoch dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_myEpoch];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v5 forKey:@"my_epoch"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_candidateEpoch];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v6 forKey:@"candidate_epoch"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBAncientEpochReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_myEpoch;
    *((_BYTE *)v4 + 24) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v4[1] = self->_candidateEpoch;
    *((_BYTE *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_myEpoch;
    *((_BYTE *)result + 24) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((void *)result + 1) = self->_candidateEpoch;
    *((_BYTE *)result + 24) |= 1u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_myEpoch != *((void *)v4 + 2)) {
      goto LABEL_11;
    }
  }

  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }

  BOOL v5 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_candidateEpoch != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    unint64_t v2 = 2654435761u * self->_myEpoch;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = 0LL;
    return v3 ^ v2;
  }

  unint64_t v2 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_candidateEpoch;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 2) != 0)
  {
    self->_myEpoch = *((void *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 24);
  }

  if ((v5 & 1) != 0)
  {
    self->_candidateEpoch = *((void *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (unint64_t)myEpoch
{
  return self->_myEpoch;
}

- (unint64_t)candidateEpoch
{
  return self->_candidateEpoch;
}

@end