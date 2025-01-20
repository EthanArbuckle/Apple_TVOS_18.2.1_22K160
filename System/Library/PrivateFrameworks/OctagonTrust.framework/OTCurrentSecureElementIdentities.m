@interface OTCurrentSecureElementIdentities
+ (Class)trustedPeerSecureElementIdentitiesType;
- (BOOL)hasLocalPeerIdentity;
- (BOOL)hasPendingLocalPeerIdentity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)trustedPeerSecureElementIdentities;
- (OTSecureElementPeerIdentity)localPeerIdentity;
- (OTSecureElementPeerIdentity)pendingLocalPeerIdentity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)trustedPeerSecureElementIdentitiesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)trustedPeerSecureElementIdentitiesCount;
- (void)addTrustedPeerSecureElementIdentities:(id)a3;
- (void)clearTrustedPeerSecureElementIdentities;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLocalPeerIdentity:(id)a3;
- (void)setPendingLocalPeerIdentity:(id)a3;
- (void)setTrustedPeerSecureElementIdentities:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTCurrentSecureElementIdentities

- (BOOL)hasLocalPeerIdentity
{
  return self->_localPeerIdentity != 0LL;
}

- (void)clearTrustedPeerSecureElementIdentities
{
}

- (void)addTrustedPeerSecureElementIdentities:(id)a3
{
  id v4 = a3;
  trustedPeerSecureElementIdentities = self->_trustedPeerSecureElementIdentities;
  id v8 = v4;
  if (!trustedPeerSecureElementIdentities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_trustedPeerSecureElementIdentities;
    self->_trustedPeerSecureElementIdentities = v6;

    id v4 = v8;
    trustedPeerSecureElementIdentities = self->_trustedPeerSecureElementIdentities;
  }

  -[NSMutableArray addObject:](trustedPeerSecureElementIdentities, "addObject:", v4);
}

- (unint64_t)trustedPeerSecureElementIdentitiesCount
{
  return -[NSMutableArray count](self->_trustedPeerSecureElementIdentities, "count");
}

- (id)trustedPeerSecureElementIdentitiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_trustedPeerSecureElementIdentities, "objectAtIndex:", a3);
}

- (BOOL)hasPendingLocalPeerIdentity
{
  return self->_pendingLocalPeerIdentity != 0LL;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTCurrentSecureElementIdentities;
  -[OTCurrentSecureElementIdentities description](&v8, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[OTCurrentSecureElementIdentities dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  localPeerIdentity = self->_localPeerIdentity;
  if (localPeerIdentity)
  {
    v5 = -[OTSecureElementPeerIdentity dictionaryRepresentation](localPeerIdentity, "dictionaryRepresentation");
    [v3 setObject:v5 forKey:@"localPeerIdentity"];
  }

  if (-[NSMutableArray count](self->_trustedPeerSecureElementIdentities, "count"))
  {
    v6 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSMutableArray count](self->_trustedPeerSecureElementIdentities, "count"));
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    v7 = self->_trustedPeerSecureElementIdentities;
    uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v6 addObject:v12];
        }

        uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      }

      while (v9);
    }

    [v3 setObject:v6 forKey:@"trustedPeerSecureElementIdentities"];
  }

  pendingLocalPeerIdentity = self->_pendingLocalPeerIdentity;
  if (pendingLocalPeerIdentity)
  {
    v14 = -[OTSecureElementPeerIdentity dictionaryRepresentation](pendingLocalPeerIdentity, "dictionaryRepresentation");
    [v3 setObject:v14 forKey:@"pendingLocalPeerIdentity"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return OTCurrentSecureElementIdentitiesReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (self->_localPeerIdentity) {
    PBDataWriterWriteSubmessage();
  }
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v5 = self->_trustedPeerSecureElementIdentities;
  uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  if (self->_pendingLocalPeerIdentity) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_localPeerIdentity) {
    objc_msgSend(v8, "setLocalPeerIdentity:");
  }
  if (-[OTCurrentSecureElementIdentities trustedPeerSecureElementIdentitiesCount]( self,  "trustedPeerSecureElementIdentitiesCount"))
  {
    [v8 clearTrustedPeerSecureElementIdentities];
    unint64_t v4 = -[OTCurrentSecureElementIdentities trustedPeerSecureElementIdentitiesCount]( self,  "trustedPeerSecureElementIdentitiesCount");
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        -[OTCurrentSecureElementIdentities trustedPeerSecureElementIdentitiesAtIndex:]( self,  "trustedPeerSecureElementIdentitiesAtIndex:",  i);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 addTrustedPeerSecureElementIdentities:v7];
      }
    }
  }

  if (self->_pendingLocalPeerIdentity) {
    objc_msgSend(v8, "setPendingLocalPeerIdentity:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  unint64_t v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = -[OTSecureElementPeerIdentity copyWithZone:](self->_localPeerIdentity, "copyWithZone:", a3);
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = self->_trustedPeerSecureElementIdentities;
  uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        __int128 v13 = (void *)objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "copyWithZone:", a3, (void)v17);
        [v5 addTrustedPeerSecureElementIdentities:v13];

        ++v12;
      }

      while (v10 != v12);
      uint64_t v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v10);
  }

  id v14 = -[OTSecureElementPeerIdentity copyWithZone:](self->_pendingLocalPeerIdentity, "copyWithZone:", a3);
  uint64_t v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((localPeerIdentity = self->_localPeerIdentity, !((unint64_t)localPeerIdentity | v4[1]))
     || -[OTSecureElementPeerIdentity isEqual:](localPeerIdentity, "isEqual:"))
    && ((trustedPeerSecureElementIdentities = self->_trustedPeerSecureElementIdentities,
         !((unint64_t)trustedPeerSecureElementIdentities | v4[3]))
     || -[NSMutableArray isEqual:](trustedPeerSecureElementIdentities, "isEqual:")))
  {
    pendingLocalPeerIdentity = self->_pendingLocalPeerIdentity;
    else {
      char v8 = 1;
    }
  }

  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = -[OTSecureElementPeerIdentity hash](self->_localPeerIdentity, "hash");
  uint64_t v4 = -[NSMutableArray hash](self->_trustedPeerSecureElementIdentities, "hash") ^ v3;
  return v4 ^ -[OTSecureElementPeerIdentity hash](self->_pendingLocalPeerIdentity, "hash");
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  localPeerIdentity = self->_localPeerIdentity;
  uint64_t v6 = *((void *)v4 + 1);
  if (localPeerIdentity)
  {
    if (v6) {
      -[OTSecureElementPeerIdentity mergeFrom:](localPeerIdentity, "mergeFrom:");
    }
  }

  else if (v6)
  {
    -[OTCurrentSecureElementIdentities setLocalPeerIdentity:](self, "setLocalPeerIdentity:");
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = *((id *)v4 + 3);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        -[OTCurrentSecureElementIdentities addTrustedPeerSecureElementIdentities:]( self,  "addTrustedPeerSecureElementIdentities:",  *(void *)(*((void *)&v14 + 1) + 8 * i),  (void)v14);
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }

  pendingLocalPeerIdentity = self->_pendingLocalPeerIdentity;
  uint64_t v13 = *((void *)v4 + 2);
  if (pendingLocalPeerIdentity)
  {
    if (v13) {
      -[OTSecureElementPeerIdentity mergeFrom:](pendingLocalPeerIdentity, "mergeFrom:");
    }
  }

  else if (v13)
  {
    -[OTCurrentSecureElementIdentities setPendingLocalPeerIdentity:](self, "setPendingLocalPeerIdentity:");
  }
}

- (OTSecureElementPeerIdentity)localPeerIdentity
{
  return self->_localPeerIdentity;
}

- (void)setLocalPeerIdentity:(id)a3
{
}

- (NSMutableArray)trustedPeerSecureElementIdentities
{
  return self->_trustedPeerSecureElementIdentities;
}

- (void)setTrustedPeerSecureElementIdentities:(id)a3
{
}

- (OTSecureElementPeerIdentity)pendingLocalPeerIdentity
{
  return self->_pendingLocalPeerIdentity;
}

- (void)setPendingLocalPeerIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (Class)trustedPeerSecureElementIdentitiesType
{
  return (Class)objc_opt_class();
}

@end