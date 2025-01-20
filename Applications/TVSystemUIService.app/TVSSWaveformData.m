@interface TVSSWaveformData
+ (id)zero;
+ (int)amplitudeCount;
- (NSArray)amplitudes;
- (TVSSWaveformData)initWithAmplitudes:(id)a3;
- (TVSSWaveformData)initWithFFTSamples:(float *)a3 count:(int)a4 sampleRate:(float)a5 settings:(id)a6;
- (float)maxAbsoluteDifferenceFrom:(id)a3;
- (id)description;
- (void)setAmplitudes:(id)a3;
@end

@implementation TVSSWaveformData

+ (id)zero
{
  v4 = (dispatch_once_t *)&unk_100221CE8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B8F48);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221CF0;
}

+ (int)amplitudeCount
{
  return 6;
}

- (TVSSWaveformData)initWithAmplitudes:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0LL;
  v7.receiver = v3;
  v7.super_class = (Class)&OBJC_CLASS___TVSSWaveformData;
  v9 = -[TVSSWaveformData init](&v7, "init");
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    id v6 = [location[0] copy];
    -[TVSSWaveformData setAmplitudes:](v9, "setAmplitudes:");
  }

  v5 = v9;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v9, 0LL);
  return v5;
}

- (float)maxAbsoluteDifferenceFrom:(id)a3
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    float v15 = 0.0;
    for (unint64_t i = 0LL;
          i < +[TVSSWaveformData amplitudeCount](&OBJC_CLASS___TVSSWaveformData, "amplitudeCount", *(void *)&v7);
          ++i)
    {
      v12 = -[TVSSWaveformData amplitudes](v17, "amplitudes");
      id v11 = -[NSArray objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", i);
      [v11 floatValue];
      float v9 = v3;
      id v10 = [location[0] amplitudes];
      id v8 = [v10 objectAtIndexedSubscript:i];
      [v8 floatValue];
      double v13 = fabs((float)(v9 - v4));

      if (v15 >= v13) {
        double v7 = v15;
      }
      else {
        double v7 = v13;
      }
      float v5 = v7;
      float v15 = v5;
    }

    float v18 = v15;
  }

  else
  {
    float v18 = 1.0;
  }

  objc_storeStrong(location, 0LL);
  return v18;
}

- (TVSSWaveformData)initWithFFTSamples:(float *)a3 count:(int)a4 sampleRate:(float)a5 settings:(id)a6
{
  v44 = self;
  SEL v43 = a2;
  v42 = a3;
  int v41 = a4;
  float v40 = a5;
  id location = 0LL;
  objc_storeStrong(&location, a6);
  unint64_t v38 = +[TVSSWaveformData amplitudeCount](&OBJC_CLASS___TVSSWaveformData, "amplitudeCount");
  id v37 = [location stops];
  v36 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v38);
  v35 = (float *)calloc(+[TVSSWaveformData amplitudeCount](&OBJC_CLASS___TVSSWaveformData, "amplitudeCount"), 4uLL);
  float v34 = v40 / (float)(2 * v41);
  v33 = 0LL;
  for (unint64_t i = 0; i < v41 && v33 != (char *)[v37 count] - 1; ++i)
  {
    float v31 = v34 * (float)i;
    id v25 = [v37 objectAtIndexedSubscript:v33];
    [v25 floatValue];
    float v26 = v6;

    id v27 = [v37 objectAtIndexedSubscript:v33 + 1];
    [v27 floatValue];
    float v28 = v7;

    float v30 = v28;
    *(float *)&double v8 = v31;
    if (v31 < v26 || (*(float *)&double v8 = v34 * (float)i, v31 > v28))
    {
      while (1)
      {
        BOOL v24 = 0;
        if (!v24) {
          break;
        }
        id v22 = [v37 objectAtIndexedSubscript:++v33];
        [v22 floatValue];

        id v23 = [v37 objectAtIndexedSubscript:v33 + 1];
        [v23 floatValue];
        float v30 = v9;
      }

      if (v33 < [v37 count]) {
        v35[(void)v33] = v35[(void)v33] + (float)((float)(1.0 / (float)(v28 - v26)) * v42[i]);
      }
    }

    else
    {
      v35[(void)v33] = v35[(void)v33] + v42[i];
    }
  }

  for (unint64_t j = 0LL; j < v38; ++j)
  {
    float v20 = v35[j];
    [location amplitudeGain];
    float v21 = v20 * v10;
    [location exponentialGain];
    v35[j] = powf(v21, v11);
    [location frequencyExponent];
    v35[j] = v35[j] * sub_100080C14(location, (float)((float)((float)j * v12) + 1.0) * v35[j]);
    else {
      float v19 = v35[j];
    }
    else {
      float v18 = v19;
    }
    v35[j] = v18;
    *(float *)&double v13 = v35[j];
    v17 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v13);
    -[NSMutableArray setObject:atIndexedSubscript:](v36, "setObject:atIndexedSubscript:");
  }

  free(v35);
  id v15 = -[NSMutableArray copy](v36, "copy");
  -[TVSSWaveformData setAmplitudes:](v44, "setAmplitudes:");

  v16 = v44;
  objc_storeStrong((id *)&v36, 0LL);
  objc_storeStrong(&v37, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v44, 0LL);
  return v16;
}

- (id)description
{
  float v6 = self;
  v5[1] = (id)a2;
  v5[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v2 = [v5[0] appendObject:v6->_amplitudes withName:@"amplitudes"];
  id v4 = [v5[0] build];
  objc_storeStrong(v5, 0LL);
  return v4;
}

- (NSArray)amplitudes
{
  return self->_amplitudes;
}

- (void)setAmplitudes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end