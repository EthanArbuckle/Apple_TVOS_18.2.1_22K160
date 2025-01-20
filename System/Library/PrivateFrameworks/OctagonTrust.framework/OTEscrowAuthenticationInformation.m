@interface OTEscrowAuthenticationInformation
- (BOOL)fmipRecovery;
- (BOOL)hasAuthenticationAppleid;
- (BOOL)hasAuthenticationAuthToken;
- (BOOL)hasAuthenticationDsid;
- (BOOL)hasAuthenticationEscrowproxyUrl;
- (BOOL)hasAuthenticationIcloudEnvironment;
- (BOOL)hasAuthenticationPassword;
- (BOOL)hasFmipRecovery;
- (BOOL)hasFmipUuid;
- (BOOL)hasIdmsRecovery;
- (BOOL)idmsRecovery;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)authenticationAppleid;
- (NSString)authenticationAuthToken;
- (NSString)authenticationDsid;
- (NSString)authenticationEscrowproxyUrl;
- (NSString)authenticationIcloudEnvironment;
- (NSString)authenticationPassword;
- (NSString)fmipUuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthenticationAppleid:(id)a3;
- (void)setAuthenticationAuthToken:(id)a3;
- (void)setAuthenticationDsid:(id)a3;
- (void)setAuthenticationEscrowproxyUrl:(id)a3;
- (void)setAuthenticationIcloudEnvironment:(id)a3;
- (void)setAuthenticationPassword:(id)a3;
- (void)setFmipRecovery:(BOOL)a3;
- (void)setFmipUuid:(id)a3;
- (void)setHasFmipRecovery:(BOOL)a3;
- (void)setHasIdmsRecovery:(BOOL)a3;
- (void)setIdmsRecovery:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTEscrowAuthenticationInformation

- (BOOL)hasAuthenticationPassword
{
  return self->_authenticationPassword != 0LL;
}

- (BOOL)hasAuthenticationDsid
{
  return self->_authenticationDsid != 0LL;
}

- (BOOL)hasAuthenticationAppleid
{
  return self->_authenticationAppleid != 0LL;
}

- (BOOL)hasFmipUuid
{
  return self->_fmipUuid != 0LL;
}

- (void)setFmipRecovery:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_fmipRecovery = a3;
}

- (void)setHasFmipRecovery:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFmipRecovery
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIdmsRecovery:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_idmsRecovery = a3;
}

- (void)setHasIdmsRecovery:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIdmsRecovery
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasAuthenticationAuthToken
{
  return self->_authenticationAuthToken != 0LL;
}

- (BOOL)hasAuthenticationEscrowproxyUrl
{
  return self->_authenticationEscrowproxyUrl != 0LL;
}

- (BOOL)hasAuthenticationIcloudEnvironment
{
  return self->_authenticationIcloudEnvironment != 0LL;
}

- (id)description
{
  char v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTEscrowAuthenticationInformation;
  v4 = -[OTEscrowAuthenticationInformation description](&v8, sel_description);
  v5 = -[OTEscrowAuthenticationInformation dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  authenticationPassword = self->_authenticationPassword;
  if (authenticationPassword) {
    [v3 setObject:authenticationPassword forKey:@"authentication_password"];
  }
  authenticationDsid = self->_authenticationDsid;
  if (authenticationDsid) {
    [v4 setObject:authenticationDsid forKey:@"authentication_dsid"];
  }
  authenticationAppleid = self->_authenticationAppleid;
  if (authenticationAppleid) {
    [v4 setObject:authenticationAppleid forKey:@"authentication_appleid"];
  }
  fmipUuid = self->_fmipUuid;
  if (fmipUuid) {
    [v4 setObject:fmipUuid forKey:@"fmip_uuid"];
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    [MEMORY[0x189607968] numberWithBool:self->_fmipRecovery];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v10 forKey:@"fmip_recovery"];

    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    [MEMORY[0x189607968] numberWithBool:self->_idmsRecovery];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v11 forKey:@"idms_recovery"];
  }

  authenticationAuthToken = self->_authenticationAuthToken;
  if (authenticationAuthToken) {
    [v4 setObject:authenticationAuthToken forKey:@"authentication_auth_token"];
  }
  authenticationEscrowproxyUrl = self->_authenticationEscrowproxyUrl;
  if (authenticationEscrowproxyUrl) {
    [v4 setObject:authenticationEscrowproxyUrl forKey:@"authentication_escrowproxy_url"];
  }
  authenticationIcloudEnvironment = self->_authenticationIcloudEnvironment;
  if (authenticationIcloudEnvironment) {
    [v4 setObject:authenticationIcloudEnvironment forKey:@"authentication_icloud_environment"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return OTEscrowAuthenticationInformationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_authenticationPassword)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }

  if (self->_authenticationDsid)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }

  if (self->_authenticationAppleid)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }

  if (self->_fmipUuid)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }

  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }

  if (self->_authenticationAuthToken)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }

  if (self->_authenticationEscrowproxyUrl)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }

  if (self->_authenticationIcloudEnvironment)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_authenticationPassword)
  {
    objc_msgSend(v4, "setAuthenticationPassword:");
    id v4 = v6;
  }

  if (self->_authenticationDsid)
  {
    objc_msgSend(v6, "setAuthenticationDsid:");
    id v4 = v6;
  }

  if (self->_authenticationAppleid)
  {
    objc_msgSend(v6, "setAuthenticationAppleid:");
    id v4 = v6;
  }

  if (self->_fmipUuid)
  {
    objc_msgSend(v6, "setFmipUuid:");
    id v4 = v6;
  }

  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[64] = self->_fmipRecovery;
    v4[68] |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    v4[65] = self->_idmsRecovery;
    v4[68] |= 2u;
  }

  if (self->_authenticationAuthToken)
  {
    objc_msgSend(v6, "setAuthenticationAuthToken:");
    id v4 = v6;
  }

  if (self->_authenticationEscrowproxyUrl)
  {
    objc_msgSend(v6, "setAuthenticationEscrowproxyUrl:");
    id v4 = v6;
  }

  if (self->_authenticationIcloudEnvironment)
  {
    objc_msgSend(v6, "setAuthenticationIcloudEnvironment:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_authenticationPassword, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = -[NSString copyWithZone:](self->_authenticationDsid, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = -[NSString copyWithZone:](self->_authenticationAppleid, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  uint64_t v12 = -[NSString copyWithZone:](self->_fmipUuid, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_BYTE *)(v5 + 64) = self->_fmipRecovery;
    *(_BYTE *)(v5 + 68) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 65) = self->_idmsRecovery;
    *(_BYTE *)(v5 + 68) |= 2u;
  }

  uint64_t v15 = -[NSString copyWithZone:](self->_authenticationAuthToken, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v15;

  uint64_t v17 = -[NSString copyWithZone:](self->_authenticationEscrowproxyUrl, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v17;

  uint64_t v19 = -[NSString copyWithZone:](self->_authenticationIcloudEnvironment, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v19;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  authenticationPassword = self->_authenticationPassword;
  if ((unint64_t)authenticationPassword | *((void *)v4 + 6))
  {
  }

  authenticationDsid = self->_authenticationDsid;
  if ((unint64_t)authenticationDsid | *((void *)v4 + 3))
  {
  }

  authenticationAppleid = self->_authenticationAppleid;
  if ((unint64_t)authenticationAppleid | *((void *)v4 + 1))
  {
  }

  fmipUuid = self->_fmipUuid;
  if ((unint64_t)fmipUuid | *((void *)v4 + 7))
  {
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0) {
      goto LABEL_32;
    }
    if (self->_fmipRecovery)
    {
      if (!*((_BYTE *)v4 + 64)) {
        goto LABEL_32;
      }
    }

    else if (*((_BYTE *)v4 + 64))
    {
      goto LABEL_32;
    }
  }

  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_32;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) != 0)
    {
      if (self->_idmsRecovery)
      {
        if (!*((_BYTE *)v4 + 65)) {
          goto LABEL_32;
        }
        goto LABEL_26;
      }

      if (!*((_BYTE *)v4 + 65)) {
        goto LABEL_26;
      }
    }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_authenticationPassword, "hash");
  NSUInteger v4 = -[NSString hash](self->_authenticationDsid, "hash");
  NSUInteger v5 = -[NSString hash](self->_authenticationAppleid, "hash");
  NSUInteger v6 = -[NSString hash](self->_fmipUuid, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t v7 = 2654435761LL * self->_fmipRecovery;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0LL;
    goto LABEL_6;
  }

  uint64_t v7 = 0LL;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = 2654435761LL * self->_idmsRecovery;
LABEL_6:
  NSUInteger v9 = v4 ^ v3 ^ v5 ^ v6;
  NSUInteger v10 = v7 ^ v8 ^ -[NSString hash](self->_authenticationAuthToken, "hash");
  NSUInteger v11 = v9 ^ v10 ^ -[NSString hash](self->_authenticationEscrowproxyUrl, "hash");
  return v11 ^ -[NSString hash](self->_authenticationIcloudEnvironment, "hash");
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (BOOL *)a3;
  NSUInteger v6 = v4;
  if (*((void *)v4 + 6))
  {
    -[OTEscrowAuthenticationInformation setAuthenticationPassword:](self, "setAuthenticationPassword:");
    NSUInteger v4 = v6;
  }

  if (*((void *)v4 + 3))
  {
    -[OTEscrowAuthenticationInformation setAuthenticationDsid:](self, "setAuthenticationDsid:");
    NSUInteger v4 = v6;
  }

  if (*((void *)v4 + 1))
  {
    -[OTEscrowAuthenticationInformation setAuthenticationAppleid:](self, "setAuthenticationAppleid:");
    NSUInteger v4 = v6;
  }

  if (*((void *)v4 + 7))
  {
    -[OTEscrowAuthenticationInformation setFmipUuid:](self, "setFmipUuid:");
    NSUInteger v4 = v6;
  }

  BOOL v5 = v4[68];
  if (v5)
  {
    self->_fmipRecovery = v4[64];
    *(_BYTE *)&self->_has |= 1u;
    BOOL v5 = v4[68];
  }

  if ((v5 & 2) != 0)
  {
    self->_idmsRecovery = v4[65];
    *(_BYTE *)&self->_has |= 2u;
  }

  if (*((void *)v4 + 2))
  {
    -[OTEscrowAuthenticationInformation setAuthenticationAuthToken:](self, "setAuthenticationAuthToken:");
    NSUInteger v4 = v6;
  }

  if (*((void *)v4 + 4))
  {
    -[OTEscrowAuthenticationInformation setAuthenticationEscrowproxyUrl:](self, "setAuthenticationEscrowproxyUrl:");
    NSUInteger v4 = v6;
  }

  if (*((void *)v4 + 5))
  {
    -[OTEscrowAuthenticationInformation setAuthenticationIcloudEnvironment:]( self,  "setAuthenticationIcloudEnvironment:");
    NSUInteger v4 = v6;
  }
}

- (NSString)authenticationPassword
{
  return self->_authenticationPassword;
}

- (void)setAuthenticationPassword:(id)a3
{
}

- (NSString)authenticationDsid
{
  return self->_authenticationDsid;
}

- (void)setAuthenticationDsid:(id)a3
{
}

- (NSString)authenticationAppleid
{
  return self->_authenticationAppleid;
}

- (void)setAuthenticationAppleid:(id)a3
{
}

- (NSString)fmipUuid
{
  return self->_fmipUuid;
}

- (void)setFmipUuid:(id)a3
{
}

- (BOOL)fmipRecovery
{
  return self->_fmipRecovery;
}

- (BOOL)idmsRecovery
{
  return self->_idmsRecovery;
}

- (NSString)authenticationAuthToken
{
  return self->_authenticationAuthToken;
}

- (void)setAuthenticationAuthToken:(id)a3
{
}

- (NSString)authenticationEscrowproxyUrl
{
  return self->_authenticationEscrowproxyUrl;
}

- (void)setAuthenticationEscrowproxyUrl:(id)a3
{
}

- (NSString)authenticationIcloudEnvironment
{
  return self->_authenticationIcloudEnvironment;
}

- (void)setAuthenticationIcloudEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
}

@end