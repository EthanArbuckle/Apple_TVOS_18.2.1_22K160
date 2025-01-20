@interface OTSecureElementPeerIdentity
- (BOOL)hasPeerData;
- (BOOL)hasPeerIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)peerData;
- (NSData)peerIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPeerData:(id)a3;
- (void)setPeerIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTSecureElementPeerIdentity

- (BOOL)hasPeerIdentifier
{
  return self->_peerIdentifier != 0LL;
}

- (BOOL)hasPeerData
{
  return self->_peerData != 0LL;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTSecureElementPeerIdentity;
  v4 = -[OTSecureElementPeerIdentity description](&v8, sel_description);
  v5 = -[OTSecureElementPeerIdentity dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  peerIdentifier = self->_peerIdentifier;
  if (peerIdentifier) {
    [v3 setObject:peerIdentifier forKey:@"peerIdentifier"];
  }
  peerData = self->_peerData;
  if (peerData) {
    [v4 setObject:peerData forKey:@"peerData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return OTSecureElementPeerIdentityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_peerIdentifier)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }

  if (self->_peerData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_peerIdentifier)
  {
    objc_msgSend(v4, "setPeerIdentifier:");
    id v4 = v5;
  }

  if (self->_peerData)
  {
    objc_msgSend(v5, "setPeerData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSData copyWithZone:](self->_peerIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = -[NSData copyWithZone:](self->_peerData, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((peerIdentifier = self->_peerIdentifier, !((unint64_t)peerIdentifier | v4[2]))
     || -[NSData isEqual:](peerIdentifier, "isEqual:")))
  {
    peerData = self->_peerData;
    else {
      char v7 = 1;
    }
  }

  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = -[NSData hash](self->_peerIdentifier, "hash");
  return -[NSData hash](self->_peerData, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[OTSecureElementPeerIdentity setPeerIdentifier:](self, "setPeerIdentifier:");
    id v4 = v5;
  }

  if (v4[1])
  {
    -[OTSecureElementPeerIdentity setPeerData:](self, "setPeerData:");
    id v4 = v5;
  }
}

- (NSData)peerIdentifier
{
  return self->_peerIdentifier;
}

- (void)setPeerIdentifier:(id)a3
{
}

- (NSData)peerData
{
  return self->_peerData;
}

- (void)setPeerData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end