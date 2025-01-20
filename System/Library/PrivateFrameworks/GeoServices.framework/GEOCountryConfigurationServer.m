@interface GEOCountryConfigurationServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (void)updateWithMessage:(id)a3;
@end

@implementation GEOCountryConfigurationServer

+ (id)identifier
{
  return @"country";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  if (sub_100011D18(a3) == 643)
  {
    id v12 = [[GEOMessage alloc] initWithXPCMessage:v10 peer:v11];
    v13 = v12;
    BOOL v14 = v12 != 0LL;
    if (v12)
    {
      [v12 setSignpostId:a6];
      -[GEOCountryConfigurationServer updateWithMessage:](self, "updateWithMessage:", v13);
    }
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)updateWithMessage:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[GEOCountryConfiguration sharedConfiguration]( &OBJC_CLASS___GEOCountryConfiguration,  "sharedConfiguration"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100017BFC;
  v9[3] = &unk_100059168;
  id v10 = v4;
  id v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOCountryConfigurationServer daemon](self, "daemon"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serverQueue]);
  [v5 updateCountryConfiguration:v9 callbackQueue:v8];
}

@end