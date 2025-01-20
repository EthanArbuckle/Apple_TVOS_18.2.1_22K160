@interface FAServiceDelegateQueueProvider
- (id)requestQueueWithOptions:(id)a3;
- (unsigned)_qosClassForOptions:(id)a3;
@end

@implementation FAServiceDelegateQueueProvider

- (unsigned)_qosClassForOptions:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"FAQualityOfServiceOptionKey"]);
  v4 = (char *)[v3 integerValue];

  unint64_t v5 = __ROR8__(v4 - 9, 3);
  unsigned int v6 = 8 * v5 + 9;
  if (v5 >= 4) {
    return 21;
  }
  else {
    return v6;
  }
}

- (id)requestQueueWithOptions:(id)a3
{
  return dispatch_get_global_queue( -[FAServiceDelegateQueueProvider _qosClassForOptions:](self, "_qosClassForOptions:", a3),  0LL);
}

@end