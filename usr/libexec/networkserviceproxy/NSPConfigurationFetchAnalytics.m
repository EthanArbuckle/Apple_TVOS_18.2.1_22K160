@interface NSPConfigurationFetchAnalytics
- (NSString)configFetchURL;
- (NSString)reason;
- (NSString)requestedServerUUID;
- (double)latency;
- (id)analyticsDict;
- (id)configFetchURLToIndex;
- (id)eventName;
- (int64_t)httpCode;
- (int64_t)nsurlErrorCode;
- (void)setConfigFetchURL:(id)a3;
- (void)setHttpCode:(int64_t)a3;
- (void)setLatency:(double)a3;
- (void)setNsurlErrorCode:(int64_t)a3;
- (void)setReason:(id)a3;
- (void)setRequestedServerUUID:(id)a3;
@end

@implementation NSPConfigurationFetchAnalytics

- (id)eventName
{
  return @"com.apple.nsp.configuration";
}

- (id)configFetchURLToIndex
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));

  if (v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
    unsigned __int8 v8 = [v7 isEqual:@"https://mask-api.icloud.com/v1/fetchConfigFile"];

    if ((v8 & 1) != 0)
    {
      return &off_100103410;
    }

    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
      unsigned __int8 v11 = [v10 isEqual:@"https://mask-api.icloud.com/v1_1/fetchConfigFile"];

      if ((v11 & 1) != 0)
      {
        return &off_100103428;
      }

      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
        unsigned __int8 v13 = [v12 isEqual:@"https://mask-api.icloud.com/v1_2/fetchConfigFile"];

        if ((v13 & 1) != 0)
        {
          return &off_100103440;
        }

        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
          unsigned __int8 v15 = [v14 isEqual:@"https://mask-api.icloud.com/v1_3/fetchConfigFile"];

          if ((v15 & 1) != 0)
          {
            return &off_100103458;
          }

          else
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
            unsigned __int8 v17 = [v16 isEqual:@"https://mask-api.icloud.com/v1_4/fetchConfigFile"];

            if ((v17 & 1) != 0)
            {
              return &off_100103470;
            }

            else
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
              unsigned __int8 v19 = [v18 isEqual:@"https://mask-api.icloud.com/v1_5/fetchConfigFile"];

              if ((v19 & 1) != 0)
              {
                return &off_100103488;
              }

              else
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                unsigned __int8 v21 = [v20 isEqual:@"https://mask-api.icloud.com/v1_6/fetchConfigFile"];

                if ((v21 & 1) != 0)
                {
                  return &off_1001034A0;
                }

                else
                {
                  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                  unsigned __int8 v23 = [v22 isEqual:@"https://mask-api.icloud.com/v2_0/fetchConfigFile"];

                  if ((v23 & 1) != 0)
                  {
                    return &off_1001034B8;
                  }

                  else
                  {
                    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                    unsigned __int8 v25 = [v24 isEqual:@"https://mask-api.icloud.com/v2_1/fetchConfigFile"];

                    if ((v25 & 1) != 0)
                    {
                      return &off_1001034D0;
                    }

                    else
                    {
                      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                      unsigned __int8 v27 = [v26 isEqual:@"https://mask-api.icloud.com/v2_2/fetchConfigFile"];

                      if ((v27 & 1) != 0)
                      {
                        return &off_1001034E8;
                      }

                      else
                      {
                        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                        unsigned __int8 v29 = [v28 isEqual:@"https://mask-api.icloud.com/v2_3/fetchConfigFile"];

                        if ((v29 & 1) != 0)
                        {
                          return &off_100103500;
                        }

                        else
                        {
                          v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                          unsigned __int8 v33 = [v32 isEqual:@"https://mask-api.icloud.com/v3_0/fetchConfigFile"];

                          if ((v33 & 1) != 0)
                          {
                            return &off_100103518;
                          }

                          else
                          {
                            v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                            unsigned __int8 v35 = [v34 isEqual:@"https://mask-api.icloud.com/v2_4/fetchConfigFile"];

                            if ((v35 & 1) != 0)
                            {
                              return &off_100103530;
                            }

                            else
                            {
                              v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                              unsigned __int8 v37 = [v36 isEqual:@"https://mask-api.icloud.com/v3_1/fetchConfigFile"];

                              if ((v37 & 1) != 0)
                              {
                                return &off_100103548;
                              }

                              else
                              {
                                v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURL](self, "configFetchURL"));
                                unsigned __int8 v39 = [v38 isEqual:@"https://mask-api.icloud.com/v3_2/fetchConfigFile"];

                                if ((v39 & 1) != 0)
                                {
                                  return &off_100103560;
                                }

                                else
                                {
                                  v40 = (void *)objc_claimAutoreleasedReturnValue( -[NSPConfigurationFetchAnalytics configFetchURL]( self,  "configFetchURL"));
                                  unsigned __int8 v41 = [v40 isEqual:@"https://mask-api.icloud.com/v3_3/fetchConfigFile"];

                                  if ((v41 & 1) != 0)
                                  {
                                    return &off_100103578;
                                  }

                                  else
                                  {
                                    v42 = (void *)objc_claimAutoreleasedReturnValue( -[NSPConfigurationFetchAnalytics configFetchURL]( self,  "configFetchURL"));
                                    unsigned __int8 v43 = [v42 isEqual:@"https://mask-api.icloud.com/v3_4/fetchConfigFile"];

                                    if ((v43 & 1) != 0)
                                    {
                                      return &off_100103590;
                                    }

                                    else
                                    {
                                      v44 = (void *)objc_claimAutoreleasedReturnValue( -[NSPConfigurationFetchAnalytics configFetchURL]( self,  "configFetchURL"));
                                      unsigned __int8 v45 = [v44 isEqual:@"https://mask-api.icloud.com/v3_5/fetchConfigFile"];

                                      if ((v45 & 1) != 0)
                                      {
                                        return &off_1001035A8;
                                      }

                                      else
                                      {
                                        v46 = (void *)objc_claimAutoreleasedReturnValue( -[NSPConfigurationFetchAnalytics configFetchURL]( self,  "configFetchURL"));
                                        unsigned __int8 v47 = [v46 isEqual:@"https://mask-api.icloud.com/v3_6/fetchConfigFile"];

                                        if ((v47 & 1) != 0)
                                        {
                                          return &off_1001035C0;
                                        }

                                        else
                                        {
                                          v48 = (void *)objc_claimAutoreleasedReturnValue( -[NSPConfigurationFetchAnalytics configFetchURL]( self,  "configFetchURL"));
                                          unsigned __int8 v49 = [v48 isEqual:@"https://mask-api.icloud.com/v4_0/fetchConfigFile"];

                                          if ((v49 & 1) != 0)
                                          {
                                            return &off_1001035D8;
                                          }

                                          else
                                          {
                                            v50 = (void *)objc_claimAutoreleasedReturnValue( -[NSPConfigurationFetchAnalytics configFetchURL]( self,  "configFetchURL"));
                                            unsigned __int8 v51 = [v50 isEqual:@"https://mask-api.icloud.com/v4_1/fetchConfigFile"];

                                            if ((v51 & 1) != 0)
                                            {
                                              return &off_1001035F0;
                                            }

                                            else
                                            {
                                              v52 = (void *)objc_claimAutoreleasedReturnValue( -[NSPConfigurationFetchAnalytics configFetchURL]( self,  "configFetchURL"));
                                              unsigned __int8 v53 = [v52 isEqual:@"https://mask-api.icloud.com/v4_2/fetchConfigFile"];

                                              if ((v53 & 1) != 0)
                                              {
                                                return &off_100103608;
                                              }

                                              else
                                              {
                                                v54 = (void *)objc_claimAutoreleasedReturnValue( -[NSPConfigurationFetchAnalytics configFetchURL]( self,  "configFetchURL"));
                                                unsigned __int8 v55 = [v54 isEqual:@"https://mask-api.icloud.com/v4_3/fetchConfigFile"];

                                                if ((v55 & 1) != 0)
                                                {
                                                  return &off_100103620;
                                                }

                                                else
                                                {
                                                  v56 = (void *)objc_claimAutoreleasedReturnValue( -[NSPConfigurationFetchAnalytics configFetchURL]( self,  "configFetchURL"));
                                                  unsigned int v57 = [v56 isEqual:@"https://mask-api.icloud.com/v4_4/fetchConfigFile"];

                                                  if (v57) {
                                                    return &off_100103638;
                                                  }
                                                  else {
                                                    return &off_100103650;
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  else
  {
    uint64_t v30 = nplog_obj(v4, v5, v6);
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    {
      int v58 = 136315138;
      v59 = "-[NSPConfigurationFetchAnalytics configFetchURLToIndex]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_FAULT,  "%s called with null self.configFetchURL",  (uint8_t *)&v58,  0xCu);
    }

    return 0LL;
  }

- (id)analyticsDict
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics configFetchURLToIndex](self, "configFetchURLToIndex"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v4,  @"ConfigurationFetchPath");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[NSPConfigurationFetchAnalytics httpCode](self, "httpCode")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"HTTPCode");

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[NSPConfigurationFetchAnalytics nsurlErrorCode](self, "nsurlErrorCode")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"NSURLErrorCode");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics requestedServerUUID](self, "requestedServerUUID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v7,  @"RequestedServerUUID");

  -[NSPConfigurationFetchAnalytics latency](self, "latency");
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, @"Latency");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationFetchAnalytics reason](self, "reason"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"Reason");

  return v3;
}

- (NSString)configFetchURL
{
  return self->_configFetchURL;
}

- (void)setConfigFetchURL:(id)a3
{
}

- (int64_t)httpCode
{
  return self->_httpCode;
}

- (void)setHttpCode:(int64_t)a3
{
  self->_httpCode = a3;
}

- (int64_t)nsurlErrorCode
{
  return self->_nsurlErrorCode;
}

- (void)setNsurlErrorCode:(int64_t)a3
{
  self->_nsurlErrorCode = a3;
}

- (NSString)requestedServerUUID
{
  return self->_requestedServerUUID;
}

- (void)setRequestedServerUUID:(id)a3
{
}

- (double)latency
{
  return self->_latency;
}

- (void)setLatency:(double)a3
{
  self->_latency = a3;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  self->_reason = (NSString *)a3;
}

- (void).cxx_destruct
{
}

@end