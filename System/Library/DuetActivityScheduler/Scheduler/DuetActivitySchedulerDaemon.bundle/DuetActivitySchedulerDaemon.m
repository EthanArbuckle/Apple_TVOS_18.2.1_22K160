LABEL_14:
        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      v18 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      v12 = v18;
      if (!v18)
      {
LABEL_20:

        -[_DASPredictionAccuracy setTotalPredictionIntervals:]( v10,  "setTotalPredictionIntervals:",  -[_DASPredictionAccuracy totalPredictionIntervals](v10, "totalPredictionIntervals") + 1);
        v8 = v20;
        break;
      }
    }
  }

  return v10;
}

uint64_t sub_37C4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  a2,  *(void *)(a1 + 32));
}

id objc_msgSend_totalPredictionIntervals(void *a1, const char *a2, ...)
{
  return [a1 totalPredictionIntervals];
}