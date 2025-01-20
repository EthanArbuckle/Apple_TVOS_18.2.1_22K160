@interface CLPlaceInferenceSubscriptionAdapter
- (BOOL)valid;
- (CLPlaceInferenceSubscriptionAdapter)init;
- (void)invalidate;
- (void)setValid:(BOOL)a3;
@end

@implementation CLPlaceInferenceSubscriptionAdapter

- (CLPlaceInferenceSubscriptionAdapter)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLPlaceInferenceSubscriptionAdapter;
  v2 = -[CLPlaceInferenceSubscriptionAdapter init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[CLPlaceInferenceSubscriptionAdapter setValid:](v2, "setValid:", 1LL);
  }
  return v3;
}

- (void)invalidate
{
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end