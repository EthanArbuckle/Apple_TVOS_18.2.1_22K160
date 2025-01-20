@interface CLLocationSubscriptionAdapter
- (BOOL)valid;
- (CLLocationSubscriptionAdapter)init;
- (void)dealloc;
- (void)setValid:(BOOL)a3;
@end

@implementation CLLocationSubscriptionAdapter

- (CLLocationSubscriptionAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLLocationSubscriptionAdapter;
  result = -[CLLocationSubscriptionAdapter init](&v3, "init");
  if (result) {
    result->_valid = 1;
  }
  return result;
}

- (void)dealloc
{
  self->_valid = 0;
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CLLocationSubscriptionAdapter;
  -[CLLocationSubscriptionAdapter dealloc](&v2, "dealloc");
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