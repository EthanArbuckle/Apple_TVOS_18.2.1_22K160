@interface SignpostReporterObjectFilter
- (BOOL)_objectPassesStringFilter:(id)a3;
- (BOOL)shouldReportSignpostObject:(id)a3 classificationOut:(unint64_t *)a4;
- (SRSubsystemCategoryNameFilter)scnFilter;
- (SignpostReporterAggregation)allInspectedSignpostObjectsAggregation;
- (SignpostReporterAggregation)telemetryDisabledAggregation;
- (SignpostReporterAggregation)telemetryNotReportedClassNotSupportedAggregation;
- (SignpostReporterAggregation)telemetryNotReportedDurationThresholdAggregation;
- (SignpostReporterAggregation)telemetryNotReportedFailedSCFilterAggregation;
- (SignpostReporterAggregation)telemetryNotReportedFailedStringAllowlistAggregation;
- (SignpostReporterAggregation)telemetryReportedAggregation;
- (SignpostReporterAggregation)telemetryReportedEventsAggregation;
- (SignpostReporterObjectFilter)init;
- (SignpostReporterObjectFilter)initWithPlatform:(unint64_t)a3;
- (id)_init;
- (unint64_t)platform;
- (unint64_t)totalReportedAnimationCount;
- (unint64_t)totalReportedEventCount;
- (unint64_t)totalReportedIntervalCount;
- (unint64_t)totalUnreportedAnimationCount;
- (unint64_t)totalUnreportedEventCount;
- (unint64_t)totalUnreportedIntervalCount;
- (void)incrementTotalForObject:(id)a3 classification:(unint64_t)a4;
- (void)setScnFilter:(id)a3;
@end

@implementation SignpostReporterObjectFilter

- (BOOL)_objectPassesStringFilter:(id)a3
{
  id v4 = a3;
  if ((id)-[SignpostReporterObjectFilter platform](self, "platform") == (id)1
    && (v5 = (void *)objc_claimAutoreleasedReturnValue([v4 subsystem]),
        v6 = (void *)objc_claimAutoreleasedReturnValue([v4 category]),
        v7 = (void *)objc_claimAutoreleasedReturnValue([v4 name]),
        int v8 = IsPerfLoggingInterval(v5, v6, v7),
        v7,
        v6,
        v5,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 string1Value]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 string2Value]);
    int v11 = PassesPerfLoggingAllowlist(v9, v10);

    if (!v11) {
      goto LABEL_21;
    }
    char v12 = 1;
  }

  else
  {
    char v12 = 0;
  }

  if (!SignpostReporterShouldUseAllowlist())
  {
LABEL_19:
    LOBYTE(v20) = 1;
    goto LABEL_20;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 string1Name]);

  if (v13) {
    char v14 = v12;
  }
  else {
    char v14 = 1;
  }
  if ((v14 & 1) == 0 && (sub_100004A08(v4, -[SignpostReporterObjectFilter platform](self, "platform")) & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 string1Value]);
    int v16 = StringPassesSignpostReporterStringAllowlist(v15, -[SignpostReporterObjectFilter platform](self, "platform"));

    if (!v16)
    {
LABEL_21:
      LOBYTE(v20) = 0;
      goto LABEL_20;
    }
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 string2Name]);

  if (v17) {
    char v18 = v12;
  }
  else {
    char v18 = 1;
  }
  if ((v18 & 1) != 0) {
    goto LABEL_19;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue([v4 string2Value]);
  int v20 = StringPassesSignpostReporterStringAllowlist(v19, -[SignpostReporterObjectFilter platform](self, "platform"));

  if (v20) {
    goto LABEL_19;
  }
LABEL_20:

  return v20;
}

- (BOOL)shouldReportSignpostObject:(id)a3 classificationOut:(unint64_t *)a4
{
  id v6 = a3;
  if ([v6 canGenerateCoreAnalyticsPayload])
  {
    if ([v6 telemetryEnabled])
    {
      [v6 durationSeconds];
      if (v7 >= 0.0)
      {
        if (-[SignpostReporterObjectFilter _objectPassesStringFilter:](self, "_objectPassesStringFilter:", v6))
        {
          uint64_t v11 = objc_claimAutoreleasedReturnValue(-[SignpostReporterObjectFilter scnFilter](self, "scnFilter"));
          if (v11)
          {
            char v12 = (void *)v11;
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterObjectFilter scnFilter](self, "scnFilter"));
            unsigned int v8 = [v13 shouldReportObject:v6];

            if (v8) {
              unint64_t v9 = 1LL;
            }
            else {
              unint64_t v9 = 4LL;
            }
          }

          else
          {
            LOBYTE(v8) = 1;
            unint64_t v9 = 1LL;
          }
        }

        else
        {
          LOBYTE(v8) = 0;
          unint64_t v9 = 2LL;
        }
      }

      else
      {
        LOBYTE(v8) = 0;
        unint64_t v9 = 3LL;
      }
    }

    else
    {
      LOBYTE(v8) = 0;
      unint64_t v9 = 0LL;
    }
  }

  else
  {
    LOBYTE(v8) = 0;
    unint64_t v9 = 5LL;
  }

  if (a4) {
    *a4 = v9;
  }
  -[SignpostReporterObjectFilter incrementTotalForObject:classification:]( self,  "incrementTotalForObject:classification:",  v6,  v9);

  return v8;
}

- (id)_init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___SignpostReporterObjectFilter;
  v2 = -[SignpostReporterObjectFilter init](&v20, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___SignpostReporterAggregation);
    allInspectedSignpostObjectsAggregation = v2->_allInspectedSignpostObjectsAggregation;
    v2->_allInspectedSignpostObjectsAggregation = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___SignpostReporterAggregation);
    telemetryReportedAggregation = v2->_telemetryReportedAggregation;
    v2->_telemetryReportedAggregation = v5;

    float v7 = objc_alloc_init(&OBJC_CLASS___SignpostReporterAggregation);
    telemetryDisabledAggregation = v2->_telemetryDisabledAggregation;
    v2->_telemetryDisabledAggregation = v7;

    unint64_t v9 = objc_alloc_init(&OBJC_CLASS___SignpostReporterAggregation);
    telemetryNotReportedFailedStringAllowlistAggregation = v2->_telemetryNotReportedFailedStringAllowlistAggregation;
    v2->_telemetryNotReportedFailedStringAllowlistAggregation = v9;

    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___SignpostReporterAggregation);
    telemetryNotReportedFailedSCFilterAggregation = v2->_telemetryNotReportedFailedSCFilterAggregation;
    v2->_telemetryNotReportedFailedSCFilterAggregation = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___SignpostReporterAggregation);
    telemetryNotReportedDurationThresholdAggregation = v2->_telemetryNotReportedDurationThresholdAggregation;
    v2->_telemetryNotReportedDurationThresholdAggregation = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___SignpostReporterAggregation);
    telemetryNotReportedClassNotSupportedAggregation = v2->_telemetryNotReportedClassNotSupportedAggregation;
    v2->_telemetryNotReportedClassNotSupportedAggregation = v15;

    v17 = objc_alloc_init(&OBJC_CLASS___SignpostReporterAggregation);
    telemetryReportedEventsAggregation = v2->_telemetryReportedEventsAggregation;
    v2->_telemetryReportedEventsAggregation = v17;
  }

  return v2;
}

- (SignpostReporterObjectFilter)init
{
  v2 = -[SignpostReporterObjectFilter _init](self, "_init");
  if (v2)
  {
    v2->_platform = sub_10000363C();
    id v3 = sub_100003CB0(-[SignpostReporterObjectFilter platform](v2, "platform"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    scnFilter = v2->_scnFilter;
    v2->_scnFilter = (SRSubsystemCategoryNameFilter *)v4;
  }

  return v2;
}

- (SignpostReporterObjectFilter)initWithPlatform:(unint64_t)a3
{
  if (a3)
  {
    uint64_t v4 = -[SignpostReporterObjectFilter _init](self, "_init");
    v5 = v4;
    if (v4)
    {
      v4[1] = a3;
      id v6 = sub_100003CB0((uint64_t)[v4 platform]);
      uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
      unsigned int v8 = (void *)v5[16];
      v5[16] = v7;
    }

    self = v5;
    unint64_t v9 = self;
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  return v9;
}

- (void)incrementTotalForObject:(id)a3 classification:(unint64_t)a4
{
  id v16 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v16 subsystem]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v16 category]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( -[SignpostReporterObjectFilter allInspectedSignpostObjectsAggregation]( self,  "allInspectedSignpostObjectsAggregation"));
  [v8 incrementSubsystem:v6 category:v7];

  switch(a4)
  {
    case 0uLL:
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[SignpostReporterObjectFilter telemetryDisabledAggregation](self, "telemetryDisabledAggregation"));
      goto LABEL_9;
    case 1uLL:
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterObjectFilter telemetryReportedAggregation](self, "telemetryReportedAggregation"));
      int v10 = 1;
      goto LABEL_10;
    case 2uLL:
      uint64_t v9 = objc_claimAutoreleasedReturnValue( -[SignpostReporterObjectFilter telemetryNotReportedFailedStringAllowlistAggregation]( self,  "telemetryNotReportedFailedStringAllowlistAggregation"));
      goto LABEL_9;
    case 3uLL:
      uint64_t v9 = objc_claimAutoreleasedReturnValue( -[SignpostReporterObjectFilter telemetryNotReportedDurationThresholdAggregation]( self,  "telemetryNotReportedDurationThresholdAggregation"));
      goto LABEL_9;
    case 4uLL:
      uint64_t v9 = objc_claimAutoreleasedReturnValue( -[SignpostReporterObjectFilter telemetryNotReportedFailedSCFilterAggregation]( self,  "telemetryNotReportedFailedSCFilterAggregation"));
      goto LABEL_9;
    case 5uLL:
      uint64_t v9 = objc_claimAutoreleasedReturnValue( -[SignpostReporterObjectFilter telemetryNotReportedClassNotSupportedAggregation]( self,  "telemetryNotReportedClassNotSupportedAggregation"));
LABEL_9:
      uint64_t v11 = (void *)v9;
      int v10 = 0;
LABEL_10:
      [v11 incrementSubsystem:v6 category:v7];

      break;
    default:
      int v10 = 0;
      break;
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___SignpostAnimationInterval);
  if ((objc_opt_isKindOfClass(v16, v12) & 1) != 0)
  {
    if (v10) {
      ++self->_totalReportedAnimationCount;
    }
    else {
      ++self->_totalUnreportedAnimationCount;
    }
  }

  else
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___SignpostInterval);
    if ((objc_opt_isKindOfClass(v16, v13) & 1) != 0)
    {
      if (v10) {
        ++self->_totalReportedIntervalCount;
      }
      else {
        ++self->_totalUnreportedIntervalCount;
      }
    }

    else
    {
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___SignpostEvent);
      if ((objc_opt_isKindOfClass(v16, v14) & 1) != 0)
      {
        if (v10)
        {
          ++self->_totalReportedEventCount;
          v15 = (void *)objc_claimAutoreleasedReturnValue( -[SignpostReporterObjectFilter telemetryReportedEventsAggregation]( self,  "telemetryReportedEventsAggregation"));
          [v15 incrementSubsystem:v6 category:v7];
        }

        else
        {
          ++self->_totalUnreportedEventCount;
        }
      }
    }
  }
}

- (unint64_t)platform
{
  return self->_platform;
}

- (SignpostReporterAggregation)allInspectedSignpostObjectsAggregation
{
  return self->_allInspectedSignpostObjectsAggregation;
}

- (SignpostReporterAggregation)telemetryReportedEventsAggregation
{
  return self->_telemetryReportedEventsAggregation;
}

- (SignpostReporterAggregation)telemetryReportedAggregation
{
  return self->_telemetryReportedAggregation;
}

- (SignpostReporterAggregation)telemetryDisabledAggregation
{
  return self->_telemetryDisabledAggregation;
}

- (SignpostReporterAggregation)telemetryNotReportedFailedStringAllowlistAggregation
{
  return self->_telemetryNotReportedFailedStringAllowlistAggregation;
}

- (SignpostReporterAggregation)telemetryNotReportedFailedSCFilterAggregation
{
  return self->_telemetryNotReportedFailedSCFilterAggregation;
}

- (SignpostReporterAggregation)telemetryNotReportedDurationThresholdAggregation
{
  return self->_telemetryNotReportedDurationThresholdAggregation;
}

- (SignpostReporterAggregation)telemetryNotReportedClassNotSupportedAggregation
{
  return self->_telemetryNotReportedClassNotSupportedAggregation;
}

- (unint64_t)totalUnreportedIntervalCount
{
  return self->_totalUnreportedIntervalCount;
}

- (unint64_t)totalReportedIntervalCount
{
  return self->_totalReportedIntervalCount;
}

- (unint64_t)totalUnreportedAnimationCount
{
  return self->_totalUnreportedAnimationCount;
}

- (unint64_t)totalReportedAnimationCount
{
  return self->_totalReportedAnimationCount;
}

- (unint64_t)totalUnreportedEventCount
{
  return self->_totalUnreportedEventCount;
}

- (unint64_t)totalReportedEventCount
{
  return self->_totalReportedEventCount;
}

- (SRSubsystemCategoryNameFilter)scnFilter
{
  return self->_scnFilter;
}

- (void)setScnFilter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end