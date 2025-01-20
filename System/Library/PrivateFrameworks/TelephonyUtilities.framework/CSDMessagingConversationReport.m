@interface CSDMessagingConversationReport
- (BOOL)hasConversationID;
- (BOOL)hasPaddingForHashedValue;
- (BOOL)hasTimebase;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingConversationReport)initWithTUConversationReport:(id)a3;
- (NSString)conversationID;
- (NSString)paddingForHashedValue;
- (TUConversationReport)tuConversationReport;
- (double)timebase;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setHasTimebase:(BOOL)a3;
- (void)setPaddingForHashedValue:(id)a3;
- (void)setTimebase:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationReport

- (CSDMessagingConversationReport)initWithTUConversationReport:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CSDMessagingConversationReport;
  v5 = -[CSDMessagingConversationReport init](&v12, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 conversationID]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    -[CSDMessagingConversationReport setConversationID:](v5, "setConversationID:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 paddingForHashedValue]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    -[CSDMessagingConversationReport setPaddingForHashedValue:](v5, "setPaddingForHashedValue:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 timebase]);
    [v10 timeIntervalSinceReferenceDate];
    -[CSDMessagingConversationReport setTimebase:](v5, "setTimebase:");
  }

  return v5;
}

- (TUConversationReport)tuConversationReport
{
  if (-[CSDMessagingConversationReport hasConversationID](self, "hasConversationID"))
  {
    v3 = objc_alloc(&OBJC_CLASS___NSUUID);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationReport conversationID](self, "conversationID"));
    v5 = -[NSUUID initWithUUIDString:](v3, "initWithUUIDString:", v4);
  }

  else
  {
    v5 = 0LL;
  }

  if (-[CSDMessagingConversationReport hasPaddingForHashedValue](self, "hasPaddingForHashedValue"))
  {
    v6 = objc_alloc(&OBJC_CLASS___NSUUID);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationReport paddingForHashedValue](self, "paddingForHashedValue"));
    v8 = -[NSUUID initWithUUIDString:](v6, "initWithUUIDString:", v7);
  }

  else
  {
    v8 = 0LL;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v9 timeIntervalSinceReferenceDate];
  double v11 = v10;

  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v12 timeIntervalSince1970];
  double v14 = v13;

  -[CSDMessagingConversationReport timebase](self, "timebase");
  double v16 = vabdd_f64(v11, v15);
  -[CSDMessagingConversationReport timebase](self, "timebase");
  double v18 = vabdd_f64(v14, v17);
  v19 = objc_alloc(&OBJC_CLASS___NSDate);
  -[CSDMessagingConversationReport timebase](self, "timebase");
  if (v16 >= v18) {
    v20 = -[NSDate initWithTimeIntervalSince1970:](v19, "initWithTimeIntervalSince1970:");
  }
  else {
    v20 = -[NSDate initWithTimeIntervalSinceReferenceDate:](v19, "initWithTimeIntervalSinceReferenceDate:");
  }
  v21 = v20;
  v22 = -[TUConversationReport initWithConversationID:padding:timebase:]( objc_alloc(&OBJC_CLASS___TUConversationReport),  "initWithConversationID:padding:timebase:",  v5,  v8,  v20);

  return v22;
}

- (BOOL)hasConversationID
{
  return self->_conversationID != 0LL;
}

- (void)setTimebase:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timebase = a3;
}

- (void)setHasTimebase:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimebase
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasPaddingForHashedValue
{
  return self->_paddingForHashedValue != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingConversationReport;
  id v3 = -[CSDMessagingConversationReport description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationReport dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = v3;
  conversationID = self->_conversationID;
  if (conversationID) {
    [v3 setObject:conversationID forKey:@"conversationID"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_timebase));
    [v4 setObject:v6 forKey:@"timebase"];
  }

  paddingForHashedValue = self->_paddingForHashedValue;
  if (paddingForHashedValue) {
    [v4 setObject:paddingForHashedValue forKey:@"paddingForHashedValue"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000CEEDC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  conversationID = self->_conversationID;
  id v7 = v4;
  if (conversationID)
  {
    PBDataWriterWriteStringField(v4, conversationID, 1LL);
    id v4 = v7;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(v7, 2LL, self->_timebase);
    id v4 = v7;
  }

  paddingForHashedValue = self->_paddingForHashedValue;
  if (paddingForHashedValue)
  {
    PBDataWriterWriteStringField(v7, paddingForHashedValue, 3LL);
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_conversationID)
  {
    objc_msgSend(v4, "setConversationID:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((void *)v4 + 1) = *(void *)&self->_timebase;
    *((_BYTE *)v4 + 32) |= 1u;
  }

  if (self->_paddingForHashedValue)
  {
    objc_msgSend(v5, "setPaddingForHashedValue:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_conversationID, "copyWithZone:", a3);
  id v7 = (void *)v5[2];
  v5[2] = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = *(void *)&self->_timebase;
    *((_BYTE *)v5 + 32) |= 1u;
  }

  id v8 = -[NSString copyWithZone:](self->_paddingForHashedValue, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  conversationID = self->_conversationID;
  if ((unint64_t)conversationID | *((void *)v4 + 2))
  {
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
  }

  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    unsigned __int8 v8 = 0;
    goto LABEL_12;
  }

  paddingForHashedValue = self->_paddingForHashedValue;
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_12:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_conversationID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    double timebase = self->_timebase;
    double v6 = -timebase;
    if (timebase >= 0.0) {
      double v6 = self->_timebase;
    }
    double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }

    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  return v4 ^ v3 ^ -[NSString hash](self->_paddingForHashedValue, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (double *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[CSDMessagingConversationReport setConversationID:](self, "setConversationID:");
    unint64_t v4 = v5;
  }

  if (((_BYTE)v4[4] & 1) != 0)
  {
    self->_double timebase = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 3))
  {
    -[CSDMessagingConversationReport setPaddingForHashedValue:](self, "setPaddingForHashedValue:");
    unint64_t v4 = v5;
  }
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
}

- (double)timebase
{
  return self->_timebase;
}

- (NSString)paddingForHashedValue
{
  return self->_paddingForHashedValue;
}

- (void)setPaddingForHashedValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end