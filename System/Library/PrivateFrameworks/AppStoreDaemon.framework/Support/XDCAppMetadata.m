@interface XDCAppMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation XDCAppMetadata

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___XDCAppMetadata;
  id v3 = -[XDCAppMetadata description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[XDCAppMetadata dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_type));
    [v3 setObject:v4 forKey:@"type"];
  }

  altDSID = self->_altDSID;
  if (altDSID) {
    [v3 setObject:altDSID forKey:@"altDSID"];
  }
  appleID = self->_appleID;
  if (appleID) {
    [v3 setObject:appleID forKey:@"appleID"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bundleID"];
  }
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_downloaderID));
    [v3 setObject:v8 forKey:@"downloaderID"];
  }

  externalIDString = self->_externalIDString;
  if (externalIDString) {
    [v3 setObject:externalIDString forKey:@"externalIDString"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_externalVersionID));
    [v3 setObject:v33 forKey:@"externalVersionID"];

    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_15:
      if ((has & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }

  else if ((has & 4) == 0)
  {
    goto LABEL_15;
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_itemID));
  [v3 setObject:v34 forKey:@"itemID"];

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_16:
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_purchaserID));
    [v3 setObject:v11 forKey:@"purchaserID"];
  }

- (BOOL)readFrom:(id)a3
{
  return sub_100269D30((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field(v4, self->_type, 1LL);
  }
  altDSID = self->_altDSID;
  if (altDSID) {
    PBDataWriterWriteStringField(v5, altDSID, 2LL);
  }
  appleID = self->_appleID;
  if (appleID) {
    PBDataWriterWriteStringField(v5, appleID, 3LL);
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    PBDataWriterWriteStringField(v5, bundleID, 4LL);
  }
  if ((*(_WORD *)&self->_has & 1) != 0) {
    PBDataWriterWriteUint64Field(v5, self->_downloaderID, 5LL);
  }
  externalIDString = self->_externalIDString;
  if (externalIDString) {
    PBDataWriterWriteStringField(v5, externalIDString, 6LL);
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field(v5, self->_externalVersionID, 7LL);
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_15:
      if ((has & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }

  else if ((has & 4) == 0)
  {
    goto LABEL_15;
  }

  PBDataWriterWriteUint64Field(v5, self->_itemID, 8LL);
  if ((*(_WORD *)&self->_has & 8) != 0) {
LABEL_16:
  }
    PBDataWriterWriteUint64Field(v5, self->_purchaserID, 9LL);
LABEL_17:
  redownloadParams = self->_redownloadParams;
  if (redownloadParams) {
    PBDataWriterWriteStringField(v5, redownloadParams, 10LL);
  }
  artworkURLString = self->_artworkURLString;
  if (artworkURLString) {
    PBDataWriterWriteStringField(v5, artworkURLString, 11LL);
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteBOOLField(v5, self->_containsMessagesExtension, 12LL);
  }
  itemName = self->_itemName;
  if (itemName) {
    PBDataWriterWriteStringField(v5, itemName, 13LL);
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    PBDataWriterWriteBOOLField(v5, self->_launchProhibited, 14LL);
  }
  messagesArtworkURLString = self->_messagesArtworkURLString;
  if (messagesArtworkURLString) {
    PBDataWriterWriteStringField(v5, messagesArtworkURLString, 15LL);
  }
  packageDPInfo = self->_packageDPInfo;
  if (packageDPInfo) {
    PBDataWriterWriteDataField(v5, packageDPInfo, 16LL);
  }
  packageSINF = self->_packageSINF;
  if (packageSINF) {
    PBDataWriterWriteDataField(v5, packageSINF, 17LL);
  }
  packageURLString = self->_packageURLString;
  if (packageURLString) {
    PBDataWriterWriteStringField(v5, packageURLString, 18LL);
  }
  storeCohort = self->_storeCohort;
  if (storeCohort) {
    PBDataWriterWriteStringField(v5, storeCohort, 19LL);
  }
  storeFront = self->_storeFront;
  if (storeFront) {
    PBDataWriterWriteStringField(v5, storeFront, 20LL);
  }
  vendorName = self->_vendorName;
  if (vendorName) {
    PBDataWriterWriteStringField(v5, vendorName, 21LL);
  }
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  v21 = self->_provisioningProfiles;
  id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v31,  v35,  16LL);
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteDataField(v5, *(void *)(*((void *)&v31 + 1) + 8LL * (void)i), 22LL);
      }

      id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v31,  v35,  16LL);
    }

    while (v23);
  }

  variantID = self->_variantID;
  if (variantID) {
    PBDataWriterWriteStringField(v5, variantID, 23LL);
  }
  __int16 v27 = (__int16)self->_has;
  if ((v27 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField(v5, self->_skipIfInstalled, 24LL);
    __int16 v27 = (__int16)self->_has;
    if ((v27 & 0x40) == 0)
    {
LABEL_52:
      if ((v27 & 0x100) == 0) {
        goto LABEL_53;
      }
      goto LABEL_69;
    }
  }

  else if ((v27 & 0x40) == 0)
  {
    goto LABEL_52;
  }

  PBDataWriterWriteBOOLField(v5, self->_isBeta, 25LL);
  __int16 v27 = (__int16)self->_has;
  if ((v27 & 0x100) == 0)
  {
LABEL_53:
    if ((v27 & 0x80) == 0) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  uint64_t v6 = (uint64_t)v5;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v5[44] = self->_type;
    *((_WORD *)v5 + 104) |= 0x10u;
  }

  id v7 = -[NSString copyWithZone:](self->_altDSID, "copyWithZone:", a3);
  objc_super v8 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v7;

  id v9 = -[NSString copyWithZone:](self->_appleID, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v9;

  id v11 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v11;

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *(void *)(v6 + 8) = self->_downloaderID;
    *(_WORD *)(v6 + 208) |= 1u;
  }

  id v13 = -[NSString copyWithZone:](self->_externalIDString, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v13;

  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_externalVersionID;
    *(_WORD *)(v6 + 208) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }

  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }

  *(void *)(v6 + 24) = self->_itemID;
  *(_WORD *)(v6 + 208) |= 4u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_8:
    *(void *)(v6 + 32) = self->_purchaserID;
    *(_WORD *)(v6 + 208) |= 8u;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  __int16 v6 = *((_WORD *)v4 + 104);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 44)) {
      goto LABEL_117;
    }
  }

  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_117;
  }

  altDSID = self->_altDSID;
  appleID = self->_appleID;
  if ((unint64_t)appleID | *((void *)v4 + 6))
  {
  }

  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((void *)v4 + 9))
  {
  }

  __int16 has = (__int16)self->_has;
  __int16 v11 = *((_WORD *)v4 + 104);
  if ((has & 1) != 0)
  {
    if ((v11 & 1) == 0 || self->_downloaderID != *((void *)v4 + 1)) {
      goto LABEL_117;
    }
  }

  else if ((v11 & 1) != 0)
  {
    goto LABEL_117;
  }

  externalIDString = self->_externalIDString;
  if ((unint64_t)externalIDString | *((void *)v4 + 11))
  {
    __int16 has = (__int16)self->_has;
    __int16 v11 = *((_WORD *)v4 + 104);
  }

  if ((has & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_externalVersionID != *((void *)v4 + 2)) {
      goto LABEL_117;
    }
  }

  else if ((v11 & 2) != 0)
  {
    goto LABEL_117;
  }

  if ((has & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_itemID != *((void *)v4 + 3)) {
      goto LABEL_117;
    }
  }

  else if ((v11 & 4) != 0)
  {
    goto LABEL_117;
  }

  if ((has & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_purchaserID != *((void *)v4 + 4)) {
      goto LABEL_117;
    }
  }

  else if ((v11 & 8) != 0)
  {
    goto LABEL_117;
  }

  redownloadParams = self->_redownloadParams;
  if ((unint64_t)redownloadParams | *((void *)v4 + 19)
    && !-[NSString isEqual:](redownloadParams, "isEqual:"))
  {
    goto LABEL_117;
  }

  artworkURLString = self->_artworkURLString;
  if ((unint64_t)artworkURLString | *((void *)v4 + 7))
  {
  }

  __int16 v15 = (__int16)self->_has;
  __int16 v16 = *((_WORD *)v4 + 104);
  if ((v15 & 0x20) != 0)
  {
    if ((v16 & 0x20) == 0) {
      goto LABEL_117;
    }
    if (self->_containsMessagesExtension)
    {
      if (!*((_BYTE *)v4 + 200)) {
        goto LABEL_117;
      }
    }

    else if (*((_BYTE *)v4 + 200))
    {
      goto LABEL_117;
    }
  }

  else if ((v16 & 0x20) != 0)
  {
    goto LABEL_117;
  }

  itemName = self->_itemName;
  if ((unint64_t)itemName | *((void *)v4 + 12))
  {
    __int16 v15 = (__int16)self->_has;
    __int16 v16 = *((_WORD *)v4 + 104);
  }

  if ((v15 & 0x200) != 0)
  {
    if ((v16 & 0x200) == 0) {
      goto LABEL_117;
    }
    if (self->_launchProhibited)
    {
      if (!*((_BYTE *)v4 + 204)) {
        goto LABEL_117;
      }
    }

    else if (*((_BYTE *)v4 + 204))
    {
      goto LABEL_117;
    }
  }

  else if ((v16 & 0x200) != 0)
  {
    goto LABEL_117;
  }

  messagesArtworkURLString = self->_messagesArtworkURLString;
  if ((unint64_t)messagesArtworkURLString | *((void *)v4 + 14)
    && !-[NSString isEqual:](messagesArtworkURLString, "isEqual:"))
  {
    goto LABEL_117;
  }

  packageDPInfo = self->_packageDPInfo;
  if ((unint64_t)packageDPInfo | *((void *)v4 + 15))
  {
  }

  packageSINF = self->_packageSINF;
  if ((unint64_t)packageSINF | *((void *)v4 + 16))
  {
  }

  packageURLString = self->_packageURLString;
  if ((unint64_t)packageURLString | *((void *)v4 + 17))
  {
  }

  storeCohort = self->_storeCohort;
  if ((unint64_t)storeCohort | *((void *)v4 + 20))
  {
  }

  storeFront = self->_storeFront;
  if ((unint64_t)storeFront | *((void *)v4 + 21))
  {
  }

  vendorName = self->_vendorName;
  if ((unint64_t)vendorName | *((void *)v4 + 24))
  {
  }

  provisioningProfiles = self->_provisioningProfiles;
  if ((unint64_t)provisioningProfiles | *((void *)v4 + 18))
  {
  }

  variantID = self->_variantID;
  if ((unint64_t)variantID | *((void *)v4 + 23))
  {
  }

  __int16 v27 = (__int16)self->_has;
  __int16 v28 = *((_WORD *)v4 + 104);
  if ((v27 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 104) & 0x400) == 0) {
      goto LABEL_117;
    }
    if (self->_skipIfInstalled)
    {
      if (!*((_BYTE *)v4 + 205)) {
        goto LABEL_117;
      }
    }

    else if (*((_BYTE *)v4 + 205))
    {
      goto LABEL_117;
    }
  }

  else if ((*((_WORD *)v4 + 104) & 0x400) != 0)
  {
    goto LABEL_117;
  }

  if ((v27 & 0x40) != 0)
  {
    if ((v28 & 0x40) == 0) {
      goto LABEL_117;
    }
    if (self->_isBeta)
    {
      if (!*((_BYTE *)v4 + 201)) {
        goto LABEL_117;
      }
    }

    else if (*((_BYTE *)v4 + 201))
    {
      goto LABEL_117;
    }
  }

  else if ((v28 & 0x40) != 0)
  {
    goto LABEL_117;
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 104) & 0x100) == 0) {
      goto LABEL_117;
    }
    if (self->_isSystemApp)
    {
      if (!*((_BYTE *)v4 + 203)) {
        goto LABEL_117;
      }
    }

    else if (*((_BYTE *)v4 + 203))
    {
      goto LABEL_117;
    }
  }

  else if ((*((_WORD *)v4 + 104) & 0x100) != 0)
  {
    goto LABEL_117;
  }

  if ((v27 & 0x80) != 0)
  {
    if ((v28 & 0x80) == 0) {
      goto LABEL_117;
    }
    if (self->_isStoreApp)
    {
      if (!*((_BYTE *)v4 + 202)) {
        goto LABEL_117;
      }
    }

    else if (*((_BYTE *)v4 + 202))
    {
      goto LABEL_117;
    }
  }

  else if ((v28 & 0x80) != 0)
  {
    goto LABEL_117;
  }

  bundleVersion = self->_bundleVersion;
  if ((unint64_t)bundleVersion | *((void *)v4 + 10)
    && !-[NSString isEqual:](bundleVersion, "isEqual:"))
  {
    goto LABEL_117;
  }

  manifestURLString = self->_manifestURLString;
  if ((unint64_t)manifestURLString | *((void *)v4 + 13))
  {
  }

  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    if ((*((_WORD *)v4 + 104) & 0x800) == 0) {
      goto LABEL_123;
    }
LABEL_117:
    unsigned __int8 v31 = 0;
    goto LABEL_118;
  }

  if ((*((_WORD *)v4 + 104) & 0x800) == 0) {
    goto LABEL_117;
  }
  if (!self->_suppressDialogs)
  {
    if (!*((_BYTE *)v4 + 206)) {
      goto LABEL_123;
    }
    goto LABEL_117;
  }

  if (!*((_BYTE *)v4 + 206)) {
    goto LABEL_117;
  }
LABEL_123:
  betaBuildGroupID = self->_betaBuildGroupID;
  else {
    unsigned __int8 v31 = 1;
  }
LABEL_118:

  return v31;
}

- (unint64_t)hash
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    uint64_t v35 = 2654435761LL * self->_type;
  }
  else {
    uint64_t v35 = 0LL;
  }
  NSUInteger v34 = -[NSString hash](self->_altDSID, "hash");
  NSUInteger v33 = -[NSString hash](self->_appleID, "hash");
  NSUInteger v32 = -[NSString hash](self->_bundleID, "hash");
  if ((*(_WORD *)&self->_has & 1) != 0) {
    unint64_t v31 = 2654435761u * self->_downloaderID;
  }
  else {
    unint64_t v31 = 0LL;
  }
  NSUInteger v30 = -[NSString hash](self->_externalIDString, "hash");
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
    unint64_t v29 = 0LL;
    if ((has & 4) != 0) {
      goto LABEL_9;
    }
LABEL_12:
    unint64_t v28 = 0LL;
    if ((has & 8) != 0) {
      goto LABEL_10;
    }
    goto LABEL_13;
  }

  unint64_t v29 = 2654435761u * self->_externalVersionID;
  if ((has & 4) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  unint64_t v28 = 2654435761u * self->_itemID;
  if ((has & 8) != 0)
  {
LABEL_10:
    unint64_t v27 = 2654435761u * self->_purchaserID;
    goto LABEL_14;
  }

- (void).cxx_destruct
{
}

@end