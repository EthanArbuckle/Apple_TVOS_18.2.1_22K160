@interface MPWeighterConstraint
- (MPWeighterConstraint)init;
- (NSArray)maxAspectRatios;
- (NSArray)minAspectRatios;
- (NSArray)tags;
- (NSDictionary)nextConstraints;
- (NSString)presetID;
- (void)dealloc;
- (void)setMaxAspectRatios:(id)a3;
- (void)setMinAspectRatios:(id)a3;
- (void)setNextConstraints:(id)a3;
- (void)setPresetID:(id)a3;
- (void)setTags:(id)a3;
@end

@implementation MPWeighterConstraint

- (MPWeighterConstraint)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPWeighterConstraint;
  result = -[MPWeighterConstraint init](&v3, "init");
  if (result)
  {
    result->allPanoramas = 0LL;
    result->hasPanorama = 0;
    *(_OWORD *)&result->numOfImages = 0u;
    *(_OWORD *)&result->presetID = 0u;
    *(_WORD *)&result->moviesOnly = 0;
    *(_OWORD *)&result->wideLandscape = 0u;
    *(_OWORD *)&result->landscape = 0u;
    *(_OWORD *)&result->hPanoramas = 0u;
    result->minAspectRatios = 0LL;
    result->tags = 0LL;
    result->maxAspectRatios = 0LL;
    *(_WORD *)&result->tagsOnSourceOnly = 0;
  }

  return result;
}

- (void)dealloc
{
  self->nextConstraints = 0LL;
  self->presetID = 0LL;

  self->maxAspectRatios = 0LL;
  self->minAspectRatios = 0LL;

  self->tags = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPWeighterConstraint;
  -[MPWeighterConstraint dealloc](&v3, "dealloc");
}

- (NSDictionary)nextConstraints
{
  return self->nextConstraints;
}

- (void)setNextConstraints:(id)a3
{
}

- (NSString)presetID
{
  return self->presetID;
}

- (void)setPresetID:(id)a3
{
}

- (NSArray)maxAspectRatios
{
  return self->maxAspectRatios;
}

- (void)setMaxAspectRatios:(id)a3
{
}

- (NSArray)minAspectRatios
{
  return self->minAspectRatios;
}

- (void)setMinAspectRatios:(id)a3
{
}

- (NSArray)tags
{
  return self->tags;
}

- (void)setTags:(id)a3
{
}

@end