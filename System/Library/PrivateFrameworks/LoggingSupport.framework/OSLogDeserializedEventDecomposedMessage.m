@interface OSLogDeserializedEventDecomposedMessage
- (NSArray)segments;
- (NSDictionary)backingDict;
- (OSLogDeserializedEventDecomposedMessage)initWithDict:(id)a3 metadata:(id)a4;
- (id)argumentAtIndex:(unint64_t)a3;
- (id)literalPrefixAtIndex:(unint64_t)a3;
- (id)placeholderAtIndex:(unint64_t)a3;
- (unint64_t)placeholderCount;
- (unint64_t)state;
@end

@implementation OSLogDeserializedEventDecomposedMessage

- (OSLogDeserializedEventDecomposedMessage)initWithDict:(id)a3 metadata:(id)a4
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___OSLogDeserializedEventDecomposedMessage;
  v10 = -[OSLogDeserializedEventDecomposedMessage init](&v33, sel_init);
  if (v10)
  {
    [v8 objectForKeyedSubscript:@"seg"];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      id v27 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [MEMORY[0x1896077D8] currentHandler];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v24 = objc_opt_class();
        [v23 handleFailureInMethod:a2, v10, @"EventSerializer.m", 1367, @"Unexpected class: %@. Expected: %@", v24, objc_opt_class() object file lineNumber description];
      }

      SEL v26 = a2;
      v28 = v10;
      [MEMORY[0x189603FA8] array];
      v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      id v13 = v11;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v30;
        do
        {
          uint64_t v17 = 0LL;
          do
          {
            if (*(void *)v30 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * v17);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              [MEMORY[0x1896077D8] currentHandler];
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v25 = objc_opt_class();
              [v20 handleFailureInMethod:v26, v28, @"EventSerializer.m", 1370, @"Unexpected class: %@. Expected: %@", v25, objc_opt_class() object file lineNumber description];
            }

            v19 = -[OSLogDecomposedMessageSegment initWithDict:metadata:]( objc_alloc(&OBJC_CLASS___OSLogDecomposedMessageSegment),  "initWithDict:metadata:",  v18,  v9);
            -[NSArray addObject:](v12, "addObject:", v19);

            ++v17;
          }

          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }

        while (v15);
      }

      v10 = v28;
      segments = v28->_segments;
      v28->_segments = v12;

      id v8 = v27;
    }

    objc_storeStrong((id *)&v10->_backingDict, a3);
  }

  return v10;
}

- (unint64_t)placeholderCount
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"pc"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1382, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)state
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"s"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1383, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (id)literalPrefixAtIndex:(unint64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    uint64_t v9 = 0LL;
  }

  else
  {
    v7 = -[OSLogDeserializedEventDecomposedMessage segments](self, "segments");
    [v7 objectAtIndexedSubscript:a3];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 literalPrefix];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)placeholderAtIndex:(unint64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    uint64_t v9 = 0LL;
  }

  else
  {
    v7 = -[OSLogDeserializedEventDecomposedMessage segments](self, "segments");
    [v7 objectAtIndexedSubscript:a3];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 placeholder];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)argumentAtIndex:(unint64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    uint64_t v9 = 0LL;
  }

  else
  {
    v7 = -[OSLogDeserializedEventDecomposedMessage segments](self, "segments");
    [v7 objectAtIndexedSubscript:a3];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 argument];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (NSDictionary)backingDict
{
  return self->_backingDict;
}

- (NSArray)segments
{
  return self->_segments;
}

- (void).cxx_destruct
{
}

@end