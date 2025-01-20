@interface GKDeprecatedBulletin
+ (BOOL)supportsSecureCoding;
- (GKDeprecatedBulletin)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GKDeprecatedBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKDeprecatedBulletin)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GKDeprecatedBulletin;
  return -[GKBulletin initWithCoder:](&v4, "initWithCoder:", a3);
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GKDeprecatedBulletin;
  -[GKBulletin encodeWithCoder:](&v3, "encodeWithCoder:", a3);
}

@end