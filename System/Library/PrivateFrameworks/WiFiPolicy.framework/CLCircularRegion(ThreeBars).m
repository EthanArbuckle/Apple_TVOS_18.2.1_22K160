@interface CLCircularRegion(ThreeBars)
- ($E54C41633987DD58ECC313D6426DD476)boundingBox;
- (double)longitude;
- (id)searchPredicateWithLatitudeKey:()ThreeBars longitudeKey:;
@end

@implementation CLCircularRegion(ThreeBars)

- (double)longitude
{
  return v2;
}

- ($E54C41633987DD58ECC313D6426DD476)boundingBox
{
  double v6 = v5 * 0.0174532925;
  double v7 = cos(v6 + v6) * -559.82 + 111132.92;
  double v8 = v7 + cos(v6 * 4.0) * 1.175;
  double v9 = v8 + cos(v6 * 6.0) * -0.0023;
  double v10 = cos(v6);
  double v11 = cos(v6 * 3.0) * -93.5 + v10 * 111412.84;
  double v12 = v11 + cos(v6 * 5.0) * 0.118;
  [a2 radius];
  double v14 = (v13 + v13) / v9;
  [a2 radius];
  double v16 = (v15 + v15) / v12;
  [a2 center];
  double v17 = v14 * 0.5;
  CLLocationDegrees v19 = v18 - v17;
  [a2 center];
  CLLocationDegrees v21 = v20 + v17;
  [a2 center];
  double v22 = v16 * 0.5;
  CLLocationDegrees v24 = v23 - v16 * 0.5;
  [a2 center];
  CLLocationDegrees v26 = v25 + v22;
  retstr->var1 = CLLocationCoordinate2DMake(v21, v26);
  retstr->var3 = CLLocationCoordinate2DMake(v19, v26);
  retstr->var0 = CLLocationCoordinate2DMake(v21, v24);
  retstr->var2 = CLLocationCoordinate2DMake(v19, v24);
  return result;
}

- (id)searchPredicateWithLatitudeKey:()ThreeBars longitudeKey:
{
  id v6 = a4;
  id v7 = a3;
  [a1 boundingBox];
  double v8 = (void *)NSString;
  [MEMORY[0x189607968] numberWithDouble:v18];
  double v9 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithDouble:v16];
  double v10 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithDouble:v17];
  double v11 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithDouble:v19];
  double v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 stringWithFormat:@"%@ >= %@ && %@ <= %@ && %@ >= %@ && %@ <= %@", v7, v9, v7, v10, v6, v11, v6, v12];
  double v13 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896079C8] predicateWithFormat:v13];
  double v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end