@interface MRDIRRouteRecommendation
+ (id)recommendationWithIRCandidateResult:(id)a3 contextIdentifier:(id)a4;
- (BOOL)isCallToAction;
- (BOOL)isConservativelyFiltered;
- (BOOL)isLockScreenControl;
- (MRRouteRepresentable)route;
- (NSNumber)sortingHint;
- (NSString)contextIdentifier;
- (NSString)description;
- (int64_t)classification;
- (void)setCallToAction:(BOOL)a3;
- (void)setClassification:(int64_t)a3;
- (void)setConservativelyFiltered:(BOOL)a3;
- (void)setContextIdentifier:(id)a3;
- (void)setLockScreenControl:(BOOL)a3;
- (void)setRoute:(id)a3;
- (void)setSortingHint:(id)a3;
@end

@implementation MRDIRRouteRecommendation

+ (id)recommendationWithIRCandidateResult:(id)a3 contextIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___MRDIRRouteRecommendation);
  -[MRDIRRouteRecommendation setClassification:](v7, "setClassification:", [v6 classification]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 sortingHint]);
  -[MRDIRRouteRecommendation setSortingHint:](v7, "setSortingHint:", v8);

  -[MRDIRRouteRecommendation setCallToAction:](v7, "setCallToAction:", [v6 isCallToAction]);
  -[MRDIRRouteRecommendation setLockScreenControl:]( v7,  "setLockScreenControl:",  [v6 isLockScreenControl]);
  -[MRDIRRouteRecommendation setConservativelyFiltered:]( v7,  "setConservativelyFiltered:",  [v6 isConservativeFiltered]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 candidate]);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MRIRRoute routeWithCandidate:](&OBJC_CLASS___MRIRRoute, "routeWithCandidate:", v9));
  -[MRDIRRouteRecommendation setRoute:](v7, "setRoute:", v10);

  -[MRDIRRouteRecommendation setContextIdentifier:](v7, "setContextIdentifier:", v5);
  return v7;
}

- (NSString)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v4 = (objc_class *)objc_opt_class(self);
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@ (%p): ", v6, self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIRRouteRecommendation route](self, "route"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 routeIdentifier]);
  -[NSMutableString appendFormat:](v7, "appendFormat:", @"routeIdentifier: %@", v9);

  int64_t v10 = -[MRDIRRouteRecommendation classification](self, "classification");
  else {
    v11 = *(&off_10039E628 + v10 - 1);
  }
  -[NSMutableString appendFormat:](v7, "appendFormat:", @", classification: %@", v11);
  if (-[MRDIRRouteRecommendation isCallToAction](self, "isCallToAction")) {
    -[NSMutableString appendString:](v7, "appendString:", @", CallToAction");
  }
  if (-[MRDIRRouteRecommendation isLockScreenControl](self, "isLockScreenControl")) {
    -[NSMutableString appendString:](v7, "appendString:", @", LockScreen");
  }
  if (-[MRDIRRouteRecommendation isConservativelyFiltered](self, "isConservativelyFiltered")) {
    -[NSMutableString appendString:](v7, "appendString:", @", ConservativelyFiltered");
  }
  -[NSMutableString appendString:](v7, "appendString:", @">");
  return (NSString *)v7;
}

- (int64_t)classification
{
  return self->_classification;
}

- (void)setClassification:(int64_t)a3
{
  self->_classification = a3;
}

- (NSNumber)sortingHint
{
  return self->_sortingHint;
}

- (void)setSortingHint:(id)a3
{
}

- (BOOL)isCallToAction
{
  return self->_callToAction;
}

- (void)setCallToAction:(BOOL)a3
{
  self->_callToAction = a3;
}

- (BOOL)isLockScreenControl
{
  return self->_lockScreenControl;
}

- (void)setLockScreenControl:(BOOL)a3
{
  self->_lockScreenControl = a3;
}

- (BOOL)isConservativelyFiltered
{
  return self->_conservativelyFiltered;
}

- (void)setConservativelyFiltered:(BOOL)a3
{
  self->_conservativelyFiltered = a3;
}

- (MRRouteRepresentable)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (void)setContextIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end