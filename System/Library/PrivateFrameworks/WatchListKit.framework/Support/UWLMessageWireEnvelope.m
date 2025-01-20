@interface UWLMessageWireEnvelope
+ (Class)liveActivityEventsType;
+ (Class)optInEventsType;
+ (Class)optOutEventsType;
+ (Class)playEventsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)liveActivityEvents;
- (NSMutableArray)optInEvents;
- (NSMutableArray)optOutEvents;
- (NSMutableArray)playEvents;
- (UWLMessageHeaders)headers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)liveActivityEventsAtIndex:(unint64_t)a3;
- (id)optInEventsAtIndex:(unint64_t)a3;
- (id)optOutEventsAtIndex:(unint64_t)a3;
- (id)playEventsAtIndex:(unint64_t)a3;
- (int)version;
- (unint64_t)hash;
- (unint64_t)liveActivityEventsCount;
- (unint64_t)optInEventsCount;
- (unint64_t)optOutEventsCount;
- (unint64_t)playEventsCount;
- (void)addLiveActivityEvents:(id)a3;
- (void)addOptInEvents:(id)a3;
- (void)addOptOutEvents:(id)a3;
- (void)addPlayEvents:(id)a3;
- (void)clearLiveActivityEvents;
- (void)clearOptInEvents;
- (void)clearOptOutEvents;
- (void)clearPlayEvents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHeaders:(id)a3;
- (void)setLiveActivityEvents:(id)a3;
- (void)setOptInEvents:(id)a3;
- (void)setOptOutEvents:(id)a3;
- (void)setPlayEvents:(id)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation UWLMessageWireEnvelope

- (void)clearPlayEvents
{
}

- (void)addPlayEvents:(id)a3
{
  id v4 = a3;
  playEvents = self->_playEvents;
  id v8 = v4;
  if (!playEvents)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_playEvents;
    self->_playEvents = v6;

    id v4 = v8;
    playEvents = self->_playEvents;
  }

  -[NSMutableArray addObject:](playEvents, "addObject:", v4);
}

- (unint64_t)playEventsCount
{
  return (unint64_t)-[NSMutableArray count](self->_playEvents, "count");
}

- (id)playEventsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_playEvents, "objectAtIndex:", a3);
}

+ (Class)playEventsType
{
  return (Class)objc_opt_class(&OBJC_CLASS___UWLPlayEvent, a2);
}

- (void)clearOptInEvents
{
}

- (void)addOptInEvents:(id)a3
{
  id v4 = a3;
  optInEvents = self->_optInEvents;
  id v8 = v4;
  if (!optInEvents)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_optInEvents;
    self->_optInEvents = v6;

    id v4 = v8;
    optInEvents = self->_optInEvents;
  }

  -[NSMutableArray addObject:](optInEvents, "addObject:", v4);
}

- (unint64_t)optInEventsCount
{
  return (unint64_t)-[NSMutableArray count](self->_optInEvents, "count");
}

- (id)optInEventsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_optInEvents, "objectAtIndex:", a3);
}

+ (Class)optInEventsType
{
  return (Class)objc_opt_class(&OBJC_CLASS___UWLOptInEvent, a2);
}

- (void)clearOptOutEvents
{
}

- (void)addOptOutEvents:(id)a3
{
  id v4 = a3;
  optOutEvents = self->_optOutEvents;
  id v8 = v4;
  if (!optOutEvents)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_optOutEvents;
    self->_optOutEvents = v6;

    id v4 = v8;
    optOutEvents = self->_optOutEvents;
  }

  -[NSMutableArray addObject:](optOutEvents, "addObject:", v4);
}

- (unint64_t)optOutEventsCount
{
  return (unint64_t)-[NSMutableArray count](self->_optOutEvents, "count");
}

- (id)optOutEventsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_optOutEvents, "objectAtIndex:", a3);
}

+ (Class)optOutEventsType
{
  return (Class)objc_opt_class(&OBJC_CLASS___UWLOptOutEvent, a2);
}

- (void)clearLiveActivityEvents
{
}

- (void)addLiveActivityEvents:(id)a3
{
  id v4 = a3;
  liveActivityEvents = self->_liveActivityEvents;
  id v8 = v4;
  if (!liveActivityEvents)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_liveActivityEvents;
    self->_liveActivityEvents = v6;

    id v4 = v8;
    liveActivityEvents = self->_liveActivityEvents;
  }

  -[NSMutableArray addObject:](liveActivityEvents, "addObject:", v4);
}

- (unint64_t)liveActivityEventsCount
{
  return (unint64_t)-[NSMutableArray count](self->_liveActivityEvents, "count");
}

- (id)liveActivityEventsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_liveActivityEvents, "objectAtIndex:", a3);
}

+ (Class)liveActivityEventsType
{
  return (Class)objc_opt_class(&OBJC_CLASS___UWLLiveActivityEvent, a2);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UWLMessageWireEnvelope;
  id v3 = -[UWLMessageWireEnvelope description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UWLMessageWireEnvelope dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_version));
  [v3 setObject:v4 forKey:@"version"];

  headers = self->_headers;
  if (headers)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UWLMessageHeaders dictionaryRepresentation](headers, "dictionaryRepresentation"));
    [v3 setObject:v6 forKey:@"headers"];
  }

  if (-[NSMutableArray count](self->_playEvents, "count"))
  {
    v7 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_playEvents, "count"));
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    objc_super v8 = self->_playEvents;
    id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v48,  v55,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v49;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v49 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v48 + 1) + 8 * (void)i) dictionaryRepresentation]);
          -[NSMutableArray addObject:](v7, "addObject:", v13);
        }

        id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v48,  v55,  16LL);
      }

      while (v10);
    }

    [v3 setObject:v7 forKey:@"play_events"];
  }

  if (-[NSMutableArray count](self->_optInEvents, "count"))
  {
    v14 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_optInEvents, "count"));
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    v15 = self->_optInEvents;
    id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v44,  v54,  16LL);
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v45;
      do
      {
        for (j = 0LL; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v45 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v44 + 1) + 8 * (void)j) dictionaryRepresentation]);
          -[NSMutableArray addObject:](v14, "addObject:", v20);
        }

        id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v44,  v54,  16LL);
      }

      while (v17);
    }

    [v3 setObject:v14 forKey:@"opt_in_events"];
  }

  if (-[NSMutableArray count](self->_optOutEvents, "count"))
  {
    v21 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_optOutEvents, "count"));
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    v22 = self->_optOutEvents;
    id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v40,  v53,  16LL);
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v41;
      do
      {
        for (k = 0LL; k != v24; k = (char *)k + 1)
        {
          if (*(void *)v41 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v40 + 1) + 8 * (void)k) dictionaryRepresentation]);
          -[NSMutableArray addObject:](v21, "addObject:", v27);
        }

        id v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v40,  v53,  16LL);
      }

      while (v24);
    }

    [v3 setObject:v21 forKey:@"opt_out_events"];
  }

  if (-[NSMutableArray count](self->_liveActivityEvents, "count"))
  {
    v28 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_liveActivityEvents, "count"));
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    v29 = self->_liveActivityEvents;
    id v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v36,  v52,  16LL);
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v37;
      do
      {
        for (m = 0LL; m != v31; m = (char *)m + 1)
        {
          if (*(void *)v37 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v36 + 1) + 8 * (void)m),  "dictionaryRepresentation",  (void)v36));
          -[NSMutableArray addObject:](v28, "addObject:", v34);
        }

        id v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v36,  v52,  16LL);
      }

      while (v31);
    }

    [v3 setObject:v28 forKey:@"live_activity_events"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return UWLMessageWireEnvelopeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field(v4, self->_version, 1LL);
  PBDataWriterWriteSubmessage(v4, self->_headers, 2LL);
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  v5 = self->_playEvents;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v37,  v44,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage(v4, *(void *)(*((void *)&v37 + 1) + 8LL * (void)v9), 3LL);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v37,  v44,  16LL);
    }

    while (v7);
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v10 = self->_optInEvents;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v33,  v43,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage(v4, *(void *)(*((void *)&v33 + 1) + 8LL * (void)v14), 4LL);
        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v33,  v43,  16LL);
    }

    while (v12);
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  v15 = self->_optOutEvents;
  id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v29,  v42,  16LL);
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      v19 = 0LL;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage(v4, *(void *)(*((void *)&v29 + 1) + 8LL * (void)v19), 5LL);
        v19 = (char *)v19 + 1;
      }

      while (v17 != v19);
      id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v29,  v42,  16LL);
    }

    while (v17);
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  v20 = self->_liveActivityEvents;
  id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v25,  v41,  16LL);
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      id v24 = 0LL;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage(v4, *(void *)(*((void *)&v25 + 1) + 8LL * (void)v24), 6LL);
        id v24 = (char *)v24 + 1;
      }

      while (v22 != v24);
      id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v25,  v41,  16LL);
    }

    while (v22);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[12] = self->_version;
  id v21 = v4;
  [v4 setHeaders:self->_headers];
  if (-[UWLMessageWireEnvelope playEventsCount](self, "playEventsCount"))
  {
    [v21 clearPlayEvents];
    unint64_t v5 = -[UWLMessageWireEnvelope playEventsCount](self, "playEventsCount");
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[UWLMessageWireEnvelope playEventsAtIndex:](self, "playEventsAtIndex:", i));
        [v21 addPlayEvents:v8];
      }
    }
  }

  if (-[UWLMessageWireEnvelope optInEventsCount](self, "optInEventsCount"))
  {
    [v21 clearOptInEvents];
    unint64_t v9 = -[UWLMessageWireEnvelope optInEventsCount](self, "optInEventsCount");
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0LL; j != v10; ++j)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[UWLMessageWireEnvelope optInEventsAtIndex:](self, "optInEventsAtIndex:", j));
        [v21 addOptInEvents:v12];
      }
    }
  }

  if (-[UWLMessageWireEnvelope optOutEventsCount](self, "optOutEventsCount"))
  {
    [v21 clearOptOutEvents];
    unint64_t v13 = -[UWLMessageWireEnvelope optOutEventsCount](self, "optOutEventsCount");
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0LL; k != v14; ++k)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[UWLMessageWireEnvelope optOutEventsAtIndex:](self, "optOutEventsAtIndex:", k));
        [v21 addOptOutEvents:v16];
      }
    }
  }

  if (-[UWLMessageWireEnvelope liveActivityEventsCount](self, "liveActivityEventsCount"))
  {
    [v21 clearLiveActivityEvents];
    unint64_t v17 = -[UWLMessageWireEnvelope liveActivityEventsCount](self, "liveActivityEventsCount");
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0LL; m != v18; ++m)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[UWLMessageWireEnvelope liveActivityEventsAtIndex:](self, "liveActivityEventsAtIndex:", m));
        [v21 addLiveActivityEvents:v20];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5[12] = self->_version;
  id v6 = -[UWLMessageHeaders copyWithZone:](self->_headers, "copyWithZone:", a3);
  id v7 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v6;

  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  uint64_t v8 = self->_playEvents;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v45,  v52,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v46;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v46 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v45 + 1) + 8 * (void)v12) copyWithZone:a3];
        [v5 addPlayEvents:v13];

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v45,  v52,  16LL);
    }

    while (v10);
  }

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  unint64_t v14 = self->_optInEvents;
  id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v41,  v51,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v42;
    do
    {
      unint64_t v18 = 0LL;
      do
      {
        if (*(void *)v42 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [*(id *)(*((void *)&v41 + 1) + 8 * (void)v18) copyWithZone:a3];
        [v5 addOptInEvents:v19];

        unint64_t v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v41,  v51,  16LL);
    }

    while (v16);
  }

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  v20 = self->_optOutEvents;
  id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v37,  v50,  16LL);
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v38;
    do
    {
      id v24 = 0LL;
      do
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = [*(id *)(*((void *)&v37 + 1) + 8 * (void)v24) copyWithZone:a3];
        [v5 addOptOutEvents:v25];

        id v24 = (char *)v24 + 1;
      }

      while (v22 != v24);
      id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v37,  v50,  16LL);
    }

    while (v22);
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v26 = self->_liveActivityEvents;
  id v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v33,  v49,  16LL);
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v34;
    do
    {
      __int128 v30 = 0LL;
      do
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(v26);
        }
        id v31 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * (void)v30), "copyWithZone:", a3, (void)v33);
        [v5 addLiveActivityEvents:v31];

        __int128 v30 = (char *)v30 + 1;
      }

      while (v28 != v30);
      id v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v33,  v49,  16LL);
    }

    while (v28);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && self->_version == *((_DWORD *)v4 + 12)
    && ((headers = self->_headers, !((unint64_t)headers | v4[1]))
     || -[UWLMessageHeaders isEqual:](headers, "isEqual:"))
    && ((playEvents = self->_playEvents, !((unint64_t)playEvents | v4[5]))
     || -[NSMutableArray isEqual:](playEvents, "isEqual:"))
    && ((optInEvents = self->_optInEvents, !((unint64_t)optInEvents | v4[3]))
     || -[NSMutableArray isEqual:](optInEvents, "isEqual:"))
    && ((optOutEvents = self->_optOutEvents, !((unint64_t)optOutEvents | v4[4]))
     || -[NSMutableArray isEqual:](optOutEvents, "isEqual:")))
  {
    liveActivityEvents = self->_liveActivityEvents;
    else {
      unsigned __int8 v11 = 1;
    }
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761LL * self->_version;
  unint64_t v4 = -[UWLMessageHeaders hash](self->_headers, "hash");
  unint64_t v5 = v4 ^ (unint64_t)-[NSMutableArray hash](self->_playEvents, "hash");
  unint64_t v6 = v5 ^ (unint64_t)-[NSMutableArray hash](self->_optInEvents, "hash");
  unint64_t v7 = v6 ^ (unint64_t)-[NSMutableArray hash](self->_optOutEvents, "hash");
  return v7 ^ (unint64_t)-[NSMutableArray hash](self->_liveActivityEvents, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_version = *((_DWORD *)v4 + 12);
  headers = self->_headers;
  uint64_t v6 = *((void *)v4 + 1);
  if (headers)
  {
    if (v6) {
      -[UWLMessageHeaders mergeFrom:](headers, "mergeFrom:");
    }
  }

  else if (v6)
  {
    -[UWLMessageWireEnvelope setHeaders:](self, "setHeaders:");
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v7 = *((id *)v4 + 5);
  id v8 = [v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v40;
    do
    {
      for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        -[UWLMessageWireEnvelope addPlayEvents:]( self,  "addPlayEvents:",  *(void *)(*((void *)&v39 + 1) + 8LL * (void)i));
      }

      id v9 = [v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }

    while (v9);
  }

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v12 = *((id *)v4 + 3);
  id v13 = [v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v36;
    do
    {
      for (uint64_t j = 0LL; j != v14; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        -[UWLMessageWireEnvelope addOptInEvents:]( self,  "addOptInEvents:",  *(void *)(*((void *)&v35 + 1) + 8LL * (void)j));
      }

      id v14 = [v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }

    while (v14);
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v17 = *((id *)v4 + 4);
  id v18 = [v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t k = 0LL; k != v19; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        -[UWLMessageWireEnvelope addOptOutEvents:]( self,  "addOptOutEvents:",  *(void *)(*((void *)&v31 + 1) + 8LL * (void)k));
      }

      id v19 = [v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
    }

    while (v19);
  }

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v22 = *((id *)v4 + 2);
  id v23 = [v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v28;
    do
    {
      for (uint64_t m = 0LL; m != v24; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v22);
        }
        -[UWLMessageWireEnvelope addLiveActivityEvents:]( self,  "addLiveActivityEvents:",  *(void *)(*((void *)&v27 + 1) + 8LL * (void)m),  (void)v27);
      }

      id v24 = [v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
    }

    while (v24);
  }
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (UWLMessageHeaders)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
}

- (NSMutableArray)playEvents
{
  return self->_playEvents;
}

- (void)setPlayEvents:(id)a3
{
}

- (NSMutableArray)optInEvents
{
  return self->_optInEvents;
}

- (void)setOptInEvents:(id)a3
{
}

- (NSMutableArray)optOutEvents
{
  return self->_optOutEvents;
}

- (void)setOptOutEvents:(id)a3
{
}

- (NSMutableArray)liveActivityEvents
{
  return self->_liveActivityEvents;
}

- (void)setLiveActivityEvents:(id)a3
{
}

- (void).cxx_destruct
{
}

@end