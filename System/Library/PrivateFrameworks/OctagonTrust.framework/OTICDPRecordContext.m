@interface OTICDPRecordContext
- (BOOL)hasAuthInfo;
- (BOOL)hasCdpInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (OTCDPRecoveryInformation)cdpInfo;
- (OTEscrowAuthenticationInformation)authInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthInfo:(id)a3;
- (void)setCdpInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTICDPRecordContext

- (BOOL)hasCdpInfo
{
  return self->_cdpInfo != 0LL;
}

- (BOOL)hasAuthInfo
{
  return self->_authInfo != 0LL;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTICDPRecordContext;
  v4 = -[OTICDPRecordContext description](&v8, sel_description);
  v5 = -[OTICDPRecordContext dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  cdpInfo = self->_cdpInfo;
  if (cdpInfo)
  {
    v5 = -[OTCDPRecoveryInformation dictionaryRepresentation](cdpInfo, "dictionaryRepresentation");
    [v3 setObject:v5 forKey:@"cdpInfo"];
  }

  authInfo = self->_authInfo;
  if (authInfo)
  {
    v7 = -[OTEscrowAuthenticationInformation dictionaryRepresentation](authInfo, "dictionaryRepresentation");
    [v3 setObject:v7 forKey:@"authInfo"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return OTICDPRecordContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_cdpInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }

  if (self->_authInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_cdpInfo)
  {
    objc_msgSend(v4, "setCdpInfo:");
    id v4 = v5;
  }

  if (self->_authInfo)
  {
    objc_msgSend(v5, "setAuthInfo:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = -[OTCDPRecoveryInformation copyWithZone:](self->_cdpInfo, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = -[OTEscrowAuthenticationInformation copyWithZone:](self->_authInfo, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((cdpInfo = self->_cdpInfo, !((unint64_t)cdpInfo | v4[2]))
     || -[OTCDPRecoveryInformation isEqual:](cdpInfo, "isEqual:")))
  {
    authInfo = self->_authInfo;
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
  unint64_t v3 = -[OTCDPRecoveryInformation hash](self->_cdpInfo, "hash");
  return -[OTEscrowAuthenticationInformation hash](self->_authInfo, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  cdpInfo = self->_cdpInfo;
  uint64_t v6 = v4[2];
  v9 = v4;
  if (cdpInfo)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[OTCDPRecoveryInformation mergeFrom:](cdpInfo, "mergeFrom:");
  }

  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[OTICDPRecordContext setCdpInfo:](self, "setCdpInfo:");
  }

  id v4 = v9;
LABEL_7:
  authInfo = self->_authInfo;
  uint64_t v8 = v4[1];
  if (authInfo)
  {
    if (v8)
    {
      -[OTEscrowAuthenticationInformation mergeFrom:](authInfo, "mergeFrom:");
LABEL_12:
      id v4 = v9;
    }
  }

  else if (v8)
  {
    -[OTICDPRecordContext setAuthInfo:](self, "setAuthInfo:");
    goto LABEL_12;
  }
}

- (OTCDPRecoveryInformation)cdpInfo
{
  return self->_cdpInfo;
}

- (void)setCdpInfo:(id)a3
{
}

- (OTEscrowAuthenticationInformation)authInfo
{
  return self->_authInfo;
}

- (void)setAuthInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end