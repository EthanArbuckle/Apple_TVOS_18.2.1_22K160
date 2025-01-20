@interface _PBImageProcessingOperation
- (BOOL)shouldPerformASAP;
- (int64_t)targetUserInterfaceStyle;
@end

@implementation _PBImageProcessingOperation

- (int64_t)targetUserInterfaceStyle
{
  return (int64_t)self->super._private;
}

- (BOOL)shouldPerformASAP
{
  return self->super._private1;
}

@end