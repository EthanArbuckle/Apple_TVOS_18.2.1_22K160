@interface CPLBGSTActivitiesReport
+ (BOOL)supportsSecureCoding;
- (CPLBGSTActivitiesReport)init;
- (CPLBGSTActivitiesReport)initWithCoder:(id)a3;
- (id)_reportForTaskWithIdentifier:(id)a3;
- (id)statusesWithNow:(id)a3;
- (void)didAcquireTaskWithIdentifier:(id)a3;
- (void)didCancelTaskWithIdentifier:(id)a3;
- (void)didDeferTaskWithIdentifier:(id)a3;
- (void)didErrorTaskWithIdentifier:(id)a3;
- (void)didExpireTaskWithIdentifier:(id)a3;
- (void)didFinishTaskWithIdentifier:(id)a3;
- (void)didSubmitTaskWithIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLBGSTActivitiesReport

- (CPLBGSTActivitiesReport)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CPLBGSTActivitiesReport;
  v2 = -[CPLBGSTActivitiesReport init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    reportPerIdentifier = v2->_reportPerIdentifier;
    v2->_reportPerIdentifier = v3;
  }

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPLBGSTActivitiesReport)initWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSXPCCoder);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0) {
    sub_10018EB30((uint64_t)self, (uint64_t)a2);
  }
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CPLBGSTActivitiesReport;
  v7 = -[CPLBGSTActivitiesReport init](&v15, "init");
  if (!v7) {
    goto LABEL_4;
  }
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
  v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v8,  objc_opt_class(&OBJC_CLASS___CPLBGSTActivityReport),  0LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v5 decodeObjectOfClasses:v10 forKey:@"reports"]);
  reportPerIdentifier = v7->_reportPerIdentifier;
  v7->_reportPerIdentifier = (NSMutableDictionary *)v11;

  if (!v7->_reportPerIdentifier) {
    v13 = 0LL;
  }
  else {
LABEL_4:
  }
    v13 = v7;

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSXPCCoder);
  if ((objc_opt_isKindOfClass(v6, v5) & 1) == 0) {
    sub_10018EC2C((uint64_t)self, (uint64_t)a2);
  }
  [v6 encodeObject:self->_reportPerIdentifier forKey:@"reports"];
}

- (id)_reportForTaskWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_reportPerIdentifier,  "objectForKeyedSubscript:",  v4));

  if (!v5)
  {
    id v6 = -[CPLBGSTActivityReport initWithTaskIdentifier:]( objc_alloc(&OBJC_CLASS___CPLBGSTActivityReport),  "initWithTaskIdentifier:",  v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_reportPerIdentifier,  "setObject:forKeyedSubscript:",  v6,  v4);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_reportPerIdentifier,  "objectForKeyedSubscript:",  v4));

  return v7;
}

- (void)didSubmitTaskWithIdentifier:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[CPLBGSTActivitiesReport _reportForTaskWithIdentifier:](self, "_reportForTaskWithIdentifier:", a3));
  [v3 didSubmit];
}

- (void)didCancelTaskWithIdentifier:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[CPLBGSTActivitiesReport _reportForTaskWithIdentifier:](self, "_reportForTaskWithIdentifier:", a3));
  [v3 didCancel];
}

- (void)didAcquireTaskWithIdentifier:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[CPLBGSTActivitiesReport _reportForTaskWithIdentifier:](self, "_reportForTaskWithIdentifier:", a3));
  [v3 didAcquire];
}

- (void)didExpireTaskWithIdentifier:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[CPLBGSTActivitiesReport _reportForTaskWithIdentifier:](self, "_reportForTaskWithIdentifier:", a3));
  [v3 didExpire];
}

- (void)didDeferTaskWithIdentifier:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[CPLBGSTActivitiesReport _reportForTaskWithIdentifier:](self, "_reportForTaskWithIdentifier:", a3));
  [v3 didDefer];
}

- (void)didErrorTaskWithIdentifier:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[CPLBGSTActivitiesReport _reportForTaskWithIdentifier:](self, "_reportForTaskWithIdentifier:", a3));
  [v3 didError];
}

- (void)didFinishTaskWithIdentifier:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[CPLBGSTActivitiesReport _reportForTaskWithIdentifier:](self, "_reportForTaskWithIdentifier:", a3));
  [v3 didFinish];
}

- (id)statusesWithNow:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableDictionary count](self->_reportPerIdentifier, "count"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_reportPerIdentifier, "allKeys", 0LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sortedArrayUsingSelector:"compare:"]);

  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_reportPerIdentifier,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)v11)));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 statusWithNow:v4]);

        -[NSMutableArray addObject:](v5, "addObject:", v13);
        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);
  }

  id v14 = -[NSMutableArray copy](v5, "copy");
  return v14;
}

- (void).cxx_destruct
{
}

@end