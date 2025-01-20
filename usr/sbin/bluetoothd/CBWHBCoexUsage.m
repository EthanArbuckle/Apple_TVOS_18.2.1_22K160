@interface CBWHBCoexUsage
- (CBWHBCoexUsage)init;
- (id)description;
- (unint64_t)numLEConnection;
- (void)setNumLEConnection:(unint64_t)a3;
@end

@implementation CBWHBCoexUsage

- (CBWHBCoexUsage)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CBWHBCoexUsage;
  result = -[CBWHBCoexUsage init](&v3, "init");
  if (result) {
    result->_numLEConnection = 0LL;
  }
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"COEX Usage: Number of LE Connections %llu ",  self->_numLEConnection);
}

- (unint64_t)numLEConnection
{
  return self->_numLEConnection;
}

- (void)setNumLEConnection:(unint64_t)a3
{
  self->_numLEConnection = a3;
}

@end