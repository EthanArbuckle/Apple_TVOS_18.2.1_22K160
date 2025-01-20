@interface CSSPGEndpointAnalyzer
- (CSSPGEndpointAnalyzer)initWithAnalyzeMode;
- (CSSPGEndpointAnalyzer)initWithEndpointThreshold:(float)a3;
- (CSSPGEndpointAnalyzerDelegate)delegate;
- (int64_t)getFrameDurationMs;
- (void)setDelegate:(id)a3;
@end

@implementation CSSPGEndpointAnalyzer

- (CSSPGEndpointAnalyzer)initWithEndpointThreshold:(float)a3
{
  return 0LL;
}

- (CSSPGEndpointAnalyzer)initWithAnalyzeMode
{
  return 0LL;
}

- (int64_t)getFrameDurationMs
{
  return 0LL;
}

- (CSSPGEndpointAnalyzerDelegate)delegate
{
  return (CSSPGEndpointAnalyzerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end