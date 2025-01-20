@interface MRDActiveUserController
- (MRDActiveUserController)init;
- (id)activeUserIdentifier;
- (void)dealloc;
- (void)fetchActiveUserWithQueue:(id)a3 completion:(id)a4;
- (void)setActiveUserIdentifier:(id)a3;
@end

@implementation MRDActiveUserController

- (MRDActiveUserController)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRDActiveUserController;
  result = -[MRDActiveUserController init](&v3, "init");
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRDActiveUserController;
  -[MRDActiveUserController dealloc](&v3, "dealloc");
}

- (id)activeUserIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_activeUserIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setActiveUserIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (NSString *)[v5 copy];

  activeUserIdentifier = self->_activeUserIdentifier;
  self->_activeUserIdentifier = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)fetchActiveUserWithQueue:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10013A884;
  v7[3] = &unk_1003A2358;
  id v8 = a4;
  id v6 = v8;
  -[MRDActiveUserController _fetchActiveUserWithQueue:completion:]( self,  "_fetchActiveUserWithQueue:completion:",  a3,  v7);
}

- (void).cxx_destruct
{
}

@end