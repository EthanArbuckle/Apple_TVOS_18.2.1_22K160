@interface VMULeaksAnalyzer
- (const)analyzerName;
- (id)analysisSummaryWithError:(id *)a3;
@end

@implementation VMULeaksAnalyzer

- (const)analyzerName
{
  return "LEAKS";
}

- (id)analysisSummaryWithError:(id *)a3
{
  v4 = -[VMULeakDetector initWithVMUTask:graph:scanner:stackLogReader:]( objc_alloc(&OBJC_CLASS___VMULeakDetector),  "initWithVMUTask:graph:scanner:stackLogReader:",  0LL,  self->super._graph,  0LL,  0LL);
  id v15 = 0LL;
  unsigned int v5 = -[VMULeakDetector detectLeaksWithError:](v4, "detectLeaksWithError:", &v15);
  id v6 = v15;
  v7 = v6;
  if (v6)
  {
    v8 = 0LL;
    if (a3) {
      *a3 = v6;
    }
  }

  else
  {
    v8 = (void *)objc_opt_new();
    v9 = objc_alloc(&OBJC_CLASS___VMUAnalyzerSummaryField);
    if (v5)
    {
      v10 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]( v9,  "initWithKey:numericalValue:objectValue:fieldType:",  @"Allocations count",  -[VMULeakDetector allocationsCount](v4, "allocationsCount"),  0LL,  1LL);
      [v8 addObject:v10];
      v11 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]( objc_alloc(&OBJC_CLASS___VMUAnalyzerSummaryField),  "initWithKey:numericalValue:objectValue:fieldType:",  @"Allocations size",  -[VMULeakDetector allocationsSize](v4, "allocationsSize"),  0LL,  2LL);

      [v8 addObject:v11];
      v12 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]( objc_alloc(&OBJC_CLASS___VMUAnalyzerSummaryField),  "initWithKey:numericalValue:objectValue:fieldType:",  @"Leaks count",  -[VMULeakDetector leakedAllocationsCount](v4, "leakedAllocationsCount"),  0LL,  1LL);

      [v8 addObject:v12];
      v13 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]( objc_alloc(&OBJC_CLASS___VMUAnalyzerSummaryField),  "initWithKey:numericalValue:objectValue:fieldType:",  @"Leaks total size",  -[VMULeakDetector leakedAllocationsSize](v4, "leakedAllocationsSize"),  0LL,  2LL);
    }

    else
    {
      v13 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]( v9,  "initWithKey:numericalValue:objectValue:fieldType:",  kVMUAnalysisSummaryKey[0],  0LL,  @"No leaks detected",  0LL);
    }

    [v8 addObject:v13];
  }

  return v8;
}

@end