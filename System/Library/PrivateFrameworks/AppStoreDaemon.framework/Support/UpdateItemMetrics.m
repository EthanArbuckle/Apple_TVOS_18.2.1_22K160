@interface UpdateItemMetrics
- (UpdateItemMetrics)init;
- (UpdateItemMetrics)initWithData:(id)a3;
- (id)description;
@end

@implementation UpdateItemMetrics

- (UpdateItemMetrics)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UpdateItemMetrics;
  v2 = -[UpdateItemMetrics init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    metricsData = v2->_metricsData;
    v2->_metricsData = v3;
  }

  return v2;
}

- (UpdateItemMetrics)initWithData:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___UpdateItemMetrics;
  v5 = -[UpdateItemMetrics init](&v15, "init");
  if (!v5) {
    goto LABEL_4;
  }
  if (v4)
  {
    objc_super v6 = (NSMutableDictionary *)[v4 mutableCopy];
    metricsData = v5->_metricsData;
    v5->_metricsData = v6;

LABEL_4:
    v8 = v5;
    goto LABEL_8;
  }

  uint64_t v9 = ASDLogHandleForCategory(14LL);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_opt_class(v5, v11);
    *(_DWORD *)buf = 138543362;
    v17 = v13;
    id v14 = v13;
    _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "[%{public}@]: Unable to initialze with data",  buf,  0xCu);
  }

  v8 = 0LL;
LABEL_8:

  return v8;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keyEnumerator](self->_metricsData, "keyEnumerator"));
  id v4 = -[NSMutableString initWithString:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithString:", @"{");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_metricsData, "valueForKey:", v9));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" %@: %@",  v9,  v10));
        -[NSMutableString appendString:](v4, "appendString:", v11);
      }

      id v6 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  -[NSMutableString appendString:](v4, "appendString:", @" }");
  return v4;
}

- (void).cxx_destruct
{
}

@end