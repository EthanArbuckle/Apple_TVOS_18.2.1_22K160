@interface LACMechanismTree
+ (id)mechanismTreeFromSerializedTree:(id)a3;
- (BOOL)isAnd;
- (BOOL)isSatisfiableWithValue:(int64_t)a3;
- (LACMechanismTree)initWithChildren:(id)a3 isAndNode:(BOOL)a4;
- (LACMechanismTree)initWithValue:(int64_t)a3;
- (NSArray)children;
- (id)description;
- (int64_t)value;
@end

@implementation LACMechanismTree

- (LACMechanismTree)initWithChildren:(id)a3 isAndNode:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___LACMechanismTree;
  v8 = -[LACMechanismTree init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_value = -1LL;
    v8->_isAnd = a4;
    objc_storeStrong((id *)&v8->_children, a3);
  }

  return v9;
}

- (LACMechanismTree)initWithValue:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LACMechanismTree;
  v4 = -[LACMechanismTree init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_isAnd = 0;
    children = v4->_children;
    id v7 = (NSArray *)MEMORY[0x189604A58];
    v4->_value = a3;
    v4->_children = v7;
  }

  return v5;
}

- (id)description
{
  v16[3] = *MEMORY[0x1895F89C0];
  v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  v5 = (void *)NSString;
  objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", -[LACMechanismTree value](self, "value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 stringWithFormat:@"value: %@", v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v8 = (void *)NSString;
  -[LACMechanismTree children](self, "children");
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 stringWithFormat:@"children: [%@]", v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  objc_msgSend(NSString, "stringWithFormat:", @"isAnd: %d", -[LACMechanismTree isAnd](self, "isAnd"));
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v11;
  [MEMORY[0x189603F18] arrayWithObjects:v16 count:3];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 componentsJoinedByString:@"; "];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v13];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isAnd
{
  return self->_isAnd;
}

- (int64_t)value
{
  return self->_value;
}

- (NSArray)children
{
  return self->_children;
}

- (void).cxx_destruct
{
}

- (BOOL)isSatisfiableWithValue:(int64_t)a3
{
  uint64_t v4 = self;
  LOBYTE(a3) = LACMechanismTree.isSatisfiable(withValue:)(a3);

  return a3 & 1;
}

+ (id)mechanismTreeFromSerializedTree:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  swift_getObjCClassMetadata();
  uint64_t v8 = 0LL;
  v6 = (void *)static LACMechanismTree.parse(tree:index:)(v3, v5, &v8);
  swift_bridgeObjectRelease();
  return v6;
}

@end