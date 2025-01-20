@interface MRDIRInteractiveRouteRecommendation
+ (id)interactiveRecommendationWithRouteRecommendation:(id)a3;
- (NSString)description;
- (int64_t)recommendationType;
- (void)setRecommendationType:(int64_t)a3;
@end

@implementation MRDIRInteractiveRouteRecommendation

+ (id)interactiveRecommendationWithRouteRecommendation:(id)a3
{
  id v3 = a3;
  if ((uint64_t)[v3 classification] > 2 || objc_msgSend(v3, "isCallToAction"))
  {
    v4 = objc_opt_new(&OBJC_CLASS___MRDIRInteractiveRouteRecommendation);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 route]);
    -[MRDIRRouteRecommendation setRoute:](v4, "setRoute:", v5);

    -[MRDIRRouteRecommendation setClassification:](v4, "setClassification:", [v3 classification]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 contextIdentifier]);
    -[MRDIRRouteRecommendation setContextIdentifier:](v4, "setContextIdentifier:", v6);

    -[MRDIRRouteRecommendation setCallToAction:](v4, "setCallToAction:", [v3 isCallToAction]);
    -[MRDIRRouteRecommendation setLockScreenControl:]( v4,  "setLockScreenControl:",  [v3 isLockScreenControl]);
    -[MRDIRRouteRecommendation setConservativelyFiltered:]( v4,  "setConservativelyFiltered:",  [v3 isConservativelyFiltered]);
    if ([v3 classification] == (id)3)
    {
      uint64_t v7 = 0LL;
    }

    else if ([v3 classification] == (id)4)
    {
      uint64_t v7 = 1LL;
    }

    else
    {
      if (([v3 isCallToAction] & 1) == 0)
      {
        uint64_t v11 = _MRLogForCategory(13LL, v9);
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138412290;
          id v14 = v3;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].IRD Invalid interactive recommendation: %@ - ignoring;",
            (uint8_t *)&v13,
            0xCu);
        }

        v8 = 0LL;
        goto LABEL_11;
      }

      uint64_t v7 = 2LL;
    }

    -[MRDIRInteractiveRouteRecommendation setRecommendationType:](v4, "setRecommendationType:", v7);
    v8 = v4;
LABEL_11:

    goto LABEL_12;
  }

  v8 = 0LL;
LABEL_12:

  return v8;
}

- (NSString)description
{
  id v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@ (%p): ", v6, self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIRRouteRecommendation route](self, "route"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 routeIdentifier]);
  -[NSMutableString appendFormat:](v7, "appendFormat:", @"routeIdentifier: %@", v9);

  int64_t v10 = -[MRDIRRouteRecommendation classification](self, "classification");
  else {
    uint64_t v11 = *(&off_10039E628 + v10 - 1);
  }
  -[NSMutableString appendFormat:](v7, "appendFormat:", @", classification: %@", v11);
  int64_t v12 = -[MRDIRInteractiveRouteRecommendation recommendationType](self, "recommendationType");
  else {
    int v13 = *(&off_10039E648 + v12 - 1);
  }
  -[NSMutableString appendFormat:](v7, "appendFormat:", @", recommendationType: %@", v13);
  if (-[MRDIRRouteRecommendation isLockScreenControl](self, "isLockScreenControl")) {
    -[NSMutableString appendString:](v7, "appendString:", @", LockScreen");
  }
  if (-[MRDIRRouteRecommendation isConservativelyFiltered](self, "isConservativelyFiltered")) {
    -[NSMutableString appendString:](v7, "appendString:", @", ConservativelyFiltered");
  }
  -[NSMutableString appendString:](v7, "appendString:", @">");
  return (NSString *)v7;
}

- (int64_t)recommendationType
{
  return self->_recommendationType;
}

- (void)setRecommendationType:(int64_t)a3
{
  self->_recommendationType = a3;
}

@end