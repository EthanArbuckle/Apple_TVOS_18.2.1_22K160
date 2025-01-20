@interface PBMultiLatch
- (BOOL)_hasOpenLatches;
- (BOOL)_readLatchNamed:(id)a3;
- (BOOL)waitForAllLatchesUntilDate:(id)a3;
- (BOOL)waitForLatchNamed:(id)a3 untilDate:(id)a4;
- (PBMultiLatch)init;
- (void)closeLatchNamed:(id)a3;
- (void)openLatchNamed:(id)a3;
- (void)waitForLatchNamed:(id)a3;
@end

@implementation PBMultiLatch

- (PBMultiLatch)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBMultiLatch;
  v2 = -[PBMultiLatch init](&v9, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    latches = v2->_latches;
    v2->_latches = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSCondition);
    condition = v2->_condition;
    v2->_condition = v5;

    -[NSCondition setName:](v2->_condition, "setName:", @"PBMultiLatch");
    v7 = v2;
  }

  return v2;
}

- (void)openLatchNamed:(id)a3
{
  condition = self->_condition;
  id v5 = a3;
  -[NSCondition lock](condition, "lock");
  -[NSMutableSet addObject:](self->_latches, "addObject:", v5);

  -[NSCondition broadcast](self->_condition, "broadcast");
  -[NSCondition unlock](self->_condition, "unlock");
}

- (void)closeLatchNamed:(id)a3
{
  condition = self->_condition;
  id v5 = a3;
  -[NSCondition lock](condition, "lock");
  -[NSMutableSet removeObject:](self->_latches, "removeObject:", v5);

  -[NSCondition broadcast](self->_condition, "broadcast");
  -[NSCondition unlock](self->_condition, "unlock");
}

- (BOOL)_readLatchNamed:(id)a3
{
  return -[NSMutableSet containsObject:](self->_latches, "containsObject:", a3);
}

- (BOOL)_hasOpenLatches
{
  return -[NSMutableSet count](self->_latches, "count") != 0LL;
}

- (void)waitForLatchNamed:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
  -[PBMultiLatch waitForLatchNamed:untilDate:](self, "waitForLatchNamed:untilDate:", v4, v5);
}

- (BOOL)waitForLatchNamed:(id)a3 untilDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[NSCondition lock](self->_condition, "lock");
  id v8 = sub_100082A9C();
  objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    latches = self->_latches;
    int v16 = 138543874;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2114;
    v21 = latches;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Waiting for %{public}@ until %@ (latches: %{public}@)",  (uint8_t *)&v16,  0x20u);
  }

  while (1)
  {
    unsigned int v10 = -[PBMultiLatch _readLatchNamed:](self, "_readLatchNamed:", v6);
    if (!v10) {
      break;
    }
    if (!-[NSCondition waitUntilDate:](self->_condition, "waitUntilDate:", v7))
    {
      id v11 = sub_100082A9C();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_100284034();
      }
      goto LABEL_10;
    }
  }

  id v13 = sub_100082A9C();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100284060();
  }
LABEL_10:

  -[NSCondition unlock](self->_condition, "unlock");
  return v10 ^ 1;
}

- (BOOL)waitForAllLatchesUntilDate:(id)a3
{
  id v4 = a3;
  -[NSCondition lock](self->_condition, "lock");
  id v5 = sub_100082A9C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10028408C((uint64_t)self, (uint64_t)v4, v6);
  }

  while (1)
  {
    unsigned int v7 = -[PBMultiLatch _hasOpenLatches](self, "_hasOpenLatches");
    if (!v7) {
      break;
    }
    if (!-[NSCondition waitUntilDate:](self->_condition, "waitUntilDate:", v4))
    {
      id v8 = sub_100082A9C();
      objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_100284034();
      }
      goto LABEL_10;
    }
  }

  id v10 = sub_100082A9C();
  objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100284060();
  }
LABEL_10:

  -[NSCondition unlock](self->_condition, "unlock");
  return v7 ^ 1;
}

- (void).cxx_destruct
{
}

@end