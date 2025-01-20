@interface PCSKeyClient
- (BOOL)circle;
- (BOOL)iCDP;
- (BOOL)isNewWatch;
- (NSData)lastHash;
- (NSDate)firstSync;
- (NSDate)lastSeen;
- (NSDate)lastSent;
- (NSString)buildVersion;
- (NSString)name;
- (NSString)uuid;
- (PCSKeyClient)initWithName:(id)a3 values:(id)a4 dsid:(id)a5;
- (id)getValues:(id)a3;
- (int)failures;
- (int64_t)numberHandshakes;
- (int64_t)protocolVersion;
- (void)setBuildVersion:(id)a3;
- (void)setCircle:(BOOL)a3;
- (void)setFailures:(int)a3;
- (void)setFirstSync:(id)a3;
- (void)setICDP:(BOOL)a3;
- (void)setIsNewWatch:(BOOL)a3;
- (void)setLastHash:(id)a3;
- (void)setLastSeen:(id)a3;
- (void)setLastSent:(id)a3;
- (void)setName:(id)a3;
- (void)setNumberHandshakes:(int64_t)a3;
- (void)setProtocolVersion:(int64_t)a3;
- (void)setUuid:(id)a3;
- (void)updateWithValues:(id)a3 dsid:(id)a4;
@end

@implementation PCSKeyClient

- (PCSKeyClient)initWithName:(id)a3 values:(id)a4 dsid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___PCSKeyClient;
    v11 = -[PCSKeyClient init](&v15, "init");
    v12 = v11;
    if (v11)
    {
      -[PCSKeyClient setUuid:](v11, "setUuid:", v8);
      if (v9) {
        -[PCSKeyClient updateWithValues:dsid:](v12, "updateWithValues:dsid:", v9, v10);
      }
      else {
        -[PCSKeyClient setIsNewWatch:](v12, "setIsNewWatch:", 1LL);
      }
    }

    self = v12;
    v13 = self;
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (void)updateWithValues:(id)a3 dsid:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"lastSeen"]);
  -[PCSKeyClient setLastSeen:](self, "setLastSeen:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"lastHash"]);
  -[PCSKeyClient setLastHash:](self, "setLastHash:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"name"]);
  -[PCSKeyClient setName:](self, "setName:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"lastSent"]);
  -[PCSKeyClient setLastSent:](self, "setLastSent:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"failures"]);
  -[PCSKeyClient setFailures:](self, "setFailures:", [v11 intValue]);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"numberHandshakes"]);
  -[PCSKeyClient setNumberHandshakes:](self, "setNumberHandshakes:", [v12 longValue]);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"buildVersion"]);
  -[PCSKeyClient setBuildVersion:](self, "setBuildVersion:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"firstSync"]);
  -[PCSKeyClient setFirstSync:](self, "setFirstSync:", v14);

  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"protocol"]);
  -[PCSKeyClient setProtocolVersion:](self, "setProtocolVersion:", [v15 longValue]);

  if (v6
    && (v16 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"dsid"]),
        unsigned int v17 = [v16 isEqualToString:v6],
        v16,
        v17))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"iCDP2"]);
    -[PCSKeyClient setICDP:](self, "setICDP:", [v18 BOOLValue]);

    v19 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"circle2"]);
    -[PCSKeyClient setCircle:](self, "setCircle:", [v19 BOOLValue]);

    uint64_t v20 = objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"firstSync"]);
  }

  else
  {
    -[PCSKeyClient setICDP:](self, "setICDP:", 0LL);
    -[PCSKeyClient setCircle:](self, "setCircle:", 0LL);
    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }

  v21 = (void *)v20;
  -[PCSKeyClient setFirstSync:](self, "setFirstSync:", v20);
}

- (id)getValues:(id)a3
{
  v4 = (__CFString *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeyClient uuid](self, "uuid"));

  if (v5)
  {
    if (!v4) {
      v4 = &stru_100025318;
    }
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeyClient lastSeen](self, "lastSeen"));

    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[PCSKeyClient setLastSeen:](self, "setLastSeen:", v7);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeyClient lastHash](self, "lastHash"));

    if (!v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
      -[PCSKeyClient setLastHash:](self, "setLastHash:", v9);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeyClient name](self, "name"));

    if (!v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeyClient uuid](self, "uuid"));
      -[PCSKeyClient setName:](self, "setName:", v11);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeyClient buildVersion](self, "buildVersion"));

    if (!v12) {
      -[PCSKeyClient setBuildVersion:](self, "setBuildVersion:", @"0");
    }
    v30[0] = @"lastSeen";
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeyClient lastSeen](self, "lastSeen", &OBJC_CLASS___NSMutableDictionary));
    v31[0] = v29;
    v30[1] = @"lastHash";
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeyClient lastHash](self, "lastHash"));
    v31[1] = v28;
    v30[2] = @"name";
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeyClient name](self, "name"));
    v31[2] = v27;
    v30[3] = @"failures";
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[PCSKeyClient failures](self, "failures")));
    v31[3] = v13;
    v30[4] = @"numberHandshakes";
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( &OBJC_CLASS___NSNumber,  "numberWithLong:",  -[PCSKeyClient numberHandshakes](self, "numberHandshakes")));
    v31[4] = v14;
    v30[5] = @"buildVersion";
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeyClient buildVersion](self, "buildVersion"));
    v31[5] = v15;
    v30[6] = @"protocol";
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( &OBJC_CLASS___NSNumber,  "numberWithLong:",  -[PCSKeyClient protocolVersion](self, "protocolVersion")));
    v31[6] = v16;
    v30[7] = @"iCDP2";
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[PCSKeyClient iCDP](self, "iCDP")));
    v31[7] = v17;
    v30[8] = @"circle2";
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[PCSKeyClient circle](self, "circle")));
    v30[9] = @"dsid";
    v31[8] = v18;
    v31[9] = v4;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  10LL));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v26 dictionaryWithDictionary:v19]);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeyClient lastSent](self, "lastSent"));
    if (v21)
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeyClient lastSent](self, "lastSent"));
      [v20 setObject:v22 forKey:@"lastSent"];
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeyClient firstSync](self, "firstSync"));

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeyClient firstSync](self, "firstSync"));
      [v20 setObject:v24 forKey:@"firstSync"];
    }
  }

  else
  {
    uint64_t v20 = 0LL;
  }

  return v20;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSString)buildVersion
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setBuildVersion:(id)a3
{
}

- (NSDate)firstSync
{
  return (NSDate *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setFirstSync:(id)a3
{
}

- (NSDate)lastSeen
{
  return (NSDate *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setLastSeen:(id)a3
{
}

- (NSData)lastHash
{
  return (NSData *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setLastHash:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setName:(id)a3
{
}

- (int)failures
{
  return self->_failures;
}

- (void)setFailures:(int)a3
{
  self->_failures = a3;
}

- (NSDate)lastSent
{
  return (NSDate *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setLastSent:(id)a3
{
}

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(int64_t)a3
{
  self->_protocolVersion = a3;
}

- (BOOL)iCDP
{
  return self->_iCDP;
}

- (void)setICDP:(BOOL)a3
{
  self->_iCDP = a3;
}

- (BOOL)circle
{
  return self->_circle;
}

- (void)setCircle:(BOOL)a3
{
  self->_circle = a3;
}

- (BOOL)isNewWatch
{
  return self->_isNewWatch;
}

- (void)setIsNewWatch:(BOOL)a3
{
  self->_isNewWatch = a3;
}

- (int64_t)numberHandshakes
{
  return self->_numberHandshakes;
}

- (void)setNumberHandshakes:(int64_t)a3
{
  self->_numberHandshakes = a3;
}

- (void).cxx_destruct
{
}

@end