@interface SAAddResultObjects
- (id)_afui_mapsRelatedChildren;
@end

@implementation SAAddResultObjects

- (id)_afui_mapsRelatedChildren
{
  return -[SAAddResultObjects objects](self, "objects");
}

@end