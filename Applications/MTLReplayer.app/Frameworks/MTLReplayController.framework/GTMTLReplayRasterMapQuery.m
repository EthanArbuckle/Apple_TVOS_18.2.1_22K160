@interface GTMTLReplayRasterMapQuery
+ (BOOL)supportsSecureCoding;
- (GTMTLReplayRasterMapQuery)initWithCoder:(id)a3;
- (GTSize)physicalGranularity;
- (NSArray)layers;
- (void)encodeWithCoder:(id)a3;
- (void)setLayers:(id)a3;
- (void)setPhysicalGranularity:(GTSize *)a3;
@end

@implementation GTMTLReplayRasterMapQuery

- (GTMTLReplayRasterMapQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___GTMTLReplayRasterMapQuery;
  v6 = -[GTMTLReplayRasterMapQuery init](&v20, "init");
  if (v6)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSData, v5);
    v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  objc_opt_class(&OBJC_CLASS___NSError, v8),  0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v6->_physicalGranularity.width = (unint64_t)[v4 decodeInt64ForKey:@"physicalGranularity.width"];
    v6->_physicalGranularity.height = (unint64_t)[v4 decodeInt64ForKey:@"physicalGranularity.height"];
    v6->_physicalGranularity.depth = (unint64_t)[v4 decodeInt64ForKey:@"physicalGranularity.depth"];
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray, v11);
    v14 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v12,  objc_opt_class(&OBJC_CLASS___GTMTLReplayRasterMapLayerQuery, v13),  0LL);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v15 forKey:@"layers"]);
    layers = v6->_layers;
    v6->_layers = (NSArray *)v16;

    v18 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t width = self->_physicalGranularity.width;
  id v5 = a3;
  [v5 encodeInt64:width forKey:@"physicalGranularity.width"];
  [v5 encodeInt64:self->_physicalGranularity.height forKey:@"physicalGranularity.height"];
  [v5 encodeInt64:self->_physicalGranularity.depth forKey:@"physicalGranularity.depth"];
  [v5 encodeObject:self->_layers forKey:@"layers"];
}

- (GTSize)physicalGranularity
{
  *retstr = *(GTSize *)&self->depth;
  return self;
}

- (void)setPhysicalGranularity:(GTSize *)a3
{
  __int128 v3 = *(_OWORD *)&a3->width;
  self->_physicalGranularity.depth = a3->depth;
  *(_OWORD *)&self->_physicalGranularity.unint64_t width = v3;
}

- (NSArray)layers
{
  return self->_layers;
}

- (void)setLayers:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end