@interface BMSyncCKAtomRow
- (BMSyncCKAtomRow)initWithFMResultSet:(id)a3;
- (BMSyncCKAtomRow)initWithLocation:(id)a3 timestamp:(id)a4 referenceLocation:(id)a5 causalReference:(id)a6 type:(unint64_t)a7 segmentName:(id)a8 segmentOffset:(unint64_t)a9;
- (BMSyncCKAtomRow)initWithLocation:(id)a3 timestamp:(id)a4 referenceLocation:(id)a5 causalReference:(id)a6 type:(unint64_t)a7 valueVersion:(int64_t)a8 valueData:(id)a9;
- (BMSyncCRDTLocationRow)location;
- (BMSyncCRDTLocationRow)referenceLocation;
- (BOOL)isEqual:(id)a3;
- (CKAtomReference)causalReference;
- (CKDistributedTimestamp)timestamp;
- (NSData)valueData;
- (NSString)segmentName;
- (id)description;
- (int64_t)valueVersion;
- (unint64_t)hash;
- (unint64_t)segmentOffset;
- (unint64_t)type;
@end

@implementation BMSyncCKAtomRow

- (BMSyncCKAtomRow)initWithLocation:(id)a3 timestamp:(id)a4 referenceLocation:(id)a5 causalReference:(id)a6 type:(unint64_t)a7 segmentName:(id)a8 segmentOffset:(unint64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v26 = a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }

  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v22 handleFailureInMethod:a2, self, @"BMSyncCKAtomRow.m", 62, @"Invalid parameter not satisfying: %@", @"location" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v23 handleFailureInMethod:a2, self, @"BMSyncCKAtomRow.m", 63, @"Invalid parameter not satisfying: %@", @"timestamp" object file lineNumber description];

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___BMSyncCKAtomRow;
  v19 = -[BMSyncCKAtomRow init](&v27, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_location, a3);
    objc_storeStrong((id *)&v20->_timestamp, a4);
    objc_storeStrong((id *)&v20->_referenceLocation, a5);
    objc_storeStrong((id *)&v20->_causalReference, a6);
    v20->_type = a7;
    objc_storeStrong((id *)&v20->_segmentName, a8);
    v20->_segmentOffset = a9;
  }

  return v20;
}

- (BMSyncCKAtomRow)initWithLocation:(id)a3 timestamp:(id)a4 referenceLocation:(id)a5 causalReference:(id)a6 type:(unint64_t)a7 valueVersion:(int64_t)a8 valueData:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v26 = a5;
  id v16 = a6;
  id v17 = a9;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }

  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v21 handleFailureInMethod:a2, self, @"BMSyncCKAtomRow.m", 87, @"Invalid parameter not satisfying: %@", @"location" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v22 handleFailureInMethod:a2, self, @"BMSyncCKAtomRow.m", 88, @"Invalid parameter not satisfying: %@", @"timestamp" object file lineNumber description];

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___BMSyncCKAtomRow;
  id v18 = -[BMSyncCKAtomRow init](&v27, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_location, a3);
    objc_storeStrong((id *)&v19->_timestamp, a4);
    objc_storeStrong((id *)&v19->_referenceLocation, a5);
    objc_storeStrong((id *)&v19->_causalReference, a6);
    v19->_type = a7;
    v19->_valueVersion = a8;
    objc_storeStrong((id *)&v19->_valueData, a9);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;
    if (-[BMSyncCRDTLocationRow isEqual:](self->_location, "isEqual:", v7[1])) {
      unsigned __int8 v8 = -[CKDistributedTimestamp isEqual:](self->_timestamp, "isEqual:", v7[2]);
    }
    else {
      unsigned __int8 v8 = 0;
    }
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = -[BMSyncCRDTLocationRow hash](self->_location, "hash");
  return (unint64_t)-[CKDistributedTimestamp hash](self->_timestamp, "hash") ^ v3;
}

- (id)description
{
  unint64_t v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v5 = objc_opt_class(self, v4);
  uint64_t v6 = sub_100023274(self->_type);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncCRDTLocationRow description](self->_location, "description"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKDistributedTimestamp bm_description](self->_timestamp, "bm_description"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKAtomReference timestamp](self->_causalReference, "timestamp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bm_description"));
  v12 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"<%@: type=%@, location=%@, atomID=%@, refID=%@ bookmarkOffset=%lu>",  v5,  v7,  v8,  v9,  v11,  self->_segmentOffset);

  return v12;
}

- (BMSyncCRDTLocationRow)location
{
  return self->_location;
}

- (CKDistributedTimestamp)timestamp
{
  return self->_timestamp;
}

- (BMSyncCRDTLocationRow)referenceLocation
{
  return self->_referenceLocation;
}

- (CKAtomReference)causalReference
{
  return self->_causalReference;
}

- (NSString)segmentName
{
  return self->_segmentName;
}

- (unint64_t)segmentOffset
{
  return self->_segmentOffset;
}

- (unint64_t)type
{
  return self->_type;
}

- (int64_t)valueVersion
{
  return self->_valueVersion;
}

- (NSData)valueData
{
  return self->_valueData;
}

- (void).cxx_destruct
{
}

- (BMSyncCKAtomRow)initWithFMResultSet:(id)a3
{
  id v3 = a3;
  v31 = (void *)objc_claimAutoreleasedReturnValue([v3 stringForColumn:@"stream"]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringForColumn:@"site"]);
  id v5 = objc_alloc(&OBJC_CLASS___CKDistributedSiteIdentifier);
  v33 = v4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 dataUsingEncoding:4]);
  id v7 = [v5 initWithIdentifier:v6];

  id v8 = [v3 longForColumn:@"clock"];
  id v28 = [v3 longForColumn:@"type"];
  v32 = v7;
  v9 = -[CKDistributedTimestamp initWithSiteIdentifierObject:clockValue:]( objc_alloc(&OBJC_CLASS___CKDistributedTimestamp),  "initWithSiteIdentifierObject:clockValue:",  v7,  v8);
  v10 = -[BMSyncCRDTLocationRow initWithFMResultSet:modifier:]( objc_alloc(&OBJC_CLASS___BMSyncCRDTLocationRow),  "initWithFMResultSet:modifier:",  v3,  1LL);
  v11 = -[BMSyncCRDTLocationRow initWithFMResultSet:modifier:]( objc_alloc(&OBJC_CLASS___BMSyncCRDTLocationRow),  "initWithFMResultSet:modifier:",  v3,  2LL);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncCRDTLocationRow location](v11, "location"));
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v29 ckMergeableValueIDWithFormatVersion:0]);
  unsigned __int8 v13 = [v3 longForColumn:@"ref_type"];
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 stringForColumn:@"ref_site"]);
  id v15 = objc_alloc(&OBJC_CLASS___CKDistributedSiteIdentifier);
  id v26 = v14;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 dataUsingEncoding:4]);
  id v17 = [v15 initWithIdentifier:v16];

  id v18 = -[CKDistributedTimestamp initWithSiteIdentifierObject:clockValue:]( [CKDistributedTimestamp alloc],  "initWithSiteIdentifierObject:clockValue:",  v17,  [v3 longForColumn:@"ref_clock"]);
  if (v12) {
    v19 = -[CKAtomReference initWithMergeableValueID:timestamp:type:]( objc_alloc(&OBJC_CLASS___CKAtomReference),  "initWithMergeableValueID:timestamp:type:",  v12,  v18,  v13);
  }
  else {
    v19 = 0LL;
  }
  objc_super v27 = (void *)v12;
  v20 = (void *)objc_claimAutoreleasedReturnValue([v3 stringForColumn:@"segment_name"]);
  v21 = v10;
  if (v20)
  {
    v22 =  -[BMSyncCKAtomRow initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:]( self,  "initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:",  v10,  v9,  v11,  v19,  v28,  v20,  [v3 longForColumn:@"segment_offset"]);
  }

  else
  {
    id v23 = [v3 longForColumn:@"value_version"];
    v24 = (void *)objc_claimAutoreleasedReturnValue([v3 dataForColumn:@"value_data"]);
    v22 =  -[BMSyncCKAtomRow initWithLocation:timestamp:referenceLocation:causalReference:type:valueVersion:valueData:]( self,  "initWithLocation:timestamp:referenceLocation:causalReference:type:valueVersion:valueData:",  v21,  v9,  v11,  v19,  v28,  v23,  v24);
  }

  return v22;
}

@end