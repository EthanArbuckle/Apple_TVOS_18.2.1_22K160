@interface SUCoreDiagPoint
+ (BOOL)supportsSecureCoding;
- (NSString)activity;
- (NSString)checkedDomain;
- (NSString)errorDesc;
- (NSString)location;
- (NSString)next;
- (NSString)param;
- (NSString)previous;
- (NSString)reason;
- (SUCoreDiagPoint)initWithCoder:(id)a3;
- (id)_descriptionStandard;
- (id)_descriptionStateEvent;
- (id)_initFullySpecified:(int64_t)a3 fromLocation:(id)a4 forReason:(id)a5 withCode:(int64_t)a6 withError:(id)a7 previous:(id)a8 next:(id)a9 activity:(id)a10 param:(id)a11;
- (id)_summaryStandard;
- (id)_summaryStateEvent;
- (id)description;
- (id)initOfType:(int64_t)a3 fromLocation:(id)a4 forReason:(id)a5 withCode:(int64_t)a6 withError:(id)a7;
- (id)initStateEventForFSM:(id)a3 previousState:(id)a4 fsmEvent:(id)a5 nextState:(id)a6 fsmAction:(id)a7 eventInfo:(id)a8;
- (id)summary;
- (id)typeName;
- (int64_t)checkedCode;
- (int64_t)checkedIndications;
- (int64_t)checkedLayer;
- (int64_t)code;
- (int64_t)trackType;
- (void)encodeWithCoder:(id)a3;
- (void)setActivity:(id)a3;
- (void)setCheckedCode:(int64_t)a3;
- (void)setCheckedDomain:(id)a3;
- (void)setCheckedIndications:(int64_t)a3;
- (void)setCheckedLayer:(int64_t)a3;
- (void)setCode:(int64_t)a3;
- (void)setErrorDesc:(id)a3;
- (void)setLocation:(id)a3;
- (void)setNext:(id)a3;
- (void)setParam:(id)a3;
- (void)setPrevious:(id)a3;
- (void)setReason:(id)a3;
- (void)setTrackType:(int64_t)a3;
@end

@implementation SUCoreDiagPoint

- (id)initOfType:(int64_t)a3 fromLocation:(id)a4 forReason:(id)a5 withCode:(int64_t)a6 withError:(id)a7
{
  return -[SUCoreDiagPoint _initFullySpecified:fromLocation:forReason:withCode:withError:previous:next:activity:param:]( self,  "_initFullySpecified:fromLocation:forReason:withCode:withError:previous:next:activity:param:",  a3,  a4,  a5,  a6,  a7,  0LL,  0LL,  0LL,  0LL);
}

- (id)initStateEventForFSM:(id)a3 previousState:(id)a4 fsmEvent:(id)a5 nextState:(id)a6 fsmAction:(id)a7 eventInfo:(id)a8
{
  return -[SUCoreDiagPoint _initFullySpecified:fromLocation:forReason:withCode:withError:previous:next:activity:param:]( self,  "_initFullySpecified:fromLocation:forReason:withCode:withError:previous:next:activity:param:",  64LL,  a3,  a5,  0LL,  0LL,  a4,  a6,  a7,  a8);
}

- (id)_initFullySpecified:(int64_t)a3 fromLocation:(id)a4 forReason:(id)a5 withCode:(int64_t)a6 withError:(id)a7 previous:(id)a8 next:(id)a9 activity:(id)a10 param:(id)a11
{
  id v36 = a4;
  id v35 = a5;
  id v18 = a7;
  id v34 = a8;
  id v33 = a9;
  id v32 = a10;
  id v31 = a11;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___SUCoreDiagPoint;
  v19 = -[SUCoreDiagPoint init](&v37, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_trackType = a3;
    objc_storeStrong((id *)&v19->_location, a4);
    objc_storeStrong((id *)&v20->_reason, a5);
    v20->_code = a6;
    if (v18)
    {
      id v21 = objc_alloc(NSString);
      [v18 checkedDescription];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = [v21 initWithFormat:@"%@", v22];
      errorDesc = v20->_errorDesc;
      v20->_errorDesc = (NSString *)v23;

      v20->_checkedLayer = [v18 checkedLayer];
      v20->_checkedCode = [v18 checkedCode];
      uint64_t v25 = [v18 checkedDomain];
      checkedDomain = v20->_checkedDomain;
      v20->_checkedDomain = (NSString *)v25;

      uint64_t v27 = [v18 checkedIndications];
    }

    else
    {
      v28 = v20->_errorDesc;
      v20->_errorDesc = 0LL;

      v20->_checkedLayer = 0LL;
      v20->_checkedCode = 0LL;
      v29 = v20->_checkedDomain;
      v20->_checkedDomain = 0LL;

      uint64_t v27 = 0LL;
    }

    v20->_checkedIndications = v27;
    objc_storeStrong((id *)&v20->_previous, a8);
    objc_storeStrong((id *)&v20->_next, a9);
    objc_storeStrong((id *)&v20->_activity, a10);
    objc_storeStrong((id *)&v20->_param, a11);
  }

  return v20;
}

- (SUCoreDiagPoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___SUCoreDiagPoint;
  v5 = -[SUCoreDiagPoint init](&v23, sel_init);
  if (v5)
  {
    v5->_trackType = [v4 decodeInt64ForKey:@"trackType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
    location = v5->_location;
    v5->_location = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reason"];
    reason = v5->_reason;
    v5->_reason = (NSString *)v8;

    v5->_code = [v4 decodeInt64ForKey:@"code"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"errorDesc"];
    errorDesc = v5->_errorDesc;
    v5->_errorDesc = (NSString *)v10;

    v5->_checkedLayer = [v4 decodeInt64ForKey:@"checkedLayer"];
    v5->_checkedCode = [v4 decodeInt64ForKey:@"checkedCode"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"checkedDomain"];
    checkedDomain = v5->_checkedDomain;
    v5->_checkedDomain = (NSString *)v12;

    v5->_checkedIndications = [v4 decodeInt64ForKey:@"checkedIndications"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previous"];
    previous = v5->_previous;
    v5->_previous = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"next"];
    next = v5->_next;
    v5->_next = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activity"];
    activity = v5->_activity;
    v5->_activity = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"param"];
    param = v5->_param;
    v5->_param = (NSString *)v20;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t trackType = self->_trackType;
  id v5 = a3;
  [v5 encodeInt64:trackType forKey:@"trackType"];
  [v5 encodeObject:self->_location forKey:@"location"];
  [v5 encodeObject:self->_reason forKey:@"reason"];
  [v5 encodeInt64:self->_code forKey:@"code"];
  [v5 encodeObject:self->_errorDesc forKey:@"errorDesc"];
  [v5 encodeInt64:self->_checkedLayer forKey:@"checkedLayer"];
  [v5 encodeInt64:self->_checkedCode forKey:@"checkedCode"];
  [v5 encodeObject:self->_checkedDomain forKey:@"checkedDomain"];
  [v5 encodeInt64:self->_checkedIndications forKey:@"checkedIndications"];
  [v5 encodeObject:self->_previous forKey:@"previous"];
  [v5 encodeObject:self->_next forKey:@"next"];
  [v5 encodeObject:self->_activity forKey:@"activity"];
  [v5 encodeObject:self->_param forKey:@"param"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  else {
    -[SUCoreDiagPoint _descriptionStandard](self, "_descriptionStandard");
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)summary
{
  else {
    -[SUCoreDiagPoint _summaryStandard](self, "_summaryStandard");
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_descriptionStateEvent
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreDiagPoint activity](self, "activity");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (v4)
    {
      -[SUCoreDiagPoint param](self, "param");
      id v5 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v6 = (void *)NSString;
      v7 = -[SUCoreDiagPoint typeName](self, "typeName");
      -[SUCoreDiagPoint location](self, "location");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SUCoreDiagPoint previous](self, "previous");
      -[SUCoreDiagPoint reason](self, "reason");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[SUCoreDiagPoint next](self, "next");
      uint64_t v12 = -[SUCoreDiagPoint activity](self, "activity");
      v13 = (void *)v12;
      if (v5)
      {
        -[SUCoreDiagPoint param](self, "param");
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 stringWithFormat:@"[%@(%@)] >S> %@ >E> %@ >N> %@ >A> %@ info:%@", v7, v8, v9, v10, v11, v13, v14];
        v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
LABEL_15:

        goto LABEL_16;
      }

      [v6 stringWithFormat:@"[%@(%@)] >S> %@ >E> %@ >N> %@ >A> %@", v7, v8, v9, v10, v11, v12];
LABEL_10:
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }

    v19 = (void *)NSString;
    v7 = -[SUCoreDiagPoint typeName](self, "typeName");
    -[SUCoreDiagPoint location](self, "location");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SUCoreDiagPoint previous](self, "previous");
    -[SUCoreDiagPoint reason](self, "reason");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SUCoreDiagPoint next](self, "next");
    [v19 stringWithFormat:@"[%@(%@)] >S> %@ >E> %@ >N> %@", v7, v8, v9, v10, v11];
    goto LABEL_14;
  }

  if (v4)
  {
    -[SUCoreDiagPoint param](self, "param");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)NSString;
    v7 = -[SUCoreDiagPoint typeName](self, "typeName");
    -[SUCoreDiagPoint location](self, "location");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SUCoreDiagPoint previous](self, "previous");
    -[SUCoreDiagPoint reason](self, "reason");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = -[SUCoreDiagPoint activity](self, "activity");
    v11 = (void *)v18;
    if (v16)
    {
      v13 = -[SUCoreDiagPoint param](self, "param");
      [v17 stringWithFormat:@"[%@(%@)] >S> %@ >E> %@ >A> %@ info:%@", v7, v8, v9, v10, v11, v13];
      goto LABEL_10;
    }

    [v17 stringWithFormat:@"[%@(%@)] >S> %@ >E> %@ >A> %@", v7, v8, v9, v10, v18];
LABEL_14:
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }

  uint64_t v20 = (void *)NSString;
  v7 = -[SUCoreDiagPoint typeName](self, "typeName");
  -[SUCoreDiagPoint location](self, "location");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SUCoreDiagPoint previous](self, "previous");
  -[SUCoreDiagPoint reason](self, "reason");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 stringWithFormat:@"[%@(%@)] >S> %@ >E> %@", v7, v8, v9, v10];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v15;
}

- (id)_summaryStateEvent
{
  v3 = (void *)NSString;
  -[SUCoreDiagPoint typeName](self, "typeName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDiagPoint location](self, "location");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDiagPoint previous](self, "previous");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUCoreDiagPoint reason](self, "reason");
  -[SUCoreDiagPoint next](self, "next");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SUCoreDiagPoint activity](self, "activity");
  -[SUCoreDiagPoint param](self, "param");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"trackType:%@ fsmName:%@ previousState:%@ fsmEvent:%@ nextState:%@ fsmAction:%@ eventInfo:%@", v4, v5, v6, v7, v8, v9, v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_descriptionStandard
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreDiagPoint errorDesc](self, "errorDesc");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (v4)
    {
      if (-[SUCoreDiagPoint checkedLayer](self, "checkedLayer"))
      {
        uint64_t v5 = -[SUCoreDiagPoint checkedLayer](self, "checkedLayer");
        uint64_t v6 = (void *)NSString;
        v7 = -[SUCoreDiagPoint typeName](self, "typeName");
        -[SUCoreDiagPoint location](self, "location");
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[SUCoreDiagPoint reason](self, "reason");
        int64_t v10 = -[SUCoreDiagPoint code](self, "code");
        v11 = -[SUCoreDiagPoint errorDesc](self, "errorDesc");
        if (v5 > 10)
        {
          id v34 = v6;
          v22 = +[SUCoreErrorInformation nameForSUCoreLayer:]( &OBJC_CLASS___SUCoreErrorInformation,  "nameForSUCoreLayer:",  -[SUCoreDiagPoint checkedLayer](self, "checkedLayer"));
          int64_t v23 = -[SUCoreDiagPoint checkedCode](self, "checkedCode");
          v24 = -[SUCoreDiagPoint checkedDomain](self, "checkedDomain");
          +[SUCoreErrorInformation summaryOfIndications:]( &OBJC_CLASS___SUCoreErrorInformation,  "summaryOfIndications:",  -[SUCoreDiagPoint checkedIndications](self, "checkedIndications"));
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
          [v34 stringWithFormat:@"[%@(%@) %@] code:%ld error:%@ | checked(%@) code:%ld domain:%@ indications:%@", v7, v8, v9, v10, v11, v22, v23, v24, v25];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          [v6 stringWithFormat:@"[%@(%@) %@] code:%ld error:%@ | checked(%ld)", v7, v8, v9, v10, v11, -[SUCoreDiagPoint checkedLayer](self, "checkedLayer")];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_18;
      }

      uint64_t v18 = (void *)NSString;
      v7 = -[SUCoreDiagPoint typeName](self, "typeName");
      -[SUCoreDiagPoint location](self, "location");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SUCoreDiagPoint reason](self, "reason");
      int64_t v19 = -[SUCoreDiagPoint code](self, "code");
      -[SUCoreDiagPoint errorDesc](self, "errorDesc");
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 stringWithFormat:@"[%@(%@) %@] code:%ld error:%@", v7, v8, v17, v19, v20];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v16 = (void *)NSString;
      v7 = -[SUCoreDiagPoint typeName](self, "typeName");
      -[SUCoreDiagPoint location](self, "location");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SUCoreDiagPoint reason](self, "reason");
      [v16 stringWithFormat:@"[%@(%@) %@] code:%ld", v7, v8, v17, -[SUCoreDiagPoint code](self, "code")];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else if (v4)
  {
    if (-[SUCoreDiagPoint checkedLayer](self, "checkedLayer"))
    {
      uint64_t v13 = -[SUCoreDiagPoint checkedLayer](self, "checkedLayer");
      uint64_t v14 = (void *)NSString;
      v7 = -[SUCoreDiagPoint typeName](self, "typeName");
      -[SUCoreDiagPoint location](self, "location");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      int64_t v15 = -[SUCoreDiagPoint code](self, "code");
      v9 = -[SUCoreDiagPoint errorDesc](self, "errorDesc");
      if (v13 > 10)
      {
        v29 = +[SUCoreErrorInformation nameForSUCoreLayer:]( &OBJC_CLASS___SUCoreErrorInformation,  "nameForSUCoreLayer:",  -[SUCoreDiagPoint checkedLayer](self, "checkedLayer"));
        int64_t v30 = -[SUCoreDiagPoint checkedCode](self, "checkedCode");
        -[SUCoreDiagPoint checkedDomain](self, "checkedDomain");
        id v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUCoreErrorInformation summaryOfIndications:]( &OBJC_CLASS___SUCoreErrorInformation,  "summaryOfIndications:",  -[SUCoreDiagPoint checkedIndications](self, "checkedIndications"));
        id v32 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 stringWithFormat:@"[%@(%@)] code:%ld error:%@ | checked(%@) code:%ld domain:%@ indications:%@", v7, v8, v15, v9, v29, v30, v31, v32];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        [v14 stringWithFormat:@"[%@(%@)] code:%ld error:%@ | checked(%ld)", v7, v8, v15, v9, -[SUCoreDiagPoint checkedLayer](self, "checkedLayer")];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      }

- (id)_summaryStandard
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (-[SUCoreDiagPoint checkedLayer](self, "checkedLayer"))
    {
      uint64_t v4 = -[SUCoreDiagPoint checkedLayer](self, "checkedLayer");
      uint64_t v5 = (void *)NSString;
      -[SUCoreDiagPoint typeName](self, "typeName");
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[SUCoreDiagPoint location](self, "location");
      -[SUCoreDiagPoint reason](self, "reason");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      int64_t v9 = -[SUCoreDiagPoint code](self, "code");
      -[SUCoreDiagPoint errorDesc](self, "errorDesc");
      int64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4 > 10)
      {
        +[SUCoreErrorInformation nameForSUCoreLayer:]( &OBJC_CLASS___SUCoreErrorInformation,  "nameForSUCoreLayer:",  -[SUCoreDiagPoint checkedLayer](self, "checkedLayer"));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        int64_t v17 = -[SUCoreDiagPoint checkedCode](self, "checkedCode");
        -[SUCoreDiagPoint checkedDomain](self, "checkedDomain");
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 stringWithFormat:@"trackType:%@ location:%@ reason:%@ code:%ld error:%@ | checked(%@) code:%ld domain:%@", v6, v7, v8, v9, v10, v16, v17, v18];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        [v5 stringWithFormat:@"trackType:%@ location:%@ reason:%@ code:%ld error:%@ | checked(%ld)", v6, v7, v8, v9, v10, -[SUCoreDiagPoint checkedLayer](self, "checkedLayer")];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }

    else
    {
      uint64_t v13 = (void *)NSString;
      -[SUCoreDiagPoint typeName](self, "typeName");
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[SUCoreDiagPoint location](self, "location");
      -[SUCoreDiagPoint reason](self, "reason");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      int64_t v14 = -[SUCoreDiagPoint code](self, "code");
      -[SUCoreDiagPoint errorDesc](self, "errorDesc");
      int64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 stringWithFormat:@"trackType:%@ location:%@ reason:%@ code:%ld error:%@", v6, v7, v8, v14, v15];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    uint64_t v12 = (void *)NSString;
    -[SUCoreDiagPoint typeName](self, "typeName");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SUCoreDiagPoint location](self, "location");
    -[SUCoreDiagPoint reason](self, "reason");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 stringWithFormat:@"trackType:%@ location:%@ reason:%@ code:%ld", v6, v7, v8, -[SUCoreDiagPoint code](self, "code")];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)typeName
{
  char v3 = -[SUCoreDiagPoint trackType](self, "trackType");
  char v4 = -[SUCoreDiagPoint trackType](self, "trackType");
  if ((v3 & 1) != 0)
  {
    uint64_t v5 = @"BEGIN";
    if ((v4 & 2) != 0)
    {
      [@"BEGIN" stringByAppendingString:@"|END"];
    }
  }

  else
  {
    if ((v4 & 2) == 0)
    {
      uint64_t v5 = (__CFString *)((unint64_t)@"ERROR" & (-[SUCoreDiagPoint trackType](self, "trackType") << 61 >> 63));
      goto LABEL_9;
    }

    uint64_t v5 = @"END";
  }

  if ((-[SUCoreDiagPoint trackType](self, "trackType") & 4) != 0)
  {
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", @"|ERROR");
  }

- (int64_t)trackType
{
  return self->_trackType;
}

- (void)setTrackType:(int64_t)a3
{
  self->_int64_t trackType = a3;
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (int64_t)code
{
  return self->_code;
}

- (void)setCode:(int64_t)a3
{
  self->_code = a3;
}

- (NSString)errorDesc
{
  return self->_errorDesc;
}

- (void)setErrorDesc:(id)a3
{
}

- (int64_t)checkedLayer
{
  return self->_checkedLayer;
}

- (void)setCheckedLayer:(int64_t)a3
{
  self->_checkedLayer = a3;
}

- (int64_t)checkedCode
{
  return self->_checkedCode;
}

- (void)setCheckedCode:(int64_t)a3
{
  self->_checkedCode = a3;
}

- (NSString)checkedDomain
{
  return self->_checkedDomain;
}

- (void)setCheckedDomain:(id)a3
{
}

- (int64_t)checkedIndications
{
  return self->_checkedIndications;
}

- (void)setCheckedIndications:(int64_t)a3
{
  self->_checkedIndications = a3;
}

- (NSString)previous
{
  return self->_previous;
}

- (void)setPrevious:(id)a3
{
}

- (NSString)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (NSString)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
}

- (NSString)param
{
  return self->_param;
}

- (void)setParam:(id)a3
{
}

- (void).cxx_destruct
{
}

@end