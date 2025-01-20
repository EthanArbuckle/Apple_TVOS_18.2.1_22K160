@interface AWDHeaderInfoS
- (BOOL)hasDaemonVersion;
- (BOOL)hasVendorVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)daemonVersion;
- (NSString)vendorVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDaemonVersion:(id)a3;
- (void)setVendorVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDHeaderInfoS

- (BOOL)hasDaemonVersion
{
  return self->_daemonVersion != 0LL;
}

- (BOOL)hasVendorVersion
{
  return self->_vendorVersion != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AWDHeaderInfoS;
  id v3 = -[AWDHeaderInfoS description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDHeaderInfoS dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  daemonVersion = self->_daemonVersion;
  if (daemonVersion) {
    [v3 setObject:daemonVersion forKey:@"daemon_version"];
  }
  vendorVersion = self->_vendorVersion;
  if (vendorVersion) {
    [v4 setObject:vendorVersion forKey:@"vendor_version"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return result;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  daemonVersion = self->_daemonVersion;
  id v7 = v4;
  if (daemonVersion)
  {
    PBDataWriterWriteStringField(v4, daemonVersion, 1LL);
    id v4 = v7;
  }

  vendorVersion = self->_vendorVersion;
  if (vendorVersion)
  {
    PBDataWriterWriteStringField(v7, vendorVersion, 2LL);
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_daemonVersion)
  {
    objc_msgSend(v4, "setDaemonVersion:");
    id v4 = v5;
  }

  if (self->_vendorVersion)
  {
    objc_msgSend(v5, "setVendorVersion:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_daemonVersion, "copyWithZone:", a3);
  id v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = -[NSString copyWithZone:](self->_vendorVersion, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    || ((daemonVersion = self->_daemonVersion) != 0LL || v4[1])
    && !-[NSString isEqual:](daemonVersion, "isEqual:", v4[1]))
  {
    unsigned __int8 v8 = 0;
  }

  else
  {
    vendorVersion = self->_vendorVersion;
    if (vendorVersion || v4[2]) {
      unsigned __int8 v8 = -[NSString isEqual:](vendorVersion, "isEqual:", v4[2]);
    }
    else {
      unsigned __int8 v8 = 1;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_daemonVersion, "hash");
  return -[NSString hash](self->_vendorVersion, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4[1])
  {
    -[AWDHeaderInfoS setDaemonVersion:](self, "setDaemonVersion:");
    id v4 = v5;
  }

  if (v4[2])
  {
    -[AWDHeaderInfoS setVendorVersion:](self, "setVendorVersion:");
    id v4 = v5;
  }
}

- (NSString)daemonVersion
{
  return self->_daemonVersion;
}

- (void)setDaemonVersion:(id)a3
{
}

- (NSString)vendorVersion
{
  return self->_vendorVersion;
}

- (void)setVendorVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end