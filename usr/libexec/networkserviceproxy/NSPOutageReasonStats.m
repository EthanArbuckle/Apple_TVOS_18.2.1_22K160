@interface NSPOutageReasonStats
+ (BOOL)supportsSecureCoding;
- (NSPOutageReasonStats)initWithCoder:(id)a3;
- (NSString)fallbackEgressProxy;
- (NSString)fallbackIngressProxy;
- (NSString)odohProxy;
- (NSString)outageReasonSubType;
- (NSString)outageReasonType;
- (NSString)primaryEgressProxy;
- (NSString)primaryIngressProxy;
- (NSString)tierType;
- (NSString)tokenProxy;
- (id)analyticsDict;
- (id)copyWithZone:(_NSZone *)a3;
- (id)eventName;
- (void)encodeWithCoder:(id)a3;
- (void)setFallbackEgressProxy:(id)a3;
- (void)setFallbackIngressProxy:(id)a3;
- (void)setOdohProxy:(id)a3;
- (void)setOutageReasonSubType:(id)a3;
- (void)setOutageReasonType:(id)a3;
- (void)setPrimaryEgressProxy:(id)a3;
- (void)setPrimaryIngressProxy:(id)a3;
- (void)setTierType:(id)a3;
- (void)setTokenProxy:(id)a3;
@end

@implementation NSPOutageReasonStats

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPOutageReasonStats)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___NSPOutageReasonStats;
  v5 = -[NSPOutageReasonStats init](&v34, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"TierType"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    tierType = v5->_tierType;
    v5->_tierType = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"OutageReasonType"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    outageReasonType = v5->_outageReasonType;
    v5->_outageReasonType = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"OutageReasonSubType"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    outageReasonSubType = v5->_outageReasonSubType;
    v5->_outageReasonSubType = (NSString *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"PrimaryIngressProxy"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    primaryIngressProxy = v5->_primaryIngressProxy;
    v5->_primaryIngressProxy = (NSString *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"PrimaryEgressProxy"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    primaryEgressProxy = v5->_primaryEgressProxy;
    v5->_primaryEgressProxy = (NSString *)v19;

    id v21 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"FallbackIngressProxy"];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    fallbackIngressProxy = v5->_fallbackIngressProxy;
    v5->_fallbackIngressProxy = (NSString *)v22;

    id v24 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"FallbackEgressProxy"];
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    fallbackEgressProxy = v5->_fallbackEgressProxy;
    v5->_fallbackEgressProxy = (NSString *)v25;

    id v27 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"ODoHProxy"];
    uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
    odohProxy = v5->_odohProxy;
    v5->_odohProxy = (NSString *)v28;

    id v30 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"TokenProxy"];
    uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
    tokenProxy = v5->_tokenProxy;
    v5->_tokenProxy = (NSString *)v31;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats tierType](self, "tierType"));
  [v4 encodeObject:v5 forKey:@"TierType"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats outageReasonType](self, "outageReasonType"));
  [v4 encodeObject:v6 forKey:@"OutageReasonType"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats outageReasonSubType](self, "outageReasonSubType"));
  [v4 encodeObject:v7 forKey:@"OutageReasonSubType"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats primaryIngressProxy](self, "primaryIngressProxy"));
  [v4 encodeObject:v8 forKey:@"PrimaryIngressProxy"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats primaryEgressProxy](self, "primaryEgressProxy"));
  [v4 encodeObject:v9 forKey:@"PrimaryEgressProxy"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats fallbackIngressProxy](self, "fallbackIngressProxy"));
  [v4 encodeObject:v10 forKey:@"FallbackIngressProxy"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats fallbackEgressProxy](self, "fallbackEgressProxy"));
  [v4 encodeObject:v11 forKey:@"FallbackEgressProxy"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats odohProxy](self, "odohProxy"));
  [v4 encodeObject:v12 forKey:@"ODoHProxy"];

  id v13 = (id)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats tokenProxy](self, "tokenProxy"));
  [v4 encodeObject:v13 forKey:@"TokenProxy"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NSPOutageReasonStats init]( +[NSPOutageReasonStats allocWithZone:](&OBJC_CLASS___NSPOutageReasonStats, "allocWithZone:", a3),  "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats tierType](self, "tierType"));
  -[NSPOutageReasonStats setTierType:](v4, "setTierType:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats outageReasonType](self, "outageReasonType"));
  -[NSPOutageReasonStats setOutageReasonType:](v4, "setOutageReasonType:", v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats outageReasonSubType](self, "outageReasonSubType"));
  -[NSPOutageReasonStats setOutageReasonSubType:](v4, "setOutageReasonSubType:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats primaryIngressProxy](self, "primaryIngressProxy"));
  -[NSPOutageReasonStats setPrimaryIngressProxy:](v4, "setPrimaryIngressProxy:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats primaryEgressProxy](self, "primaryEgressProxy"));
  -[NSPOutageReasonStats setPrimaryEgressProxy:](v4, "setPrimaryEgressProxy:", v9);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats fallbackIngressProxy](self, "fallbackIngressProxy"));
  -[NSPOutageReasonStats setFallbackIngressProxy:](v4, "setFallbackIngressProxy:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats fallbackEgressProxy](self, "fallbackEgressProxy"));
  -[NSPOutageReasonStats setFallbackEgressProxy:](v4, "setFallbackEgressProxy:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats odohProxy](self, "odohProxy"));
  -[NSPOutageReasonStats setOdohProxy:](v4, "setOdohProxy:", v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats tokenProxy](self, "tokenProxy"));
  -[NSPOutageReasonStats setTokenProxy:](v4, "setTokenProxy:", v13);

  return v4;
}

- (id)eventName
{
  return @"com.apple.nsp.outageReasonStats";
}

- (id)analyticsDict
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats outageReasonType](self, "outageReasonType"));

  if (!v3)
  {
    uint64_t v22 = nplog_obj(v4, v5, v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      return 0LL;
    }

    int v26 = 136315138;
    id v27 = "-[NSPOutageReasonStats analyticsDict]";
    id v24 = "%s called with null self.outageReasonType";
LABEL_10:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_FAULT, v24, (uint8_t *)&v26, 0xCu);
    goto LABEL_8;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats outageReasonSubType](self, "outageReasonSubType"));

  if (!v7)
  {
    uint64_t v25 = nplog_obj(v8, v9, v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    int v26 = 136315138;
    id v27 = "-[NSPOutageReasonStats analyticsDict]";
    id v24 = "%s called with null self.outageReasonSubType";
    goto LABEL_10;
  }

  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats tierType](self, "tierType"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v12, @"TierType");

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats outageReasonType](self, "outageReasonType"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v13,  @"OutageReasonType");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats outageReasonSubType](self, "outageReasonSubType"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v14,  @"OutageReasonSubType");

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats primaryIngressProxy](self, "primaryIngressProxy"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v15,  @"PrimaryIngressProxy");

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats primaryEgressProxy](self, "primaryEgressProxy"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v16,  @"PrimaryEgressProxy");

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats fallbackIngressProxy](self, "fallbackIngressProxy"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v17,  @"FallbackIngressProxy");

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats fallbackEgressProxy](self, "fallbackEgressProxy"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v18,  @"FallbackEgressProxy");

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats odohProxy](self, "odohProxy"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v19, @"ODoHProxy");

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats tokenProxy](self, "tokenProxy"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v20, @"TokenProxy");

  return v11;
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
}

- (NSString)outageReasonType
{
  return self->_outageReasonType;
}

- (void)setOutageReasonType:(id)a3
{
}

- (NSString)outageReasonSubType
{
  return self->_outageReasonSubType;
}

- (void)setOutageReasonSubType:(id)a3
{
}

- (NSString)primaryIngressProxy
{
  return self->_primaryIngressProxy;
}

- (void)setPrimaryIngressProxy:(id)a3
{
}

- (NSString)primaryEgressProxy
{
  return self->_primaryEgressProxy;
}

- (void)setPrimaryEgressProxy:(id)a3
{
}

- (NSString)fallbackIngressProxy
{
  return self->_fallbackIngressProxy;
}

- (void)setFallbackIngressProxy:(id)a3
{
}

- (NSString)fallbackEgressProxy
{
  return self->_fallbackEgressProxy;
}

- (void)setFallbackEgressProxy:(id)a3
{
}

- (NSString)odohProxy
{
  return self->_odohProxy;
}

- (void)setOdohProxy:(id)a3
{
}

- (NSString)tokenProxy
{
  return self->_tokenProxy;
}

- (void)setTokenProxy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end