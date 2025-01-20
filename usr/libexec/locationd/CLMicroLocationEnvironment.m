@interface CLMicroLocationEnvironment
+ (id)shared;
- (BOOL)isTestingEnvironment;
- (CLMicroLocationEnvironment)init;
- (void)setIsTestingEnvironment:(BOOL)a3;
@end

@implementation CLMicroLocationEnvironment

+ (id)shared
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C3D84;
  block[3] = &unk_10181A288;
  block[4] = a1;
  if (qword_101993A50 != -1) {
    dispatch_once(&qword_101993A50, block);
  }
  return (id)qword_101993A48;
}

- (CLMicroLocationEnvironment)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLMicroLocationEnvironment;
  result = -[CLMicroLocationEnvironment init](&v3, "init");
  if (result) {
    result->_isTestingEnvironment = 0;
  }
  return result;
}

- (BOOL)isTestingEnvironment
{
  if (!self->_isTestingEnvironment) {
    return 0;
  }
  sub_1004F2598();
  return sub_1004F8A40();
}

- (void)setIsTestingEnvironment:(BOOL)a3
{
  self->_isTestingEnvironment = a3;
}

@end