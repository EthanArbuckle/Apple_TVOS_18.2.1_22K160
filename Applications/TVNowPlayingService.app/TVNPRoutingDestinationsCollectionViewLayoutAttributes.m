@interface TVNPRoutingDestinationsCollectionViewLayoutAttributes
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (TVNPRoutingDestinationsCollectionViewLayoutAttributes)init;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setEnabled:(BOOL)a3;
@end

@implementation TVNPRoutingDestinationsCollectionViewLayoutAttributes

- (TVNPRoutingDestinationsCollectionViewLayoutAttributes)init
{
  SEL v6 = a2;
  v7 = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewLayoutAttributes;
  v4 = -[TVNPRoutingDestinationsCollectionViewLayoutAttributes init](&v5, "init");
  v7 = v4;
  objc_storeStrong((id *)&v7, v4);
  if (v4) {
    v7->_enabled = 1;
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
  v5.super_class = (Class)&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewLayoutAttributes;
  v6[0] = -[TVNPRoutingDestinationsCollectionViewLayoutAttributes copyWithZone:](&v5, "copyWithZone:", a3);
  objc_msgSend( v6[0],  "setEnabled:",  -[TVNPRoutingDestinationsCollectionViewLayoutAttributes isEnabled](v7, "isEnabled"));
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
  v6.super_class = (Class)&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewLayoutAttributes;
  char v7 = -[TVNPRoutingDestinationsCollectionViewLayoutAttributes isEqual:](&v6, "isEqual:", location[0]);
  BOOL v5 = 0;
  if (v7)
  {
    int v4 = -[TVNPRoutingDestinationsCollectionViewLayoutAttributes isEnabled](v9, "isEnabled");
    BOOL v5 = v4 == ([location[0] isEnabled] & 1);
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
  v4.super_class = (Class)&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewLayoutAttributes;
  id v5 = -[TVNPRoutingDestinationsCollectionViewLayoutAttributes hash](&v4, "hash");
  if (-[TVNPRoutingDestinationsCollectionViewLayoutAttributes isEnabled](v7, "isEnabled")) {
    int v2 = 0;
  }
  else {
    int v2 = 50;
  }
  return (unint64_t)v5 + v2;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end