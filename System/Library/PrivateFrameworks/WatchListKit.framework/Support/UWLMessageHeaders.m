@interface UWLMessageHeaders
+ (Class)cookiesType;
- (BOOL)hasClientVersion;
- (BOOL)hasPfm;
- (BOOL)hasXGuid;
- (BOOL)hasXUseridKey;
- (BOOL)hasXUseridKeyspace;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)cookies;
- (NSString)pfm;
- (NSString)userAgent;
- (NSString)xAppleStorefront;
- (NSString)xDsid;
- (NSString)xGuid;
- (NSString)xUseridKey;
- (NSString)xUseridKeyspace;
- (id)cookiesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)clientVersion;
- (unint64_t)cookiesCount;
- (unint64_t)hash;
- (void)addCookies:(id)a3;
- (void)clearCookies;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientVersion:(int)a3;
- (void)setCookies:(id)a3;
- (void)setHasClientVersion:(BOOL)a3;
- (void)setPfm:(id)a3;
- (void)setUserAgent:(id)a3;
- (void)setXAppleStorefront:(id)a3;
- (void)setXDsid:(id)a3;
- (void)setXGuid:(id)a3;
- (void)setXUseridKey:(id)a3;
- (void)setXUseridKeyspace:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation UWLMessageHeaders

- (BOOL)hasXGuid
{
  return self->_xGuid != 0LL;
}

- (BOOL)hasXUseridKeyspace
{
  return self->_xUseridKeyspace != 0LL;
}

- (BOOL)hasXUseridKey
{
  return self->_xUseridKey != 0LL;
}

- (void)clearCookies
{
}

- (void)addCookies:(id)a3
{
  id v4 = a3;
  cookies = self->_cookies;
  id v8 = v4;
  if (!cookies)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_cookies;
    self->_cookies = v6;

    id v4 = v8;
    cookies = self->_cookies;
  }

  -[NSMutableArray addObject:](cookies, "addObject:", v4);
}

- (unint64_t)cookiesCount
{
  return (unint64_t)-[NSMutableArray count](self->_cookies, "count");
}

- (id)cookiesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_cookies, "objectAtIndex:", a3);
}

+ (Class)cookiesType
{
  return (Class)objc_opt_class(&OBJC_CLASS___MapEntry, a2);
}

- (BOOL)hasPfm
{
  return self->_pfm != 0LL;
}

- (void)setClientVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_clientVersion = a3;
}

- (void)setHasClientVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClientVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UWLMessageHeaders;
  id v3 = -[UWLMessageHeaders description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UWLMessageHeaders dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = v3;
  userAgent = self->_userAgent;
  if (userAgent) {
    [v3 setObject:userAgent forKey:@"user_agent"];
  }
  xDsid = self->_xDsid;
  if (xDsid) {
    [v4 setObject:xDsid forKey:@"x_dsid"];
  }
  xAppleStorefront = self->_xAppleStorefront;
  if (xAppleStorefront) {
    [v4 setObject:xAppleStorefront forKey:@"x_apple_storefront"];
  }
  xGuid = self->_xGuid;
  if (xGuid) {
    [v4 setObject:xGuid forKey:@"x_guid"];
  }
  xUseridKeyspace = self->_xUseridKeyspace;
  if (xUseridKeyspace) {
    [v4 setObject:xUseridKeyspace forKey:@"x_userid_keyspace"];
  }
  xUseridKey = self->_xUseridKey;
  if (xUseridKey) {
    [v4 setObject:xUseridKey forKey:@"x_userid_key"];
  }
  if (-[NSMutableArray count](self->_cookies, "count"))
  {
    v11 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_cookies, "count"));
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    v12 = self->_cookies;
    id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v21 + 1) + 8 * (void)i),  "dictionaryRepresentation",  (void)v21));
          -[NSMutableArray addObject:](v11, "addObject:", v17);
        }

        id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
      }

      while (v14);
    }

    [v4 setObject:v11 forKey:@"cookies"];
  }

  pfm = self->_pfm;
  if (pfm) {
    [v4 setObject:pfm forKey:@"pfm"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_clientVersion));
    [v4 setObject:v19 forKey:@"client_version"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return UWLMessageHeadersReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteStringField(v4, self->_userAgent, 1LL);
  PBDataWriterWriteStringField(v4, self->_xDsid, 2LL);
  PBDataWriterWriteStringField(v4, self->_xAppleStorefront, 3LL);
  xGuid = self->_xGuid;
  if (xGuid) {
    PBDataWriterWriteStringField(v4, xGuid, 4LL);
  }
  xUseridKeyspace = self->_xUseridKeyspace;
  if (xUseridKeyspace) {
    PBDataWriterWriteStringField(v4, xUseridKeyspace, 6LL);
  }
  xUseridKey = self->_xUseridKey;
  if (xUseridKey) {
    PBDataWriterWriteStringField(v4, xUseridKey, 7LL);
  }
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  objc_super v8 = self->_cookies;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage(v4, *(void *)(*((void *)&v14 + 1) + 8LL * (void)v12), 8LL);
        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v10);
  }

  pfm = self->_pfm;
  if (pfm) {
    PBDataWriterWriteStringField(v4, pfm, 11LL);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteInt32Field(v4, self->_clientVersion, 12LL);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [v8 setUserAgent:self->_userAgent];
  [v8 setXDsid:self->_xDsid];
  [v8 setXAppleStorefront:self->_xAppleStorefront];
  if (self->_xGuid) {
    objc_msgSend(v8, "setXGuid:");
  }
  if (self->_xUseridKeyspace) {
    objc_msgSend(v8, "setXUseridKeyspace:");
  }
  if (self->_xUseridKey) {
    objc_msgSend(v8, "setXUseridKey:");
  }
  if (-[UWLMessageHeaders cookiesCount](self, "cookiesCount"))
  {
    [v8 clearCookies];
    unint64_t v4 = -[UWLMessageHeaders cookiesCount](self, "cookiesCount");
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[UWLMessageHeaders cookiesAtIndex:](self, "cookiesAtIndex:", i));
        [v8 addCookies:v7];
      }
    }
  }

  if (self->_pfm) {
    objc_msgSend(v8, "setPfm:");
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v8 + 2) = self->_clientVersion;
    *((_BYTE *)v8 + 80) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_userAgent, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = -[NSString copyWithZone:](self->_xDsid, "copyWithZone:", a3);
  id v9 = (void *)v5[6];
  v5[6] = v8;

  id v10 = -[NSString copyWithZone:](self->_xAppleStorefront, "copyWithZone:", a3);
  uint64_t v11 = (void *)v5[5];
  v5[5] = v10;

  id v12 = -[NSString copyWithZone:](self->_xGuid, "copyWithZone:", a3);
  id v13 = (void *)v5[7];
  v5[7] = v12;

  id v14 = -[NSString copyWithZone:](self->_xUseridKeyspace, "copyWithZone:", a3);
  __int128 v15 = (void *)v5[9];
  v5[9] = v14;

  id v16 = -[NSString copyWithZone:](self->_xUseridKey, "copyWithZone:", a3);
  __int128 v17 = (void *)v5[8];
  v5[8] = v16;

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  v18 = self->_cookies;
  id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      __int128 v22 = 0LL;
      do
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * (void)v22), "copyWithZone:", a3, (void)v27);
        [v5 addCookies:v23];

        __int128 v22 = (char *)v22 + 1;
      }

      while (v20 != v22);
      id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
    }

    while (v20);
  }

  id v24 = -[NSString copyWithZone:](self->_pfm, "copyWithZone:", a3);
  v25 = (void *)v5[3];
  v5[3] = v24;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 2) = self->_clientVersion;
    *((_BYTE *)v5 + 80) |= 1u;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  userAgent = self->_userAgent;
  if ((unint64_t)userAgent | *((void *)v4 + 4))
  {
  }

  xDsid = self->_xDsid;
  if ((unint64_t)xDsid | *((void *)v4 + 6))
  {
  }

  xAppleStorefront = self->_xAppleStorefront;
  if ((unint64_t)xAppleStorefront | *((void *)v4 + 5))
  {
  }

  xGuid = self->_xGuid;
  if ((unint64_t)xGuid | *((void *)v4 + 7))
  {
  }

  xUseridKeyspace = self->_xUseridKeyspace;
  if ((unint64_t)xUseridKeyspace | *((void *)v4 + 9))
  {
  }

  xUseridKey = self->_xUseridKey;
  if ((unint64_t)xUseridKey | *((void *)v4 + 8))
  {
  }

  cookies = self->_cookies;
  if ((unint64_t)cookies | *((void *)v4 + 2))
  {
  }

  pfm = self->_pfm;
  if ((unint64_t)pfm | *((void *)v4 + 3))
  {
  }

  BOOL v14 = (*((_BYTE *)v4 + 80) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) != 0 && self->_clientVersion == *((_DWORD *)v4 + 2))
    {
      BOOL v14 = 1;
      goto LABEL_23;
    }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_userAgent, "hash");
  NSUInteger v4 = -[NSString hash](self->_xDsid, "hash");
  NSUInteger v5 = -[NSString hash](self->_xAppleStorefront, "hash");
  NSUInteger v6 = -[NSString hash](self->_xGuid, "hash");
  NSUInteger v7 = -[NSString hash](self->_xUseridKeyspace, "hash");
  NSUInteger v8 = -[NSString hash](self->_xUseridKey, "hash");
  unint64_t v9 = (unint64_t)-[NSMutableArray hash](self->_cookies, "hash");
  NSUInteger v10 = -[NSString hash](self->_pfm, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v11 = 2654435761LL * self->_clientVersion;
  }
  else {
    uint64_t v11 = 0LL;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[UWLMessageHeaders setUserAgent:](self, "setUserAgent:");
  }
  if (*((void *)v4 + 6)) {
    -[UWLMessageHeaders setXDsid:](self, "setXDsid:");
  }
  if (*((void *)v4 + 5)) {
    -[UWLMessageHeaders setXAppleStorefront:](self, "setXAppleStorefront:");
  }
  if (*((void *)v4 + 7)) {
    -[UWLMessageHeaders setXGuid:](self, "setXGuid:");
  }
  if (*((void *)v4 + 9)) {
    -[UWLMessageHeaders setXUseridKeyspace:](self, "setXUseridKeyspace:");
  }
  if (*((void *)v4 + 8)) {
    -[UWLMessageHeaders setXUseridKey:](self, "setXUseridKey:");
  }
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v5 = *((id *)v4 + 2);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[UWLMessageHeaders addCookies:]( self,  "addCookies:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)i),  (void)v10);
      }

      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }

  if (*((void *)v4 + 3)) {
    -[UWLMessageHeaders setPfm:](self, "setPfm:");
  }
  if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    self->_clientVersion = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

- (NSString)xDsid
{
  return self->_xDsid;
}

- (void)setXDsid:(id)a3
{
}

- (NSString)xAppleStorefront
{
  return self->_xAppleStorefront;
}

- (void)setXAppleStorefront:(id)a3
{
}

- (NSString)xGuid
{
  return self->_xGuid;
}

- (void)setXGuid:(id)a3
{
}

- (NSString)xUseridKeyspace
{
  return self->_xUseridKeyspace;
}

- (void)setXUseridKeyspace:(id)a3
{
}

- (NSString)xUseridKey
{
  return self->_xUseridKey;
}

- (void)setXUseridKey:(id)a3
{
}

- (NSMutableArray)cookies
{
  return self->_cookies;
}

- (void)setCookies:(id)a3
{
}

- (NSString)pfm
{
  return self->_pfm;
}

- (void)setPfm:(id)a3
{
}

- (int)clientVersion
{
  return self->_clientVersion;
}

- (void).cxx_destruct
{
}

@end