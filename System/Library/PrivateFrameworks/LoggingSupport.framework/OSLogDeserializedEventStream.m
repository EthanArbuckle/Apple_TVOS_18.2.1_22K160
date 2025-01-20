@interface OSLogDeserializedEventStream
- (BOOL)hasActivated;
- (NSArray)curEventArray;
- (NSDate)firstDate;
- (NSDate)lastDate;
- (NSEnumerator)eventDictionaryEnumerator;
- (OSLogDeserializedEventStream)initWithDataSourceDelegate:(id)a3;
- (OSLogEventDeserializerDataSourceDelegate)dataSourceDelegate;
- (_OSLogEventSerializationMetadata)metadata;
- (id)_eventArrayFromData:(id)a3;
- (id)_nextEventDictionary;
- (void)_iterateThroughEventsWithProxy:(id)a3 filter:(id)a4 startingDate:(id)a5;
- (void)_runInvalidationHandler:(unint64_t)a3;
- (void)_updateEventArray;
- (void)activate;
- (void)activateStreamFromDate:(id)a3;
- (void)setHasActivated:(BOOL)a3;
@end

@implementation OSLogDeserializedEventStream

- (NSDate)firstDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 firstDate];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)lastDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 lastDate];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (OSLogDeserializedEventStream)initWithDataSourceDelegate:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___OSLogDeserializedEventStream;
  v6 = -[OSLogEventStreamBase init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSourceDelegate, a3);
    v8 = -[OSLogDeserializedEventStream dataSourceDelegate](v7, "dataSourceDelegate");
    [v8 metadataChunk];
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[_OSLogEventSerializationMetadata initWithDataRepresentation:]( objc_alloc(&OBJC_CLASS____OSLogEventSerializationMetadata),  "initWithDataRepresentation:",  v9);
    if (!v10)
    {

      v12 = 0LL;
      goto LABEL_6;
    }

    metadata = v7->_metadata;
    v7->_metadata = v10;
  }

  v12 = v7;
LABEL_6:

  return v12;
}

- (id)_nextEventDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 nextObject];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[OSLogDeserializedEventStream _updateEventArray](self, "_updateEventArray");
    -[OSLogDeserializedEventStream eventDictionaryEnumerator](self, "eventDictionaryEnumerator");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 nextObject];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)_runInvalidationHandler:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[OSLogEventStreamBase invalidationHandler](self, "invalidationHandler");
    v7 = (void (**)(id, unint64_t, OSLogEventStreamPosition *))objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(&OBJC_CLASS___OSLogEventStreamPosition);
    v7[2](v7, a3, v6);
  }

- (void)_iterateThroughEventsWithProxy:(id)a3 filter:(id)a4 startingDate:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = -[OSLogDeserializedEventStream _nextEventDictionary](self, "_nextEventDictionary");
  if (v10)
  {
    v11 = (void *)v10;
    LOBYTE(v12) = 0;
    while (1)
    {
      [v18 setCurEventDictionary:v11];
      v13 = -[OSLogDeserializedEventStream metadata](self, "metadata");
      [v18 setMetadata:v13];

      int v14 = 1;
      if (v9 && !v12)
      {
        [v18 date];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v12 = [v15 compare:v9] != -1;

        int v14 = v12;
      }

      if (v8 && v14) {
        int v14 = [v8 evaluateWithObject:v18];
      }
      if (v14)
      {
        -[OSLogEventStreamBase streamHandler](self, "streamHandler");
        v16 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        ((void (**)(void, id))v16)[2](v16, v18);

        if (-[OSLogEventStreamBase invalidated](self, "invalidated")) {
          break;
        }
      }

      uint64_t v17 = -[OSLogDeserializedEventStream _nextEventDictionary](self, "_nextEventDictionary");

      v11 = (void *)v17;
      if (!v17) {
        goto LABEL_12;
      }
    }

    -[OSLogDeserializedEventStream _runInvalidationHandler:](self, "_runInvalidationHandler:", 4LL);
  }

  else
  {
LABEL_12:
    if (!-[OSLogEventStreamBase invalidated](self, "invalidated"))
    {
      -[OSLogEventStreamBase invalidate](self, "invalidate");
      -[OSLogDeserializedEventStream _runInvalidationHandler:](self, "_runInvalidationHandler:", 5LL);
    }
  }
}

- (id)_eventArrayFromData:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  id v9 = 0LL;
  [MEMORY[0x1896079E8] propertyListWithData:a3 options:0 format:0 error:&v9];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v9;
  if (v3)
  {
    objc_opt_class();
    id v5 = 0LL;
    if ((objc_opt_isKindOfClass() & 1) != 0 && !v4)
    {
      [v3 objectForKeyedSubscript:@"Version"];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && ![v6 unsignedIntValue])
      {
        [v3 objectForKeyedSubscript:@"Events"];
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
          id v5 = v8;
        }
        else {
          id v5 = 0LL;
        }
      }

      else
      {
        id v5 = 0LL;
      }
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (void)_updateEventArray
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 nextEventDataChunk];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSLogDeserializedEventStream _eventArrayFromData:](self, "_eventArrayFromData:", v4);
  id v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  curEventArray = self->_curEventArray;
  self->_curEventArray = v5;

  -[OSLogDeserializedEventStream curEventArray](self, "curEventArray");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 objectEnumerator];
  v7 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
  eventDictionaryEnumerator = self->_eventDictionaryEnumerator;
  self->_eventDictionaryEnumerator = v7;
}

- (void)activateStreamFromDate:(id)a3
{
  id v5 = a3;
  -[OSLogEventStreamBase queue](self, "queue");
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __55__OSLogDeserializedEventStream_activateStreamFromDate___block_invoke;
  block[3] = &unk_189F0FCB8;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)activate
{
}

- (BOOL)hasActivated
{
  return self->_hasActivated;
}

- (void)setHasActivated:(BOOL)a3
{
  self->_hasActivated = a3;
}

- (_OSLogEventSerializationMetadata)metadata
{
  return self->_metadata;
}

- (OSLogEventDeserializerDataSourceDelegate)dataSourceDelegate
{
  return self->_dataSourceDelegate;
}

- (NSArray)curEventArray
{
  return self->_curEventArray;
}

- (NSEnumerator)eventDictionaryEnumerator
{
  return self->_eventDictionaryEnumerator;
}

- (void).cxx_destruct
{
}

void __55__OSLogDeserializedEventStream_activateStreamFromDate___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"EventSerializer.m", 799, @"Cannot activate %@ without streamHandler block", objc_opt_class() object file lineNumber description];
  }

  if ([*(id *)(a1 + 32) hasActivated])
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"EventSerializer.m", 800, @"Cannot activate the same %@ instance twice", objc_opt_class() object file lineNumber description];
  }

  [*(id *)(a1 + 32) setHasActivated:1];
  [*(id *)(a1 + 32) _updateEventArray];
  [*(id *)(a1 + 32) filterPredicate];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = +[OSLogEventProxy _make](&OBJC_CLASS____OSLogDeserializedEventProxy, "_make");
  [*(id *)(a1 + 32) _iterateThroughEventsWithProxy:v3 filter:v6 startingDate:*(void *)(a1 + 40)];
  [v3 _unmake];
}

@end