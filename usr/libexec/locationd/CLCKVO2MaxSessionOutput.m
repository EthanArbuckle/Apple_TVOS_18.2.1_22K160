@interface CLCKVO2MaxSessionOutput
+ (Class)summariesType;
- (BOOL)hasEstimate;
- (BOOL)hasSessionAttributes;
- (BOOL)hasSessionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLCKVO2MaxEstimate)estimate;
- (CLCKVO2MaxSessionAttributes)sessionAttributes;
- (NSMutableArray)summaries;
- (NSString)sessionId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)summariesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)summariesCount;
- (void)addSummaries:(id)a3;
- (void)clearSummaries;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEstimate:(id)a3;
- (void)setSessionAttributes:(id)a3;
- (void)setSessionId:(id)a3;
- (void)setSummaries:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLCKVO2MaxSessionOutput

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLCKVO2MaxSessionOutput;
  -[CLCKVO2MaxSessionOutput dealloc](&v3, "dealloc");
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0LL;
}

- (BOOL)hasSessionAttributes
{
  return self->_sessionAttributes != 0LL;
}

- (BOOL)hasEstimate
{
  return self->_estimate != 0LL;
}

- (void)clearSummaries
{
}

- (void)addSummaries:(id)a3
{
  summaries = self->_summaries;
  if (!summaries)
  {
    summaries = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_summaries = summaries;
  }

  -[NSMutableArray addObject:](summaries, "addObject:", a3);
}

- (unint64_t)summariesCount
{
  return (unint64_t)-[NSMutableArray count](self->_summaries, "count");
}

- (id)summariesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_summaries, "objectAtIndex:", a3);
}

+ (Class)summariesType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CLCKVO2MaxSummary);
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLCKVO2MaxSessionOutput;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[CLCKVO2MaxSessionOutput description](&v3, "description"),  -[CLCKVO2MaxSessionOutput dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  v4 = v3;
  sessionId = self->_sessionId;
  if (sessionId) {
    [v3 setObject:sessionId forKey:@"sessionId"];
  }
  sessionAttributes = self->_sessionAttributes;
  if (sessionAttributes) {
    objc_msgSend( v4,  "setObject:forKey:",  -[CLCKVO2MaxSessionAttributes dictionaryRepresentation](sessionAttributes, "dictionaryRepresentation"),  @"sessionAttributes");
  }
  estimate = self->_estimate;
  if (estimate) {
    objc_msgSend( v4,  "setObject:forKey:",  -[CLCKVO2MaxEstimate dictionaryRepresentation](estimate, "dictionaryRepresentation"),  @"estimate");
  }
  if (-[NSMutableArray count](self->_summaries, "count"))
  {
    v8 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_summaries, "count"));
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    summaries = self->_summaries;
    id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( summaries,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(summaries);
          }
          -[NSMutableArray addObject:]( v8,  "addObject:",  [*(id *)(*((void *)&v15 + 1) + 8 * (void)i) dictionaryRepresentation]);
        }

        id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( summaries,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      }

      while (v11);
    }

    [v4 setObject:v8 forKey:@"summaries"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100AD655C((id *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  sessionId = self->_sessionId;
  if (sessionId) {
    PBDataWriterWriteStringField(a3, sessionId, 1LL);
  }
  sessionAttributes = self->_sessionAttributes;
  if (sessionAttributes) {
    PBDataWriterWriteSubmessage(a3, sessionAttributes, 2LL);
  }
  estimate = self->_estimate;
  if (estimate) {
    PBDataWriterWriteSubmessage(a3, estimate, 3LL);
  }
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  summaries = self->_summaries;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( summaries,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(summaries);
        }
        PBDataWriterWriteSubmessage(a3, *(void *)(*((void *)&v13 + 1) + 8LL * (void)v12), 4LL);
        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( summaries,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v10);
  }

- (void)copyTo:(id)a3
{
  if (self->_sessionId) {
    objc_msgSend(a3, "setSessionId:");
  }
  if (self->_sessionAttributes) {
    objc_msgSend(a3, "setSessionAttributes:");
  }
  if (self->_estimate) {
    objc_msgSend(a3, "setEstimate:");
  }
  if (-[CLCKVO2MaxSessionOutput summariesCount](self, "summariesCount"))
  {
    [a3 clearSummaries];
    unint64_t v5 = -[CLCKVO2MaxSessionOutput summariesCount](self, "summariesCount");
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0LL; i != v6; ++i)
        objc_msgSend(a3, "addSummaries:", -[CLCKVO2MaxSessionOutput summariesAtIndex:](self, "summariesAtIndex:", i));
    }
  }

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  v7 = (id *)objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");

  v7[3] = -[NSString copyWithZone:](self->_sessionId, "copyWithZone:", a3);
  v7[2] = -[CLCKVO2MaxSessionAttributes copyWithZone:](self->_sessionAttributes, "copyWithZone:", a3);

  v7[1] = -[CLCKVO2MaxEstimate copyWithZone:](self->_estimate, "copyWithZone:", a3);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  summaries = self->_summaries;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( summaries,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(summaries);
        }
        id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v12) copyWithZone:a3];
        [v7 addSummaries:v13];

        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( summaries,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v10);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (v7)
  {
    sessionId = self->_sessionId;
    if (!((unint64_t)sessionId | *((void *)a3 + 3))
      || (unsigned int v7 = -[NSString isEqual:](sessionId, "isEqual:")) != 0)
    {
      sessionAttributes = self->_sessionAttributes;
      if (!((unint64_t)sessionAttributes | *((void *)a3 + 2))
        || (unsigned int v7 = -[CLCKVO2MaxSessionAttributes isEqual:](sessionAttributes, "isEqual:")) != 0)
      {
        estimate = self->_estimate;
        if (!((unint64_t)estimate | *((void *)a3 + 1))
          || (unsigned int v7 = -[CLCKVO2MaxEstimate isEqual:](estimate, "isEqual:")) != 0)
        {
          summaries = self->_summaries;
          else {
            LOBYTE(v7) = 1;
          }
        }
      }
    }
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_sessionId, "hash");
  unint64_t v4 = -[CLCKVO2MaxSessionAttributes hash](self->_sessionAttributes, "hash") ^ v3;
  unint64_t v5 = -[CLCKVO2MaxEstimate hash](self->_estimate, "hash");
  return v4 ^ v5 ^ (unint64_t)-[NSMutableArray hash](self->_summaries, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 3)) {
    -[CLCKVO2MaxSessionOutput setSessionId:](self, "setSessionId:");
  }
  sessionAttributes = self->_sessionAttributes;
  uint64_t v6 = *((void *)a3 + 2);
  if (sessionAttributes)
  {
    if (v6) {
      -[CLCKVO2MaxSessionAttributes mergeFrom:](sessionAttributes, "mergeFrom:");
    }
  }

  else if (v6)
  {
    -[CLCKVO2MaxSessionOutput setSessionAttributes:](self, "setSessionAttributes:");
  }

  estimate = self->_estimate;
  uint64_t v8 = *((void *)a3 + 1);
  if (estimate)
  {
    if (v8) {
      -[CLCKVO2MaxEstimate mergeFrom:](estimate, "mergeFrom:");
    }
  }

  else if (v8)
  {
    -[CLCKVO2MaxSessionOutput setEstimate:](self, "setEstimate:");
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v9 = (void *)*((void *)a3 + 4);
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[CLCKVO2MaxSessionOutput addSummaries:]( self,  "addSummaries:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)i));
      }

      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v11);
  }

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (CLCKVO2MaxSessionAttributes)sessionAttributes
{
  return self->_sessionAttributes;
}

- (void)setSessionAttributes:(id)a3
{
}

- (CLCKVO2MaxEstimate)estimate
{
  return self->_estimate;
}

- (void)setEstimate:(id)a3
{
}

- (NSMutableArray)summaries
{
  return self->_summaries;
}

- (void)setSummaries:(id)a3
{
}

@end