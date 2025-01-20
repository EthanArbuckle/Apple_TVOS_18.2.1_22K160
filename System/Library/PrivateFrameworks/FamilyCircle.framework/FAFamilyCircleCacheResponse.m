@interface FAFamilyCircleCacheResponse
- (BOOL)_isFamilyCircleFresh:(id)a3;
- (BOOL)isFamilyCircleFresh;
- (FAFamilyCircle)familyCircle;
- (FAFamilyCircleCacheResponse)initWithFamilyCircle:(id)a3 serverTag:(id)a4 cacheDate:(id)a5 maxAge:(double)a6;
- (NSDate)cacheDate;
- (NSDate)expiration;
- (NSString)serverTag;
- (double)maxAge;
- (id)familyCircleIfFresh;
- (id)familyCircleValidatingAgeWithDate:(id)a3;
- (void)setCacheDate:(id)a3;
- (void)setFamilyCircle:(id)a3;
- (void)setMaxAge:(double)a3;
- (void)setServerTag:(id)a3;
@end

@implementation FAFamilyCircleCacheResponse

- (FAFamilyCircleCacheResponse)initWithFamilyCircle:(id)a3 serverTag:(id)a4 cacheDate:(id)a5 maxAge:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___FAFamilyCircleCacheResponse;
  v14 = -[FAFamilyCircleCacheResponse init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_familyCircle, a3);
    objc_storeStrong((id *)&v15->_cacheDate, a5);
    v15->_maxAge = a6;
    objc_storeStrong((id *)&v15->_serverTag, a4);
  }

  return v15;
}

- (id)familyCircleIfFresh
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[FAFamilyCircleCacheResponse familyCircleValidatingAgeWithDate:]( self,  "familyCircleValidatingAgeWithDate:",  v3));

  return v4;
}

- (id)familyCircleValidatingAgeWithDate:(id)a3
{
  if (-[FAFamilyCircleCacheResponse _isFamilyCircleFresh:](self, "_isFamilyCircleFresh:", a3)) {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FAFamilyCircleCacheResponse familyCircle](self, "familyCircle"));
  }
  else {
    v4 = 0LL;
  }
  return v4;
}

- (BOOL)isFamilyCircleFresh
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  LOBYTE(self) = -[FAFamilyCircleCacheResponse _isFamilyCircleFresh:](self, "_isFamilyCircleFresh:", v3);

  return (char)self;
}

- (NSDate)expiration
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FAFamilyCircleCacheResponse cacheDate](self, "cacheDate"));
  -[FAFamilyCircleCacheResponse maxAge](self, "maxAge");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateByAddingTimeInterval:"));

  return (NSDate *)v4;
}

- (BOOL)_isFamilyCircleFresh:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FAFamilyCircleCacheResponse expiration](self, "expiration"));
  id v6 = [v4 compare:v5];

  return v6 != (id)1;
}

- (FAFamilyCircle)familyCircle
{
  return self->_familyCircle;
}

- (void)setFamilyCircle:(id)a3
{
}

- (NSDate)cacheDate
{
  return self->_cacheDate;
}

- (void)setCacheDate:(id)a3
{
}

- (double)maxAge
{
  return self->_maxAge;
}

- (void)setMaxAge:(double)a3
{
  self->_maxAge = a3;
}

- (NSString)serverTag
{
  return self->_serverTag;
}

- (void)setServerTag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end