@interface CBDeviceEntry
- (CBDeviceEntry)init;
- (NSMutableDictionary)hostMap;
- (id)description;
- (void)setHostMap:(id)a3;
@end

@implementation CBDeviceEntry

- (CBDeviceEntry)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CBDeviceEntry;
  v2 = -[CBDeviceEntry init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    hostMap = v2->_hostMap;
    v2->_hostMap = v3;
  }

  return v2;
}

- (id)description
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"hostMap:%@", self->_hostMap);
}

- (NSMutableDictionary)hostMap
{
  return self->_hostMap;
}

- (void)setHostMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end