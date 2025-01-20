@interface _GEOImageServiceRequestConfig
+ (id)standardConfig;
- ($8E8A1DFF6E8C798DDDF56DAB3917D12E)dataRequestKindForRequest:(id)a3 traits:(id)a4;
- (id)serviceTypeNumber;
- (unint64_t)urlType;
@end

@implementation _GEOImageServiceRequestConfig

+ (id)standardConfig
{
  if (qword_10006B050 != -1) {
    dispatch_once(&qword_10006B050, &stru_10005A508);
  }
  return (id)qword_10006B058;
}

- (unint64_t)urlType
{
  return 37LL;
}

- (id)serviceTypeNumber
{
  return &off_10005E180;
}

- ($8E8A1DFF6E8C798DDDF56DAB3917D12E)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($8E8A1DFF6E8C798DDDF56DAB3917D12E)2854LL;
}

@end