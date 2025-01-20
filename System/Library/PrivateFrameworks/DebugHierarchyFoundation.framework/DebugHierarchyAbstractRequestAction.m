@interface DebugHierarchyAbstractRequestAction
+ (id)actionWithDictionary:(id)a3;
- (DebugHierarchyAbstractRequestAction)initWithDictionary:(id)a3;
- (id)dictionaryRepresentation;
- (id)keysToArchiveViaKVC;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation DebugHierarchyAbstractRequestAction

+ (id)actionWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDictionary:v4];

  return v5;
}

- (DebugHierarchyAbstractRequestAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DebugHierarchyAbstractRequestAction;
  id v5 = -[DebugHierarchyAbstractRequestAction init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[DebugHierarchyAbstractRequestAction setValuesForKeysWithDictionary:](v5, "setValuesForKeysWithDictionary:", v4);
  }

  return v6;
}

- (id)dictionaryRepresentation
{
  v12 = @"actionClass";
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v13 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyAbstractRequestAction keysToArchiveViaKVC](self, "keysToArchiveViaKVC"));
  if ([v7 count])
  {
    id v8 = [v6 mutableCopy];
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[DebugHierarchyAbstractRequestAction dictionaryWithValuesForKeys:]( self,  "dictionaryWithValuesForKeys:",  v7));
    [v8 addEntriesFromDictionary:v9];

    id v10 = [v8 copy];
    v6 = v10;
  }

  return v6;
}

- (id)keysToArchiveViaKVC
{
  return 0LL;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 isEqualToString:@"actionClass"] & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___DebugHierarchyAbstractRequestAction;
    -[DebugHierarchyAbstractRequestAction setValue:forUndefinedKey:](&v8, "setValue:forUndefinedKey:", v6, v7);
  }
}

@end