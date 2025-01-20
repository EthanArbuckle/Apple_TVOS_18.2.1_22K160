void sub_1000030E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, char a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30, uint64_t a31, uint64_t a32, uint64_t a33, char a34, uint64_t a35, uint64_t a36, uint64_t a37, char a38)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003138(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100003148(uint64_t a1)
{
}

id sub_100003150(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) isCancelled];
  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 type]);
    unsigned int v6 = [v5 isEqualToString:@"101"];

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](&OBJC_CLASS___DSDateFormatter, "sharedFormatter"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 formatterWithType:0]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v3 date]);
      id v10 = (id)objc_claimAutoreleasedReturnValue([v8 stringFromDate:v9]);

      v32[0] = v10;
      v31[0] = @"timestamp";
      v31[1] = @"thermalLevel";
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v3 integerFromFieldAtIndex:3]));
      v32[1] = v11;
      v31[2] = @"thermalPressureLevel";
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v3 integerFromFieldAtIndex:4]));
      v32[2] = v12;
      v31[3] = @"coldPressureLevel";
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v3 integerFromFieldAtIndex:5]));
      v32[3] = v13;
      v31[4] = @"lowTempCPUPerformanceCap";
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v3 integerFromFieldAtIndex:6]));
      v32[4] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  5LL));

      [*(id *)(a1 + 40) addObject:v15];
    }

    else
    {
      id v10 = [[DSThermalLogLine alloc] initWithLogLine:v3];
      float v16 = *(float *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
      [v10 maxTemp];
      if (v16 >= v17) {
        float v17 = v16;
      }
      *(float *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = v17;
      if ([v10 isTrapEvent])
      {
        if ([v10 isTrapEntry])
        {
          v18 = *(void **)(a1 + 32);
          v19 = (void *)objc_claimAutoreleasedReturnValue([v10 reason]);
          [v18 addTemperatureWarningWithReason:v19 toDictionary:*(void *)(a1 + 48)];

          ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
          uint64_t v20 = *(void *)(*(void *)(a1 + 72) + 8LL);
          if (*(void *)(v20 + 40))
          {
            *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 2;
            v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) result]);
            [v21 setStatusCode:&off_100004368];

            uint64_t v20 = *(void *)(*(void *)(a1 + 72) + 8LL);
          }

          id v22 = v10;
          v23 = *(void **)(v20 + 40);
          *(void *)(v20 + 40) = v22;
        }

        else if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue([v10 date]);
          [v24 timeIntervalSinceDate:v25];
          *(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL) = (int)(v26

          uint64_t v27 = *(void *)(*(void *)(a1 + 72) + 8LL);
          v23 = *(void **)(v27 + 40);
          *(void *)(v27 + 40) = 0LL;
        }

        else
        {
          v28 = *(void **)(a1 + 32);
          v29 = (void *)objc_claimAutoreleasedReturnValue([v10 reason]);
          [v28 addTemperatureWarningWithReason:v29 toDictionary:*(void *)(a1 + 48)];

          ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
          *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 2;
          v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) result]);
          [v23 setStatusCode:&off_100004368];
        }
      }
    }
  }

  return v4;
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}