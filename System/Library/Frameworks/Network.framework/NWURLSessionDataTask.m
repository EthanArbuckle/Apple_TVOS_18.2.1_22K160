@interface NWURLSessionDataTask
- (BOOL)isKindOfClass:(Class)a3;
- (void)joiningContext;
@end

@implementation NWURLSessionDataTask

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NWURLSessionDataTask;
  if (-[NWURLSessionTask isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
  }
}

- (void)joiningContext
{
  if (self) {
    return (void *)*((void *)self + 50);
  }
  return self;
}

@end