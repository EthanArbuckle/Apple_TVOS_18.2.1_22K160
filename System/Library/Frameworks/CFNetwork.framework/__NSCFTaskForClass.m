@interface __NSCFTaskForClass
- (void)dealloc;
- (void)initWithGroup:(void *)a1;
@end

@implementation __NSCFTaskForClass

- (void)initWithGroup:(void *)a1
{
  if (!a1) {
    return 0LL;
  }
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_CLASS_____NSCFTaskForClass;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3) {
    v3[11] = a2;
  }
  return v3;
}

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_atomic(self, a2, 0LL, 8LL);
    objc_setProperty_atomic(self, v3, 0LL, 16LL);
    objc_setProperty_atomic(self, v4, 0LL, 24LL);
    objc_setProperty_atomic(self, v5, 0LL, 32LL);
    objc_setProperty_atomic(self, v6, 0LL, 40LL);
    objc_setProperty_atomic_copy(self, v7, 0LL, 48LL);
    objc_setProperty_atomic(self, v8, 0LL, 56LL);
    objc_setProperty_atomic(self, v9, 0LL, 64LL);
    objc_setProperty_atomic_copy(self, v10, 0LL, 72LL);
    objc_setProperty_atomic(self, v11, 0LL, 80LL);
  }

  group = self->_group;
  if (group)
  {

    self->_group = 0LL;
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS_____NSCFTaskForClass;
  -[__NSCFTaskForClass dealloc](&v13, sel_dealloc);
}

@end