@interface VMUPeakFootprintAnalyzer
- (const)analyzerName;
- (id)analysisSummaryWithError:(id *)a3;
@end

@implementation VMUPeakFootprintAnalyzer

- (const)analyzerName
{
  return "PEAK FOOTPRINT";
}

- (id)analysisSummaryWithError:(id *)a3
{
  unint64_t v4 = -[VMUProcessObjectGraph physicalFootprint](self->super._graph, "physicalFootprint", a3);
  unint64_t v5 = -[VMUProcessObjectGraph physicalFootprintPeak](self->super._graph, "physicalFootprintPeak");
  v6 = (void *)objc_opt_new();
  v7 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]( objc_alloc(&OBJC_CLASS___VMUAnalyzerSummaryField),  "initWithKey:numericalValue:objectValue:fieldType:",  @"Physical footprint",  v4,  0LL,  2LL);
  [v6 addObject:v7];
  v8 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]( objc_alloc(&OBJC_CLASS___VMUAnalyzerSummaryField),  "initWithKey:numericalValue:objectValue:fieldType:",  @"Physical footprint (peak)",  v5,  0LL,  2LL);

  [v6 addObject:v8];
  float v9 = (float)v5 / (float)v4;
  if (v9 > 1.25)
  {
    [NSString stringWithFormat:@"Peak physical footprint was %.2f times higher than current -- past memory use was much higher. This can be analyzed with the Allocations instrument", v9];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(&OBJC_CLASS___VMUAnalyzerSummaryField);
    uint64_t v12 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]( v11,  "initWithKey:numericalValue:objectValue:fieldType:",  kVMUAnalysisSummaryKey[0],  0LL,  v10,  0LL);

    [v6 addObject:v12];
    v8 = (VMUAnalyzerSummaryField *)v12;
  }

  return v6;
}

@end