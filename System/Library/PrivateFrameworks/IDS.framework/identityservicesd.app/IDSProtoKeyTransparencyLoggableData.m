@interface IDSProtoKeyTransparencyLoggableData
+ (Class)applicationPublicIdentityType;
- (BOOL)hasKtVersion;
- (BOOL)hasNgmPublicIdentity;
- (BOOL)hasNgmVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)ngmPublicIdentity;
- (NSMutableArray)applicationPublicIdentitys;
- (id)applicationPublicIdentityAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)applicationPublicIdentitysCount;
- (unint64_t)hash;
- (unsigned)ktVersion;
- (unsigned)ngmVersion;
- (void)addApplicationPublicIdentity:(id)a3;
- (void)clearApplicationPublicIdentitys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApplicationPublicIdentitys:(id)a3;
- (void)setHasKtVersion:(BOOL)a3;
- (void)setHasNgmVersion:(BOOL)a3;
- (void)setKtVersion:(unsigned int)a3;
- (void)setNgmPublicIdentity:(id)a3;
- (void)setNgmVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSProtoKeyTransparencyLoggableData

- (BOOL)hasNgmPublicIdentity
{
  return self->_ngmPublicIdentity != 0LL;
}

- (void)setNgmVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_ngmVersion = a3;
}

- (void)setHasNgmVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNgmVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setKtVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ktVersion = a3;
}

- (void)setHasKtVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKtVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearApplicationPublicIdentitys
{
}

- (void)addApplicationPublicIdentity:(id)a3
{
  id v4 = a3;
  applicationPublicIdentitys = self->_applicationPublicIdentitys;
  id v8 = v4;
  if (!applicationPublicIdentitys)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_applicationPublicIdentitys;
    self->_applicationPublicIdentitys = v6;

    id v4 = v8;
    applicationPublicIdentitys = self->_applicationPublicIdentitys;
  }

  -[NSMutableArray addObject:](applicationPublicIdentitys, "addObject:", v4);
}

- (unint64_t)applicationPublicIdentitysCount
{
  return (unint64_t)-[NSMutableArray count](self->_applicationPublicIdentitys, "count");
}

- (id)applicationPublicIdentityAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_applicationPublicIdentitys, "objectAtIndex:", a3);
}

+ (Class)applicationPublicIdentityType
{
  return (Class)objc_opt_class(&OBJC_CLASS___IDSProtoApplicationKeyEntry, a2);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSProtoKeyTransparencyLoggableData;
  id v3 = -[IDSProtoKeyTransparencyLoggableData description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProtoKeyTransparencyLoggableData dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = v3;
  ngmPublicIdentity = self->_ngmPublicIdentity;
  if (ngmPublicIdentity) {
    [v3 setObject:ngmPublicIdentity forKey:@"ngm_public_identity"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_ngmVersion));
    [v4 setObject:v7 forKey:@"ngm_version"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_ktVersion));
    [v4 setObject:v8 forKey:@"kt_version"];
  }

  if (-[NSMutableArray count](self->_applicationPublicIdentitys, "count"))
  {
    v9 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_applicationPublicIdentitys, "count"));
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    v10 = self->_applicationPublicIdentitys;
    id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v17 + 1) + 8 * (void)i),  "dictionaryRepresentation",  (void)v17));
          -[NSMutableArray addObject:](v9, "addObject:", v15);
        }

        id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      }

      while (v12);
    }

    [v4 setObject:v9 forKey:@"application_public_identity"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return IDSProtoKeyTransparencyLoggableDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  ngmPublicIdentity = self->_ngmPublicIdentity;
  if (ngmPublicIdentity) {
    PBDataWriterWriteDataField(v4, ngmPublicIdentity, 1LL);
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_ngmVersion, 2LL);
    char has = (char)self->_has;
  }

  if ((has & 1) != 0) {
    PBDataWriterWriteUint32Field(v5, self->_ktVersion, 3LL);
  }
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  objc_super v8 = self->_applicationPublicIdentitys;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v13 + 1) + 8LL * (void)i), 4LL);
      }

      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v10);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_ngmPublicIdentity)
  {
    objc_msgSend(v4, "setNgmPublicIdentity:");
    id v4 = v10;
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_ngmVersion;
    *((_BYTE *)v4 + 36) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_ktVersion;
    *((_BYTE *)v4 + 36) |= 1u;
  }

  if (-[IDSProtoKeyTransparencyLoggableData applicationPublicIdentitysCount](self, "applicationPublicIdentitysCount"))
  {
    [v10 clearApplicationPublicIdentitys];
    unint64_t v6 = -[IDSProtoKeyTransparencyLoggableData applicationPublicIdentitysCount](self, "applicationPublicIdentitysCount");
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSProtoKeyTransparencyLoggableData applicationPublicIdentityAtIndex:]( self,  "applicationPublicIdentityAtIndex:",  i));
        [v10 addApplicationPublicIdentity:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSData copyWithZone:](self->_ngmPublicIdentity, "copyWithZone:", a3);
  unint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_ngmVersion;
    *((_BYTE *)v5 + 36) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_ktVersion;
    *((_BYTE *)v5 + 36) |= 1u;
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v9 = self->_applicationPublicIdentitys;
  id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)i), "copyWithZone:", a3, (void)v16);
        [v5 addApplicationPublicIdentity:v14];
      }

      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v11);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  ngmPublicIdentity = self->_ngmPublicIdentity;
  if ((unint64_t)ngmPublicIdentity | *((void *)v4 + 3))
  {
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_ngmVersion != *((_DWORD *)v4 + 8)) {
      goto LABEL_16;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
LABEL_16:
    unsigned __int8 v8 = 0;
    goto LABEL_17;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_ktVersion != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_16;
  }

  applicationPublicIdentitys = self->_applicationPublicIdentitys;
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_17:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[NSData hash](self->_ngmPublicIdentity, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761LL * self->_ngmVersion;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0LL;
    return v4 ^ v3 ^ v5 ^ (unint64_t)-[NSMutableArray hash](self->_applicationPublicIdentitys, "hash");
  }

  uint64_t v4 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761LL * self->_ktVersion;
  return v4 ^ v3 ^ v5 ^ (unint64_t)-[NSMutableArray hash](self->_applicationPublicIdentitys, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[IDSProtoKeyTransparencyLoggableData setNgmPublicIdentity:](self, "setNgmPublicIdentity:");
  }
  char v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_ngmVersion = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 36);
  }

  if ((v5 & 1) != 0)
  {
    self->_ktVersion = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v6 = *((id *)v4 + 1);
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[IDSProtoKeyTransparencyLoggableData addApplicationPublicIdentity:]( self,  "addApplicationPublicIdentity:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)i),  (void)v11);
      }

      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (NSData)ngmPublicIdentity
{
  return self->_ngmPublicIdentity;
}

- (void)setNgmPublicIdentity:(id)a3
{
}

- (unsigned)ngmVersion
{
  return self->_ngmVersion;
}

- (unsigned)ktVersion
{
  return self->_ktVersion;
}

- (NSMutableArray)applicationPublicIdentitys
{
  return self->_applicationPublicIdentitys;
}

- (void)setApplicationPublicIdentitys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end