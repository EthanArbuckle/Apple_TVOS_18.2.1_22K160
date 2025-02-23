@interface CMAPrecisionFindingManagerAdapter
- (CMAPrecisionFindingManagerAdapter)initWithFindingManager:(void *)a3;
- (void)didUpdateAnalytics:(id)a3 withError:(id)a4;
- (void)didUpdatePreciseDevicePosition:(id)a3 withError:(id)a4;
- (void)invalidate;
@end

@implementation CMAPrecisionFindingManagerAdapter

- (CMAPrecisionFindingManagerAdapter)initWithFindingManager:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CMAPrecisionFindingManagerAdapter;
  result = -[CMAPrecisionFindingManagerAdapter init](&v5, "init");
  if (result) {
    result->_manager = a3;
  }
  return result;
}

- (void)invalidate
{
  self->_manager = 0LL;
}

- (void)didUpdatePreciseDevicePosition:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "#findalgs-devicefinder,didUpdatePreciseDevicePosition failed with error: %@",  (uint8_t *)&v10,  0xCu);
    }
  }

  else
  {
    manager = self->_manager;
    if (manager)
    {
      sub_100317A8C((uint64_t)manager, v6);
    }

    else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
    {
      sub_1003AC638();
    }
  }
}

- (void)didUpdateAnalytics:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "#findalgs-devicefinder,didUpdateAnalytics failed with error: %@",  (uint8_t *)&v10,  0xCu);
    }
  }

  else
  {
    manager = self->_manager;
    if (manager)
    {
      sub_100317CF4((uint64_t)manager, v6);
    }

    else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
    {
      sub_1003AC664();
    }
  }
}

@end