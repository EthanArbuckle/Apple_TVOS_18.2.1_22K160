@interface AXUIHoverTextAlertStyleProvider
- (CGSize)alertBackgroundSizeForType:(unint64_t)a3;
@end

@implementation AXUIHoverTextAlertStyleProvider

- (CGSize)alertBackgroundSizeForType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AXUIHoverTextAlertStyleProvider;
  -[AXUIHoverTextAlertStyleProvider alertBackgroundSizeForType:](&v5, "alertBackgroundSizeForType:", a3);
  result.height = v4;
  result.width = v3;
  return result;
}

@end