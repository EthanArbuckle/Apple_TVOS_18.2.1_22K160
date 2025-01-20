@interface _DASDataProtectionStateMonitor
+ (id)dataProtectionClassA;
+ (id)dataProtectionClassB;
+ (id)dataProtectionClassC;
+ (id)dataProtectionClassD;
- (BOOL)isDataAvailableFor:(id)a3;
- (BOOL)unnotifiedIsDataAvailableForClassC;
- (NSUUID)handlerUUID;
- (_DASDataProtectionMaster)master;
- (_DASDataProtectionStateMonitor)init;
- (id)changeHandler;
- (void)dealloc;
- (void)setChangeHandler:(id)a3;
@end

@implementation _DASDataProtectionStateMonitor

+ (id)dataProtectionClassA
{
  return NSFileProtectionComplete;
}

+ (id)dataProtectionClassB
{
  return NSFileProtectionCompleteUnlessOpen;
}

+ (id)dataProtectionClassC
{
  return NSFileProtectionCompleteUntilFirstUserAuthentication;
}

+ (id)dataProtectionClassD
{
  return NSFileProtectionNone;
}

- (_DASDataProtectionStateMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____DASDataProtectionStateMonitor;
  v2 = -[_DASDataProtectionStateMonitor init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[_DASDataProtectionMaster sharedInstance](&OBJC_CLASS____DASDataProtectionMaster, "sharedInstance"));
    master = v2->_master;
    v2->_master = (_DASDataProtectionMaster *)v3;

    handlerUUID = v2->_handlerUUID;
    v2->_handlerUUID = 0LL;

    id changeHandler = v2->_changeHandler;
    v2->_id changeHandler = 0LL;
  }

  return v2;
}

- (void)dealloc
{
  id changeHandler = self->_changeHandler;
  self->_id changeHandler = 0LL;

  master = self->_master;
  self->_master = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____DASDataProtectionStateMonitor;
  -[_DASDataProtectionStateMonitor dealloc](&v5, "dealloc");
}

- (void)setChangeHandler:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_handlerUUID)
  {
    -[_DASDataProtectionMaster deregisterStateChangeHandler:](self->_master, "deregisterStateChangeHandler:");
    id v4 = v9;
  }

  if (v4)
  {
    objc_super v5 = (NSUUID *)objc_claimAutoreleasedReturnValue( -[_DASDataProtectionMaster registerStateChangeHandler:]( self->_master,  "registerStateChangeHandler:",  v4));
    handlerUUID = self->_handlerUUID;
    self->_handlerUUID = v5;

    id v4 = v9;
  }

  id v7 = objc_retainBlock(v4);
  id changeHandler = self->_changeHandler;
  self->_id changeHandler = v7;
}

- (BOOL)isDataAvailableFor:(id)a3
{
  return -[_DASDataProtectionMaster isDataAvailableFor:](self->_master, "isDataAvailableFor:", a3);
}

- (BOOL)unnotifiedIsDataAvailableForClassC
{
  return 0;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (_DASDataProtectionMaster)master
{
  return self->_master;
}

- (NSUUID)handlerUUID
{
  return self->_handlerUUID;
}

- (void).cxx_destruct
{
}

@end