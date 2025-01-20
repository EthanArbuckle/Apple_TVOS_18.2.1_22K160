@interface TVSSBannerIdentification
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation TVSSBannerIdentification

- (unint64_t)hash
{
  v14 = self;
  v13[1] = (id)a2;
  v13[0] = objc_alloc_init(&OBJC_CLASS___BSHashBuilder);
  id v6 = v13[0];
  id v7 = -[TVSSBannerIdentification requesterIdentifier](v14, "requesterIdentifier");
  id v2 = objc_msgSend(v6, "appendObject:");

  id v8 = v13[0];
  id v9 = -[TVSSBannerIdentification requestIdentifier](v14, "requestIdentifier");
  id v3 = objc_msgSend(v8, "appendObject:");

  id v10 = v13[0];
  id v11 = -[TVSSBannerIdentification uniquePresentableIdentifier](v14, "uniquePresentableIdentifier");
  id v4 = objc_msgSend(v10, "appendObject:");

  id v12 = [v13[0] hash];
  objc_storeStrong(v13, 0LL);
  return (unint64_t)v12;
}

- (BOOL)isEqual:(id)a3
{
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v26 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  location[0],  objc_opt_class(&OBJC_CLASS___TVSSBannerIdentification));
  id v25 = location[0];
  id v7 = v26;
  id v8 = -[TVSSBannerIdentification requesterIdentifier](v28, "requesterIdentifier");
  v19[1] = _NSConcreteStackBlock;
  int v20 = -1073741824;
  int v21 = 0;
  v22 = sub_10000CC14;
  v23 = &unk_1001B60F8;
  id v24 = v25;
  id v3 = -[BSEqualsBuilder appendObject:counterpart:](v7, "appendObject:counterpart:", v8);

  id v9 = v26;
  id v10 = -[TVSSBannerIdentification requestIdentifier](v28, "requestIdentifier");
  v14[1] = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  v17 = sub_10000CC44;
  v18 = &unk_1001B60F8;
  v19[0] = v25;
  id v4 = -[BSEqualsBuilder appendObject:counterpart:](v9, "appendObject:counterpart:", v10);

  id v11 = v26;
  id v12 = -[TVSSBannerIdentification uniquePresentableIdentifier](v28, "uniquePresentableIdentifier");
  v14[0] = v25;
  id v5 = -[BSEqualsBuilder appendObject:counterpart:](v11, "appendObject:counterpart:", v12);

  unsigned __int8 v13 = -[BSEqualsBuilder isEqual](v26, "isEqual");
  objc_storeStrong(v14, 0LL);
  objc_storeStrong(v19, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong((id *)&v26, 0LL);
  objc_storeStrong(location, 0LL);
  return v13 & 1;
}

@end