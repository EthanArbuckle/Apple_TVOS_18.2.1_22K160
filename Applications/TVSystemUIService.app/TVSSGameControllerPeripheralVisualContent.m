@interface TVSSGameControllerPeripheralVisualContent
- (TVSSGameControllerPeripheralVisualContent)init;
@end

@implementation TVSSGameControllerPeripheralVisualContent

- (TVSSGameControllerPeripheralVisualContent)init
{
  v6 = self;
  id v4 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"gamecontroller.fill");
  v6 = 0LL;
  v6 = -[TVSSImageContent initWithImage:](self, "initWithImage:");
  v5 = v6;

  objc_storeStrong((id *)&v6, 0LL);
  return v5;
}

@end