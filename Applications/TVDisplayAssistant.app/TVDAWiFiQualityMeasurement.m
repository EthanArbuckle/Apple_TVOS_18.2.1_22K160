@interface TVDAWiFiQualityMeasurement
+ (unint64_t)resultFromMeasurements:(id)a3;
- (NSString)measurementTitle;
- (NSString)measurementType;
- (TVDAWiFiQualityMeasurement)init;
- (TVDAWiFiQualityMeasurement)initWithMeasurementType:(id)a3;
- (void)measureWithCompletion:(id)a3;
@end

@implementation TVDAWiFiQualityMeasurement

+ (unint64_t)resultFromMeasurements:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = [location[0] objectForKeyedSubscript:@"TVDANetworkMeasurementTypeBase"];
  id v13 = [location[0] objectForKeyedSubscript:@"TVDANetworkMeasurementTypeIdeal"];
  id v12 = [location[0] objectForKeyedSubscript:@"TVDANetworkMeasurementTypeFinal"];
  unint64_t v11 = 4LL;
  if (v12 && v13)
  {
    unint64_t v11 = (unint64_t)+[TVSWiFiQualityMeasurement compareIdeal:withActual:]( &OBJC_CLASS___TVSWiFiQualityMeasurement,  "compareIdeal:withActual:",  v13,  v12);
  }

  else if (v14 && v13)
  {
    unint64_t v11 = (unint64_t)+[TVSWiFiQualityMeasurement compareIdeal:withActual:]( &OBJC_CLASS___TVSWiFiQualityMeasurement,  "compareIdeal:withActual:",  v13,  v14);
  }

  else
  {
    id v10 = sub_10001A69C();
    char v9 = 16;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v10;
      os_log_type_t type = v9;
      sub_100002910(v8);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "We have not gotten enough measurements yet we finished the DA flow!",  v8,  2u);
    }

    objc_storeStrong(&v10, 0LL);
  }

  os_log_t oslog = (os_log_t)sub_10001A69C();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10000E5BC((uint64_t)v16, v11);
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Result from measurements %{public}lu",  v16,  0xCu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  unint64_t v4 = v11;
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (TVDAWiFiQualityMeasurement)init
{
  unint64_t v4 = 0LL;
  unint64_t v4 = -[TVDAWiFiQualityMeasurement initWithMeasurementType:]( self,  "initWithMeasurementType:",  @"TVDANetworkMeasurementTypeBase");
  v3 = v4;
  objc_storeStrong((id *)&v4, 0LL);
  return v3;
}

- (TVDAWiFiQualityMeasurement)initWithMeasurementType:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___TVDAWiFiQualityMeasurement;
  v8 = -[TVDAWiFiQualityMeasurement init](&v6, "init");
  objc_storeStrong((id *)&v8, v8);
  if (v8)
  {
    objc_storeStrong((id *)&v8->_measurementTitle, location[0]);
    objc_storeStrong((id *)&v8->_measurementType, location[0]);
  }

  v5 = v8;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (void)measureWithCompletion:(id)a3
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = -[TVDAWiFiQualityMeasurement measurementType](v23, "measurementType");
  char v21 = -[NSString isEqualToString:](v3, "isEqualToString:", @"TVDANetworkMeasurementTypeIdeal");

  objc_initWeak(&v20, v23);
  id v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  id v13 = sub_10001BF04;
  id v14 = &unk_100029B10;
  v15 = v23;
  objc_copyWeak(&v17, &v20);
  id v16 = location[0];
  char v18 = v21 & 1;
  id v19 = objc_retainBlock(&v10);
  if ((v21 & 1) != 0)
  {
    unint64_t v4 = _NSConcreteStackBlock;
    int v5 = -1073741824;
    int v6 = 0;
    v7 = sub_10001C674;
    v8 = &unk_100029AC0;
    id v9 = v19;
    sub_10001C530(1LL, &v4);
    objc_storeStrong(&v9, 0LL);
  }

  else
  {
    (*((void (**)(void))v19 + 2))();
  }

  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_destroyWeak(&v17);
  objc_storeStrong((id *)&v15, 0LL);
  objc_destroyWeak(&v20);
  objc_storeStrong(location, 0LL);
}

- (NSString)measurementTitle
{
  return self->_measurementTitle;
}

- (NSString)measurementType
{
  return self->_measurementType;
}

- (void).cxx_destruct
{
}

@end