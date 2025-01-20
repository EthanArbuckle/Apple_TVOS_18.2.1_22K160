@interface INTipNetworkResponse
- (INTipNetworkResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
@end

@implementation INTipNetworkResponse

- (INTipNetworkResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___INTipNetworkResponse;
  v4 = -[INTipNetworkResponse initWithHTTPResponse:data:bodyIsPlist:]( &v11,  "initWithHTTPResponse:data:bodyIsPlist:",  a3,  a4,  0LL);
  v5 = v4;
  if (v4)
  {
    v6 = (id *)&v4->AAResponse_opaque[OBJC_IVAR___AAResponse__httpResponse];
    id v7 = [*v6 statusCode];
    if (v7 != (id)200)
    {
      uint64_t v8 = _INLogSystem(v7);
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000157D0(v6, v9);
      }
    }
  }

  return v5;
}

@end