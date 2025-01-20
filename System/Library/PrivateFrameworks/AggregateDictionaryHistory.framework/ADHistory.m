@interface ADHistory
- (ADHistory)initWithDefaultPath;
- (ADHistory)initWithPath:(id)a3;
- (BOOL)distributionsForKeyPrefix:(id)a3 minDaysSince1970:(int)a4 maxDaysSince1970:(int)a5 rowHandler:(id)a6;
- (BOOL)scalarsForKeyPrefix:(id)a3 minDaysSince1970:(int)a4 maxDaysSince1970:(int)a5 rowHandler:(id)a6;
- (NSString)path;
@end

@implementation ADHistory

- (ADHistory)initWithPath:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ADHistory;
  return -[ADHistory init](&v4, sel_init, a3);
}

- (ADHistory)initWithDefaultPath
{
  return -[ADHistory initWithPath:](self, "initWithPath:", 0LL);
}

- (BOOL)scalarsForKeyPrefix:(id)a3 minDaysSince1970:(int)a4 maxDaysSince1970:(int)a5 rowHandler:(id)a6
{
  if (a3) {
    BOOL v6 = a6 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  return !v6;
}

- (BOOL)distributionsForKeyPrefix:(id)a3 minDaysSince1970:(int)a4 maxDaysSince1970:(int)a5 rowHandler:(id)a6
{
  if (a3) {
    BOOL v6 = a6 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  return !v6;
}

- (NSString)path
{
  return self->_path;
}

@end