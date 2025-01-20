@interface PBAppSwitcherUpdate
+ (id)deleteUpdateWithItem:(id)a3 indexPath:(id)a4;
+ (id)insertUpdateWithItem:(id)a3 indexPath:(id)a4;
- (NSIndexPath)fromIndexPath;
- (NSIndexPath)toIndexPath;
- (PBAppSwitcherItem)item;
- (PBAppSwitcherUpdate)initWithType:(int64_t)a3 item:(id)a4 fromIndexPath:(id)a5 toIndexPath:(id)a6;
- (int64_t)type;
@end

@implementation PBAppSwitcherUpdate

- (PBAppSwitcherUpdate)initWithType:(int64_t)a3 item:(id)a4 fromIndexPath:(id)a5 toIndexPath:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PBAppSwitcherUpdate;
  v14 = -[PBAppSwitcherUpdate init](&v21, "init");
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    objc_storeStrong((id *)&v14->_item, a4);
    v16 = (NSIndexPath *)[v12 copy];
    fromIndexPath = v15->_fromIndexPath;
    v15->_fromIndexPath = v16;

    v18 = (NSIndexPath *)[v13 copy];
    toIndexPath = v15->_toIndexPath;
    v15->_toIndexPath = v18;
  }

  return v15;
}

+ (id)deleteUpdateWithItem:(id)a3 indexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithType:1 item:v7 fromIndexPath:v6 toIndexPath:0];

  return v8;
}

+ (id)insertUpdateWithItem:(id)a3 indexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithType:0 item:v7 fromIndexPath:0 toIndexPath:v6];

  return v8;
}

- (int64_t)type
{
  return self->_type;
}

- (PBAppSwitcherItem)item
{
  return self->_item;
}

- (NSIndexPath)fromIndexPath
{
  return self->_fromIndexPath;
}

- (NSIndexPath)toIndexPath
{
  return self->_toIndexPath;
}

- (void).cxx_destruct
{
}

@end