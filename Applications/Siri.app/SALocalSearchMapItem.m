@interface SALocalSearchMapItem
- (id)_afui_mapsRelatedChild;
@end

@implementation SALocalSearchMapItem

- (id)_afui_mapsRelatedChild
{
  return -[SALocalSearchMapItem detail](self, "detail");
}

@end