@interface CSDMessagingConversationLinkGeneratorDescriptor
+ (CSDMessagingConversationLinkGeneratorDescriptor)generatorDescriptorWithCSDConversationLinkGeneratorDescriptor:(id)a3;
- (BOOL)hasGeneratorID;
- (BOOL)hasGeneratorVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDConversationLinkGeneratorDescriptor)csdConversationLinkGeneratorDescriptor;
- (NSString)generatorID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)generatorVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGeneratorID:(id)a3;
- (void)setGeneratorVersion:(unsigned int)a3;
- (void)setHasGeneratorVersion:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationLinkGeneratorDescriptor

+ (CSDMessagingConversationLinkGeneratorDescriptor)generatorDescriptorWithCSDConversationLinkGeneratorDescriptor:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationLinkGeneratorDescriptor);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  -[CSDMessagingConversationLinkGeneratorDescriptor setGeneratorID:](v4, "setGeneratorID:", v5);

  id v6 = [v3 version];
  -[CSDMessagingConversationLinkGeneratorDescriptor setGeneratorVersion:](v4, "setGeneratorVersion:", v6);
  return v4;
}

- (CSDConversationLinkGeneratorDescriptor)csdConversationLinkGeneratorDescriptor
{
  id v3 = objc_alloc(&OBJC_CLASS___CSDConversationLinkGeneratorDescriptor);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationLinkGeneratorDescriptor generatorID](self, "generatorID"));
  v5 = -[CSDConversationLinkGeneratorDescriptor initWithIdentifier:version:]( v3,  "initWithIdentifier:version:",  v4,  -[CSDMessagingConversationLinkGeneratorDescriptor generatorVersion](self, "generatorVersion"));

  return v5;
}

- (BOOL)hasGeneratorID
{
  return self->_generatorID != 0LL;
}

- (void)setGeneratorVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_generatorVersion = a3;
}

- (void)setHasGeneratorVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGeneratorVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingConversationLinkGeneratorDescriptor;
  id v3 = -[CSDMessagingConversationLinkGeneratorDescriptor description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationLinkGeneratorDescriptor dictionaryRepresentation]( self,  "dictionaryRepresentation"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  generatorID = self->_generatorID;
  if (generatorID) {
    [v3 setObject:generatorID forKey:@"generatorID"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_generatorVersion));
    [v4 setObject:v6 forKey:@"generatorVersion"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100117DA0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  generatorID = self->_generatorID;
  id v6 = v4;
  if (generatorID)
  {
    PBDataWriterWriteStringField(v4, generatorID, 1LL);
    id v4 = v6;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v6, self->_generatorVersion, 2LL);
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_generatorID)
  {
    id v5 = v4;
    objc_msgSend(v4, "setGeneratorID:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_generatorVersion;
    *((_BYTE *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_generatorID, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_generatorVersion;
    *((_BYTE *)v5 + 20) |= 1u;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  generatorID = self->_generatorID;
  if ((unint64_t)generatorID | *((void *)v4 + 1))
  {
  }

  BOOL v7 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0 && self->_generatorVersion == *((_DWORD *)v4 + 4))
    {
      BOOL v7 = 1;
      goto LABEL_9;
    }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_generatorID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v4 = 2654435761LL * self->_generatorVersion;
  }
  else {
    uint64_t v4 = 0LL;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[CSDMessagingConversationLinkGeneratorDescriptor setGeneratorID:](self, "setGeneratorID:");
    uint64_t v4 = v5;
  }

  if ((v4[5] & 1) != 0)
  {
    self->_generatorVersion = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)generatorID
{
  return self->_generatorID;
}

- (void)setGeneratorID:(id)a3
{
}

- (unsigned)generatorVersion
{
  return self->_generatorVersion;
}

- (void).cxx_destruct
{
}

@end