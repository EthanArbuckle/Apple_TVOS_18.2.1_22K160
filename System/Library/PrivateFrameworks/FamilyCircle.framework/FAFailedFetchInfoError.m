@interface FAFailedFetchInfoError
+ (id)errorWithCachedFamilyCircle:(id)a3 underlyingError:(id)a4;
- (FAFailedFetchInfoError)initWithCachedFamilyCircle:(id)a3 underlyingError:(id)a4;
- (FAFamilyCircle)cachedFamilyCircle;
- (NSError)underlyingError;
@end

@implementation FAFailedFetchInfoError

+ (id)errorWithCachedFamilyCircle:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  id v8 = [v7 mutableCopy];

  [v8 removeObjectForKey:@"NSErrorPeerCertificateChainKey"];
  [v8 removeObjectForKey:@"NSErrorClientCertificateChainKey"];
  [v8 removeObjectForKey:NSURLErrorFailingURLPeerTrustErrorKey];
  [v8 removeObjectForKey:NSUnderlyingErrorKey];
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  id v10 = [v5 code];

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v9,  v10,  v8));
  v12 = -[FAFailedFetchInfoError initWithCachedFamilyCircle:underlyingError:]( objc_alloc(&OBJC_CLASS___FAFailedFetchInfoError),  "initWithCachedFamilyCircle:underlyingError:",  v6,  v11);

  return v12;
}

- (FAFailedFetchInfoError)initWithCachedFamilyCircle:(id)a3 underlyingError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
  id v10 = [v8 code];
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___FAFailedFetchInfoError;
  v12 = -[FAFailedFetchInfoError initWithDomain:code:userInfo:](&v14, "initWithDomain:code:userInfo:", v9, v10, v11);

  if (v12)
  {
    objc_storeStrong((id *)&v12->_underlyingError, a4);
    objc_storeStrong((id *)&v12->_cachedFamilyCircle, a3);
  }

  return v12;
}

- (FAFamilyCircle)cachedFamilyCircle
{
  return self->_cachedFamilyCircle;
}

- (NSError)underlyingError
{
  return self->_underlyingError;
}

- (void).cxx_destruct
{
}

@end