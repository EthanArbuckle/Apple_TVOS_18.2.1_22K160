@interface EAOverHIDEvent
- (EAOverHIDEvent)initWithName:(id)a3 info:(id)a4;
- (NSDictionary)info;
- (NSString)filterName;
- (void)dealloc;
- (void)setFilterName:(id)a3;
- (void)setInfo:(id)a3;
@end

@implementation EAOverHIDEvent

- (EAOverHIDEvent)initWithName:(id)a3 info:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___EAOverHIDEvent;
  v6 = -[EAOverHIDEvent init](&v8, "init");
  if (v6)
  {
    -[EAOverHIDEvent setFilterName:](v6, "setFilterName:", a3);
    -[EAOverHIDEvent setInfo:](v6, "setInfo:", a4);
  }

  return v6;
}

- (void)dealloc
{
  filterName = self->_filterName;
  if (filterName) {

  }
  info = self->_info;
  if (info) {

  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___EAOverHIDEvent;
  -[EAOverHIDEvent dealloc](&v5, "dealloc");
}

- (NSString)filterName
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setFilterName:(id)a3
{
}

- (NSDictionary)info
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setInfo:(id)a3
{
}

@end