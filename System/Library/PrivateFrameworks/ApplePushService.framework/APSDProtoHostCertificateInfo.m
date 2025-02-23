@interface APSDProtoHostCertificateInfo
+ (Class)certificatesType;
- (BOOL)hasNonce;
- (BOOL)hasSignature;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)nonce;
- (NSData)signature;
- (NSMutableArray)certificates;
- (id)certificatesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)certificatesCount;
- (unint64_t)hash;
- (void)addCertificates:(id)a3;
- (void)clearCertificates;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCertificates:(id)a3;
- (void)setNonce:(id)a3;
- (void)setSignature:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APSDProtoHostCertificateInfo

- (void)clearCertificates
{
}

- (void)addCertificates:(id)a3
{
  id v4 = a3;
  certificates = self->_certificates;
  id v8 = v4;
  if (!certificates)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_certificates;
    self->_certificates = v6;

    id v4 = v8;
    certificates = self->_certificates;
  }

  -[NSMutableArray addObject:](certificates, "addObject:", v4);
}

- (unint64_t)certificatesCount
{
  return (unint64_t)-[NSMutableArray count](self->_certificates, "count");
}

- (id)certificatesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_certificates, "objectAtIndex:", a3);
}

+ (Class)certificatesType
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSData, a2);
}

- (BOOL)hasNonce
{
  return self->_nonce != 0LL;
}

- (BOOL)hasSignature
{
  return self->_signature != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___APSDProtoHostCertificateInfo;
  id v3 = -[APSDProtoHostCertificateInfo description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSDProtoHostCertificateInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = v3;
  certificates = self->_certificates;
  if (certificates) {
    [v3 setObject:certificates forKey:@"certificates"];
  }
  nonce = self->_nonce;
  if (nonce) {
    [v4 setObject:nonce forKey:@"nonce"];
  }
  signature = self->_signature;
  if (signature) {
    [v4 setObject:signature forKey:@"signature"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APSDProtoHostCertificateInfoReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v5 = self->_certificates;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteDataField(v4, *(void *)(*((void *)&v12 + 1) + 8LL * (void)v9), 1LL);
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v7);
  }

  nonce = self->_nonce;
  if (nonce) {
    PBDataWriterWriteDataField(v4, nonce, 2LL);
  }
  signature = self->_signature;
  if (signature) {
    PBDataWriterWriteDataField(v4, signature, 3LL);
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (-[APSDProtoHostCertificateInfo certificatesCount](self, "certificatesCount"))
  {
    [v9 clearCertificates];
    unint64_t v4 = -[APSDProtoHostCertificateInfo certificatesCount](self, "certificatesCount");
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSDProtoHostCertificateInfo certificatesAtIndex:](self, "certificatesAtIndex:", i));
        [v9 addCertificates:v7];
      }
    }
  }

  if (self->_nonce) {
    objc_msgSend(v9, "setNonce:");
  }
  uint64_t v8 = v9;
  if (self->_signature)
  {
    objc_msgSend(v9, "setSignature:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = self->_certificates;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v10), "copyWithZone:", a3, (void)v17);
        [v5 addCertificates:v11];

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v8);
  }

  id v12 = -[NSData copyWithZone:](self->_nonce, "copyWithZone:", a3);
  __int128 v13 = (void *)v5[2];
  v5[2] = v12;

  id v14 = -[NSData copyWithZone:](self->_signature, "copyWithZone:", a3);
  __int128 v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((certificates = self->_certificates, !((unint64_t)certificates | v4[1]))
     || -[NSMutableArray isEqual:](certificates, "isEqual:"))
    && ((nonce = self->_nonce, !((unint64_t)nonce | v4[2])) || -[NSData isEqual:]( nonce,  "isEqual:")))
  {
    signature = self->_signature;
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
  unint64_t v3 = (unint64_t)-[NSMutableArray hash](self->_certificates, "hash");
  unint64_t v4 = (unint64_t)-[NSData hash](self->_nonce, "hash") ^ v3;
  return v4 ^ (unint64_t)-[NSData hash](self->_signature, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (id *)a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = v4[1];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[APSDProtoHostCertificateInfo addCertificates:]( self,  "addCertificates:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)i),  (void)v10);
      }

      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }

  if (v4[2]) {
    -[APSDProtoHostCertificateInfo setNonce:](self, "setNonce:");
  }
  if (v4[3]) {
    -[APSDProtoHostCertificateInfo setSignature:](self, "setSignature:");
  }
}

- (NSMutableArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (void).cxx_destruct
{
}

@end