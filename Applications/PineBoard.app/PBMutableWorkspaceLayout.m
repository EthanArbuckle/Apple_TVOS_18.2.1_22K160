@interface PBMutableWorkspaceLayout
- (PBMutableWorkspaceLayout)initWithName:(id)a3 attributes:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setAttributes:(id)a3 forKey:(id)a4;
- (void)setAttributes:(id)a3 forKey:(id)a4;
- (void)setName:(id)a3;
@end

@implementation PBMutableWorkspaceLayout

- (PBMutableWorkspaceLayout)initWithName:(id)a3 attributes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBMutableWorkspaceLayout;
  v9 = -[PBWorkspaceLayout initWithName:attributes:](&v13, "initWithName:attributes:", v7, v8);

  if (v9)
  {
    v10 = (NSDictionary *)[v6 mutableCopy];
    keyedAttributes = v9->super._keyedAttributes;
    v9->super._keyedAttributes = v10;
  }

  return v9;
}

- (void)setName:(id)a3
{
  if (self->super._name != a3)
  {
    v4 = (NSString *)[a3 copy];
    name = self->super._name;
    self->super._name = v4;
  }

- (void)setAttributes:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = [a3 copy];
  -[PBMutableWorkspaceLayout _setAttributes:forKey:](self, "_setAttributes:forKey:", v7, v6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PBWorkspaceLayout initWithName:attributes:]( +[PBWorkspaceLayout allocWithZone:](&OBJC_CLASS___PBWorkspaceLayout, "allocWithZone:", a3),  "initWithName:attributes:",  self->super._name,  self->super._keyedAttributes);
}

- (void)_setAttributes:(id)a3 forKey:(id)a4
{
  keyedAttributes = self->super._keyedAttributes;
  if (a3) {
    -[NSDictionary setObject:forKey:](keyedAttributes, "setObject:forKey:", a3, a4);
  }
  else {
    -[NSDictionary removeObjectForKey:](keyedAttributes, "removeObjectForKey:", a4);
  }
}

@end