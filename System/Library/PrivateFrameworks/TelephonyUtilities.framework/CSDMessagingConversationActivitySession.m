@interface CSDMessagingConversationActivitySession
+ (CSDMessagingConversationActivitySession)activitySessionWithCSDConversationActivitySession:(id)a3 fromConversation:(id)a4;
+ (CSDMessagingConversationActivitySession)activitySessionWithCSDConversationActivitySession:(id)a3 fromConversation:(id)a4 forStorage:(BOOL)a5;
+ (CSDMessagingConversationActivitySession)activitySessionWithTUConversationActivitySession:(id)a3 fromConversation:(id)a4;
+ (CSDMessagingConversationActivitySession)activitySessionWithTUConversationActivitySession:(id)a3 fromConversation:(id)a4 forStorage:(BOOL)a5;
- (BOOL)hasActivity;
- (BOOL)hasCreationDateEpochTime;
- (BOOL)hasIdentifierUUIDString;
- (BOOL)hasLocallyPersistedMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingConversationActivity)activity;
- (CSDMessagingConversationActivitySessionLocallyPersistedMetadata)locallyPersistedMetadata;
- (NSString)identifierUUIDString;
- (TUConversationActivitySession)tuConversationActivitySession;
- (double)creationDateEpochTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createActivitySessionOnConversation:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivity:(id)a3;
- (void)setCreationDateEpochTime:(double)a3;
- (void)setHasCreationDateEpochTime:(BOOL)a3;
- (void)setIdentifierUUIDString:(id)a3;
- (void)setLocallyPersistedMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationActivitySession

- (BOOL)hasIdentifierUUIDString
{
  return self->_identifierUUIDString != 0LL;
}

- (BOOL)hasActivity
{
  return self->_activity != 0LL;
}

- (void)setCreationDateEpochTime:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_creationDateEpochTime = a3;
}

- (void)setHasCreationDateEpochTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationDateEpochTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasLocallyPersistedMetadata
{
  return self->_locallyPersistedMetadata != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingConversationActivitySession;
  id v3 = -[CSDMessagingConversationActivitySession description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivitySession dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  identifierUUIDString = self->_identifierUUIDString;
  if (identifierUUIDString) {
    [v3 setObject:identifierUUIDString forKey:@"identifierUUIDString"];
  }
  activity = self->_activity;
  if (activity)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivity dictionaryRepresentation](activity, "dictionaryRepresentation"));
    [v4 setObject:v7 forKey:@"activity"];
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_creationDateEpochTime));
    [v4 setObject:v8 forKey:@"creationDateEpochTime"];
  }

  locallyPersistedMetadata = self->_locallyPersistedMetadata;
  if (locallyPersistedMetadata)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationActivitySessionLocallyPersistedMetadata dictionaryRepresentation]( locallyPersistedMetadata,  "dictionaryRepresentation"));
    [v4 setObject:v10 forKey:@"locallyPersistedMetadata"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000B1C28((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  identifierUUIDString = self->_identifierUUIDString;
  id v8 = v4;
  if (identifierUUIDString)
  {
    PBDataWriterWriteStringField(v4, identifierUUIDString, 1LL);
    id v4 = v8;
  }

  activity = self->_activity;
  if (activity)
  {
    PBDataWriterWriteSubmessage(v8, activity, 2LL);
    id v4 = v8;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(v8, 3LL, self->_creationDateEpochTime);
    id v4 = v8;
  }

  locallyPersistedMetadata = self->_locallyPersistedMetadata;
  if (locallyPersistedMetadata)
  {
    PBDataWriterWriteSubmessage(v8, locallyPersistedMetadata, 4LL);
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifierUUIDString)
  {
    objc_msgSend(v4, "setIdentifierUUIDString:");
    id v4 = v5;
  }

  if (self->_activity)
  {
    objc_msgSend(v5, "setActivity:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((void *)v4 + 1) = *(void *)&self->_creationDateEpochTime;
    *((_BYTE *)v4 + 40) |= 1u;
  }

  if (self->_locallyPersistedMetadata)
  {
    objc_msgSend(v5, "setLocallyPersistedMetadata:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_identifierUUIDString, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = -[CSDMessagingConversationActivity copyWithZone:](self->_activity, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = *(void *)&self->_creationDateEpochTime;
    *((_BYTE *)v5 + 40) |= 1u;
  }

  id v10 = -[CSDMessagingConversationActivitySessionLocallyPersistedMetadata copyWithZone:]( self->_locallyPersistedMetadata,  "copyWithZone:",  a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  identifierUUIDString = self->_identifierUUIDString;
  if ((unint64_t)identifierUUIDString | *((void *)v4 + 3))
  {
  }

  activity = self->_activity;
  if ((unint64_t)activity | *((void *)v4 + 2))
  {
    if (!-[CSDMessagingConversationActivity isEqual:](activity, "isEqual:")) {
      goto LABEL_13;
    }
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
  }

  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    unsigned __int8 v9 = 0;
    goto LABEL_14;
  }

  locallyPersistedMetadata = self->_locallyPersistedMetadata;
  if ((unint64_t)locallyPersistedMetadata | *((void *)v4 + 4)) {
    unsigned __int8 v9 = -[CSDMessagingConversationActivitySessionLocallyPersistedMetadata isEqual:]( locallyPersistedMetadata,  "isEqual:");
  }
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_14:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_identifierUUIDString, "hash");
  unint64_t v4 = -[CSDMessagingConversationActivity hash](self->_activity, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    double creationDateEpochTime = self->_creationDateEpochTime;
    double v7 = -creationDateEpochTime;
    if (creationDateEpochTime >= 0.0) {
      double v7 = self->_creationDateEpochTime;
    }
    double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }

    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  return v4 ^ v3 ^ v5 ^ -[CSDMessagingConversationActivitySessionLocallyPersistedMetadata hash]( self->_locallyPersistedMetadata,  "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (double *)a3;
  double v9 = v4;
  if (*((void *)v4 + 3))
  {
    -[CSDMessagingConversationActivitySession setIdentifierUUIDString:](self, "setIdentifierUUIDString:");
    unint64_t v4 = v9;
  }

  activity = self->_activity;
  uint64_t v6 = *((void *)v4 + 2);
  if (activity)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[CSDMessagingConversationActivity mergeFrom:](activity, "mergeFrom:");
  }

  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[CSDMessagingConversationActivitySession setActivity:](self, "setActivity:");
  }

  unint64_t v4 = v9;
LABEL_9:
  if (((_BYTE)v4[5] & 1) != 0)
  {
    self->_double creationDateEpochTime = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

  locallyPersistedMetadata = self->_locallyPersistedMetadata;
  uint64_t v8 = *((void *)v4 + 4);
  if (locallyPersistedMetadata)
  {
    if (v8)
    {
      -[CSDMessagingConversationActivitySessionLocallyPersistedMetadata mergeFrom:]( locallyPersistedMetadata,  "mergeFrom:");
LABEL_16:
      unint64_t v4 = v9;
    }
  }

  else if (v8)
  {
    -[CSDMessagingConversationActivitySession setLocallyPersistedMetadata:](self, "setLocallyPersistedMetadata:");
    goto LABEL_16;
  }
}

- (NSString)identifierUUIDString
{
  return self->_identifierUUIDString;
}

- (void)setIdentifierUUIDString:(id)a3
{
}

- (CSDMessagingConversationActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (double)creationDateEpochTime
{
  return self->_creationDateEpochTime;
}

- (CSDMessagingConversationActivitySessionLocallyPersistedMetadata)locallyPersistedMetadata
{
  return self->_locallyPersistedMetadata;
}

- (void)setLocallyPersistedMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (CSDMessagingConversationActivitySession)activitySessionWithTUConversationActivitySession:(id)a3 fromConversation:(id)a4 forStorage:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  if (a5
    || (double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 activity]),
        unsigned __int8 v10 = [v9 isPlaceholderActivity],
        v9,
        (v10 & 1) == 0))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationActivitySession activitySessionWithTUConversationActivitySession:fromConversation:]( &OBJC_CLASS___CSDMessagingConversationActivitySession,  "activitySessionWithTUConversationActivitySession:fromConversation:",  v7,  v8));
  }

  else
  {
    v11 = 0LL;
  }

  return (CSDMessagingConversationActivitySession *)v11;
}

+ (CSDMessagingConversationActivitySession)activitySessionWithTUConversationActivitySession:(id)a3 fromConversation:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationActivitySession);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 UUID]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
  -[CSDMessagingConversationActivitySession setIdentifierUUIDString:](v7, "setIdentifierUUIDString:", v9);

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 activity]);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationActivity activityWithCSDConversationActivity:fromConversation:forStorage:]( &OBJC_CLASS___CSDMessagingConversationActivity,  "activityWithCSDConversationActivity:fromConversation:forStorage:",  v10,  v5,  0LL));

  -[CSDMessagingConversationActivitySession setActivity:](v7, "setActivity:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 timestamp]);

  [v12 timeIntervalSince1970];
  -[CSDMessagingConversationActivitySession setCreationDateEpochTime:](v7, "setCreationDateEpochTime:");

  return v7;
}

- (TUConversationActivitySession)tuConversationActivitySession
{
  NSUInteger v3 = objc_alloc(&OBJC_CLASS___NSUUID);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivitySession identifierUUIDString](self, "identifierUUIDString"));
  id v5 = -[NSUUID initWithUUIDString:](v3, "initWithUUIDString:", v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivitySession activity](self, "activity"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 tuConversationActivity]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivitySession locallyPersistedMetadata](self, "locallyPersistedMetadata"));
  id v9 = [v8 locallyInitiated];

  unsigned __int8 v10 = objc_alloc(&OBJC_CLASS___TUConversationActivitySession);
  -[CSDMessagingConversationActivitySession creationDateEpochTime](self, "creationDateEpochTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));
  v12 = -[TUConversationActivitySession initWithActivity:uuid:locallyInitiated:timestamp:isFirstJoin:]( v10,  "initWithActivity:uuid:locallyInitiated:timestamp:isFirstJoin:",  v7,  v5,  v9,  v11,  1LL);

  return v12;
}

+ (CSDMessagingConversationActivitySession)activitySessionWithCSDConversationActivitySession:(id)a3 fromConversation:(id)a4 forStorage:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationActivitySession);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
  -[CSDMessagingConversationActivitySession setIdentifierUUIDString:](v9, "setIdentifierUUIDString:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 tuConversationActivitySession]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 activity]);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationActivity activityWithCSDConversationActivity:fromConversation:forStorage:]( &OBJC_CLASS___CSDMessagingConversationActivity,  "activityWithCSDConversationActivity:fromConversation:forStorage:",  v13,  v8,  v5));

  -[CSDMessagingConversationActivitySession setActivity:](v9, "setActivity:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v7 tuConversationActivitySession]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 timestamp]);
  [v16 timeIntervalSince1970];
  -[CSDMessagingConversationActivitySession setCreationDateEpochTime:](v9, "setCreationDateEpochTime:");

  if (v5)
  {
    v17 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationActivitySessionLocallyPersistedMetadata);
    -[CSDMessagingConversationActivitySession setLocallyPersistedMetadata:](v9, "setLocallyPersistedMetadata:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue([v7 tuConversationActivitySession]);
    id v19 = [v18 isLocallyInitiated];
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivitySession locallyPersistedMetadata](v9, "locallyPersistedMetadata"));
    [v20 setLocallyInitiated:v19];
  }

  return v9;
}

+ (CSDMessagingConversationActivitySession)activitySessionWithCSDConversationActivitySession:(id)a3 fromConversation:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 tuConversationActivitySession]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationActivitySession activitySessionWithTUConversationActivitySession:fromConversation:]( &OBJC_CLASS___CSDMessagingConversationActivitySession,  "activitySessionWithTUConversationActivitySession:fromConversation:",  v6,  v5));

  return (CSDMessagingConversationActivitySession *)v7;
}

- (id)createActivitySessionOnConversation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivitySession identifierUUIDString](self, "identifierUUIDString"));
  id v7 = -[NSUUID initWithUUIDString:](v5, "initWithUUIDString:", v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivitySession activity](self, "activity"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 tuConversationActivity]);

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 metadata]);
  if ([v10 supportsContinuationOnTV])
  {

LABEL_7:
    v16 = objc_alloc(&OBJC_CLASS___TUConversationActivitySession);
    -[CSDMessagingConversationActivitySession creationDateEpochTime](self, "creationDateEpochTime");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));
    v18 = -[TUConversationActivitySession initWithActivity:uuid:locallyInitiated:timestamp:isFirstJoin:]( v16,  "initWithActivity:uuid:locallyInitiated:timestamp:isFirstJoin:",  v9,  v7,  0LL,  v17,  1LL);

    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 createActivitySession:v18]);
    goto LABEL_8;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 localMember]);
  unsigned int v12 = [v11 isLightweightMember];

  if (!v12) {
    goto LABEL_7;
  }
  id v13 = sub_1001704C4();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    v21 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Not allowing creation since activitySession doesn't support aTV handoff. session: %@",  (uint8_t *)&v20,  0xCu);
  }

  v15 = 0LL;
LABEL_8:

  return v15;
}

@end