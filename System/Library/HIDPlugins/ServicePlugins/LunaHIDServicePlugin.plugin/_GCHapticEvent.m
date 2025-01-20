@interface _GCHapticEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)stopped;
- (BOOL)transientBeganAsContinuousEvent;
- (_GCHapticEvent)initWithCoder:(id)a3;
- (_GCHapticEvent)initWithSyntheticCommand:(id)a3;
- (double)intensity;
- (double)sharpness;
- (double)startTime;
- (id)description;
- (int64_t)type;
- (pair<BOOL,)valueForNoteParam:(unsigned int)a3 inParameters:(id)a4;
- (unint64_t)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)evaluateDeviceNoteParams:(id)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setIntensity:(double)a3;
- (void)setSharpness:(double)a3;
- (void)setStartTime:(double)a3;
- (void)setStopped:(BOOL)a3;
- (void)setTransientBeganAsContinuousEvent:(BOOL)a3;
- (void)setType:(int64_t)a3;
@end

@implementation _GCHapticEvent

- (pair<BOOL,)valueForNoteParam:(unsigned int)a3 inParameters:(id)a4
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = a4;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if (objc_msgSend(v9, "identifier", (void)v16) == a3)
        {
          [v9 value];
          unsigned int v14 = v13;

          unint64_t v12 = (unint64_t)v14 << 32;
          uint64_t v11 = 1LL;
          goto LABEL_13;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  signed int v10 = a3 - 330;
  if (a3 - 330 >= 7)
  {
    uint64_t v11 = 0LL;
    unint64_t v12 = 0LL;
  }

  else
  {
    uint64_t v11 = 0LL;
    unint64_t v12 = qword_F5C0[v10];
  }

- (void)evaluateDeviceNoteParams:(id)a3
{
  id v4 = a3;
  self->_intensity = COERCE_FLOAT((unint64_t)-[_GCHapticEvent valueForNoteParam:inParameters:]( self,  "valueForNoteParam:inParameters:",  330LL) >> 32);
  self->_sharpness = COERCE_FLOAT((unint64_t)-[_GCHapticEvent valueForNoteParam:inParameters:]( self,  "valueForNoteParam:inParameters:",  331LL,  v4) >> 32);
}

- (_GCHapticEvent)initWithSyntheticCommand:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____GCHapticEvent;
  id v5 = -[_GCHapticEvent init](&v14, "init");
  if (!v5)
  {
LABEL_13:
    id v6 = v5;
    goto LABEL_14;
  }

  id v6 = (_GCHapticEvent *)objc_claimAutoreleasedReturnValue([v4 tokenAndParams]);
  if (v6)
  {
    v5->_type = 0LL;
    [v4 time];
    v5->_startTime = v7;
    v5->_identifier = (unint64_t)-[_GCHapticEvent token](v6, "token");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_GCHapticEvent params](v6, "params"));
    -[_GCHapticEvent evaluateDeviceNoteParams:](v5, "evaluateDeviceNoteParams:", v8);

    unsigned __int8 v9 = [v4 eventID];
    uint64_t v10 = v9;
    switch(v9)
    {
      case 1u:
        break;
      case 2u:
        goto LABEL_11;
      case 3u:
        uint64_t v11 = 0x3FC999999999999ALL;
        goto LABEL_7;
      case 4u:
        uint64_t v11 = 0x3FE199999999999ALL;
LABEL_7:
        *(void *)&v5->_sharpness = v11;
        uint64_t v10 = 1LL;
        break;
      case 5u:
        uint64_t v12 = 0x3FC999999999999ALL;
        goto LABEL_10;
      case 6u:
        uint64_t v12 = 0x3FE199999999999ALL;
LABEL_10:
        *(void *)&v5->_sharpness = v12;
LABEL_11:
        uint64_t v10 = 2LL;
        break;
      default:
        uint64_t v10 = 0LL;
        break;
    }

    v5->_type = v10;

    goto LABEL_13;
  }

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)v5;
  if (self->_type == 1) {
    double v7 = @"transient";
  }
  else {
    double v7 = @"continuous";
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %lu (%@), i=%f s=%f (started at %f)>",  v5,  self->_identifier,  v7,  *(void *)&self->_intensity,  *(void *)&self->_sharpness,  *(void *)&self->_startTime));

  return v8;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)intensity
{
  return self->_intensity;
}

- (void)setIntensity:(double)a3
{
  self->_intensity = a3;
}

- (double)sharpness
{
  return self->_sharpness;
}

- (void)setSharpness:(double)a3
{
  self->_sharpness = a3;
}

- (BOOL)stopped
{
  return self->_stopped;
}

- (void)setStopped:(BOOL)a3
{
  self->_stopped = a3;
}

- (BOOL)transientBeganAsContinuousEvent
{
  return self->_transientBeganAsContinuousEvent;
}

- (void)setTransientBeganAsContinuousEvent:(BOOL)a3
{
  self->_transientBeganAsContinuousEvent = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCHapticEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____GCHapticEvent;
  uint64_t v5 = -[_GCHapticEvent init](&v10, "init");
  if (v5)
  {
    v5->_type = (int64_t)[v4 decodeIntegerForKey:@"type"];
    v5->_identifier = (unint64_t)[v4 decodeIntegerForKey:@"identifier"];
    v5->_stopped = [v4 decodeBoolForKey:@"stopped"];
    [v4 decodeDoubleForKey:@"startTime"];
    v5->_startTime = v6;
    [v4 decodeDoubleForKey:@"intensity"];
    v5->_intensity = v7;
    [v4 decodeDoubleForKey:@"sharpness"];
    v5->_sharpness = v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_type forKey:@"type"];
  [v4 encodeInteger:self->_identifier forKey:@"identifier"];
  [v4 encodeBool:self->_stopped forKey:@"stopped"];
  [v4 encodeDouble:@"startTime" forKey:self->_startTime];
  [v4 encodeDouble:@"intensity" forKey:self->_intensity];
  [v4 encodeDouble:@"sharpness" forKey:self->_sharpness];
}

@end