### How to install
``` shell
cd wer_evaluation
chmod 777 install_sctk.sh
chmod 777 -R espnet_wer_calculation
./install_sctk.sh
```

### data format
评测文件 ``cal_wer.sh`` 会接受一个文件路径，该文件路径下需要有``data.json``这个文件。
data.json具有以下的格式:
```
{
    "utts": { # must be "utts"
         "0": { # case id, you can set case id according to your need
            "output": [ # must be "output"
                {
                    "name": "target",     # do not change
                    "rec_text": "FIRE A WHOLE PLATOON MAJOR",    # it should be your ASR's output, separate each word by space.
                    "rec_token": "FIRE A WHOLE PLATOON MAJOR",   # same as rec_text
                    "rec_tokenid": "",    # do not change
                    "score": -1,          # do not change
                    "text": "FIRE A WHOLE PLATOON MAJOR",        # it should be ground truth transcription, separate each word by space.
                    "token": "FIRE A WHOLE PLATOON MAJOR"        # same as text
                }
            ]
        },
    }
}
```
可以参考``wer_evaluation/demo_data/test_data/data.json``。



### Usage about WER calculation toolkit
``` shell
cd wer_evaluation
./cal_wer.sh <THE FOLDER PATH> # e.g. ./cal_wer.sh demo_data/test_data, you should get the WER: 0.037037
```

You should report detailed sub/del.insert error rates and the WER rate.
