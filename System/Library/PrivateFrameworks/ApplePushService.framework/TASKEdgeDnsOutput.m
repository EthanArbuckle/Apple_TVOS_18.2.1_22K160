@interface TASKEdgeDnsOutput
+ (Class)ipv4Type;
+ (Class)ipv6Type;
- (BOOL)hasErrorMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)ipv4s;
- (NSMutableArray)ipv6s;
- (NSString)errorMessage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)ipv4AtIndex:(unint64_t)a3;
- (id)ipv6AtIndex:(unint64_t)a3;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)hash;
- (unint64_t)ipv4sCount;
- (unint64_t)ipv6sCount;
- (void)addIpv4:(id)a3;
- (void)addIpv6:(id)a3;
- (void)clearIpv4s;
- (void)clearIpv6s;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)setIpv4s:(id)a3;
- (void)setIpv6s:(id)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TASKEdgeDnsOutput

- (id)statusAsString:(int)a3
{
  if (a3 >= 5) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return *(&off_10011E4A0 + a3);
  }
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Ok"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"Timeout"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"NoData"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"BadName"])
  {
    int v4 = 3;
  }

  else if ([v3 isEqualToString:@"InternalError"])
  {
    int v4 = 4;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearIpv4s
{
}

- (void)addIpv4:(id)a3
{
  id v4 = a3;
  ipv4s = self->_ipv4s;
  id v8 = v4;
  if (!ipv4s)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_ipv4s;
    self->_ipv4s = v6;

    id v4 = v8;
    ipv4s = self->_ipv4s;
  }

  -[NSMutableArray addObject:](ipv4s, "addObject:", v4);
}

- (unint64_t)ipv4sCount
{
  return (unint64_t)-[NSMutableArray count](self->_ipv4s, "count");
}

- (id)ipv4AtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_ipv4s, "objectAtIndex:", a3);
}

+ (Class)ipv4Type
{
  return (Class)objc_opt_class(&OBJC_CLASS___TASKIPAddress, a2);
}

- (void)clearIpv6s
{
}

- (void)addIpv6:(id)a3
{
  id v4 = a3;
  ipv6s = self->_ipv6s;
  id v8 = v4;
  if (!ipv6s)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_ipv6s;
    self->_ipv6s = v6;

    id v4 = v8;
    ipv6s = self->_ipv6s;
  }

  -[NSMutableArray addObject:](ipv6s, "addObject:", v4);
}

- (unint64_t)ipv6sCount
{
  return (unint64_t)-[NSMutableArray count](self->_ipv6s, "count");
}

- (id)ipv6AtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_ipv6s, "objectAtIndex:", a3);
}

+ (Class)ipv6Type
{
  return (Class)objc_opt_class(&OBJC_CLASS___TASKIPAddress, a2);
}

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TASKEdgeDnsOutput;
  id v3 = -[TASKEdgeDnsOutput description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TASKEdgeDnsOutput dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t status = self->_status;
  if (status >= 5) {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_status));
  }
  else {
    v5 = *(&off_10011E4A0 + status);
  }
  [v3 setObject:v5 forKey:@"status"];

  if (-[NSMutableArray count](self->_ipv4s, "count"))
  {
    v6 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_ipv4s, "count"));
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    v7 = self->_ipv4s;
    id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v26,  v31,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v26 + 1) + 8 * (void)i) dictionaryRepresentation]);
          -[NSMutableArray addObject:](v6, "addObject:", v12);
        }

        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v26,  v31,  16LL);
      }

      while (v9);
    }

    [v3 setObject:v6 forKey:@"ipv4"];
  }

  if (-[NSMutableArray count](self->_ipv6s, "count"))
  {
    v13 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_ipv6s, "count"));
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    v14 = self->_ipv6s;
    id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v22,  v30,  16LL);
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (j = 0LL; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v22 + 1) + 8 * (void)j) dictionaryRepresentation]);
          -[NSMutableArray addObject:](v13, "addObject:", v19);
        }

        id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v22,  v30,  16LL);
      }

      while (v16);
    }

    [v3 setObject:v13 forKey:@"ipv6"];
  }

  errorMessage = self->_errorMessage;
  if (errorMessage) {
    [v3 setObject:errorMessage forKey:@"errorMessage"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10001EBAC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field(v4, self->_status, 1LL);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v5 = self->_ipv4s;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage(v4, *(void *)(*((void *)&v20 + 1) + 8LL * (void)v9), 2LL);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
    }

    while (v7);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v10 = self->_ipv6s;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage(v4, *(void *)(*((void *)&v16 + 1) + 8LL * (void)v14), 3LL);
        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
    }

    while (v12);
  }

  errorMessage = self->_errorMessage;
  if (errorMessage) {
    PBDataWriterWriteStringField(v4, errorMessage, 4LL);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  v12[8] = self->_status;
  if (-[TASKEdgeDnsOutput ipv4sCount](self, "ipv4sCount"))
  {
    [v12 clearIpv4s];
    unint64_t v4 = -[TASKEdgeDnsOutput ipv4sCount](self, "ipv4sCount");
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TASKEdgeDnsOutput ipv4AtIndex:](self, "ipv4AtIndex:", i));
        [v12 addIpv4:v7];
      }
    }
  }

  if (-[TASKEdgeDnsOutput ipv6sCount](self, "ipv6sCount"))
  {
    [v12 clearIpv6s];
    unint64_t v8 = -[TASKEdgeDnsOutput ipv6sCount](self, "ipv6sCount");
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0LL; j != v9; ++j)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TASKEdgeDnsOutput ipv6AtIndex:](self, "ipv6AtIndex:", j));
        [v12 addIpv6:v11];
      }
    }
  }

  if (self->_errorMessage) {
    objc_msgSend(v12, "setErrorMessage:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5[8] = self->_status;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v6 = self->_ipv4s;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)v10) copyWithZone:a3];
        [v5 addIpv4:v11];

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
    }

    while (v8);
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v12 = self->_ipv6s;
  id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      __int128 v16 = 0LL;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)v16), "copyWithZone:", a3, (void)v21);
        [v5 addIpv6:v17];

        __int128 v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
    }

    while (v14);
  }

  id v18 = -[NSString copyWithZone:](self->_errorMessage, "copyWithZone:", a3);
  __int128 v19 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && self->_status == *((_DWORD *)v4 + 8)
    && ((ipv4s = self->_ipv4s, !((unint64_t)ipv4s | v4[2]))
     || -[NSMutableArray isEqual:](ipv4s, "isEqual:"))
    && ((ipv6s = self->_ipv6s, !((unint64_t)ipv6s | v4[3]))
     || -[NSMutableArray isEqual:](ipv6s, "isEqual:")))
  {
    errorMessage = self->_errorMessage;
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
  uint64_t v3 = 2654435761LL * self->_status;
  unint64_t v4 = (unint64_t)-[NSMutableArray hash](self->_ipv4s, "hash");
  unint64_t v5 = v4 ^ (unint64_t)-[NSMutableArray hash](self->_ipv6s, "hash");
  return v5 ^ -[NSString hash](self->_errorMessage, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_uint64_t status = *((_DWORD *)v4 + 8);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v5 = *((id *)v4 + 2);
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        -[TASKEdgeDnsOutput addIpv4:](self, "addIpv4:", *(void *)(*((void *)&v19 + 1) + 8LL * (void)i));
      }

      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }

    while (v7);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v10 = *((id *)v4 + 3);
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0LL; j != v12; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[TASKEdgeDnsOutput addIpv6:]( self,  "addIpv6:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)j),  (void)v15);
      }

      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }

    while (v12);
  }

  if (*((void *)v4 + 1)) {
    -[TASKEdgeDnsOutput setErrorMessage:](self, "setErrorMessage:");
  }
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_uint64_t status = a3;
}

- (NSMutableArray)ipv4s
{
  return self->_ipv4s;
}

- (void)setIpv4s:(id)a3
{
}

- (NSMutableArray)ipv6s
{
  return self->_ipv6s;
}

- (void)setIpv6s:(id)a3
{
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end