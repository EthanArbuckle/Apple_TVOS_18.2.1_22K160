@interface CKKSSerializedKey
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)key;
- (NSString)keyclass;
- (NSString)uuid;
- (NSString)zoneName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKey:(id)a3;
- (void)setKeyclass:(id)a3;
- (void)setUuid:(id)a3;
- (void)setZoneName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKKSSerializedKey

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CKKSSerializedKey;
  id v3 = -[CKKSSerializedKey description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  zoneName = self->_zoneName;
  if (zoneName) {
    [v4 setObject:zoneName forKey:@"zoneName"];
  }
  keyclass = self->_keyclass;
  if (keyclass) {
    [v4 setObject:keyclass forKey:@"keyclass"];
  }
  key = self->_key;
  if (key) {
    [v4 setObject:key forKey:@"key"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v5 = 0;
      unsigned int v6 = 0;
      unint64_t v7 = 0LL;
      while (1)
      {
        unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        char v9 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
        v7 |= (unint64_t)(v9 & 0x7F) << v5;
        if ((v9 & 0x80) == 0) {
          goto LABEL_11;
        }
        v5 += 7;
        if (v6++ >= 9)
        {
          unint64_t v7 = 0LL;
          int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }

      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v7 = 0LL;
      }
LABEL_13:
      if (v11 || (v7 & 7) == 4) {
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      switch((v7 >> 3))
      {
        case 1u:
          uint64_t String = PBReaderReadString(a3);
          uint64_t v14 = objc_claimAutoreleasedReturnValue(String);
          uint64_t v15 = 24LL;
          goto LABEL_24;
        case 2u:
          uint64_t v16 = PBReaderReadString(a3);
          uint64_t v14 = objc_claimAutoreleasedReturnValue(v16);
          uint64_t v15 = 32LL;
          goto LABEL_24;
        case 3u:
          uint64_t v17 = PBReaderReadString(a3);
          uint64_t v14 = objc_claimAutoreleasedReturnValue(v17);
          uint64_t v15 = 16LL;
          goto LABEL_24;
        case 4u:
          uint64_t Data = PBReaderReadData(a3);
          uint64_t v14 = objc_claimAutoreleasedReturnValue(Data);
          uint64_t v15 = 8LL;
LABEL_24:
          v19 = *(void **)&self->PBCodable_opaque[v15];
          *(void *)&self->PBCodable_opaque[v15] = v14;

          goto LABEL_25;
        default:
          if ((PBReaderSkipValueWithTag(a3) & 1) == 0) {
            return 0;
          }
LABEL_25:
          if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
          break;
      }
    }
  }

  return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (void)writeTo:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  PBDataWriterWriteStringField(v5, uuid, 1LL);
  PBDataWriterWriteStringField(v5, self->_zoneName, 2LL);
  PBDataWriterWriteStringField(v5, self->_keyclass, 3LL);
  PBDataWriterWriteDataField(v5, self->_key, 4LL);
}

- (void)copyTo:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  [v5 setUuid:uuid];
  [v5 setZoneName:self->_zoneName];
  [v5 setKeyclass:self->_keyclass];
  [v5 setKey:self->_key];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  unint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = -[NSString copyWithZone:](self->_zoneName, "copyWithZone:", a3);
  char v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = -[NSString copyWithZone:](self->_keyclass, "copyWithZone:", a3);
  int v11 = (void *)v5[2];
  v5[2] = v10;

  id v12 = -[NSData copyWithZone:](self->_key, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class(self)]
    && ((uuid = self->_uuid, !((unint64_t)uuid | v4[3])) || -[NSString isEqual:](uuid, "isEqual:"))
    && ((zoneName = self->_zoneName, !((unint64_t)zoneName | v4[4]))
     || -[NSString isEqual:](zoneName, "isEqual:"))
    && ((keyclass = self->_keyclass, !((unint64_t)keyclass | v4[2]))
     || -[NSString isEqual:](keyclass, "isEqual:")))
  {
    key = self->_key;
    else {
      unsigned __int8 v9 = 1;
    }
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_uuid, "hash");
  unint64_t v4 = -[NSString hash](self->_zoneName, "hash") ^ v3;
  NSUInteger v5 = -[NSString hash](self->_keyclass, "hash");
  return v4 ^ v5 ^ (unint64_t)-[NSData hash](self->_key, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[3]) {
    -[CKKSSerializedKey setUuid:](self, "setUuid:");
  }
  if (v4[4]) {
    -[CKKSSerializedKey setZoneName:](self, "setZoneName:");
  }
  if (v4[2]) {
    -[CKKSSerializedKey setKeyclass:](self, "setKeyclass:");
  }
  if (v4[1]) {
    -[CKKSSerializedKey setKey:](self, "setKey:");
  }
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
}

- (NSString)keyclass
{
  return self->_keyclass;
}

- (void)setKeyclass:(id)a3
{
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end