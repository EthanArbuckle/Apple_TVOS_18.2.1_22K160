@interface OSLogDeserializedEventMessageArgument
- (NSDictionary)backingDict;
- (OSLogDeserializedEventMessageArgument)initWithDict:(id)a3 metadata:(id)a4;
- (_OSLogEventSerializationMetadata)metadata;
- (const)rawBytes;
- (double)doubleValue;
- (double)longDoubleValue;
- (id)_numValue;
- (id)objectRepresentation;
- (int64_t)int64Value;
- (unint64_t)availability;
- (unint64_t)category;
- (unint64_t)privacy;
- (unint64_t)scalarCategory;
- (unint64_t)scalarType;
- (unint64_t)unsignedInt64Value;
- (unsigned)rawBytesLength;
@end

@implementation OSLogDeserializedEventMessageArgument

- (OSLogDeserializedEventMessageArgument)initWithDict:(id)a3 metadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___OSLogDeserializedEventMessageArgument;
  v9 = -[OSLogDeserializedEventMessageArgument init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backingDict, a3);
    objc_storeStrong((id *)&v10->_metadata, a4);
  }

  return v10;
}

- (unint64_t)availability
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"a"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1148, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)privacy
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
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1149, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)category
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"c"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1150, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)scalarCategory
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"sc"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1151, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)scalarType
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"st"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1152, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (id)objectRepresentation
{
  if (!-[OSLogDeserializedEventMessageArgument availability](self, "availability")
    || -[OSLogDeserializedEventMessageArgument availability](self, "availability") == 3)
  {
    unint64_t v4 = -[OSLogDeserializedEventMessageArgument category](self, "category");
    if (v4 == 1 || v4 == 3)
    {
      -[OSLogDeserializedEventMessageArgument backingDict](self, "backingDict");
      unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 objectForKeyedSubscript:@"or"];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

      return v8;
    }

    if (v4 == 2)
    {
      v5 = -[OSLogDeserializedEventMessageArgument backingDict](self, "backingDict");
      [v5 objectForKeyedSubscript:@"or"];
      unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [MEMORY[0x1896077D8] currentHandler];
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v11 = objc_opt_class();
          [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 1169, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
        }

        -[OSLogDeserializedEventMessageArgument metadata](self, "metadata");
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 stringForIndex:v6];
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v8 = 0LL;
      }

      goto LABEL_12;
    }
  }

  id v8 = 0LL;
  return v8;
}

- (const)rawBytes
{
  if (!-[OSLogDeserializedEventMessageArgument availability](self, "availability")
    || -[OSLogDeserializedEventMessageArgument availability](self, "availability") == 3)
  {
    if (-[OSLogDeserializedEventMessageArgument category](self, "category") == 2)
    {
      -[OSLogDeserializedEventMessageArgument objectRepresentation](self, "objectRepresentation");
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          id v3 = v3;
          uint64_t v4 = [v3 UTF8String];
LABEL_11:
          v5 = (const void *)v4;
LABEL_14:

          return v5;
        }
      }

      goto LABEL_13;
    }

    if (-[OSLogDeserializedEventMessageArgument category](self, "category") == 3)
    {
      -[OSLogDeserializedEventMessageArgument objectRepresentation](self, "objectRepresentation");
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          id v3 = v3;
          uint64_t v4 = [v3 bytes];
          goto LABEL_11;
        }
      }

- (unsigned)rawBytesLength
{
  if (!-[OSLogDeserializedEventMessageArgument availability](self, "availability")
    || -[OSLogDeserializedEventMessageArgument availability](self, "availability") == 3)
  {
    if (-[OSLogDeserializedEventMessageArgument category](self, "category") == 2)
    {
      -[OSLogDeserializedEventMessageArgument objectRepresentation](self, "objectRepresentation");
      id v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3) {
        goto LABEL_11;
      }
      goto LABEL_8;
    }

    if (-[OSLogDeserializedEventMessageArgument category](self, "category") == 3)
    {
      -[OSLogDeserializedEventMessageArgument objectRepresentation](self, "objectRepresentation");
      id v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3) {
        goto LABEL_11;
      }
LABEL_8:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        unsigned __int16 v4 = [v3 length];
LABEL_12:

        return v4;
      }

- (id)_numValue
{
  if (-[OSLogDeserializedEventMessageArgument availability](self, "availability")
    && -[OSLogDeserializedEventMessageArgument availability](self, "availability") != 3
    || -[OSLogDeserializedEventMessageArgument category](self, "category") != 1)
  {
    return 0LL;
  }

  -[OSLogDeserializedEventMessageArgument objectRepresentation](self, "objectRepresentation");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (unint64_t)unsignedInt64Value
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (int64_t)int64Value
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v3 = [v2 longLongValue];

  return v3;
}

- (double)doubleValue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)longDoubleValue
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 doubleValue];
  double v3 = v2;

  return v3;
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