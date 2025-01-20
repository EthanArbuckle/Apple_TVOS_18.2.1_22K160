@interface SECSFAEventFilter
- (BOOL)hasDropRate;
- (BOOL)hasEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)event;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)dropRate;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDropRate:(int64_t)a3;
- (void)setEvent:(id)a3;
- (void)setHasDropRate:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECSFAEventFilter

- (BOOL)hasEvent
{
  return self->_event != 0LL;
}

- (void)setDropRate:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dropRate = a3;
}

- (void)setHasDropRate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDropRate
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SECSFAEventFilter;
  v4 = -[SECSFAEventFilter description](&v8, sel_description);
  v5 = -[SECSFAEventFilter dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  event = self->_event;
  if (event) {
    [v3 setObject:event forKey:@"event"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    [MEMORY[0x189607968] numberWithLongLong:self->_dropRate];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v6 forKey:@"dropRate"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SECSFAEventFilterReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_event)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_event)
  {
    id v5 = v4;
    objc_msgSend(v4, "setEvent:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((void *)v4 + 1) = self->_dropRate;
    *((_BYTE *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_event, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(void *)(v5 + 8) = self->_dropRate;
    *(_BYTE *)(v5 + 24) |= 1u;
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  event = self->_event;
  if ((unint64_t)event | *((void *)v4 + 2))
  {
  }

  BOOL v6 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) != 0 && self->_dropRate == *((void *)v4 + 1))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_event, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v4 = 2654435761LL * self->_dropRate;
  }
  else {
    uint64_t v4 = 0LL;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int64_t *)a3;
  if (v4[2])
  {
    uint64_t v5 = v4;
    -[SECSFAEventFilter setEvent:](self, "setEvent:");
    uint64_t v4 = v5;
  }

  if ((v4[3] & 1) != 0)
  {
    self->_dropRate = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (int64_t)dropRate
{
  return self->_dropRate;
}

- (void).cxx_destruct
{
}

@end