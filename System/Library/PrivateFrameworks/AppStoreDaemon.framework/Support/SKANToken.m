@interface SKANToken
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
- (BOOL)isRedownload;
- (NSNumber)appAdamId;
- (NSNumber)timestamp;
- (NSString)blindedElement;
- (NSString)certificate;
- (NSString)finalizedToken;
- (NSString)privateInput;
- (SKANToken)initWithAppAdamId:(id)a3 blindedData:(id)a4;
- (id)dictionaryRepresentationForRequest;
- (void)setCertificate:(id)a3;
- (void)setFinalizedToken:(id)a3;
- (void)setIsRedownload:(BOOL)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation SKANToken

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___SKANTokenEntity, a2);
}

+ (id)defaultProperties
{
  v3[0] = @"app_adam_id";
  v3[1] = @"blinded_element";
  v3[2] = @"private_input";
  v3[3] = @"finalized_token";
  v3[4] = @"certificate";
  v3[5] = @"is_redownload";
  v3[6] = @"timestamp";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  7LL));
}

- (SKANToken)initWithAppAdamId:(id)a3 blindedData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SKANToken;
  v8 = -[SQLiteMemoryEntity init](&v13, "init");
  v9 = v8;
  if (v6 && v8)
  {
    -[SQLiteMemoryEntity setValue:forProperty:](v8, "setValue:forProperty:", v6, @"app_adam_id");
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 blindedElement]);
    -[SQLiteMemoryEntity setValue:forProperty:](v9, "setValue:forProperty:", v10, @"blinded_element");

    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 privateInput]);
    -[SQLiteMemoryEntity setValue:forProperty:](v9, "setValue:forProperty:", v11, @"private_input");
  }

  return v9;
}

- (id)dictionaryRepresentationForRequest
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKANToken appAdamId](self, "appAdamId"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"adam-id");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKANToken timestamp](self, "timestamp"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"timestamp");

  else {
    id v6 = @"false";
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"is-redownload");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKANToken privateInput](self, "privateInput"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"private-input");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKANToken finalizedToken](self, "finalizedToken"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, @"prf-client");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKANToken certificate](self, "certificate"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"certificate");

  return v3;
}

- (NSNumber)appAdamId
{
  return (NSNumber *)sub_1001E25D0(self, (uint64_t)@"app_adam_id");
}

- (NSString)blindedElement
{
  return (NSString *)sub_1001E26D0(self, (uint64_t)@"blinded_element");
}

- (NSString)privateInput
{
  return (NSString *)sub_1001E26D0(self, (uint64_t)@"private_input");
}

- (NSString)finalizedToken
{
  return (NSString *)sub_1001E26D0(self, (uint64_t)@"finalized_token");
}

- (NSString)certificate
{
  return (NSString *)sub_1001E26D0(self, (uint64_t)@"certificate");
}

- (NSNumber)timestamp
{
  return (NSNumber *)sub_1001E25D0(self, (uint64_t)@"timestamp");
}

- (BOOL)isRedownload
{
  return sub_1001E2598(self, (uint64_t)@"is_redownload");
}

- (void)setFinalizedToken:(id)a3
{
}

- (void)setCertificate:(id)a3
{
}

- (void)setIsRedownload:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[SQLiteMemoryEntity setValue:forProperty:](self, "setValue:forProperty:", v4, @"is_redownload");
}

- (void)setTimestamp:(id)a3
{
}

@end