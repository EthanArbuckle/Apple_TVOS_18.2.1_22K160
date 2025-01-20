@interface AppInfo
+ (id)appInfoWithPID:(int)a3 isApp:(BOOL)a4;
- (AppInfo)initWithPID:(int)a3 isApp:(BOOL)a4;
- (BOOL)isAlive;
- (BOOL)isApp;
- (BOOL)supportsBackgroundedCentrals;
- (BOOL)supportsBackgroundedPeripherals;
- (int)pid;
- (unsigned)state;
- (void)setIsAlive:(BOOL)a3;
- (void)setIsApp:(BOOL)a3;
- (void)setPid:(int)a3;
- (void)setState:(unsigned __int8)a3;
- (void)setSupportsBackgroundedCentrals:(BOOL)a3;
- (void)setSupportsBackgroundedPeripherals:(BOOL)a3;
@end

@implementation AppInfo

- (AppInfo)initWithPID:(int)a3 isApp:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AppInfo;
  v6 = -[AppInfo init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[AppInfo setPid:](v6, "setPid:", v5);
    -[AppInfo setIsApp:](v7, "setIsApp:", v4);
    -[AppInfo setIsAlive:](v7, "setIsAlive:", (_DWORD)v5 != 0);
    -[AppInfo setState:](v7, "setState:", 1LL);
  }

  return v7;
}

+ (id)appInfoWithPID:(int)a3 isApp:(BOOL)a4
{
  return [objc_alloc((Class)a1) initWithPID:*(void *)&a3 isApp:a4];
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (BOOL)isApp
{
  return self->_isApp;
}

- (void)setIsApp:(BOOL)a3
{
  self->_isApp = a3;
}

- (BOOL)supportsBackgroundedCentrals
{
  return self->_supportsBackgroundedCentrals;
}

- (void)setSupportsBackgroundedCentrals:(BOOL)a3
{
  self->_supportsBackgroundedCentrals = a3;
}

- (BOOL)supportsBackgroundedPeripherals
{
  return self->_supportsBackgroundedPeripherals;
}

- (void)setSupportsBackgroundedPeripherals:(BOOL)a3
{
  self->_supportsBackgroundedPeripherals = a3;
}

- (BOOL)isAlive
{
  return self->_isAlive;
}

- (void)setIsAlive:(BOOL)a3
{
  self->_isAlive = a3;
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned __int8)a3
{
  self->_state = a3;
}

@end