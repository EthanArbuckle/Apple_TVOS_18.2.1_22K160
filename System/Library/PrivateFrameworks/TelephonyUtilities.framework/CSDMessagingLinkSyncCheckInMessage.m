@interface CSDMessagingLinkSyncCheckInMessage
+ (Class)generateDescriptorInfosType;
+ (Class)generatorDescriptorsType;
- (BOOL)hasShouldCheckAllGenerators;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldCheckAllGenerators;
- (NSMutableArray)generateDescriptorInfos;
- (NSMutableArray)generatorDescriptors;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)generateDescriptorInfosAtIndex:(unint64_t)a3;
- (id)generatorDescriptorsAtIndex:(unint64_t)a3;
- (unint64_t)generateDescriptorInfosCount;
- (unint64_t)generatorDescriptorsCount;
- (unint64_t)hash;
- (unsigned)version;
- (void)addGenerateDescriptorInfos:(id)a3;
- (void)addGeneratorDescriptors:(id)a3;
- (void)clearGenerateDescriptorInfos;
- (void)clearGeneratorDescriptors;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGenerateDescriptorInfos:(id)a3;
- (void)setGeneratorDescriptors:(id)a3;
- (void)setHasShouldCheckAllGenerators:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setShouldCheckAllGenerators:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingLinkSyncCheckInMessage

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

- (void)setShouldCheckAllGenerators:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_shouldCheckAllGenerators = a3;
}

- (void)setHasShouldCheckAllGenerators:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShouldCheckAllGenerators
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearGeneratorDescriptors
{
}

- (void)addGeneratorDescriptors:(id)a3
{
  id v4 = a3;
  generatorDescriptors = self->_generatorDescriptors;
  id v8 = v4;
  if (!generatorDescriptors)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_generatorDescriptors;
    self->_generatorDescriptors = v6;

    id v4 = v8;
    generatorDescriptors = self->_generatorDescriptors;
  }

  -[NSMutableArray addObject:](generatorDescriptors, "addObject:", v4);
}

- (unint64_t)generatorDescriptorsCount
{
  return (unint64_t)-[NSMutableArray count](self->_generatorDescriptors, "count");
}

- (id)generatorDescriptorsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_generatorDescriptors, "objectAtIndex:", a3);
}

+ (Class)generatorDescriptorsType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingConversationLinkGeneratorDescriptor, a2);
}

- (void)clearGenerateDescriptorInfos
{
}

- (void)addGenerateDescriptorInfos:(id)a3
{
  id v4 = a3;
  generateDescriptorInfos = self->_generateDescriptorInfos;
  id v8 = v4;
  if (!generateDescriptorInfos)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_generateDescriptorInfos;
    self->_generateDescriptorInfos = v6;

    id v4 = v8;
    generateDescriptorInfos = self->_generateDescriptorInfos;
  }

  -[NSMutableArray addObject:](generateDescriptorInfos, "addObject:", v4);
}

- (unint64_t)generateDescriptorInfosCount
{
  return (unint64_t)-[NSMutableArray count](self->_generateDescriptorInfos, "count");
}

- (id)generateDescriptorInfosAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_generateDescriptorInfos, "objectAtIndex:", a3);
}

+ (Class)generateDescriptorInfosType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingLinkSyncCheckInGeneratorDescriptorInfo, a2);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingLinkSyncCheckInMessage;
  id v3 = -[CSDMessagingLinkSyncCheckInMessage description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingLinkSyncCheckInMessage dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v5 forKey:@"version"];

    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_shouldCheckAllGenerators));
    [v3 setObject:v6 forKey:@"shouldCheckAllGenerators"];
  }

  if (-[NSMutableArray count](self->_generatorDescriptors, "count"))
  {
    v7 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_generatorDescriptors, "count"));
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    objc_super v8 = self->_generatorDescriptors;
    id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v26,  v31,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v26 + 1) + 8 * (void)i) dictionaryRepresentation]);
          -[NSMutableArray addObject:](v7, "addObject:", v13);
        }

        id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v26,  v31,  16LL);
      }

      while (v10);
    }

    [v3 setObject:v7 forKey:@"generatorDescriptors"];
  }

  if (-[NSMutableArray count](self->_generateDescriptorInfos, "count"))
  {
    v14 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_generateDescriptorInfos, "count"));
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    v15 = self->_generateDescriptorInfos;
    id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v22,  v30,  16LL);
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (j = 0LL; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v22 + 1) + 8 * (void)j),  "dictionaryRepresentation",  (void)v22));
          -[NSMutableArray addObject:](v14, "addObject:", v20);
        }

        id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v22,  v30,  16LL);
      }

      while (v17);
    }

    [v3 setObject:v14 forKey:@"generateDescriptorInfos"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100182C28((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
    char has = (char)self->_has;
  }

  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField(v5, self->_shouldCheckAllGenerators, 2LL);
  }
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v7 = self->_generatorDescriptors;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v21,  v26,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v21 + 1) + 8LL * (void)i), 3LL);
      }

      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v21,  v26,  16LL);
    }

    while (v9);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v12 = self->_generateDescriptorInfos;
  id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v17,  v25,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (j = 0LL; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v17 + 1) + 8LL * (void)j), 4LL);
      }

      id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v17,  v25,  16LL);
    }

    while (v14);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[6] = self->_version;
    *((_BYTE *)v4 + 32) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 28) = self->_shouldCheckAllGenerators;
    *((_BYTE *)v4 + 32) |= 2u;
  }

  id v14 = v4;
  if (-[CSDMessagingLinkSyncCheckInMessage generatorDescriptorsCount](self, "generatorDescriptorsCount"))
  {
    [v14 clearGeneratorDescriptors];
    unint64_t v6 = -[CSDMessagingLinkSyncCheckInMessage generatorDescriptorsCount](self, "generatorDescriptorsCount");
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingLinkSyncCheckInMessage generatorDescriptorsAtIndex:]( self,  "generatorDescriptorsAtIndex:",  i));
        [v14 addGeneratorDescriptors:v9];
      }
    }
  }

  if (-[CSDMessagingLinkSyncCheckInMessage generateDescriptorInfosCount](self, "generateDescriptorInfosCount"))
  {
    [v14 clearGenerateDescriptorInfos];
    unint64_t v10 = -[CSDMessagingLinkSyncCheckInMessage generateDescriptorInfosCount](self, "generateDescriptorInfosCount");
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0LL; j != v11; ++j)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingLinkSyncCheckInMessage generateDescriptorInfosAtIndex:]( self,  "generateDescriptorInfosAtIndex:",  j));
        [v14 addGenerateDescriptorInfos:v13];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_version;
    *((_BYTE *)v5 + 32) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 2) != 0)
  {
    *((_BYTE *)v5 + 28) = self->_shouldCheckAllGenerators;
    *((_BYTE *)v5 + 32) |= 2u;
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v8 = self->_generatorDescriptors;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0LL; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)i) copyWithZone:a3];
        [v6 addGeneratorDescriptors:v13];
      }

      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
    }

    while (v10);
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v14 = self->_generateDescriptorInfos;
  id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t j = 0LL; j != v16; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)j), "copyWithZone:", a3, (void)v21);
        [v6 addGenerateDescriptorInfos:v19];
      }

      id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
    }

    while (v16);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }

  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_19;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) != 0)
    {
      if (self->_shouldCheckAllGenerators)
      {
        if (!*((_BYTE *)v4 + 28)) {
          goto LABEL_19;
        }
        goto LABEL_15;
      }

      if (!*((_BYTE *)v4 + 28)) {
        goto LABEL_15;
      }
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t v3 = 2654435761LL * self->_version;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0LL;
    goto LABEL_6;
  }

  uint64_t v3 = 0LL;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761LL * self->_shouldCheckAllGenerators;
LABEL_6:
  unint64_t v5 = v4 ^ v3 ^ (unint64_t)-[NSMutableArray hash](self->_generatorDescriptors, "hash");
  return v5 ^ (unint64_t)-[NSMutableArray hash](self->_generateDescriptorInfos, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (id *)v4;
  char v6 = *((_BYTE *)v4 + 32);
  if ((v6 & 1) != 0)
  {
    self->_version = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
    char v6 = *((_BYTE *)v4 + 32);
  }

  if ((v6 & 2) != 0)
  {
    self->_shouldCheckAllGenerators = *((_BYTE *)v4 + 28);
    *(_BYTE *)&self->_has |= 2u;
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v7 = *((id *)v4 + 2);
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        -[CSDMessagingLinkSyncCheckInMessage addGeneratorDescriptors:]( self,  "addGeneratorDescriptors:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)i));
      }

      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }

    while (v9);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v12 = v5[1];
  id v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0LL; j != v14; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[CSDMessagingLinkSyncCheckInMessage addGenerateDescriptorInfos:]( self,  "addGenerateDescriptorInfos:",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)j),  (void)v17);
      }

      id v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }

    while (v14);
  }
}

- (unsigned)version
{
  return self->_version;
}

- (BOOL)shouldCheckAllGenerators
{
  return self->_shouldCheckAllGenerators;
}

- (NSMutableArray)generatorDescriptors
{
  return self->_generatorDescriptors;
}

- (void)setGeneratorDescriptors:(id)a3
{
}

- (NSMutableArray)generateDescriptorInfos
{
  return self->_generateDescriptorInfos;
}

- (void)setGenerateDescriptorInfos:(id)a3
{
}

- (void).cxx_destruct
{
}

@end