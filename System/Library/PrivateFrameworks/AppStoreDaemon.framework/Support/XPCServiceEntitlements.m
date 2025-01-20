@interface XPCServiceEntitlements
- (void)dealloc;
@end

@implementation XPCServiceEntitlements

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___XPCServiceEntitlements;
  -[XPCServiceEntitlements dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
}

@end