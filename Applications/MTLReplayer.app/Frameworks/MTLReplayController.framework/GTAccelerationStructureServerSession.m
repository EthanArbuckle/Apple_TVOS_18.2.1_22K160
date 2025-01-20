@interface GTAccelerationStructureServerSession
- (unint64_t)requestID;
- (unint64_t)sessionID;
- (void)dealloc;
- (void)setRequestID:(unint64_t)a3;
- (void)setSessionID:(unint64_t)a3;
@end

@implementation GTAccelerationStructureServerSession

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTAccelerationStructureServerSession;
  -[GTAccelerationStructureServerSession dealloc](&v3, "dealloc");
}

- (unint64_t)sessionID
{
  return self->sessionID;
}

- (void)setSessionID:(unint64_t)a3
{
  self->sessionID = a3;
}

- (unint64_t)requestID
{
  return self->requestID;
}

- (void)setRequestID:(unint64_t)a3
{
  self->requestID = a3;
}

- (void).cxx_destruct
{
}

@end