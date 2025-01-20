@interface SOSAccountConfiguration
+ (Class)pendingBackupPeersType;
- (BOOL)hasRingUpdateFlag;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)ringUpdateFlag;
- (NSMutableArray)pendingBackupPeers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pendingBackupPeersAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)pendingBackupPeersCount;
- (void)addPendingBackupPeers:(id)a3;
- (void)clearPendingBackupPeers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRingUpdateFlag:(BOOL)a3;
- (void)setPendingBackupPeers:(id)a3;
- (void)setRingUpdateFlag:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SOSAccountConfiguration

- (void)clearPendingBackupPeers
{
}

- (void)addPendingBackupPeers:(id)a3
{
  id v4 = a3;
  pendingBackupPeers = self->_pendingBackupPeers;
  id v8 = v4;
  if (!pendingBackupPeers)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_pendingBackupPeers;
    self->_pendingBackupPeers = v6;

    id v4 = v8;
    pendingBackupPeers = self->_pendingBackupPeers;
  }

  -[NSMutableArray addObject:](pendingBackupPeers, "addObject:", v4);
}

- (unint64_t)pendingBackupPeersCount
{
  return (unint64_t)-[NSMutableArray count](self->_pendingBackupPeers, "count");
}

- (id)pendingBackupPeersAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_pendingBackupPeers, "objectAtIndex:", a3);
}

- (void)setRingUpdateFlag:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ringUpdateFlag = a3;
}

- (void)setHasRingUpdateFlag:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRingUpdateFlag
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SOSAccountConfiguration;
  id v3 = -[SOSAccountConfiguration description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountConfiguration dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = v3;
  pendingBackupPeers = self->_pendingBackupPeers;
  if (pendingBackupPeers) {
    [v3 setObject:pendingBackupPeers forKey:@"pendingBackupPeers"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_ringUpdateFlag));
    [v4 setObject:v6 forKey:@"ringUpdateFlag"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v5 = 0;
    unsigned int v6 = 0;
    unint64_t v7 = 0LL;
    while (1)
    {
      unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      char v9 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v5 += 7;
      BOOL v10 = v6++ >= 9;
      if (v10)
      {
        unint64_t v7 = 0LL;
        int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v7 = 0LL;
    }
LABEL_13:
    if (v11 || (v7 & 7) == 4) {
      break;
    }
    if ((v7 >> 3) == 2)
    {
      char v15 = 0;
      unsigned int v16 = 0;
      uint64_t v17 = 0LL;
      *(_BYTE *)&self->_has |= 1u;
      while (1)
      {
        unint64_t v18 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        char v19 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v18);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v18 + 1;
        v17 |= (unint64_t)(v19 & 0x7F) << v15;
        if ((v19 & 0x80) == 0) {
          goto LABEL_32;
        }
        v15 += 7;
        BOOL v10 = v16++ >= 9;
        if (v10)
        {
          uint64_t v17 = 0LL;
          goto LABEL_34;
        }
      }

      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_32:
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v17 = 0LL;
      }
LABEL_34:
      self->_ringUpdateFlag = v17 != 0;
    }

    else if ((v7 >> 3) == 1)
    {
      uint64_t String = PBReaderReadString(a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue(String);
      if (v14) {
        -[SOSAccountConfiguration addPendingBackupPeers:](self, "addPendingBackupPeers:", v14);
      }
    }

    else
    {
      int v20 = PBReaderSkipValueWithTag(a3);
      if (!v20) {
        return v20;
      }
    }
  }

  LOBYTE(v20) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v20;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  char v5 = self->_pendingBackupPeers;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      char v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField(v4, *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9), 1LL);
        char v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteBOOLField(v4, self->_ringUpdateFlag, 2LL);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = a3;
  if (-[SOSAccountConfiguration pendingBackupPeersCount](self, "pendingBackupPeersCount"))
  {
    [v8 clearPendingBackupPeers];
    unint64_t v4 = -[SOSAccountConfiguration pendingBackupPeersCount](self, "pendingBackupPeersCount");
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountConfiguration pendingBackupPeersAtIndex:](self, "pendingBackupPeersAtIndex:", i));
        [v8 addPendingBackupPeers:v7];
      }
    }
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8[16] = self->_ringUpdateFlag;
    v8[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = self->_pendingBackupPeers;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      __int128 v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v10), "copyWithZone:", a3, (void)v13);
        [v5 addPendingBackupPeers:v11];

        __int128 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v8);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[16] = self->_ringUpdateFlag;
    v5[20] |= 1u;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  pendingBackupPeers = self->_pendingBackupPeers;
  if ((unint64_t)pendingBackupPeers | *((void *)v4 + 1))
  {
  }

  BOOL v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }

    if (self->_ringUpdateFlag)
    {
      if (!*((_BYTE *)v4 + 16)) {
        goto LABEL_6;
      }
    }

    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_6;
    }

    BOOL v6 = 1;
  }

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[NSMutableArray hash](self->_pendingBackupPeers, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v4 = 2654435761LL * self->_ringUpdateFlag;
  }
  else {
    uint64_t v4 = 0LL;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = *((id *)v4 + 1);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[SOSAccountConfiguration addPendingBackupPeers:]( self,  "addPendingBackupPeers:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9),  (void)v10);
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }

  if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    self->_ringUpdateFlag = *((_BYTE *)v4 + 16);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSMutableArray)pendingBackupPeers
{
  return self->_pendingBackupPeers;
}

- (void)setPendingBackupPeers:(id)a3
{
}

- (BOOL)ringUpdateFlag
{
  return self->_ringUpdateFlag;
}

- (void).cxx_destruct
{
}

+ (Class)pendingBackupPeersType
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSString, a2);
}

@end