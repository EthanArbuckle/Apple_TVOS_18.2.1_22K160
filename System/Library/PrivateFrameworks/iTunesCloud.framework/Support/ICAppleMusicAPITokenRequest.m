@interface ICAppleMusicAPITokenRequest
- (BOOL)hasBagProfile;
- (BOOL)hasBagProfileVersion;
- (BOOL)hasClientIdentifier;
- (BOOL)hasClientVersion;
- (BOOL)hasShouldIgnoreDeveloperTokenCache;
- (BOOL)hasShouldIgnoreUserTokenCache;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldIgnoreDeveloperTokenCache;
- (BOOL)shouldIgnoreUserTokenCache;
- (NSString)bagProfile;
- (NSString)bagProfileVersion;
- (NSString)clientIdentifier;
- (NSString)clientVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setBagProfile:(id)a3;
- (void)setBagProfileVersion:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setClientVersion:(id)a3;
- (void)setHasShouldIgnoreDeveloperTokenCache:(BOOL)a3;
- (void)setHasShouldIgnoreUserTokenCache:(BOOL)a3;
- (void)setShouldIgnoreDeveloperTokenCache:(BOOL)a3;
- (void)setShouldIgnoreUserTokenCache:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ICAppleMusicAPITokenRequest

- (BOOL)hasClientIdentifier
{
  return self->_clientIdentifier != 0LL;
}

- (BOOL)hasClientVersion
{
  return self->_clientVersion != 0LL;
}

- (BOOL)hasBagProfile
{
  return self->_bagProfile != 0LL;
}

- (BOOL)hasBagProfileVersion
{
  return self->_bagProfileVersion != 0LL;
}

- (void)setShouldIgnoreUserTokenCache:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_shouldIgnoreUserTokenCache = a3;
}

- (void)setHasShouldIgnoreUserTokenCache:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShouldIgnoreUserTokenCache
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setShouldIgnoreDeveloperTokenCache:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_shouldIgnoreDeveloperTokenCache = a3;
}

- (void)setHasShouldIgnoreDeveloperTokenCache:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasShouldIgnoreDeveloperTokenCache
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ICAppleMusicAPITokenRequest;
  id v3 = -[ICAppleMusicAPITokenRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAppleMusicAPITokenRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier) {
    [v3 setObject:clientIdentifier forKey:@"clientIdentifier"];
  }
  clientVersion = self->_clientVersion;
  if (clientVersion) {
    [v4 setObject:clientVersion forKey:@"clientVersion"];
  }
  bagProfile = self->_bagProfile;
  if (bagProfile) {
    [v4 setObject:bagProfile forKey:@"bagProfile"];
  }
  bagProfileVersion = self->_bagProfileVersion;
  if (bagProfileVersion) {
    [v4 setObject:bagProfileVersion forKey:@"bagProfileVersion"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_shouldIgnoreUserTokenCache));
    [v4 setObject:v10 forKey:@"shouldIgnoreUserTokenCache"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_shouldIgnoreDeveloperTokenCache));
    [v4 setObject:v11 forKey:@"shouldIgnoreDeveloperTokenCache"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v5 = 0;
    unsigned int v6 = 0;
    unint64_t v7 = 0LL;
    while (1)
    {
      unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      char v9 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v5 += 7;
      BOOL v10 = v6++ >= 9;
      if (v10)
      {
        unint64_t v7 = 0LL;
        int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v7 = 0LL;
    }
LABEL_13:
    if (v11 || (v7 & 7) == 4) {
      break;
    }
    switch((v7 >> 3))
    {
      case 1u:
        uint64_t String = PBReaderReadString(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(String);
        uint64_t v15 = 24LL;
        goto LABEL_24;
      case 2u:
        uint64_t v17 = PBReaderReadString(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(v17);
        uint64_t v15 = 32LL;
        goto LABEL_24;
      case 3u:
        uint64_t v18 = PBReaderReadString(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(v18);
        uint64_t v15 = 8LL;
        goto LABEL_24;
      case 4u:
        uint64_t v19 = PBReaderReadString(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(v19);
        uint64_t v15 = 16LL;
LABEL_24:
        v20 = *(void **)&self->PBRequest_opaque[v15];
        *(void *)&self->PBRequest_opaque[v15] = v14;

        continue;
      case 5u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0LL;
        *(_BYTE *)&self->_has |= 2u;
        while (2)
        {
          unint64_t v24 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v24 == -1LL || v24 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v25 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v24);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v24 + 1;
            v23 |= (unint64_t)(v25 & 0x7F) << v21;
            if (v25 < 0)
            {
              v21 += 7;
              BOOL v10 = v22++ >= 9;
              if (v10)
              {
                uint64_t v23 = 0LL;
                goto LABEL_42;
              }

              continue;
            }
          }

          break;
        }

        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v23 = 0LL;
        }
LABEL_42:
        BOOL v31 = v23 != 0;
        uint64_t v32 = 41LL;
        goto LABEL_47;
      case 6u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0LL;
        *(_BYTE *)&self->_has |= 1u;
        break;
      default:
        int v16 = PBReaderSkipValueWithTag(a3);
        if (!v16) {
          return v16;
        }
        continue;
    }

    while (1)
    {
      unint64_t v29 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      char v30 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v29);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v29 + 1;
      v28 |= (unint64_t)(v30 & 0x7F) << v26;
      if ((v30 & 0x80) == 0) {
        goto LABEL_44;
      }
      v26 += 7;
      BOOL v10 = v27++ >= 9;
      if (v10)
      {
        uint64_t v28 = 0LL;
        goto LABEL_46;
      }
    }

    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_44:
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v28 = 0LL;
    }
LABEL_46:
    BOOL v31 = v28 != 0;
    uint64_t v32 = 40LL;
LABEL_47:
    self->PBRequest_opaque[v32] = v31;
  }

  LOBYTE(v16) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v16;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  clientIdentifier = self->_clientIdentifier;
  id v10 = v4;
  if (clientIdentifier)
  {
    PBDataWriterWriteStringField(v4, clientIdentifier, 1LL);
    id v4 = v10;
  }

  clientVersion = self->_clientVersion;
  if (clientVersion)
  {
    PBDataWriterWriteStringField(v10, clientVersion, 2LL);
    id v4 = v10;
  }

  bagProfile = self->_bagProfile;
  if (bagProfile)
  {
    PBDataWriterWriteStringField(v10, bagProfile, 3LL);
    id v4 = v10;
  }

  bagProfileVersion = self->_bagProfileVersion;
  if (bagProfileVersion)
  {
    PBDataWriterWriteStringField(v10, bagProfileVersion, 4LL);
    id v4 = v10;
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField(v10, self->_shouldIgnoreUserTokenCache, 5LL);
    id v4 = v10;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField(v10, self->_shouldIgnoreDeveloperTokenCache, 6LL);
    id v4 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_clientIdentifier, "copyWithZone:", a3);
  unint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = -[NSString copyWithZone:](self->_clientVersion, "copyWithZone:", a3);
  char v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = -[NSString copyWithZone:](self->_bagProfile, "copyWithZone:", a3);
  int v11 = (void *)v5[1];
  v5[1] = v10;

  id v12 = -[NSString copyWithZone:](self->_bagProfileVersion, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)v5 + 41) = self->_shouldIgnoreUserTokenCache;
    *((_BYTE *)v5 + 44) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((_BYTE *)v5 + 40) = self->_shouldIgnoreDeveloperTokenCache;
    *((_BYTE *)v5 + 44) |= 1u;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  clientIdentifier = self->_clientIdentifier;
  if ((unint64_t)clientIdentifier | *((void *)v4 + 3))
  {
  }

  clientVersion = self->_clientVersion;
  if ((unint64_t)clientVersion | *((void *)v4 + 4))
  {
  }

  bagProfile = self->_bagProfile;
  if ((unint64_t)bagProfile | *((void *)v4 + 1))
  {
  }

  bagProfileVersion = self->_bagProfileVersion;
  if ((unint64_t)bagProfileVersion | *((void *)v4 + 2))
  {
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0) {
      goto LABEL_20;
    }
    if (self->_shouldIgnoreUserTokenCache)
    {
      if (!*((_BYTE *)v4 + 41)) {
        goto LABEL_20;
      }
    }

    else if (*((_BYTE *)v4 + 41))
    {
      goto LABEL_20;
    }
  }

  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_20;
  }

  BOOL v10 = (*((_BYTE *)v4 + 44) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) != 0)
    {
      if (self->_shouldIgnoreDeveloperTokenCache)
      {
        if (!*((_BYTE *)v4 + 40)) {
          goto LABEL_20;
        }
      }

      else if (*((_BYTE *)v4 + 40))
      {
        goto LABEL_20;
      }

      BOOL v10 = 1;
      goto LABEL_21;
    }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_clientIdentifier, "hash");
  NSUInteger v4 = -[NSString hash](self->_clientVersion, "hash");
  NSUInteger v5 = -[NSString hash](self->_bagProfile, "hash");
  NSUInteger v6 = -[NSString hash](self->_bagProfileVersion, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v7 = 2654435761LL * self->_shouldIgnoreUserTokenCache;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0LL;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }

  uint64_t v7 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = 2654435761LL * self->_shouldIgnoreDeveloperTokenCache;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (BOOL *)a3;
  NSUInteger v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[ICAppleMusicAPITokenRequest setClientIdentifier:](self, "setClientIdentifier:");
    NSUInteger v4 = v6;
  }

  if (*((void *)v4 + 4))
  {
    -[ICAppleMusicAPITokenRequest setClientVersion:](self, "setClientVersion:");
    NSUInteger v4 = v6;
  }

  if (*((void *)v4 + 1))
  {
    -[ICAppleMusicAPITokenRequest setBagProfile:](self, "setBagProfile:");
    NSUInteger v4 = v6;
  }

  if (*((void *)v4 + 2))
  {
    -[ICAppleMusicAPITokenRequest setBagProfileVersion:](self, "setBagProfileVersion:");
    NSUInteger v4 = v6;
  }

  BOOL v5 = v4[44];
  if ((v5 & 2) != 0)
  {
    self->_shouldIgnoreUserTokenCache = v4[41];
    *(_BYTE *)&self->_has |= 2u;
    BOOL v5 = v4[44];
  }

  if (v5)
  {
    self->_shouldIgnoreDeveloperTokenCache = v4[40];
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (void)setClientVersion:(id)a3
{
}

- (NSString)bagProfile
{
  return self->_bagProfile;
}

- (void)setBagProfile:(id)a3
{
}

- (NSString)bagProfileVersion
{
  return self->_bagProfileVersion;
}

- (void)setBagProfileVersion:(id)a3
{
}

- (BOOL)shouldIgnoreUserTokenCache
{
  return self->_shouldIgnoreUserTokenCache;
}

- (BOOL)shouldIgnoreDeveloperTokenCache
{
  return self->_shouldIgnoreDeveloperTokenCache;
}

- (void).cxx_destruct
{
}

@end