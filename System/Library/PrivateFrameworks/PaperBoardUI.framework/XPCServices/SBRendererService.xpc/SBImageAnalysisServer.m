@interface SBImageAnalysisServer
+ (id)secureCodableRequestClasses;
+ (id)secureCodableResponseClasses;
- (SBImageAnalysisServer)init;
- (id)executeAnalysisRequest:(id)a3 error:(id *)a4;
- (id)executeAnalysisRequest:(id)a3 reply:(id)a4;
- (void)cancelRequest:(id)a3;
@end

@implementation SBImageAnalysisServer

+ (id)secureCodableRequestClasses
{
  return +[PRUISAnalysisService secureCodableRequestClasses]( &OBJC_CLASS___PRUISAnalysisService,  "secureCodableRequestClasses");
}

+ (id)secureCodableResponseClasses
{
  return +[PRUISAnalysisService secureCodableResponseClasses]( &OBJC_CLASS___PRUISAnalysisService,  "secureCodableResponseClasses");
}

- (SBImageAnalysisServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SBImageAnalysisServer;
  v2 = -[SBImageAnalysisServer init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___SBImageAnalyzer);
    analyzer = v2->_analyzer;
    v2->_analyzer = v3;
  }

  return v2;
}

- (void)cancelRequest:(id)a3
{
}

- (id)executeAnalysisRequest:(id)a3 reply:(id)a4
{
  return -[SBImageAnalyzer executeAnalysisRequest:completion:]( self->_analyzer,  "executeAnalysisRequest:completion:",  a3,  a4);
}

- (id)executeAnalysisRequest:(id)a3 error:(id *)a4
{
  return -[SBImageAnalyzer executeAnalysisRequest:error:](self->_analyzer, "executeAnalysisRequest:error:", a3, a4);
}

- (void).cxx_destruct
{
}

@end