@interface RPNWActivityEventMetrics
- (NSString)destination;
- (id)_metricsDictionary;
- (unint64_t)eventSize;
- (void)setDestination:(id)a3;
- (void)setEventSize:(unint64_t)a3;
@end

@implementation RPNWActivityEventMetrics

- (void)setDestination:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __43__RPNWActivityEventMetrics_setDestination___block_invoke;
  v6[3] = &unk_18A031AE8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[RPNWActivityMetrics _withLock:]((os_unfair_lock_s *)self, v6);
}

void __43__RPNWActivityEventMetrics_setDestination___block_invoke(uint64_t a1)
{
}

- (NSString)destination
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  v8 = __Block_byref_object_copy__3;
  v9 = __Block_byref_object_dispose__3;
  id v10 = 0LL;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __39__RPNWActivityEventMetrics_destination__block_invoke;
  v4[3] = &unk_18A032A50;
  v4[4] = self;
  v4[5] = &v5;
  -[RPNWActivityMetrics _withLock:]((os_unfair_lock_s *)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __39__RPNWActivityEventMetrics_destination__block_invoke(uint64_t a1)
{
}

- (void)setEventSize:(unint64_t)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __41__RPNWActivityEventMetrics_setEventSize___block_invoke;
  v3[3] = &unk_18A0322F0;
  v3[4] = self;
  v3[5] = a3;
  -[RPNWActivityMetrics _withLock:]((os_unfair_lock_s *)self, v3);
}

uint64_t __41__RPNWActivityEventMetrics_setEventSize___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 32LL) = *(void *)(result + 40);
  return result;
}

- (unint64_t)eventSize
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __37__RPNWActivityEventMetrics_eventSize__block_invoke;
  v4[3] = &unk_18A032A50;
  v4[4] = self;
  v4[5] = &v5;
  -[RPNWActivityMetrics _withLock:]((os_unfair_lock_s *)self, v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __37__RPNWActivityEventMetrics_eventSize__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(void *)(*(void *)(result + 32) + 32LL);
  return result;
}

- (id)_metricsDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[RPNWActivityEventMetrics destination](self, "destination");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"destination"];
  }
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLong:", -[RPNWActivityEventMetrics eventSize](self, "eventSize"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v5 forKeyedSubscript:@"bytesOut"];

  return v3;
}

- (void).cxx_destruct
{
}

@end