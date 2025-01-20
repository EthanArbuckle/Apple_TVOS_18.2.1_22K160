@interface _OSLogEventSerializationMetadata
- (NSDate)firstDate;
- (NSDate)lastDate;
- (NSMutableDictionary)indexToStringMapping;
- (NSMutableDictionary)stringToIndexMapping;
- (NSString)filterPredicateDescription;
- (_OSLogEventSerializationMetadata)init;
- (_OSLogEventSerializationMetadata)initWithDataRepresentation:(id)a3;
- (id)dataRepresentation;
- (id)indexForString:(id)a3;
- (id)stringForIndex:(id)a3;
- (unint64_t)flags;
- (unint64_t)maxLogEventBatchSize;
- (unint64_t)serializedEventCount;
- (void)setFilterPredicateDescription:(id)a3;
- (void)setFirstDate:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setLastDate:(id)a3;
- (void)setMaxLogEventBatchSize:(unint64_t)a3;
- (void)setSerializedEventCount:(unint64_t)a3;
@end

@implementation _OSLogEventSerializationMetadata

- (_OSLogEventSerializationMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____OSLogEventSerializationMetadata;
  v2 = -[_OSLogEventSerializationMetadata init](&v6, sel_init);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x189603FC8] dictionary];
    stringToIndexMapping = v2->_stringToIndexMapping;
    v2->_stringToIndexMapping = (NSMutableDictionary *)v3;
  }

  return v2;
}

- (_OSLogEventSerializationMetadata)initWithDataRepresentation:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS____OSLogEventSerializationMetadata;
  v5 = -[_OSLogEventSerializationMetadata init](&v32, sel_init);
  if (v5)
  {
    id v31 = 0LL;
    [MEMORY[0x1896079E8] propertyListWithData:v4 options:0 format:0 error:&v31];
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = v31;
    v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0LL;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v10 = v6;
      [v10 objectForKeyedSubscript:@"Version"];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && ![v11 unsignedIntValue])
      {
        [v10 objectForKeyedSubscript:@"Flags"];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_flags = (unint64_t)v15;

        [v10 objectForKeyedSubscript:@"MaxLogEventBatchSize"];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_maxLogEventBatchSize = (unint64_t)v16;

        [v10 objectForKeyedSubscript:@"SerializedEventCount"];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_serializedEventCount = (unint64_t)v17;

        [v10 objectForKeyedSubscript:@"FilterPredicateDescription"];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0) {
            objc_storeStrong((id *)&v5->_filterPredicateDescription, v18);
          }
        }

        [v10 objectForKeyedSubscript:@"FirstDate"];
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0) {
            objc_storeStrong((id *)&v5->_firstDate, v19);
          }
        }

        [v10 objectForKeyedSubscript:@"LastDate"];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0) {
            objc_storeStrong((id *)&v5->_lastDate, v20);
          }
        }

        [v10 objectForKeyedSubscript:@"StringIndex"];
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          uint64_t v27 = 0LL;
          v28 = &v27;
          uint64_t v29 = 0x2020000000LL;
          char v30 = 0;
          [MEMORY[0x189603FC8] dictionary];
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = MEMORY[0x1895F87A8];
          v24[1] = 3221225472LL;
          v24[2] = __63___OSLogEventSerializationMetadata_initWithDataRepresentation___block_invoke;
          v24[3] = &unk_189F0FC40;
          v26 = &v27;
          id v23 = v22;
          id v25 = v23;
          [v21 enumerateKeysAndObjectsUsingBlock:v24];
          if (*((_BYTE *)v28 + 24))
          {
            int v12 = 1;
          }

          else
          {
            objc_storeStrong((id *)&v5->_indexToStringMapping, v22);
            int v12 = 0;
          }

          _Block_object_dispose(&v27, 8);
        }

        else
        {
          int v12 = 1;
        }
      }

      else
      {
        int v12 = 1;
      }

      if (!v12) {
        goto LABEL_13;
      }
    }

    else
    {
    }

    v13 = 0LL;
    goto LABEL_16;
  }

- (id)dataRepresentation
{
  v25[2] = *MEMORY[0x1895F89C0];
  v24[0] = @"Version";
  v24[1] = @"StringIndex";
  v25[0] = &unk_189F1D3E8;
  -[_OSLogEventSerializationMetadata stringToIndexMapping](self, "stringToIndexMapping");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v3;
  [MEMORY[0x189603F68] dictionaryWithObjects:v25 forKeys:v24 count:2];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)[v4 mutableCopy];

  -[_OSLogEventSerializationMetadata firstDate](self, "firstDate");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_OSLogEventSerializationMetadata firstDate](self, "firstDate");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v7 forKeyedSubscript:@"FirstDate"];
  }
  v8 = -[_OSLogEventSerializationMetadata lastDate](self, "lastDate");
  if (v8)
  {
    -[_OSLogEventSerializationMetadata lastDate](self, "lastDate");
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v9 forKeyedSubscript:@"LastDate"];
  }

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[_OSLogEventSerializationMetadata flags](self, "flags"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v10 forKeyedSubscript:@"Flags"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[_OSLogEventSerializationMetadata maxLogEventBatchSize](self, "maxLogEventBatchSize"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v11 forKeyedSubscript:@"MaxLogEventBatchSize"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[_OSLogEventSerializationMetadata serializedEventCount](self, "serializedEventCount"));
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v12 forKeyedSubscript:@"SerializedEventCount"];
  v13 = -[_OSLogEventSerializationMetadata filterPredicateDescription](self, "filterPredicateDescription");
  if (v13)
  {
    v14 = -[_OSLogEventSerializationMetadata filterPredicateDescription](self, "filterPredicateDescription");
    [v5 setObject:v14 forKeyedSubscript:@"FilterPredicateDescription"];
  }

  id v21 = 0LL;
  [MEMORY[0x1896079E8] dataWithPropertyList:v5 format:200 options:0 error:&v21];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = v21;
  if (v15)
  {
    id v17 = v15;
  }

  else
  {
    BOOL v18 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v16)
    {
      if (v18)
      {
        [v16 localizedDescription];
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        id v23 = v19;
        _os_log_error_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Serializing metadata failed with an error: %@",  buf,  0xCu);
      }
    }

    else if (v18)
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Serializing metadata failed without detailed error",  buf,  2u);
    }
  }

  return v15;
}

- (id)indexForString:(id)a3
{
  id v4 = a3;
  v5 = -[_OSLogEventSerializationMetadata stringToIndexMapping](self, "stringToIndexMapping");
  [v5 objectForKeyedSubscript:v4];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    id v7 = (void *)MEMORY[0x189607968];
    v8 = -[_OSLogEventSerializationMetadata stringToIndexMapping](self, "stringToIndexMapping");
    objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[_OSLogEventSerializationMetadata stringToIndexMapping](self, "stringToIndexMapping");
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v6 forKeyedSubscript:v4];
  }

  return v6;
}

- (id)stringForIndex:(id)a3
{
  id v5 = a3;
  -[_OSLogEventSerializationMetadata indexToStringMapping](self, "indexToStringMapping");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v5];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:178 description:@"Invalid index-to-string mapping"];
  }

  return v7;
}

- (NSMutableDictionary)indexToStringMapping
{
  return self->_indexToStringMapping;
}

- (NSMutableDictionary)stringToIndexMapping
{
  return self->_stringToIndexMapping;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (NSString)filterPredicateDescription
{
  return self->_filterPredicateDescription;
}

- (void)setFilterPredicateDescription:(id)a3
{
}

- (unint64_t)maxLogEventBatchSize
{
  return self->_maxLogEventBatchSize;
}

- (void)setMaxLogEventBatchSize:(unint64_t)a3
{
  self->_maxLogEventBatchSize = a3;
}

- (unint64_t)serializedEventCount
{
  return self->_serializedEventCount;
}

- (void)setSerializedEventCount:(unint64_t)a3
{
  self->_serializedEventCount = a3;
}

- (NSDate)firstDate
{
  return self->_firstDate;
}

- (void)setFirstDate:(id)a3
{
}

- (NSDate)lastDate
{
  return self->_lastDate;
}

- (void)setLastDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end