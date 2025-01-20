@interface DYTimelineCounterGroup
+ (BOOL)supportsSecureCoding;
- (DYTimelineCounterGroup)init;
- (DYTimelineCounterGroup)initWithCoder:(id)a3;
- (NSArray)counterNames;
- (NSArray)counters;
- (NSData)timestamps;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCounterNames:(id)a3;
- (void)setCounters:(id)a3;
- (void)setTimestamps:(id)a3;
@end

@implementation DYTimelineCounterGroup

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYTimelineCounterGroup timestamps](self, "timestamps"));
  id v6 = [v5 copy];
  [v4 setTimestamps:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYTimelineCounterGroup counters](self, "counters"));
  id v8 = [v7 copy];
  [v4 setCounters:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DYTimelineCounterGroup counterNames](self, "counterNames"));
  id v10 = [v9 copy];
  [v4 setCounterNames:v10];

  return v4;
}

- (DYTimelineCounterGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___DYTimelineCounterGroup;
  id v6 = -[DYTimelineCounterGroup init](&v37, "init");
  if (v6)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSData, v5);
    v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  objc_opt_class(&OBJC_CLASS___NSMutableData, v8),  0LL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v10 forKey:@"timestamps"]);
    timestamps = v6->_timestamps;
    v6->_timestamps = (NSData *)v11;

    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSData, v13);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSMutableData, v15);
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray, v17);
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSNumber, v19);
    v22 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v14,  v16,  v18,  v20,  objc_opt_class(&OBJC_CLASS___NSMutableArray, v21),  0LL);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    uint64_t v24 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v23 forKey:@"counters"]);
    counters = v6->_counters;
    v6->_counters = (NSArray *)v24;

    uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSArray, v26);
    uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSString, v28);
    v31 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v27,  v29,  objc_opt_class(&OBJC_CLASS___NSMutableArray, v30),  0LL);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    uint64_t v33 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v32 forKey:@"countersNames"]);
    counterNames = v6->_counterNames;
    v6->_counterNames = (NSArray *)v33;

    v35 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_timestamps forKey:@"timestamps"];
  [v4 encodeObject:self->_counters forKey:@"counters"];
  [v4 encodeObject:self->_counterNames forKey:@"countersNames"];
}

- (DYTimelineCounterGroup)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DYTimelineCounterGroup;
  v2 = -[DYTimelineCounterGroup init](&v6, "init");
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

- (NSData)timestamps
{
  return self->_timestamps;
}

- (void)setTimestamps:(id)a3
{
}

- (NSArray)counters
{
  return self->_counters;
}

- (void)setCounters:(id)a3
{
}

- (NSArray)counterNames
{
  return self->_counterNames;
}

- (void)setCounterNames:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end