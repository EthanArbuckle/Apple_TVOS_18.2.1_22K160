@interface AWDCountersStabilityS
- (BOOL)hasIsMtbfQualified;
- (BOOL)hasNcpCrashReason;
- (BOOL)hasNcpResetType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMtbfQualified;
- (BOOL)readFrom:(id)a3;
- (NSString)ncpCrashReason;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)ncpResetTypeAsString:(int)a3;
- (int)StringAsNcpResetType:(id)a3;
- (int)ncpResetType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsMtbfQualified:(BOOL)a3;
- (void)setHasNcpResetType:(BOOL)a3;
- (void)setIsMtbfQualified:(BOOL)a3;
- (void)setNcpCrashReason:(id)a3;
- (void)setNcpResetType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersStabilityS

- (int)ncpResetType
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_ncpResetType;
  }
  else {
    return 1;
  }
}

- (void)setNcpResetType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ncpResetType = a3;
}

- (void)setHasNcpResetType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNcpResetType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)ncpResetTypeAsString:(int)a3
{
  if ((a3 - 1) >= 4) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return off_1002B3CC8[a3 - 1];
  }
}

- (int)StringAsNcpResetType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"E_NCP_RESET_CAUSE_ASSERT"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"E_NCP_RESET_CAUSE_HARD_FAULT"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"E_NCP_RESET_CAUSE_STACK_OVERFLOW"])
  {
    int v4 = 3;
  }

  else if ([v3 isEqualToString:@"E_NCP_RESET_CAUSE_OTHER"])
  {
    int v4 = 4;
  }

  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasNcpCrashReason
{
  return self->_ncpCrashReason != 0LL;
}

- (void)setIsMtbfQualified:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isMtbfQualified = a3;
}

- (void)setHasIsMtbfQualified:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsMtbfQualified
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AWDCountersStabilityS;
  id v3 = -[AWDCountersStabilityS description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDCountersStabilityS dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    unsigned int v4 = self->_ncpResetType - 1;
    if (v4 >= 4) {
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_ncpResetType));
    }
    else {
      v5 = off_1002B3CC8[v4];
    }
    [v3 setObject:v5 forKey:@"ncp_reset_type"];
  }

  ncpCrashReason = self->_ncpCrashReason;
  if (ncpCrashReason) {
    [v3 setObject:ncpCrashReason forKey:@"ncp_crash_reason"];
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isMtbfQualified));
    [v3 setObject:v7 forKey:@"is_mtbf_qualified"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return result;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_ncpResetType, 1LL);
    id v4 = v6;
  }

  ncpCrashReason = self->_ncpCrashReason;
  if (ncpCrashReason)
  {
    PBDataWriterWriteStringField(v6, ncpCrashReason, 2LL);
    id v4 = v6;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField(v6, self->_isMtbfQualified, 3LL);
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_ncpResetType;
    *((_BYTE *)v4 + 24) |= 1u;
  }

  if (self->_ncpCrashReason)
  {
    v5 = v4;
    objc_msgSend(v4, "setNcpCrashReason:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v4 + 20) = self->_isMtbfQualified;
    *((_BYTE *)v4 + 24) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[4] = self->_ncpResetType;
    *((_BYTE *)v5 + 24) |= 1u;
  }

  id v7 = -[NSString copyWithZone:](self->_ncpCrashReason, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v6 + 20) = self->_isMtbfQualified;
    *((_BYTE *)v6 + 24) |= 2u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_ncpResetType != *((_DWORD *)v4 + 4)) {
      goto LABEL_13;
    }
  }

  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_13;
  }

  ncpCrashReason = self->_ncpCrashReason;
  if (ncpCrashReason || *((void *)v4 + 1))
  {
    char has = (char)self->_has;
  }

  BOOL v8 = (*((_BYTE *)v4 + 24) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) != 0)
    {
      if (self->_isMtbfQualified)
      {
        if (!*((_BYTE *)v4 + 20)) {
          goto LABEL_13;
        }
      }

      else if (*((_BYTE *)v4 + 20))
      {
        goto LABEL_13;
      }

      BOOL v8 = 1;
      goto LABEL_14;
    }

- (unint64_t)hash
{
  unint64_t v2 = self;
  if ((*(_BYTE *)(self + 24) & 1) != 0)
  {
    unint64_t v4 = *(int *)(self + 16);
    if (!is_mul_ok(v4, 0x9E3779B1uLL))
    {
      __break(0x550Cu);
      return self;
    }

    uint64_t v3 = 2654435761u * v4;
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  unint64_t v5 = (unint64_t)[*(id *)(self + 8) hash];
  if ((*(_BYTE *)(v2 + 24) & 2) != 0) {
    uint64_t v6 = 2654435761LL * *(unsigned __int8 *)(v2 + 20);
  }
  else {
    uint64_t v6 = 0LL;
  }
  return v5 ^ v3 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    self->_ncpResetType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 1))
  {
    id v5 = v4;
    -[AWDCountersStabilityS setNcpCrashReason:](self, "setNcpCrashReason:");
    id v4 = v5;
  }

  if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
    self->_isMtbfQualified = *((_BYTE *)v4 + 20);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (NSString)ncpCrashReason
{
  return self->_ncpCrashReason;
}

- (void)setNcpCrashReason:(id)a3
{
}

- (BOOL)isMtbfQualified
{
  return self->_isMtbfQualified;
}

- (void).cxx_destruct
{
}

@end