@interface IDSTTLCacheItem
- (IDSTTLCacheItem)initWithObject:(id)a3 key:(id)a4;
- (NSDate)evictionDate;
- (NSString)key;
- (id)object;
- (void)bumpEvictionDateToSecondsFromNow:(double)a3;
- (void)setEvictionDate:(id)a3;
- (void)setKey:(id)a3;
- (void)setObject:(id)a3;
@end

@implementation IDSTTLCacheItem

- (IDSTTLCacheItem)initWithObject:(id)a3 key:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSTTLCacheItem;
  v9 = -[IDSTTLCacheItem init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_object, a3);
    objc_storeStrong((id *)&v10->_key, a4);
  }

  return v10;
}

- (void)bumpEvictionDateToSecondsFromNow:(double)a3
{
  v4 = -[NSDate initWithTimeIntervalSinceNow:](objc_alloc(&OBJC_CLASS___NSDate), "initWithTimeIntervalSinceNow:", a3);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utilities](&OBJC_CLASS___IDSFoundationLog, "utilities"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTTLCacheItem key](self, "key"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTTLCacheItem evictionDate](self, "evictionDate"));
    int v8 = 138478339;
    v9 = v6;
    __int16 v10 = 2114;
    v11 = v7;
    __int16 v12 = 2114;
    v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Extending TTL for fetched object {key: %{private}@, oldEvictDate: %{public}@, newEvictDate: %{public}@",  (uint8_t *)&v8,  0x20u);
  }

  -[IDSTTLCacheItem setEvictionDate:](self, "setEvictionDate:", v4);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

- (NSDate)evictionDate
{
  return self->_evictionDate;
}

- (void)setEvictionDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end