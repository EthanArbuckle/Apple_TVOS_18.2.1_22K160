@interface TPPBDispositionEntry
- (BOOL)hasDisposition;
- (BOOL)hasPeerID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)peerID;
- (TPPBDisposition)disposition;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDisposition:(id)a3;
- (void)setPeerID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBDispositionEntry

- (BOOL)hasPeerID
{
  return self->_peerID != 0LL;
}

- (BOOL)hasDisposition
{
  return self->_disposition != 0LL;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TPPBDispositionEntry;
  v4 = -[TPPBDispositionEntry description](&v8, sel_description);
  v5 = -[TPPBDispositionEntry dictionaryRepresentation](self, "dictionaryRepresentation");
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
  disposition = self->_disposition;
  if (disposition)
  {
    v7 = -[TPPBDisposition dictionaryRepresentation](disposition, "dictionaryRepresentation");
    [v4 setObject:v7 forKey:@"disposition"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBDispositionEntryReadFrom((uint64_t)self, (uint64_t)a3);
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

  if (self->_disposition)
  {
    PBDataWriterWriteSubmessage();
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

  if (self->_disposition)
  {
    objc_msgSend(v5, "setDisposition:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_peerID, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = -[TPPBDisposition copyWithZone:](self->_disposition, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((peerID = self->_peerID, !((unint64_t)peerID | v4[2]))
     || -[NSString isEqual:](peerID, "isEqual:")))
  {
    disposition = self->_disposition;
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
  NSUInteger v3 = -[NSString hash](self->_peerID, "hash");
  return -[TPPBDisposition hash](self->_disposition, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v7 = v4;
  if (v4[2])
  {
    -[TPPBDispositionEntry setPeerID:](self, "setPeerID:");
    id v4 = v7;
  }

  disposition = self->_disposition;
  uint64_t v6 = v4[1];
  if (disposition)
  {
    if (v6)
    {
      -[TPPBDisposition mergeFrom:](disposition, "mergeFrom:");
LABEL_8:
      id v4 = v7;
    }
  }

  else if (v6)
  {
    -[TPPBDispositionEntry setDisposition:](self, "setDisposition:");
    goto LABEL_8;
  }
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
}

- (TPPBDisposition)disposition
{
  return self->_disposition;
}

- (void)setDisposition:(id)a3
{
}

- (void).cxx_destruct
{
}

@end