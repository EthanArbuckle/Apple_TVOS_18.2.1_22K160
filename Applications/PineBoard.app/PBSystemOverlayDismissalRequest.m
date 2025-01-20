@interface PBSystemOverlayDismissalRequest
+ (id)dismissalRequestForAllSessions;
+ (id)dismissalRequestForSession:(id)a3;
- (BOOL)_clientInitiated;
- (BOOL)isAnimated;
- (NSDictionary)clientOptions;
- (NSString)identifier;
- (PBSystemOverlayDismissalRequest)initWithRequest:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation PBSystemOverlayDismissalRequest

+ (id)dismissalRequestForSession:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  id v7 = [v6 copy];
  v8 = (void *)v5[1];
  v5[1] = v7;

  return v5;
}

+ (id)dismissalRequestForAllSessions
{
  return objc_alloc_init((Class)a1);
}

- (PBSystemOverlayDismissalRequest)initWithRequest:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBSystemOverlayDismissalRequest;
  v5 = -[PBSystemOverlayDismissalRequest init](&v13, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v7 = (NSString *)[v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = v7;

    v5->_animated = [v4 isAnimated];
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 clientOptions]);
    v10 = (NSDictionary *)[v9 copy];
    clientOptions = v5->_clientOptions;
    v5->_clientOptions = v10;

    v5->_clientInitiated = [v4 _clientInitiated];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PBSystemOverlayDismissalRequest initWithRequest:]( objc_alloc(&OBJC_CLASS___PBMutableSystemOverlayDismissalRequest),  "initWithRequest:",  self);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (NSDictionary)clientOptions
{
  return self->_clientOptions;
}

- (BOOL)_clientInitiated
{
  return self->_clientInitiated;
}

- (void).cxx_destruct
{
}

@end