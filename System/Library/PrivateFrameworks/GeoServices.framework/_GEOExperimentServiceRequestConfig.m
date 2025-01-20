@interface _GEOExperimentServiceRequestConfig
+ (id)standardConfig;
- ($8E8A1DFF6E8C798DDDF56DAB3917D12E)dataRequestKindForRequest:(id)a3 traits:(id)a4;
- (id)serviceTypeNumber;
- (unint64_t)urlType;
@end

@implementation _GEOExperimentServiceRequestConfig

+ (id)standardConfig
{
  if (qword_10006AF20 != -1) {
    dispatch_once(&qword_10006AF20, &stru_1000592C0);
  }
  return (id)qword_10006AF28;
}

- (unint64_t)urlType
{
  return 26LL;
}

- ($8E8A1DFF6E8C798DDDF56DAB3917D12E)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($8E8A1DFF6E8C798DDDF56DAB3917D12E)2850LL;
}

- (id)serviceTypeNumber
{
  return &off_10005E120;
}

@end