@interface StoredCertificate
- (BOOL)hasDsid;
- (BOOL)hasDuplicateEscrowCertificate;
- (BOOL)hasEscrowBaseURL;
- (BOOL)hasEscrowCertificate;
- (BOOL)hasICloudEnvironment;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)duplicateEscrowCertificate;
- (NSData)escrowCertificate;
- (NSString)dsid;
- (NSString)escrowBaseURL;
- (NSString)iCloudEnvironment;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDsid:(id)a3;
- (void)setDuplicateEscrowCertificate:(id)a3;
- (void)setEscrowBaseURL:(id)a3;
- (void)setEscrowCertificate:(id)a3;
- (void)setICloudEnvironment:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation StoredCertificate

- (BOOL)hasICloudEnvironment
{
  return self->_iCloudEnvironment != 0LL;
}

- (BOOL)hasEscrowBaseURL
{
  return self->_escrowBaseURL != 0LL;
}

- (BOOL)hasDsid
{
  return self->_dsid != 0LL;
}

- (BOOL)hasEscrowCertificate
{
  return self->_escrowCertificate != 0LL;
}

- (BOOL)hasDuplicateEscrowCertificate
{
  return self->_duplicateEscrowCertificate != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___StoredCertificate;
  id v3 = -[StoredCertificate description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StoredCertificate dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  iCloudEnvironment = self->_iCloudEnvironment;
  if (iCloudEnvironment) {
    [v3 setObject:iCloudEnvironment forKey:@"iCloudEnvironment"];
  }
  escrowBaseURL = self->_escrowBaseURL;
  if (escrowBaseURL) {
    [v4 setObject:escrowBaseURL forKey:@"escrowBaseURL"];
  }
  dsid = self->_dsid;
  if (dsid) {
    [v4 setObject:dsid forKey:@"dsid"];
  }
  escrowCertificate = self->_escrowCertificate;
  if (escrowCertificate) {
    [v4 setObject:escrowCertificate forKey:@"escrowCertificate"];
  }
  duplicateEscrowCertificate = self->_duplicateEscrowCertificate;
  if (duplicateEscrowCertificate) {
    [v4 setObject:duplicateEscrowCertificate forKey:@"duplicateEscrowCertificate"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000C26C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  iCloudEnvironment = self->_iCloudEnvironment;
  id v10 = v4;
  if (iCloudEnvironment)
  {
    PBDataWriterWriteStringField(v4, iCloudEnvironment, 1LL);
    id v4 = v10;
  }

  escrowBaseURL = self->_escrowBaseURL;
  if (escrowBaseURL)
  {
    PBDataWriterWriteStringField(v10, escrowBaseURL, 2LL);
    id v4 = v10;
  }

  dsid = self->_dsid;
  if (dsid)
  {
    PBDataWriterWriteStringField(v10, dsid, 3LL);
    id v4 = v10;
  }

  escrowCertificate = self->_escrowCertificate;
  if (escrowCertificate)
  {
    PBDataWriterWriteDataField(v10, escrowCertificate, 4LL);
    id v4 = v10;
  }

  duplicateEscrowCertificate = self->_duplicateEscrowCertificate;
  if (duplicateEscrowCertificate)
  {
    PBDataWriterWriteDataField(v10, duplicateEscrowCertificate, 5LL);
    id v4 = v10;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_iCloudEnvironment)
  {
    objc_msgSend(v4, "setICloudEnvironment:");
    id v4 = v5;
  }

  if (self->_escrowBaseURL)
  {
    objc_msgSend(v5, "setEscrowBaseURL:");
    id v4 = v5;
  }

  if (self->_dsid)
  {
    objc_msgSend(v5, "setDsid:");
    id v4 = v5;
  }

  if (self->_escrowCertificate)
  {
    objc_msgSend(v5, "setEscrowCertificate:");
    id v4 = v5;
  }

  if (self->_duplicateEscrowCertificate)
  {
    objc_msgSend(v5, "setDuplicateEscrowCertificate:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_iCloudEnvironment, "copyWithZone:", a3);
  v7 = (void *)v5[5];
  v5[5] = v6;

  id v8 = -[NSString copyWithZone:](self->_escrowBaseURL, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = -[NSString copyWithZone:](self->_dsid, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  id v12 = -[NSData copyWithZone:](self->_escrowCertificate, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  id v14 = -[NSData copyWithZone:](self->_duplicateEscrowCertificate, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((iCloudEnvironment = self->_iCloudEnvironment, !((unint64_t)iCloudEnvironment | v4[5]))
     || -[NSString isEqual:](iCloudEnvironment, "isEqual:"))
    && ((escrowBaseURL = self->_escrowBaseURL, !((unint64_t)escrowBaseURL | v4[3]))
     || -[NSString isEqual:](escrowBaseURL, "isEqual:"))
    && ((dsid = self->_dsid, !((unint64_t)dsid | v4[1])) || -[NSString isEqual:](dsid, "isEqual:"))
    && ((escrowCertificate = self->_escrowCertificate, !((unint64_t)escrowCertificate | v4[4]))
     || -[NSData isEqual:](escrowCertificate, "isEqual:")))
  {
    duplicateEscrowCertificate = self->_duplicateEscrowCertificate;
    else {
      unsigned __int8 v11 = 1;
    }
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_iCloudEnvironment, "hash");
  unint64_t v4 = -[NSString hash](self->_escrowBaseURL, "hash") ^ v3;
  NSUInteger v5 = -[NSString hash](self->_dsid, "hash");
  unint64_t v6 = v4 ^ v5 ^ (unint64_t)-[NSData hash](self->_escrowCertificate, "hash");
  return v6 ^ (unint64_t)-[NSData hash](self->_duplicateEscrowCertificate, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[5]) {
    -[StoredCertificate setICloudEnvironment:](self, "setICloudEnvironment:");
  }
  if (v4[3]) {
    -[StoredCertificate setEscrowBaseURL:](self, "setEscrowBaseURL:");
  }
  if (v4[1]) {
    -[StoredCertificate setDsid:](self, "setDsid:");
  }
  if (v4[4]) {
    -[StoredCertificate setEscrowCertificate:](self, "setEscrowCertificate:");
  }
  if (v4[2]) {
    -[StoredCertificate setDuplicateEscrowCertificate:](self, "setDuplicateEscrowCertificate:");
  }
}

- (NSString)iCloudEnvironment
{
  return self->_iCloudEnvironment;
}

- (void)setICloudEnvironment:(id)a3
{
}

- (NSString)escrowBaseURL
{
  return self->_escrowBaseURL;
}

- (void)setEscrowBaseURL:(id)a3
{
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NSData)escrowCertificate
{
  return self->_escrowCertificate;
}

- (void)setEscrowCertificate:(id)a3
{
}

- (NSData)duplicateEscrowCertificate
{
  return self->_duplicateEscrowCertificate;
}

- (void)setDuplicateEscrowCertificate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end