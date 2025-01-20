@interface SDAutoUnlockAuthPromptRequest
- (BOOL)hasAppName;
- (BOOL)hasIconHash;
- (BOOL)hasNavBarTitle;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)iconHash;
- (NSString)appName;
- (NSString)navBarTitle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppName:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setIconHash:(id)a3;
- (void)setNavBarTitle:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAutoUnlockAuthPromptRequest

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasIconHash
{
  return self->_iconHash != 0LL;
}

- (BOOL)hasAppName
{
  return self->_appName != 0LL;
}

- (BOOL)hasNavBarTitle
{
  return self->_navBarTitle != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAutoUnlockAuthPromptRequest;
  id v3 = -[SDAutoUnlockAuthPromptRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v4 forKey:@"version"];
  }

  iconHash = self->_iconHash;
  if (iconHash) {
    [v3 setObject:iconHash forKey:@"iconHash"];
  }
  appName = self->_appName;
  if (appName) {
    [v3 setObject:appName forKey:@"appName"];
  }
  navBarTitle = self->_navBarTitle;
  if (navBarTitle) {
    [v3 setObject:navBarTitle forKey:@"navBarTitle"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockAuthPromptRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
    id v4 = v8;
  }

  iconHash = self->_iconHash;
  if (iconHash)
  {
    PBDataWriterWriteDataField(v8, iconHash, 2LL);
    id v4 = v8;
  }

  appName = self->_appName;
  if (appName)
  {
    PBDataWriterWriteStringField(v8, appName, 3LL);
    id v4 = v8;
  }

  navBarTitle = self->_navBarTitle;
  if (navBarTitle)
  {
    PBDataWriterWriteStringField(v8, navBarTitle, 4LL);
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[8] = self->_version;
    *((_BYTE *)v4 + 36) |= 1u;
  }

  v5 = v4;
  if (self->_iconHash)
  {
    objc_msgSend(v4, "setIconHash:");
    id v4 = v5;
  }

  if (self->_appName)
  {
    objc_msgSend(v5, "setAppName:");
    id v4 = v5;
  }

  if (self->_navBarTitle)
  {
    objc_msgSend(v5, "setNavBarTitle:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_version;
    *((_BYTE *)v5 + 36) |= 1u;
  }

  id v7 = -[NSData copyWithZone:](self->_iconHash, "copyWithZone:", a3);
  id v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = -[NSString copyWithZone:](self->_appName, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  id v11 = -[NSString copyWithZone:](self->_navBarTitle, "copyWithZone:", a3);
  v12 = (void *)v6[3];
  v6[3] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_version != *((_DWORD *)v4 + 8)) {
      goto LABEL_13;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_13:
    unsigned __int8 v8 = 0;
    goto LABEL_14;
  }

  iconHash = self->_iconHash;
  appName = self->_appName;
  if ((unint64_t)appName | *((void *)v4 + 1))
  {
  }

  navBarTitle = self->_navBarTitle;
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v3 = 2654435761LL * self->_version;
  }
  else {
    uint64_t v3 = 0LL;
  }
  unint64_t v4 = (unint64_t)-[NSData hash](self->_iconHash, "hash") ^ v3;
  NSUInteger v5 = -[NSString hash](self->_appName, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_navBarTitle, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if ((v4[9] & 1) != 0)
  {
    self->_version = v4[8];
    *(_BYTE *)&self->_has |= 1u;
  }

  NSUInteger v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[SDAutoUnlockAuthPromptRequest setIconHash:](self, "setIconHash:");
    unint64_t v4 = v5;
  }

  if (*((void *)v4 + 1))
  {
    -[SDAutoUnlockAuthPromptRequest setAppName:](self, "setAppName:");
    unint64_t v4 = v5;
  }

  if (*((void *)v4 + 3))
  {
    -[SDAutoUnlockAuthPromptRequest setNavBarTitle:](self, "setNavBarTitle:");
    unint64_t v4 = v5;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSData)iconHash
{
  return self->_iconHash;
}

- (void)setIconHash:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSString)navBarTitle
{
  return self->_navBarTitle;
}

- (void)setNavBarTitle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end