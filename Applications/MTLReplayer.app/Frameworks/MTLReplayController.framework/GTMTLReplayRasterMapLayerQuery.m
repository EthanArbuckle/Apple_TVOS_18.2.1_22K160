@interface GTMTLReplayRasterMapLayerQuery
+ (BOOL)supportsSecureCoding;
- (GTMTLReplayRasterMapLayerQuery)initWithCoder:(id)a3;
- (GTSize)size;
- (NSArray)horizontalLogicalCoordinatesAtPhysicalTileBoundaries;
- (NSArray)verticalLogicalCoordinatesAtPhysicalTileBoundaries;
- (void)encodeWithCoder:(id)a3;
- (void)setHorizontalLogicalCoordinatesAtPhysicalTileBoundaries:(id)a3;
- (void)setSize:(GTSize *)a3;
- (void)setVerticalLogicalCoordinatesAtPhysicalTileBoundaries:(id)a3;
@end

@implementation GTMTLReplayRasterMapLayerQuery

- (GTMTLReplayRasterMapLayerQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___GTMTLReplayRasterMapLayerQuery;
  v6 = -[GTMTLReplayRasterMapLayerQuery init](&v22, "init");
  if (v6)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSData, v5);
    v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  objc_opt_class(&OBJC_CLASS___NSError, v8),  0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v6->_size.width = (unint64_t)[v4 decodeInt64ForKey:@"size.width"];
    v6->_size.height = (unint64_t)[v4 decodeInt64ForKey:@"size.height"];
    v6->_size.depth = (unint64_t)[v4 decodeInt64ForKey:@"size.depth"];
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray, v11);
    v14 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v12,  objc_opt_class(&OBJC_CLASS___NSNumber, v13),  0LL);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = objc_claimAutoreleasedReturnValue( [v4 decodeObjectOfClasses:v15 forKey:@"horizontalLogicalCoordinatesAtPhysicalTileBoundaries"]);
    horizontalLogicalCoordinatesAtPhysicalTileBoundaries = v6->_horizontalLogicalCoordinatesAtPhysicalTileBoundaries;
    v6->_horizontalLogicalCoordinatesAtPhysicalTileBoundaries = (NSArray *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue( [v4 decodeObjectOfClasses:v15 forKey:@"verticalLogicalCoordinatesAtPhysicalTileBoundaries"]);
    verticalLogicalCoordinatesAtPhysicalTileBoundaries = v6->_verticalLogicalCoordinatesAtPhysicalTileBoundaries;
    v6->_verticalLogicalCoordinatesAtPhysicalTileBoundaries = (NSArray *)v18;

    v20 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t width = self->_size.width;
  id v5 = a3;
  [v5 encodeInt64:width forKey:@"size.width"];
  [v5 encodeInt64:self->_size.height forKey:@"size.height"];
  [v5 encodeInt64:self->_size.depth forKey:@"size.depth"];
  [v5 encodeObject:self->_horizontalLogicalCoordinatesAtPhysicalTileBoundaries forKey:@"horizontalLogicalCoordinatesAtPhysicalTileBoundaries"];
  [v5 encodeObject:self->_verticalLogicalCoordinatesAtPhysicalTileBoundaries forKey:@"verticalLogicalCoordinatesAtPhysicalTileBoundaries"];
}

- (NSArray)horizontalLogicalCoordinatesAtPhysicalTileBoundaries
{
  return self->_horizontalLogicalCoordinatesAtPhysicalTileBoundaries;
}

- (void)setHorizontalLogicalCoordinatesAtPhysicalTileBoundaries:(id)a3
{
}

- (NSArray)verticalLogicalCoordinatesAtPhysicalTileBoundaries
{
  return self->_verticalLogicalCoordinatesAtPhysicalTileBoundaries;
}

- (void)setVerticalLogicalCoordinatesAtPhysicalTileBoundaries:(id)a3
{
}

- (GTSize)size
{
  *retstr = self[1];
  return self;
}

- (void)setSize:(GTSize *)a3
{
  __int128 v3 = *(_OWORD *)&a3->width;
  self->_size.depth = a3->depth;
  *(_OWORD *)&self->_size.unint64_t width = v3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end