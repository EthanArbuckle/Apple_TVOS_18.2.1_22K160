@interface IDSProtoKeyTransparencyTrustedDevice
+ (Class)trustedServicesType;
- (BOOL)hasBuildVersion;
- (BOOL)hasProductName;
- (BOOL)hasPushToken;
- (BOOL)hasTransparencyVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)pushToken;
- (NSMutableArray)trustedServices;
- (NSString)buildVersion;
- (NSString)productName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)trustedServicesAtIndex:(unint64_t)a3;
- (int64_t)transparencyVersion;
- (unint64_t)hash;
- (unint64_t)trustedServicesCount;
- (void)addTrustedServices:(id)a3;
- (void)clearTrustedServices;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setHasTransparencyVersion:(BOOL)a3;
- (void)setProductName:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setTransparencyVersion:(int64_t)a3;
- (void)setTrustedServices:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSProtoKeyTransparencyTrustedDevice

- (BOOL)hasPushToken
{
  return self->_pushToken != 0LL;
}

- (void)clearTrustedServices
{
}

- (void)addTrustedServices:(id)a3
{
  id v4 = a3;
  trustedServices = self->_trustedServices;
  id v8 = v4;
  if (!trustedServices)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_trustedServices;
    self->_trustedServices = v6;

    id v4 = v8;
    trustedServices = self->_trustedServices;
  }

  -[NSMutableArray addObject:](trustedServices, "addObject:", v4);
}

- (unint64_t)trustedServicesCount
{
  return (unint64_t)-[NSMutableArray count](self->_trustedServices, "count");
}

- (id)trustedServicesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_trustedServices, "objectAtIndex:", a3);
}

+ (Class)trustedServicesType
{
  return (Class)objc_opt_class(&OBJC_CLASS___IDSProtoKeyTransparencyTrustedService, a2);
}

- (BOOL)hasBuildVersion
{
  return self->_buildVersion != 0LL;
}

- (BOOL)hasProductName
{
  return self->_productName != 0LL;
}

- (void)setTransparencyVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_transparencyVersion = a3;
}

- (void)setHasTransparencyVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTransparencyVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSProtoKeyTransparencyTrustedDevice;
  id v3 = -[IDSProtoKeyTransparencyTrustedDevice description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProtoKeyTransparencyTrustedDevice dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = v3;
  pushToken = self->_pushToken;
  if (pushToken) {
    [v3 setObject:pushToken forKey:@"push_token"];
  }
  if (-[NSMutableArray count](self->_trustedServices, "count"))
  {
    v6 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_trustedServices, "count"));
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    v7 = self->_trustedServices;
    id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v17 + 1) + 8 * (void)i),  "dictionaryRepresentation",  (void)v17));
          -[NSMutableArray addObject:](v6, "addObject:", v12);
        }

        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      }

      while (v9);
    }

    [v4 setObject:v6 forKey:@"trusted_services"];
  }

  buildVersion = self->_buildVersion;
  if (buildVersion) {
    [v4 setObject:buildVersion forKey:@"buildVersion"];
  }
  productName = self->_productName;
  if (productName) {
    [v4 setObject:productName forKey:@"productName"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  self->_transparencyVersion));
    [v4 setObject:v15 forKey:@"transparencyVersion"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return IDSProtoKeyTransparencyTrustedDeviceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  pushToken = self->_pushToken;
  if (pushToken) {
    PBDataWriterWriteDataField(v4, pushToken, 1LL);
  }
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v7 = self->_trustedServices;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v14 + 1) + 8LL * (void)v11), 2LL);
        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v9);
  }

  buildVersion = self->_buildVersion;
  if (buildVersion) {
    PBDataWriterWriteStringField(v5, buildVersion, 3LL);
  }
  productName = self->_productName;
  if (productName) {
    PBDataWriterWriteStringField(v5, productName, 4LL);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteInt64Field(v5, self->_transparencyVersion, 5LL);
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_pushToken) {
    objc_msgSend(v9, "setPushToken:");
  }
  if (-[IDSProtoKeyTransparencyTrustedDevice trustedServicesCount](self, "trustedServicesCount"))
  {
    [v9 clearTrustedServices];
    unint64_t v4 = -[IDSProtoKeyTransparencyTrustedDevice trustedServicesCount](self, "trustedServicesCount");
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue( -[IDSProtoKeyTransparencyTrustedDevice trustedServicesAtIndex:]( self,  "trustedServicesAtIndex:",  i));
        [v9 addTrustedServices:v7];
      }
    }
  }

  if (self->_buildVersion) {
    objc_msgSend(v9, "setBuildVersion:");
  }
  id v8 = v9;
  if (self->_productName)
  {
    objc_msgSend(v9, "setProductName:");
    id v8 = v9;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8[1] = self->_transparencyVersion;
    *((_BYTE *)v8 + 48) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSData copyWithZone:](self->_pushToken, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = self->_trustedServices;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v12), "copyWithZone:", a3, (void)v19);
        [v5 addTrustedServices:v13];

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    }

    while (v10);
  }

  id v14 = -[NSString copyWithZone:](self->_buildVersion, "copyWithZone:", a3);
  __int128 v15 = (void *)v5[2];
  v5[2] = v14;

  id v16 = -[NSString copyWithZone:](self->_productName, "copyWithZone:", a3);
  __int128 v17 = (void *)v5[3];
  v5[3] = v16;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_transparencyVersion;
    *((_BYTE *)v5 + 48) |= 1u;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  pushToken = self->_pushToken;
  if ((unint64_t)pushToken | *((void *)v4 + 4))
  {
  }

  trustedServices = self->_trustedServices;
  if ((unint64_t)trustedServices | *((void *)v4 + 5))
  {
  }

  buildVersion = self->_buildVersion;
  if ((unint64_t)buildVersion | *((void *)v4 + 2))
  {
  }

  productName = self->_productName;
  if ((unint64_t)productName | *((void *)v4 + 3))
  {
  }

  BOOL v10 = (*((_BYTE *)v4 + 48) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) != 0 && self->_transparencyVersion == *((void *)v4 + 1))
    {
      BOOL v10 = 1;
      goto LABEL_15;
    }

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[NSData hash](self->_pushToken, "hash");
  unint64_t v4 = (unint64_t)-[NSMutableArray hash](self->_trustedServices, "hash");
  NSUInteger v5 = -[NSString hash](self->_buildVersion, "hash");
  NSUInteger v6 = -[NSString hash](self->_productName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v7 = 2654435761LL * self->_transparencyVersion;
  }
  else {
    uint64_t v7 = 0LL;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[IDSProtoKeyTransparencyTrustedDevice setPushToken:](self, "setPushToken:");
  }
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v5 = *((id *)v4 + 5);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[IDSProtoKeyTransparencyTrustedDevice addTrustedServices:]( self,  "addTrustedServices:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)i),  (void)v10);
      }

      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }

  if (*((void *)v4 + 2)) {
    -[IDSProtoKeyTransparencyTrustedDevice setBuildVersion:](self, "setBuildVersion:");
  }
  if (*((void *)v4 + 3)) {
    -[IDSProtoKeyTransparencyTrustedDevice setProductName:](self, "setProductName:");
  }
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_transparencyVersion = *((void *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSMutableArray)trustedServices
{
  return self->_trustedServices;
}

- (void)setTrustedServices:(id)a3
{
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (NSString)productName
{
  return self->_productName;
}

- (void)setProductName:(id)a3
{
}

- (int64_t)transparencyVersion
{
  return self->_transparencyVersion;
}

- (void).cxx_destruct
{
}

@end