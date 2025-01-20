@interface SECC2MPCloudKitInfo
+ (Class)clientOperationType;
+ (Class)operationGroupType;
- (BOOL)anonymous;
- (BOOL)hasAnonymous;
- (BOOL)hasClientBundleId;
- (BOOL)hasClientProcessVersion;
- (BOOL)hasContainer;
- (BOOL)hasEnvironment;
- (BOOL)hasReportClientOperationFrequency;
- (BOOL)hasReportClientOperationFrequencyBase;
- (BOOL)hasReportOperationGroupFrequency;
- (BOOL)hasReportOperationGroupFrequencyBase;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)clientOperations;
- (NSMutableArray)operationGroups;
- (NSString)clientBundleId;
- (NSString)clientProcessVersion;
- (NSString)container;
- (NSString)environment;
- (id)clientOperationAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)operationGroupAtIndex:(unint64_t)a3;
- (unint64_t)clientOperationsCount;
- (unint64_t)hash;
- (unint64_t)operationGroupsCount;
- (unint64_t)reportClientOperationFrequency;
- (unint64_t)reportClientOperationFrequencyBase;
- (unint64_t)reportOperationGroupFrequency;
- (unint64_t)reportOperationGroupFrequencyBase;
- (void)addClientOperation:(id)a3;
- (void)addOperationGroup:(id)a3;
- (void)clearClientOperations;
- (void)clearOperationGroups;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnonymous:(BOOL)a3;
- (void)setClientBundleId:(id)a3;
- (void)setClientOperations:(id)a3;
- (void)setClientProcessVersion:(id)a3;
- (void)setContainer:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setHasAnonymous:(BOOL)a3;
- (void)setHasReportClientOperationFrequency:(BOOL)a3;
- (void)setHasReportClientOperationFrequencyBase:(BOOL)a3;
- (void)setHasReportOperationGroupFrequency:(BOOL)a3;
- (void)setHasReportOperationGroupFrequencyBase:(BOOL)a3;
- (void)setOperationGroups:(id)a3;
- (void)setReportClientOperationFrequency:(unint64_t)a3;
- (void)setReportClientOperationFrequencyBase:(unint64_t)a3;
- (void)setReportOperationGroupFrequency:(unint64_t)a3;
- (void)setReportOperationGroupFrequencyBase:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECC2MPCloudKitInfo

- (BOOL)hasClientProcessVersion
{
  return self->_clientProcessVersion != 0LL;
}

- (BOOL)hasClientBundleId
{
  return self->_clientBundleId != 0LL;
}

- (BOOL)hasContainer
{
  return self->_container != 0LL;
}

- (BOOL)hasEnvironment
{
  return self->_environment != 0LL;
}

- (void)setAnonymous:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_anonymous = a3;
}

- (void)setHasAnonymous:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasAnonymous
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)clearOperationGroups
{
}

- (void)addOperationGroup:(id)a3
{
  id v4 = a3;
  operationGroups = self->_operationGroups;
  id v8 = v4;
  if (!operationGroups)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_operationGroups;
    self->_operationGroups = v6;

    id v4 = v8;
    operationGroups = self->_operationGroups;
  }

  -[NSMutableArray addObject:](operationGroups, "addObject:", v4);
}

- (unint64_t)operationGroupsCount
{
  return (unint64_t)-[NSMutableArray count](self->_operationGroups, "count");
}

- (id)operationGroupAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_operationGroups, "objectAtIndex:", a3);
}

- (void)setReportOperationGroupFrequency:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_reportOperationGroupFrequency = a3;
}

- (void)setHasReportOperationGroupFrequency:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasReportOperationGroupFrequency
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setReportOperationGroupFrequencyBase:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_reportOperationGroupFrequencyBase = a3;
}

- (void)setHasReportOperationGroupFrequencyBase:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasReportOperationGroupFrequencyBase
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)clearClientOperations
{
}

- (void)addClientOperation:(id)a3
{
  id v4 = a3;
  clientOperations = self->_clientOperations;
  id v8 = v4;
  if (!clientOperations)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_clientOperations;
    self->_clientOperations = v6;

    id v4 = v8;
    clientOperations = self->_clientOperations;
  }

  -[NSMutableArray addObject:](clientOperations, "addObject:", v4);
}

- (unint64_t)clientOperationsCount
{
  return (unint64_t)-[NSMutableArray count](self->_clientOperations, "count");
}

- (id)clientOperationAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_clientOperations, "objectAtIndex:", a3);
}

- (void)setReportClientOperationFrequency:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_reportClientOperationFrequency = a3;
}

- (void)setHasReportClientOperationFrequency:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReportClientOperationFrequency
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setReportClientOperationFrequencyBase:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_reportClientOperationFrequencyBase = a3;
}

- (void)setHasReportClientOperationFrequencyBase:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReportClientOperationFrequencyBase
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SECC2MPCloudKitInfo;
  id v3 = -[SECC2MPCloudKitInfo description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPCloudKitInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = v3;
  clientProcessVersion = self->_clientProcessVersion;
  if (clientProcessVersion) {
    [v3 setObject:clientProcessVersion forKey:@"client_process_version"];
  }
  clientBundleId = self->_clientBundleId;
  if (clientBundleId) {
    [v4 setObject:clientBundleId forKey:@"client_bundle_id"];
  }
  container = self->_container;
  if (container) {
    [v4 setObject:container forKey:@"container"];
  }
  environment = self->_environment;
  if (environment) {
    [v4 setObject:environment forKey:@"environment"];
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_anonymous));
    [v4 setObject:v9 forKey:@"anonymous"];
  }

  if (-[NSMutableArray count](self->_operationGroups, "count"))
  {
    v10 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_operationGroups, "count"));
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    v11 = self->_operationGroups;
    id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v35,  v40,  16LL);
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v35 + 1) + 8 * (void)i) dictionaryRepresentation]);
          -[NSMutableArray addObject:](v10, "addObject:", v16);
        }

        id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v35,  v40,  16LL);
      }

      while (v13);
    }

    [v4 setObject:v10 forKey:@"operation_group"];
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_reportOperationGroupFrequency));
    [v4 setObject:v18 forKey:@"report_operation_group_frequency"];

    char has = (char)self->_has;
  }

  if ((has & 8) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_reportOperationGroupFrequencyBase));
    [v4 setObject:v19 forKey:@"report_operation_group_frequency_base"];
  }

  if (-[NSMutableArray count](self->_clientOperations, "count"))
  {
    v20 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_clientOperations, "count"));
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    v21 = self->_clientOperations;
    id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v31,  v39,  16LL);
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v32;
      do
      {
        for (j = 0LL; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v31 + 1) + 8 * (void)j),  "dictionaryRepresentation",  (void)v31));
          -[NSMutableArray addObject:](v20, "addObject:", v26);
        }

        id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v31,  v39,  16LL);
      }

      while (v23);
    }

    [v4 setObject:v20 forKey:@"client_operation"];
  }

  char v27 = (char)self->_has;
  if ((v27 & 1) != 0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_reportClientOperationFrequency));
    [v4 setObject:v28 forKey:@"report_client_operation_frequency"];

    char v27 = (char)self->_has;
  }

  if ((v27 & 2) != 0)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_reportClientOperationFrequencyBase));
    [v4 setObject:v29 forKey:@"report_client_operation_frequency_base"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10012FB34(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  clientProcessVersion = self->_clientProcessVersion;
  if (clientProcessVersion) {
    PBDataWriterWriteStringField(v4, clientProcessVersion, 102LL);
  }
  clientBundleId = self->_clientBundleId;
  if (clientBundleId) {
    PBDataWriterWriteStringField(v5, clientBundleId, 103LL);
  }
  container = self->_container;
  if (container) {
    PBDataWriterWriteStringField(v5, container, 201LL);
  }
  environment = self->_environment;
  if (environment) {
    PBDataWriterWriteStringField(v5, environment, 202LL);
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteBOOLField(v5, self->_anonymous, 203LL);
  }
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  v10 = self->_operationGroups;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v26,  v31,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v26 + 1) + 8LL * (void)i), 301LL);
      }

      id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v26,  v31,  16LL);
    }

    while (v12);
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field(v5, self->_reportOperationGroupFrequency, 302LL);
    char has = (char)self->_has;
  }

  if ((has & 8) != 0) {
    PBDataWriterWriteUint64Field(v5, self->_reportOperationGroupFrequencyBase, 303LL);
  }
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  v16 = self->_clientOperations;
  id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v22,  v30,  16LL);
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v22 + 1) + 8LL * (void)j), 401LL);
      }

      id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v22,  v30,  16LL);
    }

    while (v18);
  }

  char v21 = (char)self->_has;
  if ((v21 & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v5, self->_reportClientOperationFrequency, 402LL);
    char v21 = (char)self->_has;
  }

  if ((v21 & 2) != 0) {
    PBDataWriterWriteUint64Field(v5, self->_reportClientOperationFrequencyBase, 403LL);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v15 = v4;
  if (self->_clientProcessVersion)
  {
    objc_msgSend(v4, "setClientProcessVersion:");
    id v4 = v15;
  }

  if (self->_clientBundleId)
  {
    objc_msgSend(v15, "setClientBundleId:");
    id v4 = v15;
  }

  if (self->_container)
  {
    objc_msgSend(v15, "setContainer:");
    id v4 = v15;
  }

  if (self->_environment)
  {
    objc_msgSend(v15, "setEnvironment:");
    id v4 = v15;
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v4[88] = self->_anonymous;
    v4[92] |= 0x10u;
  }

  if (-[SECC2MPCloudKitInfo operationGroupsCount](self, "operationGroupsCount"))
  {
    [v15 clearOperationGroups];
    unint64_t v5 = -[SECC2MPCloudKitInfo operationGroupsCount](self, "operationGroupsCount");
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPCloudKitInfo operationGroupAtIndex:](self, "operationGroupAtIndex:", i));
        [v15 addOperationGroup:v8];
      }
    }
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)v15 + 3) = self->_reportOperationGroupFrequency;
    v15[92] |= 4u;
    char has = (char)self->_has;
  }

  if ((has & 8) != 0)
  {
    *((void *)v15 + 4) = self->_reportOperationGroupFrequencyBase;
    v15[92] |= 8u;
  }

  if (-[SECC2MPCloudKitInfo clientOperationsCount](self, "clientOperationsCount"))
  {
    [v15 clearClientOperations];
    unint64_t v10 = -[SECC2MPCloudKitInfo clientOperationsCount](self, "clientOperationsCount");
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0LL; j != v11; ++j)
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPCloudKitInfo clientOperationAtIndex:](self, "clientOperationAtIndex:", j));
        [v15 addClientOperation:v13];
      }
    }
  }

  char v14 = (char)self->_has;
  if ((v14 & 1) != 0)
  {
    *((void *)v15 + 1) = self->_reportClientOperationFrequency;
    v15[92] |= 1u;
    char v14 = (char)self->_has;
  }

  if ((v14 & 2) != 0)
  {
    *((void *)v15 + 2) = self->_reportClientOperationFrequencyBase;
    v15[92] |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_clientProcessVersion, "copyWithZone:", a3);
  v7 = (void *)v5[7];
  v5[7] = v6;

  id v8 = -[NSString copyWithZone:](self->_clientBundleId, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  id v10 = -[NSString copyWithZone:](self->_container, "copyWithZone:", a3);
  unint64_t v11 = (void *)v5[8];
  v5[8] = v10;

  id v12 = -[NSString copyWithZone:](self->_environment, "copyWithZone:", a3);
  uint64_t v13 = (void *)v5[9];
  v5[9] = v12;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_BYTE *)v5 + 88) = self->_anonymous;
    *((_BYTE *)v5 + 92) |= 0x10u;
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  char v14 = self->_operationGroups;
  id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v33,  v38,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v34;
    do
    {
      for (uint64_t i = 0LL; i != v16; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [*(id *)(*((void *)&v33 + 1) + 8 * (void)i) copyWithZone:a3];
        [v5 addOperationGroup:v19];
      }

      id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v33,  v38,  16LL);
    }

    while (v16);
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5[3] = self->_reportOperationGroupFrequency;
    *((_BYTE *)v5 + 92) |= 4u;
    char has = (char)self->_has;
  }

  if ((has & 8) != 0)
  {
    v5[4] = self->_reportOperationGroupFrequencyBase;
    *((_BYTE *)v5 + 92) |= 8u;
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  char v21 = self->_clientOperations;
  id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v29,  v37,  16LL);
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t j = 0LL; j != v23; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * (void)j), "copyWithZone:", a3, (void)v29);
        [v5 addClientOperation:v26];
      }

      id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v29,  v37,  16LL);
    }

    while (v23);
  }

  char v27 = (char)self->_has;
  if ((v27 & 1) != 0)
  {
    v5[1] = self->_reportClientOperationFrequency;
    *((_BYTE *)v5 + 92) |= 1u;
    char v27 = (char)self->_has;
  }

  if ((v27 & 2) != 0)
  {
    v5[2] = self->_reportClientOperationFrequencyBase;
    *((_BYTE *)v5 + 92) |= 2u;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  clientProcessVersion = self->_clientProcessVersion;
  if ((unint64_t)clientProcessVersion | *((void *)v4 + 7))
  {
  }

  clientBundleId = self->_clientBundleId;
  if ((unint64_t)clientBundleId | *((void *)v4 + 5))
  {
  }

  container = self->_container;
  if ((unint64_t)container | *((void *)v4 + 8))
  {
  }

  environment = self->_environment;
  if ((unint64_t)environment | *((void *)v4 + 9))
  {
  }

  char has = (char)self->_has;
  char v10 = *((_BYTE *)v4 + 92);
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 0x10) == 0) {
      goto LABEL_43;
    }
    if (self->_anonymous)
    {
      if (!*((_BYTE *)v4 + 88)) {
        goto LABEL_43;
      }
    }

    else if (*((_BYTE *)v4 + 88))
    {
      goto LABEL_43;
    }
  }

  else if ((*((_BYTE *)v4 + 92) & 0x10) != 0)
  {
    goto LABEL_43;
  }

  operationGroups = self->_operationGroups;
  if ((unint64_t)operationGroups | *((void *)v4 + 10))
  {
    char has = (char)self->_has;
    char v10 = *((_BYTE *)v4 + 92);
  }

  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_reportOperationGroupFrequency != *((void *)v4 + 3)) {
      goto LABEL_43;
    }
  }

  else if ((v10 & 4) != 0)
  {
    goto LABEL_43;
  }

  if ((has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_reportOperationGroupFrequencyBase != *((void *)v4 + 4)) {
      goto LABEL_43;
    }
  }

  else if ((v10 & 8) != 0)
  {
    goto LABEL_43;
  }

  clientOperations = self->_clientOperations;
  if ((unint64_t)clientOperations | *((void *)v4 + 6))
  {
    if (-[NSMutableArray isEqual:](clientOperations, "isEqual:"))
    {
      char has = (char)self->_has;
      char v10 = *((_BYTE *)v4 + 92);
      goto LABEL_34;
    }

- (unint64_t)hash
{
  NSUInteger v14 = -[NSString hash](self->_clientProcessVersion, "hash");
  NSUInteger v3 = -[NSString hash](self->_clientBundleId, "hash");
  NSUInteger v4 = -[NSString hash](self->_container, "hash");
  NSUInteger v5 = -[NSString hash](self->_environment, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0) {
    uint64_t v6 = 2654435761LL * self->_anonymous;
  }
  else {
    uint64_t v6 = 0LL;
  }
  unint64_t v7 = (unint64_t)-[NSMutableArray hash](self->_operationGroups, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    unint64_t v8 = 2654435761u * self->_reportOperationGroupFrequency;
    if ((*(_BYTE *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
  }

  else
  {
    unint64_t v8 = 0LL;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_6:
      unint64_t v9 = 2654435761u * self->_reportOperationGroupFrequencyBase;
      goto LABEL_9;
    }
  }

  unint64_t v9 = 0LL;
LABEL_9:
  unint64_t v10 = (unint64_t)-[NSMutableArray hash](self->_clientOperations, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    unint64_t v11 = 2654435761u * self->_reportClientOperationFrequency;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_11;
    }
LABEL_13:
    unint64_t v12 = 0LL;
    return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }

  unint64_t v11 = 0LL;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  unint64_t v12 = 2654435761u * self->_reportClientOperationFrequencyBase;
  return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 7)) {
    -[SECC2MPCloudKitInfo setClientProcessVersion:](self, "setClientProcessVersion:");
  }
  if (*((void *)v4 + 5)) {
    -[SECC2MPCloudKitInfo setClientBundleId:](self, "setClientBundleId:");
  }
  if (*((void *)v4 + 8)) {
    -[SECC2MPCloudKitInfo setContainer:](self, "setContainer:");
  }
  if (*((void *)v4 + 9)) {
    -[SECC2MPCloudKitInfo setEnvironment:](self, "setEnvironment:");
  }
  if ((*((_BYTE *)v4 + 92) & 0x10) != 0)
  {
    self->_anonymous = *((_BYTE *)v4 + 88);
    *(_BYTE *)&self->_has |= 0x10u;
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v5 = *((id *)v4 + 10);
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        -[SECC2MPCloudKitInfo addOperationGroup:]( self,  "addOperationGroup:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)i));
      }

      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }

    while (v7);
  }

  char v10 = *((_BYTE *)v4 + 92);
  if ((v10 & 4) != 0)
  {
    self->_reportOperationGroupFrequency = *((void *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    char v10 = *((_BYTE *)v4 + 92);
  }

  if ((v10 & 8) != 0)
  {
    self->_reportOperationGroupFrequencyBase = *((void *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v11 = *((id *)v4 + 6);
  id v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0LL; j != v13; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        -[SECC2MPCloudKitInfo addClientOperation:]( self,  "addClientOperation:",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)j),  (void)v17);
      }

      id v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }

    while (v13);
  }

  char v16 = *((_BYTE *)v4 + 92);
  if ((v16 & 1) != 0)
  {
    self->_reportClientOperationFrequency = *((void *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    char v16 = *((_BYTE *)v4 + 92);
  }

  if ((v16 & 2) != 0)
  {
    self->_reportClientOperationFrequencyBase = *((void *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (NSString)clientProcessVersion
{
  return self->_clientProcessVersion;
}

- (void)setClientProcessVersion:(id)a3
{
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (void)setClientBundleId:(id)a3
{
}

- (NSString)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (NSString)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (BOOL)anonymous
{
  return self->_anonymous;
}

- (NSMutableArray)operationGroups
{
  return self->_operationGroups;
}

- (void)setOperationGroups:(id)a3
{
}

- (unint64_t)reportOperationGroupFrequency
{
  return self->_reportOperationGroupFrequency;
}

- (unint64_t)reportOperationGroupFrequencyBase
{
  return self->_reportOperationGroupFrequencyBase;
}

- (NSMutableArray)clientOperations
{
  return self->_clientOperations;
}

- (void)setClientOperations:(id)a3
{
}

- (unint64_t)reportClientOperationFrequency
{
  return self->_reportClientOperationFrequency;
}

- (unint64_t)reportClientOperationFrequencyBase
{
  return self->_reportClientOperationFrequencyBase;
}

- (void).cxx_destruct
{
}

+ (Class)operationGroupType
{
  return (Class)objc_opt_class(&OBJC_CLASS___SECC2MPCloudKitOperationGroupInfo, a2);
}

+ (Class)clientOperationType
{
  return (Class)objc_opt_class(&OBJC_CLASS___SECC2MPCloudKitOperationInfo, a2);
}

@end