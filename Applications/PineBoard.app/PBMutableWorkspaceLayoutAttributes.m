@interface PBMutableWorkspaceLayoutAttributes
- (PBMutableWorkspaceLayoutAttributes)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setCornerRadius:(double)a3;
- (void)setScale:(double)a3;
@end

@implementation PBMutableWorkspaceLayoutAttributes

- (PBMutableWorkspaceLayoutAttributes)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBMutableWorkspaceLayoutAttributes;
  return -[PBWorkspaceLayoutAttributes initWithCenter:scale:cornerRadius:]( &v3,  "initWithCenter:scale:cornerRadius:",  0.5,  0.5,  1.0,  0.0);
}

- (void)setCenter:(CGPoint)a3
{
  self->super._center = a3;
}

- (void)setScale:(double)a3
{
  self->super._scale = a3;
}

- (void)setCornerRadius:(double)a3
{
  self->super._cornerRadius = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PBWorkspaceLayoutAttributes initWithCenter:scale:cornerRadius:]( +[PBWorkspaceLayoutAttributes allocWithZone:]( &OBJC_CLASS___PBWorkspaceLayoutAttributes,  "allocWithZone:",  a3),  "initWithCenter:scale:cornerRadius:",  self->super._center.x,  self->super._center.y,  self->super._scale,  self->super._cornerRadius);
}

@end