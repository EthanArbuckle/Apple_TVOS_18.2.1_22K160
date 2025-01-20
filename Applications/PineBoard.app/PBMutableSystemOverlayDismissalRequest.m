@interface PBMutableSystemOverlayDismissalRequest
- (PBMutableSystemOverlayDismissalRequest)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setClientInitiated:(BOOL)a3;
- (void)setAnimated:(BOOL)a3;
- (void)setClientOptions:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation PBMutableSystemOverlayDismissalRequest

- (PBMutableSystemOverlayDismissalRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBMutableSystemOverlayDismissalRequest;
  return -[PBSystemOverlayDismissalRequest initWithRequest:](&v3, "initWithRequest:", self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PBSystemOverlayDismissalRequest initWithRequest:]( objc_alloc(&OBJC_CLASS___PBSystemOverlayDismissalRequest),  "initWithRequest:",  self);
}

- (void)setIdentifier:(id)a3
{
  v4 = (NSString *)[a3 copy];
  identifier = self->super._identifier;
  self->super._identifier = v4;
}

- (void)setAnimated:(BOOL)a3
{
  self->super._animated = a3;
}

- (void)setClientOptions:(id)a3
{
  v4 = (NSDictionary *)[a3 copy];
  clientOptions = self->super._clientOptions;
  self->super._clientOptions = v4;
}

- (void)_setClientInitiated:(BOOL)a3
{
  self->super._clientInitiated = a3;
}

@end