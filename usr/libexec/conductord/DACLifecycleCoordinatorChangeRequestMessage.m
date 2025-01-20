@interface DACLifecycleCoordinatorChangeRequestMessage
+ (BOOL)supportsSecureCoding;
+ (id)activationMessageWithActivity:(id)a3 requester:(id)a4 changeMarker:(id)a5;
+ (id)deactivationMessageWithActivity:(id)a3 requester:(id)a4 changeMarker:(id)a5;
+ (id)relinquishMessageWithActivity:(id)a3 requester:(id)a4 changeMarker:(id)a5;
- (DACActivityDescriptor)activity;
- (DACActivityDescriptor)origin;
- (DACChangeMarker)changeMarker;
- (DACLifecycleCoordinatorChangeRequestMessage)initWithCoder:(id)a3;
- (id)_initWithMessageType:(unint64_t)a3 activity:(id)a4 origin:(id)a5 changeMarker:(id)a6;
- (id)description;
- (int64_t)version;
- (unint64_t)messageType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DACLifecycleCoordinatorChangeRequestMessage

- (id)_initWithMessageType:(unint64_t)a3 activity:(id)a4 origin:(id)a5 changeMarker:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___DACLifecycleCoordinatorChangeRequestMessage;
  v14 = -[DACLifecycleCoordinatorChangeRequestMessage init](&v17, "init");
  v15 = (id *)v14;
  if (v14)
  {
    v14->_version = 1LL;
    v14->_messageType = a3;
    objc_storeStrong((id *)&v14->_activity, a4);
    objc_storeStrong(v15 + 4, a5);
    objc_storeStrong(v15 + 5, a6);
  }

  return v15;
}

+ (id)activationMessageWithActivity:(id)a3 requester:(id)a4 changeMarker:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = -[DACLifecycleCoordinatorChangeRequestMessage _initWithMessageType:activity:origin:changeMarker:]( objc_alloc(&OBJC_CLASS___DACLifecycleCoordinatorChangeRequestMessage),  "_initWithMessageType:activity:origin:changeMarker:",  1LL,  v9,  v8,  v7);

  return v10;
}

+ (id)deactivationMessageWithActivity:(id)a3 requester:(id)a4 changeMarker:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = -[DACLifecycleCoordinatorChangeRequestMessage _initWithMessageType:activity:origin:changeMarker:]( objc_alloc(&OBJC_CLASS___DACLifecycleCoordinatorChangeRequestMessage),  "_initWithMessageType:activity:origin:changeMarker:",  2LL,  v9,  v8,  v7);

  return v10;
}

+ (id)relinquishMessageWithActivity:(id)a3 requester:(id)a4 changeMarker:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = -[DACLifecycleCoordinatorChangeRequestMessage _initWithMessageType:activity:origin:changeMarker:]( objc_alloc(&OBJC_CLASS___DACLifecycleCoordinatorChangeRequestMessage),  "_initWithMessageType:activity:origin:changeMarker:",  3LL,  v9,  v8,  v7);

  return v10;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  int64_t v6 = -[DACLifecycleCoordinatorChangeRequestMessage version](self, "version");
  unint64_t v7 = -[DACLifecycleCoordinatorChangeRequestMessage messageType](self, "messageType");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DACLifecycleCoordinatorChangeRequestMessage activity](self, "activity"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DACLifecycleCoordinatorChangeRequestMessage origin](self, "origin"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DACLifecycleCoordinatorChangeRequestMessage changeMarker](self, "changeMarker"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p v(%ld) MT(%lu) A(%@) O(%@) CM(%@)>",  v5,  self,  v6,  v7,  v8,  v9,  v10));

  return v11;
}

- (DACLifecycleCoordinatorChangeRequestMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (uint64_t)[v4 decodeIntegerForKey:@"version"];
  if (v5 >= 1)
  {
    int64_t v7 = v5;
    id v8 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v6),  @"messageType");
    id v9 = (DACLifecycleCoordinatorChangeRequestMessage *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = -[DACLifecycleCoordinatorChangeRequestMessage unsignedIntegerValue](v9, "unsignedIntegerValue");
    id v12 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(DACActivityDescriptor, v11),  @"activity");
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v15 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(DACActivityDescriptor, v14),  @"origin");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    id v18 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(DACChangeMarker, v17),  @"changeMarker");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if (!v19) {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[DACChangeMarker missingMarker](&OBJC_CLASS___DACChangeMarker, "missingMarker"));
    }
    if ((unint64_t)v10 <= 3 && v13)
    {
      v28.receiver = self;
      v28.super_class = (Class)&OBJC_CLASS___DACLifecycleCoordinatorChangeRequestMessage;
      v20 = -[DACLifecycleCoordinatorChangeRequestMessage initWithCoder:](&v28, "initWithCoder:", v4);
      v21 = v20;
      if (!v20)
      {
LABEL_15:

        self = v9;
        goto LABEL_16;
      }

      v20->_version = v7;
      v20->_messageType = (unint64_t)v10;
      objc_storeStrong((id *)&v20->_activity, v13);
      objc_storeStrong((id *)&v21->_origin, v16);
      v22 = v19;
      self = (DACLifecycleCoordinatorChangeRequestMessage *)v21->_changeMarker;
      v21->_changeMarker = v22;
    }

    else
    {
      id v24 = sub_100014610(3);
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v27 = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Failed to decode change request message, invalid type or no Activity",  v27,  2u);
      }

      v21 = 0LL;
    }

    goto LABEL_15;
  }

  id v23 = sub_100014610(3);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v27 = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_ERROR,  "Failed to decode change request message, invalid version",  v27,  2u);
  }

  v21 = 0LL;
LABEL_16:

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DACLifecycleCoordinatorChangeRequestMessage;
  id v4 = a3;
  -[DACLifecycleCoordinatorChangeRequestMessage encodeWithCoder:](&v9, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[DACLifecycleCoordinatorChangeRequestMessage version](self, "version", v9.receiver, v9.super_class),  @"version");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[DACLifecycleCoordinatorChangeRequestMessage messageType](self, "messageType")));
  [v4 encodeObject:v5 forKey:@"messageType"];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DACLifecycleCoordinatorChangeRequestMessage activity](self, "activity"));
  [v4 encodeObject:v6 forKey:@"activity"];

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DACLifecycleCoordinatorChangeRequestMessage origin](self, "origin"));
  [v4 encodeObject:v7 forKey:@"origin"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DACLifecycleCoordinatorChangeRequestMessage changeMarker](self, "changeMarker"));
  [v4 encodeObject:v8 forKey:@"changeMarker"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)version
{
  return self->_version;
}

- (unint64_t)messageType
{
  return self->_messageType;
}

- (DACActivityDescriptor)activity
{
  return self->_activity;
}

- (DACActivityDescriptor)origin
{
  return self->_origin;
}

- (DACChangeMarker)changeMarker
{
  return self->_changeMarker;
}

- (void).cxx_destruct
{
}

@end