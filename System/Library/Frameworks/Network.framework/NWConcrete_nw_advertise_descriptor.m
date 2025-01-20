@interface NWConcrete_nw_advertise_descriptor
- (NSString)description;
- (void)dealloc;
@end

@implementation NWConcrete_nw_advertise_descriptor

- (void)dealloc
{
  txt_record = self->txt_record;
  self->txt_record = 0LL;

  name = self->name;
  if (name)
  {
    free(name);
    self->name = 0LL;
  }

  type = self->type;
  if (type)
  {
    free(type);
    self->type = 0LL;
  }

  domain = self->domain;
  if (domain)
  {
    free(domain);
    self->domain = 0LL;
  }

  application_service_name = self->application_service_name;
  if (application_service_name)
  {
    free(application_service_name);
    self->application_service_name = 0LL;
  }

  bundle_id = self->bundle_id;
  if (bundle_id)
  {
    free(bundle_id);
    self->bundle_id = 0LL;
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_advertise_descriptor;
  -[NWConcrete_nw_advertise_descriptor dealloc](&v9, sel_dealloc);
}

- (NSString)description
{
  v2 = (char *)nw_advertise_descriptor_copy_description(self);
  if (v2) {
    v2 = (char *)CFStringCreateWithCStringNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  v2,  0x8000100u,  (CFAllocatorRef)*MEMORY[0x189604DB8]);
  }
  return (NSString *)v2;
}

- (void).cxx_destruct
{
}

@end