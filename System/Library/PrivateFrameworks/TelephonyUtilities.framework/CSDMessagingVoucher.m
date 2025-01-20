@interface CSDMessagingVoucher
+ (CSDMessagingVoucher)voucherWithTUVoucher:(id)a3;
- (BOOL)hasEncryptedData;
- (BOOL)hasHandle;
- (BOOL)hasTokenPrefixedURI;
- (BOOL)hasUnsafeData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingHandle)handle;
- (NSData)encryptedData;
- (NSData)unsafeData;
- (NSString)tokenPrefixedURI;
- (TUVoucher)tuVoucher;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncryptedData:(id)a3;
- (void)setHandle:(id)a3;
- (void)setTokenPrefixedURI:(id)a3;
- (void)setUnsafeData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingVoucher

+ (CSDMessagingVoucher)voucherWithTUVoucher:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___CSDMessagingVoucher);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 handle]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSDMessagingHandle handleWithTUHandle:](&OBJC_CLASS___CSDMessagingHandle, "handleWithTUHandle:", v5));
  -[CSDMessagingVoucher setHandle:](v4, "setHandle:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 tokenPrefixedURI]);
  -[CSDMessagingVoucher setTokenPrefixedURI:](v4, "setTokenPrefixedURI:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 unsafeData]);
  -[CSDMessagingVoucher setUnsafeData:](v4, "setUnsafeData:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 encryptedData]);
  -[CSDMessagingVoucher setEncryptedData:](v4, "setEncryptedData:", v9);

  return v4;
}

- (TUVoucher)tuVoucher
{
  id v3 = objc_alloc(&OBJC_CLASS___TUVoucher);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingVoucher handle](self, "handle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 tuHandle]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingVoucher tokenPrefixedURI](self, "tokenPrefixedURI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingVoucher unsafeData](self, "unsafeData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingVoucher encryptedData](self, "encryptedData"));
  v9 = -[TUVoucher initWithHandle:tokenPrefixedURI:data:encryptedData:]( v3,  "initWithHandle:tokenPrefixedURI:data:encryptedData:",  v5,  v6,  v7,  v8);

  return v9;
}

- (BOOL)hasHandle
{
  return self->_handle != 0LL;
}

- (BOOL)hasTokenPrefixedURI
{
  return self->_tokenPrefixedURI != 0LL;
}

- (BOOL)hasUnsafeData
{
  return self->_unsafeData != 0LL;
}

- (BOOL)hasEncryptedData
{
  return self->_encryptedData != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingVoucher;
  id v3 = -[CSDMessagingVoucher description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingVoucher dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  handle = self->_handle;
  if (handle)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingHandle dictionaryRepresentation](handle, "dictionaryRepresentation"));
    [v3 setObject:v5 forKey:@"handle"];
  }

  tokenPrefixedURI = self->_tokenPrefixedURI;
  if (tokenPrefixedURI) {
    [v3 setObject:tokenPrefixedURI forKey:@"tokenPrefixedURI"];
  }
  unsafeData = self->_unsafeData;
  if (unsafeData) {
    [v3 setObject:unsafeData forKey:@"unsafeData"];
  }
  encryptedData = self->_encryptedData;
  if (encryptedData) {
    [v3 setObject:encryptedData forKey:@"encryptedData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10010BE5C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  handle = self->_handle;
  id v9 = v4;
  if (handle)
  {
    PBDataWriterWriteSubmessage(v4, handle, 1LL);
    id v4 = v9;
  }

  tokenPrefixedURI = self->_tokenPrefixedURI;
  if (tokenPrefixedURI)
  {
    PBDataWriterWriteStringField(v9, tokenPrefixedURI, 2LL);
    id v4 = v9;
  }

  unsafeData = self->_unsafeData;
  if (unsafeData)
  {
    PBDataWriterWriteDataField(v9, unsafeData, 3LL);
    id v4 = v9;
  }

  encryptedData = self->_encryptedData;
  if (encryptedData)
  {
    PBDataWriterWriteDataField(v9, encryptedData, 4LL);
    id v4 = v9;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_handle)
  {
    objc_msgSend(v4, "setHandle:");
    id v4 = v5;
  }

  if (self->_tokenPrefixedURI)
  {
    objc_msgSend(v5, "setTokenPrefixedURI:");
    id v4 = v5;
  }

  if (self->_unsafeData)
  {
    objc_msgSend(v5, "setUnsafeData:");
    id v4 = v5;
  }

  if (self->_encryptedData)
  {
    objc_msgSend(v5, "setEncryptedData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[CSDMessagingHandle copyWithZone:](self->_handle, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = -[NSString copyWithZone:](self->_tokenPrefixedURI, "copyWithZone:", a3);
  id v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = -[NSData copyWithZone:](self->_unsafeData, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = -[NSData copyWithZone:](self->_encryptedData, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((handle = self->_handle, !((unint64_t)handle | v4[2]))
     || -[CSDMessagingHandle isEqual:](handle, "isEqual:"))
    && ((tokenPrefixedURI = self->_tokenPrefixedURI, !((unint64_t)tokenPrefixedURI | v4[3]))
     || -[NSString isEqual:](tokenPrefixedURI, "isEqual:"))
    && ((unsafeData = self->_unsafeData, !((unint64_t)unsafeData | v4[4]))
     || -[NSData isEqual:](unsafeData, "isEqual:")))
  {
    encryptedData = self->_encryptedData;
    else {
      unsigned __int8 v10 = 1;
    }
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = -[CSDMessagingHandle hash](self->_handle, "hash");
  unint64_t v4 = -[NSString hash](self->_tokenPrefixedURI, "hash") ^ v3;
  unint64_t v5 = (unint64_t)-[NSData hash](self->_unsafeData, "hash");
  return v4 ^ v5 ^ (unint64_t)-[NSData hash](self->_encryptedData, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  handle = self->_handle;
  uint64_t v6 = v4[2];
  v7 = v4;
  if (handle)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[CSDMessagingHandle mergeFrom:](handle, "mergeFrom:");
  }

  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[CSDMessagingVoucher setHandle:](self, "setHandle:");
  }

  unint64_t v4 = v7;
LABEL_7:
  if (v4[3])
  {
    -[CSDMessagingVoucher setTokenPrefixedURI:](self, "setTokenPrefixedURI:");
    unint64_t v4 = v7;
  }

  if (v4[4])
  {
    -[CSDMessagingVoucher setUnsafeData:](self, "setUnsafeData:");
    unint64_t v4 = v7;
  }

  if (v4[1])
  {
    -[CSDMessagingVoucher setEncryptedData:](self, "setEncryptedData:");
    unint64_t v4 = v7;
  }
}

- (CSDMessagingHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)tokenPrefixedURI
{
  return self->_tokenPrefixedURI;
}

- (void)setTokenPrefixedURI:(id)a3
{
}

- (NSData)unsafeData
{
  return self->_unsafeData;
}

- (void)setUnsafeData:(id)a3
{
}

- (NSData)encryptedData
{
  return self->_encryptedData;
}

- (void)setEncryptedData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end