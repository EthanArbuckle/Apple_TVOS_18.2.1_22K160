@interface OTApplicantToSponsorRound2M1
- (BOOL)hasPeerID;
- (BOOL)hasPermanentInfo;
- (BOOL)hasPermanentInfoSig;
- (BOOL)hasStableInfo;
- (BOOL)hasStableInfoSig;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)permanentInfo;
- (NSData)permanentInfoSig;
- (NSData)stableInfo;
- (NSData)stableInfoSig;
- (NSString)peerID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setPermanentInfo:(id)a3;
- (void)setPermanentInfoSig:(id)a3;
- (void)setStableInfo:(id)a3;
- (void)setStableInfoSig:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTApplicantToSponsorRound2M1

- (BOOL)hasPeerID
{
  return self->_peerID != 0LL;
}

- (BOOL)hasPermanentInfo
{
  return self->_permanentInfo != 0LL;
}

- (BOOL)hasPermanentInfoSig
{
  return self->_permanentInfoSig != 0LL;
}

- (BOOL)hasStableInfo
{
  return self->_stableInfo != 0LL;
}

- (BOOL)hasStableInfoSig
{
  return self->_stableInfoSig != 0LL;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTApplicantToSponsorRound2M1;
  v4 = -[OTApplicantToSponsorRound2M1 description](&v8, sel_description);
  v5 = -[OTApplicantToSponsorRound2M1 dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  peerID = self->_peerID;
  if (peerID) {
    [v3 setObject:peerID forKey:@"peerID"];
  }
  permanentInfo = self->_permanentInfo;
  if (permanentInfo) {
    [v4 setObject:permanentInfo forKey:@"permanentInfo"];
  }
  permanentInfoSig = self->_permanentInfoSig;
  if (permanentInfoSig) {
    [v4 setObject:permanentInfoSig forKey:@"permanentInfoSig"];
  }
  stableInfo = self->_stableInfo;
  if (stableInfo) {
    [v4 setObject:stableInfo forKey:@"stableInfo"];
  }
  stableInfoSig = self->_stableInfoSig;
  if (stableInfoSig) {
    [v4 setObject:stableInfoSig forKey:@"StableInfoSig"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return OTApplicantToSponsorRound2M1ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_peerID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if (self->_permanentInfo)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }

  if (self->_permanentInfoSig)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }

  if (self->_stableInfo)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }

  if (self->_stableInfoSig)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_peerID)
  {
    objc_msgSend(v4, "setPeerID:");
    id v4 = v5;
  }

  if (self->_permanentInfo)
  {
    objc_msgSend(v5, "setPermanentInfo:");
    id v4 = v5;
  }

  if (self->_permanentInfoSig)
  {
    objc_msgSend(v5, "setPermanentInfoSig:");
    id v4 = v5;
  }

  if (self->_stableInfo)
  {
    objc_msgSend(v5, "setStableInfo:");
    id v4 = v5;
  }

  if (self->_stableInfoSig)
  {
    objc_msgSend(v5, "setStableInfoSig:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_peerID, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = -[NSData copyWithZone:](self->_permanentInfo, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = -[NSData copyWithZone:](self->_permanentInfoSig, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = -[NSData copyWithZone:](self->_stableInfo, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = -[NSData copyWithZone:](self->_stableInfoSig, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((peerID = self->_peerID, !((unint64_t)peerID | v4[1]))
     || -[NSString isEqual:](peerID, "isEqual:"))
    && ((permanentInfo = self->_permanentInfo, !((unint64_t)permanentInfo | v4[2]))
     || -[NSData isEqual:](permanentInfo, "isEqual:"))
    && ((permanentInfoSig = self->_permanentInfoSig, !((unint64_t)permanentInfoSig | v4[3]))
     || -[NSData isEqual:](permanentInfoSig, "isEqual:"))
    && ((stableInfo = self->_stableInfo, !((unint64_t)stableInfo | v4[4]))
     || -[NSData isEqual:](stableInfo, "isEqual:")))
  {
    stableInfoSig = self->_stableInfoSig;
    else {
      char v10 = 1;
    }
  }

  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_peerID, "hash");
  uint64_t v4 = -[NSData hash](self->_permanentInfo, "hash") ^ v3;
  uint64_t v5 = -[NSData hash](self->_permanentInfoSig, "hash");
  uint64_t v6 = v4 ^ v5 ^ -[NSData hash](self->_stableInfo, "hash");
  return v6 ^ -[NSData hash](self->_stableInfoSig, "hash");
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[1]) {
    -[OTApplicantToSponsorRound2M1 setPeerID:](self, "setPeerID:");
  }
  if (v4[2]) {
    -[OTApplicantToSponsorRound2M1 setPermanentInfo:](self, "setPermanentInfo:");
  }
  if (v4[3]) {
    -[OTApplicantToSponsorRound2M1 setPermanentInfoSig:](self, "setPermanentInfoSig:");
  }
  if (v4[4]) {
    -[OTApplicantToSponsorRound2M1 setStableInfo:](self, "setStableInfo:");
  }
  if (v4[5]) {
    -[OTApplicantToSponsorRound2M1 setStableInfoSig:](self, "setStableInfoSig:");
  }
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
}

- (NSData)permanentInfo
{
  return self->_permanentInfo;
}

- (void)setPermanentInfo:(id)a3
{
}

- (NSData)permanentInfoSig
{
  return self->_permanentInfoSig;
}

- (void)setPermanentInfoSig:(id)a3
{
}

- (NSData)stableInfo
{
  return self->_stableInfo;
}

- (void)setStableInfo:(id)a3
{
}

- (NSData)stableInfoSig
{
  return self->_stableInfoSig;
}

- (void)setStableInfoSig:(id)a3
{
}

- (void).cxx_destruct
{
}

@end