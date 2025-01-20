@interface TASKEdgeDnsInput
- (BOOL)hasRecordType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)hostname;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)recordTypeAsString:(int)a3;
- (int)StringAsRecordType:(id)a3;
- (int)recordType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRecordType:(BOOL)a3;
- (void)setHostname:(id)a3;
- (void)setRecordType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TASKEdgeDnsInput

- (int)recordType
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_recordType;
  }
  else {
    return 0;
  }
}

- (void)setRecordType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_recordType = a3;
}

- (void)setHasRecordType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRecordType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)recordTypeAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return off_10011F8E0[a3];
  }
}

- (int)StringAsRecordType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"All"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"IPv4"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"IPv6"])
  {
    int v4 = 2;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TASKEdgeDnsInput;
  id v3 = -[TASKEdgeDnsInput description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TASKEdgeDnsInput dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v4 = v3;
  hostname = self->_hostname;
  if (hostname) {
    [v3 setObject:hostname forKey:@"hostname"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t recordType = self->_recordType;
    if (recordType >= 3) {
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_recordType));
    }
    else {
      v7 = off_10011F8E0[recordType];
    }
    [v4 setObject:v7 forKey:@"recordType"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006FF64((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteStringField(v4, self->_hostname, 1LL);
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteInt32Field(v4, self->_recordType, 2LL);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setHostname:self->_hostname];
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_recordType;
    *((_BYTE *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_hostname, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_recordType;
    *((_BYTE *)v5 + 20) |= 1u;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  hostname = self->_hostname;
  if ((unint64_t)hostname | *((void *)v4 + 1))
  {
  }

  BOOL v7 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0 && self->_recordType == *((_DWORD *)v4 + 4))
    {
      BOOL v7 = 1;
      goto LABEL_9;
    }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_hostname, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v4 = 2654435761LL * self->_recordType;
  }
  else {
    uint64_t v4 = 0LL;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[TASKEdgeDnsInput setHostname:](self, "setHostname:");
    uint64_t v4 = v5;
  }

  if ((v4[5] & 1) != 0)
  {
    self->_uint64_t recordType = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setHostname:(id)a3
{
}

- (void).cxx_destruct
{
}

@end