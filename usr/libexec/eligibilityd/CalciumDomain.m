@interface CalciumDomain
+ (BOOL)supportsSecureCoding;
- (CalciumDomain)init;
- (CalciumDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (unint64_t)domain;
- (void)_internal_doInit;
@end

@implementation CalciumDomain

- (unint64_t)domain
{
  return 21LL;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.calcium";
}

- (void)_internal_doInit
{
}

- (CalciumDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CalciumDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[CalciumDomain _internal_doInit](v2, "_internal_doInit");
  }
  return v3;
}

- (CalciumDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CalciumDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    -[CalciumDomain _internal_doInit](v3, "_internal_doInit");
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end