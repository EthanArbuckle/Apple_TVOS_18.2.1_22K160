@interface NSExtension
+ (void)extensionsWithMatchingPointName:(id)a3 activationRule:(id)a4 completion:(id)a5;
+ (void)extensionsWithMatchingPointName:(id)a3 baseIdentifier:(id)a4 activationRule:(id)a5 unwantedActivationRule:(id)a6 completion:(id)a7;
+ (void)extensionsWithMatchingPointName:(id)a3 baseIdentifier:(id)a4 completion:(id)a5;
+ (void)extensionsWithMatchingPointName:(id)a3 baseIdentifier:(id)a4 unwantedActivationRule:(id)a5 completion:(id)a6;
+ (void)extensionsWithMatchingPointName:(id)a3 completion:(id)a4;
+ (void)extensionsWithMatchingPointName:(id)a3 unwantedActivationRule:(id)a4 completion:(id)a5;
- (int64_t)processMode;
@end

@implementation NSExtension

+ (void)extensionsWithMatchingPointName:(id)a3 baseIdentifier:(id)a4 activationRule:(id)a5 unwantedActivationRule:(id)a6 completion:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v30 = NSExtensionPointName;
  id v31 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
  id v18 = [v17 mutableCopy];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100016674;
  v24[3] = &unk_100071328;
  id v25 = v11;
  id v26 = v12;
  id v27 = v13;
  id v28 = v16;
  id v29 = v14;
  id v19 = v14;
  id v20 = v16;
  id v21 = v13;
  id v22 = v12;
  id v23 = v11;
  +[NSExtension extensionsWithMatchingAttributes:completion:]( &OBJC_CLASS___NSExtension,  "extensionsWithMatchingAttributes:completion:",  v18,  v24);
}

+ (void)extensionsWithMatchingPointName:(id)a3 baseIdentifier:(id)a4 completion:(id)a5
{
}

+ (void)extensionsWithMatchingPointName:(id)a3 baseIdentifier:(id)a4 unwantedActivationRule:(id)a5 completion:(id)a6
{
}

+ (void)extensionsWithMatchingPointName:(id)a3 activationRule:(id)a4 completion:(id)a5
{
}

+ (void)extensionsWithMatchingPointName:(id)a3 unwantedActivationRule:(id)a4 completion:(id)a5
{
}

+ (void)extensionsWithMatchingPointName:(id)a3 completion:(id)a4
{
}

- (int64_t)processMode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSExtension infoDictionary](self, "infoDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"NSExtension"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"RPBroadcastProcessMode"]);

  int64_t v5 = [v4 isEqualToString:@"RPBroadcastProcessModeSampleBuffer"];
  return v5;
}

@end