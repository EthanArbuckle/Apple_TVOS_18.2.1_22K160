@interface _OSLogDeserializedEventProxy
- ($8814E4F230000EB768D7E307C62B5F7C)lossCount;
- (BOOL)needsTypeLookup;
- (NSDictionary)curEventDictionary;
- (_OSLogEventSerializationMetadata)metadata;
- (const)processImageUUIDBytes;
- (const)senderImageUUIDBytes;
- (id)_frameForDict:(id)a3;
- (id)backtrace;
- (id)bootUUID;
- (id)category;
- (id)composedMessage;
- (id)date;
- (id)decomposedMessage;
- (id)formatString;
- (id)process;
- (id)processImagePath;
- (id)processImageUUID;
- (id)sender;
- (id)senderImagePath;
- (id)senderImageUUID;
- (id)signpostName;
- (id)subsystem;
- (id)timeZone;
- (int)processIdentifier;
- (timeval)lossEndUnixDate;
- (timeval)lossStartUnixDate;
- (timeval)unixDate;
- (timezone)lossEndUnixTimeZone;
- (timezone)lossStartUnixTimeZone;
- (timezone)unixTimeZone;
- (unint64_t)activityIdentifier;
- (unint64_t)continuousNanosecondsSinceBoot;
- (unint64_t)creatorActivityIdentifier;
- (unint64_t)creatorProcessUniqueIdentifier;
- (unint64_t)logType;
- (unint64_t)lossEndMachContinuousTimestamp;
- (unint64_t)lossStartMachContinuousTimestamp;
- (unint64_t)machContinuousTimestamp;
- (unint64_t)parentActivityIdentifier;
- (unint64_t)senderImageOffset;
- (unint64_t)signpostIdentifier;
- (unint64_t)signpostScope;
- (unint64_t)signpostType;
- (unint64_t)size;
- (unint64_t)threadIdentifier;
- (unint64_t)timeToLive;
- (unint64_t)traceIdentifier;
- (unint64_t)transitionActivityIdentifier;
- (unint64_t)type;
- (void)_populate_timeval:(timeval *)a3 withDict:(id)a4;
- (void)_populate_timezone:(timezone *)a3 withDict:(id)a4;
- (void)_resetNeedsLookup;
- (void)setCurEventDictionary:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setNeedsTypeLookup:(BOOL)a3;
@end

@implementation _OSLogDeserializedEventProxy

- (void)_resetNeedsLookup
{
  self->_needsTypeLookup = 1;
  self->_unixDateNeedsLookup = 1;
  self->_unixTimeZoneNeedsLookup = 1;
  self->_lossStartUnixDateNeedsLookup = 1;
  self->_lossStartUnixTimeZoneNeedsLookup = 1;
  self->_lossEndUnixDateNeedsLookup = 1;
  self->_lossEndUnixTimeZoneNeedsLookup = 1;
}

- (void)setCurEventDictionary:(id)a3
{
}

- (unint64_t)type
{
  if (!-[_OSLogDeserializedEventProxy needsTypeLookup](self, "needsTypeLookup")) {
    return self->_type;
  }
  self->_needsTypeLookup = 0;
  v4 = -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  [v4 objectForKeyedSubscript:@"t"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:917 description:@"Could not get type for proxy"];
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = objc_opt_class();
    [v9 handleFailureInMethod:a2, self, @"EventSerializer.m", 918, @"Unexpected class: %@. Expected: %@", v10, objc_opt_class() object file lineNumber description];
  }

  unint64_t v6 = [v5 unsignedLongLongValue];
  self->_type = v6;

  return v6;
}

- (unint64_t)logType
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"lt"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 922, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)size
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
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 923, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)timeToLive
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"ttl"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 924, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)traceIdentifier
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"ti"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 925, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)threadIdentifier
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"tid"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 926, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)activityIdentifier
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"aid"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 927, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)parentActivityIdentifier
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"paid"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 928, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)transitionActivityIdentifier
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"tai"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 929, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)continuousNanosecondsSinceBoot
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"ns"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 930, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)machContinuousTimestamp
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"mct"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 931, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)senderImageOffset
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"sio"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 932, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)signpostIdentifier
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"si"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 933, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)signpostType
{
  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1536) {
    return 0LL;
  }
  v4 = -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  [v4 objectForKeyedSubscript:@"st"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 936, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)signpostScope
{
  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1536) {
    return 0LL;
  }
  v4 = -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  [v4 objectForKeyedSubscript:@"ss"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 937, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)creatorActivityIdentifier
{
  if (-[_OSLogDeserializedEventProxy type](self, "type") != 513) {
    return 0LL;
  }
  v4 = -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  [v4 objectForKeyedSubscript:@"cai"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 940, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)creatorProcessUniqueIdentifier
{
  if (-[_OSLogDeserializedEventProxy type](self, "type") != 513) {
    return 0LL;
  }
  v4 = -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  [v4 objectForKeyedSubscript:@"cpui"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 941, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)lossStartMachContinuousTimestamp
{
  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1792) {
    return 0LL;
  }
  v4 = -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  [v4 objectForKeyedSubscript:@"lsmct"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 944, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (unint64_t)lossEndMachContinuousTimestamp
{
  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1792) {
    return 0LL;
  }
  v4 = -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  [v4 objectForKeyedSubscript:@"lemct"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 945, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    unint64_t v6 = [v5 unsignedLongLongValue];
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (int)processIdentifier
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"pid"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 948, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    int v6 = [v5 longLongValue];
  }

  else
  {
    int v6 = 0;
  }

  return v6;
}

- (id)composedMessage
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"cm"];
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
    [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 951, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
  }

  -[_OSLogDeserializedEventProxy metadata](self, "metadata");
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringForIndex:v5];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v8,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"EventSerializer.m",  951,  @"Could not look up string for: %s",  "composedMessage");

LABEL_6:
    v7 = 0LL;
  }

  return v7;
}

- (id)processImagePath
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"pip"];
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
    [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 952, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
  }

  -[_OSLogDeserializedEventProxy metadata](self, "metadata");
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringForIndex:v5];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v8,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"EventSerializer.m",  952,  @"Could not look up string for: %s",  "processImagePath");

LABEL_6:
    v7 = 0LL;
  }

  return v7;
}

- (id)process
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"p"];
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
    [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 953, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
  }

  -[_OSLogDeserializedEventProxy metadata](self, "metadata");
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringForIndex:v5];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v8,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"EventSerializer.m",  953,  @"Could not look up string for: %s",  "process");

LABEL_6:
    v7 = 0LL;
  }

  return v7;
}

- (id)senderImagePath
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"sip"];
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
    [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 954, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
  }

  -[_OSLogDeserializedEventProxy metadata](self, "metadata");
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringForIndex:v5];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v8,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"EventSerializer.m",  954,  @"Could not look up string for: %s",  "senderImagePath");

LABEL_6:
    v7 = 0LL;
  }

  return v7;
}

- (id)sender
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"send"];
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
    [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 955, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
  }

  -[_OSLogDeserializedEventProxy metadata](self, "metadata");
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringForIndex:v5];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v8,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"EventSerializer.m",  955,  @"Could not look up string for: %s",  "sender");

LABEL_6:
    v7 = 0LL;
  }

  return v7;
}

- (id)subsystem
{
  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1536
    && -[_OSLogDeserializedEventProxy type](self, "type") != 1024)
  {
    v7 = 0LL;
    return v7;
  }
  v4 = -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  [v4 objectForKeyedSubscript:@"sub"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = objc_opt_class();
      [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 958, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
    }

    -[_OSLogDeserializedEventProxy metadata](self, "metadata");
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 stringForIndex:v5];
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7) {
      goto LABEL_9;
    }
    [MEMORY[0x1896077D8] currentHandler];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v8,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"EventSerializer.m",  958,  @"Could not look up string for: %s",  "subsystem");
  }

  v7 = 0LL;
LABEL_9:

  return v7;
}

- (id)category
{
  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1536
    && -[_OSLogDeserializedEventProxy type](self, "type") != 1024)
  {
    v7 = 0LL;
    return v7;
  }
  v4 = -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  [v4 objectForKeyedSubscript:@"cat"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = objc_opt_class();
      [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 959, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
    }

    -[_OSLogDeserializedEventProxy metadata](self, "metadata");
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 stringForIndex:v5];
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7) {
      goto LABEL_9;
    }
    [MEMORY[0x1896077D8] currentHandler];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v8,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"EventSerializer.m",  959,  @"Could not look up string for: %s",  "category");
  }

  v7 = 0LL;
LABEL_9:

  return v7;
}

- (id)formatString
{
  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1536
    && -[_OSLogDeserializedEventProxy type](self, "type") != 1024
    && -[_OSLogDeserializedEventProxy type](self, "type") != 768)
  {
    v7 = 0LL;
    return v7;
  }
  v4 = -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  [v4 objectForKeyedSubscript:@"f"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = objc_opt_class();
      [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 960, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
    }

    -[_OSLogDeserializedEventProxy metadata](self, "metadata");
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 stringForIndex:v5];
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7) {
      goto LABEL_10;
    }
    [MEMORY[0x1896077D8] currentHandler];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v8,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"EventSerializer.m",  960,  @"Could not look up string for: %s",  "formatString");
  }

  v7 = 0LL;
LABEL_10:

  return v7;
}

- (id)signpostName
{
  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1536)
  {
    v7 = 0LL;
    return v7;
  }
  v4 = -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  [v4 objectForKeyedSubscript:@"sn"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = objc_opt_class();
      [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 962, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
    }

    -[_OSLogDeserializedEventProxy metadata](self, "metadata");
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 stringForIndex:v5];
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7) {
      goto LABEL_8;
    }
    [MEMORY[0x1896077D8] currentHandler];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v8,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"EventSerializer.m",  962,  @"Could not look up string for: %s",  "signpostName");
  }

  v7 = 0LL;
LABEL_8:

  return v7;
}

- (id)processImageUUID
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"piu"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 965, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    int v6 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607AB8]), "initWithUUIDBytes:", objc_msgSend(v5, "bytes"));
  }

  else
  {
    int v6 = 0LL;
  }

  return v6;
}

- (const)processImageUUIDBytes
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"piu"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 965, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    int v6 = (const char *)[v5 bytes];
  }

  else
  {
    int v6 = 0LL;
  }

  return v6;
}

- (id)senderImageUUID
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"siu"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 966, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    int v6 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607AB8]), "initWithUUIDBytes:", objc_msgSend(v5, "bytes"));
  }

  else
  {
    int v6 = 0LL;
  }

  return v6;
}

- (const)senderImageUUIDBytes
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"siu"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 966, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    int v6 = (const char *)[v5 bytes];
  }

  else
  {
    int v6 = 0LL;
  }

  return v6;
}

- (id)bootUUID
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"b"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = objc_opt_class();
      [v11 handleFailureInMethod:a2, self, @"EventSerializer.m", 971, @"Unexpected class: %@. Expected: %@", v12, objc_opt_class() object file lineNumber description];
    }
  }

  id v6 = objc_alloc(MEMORY[0x189607AB8]);
  id v7 = v5;
  v8 = (void *)objc_msgSend(v6, "initWithUUIDBytes:", objc_msgSend(v7, "bytes"));
  if (!v8)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:974 description:@"Encountered nil bootUUID"];
  }

  return v8;
}

- (void)_populate_timeval:(timeval *)a3 withDict:(id)a4
{
  id v7 = a4;
  [v7 objectForKeyedSubscript:@"sec"];
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:@"usec"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10
    || !v8
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:1003 description:@"Malformed timeval dict"];
  }

  a3->tv_sec = [v10 longValue];
  a3->tv_usec = [v8 intValue];
}

- (void)_populate_timezone:(timezone *)a3 withDict:(id)a4
{
  id v7 = a4;
  [v7 objectForKeyedSubscript:@"mw"];
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:@"dt"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10
    || !v8
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:1015 description:@"Malformed timeval dict"];
  }

  a3->tz_minuteswest = [v10 intValue];
  a3->tz_dsttime = [v8 intValue];
}

- (timeval)unixDate
{
  if (!self->_unixDateNeedsLookup) {
    return &self->_unixDate;
  }
  self->_unixDateNeedsLookup = 0;
  v4 = -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  [v4 objectForKeyedSubscript:@"ud"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:1021 description:@"Could not fetch nonnull property"];
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = objc_opt_class();
    [v9 handleFailureInMethod:a2, self, @"EventSerializer.m", 1021, @"Unexpected class: %@. Expected: %@", v10, objc_opt_class() object file lineNumber description];
  }

  p_unixDate = &self->_unixDate;
  -[_OSLogDeserializedEventProxy _populate_timeval:withDict:](self, "_populate_timeval:withDict:", &self->_unixDate, v5);

  return p_unixDate;
}

- (timezone)unixTimeZone
{
  if (!self->_unixTimeZoneNeedsLookup) {
    return &self->_unixTimeZone;
  }
  self->_unixTimeZoneNeedsLookup = 0;
  v4 = -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  [v4 objectForKeyedSubscript:@"utz"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:1021 description:@"Could not fetch nonnull property"];
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = objc_opt_class();
    [v9 handleFailureInMethod:a2, self, @"EventSerializer.m", 1021, @"Unexpected class: %@. Expected: %@", v10, objc_opt_class() object file lineNumber description];
  }

  p_unixTimeZone = &self->_unixTimeZone;
  -[_OSLogDeserializedEventProxy _populate_timezone:withDict:]( self,  "_populate_timezone:withDict:",  &self->_unixTimeZone,  v5);

  return p_unixTimeZone;
}

- (id)date
{
  v4 = -[_OSLogDeserializedEventProxy unixDate](self, "unixDate");
  if (!v4)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:1030 description:@"Could not get Unix date"];
  }

  return (id)[MEMORY[0x189603F50] dateWithTimeIntervalSince1970:(double)v4->tv_usec / 1000000.0 + (double)v4->tv_sec];
}

- (id)timeZone
{
  v4 = -[_OSLogDeserializedEventProxy unixTimeZone](self, "unixTimeZone");
  if (!v4)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:1038 description:@"Could not get Unix timezone"];
  }

  return (id)[MEMORY[0x189604020] timeZoneForSecondsFromGMT:3600 * v4->tz_dsttime + -60 * v4->tz_minuteswest];
}

- (timeval)lossStartUnixDate
{
  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1792) {
    return 0LL;
  }
  if (!self->_lossStartUnixDateNeedsLookup) {
    return &self->_lossStartUnixDate;
  }
  self->_lossStartUnixDateNeedsLookup = 0;
  v4 = -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  [v4 objectForKeyedSubscript:@"lsud"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1048, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    p_lossStartUnixDate = &self->_lossStartUnixDate;
    -[_OSLogDeserializedEventProxy _populate_timeval:withDict:]( self,  "_populate_timeval:withDict:",  &self->_lossStartUnixDate,  v5);
  }

  else
  {
    p_lossStartUnixDate = 0LL;
  }

  return p_lossStartUnixDate;
}

- (timezone)lossStartUnixTimeZone
{
  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1792) {
    return 0LL;
  }
  if (!self->_lossStartUnixTimeZoneNeedsLookup) {
    return &self->_lossStartUnixTimeZone;
  }
  self->_lossStartUnixTimeZoneNeedsLookup = 0;
  v4 = -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  [v4 objectForKeyedSubscript:@"lsutz"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1048, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    p_lossStartUnixTimeZone = &self->_lossStartUnixTimeZone;
    -[_OSLogDeserializedEventProxy _populate_timezone:withDict:]( self,  "_populate_timezone:withDict:",  &self->_lossStartUnixTimeZone,  v5);
  }

  else
  {
    p_lossStartUnixTimeZone = 0LL;
  }

  return p_lossStartUnixTimeZone;
}

- (timeval)lossEndUnixDate
{
  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1792) {
    return 0LL;
  }
  if (!self->_lossEndUnixDateNeedsLookup) {
    return &self->_lossEndUnixDate;
  }
  self->_lossEndUnixDateNeedsLookup = 0;
  v4 = -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  [v4 objectForKeyedSubscript:@"leud"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1049, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    p_lossEndUnixDate = &self->_lossEndUnixDate;
    -[_OSLogDeserializedEventProxy _populate_timeval:withDict:]( self,  "_populate_timeval:withDict:",  &self->_lossEndUnixDate,  v5);
  }

  else
  {
    p_lossEndUnixDate = 0LL;
  }

  return p_lossEndUnixDate;
}

- (timezone)lossEndUnixTimeZone
{
  if (-[_OSLogDeserializedEventProxy type](self, "type") != 1792) {
    return 0LL;
  }
  if (!self->_lossEndUnixTimeZoneNeedsLookup) {
    return &self->_lossEndUnixTimeZone;
  }
  self->_lossEndUnixTimeZoneNeedsLookup = 0;
  v4 = -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  [v4 objectForKeyedSubscript:@"leutz"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1049, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }

    p_lossEndUnixTimeZone = &self->_lossEndUnixTimeZone;
    -[_OSLogDeserializedEventProxy _populate_timezone:withDict:]( self,  "_populate_timezone:withDict:",  &self->_lossEndUnixTimeZone,  v5);
  }

  else
  {
    p_lossEndUnixTimeZone = 0LL;
  }

  return p_lossEndUnixTimeZone;
}

- ($8814E4F230000EB768D7E307C62B5F7C)lossCount
{
  if (-[_OSLogDeserializedEventProxy type](self, "type") == 1792)
  {
    v4 = -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
    [v4 objectForKeyedSubscript:@"lc"];
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:1056 description:@"Unexpected type for loss count dict"];
    }

    [v5 objectForKeyedSubscript:@"c"];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKeyedSubscript:@"s"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v8 = [v6 unsignedLongLongValue];
    int v9 = [v7 BOOLValue];

    if (v9) {
      uint64_t v10 = 0x100000000LL;
    }
    else {
      uint64_t v10 = 0LL;
    }
    return ($8814E4F230000EB768D7E307C62B5F7C)(v10 & 0xFFFFFFFF00000000LL | v8);
  }

  else
  {
    return ($8814E4F230000EB768D7E307C62B5F7C)0LL;
  }

- (id)_frameForDict:(id)a3
{
  id v5 = a3;
  [v5 objectForKeyedSubscript:@"iu"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = objc_opt_class();
      [v12 handleFailureInMethod:a2, self, @"EventSerializer.m", 1068, @"Unexpected class: %@. Expected: %@", v13, objc_opt_class() object file lineNumber description];
    }
  }

  [v5 objectForKeyedSubscript:@"io"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = objc_opt_class();
    [v14 handleFailureInMethod:a2, self, @"EventSerializer.m", 1072, @"Unexpected class: %@. Expected: %@", v15, objc_opt_class() object file lineNumber description];

    if (v6) {
      goto LABEL_7;
    }
LABEL_9:
    [MEMORY[0x1896077D8] currentHandler];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:1074 description:@"Malformed frame dictionary"];

    goto LABEL_7;
  }

  if (!v6) {
    goto LABEL_9;
  }
LABEL_7:
  unsigned int v8 = objc_alloc(&OBJC_CLASS___OSLogEventBacktraceFrame);
  id v9 = v6;
  uint64_t v10 = -[OSLogEventBacktraceFrame initWithUUIDBytes:andOffset:]( v8,  "initWithUUIDBytes:andOffset:",  [v9 bytes],  objc_msgSend(v7, "unsignedLongLongValue"));

  return v10;
}

- (id)backtrace
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  v4 = -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
  [v4 objectForKeyedSubscript:@"bt"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189603FA8] array];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = objc_opt_class();
      [v19 handleFailureInMethod:a2, self, @"EventSerializer.m", 1083, @"Unexpected class: %@. Expected: %@", v20, objc_opt_class() object file lineNumber description];
    }

    SEL v22 = a2;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            [MEMORY[0x1896077D8] currentHandler];
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v21 = objc_opt_class();
            [v14 handleFailureInMethod:v22, self, @"EventSerializer.m", 1085, @"Unexpected class: %@. Expected: %@", v21, objc_opt_class() object file lineNumber description];
          }

          -[_OSLogDeserializedEventProxy _frameForDict:](self, "_frameForDict:", v12);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v6 addObject:v13];

          ++v11;
        }

        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v9);
    }
  }

  else
  {
    uint64_t v15 = -[_OSLogDeserializedEventProxy senderImageUUIDBytes](self, "senderImageUUIDBytes");
    if (v15)
    {
      v16 = -[OSLogEventBacktraceFrame initWithUUIDBytes:andOffset:]( objc_alloc(&OBJC_CLASS___OSLogEventBacktraceFrame),  "initWithUUIDBytes:andOffset:",  v15,  -[_OSLogDeserializedEventProxy senderImageOffset](self, "senderImageOffset"));
      [v6 addObject:v16];
    }
  }

  if ([v6 count]) {
    v17 = -[OSLogEventBacktrace initWithFrames:](objc_alloc(&OBJC_CLASS___OSLogEventBacktrace), "initWithFrames:", v6);
  }
  else {
    v17 = 0LL;
  }

  return v17;
}

- (id)decomposedMessage
{
  if (-[_OSLogDeserializedEventProxy type](self, "type") == 1536
    || -[_OSLogDeserializedEventProxy type](self, "type") == 1024
    || -[_OSLogDeserializedEventProxy type](self, "type") == 768)
  {
    v4 = -[_OSLogDeserializedEventProxy curEventDictionary](self, "curEventDictionary");
    [v4 objectForKeyedSubscript:@"dm"];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [MEMORY[0x1896077D8] currentHandler];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = objc_opt_class();
        [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 1110, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
      }

      id v6 = objc_alloc(&OBJC_CLASS___OSLogDeserializedEventDecomposedMessage);
      -[_OSLogDeserializedEventProxy metadata](self, "metadata");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = -[OSLogDeserializedEventDecomposedMessage initWithDict:metadata:](v6, "initWithDict:metadata:", v5, v7);
    }

    else
    {
      uint64_t v8 = 0LL;
    }
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (NSDictionary)curEventDictionary
{
  return self->_curEventDictionary;
}

- (_OSLogEventSerializationMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (BOOL)needsTypeLookup
{
  return self->_needsTypeLookup;
}

- (void)setNeedsTypeLookup:(BOOL)a3
{
  self->_needsTypeLookup = a3;
}

- (void).cxx_destruct
{
}

@end