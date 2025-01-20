@interface BMFetchAtomBatchesResponse
- (BOOL)moreComing;
- (NSArray)unseenPeers;
- (NSDictionary)atomBatches;
- (NSDictionary)deletedLocations;
- (id)dictionaryRepresentation;
- (id)initFromDictionary:(id)a3;
- (unint64_t)atomBatchBytes;
- (unint64_t)batchSequenceNumber;
- (void)setAtomBatchBytes:(unint64_t)a3;
- (void)setAtomBatches:(id)a3;
- (void)setBatchSequenceNumber:(unint64_t)a3;
- (void)setDeletedLocations:(id)a3;
- (void)setMoreComing:(BOOL)a3;
- (void)setUnseenPeers:(id)a3;
@end

@implementation BMFetchAtomBatchesResponse

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___BMFetchAtomBatchesResponse;
  v5 = -[BMPeerToPeerMessage initFromDictionary:](&v31, "initFromDictionary:", v4);
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"unseenPeers"]);
    v7 = (void *)v5[6];
    v5[6] = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"atomBatches"]);
    if (!v8
      || (v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null")),
          v9,
          v8 == v9))
    {
      v19 = 0LL;
    }

    else
    {
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary, v10);
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSArray, v12);
      uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSData, v14);
      v17 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v11,  v13,  v15,  objc_opt_class(&OBJC_CLASS___NSString, v16),  0LL);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      id v30 = 0LL;
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v18,  v8,  &v30));
      id v20 = v30;
      if (v20)
      {
        uint64_t v21 = __biome_log_for_category(11LL);
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
          sub_100041B50();
        }
      }

      v5[8] = [v8 length];
    }

    v23 = (void *)v5[7];
    v5[7] = v19;
    id v24 = v19;

    v25 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"moreComing"]);
    *((_BYTE *)v5 + 40) = [v25 BOOLValue];

    v26 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"batchSequenceNumber"]);
    v5[10] = [v26 unsignedIntegerValue];

    uint64_t v27 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"deletedLocations"]);
    v28 = (void *)v5[9];
    v5[9] = v27;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  atomBatches = self->_atomBatches;
  if (atomBatches)
  {
    id v24 = 0LL;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  atomBatches,  1LL,  &v24));
    id v5 = v24;
    if (v5)
    {
      uint64_t v6 = __biome_log_for_category(11LL);
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        sub_100041BB0();
      }
    }
  }

  else
  {
    id v5 = 0LL;
    id v4 = 0LL;
  }

  v25[0] = @"unseenPeers";
  unseenPeers = self->_unseenPeers;
  uint64_t v9 = (uint64_t)unseenPeers;
  if (!unseenPeers) {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  uint64_t v20 = v9;
  v22 = v5;
  v26[0] = v9;
  v25[1] = @"atomBatches";
  uint64_t v10 = v4;
  if (!v4) {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null", v9));
  }
  v26[1] = v10;
  v25[2] = @"moreComing";
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_moreComing, v20));
  v26[2] = v11;
  v25[3] = @"batchSequenceNumber";
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_batchSequenceNumber));
  v26[3] = v12;
  v25[4] = @"deletedLocations";
  deletedLocations = self->_deletedLocations;
  uint64_t v14 = deletedLocations;
  if (!deletedLocations) {
    uint64_t v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v26[4] = v14;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  5LL));
  id v16 = [v15 mutableCopy];

  if (!deletedLocations) {
  if (!v4)
  }

  if (!unseenPeers) {
  v23.receiver = self;
  }
  v23.super_class = (Class)&OBJC_CLASS___BMFetchAtomBatchesResponse;
  id v17 = -[BMPeerToPeerMessage dictionaryRepresentation](&v23, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v16 addEntriesFromDictionary:v18];

  return v16;
}

- (NSArray)unseenPeers
{
  return self->_unseenPeers;
}

- (void)setUnseenPeers:(id)a3
{
}

- (NSDictionary)atomBatches
{
  return self->_atomBatches;
}

- (void)setAtomBatches:(id)a3
{
}

- (unint64_t)atomBatchBytes
{
  return self->_atomBatchBytes;
}

- (void)setAtomBatchBytes:(unint64_t)a3
{
  self->_atomBatchBytes = a3;
}

- (NSDictionary)deletedLocations
{
  return self->_deletedLocations;
}

- (void)setDeletedLocations:(id)a3
{
}

- (BOOL)moreComing
{
  return self->_moreComing;
}

- (void)setMoreComing:(BOOL)a3
{
  self->_moreComing = a3;
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