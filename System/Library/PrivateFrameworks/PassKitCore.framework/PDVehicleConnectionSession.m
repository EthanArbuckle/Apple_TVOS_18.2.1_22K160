@interface PDVehicleConnectionSession
- (BOOL)sendData:(id)a3 error:(id *)a4;
- (NSString)sessionIdentifier;
- (id)initForSecureElementPass:(id)a3 delegate:(id)a4;
- (void)dealloc;
- (void)startSessionWithCompletion:(id)a3;
@end

@implementation PDVehicleConnectionSession

- (id)initForSecureElementPass:(id)a3 delegate:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDVehicleConnectionSession;
  return -[PDVehicleConnectionSession init](&v5, "init", a3, a4);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___PDVehicleConnectionSession;
  -[PDVehicleConnectionSession dealloc](&v2, "dealloc");
}

- (BOOL)sendData:(id)a3 error:(id *)a4
{
  return 0;
}

- (void)startSessionWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0LL);
  }
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void).cxx_destruct
{
}

@end