@interface OSLogDeserializedMessagePlaceholder
- (NSDictionary)backingDict;
- (OSLogDeserializedMessagePlaceholder)initWithDict:(id)a3 metadata:(id)a4;
- (_OSLogEventSerializationMetadata)metadata;
- (id)rawString;
- (id)tokens;
- (id)type;
- (id)typeNamespace;
- (int)precision;
- (int)width;
@end

@implementation OSLogDeserializedMessagePlaceholder

- (OSLogDeserializedMessagePlaceholder)initWithDict:(id)a3 metadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___OSLogDeserializedMessagePlaceholder;
  v9 = -[OSLogDeserializedMessagePlaceholder init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backingDict, a3);
    objc_storeStrong((id *)&v10->_metadata, a4);
  }

  return v10;
}

- (int)width
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"w"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1285, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    int v6 = [v5 longLongValue];
  }

  else
  {
    int v6 = 0;
  }

  return v6;
}

- (int)precision
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"p"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1286, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    int v6 = [v5 longLongValue];
  }

  else
  {
    int v6 = 0;
  }

  return v6;
}

- (id)tokens
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  v4 = -[OSLogDeserializedMessagePlaceholder backingDict](self, "backingDict");
  [v4 objectForKeyedSubscript:@"t"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    [MEMORY[0x189603FA8] array];
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            [MEMORY[0x1896077D8] currentHandler];
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v17 = objc_opt_class();
            [v15 handleFailureInMethod:a2, self, @"EventSerializer.m", 1296, @"Unexpected class: %@. Expected: %@", v17, objc_opt_class() object file lineNumber description];
          }
          v13 = -[OSLogDeserializedMessagePlaceholder metadata](self, "metadata");
          [v13 stringForIndex:v12];
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          [v6 addObject:v14];
          ++v11;
        }

        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v9);
    }
  }

  else
  {
    int v6 = (void *)MEMORY[0x189604A58];
  }

  return v6;
}

- (id)rawString
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"rs"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = objc_opt_class();
    [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 1305, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
  }

  -[OSLogDeserializedMessagePlaceholder metadata](self, "metadata");
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringForIndex:v5];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v8,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"EventSerializer.m",  1305,  @"Could not look up string for: %s",  "rawString");

LABEL_6:
    id v7 = 0LL;
  }

  return v7;
}

- (id)typeNamespace
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"tn"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = objc_opt_class();
    [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 1306, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
  }

  -[OSLogDeserializedMessagePlaceholder metadata](self, "metadata");
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringForIndex:v5];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v8,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"EventSerializer.m",  1306,  @"Could not look up string for: %s",  "typeNamespace");

LABEL_6:
    id v7 = 0LL;
  }

  return v7;
}

- (id)type
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"ty"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = objc_opt_class();
    [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 1307, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
  }

  -[OSLogDeserializedMessagePlaceholder metadata](self, "metadata");
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringForIndex:v5];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v8,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"EventSerializer.m",  1307,  @"Could not look up string for: %s",  "type");

LABEL_6:
    id v7 = 0LL;
  }

  return v7;
}

- (NSDictionary)backingDict
{
  return self->_backingDict;
}

- (_OSLogEventSerializationMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
}

@end