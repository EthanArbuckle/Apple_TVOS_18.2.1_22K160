@interface LogTransactions
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)formattedText;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation LogTransactions

- (id)formattedText
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  if (self && -[NSMutableArray count](self->_transactionIDs, "count"))
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    v4 = self->_transactionIDs;
    id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        v8 = 0LL;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 appendFormat:@"   - %@\n", *(void *)(*((void *)&v11 + 1) + 8 * (void)v8)];
          v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      }

      while (v6);
    }
  }

  else
  {
    [v3 appendFormat:@"   - <no transactions>\n"];
  }

  id v9 = [v3 copy];

  return v9;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___LogTransactions;
  id v3 = -[LogTransactions description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[LogTransactions dictionaryRepresentation](self, "dictionaryRepresentation"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  transactionIDs = self->_transactionIDs;
  if (transactionIDs) {
    [v3 setObject:transactionIDs forKey:@"transactionID"];
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
      if (v6++ >= 9)
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
    if ((v7 >> 3) == 1)
    {
      uint64_t String = PBReaderReadString(a3);
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(String);
      if (v14) {
        sub_10031F7E8((uint64_t)self, v14);
      }
    }

    else
    {
      int v15 = PBReaderSkipValueWithTag(a3);
      if (!v15) {
        return v15;
      }
    }
  }

  LOBYTE(v15) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v15;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  char v5 = self->_transactionIDs;
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
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = self->_transactionIDs;
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
        sub_10031F7E8((uint64_t)v5, v11);

        __int128 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
  {
    transactionIDs = self->_transactionIDs;
    else {
      unsigned __int8 v7 = 1;
    }
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSMutableArray hash](self->_transactionIDs, "hash");
}

- (void).cxx_destruct
{
}

@end