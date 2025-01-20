@interface AWDCtcsReadWriteStabilityS
- (BOOL)hasCtcsReadWriteFailType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)ctcsReadWriteFailTypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCtcsReadWriteFailType:(id)a3;
- (int)ctcsReadWriteFailType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCtcsReadWriteFailType:(int)a3;
- (void)setHasCtcsReadWriteFailType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCtcsReadWriteStabilityS

- (int)ctcsReadWriteFailType
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_ctcsReadWriteFailType;
  }
  else {
    return 1;
  }
}

- (void)setCtcsReadWriteFailType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ctcsReadWriteFailType = a3;
}

- (void)setHasCtcsReadWriteFailType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCtcsReadWriteFailType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)ctcsReadWriteFailTypeAsString:(int)a3
{
  if ((a3 - 1) >= 6) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return off_1002B3600[a3 - 1];
  }
}

- (int)StringAsCtcsReadWriteFailType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"E_CTCS_FAIL_RETRIEVE_ALL_CREDENTIALS"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"E_CTCS_FAIL_DELETE_CREDENTIALS"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"E_CTCS_FAIL_RETRIEVE_BORDERAGENT_CREDENTIALS"])
  {
    int v4 = 3;
  }

  else if ([v3 isEqualToString:@"E_CTCS_FAIL_RETRIEVE_EXTENDED_PANID_CREDENTIALS"])
  {
    int v4 = 4;
  }

  else if ([v3 isEqualToString:@"E_CTCS_FAIL_RETRIEVE_PREFERRED_NETWORK"])
  {
    int v4 = 5;
  }

  else if ([v3 isEqualToString:@"E_CTCS_FAIL_STORE_CREDENTIALS"])
  {
    int v4 = 6;
  }

  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AWDCtcsReadWriteStabilityS;
  id v3 = -[AWDCtcsReadWriteStabilityS description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDCtcsReadWriteStabilityS dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    unsigned int v4 = self->_ctcsReadWriteFailType - 1;
    if (v4 >= 6) {
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_ctcsReadWriteFailType));
    }
    else {
      v5 = off_1002B3600[v4];
    }
    [v3 setObject:v5 forKey:@"ctcs_read_write_fail_type"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001023C8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    id v5 = v4;
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_ctcsReadWriteFailType;
    *((_BYTE *)v4 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_ctcsReadWriteFailType;
    *((_BYTE *)result + 12) |= 1u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = (*((_BYTE *)v4 + 12) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 12) & 1) != 0 && self->_ctcsReadWriteFailType == *((_DWORD *)v4 + 2))
    {
      BOOL v6 = 1;
      goto LABEL_7;
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)(self + 12) & 1) == 0) {
    return 0LL;
  }
  unint64_t v2 = *(int *)(self + 8);
  if (is_mul_ok(v2, 0x9E3779B1uLL)) {
    return 2654435761u * v2;
  }
  __break(0x550Cu);
  return self;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((v4[3] & 1) != 0)
  {
    self->_ctcsReadWriteFailType = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
}

@end