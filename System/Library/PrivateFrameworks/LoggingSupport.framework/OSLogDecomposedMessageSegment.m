@interface OSLogDecomposedMessageSegment
- (NSDictionary)backingDict;
- (NSString)literalPrefix;
- (OSLogDecomposedMessageSegment)initWithDict:(id)a3 metadata:(id)a4;
- (OSLogDeserializedEventMessageArgument)argument;
- (OSLogDeserializedMessagePlaceholder)placeholder;
@end

@implementation OSLogDecomposedMessageSegment

- (OSLogDecomposedMessageSegment)initWithDict:(id)a3 metadata:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___OSLogDecomposedMessageSegment;
  v10 = -[OSLogDecomposedMessageSegment init](&v31, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_backingDict, a3);
    [v8 objectForKeyedSubscript:@"lp"];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [MEMORY[0x1896077D8] currentHandler];
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v23 = objc_opt_class();
        [v22 handleFailureInMethod:a2, v11, @"EventSerializer.m", 1326, @"Unexpected class: %@. Expected: %@", v23, objc_opt_class() object file lineNumber description];
      }

      uint64_t v13 = [v9 stringForIndex:v12];
      if (!v13)
      {
        [MEMORY[0x1896077D8] currentHandler];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 handleFailureInMethod:a2 object:v11 file:@"EventSerializer.m" lineNumber:1328 description:@"Failed to find literal prefix string"];
      }

      literalPrefix = v11->_literalPrefix;
      v11->_literalPrefix = (NSString *)v13;
    }

    [v8 objectForKeyedSubscript:@"p"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [MEMORY[0x1896077D8] currentHandler];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v26 = objc_opt_class();
        [v25 handleFailureInMethod:a2, v11, @"EventSerializer.m", 1335, @"Unexpected class: %@. Expected: %@", v26, objc_opt_class() object file lineNumber description];
      }

      v16 = -[OSLogDeserializedMessagePlaceholder initWithDict:metadata:]( objc_alloc(&OBJC_CLASS___OSLogDeserializedMessagePlaceholder),  "initWithDict:metadata:",  v15,  v9);
      if (!v16)
      {
        [MEMORY[0x1896077D8] currentHandler];
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        [v27 handleFailureInMethod:a2 object:v11 file:@"EventSerializer.m" lineNumber:1337 description:@"Could not instantiate placeholder"];
      }

      placeholder = v11->_placeholder;
      v11->_placeholder = v16;
    }

    [v8 objectForKeyedSubscript:@"a"];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [MEMORY[0x1896077D8] currentHandler];
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v29 = objc_opt_class();
        [v28 handleFailureInMethod:a2, v11, @"EventSerializer.m", 1344, @"Unexpected class: %@. Expected: %@", v29, objc_opt_class() object file lineNumber description];
      }

      v19 = -[OSLogDeserializedEventMessageArgument initWithDict:metadata:]( objc_alloc(&OBJC_CLASS___OSLogDeserializedEventMessageArgument),  "initWithDict:metadata:",  v18,  v9);
      if (!v19)
      {
        [MEMORY[0x1896077D8] currentHandler];
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        [v30 handleFailureInMethod:a2 object:v11 file:@"EventSerializer.m" lineNumber:1346 description:@"Could not instantiate arg"];
      }

      argument = v11->_argument;
      v11->_argument = v19;
    }
  }

  return v11;
}

- (NSDictionary)backingDict
{
  return self->_backingDict;
}

- (NSString)literalPrefix
{
  return self->_literalPrefix;
}

- (OSLogDeserializedMessagePlaceholder)placeholder
{
  return self->_placeholder;
}

- (OSLogDeserializedEventMessageArgument)argument
{
  return self->_argument;
}

- (void).cxx_destruct
{
}

@end