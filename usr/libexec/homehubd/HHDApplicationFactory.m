@interface HHDApplicationFactory
- (id)createApplicationsWithQueue:(id)a3;
@end

@implementation HHDApplicationFactory

- (id)createApplicationsWithQueue:(id)a3
{
  id v3 = a3;
  v4 = -[HHDClockApp initWithQueue:](objc_alloc(&OBJC_CLASS___HHDClockApp), "initWithQueue:", v3);
  v5 = -[HHDDoorbellApp initWithQueue:delegate:]( objc_alloc(&OBJC_CLASS___HHDDoorbellApp),  "initWithQueue:delegate:",  v3,  v4);
  id v6 = [[SIBSSiriApp alloc] initWithQueue:v3];
  v10[0] = v6;
  v10[1] = v4;
  v10[2] = v5;
  v7 = -[HHDIntercomApp initWithQueue:](objc_alloc(&OBJC_CLASS___HHDIntercomApp), "initWithQueue:", v3);

  v10[3] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 4LL));

  return v8;
}

@end