@interface CUFileServerSession
- ($28D00E3A93C8EBFB5C4D5001401C3076)dirStream;
- (unint64_t)lastRequestTicks;
- (unint64_t)sessionID;
- (void)setDirStream:(id *)a3;
- (void)setLastRequestTicks:(unint64_t)a3;
- (void)setSessionID:(unint64_t)a3;
@end

@implementation CUFileServerSession

- ($28D00E3A93C8EBFB5C4D5001401C3076)dirStream
{
  return self->_dirStream;
}

- (void)setDirStream:(id *)a3
{
  self->_dirStream = a3;
}

- (unint64_t)lastRequestTicks
{
  return self->_lastRequestTicks;
}

- (void)setLastRequestTicks:(unint64_t)a3
{
  self->_lastRequestTicks = a3;
}

- (unint64_t)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unint64_t)a3
{
  self->_sessionID = a3;
}

@end