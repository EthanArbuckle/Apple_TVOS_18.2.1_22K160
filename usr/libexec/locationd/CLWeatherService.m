@interface CLWeatherService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLWeatherService)init;
- (NSMutableSet)clients;
- (void)dealloc;
- (void)localLocationForecastUpdatedForConditions:(id)a3;
- (void)registerForWeatherUpdates:(id)a3;
- (void)setClients:(id)a3;
- (void)unregisterForWeatherUpdates:(id)a3;
- (void)weatherForecastUpdated:(id)a3 airQualityConditions:(id)a4 hourlyForecasts:(id)a5 dailyForecasts:(id)a6 location:(id)a7;
@end

@implementation CLWeatherService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101999F50 != -1) {
    dispatch_once(&qword_101999F50, &stru_101867AB8);
  }
  return (id)qword_101999F48;
}

- (CLWeatherService)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLWeatherService;
  v2 = -[CLWeatherService initWithInboundProtocol:outboundProtocol:]( &v4,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLWeatherServiceProtocol,  &OBJC_PROTOCOL___CLWeatherServiceClientProtocol);
  if (v2) {
    -[CLWeatherService setClients:](v2, "setClients:", objc_opt_new(&OBJC_CLASS___NSMutableSet));
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLWeatherService;
  -[CLWeatherService dealloc](&v3, "dealloc");
}

+ (BOOL)isSupported
{
  return 0;
}

- (void)registerForWeatherUpdates:(id)a3
{
}

- (void)unregisterForWeatherUpdates:(id)a3
{
}

- (void)weatherForecastUpdated:(id)a3 airQualityConditions:(id)a4 hourlyForecasts:(id)a5 dailyForecasts:(id)a6 location:(id)a7
{
}

- (void)localLocationForecastUpdatedForConditions:(id)a3
{
  if (!a3)
  {
    if (qword_1019344B0 != -1) {
      dispatch_once(&qword_1019344B0, &stru_101867AD8);
    }
    v12 = (os_log_s *)qword_1019344B8;
    if (os_log_type_enabled((os_log_t)qword_1019344B8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "received weather update with nil weather conditions",  buf,  2u);
    }

    if (!sub_1002921D0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019344B0 != -1) {
      dispatch_once(&qword_1019344B0, &stru_101867AD8);
    }
    LOWORD(v66) = 0;
    double v14 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344B8,  16LL,  "received weather update with nil weather conditions",  &v66,  2);
    goto LABEL_22;
  }

  id v5 = [a3 objectForKeyedSubscript:@"CLWeatherDate"];
  if (!v5)
  {
    if (qword_1019344B0 != -1) {
      dispatch_once(&qword_1019344B0, &stru_101867AD8);
    }
    v15 = (os_log_s *)qword_1019344B8;
    if (os_log_type_enabled((os_log_t)qword_1019344B8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "received weather update with nil date",  buf,  2u);
    }

    if (!sub_1002921D0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019344B0 != -1) {
      dispatch_once(&qword_1019344B0, &stru_101867AD8);
    }
    LOWORD(v66) = 0;
    double v14 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344B8,  16LL,  "received weather update with nil date",  &v66,  2);
LABEL_22:
    v16 = v13;
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLWeatherService localLocationForecastUpdatedForConditions:]", "%s\n", v14);
LABEL_23:
    if (v16 != buf) {
      free(v16);
    }
    return;
  }

  v6 = v5;
  id v7 = [a3 objectForKeyedSubscript:@"CLWeatherPressurePascal"];
  id v8 = v7;
  if (v7)
  {
    [v7 floatValue];
    float v10 = v9;
    if (sub_100F5A080())
    {
      uint64_t v11 = sub_100F5A080();
      sub_100F5DB94(v11, v10);
    }
  }

  else
  {
    float v10 = -1.0;
  }

  id v17 = [a3 objectForKeyedSubscript:@"CLWeatherPrecipitationType"];
  if (v17) {
    v18 = +[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v17);
  }
  else {
    v18 = @"Null";
  }
  id v19 = [a3 objectForKeyedSubscript:@"CLWeatherTemperatureCelsius"];
  id v20 = v19;
  if (v19)
  {
    [v19 floatValue];
    int v22 = v21;
  }

  else
  {
    int v22 = -8388609;
  }

  id v23 = [a3 objectForKeyedSubscript:@"CLWeatherFeelsLikeTemperatureCelsius"];
  if (v23)
  {
    [v23 floatValue];
    int v25 = v24;
LABEL_34:
    v26 = objc_opt_new(&OBJC_CLASS___CLWeatherServiceData);
    [v6 timeIntervalSinceReferenceDate];
    -[CLWeatherServiceData setTimestamp:](v26, "setTimestamp:");
    *(float *)&double v27 = v10;
    -[CLWeatherServiceData setWeatherPressure:](v26, "setWeatherPressure:", v27);
    -[CLWeatherServiceData setPrecipitationType:]( v26,  "setPrecipitationType:",  +[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v18));
    LODWORD(v28) = v22;
    -[CLWeatherServiceData setTemperature:](v26, "setTemperature:", v28);
    LODWORD(v29) = v25;
    -[CLWeatherServiceData setFeelsLikeTemperature:](v26, "setFeelsLikeTemperature:", v29);
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    v30 = -[CLWeatherService clients](self, "clients");
    id v31 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v62,  v78,  16LL);
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v63;
      do
      {
        for (i = 0LL; i != v32; i = (char *)i + 1)
        {
          if (*(void *)v63 != v33) {
            objc_enumerationMutation(v30);
          }
          [*(id *)(*((void *)&v62 + 1) + 8 * (void)i) didUpdateWeather:v26];
        }

        id v32 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v62,  v78,  16LL);
      }

      while (v32);
    }

    if (qword_1019344B0 != -1) {
      dispatch_once(&qword_1019344B0, &stru_101867AD8);
    }
    v35 = (os_log_s *)qword_1019344B8;
    if (os_log_type_enabled((os_log_t)qword_1019344B8, OS_LOG_TYPE_INFO))
    {
      -[CLWeatherServiceData timestamp](v26, "timestamp");
      uint64_t v37 = v36;
      -[CLWeatherServiceData weatherPressure](v26, "weatherPressure");
      double v39 = v38;
      v40 = -[CLWeatherServiceData precipitationType](v26, "precipitationType");
      -[CLWeatherServiceData temperature](v26, "temperature");
      double v42 = v41;
      -[CLWeatherServiceData feelsLikeTemperature](v26, "feelsLikeTemperature");
      *(_DWORD *)buf = 138544642;
      v80 = v6;
      __int16 v81 = 2050;
      uint64_t v82 = v37;
      __int16 v83 = 2048;
      double v84 = v39;
      __int16 v85 = 2112;
      v86 = v40;
      __int16 v87 = 2048;
      double v88 = v42;
      __int16 v89 = 2048;
      double v90 = v43;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "Notified weather update for local location, date, %{public}@, timestamp, %{public}f, pressure(Pa), %.8f, precipi tationType, %@, temperature(C), %f, feelsLikeTemperature(C), %f",  buf,  0x3Eu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019344B0 != -1) {
        dispatch_once(&qword_1019344B0, &stru_101867AD8);
      }
      uint64_t v49 = qword_1019344B8;
      -[CLWeatherServiceData timestamp](v26, "timestamp");
      uint64_t v51 = v50;
      -[CLWeatherServiceData weatherPressure](v26, "weatherPressure");
      double v53 = v52;
      v54 = -[CLWeatherServiceData precipitationType](v26, "precipitationType");
      -[CLWeatherServiceData temperature](v26, "temperature");
      double v56 = v55;
      -[CLWeatherServiceData feelsLikeTemperature](v26, "feelsLikeTemperature");
      int v66 = 138544642;
      v67 = v6;
      __int16 v68 = 2050;
      uint64_t v69 = v51;
      __int16 v70 = 2048;
      double v71 = v53;
      __int16 v72 = 2112;
      v73 = v54;
      __int16 v74 = 2048;
      double v75 = v56;
      __int16 v76 = 2048;
      double v77 = v57;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v49,  1LL,  "Notified weather update for local location, date, %{public}@, timestamp, %{public}f, pressure(Pa), %.8f, precipi tationType, %@, temperature(C), %f, feelsLikeTemperature(C), %f",  &v66,  62);
      v59 = (uint8_t *)v58;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWeatherService localLocationForecastUpdatedForConditions:]",  "%s\n",  v58);
      if (v59 != buf) {
        free(v59);
      }
    }

    if (v8)
    {
      if (sub_10081C7A0())
      {
        uint64_t v44 = sub_10081C7A0();
        -[CLWeatherServiceData timestamp](v26, "timestamp");
        double v46 = v45;
        -[CLWeatherServiceData weatherPressure](v26, "weatherPressure");
        sub_10081CA5C(v44, v46, v47);
      }
    }

    return;
  }

  int v25 = -8388609;
  if (v8 || v17 || v20) {
    goto LABEL_34;
  }
  if (qword_1019344B0 != -1) {
    dispatch_once(&qword_1019344B0, &stru_101867AD8);
  }
  v48 = (os_log_s *)qword_1019344B8;
  if (os_log_type_enabled((os_log_t)qword_1019344B8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_INFO,  "received weather update with all nil fields of interest",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019344B0 != -1) {
      dispatch_once(&qword_1019344B0, &stru_101867AD8);
    }
    LOWORD(v66) = 0;
    double v60 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344B8,  1LL,  "received weather update with all nil fields of interest",  &v66,  2);
    v16 = v61;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWeatherService localLocationForecastUpdatedForConditions:]", "%s\n", v60);
    goto LABEL_23;
  }

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

@end