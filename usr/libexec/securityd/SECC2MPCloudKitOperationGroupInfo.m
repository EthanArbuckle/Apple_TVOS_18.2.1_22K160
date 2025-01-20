@interface SECC2MPCloudKitOperationGroupInfo
- (BOOL)hasOperationGroupId;
- (BOOL)hasOperationGroupName;
- (BOOL)hasOperationGroupTriggered;
- (BOOL)isEqual:(id)a3;
- (BOOL)operationGroupTriggered;
- (BOOL)readFrom:(id)a3;
- (NSString)operationGroupId;
- (NSString)operationGroupName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasOperationGroupTriggered:(BOOL)a3;
- (void)setOperationGroupId:(id)a3;
- (void)setOperationGroupName:(id)a3;
- (void)setOperationGroupTriggered:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECC2MPCloudKitOperationGroupInfo

- (BOOL)hasOperationGroupId
{
  return self->_operationGroupId != 0LL;
}

- (BOOL)hasOperationGroupName
{
  return self->_operationGroupName != 0LL;
}

- (void)setOperationGroupTriggered:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_operationGroupTriggered = a3;
}

- (void)setHasOperationGroupTriggered:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOperationGroupTriggered
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SECC2MPCloudKitOperationGroupInfo;
  id v3 = -[SECC2MPCloudKitOperationGroupInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPCloudKitOperationGroupInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  operationGroupId = self->_operationGroupId;
  if (operationGroupId) {
    [v3 setObject:operationGroupId forKey:@"operation_group_id"];
  }
  operationGroupName = self->_operationGroupName;
  if (operationGroupName) {
    [v4 setObject:operationGroupName forKey:@"operation_group_name"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_operationGroupTriggered));
    [v4 setObject:v7 forKey:@"operation_group_triggered"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10017BFFC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  operationGroupId = self->_operationGroupId;
  id v7 = v4;
  if (operationGroupId)
  {
    PBDataWriterWriteStringField(v4, operationGroupId, 1LL);
    id v4 = v7;
  }

  operationGroupName = self->_operationGroupName;
  if (operationGroupName)
  {
    PBDataWriterWriteStringField(v7, operationGroupName, 2LL);
    id v4 = v7;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField(v7, self->_operationGroupTriggered, 101LL);
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_operationGroupId)
  {
    objc_msgSend(v4, "setOperationGroupId:");
    id v4 = v5;
  }

  if (self->_operationGroupName)
  {
    objc_msgSend(v5, "setOperationGroupName:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_operationGroupTriggered;
    v4[28] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_operationGroupId, "copyWithZone:", a3);
  id v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = -[NSString copyWithZone:](self->_operationGroupName, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_BYTE *)v5 + 24) = self->_operationGroupTriggered;
    *((_BYTE *)v5 + 28) |= 1u;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  operationGroupId = self->_operationGroupId;
  if ((unint64_t)operationGroupId | *((void *)v4 + 1))
  {
  }

  operationGroupName = self->_operationGroupName;
  if ((unint64_t)operationGroupName | *((void *)v4 + 2))
  {
  }

  BOOL v7 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      BOOL v7 = 0;
      goto LABEL_9;
    }

    if (self->_operationGroupTriggered)
    {
      if (!*((_BYTE *)v4 + 24)) {
        goto LABEL_8;
      }
    }

    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_8;
    }

    BOOL v7 = 1;
  }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_operationGroupId, "hash");
  NSUInteger v4 = -[NSString hash](self->_operationGroupName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v5 = 2654435761LL * self->_operationGroupTriggered;
  }
  else {
    uint64_t v5 = 0LL;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (BOOL *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[SECC2MPCloudKitOperationGroupInfo setOperationGroupId:](self, "setOperationGroupId:");
    NSUInteger v4 = v5;
  }

  if (*((void *)v4 + 2))
  {
    -[SECC2MPCloudKitOperationGroupInfo setOperationGroupName:](self, "setOperationGroupName:");
    NSUInteger v4 = v5;
  }

  if (v4[28])
  {
    self->_operationGroupTriggered = v4[24];
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)operationGroupId
{
  return self->_operationGroupId;
}

- (void)setOperationGroupId:(id)a3
{
}

- (NSString)operationGroupName
{
  return self->_operationGroupName;
}

- (void)setOperationGroupName:(id)a3
{
}

- (BOOL)operationGroupTriggered
{
  return self->_operationGroupTriggered;
}

- (void).cxx_destruct
{
}

@end