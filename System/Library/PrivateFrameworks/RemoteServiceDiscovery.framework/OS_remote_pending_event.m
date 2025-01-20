@interface OS_remote_pending_event
- (void)dealloc;
@end

@implementation OS_remote_pending_event

- (void)dealloc
{
  service_name = (char *)self->service_name;
  if (service_name) {
    free(service_name);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___OS_remote_pending_event;
  -[OS_remote_pending_event dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end