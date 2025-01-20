@interface BMFetchAtomBatchesRequest
- (BMMultiStreamTimestampClockVector)rangeClockVectors;
- (BMMultiStreamVectorClock)vectorClock;
- (BOOL)isReciprocalRequest;
- (id)dictionaryRepresentation;
- (id)initFromDictionary:(id)a3;
- (unint64_t)atomBatchVersion;
- (unint64_t)batchSequenceNumber;
- (unint64_t)batchSize;
- (void)setAtomBatchVersion:(unint64_t)a3;
- (void)setBatchSequenceNumber:(unint64_t)a3;
- (void)setBatchSize:(unint64_t)a3;
- (void)setIsReciprocalRequest:(BOOL)a3;
- (void)setRangeClockVectors:(id)a3;
- (void)setVectorClock:(id)a3;
@end

@implementation BMFetchAtomBatchesRequest

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___BMFetchAtomBatchesRequest;
  v5 = -[BMPeerToPeerMessage initFromDictionary:](&v25, "initFromDictionary:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"batchSize"]);
    v5[9] = [v6 unsignedIntegerValue];

    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"batchSequenceNumber"]);
    v5[10] = [v7 unsignedIntegerValue];

    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"isReciprocalRequest"]);
    *((_BYTE *)v5 + 40) = [v8 BOOLValue];

    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"atomBatchVersion"]);
    v5[8] = [v9 unsignedIntegerValue];

    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"vectorClock"]);
    id v24 = 0LL;
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[BMMultiStreamVectorClock deserialize:error:]( &OBJC_CLASS___BMMultiStreamVectorClock,  "deserialize:error:",  v10,  &v24));
    id v12 = v24;
    v13 = (void *)v5[6];
    v5[6] = v11;

    if (v12)
    {
      uint64_t v14 = __biome_log_for_category(11LL);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        sub_100041A90();
      }
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"rangeClockVectors"]);

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"rangeClockVectors"]);

      id v23 = 0LL;
      uint64_t v18 = objc_claimAutoreleasedReturnValue( +[BMMultiStreamTimestampClockVector deserialize:error:]( &OBJC_CLASS___BMMultiStreamTimestampClockVector,  "deserialize:error:",  v17,  &v23));
      id v12 = v23;
      v19 = (void *)v5[7];
      v5[7] = v18;

      if (v12)
      {
        uint64_t v20 = __biome_log_for_category(11LL);
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
          sub_100041A30();
        }
      }
    }
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  vectorClock = self->_vectorClock;
  id v28 = 0LL;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[BMMultiStreamVectorClock serialize:](vectorClock, "serialize:", &v28));
  id v5 = v28;
  if (v5)
  {
    uint64_t v6 = __biome_log_for_category(11LL);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100041AF0();
    }
  }

  rangeClockVectors = self->_rangeClockVectors;
  id v27 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BMMultiStreamTimestampClockVector serialize:](rangeClockVectors, "serialize:", &v27));
  id v10 = v27;
  if (v10)
  {
    uint64_t v11 = __biome_log_for_category(11LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_100041AF0();
    }
  }

  v29[0] = @"batchSize";
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_batchSize,  v10));
  v30[0] = v13;
  v29[1] = @"batchSequenceNumber";
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_batchSequenceNumber));
  v30[1] = v14;
  v29[2] = @"vectorClock";
  v15 = (void *)v4;
  objc_super v25 = (void *)v4;
  if (!v4) {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  }
  v30[2] = v15;
  v29[3] = @"rangeClockVectors";
  v16 = v9;
  if (!v9) {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  }
  v30[3] = v16;
  v29[4] = @"isReciprocalRequest";
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isReciprocalRequest));
  v30[4] = v17;
  v29[5] = @"atomBatchVersion";
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_atomBatchVersion));
  v30[5] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  6LL));
  id v20 = [v19 mutableCopy];

  if (!v9) {
  if (!v25)
  }

  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___BMFetchAtomBatchesRequest;
  id v21 = -[BMPeerToPeerMessage dictionaryRepresentation](&v26, "dictionaryRepresentation");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  [v20 addEntriesFromDictionary:v22];

  return v20;
}

- (BMMultiStreamVectorClock)vectorClock
{
  return self->_vectorClock;
}

- (void)setVectorClock:(id)a3
{
}

- (BMMultiStreamTimestampClockVector)rangeClockVectors
{
  return self->_rangeClockVectors;
}

- (void)setRangeClockVectors:(id)a3
{
}

- (unint64_t)atomBatchVersion
{
  return self->_atomBatchVersion;
}

- (void)setAtomBatchVersion:(unint64_t)a3
{
  self->_atomBatchVersion = a3;
}

- (BOOL)isReciprocalRequest
{
  return self->_isReciprocalRequest;
}

- (void)setIsReciprocalRequest:(BOOL)a3
{
  self->_isReciprocalRequest = a3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (unint64_t)batchSequenceNumber
{
  return self->_batchSequenceNumber;
}

- (void)setBatchSequenceNumber:(unint64_t)a3
{
  self->_batchSequenceNumber = a3;
}

- (void).cxx_destruct
{
}

@end