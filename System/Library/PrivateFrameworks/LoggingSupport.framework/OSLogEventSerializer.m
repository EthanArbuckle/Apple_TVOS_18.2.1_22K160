@interface OSLogEventSerializer
- (BOOL)_isBatchCompleted;
- (NSMutableArray)curBatchDictionaries;
- (NSPredicate)filterPredicate;
- (OSLogEventSerializer)initWithSource:(id)a3 dataProcessingBlock:(id)a4 completionBlock:(id)a5;
- (OSLogEventSource)source;
- (OSLogEventStream)stream;
- (OS_dispatch_queue)target;
- (_OSLogEventSerializationMetadata)metadata;
- (id)_arrayForDecomposedMessage:(id)a3 indicesToRedact:(id)a4;
- (id)_dictForArg:(id)a3 shouldRedactValue:(BOOL)a4;
- (id)_dictForDecomposedMessage:(id)a3 index:(unint64_t)a4 shouldRedact:(BOOL)a5;
- (id)_dictForDecomposedMessage:(id)a3 indicesToRedact:(id)a4;
- (id)_dictForPlaceholder:(id)a3;
- (id)_dictionaryForProxy:(id)a3;
- (id)argumentRedactionBlock;
- (unint64_t)curBatchSize;
- (unint64_t)flags;
- (unint64_t)maxLogEventBatchSize;
- (unint64_t)serializedEventCount;
- (void)_completeBatch:(id)a3;
- (void)_serializeEvent:(id)a3;
- (void)invalidate;
- (void)serializeFromDate:(id)a3;
- (void)serializeFromDate:(id)a3 toDate:(id)a4;
- (void)serializeFromLastBoot;
- (void)serializeFromPosition:(id)a3;
- (void)setArgumentRedactionBlock:(id)a3;
- (void)setCurBatchSize:(unint64_t)a3;
- (void)setFilterPredicate:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setMaxLogEventBatchSize:(unint64_t)a3;
- (void)setTarget:(id)a3;
@end

@implementation OSLogEventSerializer

- (OSLogEventSerializer)initWithSource:(id)a3 dataProcessingBlock:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  v12 = 0LL;
  if (v9 && v10)
  {
    v32.receiver = self;
    v32.super_class = (Class)&OBJC_CLASS___OSLogEventSerializer;
    self = -[OSLogEventSerializer init](&v32, sel_init);
    if (!self)
    {
LABEL_6:
      self = self;
      v12 = self;
      goto LABEL_7;
    }

    v13 = -[OSLogEventStream initWithSource:](objc_alloc(&OBJC_CLASS___OSLogEventStream), "initWithSource:", v8);
    stream = self->_stream;
    self->_stream = v13;

    self->_maxLogEventBatchSize = 1000LL;
    [MEMORY[0x189603FA8] array];
    v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    curBatchDictionaries = self->_curBatchDictionaries;
    self->_curBatchDictionaries = v15;

    v17 = objc_alloc_init(&OBJC_CLASS____OSLogEventSerializationMetadata);
    metadata = self->_metadata;
    self->_metadata = v17;

    -[OSLogEventSerializer stream](self, "stream");
    v12 = (OSLogEventSerializer *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_initWeak(&location, self);
      v19 = self->_stream;
      uint64_t v20 = MEMORY[0x1895F87A8];
      v28[0] = MEMORY[0x1895F87A8];
      v28[1] = 3221225472LL;
      v28[2] = __75__OSLogEventSerializer_initWithSource_dataProcessingBlock_completionBlock___block_invoke;
      v28[3] = &unk_189F0FC68;
      objc_copyWeak(&v30, &location);
      id v21 = v9;
      id v29 = v21;
      -[OSLogEventStreamBase setEventHandler:](v19, "setEventHandler:", v28);
      v22 = self->_stream;
      v24[0] = v20;
      v24[1] = 3221225472LL;
      v24[2] = __75__OSLogEventSerializer_initWithSource_dataProcessingBlock_completionBlock___block_invoke_2;
      v24[3] = &unk_189F0FC90;
      objc_copyWeak(&v27, &location);
      id v25 = v21;
      id v26 = v11;
      -[OSLogEventStreamBase setInvalidationHandler:](v22, "setInvalidationHandler:", v24);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
      goto LABEL_6;
    }
  }

- (void)setFlags:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setFlags:a3];
}

- (unint64_t)flags
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 flags];

  return v3;
}

- (void)setFilterPredicate:(id)a3
{
  id v4 = a3;
  -[OSLogEventSerializer stream](self, "stream");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setFilterPredicate:v4];
}

- (NSPredicate)filterPredicate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 filterPredicate];
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v3;
}

- (void)setTarget:(id)a3
{
  id v4 = a3;
  -[OSLogEventSerializer stream](self, "stream");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setTarget:v4];
}

- (OS_dispatch_queue)target
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 target];
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (OSLogEventSource)source
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 source];
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OSLogEventSource *)v3;
}

- (void)serializeFromDate:(id)a3
{
  id v7 = a3;
  -[OSLogEventSerializer stream](self, "stream");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (v7)
  {
    [v4 activateStreamFromDate:v7];
  }

  else
  {
    [MEMORY[0x189603F50] distantPast];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 activateStreamFromDate:v6];
  }
}

- (void)serializeFromDate:(id)a3 toDate:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  -[OSLogEventSerializer stream](self, "stream");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v11;
  if (v11)
  {
    if (v6)
    {
LABEL_3:
      [v7 activateStreamFromDate:v8 toDate:v6];
      goto LABEL_6;
    }
  }

  else
  {
    [MEMORY[0x189603F50] distantPast];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6) {
      goto LABEL_3;
    }
  }

  -[OSLogEventStream source](self->_stream, "source");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 newestDate];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 activateStreamFromDate:v8 toDate:v10];

LABEL_6:
  if (!v11) {
}
  }

- (void)serializeFromLastBoot
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 activateStreamFromLastBoot];
}

- (void)serializeFromPosition:(id)a3
{
  id v4 = a3;
  -[OSLogEventSerializer stream](self, "stream");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 activateStreamFromPosition:v4];
}

- (void)invalidate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 invalidate];
}

- (void)_serializeEvent:(id)a3
{
  id v14 = a3;
  -[OSLogEventSerializer metadata](self, "metadata");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 firstDate];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    [v14 date];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OSLogEventSerializer metadata](self, "metadata");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setFirstDate:v7];
  }

  [v14 date];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSLogEventSerializer metadata](self, "metadata");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 setLastDate:v9];

  -[OSLogEventSerializer setCurBatchSize:]( self,  "setCurBatchSize:",  -[OSLogEventSerializer curBatchSize](self, "curBatchSize") + 1);
  ++self->_serializedEventCount;
  -[OSLogEventSerializer _dictionaryForProxy:](self, "_dictionaryForProxy:", v14);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:307 description:@"Encountered serialization failure"];
  }
  v12 = -[OSLogEventSerializer curBatchDictionaries](self, "curBatchDictionaries");
  [v12 addObject:v11];
}

- (BOOL)_isBatchCompleted
{
  unint64_t v3 = -[OSLogEventSerializer curBatchSize](self, "curBatchSize");
  return v3 >= -[OSLogEventSerializer maxLogEventBatchSize](self, "maxLogEventBatchSize");
}

- (id)_dictForPlaceholder:(id)a3
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x189603FC8] dictionary];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 rawString];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[OSLogEventSerializer metadata](self, "metadata");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 indexForString:v6];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v8 forKeyedSubscript:@"rs"];
  }

  [v4 tokens];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v9;
  if (v9 && [v9 count])
  {
    id v30 = v6;
    [MEMORY[0x189603FA8] array];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v29 = v10;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v32;
      do
      {
        uint64_t v16 = 0LL;
        do
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8 * v16);
          v18 = -[OSLogEventSerializer metadata](self, "metadata", v29);
          [v18 indexForString:v17];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 addObject:v19];

          ++v16;
        }

        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }

      while (v14);
    }

    [v5 setObject:v11 forKeyedSubscript:@"t"];
    id v10 = v29;
    id v6 = v30;
  }

  objc_msgSend(v4, "typeNamespace", v29);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[OSLogEventSerializer metadata](self, "metadata");
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 indexForString:v20];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v22 forKeyedSubscript:@"tn"];
  }

  [v4 type];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = -[OSLogEventSerializer metadata](self, "metadata");
    [v24 indexForString:v23];
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v25 forKeyedSubscript:@"ty"];
  }

  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v4, "width"));
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v26 forKeyedSubscript:@"w"];

  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v4, "precision"));
  id v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v27 forKeyedSubscript:@"p"];

  return v5;
}

- (id)_dictForArg:(id)a3 shouldRedactValue:(BOOL)a4
{
  id v6 = a3;
  [MEMORY[0x189603FC8] dictionary];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4) {
    uint64_t v8 = 2LL;
  }
  else {
    uint64_t v8 = [v6 availability];
  }
  [MEMORY[0x189607968] numberWithUnsignedInteger:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v9 forKeyedSubscript:@"a"];

  if ([v6 availability])
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v6, "availability"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setObject:v10 forKeyedSubscript:@"a"];
  }

  if ([v6 privacy])
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v6, "privacy"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setObject:v11 forKeyedSubscript:@"p"];
  }

  if ([v6 category])
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v6, "category"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setObject:v12 forKeyedSubscript:@"c"];
  }

  if ([v6 category] == 1)
  {
    if ([v6 scalarCategory])
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v6, "scalarCategory"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v13 forKeyedSubscript:@"sc"];
    }

    if ([v6 scalarType])
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v6, "scalarType"));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v14 forKeyedSubscript:@"st"];
    }
  }

  if (v8 == 3 || !v8)
  {
    uint64_t v15 = [v6 objectRepresentation];
    if (v15)
    {
      uint64_t v16 = (void *)v15;
      if ([v6 category] != 2
        || (-[OSLogEventSerializer metadata](self, "metadata"),
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(),
            [v17 indexForString:v16],
            uint64_t v18 = objc_claimAutoreleasedReturnValue(),
            v16,
            v17,
            (uint64_t v16 = (void *)v18) != 0LL))
      {
        [v7 setObject:v16 forKeyedSubscript:@"or"];
      }
    }
  }

  return v7;
}

- (id)_dictForDecomposedMessage:(id)a3 index:(unint64_t)a4 shouldRedact:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [v8 literalPrefixAtIndex:a4];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 placeholderAtIndex:a4];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 argumentAtIndex:a4];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 || v10 || v11)
  {
    [MEMORY[0x189603FC8] dictionary];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[OSLogEventSerializer metadata](self, "metadata");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 indexForString:v9];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 setObject:v14 forKeyedSubscript:@"lp"];
    }

    if (v10)
    {
      -[OSLogEventSerializer _dictForPlaceholder:](self, "_dictForPlaceholder:", v10);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 setObject:v15 forKeyedSubscript:@"p"];
    }

    if (v11)
    {
      -[OSLogEventSerializer _dictForArg:shouldRedactValue:](self, "_dictForArg:shouldRedactValue:", v11, v5);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 setObject:v16 forKeyedSubscript:@"a"];
    }
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (id)_arrayForDecomposedMessage:(id)a3 indicesToRedact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x189603FA8] array];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 placeholderCount];
  unint64_t v9 = 0LL;
  do
  {
    uint64_t v10 = -[OSLogEventSerializer _dictForDecomposedMessage:index:shouldRedact:]( self,  "_dictForDecomposedMessage:index:shouldRedact:",  v6,  v9,  [v7 containsIndex:v9]);
    if (!v10) {
      break;
    }
    id v11 = (void *)v10;
    [v8 addObject:v10];

    ++v9;
  }

  while (v9 <= [v6 placeholderCount]);

  return v8;
}

- (id)_dictForDecomposedMessage:(id)a3 indicesToRedact:(id)a4
{
  v16[3] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if ([v6 placeholderCount])
    {
      v15[0] = @"pc";
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v6, "placeholderCount"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v8;
      v15[1] = @"s";
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v6, "state"));
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v9;
      v15[2] = @"seg";
      -[OSLogEventSerializer _arrayForDecomposedMessage:indicesToRedact:]( self,  "_arrayForDecomposedMessage:indicesToRedact:",  v6,  v7);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2] = v10;
      [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:3];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v13[0] = @"pc";
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v6, "placeholderCount"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[1] = @"s";
      v14[0] = v8;
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v6, "state"));
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = v9;
      [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:v13 count:2];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (id)_dictionaryForProxy:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [MEMORY[0x189603FC8] dictionary];
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    argumentRedactionBlock = (void (**)(id, id))self->_argumentRedactionBlock;
    if (argumentRedactionBlock)
    {
      argumentRedactionBlock[2](argumentRedactionBlock, v4);
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      id v8 = v7;
      if (v7)
      {
        if ([v7 count])
        {
          unint64_t v9 = [v8 firstIndex];
          [v4 decomposedMessage];
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          unint64_t v11 = [v10 placeholderCount];

          if (v9 < v11)
          {
            -[OSLogEventSerializer metadata](self, "metadata");
            id v12 = (void *)objc_claimAutoreleasedReturnValue();
            [v12 indexForString:@"<value-redacted>"];
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
            [v5 setObject:v13 forKeyedSubscript:@"cm"];
            goto LABEL_11;
          }
        }
      }
    }

    else
    {
      id v8 = 0LL;
    }

    [v4 composedMessage];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15) {
      goto LABEL_12;
    }
    -[OSLogEventSerializer metadata](self, "metadata");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 composedMessage];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 indexForString:v13];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v16 forKeyedSubscript:@"cm"];

LABEL_11:
LABEL_12:
    [v4 processImagePath];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[OSLogEventSerializer metadata](self, "metadata");
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 processImagePath];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 indexForString:v19];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v20 forKeyedSubscript:@"pip"];
    }

    [v4 process];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = -[OSLogEventSerializer metadata](self, "metadata");
      [v4 process];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 indexForString:v23];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v24 forKeyedSubscript:@"p"];
    }

    [v4 senderImagePath];
    id v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[OSLogEventSerializer metadata](self, "metadata");
      id v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 senderImagePath];
      id v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 indexForString:v27];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v28 forKeyedSubscript:@"sip"];
    }

    [v4 sender];
    id v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[OSLogEventSerializer metadata](self, "metadata");
      id v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 sender];
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v30 indexForString:v31];
      __int128 v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v32 forKeyedSubscript:@"send"];
    }

    if ([v4 type])
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v4, "type"));
      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v33 forKeyedSubscript:@"t"];
    }

    if ([v4 logType])
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v4, "logType"));
      __int128 v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v34 forKeyedSubscript:@"lt"];
    }

    if ([v4 size])
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLong:", objc_msgSend(v4, "size"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v35 forKeyedSubscript:@"s"];
    }

    if ([v4 timeToLive])
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v4, "timeToLive"));
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v36 forKeyedSubscript:@"ttl"];
    }

    if ([v4 traceIdentifier])
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v4, "traceIdentifier"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v37 forKeyedSubscript:@"ti"];
    }

    if ([v4 threadIdentifier])
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v4, "threadIdentifier"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v38 forKeyedSubscript:@"tid"];
    }

    if ([v4 processIdentifier])
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v4, "processIdentifier"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v39 forKeyedSubscript:@"pid"];
    }

    if ([v4 activityIdentifier])
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v4, "activityIdentifier"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v40 forKeyedSubscript:@"aid"];
    }

    if ([v4 parentActivityIdentifier])
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v4, "parentActivityIdentifier"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v41 forKeyedSubscript:@"paid"];
    }

    if ([v4 transitionActivityIdentifier])
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v4, "transitionActivityIdentifier"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v42 forKeyedSubscript:@"tai"];
    }

    if ([v4 continuousNanosecondsSinceBoot])
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  objc_msgSend(v4, "continuousNanosecondsSinceBoot"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v43 forKeyedSubscript:@"ns"];
    }

    if ([v4 machContinuousTimestamp])
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v4, "machContinuousTimestamp"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v44 forKeyedSubscript:@"mct"];
    }

    if ([v4 senderImageOffset])
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v4, "senderImageOffset"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v45 forKeyedSubscript:@"sio"];
    }

    [v4 bootUUID];
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      [v4 bootUUID];
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      _dataForUUID(v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v48 forKeyedSubscript:@"b"];
    }

    [v4 processImageUUID];
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      [v4 processImageUUID];
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      _dataForUUID(v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v51 forKeyedSubscript:@"piu"];
    }

    [v4 senderImageUUID];
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      [v4 senderImageUUID];
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      _dataForUUID(v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v54 forKeyedSubscript:@"siu"];
    }

    if ([v4 unixDate])
    {
      _dictForTimeval([v4 unixDate]);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        _dictForTimeval([v4 unixDate]);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 setObject:v56 forKeyedSubscript:@"ud"];
      }
    }

    if ([v4 unixTimeZone])
    {
      _dictForTimezone((unsigned int *)[v4 unixTimeZone]);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (v57)
      {
        _dictForTimezone((unsigned int *)[v4 unixTimeZone]);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 setObject:v58 forKeyedSubscript:@"utz"];
      }
    }

    uint64_t v59 = [v4 backtrace];
    if (v59)
    {
      v60 = (void *)v59;
      [v4 backtrace];
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      [v61 frames];
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v63 = [v62 count];

      if (v63 >= 2)
      {
        [v4 backtrace];
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        _dictArrayForBacktrace(v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        if (v65)
        {
          [v4 backtrace];
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          _dictArrayForBacktrace(v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 setObject:v67 forKeyedSubscript:@"bt"];
        }
      }
    }

    uint64_t v68 = [v4 type];
    if (v68 <= 1023)
    {
      if (v68 == 513)
      {
        if ([v4 creatorActivityIdentifier])
        {
          objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  objc_msgSend(v4, "creatorActivityIdentifier"));
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 setObject:v102 forKeyedSubscript:@"cai"];
        }

        if (![v4 creatorProcessUniqueIdentifier]) {
          goto LABEL_109;
        }
        objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  objc_msgSend(v4, "creatorProcessUniqueIdentifier"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = @"cpui";
        goto LABEL_107;
      }

      if (v68 != 768) {
        goto LABEL_109;
      }
    }

    else
    {
      if (v68 != 1024)
      {
        if (v68 != 1536)
        {
          if (v68 != 1792) {
            goto LABEL_109;
          }
          if ([v4 lossStartMachContinuousTimestamp])
          {
            objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  objc_msgSend(v4, "lossStartMachContinuousTimestamp"));
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            [v5 setObject:v69 forKeyedSubscript:@"lsmct"];
          }

          if ([v4 lossEndMachContinuousTimestamp])
          {
            objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  objc_msgSend(v4, "lossEndMachContinuousTimestamp"));
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            [v5 setObject:v70 forKeyedSubscript:@"lemct"];
          }

          if ([v4 lossStartUnixDate])
          {
            _dictForTimeval([v4 lossStartUnixDate]);
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            if (v71)
            {
              _dictForTimeval([v4 lossStartUnixDate]);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              [v5 setObject:v72 forKeyedSubscript:@"lsud"];
            }
          }

          if ([v4 lossEndUnixDate])
          {
            _dictForTimeval([v4 lossEndUnixDate]);
            v73 = (void *)objc_claimAutoreleasedReturnValue();

            if (v73)
            {
              _dictForTimeval([v4 lossEndUnixDate]);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              [v5 setObject:v74 forKeyedSubscript:@"leud"];
            }
          }

          if ([v4 lossStartUnixTimeZone])
          {
            _dictForTimezone((unsigned int *)[v4 lossStartUnixTimeZone]);
            v75 = (void *)objc_claimAutoreleasedReturnValue();

            if (v75)
            {
              _dictForTimezone((unsigned int *)[v4 lossStartUnixTimeZone]);
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              [v5 setObject:v76 forKeyedSubscript:@"lsutz"];
            }
          }

          if ([v4 lossEndUnixTimeZone])
          {
            _dictForTimezone((unsigned int *)[v4 lossEndUnixTimeZone]);
            v77 = (void *)objc_claimAutoreleasedReturnValue();

            if (v77)
            {
              _dictForTimezone((unsigned int *)[v4 lossEndUnixTimeZone]);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              [v5 setObject:v78 forKeyedSubscript:@"leutz"];
            }
          }

          _dictForLossCount([v4 lossCount]);
          v79 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v79) {
            goto LABEL_109;
          }
          _dictForLossCount([v4 lossCount]);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = @"lc";
          goto LABEL_107;
        }

        if ([v4 signpostIdentifier])
        {
          objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v4, "signpostIdentifier"));
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 setObject:v82 forKeyedSubscript:@"si"];
        }

        if ([v4 signpostType])
        {
          objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v4, "signpostType"));
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 setObject:v83 forKeyedSubscript:@"st"];
        }

        if ([v4 signpostScope])
        {
          objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v4, "signpostScope"));
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 setObject:v84 forKeyedSubscript:@"ss"];
        }

        [v4 signpostName];
        v85 = (void *)objc_claimAutoreleasedReturnValue();

        if (v85)
        {
          v86 = -[OSLogEventSerializer metadata](self, "metadata");
          [v4 signpostName];
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          [v86 indexForString:v87];
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 setObject:v88 forKeyedSubscript:@"sn"];
        }
      }

      [v4 subsystem];
      v89 = (void *)objc_claimAutoreleasedReturnValue();

      if (v89)
      {
        v90 = -[OSLogEventSerializer metadata](self, "metadata");
        [v4 subsystem];
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        [v90 indexForString:v91];
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 setObject:v92 forKeyedSubscript:@"sub"];
      }

      [v4 category];
      v93 = (void *)objc_claimAutoreleasedReturnValue();

      if (v93)
      {
        v94 = -[OSLogEventSerializer metadata](self, "metadata");
        [v4 category];
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        [v94 indexForString:v95];
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 setObject:v96 forKeyedSubscript:@"cat"];
      }
    }

    [v4 formatString];
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    if (v97)
    {
      v98 = -[OSLogEventSerializer metadata](self, "metadata");
      [v4 formatString];
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      [v98 indexForString:v99];
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 setObject:v100 forKeyedSubscript:@"f"];
    }

    [v4 decomposedMessage];
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = -[OSLogEventSerializer _dictForDecomposedMessage:indicesToRedact:]( self,  "_dictForDecomposedMessage:indicesToRedact:",  v101,  v8);
    if (!v80) {
      goto LABEL_108;
    }
    v81 = @"dm";
LABEL_107:
    [v5 setObject:v80 forKeyedSubscript:v81];
LABEL_108:

LABEL_109:
    id v14 = v5;

    goto LABEL_110;
  }

  id v14 = 0LL;
LABEL_110:

  return v14;
}

- (void)_completeBatch:(id)a3
{
  v15[2] = *MEMORY[0x1895F89C0];
  BOOL v5 = (void (**)(id, void *))a3;
  v14[0] = @"Version";
  v14[1] = @"Events";
  v15[0] = &unk_189F1D3E8;
  -[OSLogEventSerializer curBatchDictionaries](self, "curBatchDictionaries");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:2];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  id v13 = 0LL;
  [MEMORY[0x1896079E8] dataWithPropertyList:v7 format:200 options:0 error:&v13];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v13;
  if (!v8)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:608 description:@"Failed to serialize to plist format"];
  }

  v5[2](v5, v8);
  self->_curBatchSize = 0LL;
  [MEMORY[0x189603FA8] array];
  uint64_t v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  curBatchDictionaries = self->_curBatchDictionaries;
  self->_curBatchDictionaries = v10;
}

- (OSLogEventStream)stream
{
  return self->_stream;
}

- (unint64_t)maxLogEventBatchSize
{
  return self->_maxLogEventBatchSize;
}

- (void)setMaxLogEventBatchSize:(unint64_t)a3
{
  self->_maxLogEventBatchSize = a3;
}

- (unint64_t)curBatchSize
{
  return self->_curBatchSize;
}

- (void)setCurBatchSize:(unint64_t)a3
{
  self->_curBatchSize = a3;
}

- (NSMutableArray)curBatchDictionaries
{
  return self->_curBatchDictionaries;
}

- (_OSLogEventSerializationMetadata)metadata
{
  return self->_metadata;
}

- (unint64_t)serializedEventCount
{
  return self->_serializedEventCount;
}

- (id)argumentRedactionBlock
{
  return self->_argumentRedactionBlock;
}

- (void)setArgumentRedactionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

void __75__OSLogEventSerializer_initWithSource_dataProcessingBlock_completionBlock___block_invoke( uint64_t a1,  void *a2)
{
  unint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _serializeEvent:v4];
}

void __75__OSLogEventSerializer_initWithSource_dataProcessingBlock_completionBlock___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained curBatchSize]) {
    [WeakRetained _completeBatch:*(void *)(a1 + 32)];
  }
  uint64_t v4 = [WeakRetained flags];
  [WeakRetained metadata];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setFlags:v4];

  [WeakRetained filterPredicate];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 description];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [WeakRetained metadata];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setFilterPredicateDescription:v7];

  uint64_t v9 = [WeakRetained maxLogEventBatchSize];
  [WeakRetained metadata];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 setMaxLogEventBatchSize:v9];

  uint64_t v11 = [WeakRetained serializedEventCount];
  [WeakRetained metadata];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setSerializedEventCount:v11];

  uint64_t v13 = *(void *)(a1 + 40);
  [WeakRetained metadata];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 dataRepresentation];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v13 + 16))(v13, v15, a2);
}

@end