@interface MLDTaskAssertion
- (MLDTaskAssertion)initWithName:(id)a3 pid:(int)a4 bundleID:(id)a5;
@end

@implementation MLDTaskAssertion

- (MLDTaskAssertion)initWithName:(id)a3 pid:(int)a4 bundleID:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MLDTaskAssertion;
  return -[MLDTaskAssertion initWithName:pid:bundleID:subsystem:reason:flags:]( &v6,  "initWithName:pid:bundleID:subsystem:reason:flags:",  a3,  *(void *)&a4,  a5,  @"com.apple.medialibraryd",  2LL,  3LL);
}

@end