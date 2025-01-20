@interface VMUAnalyzerBase
+ (id)analyzerClasses;
- (VMUAnalyzerBase)initWithGraph:(id)a3 regionIdentifier:(id)a4 debugTimer:(id)a5;
- (const)analyzerName;
- (id)analysisSummaryWithError:(id *)a3;
@end

@implementation VMUAnalyzerBase

- (const)analyzerName
{
  return "Base - this should get overridden by subclasses";
}

+ (id)analyzerClasses
{
  v3[3] = *MEMORY[0x1895F89C0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  [MEMORY[0x189603F18] arrayWithObjects:v3 count:3];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (VMUAnalyzerBase)initWithGraph:(id)a3 regionIdentifier:(id)a4 debugTimer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = -[VMUAnalyzerBase init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_graph, a3);
    objc_storeStrong((id *)&v13->_regionIdentifier, a4);
    objc_storeStrong((id *)&v13->_debugTimer, a5);
  }

  return v13;
}

- (id)analysisSummaryWithError:(id *)a3
{
  return 0LL;
}

- (void).cxx_destruct
{
}

@end