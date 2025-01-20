@interface CSDMessagingConversationActivityMetadata
- (BOOL)hasFallbackURL;
- (BOOL)hasImage;
- (BOOL)hasLifetimePolicy;
- (BOOL)hasPreferredBroadcastingAttributes;
- (BOOL)hasSceneAssociationBehavior;
- (BOOL)hasSubtitle;
- (BOOL)hasSupportsActivityPreviews;
- (BOOL)hasSupportsContinuationOnTV;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsActivityPreviews;
- (BOOL)supportsContinuationOnTV;
- (CSDMessagingConversationActivitySceneAssociationBehavior)sceneAssociationBehavior;
- (NSData)image;
- (NSString)fallbackURL;
- (NSString)subtitle;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)lifetimePolicy;
- (unsigned)preferredBroadcastingAttributes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFallbackURL:(id)a3;
- (void)setHasLifetimePolicy:(BOOL)a3;
- (void)setHasPreferredBroadcastingAttributes:(BOOL)a3;
- (void)setHasSupportsActivityPreviews:(BOOL)a3;
- (void)setHasSupportsContinuationOnTV:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setLifetimePolicy:(unsigned int)a3;
- (void)setPreferredBroadcastingAttributes:(unsigned int)a3;
- (void)setSceneAssociationBehavior:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSupportsActivityPreviews:(BOOL)a3;
- (void)setSupportsContinuationOnTV:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationActivityMetadata

- (BOOL)hasFallbackURL
{
  return self->_fallbackURL != 0LL;
}

- (void)setSupportsContinuationOnTV:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_supportsContinuationOnTV = a3;
}

- (void)setHasSupportsContinuationOnTV:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSupportsContinuationOnTV
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasTitle
{
  return self->_title != 0LL;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0LL;
}

- (BOOL)hasImage
{
  return self->_image != 0LL;
}

- (void)setPreferredBroadcastingAttributes:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_preferredBroadcastingAttributes = a3;
}

- (void)setHasPreferredBroadcastingAttributes:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPreferredBroadcastingAttributes
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasSceneAssociationBehavior
{
  return self->_sceneAssociationBehavior != 0LL;
}

- (void)setSupportsActivityPreviews:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_supportsActivityPreviews = a3;
}

- (void)setHasSupportsActivityPreviews:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSupportsActivityPreviews
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setLifetimePolicy:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_lifetimePolicy = a3;
}

- (void)setHasLifetimePolicy:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLifetimePolicy
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingConversationActivityMetadata;
  id v3 = -[CSDMessagingConversationActivityMetadata description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationActivityMetadata dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  fallbackURL = self->_fallbackURL;
  if (fallbackURL) {
    [v3 setObject:fallbackURL forKey:@"fallbackURL"];
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_supportsContinuationOnTV));
    [v4 setObject:v6 forKey:@"supportsContinuationOnTV"];
  }

  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    [v4 setObject:subtitle forKey:@"subtitle"];
  }
  image = self->_image;
  if (image) {
    [v4 setObject:image forKey:@"image"];
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_preferredBroadcastingAttributes));
    [v4 setObject:v10 forKey:@"preferredBroadcastingAttributes"];
  }

  sceneAssociationBehavior = self->_sceneAssociationBehavior;
  if (sceneAssociationBehavior)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationActivitySceneAssociationBehavior dictionaryRepresentation]( sceneAssociationBehavior,  "dictionaryRepresentation"));
    [v4 setObject:v12 forKey:@"sceneAssociationBehavior"];
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_supportsActivityPreviews));
    [v4 setObject:v14 forKey:@"supportsActivityPreviews"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_lifetimePolicy));
    [v4 setObject:v15 forKey:@"lifetimePolicy"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10013B0F8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  fallbackURL = self->_fallbackURL;
  id v11 = v4;
  if (fallbackURL)
  {
    PBDataWriterWriteStringField(v4, fallbackURL, 1LL);
    id v4 = v11;
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteBOOLField(v11, self->_supportsContinuationOnTV, 2LL);
    id v4 = v11;
  }

  title = self->_title;
  if (title)
  {
    PBDataWriterWriteStringField(v11, title, 3LL);
    id v4 = v11;
  }

  subtitle = self->_subtitle;
  if (subtitle)
  {
    PBDataWriterWriteStringField(v11, subtitle, 4LL);
    id v4 = v11;
  }

  image = self->_image;
  if (image)
  {
    PBDataWriterWriteDataField(v11, image, 5LL);
    id v4 = v11;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v11, self->_preferredBroadcastingAttributes, 6LL);
    id v4 = v11;
  }

  sceneAssociationBehavior = self->_sceneAssociationBehavior;
  if (sceneAssociationBehavior)
  {
    PBDataWriterWriteSubmessage(v11, sceneAssociationBehavior, 7LL);
    id v4 = v11;
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField(v11, self->_supportsActivityPreviews, 8LL);
    id v4 = v11;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v11, self->_lifetimePolicy, 9LL);
    id v4 = v11;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_fallbackURL)
  {
    objc_msgSend(v4, "setFallbackURL:");
    id v4 = v6;
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_BYTE *)v4 + 57) = self->_supportsContinuationOnTV;
    *((_BYTE *)v4 + 60) |= 8u;
  }

  if (self->_title)
  {
    objc_msgSend(v6, "setTitle:");
    id v4 = v6;
  }

  if (self->_subtitle)
  {
    objc_msgSend(v6, "setSubtitle:");
    id v4 = v6;
  }

  if (self->_image)
  {
    objc_msgSend(v6, "setImage:");
    id v4 = v6;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 7) = self->_preferredBroadcastingAttributes;
    *((_BYTE *)v4 + 60) |= 2u;
  }

  if (self->_sceneAssociationBehavior)
  {
    objc_msgSend(v6, "setSceneAssociationBehavior:");
    id v4 = v6;
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_BYTE *)v4 + 56) = self->_supportsActivityPreviews;
    *((_BYTE *)v4 + 60) |= 4u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_lifetimePolicy;
    *((_BYTE *)v4 + 60) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_fallbackURL, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_BYTE *)v5 + 57) = self->_supportsContinuationOnTV;
    *((_BYTE *)v5 + 60) |= 8u;
  }

  id v8 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v9 = (void *)v5[6];
  v5[6] = v8;

  id v10 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  id v11 = (void *)v5[5];
  v5[5] = v10;

  id v12 = -[NSData copyWithZone:](self->_image, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v5 + 7) = self->_preferredBroadcastingAttributes;
    *((_BYTE *)v5 + 60) |= 2u;
  }

  id v14 = -[CSDMessagingConversationActivitySceneAssociationBehavior copyWithZone:]( self->_sceneAssociationBehavior,  "copyWithZone:",  a3);
  v15 = (void *)v5[4];
  v5[4] = v14;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_BYTE *)v5 + 56) = self->_supportsActivityPreviews;
    *((_BYTE *)v5 + 60) |= 4u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_lifetimePolicy;
    *((_BYTE *)v5 + 60) |= 1u;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  fallbackURL = self->_fallbackURL;
  if ((unint64_t)fallbackURL | *((void *)v4 + 1))
  {
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 8) == 0) {
      goto LABEL_38;
    }
    if (self->_supportsContinuationOnTV)
    {
      if (!*((_BYTE *)v4 + 57)) {
        goto LABEL_38;
      }
    }

    else if (*((_BYTE *)v4 + 57))
    {
      goto LABEL_38;
    }
  }

  else if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
    goto LABEL_38;
  }

  title = self->_title;
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((void *)v4 + 5))
  {
  }

  image = self->_image;
  if ((unint64_t)image | *((void *)v4 + 2))
  {
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_preferredBroadcastingAttributes != *((_DWORD *)v4 + 7)) {
      goto LABEL_38;
    }
  }

  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_38;
  }

  sceneAssociationBehavior = self->_sceneAssociationBehavior;
  if ((unint64_t)sceneAssociationBehavior | *((void *)v4 + 4))
  {
    if (!-[CSDMessagingConversationActivitySceneAssociationBehavior isEqual:](sceneAssociationBehavior, "isEqual:")) {
      goto LABEL_38;
    }
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) != 0)
    {
      if (self->_supportsActivityPreviews)
      {
        if (!*((_BYTE *)v4 + 56)) {
          goto LABEL_38;
        }
        goto LABEL_34;
      }

      if (!*((_BYTE *)v4 + 56)) {
        goto LABEL_34;
      }
    }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_fallbackURL, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    uint64_t v4 = 2654435761LL * self->_supportsContinuationOnTV;
  }
  else {
    uint64_t v4 = 0LL;
  }
  NSUInteger v5 = -[NSString hash](self->_title, "hash");
  NSUInteger v6 = -[NSString hash](self->_subtitle, "hash");
  unint64_t v7 = (unint64_t)-[NSData hash](self->_image, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761LL * self->_preferredBroadcastingAttributes;
  }
  else {
    uint64_t v8 = 0LL;
  }
  unint64_t v9 = -[CSDMessagingConversationActivitySceneAssociationBehavior hash](self->_sceneAssociationBehavior, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    uint64_t v10 = 2654435761LL * self->_supportsActivityPreviews;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_9;
    }
LABEL_11:
    uint64_t v11 = 0LL;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }

  uint64_t v10 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v11 = 2654435761LL * self->_lifetimePolicy;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*((void *)v4 + 1))
  {
    -[CSDMessagingConversationActivityMetadata setFallbackURL:](self, "setFallbackURL:");
    id v4 = v8;
  }

  if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
    self->_supportsContinuationOnTV = *((_BYTE *)v4 + 57);
    *(_BYTE *)&self->_has |= 8u;
  }

  if (*((void *)v4 + 6))
  {
    -[CSDMessagingConversationActivityMetadata setTitle:](self, "setTitle:");
    id v4 = v8;
  }

  if (*((void *)v4 + 5))
  {
    -[CSDMessagingConversationActivityMetadata setSubtitle:](self, "setSubtitle:");
    id v4 = v8;
  }

  if (*((void *)v4 + 2))
  {
    -[CSDMessagingConversationActivityMetadata setImage:](self, "setImage:");
    id v4 = v8;
  }

  if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    self->_preferredBroadcastingAttributes = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 2u;
  }

  sceneAssociationBehavior = self->_sceneAssociationBehavior;
  uint64_t v6 = *((void *)v4 + 4);
  if (sceneAssociationBehavior)
  {
    if (!v6) {
      goto LABEL_19;
    }
    -[CSDMessagingConversationActivitySceneAssociationBehavior mergeFrom:](sceneAssociationBehavior, "mergeFrom:");
  }

  else
  {
    if (!v6) {
      goto LABEL_19;
    }
    -[CSDMessagingConversationActivityMetadata setSceneAssociationBehavior:](self, "setSceneAssociationBehavior:");
  }

  id v4 = v8;
LABEL_19:
  char v7 = *((_BYTE *)v4 + 60);
  if ((v7 & 4) != 0)
  {
    self->_supportsActivityPreviews = *((_BYTE *)v4 + 56);
    *(_BYTE *)&self->_has |= 4u;
    char v7 = *((_BYTE *)v4 + 60);
  }

  if ((v7 & 1) != 0)
  {
    self->_lifetimePolicy = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)fallbackURL
{
  return self->_fallbackURL;
}

- (void)setFallbackURL:(id)a3
{
}

- (BOOL)supportsContinuationOnTV
{
  return self->_supportsContinuationOnTV;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSData)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (unsigned)preferredBroadcastingAttributes
{
  return self->_preferredBroadcastingAttributes;
}

- (CSDMessagingConversationActivitySceneAssociationBehavior)sceneAssociationBehavior
{
  return self->_sceneAssociationBehavior;
}

- (void)setSceneAssociationBehavior:(id)a3
{
}

- (BOOL)supportsActivityPreviews
{
  return self->_supportsActivityPreviews;
}

- (unsigned)lifetimePolicy
{
  return self->_lifetimePolicy;
}

- (void).cxx_destruct
{
}

@end