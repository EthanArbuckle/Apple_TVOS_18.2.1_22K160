@interface DYShaderAnalyzerResult
- (DYShaderAnalyzerResult)init;
- (NSDictionary)drawCallCost;
- (NSDictionary)drawCallPerLineCost;
- (NSDictionary)perFileCost;
- (NSDictionary)perFileLineCostDictForCI;
- (NSDictionary)totalPerLineCost;
- (double)totalCost;
- (void)setDrawCallCost:(id)a3;
- (void)setDrawCallPerLineCost:(id)a3;
- (void)setPerFileCost:(id)a3;
- (void)setPerFileLineCostDictForCI:(id)a3;
- (void)setTotalCost:(double)a3;
- (void)setTotalPerLineCost:(id)a3;
@end

@implementation DYShaderAnalyzerResult

- (DYShaderAnalyzerResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DYShaderAnalyzerResult;
  v2 = -[DYShaderAnalyzerResult init](&v6, "init");
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (double)totalCost
{
  return self->_totalCost;
}

- (void)setTotalCost:(double)a3
{
  self->_totalCost = a3;
}

- (NSDictionary)drawCallCost
{
  return self->_drawCallCost;
}

- (void)setDrawCallCost:(id)a3
{
}

- (NSDictionary)perFileCost
{
  return self->_perFileCost;
}

- (void)setPerFileCost:(id)a3
{
}

- (NSDictionary)totalPerLineCost
{
  return self->_totalPerLineCost;
}

- (void)setTotalPerLineCost:(id)a3
{
}

- (NSDictionary)drawCallPerLineCost
{
  return self->_drawCallPerLineCost;
}

- (void)setDrawCallPerLineCost:(id)a3
{
}

- (NSDictionary)perFileLineCostDictForCI
{
  return self->_perFileLineCostDictForCI;
}

- (void)setPerFileLineCostDictForCI:(id)a3
{
}

- (void).cxx_destruct
{
}

@end