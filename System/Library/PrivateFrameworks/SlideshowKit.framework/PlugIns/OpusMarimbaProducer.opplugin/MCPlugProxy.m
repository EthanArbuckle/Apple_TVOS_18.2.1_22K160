@interface MCPlugProxy
- (BOOL)isKindOfClass:(Class)a3;
- (MCPlug)plug;
- (id)forwardingTargetForSelector:(SEL)a3;
- (int64_t)zIndex;
- (void)_copySelfToSnapshot:(id)a3;
- (void)dealloc;
- (void)setPlug:(id)a3;
@end

@implementation MCPlugProxy

- (void)dealloc
{
  self->_plug = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCPlugProxy;
  -[MCObject dealloc](&v3, "dealloc");
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_plug;
}

- (BOOL)isKindOfClass:(Class)a3
{
  if ((Class)objc_opt_class(&OBJC_CLASS___MCPlugProxy, a2) == a3) {
    char isKindOfClass = 1;
  }
  else {
    char isKindOfClass = objc_opt_isKindOfClass(self->_plug, a3);
  }
  return isKindOfClass & 1;
}

- (int64_t)zIndex
{
  return (int64_t)-[MCPlug zIndex](self->_plug, "zIndex");
}

- (void)_copySelfToSnapshot:(id)a3
{
  *((void *)a3 + 3) = self->_plug;
}

- (MCPlug)plug
{
  return (MCPlug *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPlug:(id)a3
{
}

@end