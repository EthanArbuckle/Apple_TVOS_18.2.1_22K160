@interface TVNPRoutingRoutesCollectionViewLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (TVNPRoutingRoutesCollectionViewLayoutAttributes)init;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)cellState;
- (unint64_t)hash;
- (void)setCellState:(unint64_t)a3;
@end

@implementation TVNPRoutingRoutesCollectionViewLayoutAttributes

- (TVNPRoutingRoutesCollectionViewLayoutAttributes)init
{
  SEL v6 = a2;
  v7 = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVNPRoutingRoutesCollectionViewLayoutAttributes;
  v4 = -[TVNPRoutingRoutesCollectionViewLayoutAttributes init](&v5, "init");
  v7 = v4;
  objc_storeStrong((id *)&v7, v4);
  if (v4) {
    v7->_cellState = 1LL;
  }
  v3 = v7;
  objc_storeStrong((id *)&v7, 0LL);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7 = self;
  v6[2] = (id)a2;
  v6[1] = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVNPRoutingRoutesCollectionViewLayoutAttributes;
  v6[0] = -[TVNPRoutingRoutesCollectionViewLayoutAttributes copyWithZone:](&v5, "copyWithZone:", a3);
  objc_msgSend(v6[0], "setCellState:", -[TVNPRoutingRoutesCollectionViewLayoutAttributes cellState](v7, "cellState"));
  id v4 = v6[0];
  objc_storeStrong(v6, 0LL);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v6.receiver = v9;
  v6.super_class = (Class)&OBJC_CLASS___TVNPRoutingRoutesCollectionViewLayoutAttributes;
  char v7 = -[TVNPRoutingRoutesCollectionViewLayoutAttributes isEqual:](&v6, "isEqual:", location[0]);
  BOOL v5 = 0;
  if (v7)
  {
    id v4 = -[TVNPRoutingRoutesCollectionViewLayoutAttributes cellState](v9, "cellState");
    BOOL v5 = v4 == [location[0] cellState];
  }

  char v7 = v5;
  objc_storeStrong(location, 0LL);
  return v5;
}

- (unint64_t)hash
{
  char v7 = self;
  SEL v6 = a2;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVNPRoutingRoutesCollectionViewLayoutAttributes;
  id v5 = -[TVNPRoutingRoutesCollectionViewLayoutAttributes hash](&v4, "hash");
  unint64_t v2 = -[TVNPRoutingRoutesCollectionViewLayoutAttributes cellState](v7, "cellState");
  return (unint64_t)v5 + 5 * v2;
}

- (unint64_t)cellState
{
  return self->_cellState;
}

- (void)setCellState:(unint64_t)a3
{
  self->_cellState = a3;
}

@end