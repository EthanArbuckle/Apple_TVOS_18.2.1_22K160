@interface IDSTemporaryPhoneAlertManager
+ (id)serviceString;
@end

@implementation IDSTemporaryPhoneAlertManager

+ (id)serviceString
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceWithPushTopic:@"com.apple.madrid"]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 enabledAccountsOnService:v4]);
  id v7 = [v6 count];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceWithPushTopic:@"com.apple.ess"]);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 enabledAccountsOnService:v9]);
  unint64_t v12 = (unint64_t)[v11 count];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 serviceWithPushTopic:@"com.apple.private.ac"]);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 enabledAccountsOnService:v14]);
  unint64_t v17 = v12 | (unint64_t)[v16 count];

  v19 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(a1, v18));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  if ((v7 != 0LL) == (v17 != 0))
  {
    uint64_t v23 = IMLocalizedStringFromTableInBundle( @"%@ and %@",  @"IDSLocalizable",  v20,  @"Multiple service format");
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    uint64_t v25 = IMLocalizedStringFromTableInBundle( @"iMessage",  @"IDSLocalizable",  v20,  @"Temporary Phone Alert iMessage");
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    uint64_t v27 = IMLocalizedStringFromTableInBundle( @"FaceTime",  @"IDSLocalizable",  v20,  @"Temporary Phone Alert FaceTime");
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v24, v26, v28));
  }

  else
  {
    if (v7)
    {
      v21 = @"iMessage";
      v22 = @"Temporary Phone Alert iMessage";
    }

    else
    {
      v21 = @"FaceTime";
      v22 = @"Temporary Phone Alert FaceTime";
    }

    uint64_t v30 = IMLocalizedStringFromTableInBundle(v21, @"IDSLocalizable", v20, v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v30);
  }

  return v29;
}

@end