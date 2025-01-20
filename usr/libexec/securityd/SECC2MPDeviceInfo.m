@interface SECC2MPDeviceInfo
+ (Class)internalTestConfigType;
- (BOOL)hasIsAppleInternal;
- (BOOL)hasProcessName;
- (BOOL)hasProcessUuid;
- (BOOL)hasProcessVersion;
- (BOOL)hasProductBuild;
- (BOOL)hasProductName;
- (BOOL)hasProductType;
- (BOOL)hasProductVersion;
- (BOOL)hasUserDefaultTestName;
- (BOOL)isAppleInternal;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)internalTestConfigs;
- (NSString)processName;
- (NSString)processUuid;
- (NSString)processVersion;
- (NSString)productBuild;
- (NSString)productName;
- (NSString)productType;
- (NSString)productVersion;
- (NSString)userDefaultTestName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)internalTestConfigAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)internalTestConfigsCount;
- (void)addInternalTestConfig:(id)a3;
- (void)clearInternalTestConfigs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsAppleInternal:(BOOL)a3;
- (void)setInternalTestConfigs:(id)a3;
- (void)setIsAppleInternal:(BOOL)a3;
- (void)setProcessName:(id)a3;
- (void)setProcessUuid:(id)a3;
- (void)setProcessVersion:(id)a3;
- (void)setProductBuild:(id)a3;
- (void)setProductName:(id)a3;
- (void)setProductType:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setUserDefaultTestName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECC2MPDeviceInfo

- (BOOL)hasProductName
{
  return self->_productName != 0LL;
}

- (BOOL)hasProductType
{
  return self->_productType != 0LL;
}

- (BOOL)hasProductVersion
{
  return self->_productVersion != 0LL;
}

- (BOOL)hasProductBuild
{
  return self->_productBuild != 0LL;
}

- (void)setIsAppleInternal:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isAppleInternal = a3;
}

- (void)setHasIsAppleInternal:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsAppleInternal
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasProcessName
{
  return self->_processName != 0LL;
}

- (BOOL)hasProcessVersion
{
  return self->_processVersion != 0LL;
}

- (BOOL)hasProcessUuid
{
  return self->_processUuid != 0LL;
}

- (BOOL)hasUserDefaultTestName
{
  return self->_userDefaultTestName != 0LL;
}

- (void)clearInternalTestConfigs
{
}

- (void)addInternalTestConfig:(id)a3
{
  id v4 = a3;
  internalTestConfigs = self->_internalTestConfigs;
  id v8 = v4;
  if (!internalTestConfigs)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_internalTestConfigs;
    self->_internalTestConfigs = v6;

    id v4 = v8;
    internalTestConfigs = self->_internalTestConfigs;
  }

  -[NSMutableArray addObject:](internalTestConfigs, "addObject:", v4);
}

- (unint64_t)internalTestConfigsCount
{
  return (unint64_t)-[NSMutableArray count](self->_internalTestConfigs, "count");
}

- (id)internalTestConfigAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_internalTestConfigs, "objectAtIndex:", a3);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SECC2MPDeviceInfo;
  id v3 = -[SECC2MPDeviceInfo description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPDeviceInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = v3;
  productName = self->_productName;
  if (productName) {
    [v3 setObject:productName forKey:@"product_name"];
  }
  productType = self->_productType;
  if (productType) {
    [v4 setObject:productType forKey:@"product_type"];
  }
  productVersion = self->_productVersion;
  if (productVersion) {
    [v4 setObject:productVersion forKey:@"product_version"];
  }
  productBuild = self->_productBuild;
  if (productBuild) {
    [v4 setObject:productBuild forKey:@"product_build"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isAppleInternal));
    [v4 setObject:v9 forKey:@"is_apple_internal"];
  }

  processName = self->_processName;
  if (processName) {
    [v4 setObject:processName forKey:@"process_name"];
  }
  processVersion = self->_processVersion;
  if (processVersion) {
    [v4 setObject:processVersion forKey:@"process_version"];
  }
  processUuid = self->_processUuid;
  if (processUuid) {
    [v4 setObject:processUuid forKey:@"process_uuid"];
  }
  userDefaultTestName = self->_userDefaultTestName;
  if (userDefaultTestName) {
    [v4 setObject:userDefaultTestName forKey:@"user_default_test_name"];
  }
  if (-[NSMutableArray count](self->_internalTestConfigs, "count"))
  {
    v14 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_internalTestConfigs, "count"));
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    v15 = self->_internalTestConfigs;
    id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v22 + 1) + 8 * (void)i),  "dictionaryRepresentation",  (void)v22));
          -[NSMutableArray addObject:](v14, "addObject:", v20);
        }

        id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
      }

      while (v17);
    }

    [v4 setObject:v14 forKey:@"internal_test_config"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10017B2FC(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  productName = self->_productName;
  if (productName) {
    PBDataWriterWriteStringField(v4, productName, 101LL);
  }
  productType = self->_productType;
  if (productType) {
    PBDataWriterWriteStringField(v5, productType, 102LL);
  }
  productVersion = self->_productVersion;
  if (productVersion) {
    PBDataWriterWriteStringField(v5, productVersion, 103LL);
  }
  productBuild = self->_productBuild;
  if (productBuild) {
    PBDataWriterWriteStringField(v5, productBuild, 104LL);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteBOOLField(v5, self->_isAppleInternal, 105LL);
  }
  processName = self->_processName;
  if (processName) {
    PBDataWriterWriteStringField(v5, processName, 201LL);
  }
  processVersion = self->_processVersion;
  if (processVersion) {
    PBDataWriterWriteStringField(v5, processVersion, 202LL);
  }
  processUuid = self->_processUuid;
  if (processUuid) {
    PBDataWriterWriteStringField(v5, processUuid, 203LL);
  }
  userDefaultTestName = self->_userDefaultTestName;
  if (userDefaultTestName) {
    PBDataWriterWriteStringField(v5, userDefaultTestName, 301LL);
  }
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v14 = self->_internalTestConfigs;
  id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0LL;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v19 + 1) + 8LL * (void)v18), 302LL);
        uint64_t v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    }

    while (v16);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v9 = v4;
  if (self->_productName)
  {
    objc_msgSend(v4, "setProductName:");
    id v4 = v9;
  }

  if (self->_productType)
  {
    objc_msgSend(v9, "setProductType:");
    id v4 = v9;
  }

  if (self->_productVersion)
  {
    objc_msgSend(v9, "setProductVersion:");
    id v4 = v9;
  }

  if (self->_productBuild)
  {
    objc_msgSend(v9, "setProductBuild:");
    id v4 = v9;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[80] = self->_isAppleInternal;
    v4[84] |= 1u;
  }

  if (self->_processName) {
    objc_msgSend(v9, "setProcessName:");
  }
  if (self->_processVersion) {
    objc_msgSend(v9, "setProcessVersion:");
  }
  if (self->_processUuid) {
    objc_msgSend(v9, "setProcessUuid:");
  }
  if (self->_userDefaultTestName) {
    objc_msgSend(v9, "setUserDefaultTestName:");
  }
  if (-[SECC2MPDeviceInfo internalTestConfigsCount](self, "internalTestConfigsCount"))
  {
    [v9 clearInternalTestConfigs];
    unint64_t v5 = -[SECC2MPDeviceInfo internalTestConfigsCount](self, "internalTestConfigsCount");
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPDeviceInfo internalTestConfigAtIndex:](self, "internalTestConfigAtIndex:", i));
        [v9 addInternalTestConfig:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_productName, "copyWithZone:", a3);
  v7 = (void *)v5[6];
  v5[6] = v6;

  id v8 = -[NSString copyWithZone:](self->_productType, "copyWithZone:", a3);
  v9 = (void *)v5[7];
  v5[7] = v8;

  id v10 = -[NSString copyWithZone:](self->_productVersion, "copyWithZone:", a3);
  v11 = (void *)v5[8];
  v5[8] = v10;

  id v12 = -[NSString copyWithZone:](self->_productBuild, "copyWithZone:", a3);
  v13 = (void *)v5[5];
  v5[5] = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_BYTE *)v5 + 80) = self->_isAppleInternal;
    *((_BYTE *)v5 + 84) |= 1u;
  }

  id v14 = -[NSString copyWithZone:](self->_processName, "copyWithZone:", a3);
  id v15 = (void *)v5[2];
  v5[2] = v14;

  id v16 = -[NSString copyWithZone:](self->_processVersion, "copyWithZone:", a3);
  uint64_t v17 = (void *)v5[4];
  v5[4] = v16;

  id v18 = -[NSString copyWithZone:](self->_processUuid, "copyWithZone:", a3);
  __int128 v19 = (void *)v5[3];
  v5[3] = v18;

  id v20 = -[NSString copyWithZone:](self->_userDefaultTestName, "copyWithZone:", a3);
  __int128 v21 = (void *)v5[9];
  v5[9] = v20;

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v22 = self->_internalTestConfigs;
  id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v29,  v33,  16LL);
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      v26 = 0LL;
      do
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * (void)v26), "copyWithZone:", a3, (void)v29);
        [v5 addInternalTestConfig:v27];

        v26 = (char *)v26 + 1;
      }

      while (v24 != v26);
      id v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v29,  v33,  16LL);
    }

    while (v24);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  productName = self->_productName;
  if ((unint64_t)productName | *((void *)v4 + 6))
  {
  }

  productType = self->_productType;
  if ((unint64_t)productType | *((void *)v4 + 7))
  {
  }

  productVersion = self->_productVersion;
  if ((unint64_t)productVersion | *((void *)v4 + 8))
  {
  }

  productBuild = self->_productBuild;
  if ((unint64_t)productBuild | *((void *)v4 + 5))
  {
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) != 0)
    {
      if (self->_isAppleInternal)
      {
        if (!*((_BYTE *)v4 + 80)) {
          goto LABEL_28;
        }
        goto LABEL_18;
      }

      if (!*((_BYTE *)v4 + 80)) {
        goto LABEL_18;
      }
    }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_productName, "hash");
  NSUInteger v4 = -[NSString hash](self->_productType, "hash");
  NSUInteger v5 = -[NSString hash](self->_productVersion, "hash");
  NSUInteger v6 = -[NSString hash](self->_productBuild, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v7 = 2654435761LL * self->_isAppleInternal;
  }
  else {
    uint64_t v7 = 0LL;
  }
  NSUInteger v8 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v9 = v7 ^ -[NSString hash](self->_processName, "hash");
  unint64_t v10 = v8 ^ v9 ^ -[NSString hash](self->_processVersion, "hash");
  NSUInteger v11 = -[NSString hash](self->_processUuid, "hash");
  unint64_t v12 = v11 ^ -[NSString hash](self->_userDefaultTestName, "hash");
  return v10 ^ v12 ^ (unint64_t)-[NSMutableArray hash](self->_internalTestConfigs, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 6)) {
    -[SECC2MPDeviceInfo setProductName:](self, "setProductName:");
  }
  if (*((void *)v4 + 7)) {
    -[SECC2MPDeviceInfo setProductType:](self, "setProductType:");
  }
  if (*((void *)v4 + 8)) {
    -[SECC2MPDeviceInfo setProductVersion:](self, "setProductVersion:");
  }
  if (*((void *)v4 + 5)) {
    -[SECC2MPDeviceInfo setProductBuild:](self, "setProductBuild:");
  }
  if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    self->_isAppleInternal = *((_BYTE *)v4 + 80);
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 2)) {
    -[SECC2MPDeviceInfo setProcessName:](self, "setProcessName:");
  }
  if (*((void *)v4 + 4)) {
    -[SECC2MPDeviceInfo setProcessVersion:](self, "setProcessVersion:");
  }
  if (*((void *)v4 + 3)) {
    -[SECC2MPDeviceInfo setProcessUuid:](self, "setProcessUuid:");
  }
  if (*((void *)v4 + 9)) {
    -[SECC2MPDeviceInfo setUserDefaultTestName:](self, "setUserDefaultTestName:");
  }
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v5 = *((id *)v4 + 1);
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
        -[SECC2MPDeviceInfo addInternalTestConfig:]( self,  "addInternalTestConfig:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)i),  (void)v10);
      }

      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (NSString)productName
{
  return self->_productName;
}

- (void)setProductName:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
}

- (NSString)productBuild
{
  return self->_productBuild;
}

- (void)setProductBuild:(id)a3
{
}

- (BOOL)isAppleInternal
{
  return self->_isAppleInternal;
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (NSString)processVersion
{
  return self->_processVersion;
}

- (void)setProcessVersion:(id)a3
{
}

- (NSString)processUuid
{
  return self->_processUuid;
}

- (void)setProcessUuid:(id)a3
{
}

- (NSString)userDefaultTestName
{
  return self->_userDefaultTestName;
}

- (void)setUserDefaultTestName:(id)a3
{
}

- (NSMutableArray)internalTestConfigs
{
  return self->_internalTestConfigs;
}

- (void)setInternalTestConfigs:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (Class)internalTestConfigType
{
  return (Class)objc_opt_class(&OBJC_CLASS___SECC2MPInternalTestConfig, a2);
}

@end