@interface OTAccountSettings
- (BOOL)hasWalrus;
- (BOOL)hasWebAccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (OTWalrus)walrus;
- (OTWebAccess)webAccess;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setWalrus:(id)a3;
- (void)setWebAccess:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTAccountSettings

- (BOOL)hasWalrus
{
  return self->_walrus != 0LL;
}

- (BOOL)hasWebAccess
{
  return self->_webAccess != 0LL;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTAccountSettings;
  v4 = -[OTAccountSettings description](&v8, sel_description);
  v5 = -[OTAccountSettings dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  walrus = self->_walrus;
  if (walrus)
  {
    v5 = -[OTWalrus dictionaryRepresentation](walrus, "dictionaryRepresentation");
    [v3 setObject:v5 forKey:@"walrus"];
  }

  webAccess = self->_webAccess;
  if (webAccess)
  {
    v7 = -[OTWebAccess dictionaryRepresentation](webAccess, "dictionaryRepresentation");
    [v3 setObject:v7 forKey:@"webAccess"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return OTAccountSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_walrus)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }

  if (self->_webAccess)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_walrus)
  {
    objc_msgSend(v4, "setWalrus:");
    id v4 = v5;
  }

  if (self->_webAccess)
  {
    objc_msgSend(v5, "setWebAccess:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = -[OTWalrus copyWithZone:](self->_walrus, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = -[OTWebAccess copyWithZone:](self->_webAccess, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((walrus = self->_walrus, !((unint64_t)walrus | v4[1])) || -[OTWalrus isEqual:](walrus, "isEqual:")))
  {
    webAccess = self->_webAccess;
    else {
      char v7 = 1;
    }
  }

  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = -[OTWalrus hash](self->_walrus, "hash");
  return -[OTWebAccess hash](self->_webAccess, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  walrus = self->_walrus;
  uint64_t v6 = v4[1];
  v9 = v4;
  if (walrus)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[OTWalrus mergeFrom:](walrus, "mergeFrom:");
  }

  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[OTAccountSettings setWalrus:](self, "setWalrus:");
  }

  id v4 = v9;
LABEL_7:
  webAccess = self->_webAccess;
  uint64_t v8 = v4[2];
  if (webAccess)
  {
    if (v8)
    {
      -[OTWebAccess mergeFrom:](webAccess, "mergeFrom:");
LABEL_12:
      id v4 = v9;
    }
  }

  else if (v8)
  {
    -[OTAccountSettings setWebAccess:](self, "setWebAccess:");
    goto LABEL_12;
  }
}

- (OTWalrus)walrus
{
  return self->_walrus;
}

- (void)setWalrus:(id)a3
{
}

- (OTWebAccess)webAccess
{
  return self->_webAccess;
}

- (void)setWebAccess:(id)a3
{
}

- (void).cxx_destruct
{
}

@end