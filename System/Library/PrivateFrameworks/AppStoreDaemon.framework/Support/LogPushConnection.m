@interface LogPushConnection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)formattedText;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation LogPushConnection

- (id)formattedText
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  v4 = v3;
  if (self)
  {
    v5 = self->_environment;
    [v4 appendFormat:@"Environment: %@\n", v5];

    token = self->_token;
  }

  else
  {
    [v3 appendFormat:@"Environment: %@\n", 0];
    token = 0LL;
  }

  v7 = token;
  [v4 appendFormat:@"      Token: %@\n", v7];

  if (self && -[NSMutableArray count](self->_messages, "count"))
  {
    [v4 appendFormat:@"   Messages:\n"];
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    v8 = self->_messages;
    id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        v12 = 0LL;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          [v4 appendFormat:@"         - %@\n", *(void *)(*((void *)&v15 + 1) + 8 * (void)v12)];
          v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      }

      while (v10);
    }
  }

  else
  {
    [v4 appendFormat:@"   Messages: <none>\n"];
  }

  id v13 = [v4 copy];

  return v13;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___LogPushConnection;
  id v3 = -[LogPushConnection description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LogPushConnection dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  environment = self->_environment;
  if (environment) {
    [v3 setObject:environment forKey:@"environment"];
  }
  token = self->_token;
  if (token) {
    [v4 setObject:token forKey:@"token"];
  }
  messages = self->_messages;
  if (messages) {
    [v4 setObject:messages forKey:@"messages"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
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
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      unint64_t v13 = v7 >> 3;
      if ((_DWORD)v13 == 2)
      {
        uint64_t String = PBReaderReadString(a3);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(String);
        uint64_t v16 = 24LL;
LABEL_24:
        __int128 v18 = *(void **)&self->PBCodable_opaque[v16];
        *(void *)&self->PBCodable_opaque[v16] = v15;
LABEL_25:

        goto LABEL_27;
      }

      if ((_DWORD)v13 == 1)
      {
        uint64_t v14 = PBReaderReadString(a3);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
        uint64_t v16 = 8LL;
        goto LABEL_24;
      }

      if ((PBReaderSkipValueWithTag(a3) & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }

    uint64_t v17 = PBReaderReadString(a3);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if (v18) {
      sub_10020F324((uint64_t)self, v18);
    }
    goto LABEL_25;
  }

  return *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  environment = self->_environment;
  if (environment) {
    PBDataWriterWriteStringField(v4, environment, 1LL);
  }
  token = self->_token;
  if (token) {
    PBDataWriterWriteStringField(v5, token, 2LL);
  }
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  unint64_t v8 = self->_messages;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteStringField(v5, *(void *)(*((void *)&v13 + 1) + 8LL * (void)v12), 3LL);
        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v10);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_environment, "copyWithZone:", a3);
  unint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = -[NSString copyWithZone:](self->_token, "copyWithZone:", a3);
  id v9 = (void *)v5[3];
  v5[3] = v8;

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v10 = self->_messages;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      __int128 v14 = 0LL;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v14), "copyWithZone:", a3, (void)v17);
        sub_10020F324((uint64_t)v5, v15);

        __int128 v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((environment = self->_environment, !((unint64_t)environment | v4[1]))
     || -[NSString isEqual:](environment, "isEqual:"))
    && ((token = self->_token, !((unint64_t)token | v4[3]))
     || -[NSString isEqual:](token, "isEqual:")))
  {
    messages = self->_messages;
    else {
      unsigned __int8 v9 = 1;
    }
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_environment, "hash");
  unint64_t v4 = -[NSString hash](self->_token, "hash") ^ v3;
  return v4 ^ (unint64_t)-[NSMutableArray hash](self->_messages, "hash");
}

- (void).cxx_destruct
{
}

@end