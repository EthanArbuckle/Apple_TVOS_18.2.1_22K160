@interface _GEOLocationShiftRequestConfig
+ (id)standardConfig;
- ($8E8A1DFF6E8C798DDDF56DAB3917D12E)dataRequestKindForRequest:(id)a3 traits:(id)a4;
- (id)serviceTypeNumber;
- (int64_t)companionRequestType;
- (unint64_t)urlType;
@end

@implementation _GEOLocationShiftRequestConfig

+ (id)standardConfig
{
  if (qword_10006AFD0 != -1) {
    dispatch_once(&qword_10006AFD0, &stru_100059C00);
  }
  return (id)qword_10006AFD8;
}

- (id)serviceTypeNumber
{
  return +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 17LL);
}

- (unint64_t)urlType
{
  return 15LL;
}

- ($8E8A1DFF6E8C798DDDF56DAB3917D12E)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($8E8A1DFF6E8C798DDDF56DAB3917D12E)2851LL;
}

- (int64_t)companionRequestType
{
  return 3LL;
}

@end