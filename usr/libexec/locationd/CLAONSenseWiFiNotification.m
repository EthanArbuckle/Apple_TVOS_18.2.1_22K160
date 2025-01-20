@interface CLAONSenseWiFiNotification
- (CLAONSenseWiFiNotification)init;
- (int)type;
- (void)data;
- (void)setData:(void *)a3;
- (void)setType:(int)a3;
@end

@implementation CLAONSenseWiFiNotification

- (CLAONSenseWiFiNotification)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLAONSenseWiFiNotification;
  result = -[CLAONSenseWiFiNotification init](&v3, "init");
  result->type = 12;
  result->data = 0LL;
  return result;
}

- (int)type
{
  return self->type;
}

- (void)setType:(int)a3
{
  self->type = a3;
}

- (void)data
{
  return self->data;
}

- (void)setData:(void *)a3
{
  self->data = a3;
}

@end