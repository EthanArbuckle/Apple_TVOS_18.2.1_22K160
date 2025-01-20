@interface CSDMessagingCallProvider
+ (Class)emergencyHandlesType;
+ (Class)emergencyLabeledHandlesType;
+ (Class)handoffIdentifierType;
+ (Class)prioritizedSenderIdentitiesType;
- (BOOL)hasBundleIdentifier;
- (BOOL)hasBundleURLString;
- (BOOL)hasIdentifier;
- (BOOL)hasLocalizedName;
- (BOOL)hasMaximumCallGroups;
- (BOOL)hasMaximumCallsPerCallGroup;
- (BOOL)hasOriginalRingtoneSoundURLString;
- (BOOL)hasRingtoneSoundURLString;
- (BOOL)hasSupportsAudioAndVideo;
- (BOOL)hasSupportsAudioOnly;
- (BOOL)hasSupportsEmergency;
- (BOOL)hasSupportsRecents;
- (BOOL)hasSupportsVoicemail;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsAudioAndVideo;
- (BOOL)supportsAudioOnly;
- (BOOL)supportsEmergency;
- (BOOL)supportsRecents;
- (BOOL)supportsVoicemail;
- (CSDMessagingCallProvider)initWithProvider:(id)a3;
- (NSArray)emergencyTUHandles;
- (NSArray)emergencyTULabeledHandles;
- (NSMutableArray)emergencyHandles;
- (NSMutableArray)emergencyLabeledHandles;
- (NSMutableArray)handoffIdentifiers;
- (NSMutableArray)prioritizedSenderIdentities;
- (NSOrderedSet)prioritizedTUSenderIdentities;
- (NSSet)supportedHandleTypes;
- (NSString)bundleIdentifier;
- (NSString)bundleURLString;
- (NSString)identifier;
- (NSString)localizedName;
- (NSString)originalRingtoneSoundURLString;
- (NSString)ringtoneSoundURLString;
- (TUCallProvider)provider;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)emergencyHandlesAtIndex:(unint64_t)a3;
- (id)emergencyLabeledHandlesAtIndex:(unint64_t)a3;
- (id)handoffIdentifierAtIndex:(unint64_t)a3;
- (id)prioritizedSenderIdentitiesAtIndex:(unint64_t)a3;
- (unint64_t)emergencyHandlesCount;
- (unint64_t)emergencyLabeledHandlesCount;
- (unint64_t)handoffIdentifiersCount;
- (unint64_t)hash;
- (unint64_t)prioritizedSenderIdentitiesCount;
- (unint64_t)protoSupportedHandleTypesCount;
- (unsigned)maximumCallGroups;
- (unsigned)maximumCallsPerCallGroup;
- (unsigned)protoSupportedHandleTypeAtIndex:(unint64_t)a3;
- (unsigned)protoSupportedHandleTypes;
- (void)addEmergencyHandles:(id)a3;
- (void)addEmergencyLabeledHandles:(id)a3;
- (void)addHandoffIdentifier:(id)a3;
- (void)addPrioritizedSenderIdentities:(id)a3;
- (void)addProtoSupportedHandleType:(unsigned int)a3;
- (void)clearEmergencyHandles;
- (void)clearEmergencyLabeledHandles;
- (void)clearHandoffIdentifiers;
- (void)clearPrioritizedSenderIdentities;
- (void)clearProtoSupportedHandleTypes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleURLString:(id)a3;
- (void)setEmergencyHandles:(id)a3;
- (void)setEmergencyLabeledHandles:(id)a3;
- (void)setEmergencyTUHandles:(id)a3;
- (void)setEmergencyTULabeledHandles:(id)a3;
- (void)setHandoffIdentifiers:(id)a3;
- (void)setHasMaximumCallGroups:(BOOL)a3;
- (void)setHasMaximumCallsPerCallGroup:(BOOL)a3;
- (void)setHasSupportsAudioAndVideo:(BOOL)a3;
- (void)setHasSupportsAudioOnly:(BOOL)a3;
- (void)setHasSupportsEmergency:(BOOL)a3;
- (void)setHasSupportsRecents:(BOOL)a3;
- (void)setHasSupportsVoicemail:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setMaximumCallGroups:(unsigned int)a3;
- (void)setMaximumCallsPerCallGroup:(unsigned int)a3;
- (void)setOriginalRingtoneSoundURLString:(id)a3;
- (void)setPrioritizedSenderIdentities:(id)a3;
- (void)setPrioritizedTUSenderIdentities:(id)a3;
- (void)setProtoSupportedHandleTypes:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRingtoneSoundURLString:(id)a3;
- (void)setSupportedHandleTypes:(id)a3;
- (void)setSupportsAudioAndVideo:(BOOL)a3;
- (void)setSupportsAudioOnly:(BOOL)a3;
- (void)setSupportsEmergency:(BOOL)a3;
- (void)setSupportsRecents:(BOOL)a3;
- (void)setSupportsVoicemail:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingCallProvider

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSDMessagingCallProvider;
  -[CSDMessagingCallProvider dealloc](&v3, "dealloc");
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0LL;
}

- (BOOL)hasLocalizedName
{
  return self->_localizedName != 0LL;
}

- (BOOL)hasBundleURLString
{
  return self->_bundleURLString != 0LL;
}

- (void)setMaximumCallGroups:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_maximumCallGroups = a3;
}

- (void)setHasMaximumCallGroups:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaximumCallGroups
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setMaximumCallsPerCallGroup:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_maximumCallsPerCallGroup = a3;
}

- (void)setHasMaximumCallsPerCallGroup:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMaximumCallsPerCallGroup
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSupportsAudioOnly:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_supportsAudioOnly = a3;
}

- (void)setHasSupportsAudioOnly:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSupportsAudioOnly
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSupportsAudioAndVideo:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_supportsAudioAndVideo = a3;
}

- (void)setHasSupportsAudioAndVideo:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSupportsAudioAndVideo
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSupportsEmergency:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_supportsEmergency = a3;
}

- (void)setHasSupportsEmergency:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSupportsEmergency
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setSupportsVoicemail:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_supportsVoicemail = a3;
}

- (void)setHasSupportsVoicemail:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSupportsVoicemail
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasRingtoneSoundURLString
{
  return self->_ringtoneSoundURLString != 0LL;
}

- (BOOL)hasOriginalRingtoneSoundURLString
{
  return self->_originalRingtoneSoundURLString != 0LL;
}

- (void)clearHandoffIdentifiers
{
}

- (void)addHandoffIdentifier:(id)a3
{
  id v4 = a3;
  handoffIdentifiers = self->_handoffIdentifiers;
  id v8 = v4;
  if (!handoffIdentifiers)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_handoffIdentifiers;
    self->_handoffIdentifiers = v6;

    id v4 = v8;
    handoffIdentifiers = self->_handoffIdentifiers;
  }

  -[NSMutableArray addObject:](handoffIdentifiers, "addObject:", v4);
}

- (unint64_t)handoffIdentifiersCount
{
  return (unint64_t)-[NSMutableArray count](self->_handoffIdentifiers, "count");
}

- (id)handoffIdentifierAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_handoffIdentifiers, "objectAtIndex:", a3);
}

+ (Class)handoffIdentifierType
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSString, a2);
}

- (unint64_t)protoSupportedHandleTypesCount
{
  return self->_protoSupportedHandleTypes.count;
}

- (unsigned)protoSupportedHandleTypes
{
  return self->_protoSupportedHandleTypes.list;
}

- (void)clearProtoSupportedHandleTypes
{
}

- (void)addProtoSupportedHandleType:(unsigned int)a3
{
}

- (unsigned)protoSupportedHandleTypeAtIndex:(unint64_t)a3
{
  p_protoSupportedHandleTypes = &self->_protoSupportedHandleTypes;
  unint64_t count = self->_protoSupportedHandleTypes.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idx (%lu) is out of range (%lu)",  a3,  count));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSRangeException,  v6,  0LL));
    [v7 raise];
  }

  return p_protoSupportedHandleTypes->list[a3];
}

- (void)setProtoSupportedHandleTypes:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)clearEmergencyLabeledHandles
{
}

- (void)addEmergencyLabeledHandles:(id)a3
{
  id v4 = a3;
  emergencyLabeledHandles = self->_emergencyLabeledHandles;
  id v8 = v4;
  if (!emergencyLabeledHandles)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_emergencyLabeledHandles;
    self->_emergencyLabeledHandles = v6;

    id v4 = v8;
    emergencyLabeledHandles = self->_emergencyLabeledHandles;
  }

  -[NSMutableArray addObject:](emergencyLabeledHandles, "addObject:", v4);
}

- (unint64_t)emergencyLabeledHandlesCount
{
  return (unint64_t)-[NSMutableArray count](self->_emergencyLabeledHandles, "count");
}

- (id)emergencyLabeledHandlesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_emergencyLabeledHandles, "objectAtIndex:", a3);
}

+ (Class)emergencyLabeledHandlesType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingLabeledHandle, a2);
}

- (void)setSupportsRecents:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_supportsRecents = a3;
}

- (void)setHasSupportsRecents:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSupportsRecents
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)clearPrioritizedSenderIdentities
{
}

- (void)addPrioritizedSenderIdentities:(id)a3
{
  id v4 = a3;
  prioritizedSenderIdentities = self->_prioritizedSenderIdentities;
  id v8 = v4;
  if (!prioritizedSenderIdentities)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_prioritizedSenderIdentities;
    self->_prioritizedSenderIdentities = v6;

    id v4 = v8;
    prioritizedSenderIdentities = self->_prioritizedSenderIdentities;
  }

  -[NSMutableArray addObject:](prioritizedSenderIdentities, "addObject:", v4);
}

- (unint64_t)prioritizedSenderIdentitiesCount
{
  return (unint64_t)-[NSMutableArray count](self->_prioritizedSenderIdentities, "count");
}

- (id)prioritizedSenderIdentitiesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_prioritizedSenderIdentities, "objectAtIndex:", a3);
}

+ (Class)prioritizedSenderIdentitiesType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingSenderIdentity, a2);
}

- (void)clearEmergencyHandles
{
}

- (void)addEmergencyHandles:(id)a3
{
  id v4 = a3;
  emergencyHandles = self->_emergencyHandles;
  id v8 = v4;
  if (!emergencyHandles)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_emergencyHandles;
    self->_emergencyHandles = v6;

    id v4 = v8;
    emergencyHandles = self->_emergencyHandles;
  }

  -[NSMutableArray addObject:](emergencyHandles, "addObject:", v4);
}

- (unint64_t)emergencyHandlesCount
{
  return (unint64_t)-[NSMutableArray count](self->_emergencyHandles, "count");
}

- (id)emergencyHandlesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_emergencyHandles, "objectAtIndex:", a3);
}

+ (Class)emergencyHandlesType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDMessagingHandle, a2);
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingCallProvider;
  id v3 = -[CSDMessagingCallProvider description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  localizedName = self->_localizedName;
  if (localizedName) {
    [v4 setObject:localizedName forKey:@"localizedName"];
  }
  bundleURLString = self->_bundleURLString;
  if (bundleURLString) {
    [v4 setObject:bundleURLString forKey:@"bundleURLString"];
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_maximumCallGroups));
    [v4 setObject:v39 forKey:@"maximumCallGroups"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_54;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_maximumCallsPerCallGroup));
  [v4 setObject:v40 forKey:@"maximumCallsPerCallGroup"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_55;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_100078B50(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  identifier = self->_identifier;
  if (identifier) {
    PBDataWriterWriteStringField(v4, identifier, 1LL);
  }
  localizedName = self->_localizedName;
  if (localizedName) {
    PBDataWriterWriteStringField(v5, localizedName, 2LL);
  }
  bundleURLString = self->_bundleURLString;
  if (bundleURLString) {
    PBDataWriterWriteStringField(v5, bundleURLString, 3LL);
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_maximumCallGroups, 4LL);
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_56;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }

  PBDataWriterWriteUint32Field(v5, self->_maximumCallsPerCallGroup, 5LL);
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_57;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v25 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v25;
  }

  if (self->_localizedName)
  {
    objc_msgSend(v25, "setLocalizedName:");
    id v4 = v25;
  }

  if (self->_bundleURLString)
  {
    objc_msgSend(v25, "setBundleURLString:");
    id v4 = v25;
  }

  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_maximumCallGroups;
    v4[128] |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_45;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }

  *((_DWORD *)v4 + 23) = self->_maximumCallsPerCallGroup;
  v4[128] |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_46;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  unint64_t v7 = (void *)v5[9];
  v5[9] = v6;

  id v8 = -[NSString copyWithZone:](self->_localizedName, "copyWithZone:", a3);
  v9 = (void *)v5[10];
  v5[10] = v8;

  id v10 = -[NSString copyWithZone:](self->_bundleURLString, "copyWithZone:", a3);
  unint64_t v11 = (void *)v5[5];
  v5[5] = v10;

  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 22) = self->_maximumCallGroups;
    *((_BYTE *)v5 + 128) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_41;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)v5 + 23) = self->_maximumCallsPerCallGroup;
  *((_BYTE *)v5 + 128) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_42;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 9))
  {
  }

  localizedName = self->_localizedName;
  if ((unint64_t)localizedName | *((void *)v4 + 10))
  {
  }

  bundleURLString = self->_bundleURLString;
  if ((unint64_t)bundleURLString | *((void *)v4 + 5))
  {
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[128] & 1) == 0 || self->_maximumCallGroups != *((_DWORD *)v4 + 22)) {
      goto LABEL_73;
    }
  }

  else if ((v4[128] & 1) != 0)
  {
    goto LABEL_73;
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[128] & 2) == 0 || self->_maximumCallsPerCallGroup != *((_DWORD *)v4 + 23)) {
      goto LABEL_73;
    }
  }

  else if ((v4[128] & 2) != 0)
  {
    goto LABEL_73;
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[128] & 8) == 0) {
      goto LABEL_73;
    }
    if (self->_supportsAudioOnly)
    {
      if (!v4[121]) {
        goto LABEL_73;
      }
    }

    else if (v4[121])
    {
      goto LABEL_73;
    }
  }

  else if ((v4[128] & 8) != 0)
  {
    goto LABEL_73;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[128] & 4) == 0) {
      goto LABEL_73;
    }
    if (self->_supportsAudioAndVideo)
    {
      if (!v4[120]) {
        goto LABEL_73;
      }
    }

    else if (v4[120])
    {
      goto LABEL_73;
    }
  }

  else if ((v4[128] & 4) != 0)
  {
    goto LABEL_73;
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((v4[128] & 0x10) == 0) {
      goto LABEL_73;
    }
    if (self->_supportsEmergency)
    {
      if (!v4[122]) {
        goto LABEL_73;
      }
    }

    else if (v4[122])
    {
      goto LABEL_73;
    }
  }

  else if ((v4[128] & 0x10) != 0)
  {
    goto LABEL_73;
  }

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((v4[128] & 0x40) == 0) {
      goto LABEL_73;
    }
    if (self->_supportsVoicemail)
    {
      if (!v4[124]) {
        goto LABEL_73;
      }
    }

    else if (v4[124])
    {
      goto LABEL_73;
    }
  }

  else if ((v4[128] & 0x40) != 0)
  {
    goto LABEL_73;
  }

  ringtoneSoundURLString = self->_ringtoneSoundURLString;
  if ((unint64_t)ringtoneSoundURLString | *((void *)v4 + 14)
    && !-[NSString isEqual:](ringtoneSoundURLString, "isEqual:"))
  {
    goto LABEL_73;
  }

  originalRingtoneSoundURLString = self->_originalRingtoneSoundURLString;
  if ((unint64_t)originalRingtoneSoundURLString | *((void *)v4 + 12))
  {
  }

  handoffIdentifiers = self->_handoffIdentifiers;
  if ((unint64_t)handoffIdentifiers | *((void *)v4 + 8))
  {
  }

  emergencyLabeledHandles = self->_emergencyLabeledHandles;
  if ((unint64_t)emergencyLabeledHandles | *((void *)v4 + 7))
  {
  }

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((v4[128] & 0x20) != 0)
    {
      if (self->_supportsRecents)
      {
        if (!v4[123]) {
          goto LABEL_73;
        }
        goto LABEL_67;
      }

      if (!v4[123]) {
        goto LABEL_67;
      }
    }

- (unint64_t)hash
{
  NSUInteger v22 = -[NSString hash](self->_identifier, "hash");
  NSUInteger v21 = -[NSString hash](self->_localizedName, "hash");
  NSUInteger v20 = -[NSString hash](self->_bundleURLString, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t v19 = 2654435761LL * self->_maximumCallGroups;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v18 = 2654435761LL * self->_maximumCallsPerCallGroup;
      if ((*(_BYTE *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  else
  {
    uint64_t v19 = 0LL;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v18 = 0LL;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v16 = 2654435761LL * self->_supportsAudioOnly;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 9)) {
    -[CSDMessagingCallProvider setIdentifier:](self, "setIdentifier:");
  }
  if (*((void *)v4 + 10)) {
    -[CSDMessagingCallProvider setLocalizedName:](self, "setLocalizedName:");
  }
  if (*((void *)v4 + 5)) {
    -[CSDMessagingCallProvider setBundleURLString:](self, "setBundleURLString:");
  }
  char v5 = *((_BYTE *)v4 + 128);
  if ((v5 & 1) != 0)
  {
    self->_maximumCallGroups = *((_DWORD *)v4 + 22);
    *(_BYTE *)&self->_has |= 1u;
    char v5 = *((_BYTE *)v4 + 128);
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_56;
    }
  }

  else if ((*((_BYTE *)v4 + 128) & 2) == 0)
  {
    goto LABEL_9;
  }

  self->_maximumCallsPerCallGroup = *((_DWORD *)v4 + 23);
  *(_BYTE *)&self->_has |= 2u;
  char v5 = *((_BYTE *)v4 + 128);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_57;
  }

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)bundleURLString
{
  return self->_bundleURLString;
}

- (void)setBundleURLString:(id)a3
{
}

- (unsigned)maximumCallGroups
{
  return self->_maximumCallGroups;
}

- (unsigned)maximumCallsPerCallGroup
{
  return self->_maximumCallsPerCallGroup;
}

- (BOOL)supportsAudioOnly
{
  return self->_supportsAudioOnly;
}

- (BOOL)supportsAudioAndVideo
{
  return self->_supportsAudioAndVideo;
}

- (BOOL)supportsEmergency
{
  return self->_supportsEmergency;
}

- (BOOL)supportsVoicemail
{
  return self->_supportsVoicemail;
}

- (NSString)ringtoneSoundURLString
{
  return self->_ringtoneSoundURLString;
}

- (void)setRingtoneSoundURLString:(id)a3
{
}

- (NSString)originalRingtoneSoundURLString
{
  return self->_originalRingtoneSoundURLString;
}

- (void)setOriginalRingtoneSoundURLString:(id)a3
{
}

- (NSMutableArray)handoffIdentifiers
{
  return self->_handoffIdentifiers;
}

- (void)setHandoffIdentifiers:(id)a3
{
}

- (NSMutableArray)emergencyLabeledHandles
{
  return self->_emergencyLabeledHandles;
}

- (void)setEmergencyLabeledHandles:(id)a3
{
}

- (BOOL)supportsRecents
{
  return self->_supportsRecents;
}

- (NSMutableArray)prioritizedSenderIdentities
{
  return self->_prioritizedSenderIdentities;
}

- (void)setPrioritizedSenderIdentities:(id)a3
{
}

- (NSMutableArray)emergencyHandles
{
  return self->_emergencyHandles;
}

- (void)setEmergencyHandles:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

- (CSDMessagingCallProvider)initWithProvider:(id)a3
{
  id v4 = a3;
  char v5 = -[CSDMessagingCallProvider init](self, "init");
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    -[CSDMessagingCallProvider setIdentifier:](v5, "setIdentifier:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedName]);
    -[CSDMessagingCallProvider setLocalizedName:](v5, "setLocalizedName:", v7);

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 handoffIdentifiers]);
    id v9 = [v8 mutableCopy];
    -[CSDMessagingCallProvider setHandoffIdentifiers:](v5, "setHandoffIdentifiers:", v9);

    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleURL]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 absoluteString]);
    -[CSDMessagingCallProvider setBundleURLString:](v5, "setBundleURLString:", v11);

    NSUInteger v12 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
    -[CSDMessagingCallProvider setBundleIdentifier:](v5, "setBundleIdentifier:", v12);

    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 ringtoneSoundURL]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 absoluteString]);
    -[CSDMessagingCallProvider setRingtoneSoundURLString:](v5, "setRingtoneSoundURLString:", v14);

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 originalRingtoneSoundURL]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 absoluteString]);
    -[CSDMessagingCallProvider setOriginalRingtoneSoundURLString:](v5, "setOriginalRingtoneSoundURLString:", v16);

    -[CSDMessagingCallProvider setMaximumCallGroups:]( v5,  "setMaximumCallGroups:",  [v4 maximumCallGroups]);
    -[CSDMessagingCallProvider setMaximumCallsPerCallGroup:]( v5,  "setMaximumCallsPerCallGroup:",  [v4 maximumCallsPerCallGroup]);
    -[CSDMessagingCallProvider setSupportsAudioOnly:]( v5,  "setSupportsAudioOnly:",  [v4 supportsAudioOnly]);
    -[CSDMessagingCallProvider setSupportsAudioAndVideo:]( v5,  "setSupportsAudioAndVideo:",  [v4 supportsAudioAndVideo]);
    -[CSDMessagingCallProvider setSupportsEmergency:]( v5,  "setSupportsEmergency:",  [v4 supportsEmergency]);
    -[CSDMessagingCallProvider setSupportsVoicemail:]( v5,  "setSupportsVoicemail:",  [v4 supportsVoicemail]);
    -[CSDMessagingCallProvider setSupportsRecents:](v5, "setSupportsRecents:", [v4 supportsRecents]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 supportedHandleTypes]);
    -[CSDMessagingCallProvider setSupportedHandleTypes:](v5, "setSupportedHandleTypes:", v17);

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 emergencyHandles]);
    -[CSDMessagingCallProvider setEmergencyTUHandles:](v5, "setEmergencyTUHandles:", v18);

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 emergencyLabeledHandles]);
    -[CSDMessagingCallProvider setEmergencyTULabeledHandles:](v5, "setEmergencyTULabeledHandles:", v19);

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 prioritizedSenderIdentities]);
    -[CSDMessagingCallProvider setPrioritizedTUSenderIdentities:](v5, "setPrioritizedTUSenderIdentities:", v20);
  }

  return v5;
}

- (TUCallProvider)provider
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 138412290;
    __int128 v39 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Initializing TUCallProvider from %@",  (uint8_t *)&v38,  0xCu);
  }

  char v5 = objc_alloc(&OBJC_CLASS___TUCallProvider);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider identifier](self, "identifier"));
  id v7 = -[TUCallProvider initWithIdentifier:](v5, "initWithIdentifier:", v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider localizedName](self, "localizedName"));
  -[TUCallProvider setLocalizedName:](v7, "setLocalizedName:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider bundleURLString](self, "bundleURLString"));
  if (v9)
  {
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider bundleURLString](self, "bundleURLString"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v10));
    -[TUCallProvider setBundleURL:](v7, "setBundleURL:", v11);
  }

  else
  {
    -[TUCallProvider setBundleURL:](v7, "setBundleURL:", 0LL);
  }

  NSUInteger v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUCallProvider bundleURL](v7, "bundleURL"));
  unsigned int v13 = [v12 isFileURL];

  if (!v13) {
    goto LABEL_10;
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUCallProvider bundleURL](v7, "bundleURL"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v14));

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 bundleIdentifier]);
  id v17 = sub_1001704C4();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = (CSDMessagingCallProvider *)objc_claimAutoreleasedReturnValue(-[TUCallProvider bundleURL](v7, "bundleURL"));
    int v38 = 138412546;
    __int128 v39 = v19;
    __int16 v40 = 2112;
    __int128 v41 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Bundle for bundleURL: %@ is %@",  (uint8_t *)&v38,  0x16u);
  }

  if (!v16)
  {
LABEL_10:
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider bundleIdentifier](self, "bundleIdentifier"));

    if (v16)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider bundleIdentifier](self, "bundleIdentifier"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordWithBundleIdentifier:allowPlaceholder:error:",  v20,  0LL,  0LL));

      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider bundleIdentifier](self, "bundleIdentifier"));
      if (v21)
      {
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 URL]);
        -[TUCallProvider setBundleURL:](v7, "setBundleURL:", v22);
      }

      id v23 = sub_1001704C4();
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = (CSDMessagingCallProvider *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider bundleIdentifier](self, "bundleIdentifier"));
        int v38 = 138412546;
        __int128 v39 = v25;
        __int16 v40 = 2112;
        __int128 v41 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Bundle for provider bundle ID: %@ bundle: %@",  (uint8_t *)&v38,  0x16u);
      }
    }
  }

  -[TUCallProvider setBundleIdentifier:](v7, "setBundleIdentifier:", v16);
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider handoffIdentifiers](self, "handoffIdentifiers"));
  -[TUCallProvider setHandoffIdentifiers:](v7, "setHandoffIdentifiers:", v26);

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider ringtoneSoundURLString](self, "ringtoneSoundURLString"));
  if (v27)
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider ringtoneSoundURLString](self, "ringtoneSoundURLString"));
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v28));
    -[TUCallProvider setRingtoneSoundURL:](v7, "setRingtoneSoundURL:", v29);
  }

  else
  {
    -[TUCallProvider setRingtoneSoundURL:](v7, "setRingtoneSoundURL:", 0LL);
  }

  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider originalRingtoneSoundURLString](self, "originalRingtoneSoundURLString"));
  if (v30)
  {
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider originalRingtoneSoundURLString](self, "originalRingtoneSoundURLString"));
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v31));
    -[TUCallProvider setOriginalRingtoneSoundURL:](v7, "setOriginalRingtoneSoundURL:", v32);
  }

  else
  {
    -[TUCallProvider setOriginalRingtoneSoundURL:](v7, "setOriginalRingtoneSoundURL:", 0LL);
  }

  -[TUCallProvider setMaximumCallGroups:]( v7,  "setMaximumCallGroups:",  -[CSDMessagingCallProvider maximumCallGroups](self, "maximumCallGroups"));
  -[TUCallProvider setMaximumCallsPerCallGroup:]( v7,  "setMaximumCallsPerCallGroup:",  -[CSDMessagingCallProvider maximumCallsPerCallGroup](self, "maximumCallsPerCallGroup"));
  -[TUCallProvider setSupportsAudioOnly:]( v7,  "setSupportsAudioOnly:",  -[CSDMessagingCallProvider supportsAudioOnly](self, "supportsAudioOnly"));
  -[TUCallProvider setSupportsAudioAndVideo:]( v7,  "setSupportsAudioAndVideo:",  -[CSDMessagingCallProvider supportsAudioAndVideo](self, "supportsAudioAndVideo"));
  -[TUCallProvider setSupportsEmergency:]( v7,  "setSupportsEmergency:",  -[CSDMessagingCallProvider supportsEmergency](self, "supportsEmergency"));
  -[TUCallProvider setSupportsVoicemail:]( v7,  "setSupportsVoicemail:",  -[CSDMessagingCallProvider supportsVoicemail](self, "supportsVoicemail"));
  -[TUCallProvider setSupportsRecents:]( v7,  "setSupportsRecents:",  -[CSDMessagingCallProvider supportsRecents](self, "supportsRecents"));
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider supportedHandleTypes](self, "supportedHandleTypes"));
  -[TUCallProvider setSupportedHandleTypes:](v7, "setSupportedHandleTypes:", v33);

  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider emergencyTUHandles](self, "emergencyTUHandles"));
  -[TUCallProvider setEmergencyHandles:](v7, "setEmergencyHandles:", v34);

  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider emergencyTULabeledHandles](self, "emergencyTULabeledHandles"));
  -[TUCallProvider setEmergencyLabeledHandles:](v7, "setEmergencyLabeledHandles:", v35);

  __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider prioritizedTUSenderIdentities](self, "prioritizedTUSenderIdentities"));
  -[TUCallProvider setPrioritizedSenderIdentities:](v7, "setPrioritizedSenderIdentities:", v36);

  return v7;
}

- (NSSet)supportedHandleTypes
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( &OBJC_CLASS___NSMutableSet,  "setWithCapacity:",  -[CSDMessagingCallProvider protoSupportedHandleTypesCount](self, "protoSupportedHandleTypesCount")));
  if (-[CSDMessagingCallProvider protoSupportedHandleTypesCount](self, "protoSupportedHandleTypesCount"))
  {
    unint64_t v4 = 0LL;
    do
    {
      char v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CSDMessagingCallProvider protoSupportedHandleTypeAtIndex:]( self,  "protoSupportedHandleTypeAtIndex:",  v4)));
      [v3 addObject:v5];

      ++v4;
    }

    while (v4 < -[CSDMessagingCallProvider protoSupportedHandleTypesCount](self, "protoSupportedHandleTypesCount"));
  }

  id v6 = [v3 copy];

  return (NSSet *)v6;
}

- (void)setSupportedHandleTypes:(id)a3
{
  id v4 = a3;
  -[CSDMessagingCallProvider clearProtoSupportedHandleTypes](self, "clearProtoSupportedHandleTypes");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CSDMessagingCallProvider addProtoSupportedHandleType:]( self,  "addProtoSupportedHandleType:",  objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "unsignedIntValue", (void)v10));
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (NSArray)emergencyTUHandles
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider emergencyHandles](self, "emergencyHandles"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider emergencyHandles](self, "emergencyHandles"));
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v19;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v17 = v7;
    do
    {
      for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        __int128 v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tuHandle", v17));
        if (v12)
        {
          [v4 addObject:v12];
        }

        else
        {
          id v13 = sub_1001704C4();
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            id v23 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[WARN] Cannot create emergencyTUHandle from CSDMessagingHandle %@",  buf,  0xCu);
          }
        }
      }

      id v8 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }

    while (v8);
  }

  id v15 = [v4 copy];
  return (NSArray *)v15;
}

- (void)setEmergencyTUHandles:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      __int128 v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingHandle handleWithTUHandle:]( &OBJC_CLASS___CSDMessagingHandle,  "handleWithTUHandle:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v10),  (void)v12));
        [v5 addObject:v11];

        __int128 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }

  -[CSDMessagingCallProvider setEmergencyHandles:](self, "setEmergencyHandles:", v5);
}

- (NSArray)emergencyTULabeledHandles
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider emergencyLabeledHandles](self, "emergencyLabeledHandles"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider emergencyLabeledHandles](self, "emergencyLabeledHandles"));
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v19;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v17 = v7;
    do
    {
      for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        __int128 v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tuLabeledHandle", v17));
        if (v12)
        {
          [v4 addObject:v12];
        }

        else
        {
          id v13 = sub_1001704C4();
          __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            id v23 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[WARN] Cannot create emergencyTULabeledHandle from CSDMessagingLabeledHandle %@",  buf,  0xCu);
          }
        }
      }

      id v8 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }

    while (v8);
  }

  id v15 = [v4 copy];
  return (NSArray *)v15;
}

- (void)setEmergencyTULabeledHandles:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      __int128 v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingLabeledHandle handleWithTULabeledHandle:]( &OBJC_CLASS___CSDMessagingLabeledHandle,  "handleWithTULabeledHandle:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v10),  (void)v12));
        [v5 addObject:v11];

        __int128 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }

  -[CSDMessagingCallProvider setEmergencyLabeledHandles:](self, "setEmergencyLabeledHandles:", v5);
}

- (NSOrderedSet)prioritizedTUSenderIdentities
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider prioritizedSenderIdentities](self, "prioritizedSenderIdentities"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableOrderedSet orderedSetWithCapacity:]( NSMutableOrderedSet,  "orderedSetWithCapacity:",  [v3 count]));

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider prioritizedSenderIdentities](self, "prioritizedSenderIdentities", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) tuSenderIdentity]);
        if (v10) {
          [v4 addObject:v10];
        }

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = [v4 copy];
  return (NSOrderedSet *)v11;
}

- (void)setPrioritizedTUSenderIdentities:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      __int128 v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10);
        __int128 v12 = objc_alloc(&OBJC_CLASS___CSDMessagingSenderIdentity);
        __int128 v13 = -[CSDMessagingSenderIdentity initWithTUSenderIdentity:]( v12,  "initWithTUSenderIdentity:",  v11,  (void)v14);
        [v5 addObject:v13];

        __int128 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  -[CSDMessagingCallProvider setPrioritizedSenderIdentities:](self, "setPrioritizedSenderIdentities:", v5);
}

@end