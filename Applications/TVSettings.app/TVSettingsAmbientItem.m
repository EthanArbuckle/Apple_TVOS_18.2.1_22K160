@interface TVSettingsAmbientItem
- (BOOL)isActive;
- (BOOL)isDisabled;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (NSString)localizedDescription;
- (NSString)localizedName;
- (NSURL)previewImageURL;
- (TVISSettingsOption)model;
- (TVSettingsAmbientItem)initWithIdentifier:(id)a3 localizedName:(id)a4 localizedDescription:(id)a5 previewImageURL:(id)a6 active:(BOOL)a7 disabled:(BOOL)a8 preferredOrder:(int64_t)a9;
- (TVSettingsAmbientItem)initWithModel:(id)a3;
- (int64_t)preferredOrder;
- (unint64_t)hash;
- (void)setActive:(BOOL)a3;
- (void)setDisabled:(BOOL)a3;
@end

@implementation TVSettingsAmbientItem

- (TVSettingsAmbientItem)initWithIdentifier:(id)a3 localizedName:(id)a4 localizedDescription:(id)a5 previewImageURL:(id)a6 active:(BOOL)a7 disabled:(BOOL)a8 preferredOrder:(int64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v22 = a5;
  id v18 = a6;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientItem;
  v19 = -[TVSettingsAmbientItem init](&v23, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v20->_localizedName, a4);
    objc_storeStrong((id *)&v20->_localizedDescription, a5);
    objc_storeStrong((id *)&v20->_previewImageURL, a6);
    v20->_active = a7;
    v20->_disabled = a8;
    v20->_preferredOrder = a9;
  }

  return v20;
}

- (TVSettingsAmbientItem)initWithModel:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedName]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 previewImageURL]);
  v10 = -[TVSettingsAmbientItem initWithIdentifier:localizedName:localizedDescription:previewImageURL:active:disabled:preferredOrder:]( self,  "initWithIdentifier:localizedName:localizedDescription:previewImageURL:active:disabled:preferredOrder:",  v6,  v7,  v8,  v9,  [v5 isActive],  objc_msgSend(v5, "isDisabled"),  objc_msgSend(v5, "preferredOrder"));

  if (v10) {
    objc_storeStrong((id *)&v10->_model, a3);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___TVSettingsAmbientItem));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientItem previewImageURL](self, "previewImageURL"));
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100078C1C;
  v41[3] = &unk_1001919C8;
  id v8 = v4;
  id v42 = v8;
  id v9 = [v6 appendObject:v7 counterpart:v41];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientItem identifier](self, "identifier"));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_100078C24;
  v39[3] = &unk_1001919F0;
  id v11 = v8;
  id v40 = v11;
  id v12 = [v6 appendString:v10 counterpart:v39];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientItem localizedName](self, "localizedName"));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100078C2C;
  v37[3] = &unk_1001919F0;
  id v14 = v11;
  id v38 = v14;
  id v15 = [v6 appendString:v13 counterpart:v37];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientItem localizedDescription](self, "localizedDescription"));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100078C34;
  v35[3] = &unk_1001919F0;
  id v17 = v14;
  id v36 = v17;
  id v18 = [v6 appendString:v16 counterpart:v35];

  BOOL v19 = -[TVSettingsAmbientItem isActive](self, "isActive");
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100078C3C;
  v33[3] = &unk_100191A18;
  id v20 = v17;
  id v34 = v20;
  id v21 = [v6 appendBool:v19 counterpart:v33];
  BOOL v22 = -[TVSettingsAmbientItem isDisabled](self, "isDisabled");
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100078C44;
  v31[3] = &unk_100191A18;
  id v23 = v20;
  id v32 = v23;
  id v24 = [v6 appendBool:v22 counterpart:v31];
  int64_t v25 = -[TVSettingsAmbientItem preferredOrder](self, "preferredOrder");
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100078C4C;
  v29[3] = &unk_100191A40;
  id v30 = v23;
  id v26 = v23;
  id v27 = [v6 appendInteger:v25 counterpart:v29];
  LOBYTE(v23) = [v6 isEqual];

  return (char)v23;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientItem previewImageURL](self, "previewImageURL"));
  id v5 = [v3 appendObject:v4];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientItem identifier](self, "identifier"));
  id v7 = [v3 appendString:v6];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientItem localizedName](self, "localizedName"));
  id v9 = [v3 appendString:v8];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientItem localizedDescription](self, "localizedDescription"));
  id v11 = [v3 appendString:v10];

  id v12 = objc_msgSend(v3, "appendBool:", -[TVSettingsAmbientItem isActive](self, "isActive"));
  id v13 = objc_msgSend(v3, "appendBool:", -[TVSettingsAmbientItem isDisabled](self, "isDisabled"));
  id v14 = objc_msgSend(v3, "appendInteger:", -[TVSettingsAmbientItem preferredOrder](self, "preferredOrder"));
  id v15 = [v3 hash];

  return (unint64_t)v15;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (NSURL)previewImageURL
{
  return self->_previewImageURL;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (int64_t)preferredOrder
{
  return self->_preferredOrder;
}

- (TVISSettingsOption)model
{
  return self->_model;
}

- (void).cxx_destruct
{
}

@end