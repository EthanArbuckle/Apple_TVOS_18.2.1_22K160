@interface CSDMessagingConversationActivityContext
+ (id)activityContextWithTUActivityContext:(id)a3;
- (BOOL)hasActionDescription;
- (BOOL)hasCompletedDescription;
- (BOOL)hasContextIdentifier;
- (BOOL)hasOngoingDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)actionDescription;
- (NSString)completedDescription;
- (NSString)contextIdentifier;
- (NSString)ongoingDescription;
- (TUConversationActivityContext)tuConversationActivityContext;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionDescription:(id)a3;
- (void)setCompletedDescription:(id)a3;
- (void)setContextIdentifier:(id)a3;
- (void)setOngoingDescription:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationActivityContext

+ (id)activityContextWithTUActivityContext:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationActivityContext);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
    -[CSDMessagingConversationActivityContext setContextIdentifier:](v4, "setContextIdentifier:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 actionDescription]);
    -[CSDMessagingConversationActivityContext setActionDescription:](v4, "setActionDescription:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 ongoingDescription]);
    -[CSDMessagingConversationActivityContext setOngoingDescription:](v4, "setOngoingDescription:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 completedDescription]);
    -[CSDMessagingConversationActivityContext setCompletedDescription:](v4, "setCompletedDescription:", v8);
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

- (TUConversationActivityContext)tuConversationActivityContext
{
  if (!-[CSDMessagingConversationActivityContext hasContextIdentifier](self, "hasContextIdentifier")
    || (id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivityContext contextIdentifier](self, "contextIdentifier")),
        v4 = (TUConversationActivityContext *)objc_claimAutoreleasedReturnValue( +[CPGroupActivityDescription activityContextWithDescriptionIdentifier:]( &OBJC_CLASS___CPGroupActivityDescription,  "activityContextWithDescriptionIdentifier:",  v3)),  v3,  !v4))
  {
    if (-[CSDMessagingConversationActivityContext hasContextIdentifier](self, "hasContextIdentifier")
      && -[CSDMessagingConversationActivityContext hasActionDescription](self, "hasActionDescription")
      && -[CSDMessagingConversationActivityContext hasOngoingDescription](self, "hasOngoingDescription")
      && -[CSDMessagingConversationActivityContext hasCompletedDescription](self, "hasCompletedDescription"))
    {
      v5 = objc_alloc(&OBJC_CLASS___TUConversationActivityContext);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivityContext contextIdentifier](self, "contextIdentifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivityContext actionDescription](self, "actionDescription"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivityContext ongoingDescription](self, "ongoingDescription"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivityContext completedDescription](self, "completedDescription"));
      v4 = -[TUConversationActivityContext initWithContextIdentifier:actionDescription:ongoingDescription:completedDescription:]( v5,  "initWithContextIdentifier:actionDescription:ongoingDescription:completedDescription:",  v6,  v7,  v8,  v9);
    }

    else
    {
      v4 = 0LL;
    }
  }

  return v4;
}

- (BOOL)hasContextIdentifier
{
  return self->_contextIdentifier != 0LL;
}

- (BOOL)hasActionDescription
{
  return self->_actionDescription != 0LL;
}

- (BOOL)hasOngoingDescription
{
  return self->_ongoingDescription != 0LL;
}

- (BOOL)hasCompletedDescription
{
  return self->_completedDescription != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingConversationActivityContext;
  id v3 = -[CSDMessagingConversationActivityContext description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivityContext dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  contextIdentifier = self->_contextIdentifier;
  if (contextIdentifier) {
    [v3 setObject:contextIdentifier forKey:@"contextIdentifier"];
  }
  actionDescription = self->_actionDescription;
  if (actionDescription) {
    [v4 setObject:actionDescription forKey:@"actionDescription"];
  }
  ongoingDescription = self->_ongoingDescription;
  if (ongoingDescription) {
    [v4 setObject:ongoingDescription forKey:@"ongoingDescription"];
  }
  completedDescription = self->_completedDescription;
  if (completedDescription) {
    [v4 setObject:completedDescription forKey:@"completedDescription"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006B42C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  contextIdentifier = self->_contextIdentifier;
  id v9 = v4;
  if (contextIdentifier)
  {
    PBDataWriterWriteStringField(v4, contextIdentifier, 1LL);
    id v4 = v9;
  }

  actionDescription = self->_actionDescription;
  if (actionDescription)
  {
    PBDataWriterWriteStringField(v9, actionDescription, 2LL);
    id v4 = v9;
  }

  ongoingDescription = self->_ongoingDescription;
  if (ongoingDescription)
  {
    PBDataWriterWriteStringField(v9, ongoingDescription, 3LL);
    id v4 = v9;
  }

  completedDescription = self->_completedDescription;
  if (completedDescription)
  {
    PBDataWriterWriteStringField(v9, completedDescription, 4LL);
    id v4 = v9;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_contextIdentifier)
  {
    objc_msgSend(v4, "setContextIdentifier:");
    id v4 = v5;
  }

  if (self->_actionDescription)
  {
    objc_msgSend(v5, "setActionDescription:");
    id v4 = v5;
  }

  if (self->_ongoingDescription)
  {
    objc_msgSend(v5, "setOngoingDescription:");
    id v4 = v5;
  }

  if (self->_completedDescription)
  {
    objc_msgSend(v5, "setCompletedDescription:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_contextIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = -[NSString copyWithZone:](self->_actionDescription, "copyWithZone:", a3);
  id v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = -[NSString copyWithZone:](self->_ongoingDescription, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = -[NSString copyWithZone:](self->_completedDescription, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((contextIdentifier = self->_contextIdentifier, !((unint64_t)contextIdentifier | v4[3]))
     || -[NSString isEqual:](contextIdentifier, "isEqual:"))
    && ((actionDescription = self->_actionDescription, !((unint64_t)actionDescription | v4[1]))
     || -[NSString isEqual:](actionDescription, "isEqual:"))
    && ((ongoingDescription = self->_ongoingDescription, !((unint64_t)ongoingDescription | v4[4]))
     || -[NSString isEqual:](ongoingDescription, "isEqual:")))
  {
    completedDescription = self->_completedDescription;
    else {
      unsigned __int8 v10 = 1;
    }
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_contextIdentifier, "hash");
  unint64_t v4 = -[NSString hash](self->_actionDescription, "hash") ^ v3;
  NSUInteger v5 = -[NSString hash](self->_ongoingDescription, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_completedDescription, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[3]) {
    -[CSDMessagingConversationActivityContext setContextIdentifier:](self, "setContextIdentifier:");
  }
  if (v4[1]) {
    -[CSDMessagingConversationActivityContext setActionDescription:](self, "setActionDescription:");
  }
  if (v4[4]) {
    -[CSDMessagingConversationActivityContext setOngoingDescription:](self, "setOngoingDescription:");
  }
  if (v4[2]) {
    -[CSDMessagingConversationActivityContext setCompletedDescription:](self, "setCompletedDescription:");
  }
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (void)setContextIdentifier:(id)a3
{
}

- (NSString)actionDescription
{
  return self->_actionDescription;
}

- (void)setActionDescription:(id)a3
{
}

- (NSString)ongoingDescription
{
  return self->_ongoingDescription;
}

- (void)setOngoingDescription:(id)a3
{
}

- (NSString)completedDescription
{
  return self->_completedDescription;
}

- (void)setCompletedDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end