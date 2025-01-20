@interface GreymatterDomain
+ (BOOL)supportsSecureCoding;
- (GreymatterDomain)init;
- (GreymatterDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
@end

@implementation GreymatterDomain

- (unint64_t)domain
{
  return 122LL;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.greymatter";
}

- (GreymatterDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GreymatterDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[GreymatterDomain _internal_doInit](v2, "_internal_doInit");
  }
  return v3;
}

- (GreymatterDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GreymatterDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    -[GreymatterDomain _internal_doInit](v3, "_internal_doInit");
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end