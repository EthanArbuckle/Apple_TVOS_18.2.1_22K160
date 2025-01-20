@interface PBApplicationSnapshotPredicate
- (BOOL)evaluateWithObject:(id)a3;
- (NSSet)excludeVariants;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)setExcludeVariants:(id)a3;
@end

@implementation PBApplicationSnapshotPredicate

- (BOOL)evaluateWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBApplicationSnapshotPredicate;
  if (-[PBApplicationSnapshotPredicate evaluateWithObject:](&v8, "evaluateWithObject:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 variantID]);
    BOOL v6 = !v5 || !-[NSSet containsObject:](self->_excludeVariants, "containsObject:", v5);
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBApplicationSnapshotPredicate;
  id v4 = a3;
  id v5 = -[PBApplicationSnapshotPredicate descriptionBuilderWithMultilinePrefix:]( &v12,  "descriptionBuilderWithMultilinePrefix:",  v4);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10011D438;
  v9[3] = &unk_1003CFEB8;
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

- (NSSet)excludeVariants
{
  return self->_excludeVariants;
}

- (void)setExcludeVariants:(id)a3
{
}

- (void).cxx_destruct
{
}

@end