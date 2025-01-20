@interface HTNetworkInfo
+ (id)networkStateForTailSpin;
@end

@implementation HTNetworkInfo

+ (id)networkStateForTailSpin
{
  uint64_t evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint(0LL, 0LL);
  v3 = (void *)evaluator_for_endpoint;
  if (evaluator_for_endpoint)
  {
    v4 = (nw_path *)nw_path_evaluator_copy_path(evaluator_for_endpoint);
    v5 = v4;
    if (!v4)
    {
      id v10 = sub_1000233A4();
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No path for network state", v16, 2u);
      }

      v9 = 0LL;
      goto LABEL_20;
    }

    if (nw_path_get_status(v4) == nw_path_status_satisfied)
    {
      v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      if (nw_path_uses_interface_type(v5, nw_interface_type_wifi))
      {
        v7 = @"Wi-Fi";
      }

      else if (nw_path_uses_interface_type(v5, nw_interface_type_cellular))
      {
        v7 = @"Cell";
      }

      else if (nw_path_uses_interface_type(v5, nw_interface_type_wired))
      {
        v7 = @"Wired";
      }

      else
      {
        v7 = @"Other";
      }

      -[os_log_s setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v7, @"Primary");
      uint64_t interface_time_delta = nw_path_get_interface_time_delta(v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  interface_time_delta));
      -[os_log_s setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v12, @"SecondsSincePrimary");

      id v13 = sub_1000233A4();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_10002C228(v6, interface_time_delta, v14);
      }

      v17 = @"NetworkState";
      v18 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
LABEL_20:

      goto LABEL_21;
    }
  }

  else
  {
    id v8 = sub_1000233A4();
    v5 = (nw_path *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No evaluator for network state", v16, 2u);
    }
  }

  v9 = 0LL;
LABEL_21:

  return v9;
}

@end