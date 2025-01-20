@interface AAPSyncPrimitiveAnchor
+ (id)anchorFromIndex:(unint64_t)a3;
- (AAPSyncPrimitiveAnchor)anchorWithSubIndex:(unint64_t)a3;
- (BOOL)isPrimitiveAnchor;
@end

@implementation AAPSyncPrimitiveAnchor

+ (id)anchorFromIndex:(unint64_t)a3
{
  return [objc_alloc((Class)a1) _initWithMainIndex:a3 subIndex:0];
}

- (AAPSyncPrimitiveAnchor)anchorWithSubIndex:(unint64_t)a3
{
  if (a3) {
    return (AAPSyncPrimitiveAnchor *) -[AAPSyncAnchor _initWithMainIndex:subIndex:]( objc_alloc(&OBJC_CLASS___AAPSyncAnchor),  "_initWithMainIndex:subIndex:",  self->super._mainIndex,  a3);
  }
  else {
    return (AAPSyncPrimitiveAnchor *)-[AAPSyncAnchor primitiveAnchor](self, "primitiveAnchor");
  }
}

- (BOOL)isPrimitiveAnchor
{
  return 1;
}

@end