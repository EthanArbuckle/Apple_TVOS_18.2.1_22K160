@interface CSDMessagingConversationJoinedMetadata
- (BOOL)hasAudioRouteUniqueIdentifier;
- (BOOL)hasSender;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingConversationParticipant)sender;
- (NSString)audioRouteUniqueIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAudioRouteUniqueIdentifier:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setSender:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationJoinedMetadata

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSender
{
  return self->_sender != 0LL;
}

- (BOOL)hasAudioRouteUniqueIdentifier
{
  return self->_audioRouteUniqueIdentifier != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingConversationJoinedMetadata;
  id v3 = -[CSDMessagingConversationJoinedMetadata description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationJoinedMetadata dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_version));
    [v3 setObject:v4 forKey:@"version"];
  }

  sender = self->_sender;
  if (sender)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipant dictionaryRepresentation](sender, "dictionaryRepresentation"));
    [v3 setObject:v6 forKey:@"sender"];
  }

  audioRouteUniqueIdentifier = self->_audioRouteUniqueIdentifier;
  if (audioRouteUniqueIdentifier) {
    [v3 setObject:audioRouteUniqueIdentifier forKey:@"audioRouteUniqueIdentifier"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10004B0DC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1LL);
    id v4 = v7;
  }

  sender = self->_sender;
  if (sender)
  {
    PBDataWriterWriteSubmessage(v7, sender, 2LL);
    id v4 = v7;
  }

  audioRouteUniqueIdentifier = self->_audioRouteUniqueIdentifier;
  if (audioRouteUniqueIdentifier)
  {
    PBDataWriterWriteStringField(v7, audioRouteUniqueIdentifier, 3LL);
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_version;
    *((_BYTE *)v4 + 28) |= 1u;
  }

  v5 = v4;
  if (self->_sender)
  {
    objc_msgSend(v4, "setSender:");
    id v4 = v5;
  }

  if (self->_audioRouteUniqueIdentifier)
  {
    objc_msgSend(v5, "setAudioRouteUniqueIdentifier:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_version;
    *((_BYTE *)v5 + 28) |= 1u;
  }

  id v7 = -[CSDMessagingConversationParticipant copyWithZone:](self->_sender, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = -[NSString copyWithZone:](self->_audioRouteUniqueIdentifier, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }

  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_11:
    unsigned __int8 v8 = 0;
    goto LABEL_12;
  }

  sender = self->_sender;
  if ((unint64_t)sender | *((void *)v4 + 2)
    && !-[CSDMessagingConversationParticipant isEqual:](sender, "isEqual:"))
  {
    goto LABEL_11;
  }

  audioRouteUniqueIdentifier = self->_audioRouteUniqueIdentifier;
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_12:

  return v8;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v3 = 2654435761LL * self->_version;
  }
  else {
    uint64_t v3 = 0LL;
  }
  unint64_t v4 = -[CSDMessagingConversationParticipant hash](self->_sender, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_audioRouteUniqueIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_version = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }

  sender = self->_sender;
  uint64_t v7 = v5[2];
  unsigned __int8 v8 = v5;
  if (sender)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[CSDMessagingConversationParticipant mergeFrom:](sender, "mergeFrom:");
  }

  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[CSDMessagingConversationJoinedMetadata setSender:](self, "setSender:");
  }

  uint64_t v5 = v8;
LABEL_9:
  if (v5[1])
  {
    -[CSDMessagingConversationJoinedMetadata setAudioRouteUniqueIdentifier:](self, "setAudioRouteUniqueIdentifier:");
    uint64_t v5 = v8;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (CSDMessagingConversationParticipant)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (NSString)audioRouteUniqueIdentifier
{
  return self->_audioRouteUniqueIdentifier;
}

- (void)setAudioRouteUniqueIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end