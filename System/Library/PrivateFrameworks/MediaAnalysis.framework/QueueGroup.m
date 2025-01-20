@interface QueueGroup
- (NSArray)queues;
- (void)scheduleJob:(id)a3 toDispatchGroup:(id)a4;
- (void)setQueues:(id)a3;
@end

@implementation QueueGroup

- (void)scheduleJob:(id)a3 toDispatchGroup:(id)a4
{
  v6 = (dispatch_group_s *)a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[QueueGroup queues](self, "queues"));
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:self->_roundRobinIdx]);
  dispatch_group_async(v6, v9, v7);

  unint64_t v10 = self->_roundRobinIdx + 1;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[QueueGroup queues](self, "queues"));
  self->_roundRobinIdx = v10 % (unint64_t)[v11 count];
}

- (NSArray)queues
{
  return self->_queues;
}

- (void)setQueues:(id)a3
{
}

- (void).cxx_destruct
{
}

@end