@interface SECC2MPCloudKitOperationInfo
- (BOOL)hasOperationGroupIndex;
- (BOOL)hasOperationId;
- (BOOL)hasOperationTriggered;
- (BOOL)hasOperationType;
- (BOOL)isEqual:(id)a3;
- (BOOL)operationTriggered;
- (BOOL)readFrom:(id)a3;
- (NSString)operationId;
- (NSString)operationType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)operationGroupIndex;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasOperationGroupIndex:(BOOL)a3;
- (void)setHasOperationTriggered:(BOOL)a3;
- (void)setOperationGroupIndex:(unsigned int)a3;
- (void)setOperationId:(id)a3;
- (void)setOperationTriggered:(BOOL)a3;
- (void)setOperationType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECC2MPCloudKitOperationInfo

- (BOOL)hasOperationId
{
  return self->_operationId != 0LL;
}

- (BOOL)hasOperationType
{
  return self->_operationType != 0LL;
}

- (void)setOperationTriggered:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_operationTriggered = a3;
}

- (void)setHasOperationTriggered:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOperationTriggered
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setOperationGroupIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_operationGroupIndex = a3;
}

- (void)setHasOperationGroupIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOperationGroupIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SECC2MPCloudKitOperationInfo;
  id v3 = -[SECC2MPCloudKitOperationInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPCloudKitOperationInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  operationId = self->_operationId;
  if (operationId) {
    [v3 setObject:operationId forKey:@"operation_id"];
  }
  operationType = self->_operationType;
  if (operationType) {
    [v4 setObject:operationType forKey:@"operation_type"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_operationTriggered));
    [v4 setObject:v8 forKey:@"operation_triggered"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_operationGroupIndex));
    [v4 setObject:v9 forKey:@"operation_group_index"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100126A7C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  operationId = self->_operationId;
  id v8 = v4;
  if (operationId)
  {
    PBDataWriterWriteStringField(v4, operationId, 1LL);
    id v4 = v8;
  }

  operationType = self->_operationType;
  if (operationType)
  {
    PBDataWriterWriteStringField(v8, operationType, 2LL);
    id v4 = v8;
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField(v8, self->_operationTriggered, 101LL);
    id v4 = v8;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v8, self->_operationGroupIndex, 201LL);
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_operationId)
  {
    objc_msgSend(v4, "setOperationId:");
    id v4 = v6;
  }

  if (self->_operationType)
  {
    objc_msgSend(v6, "setOperationType:");
    id v4 = v6;
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 32) = self->_operationTriggered;
    *((_BYTE *)v4 + 36) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_operationGroupIndex;
    *((_BYTE *)v4 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_operationId, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = -[NSString copyWithZone:](self->_operationType, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)v5 + 32) = self->_operationTriggered;
    *((_BYTE *)v5 + 36) |= 2u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 2) = self->_operationGroupIndex;
    *((_BYTE *)v5 + 36) |= 1u;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  operationId = self->_operationId;
  if ((unint64_t)operationId | *((void *)v4 + 2))
  {
  }

  operationType = self->_operationType;
  if ((unint64_t)operationType | *((void *)v4 + 3))
  {
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) != 0)
    {
      if (self->_operationTriggered)
      {
        if (!*((_BYTE *)v4 + 32)) {
          goto LABEL_18;
        }
        goto LABEL_14;
      }

      if (!*((_BYTE *)v4 + 32)) {
        goto LABEL_14;
      }
    }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_operationId, "hash");
  NSUInteger v4 = -[NSString hash](self->_operationType, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761LL * self->_operationTriggered;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0LL;
    return v4 ^ v3 ^ v5 ^ v6;
  }

  uint64_t v5 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761LL * self->_operationGroupIndex;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[SECC2MPCloudKitOperationInfo setOperationId:](self, "setOperationId:");
    id v4 = v6;
  }

  if (*((void *)v4 + 3))
  {
    -[SECC2MPCloudKitOperationInfo setOperationType:](self, "setOperationType:");
    id v4 = v6;
  }

  char v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_operationTriggered = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 2u;
    char v5 = *((_BYTE *)v4 + 36);
  }

  if ((v5 & 1) != 0)
  {
    self->_operationGroupIndex = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)operationId
{
  return self->_operationId;
}

- (void)setOperationId:(id)a3
{
}

- (NSString)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(id)a3
{
}

- (BOOL)operationTriggered
{
  return self->_operationTriggered;
}

- (unsigned)operationGroupIndex
{
  return self->_operationGroupIndex;
}

- (void).cxx_destruct
{
}

@end