@interface OS_remote_listening_service
- (BOOL)shouldEncryptSocketData;
- (void)dealloc;
@end

@implementation OS_remote_listening_service

- (BOOL)shouldEncryptSocketData
{
  return _remote_service_properties_should_encrypt_socket_data(self->properties);
}

- (void)dealloc
{
  service_name = (char *)self->service_name;
  if (service_name) {
    free(service_name);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___OS_remote_listening_service;
  -[OS_remote_listening_service dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end