@interface BMPBSyncAtomValue
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation BMPBSyncAtomValue

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___BMPBSyncAtomValue;
  id v3 = -[BMPBSyncAtomValue description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMPBSyncAtomValue dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 5) {
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_type));
    }
    else {
      v5 = off_1000691A8[type];
    }
    [v3 setObject:v5 forKey:@"type"];
  }

  value = self->_value;
  if (value)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BMPBStoreEventAtomValue dictionaryRepresentation](value, "dictionaryRepresentation"));
    [v3 setObject:v7 forKey:@"value"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100017440((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_type, 1LL);
    id v4 = v6;
  }

  value = self->_value;
  if (value)
  {
    PBDataWriterWriteSubmessage(v6, value, 2LL);
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 2) = self->_type;
    *((_BYTE *)v5 + 24) |= 1u;
  }

  id v7 = -[BMPBStoreEventAtomValue copyWithZone:](self->_value, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_type != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }

  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_9:
    unsigned __int8 v7 = 0;
    goto LABEL_10;
  }

  value = self->_value;
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_10:

  return v7;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v2 = 2654435761LL * self->_type;
  }
  else {
    uint64_t v2 = 0LL;
  }
  return -[BMPBStoreEventAtomValue hash](self->_value, "hash") ^ v2;
}

- (void).cxx_destruct
{
}

@end