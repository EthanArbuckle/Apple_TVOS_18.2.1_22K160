@interface BMStreamCRDTLocation
+ (id)dayFromRecordName:(id)a3;
+ (id)recordNameFromSite:(id)a3 day:(id)a4;
- (BMStreamCRDTLocation)initWithCKMergeableValueID:(id)a3;
- (BMStreamCRDTLocation)initWithCKMergeableValueID:(id)a3 streamName:(id)a4;
- (BMStreamCRDTLocation)initWithStreamName:(id)a3 siteIdentifier:(id)a4 day:(id)a5;
- (BMStreamCRDTLocation)initWithTriple:(id)a3;
- (BMStreamCRDTLocation)initWithZoneName:(id)a3 recordName:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSDate)day;
- (NSString)siteIdentifier;
- (NSString)streamName;
- (double)secondsUntilExpirationWithStreamConfiguration:(id)a3;
- (id)ckMergeableValueID;
- (id)ckMergeableValueIDWithFormatVersion:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initFromDictionary:(id)a3;
- (id)recordName;
- (id)triple;
- (unint64_t)hash;
@end

@implementation BMStreamCRDTLocation

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"stream"]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"site"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"day"]);

  v8 = -[BMStreamCRDTLocation initWithStreamName:siteIdentifier:day:]( self,  "initWithStreamName:siteIdentifier:day:",  v5,  v6,  v7);
  return v8;
}

- (id)dictionaryRepresentation
{
  v8[0] = @"stream";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation streamName](self, "streamName"));
  v9[0] = v3;
  v8[1] = @"site";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation siteIdentifier](self, "siteIdentifier"));
  v9[1] = v4;
  v8[2] = @"day";
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation day](self, "day"));
  v9[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  3LL));

  return v6;
}

- (BMStreamCRDTLocation)initWithStreamName:(id)a3 siteIdentifier:(id)a4 day:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v9 && v10 && v11)
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___BMStreamCRDTLocation;
    v13 = -[BMStreamCRDTLocation init](&v19, "init");
    p_isa = (id *)&v13->super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_streamName, a3);
      objc_storeStrong(p_isa + 3, a4);
      objc_storeStrong(p_isa + 4, a5);
    }

    self = p_isa;
    v15 = self;
  }

  else
  {
    uint64_t v16 = __biome_log_for_category(11LL);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2112;
      v25 = v12;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_FAULT,  "nil value encountered in [BMStreamCRDTLocation initWithStreamName:%@ siteIdentifier:%@ day:%@]",  buf,  0x20u);
    }

    v15 = 0LL;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BMStreamCRDTLocation *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v12 = 1;
  }

  else
  {
    streamName = self->_streamName;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation streamName](v4, "streamName"));
    if (-[NSString isEqualToString:](streamName, "isEqualToString:", v7))
    {
      siteIdentifier = self->_siteIdentifier;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation siteIdentifier](v5, "siteIdentifier"));
      if (-[NSString isEqualToString:](siteIdentifier, "isEqualToString:", v9))
      {
        day = self->_day;
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation day](v5, "day"));
        unsigned __int8 v12 = -[NSDate isEqualToDate:](day, "isEqualToDate:", v11);
      }

      else
      {
        unsigned __int8 v12 = 0;
      }
    }

    else
    {
      unsigned __int8 v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_streamName, "hash");
  unint64_t v4 = -[NSString hash](self->_siteIdentifier, "hash") ^ v3;
  return v4 ^ (unint64_t)-[NSDate hash](self->_day, "hash");
}

- (id)description
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"BMStreamCRDTLocation(stream: %@, site: %@, day: %@)",  self->_streamName,  self->_siteIdentifier,  self->_day);
}

- (id)triple
{
  NSUInteger v3 = (void *)objc_claimAutoreleasedReturnValue(+[BMDateFormatterVendor sharedInstance](&OBJC_CLASS___BMDateFormatterVendor, "sharedInstance"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dateFormatter]);

  v5 = objc_alloc(&OBJC_CLASS___NSString);
  streamName = self->_streamName;
  siteIdentifier = self->_siteIdentifier;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 stringFromDate:self->_day]);
  id v9 = -[NSString initWithFormat:](v5, "initWithFormat:", @"(%@,%@,%@)", streamName, siteIdentifier, v8);

  return v9;
}

+ (id)recordNameFromSite:(id)a3 day:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BMDateFormatterVendor sharedInstance](&OBJC_CLASS___BMDateFormatterVendor, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dateFormatter]);

  id v9 = objc_alloc(&OBJC_CLASS___NSString);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 stringFromDate:v5]);

  id v11 = -[NSString initWithFormat:](v9, "initWithFormat:", @"%@,%@", v6, v10);
  return v11;
}

- (id)recordName
{
  return +[BMStreamCRDTLocation recordNameFromSite:day:]( &OBJC_CLASS___BMStreamCRDTLocation,  "recordNameFromSite:day:",  self->_siteIdentifier,  self->_day);
}

- (BMStreamCRDTLocation)initWithTriple:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", 1, (char *)objc_msgSend(v4, "length") - 2));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsSeparatedByString:@","]);

    if ([v6 count] == (id)3)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:1]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[BMDateFormatterVendor sharedInstance](&OBJC_CLASS___BMDateFormatterVendor, "sharedInstance"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dateFormatter]);

      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:2]);
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 dateFromString:v11]);

      v13 = -[BMStreamCRDTLocation initWithStreamName:siteIdentifier:day:]( objc_alloc(&OBJC_CLASS___BMStreamCRDTLocation),  "initWithStreamName:siteIdentifier:day:",  v7,  v8,  v12);
    }

    else
    {
      v13 = 0LL;
    }
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

+ (id)dayFromRecordName:(id)a3
{
  NSUInteger v3 = (void *)objc_claimAutoreleasedReturnValue([a3 componentsSeparatedByString:@","]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[BMDateFormatterVendor sharedInstance](&OBJC_CLASS___BMDateFormatterVendor, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dateFormatter]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:1]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 dateFromString:v6]);

  return v7;
}

- (BMStreamCRDTLocation)initWithZoneName:(id)a3 recordName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"(%@,%@)", v7, v6);

  id v9 = -[BMStreamCRDTLocation initWithTriple:](self, "initWithTriple:", v8);
  return v9;
}

- (BMStreamCRDTLocation)initWithCKMergeableValueID:(id)a3
{
  return -[BMStreamCRDTLocation initWithCKMergeableValueID:streamName:]( self,  "initWithCKMergeableValueID:streamName:",  a3,  0LL);
}

- (BMStreamCRDTLocation)initWithCKMergeableValueID:(id)a3 streamName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc(&OBJC_CLASS___NSString);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v10 = -[NSString initWithData:encoding:](v8, "initWithData:encoding:", v9, 4LL);

  if (-[NSString characterAtIndex:](v10, "characterAtIndex:", 0LL) == 40)
  {
    if (v10 && -[NSString length](v10, "length"))
    {
      self = -[BMStreamCRDTLocation initWithTriple:](self, "initWithTriple:", v10);
      id v11 = self;
    }

    else
    {
      id v11 = 0LL;
    }
  }

  else
  {
    if (v7)
    {
      id v12 = v7;
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
      id v12 = (id)objc_claimAutoreleasedReturnValue([v13 zoneName]);

      if (!v12)
      {
        uint64_t v14 = __biome_log_for_category(11LL);
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          sub_100043E90(v15);
        }

        id v12 = 0LL;
      }
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue([v16 recordName]);

    id v26 = v7;
    if (v17) {
      v18 = v17;
    }
    else {
      v18 = v10;
    }
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSString componentsSeparatedByString:](v18, "componentsSeparatedByString:", @","));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:0]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[BMDateFormatterVendor sharedInstance](&OBJC_CLASS___BMDateFormatterVendor, "sharedInstance"));
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 dateFormatter]);

    id v23 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:1]);
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v22 dateFromString:v23]);

    self =  -[BMStreamCRDTLocation initWithStreamName:siteIdentifier:day:]( self,  "initWithStreamName:siteIdentifier:day:",  v12,  v20,  v24);
    id v11 = self;
    id v7 = v26;
  }

  return v11;
}

- (id)ckMergeableValueID
{
  return -[BMStreamCRDTLocation ckMergeableValueIDWithFormatVersion:](self, "ckMergeableValueIDWithFormatVersion:", 0LL);
}

- (id)ckMergeableValueIDWithFormatVersion:(unint64_t)a3
{
  p_streamName = &self->_streamName;
  if (!-[NSString length](self->_streamName, "length"))
  {
    uint64_t v15 = __biome_log_for_category(11LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_100043ED0(p_streamName, (uint64_t)self, v6);
    }
    goto LABEL_11;
  }

  id v6 = -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  *p_streamName,  CKCurrentUserDefaultName);
  if (a3 == 1)
  {
    id v16 = objc_alloc(&OBJC_CLASS___CKMergeableValueID);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation recordName](self, "recordName"));
    id v14 = [v16 initWithName:v17 zoneID:v6];

    goto LABEL_12;
  }

  if (a3)
  {
    uint64_t v18 = __biome_log_for_category(11LL);
    objc_super v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      sub_100043F74(a3, v19);
    }

LABEL_11:
    id v14 = 0LL;
    goto LABEL_12;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[BMDateFormatterVendor sharedInstance](&OBJC_CLASS___BMDateFormatterVendor, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dateFormatter]);

  id v9 = objc_alloc(&OBJC_CLASS___NSString);
  streamName = self->_streamName;
  siteIdentifier = self->_siteIdentifier;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 stringFromDate:self->_day]);
  v13 = -[NSString initWithFormat:](v9, "initWithFormat:", @"(%@,%@,%@)", streamName, siteIdentifier, v12);

  id v14 = [[CKMergeableValueID alloc] initWithName:v13 zoneID:v6];
LABEL_12:

  return v14;
}

- (double)secondsUntilExpirationWithStreamConfiguration:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 storeConfig]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pruningPolicy]);
  [v5 maxAge];
  double v7 = v6;

  double v8 = 2419200.0;
  if (v7 != 0.0) {
    double v8 = v7;
  }
  if (v7 == BMPruningPolicyMaxAgeNoLimit) {
    double v9 = 157680000.0;
  }
  else {
    double v9 = v8;
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation day](self, "day"));
  [v10 timeIntervalSinceNow];
  double v12 = v11;

  return v9 + v12;
}

- (NSString)streamName
{
  return self->_streamName;
}

- (NSString)siteIdentifier
{
  return self->_siteIdentifier;
}

- (NSDate)day
{
  return self->_day;
}

- (void).cxx_destruct
{
}

@end