@interface GVSGravityDataContext
- (GVSGravityDataContext)init;
- (float)gravityFilterTimescale;
- (void)reset;
- (void)setExtractGravityData:(BOOL)a3;
- (void)setGravityFilterTimescale:(float)a3;
@end

@implementation GVSGravityDataContext

- (GVSGravityDataContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GVSGravityDataContext;
  v2 = -[GVSGravityDataContext init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[GVSGravityDataContext reset](v2, "reset");
  }
  return v3;
}

- (void)reset
{
  self->_latestTimestamp = 0.0;
  *(_OWORD *)self->_referencePoseGravityEstimate = 0u;
  self->_fusedRingIndex = 0;
}

- (void)setExtractGravityData:(BOOL)a3
{
  self->_extractGravityData = a3;
}

- (float)gravityFilterTimescale
{
  return self->_gravityFilterTimescale;
}

- (void)setGravityFilterTimescale:(float)a3
{
  self->_gravityFilterTimescale = a3;
}

@end