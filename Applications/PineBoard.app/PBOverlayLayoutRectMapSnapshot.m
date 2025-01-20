@interface PBOverlayLayoutRectMapSnapshot
- (BOOL)isEqual:(id)a3;
- (CGRect)bounds;
- (NSSet)nodes;
- (PBOverlayLayoutRectMapSnapshot)initWithBounds:(CGRect)a3 nodes:(id)a4;
@end

@implementation PBOverlayLayoutRectMapSnapshot

- (PBOverlayLayoutRectMapSnapshot)initWithBounds:(CGRect)a3 nodes:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___PBOverlayLayoutRectMapSnapshot;
  v10 = -[PBOverlayLayoutRectMapSnapshot init](&v28, "init");
  v11 = v10;
  if (v10)
  {
    v10->_bounds.origin.CGFloat x = x;
    v10->_bounds.origin.CGFloat y = y;
    v10->_bounds.size.CGFloat width = width;
    v10->_bounds.size.CGFloat height = height;
    v12 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v9 count]);
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v13 = v9;
    id v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        v17 = 0LL;
        do
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v17);
          v19 = objc_alloc(&OBJC_CLASS___PBOverlayLayoutRectNode);
          v20 = -[PBOverlayLayoutRectNode initWithNode:key:](v19, "initWithNode:key:", v18, 0LL, (void)v24);
          -[NSMutableSet addObject:](v12, "addObject:", v20);

          v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }

      while (v15);
    }

    v21 = (NSSet *)-[NSMutableSet copy](v12, "copy");
    nodes = v11->_nodes;
    v11->_nodes = v21;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___PBOverlayLayoutRectMapSnapshot));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100108FA4;
  v18[3] = &unk_1003D7958;
  id v7 = v4;
  id v19 = v7;
  id v8 =  objc_msgSend( v6,  "appendCGRect:counterpart:",  v18,  self->_bounds.origin.x,  self->_bounds.origin.y,  self->_bounds.size.width,  self->_bounds.size.height);
  nodes = self->_nodes;
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  id v15 = sub_100108FBC;
  uint64_t v16 = &unk_1003D2130;
  id v17 = v7;
  id v10 = v7;
  id v11 = [v6 appendObject:nodes counterpart:&v13];
  LOBYTE(nodes) = objc_msgSend(v6, "isEqual", v13, v14, v15, v16);

  return (char)nodes;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSSet)nodes
{
  return self->_nodes;
}

- (void).cxx_destruct
{
}

@end