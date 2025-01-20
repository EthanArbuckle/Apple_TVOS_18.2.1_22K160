@interface NRBabelSourceLocal
- (BOOL)isNewDistanceFeasibleWithSeqno:(unsigned __int16)a3 metric:(unsigned __int16)a4;
- (NRBabelSourceLocal)initWithPrefix:(id)a3 instance:(id)a4;
- (id)description;
- (unsigned)seqno;
@end

@implementation NRBabelSourceLocal

- (NRBabelSourceLocal)initWithPrefix:(id)a3 instance:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NRBabelSourceLocal;
  v8 = -[NRBabelSource initWithPrefix:routerID:seqno:metric:instance:]( &v10,  "initWithPrefix:routerID:seqno:metric:instance:",  v7,  [v6 routerID],  objc_msgSend(v6, "nodeSeqno"),  0,  v6);

  return v8;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelSource bPrefix](self, "bPrefix"));
  v5 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@ (local)", v4);

  return v5;
}

- (unsigned)seqno
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelSource instance](self, "instance"));
  unsigned __int16 v3 = (unsigned __int16)[v2 nodeSeqno];

  return v3;
}

- (BOOL)isNewDistanceFeasibleWithSeqno:(unsigned __int16)a3 metric:(unsigned __int16)a4
{
  return 0;
}

@end