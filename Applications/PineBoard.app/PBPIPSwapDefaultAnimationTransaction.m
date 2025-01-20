@interface PBPIPSwapDefaultAnimationTransaction
- (id)_destinationFullscreenAnimationGroup;
- (id)_destinationPIPFrontPortalAnimationGroup;
- (id)_destinationPIPRearAnimationGroup;
- (void)_addDestinationFullscreenAnimationTransactionsForView:(id)a3;
- (void)_addDestinationPIPAnimationTransactionsForFrontView:(id)a3;
- (void)_addDestinationPIPAnimationTransactionsForRearView:(id)a3;
- (void)_begin;
@end

@implementation PBPIPSwapDefaultAnimationTransaction

- (void)_begin
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBPIPSwapDefaultAnimationTransaction;
  -[PBPIPSwapAnimationBaseTransaction _begin](&v7, "_begin");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPSwapAnimationBaseTransaction containerView](self, "containerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPSwapAnimationBaseTransaction currentPIPPortalView](self, "currentPIPPortalView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPSwapAnimationBaseTransaction currentFullscreenPortalView](self, "currentFullscreenPortalView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPSwapAnimationBaseTransaction destinationPIPPortalView](self, "destinationPIPPortalView"));
  [v3 addSubview:v5];
  [v3 addSubview:v4];
  [v3 addSubview:v6];
  -[PBPIPSwapDefaultAnimationTransaction _addDestinationFullscreenAnimationTransactionsForView:]( self,  "_addDestinationFullscreenAnimationTransactionsForView:",  v4);
  -[PBPIPSwapDefaultAnimationTransaction _addDestinationPIPAnimationTransactionsForRearView:]( self,  "_addDestinationPIPAnimationTransactionsForRearView:",  v5);
  -[PBPIPSwapDefaultAnimationTransaction _addDestinationPIPAnimationTransactionsForFrontView:]( self,  "_addDestinationPIPAnimationTransactionsForFrontView:",  v6);
}

- (id)_destinationFullscreenAnimationGroup
{
  double v4 = v3;
  id v5 = -[PBPIPSwapAnimationBaseTransaction destinationFullscreenFrame](self, "destinationFullscreenFrame");
  double Center = UIRectGetCenter(v5, v6, v7, v8, v9);
  double v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPSwapAnimationBaseTransaction destinationFullscreenLayout](self, "destinationFullscreenLayout"));
  [v13 preferredIntrinsicSize];
  double v15 = v14;
  double v17 = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPSwapAnimationBaseTransaction destinationFullscreenLayout](self, "destinationFullscreenLayout"));
  [v18 preferredPictureInPictureInstrisicContentSize];
  double v20 = v19;
  double v22 = v21;

  id v23 = [(id)objc_opt_class(self) _springAnimationForCornerRadius];
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v4));
  [v24 setFromValue:v25];

  id v26 = [(id)objc_opt_class(self) _springAnimationForPositionX];
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", Center));
  [v27 setToValue:v28];

  id v29 = [(id)objc_opt_class(self) _springAnimationForPositionY];
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v12));
  [v30 setToValue:v31];

  id v32 = [(id)objc_opt_class(self) _springAnimationForScaleX];
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v15 / v20));
  [v33 setToValue:v34];

  id v35 = [(id)objc_opt_class(self) _springAnimationForScaleY];
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v17 / v22));
  [v36 setToValue:v37];

  [v30 setBeginTime:0.15];
  [v33 setBeginTime:0.15];
  [v36 setBeginTime:0.15];
  v38 = (void *)objc_opt_class(self);
  v42[0] = v24;
  v42[1] = v27;
  v42[2] = v30;
  v42[3] = v33;
  v42[4] = v36;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v42, 5LL));
  v40 = (void *)objc_claimAutoreleasedReturnValue([v38 _animationGroupWithAnimations:v39]);

  return v40;
}

- (id)_destinationPIPRearAnimationGroup
{
  double v4 = v3;
  id v5 = -[PBPIPSwapAnimationBaseTransaction destinationPIPFrame](self, "destinationPIPFrame");
  double Center = UIRectGetCenter(v5, v6, v7, v8, v9);
  double v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPSwapAnimationBaseTransaction destinationPIPLayout](self, "destinationPIPLayout"));
  [v13 preferredIntrinsicSize];
  double v15 = v14;
  double v17 = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPSwapAnimationBaseTransaction destinationPIPLayout](self, "destinationPIPLayout"));
  [v18 preferredPictureInPictureInstrisicContentSize];
  double v20 = v19;
  double v22 = v21;

  id v23 = [(id)objc_opt_class(self) _springAnimationForCornerRadius];
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v4));
  [v24 setToValue:v25];

  id v26 = [(id)objc_opt_class(self) _springAnimationForPositionX];
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", Center));
  [v27 setToValue:v28];

  id v29 = [(id)objc_opt_class(self) _springAnimationForPositionY];
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v12));
  [v30 setToValue:v31];

  id v32 = [(id)objc_opt_class(self) _springAnimationForScaleX];
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v20 / v15));
  [v33 setToValue:v34];

  id v35 = [(id)objc_opt_class(self) _springAnimationForScaleY];
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v22 / v17));
  [v36 setToValue:v37];

  [v30 setBeginTime:0.15];
  v38 = (void *)objc_opt_class(self);
  v42[0] = v24;
  v42[1] = v27;
  v42[2] = v30;
  v42[3] = v33;
  v42[4] = v36;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v42, 5LL));
  v40 = (void *)objc_claimAutoreleasedReturnValue([v38 _animationGroupWithAnimations:v39]);

  return v40;
}

- (id)_destinationPIPFrontPortalAnimationGroup
{
  double v56 = v3;
  -[PBPIPSwapAnimationBaseTransaction destinationFullscreenFrame](self, "destinationFullscreenFrame");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPSwapAnimationBaseTransaction destinationPIPLayout](self, "destinationPIPLayout"));
  [v12 preferredFullscreenSize];
  double v54 = v14;
  double v55 = v13;

  id v15 = -[PBPIPSwapAnimationBaseTransaction destinationPIPFrame](self, "destinationPIPFrame");
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double Center = UIRectGetCenter(v15, v5, v7, v9, v11);
  double v26 = v25;
  double v28 = UIRectGetCenter(v27, v17, v19, v21, v23);
  double v30 = v29;
  id v31 = [(id)objc_opt_class(self) _cubicAnimationForOpacity];
  id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  [v32 setFromValue:&off_1003FEB70];
  id v33 = [(id)objc_opt_class(self) _springAnimationForCornerRadius];
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v56));
  [v34 setToValue:v35];

  id v36 = [(id)objc_opt_class(self) _springAnimationForPositionX];
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", Center));
  [v37 setFromValue:v38];

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v28));
  [v37 setToValue:v39];

  id v40 = [(id)objc_opt_class(self) _springAnimationForPositionY];
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v26));
  [v41 setFromValue:v42];

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v30));
  [v41 setToValue:v43];

  id v44 = [(id)objc_opt_class(self) _springAnimationForScaleX];
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v55 / v21));
  [v45 setFromValue:v46];

  id v47 = [(id)objc_opt_class(self) _springAnimationForScaleY];
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v54 / v23));
  [v48 setFromValue:v49];

  [v32 setBeginTime:0.05];
  [v41 setBeginTime:0.15];
  v50 = (void *)objc_opt_class(self);
  v57[0] = v32;
  v57[1] = v34;
  v57[2] = v37;
  v57[3] = v41;
  v57[4] = v45;
  v57[5] = v48;
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v57, 6LL));
  v52 = (void *)objc_claimAutoreleasedReturnValue([v50 _animationGroupWithAnimations:v51]);

  return v52;
}

- (void)_addDestinationFullscreenAnimationTransactionsForView:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue([a3 layer]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPSwapDefaultAnimationTransaction _destinationFullscreenAnimationGroup]( self,  "_destinationFullscreenAnimationGroup"));
  double v6 = -[PBUICAAnimationTransaction initWithLayer:animation:name:]( objc_alloc(&OBJC_CLASS___PBUICAAnimationTransaction),  "initWithLayer:animation:name:",  v4,  v5,  @"PIP swap pip");
  -[PBPIPSwapDefaultAnimationTransaction addChildTransaction:](self, "addChildTransaction:", v6);
}

- (void)_addDestinationPIPAnimationTransactionsForRearView:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue([a3 layer]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPSwapDefaultAnimationTransaction _destinationPIPRearAnimationGroup]( self,  "_destinationPIPRearAnimationGroup"));
  double v6 = -[PBUICAAnimationTransaction initWithLayer:animation:name:]( objc_alloc(&OBJC_CLASS___PBUICAAnimationTransaction),  "initWithLayer:animation:name:",  v4,  v5,  @"PIP swap fullscreen front");
  -[PBPIPSwapDefaultAnimationTransaction addChildTransaction:](self, "addChildTransaction:", v6);
}

- (void)_addDestinationPIPAnimationTransactionsForFrontView:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 layer]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPSwapDefaultAnimationTransaction _destinationPIPFrontPortalAnimationGroup]( self,  "_destinationPIPFrontPortalAnimationGroup"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPSwapAnimationBaseTransaction destinationPIPLayout](self, "destinationPIPLayout"));
  [v7 preferredPictureInPictureInstrisicContentSize];
  double v9 = v8;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPSwapAnimationBaseTransaction destinationPIPLayout](self, "destinationPIPLayout"));
  [v10 preferredPictureInPictureSize];
  double v12 = v11;

  if (v9 < v12)
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    [v4 setBackgroundColor:v13];
  }

  double v14 = -[PBUICAAnimationTransaction initWithLayer:animation:name:]( objc_alloc(&OBJC_CLASS___PBUICAAnimationTransaction),  "initWithLayer:animation:name:",  v5,  v6,  @"PIP swap fullscreen back");
  -[PBPIPSwapDefaultAnimationTransaction addChildTransaction:](self, "addChildTransaction:", v14);
}

@end