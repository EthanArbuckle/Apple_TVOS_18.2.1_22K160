@interface IDSTapToRadarPushPayload
- (IDSTapToRadarPushPayload)initWithPushPayload:(id)a3;
- (NSArray)radarKeywords;
- (NSArray)radarQueryParameter;
- (NSString)errorCode;
- (NSString)promptMessage;
- (NSString)promptTitle;
- (NSString)radarClassification;
- (NSString)radarComponentId;
- (NSString)radarComponentName;
- (NSString)radarComponentVersion;
- (NSString)radarDescription;
- (NSString)radarReproducibility;
- (NSString)radarTitle;
- (NSString)serverErrorDetail;
@end

@implementation IDSTapToRadarPushPayload

- (IDSTapToRadarPushPayload)initWithPushPayload:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v76 handleFailureInMethod:a2, self, @"IDSTapToRadarPushPayload.m", 16, @"Invalid parameter not satisfying: %@", @"pushPayload" object file lineNumber description];
  }

  v77.receiver = self;
  v77.super_class = (Class)&OBJC_CLASS___IDSTapToRadarPushPayload;
  v7 = -[IDSTapToRadarPushPayload init](&v77, "init");
  if (v7)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString, v6);
    id v9 = sub_1003AEC20(v8, v5, @"e");
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    errorCode = v7->_errorCode;
    v7->_errorCode = (NSString *)v10;

    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v12);
    id v14 = sub_1003AEC20(v13, v5, @"s");
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    serverErrorDetail = v7->_serverErrorDetail;
    v7->_serverErrorDetail = (NSString *)v15;

    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString, v17);
    id v19 = sub_1003AEC20(v18, v5, @"m");
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    promptMessage = v7->_promptMessage;
    v7->_promptMessage = (NSString *)v20;

    uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSString, v22);
    id v24 = sub_1003AEC20(v23, v5, @"t");
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    promptTitle = v7->_promptTitle;
    v7->_promptTitle = (NSString *)v25;

    uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSString, v27);
    id v29 = sub_1003AEC20(v28, v5, @"rt");
    uint64_t v30 = objc_claimAutoreleasedReturnValue(v29);
    radarTitle = v7->_radarTitle;
    v7->_radarTitle = (NSString *)v30;

    uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSString, v32);
    id v34 = sub_1003AEC20(v33, v5, @"rd");
    uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);
    radarDescription = v7->_radarDescription;
    v7->_radarDescription = (NSString *)v35;

    uint64_t v38 = objc_opt_class(&OBJC_CLASS___NSString, v37);
    id v39 = sub_1003AEC20(v38, v5, @"cn");
    uint64_t v40 = objc_claimAutoreleasedReturnValue(v39);
    radarComponentName = v7->_radarComponentName;
    v7->_radarComponentName = (NSString *)v40;

    uint64_t v43 = objc_opt_class(&OBJC_CLASS___NSString, v42);
    id v44 = sub_1003AEC20(v43, v5, @"cv");
    uint64_t v45 = objc_claimAutoreleasedReturnValue(v44);
    radarComponentVersion = v7->_radarComponentVersion;
    v7->_radarComponentVersion = (NSString *)v45;

    uint64_t v48 = objc_opt_class(&OBJC_CLASS___NSNumber, v47);
    id v49 = sub_1003AEC20(v48, v5, @"ci");
    v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
    v51 = v50;
    if (v50)
    {
      uint64_t v52 = objc_claimAutoreleasedReturnValue([v50 stringValue]);
      radarComponentId = v7->_radarComponentId;
      v7->_radarComponentId = (NSString *)v52;
    }

    else
    {
      radarComponentId = v7->_radarComponentId;
      v7->_radarComponentId = 0LL;
    }

    uint64_t v55 = objc_opt_class(&OBJC_CLASS___NSString, v54);
    id v56 = sub_1003AEC20(v55, v5, @"z");
    uint64_t v57 = objc_claimAutoreleasedReturnValue(v56);
    radarClassification = v7->_radarClassification;
    v7->_radarClassification = (NSString *)v57;

    uint64_t v60 = objc_opt_class(&OBJC_CLASS___NSString, v59);
    id v61 = sub_1003AEC20(v60, v5, @"r");
    uint64_t v62 = objc_claimAutoreleasedReturnValue(v61);
    radarReproducibility = v7->_radarReproducibility;
    v7->_radarReproducibility = (NSString *)v62;

    uint64_t v65 = objc_opt_class(&OBJC_CLASS___NSArray, v64);
    id v66 = sub_1003AEC20(v65, v5, @"k");
    v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
    uint64_t v68 = objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "__imArrayByApplyingBlock:", &stru_100902F40));
    radarKeywords = v7->_radarKeywords;
    v7->_radarKeywords = (NSArray *)v68;

    uint64_t v71 = objc_opt_class(&OBJC_CLASS___NSString, v70);
    id v72 = sub_1003AEC20(v71, v5, @"qp");
    uint64_t v73 = objc_claimAutoreleasedReturnValue(v72);
    radarQueryParameter = v7->_radarQueryParameter;
    v7->_radarQueryParameter = (NSArray *)v73;
  }

  return v7;
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (NSString)serverErrorDetail
{
  return self->_serverErrorDetail;
}

- (NSString)promptMessage
{
  return self->_promptMessage;
}

- (NSString)promptTitle
{
  return self->_promptTitle;
}

- (NSString)radarTitle
{
  return self->_radarTitle;
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (NSString)radarComponentName
{
  return self->_radarComponentName;
}

- (NSString)radarComponentVersion
{
  return self->_radarComponentVersion;
}

- (NSString)radarComponentId
{
  return self->_radarComponentId;
}

- (NSString)radarClassification
{
  return self->_radarClassification;
}

- (NSString)radarReproducibility
{
  return self->_radarReproducibility;
}

- (NSArray)radarKeywords
{
  return self->_radarKeywords;
}

- (NSArray)radarQueryParameter
{
  return self->_radarQueryParameter;
}

- (void).cxx_destruct
{
}

@end