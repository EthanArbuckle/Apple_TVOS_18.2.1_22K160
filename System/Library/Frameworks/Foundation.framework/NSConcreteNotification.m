@interface NSConcreteNotification
- (NSConcreteNotification)initWithName:(id)a3 object:(id)a4 userInfo:(id)a5;
- (id)name;
- (id)object;
- (id)userInfo;
- (void)dealloc;
@end

@implementation NSConcreteNotification

- (NSConcreteNotification)initWithName:(id)a3 object:(id)a4 userInfo:(id)a5
{
  v5 = self;
  if (a3)
  {
    self->name = (NSString *)[a3 copy];
    v5->object = a4;
    v5->userInfo = (NSDictionary *)a5;
  }

  else
  {

    return 0LL;
  }

  return v5;
}

- (id)name
{
  return self->name;
}

- (id)object
{
  return self->object;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSConcreteNotification;
  -[NSConcreteNotification dealloc](&v3, sel_dealloc);
}

- (id)userInfo
{
  return self->userInfo;
}

@end