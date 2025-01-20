@interface NRBabelRouteLocal
- (NRBabelRouteLocal)initWithPrefix:(id)a3 instance:(id)a4;
- (unsigned)metric;
- (unsigned)seqno;
@end

@implementation NRBabelRouteLocal

- (unsigned)seqno
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelRoute instance](self, "instance"));
  unsigned __int16 v3 = (unsigned __int16)[v2 nodeSeqno];

  return v3;
}

- (unsigned)metric
{
  return 0;
}

- (NRBabelRouteLocal)initWithPrefix:(id)a3 instance:(id)a4
{
  v11[0] = 0LL;
  v11[1] = 0LL;
  id v6 = a4;
  id v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NRBabelRouteLocal;
  v8 = -[NRBabelRoute initWithPrefix:neighbor:routerID:seqno:interval:receivedMetric:nextHop:instance:]( &v10,  "initWithPrefix:neighbor:routerID:seqno:interval:receivedMetric:nextHop:instance:",  v7,  0,  [v6 routerID],  objc_msgSend(v6, "nodeSeqno"),  0xFFFFLL,  0,  v11,  v6);

  return v8;
}

@end