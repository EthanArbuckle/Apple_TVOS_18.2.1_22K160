@interface ICAppleMusicAPITokenError
- (BOOL)hasCode;
- (BOOL)hasDomain;
- (BOOL)hasLocalizedDescription;
- (BOOL)hasPhase;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ICAppleMusicAPITokenError)initWithNSError:(id)a3;
- (NSString)domain;
- (NSString)localizedDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)phase;
- (int64_t)code;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setCode:(int64_t)a3;
- (void)setDomain:(id)a3;
- (void)setHasCode:(BOOL)a3;
- (void)setHasPhase:(BOOL)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setPhase:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ICAppleMusicAPITokenError

- (ICAppleMusicAPITokenError)initWithNSError:(id)a3
{
  id v4 = a3;
  v5 = -[ICAppleMusicAPITokenError init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    -[ICAppleMusicAPITokenError setDomain:](v5, "setDomain:", v6);

    -[ICAppleMusicAPITokenError setCode:](v5, "setCode:", [v4 code]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
    -[ICAppleMusicAPITokenError setLocalizedDescription:](v5, "setLocalizedDescription:", v7);
  }

  return v5;
}

- (BOOL)hasDomain
{
  return self->_domain != 0LL;
}

- (void)setCode:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_code = a3;
}

- (void)setHasCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasLocalizedDescription
{
  return self->_localizedDescription != 0LL;
}

- (int)phase
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    return self->_phase;
  }
  else {
    return 1;
  }
}

- (void)setPhase:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_phase = a3;
}

- (void)setHasPhase:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPhase
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ICAppleMusicAPITokenError;
  id v3 = -[ICAppleMusicAPITokenError description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppleMusicAPITokenError dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = v3;
  domain = self->_domain;
  if (domain) {
    [v3 setObject:domain forKey:@"domain"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->_code));
    [v4 setObject:v6 forKey:@"code"];
  }

  localizedDescription = self->_localizedDescription;
  if (localizedDescription) {
    [v4 setObject:localizedDescription forKey:@"localizedDescription"];
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_phase));
    [v4 setObject:v8 forKey:@"phase"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000C4848((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  domain = self->_domain;
  id v7 = v4;
  if (domain)
  {
    PBDataWriterWriteStringField(v4, domain, 1LL);
    id v4 = v7;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field(v7, self->_code, 2LL);
    id v4 = v7;
  }

  localizedDescription = self->_localizedDescription;
  if (localizedDescription)
  {
    PBDataWriterWriteStringField(v7, localizedDescription, 3LL);
    id v4 = v7;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field(v7, self->_phase, 4LL);
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  id v7 = (void *)v5[2];
  v5[2] = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_code;
    *((_BYTE *)v5 + 36) |= 1u;
  }

  id v8 = -[NSString copyWithZone:](self->_localizedDescription, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_phase;
    *((_BYTE *)v5 + 36) |= 2u;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  domain = self->_domain;
  if ((unint64_t)domain | *((void *)v4 + 2))
  {
  }

  char has = (char)self->_has;
  char v8 = *((_BYTE *)v4 + 36);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_code != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_16;
  }

  localizedDescription = self->_localizedDescription;
  if ((unint64_t)localizedDescription | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](localizedDescription, "isEqual:"))
    {
LABEL_16:
      BOOL v10 = 0;
      goto LABEL_17;
    }

    char has = (char)self->_has;
    char v8 = *((_BYTE *)v4 + 36);
  }

  BOOL v10 = (v8 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_phase != *((_DWORD *)v4 + 8)) {
      goto LABEL_16;
    }
    BOOL v10 = 1;
  }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_domain, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v4 = 2654435761LL * self->_code;
  }
  else {
    uint64_t v4 = 0LL;
  }
  NSUInteger v5 = -[NSString hash](self->_localizedDescription, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761LL * self->_phase;
  }
  else {
    uint64_t v6 = 0LL;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[ICAppleMusicAPITokenError setDomain:](self, "setDomain:");
    id v4 = v5;
  }

  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    self->_code = *((void *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 3))
  {
    -[ICAppleMusicAPITokenError setLocalizedDescription:](self, "setLocalizedDescription:");
    id v4 = v5;
  }

  if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    self->_phase = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (int64_t)code
{
  return self->_code;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end