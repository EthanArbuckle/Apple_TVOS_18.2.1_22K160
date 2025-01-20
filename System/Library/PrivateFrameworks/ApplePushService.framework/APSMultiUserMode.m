@interface APSMultiUserMode
+ (BOOL)_getIsCurrentlyLoggedIn;
+ (BOOL)_getMultiUserMode;
+ (id)sharedInstance;
- (APSMultiUserMode)initWithIsMultiUserMode:(BOOL)a3 loggedInUser:(BOOL)a4;
- (BOOL)isLoggedInUser;
- (BOOL)isMultiAndLoggedIn;
- (BOOL)isMultiUser;
@end

@implementation APSMultiUserMode

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000AC58;
  block[3] = &unk_10011DB58;
  block[4] = a1;
  if (qword_10014E7D0 != -1) {
    dispatch_once(&qword_10014E7D0, block);
  }
  return (id)qword_10014E7D8;
}

+ (BOOL)_getMultiUserMode
{
  return 0;
}

+ (BOOL)_getIsCurrentlyLoggedIn
{
  return 0;
}

- (APSMultiUserMode)initWithIsMultiUserMode:(BOOL)a3 loggedInUser:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___APSMultiUserMode;
  result = -[APSMultiUserMode init](&v7, "init");
  if (result)
  {
    result->_isMultiUser = a3;
    result->_isLoggedInUser = a4;
  }

  return result;
}

- (BOOL)isMultiAndLoggedIn
{
  return self->_isMultiUser && self->_isLoggedInUser;
}

- (BOOL)isMultiUser
{
  return self->_isMultiUser;
}

- (BOOL)isLoggedInUser
{
  return self->_isLoggedInUser;
}

@end