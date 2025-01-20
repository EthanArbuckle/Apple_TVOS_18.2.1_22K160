@interface SDAirDropHandlerFailedMixedTypes
- (id)errorDetailedString;
@end

@implementation SDAirDropHandlerFailedMixedTypes

- (id)errorDetailedString
{
  return (id)SFLocalizedStringForKey(@"TRANSFER_FROM_MIXED_TYPES_TEXT", a2);
}

@end