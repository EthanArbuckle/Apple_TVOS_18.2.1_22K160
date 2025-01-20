@interface CLVisit
+ (id)_visitWithVisit:(id)a3 authDate:(id)a4;
- (CLVisit)initWithVisit:(id)a3;
@end

@implementation CLVisit

- (CLVisit)initWithVisit:(id)a3
{
  if (a3)
  {
    objc_msgSend(objc_msgSend(a3, "location"), "latitude");
    CLLocationDegrees v6 = v5;
    objc_msgSend(objc_msgSend(a3, "location"), "longitude");
    CLLocationCoordinate2D v8 = CLLocationCoordinate2DMake(v6, v7);
    if ([a3 placeInference]) {
      id v9 =  objc_msgSend( [_CLPlaceInference alloc],  "_initWithRTPlaceInference:",  objc_msgSend(a3, "placeInference"));
    }
    else {
      id v9 = 0LL;
    }
    objc_msgSend(objc_msgSend(a3, "location"), "horizontalUncertainty");
    return -[CLVisit initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:placeInference:]( self,  "initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:placeInference:",  [a3 entry],  objc_msgSend(a3, "exit"),  objc_msgSend(a3, "date"),  v9,  v8.latitude,  v8.longitude,  v11);
  }

  else
  {

    return 0LL;
  }

+ (id)_visitWithVisit:(id)a3 authDate:(id)a4
{
  if (a4)
  {
    if (objc_msgSend(objc_msgSend(a3, "departureDate"), "compare:", objc_msgSend(a3, "arrivalDate")) == (id)-1)
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101892D38);
      }
      v17 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
      {
        int v19 = 68289283;
        int v20 = 0;
        __int16 v21 = 2082;
        v22 = "";
        __int16 v23 = 2113;
        id v24 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#slv Malformed visit, visit:%{private, location:escape_only}@}",  (uint8_t *)&v19,  0x1Cu);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_101892D38);
        }
      }

      v18 = (os_log_s *)qword_101934988;
      if (os_signpost_enabled((os_log_t)qword_101934988))
      {
        int v19 = 68289283;
        int v20 = 0;
        __int16 v21 = 2082;
        v22 = "";
        __int16 v23 = 2113;
        id v24 = a3;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#slv Malformed visit",  "{msg%{public}.0s:#slv Malformed visit, visit:%{private, location:escape_only}@}",  (uint8_t *)&v19,  0x1Cu);
      }
    }

    else
    {
      id v6 = objc_msgSend(a4, "compare:", objc_msgSend(a3, "departureDate"));
      id v7 = objc_msgSend(a4, "compare:", objc_msgSend(a3, "arrivalDate"));
      unint64_t v8 = 0LL;
      unint64_t v9 = 0LL;
      if ([a3 hasDepartureDate])
      {
        if (v6 == (id)-1LL) {
          unint64_t v9 = (unint64_t)[a3 departureDate];
        }
      }

      if (v8 | v9)
      {
        v10 = objc_alloc(&OBJC_CLASS___CLVisit);
        [a3 coordinate];
        double v12 = v11;
        double v14 = v13;
        [a3 horizontalAccuracy];
        return  -[CLVisit initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:placeInference:]( v10,  "initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:placeInference:",  v8,  v9,  [a3 detectionDate],  objc_msgSend(a3, "_placeInference"),  v12,  v14,  v15);
      }
    }
  }

  return 0LL;
}

@end