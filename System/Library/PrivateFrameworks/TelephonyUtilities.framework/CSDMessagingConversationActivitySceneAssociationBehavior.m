@interface CSDMessagingConversationActivitySceneAssociationBehavior
- (BOOL)hasPreferredSceneSessionRole;
- (BOOL)hasShouldAssociateScene;
- (BOOL)hasTargetContentIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldAssociateScene;
- (NSString)preferredSceneSessionRole;
- (NSString)targetContentIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasShouldAssociateScene:(BOOL)a3;
- (void)setPreferredSceneSessionRole:(id)a3;
- (void)setShouldAssociateScene:(BOOL)a3;
- (void)setTargetContentIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationActivitySceneAssociationBehavior

- (BOOL)hasTargetContentIdentifier
{
  return self->_targetContentIdentifier != 0LL;
}

- (void)setShouldAssociateScene:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_shouldAssociateScene = a3;
}

- (void)setHasShouldAssociateScene:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasShouldAssociateScene
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasPreferredSceneSessionRole
{
  return self->_preferredSceneSessionRole != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingConversationActivitySceneAssociationBehavior;
  id v3 = -[CSDMessagingConversationActivitySceneAssociationBehavior description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationActivitySceneAssociationBehavior dictionaryRepresentation]( self,  "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  targetContentIdentifier = self->_targetContentIdentifier;
  if (targetContentIdentifier) {
    [v3 setObject:targetContentIdentifier forKey:@"targetContentIdentifier"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_shouldAssociateScene));
    [v4 setObject:v6 forKey:@"shouldAssociateScene"];
  }

  preferredSceneSessionRole = self->_preferredSceneSessionRole;
  if (preferredSceneSessionRole) {
    [v4 setObject:preferredSceneSessionRole forKey:@"preferredSceneSessionRole"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000A0B74((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  targetContentIdentifier = self->_targetContentIdentifier;
  id v7 = v4;
  if (targetContentIdentifier)
  {
    PBDataWriterWriteStringField(v4, targetContentIdentifier, 1LL);
    id v4 = v7;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField(v7, self->_shouldAssociateScene, 2LL);
    id v4 = v7;
  }

  preferredSceneSessionRole = self->_preferredSceneSessionRole;
  if (preferredSceneSessionRole)
  {
    PBDataWriterWriteStringField(v7, preferredSceneSessionRole, 3LL);
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_targetContentIdentifier)
  {
    objc_msgSend(v4, "setTargetContentIdentifier:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_shouldAssociateScene;
    v4[28] |= 1u;
  }

  if (self->_preferredSceneSessionRole)
  {
    objc_msgSend(v5, "setPreferredSceneSessionRole:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_targetContentIdentifier, "copyWithZone:", a3);
  id v7 = (void *)v5[2];
  v5[2] = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_BYTE *)v5 + 24) = self->_shouldAssociateScene;
    *((_BYTE *)v5 + 28) |= 1u;
  }

  id v8 = -[NSString copyWithZone:](self->_preferredSceneSessionRole, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  targetContentIdentifier = self->_targetContentIdentifier;
  if ((unint64_t)targetContentIdentifier | *((void *)v4 + 2))
  {
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0)
    {
      if (self->_shouldAssociateScene)
      {
        if (*((_BYTE *)v4 + 24)) {
          goto LABEL_14;
        }
      }

      else if (!*((_BYTE *)v4 + 24))
      {
        goto LABEL_14;
      }
    }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_targetContentIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v4 = 2654435761LL * self->_shouldAssociateScene;
  }
  else {
    uint64_t v4 = 0LL;
  }
  return v4 ^ v3 ^ -[NSString hash](self->_preferredSceneSessionRole, "hash");
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[CSDMessagingConversationActivitySceneAssociationBehavior setTargetContentIdentifier:]( self,  "setTargetContentIdentifier:");
    uint64_t v4 = v5;
  }

  if (v4[28])
  {
    self->_shouldAssociateScene = v4[24];
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 1))
  {
    -[CSDMessagingConversationActivitySceneAssociationBehavior setPreferredSceneSessionRole:]( self,  "setPreferredSceneSessionRole:");
    uint64_t v4 = v5;
  }
}

- (NSString)targetContentIdentifier
{
  return self->_targetContentIdentifier;
}

- (void)setTargetContentIdentifier:(id)a3
{
}

- (BOOL)shouldAssociateScene
{
  return self->_shouldAssociateScene;
}

- (NSString)preferredSceneSessionRole
{
  return self->_preferredSceneSessionRole;
}

- (void)setPreferredSceneSessionRole:(id)a3
{
}

- (void).cxx_destruct
{
}

@end