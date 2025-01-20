@interface NRDRemoteableBlock
- (NRDRemoteableBlock)initWithBlock:(id)a3;
- (NRDRemoteableBlock)initWithProgressBlock:(id)a3;
- (void)execute:(id)a3;
- (void)progress:(id)a3;
@end

@implementation NRDRemoteableBlock

- (NRDRemoteableBlock)initWithBlock:(id)a3
{
  id v4 = a3;
  v5 = -[NRDRemoteableBlock init](self, "init");
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      id v7 = objc_retainBlock(v4);
      block = v6->_block;
      v6->_block = v7;
    }

    else
    {
      block = v5;
      v6 = 0LL;
    }
  }

  return v6;
}

- (NRDRemoteableBlock)initWithProgressBlock:(id)a3
{
  id v4 = a3;
  v5 = -[NRDRemoteableBlock init](self, "init");
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      id v7 = objc_retainBlock(v4);
      progressBlock = v6->_progressBlock;
      v6->_progressBlock = v7;
    }

    else
    {
      progressBlock = v5;
      v6 = 0LL;
    }
  }

  return v6;
}

- (void)execute:(id)a3
{
  block = (void (**)(id, id))self->_block;
  if (block) {
    block[2](block, a3);
  }
}

- (void)progress:(id)a3
{
  progressBlock = (void (**)(id, id))self->_progressBlock;
  if (progressBlock) {
    progressBlock[2](progressBlock, a3);
  }
}

- (void).cxx_destruct
{
}

@end