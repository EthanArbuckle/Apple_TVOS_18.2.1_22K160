@interface BMSyncCRDTLocationRow
- (BMStreamCRDTLocation)location;
- (BMSyncCRDTLocationRow)initWithFMResultSet:(id)a3 modifier:(unint64_t)a4;
- (BMSyncCRDTLocationRow)initWithLocation:(id)a3 state:(unint64_t)a4;
- (BMSyncCRDTLocationRow)initWithLocation:(id)a3 state:(unint64_t)a4 primaryKey:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)primaryKey;
- (unint64_t)state;
@end

@implementation BMSyncCRDTLocationRow

- (BMSyncCRDTLocationRow)initWithLocation:(id)a3 state:(unint64_t)a4
{
  return -[BMSyncCRDTLocationRow initWithLocation:state:primaryKey:]( self,  "initWithLocation:state:primaryKey:",  a3,  a4,  0LL);
}

- (BMSyncCRDTLocationRow)initWithLocation:(id)a3 state:(unint64_t)a4 primaryKey:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___BMSyncCRDTLocationRow;
  v10 = -[BMSyncCRDTLocationRow init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_location, a3);
    v11->_state = a4;
    v11->_primaryKey = a5;
  }

  return v11;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  return  -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"<%@: location=%@, state=%lu>",  objc_opt_class(self, v4),  self->_location,  self->_state);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (BMSyncCRDTLocationRow *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }

  else
  {
    location = self->_location;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncCRDTLocationRow location](v4, "location"));
    if (-[BMStreamCRDTLocation isEqual:](location, "isEqual:", v7))
    {
      id state = (id)self->_state;
      BOOL v9 = state == (id)-[BMSyncCRDTLocationRow state](v5, "state");
    }

    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = -[BMStreamCRDTLocation hash](self->_location, "hash");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_state));
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

- (BMStreamCRDTLocation)location
{
  return self->_location;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)primaryKey
{
  return self->_primaryKey;
}

- (void).cxx_destruct
{
}

- (BMSyncCRDTLocationRow)initWithFMResultSet:(id)a3 modifier:(unint64_t)a4
{
  id v6 = a3;
  if (a4 >= 3)
  {
    uint64_t v25 = __biome_log_for_category(11LL);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000401BC(a4, v26);
    }

    v17 = 0LL;
  }

  else
  {
    uint64_t v7 = (uint64_t)*(&off_100068AF8 + a4);
    v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@%@",  v7,  @"stream");
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v6 stringForColumn:v8]);

    v10 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@%@",  v7,  @"site");
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 stringForColumn:v10]);

    v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@%@",  v7,  @"day");
    [v6 doubleForColumn:v12];
    double v14 = v13;

    v15 = -[NSDate initWithTimeIntervalSinceReferenceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceReferenceDate:",  v14);
    v16 = v15;
    if (a4 == 1 || (v17 = 0LL, v9) && v11 && v15)
    {
      v18 = -[BMStreamCRDTLocation initWithStreamName:siteIdentifier:day:]( objc_alloc(&OBJC_CLASS___BMStreamCRDTLocation),  "initWithStreamName:siteIdentifier:day:",  v9,  v11,  v15);
      if (v18)
      {
        v28 = self;
        v19 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@%@",  v7,  @"state");
        uint64_t v20 = (int)[v6 intForColumn:v19];

        v21 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@%@",  v7,  @"id");
        uint64_t v22 = (int)[v6 intForColumn:v21];

        v23 = objc_alloc(&OBJC_CLASS___BMSyncCRDTLocationRow);
        uint64_t v24 = v22;
        self = v28;
        v17 = -[BMSyncCRDTLocationRow initWithLocation:state:primaryKey:]( v23,  "initWithLocation:state:primaryKey:",  v18,  v20,  v24);
      }

      else
      {
        v17 = 0LL;
      }
    }
  }

  return v17;
}

@end