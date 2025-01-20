@interface RequestLocalizations
- (NSString)approve;
- (NSString)body;
- (NSString)decline;
- (NSString)title;
- (RequestLocalizations)initWithApprove:(id)a3 body:(id)a4 decline:(id)a5 title:(id)a6;
- (RequestLocalizations)initWithDictionary:(id)a3;
- (id)compile;
- (id)description;
@end

@implementation RequestLocalizations

- (RequestLocalizations)initWithApprove:(id)a3 body:(id)a4 decline:(id)a5 title:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  v15 = 0LL;
  if (v10 && v11 && v12 && v13)
  {
    v26.receiver = self;
    v26.super_class = (Class)&OBJC_CLASS___RequestLocalizations;
    v16 = -[RequestLocalizations init](&v26, "init");
    if (v16)
    {
      v17 = (NSString *)[v14 copy];
      title = v16->_title;
      v16->_title = v17;

      v19 = (NSString *)[v11 copy];
      body = v16->_body;
      v16->_body = v19;

      v21 = (NSString *)[v10 copy];
      approve = v16->_approve;
      v16->_approve = v21;

      v23 = (NSString *)[v12 copy];
      decline = v16->_decline;
      v16->_decline = v23;
    }

    self = v16;
    v15 = self;
  }

  return v15;
}

- (RequestLocalizations)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"approve"]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
    id v7 = v5;
  }
  else {
    id v7 = 0LL;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"body"]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
    id v10 = v8;
  }
  else {
    id v10 = 0LL;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"decline"]);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0) {
    id v13 = v11;
  }
  else {
    id v13 = 0LL;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"title"]);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0) {
    id v16 = v14;
  }
  else {
    id v16 = 0LL;
  }

  v17 = -[RequestLocalizations initWithApprove:body:decline:title:]( self,  "initWithApprove:body:decline:title:",  v7,  v10,  v13,  v16);
  return v17;
}

- (id)compile
{
  v9[0] = @"approve";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RequestLocalizations approve](self, "approve"));
  v10[0] = v3;
  v9[1] = @"body";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RequestLocalizations body](self, "body"));
  v10[1] = v4;
  v9[2] = @"decline";
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RequestLocalizations decline](self, "decline"));
  v10[2] = v5;
  v9[3] = @"title";
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[RequestLocalizations title](self, "title"));
  v10[3] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  4LL));

  return v7;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RequestLocalizations compile](self, "compile"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[RequestLocalizations ap_generateDescriptionWithSubObjects:]( self,  "ap_generateDescriptionWithSubObjects:",  v3));

  return v4;
}

- (NSString)approve
{
  return self->_approve;
}

- (NSString)body
{
  return self->_body;
}

- (NSString)decline
{
  return self->_decline;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
}

@end