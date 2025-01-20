@interface PBDependencyDescription
- (NSMutableSet)dependencies;
- (PBDependencyDescription)initWithInstanceProvider:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)providerBlock;
- (void)addDependencies:(id)a3;
- (void)setDependencies:(id)a3;
- (void)setProviderBlock:(id)a3;
@end

@implementation PBDependencyDescription

- (PBDependencyDescription)initWithInstanceProvider:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBDependencyDescription;
  v5 = -[PBDependencyDescription init](&v11, "init");
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    dependencies = v5->_dependencies;
    v5->_dependencies = v6;

    id v8 = objc_retainBlock(v4);
    id providerBlock = v5->_providerBlock;
    v5->_id providerBlock = v8;
  }

  return v5;
}

- (void)addDependencies:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  self->_providerBlock);
  id v5 = -[NSMutableSet mutableCopy](self->_dependencies, "mutableCopy");
  -[PBDependencyDescription setDependencies:](v4, "setDependencies:", v5);

  return v4;
}

- (id)providerBlock
{
  return self->_providerBlock;
}

- (void)setProviderBlock:(id)a3
{
}

- (NSMutableSet)dependencies
{
  return self->_dependencies;
}

- (void)setDependencies:(id)a3
{
}

- (void).cxx_destruct
{
}

@end