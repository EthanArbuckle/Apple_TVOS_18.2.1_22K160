@interface CSDMessagingConversationActivitySessionLocallyPersistedMetadata
- (BOOL)hasLocallyInitiated;
- (BOOL)isEqual:(id)a3;
- (BOOL)locallyInitiated;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLocallyInitiated:(BOOL)a3;
- (void)setLocallyInitiated:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationActivitySessionLocallyPersistedMetadata

- (void)setLocallyInitiated:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_locallyInitiated = a3;
}

- (void)setHasLocallyInitiated:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLocallyInitiated
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingConversationActivitySessionLocallyPersistedMetadata;
  id v3 = -[CSDMessagingConversationActivitySessionLocallyPersistedMetadata description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationActivitySessionLocallyPersistedMetadata dictionaryRepresentation]( self,  "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_locallyInitiated));
    [v3 setObject:v4 forKey:@"locallyInitiated"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10005E6B0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteBOOLField(a3, self->_locallyInitiated, 1LL);
  }
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_BYTE *)a3 + 8) = self->_locallyInitiated;
    *((_BYTE *)a3 + 12) |= 1u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_BYTE *)result + 8) = self->_locallyInitiated;
    *((_BYTE *)result + 12) |= 1u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  BOOL v6 = (v4[12] & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[12] & 1) == 0)
    {
LABEL_4:
      BOOL v6 = 0;
      goto LABEL_5;
    }

    if (self->_locallyInitiated)
    {
      if (!v4[8]) {
        goto LABEL_4;
      }
    }

    else if (v4[8])
    {
      goto LABEL_4;
    }

    BOOL v6 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return 2654435761LL * self->_locallyInitiated;
  }
  else {
    return 0LL;
  }
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 12) & 1) != 0)
  {
    self->_locallyInitiated = *((_BYTE *)a3 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }

- (BOOL)locallyInitiated
{
  return self->_locallyInitiated;
}

@end