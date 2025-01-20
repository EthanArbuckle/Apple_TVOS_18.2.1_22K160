@interface HHDClockAppFactory
- (id)createMediaEndpointBrowserWithQueue:(id)a3;
- (id)createPlayerWithEndpoint:(id)a3 delegate:(id)a4;
@end

@implementation HHDClockAppFactory

- (id)createPlayerWithEndpoint:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[HHDClockPlayer initWithEndpoint:delegate:]( objc_alloc(&OBJC_CLASS___HHDClockPlayer),  "initWithEndpoint:delegate:",  v6,  v5);

  return v7;
}

- (id)createMediaEndpointBrowserWithQueue:(id)a3
{
  id v3 = a3;
  v4 = -[HHDMediaEndpointBrowser initWithQueue:]( objc_alloc(&OBJC_CLASS___HHDMediaEndpointBrowser),  "initWithQueue:",  v3);

  return v4;
}

@end