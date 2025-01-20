@interface AKBagTrafficClearanceRequest
- (AKBagTrafficClearanceRequest)init;
- (AKURLBagFetchContext)context;
- (BOOL)fromURLCache;
- (BOOL)ignoreMemoryCache;
- (NSDate)requestDate;
- (NSString)urlSwitchData;
- (id)clearanceHandler;
- (id)description;
- (void)setClearanceHandler:(id)a3;
- (void)setContext:(id)a3;
- (void)setFromURLCache:(BOOL)a3;
- (void)setIgnoreMemoryCache:(BOOL)a3;
- (void)setUrlSwitchData:(id)a3;
@end

@implementation AKBagTrafficClearanceRequest

- (AKBagTrafficClearanceRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AKBagTrafficClearanceRequest;
  v2 = -[AKBagTrafficClearanceRequest init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    requestDate = v2->_requestDate;
    v2->_requestDate = (NSDate *)v3;
  }

  return v2;
}

- (id)description
{
  uint64_t v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  requestDate = self->_requestDate;
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[AKURLBagFetchContext altDSID](self->_context, "altDSID"));
  v8 = (void *)v7;
  v9 = @"YES";
  if (self->_fromURLCache) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  if (!self->_ignoreMemoryCache) {
    v9 = @"NO";
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p : %@> altDSID %@, require HTTP cache: %@, ignore memory cache: %@",  v5,  self,  requestDate,  v7,  v10,  v9));

  return v11;
}

- (AKURLBagFetchContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (id)clearanceHandler
{
  return self->_clearanceHandler;
}

- (void)setClearanceHandler:(id)a3
{
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (NSString)urlSwitchData
{
  return self->_urlSwitchData;
}

- (void)setUrlSwitchData:(id)a3
{
}

- (BOOL)fromURLCache
{
  return self->_fromURLCache;
}

- (void)setFromURLCache:(BOOL)a3
{
  self->_fromURLCache = a3;
}

- (BOOL)ignoreMemoryCache
{
  return self->_ignoreMemoryCache;
}

- (void)setIgnoreMemoryCache:(BOOL)a3
{
  self->_ignoreMemoryCache = a3;
}

- (void).cxx_destruct
{
}

@end