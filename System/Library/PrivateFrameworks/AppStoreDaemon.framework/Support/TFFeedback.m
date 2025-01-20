@interface TFFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation TFFeedback

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TFFeedback;
  id v3 = -[TFFeedback description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TFFeedback dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  email = self->_email;
  if (email) {
    [v3 setObject:email forKey:@"email"];
  }
  if (-[NSMutableArray count](self->_screenshots, "count"))
  {
    v6 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_screenshots, "count"));
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    v7 = self->_screenshots;
    id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v16 + 1) + 8 * (void)i),  "dictionaryRepresentation",  (void)v16));
          -[NSMutableArray addObject:](v6, "addObject:", v12);
        }

        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      }

      while (v9);
    }

    [v4 setObject:v6 forKey:@"screenshots"];
  }

  comment = self->_comment;
  if (comment) {
    [v4 setObject:comment forKey:@"comment"];
  }
  incidentId = self->_incidentId;
  if (incidentId) {
    [v4 setObject:incidentId forKey:@"incidentId"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001DA86C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  email = self->_email;
  if (email) {
    PBDataWriterWriteStringField(v4, email, 1LL);
  }
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v7 = self->_screenshots;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage(v5, *(void *)(*((void *)&v14 + 1) + 8LL * (void)v11), 2LL);
        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v9);
  }

  comment = self->_comment;
  if (comment) {
    PBDataWriterWriteStringField(v5, comment, 3LL);
  }
  incidentId = self->_incidentId;
  if (incidentId) {
    PBDataWriterWriteStringField(v5, incidentId, 4LL);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_email, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = self->_screenshots;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v12), "copyWithZone:", a3, (void)v19);
        sub_1001DA588((uint64_t)v5, v13);

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    }

    while (v10);
  }

  id v14 = -[NSString copyWithZone:](self->_comment, "copyWithZone:", a3);
  __int128 v15 = (void *)v5[1];
  v5[1] = v14;

  id v16 = -[NSString copyWithZone:](self->_incidentId, "copyWithZone:", a3);
  __int128 v17 = (void *)v5[3];
  v5[3] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((email = self->_email, !((unint64_t)email | v4[2]))
     || -[NSString isEqual:](email, "isEqual:"))
    && ((screenshots = self->_screenshots, !((unint64_t)screenshots | v4[4]))
     || -[NSMutableArray isEqual:](screenshots, "isEqual:"))
    && ((comment = self->_comment, !((unint64_t)comment | v4[1]))
     || -[NSString isEqual:](comment, "isEqual:")))
  {
    incidentId = self->_incidentId;
    else {
      unsigned __int8 v10 = 1;
    }
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_email, "hash");
  unint64_t v4 = (unint64_t)-[NSMutableArray hash](self->_screenshots, "hash") ^ v3;
  NSUInteger v5 = -[NSString hash](self->_comment, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_incidentId, "hash");
}

- (void).cxx_destruct
{
}

@end