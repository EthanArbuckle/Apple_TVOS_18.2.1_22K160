@interface TFApplication
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation TFApplication

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TFApplication;
  id v3 = -[TFApplication description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TFApplication dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_applicationAdamId));
    [v3 setObject:v4 forKey:@"applicationAdamId"];
  }

  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundleId"];
  }
  cfBundleShortVersionString = self->_cfBundleShortVersionString;
  if (cfBundleShortVersionString) {
    [v3 setObject:cfBundleShortVersionString forKey:@"cfBundleShortVersionString"];
  }
  cfBundleVersion = self->_cfBundleVersion;
  if (cfBundleVersion) {
    [v3 setObject:cfBundleVersion forKey:@"cfBundleVersion"];
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    uint64_t platform = self->_platform;
    if (platform >= 4) {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_platform));
    }
    else {
      v9 = *(&off_1003F3568 + platform);
    }
    [v3 setObject:v9 forKey:@"platform"];
  }

  gitBranch = self->_gitBranch;
  if (gitBranch) {
    [v3 setObject:gitBranch forKey:@"gitBranch"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_uptimeMillis));
    [v3 setObject:v12 forKey:@"uptimeMillis"];

    char has = (char)self->_has;
  }

  if ((has & 8) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isAppClip));
    [v3 setObject:v13 forKey:@"isAppClip"];
  }

  ciBuildGroup = self->_ciBuildGroup;
  if (ciBuildGroup) {
    [v3 setObject:ciBuildGroup forKey:@"ciBuildGroup"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100324EF4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteUint64Field(v9, self->_applicationAdamId, 1LL);
  }
  bundleId = self->_bundleId;
  if (bundleId) {
    PBDataWriterWriteStringField(v9, bundleId, 2LL);
  }
  cfBundleShortVersionString = self->_cfBundleShortVersionString;
  if (cfBundleShortVersionString) {
    PBDataWriterWriteStringField(v9, cfBundleShortVersionString, 3LL);
  }
  cfBundleVersion = self->_cfBundleVersion;
  if (cfBundleVersion) {
    PBDataWriterWriteStringField(v9, cfBundleVersion, 4LL);
  }
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field(v9, self->_uptimeMillis, 5LL);
  }
  gitBranch = self->_gitBranch;
  if (gitBranch) {
    PBDataWriterWriteStringField(v9, gitBranch, 6LL);
  }
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    PBDataWriterWriteBOOLField(v9, self->_isAppClip, 7LL);
  }
  ciBuildGroup = self->_ciBuildGroup;
  if (ciBuildGroup) {
    PBDataWriterWriteStringField(v9, ciBuildGroup, 8LL);
  }
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field(v9, self->_platform, 9LL);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_applicationAdamId;
    *((_BYTE *)v5 + 72) |= 1u;
  }

  id v7 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = -[NSString copyWithZone:](self->_cfBundleShortVersionString, "copyWithZone:", a3);
  v10 = (void *)v6[4];
  v6[4] = v9;

  id v11 = -[NSString copyWithZone:](self->_cfBundleVersion, "copyWithZone:", a3);
  v12 = (void *)v6[5];
  v6[5] = v11;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6[2] = self->_uptimeMillis;
    *((_BYTE *)v6 + 72) |= 2u;
  }

  id v13 = -[NSString copyWithZone:](self->_gitBranch, "copyWithZone:", a3);
  v14 = (void *)v6[7];
  v6[7] = v13;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_BYTE *)v6 + 68) = self->_isAppClip;
    *((_BYTE *)v6 + 72) |= 8u;
  }

  id v15 = -[NSString copyWithZone:](self->_ciBuildGroup, "copyWithZone:", a3);
  v16 = (void *)v6[6];
  v6[6] = v15;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v6 + 16) = self->_platform;
    *((_BYTE *)v6 + 72) |= 4u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_applicationAdamId != *((void *)v4 + 1)) {
      goto LABEL_36;
    }
  }

  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_36;
  }

  bundleId = self->_bundleId;
  cfBundleShortVersionString = self->_cfBundleShortVersionString;
  if ((unint64_t)cfBundleShortVersionString | *((void *)v4 + 4))
  {
  }

  cfBundleVersion = self->_cfBundleVersion;
  if ((unint64_t)cfBundleVersion | *((void *)v4 + 5))
  {
  }

  char has = (char)self->_has;
  char v10 = *((_BYTE *)v4 + 72);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_uptimeMillis != *((void *)v4 + 2)) {
      goto LABEL_36;
    }
  }

  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    goto LABEL_36;
  }

  gitBranch = self->_gitBranch;
  if ((unint64_t)gitBranch | *((void *)v4 + 7))
  {
    char has = (char)self->_has;
    char v10 = *((_BYTE *)v4 + 72);
  }

  if ((has & 8) != 0)
  {
    if ((v10 & 8) == 0) {
      goto LABEL_36;
    }
    if (self->_isAppClip)
    {
      if (!*((_BYTE *)v4 + 68)) {
        goto LABEL_36;
      }
    }

    else if (*((_BYTE *)v4 + 68))
    {
      goto LABEL_36;
    }
  }

  else if ((v10 & 8) != 0)
  {
    goto LABEL_36;
  }

  ciBuildGroup = self->_ciBuildGroup;
  if (!-[NSString isEqual:](ciBuildGroup, "isEqual:"))
  {
LABEL_36:
    BOOL v13 = 0;
    goto LABEL_37;
  }

  char has = (char)self->_has;
  char v10 = *((_BYTE *)v4 + 72);
LABEL_32:
  BOOL v13 = (v10 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_platform != *((_DWORD *)v4 + 16)) {
      goto LABEL_36;
    }
    BOOL v13 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    unint64_t v3 = 2654435761u * self->_applicationAdamId;
  }
  else {
    unint64_t v3 = 0LL;
  }
  NSUInteger v4 = -[NSString hash](self->_bundleId, "hash");
  NSUInteger v5 = -[NSString hash](self->_cfBundleShortVersionString, "hash");
  NSUInteger v6 = -[NSString hash](self->_cfBundleVersion, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    unint64_t v7 = 2654435761u * self->_uptimeMillis;
  }
  else {
    unint64_t v7 = 0LL;
  }
  NSUInteger v8 = -[NSString hash](self->_gitBranch, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    uint64_t v9 = 2654435761LL * self->_isAppClip;
  }
  else {
    uint64_t v9 = 0LL;
  }
  NSUInteger v10 = -[NSString hash](self->_ciBuildGroup, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0) {
    uint64_t v11 = 2654435761LL * self->_platform;
  }
  else {
    uint64_t v11 = 0LL;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void).cxx_destruct
{
}

@end