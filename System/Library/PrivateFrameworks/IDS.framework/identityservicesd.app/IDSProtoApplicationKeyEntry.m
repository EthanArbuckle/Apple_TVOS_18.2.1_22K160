@interface IDSProtoApplicationKeyEntry
- (BOOL)hasKeyIndex;
- (BOOL)hasPublicIdentity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)publicIdentity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keyIndexAsString:(int)a3;
- (int)StringAsKeyIndex:(id)a3;
- (int)keyIndex;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasKeyIndex:(BOOL)a3;
- (void)setKeyIndex:(int)a3;
- (void)setPublicIdentity:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSProtoApplicationKeyEntry

- (int)keyIndex
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_keyIndex;
  }
  else {
    return 0;
  }
}

- (void)setKeyIndex:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_keyIndex = a3;
}

- (void)setHasKeyIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKeyIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)keyIndexAsString:(int)a3
{
  if (!a3) {
    return @"None";
  }
  if (a3 == 1) {
    v3 = @"Gelato";
  }
  else {
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  return v3;
}

- (int)StringAsKeyIndex:(id)a3
{
  id v3 = a3;
  else {
    int v4 = [v3 isEqualToString:@"Gelato"];
  }

  return v4;
}

- (BOOL)hasPublicIdentity
{
  return self->_publicIdentity != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSProtoApplicationKeyEntry;
  id v3 = -[IDSProtoApplicationKeyEntry description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProtoApplicationKeyEntry dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    int keyIndex = self->_keyIndex;
    if (keyIndex)
    {
      if (keyIndex == 1) {
        v5 = @"Gelato";
      }
      else {
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_keyIndex));
      }
    }

    else
    {
      v5 = @"None";
    }

    [v3 setObject:v5 forKey:@"key_index"];
  }

  publicIdentity = self->_publicIdentity;
  if (publicIdentity) {
    [v3 setObject:publicIdentity forKey:@"public_identity"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return IDSProtoApplicationKeyEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_keyIndex, 1LL);
    id v4 = v6;
  }

  publicIdentity = self->_publicIdentity;
  if (publicIdentity)
  {
    PBDataWriterWriteDataField(v6, publicIdentity, 2LL);
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_keyIndex;
    *((_BYTE *)v4 + 24) |= 1u;
  }

  if (self->_publicIdentity)
  {
    v5 = v4;
    objc_msgSend(v4, "setPublicIdentity:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 2) = self->_keyIndex;
    *((_BYTE *)v5 + 24) |= 1u;
  }

  id v7 = -[NSData copyWithZone:](self->_publicIdentity, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_keyIndex != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }

  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_9:
    unsigned __int8 v7 = 0;
    goto LABEL_10;
  }

  publicIdentity = self->_publicIdentity;
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_10:

  return v7;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v2 = 2654435761LL * self->_keyIndex;
  }
  else {
    uint64_t v2 = 0LL;
  }
  return (unint64_t)-[NSData hash](self->_publicIdentity, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((v4[6] & 1) != 0)
  {
    self->_int keyIndex = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 2))
  {
    uint64_t v5 = v4;
    -[IDSProtoApplicationKeyEntry setPublicIdentity:](self, "setPublicIdentity:");
    id v4 = v5;
  }
}

- (NSData)publicIdentity
{
  return self->_publicIdentity;
}

- (void)setPublicIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end