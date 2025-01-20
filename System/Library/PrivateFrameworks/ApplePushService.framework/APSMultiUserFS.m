@interface APSMultiUserFS
+ (id)sharedInstance;
- (APSMultiUserFS)initWithIsMultiUserMode:(BOOL)a3;
- (BOOL)isMultiUser;
- (id)systemPath;
@end

@implementation APSMultiUserFS

+ (id)sharedInstance
{
  if (qword_10014E870 != -1) {
    dispatch_once(&qword_10014E870, &stru_10011F5C8);
  }
  return (id)qword_10014E878;
}

- (APSMultiUserFS)initWithIsMultiUserMode:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___APSMultiUserFS;
  result = -[APSMultiUserFS init](&v5, "init");
  if (result) {
    result->_isMultiUser = a3;
  }
  return result;
}

- (id)systemPath
{
  systemPathCache = self->_systemPathCache;
  if (!systemPathCache)
  {
    uint64_t v9 = 1LL;
    uint64_t v4 = container_system_path_for_identifier(0LL, &v9);
    if (v4)
    {
      objc_super v5 = (void *)v4;
      v6 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  v4,  4LL);
      v7 = self->_systemPathCache;
      self->_systemPathCache = v6;

      free(v5);
    }

    systemPathCache = self->_systemPathCache;
  }

  return systemPathCache;
}

- (BOOL)isMultiUser
{
  return self->_isMultiUser;
}

- (void).cxx_destruct
{
}

@end