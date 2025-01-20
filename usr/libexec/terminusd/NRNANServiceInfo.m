@interface NRNANServiceInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NRNANServiceInfo

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NRNANServiceInfo;
  id v3 = -[NRNANServiceInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRNANServiceInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  serviceName = self->_serviceName;
  if (serviceName) {
    [v3 setObject:serviceName forKey:@"serviceName"];
  }
  authTag = self->_authTag;
  if (authTag) {
    [v4 setObject:authTag forKey:@"authTag"];
  }
  advertisingNonce = self->_advertisingNonce;
  if (advertisingNonce) {
    [v4 setObject:advertisingNonce forKey:@"advertisingNonce"];
  }
  deviceTypeHash = self->_deviceTypeHash;
  if (deviceTypeHash) {
    [v4 setObject:deviceTypeHash forKey:@"deviceTypeHash"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  int v4 = OBJC_IVAR___PBDataReader__pos;
  unint64_t v5 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
  unint64_t v6 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length);
  if (v5 < v6)
  {
    while (1)
    {
      v12 = (char *)a3 + OBJC_IVAR___PBDataReader__error;
      if (*v12) {
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if (v5 >= v6) {
        break;
      }
      char v13 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v5);
      *(void *)((char *)a3 + v4) = v5 + 1;
      unint64_t v14 = v13 & 0x7F;
      if ((v13 & 0x80) == 0) {
        goto LABEL_40;
      }
      unint64_t v15 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v16 = v15 + 1;
      int v17 = *(char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v15);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v16;
      v14 |= (unint64_t)(v17 & 0x7F) << 7;
      if ((v17 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      unint64_t v18 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v19 = v18 + 1;
      int v20 = *(char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v18);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v19;
      v14 |= (unint64_t)(v20 & 0x7F) << 14;
      if ((v20 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      unint64_t v21 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v22 = v21 + 1;
      int v23 = *(char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v21);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v22;
      v14 |= (unint64_t)(v23 & 0x7F) << 21;
      if ((v23 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      unint64_t v24 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v25 = v24 + 1;
      int v26 = *(char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v24);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v25;
      v14 |= (unint64_t)(v26 & 0x7F) << 28;
      if ((v26 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      unint64_t v27 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v28 = v27 + 1;
      int v29 = *(char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v27);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v28;
      if ((v29 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      unint64_t v30 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v31 = v30 + 1;
      int v32 = *(char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v30);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v31;
      if ((v32 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      unint64_t v33 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v34 = v33 + 1;
      int v35 = *(char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v33);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v34;
      if ((v35 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      unint64_t v36 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v37 = v36 + 1;
      int v38 = *(char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v36);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v37;
      if ((v38 & 0x80000000) == 0) {
        goto LABEL_40;
      }
      unint64_t v39 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v39 == -1LL || v39 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
      {
LABEL_38:
        v12 = (char *)a3 + OBJC_IVAR___PBDataReader__error;
        goto LABEL_39;
      }

      unint64_t v40 = v39 + 1;
      int v41 = *(char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v39);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v40;
      if (v41 < 0)
      {
        unint64_t v14 = 0LL;
        int v42 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_42;
      }

- (void)writeTo:(id)a3
{
  id v4 = a3;
  serviceName = self->_serviceName;
  id v9 = v4;
  if (serviceName)
  {
    PBDataWriterWriteStringField(v4, serviceName, 1LL);
    id v4 = v9;
  }

  authTag = self->_authTag;
  if (authTag)
  {
    PBDataWriterWriteDataField(v9, authTag, 2LL);
    id v4 = v9;
  }

  advertisingNonce = self->_advertisingNonce;
  if (advertisingNonce)
  {
    PBDataWriterWriteDataField(v9, advertisingNonce, 3LL);
    id v4 = v9;
  }

  deviceTypeHash = self->_deviceTypeHash;
  if (deviceTypeHash)
  {
    PBDataWriterWriteDataField(v9, deviceTypeHash, 4LL);
    id v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_serviceName, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = -[NSData copyWithZone:](self->_authTag, "copyWithZone:", a3);
  id v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = -[NSData copyWithZone:](self->_advertisingNonce, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  id v12 = -[NSData copyWithZone:](self->_deviceTypeHash, "copyWithZone:", a3);
  char v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class(self)]
    && ((serviceName = self->_serviceName, !((unint64_t)serviceName | v4[4]))
     || -[NSString isEqual:](serviceName, "isEqual:"))
    && ((authTag = self->_authTag, !((unint64_t)authTag | v4[2]))
     || -[NSData isEqual:](authTag, "isEqual:"))
    && ((advertisingNonce = self->_advertisingNonce, !((unint64_t)advertisingNonce | v4[1]))
     || -[NSData isEqual:](advertisingNonce, "isEqual:")))
  {
    deviceTypeHash = self->_deviceTypeHash;
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
  NSUInteger v3 = -[NSString hash](self->_serviceName, "hash");
  unint64_t v4 = (unint64_t)-[NSData hash](self->_authTag, "hash") ^ v3;
  unint64_t v5 = (unint64_t)-[NSData hash](self->_advertisingNonce, "hash");
  return v4 ^ v5 ^ (unint64_t)-[NSData hash](self->_deviceTypeHash, "hash");
}

- (void).cxx_destruct
{
}

@end