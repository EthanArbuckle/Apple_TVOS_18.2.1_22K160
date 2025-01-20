@interface AXPIFingerController
- (CGPoint)hndAbsoluteCentroidForMultifingers:(CGPoint)a3;
- (CGPoint)hndCentroidForPinchChainMidPoint:(CGPoint)a3;
- (CGPoint)hndConvertPointToFingerContainerView:(CGPoint)a3;
- (CGPoint)hndMenuPointForFingerLayout;
- (CGPoint)hndStandardCentroidForMultifingers:(CGPoint)a3;
@end

@implementation AXPIFingerController

- (CGPoint)hndConvertPointToFingerContainerView:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXPIFingerController fingerContainerView](self, "fingerContainerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 window]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 layer]);
  objc_msgSend(v7, "convertPoint:fromLayer:", 0, x, y);
  double v9 = v8;
  double v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue([v5 window]);
  objc_msgSend(v12, "convertPoint:toView:", v5, v9, v11);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (CGPoint)hndStandardCentroidForMultifingers:(CGPoint)a3
{
  double v5 = v4;
  double v7 = v6;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXPIFingerController fingerModels](self, "fingerModels"));
  double v9 = (char *)[v8 count];

  if ((unint64_t)(v9 - 3) < 2)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[AXPIFingerController fingerModels](self, "fingerModels"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectAtIndexedSubscript:0]);
    [v26 location];
    double v28 = v27;
    double v30 = v29;

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[AXPIFingerController fingerModels](self, "fingerModels"));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectAtIndexedSubscript:1]);
    [v32 location];
    double v34 = v33;
    double v36 = v35;

    double v5 = v5 - (v34 - v28);
    double v23 = v7 - (v36 - v30);
    double v24 = -60.0;
    goto LABEL_7;
  }

  if (v9 == (char *)5)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[AXPIFingerController fingerModels](self, "fingerModels"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v37 objectAtIndexedSubscript:0]);
    [v38 location];
    double v40 = v39;
    double v42 = v41;

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[AXPIFingerController fingerModels](self, "fingerModels"));
    v44 = (void *)objc_claimAutoreleasedReturnValue([v43 objectAtIndexedSubscript:3]);
    [v44 location];
    double v46 = v45;
    double v48 = v47;

    double v5 = v5 - (v46 - v40);
    double v23 = v7 - (v48 - v42);
    double v24 = -15.0;
    goto LABEL_7;
  }

  if (v9 == (char *)2)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXPIFingerController fingerModels](self, "fingerModels"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
    [v11 location];
    double v13 = v12;
    double v15 = v14;

    double v16 = (void *)objc_claimAutoreleasedReturnValue(-[AXPIFingerController fingerModels](self, "fingerModels"));
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndexedSubscript:1]);
    [v17 location];
    double v19 = v18;
    double v21 = v20;

    double v5 = v5 - (AX_CGPointGetMidpointToPoint(v13, v15, v19, v21) - v13);
    double v23 = v7 - (v22 - v15);
    double v24 = -35.0;
LABEL_7:
    double v7 = v23 + v24;
  }

  double v49 = v5;
  double v50 = v7;
  result.double y = v50;
  result.double x = v49;
  return result;
}

- (CGPoint)hndAbsoluteCentroidForMultifingers:(CGPoint)a3
{
  double v5 = v4;
  double v7 = v6;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXPIFingerController fingerModels](self, "fingerModels"));
  id v9 = [v8 count];

  if (v9)
  {
    -[AXPIFingerController midpointForFingers](self, "midpointForFingers");
    double v11 = v10;
    double v13 = v12;
    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[AXPIFingerController fingerModels](self, "fingerModels"));
    double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:0]);
    [v15 location];
    double v17 = v16;
    double v19 = v18;

    double v5 = v5 - (v11 - v17);
    double v7 = v7 - (v13 - v19);
  }

  double v20 = v5;
  double v21 = v7;
  result.double y = v21;
  result.double x = v20;
  return result;
}

- (CGPoint)hndCentroidForPinchChainMidPoint:(CGPoint)a3
{
  double v6 = v5;
  double v8 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXPIFingerController fingerModels](self, "fingerModels"));
  id v10 = [v9 count];

  if (v10 != (id)2)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v32 handleFailureInMethod:a2 object:self file:@"AXPIFingerController+HNDAdditions.m" lineNumber:108 description:@"Should have had two fingers when asking for pinch centroid."];
  }

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXPIFingerController fingerModels](self, "fingerModels"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:0]);
  [v12 location];
  double v14 = v13;
  double v16 = v15;

  double v17 = (void *)objc_claimAutoreleasedReturnValue(-[AXPIFingerController fingerModels](self, "fingerModels"));
  double v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:0]);
  [v18 location];
  double v20 = v19;
  double v22 = v21;
  double v23 = (void *)objc_claimAutoreleasedReturnValue(-[AXPIFingerController fingerModels](self, "fingerModels"));
  double v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:1]);
  [v24 location];
  double MidpointToPoint = AX_CGPointGetMidpointToPoint(v20, v22, v25, v26);
  double v29 = v28;

  double v30 = v6 - (MidpointToPoint - v14);
  double v31 = v8 - (v29 - v16);
  result.double y = v31;
  result.double x = v30;
  return result;
}

- (CGPoint)hndMenuPointForFingerLayout
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXPIFingerController fingerModels](self, "fingerModels"));
  id v4 = [v3 count];

  switch((unint64_t)v4)
  {
    case 1uLL:
      double v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXPIFingerController fingerModels](self, "fingerModels"));
      double v6 = v5;
      uint64_t v7 = 0LL;
      goto LABEL_5;
    case 2uLL:
      double v13 = (void *)objc_claimAutoreleasedReturnValue(-[AXPIFingerController fingerModels](self, "fingerModels"));
      double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:0]);
      [v14 location];
      double v16 = v15;
      double v18 = v17;

      double v19 = (void *)objc_claimAutoreleasedReturnValue(-[AXPIFingerController fingerModels](self, "fingerModels"));
      double v20 = v19;
      uint64_t v21 = 1LL;
      goto LABEL_8;
    case 3uLL:
    case 4uLL:
      double v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXPIFingerController fingerModels](self, "fingerModels"));
      double v6 = v5;
      uint64_t v7 = 1LL;
LABEL_5:
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:v7]);
      [v10 location];
      CGFloat MidpointToPoint = v11;
      CGFloat y = v12;

      break;
    case 5uLL:
      double v22 = (void *)objc_claimAutoreleasedReturnValue(-[AXPIFingerController fingerModels](self, "fingerModels"));
      double v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:0]);
      [v23 location];
      double v16 = v24;
      double v18 = v25;

      double v19 = (void *)objc_claimAutoreleasedReturnValue(-[AXPIFingerController fingerModels](self, "fingerModels"));
      double v20 = v19;
      uint64_t v21 = 3LL;
LABEL_8:
      double v26 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:v21]);
      [v26 location];
      double v28 = v27;
      double v30 = v29;

      CGFloat MidpointToPoint = AX_CGPointGetMidpointToPoint(v16, v18, v28, v30);
      CGFloat y = v31;
      break;
    default:
      CGFloat MidpointToPoint = CGPointZero.x;
      CGFloat y = CGPointZero.y;
      break;
  }

  double v32 = MidpointToPoint;
  double v33 = y;
  result.CGFloat y = v33;
  result.double x = v32;
  return result;
}

@end