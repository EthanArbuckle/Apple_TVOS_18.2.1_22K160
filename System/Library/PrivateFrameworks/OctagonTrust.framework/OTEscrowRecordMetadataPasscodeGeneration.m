@interface OTEscrowRecordMetadataPasscodeGeneration
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)value;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setValue:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTEscrowRecordMetadataPasscodeGeneration

- (void)setValue:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTEscrowRecordMetadataPasscodeGeneration;
  v4 = -[OTEscrowRecordMetadataPasscodeGeneration description](&v8, sel_description);
  v5 = -[OTEscrowRecordMetadataPasscodeGeneration dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_value];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v4 forKey:@"value"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return OTEscrowRecordMetadataPasscodeGenerationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((void *)a3 + 1) = self->_value;
    *((_BYTE *)a3 + 16) |= 1u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((void *)result + 1) = self->_value;
    *((_BYTE *)result + 16) |= 1u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = (*((_BYTE *)v4 + 16) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) != 0 && self->_value == *((void *)v4 + 1))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return 2654435761u * self->_value;
  }
  else {
    return 0LL;
  }
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 16) & 1) != 0)
  {
    self->_value = *((void *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

- (unint64_t)value
{
  return self->_value;
}

@end