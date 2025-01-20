@interface IDSProtoKeyTransparencyTrustedService
+ (Class)urisType;
- (BOOL)hasDeviceSignature;
- (BOOL)hasKeyIndex;
- (BOOL)hasKtLoggableData;
- (BOOL)hasServiceIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IDSProtoKeyTransparencyLoggableData)ktLoggableData;
- (NSData)deviceSignature;
- (NSMutableArray)uris;
- (NSString)serviceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keyIndexAsString:(int)a3;
- (id)urisAtIndex:(unint64_t)a3;
- (int)StringAsKeyIndex:(id)a3;
- (int)keyIndex;
- (unint64_t)hash;
- (unint64_t)urisCount;
- (void)addUris:(id)a3;
- (void)clearUris;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceSignature:(id)a3;
- (void)setHasKeyIndex:(BOOL)a3;
- (void)setKeyIndex:(int)a3;
- (void)setKtLoggableData:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setUris:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSProtoKeyTransparencyTrustedService

- (BOOL)hasServiceIdentifier
{
  return self->_serviceIdentifier != 0LL;
}

- (void)clearUris
{
}

- (void)addUris:(id)a3
{
  id v4 = a3;
  uris = self->_uris;
  id v8 = v4;
  if (!uris)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_uris;
    self->_uris = v6;

    id v4 = v8;
    uris = self->_uris;
  }

  -[NSMutableArray addObject:](uris, "addObject:", v4);
}

- (unint64_t)urisCount
{
  return (unint64_t)-[NSMutableArray count](self->_uris, "count");
}

- (id)urisAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_uris, "objectAtIndex:", a3);
}

+ (Class)urisType
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSString, a2);
}

- (BOOL)hasKtLoggableData
{
  return self->_ktLoggableData != 0LL;
}

- (BOOL)hasDeviceSignature
{
  return self->_deviceSignature != 0LL;
}

- (int)keyIndex
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_keyIndex;
  }
  else {
    return 0;
  }
}

- (void)setKeyIndex:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_keyIndex = a3;
}

- (void)setHasKeyIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKeyIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)keyIndexAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return *(&off_1009001D0 + a3);
  }
}

- (int)StringAsKeyIndex:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"iMessage"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"FaceTime"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"Multiplex"])
  {
    int v4 = 3;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSProtoKeyTransparencyTrustedService;
  id v3 = -[IDSProtoKeyTransparencyTrustedService description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProtoKeyTransparencyTrustedService dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v4 = v3;
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier) {
    [v3 setObject:serviceIdentifier forKey:@"service_identifier"];
  }
  uris = self->_uris;
  if (uris) {
    [v4 setObject:uris forKey:@"uris"];
  }
  ktLoggableData = self->_ktLoggableData;
  if (ktLoggableData)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( -[IDSProtoKeyTransparencyLoggableData dictionaryRepresentation]( ktLoggableData,  "dictionaryRepresentation"));
    [v4 setObject:v8 forKey:@"kt_loggable_data"];
  }

  deviceSignature = self->_deviceSignature;
  if (deviceSignature) {
    [v4 setObject:deviceSignature forKey:@"device_signature"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t keyIndex = self->_keyIndex;
    if (keyIndex >= 4) {
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_keyIndex));
    }
    else {
      v11 = *(&off_1009001D0 + keyIndex);
    }
    [v4 setObject:v11 forKey:@"key_index"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return IDSProtoKeyTransparencyTrustedServiceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier) {
    PBDataWriterWriteStringField(v4, serviceIdentifier, 1LL);
  }
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v7 = self->_uris;
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
        PBDataWriterWriteStringField(v5, *(void *)(*((void *)&v14 + 1) + 8LL * (void)v11), 2LL);
        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v9);
  }

  ktLoggableData = self->_ktLoggableData;
  if (ktLoggableData) {
    PBDataWriterWriteSubmessage(v5, ktLoggableData, 3LL);
  }
  deviceSignature = self->_deviceSignature;
  if (deviceSignature) {
    PBDataWriterWriteDataField(v5, deviceSignature, 4LL);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteInt32Field(v5, self->_keyIndex, 5LL);
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_serviceIdentifier) {
    objc_msgSend(v9, "setServiceIdentifier:");
  }
  if (-[IDSProtoKeyTransparencyTrustedService urisCount](self, "urisCount"))
  {
    [v9 clearUris];
    unint64_t v4 = -[IDSProtoKeyTransparencyTrustedService urisCount](self, "urisCount");
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProtoKeyTransparencyTrustedService urisAtIndex:](self, "urisAtIndex:", i));
        [v9 addUris:v7];
      }
    }
  }

  if (self->_ktLoggableData) {
    objc_msgSend(v9, "setKtLoggableData:");
  }
  id v8 = v9;
  if (self->_deviceSignature)
  {
    objc_msgSend(v9, "setDeviceSignature:");
    id v8 = v9;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8[4] = self->_keyIndex;
    *((_BYTE *)v8 + 48) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_serviceIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = self->_uris;
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
        [v5 addUris:v13];

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    }

    while (v10);
  }

  id v14 = -[IDSProtoKeyTransparencyLoggableData copyWithZone:](self->_ktLoggableData, "copyWithZone:", a3);
  __int128 v15 = (void *)v5[3];
  v5[3] = v14;

  id v16 = -[NSData copyWithZone:](self->_deviceSignature, "copyWithZone:", a3);
  __int128 v17 = (void *)v5[1];
  v5[1] = v16;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_keyIndex;
    *((_BYTE *)v5 + 48) |= 1u;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  serviceIdentifier = self->_serviceIdentifier;
  if ((unint64_t)serviceIdentifier | *((void *)v4 + 4))
  {
  }

  uris = self->_uris;
  if ((unint64_t)uris | *((void *)v4 + 5))
  {
  }

  ktLoggableData = self->_ktLoggableData;
  if ((unint64_t)ktLoggableData | *((void *)v4 + 3))
  {
    if (!-[IDSProtoKeyTransparencyLoggableData isEqual:](ktLoggableData, "isEqual:")) {
      goto LABEL_14;
    }
  }

  deviceSignature = self->_deviceSignature;
  if ((unint64_t)deviceSignature | *((void *)v4 + 1))
  {
  }

  BOOL v10 = (*((_BYTE *)v4 + 48) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) != 0 && self->_keyIndex == *((_DWORD *)v4 + 4))
    {
      BOOL v10 = 1;
      goto LABEL_15;
    }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_serviceIdentifier, "hash");
  unint64_t v4 = (unint64_t)-[NSMutableArray hash](self->_uris, "hash");
  unint64_t v5 = -[IDSProtoKeyTransparencyLoggableData hash](self->_ktLoggableData, "hash");
  unint64_t v6 = (unint64_t)-[NSData hash](self->_deviceSignature, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v7 = 2654435761LL * self->_keyIndex;
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
    -[IDSProtoKeyTransparencyTrustedService setServiceIdentifier:](self, "setServiceIdentifier:");
  }
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = *((id *)v4 + 5);
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[IDSProtoKeyTransparencyTrustedService addUris:]( self,  "addUris:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)i),  (void)v12);
      }

      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  ktLoggableData = self->_ktLoggableData;
  uint64_t v11 = *((void *)v4 + 3);
  if (ktLoggableData)
  {
    if (v11) {
      -[IDSProtoKeyTransparencyLoggableData mergeFrom:](ktLoggableData, "mergeFrom:");
    }
  }

  else if (v11)
  {
    -[IDSProtoKeyTransparencyTrustedService setKtLoggableData:](self, "setKtLoggableData:");
  }

  if (*((void *)v4 + 1)) {
    -[IDSProtoKeyTransparencyTrustedService setDeviceSignature:](self, "setDeviceSignature:");
  }
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_uint64_t keyIndex = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (NSMutableArray)uris
{
  return self->_uris;
}

- (void)setUris:(id)a3
{
}

- (IDSProtoKeyTransparencyLoggableData)ktLoggableData
{
  return self->_ktLoggableData;
}

- (void)setKtLoggableData:(id)a3
{
}

- (NSData)deviceSignature
{
  return self->_deviceSignature;
}

- (void)setDeviceSignature:(id)a3
{
}

- (void).cxx_destruct
{
}

@end