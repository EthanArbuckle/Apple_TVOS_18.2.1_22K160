@interface _GEOTransitRouteUpdateRequestConfig
+ (id)standardConfig;
- ($8E8A1DFF6E8C798DDDF56DAB3917D12E)dataRequestKindForRequest:(id)a3 traits:(id)a4;
- (id)debugRequestName;
- (id)serviceTypeNumber;
- (unint64_t)urlType;
@end

@implementation _GEOTransitRouteUpdateRequestConfig

+ (id)standardConfig
{
  if (qword_10006B0C8 != -1) {
    dispatch_once(&qword_10006B0C8, &stru_10005ABD0);
  }
  return (id)qword_10006B0D0;
}

- (unint64_t)urlType
{
  return 2LL;
}

- (id)debugRequestName
{
  return @"TransitUpdateRequest";
}

- (id)serviceTypeNumber
{
  return &off_10005E198;
}

- ($8E8A1DFF6E8C798DDDF56DAB3917D12E)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($8E8A1DFF6E8C798DDDF56DAB3917D12E)2857LL;
}

@end